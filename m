Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D83C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 03:00:54 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.2826.1708657247520423702
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 19:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lozuHHIo;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dbb47852cdso2846215ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 19:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708657247; x=1709262047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ2jq3DltKwvs95GF+qMgI9aa0pvbOoj49xciB58XYE=;
        b=lozuHHIotDdI3YuvuR2i5T10tL61uGV324liBMscPCwKe1tvdFrkLvq4qbt3CuE0yY
         CQ7iRV9D8W0z1gkQXFBwH9/X0JjrzVRrNtu5KCY0uydT5SO08pwWJVevk9fw3Ap4w7eZ
         YGWBYtISFaAfQpH/tZXnJ5xZgBgKhZwrt3eEp0V/odsnYJozUaqcBe5nOF/ALG71lb4H
         xmKveCiY9SjnB2QtMVn5Kx5YKd8/3CMvF6gY4XTU191W2Jnm+X/QXJId/Sqp3yD79cCa
         4/Gf1tJodV9WjjefB1x1Geeb1uec7k5R+4cGqlN4DMylXi+CoKxboBtjEjmdAASSQsaP
         7Q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708657247; x=1709262047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ2jq3DltKwvs95GF+qMgI9aa0pvbOoj49xciB58XYE=;
        b=gwIar/nH/stnAfVA/76jua7C71c4tn8/r1Xb69VxdaNg5pAp6LZYZeB/CqNBg/aS/3
         uSazhhUfw+9eLEQnSoCSjz6bjbaqXMpZKlj/ynR+zSx/sERYWaJQQ0SQ7aH0DNk1BPAx
         iQxj0aR2oyYtVY6aKKgcL0olrx2lUCywN2plsU+Udrsl4PEdQpDklI3s4GzFeff6PMo9
         1BeyaTJvxEyy9JttOfPARS0l7PLG777na61NjmhVAUcGpfCeK7bXb8trLC4caPndhYEK
         Rhahsy7D/XODCfAQxga8FEGyskbudSj17I1sNlArNUbnN6nY+MMxq4hPZ1P0oy26Gdir
         FAPg==
X-Gm-Message-State: AOJu0YzODF3P+l6KrMPiZxljz8MgFT2vbfgbVeGvgMZyRlKOUHPfU8e4
	8aEYydcgRXa3ky3JxFSVVIkirjCtHDlRV2D73hhZpILLvoFaMKyTjg5dp/0HLGs=
X-Google-Smtp-Source: AGHT+IFTPJRI8FZeYq7JVc3HR/kJly6I6lyuvuQhTu6YpKeCcS5EgOw7cvO88aZ/2JO8thkwhd7Rvw==
X-Received: by 2002:a17:903:240d:b0:1d8:e4b8:95e5 with SMTP id e13-20020a170903240d00b001d8e4b895e5mr992725plo.32.1708657246493;
        Thu, 22 Feb 2024 19:00:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::a1f8])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001da186aa72csm10994189pln.17.2024.02.22.19.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 19:00:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] meta-multimedia-image-ptest: Add images to enable BBCLASSEXTEND parallel execution
Date: Thu, 22 Feb 2024 19:00:42 -0800
Message-ID: <20240223030043.762212-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 03:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109001

In line with other layers like meta-oe, meta-python add capability to
run recipe ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ptest-packagelists-meta-multimedia.inc    | 17 ++++++++
 .../images/meta-multimedia-image-ptest-all.bb | 25 ++++++++++++
 .../meta-multimedia-image-ptest-fast.bb       |  5 +++
 .../images/meta-multimedia-image-ptest.bb     | 40 +++++++++++++++++++
 .../libopenmpt/libopenmpt_0.7.3.bb            |  1 +
 5 files changed, 88 insertions(+)
 create mode 100644 meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
 create mode 100644 meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-all.bb
 create mode 100644 meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-fast.bb
 create mode 100644 meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest.bb

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
new file mode 100644
index 0000000000..e21ad5766b
--- /dev/null
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -0,0 +1,17 @@
+#
+# Lists of the ptest in meta-multimedia, sorted into two sets by the time they take
+# Please keep these sorted in alphabetical order
+#
+# A first pass at getting all meta-multimedia recipes which inherit ptest
+# meta_multimedia_ptest_recipes=$(bitbake-layers show-recipes --recipes-only --layer meta-multimedia --inherits ptest --bare | sed -e '1,/=== Matching recipes: ===/d')
+# ptests which take less than ~30s each
+
+PTESTS_FAST_META_MULTIMEDIA = "\
+"
+
+PTESTS_SLOW_META_MULTIMEDIA = "\
+"
+
+PTESTS_PROBLEMS_META_MULTIMEDIA = "\
+    libopenmpt \
+"
diff --git a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-all.bb b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-all.bb
new file mode 100644
index 0000000000..8accba1bff
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-all.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Recipe to trigger execution of all meta-multimedia ptest images."
+HOMEPAGE = "https://www.openembedded.org/"
+
+LICENSE = "MIT"
+
+inherit features_check nopackages
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require conf/include/ptest-packagelists-meta-multimedia.inc
+
+# Include the full set of ptests
+PTESTS_META_MULTIMEDIA = "${PTESTS_FAST_META_MULTIMEDIA} ${PTESTS_SLOW_META_MULTIMEDIA} ${PTESTS_PROBLEMS_META_MULTIMEDIA}"
+
+do_testimage[noexec] = "1"
+do_testimage[depends] = "${@' '.join(['meta-multimedia-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_MULTIMEDIA').split()])}"
+
+do_build[depends] = "${@' '.join(['meta-multimedia-image-ptest-'+x+':do_build' for x in d.getVar('PTESTS_META_MULTIMEDIA').split()])}"
+
+# normally image.bbclass would do this
+EXCLUDE_FROM_WORLD = "1"
+
+python () {
+    if bb.utils.contains('IMAGE_CLASSES', 'testimage', True, False, d):
+        bb.build.addtask("do_testimage", "", "", d)
+}
diff --git a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-fast.bb b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-fast.bb
new file mode 100644
index 0000000000..e6e0c4c9bc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-fast.bb
@@ -0,0 +1,5 @@
+require meta-multimedia-image-ptest-all.bb
+
+DESCRIPTION = "Recipe to trigger execution of all fast meta-multimedia ptest images."
+
+PTESTS_META_OE = "${PTESTS_FAST_META_MULTIMEDIA}"
diff --git a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest.bb b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest.bb
new file mode 100644
index 0000000000..887396d4cc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest.bb
@@ -0,0 +1,40 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require recipes-core/images/core-image-minimal.bb
+require conf/include/ptest-packagelists-meta-multimedia.inc
+
+SUMMARY = "meta-multimedia ptest test image"
+
+DESCRIPTION += "Also including the ${MCNAME} ptest package."
+HOMEPAGE = "https://www.openembedded.org/"
+
+PTESTS_META_MULTIMEDIA = "${PTESTS_SLOW_META_MULTIMEDIA} ${PTESTS_FAST_META_MULTIMEDIA} ${PTESTS_PROBLEMS_META_MULTIMEDIA}"
+
+IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
+
+BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS_META_MULTIMEDIA').split()])}"
+
+# The image can be sufficiently large (~1.8GB) that we need to be careful that it fits in a live
+# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
+# box) and explicitly add up to 1500MB.
+IMAGE_OVERHEAD_FACTOR = "1.0"
+IMAGE_ROOTFS_EXTRA_SPACE = "324288"
+# If a particular ptest needs more space, it can be customized:
+#IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-<pn> = "1024288"
+
+# ptests need more memory than standard to avoid the OOM killer
+QB_MEM = "-m 1024"
+# If a particular ptest needs more memroy, it can be customized:
+#QB_MEM:virtclass-mcextend-<pn> = "-m 4096"
+
+TEST_SUITES = "ping ssh parselogs ptest"
+
+# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
+PTEST_EXPECT_FAILURE = "1"
+
+python () {
+    if not d.getVar("MCNAME"):
+        raise bb.parse.SkipRecipe("No class extension set")
+}
+
diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
index 92f33da899..8bb49b2f12 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
@@ -74,6 +74,7 @@ FILES:${PN}-openmpt123-doc = "${mandir}/man1/openmpt123*"
 DEBIAN_NOAUTONAME:${PN} = "1"
 
 RDEPENDS:${PN}:libc-glibc = " \
+    glibc-gconv \
     glibc-gconv-cp1252 \
     glibc-gconv-ibm437 \
     glibc-gconv-iso8859-1 \
-- 
2.43.2


