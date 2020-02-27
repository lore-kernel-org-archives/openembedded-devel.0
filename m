Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 9721361125
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=2355; q=dns/txt; s=axis-central1;
	t=1582764384; x=1614300384;
	h=from:to:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=eXRc1GWjvinrAywjCnW88DmmNaO/FUvsjY4H/FX3w94=;
	b=TLil+wOmCmQv1RQy2EV55Cb11T5PJGIjBwgSfydGr4Vtdsl0yHbEoWOQ
	odPZP0HUKSwYnnxkIzpd2nP8E94bs02lhUNjU01kFpzJ1wZPRis7+/jGI
	vTAcSwtChuwTKvLAyJYB+PcsGfkeNiDbfHspI9FwzOkDWDnP2uEe74tcR
	EOFOK0Q5bz58JI5PYoI0bN0IUKfB6Evn9030fB1SXcdyNWpKaBNABwfoa
	33GzVZHwhLgdgDyfs3MGonxtPaMRTnoex14/2n4ctCDlXZo4yirPjaSW2
	qnvV2uCI8NICgV027yNCtRekxYg6SNfK2qeZdQe73wj/rK6KKbUt0V+Zq A==;
IronPort-SDR: H+G0gK4QX4IH+Q8rA89EEw1N3bUleNb1c6HgvjH9FfTwMKTVpq1rMD5KmHE8cbUirSPl8wOxKE
	F3AdTptXQwGpIpXJ7W/YqbMLCpREA1saX4ULAOV4zR+yeNc2VhEORVcodMiMBGWGM0lq3D7/sc
	herxWw4S/VnGE86lIeSPCxUsXdBmkkjfOP/d+1CqGyOcIRZQFNU1gpVYayvQX3ezB+2DTvof3r
	2KZyrS/hhdAl5fts/4b6D2dbo4L8rD5x4bwz/XoCSFKsLhNzOa9GKYSaUZzg5duUfcxfpo07I+
	/R4=
X-IronPort-AV: E=Sophos;i="5.70,490,1574118000"; 
   d="scan'208";a="5868483"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2020 01:46:19 +0100
Message-ID: <20200227004619.16908-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [meta-oe][zeus][PATCH] lvm2, libdevmapper: Do not patch configure
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
X-List-Received-Date: Thu, 27 Feb 2020 00:46:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since the do_configure task regenerates the configure scripte, there is
no need to patch it. Actually doing so will cause problems, which can be
seen by doing:

  bitbake lvm2 -c configure
  bitbake lvm2 -c patch -f

Reported-by: Andrey Zhizhikin <andrey.z@gmail.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...gure-Fix-setting-of-CLDFLAGS-default.patch | 34 +------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch b/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
index 07cb88ffb..91ab239f3 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
@@ -4,44 +4,12 @@ Date: Mon, 19 Aug 2019 14:54:43 +0200
 Subject: [PATCH] configure: Fix setting of CLDFLAGS default
 
 ---
- configure    | 6 +++---
  configure.ac | 6 +++---
- 2 files changed, 6 insertions(+), 6 deletions(-)
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 Upstream-Status: Backport [https://sourceware.org/git/?p=lvm2.git;a=commit;h=4a3e707402032788e09282e0f54fdf82c8a0f8fc]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 
-diff --git a/configure b/configure
-index ff3a59b6b..4c8476502 100755
---- a/configure
-+++ b/configure
-@@ -3077,7 +3077,7 @@ if test -z "$CFLAGS"; then :
- fi
- case "$host_os" in
- 	linux*)
--		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"} -Wl,--version-script,.export.sym"
-+		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"} -Wl,--version-script,.export.sym"
- 		# equivalent to -rdynamic
- 		ELDFLAGS="-Wl,--export-dynamic"
- 		# FIXME Generate list and use --dynamic-list=.dlopen.sym
-@@ -3098,7 +3098,7 @@ case "$host_os" in
- 		;;
- 	darwin*)
- 		CFLAGS="$CFLAGS -no-cpp-precomp -fno-common"
--		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
-+		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
- 		ELDFLAGS=
- 		CLDWHOLEARCHIVE="-all_load"
- 		CLDNOWHOLEARCHIVE=
-@@ -3111,7 +3111,7 @@ case "$host_os" in
- 		BLKDEACTIVATE=no
- 		;;
- 	*)
--		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
-+		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
- 		;;
- esac
- 
 diff --git a/configure.ac b/configure.ac
 index 5da694631..830edb8da 100644
 --- a/configure.ac
-- 
2.21.1


