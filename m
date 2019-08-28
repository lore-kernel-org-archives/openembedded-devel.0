Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 20CE17ED8E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 17:15:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46JXSX6D04z3J
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:15:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567012541;
	bh=OEU7UIKpVmCiaeHYRI+R3Gv23/0fnn7lscFOafrgU7o=;
	h=From:To:Subject:Date:From;
	b=gCS+8buAvft1OK+Np2Z7NJBXfTx+bjoWQwkHhmg1P2a77GBFIFrX4H543ViSqGf3I
	n5OsWwOZuQ47aBmGmQ7k5SRSVo70h8GQVxLmzc18Jp3KpkM7SB1e7c71mrnaVf2eqc
	p0ERwiKYMMlLDKWKXIjbk6ymbARevkf3L8dAjTptqyvajcbGUEugIMPZlN25b/cjsa
	99r5pG8NovaJWLXqCNNEBngCL0B0ewOgFms+cHz58WoKFISYLGw8hpDRCCGc6qNea0
	/xJZjB9r+aMhGxh1F4jnlxDg5Hn0mcvjEmwkBDnNNsMFu7y8+oqN4a7B74h32/1n/k
	7VGcaZL+wq2HLEf+W512F373Vk4MxtZht5AAIAXwOvdJT8F+b8oiaG0h3Z3z0bjoc6
	ytUasmxalyYqlgDpo3R7y1RPb33PmNWDuIrmGzow19/PdxT+yRRxXBtMx9xqw5owxR
	U4gwloeLcjXXgRJe4qTuGRzKMkmbBEiZl03N36FIu7R+9FvQUh+Djy53ZL0S4JH49b
	7DdRIbud1iXBsXrAFwa8DunJMRbzfas+aFvMWGik/Ck77GNhQFc8FykEOX6/W977di
	Um6kZUfEECuyvQlFwm49V5vF2Y99YC2rqh+iQgfYOjkVFINApcEpkjc/W3bZqAIG8f
	acludGdIjoxV7+aCDeNF+f5g=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2019 20:15:38 +0300
Message-Id: <20190828171538.16160-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] Replace EXCLUDE_FROM_WORLD_libc-musl = "1" with COMPATIBLE_HOST_libc-musl = 'null'
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
X-List-Received-Date: Wed, 28 Aug 2019 17:15:41 -0000

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


