Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCr9F-0004iS-9X
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 13:34:41 +0200
Received: by wgbdr12 with SMTP id dr12so773159wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 04:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=moTyo9mavp4yQMReru+mPr+LQgAhRrRu0znRHoJsnrY=;
	b=li+cLE4Q3YtwRAdi5LxdxxcQLXzIUCOwvuKy8ND2rN2FiBNmtzUZXsjGvAkFYXe4ID
	9wHEJsJQwRbOlqPzKtUQad0hKRqC7M0SPGRERgZvPLpTXg3/XqJ2dW5RYz6vyo0wHKl9
	H05gT0v+qjl+QfYhutH9skgYJm7o2V6FeOCaMntPJokk+g6bKN3S3ypYvwJygKc2vPzJ
	l0LHBIno2wu3oNRMVSdLwZIB2ApgqgvEzPh43NIzepPsysLhl/CNLN/zSuhHCywZ0WvO
	NjMCcjbjeBRu8FZ0Kyb7AC6yuNQR0/pMcYzcVSfdZhpiHc4xvqucfhbUkfKTxCZCbJAt
	O7tw==
Received: by 10.180.91.165 with SMTP id cf5mr6257268wib.2.1332933939506;
	Wed, 28 Mar 2012 04:25:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm12290429wiw.1.2012.03.28.04.25.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 04:25:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 13:25:24 +0200
Message-Id: <04e98d4774347eb56ef6ddc0078adbcc5192e254.1332933826.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <5a7fc35885c7f07840731881c5e07b5c68299838.1332933826.git.Martin.Jansa@gmail.com>
References: <cover.1332933826.git.Martin.Jansa@gmail.com>
	<5a7fc35885c7f07840731881c5e07b5c68299838.1332933826.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332933826.git.Martin.Jansa@gmail.com>
References: <cover.1332933826.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] keymaps: import systemd support from meta-shr layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 11:34:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-bsp/keymaps/keymaps/keymaps.service    |    9 +++++++++
 meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend   |    8 ++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service
 create mode 100644 meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend

diff --git a/meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service b/meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service
new file mode 100644
index 0000000..414ad0c
--- /dev/null
+++ b/meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Loads custom keymap if available
+ConditionPathExists=/etc/keymap-2.6.map
+
+[Service]
+ExecStart=/usr/bin/loadkeys /etc/keymap-2.6.map
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend b/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
new file mode 100644
index 0000000..b144e9f
--- /dev/null
+++ b/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -0,0 +1,8 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+PRINC := "${@int(PRINC) + 4}"
+
+SRC_URI += " file://keymaps.service"
+
+inherit systemd
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.service"
-- 
1.7.8.5



