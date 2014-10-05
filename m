Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 20F087054E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Oct 2014 21:19:58 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x13so5089466wgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Oct 2014 14:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0yuhQOL0kG94PaZ/q8ss1A+3jtNVcf3ZAlbIbEumQGo=;
	b=wLXNadWEGvY6EL9j9c8ba+tY9WGrRWVBAXOaR/sZQptLqn4zhk8azjOfEDIOOJ2KVd
	ErmGFOeGhBr9QKHvhtQuK8WsQ1Tg2F0k28EFioDzCFspIAMVDu792H6o1vvfCe13vZu7
	weYzbKNShBqkqMt4q54dV0eAtB4sIGHpY0HVLL1c3kh/zKlN7qeoQpXOY6VWX8DASmla
	sRcdoQqP1fcfGy14YHEw+2MooRATbzPTukvRV1GRP8wCGiOd0fDwnLkVMWztkW7SREnN
	M2+Y3XuLftkKguS7/iaZJjxLo6H4oRPy31Dak8myBBNh1i6VO0GRl5kaq5sJOwqQzc8Y
	6xMQ==
X-Received: by 10.194.205.102 with SMTP id lf6mr5699399wjc.112.1412543998474; 
	Sun, 05 Oct 2014 14:19:58 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host113-12-dynamic.16-79-r.retail.telecomitalia.it. [79.16.12.113])
	by mx.google.com with ESMTPSA id eg8sm9160381wib.15.2014.10.05.14.19.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Oct 2014 14:19:57 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Oct 2014 23:19:53 +0200
Message-Id: <1412543993-30871-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] encdec-updater: remove COMPATIBLE_MACHINE
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
X-List-Received-Date: Sun, 05 Oct 2014 21:20:08 -0000

The recipe is using BBCLASSEXTEND = "native" and as it is not buildable:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'encdec-updater-native'
 (but /oe/meta-handheld/recipes-bsp/zaurus-utils/zaurus-updater.bb
  DEPENDS on or otherwise requires it)
ERROR: encdec-updater-native was skipped: incompatible with machine poodle
 (not in COMPATIBLE_MACHINE)
ERROR: Required build target 'zaurus-installer' has no buildable providers.
Missing or unbuildable dependency chain was:
 ['zaurus-installer', 'zaurus-updater', 'encdec-updater-native']

Remove COMPAIBLE_MACHINE alltogether.
While there, remove PR remnant.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/zaurus-utils/encdec-updater.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/recipes-bsp/zaurus-utils/encdec-updater.bb b/recipes-bsp/zaurus-utils/encdec-updater.bb
index 1ee2e77..138cd26 100644
--- a/recipes-bsp/zaurus-utils/encdec-updater.bb
+++ b/recipes-bsp/zaurus-utils/encdec-updater.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "A tool to encode and decode the Sharp Zaurus updater.sh script"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://encsh.c;endline=15;md5=d73360c98c2885be19245f2a8c728f38"
-PR = "r2"
 
 SRC_URI = "http://distro.ibiblio.org/pub/linux/distributions/pdaxrom/download/1.1.0beta4/src/survive-1.1.0.tar.bz2"
 
@@ -21,6 +20,3 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native"
-
-COMPATIBLE_MACHINE = "(poodle|c7x0|spitz|akita|tosa)"
-
-- 
1.9.1


