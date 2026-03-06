Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B29FCB638
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 23:21:47 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108.1772834473605034497
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 14:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fSWmr0r7;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: gitbeam@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b936b85cc71so1228002366b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 14:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772834472; x=1773439272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NBD53rh8/s3UgsMJCJ5cTfv0luucue5tDTdxU50CWhE=;
        b=fSWmr0r7Oadkb7JyQplhn2SXL/X1776ljJW2mzV7F2TCPd5OMeMDO0BV+9EWWzAVtp
         wNnkgSDWoA5bg9kP595Jh69aLE6xq3W/ukC9mDeJCOH7denRID1rzXFM5QxbgOIHLVD1
         tRldE81lPvaL51//hXTiqlZssP3xx6LmDl5Yqo6KMjpUm1g44tr+2nOc8Xew4HddofFD
         8kTb8i3araorMiqBNLxB521R+Zxz8sGhBVA5J4Bdn48bq0yZezZpiz4quZCvED2c1pAz
         nPMCzHWuSPUfCMtOl/OkjGwfk0mtz1tVAH2XJSgh4UscsYrriapvU4fLMQbETfYAw+Eb
         6ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772834472; x=1773439272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBD53rh8/s3UgsMJCJ5cTfv0luucue5tDTdxU50CWhE=;
        b=frUSnQZCeEJmAl62KvwvmC5+Lw0BxHDWA3M3TOqxSDltKgCuOlYLbhbvmaQF/mkq6v
         HUucVCjoeWRB+gd7EFa77T435W0QmQAsdAtfVLiVgdRAGQ24SBPLeC+jvMLsolAtPaiR
         fOqY0ZjZzI6guvJ6fTCjf/87lxAUUBvT7zujvSM/l5RsimICorZTby0cn1r6HgQiIN3q
         QPAK38U+rGw8+6vPKkxC0M/sip1UT36QNMnINPbLh38UOg8GzAdwNleaS2j5vjwrUmaD
         z5PufYT2GfDt8bdlEkermMO3+PnGH4Cy61b6uC0/lj7mG6gd4UKgZoGFzDt8DsxD1c26
         2dMw==
X-Gm-Message-State: AOJu0Yy4mmI4cjm7IIeLxWFJIB2NztAlVjTGUGxExpLGW167srnTmNsw
	qs52/B3tZ+NnTatxCJu73AzgParrwUOpmET69ny0dYEImuI0o1waZELAkgMoMqy8JD0=
X-Gm-Gg: ATEYQzxbVyHWB3fR3NaFc5MOUrYYdme1kqTByLJa6jvZdN9Ozk7w17iwOfj3mVDUVu2
	td3AIfYYXuSAmESYWWAqHU3wikdBLxyDgR18PZ7XQizO6Ej5K45fCzb2WlkBbR+IjgEnvu1+jaK
	jcKfYzYU1GDOetfzPvNV/MET7AGc7JbpheWrYghk586eMwuLhPfwZyKQTiPP8ZIzpTOg52syzey
	edT+wGxwg5xCHYEkJ2NSW6kidM4crjU2UcHIEJFIpj9aa1bYbackt3r27nqtlBLd77S4GSzc6aH
	vSx3pSDhyHgTO2/3VrcxfuSTznywMbnq0YCKPmkoRqYnPaP9NsIqUMxP1LJs36CcmsrlI+5d6ap
	SZiKNII2PpMy3qfqULJfSe4Sf9Fz4mJ9ApY8DYgLhNBu6sSjIhMrUGjg4issqJIezn6cZZD0sc+
	DJNk7TQby2ErcakpiA+nLQfBUCSQUInRrF0rp5qUfI3HCwc6icwM4tuFlrOZqLL0cpb/GoxdErp
	Vdqir1G8rz2M3wKiPbisuD6XAKxB6GumvijaiXhHAKaxb5aDhj4tOQZgRYvhmSSHunNeg==
X-Received: by 2002:a05:600c:3acf:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-48526978d48mr63590745e9.30.1772834161429;
        Fri, 06 Mar 2026 13:56:01 -0800 (PST)
Received: from DESKTOP-SJHFTAC.localdomain (dynamic-002-241-244-157.2.241.pool.telefonica.de. [2.241.244.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm27000055e9.7.2026.03.06.13.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 13:56:01 -0800 (PST)
From: G B <gitbeam@gmail.com>
X-Google-Original-From: G B <gitbeam@proton.me>
To: openembedded-devel@lists.openembedded.org
Cc: G B <gitbeam@proton.me>
Subject: [meta-oe][PATCH] ntpsec: upgrade 1.2.2a -> 1.2.4
Date: Fri,  6 Mar 2026 22:55:35 +0100
Message-ID: <20260306215535.6619-1-gitbeam@proton.me>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 23:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124924

Upgrade to latest upstream release 1.2.4.

Release notes: https://blog.ntpsec.org/2025/04/18/version-1.2.4.html

Signed-off-by: G B <gitbeam@proton.me>
---
 .../{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb}     | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb} (86%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
similarity index 86%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
index 872d1ce4f7..9704e2d15e 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
@@ -2,12 +2,12 @@ SUMMARY = "The Network Time Protocol suite, refactored"
 HOMEPAGE = "https://www.ntpsec.org/"
 
 LICENSE = "CC-BY-4.0 & BSD-2-Clause & NTP & BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSES/BSD-2;md5=653830da7b770a32f6f50f6107e0b186 \
-                    file://LICENSES/BSD-3;md5=55e9dcf6a625a2dcfcda4ef6a647fbfd \
-                    file://LICENSES/CC-BY-4.0;md5=2ab724713fdaf49e4523c4503bfd068d \
-                    file://LICENSES/MIT;md5=5a9dfc801af3eb49df2055c9b07918b2 \
-                    file://LICENSES/NTP;md5=cb56b7747f86157c78ca81f224806694"
-
+LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=653830da7b770a32f6f50f6107e0b186 \
+                    file://LICENSES/BSD-3-Clause.txt;md5=55e9dcf6a625a2dcfcda4ef6a647fbfd \
+                    file://LICENSES/CC-BY-4.0.txt;md5=2ab724713fdaf49e4523c4503bfd068d \
+                    file://LICENSES/MIT.txt;md5=5a9dfc801af3eb49df2055c9b07918b2 \
+                    file://LICENSES/NTP.txt;md5=cb56b7747f86157c78ca81f224806694"
+                    
 DEPENDS += "bison-native \
             openssl \
             python3"
@@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea118a62f0a3226950e"
+SRC_URI[sha256sum] = "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c81e0834f87eebc7d"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 
@@ -63,7 +63,6 @@ EXTRA_OECONF = "--cross-compiler='${CC}' \
                 --pyshebang=${bindir}/python3 \
                 --pythondir=${PYTHON_SITEPACKAGES_DIR} \
                 --pythonarchdir=${PYTHON_SITEPACKAGES_DIR} \
-                --enable-debug-gdb \
                 --enable-early-droproot"
 
 EXTRA_OEWAF_BUILD ?= "-v"
@@ -89,6 +88,11 @@ do_install:append() {
 	else
 		install -D -m 0644 ${T}/volatiles.ntpsec ${D}${sysconfdir}/default/volatiles/99_${BPN}
 	fi
+
+    if [ -d ${D}/usr/lib64 ]; then
+        mv ${D}/usr/lib64/* ${D}${libdir}/
+        rmdir ${D}/usr/lib64
+    fi
 }
 
 PACKAGE_BEFORE_PN = "${PN}-python ${PN}-utils ${PN}-viz"
-- 
2.47.3


