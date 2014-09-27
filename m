Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8821A65E1A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2014 19:11:32 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id rd3so5529853pab.32
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2014 12:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=J3C7b1Uo+d/SYpmMarGyXx3BI7qCLwSilXja2lW4scg=;
	b=MLh7SjkRPQ9W0IaVjrygTmhfc0sDSLXzOCPi/H4u4NlFWhQ3nQHaeuKr642kzR7AUi
	hz/6Bkfx4ZkdKgJgkaVfp5Yu7hEbFS7RL458Xj1G8dZ5uzXtHEb3SJgHWtd48Ro1avEY
	hOFnFE3Dnj0mp07y0kZa1SmA+eUmVVJwXaH61VhD2fiiw4oI74/qNsbv0sAB5N8b4IAq
	oz3YcaW2rbToGknnlTSZznexNtuIZ1NjOGDCoboxnmBqlA6dTB6mDPaI5H/vlXvtzGAn
	f7MHxRDiZOhhnW3toQbPezksJCcHrA9Bsi6UqLD7p917CeOg2pQHpBLaSel5z0BvcmuC
	Gi8A==
X-Received: by 10.66.193.4 with SMTP id hk4mr43483647pac.12.1411845094161;
	Sat, 27 Sep 2014 12:11:34 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225])
	by mx.google.com with ESMTPSA id d5sm8158858pbu.45.2014.09.27.12.11.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Sep 2014 12:11:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Sep 2014 12:15:25 -0700
Message-Id: <1411845327-16713-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-opie][PATCH] packagegroups: Move inheriting packagegroup after setting PACKAGE_ARCH
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
X-List-Received-Date: Sat, 27 Sep 2014 19:11:34 -0000

Fixes

ERROR: Please ensure recipe
/home/ubuntu/work/angstrom/sources/meta-opie/recipes-opie/packagegroups/packagegroup-opie-16mb.bb
sets PACKAGE_ARCH before inherit packagegroup
ERROR: Please ensure recipe
/home/ubuntu/work/angstrom/sources/meta-opie/recipes-opie/packagegroups/packagegroup-opie.bb
sets PACKAGE_ARCH before inherit packagegroup

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-opie/packagegroups/packagegroup-opie-16mb.bb | 4 ++--
 recipes-opie/packagegroups/packagegroup-opie.bb      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-opie/packagegroups/packagegroup-opie-16mb.bb b/recipes-opie/packagegroups/packagegroup-opie-16mb.bb
index a6f2855..60ea111 100644
--- a/recipes-opie/packagegroups/packagegroup-opie-16mb.bb
+++ b/recipes-opie/packagegroups/packagegroup-opie-16mb.bb
@@ -3,10 +3,10 @@ SECTION = "opie/base"
 LICENSE = "MIT"
 PR = "r7"
 
-inherit packagegroup
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 PACKAGES = "packagegroup-opie-16mb-base \
             packagegroup-opie-16mb-applets \
             packagegroup-opie-16mb-inputmethods \
diff --git a/recipes-opie/packagegroups/packagegroup-opie.bb b/recipes-opie/packagegroups/packagegroup-opie.bb
index 16dc212..42568aa 100644
--- a/recipes-opie/packagegroups/packagegroup-opie.bb
+++ b/recipes-opie/packagegroups/packagegroup-opie.bb
@@ -4,10 +4,10 @@ LICENSE = "MIT"
 
 PR = "r18"
 
-inherit packagegroup
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 PROVIDES = "packagegroup-opie-everything"
 
 PACKAGES = "packagegroup-opie-base \
-- 
2.1.1


