Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id C9DC16A9D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:21 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so4558218eaj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=+678BF123qCXqGJJvKH0igbYSyD1OiGNc6M1QKknKFo=;
	b=qLSvC5ETPVgdWnBTsvsYJ7UQdb/FqWCpN9UhLUFToUEShLEiuEobJGY//8ZZPUKxzn
	hVr4env8Joydwa4OYAOdZlEdFueFVPGL1U4a1OO2K+HV2FG4Bd/eLNbhqgM76c8kjpPq
	l8JtzzLL3BGuv03Qm/naX8ffyRecNNispJ8Wd5o1CzwNJOEygBm8ae5M0rBjVYfwlxrK
	rD4BKdsoIIsPSCB2/D71CXtJEsOmsAmnBZwty3+3LgcO0WIvh4t5hi3kNpmHvTOZjLYQ
	9f8/4jSMzFnq7PSFybTCthfYqD17/LFe0gaKgfQ+27GkrQuzi22qowLiLYA7WMkXRG9W
	g1wA==
X-Received: by 10.14.7.133 with SMTP id 5mr14670560eep.115.1370929042517;
	Mon, 10 Jun 2013 22:37:22 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:26 +0200
Message-Id: <1370928876-14423-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 05/15] xfce4-xkb-plugin: update to 0.7.0 tarball
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...xkb-plugin_git.bb => xfce4-xkb-plugin_0.7.0.bb} |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_git.bb => xfce4-xkb-plugin_0.7.0.bb} (63%)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_git.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
similarity index 63%
rename from meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_git.bb
rename to meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
index a1f1a2f..d27e4cd 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
@@ -6,17 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
 
-DEPENDS += "libxklavier libwnck librsvg garcon"
-
-PV = "0.5.4.3+gitr${SRCPV}"
+SRC_URI[md5sum] = "7fbc3d8c84d6662d819dd1803f0fee34"
+SRC_URI[sha256sum] = "28367c309863581ae4de529b35bdedf5a1c918096a9a2e6e771554cba7bf5a6a"
 
-SRC_URI = "git://git.xfce.org/panel-plugins/xfce4-xkb-plugin;protocol=git;branch=master"
-SRCREV = "b98b82d8522842e38a6355f9144f8348a6ab2aeb"
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-    NOCONFIGURE=yes ./autogen.sh
-}
+DEPENDS += "libxklavier libwnck librsvg garcon"
 
 FILES_${PN} += "${datadir}/xfce4/xkb"
 
-- 
1.7.6.5


