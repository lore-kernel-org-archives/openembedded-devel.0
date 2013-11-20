Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5DCC36DB95
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 22:15:38 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so2789643ead.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 14:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GXm0yEgJapRFWOvNVQtRzYcHj0hEM/pA4rN/zBMp+lQ=;
	b=KaItp7j+z0y0L5VZrOd1QVo3HyCMXkSBisSDQKGc4PmXChVpTiyF4D09gDABJ+ZXA7
	mPaCQCVuHhPAreggt6IAvT0duFrhdnmBEUbZ+ZIyvH2SgKcJTxnEA6mb5HuJruE3TTYb
	ZYRxZ6Nh/VD/LHhBcQrsaUHd7sWR/Efephil+QgTrkHCvK5Kzp5o6MXEc9B8W+NTFQWp
	NE6rnCoyY58t+LcFs6OmDTrtKg1ibKM8PwUFYJm2vQ6iqLD6GarRjCwLLDffmpoeEKzv
	Zlz4yCKTEDEiV5hL0/Mi3LDpXj1NfhtE7rVo8PsNbgjPzha1Cj8ViEMihZgXSidh4dFb
	f2mA==
X-Received: by 10.14.122.196 with SMTP id t44mr858eeh.119.1384985739548;
	Wed, 20 Nov 2013 14:15:39 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o45sm46020360eep.2.2013.11.20.14.15.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 14:15:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Nov 2013 23:15:38 +0100
Message-Id: <1384985738-31057-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-oe][meta-efl][PATCH] meta-oe, meta-efl: Restore few MIRROR variables
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
X-List-Received-Date: Wed, 20 Nov 2013 22:15:39 -0000

* these were correctly removed from oe-core in
  commit 3b333896c71689c664475d53daed52404bf6b21b
  Author: Phil Blundell <pb@pbcl.net>
  Date:   Thu Nov 14 18:15:46 2013 +0000

    bitbake.conf: Remove obsolete/unused MIRROR cruft
  but we still need them here, so add them to layer.conf

* FREESMARTPHONE_GIT is used by 4 recipes in meta-oe and a lot more in meta-fso (which depends on meta-oe)
  meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb:SRC_URI = "${FREESMARTPHONE_GIT}/vala-dbus-binding-tool.git;branch=master"
  meta-oe/recipes-support/serial-utils/pty-forward-native.bb:SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia"
  meta-oe/recipes-support/serial-utils/serial-forward_git.bb:SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia"
  meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;branch=master"

* E_MIRROR/E_SVN are used in many recipes in meta-efl, even with
  upstream moveing to git, not all components are already in git
  and for distros with populated PREMIRROR these variables are still
  important to parse the recipes.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/conf/layer.conf | 3 +++
 meta-oe/conf/layer.conf  | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
index 272fc04..fb9a7ce 100644
--- a/meta-efl/conf/layer.conf
+++ b/meta-efl/conf/layer.conf
@@ -7,3 +7,6 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 BBFILE_COLLECTIONS += "efl-layer"
 BBFILE_PATTERN_efl-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_efl-layer = "7"
+
+E_MIRROR = "http://download.enlightenment.org/releases"
+E_SVN = "svn://svn.enlightenment.org/svn/e"
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index bd7eceb..393b4e6 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -37,3 +37,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   usb-modeswitch-data->usb-modeswitch \
 "
+
+FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
-- 
1.8.4.3


