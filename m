Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6201D6B7CA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 11:14:05 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so6171132eaj.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 03:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ZbGkO5JtndjpcgsK4JTdocb+K2bXjN678pGgL4B60qg=;
	b=ir+myUJBFcoDLAZkFUF+PHXRXr2Iwla4JraNKv2ppPYegMnQ0pNJ7ldNbJatDT5MsW
	VC4zDwItFZaO+yZvSHK5Z/jS2u0cUdoaxIMX6Kaz9KLuhme99p0GEH3mzrdHX6Q4li+y
	Bbl/3+DAVA4D3xsWxvaOBGMArRNrXQE45fWipOXeahFJiMoxwrkZ9mwmsmWKYA/xS7PB
	IptLVmdKiTH2vp6uP08fVu3jXpCLKkSVdgPkvRqkRVod1H0ehaj2OpjFaFGelp1cXmDn
	UcG630jBT2TrCpz+eQ6c4NHLGNmK0PUM8e3YUFh+T0TsrH9TmeEb1NP61CMIuVqU9Dfj
	NNHA==
X-Received: by 10.14.209.129 with SMTP id s1mr79117420eeo.21.1388834046031;
	Sat, 04 Jan 2014 03:14:06 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	e43sm152660247eep.7.2014.01.04.03.14.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 03:14:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 12:13:58 +0100
Message-Id: <5383e63039e49e000d54c07313ac041d56638acc.1388833883.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-dylan][PATCH 2/9] rfkill: Fix build when WORKDIR is included in some git checkout
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
X-List-Received-Date: Sat, 04 Jan 2014 11:14:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../dont.call.git.rev-parse.on.parent.dir.patch    | 31 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb  |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/rfkill/rfkill/dont.call.git.rev-parse.on.parent.dir.patch

diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill/dont.call.git.rev-parse.on.parent.dir.patch b/meta-oe/recipes-connectivity/rfkill/rfkill/dont.call.git.rev-parse.on.parent.dir.patch
new file mode 100644
index 0000000..2b83689
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill/dont.call.git.rev-parse.on.parent.dir.patch
@@ -0,0 +1,31 @@
+When WORKDIR is included in some other git checkout, version.sh calls git rev-parse
+and it returns some description from that upper git checkout even when rfkill is
+being built from release tarball.
+
+When returned description doesn't match with expected v0.4, version.sh exits
+without creating version.c
+    # on git builds check that the version number above
+    # is correct...
+    [ "${descr%%-*}" = "v$VERSION" ] || exit 2
+
+and build fails a bit later:
+    | NOTE: make -j 32 -e MAKEFLAGS=
+    |  CC   rfkill.o
+    |  GEN  version.c
+    | make: *** [version.c] Error 2
+    | make: *** Waiting for unfinished jobs....
+    | ERROR: oe_runmake failed
+
+Don't try git rev-parse, if there isn't .git in ${S}.
+
+--- a/version.sh	2013-11-15 03:43:12.587744366 -0800
++++ b/version.sh	2013-11-15 03:42:40.699743320 -0800
+@@ -12,7 +12,7 @@
+ 
+ if test "x$SUFFIX" != 'x'; then
+ 	v="$VERSION$SUFFIX"
+-elif head=`git rev-parse --verify HEAD 2>/dev/null`; then
++elif test -d .git && head=`git rev-parse --verify HEAD 2>/dev/null`; then
+ 	git update-index --refresh --unmerged > /dev/null
+ 	descr=$(git describe 2>/dev/null || echo "v$VERSION")
+ 
diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
index f90736d..1c2930a 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c6036d0eb7edbfced28c4160e5d3fa94"
 PR = "r1"
 
 SRC_URI = "http://wireless.kernel.org/download/${PN}/${P}.tar.bz2 \
-           file://0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch"
+           file://0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch \
+           file://dont.call.git.rev-parse.on.parent.dir.patch"
 
 SRC_URI[md5sum] = "727892c0fb35c80ee3849fbe89b45350"
 SRC_URI[sha256sum] = "ca10e4827a5f0a36e093aee6ad81b5febf81f8097d7d858889ac51ff364168c1"
-- 
1.8.4.3


