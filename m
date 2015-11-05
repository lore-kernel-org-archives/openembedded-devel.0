Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id E4F14766B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 03:55:26 +0000 (UTC)
Received: by pasz6 with SMTP id z6so76127064pas.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 19:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=NytfCUH9YfSstFC472WgSyV7ZAm7Bn1S+XTTLRju+Q4=;
	b=hd7xUuPVuqCiRcex4tq889lzDSfkI684w0xHWVrG7SU3AQuW3QXYH1jlVxxroye5Vd
	PX5MPxW2l5W2b13EA7YTJAjQts3IndewLr01GmHaqmZAIqYM+Ip9PeWERMs19Th3PY/S
	382OsDh45V5KHcN22U/zrDP35sjYVEaBrNOGCXpu6oz7O9NSdzhVEE8tTXF4Ox+uspTU
	Zfl8wlPEDhiJXJn4AdeZIyKmI5pnXaU/1KBsCNvXnqlletYnd/X5x8D1uAYsdpo81S5h
	k6pATTgxozs0IfRv65eTABJb4AycQpNTz4dCwEvVkL4P+598xTut+kxQUKMcuXbsRm59
	rUew==
X-Received: by 10.66.221.105 with SMTP id qd9mr6793878pac.46.1446695725916;
	Wed, 04 Nov 2015 19:55:25 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by smtp.gmail.com with ESMTPSA id yp9sm4876704pab.1.2015.11.04.19.55.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Nov 2015 19:55:25 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 21:55:21 -0600
Message-Id: <1446695721-21521-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.6.2.11.gb05c2f9
Subject: [meta-oe][PATCH] tmux: update to 2.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Nov 2015 03:55:28 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

tmux 1.6 is three years old. Update to latest.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/recipes-extended/tmux/tmux_1.6.bb | 18 ------------------
 meta-oe/recipes-extended/tmux/tmux_2.1.bb | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/tmux/tmux_1.6.bb
 create mode 100644 meta-oe/recipes-extended/tmux/tmux_2.1.bb

diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
deleted file mode 100644
index b4294d7..0000000
--- a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Terminal multiplexer"
-HOMEPAGE = "http://tmux.sourceforge.net"
-SECTION = "console/utils"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=8685b4455330a940fab1ff451aa941a0"
-
-DEPENDS = "ncurses libevent"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/tmux/${BP}.tar.gz"
-SRC_URI[md5sum] = "3e37db24aa596bf108a0442a81c845b3"
-SRC_URI[sha256sum] = "faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc5967c56881a7efbd6"
-
-inherit autotools pkgconfig
-
-do_configure_prepend () {
-    sed -i -e 's:-I/usr/local/include::' ${S}/Makefile.am || bb_fatal "sed failed"
-}
diff --git a/meta-oe/recipes-extended/tmux/tmux_2.1.bb b/meta-oe/recipes-extended/tmux/tmux_2.1.bb
new file mode 100644
index 0000000..6e2c88d
--- /dev/null
+++ b/meta-oe/recipes-extended/tmux/tmux_2.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Terminal multiplexer"
+HOMEPAGE = "http://tmux.sourceforge.net"
+SECTION = "console/utils"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=8685b4455330a940fab1ff451aa941a0"
+
+DEPENDS = "ncurses libevent"
+
+
+SRC_URI = "git://github.com/tmux/tmux.git;branch=master"
+SRCREV ?= "310f0a960ca64fa3809545badc629c0c166c6cd2"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+inherit autotools pkgconfig
-- 
2.6.2.11.gb05c2f9


