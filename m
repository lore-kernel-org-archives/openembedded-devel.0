Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S2Law-0005QU-Io
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 12:51:50 +0100
Received: by eaae1 with SMTP id e1so835778eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 03:43:23 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.37.7 as permitted sender) client-ip=10.14.37.7;
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.37.7 as permitted
	sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.37.7])
	by 10.14.37.7 with SMTP id x7mr10446309eea.90.1330429403045 (num_hops =
	1); Tue, 28 Feb 2012 03:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=Jru8Bk+lyugIn5Dc/1fBxvlfyxWTKaM+RqAtJH6DEr8=;
	b=MM4oynXLOr7EMCy8v15ow2OmkGvuWRb6a8YmzQnKGkyXDor3vIh51t5o3zDDpvN75N
	WpXkRzjqWSV81Z1B5gdUbn6eM2UNxrBAmvT8dxmURaAgGWwSXwrMmpL20DiJwyQ938LS
	UVSDTOSOrCY00X0lJBeI1R3zZtSEAOMzbB438=
Received: by 10.14.37.7 with SMTP id x7mr7795576eea.90.1330429402938;
	Tue, 28 Feb 2012 03:43:22 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id r5sm57116123eef.6.2012.02.28.03.43.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 03:43:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 12:43:22 +0100
Message-Id: <1330429402-2946-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [meta-oe] gcc: same patches for all gccs with shared sources
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 11:51:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* different patching on same sources caused race contition [1]
* build tested from scratch

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/018296.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc        |    4 +++-
 meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb |    2 --
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index 82dd157..d1802b5 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 PV = "4.5"
-PR = "r45"
+PR = "r46"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
@@ -233,6 +233,8 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
        file://use-defaults.h-and-t-oe-in-B.patch \
        file://gcc-with-linker-hash-style.patch \
        file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
+       \
+       file://fortran-cross-compile-hack.patch \
        "
 
 # Language Overrides
diff --git a/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb b/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb
index a34ab40..e3b2d4e 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb
+++ b/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb
@@ -3,8 +3,6 @@ require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/gcc-configure-runtime.inc
 require recipes-devtools/gcc/gcc-package-runtime.inc
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
-
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions"
-- 
1.7.6.4



