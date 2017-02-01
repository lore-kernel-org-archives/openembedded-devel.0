Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 33D5071C69
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Feb 2017 19:24:05 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id c85so54205115wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2017 11:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MxgIaPwiKt0vHcqNYd4UBQcxMM41LYA2p86SOWWY0tg=;
	b=o6Kc/s9lpLFA+PFiJdIPrb3SXB1GD4FV3dGtZ0xEyyxYEksMf04Y8cDCbaljPnPlHc
	5sOqOD/3GfJvI9A9G3bHjKo12waeCaVm9WvBsEr8GO1Gm4CMBxeWhn2LZKDUYxB8QfON
	k4hu+ipkHTFD1l/hrx18b8EcaCQBZqYRitgNdjdlwLoxL/6GSg0GSKRdb50IBbYkYtms
	njAR6xRwakya8LSB+jP9t1+Pfd4kM/efl0Y4hl06PvovYbqpImiYQ3vtABTPPTp13T+v
	xkrAmXMYYzJfA7NweRo5tMirUhFwePjaIngzduwJ1L+8NwxHyfWR8c38KTppmRtz6K/M
	xe1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MxgIaPwiKt0vHcqNYd4UBQcxMM41LYA2p86SOWWY0tg=;
	b=XUEi5mxOfKRaJss6zaT6Q6qtJqjERnLL/I+dnXqeBNgjnOqqnzNxLU5XBQCk1jL3St
	V7hF7XIOWg1+rLp7nd1YvNO6p6srzh3CPt41Xr1KWgdw5/jUxSFBBZ30uP7Q/R+vm4Z3
	o2y+VMB2UVs24LpgtjApcZjA02T1681K0NafDE/o7CKWriEDpUZshK5CRXuqe13qzgju
	iFs5hbVJW2nRD9dKWzDUoUJXutovGuT7eAVkbu+cGF0gWnhn5U9v9q5k1lkCdjSrgQem
	hg2FDouvDkCD1ILYbiMatJJpX8h6sL7O1bKcAxMpeqSsvfMDnPvXml5Wz+49G3CGqh2J
	SPyQ==
X-Gm-Message-State: AIkVDXKpOBIZIH2URlbCXKf8PDi5YGj8DfcLm9jyvzVG/BXzpax/cGk0VC7vCup7nSRVOA==
X-Received: by 10.28.54.226 with SMTP id y95mr4245605wmh.105.1485977045734;
	Wed, 01 Feb 2017 11:24:05 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l140sm31228788wmg.12.2017.02.01.11.24.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 11:24:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Feb 2017 20:24:04 +0100
Message-Id: <20170201192404.17646-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH][meta-browser] firefox*: add missing dependencies on zip-native and unzip-native
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
X-List-Received-Date: Wed, 01 Feb 2017 19:24:06 -0000

* with RSS it fails, causing many failures in last "bitbake world"
  report

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-mozilla/firefox-addon/firefox-addon-webconverger_git.bb | 2 ++
 recipes-mozilla/firefox-l10n/firefox-l10n.inc                   | 2 +-
 recipes-mozilla/firefox/firefox_45.6.0esr.bb                    | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-mozilla/firefox-addon/firefox-addon-webconverger_git.bb b/recipes-mozilla/firefox-addon/firefox-addon-webconverger_git.bb
index b1c9bc4..0164755 100644
--- a/recipes-mozilla/firefox-addon/firefox-addon-webconverger_git.bb
+++ b/recipes-mozilla/firefox-addon/firefox-addon-webconverger_git.bb
@@ -3,6 +3,8 @@
 
 require firefox-addon.inc
 
+DEPENDS += "zip-native"
+
 PV = "20120228"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n.inc b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
index 95c939a..1be15ba 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n.inc
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
@@ -1,7 +1,7 @@
 # Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
-DEPENDS = "mozilla-devscripts-native"
+DEPENDS = "mozilla-devscripts-native unzip-native zip-native"
 # drop to keep allarch
 # RDEPENDS_${PN} = "firefox"
 
diff --git a/recipes-mozilla/firefox/firefox_45.6.0esr.bb b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
index 31b3353..1e3a126 100644
--- a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
@@ -3,7 +3,7 @@
 
 DESCRIPTION ?= "Browser made by mozilla"
 DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx \
-            virtual/libgl nss nspr pulseaudio yasm-native icu"
+            virtual/libgl nss nspr pulseaudio yasm-native icu unzip-native"
 
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=f7e14664a6dca6a06efe93d70f711c0e"
-- 
2.10.2


