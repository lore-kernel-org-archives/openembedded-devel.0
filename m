Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA2ACCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 09:45:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.11799.1760521522611785836
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 02:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=USisRfj1;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77f1f29a551so8028532b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 02:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760521522; x=1761126322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCCxsW0QlmTrsCIWvUDkoBa+t2D/n3ATNLOnt3K7X+4=;
        b=USisRfj1gpyHpIuhhVEtyeTT1ypxzl2fRKdJpzs1jMMhOqI/Q1zmFZMxT96Sgilz71
         Iusc1vrAd6zT8avd1BRpjKfch6RD3Fw98MQMzThXu13LDXuObadrTfIuhcjvmH8tvriR
         Zt/AhDyik85mYwtaahYcGIylrDIZVKZ4E1KQnbWlJ3qOwaMN1yQ7R8JWhC4wxm+G4Ah4
         30tm7JeQMRXcB1iRbqU0P8nZMF8o473Vp1quaSRaxxh4GhFYcDgyYfrzCK3dXGaJ71KF
         I9No2Yf8X1LWLPaMY6x2SF4l/LVEK/3ersrBySZU1jj1zJgvex9Ml3vvdIjpceStNZ9K
         9JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760521522; x=1761126322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCCxsW0QlmTrsCIWvUDkoBa+t2D/n3ATNLOnt3K7X+4=;
        b=SJffH66ZbOJ/28ExMqYsW4LjqUvspeOyKqC+xRg3V9mZIeCfGEgoPIbYAXX1/mZoPt
         cUlhSZpK8tCiE2BpU297sFSDI/LAUBzB4d27URiLRodbUCtmsl1Z6w0wLhCwmxV2/ecm
         oLKQsHvp34u9A2jE3UmSAjUukcl52sg+yDJW/DmNGQakD+6W4yfQhg/XYl7K+eLqXFYh
         vqyTvn3r3q9cakXzH8wovNw/93ZA9S8pC6iCel4VYn1nc63nhx+wRyPzMTomW1ntFLhA
         tyPONKl44vqM80R6jtf50mpJ6t9AhYU4QfhSEOajB5PMqWz3C/A+cxxIZifWZmHOUlEj
         GEvA==
X-Gm-Message-State: AOJu0YwKwT62Xa1A9Yo+WT7IFacaH7DlnvUcj6IpWwVbSBgD2yQCH1h/
	MOHAiuHf9RACxOpeQeErdKdZErhkJkSsK7mmFYuz3wx6Br8T/F/FEZC4Dd65+A==
X-Gm-Gg: ASbGncuTV53Tv8d3pNs5mC+qAMEq+c2SNtgtwR8qi6MVg9nGZFLaPrG5k8Xlu6IRN2S
	MuwqQXDz6v4HpEde/uYFjCSCb80oHMrjb2AqI5hfQbg+wvEzJaGzjbNjzsAgPmwFKVV7pFYoqZl
	hMPCGVubacRuTNETvvr+AcDmAvrikhNxiQZNsM8RT74kLzkENITRF3aYkMMtwIsqhzbuZKus4Z6
	sUthDNz7zm4c7HW4D/AcG8JBfDkVIonxwNx5jgSEliebRhCcRuuJXt1mEDr0ZBYuowRXsJcAcnS
	0E5EXKqV7KW+nkvEsQccssnmzDO/kS7HMnqL6RY8buIFkemYqSmXQPtGBL6C1Dw5WcRN4D8hghO
	bOX7v78tI/vBnpUHt1sLgN/zsXOleiuNC+b+faC0sC5q2/pJ5uzEP1XrJmgqpgCms4A==
X-Google-Smtp-Source: AGHT+IH3oG0UFoktovanWGW0LqCqjrLpPHkPmBaq5h+aNIDjU6wD9Xb5QrQqfm10Mq9g/lDWBZmXqQ==
X-Received: by 2002:a05:6a20:9187:b0:2f2:19a2:ec55 with SMTP id adf61e73a8af0-32da81394d2mr34348087637.22.1760521521868;
        Wed, 15 Oct 2025 02:45:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67bab72112sm9889773a12.2.2025.10.15.02.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:45:21 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 2/2] monkey: ignore CVE-2013-1771
Date: Wed, 15 Oct 2025 22:45:08 +1300
Message-ID: <20251015094508.1808322-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015094508.1808322-1-ankur.tyagi85@gmail.com>
References: <20251015094508.1808322-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 09:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120703

From: Peter Marko <peter.marko@siemens.com>

This is gentoo specific CVE.
NVD tracks this as version-less CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 36a7e409d8dcee804f911174291a0c72b8037934)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index 183d252e41..773e099198 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -91,3 +91,4 @@ CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
                    "
 
 CVE_STATUS[CVE-2013-2183] = "cpe-incorrect: Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0"
+CVE_STATUS[CVE-2013-1771] = "not-applicable-platform: this is gentoo specific CVE"

