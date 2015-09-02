Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 99C1B7701C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 00:04:23 +0000 (UTC)
Received: by padhy1 with SMTP id hy1so11617807pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2015 17:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WNYAH0dmcNIfNBFaIxvSKwrvMaQB40jYon+/61UApL8=;
	b=M/ALQ18Q0XXZF4Eg/Ol4cQGQQ9PN+Mo42cy0wO6zuY4lABJQh1PjeCOChz3pEVJj7f
	AAdxjhFMa7jay4JRZAfOc9mAXG4HVf31qglD+TfjxnC0ZcmU1D21FXqOkd9IquBADcuS
	Z7RFHmo/2TLxM/hYGYnX8GXTBeLIXsv/XVhttyNrpCgYf7UMyLCOqBgIsFlv2b8CVotv
	dSzIxe9fMx3WQEOfmsUFHfM443HnqgZ2zx1ip3Fi+tNEJ9T2S47VJ8iIclp+xOqoD4dv
	jXPyu6aUZUnPOO8K6PIPDKaJs4RUcteqft/pGOmpPnbuSbpIonYa+t/J5MJvBYssmyKO
	EchQ==
X-Received: by 10.67.30.232 with SMTP id kh8mr51612452pad.36.1441152263344;
	Tue, 01 Sep 2015 17:04:23 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	sr4sm19569486pab.26.2015.09.01.17.04.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Sep 2015 17:04:22 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Sep 2015 17:04:20 -0700
Message-Id: <1441152260-9733-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH] iw: remove, this is now in oe-core
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
X-List-Received-Date: Wed, 02 Sep 2015 00:04:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 ....sh-don-t-use-git-describe-for-versioning.patch | 43 ----------------------
 meta-oe/recipes-connectivity/iw/iw_4.1.bb          | 23 ------------
 2 files changed, 66 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
 delete mode 100644 meta-oe/recipes-connectivity/iw/iw_4.1.bb

diff --git a/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
deleted file mode 100644
index e64dd0a..0000000
--- a/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 5310abba864cfe3a8b65af130729447604190b29 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 29 Nov 2011 17:03:27 +0100
-Subject: [PATCH] iw: version.sh: don't use git describe for versioning
-
-It will detect top-level git repositories like the Angstrom setup-scripts and break.
-
-Upstream-Status: Unknown
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- version.sh | 16 +---------------
- 1 file changed, 1 insertion(+), 15 deletions(-)
-
-diff --git a/version.sh b/version.sh
-index 11d124b..5d423c4 100755
---- a/version.sh
-+++ b/version.sh
-@@ -3,21 +3,7 @@
- VERSION="3.15"
- OUT="$1"
- 
--if [ -d .git ] && head=`git rev-parse --verify HEAD 2>/dev/null`; then
--	git update-index --refresh --unmerged > /dev/null
--	descr=$(git describe)
--
--	# on git builds check that the version number above
--	# is correct...
--	[ "${descr%%-*}" = "v$VERSION" ] || exit 2
--
--	v="${descr#v}"
--	if git diff-index --name-only HEAD | read dummy ; then
--		v="$v"-dirty
--	fi
--else
--	v="$VERSION"
--fi
-+v="$VERSION"
- 
- echo '#include "iw.h"' > "$OUT"
- echo "const char iw_version[] = \"$v\";" >> "$OUT"
--- 
-1.7.7.3
diff --git a/meta-oe/recipes-connectivity/iw/iw_4.1.bb b/meta-oe/recipes-connectivity/iw/iw_4.1.bb
deleted file mode 100644
index e1e7c12..0000000
--- a/meta-oe/recipes-connectivity/iw/iw_4.1.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "nl80211 based CLI configuration utility for wireless devices"
-DESCRIPTION = "iw is a new nl80211 based CLI configuration utility for \
-wireless devices. It supports almost all new drivers that have been added \
-to the kernel recently. "
-HOMEPAGE = "http://wireless.kernel.org/en/users/Documentation/iw"
-SECTION = "base"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
-
-DEPENDS = "libnl pkgconfig"
-
-SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
-           file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
-"
-
-SRC_URI[md5sum] = "68c282285c71c956069957e9ca10a6a7"
-SRC_URI[sha256sum] = "14bfc627b37f7f607e4ffa63a70ded15fa2ea85177f703cb17d7fe36f9c8f33d"
-
-EXTRA_OEMAKE = ""
-
-do_install() {
-    oe_runmake DESTDIR=${D} install
-}
-- 
2.2.1


