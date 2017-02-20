Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A863371E52
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 19:16:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1KJGqid019731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 20 Feb 2017 11:16:52 -0800
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Feb 2017 11:16:51 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Feb 2017 14:16:14 -0500
Message-ID: <1487618174-3842-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CA+chaQfUYBZUrPMgTqGy_8N-pbPJqJ3nN=pEG3aqMQBvH6axWA@mail.gmail.com>
References: <CA+chaQfUYBZUrPMgTqGy_8N-pbPJqJ3nN=pEG3aqMQBvH6axWA@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH] florence: add explicit dependency on gconf-native to fix install error
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
X-List-Received-Date: Mon, 20 Feb 2017 19:16:55 -0000
Content-Type: text/plain

We currently see:

  | /bin/bash: gconftool-2: command not found
  | Makefile:841: recipe for target 'install-data-local' failed
  | make[3]: *** [install-data-local] Error 127

Presumably this now happens more regularly with demise of the shared
sysroot.  Adding gconf-native to the dependency list fixes it.

Cc: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta-gnome/recipes-support/florence/florence_0.5.4.bb b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
index dfdb6bdb8c4d..8ce85c9670fe 100644
--- a/meta-gnome/recipes-support/florence/florence_0.5.4.bb
+++ b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 PR = "r1"
 
-DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native gnome-doc-utils libnotify gstreamer"
+DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf gconf-native cairo intltool-native gnome-doc-utils libnotify gstreamer"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/florence/florence/${PV}-gtk2/florence-${PV}.tar.bz2 \
            file://fix-no-atspi-compile.patch"
-- 
2.7.4


