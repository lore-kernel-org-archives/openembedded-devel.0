Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39C7CD4F2F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:35 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17713.1763014830831315629
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aZDAKZzt;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7aab7623f42so557356b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014830; x=1763619630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wDEIVU+A5z8BpfnT7btg/kJVvYgVtjmysphGl30Ia0=;
        b=aZDAKZztrcRtl3ouVHJ5VU67lWaWBlAYBSSQ/FUuYQ5O+U/QhbCSqShFjNYQA6wywW
         ExEF1D7b7R5i4WNLNXkCj90ZYbBQKzHgLEWyc3M4PxH1Loq7Fv7jjl5p7DCKHkjsWkcm
         4u8KCK+4snO/1s7dcwHRbnWGjPQc/VElKYN8E+VR772ebH4uZWmdJuF/mjs3AYXs8ckI
         IP2YZPH4A+EF5puyo+32kdi5KWj/ZvltrPJ7eDOaRlK2wF8WixPv1Iugv5aR1kbV80nO
         GKfSBaRh+R9P45wvZ84RkulMJeYH7v4ihRy37idhhv6SuWZUOxc/4tfENLJ3/QvPiQxK
         aB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014830; x=1763619630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9wDEIVU+A5z8BpfnT7btg/kJVvYgVtjmysphGl30Ia0=;
        b=O6ZSXJKolkqoyBhqfXTqCazR1pXHqNbR/whg6N9qa5UTVWH54cedKunnoH5W7S30bi
         DUPiBJs5WCqZIECUv0K04TcQirRXJ3t7mLfRGaz5bBIijS2ccob8ITin4nTvIp8fsngh
         ovz/u27GSEdO3IypxImXRjL0nhb0gWQp6oK25VWkNSsrURjAj9Yz3pyFwpbyV6J2EinH
         KFzYH+fPLGnGY5FW1jYJgDVjheMnGu6+GHHkVUWb62OGaEHlpp1TakeV1oWpAS7LFQRs
         KkmZYmcb5fAdiyB9hZB+iZy0kzUFEOBCRZzfu28rriC5QSRIriHqidvpibaTTGKM3Nb9
         Bg4w==
X-Gm-Message-State: AOJu0YyW5YAOTAIR2Glegp2yIEaAYfrocmtQ2qBb0P6wvuuz2L3NjDSB
	/ofcdAAAPVk+pfGQsp6pNVRIXC3YBJj8CW2TEJygHW09jZ9SLQaKlMgSq8efCg==
X-Gm-Gg: ASbGncu3Zk63s028DiHeMXfODRYt2hXfpG9jgpwuNbwfVTYPumYT1QoUTxhnmEZtkiO
	INocR8lufVVVuqEQ7fqKiTqbsM6XmlNMdjGJktHgba2V+sZ8skFuvix9FsEto9/eGI4rzmptXLr
	729L6O6oTcrs13y85Qsu8bKbPM1PckYX8qA4Qa52BNJAzNK0oiN0a2kU/rewU9U6r4+jez+6GHc
	XBlGqIJy+jlEohLdpVtb2SjVrBEJir8t87/PHywx5yqeBQEzshNmrtQzDEZN6h0siVG4ZgBzSWy
	WYh6L9X5XJuxwLQKSLa6EBR6VoUTnLQfcmvfRcOBcSstQ0SgpAcfCxHcSDQZFNlva4Wqr5f1usI
	vekWJz+NzIBLHkne0yASi3aG9YpGvnfS+XUDdPnjGF8jdUyqpGCbiWFpnCMkB1h0LwM7QkuBJDo
	DQ4zjm6VWIRv+nh68S1OigLffK
X-Google-Smtp-Source: AGHT+IF9UD8GoRiI7oHn3z0HJv/j5hh+uLH2piwU9ALwhhSxO60U+TBf5mUbDeeDfOxpYXhB6KeWHg==
X-Received: by 2002:a05:6a20:9186:b0:334:a72c:806e with SMTP id adf61e73a8af0-3590b81153fmr7194720637.43.1763014830119;
        Wed, 12 Nov 2025 22:20:30 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:29 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Shinji Matsunaga <shin.matsunaga@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 20/38] audit: Fix CVE_PRODUCT
Date: Thu, 13 Nov 2025 19:18:55 +1300
Message-ID: <20251113061914.3756301-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121618

From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>

Fix "audit" set in CVE_PRODUCT to "linux:audit" to detect only vulnerabilities where the vendor is "linux".

Currently, CVE_PRODUCT also detects vulnerabilities where the vendor is "visionsoft",
which are unrelated to the "audit" in this recipe.
https://www.opencve.io/cve?vendor=visionsoft&product=audit

In addition, all the vulnerabilities currently detected in "audit" have the vendor of "visionsoft" or "linux".
Therefore, fix "audit" set in CVE_PRODUCT to "linux:audit".

Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e87e51da49fe121be8f6dd4cec3263a345f2f876)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-security/audit/audit_4.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.2.bb b/meta-oe/recipes-security/audit/audit_4.0.2.bb
index 0086f8db69..8a080eb709 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.2.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.2.bb
@@ -99,3 +99,5 @@ do_install:append() {
     # Create /var/spool/audit directory for audisp-remote
     install -d -m 0700 ${D}${localstatedir}/spool/audit
 }
+
+CVE_PRODUCT = "linux:audit"

