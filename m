Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 31E8660984
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 08:53:06 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id d41so1005537eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 01:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=Ba8UPYIMd23n20G0SkeawWT3d5ukfnhYFNHxIBJ0gss=;
	b=LMx8vFPfAvIUT11EiVbzsb/LGi97HSFA6wnvzBSFBUmGsY17vxZklamg6WkQhvmYNK
	hrGXiyq8PuElSrAaneCsFyr5nbrMAhbnp1JcPtSXr+9xkwbU6L03vLuQjZT0pEnk5m+7
	pJwxsYUwxadfOT4DUuavO7Q5oiCWwxVoTFFxfN8m6aSjixNtk87kyDeXymtnVqA67HuU
	5/w3I46QrZnXzcTmff//qnE2N1WDyA5c+b7SjXzcQNisR3rVFqo4nxzcKt+f7jTVTWww
	GmCXleAqdQGBfKN+j6uohyJWWzPdBMHj88wi65pInbsnanFPSM/G5wZaqol8itKA1cSo
	8nzA==
X-Received: by 10.14.181.131 with SMTP id l3mr16750938eem.16.1369212786098;
	Wed, 22 May 2013 01:53:06 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id s8sm8679868eeo.4.2013.05.22.01.53.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 22 May 2013 01:53:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2013 10:50:36 +0200
Message-Id: <1369212636-6760-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe/master/dylan] icon-slicer: fix native build by depending on gdk-pixbuf only
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
X-List-Received-Date: Wed, 22 May 2013 08:53:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| checking for GDK_PIXBUF... no
| configure: error: GTK+-2.0 is required to compile icon-slicer
<...>
ERROR: Task 2643 (virtual:native:/home/andreas/data/oe-core/sources/meta-openembedded/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb, do_configure) failed with exit code '1'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../icon-slicer/icon-slicer_0.3.bb                 |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
index b77fbf5..d6cfd35 100644
--- a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
+++ b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
@@ -1,8 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ popt"
-DEPENDS_class-native = "popt-native"
+DEPENDS = "gdk-pixbuf popt"
 
 SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Makefile.am-no-examples.patch"
-- 
1.7.6.5


