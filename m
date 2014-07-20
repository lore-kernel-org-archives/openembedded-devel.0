Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 59F6160438
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 04:08:21 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hy4so9816929vcb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jul 2014 21:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WKqVOxYMOpKZuwtwuxiXWNv3/H0gQcGh4Z2vzNNdCtI=;
	b=rNSB8YFpwK6sS9gxsXPnsaiJEgV3UhmfbZglGkPQCRlcupODPcgS5/Wpy9NIMWcRsQ
	JgWvMllIZoxayk0A26qTGIDv5dYEKIDYHYMH83REl9bmeKSBPE3dJ9OBbIYXqjijqYfN
	VIINhGAcQSUYIRfqezN/OcOLT9PrHyTuaGlFLhxbW7PlnSXsczipHrFoAE/opp8H9a0Q
	w4cNbaYytPINOHE2eMUEL1FOPug3hzjx53yD9k/QOiQkxc14NFgIvbxOxxj26RnkV32c
	87EZYwtjO7fnygFKOWfIl+//m2F5zDFpaudQl5wzfOoxJgVHVH9dmATXadiQAs/7XmAH
	wV4A==
X-Received: by 10.52.38.105 with SMTP id f9mr14914106vdk.17.1405829302743;
	Sat, 19 Jul 2014 21:08:22 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id n7sm2868785ven.1.2014.07.19.21.08.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jul 2014 21:08:21 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jul 2014 21:07:39 -0700
Message-Id: <1405829260-13293-4-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
References: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
Subject: [meta-multimedia][PATCH 3/4] vlc: modules/gui/qt4/Modules.am not B!=S friendly
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
X-List-Received-Date: Sun, 20 Jul 2014 04:08:22 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../vlc/0004-modules-gui-qt4-out-of-tree-build.patch    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch
new file mode 100644
index 0000000..3dadb23
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch
@@ -0,0 +1,17 @@
+* modules/gui/qt4/Modules.am not B!=S friendly
+* Simple solution to missing directories in ${B}
+
+Upstream status: Pending
+
+Index: vlc-2.1.4/modules/gui/qt4/Modules.am
+===================================================================
+--- vlc-2.1.4.orig/modules/gui/qt4/Modules.am
++++ vlc-2.1.4/modules/gui/qt4/Modules.am
+@@ -261,6 +261,7 @@ else
+ if HAVE_WIN32
+ 	$(moc_verbose)$(MOC) -D_WIN32 $(DEFS) -I$(top_srcdir)/include -I$(top_builddir)/include -I$(top_builddir) $(CPPFLAGS_qt4) -o $@ $<
+ else
++	[ -d $(dir $@) ] || mkdir -p $(dir $@)
+ 	$(moc_verbose)$(MOC) $(DEFS) -I$(top_srcdir)/include -I$(top_builddir)/include -I$(top_builddir) $(CPPFLAGS_qt4) -o $@ $<
+ endif
+ endif
-- 
1.9.3


