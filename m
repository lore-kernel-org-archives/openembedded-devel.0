Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1817460782
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:38 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so4306971pdi.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XVUQkxo+YfxdL4a4oW/VgIiyJrAXuYZEtNBB7SiPVEQ=;
	b=H4IrktDr7ZYk6hfvp+G1XYpxIy4b9QWogL3kQHZhR2khp26tQ37GeDsIgyU04jyTen
	nMCn9jEnUN3M1Rdy4vKYXHidEana0d2XoDTi6to2CBbvNmryz23gXCClVjQiLQcd7ni/
	oP2jrVmddSlvk8mYiqvCjmvA4mdYiTVORzz56WpW6ddGPyeCk+5j/cFRi6z/H8KCjRlF
	PI8xqLTwgtxnmxhlpPlYT7Ai1UgUMHvIXvB8YXfJJt1qXVTiRzpBnFlS3KZo2US9vBXK
	yEFyTyNIkfQSjoUA9D2FvFItNSeHLWzQq+aYiu2v0JADLUC0+6t+jugn11mJZlS4zCkV
	u9EQ==
X-Received: by 10.66.189.226 with SMTP id gl2mr16076103pac.65.1398544359980;
	Sat, 26 Apr 2014 13:32:39 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:24 -0700
Message-Id: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 01/21] debianutils: Upgrade to 4.4
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:41 -0000

License is changed since readlink is dropped
from package which was sole package licensed under BSD

Additionally fix  B != S build too

Below is the diff of license change

--- 2.30-r1/debianutils-2.30/debian/copyright   2007-11-12
08:24:24.000000000 -0800
+++ 4.4-r0/debianutils-4.4/debian/copyright     2013-07-27
18:30:26.000000000 -0700
@@ -4,15 +4,12 @@
 Guy Maor <maor@debian.org>, and are now maintained by Clint Adams
 <schizo@debian.org>.

-All its programs except readlink, savelog, and which may be
+All its programs except savelog, and which may be
 redistributed under the terms of the GNU GPL, Version 2 or later,
 found on Debian systems in the file /usr/share/common-licenses/GPL.

 which is in the public domain.

-readlink is Copyright (c) 1997 Kenneth Stailey, and may also be
-distributed under the terms of the BSD copyright.
-
 savelog may be redistributed under the following terms: (The rest of
 this file consists of savelog's distribution terms.)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{debianutils_2.30.bb => debianutils_4.4.bb}            |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/debianutils/{debianutils_2.30.bb => debianutils_4.4.bb} (81%)

diff --git a/meta-oe/recipes-support/debianutils/debianutils_2.30.bb b/meta-oe/recipes-support/debianutils/debianutils_4.4.bb
similarity index 81%
rename from meta-oe/recipes-support/debianutils/debianutils_2.30.bb
rename to meta-oe/recipes-support/debianutils/debianutils_4.4.bb
index 624cf3c..30dd9a6 100644
--- a/meta-oe/recipes-support/debianutils/debianutils_2.30.bb
+++ b/meta-oe/recipes-support/debianutils/debianutils_4.4.bb
@@ -1,18 +1,16 @@
 SUMMARY = "Miscellaneous utilities specific to Debian"
 SECTION = "base"
-LICENSE = "GPLv2 & BSD & SMAIL_GPL"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=b948675029f79c64840e78881e91e1d4"
-
-PR = "r1"
+LICENSE = "GPLv2 & SMAIL_GPL"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.gz"
-SRC_URI[md5sum] = "7fdd5f8395162d8728d4b79e97b9819e"
-SRC_URI[sha256sum] = "d62e98fee5b1a758d83b62eed8d8bdec473677ff782fed89fc4ae3ba3f381401"
+SRC_URI[md5sum] = "c0cb076754d7f4eb1e3397d00916647f"
+SRC_URI[sha256sum] = "190850cdd6b5302e0a1ba1aaed1bc7074d67d3bd8d04c613f242f7145afa53a6"
 
 inherit autotools
 
 do_configure_prepend() {
-    sed -i -e 's:tempfile.1 which.1:which.1:g' Makefile.am
+    sed -i -e 's:tempfile.1 which.1:which.1:g' ${S}/Makefile.am
 }
 
 do_install_append() {
-- 
1.7.10.4


