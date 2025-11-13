Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63B0CCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:15 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17707.1763014807111608004
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=krJ1sXtj;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b991081160so71020b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014806; x=1763619606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lN45Gjy1dECX8wy07VC230XVs0N5p3zUnLCQHtQvv0E=;
        b=krJ1sXtjklGSkFwHIopEPgjC9kIgjrY7JWfownQANaGWwwG0JNl9v17qrhQwhKVMNj
         bYMc1YMdxEIYUNcCeDSxwoNySdlmXsx7CfPNGfdy5vUm92rPd/+kh5Cy7MLIwI850IoL
         MZ6xevLrckAQgN/WIwc0YToPmT7bHTgcDMMq1BStR1N1nPgnd4EbosU0HT2TP0ZULsEM
         NIaOpL3abS3GeeeefOqXFZHmyVxIQAKlZQfaZDaDJKRkOgexTxLzUgUqLfllDaMhC9Hn
         gPAgm/2S9A7aOjazjLONO9r2mufV4endkaO6PW6G40x2YXNucXS3zqXTLFDmR1wFJwwQ
         4OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014806; x=1763619606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lN45Gjy1dECX8wy07VC230XVs0N5p3zUnLCQHtQvv0E=;
        b=UViVQkmaI1mLT7r4GQHm7M+m4GFwlF9xxayizJhaxrew5evhQb3FCftgA97/wvAWMF
         W7yYMfzBO5wSlNotsvhLKk07+vfwouEGemyYYu4WDwQMyMC27/VM+57zIGMJGWjHBatJ
         NmsypiM+6LXCCJwER5kR2BIPuBfTHLLayOc3RmhNSqVHyjJrbF0rFe7aYuq6PLY2O9O+
         oGLD56CtmjGYLqStgrPXhmlJrj7lQI5JUNjGUXEgMlyzIRW5J8OIB5+VADPBrauoFiwg
         3LvUcQgeyPmoAleKZCYO116kp/doWy980um2AQx5hHZHw/4khZbba1gTLiGzmM+zCHz7
         AZxg==
X-Gm-Message-State: AOJu0Yyp0UlCmm8KEdIoScsufXnoYI3ixKyfkDVgjCFy8pkiWTm7ZBsR
	ojZ35kzB1Px5mEsjJvhguXQU6t+TJqS0PpMFJZOnf/GdlK9EFpg1KdxG/pFcQQ==
X-Gm-Gg: ASbGncs7ShZAcshKyD7mbIOT0JVKd6W0dZteBjz44NjIwdfZjS4Ma4ToRNXiIEeviWW
	qYh6xHqxFAnW6eT9JoLlrfGaCtaSn73/tKP1Lpyk4bg6l/EAf0c/w+rMMJcT30J3J+ODAwFG54E
	IAIKjcn+yV3XrovCfoY2Wtp0cjSQWjxeEmjf0y3LcWzYPDGuX8xnoLRglba1M573WS3wZ5UPW/N
	dbwy7gL6VPEYvJCaOks3Z8wgPXW+spKczTd88x6SOEmFQ20rataPvhc6ozaV1UFO5Z6j9hvYzA1
	MR6/llrBQj/DlEh4uVg4gpYex7oAlcoXYiW5350V45LfECtFHvhdxaFGJPpnPgFJ4h4CefyYpr0
	0XM2nkfo6vB5f9xRDrf+T3a4A01Q3Yfq0RE8VAGKdcHCJgDpv/9RbtFcvyPChb6o1aOK3zpmo67
	R/9sVSodoUNdR3vQ==
X-Google-Smtp-Source: AGHT+IEF40Rpc0xZU0M+dDcayTBEOpP6+dWsWqFKX+8zyRK1mrK0/W6NZ6WDeXJPeRPSyVzjN7dFlQ==
X-Received: by 2002:a05:6a00:981:b0:7aa:a2a8:980f with SMTP id d2e1a72fcca58-7b7a4af86e0mr6623606b3a.20.1763014806393;
        Wed, 12 Nov 2025 22:20:06 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 12/38] openldap: upgrade 2.6.9 -> 2.6.10
Date: Thu, 13 Nov 2025 19:18:47 +1300
Message-ID: <20251113061914.3756301-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121610

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Added slapd microsecond timestamp format for local logging
- Fixed libldap ldap_result behavior with LDAP_MSG_RECEIVED
- Fixed lloadd handling of starttls critical
- Fixed slapd syncrepl when used with slapo-rwm
- Fixed slapd regression with certain searches
- Fixed slapo-autoca olcAutoCAserverClass object
- Fixed slapo-pcache caching behaviors

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 43b891e96b8581507decf024c27063d415adb9f3)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openldap/{openldap_2.6.9.bb => openldap_2.6.10.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.6.9.bb => openldap_2.6.10.bb} (99%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.9.bb b/meta-oe/recipes-support/openldap/openldap_2.6.10.bb
similarity index 99%
rename from meta-oe/recipes-support/openldap/openldap_2.6.9.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.10.bb
index 595f87050c..be0c6bbe5a 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.10.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
-SRC_URI[sha256sum] = "2cb7dc73e9c8340dff0d99357fbaa578abf30cc6619f0521972c555681e6b2ff"
+SRC_URI[sha256sum] = "c065f04aad42737aebd60b2fe4939704ac844266bc0aeaa1609f0cad987be516"
 
 DEPENDS = "util-linux groff-native"
 

