Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9784AC531DF
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 06:19:22 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.142135.1723789160485086485
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 23:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=adERrxkr;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-65fdfd7b3deso17213867b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 23:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723789159; x=1724393959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVdo5+RNE1bK4smkePfv7yt8Gf+O6tRwrmS/nOsXbsQ=;
        b=adERrxkrEKyWHEU6/bhrzkQyJi0wQZgO8oe8tHmYsaCj9+wIX9uIXa1IWIjABvTp1Z
         E8BWd8iC3wOx0+zHuvMpsB/ag6ezfRhkorbh42yNDuKD7YAUChSGvmpHsG3Oox7sUisO
         BZz1HM6shlDkKa8zfY1QJBQEiq+dbdIj8QSvcFTq+vHgKGJr/7nSb6CxJPmRY0e2q+ZC
         7JKJbc5gkIqqLWwreih0dsonf6O584L1w9FZ/1pBb3MwLMlB+nybx9KOpSPa9JDM7gC6
         /zymTBSodP7bF0hlDvj0x3omujMrCP+k6bCCdumqfXnPQ952AWnYjSGI4cyZ0P6HvYi8
         M62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723789159; x=1724393959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVdo5+RNE1bK4smkePfv7yt8Gf+O6tRwrmS/nOsXbsQ=;
        b=LioeOihpgPlauuPK2AtiyZOVeA4BKUR598Omsk1Kf4UGMSDrYC/LSnzogwmt5as517
         CI6cHRxnnDTnPDy5tReJ46OadreHnWIJifqDBLYBmd89ZrLrdah+rSvGVNpYf6P9xEvg
         wDBrEB+DGVYH7JH8SSU+1OV9V0F9ZHVvtLYqzN8j4/bHNZNh9MICdtW+gC6A1lnjDJvr
         L8jHmf3lAVXxkBWklTyrwebeg30wXuxvDCDvsBeGr+daNQXfHy7oG4DT4Cx19Tym2v+C
         fh3mWHPdmIJLfsLe16rxKPxiQTaR3u6ttVDvRwn+Ngx4SMwLpKG2NORXCWU3Bw3PkTRE
         tSVA==
X-Gm-Message-State: AOJu0YyYs30z0ikAb8uE6KBB+fhNLNCFxGjf3siV8xRX3lYgbxPo+VLK
	4YQPNis2Ugk6EFivoh8WiChPOqu2BjHWJlSJ8cEEkoCnQdtgpP/ZsIP3ZQ==
X-Google-Smtp-Source: AGHT+IEKiSbZpNtBGfIHFgAzscTLU7NGZV3I9Z7b9j/YPWORPO9yucNwsug+l6F2CuHOd+OHBfbmVg==
X-Received: by 2002:a05:690c:12:b0:697:7cc0:ce1 with SMTP id 00721157ae682-6b1b7a6acafmr24404077b3.7.1723789159476;
        Thu, 15 Aug 2024 23:19:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af1be5asm2022940b3a.176.2024.08.15.23.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 23:19:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/6] proftpd: Upgrade to 1.3.8b
Date: Thu, 15 Aug 2024 23:19:11 -0700
Message-ID: <20240816061915.2095711-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816061915.2095711-1-raj.khem@gmail.com>
References: <20240816061915.2095711-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Aug 2024 06:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111830

Fix buildpaths QA Errors while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{proftpd_1.3.7c.bb => proftpd_1.3.8b.bb}       | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.7c.bb => proftpd_1.3.8b.bb} (92%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
similarity index 92%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
index aa8d5fabd6..33480bff2c 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "75aa739805a6e05eeb31189934a3d324e7862962"
-BRANCH = "1.3.7"
+SRCREV = "0a7ea9b0ba9fcdf368374a226370d08f10397d99"
+BRANCH = "1.3.8"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https \
            file://basic.conf.patch \
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
-EXTRA_OECONF += "--enable-largefile"
+EXTRA_OECONF += "--enable-largefile INSTALL=install"
 
 PACKAGECONFIG ??= "shadow \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
@@ -70,6 +70,12 @@ do_configure () {
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     oe_runconf
+    sed -e 's|--sysroot=${STAGING_DIR_HOST}||g' \
+        -e 's|${STAGING_DIR_NATIVE}||g' \
+        -e 's|-ffile-prefix-map=[^ ]*||g' \
+        -e 's|-fdebug-prefix-map=[^ ]*||g' \
+        -e 's|-fmacro-prefix-map=[^ ]*||g' \
+        -i ${B}/config.h
 }
 
 FTPUSER = "ftp"
@@ -116,7 +122,7 @@ do_install () {
         -e 's|-ffile-prefix-map=[^ ]*||g' \
         -e 's|-fdebug-prefix-map=[^ ]*||g' \
         -e 's|-fmacro-prefix-map=[^ ]*||g' \
-        -i ${D}/${bindir}/prxs
+        -i ${D}/${bindir}/prxs ${D}${includedir}/proftpd/Make.rules ${D}${includedir}/proftpd/config.h 
 
     # ftpmail perl script, which reads the proftpd log file and sends
     # automatic email notifications once an upload finishs,

