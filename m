Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 88A866E630
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Sep 2015 03:47:24 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so91345237pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 20:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8CEsaTvVfw7+Ts9fwVY5NdaTnejp8Xc1uKPIBHVgVEM=;
	b=DZ9sM2JHZDdlqJ7c1ix+27NdAHdOeVH+JJOYdlpGrDfSrmyYrTFwXMcs9BWFpEyLX7
	b9V5lK/OgSZEqoVfGWE/oWcivzP/u7KvXA4asgIhStR/+ai/dsGRd9PN9gggH+AiXQz8
	ieF+J5l27XgahfOhcBoMXBD5AAPAB2iBLYVmqxvqCzsqGaVkRfQ0IgIrox2xn4z5rWlr
	TZC47MH1ZSS8NH/ueXl6BHx4+Wvo0kxBFb646RyjFn5mG6otSEh+VrhFY6Boxo0LokvL
	iAZpkafswjisb3zL0jAm5e096I7lrk9Lox0PkzY3vlSN3eVswbiPzAv4QXkwVwVtOJNx
	LyyA==
X-Received: by 10.68.221.198 with SMTP id qg6mr5108890pbc.147.1442029645321;
	Fri, 11 Sep 2015 20:47:25 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	qr5sm3060006pbb.26.2015.09.11.20.47.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Sep 2015 20:47:23 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Sep 2015 13:47:57 +1000
Message-Id: <1442029677-23554-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] nativesdk-qtbase: use fakeroot for do_generate_qt_environment_file
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
X-List-Received-Date: Sat, 12 Sep 2015 03:47:26 -0000

The do_generate_qt_environment_file task wasn't running in the fakeroot
environment so qt5.sh was not owned by root:root but the user running
the builds.

Fixes host-user-contaminated QA warning.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 69e2b3b..9c9d86f 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -248,7 +248,7 @@ do_install() {
     install -m 644 ${WORKDIR}/OEQt5Toolchain.cmake ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
 }
 
-do_generate_qt_environment_file() {
+fakeroot do_generate_qt_environment_file() {
     mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d/
     script=${D}${SDKPATHNATIVE}/environment-setup.d/qt5.sh
 
-- 
2.5.0


