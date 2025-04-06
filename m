Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB001C369A4
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 07:23:19 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.20945.1743924197049949704
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 00:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D5n4yIQx;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso3922319a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 00:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743924196; x=1744528996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsPVYTyr7ppiUVXrchgTzYk6ewU7UAkRThckpp2a35M=;
        b=D5n4yIQxFLURfBIFbWg/L1gEOQVR/v40CQtKFXHqUSWaSNvVgg1R59YNtFYXjfz7Z5
         3XCnoRVlT8lAvwiWtoQsN6rZLf9O4zS5abh6HMh0ktjkr9GoGD6sxHJP6gx9xRTEueTi
         Je8+2jWc2beXb/0GHCr1XZNq0xggc4sdtxi3yKYXIFwx5C3nPMHVaOdoc51Ph0lmkDli
         gtDVI+TRUMAY9Gc9klQKOfL+Io2RRJEd52IAAbmLeuS/flY6pWgCWnT36IXo4i9CGv2Z
         3nfVDxJeL2mfMZ1Ew7VaAFKGnaoIvc4nX/HHjX1XQgGdFf9h7R1J5/0L67ifvdT4l5H4
         jJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743924196; x=1744528996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsPVYTyr7ppiUVXrchgTzYk6ewU7UAkRThckpp2a35M=;
        b=whUiXScVITUHWjD4Lltj8kxuGnuhgfiE3j53pHFcY+p4XplsbeA+fOQMCpo9XZdSMo
         R/2AnYkl7iIFZB5YWE3k8cj8tutfij6RqGHsAIEJJRnK3wd6kZ1BfplUEDpMTYw8n9/f
         PlRMI2tLK1sWLE0tlvR/enyep1sU3+tYl6fU/Hty970Ty3aj0GYnAs4LG1pOawir91UV
         LaMNo+5xB3o79km+8DY/QA1ZE89IzyueNBNK5sV33ryt6RbYSFTkCKUMNOwcxCfRsBkw
         dkwhel+HBRccuZZEWftZxrVLJOcDmDTJ+OjXTUue06WZaI74ezeJzGdaMdMQVvWncr0R
         XOnA==
X-Gm-Message-State: AOJu0Yyb9b/ymTwGx5syUl8nNs5SYpnSCSSaC9SBdSNyXCn7mXSydhTd
	YAIkleoAWFirL5yhNcoTObTV0jKZtdXAGdnbWsjSm5iztwTmFXJvlFW6DQmU
X-Gm-Gg: ASbGnctAesIz1LjUQRZoiFbb00mZNcU8C2lzfuUcbIaAWr8b78d1jkf59RZ2elfRrYG
	YazO6vequgxcpqAC7BUESnrN+UVW/Zz3q7BDS5JP3F/ScY34Rk3DlYcSSAMbUEvhgnxCB5eU+DC
	nVJ/vMVRLhDZoEUf2W1493JhkzVihMgadUch+FC9IdJR2gA8DwOB9SUij/tWcAZEU40UkDykPqV
	EStXl7H1b2O2G2VyHQwRrHkZQJhd+flslWZTJVXowCpS4Ul7WX3VI3/wXZ8nYIu5ia+GozvCIKG
	qBmv74pTM46N8VTwCeY4k1isFN9QZot7Y1Rx
X-Google-Smtp-Source: AGHT+IHOiLEqv9X+oQ3JgDopOipp+RgEldgpGRv7ICjWZoSeS/WMhPzHVvth0gxm+if+HAIxPJMVvg==
X-Received: by 2002:a17:90a:d88c:b0:2ee:9661:eafb with SMTP id 98e67ed59e1d1-306a4eb7674mr11626522a91.12.1743924195940;
        Sun, 06 Apr 2025 00:23:15 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561c98496sm11373673a91.0.2025.04.06.00.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 00:23:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] system-config-keyboard: Drop recipe
Date: Sun,  6 Apr 2025 00:23:09 -0700
Message-ID: <20250406072310.862374-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406072310.862374-1-raj.khem@gmail.com>
References: <20250406072310.862374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 07:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116608

This package is dead and tarballs are also gone. 1.4.0 release
was in 2013

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 .../system-config-keyboard_1.4.0.bb           | 27 -------------------
 2 files changed, 28 deletions(-)
 delete mode 100644 meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 70d05c44bc..ebb0f0f810 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -876,7 +876,6 @@ RDEPENDS:packagegroup-meta-oe-support = "\
     stm32flash \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "synergy", "", d)} \
     syslog-ng \
-    system-config-keyboard \
     tbb \
     tokyocabinet \
     tree \
diff --git a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
deleted file mode 100644
index 71578e71d6..0000000000
--- a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "a graphical user interface that allows the user to \
-change the default keyboard of the system"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRC_URI = "https://fedorahosted.org/releases/s/y/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "218c883e4e2bfcc82bfe07e785707b5c2ece28df772f2155fd044b9bb1614284"
-
-inherit python3-dir gettext
-DEPENDS += "intltool-native gettext-native"
-
-EXTRA_OEMAKE = " \
-    PYTHON='${STAGING_BINDIR_NATIVE}'/python-native/python \
-    PYTHON_SITELIB=${PYTHON_SITEPACKAGES_DIR} \
-"
-do_install() {
-    oe_runmake 'DESTDIR=${D}' install
-}
-
-do_install:append:class-native() {
-    rm -rf ${D}/usr
-}
-
-FILES:${PN} += " \
-   ${libdir}/python${PYTHON_BASEVERSION}/* \
-   ${datadir}/* \
-"
-BBCLASSEXTEND = "native"

