Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3288CC433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Mar 2022 08:14:39 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.1418.1648282478402729482
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 01:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eJFduVqq;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q19so8261542pgm.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 01:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a050cE4tF+nIodGBtKXw58d31BqrTzL8ZgwxSfT/vAw=;
        b=eJFduVqqr2hEZ3xIE7bFj6A/998qgCq0+V3ED9HH2NqlujnaR9CcBp+zVWcZRsgWAV
         7zzwFan+hl3gznGhh3j7fxq3/G2B+3xGNG/huUTuGqdcRNthXe3GAHN3MwJpjeGRXI+h
         ToiP9Io8m8Snk1ypDWkeu2v0lE4votd3oMjAbVVIcBVpmNqA/GOT1ogDOZ3bfoPI9MDJ
         tWd319ojbZCSnDOhsHRkLL3wh95pek/JvC6ptu5SjV1ZDa83MRSPXgnfDi/TO4QrUxG5
         QNztIxCcVDOekDKhAb6vBgQKIkkiq5da4j+dtrNPUoR56YcXk9gM7rCB9/tFTplrukqW
         6pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a050cE4tF+nIodGBtKXw58d31BqrTzL8ZgwxSfT/vAw=;
        b=blHGKdeBsLmGVXWBE2l8j7GpH28ER9Q6wm36eEhc4mtqMzrxMiE2WrEwCB/nkvfaCq
         q3U5YwsPpw2MOkyr7ry+biybNaeHXcfx55WJSSBrRQI23e9iqtATPjFUFoc+rWQRHhym
         hgUUdNGlI8rXddQyUIxxosaFIpivOO/cfyph0E1sNVj0hWukwRn0RETYbae5J1iWTh/A
         ZHfYYlCmIp/XmBCIg4BpDgx7w1nnO0+Nr3j1uXUTT8ffDE/72Xn7ID4pVcHpALbpzWAM
         VHMvXPz3tq5f12eMJZObbNwIH5oCPBpbT2DUlrbD5DmlvEAkdLeiQF6alzLZS5jC+X85
         RZpQ==
X-Gm-Message-State: AOAM530ozKOOjID/kYtgCpPfw7lQEIY43THk/M//8FAJu4w7VTAJBnrL
	EkEncUt5VAMw5F5DcrWqnyYpxP47p1s=
X-Google-Smtp-Source: 
 ABdhPJyBOnlGTiuuRUmuCjb8KsJX37YUjD4IKwyccPVpzPd27Cm++W4PMhmk9Pw9+b1ML3ZoGpdMjQ==
X-Received: by 2002:a05:6a00:15c6:b0:4fa:aaec:ef42 with SMTP id
 o6-20020a056a0015c600b004faaaecef42mr13540988pfu.74.1648282477435;
        Sat, 26 Mar 2022 01:14:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 t7-20020a056a0021c700b004f7916d44bcsm9021567pfj.220.2022.03.26.01.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 01:14:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] iniparser: Update to latest tip of trunk
Date: Sat, 26 Mar 2022 01:14:34 -0700
Message-Id: <20220326081435.841766-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Mar 2022 08:14:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96213

Install .pc file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...iniparser.pc-Make-libpath-a-variable.patch | 23 +++++++++++++++++++
 .../iniparser/iniparser_4.1.bb                | 11 +++++++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/iniparser/iniparser/0001-iniparser.pc-Make-libpath-a-variable.patch

diff --git a/meta-oe/recipes-support/iniparser/iniparser/0001-iniparser.pc-Make-libpath-a-variable.patch b/meta-oe/recipes-support/iniparser/iniparser/0001-iniparser.pc-Make-libpath-a-variable.patch
new file mode 100644
index 0000000000..4824344f05
--- /dev/null
+++ b/meta-oe/recipes-support/iniparser/iniparser/0001-iniparser.pc-Make-libpath-a-variable.patch
@@ -0,0 +1,23 @@
+From 1761298b73c759c07e4652ada307f68512a75ff1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 25 Mar 2022 20:44:41 -0700
+Subject: [PATCH] iniparser.pc: Make libpath a variable
+
+Will set according to baselib that yocto exports.
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ iniparser.pc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/iniparser.pc
++++ b/iniparser.pc
+@@ -1,6 +1,6 @@
+ prefix=/usr
+ exec_prefix=/usr
+-libdir=${exec_prefix}/lib
++libdir=${exec_prefix}/@baselib@
+ includedir=${prefix}/include
+ datarootdir=${prefix}/share
+ datadir=${datarootdir}
diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
index f3593fb5ff..2810a4f651 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
@@ -6,12 +6,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e02baf71c76e0650e667d7da133379ac"
 
 DEPENDS = "doxygen-native"
 
+PV .= "+git${SRCPV}"
+
 SRC_URI = "git://github.com/ndevilla/iniparser.git;protocol=https;branch=master \
+           file://0001-iniparser.pc-Make-libpath-a-variable.patch \
 	   file://Add-CMake-support.patch"
 
-# tag 4.1
-SRCREV= "0a38e85c9cde1e099ca3bf70083bd00f89c3e5b6"
+SRCREV= "deb85ad4936d4ca32cc2260ce43323d47936410d"
 
 S = "${WORKDIR}/git"
 
 inherit cmake
+
+do_install:append() {
+    install -Dm 0644 ${S}/iniparser.pc ${D}${libdir}/pkgconfig/iniparser.pc
+    sed -i -e 's,@baselib@,${baselib},g' ${D}${libdir}/pkgconfig/iniparser.pc
+}
-- 
2.35.1


