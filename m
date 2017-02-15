Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB2A71E14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 18:03:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1FI3Xuo010682
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Feb 2017 10:03:34 -0800 (PST)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Feb 2017 10:03:33 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Feb 2017 13:03:29 -0500
Message-ID: <1487181811-31445-2-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487181811-31445-1-git-send-email-paul.gortmaker@windriver.com>
References: <1487181811-31445-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] gstreamer: fix dependency issue and un-blacklist it
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
X-List-Received-Date: Wed, 15 Feb 2017 18:03:36 -0000
Content-Type: text/plain

In http://errors.yoctoproject.org/Errors/Details/130583/ we see the
following:

  /bin/bash: line 1: glib-mkenums: command not found
  /bin/bash: glib-genmarshal: command not found
  Makefile:1808: recipe for target 'gstenumtypes.h' failed
  make[2]: *** [gstenumtypes.h] Error 127

Most people don't see this because most hosts have these binaries
in /usr/bin -- e.g. libglib2.0-dev in Ubuntu provides them.

However, after making this change, we see the following in the
build for gstreamer:

./recipe-sysroot-native/usr/bin/glib-mkenums
./recipe-sysroot-native/usr/bin/glib-genmarshal

..and hence this change should resolve the above Yocto issue.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 .../recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb            | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
index fa80ddac74f0..5f97a20fd6c6 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
@@ -7,7 +7,7 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
-DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
+DEPENDS = "glib-2.0 libxml2 bison-native flex-native glib-2.0-native"
 
 PR = "r2"
 
@@ -51,5 +51,3 @@ RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-raw
 FILES_${PN} += " ${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dev += " ${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
 FILES_${PN}-dbg += " ${libdir}/gstreamer-0.10/.debug/ ${libexecdir}/gstreamer-0.10/.debug/"
-
-PNBLACKLIST[gstreamer] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130583/"
-- 
2.7.4


