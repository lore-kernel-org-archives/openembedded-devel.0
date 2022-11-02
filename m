Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57988C43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:55:52 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.2514.1667361343425636522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qMp5IyYe;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id y13so15303910pfp.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 20:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/dZQeCSITuoBflkYHOlBLBTR2wbPmswhEJjggLYjU4=;
        b=qMp5IyYesZm9ByabaY74aNoj3mkn4A6Tj2S5lkcgXZKLCXixfGrgCZ4FGs4KovRDiE
         NBnR0CVTO0HX2f0dFFcDgpT3z1LztF7U/ljbeiPnJLmC8ek8WvuE7w63nQsiDWpcU2g7
         rBqx84Y1S7kY8Mwe1UwYfD0jg+uzzjiYvdb59/xIQdKCAGqEXG73/4RxSpc2MHgaFHTy
         j0+UYVvcgdgZMlF3Fac0zjMFcVqxy2T8kRGqGPPihXpSpFP3KN+607sgbi+YOKCBuTcK
         mSgl5gb4UtcLSLPqxepMGK8T1AFdg9aM7bZV9hKGj0nbVD4eVMMAX/WHAMzzHJj+9lqE
         eomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/dZQeCSITuoBflkYHOlBLBTR2wbPmswhEJjggLYjU4=;
        b=BiETHwleR2oFb9bq614vL6QJtkJxODe+wfA1ZEtIRB3S8/ukKYbd9rluNbaxD1XY2r
         p3E5eud1C65iUC7hdPbfuyQKrJLH/pnLFX1tBQim6ulbXb5gaWXlGo/O9Rc3/BNUeubs
         H4cNlMr3/NT88dejV8p5IdJjqKwtNT7clf+CIFock168kpRZ1XV54PScGd/qsEVKbng5
         /CUYn9oQxcdWq9rFBJChpeGz508Abt9qlqxo4xnb5C78lsQP1HuwRXjtgnpZso5eTDlX
         r98jatPd3AdGBKyINJr2/QjyVCuGJdoW6conCnUQWjlzeOsuOqUZX1+t1FLwCnkY5d91
         /brw==
X-Gm-Message-State: ACrzQf3WhDRzJFkciIplCGd3s0JHbTBg+aW/Yebu1caY0NYgK6DpSmTm
	A4p58YbK2Mi0pFw0BB8EVDgOXNiuQ2+X9w==
X-Google-Smtp-Source: AMsMyM4qUi6W6BYJOHm6hU3x6ER3l7Udm0wdNeRkt4+InjBq5uWZmlWZKcE2A71F5ylRGj+5mcNLeQ==
X-Received: by 2002:a63:5063:0:b0:46e:cd36:ce0c with SMTP id q35-20020a635063000000b0046ecd36ce0cmr20332330pgl.617.1667361342509;
        Tue, 01 Nov 2022 20:55:42 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id c2-20020a63da02000000b00460a5c6304dsm3514585pgh.67.2022.11.01.20.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:55:42 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-perl][PATCH 3/5] libcompress-raw-zlib-perl: upgrade 2.096 -> 2.202
Date: Tue,  1 Nov 2022 20:55:26 -0700
Message-Id: <20221102035528.3967640-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102035528.3967640-1-tim.orling@konsulko.com>
References: <20221102035528.3967640-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 03:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99403

https://metacpan.org/release/PMQS/Compress-Raw-Zlib-2.202/source/Changes

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../libcompress-raw-zlib-perl_2.096.bb        | 29 ------------
 .../libcompress-raw-zlib-perl_2.202.bb        | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 29 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.202.bb

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.096.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.096.bb
deleted file mode 100644
index dcd5badab9..0000000000
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.096.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Perl interface to the zlib compression library."
-DESCRIPTION = "The Compress::Raw::Zlib module provides a Perl interface \
-to the zlib compression library (see 'AUTHOR' for details about where to \
-get zlib)."
-HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Zlib"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=603fa463887aed6bb3f6f2a999aca775"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "4144ecdd901231553447998cf8035e4a"
-SRC_URI[sha256sum] = "cd4cba20c159a7748b8bc91278524a7da70573d9531fde62298609a5f1c65912"
-
-DEPENDS += "zlib"
-
-S = "${WORKDIR}/Compress-Raw-Zlib-${PV}"
-
-inherit cpan
-
-export BUILD_ZLIB="0"
-
-do_compile() {
-	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
-	cpan_do_compile
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.202.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.202.bb
new file mode 100644
index 0000000000..5459572e2b
--- /dev/null
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.202.bb
@@ -0,0 +1,47 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README
+# +++ README
+# @@ -1,4 +1,4 @@
+# -       Copyright (c) 2005-2020 Paul Marquess. All rights reserved.
+# +        Copyright (c) 2005-2022 Paul Marquess. All rights reserved.
+#            This program is free software; you can redistribute it
+#             and/or modify it under the same terms as Perl itself.
+#  
+# 
+#
+
+SUMMARY = "Perl interface to the zlib compression library."
+DESCRIPTION = "The Compress::Raw::Zlib module provides a Perl interface \
+to the zlib compression library (see 'AUTHOR' for details about where to \
+get zlib)."
+HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Zlib"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=9bd174bdd6fbb141c1b679e2466e0b39"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "96e20946eb457a32d2d7a0050b922e37b5ada41246bcdc824196d3f7c4da91b7"
+
+DEPENDS += "zlib"
+
+S = "${WORKDIR}/Compress-Raw-Zlib-${PV}"
+
+inherit cpan
+
+export BUILD_ZLIB="0"
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


