Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id F36456C50D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:08 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c73so5025467pfe.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lDTYVCPCsaL1X1JQfgRrUZPKMdM7AnaOTQowofatnEc=;
	b=H6xODb+7rc4ZLDPTYl/lFXPZC4sqwNJOqbE8yoyTQmE13wfwaQpRxtuICxNrZyJt6U
	11ndn1dbm7V8EpQbN4SiBaFdlkwvJQj2pejridxvmgmVdaxEiyA19TyhQo1T4FD9hO80
	t+12f5TCqx6B3HhfDX2QOngujkLsSgHBfmpbhZljckWuHGisvcduOXrHStr5YhlYMQd1
	0s1AnwQ1o/dJdUWRfZAbW/4Rm3yC2kAhRIi/aCfKLaMFMK//6hNAryZmm2STBSBDkdpj
	6F7uYNGmBlTbj18rFbv4sbl/Qr9teimD6ej9yrhH4NW9H/HzOgTM4l76dpx2GHz33Ymf
	9qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lDTYVCPCsaL1X1JQfgRrUZPKMdM7AnaOTQowofatnEc=;
	b=l9BiL29YPgMZe0khwm25jgnmk+FmCPUhlAOY4+MWn8MILk7X+avQ8WR9tvYh/oTwzj
	XoINN6ZC4slQ6mf54J6j7XLGDRj0rmxmAjp/E6OsW55km8hKGIcbuLqxMcJCatWPSvES
	vQgm+CAh+AbEOrtSIr8azjejVQASUzzgaMmQ/JygzJd2t5Uj5UOWTKGlpvLu+hFN4QHA
	LuV0ue2Ilmm2EgY0qJjD2Lq79SX94QujDXa0oavZbCM9yw45VEQ/TCpX46sD8pjq3DVa
	Etjg/EyyKZhTWNow72Va7Z1CGUkmuPIjRQOWDccCYxNac/CuyK+CWrBmbdDTX9Mu5iSA
	tfjw==
X-Gm-Message-State: AJcUukdwaRnP0BM4/s29BSjS4/LQUN4DB6kJcSp+M5hRd48kP9MVfQL0
	97BXX5h4orNK2uE1W0l7glx4dUO0rLY=
X-Google-Smtp-Source: ALg8bN6qESa1Mx0TFaKNeAcrf5fTgftFnQ3+H4OBWGKsJCDsmBt9FU6bw+oCcyphmAVrDUcrpE6YAg==
X-Received: by 2002:a63:8043:: with SMTP id j64mr10494880pgd.405.1545600969492;
	Sun, 23 Dec 2018 13:36:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:40 -0800
Message-Id: <20181223213557.7834-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 01/18] modemmanager: Fix build with gcc9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Dec 2018 21:36:09 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-string-to-s-printf-formatted-string.patch | 31 +++++++++++++++++++
 .../modemmanager/modemmanager_1.8.2.bb        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch
new file mode 100644
index 0000000000..5fbafbb5dc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch
@@ -0,0 +1,31 @@
+From b8862e6af1c6d022b8c182098e7deddb874ece19 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Dec 2018 23:10:44 -0800
+Subject: [PATCH] Do not pass null string to %s printf formatted string
+
+Here the string is already decided to be NULL and passing
+a null pointer to %s will not work
+
+Fixes
+error: '%s' directive argument is null
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mobile-broadband/ModemManager/merge_requests/67]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/mtk/mm-broadband-modem-mtk.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plugins/mtk/mm-broadband-modem-mtk.c b/plugins/mtk/mm-broadband-modem-mtk.c
+index 475a63ac..541de4a5 100644
+--- a/plugins/mtk/mm-broadband-modem-mtk.c
++++ b/plugins/mtk/mm-broadband-modem-mtk.c
+@@ -191,7 +191,7 @@ get_supported_modes_ready (MMBaseModem *self,
+ 
+     response = mm_base_modem_at_command_finish (MM_BASE_MODEM (self), res, &error);
+     if (!response) {
+-        mm_dbg ("Fail to get response %s", response);
++        mm_dbg ("Fail to get response");
+         g_task_return_error (task, error);
+         g_object_unref (task);
+         return;
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
index e198bd588e..f8e074a87f 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
@@ -13,6 +13,7 @@ DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            file://0001-Do-not-set-Wno-unused-but-set-variable.patch \
+           file://0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch \
            "
 
 SRC_URI[md5sum] = "a49c9f73e46c7b89e5efedda250d22c0"
-- 
2.20.1


