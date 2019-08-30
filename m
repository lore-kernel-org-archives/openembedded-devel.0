Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A9AA37F444
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 15:48:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46KkQb6khyz3J
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 17:48:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567180088;
	bh=OEU7UIKpVmCiaeHYRI+R3Gv23/0fnn7lscFOafrgU7o=;
	h=From:To:Subject:Date:From;
	b=iPKtptT9bWk8GBbdjip17ofuayEtQxxAXLcPRpGdnLYvt/pKElVTp/KBli5sXeZcu
	wrz/nA0mJaByF4i9MiaoUqHXdBaXrhOtSJ05MkLAcSqXxzzAgMTEJMu0wWCbf1MWlj
	UzqBzw56Y2rhYONyTKiKlpqPKx+9763kaNc3jbbgeQ3HGHhzwQJnyIKBLPo+9soHeo
	Eit91pqGyTvXZA+F386ZP3r5MUkYKE+hqLZY+hv5lfD+8aS5C4vKDOqxjX25Op0kkE
	8iVC0ts3uC57sxy/XotaN5XcYZVd3r0VqJS2i0TI7Q6cHeUk+eCuw3Zs/Vx/5Ralar
	IK84eVEcx6EFJ/wngU9VzRNcQT3JhFoI6Ywrh71qsLuOqYeJJF/wcreJl6IBp/BXqt
	9I6XWfJxPZMeETzjIRBsHpr14u88bYSywcH0r7RKTFqx+scbPVBgZK+H8ERRrEwuQJ
	rdNY83ACcK1xa+GO/AWYMhx5M5P0SMwiD6MPgYqVaUFZzLUal8PzsdyQNsKg/Sk2Rd
	fxQYZ7EDNJjqFUKb5hJhR/onA+htURcoKIE453Y2tR7rKFXWENSX3Ljfiril0QZBkF
	IfcykdFMa3oMursfKik3xbsdY8lDEqwWoRukCK0QR4GRDURWZwCXdEzA1UoAzl4Ns2
	bFaBOsAd0vjmjNduGB4BJq1w=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Aug 2019 18:48:07 +0300
Message-Id: <20190830154807.20768-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] meta-oe: Replace EXCLUDE_FROM_WORLD_libc-musl = "1" with COMPATIBLE_HOST_libc-musl = 'null'
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
X-List-Received-Date: Fri, 30 Aug 2019 15:48:07 -0000

This gives users a proper error message when trying to build
a known non-building package.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-kernel/crash/crash_7.2.6.bb                   | 2 +-
 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb | 2 +-
 meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb             | 2 +-
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb                       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.6.bb b/meta-oe/recipes-kernel/crash/crash_7.2.6.bb
index 0a7c384a7..770b99ff0 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.6.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.6.bb
@@ -117,4 +117,4 @@ RDEPENDS_${PN}_class-cross = ""
 ARM_INSTRUCTION_SET = "arm"
 
 # http://errors.yoctoproject.org/Errors/Details/186964/
-EXCLUDE_FROM_WORLD_libc-musl = "1"
+COMPATIBLE_HOST_libc-musl = 'null'
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
index 50dab8d16..051656b5a 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -43,4 +43,4 @@ do_install_append() {
 }
 
 # http://errors.yoctoproject.org/Errors/Details/186966/
-EXCLUDE_FROM_WORLD_libc-musl = "1"
+COMPATIBLE_HOST_libc-musl = 'null'
diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
index e6b9d6b5b..6b955dcfd 100644
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
@@ -19,4 +19,4 @@ do_configure_prepend () {
 }
 
 # http://errors.yoctoproject.org/Errors/Details/186961/
-EXCLUDE_FROM_WORLD_libc-musl = "1"
+COMPATIBLE_HOST_libc-musl = 'null'
diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index 09290909d..7e9971ea4 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -65,4 +65,4 @@ do_install () {
 RDEPENDS_${PN} +="bash"
 
 # http://errors.yoctoproject.org/Errors/Details/186956/
-EXCLUDE_FROM_WORLD_libc-musl = "1"
+COMPATIBLE_HOST_libc-musl = 'null'
-- 
2.17.1


