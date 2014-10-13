Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDD46A362
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 05:02:28 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id ft15so5059588pdb.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 22:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=azTZO5J1U+MS2tpsARQj8K0rgkfMOj5nIDiIOwn0ulE=;
	b=Ry9Hs2vAFpNS11hyfuVnBvDWrF8dyhNznl9u8sXdsvCmluIRDU73xXy4EwtNXaWxxq
	FISaGOvzVRK9iif5qgpU56/7a5nstHUXZAco+SmVmcqwfsiOR9SPd43iz2JWvhvy7ql8
	Bj6HuheHjpuoivCGp8gEn/zrAdxHDo4RoSzyZlh11KR9WjwFSasaUZR7UUTBOOhbIDNI
	Kvxz2wYspvM8sCyFZX0c5IgQd1dK12pPrP0J/LEQo7Q0Ku4ysL5F1Bw0M4BRNgjgWRwO
	Oe6FjCds5FoOLaV/uSD571NXzGqayJMCcR1yxvv19puzUQerRQV5v7jzf1+HUjk3PH8B
	kT0g==
X-Received: by 10.66.158.165 with SMTP id wv5mr21511877pab.36.1413176550482;
	Sun, 12 Oct 2014 22:02:30 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ic3sm8985045pbc.26.2014.10.12.22.02.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Oct 2014 22:02:29 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Oct 2014 22:02:22 -0700
Message-Id: <1413176542-20885-2-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1413176542-20885-1-git-send-email-TicoTimo@gmail.com>
References: <1413176542-20885-1-git-send-email-TicoTimo@gmail.com>
Subject: [meta-python][PATCH 2/2] python-matplotlib: add dateutil & pytz to DEPENDS/RDEPENDS
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
X-List-Received-Date: Mon, 13 Oct 2014 05:02:29 -0000

python-matplotlib is currently providing its own dateutil and pytz
Add dateutil and pytz as DEPENDS/RDEPENDS.
Patch setupext.py to no longer provide its own dateutil and pytz.
Remove python-matplotlib from blacklist.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../python/python-matplotlib/fix_setupext.patch       | 19 +++++++++++++++----
 .../python/python-matplotlib_1.1.0.bb                 |  7 ++-----
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch b/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
index e071595..9a13a18 100644
--- a/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
+++ b/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
@@ -1,9 +1,20 @@
 This fixes the numpy import problem in setupext.py using a hard-coded path.
 
-diff --git a/setupext.py b/setupext.py
-index 962cedc..82297c4 100644
---- a/setupext.py
-+++ b/setupext.py
+Index: matplotlib-1.1.0/setupext.py
+===================================================================
+--- matplotlib-1.1.0.orig/setupext.py
++++ matplotlib-1.1.0/setupext.py
+@@ -122,8 +122,8 @@ numpy_inc_dirs = []
+ # matplotlib build options, which can be altered using setup.cfg
+ options = {'display_status': True,
+            'verbose': False,
+-           'provide_pytz': 'auto',
+-           'provide_dateutil': 'auto',
++           'provide_pytz': False,
++           'provide_dateutil': False,
+            'build_agg': True,
+            'build_gtk': 'auto',
+            'build_gtkagg': 'auto',
 @@ -176,10 +176,7 @@ if os.path.exists(setup_cfg):
      except: pass
  
diff --git a/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb b/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
index 6c8a202..69f71c7 100644
--- a/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
@@ -4,11 +4,8 @@ LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://README.txt;md5=83c5bf8b16a5f99507f2f47a21ae3b81"
 PR = "r1"
 
-DEPENDS += "python-numpy freetype libpng"
-RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng"
-
-PNBLACKLIST[python-matplotlib] = "CONFLICT: 34 files with python-dateutil"
-# e.g. sysroots/qemux86-64/usr/lib/python2.7/site-packages/dateutil/tzwin.pyc
+DEPENDS += "python-numpy freetype libpng python-dateutil python-pytz"
+RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng python-dateutil python-pytz"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/matplotlib/matplotlib-${PV}.tar.gz \
            file://fix_setup.patch \
-- 
1.9.3


