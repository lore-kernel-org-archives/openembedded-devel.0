Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 91FB56C685
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 10:28:00 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v13so9219150wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 02:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=x3nqS0vIn/0Kb93Cr1Kq/33Yg5Tk8GcIYpVFg6r0Csk=;
	b=OtaKot+BjEZMa0H1eYDgivEPAikaLALXhtH2R6XEcWHMzGUsB2ZF7sNnj3t2wFjKzj
	dyGYAK3X3JrVbGqGROiG1ciegccD6OYQUDCaqryivug20uY+jFUesFq0xi/e8LWNyPXB
	y8C4A++Ix8dc4Cy1frGNZvo64ju0NcE++eodzQf1stBSZ1cuqVTjlNv5QcaOJ3KFStX7
	RpHz20YzZtI/oND/87a1y41gLFYvs5mZ2WgwrmW9Rl1DHxVXL8y0sGInrDty8XK+4N9T
	ldXwGmfGL3PSAVuMxuRXmbCM1g/TmqLLDgZZWv69QgOkjynD2Imceaj9VZ+cf7TQLhdG
	OArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x3nqS0vIn/0Kb93Cr1Kq/33Yg5Tk8GcIYpVFg6r0Csk=;
	b=Phl0FedTjXL9ZUW9Gr44bmkpQJZWiBETxeaOJcPXy5imUjcf1V8qztItI9S8GqlThd
	uVp/iL5HRA7s06gYQTlsuIxrIjobUvtFY/p3oHkxTkvYNhP4zivnGY72IxqMk21LFqOE
	765cTTNYVWRi+nN5ELMrEH6stbDTUffNEMjSLtvhQVE6H5HSRO78iXR+9FVdtc+ebVVh
	Um7FMquDYljmtaz/yAMlUFkvSILODzYUKi87v9w+neziMEkJNGIwiNz8vgPZMQRpfxZY
	IO9sJXU/3CBELrZBqPGxaXCz2mCydf7N0eeTjtQjbKVtz5n99i8C8IK/GFP2q643S80S
	qE1g==
X-Gm-Message-State: AA+aEWZetn3kbojGpKXeIMM3fOsJULQUPNqKRb2zb0afi7uCALSDR5Yw
	xSfNdldeGUjvlaFkiAwqesye4Ejk
X-Google-Smtp-Source: AFSGD/VgoZItCtMm2AyV7h8UcKcjv7R/lyRNYdhP1ZUWV14NSG8QdH619x15NXoBUkudLlj5zjRyAw==
X-Received: by 2002:a5d:42ce:: with SMTP id t14mr10614002wrr.51.1543746480964; 
	Sun, 02 Dec 2018 02:28:00 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id c8sm8430350wrx.42.2018.12.02.02.28.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 02:28:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Dec 2018 11:27:36 +0100
Message-Id: <20181202102736.47401-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] packagegroup-meta-oe: drop ptest groups
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
X-List-Received-Date: Sun, 02 Dec 2018 10:28:01 -0000

packagegroup.bbclass adds ptest packages automatically, so there is no need to maintain manual lists

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb      | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2a23a6170..3a3e47897 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -21,7 +21,6 @@ PACKAGES = ' \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-oe-ptest", "", d)} \
 '
 
 RDEPENDS_packagegroup-meta-oe = "\
@@ -41,7 +40,6 @@ RDEPENDS_packagegroup-meta-oe = "\
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-oe-ptest", "", d)} \
 "
 
 RDEPENDS_packagegroup-meta-oe-benchmarks = "\
@@ -231,19 +229,3 @@ RDEPENDS_packagegroup-meta-oe-test ="\
     catch2 cppunit cunit cxxtest evtest fb-test \
     fwts gtest pm-qa stress-ng testfloat \
     "
-
-RDEPENDS_packagegroup-meta-oe-ptest = "\
-    zeromq-ptest \
-    leveldb-ptest \
-    psqlodbc-ptest \
-    lua-ptest \
-    protobuf-ptest \
-    rsyslog-ptest \
-    oprofile-ptest \
-    libteam-ptest \
-    uthash-ptest \
-    mcelog-ptest \
-    libee-ptest \
-    numactl-ptest \
-    poco-ptest \
-    "
-- 
2.17.1


