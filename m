Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0EB7029C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 13:23:18 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so2831003wiv.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aQgMbvf3stGRjK3bD5e6ZsBpVnXk+nG0b3c8R2s5JCA=;
	b=uPE/OC9L6bc6acaQQVXdFfCONmPV0zMGpLS1wWUrbmVQgxVPvRefkl/LhgwVmCdOf6
	JMW9ZjDxZDHKw8CcsE8mrhXsCLeggkn6dfztSandlZz318g2WzV6U7P1sZJLKnAXETcf
	NsNFIRLJKQ5NJp0FCePYqXX+6bjU9VTtQcwZdMMAXGJE9hRGX0gaf9z7Ncf6Kst1bDnE
	PY9f/FGw1tQ92pulPHHnWfGPUOLSEKSJFEoUFzT0C3tww3q7CVbHKEjVb70o0VZDAgbb
	VWfKECFMLVl8KENbIczM7pBfeG5wjjBDsj7MGbAiX0rIC3qcNvuqxtEvsW6ARTDj76nw
	lPMw==
X-Received: by 10.180.211.19 with SMTP id my19mr23950657wic.2.1405862599657;
	Sun, 20 Jul 2014 06:23:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fw4sm30052630wib.19.2014.07.20.06.23.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 06:23:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 15:23:32 +0200
Message-Id: <1405862612-11271-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][PATCH] libxfce4ui: fix order of inherits
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
X-List-Received-Date: Sun, 20 Jul 2014 13:23:20 -0000

* we need gtk-doc before xfce-git, because gtk-doc needs configure.in or configure.ac
  and the repository contains only configure.ac.in which is transformed into
  configure.ac by autogen which is prepended to do_configure by xfce-git (so
  this .bbclass needs to appear in inherit after gtk-doc to prepend autogen.sh
  before gtkdocize call.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
index 0582412..6534f94 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
 
-inherit autotools gettext xfce xfce-git gtk-doc
+inherit autotools gettext gtk-doc xfce xfce-git
 
 SRC_URI = " \
     git://git.xfce.org/xfce/libxfce4ui;protocol=git \
-- 
2.0.0


