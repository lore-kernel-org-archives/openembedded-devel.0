Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4454.1794171088975459442
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 12:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FVnq36bn;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso366020eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 12:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171088; x=1794775888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pCpVIrld6rmjN+d4sIoJ4F/d+zvJQwLA89uA0EJw7Qs=;
        b=FVnq36bnAK7FwHVTghrB+o4QHLfry+DCZ2yWI50g7JODibZjHSW8OVTy38BT1KNk/b
         bx/pHeWxTvoBl1OjeNGmkYBXR+AFJYZFS9XPniPF9jYY/9tcuPW+AtTmaDzKMa6C1ZeT
         Buvh04M5rk6s1jSuunX2uNNzs9r0ozEWeq7/19sC3J31YUwJiWOo+WBNBC/VxCBH3gdQ
         GvOMXAb6FiNHHJWjUBtY8BYTGsxt50Kq18bghWlTO2qoxoMXoeZlqmL6xIftMhl0prme
         kqPAHMIRp8fc4Q4q6NyflkjO6eN8M4a+qzDLP+uQrM8+cNpBhmkgoRbev93nfRk4H4Nh
         FrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171088; x=1794775888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCpVIrld6rmjN+d4sIoJ4F/d+zvJQwLA89uA0EJw7Qs=;
        b=GZqfNzAkWPww9dRoS+u4TcuvC0NVUFkNHIgHGH7BMICQcuERMNOVwEehw8MmnRTp2X
         T+liFp5vdXnXcEVQNfHnhmUcGYTkGiFc038CUKNmYosd2lNhQ1lIhzZEXOs/dBBbJcKA
         6zEAy1PS0Ti+3Ib5EstS0hnMbne6+ehtZzEmga79fEMqj33CQgLWJFddZta5+1micJMH
         Jks7S4vpeJ5zt0qJ6rAvg6UXPwPw1Wq/ERhW0w1AsvbPp9u50hm5G3/rmHwgjVBfPjjW
         MNzsz9AARJt1F0alqPcg6KIkxW1puMU90m3CzUxMl+Hg/Zk1CkO2k5hnPffgF6lDTk1k
         wLfA==
X-Gm-Message-State: APuU4Z+VXV5FtvhYSuMjdeWhUlCTVPbZIW+FAy+SqXWJEClrSBxcg7Qi
	UNo+QiKYMrrFYIIOk+DJ5iVui/ktCeJnUxqRGj96rdX8es4bO7V3OmoBe9hCIQ==
X-Gm-Gg: AYBFou3Y9E4lGdSXy1d/Qqu3dryys99+zgmEOC7FQyjgd26N2fBG4PW2JV+VnmUDCKN
	UwzH8yEGbq5RwOQXDTfzVRw/8XFTsK1kLmutgs3F4c1eQQzQxSHFyhbJaZTJiIcuTGoJwudxS2E
	kU2CI+fbTHznjcKNbyreHovg10Wkysmx55uBy8niSkTEzPLBy7CLiORSj0D4u391SAI96PXucS5
	8nNzkSAFipxx/nyExD0GZ5d/cWc9sS4d9bu9ZomOxHov6r7mg9Gb84u4FNfpiZv4hkwczQTlGTm
	N6Lt6CNZT14kS1aTLAb/PbkSa7IOA3e3Yu1R7LUF5oH8v5GcfTx887jsBb/tQdWmk1IsrWJ9Nf9
	MMaRyNCT9IrHZrgC0rvKnpt1tXAiSODzrf/ySl3Py5YOWw+9GSJFk84fbJ3X0aGzCza4FqWc8kj
	YRyH50sXs42tYcW9JjXWWeiboPpsmtZkfws9ujXJCvaNToJieN44o3sto5jROQPE+JhHnNf+MFm
	88Po3GIsftMJCJ47qZXWAbhslc6wWkdfzxZ3pkGVEIpK35qrwTkFZAUa4rLawBXThVJgHLaeHF9
	0E0d/4yRCq1XbT8CuATReDOay5BlY4dqRuptg58UZLPj7P0NM7JHNBAnNR5ibw==
X-Received: by 2002:a05:693c:42dc:b0:36f:4981:da16 with SMTP id 5a478bee46e88-37255a514c7mr4568935eec.25.1794171088132;
        Sun, 08 Nov 2026 12:51:28 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265d05514sm7222876eec.15.2026.11.08.12.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:51:27 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 1/1] apache2: upgrade 2.4.69 -> 2.4.70
Date: Mon,  9 Nov 2026 09:51:21 +1300
Message-ID: <20261108205122.414671-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 20:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132014
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- mod_authnz_ldap: Fix crashes in 2.4.69 reported on Windows
- mod_cgid: Increase limits for number and length of environment variables,
  URI and arguments
- mod_substitute: Fix an integer overflow that can happen in very special
  setups
- mod_cache: Do not store a response whose "Vary: *" was set via
  "Header always"
- mod_dav_lock: Fix a heap buffer overflow in dav_size_indirect(), which
  under-reserved space for the stored key length field, written as
  apr_size_t but sized as int

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../apache2/{apache2_2.4.69.bb => apache2_2.4.70.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.69.bb => apache2_2.4.70.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.70.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.70.bb
index fba4667bd1..f34d622495 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.70.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "c5e6ebc66e349b87d7fc6916ae7cc2a808ed348003de134cf9e9d89d3e2cc73d"
+SRC_URI[sha256sum] = "1eefd7dc95836c5872894ce8e6a37f773d5a6764f0766869d39b8bcf0b1bafc3"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 
