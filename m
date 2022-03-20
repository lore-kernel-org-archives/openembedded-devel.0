Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD89C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:44:58 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.16329.1647765898463609761
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LXv7ud3n;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t14so8242579pgr.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odXRI30lRuoOcNUHZo+8q1w2iU6LtT8r4AqU9/oiVBg=;
        b=LXv7ud3nwvjfMHqqjychhLAIefkwOI+bfppEvpwdu/E2U1DVYt/UoD3VRgXHgUsnKU
         Dt5duEVEr0EcIQiPM3OqJHzI7nRzRypy5CBGeyEjtuTGdiVs3IrFEPJriEtBQkRQbPVt
         k+2voTBvFGHr9y/TtAQIwNcHW8/sNlWDaLD2U0HhhJa4Z7nL6v2tZWW/n+mU8yhPmcDw
         ghhcAHm6pUgqXj+joXyGcZFli8Grhn501HaSoEPAa/GGV5oozfTut0knpfScSDxkV0Ea
         3/mrJ1NPPhgv9xcgy4EHHvdJqE5cqhb0b9n1hwx7ue0JC7zrC3dm1RWMpnUfXz0okS2h
         Qftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odXRI30lRuoOcNUHZo+8q1w2iU6LtT8r4AqU9/oiVBg=;
        b=okyxEp78EW4OLNbjQajvPtqUR2TodFQzPIZrXuRno26PH6Jq7Lh+cKzfbBcaPgG1Ic
         cOMVE53wUmDm5XieSeAJP4+M4kOgPsGhbneMhTDTe6Rg8Wm/MV9FmaWQvHfYoiUU3Qtw
         e4cg5TpWjREk0BYWohdQmhbXpXRKVAcJxeVpSTv+ZJrqBkB29IlDy8ShyxWKd3wH7r3R
         ryGJID5SgHtjau3zmlNvZMXvHFToioTzJycaHrKORzRnMmojHpmaCQ82oJC8/8m6WyhN
         4KdazpNVwbtNEkWsQK4QVILtBOi6Gyx0s0u79gpZFnyiLosHVdreXlTha3ZIV0294m1U
         ee+w==
X-Gm-Message-State: AOAM5309IKRrxHXJ73+T8qxCbQeTM2JZ0m6WX8MGTGStkJfDhzkfjRM6
	WjDNvREwNu31jzQqHBSQ8DgaQ2i6kXRS1w==
X-Google-Smtp-Source: 
 ABdhPJy/ICAgqtlC0jdj3RCADobcMB/i8xYaPKIxHDdgTzROqfC4kQlvKWRWpY3PY9Ai1M1qYwusQQ==
X-Received: by 2002:a05:6a00:26cf:b0:4f6:fc52:7b6a with SMTP id
 p15-20020a056a0026cf00b004f6fc527b6amr18487513pfw.39.1647765897484;
        Sun, 20 Mar 2022 01:44:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 f13-20020a056a0022cd00b004f7eaac852dsm15896497pfj.151.2022.03.20.01.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:44:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] libsquish: Define LIBDIR knob
Date: Sun, 20 Mar 2022 01:44:54 -0700
Message-Id: <20220320084455.878607-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:44:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96082

this is to avoid assuming /lib for library path
Enable compile with altivec when in machine features

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libsquish/0001-makefile-Add-LIBDIR.patch  | 36 +++++++++++++++++++
 .../libsquish/libsquish_git.bb                |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-makefile-Add-LIBDIR.patch

diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-makefile-Add-LIBDIR.patch b/meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-makefile-Add-LIBDIR.patch
new file mode 100644
index 0000000000..c6eb7ac576
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-makefile-Add-LIBDIR.patch
@@ -0,0 +1,36 @@
+From 4fd08c0446ca02917014b63f9080c4205958a130 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Mar 2022 01:15:32 -0700
+Subject: [PATCH] makefile: Add LIBDIR
+
+Avoid hardcoding /lib
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1c01f89..2b1df5b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -11,12 +11,12 @@ all : $(LIB) squish.pc
+ 
+ install : $(LIB) squish.pc
+ 	install squish.h $(INSTALL_DIR)/include 
+-	install libsquish.a $(INSTALL_DIR)/lib
+-	install squish.pc $(INSTALL_DIR)/lib/pkgconfig
++	install libsquish.a $(INSTALL_DIR)/$(LIBDIR)
++	install squish.pc $(INSTALL_DIR)/$(LIBDIR)/pkgconfig
+ 
+ uninstall:
+ 	$(RM) $(INSTALL_DIR)/include/squish.h
+-	$(RM) $(INSTALL_DIR)/lib/libsquish.a
++	$(RM) $(INSTALL_DIR)/$(LIBDIR)/libsquish.a
+ 
+ $(LIB) : $(OBJ)
+ 	$(AR) cr $@ $?
+-- 
+2.35.1
+
diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
index cb42d943fc..b69d30d259 100644
--- a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
+++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
@@ -10,7 +10,8 @@ SRC_URI = "git://github.com/OpenELEC/libsquish.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "INSTALL_DIR=${D}${prefix}"
+EXTRA_OEMAKE = "INSTALL_DIR=${D}${prefix} LIBDIR=${base_libdir} \
+                ${@bb.utils.contains('TUNE_FEATURES', 'altivec', 'USE_ALTIVEC=1', '', d)}"
 
 do_install() {
 	install -d ${D}${includedir}
-- 
2.35.1


