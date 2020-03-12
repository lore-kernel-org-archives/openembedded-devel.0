Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7B461C21
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:40 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id l41so2003280pjb.1
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gQVKB0mqvUU0aew9tE3Jfql/AyOkVd7Y/2cIBqbtmTQ=;
	b=m3iUgS01ve1XCejHOo+Oa0lU/dwCyFC+JEDGrZlcNcOb+FD23MmteE1y2D8Wb0DX9N
	WFRRyUAyUUIgzefweHwxXKLRzdSTpCYq8qFOsZzJwIZlvgiavkkVyt8QTpQt/JCfrv0b
	WBjPAKNnOKRPbcrJOrgo9TiBfWX0WYyziX6gG5lsl9nnCh+DMb2m1v/ceNPoB4vxANS5
	L2WFmdBq9UqD6VcDpDUaC6DW9Te2992xG2ilgYR6DdY7nhvJ/oil8cuKSrPlBOrfe43K
	sf1bbHMTCyOE4uUuhVnh1HcIs/1uW2n8p3H6Wx4f+0olGsfibnx1bFOiFzKJcZktw+gv
	2gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gQVKB0mqvUU0aew9tE3Jfql/AyOkVd7Y/2cIBqbtmTQ=;
	b=YLGfgKaSo3wOGsYYeS9gMlO+AuXdBQU+1NjEI9fQRviahDNzb0Gca/yAHML+eHAvgr
	rzL+gAJDyrhsz5OJAbj6zjHX+2KQMk6tbxoX/hV+NxWtWtp6l1Ttlt0Y3JeVuvThTCcV
	4kpe8qZue2bLqUCw8W+ZsZocKgF6WoLDRJOqW+E+O7+0WMYL7oLFwXrmniRi91eAcW08
	uxw2sD3BBIFHiC2M1N2aPZQGzHa/UqtVP9hULcQhJc8UVbnOFTvsgVq1hGH4Kpq6ALUe
	gLjBtp21FPUyrVnCtrUvf9NDBFFTz/hvLVQCkqnA/LcARXiEiudYR0HiwclNhi5RS2/Z
	JrfA==
X-Gm-Message-State: ANhLgQ0krI84BGKhKFOkFHL/NXOErlce7actRAcrLAqvgQlRne+fWNCM
	R35o/VLpLnc85Zl40Vyp93bNuigE
X-Google-Smtp-Source: ADFU+vvVSSPrYWsUqaHchOr5IOmgSylI9UkjtJqOxOxRAmyS8+8SfZa35bNvFbjYWMHLweoqV2+PqA==
X-Received: by 2002:a17:90a:b111:: with SMTP id
	z17mr1858533pjq.115.1583981861293; 
	Wed, 11 Mar 2020 19:57:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.40
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:22 -0700
Message-Id: <3874e1681dc90ff5516fe2e5537387747b6b8928.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 03/13] lvm2, libdevmapper: Do not patch configure
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:40 -0000

From: Peter Kjellerstedt <pkj@axis.com>

Since the do_configure task regenerates the configure script, there is
no need to patch it. Actually doing so will cause problems, which can be
seen by doing:

  bitbake lvm2 -c configure
  bitbake lvm2 -c patch -f

Reported-by: Andrey Zhizhikin <andrey.z@gmail.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...gure-Fix-setting-of-CLDFLAGS-default.patch | 34 +------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch b/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
index 07cb88ffba..91ab239f37 100644
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
2.17.1


