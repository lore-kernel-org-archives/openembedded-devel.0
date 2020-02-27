Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3FF6116B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=2405; q=dns/txt; s=axis-central1;
	t=1582764536; x=1614300536;
	h=from:to:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=m5RO2KoKYyDvviao3E1XMYHfTXicbSDdvYbzKvrXjlQ=;
	b=ROUf18pZU0v+EIoS2RI3624hkvfbyS89LIeRmN9KN+d2sOGqCfwCjGVX
	ZXxD5savEOjoywBBXWhvbJoLSPb8MF5WsmFZkeduOxZspelmiNZ5oDh9h
	AfAw+VdFr9Z6RvguAE3YuuwFh1pwAVxp6u/vH7/f203Ljev7ayIAyYE6k
	JSO1QuY1wai3iDw52gwSX2z6N6KVfX/q5M/Ze9hHpBcOIp7GmHPTCZF+r
	Soevl64wSZeF1zZF/+gyFK5ZpSZ5wWVbUoB07WeWQ+3HD33IF1oknysd/
	nhgU4x5rRtEzH5tK5ZqEewpQ6q6Z/HjVyZPqx91bJfXLDuBHiS/bTEKWl A==;
IronPort-SDR: 1lQfWBWL9F9NFEQG4W3feg3iqFfxKIzyjBwILVLuIpy5/h7T00/UTLdEwDuuU0Yj4HdW+bbSIj
	1Ocbp2demlicDamL+yegTjmzsU7+bTOrBvmdTICKVsZN3tzNdjNrZPvHby0I4sjoiGn6K4q+fX
	+VLDB7fpRecB3mOTbHtU+muWryyWLZDkWdPUioyE2GtEnlr8KeeMw6TUEf2dpLHOzj6EDPPnPE
	/OULtAbHORGA4AVCaz/63d0gr78cKpJpXnJ+xlvpasMgCnhHOqKoBe8jRtpLiyUerXRQOaxOVK
	CZI=
X-IronPort-AV: E=Sophos;i="5.70,490,1574118000"; 
   d="scan'208";a="5868549"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2020 01:48:50 +0100
Message-ID: <20200227004850.23746-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [meta-oe][zeus][PATCHv2] lvm2, libdevmapper: Do not patch configure
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
X-List-Received-Date: Thu, 27 Feb 2020 00:48:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since the do_configure task regenerates the configure script, there is
no need to patch it. Actually doing so will cause problems, which can be
seen by doing:

  bitbake lvm2 -c configure
  bitbake lvm2 -c patch -f

Reported-by: Andrey Zhizhikin <andrey.z@gmail.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Corrcted a typo (scripte -> script).

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


