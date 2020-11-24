Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.47506.1606193060766090505
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 20:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DHplrHyo;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id s63so6478409pgc.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 20:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qjbNtMEeS+kKvLqAe0j40IpmLiKl2vq33AJ7Bc+EGzw=;
        b=DHplrHyopx0HXyNubBHXgig9K3U3YL2qwnxj+zIcaGScrNSPhecQTOwLE6EoUpuurE
         coD8/Tq0QeDrD46FtiehviIgRUj2R7JQpda8Fk2CxWg0RRlVTI1cdDlww0MPkWXbsjlh
         h84tyeZlBuC3UcZ9KZKqEFKZqZPBHXAWl/2BYZoNmhheSwDzImS/jfHHtY1EZi1Irtzh
         MBymXoLrHO7Nm+NmB8He0EEXGAk6ymfDag2EuS/+/B33YuI6eGfzqET0w/E+6NMCInj1
         nJ3qvdxxYyUdfR+Qr0Tra6LMGOafB2b/cv/DBmWzQG7P6YdLm0LK+pmvjpQBxscGgcVd
         s8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qjbNtMEeS+kKvLqAe0j40IpmLiKl2vq33AJ7Bc+EGzw=;
        b=HLno2F9amsKxYzVHMmsws8n2DgEEms8O/Jfrw7pdFUiZwFmLCpBPQWTQ4m8HdFlBdx
         M+HC1Km01E6lyqluUxQiLPBWFKTm/xCI7Fd2Rv8xsocYFGlUTiNWWW+aqydnY2sX9AeW
         M9Sq9YtxBugRWXC+IfYgbD4frcWoHvifYbQf67A86Ti+Qucxsxbw7n4lQm8OGMxE7DrZ
         fK2A4VWe4yxsL6pK6026K4BBu4Npbm0cK0bM6lrJA9ZbIIX62Ca9ecg5yL/0xH+w7yIt
         r++XbsecjzIG3UzFwWXUz4Agy9N5S8vvuwDXEkrN/vVPrIqjJgjJt7oLXupKj2tsIgPU
         NrVw==
X-Gm-Message-State: AOAM530eZb4MH+FV0Taqvvep0wMIibVc4aXkbLDX3aNNqLZzV3q7ym3v
	ASjJBufcllP/CLlFn3L7bpchejuCVCV63g==
X-Google-Smtp-Source: ABdhPJxyhggm3IFTSp8UxHemowLwDSmQuEM3ReQLjI2oi6svSpCI8bkmUrwZIliYSHtxDBllqOrP6g==
X-Received: by 2002:a17:90a:db0a:: with SMTP id g10mr2769977pjv.225.1606193059944;
        Mon, 23 Nov 2020 20:44:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::ed1a])
        by smtp.gmail.com with ESMTPSA id q19sm9425783pff.101.2020.11.23.20.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 20:44:19 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Max Kellermann <max.kellermann@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] php: remove the failing ${D}/${TMPDIR} code
Date: Mon, 23 Nov 2020 20:44:17 -0800
Message-Id: <20201124044417.2064147-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Appending ${TMPDIR} to ${D} doesn't make any sense, because both are
absolute paths.  And additionally, the code fails:

 rmdir: failed to remove '/usr/src/oe/tmp-musl/work/core2-64-oe-linux-musl/php/7.1.9-r0/image//usr': Directory not empty

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/php/php_7.4.9.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index abd8b16723..1da5607835 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -155,7 +155,6 @@ do_install_prepend_class-target() {
 # fixme
 do_install_append_class-target() {
     install -d ${D}${sysconfdir}/
-    rm -rf ${D}/${TMPDIR}
     rm -rf ${D}/.registry
     rm -rf ${D}/.channels
     rm -rf ${D}/.[a-z]*
@@ -179,14 +178,6 @@ do_install_append_class-target() {
             ${D}${systemd_unitdir}/system/php-fpm.service
     fi
 
-    TMP=`dirname ${D}/${TMPDIR}`
-    while test ${TMP} != ${D}; do
-        if [ -d ${TMP} ]; then
-            rmdir ${TMP}
-        fi
-        TMP=`dirname ${TMP}`;
-    done
-
     if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/apache2/modules.d
         install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
-- 
2.29.2

