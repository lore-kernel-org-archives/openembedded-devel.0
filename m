Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 077F07E726
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 09:02:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45chFk2gvdz4q
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 11:02:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561971722;
	bh=qhyP3Ufy9hnwIruxAmfaVbuve3kubjx46Ag3+JxzyKY=;
	h=From:To:Subject:Date:From;
	b=j5DMwFEy6hFnEhI4+9BHc4qfXfv3FPRtLCT2ZYnkWQ8SZPoN4bhAmswYMDaXyr7pB
	iWWsUMmu4Ef4rG2f2lIPdYiU9ft/BRy6YId55bCOVQ1l3QX+w8eHjoeXAxXlWXRzCv
	y54jgbmmm6VxDEyExqVdw3QHm4syjU2uKxX/VQRwQxT+T4U8l6AroYMH8OyH6PgPY0
	+MwYyjyL6fOVDWlFEQeKq8NNflbBokAr1vYcXUEbSpNd5auIWBXN5X6Q9c0ZoYSJA8
	79jg43VaRcC5KnvpJITQr1xm7wDGfTRthEyZ/mvhF7rf045+KK5pNS06kGiK3XmN9u
	lgq/JjYjMWZRYVKIoIjWn0+wR/AC1qm5laUj8T6mS17JYnMW2gLtkBSOQE9BlsKbJF
	ETJjLm+GGHu98eWwCCBDOgjBTZXucLXRDwVzMgbUjJdZh0hUXhfYguRlWO+nKkbnU7
	72DtIg94+yMYT8AcMfu3q2541X76Ea5VL37wuzr1X8isnBnTucgFukGrE8REcLtdF7
	UmlnLvmJYtS60+vLCcWpKYzNeg0pae3eirK5G5z+Vig5eM39j6Z2taFIdXhN874qQX
	V/UiLzQnhB0P5T5qRW5f3XMflvm3xx2NseN8tMr0zTnMiqSY8iqtdSqneI8vVppan2
	0tx1CFOznZMse3KYL90X5Wq4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2019 12:02:01 +0300
Message-Id: <20190701090201.19613-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] tremor: Upgrade 20150107 -> 20180319
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
X-List-Received-Date: Mon, 01 Jul 2019 09:02:02 -0000

Also switch to the new repository.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{tremor_20150107.bb => tremor_20180319.bb}       | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)
 rename meta-multimedia/recipes-multimedia/tremor/{tremor_20150107.bb => tremor_20180319.bb} (64%)

diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20150107.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
similarity index 64%
rename from meta-multimedia/recipes-multimedia/tremor/tremor_20150107.bb
rename to meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
index 937894a73..beeb23ae2 100644
--- a/meta-multimedia/recipes-multimedia/tremor/tremor_20150107.bb
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
@@ -5,20 +5,14 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
 DEPENDS = "libogg"
-SRCDATE = "${PV}"
-PR = "r1"
 
-# SVN support for upstream version check isn't implemented yet
-RECIPE_UPSTREAM_VERSION = "20150107"
-RECIPE_UPSTREAM_DATE = "Jan 07, 2015"
-CHECK_DATE = "Aug 12, 2015"
-
-SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=19427;protocol=http \
+SRC_URI = "git://git.xiph.org/tremor.git;protocol=https \
            file://obsolete_automake_macros.patch;striplevel=0 \
            file://tremor-arm-thumb2.patch \
 "
+SRCREV = "7c30a66346199f3f09017a09567c6c8a3a0eedc8"
 
-S = "${WORKDIR}/Tremor"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-- 
2.17.1


