Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2699872F08
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 19:17:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1KJHBXU027393
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Feb 2017 11:17:11 -0800 (PST)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Feb 2017 11:17:10 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Feb 2017 14:17:03 -0500
Message-ID: <1487618223-3895-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CA+chaQfUYBZUrPMgTqGy_8N-pbPJqJ3nN=pEG3aqMQBvH6axWA@mail.gmail.com>
References: <CA+chaQfUYBZUrPMgTqGy_8N-pbPJqJ3nN=pEG3aqMQBvH6axWA@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH] gthumb: fix implict dependency on gconf causing configure fail
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
X-List-Received-Date: Mon, 20 Feb 2017 19:17:12 -0000
Content-Type: text/plain

Currently we see:

  | checking for gconftool-2... no
  | configure: error: gconftool-2 executable not found in your path - should be installed with GConf
  | ERROR: Function failed: do_configure (log file is located at gthumb/2.12.4-r4/temp/log.do_configure.5243)
  ERROR: Task (meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb:do_configure) failed with exit code '1'

Presumably this now happens more regularly with demise of the shared
sysroot.  Adding gconf-native to the dependency list fixes it.

Cc: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 4a1313c544c2..62bbc5bd1ccb 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "gThumb is an image viewer and browser for the GNOME Desktop"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "gnome-common-native glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base intltool-native"
+DEPENDS = "gnome-common-native glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base intltool-native gconf-native"
 
 PR = "r4"
 
-- 
2.7.4


