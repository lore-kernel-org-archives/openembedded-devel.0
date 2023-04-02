Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC70DC77B6C
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:10 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.56520.1680474604260122003
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RsHqTDup;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id ix20so26296473plb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dM+tYoUx+0nHNF2/f8c/i2VjvlktDTFLkWugm95yHO8=;
        b=RsHqTDup9TF4SPRDD/cXcdumGYw7Dd4m7TuWfTvSCXHNRYDgFfvmMeYIGLBr7dTvap
         DXltHKDV9iiw2TVyn6/YTjHpLfXxtQ6YKu+ojV5QuvDv87E4GfE+KKJfH6XzvWZTavMZ
         NGX6jop7/6lZWsmYi7aPnx4+O/zSkIvq/95xw+GRCeeCP5T4y95fZhgHVfF2LGVi7wtl
         fazH3XfUu54pq/8SFl7U8QEKf9OwgYsTt05JT/FG6KIZdU9GVtLvsraznuF6XPbTqkl8
         4aX4gd+rFMz9Hpml7p7OKc7RXeK4EoUQGwQMZz+jEF9ABdJSsxK/fE8sfrzeNl3MI/G7
         oG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dM+tYoUx+0nHNF2/f8c/i2VjvlktDTFLkWugm95yHO8=;
        b=CVQOvssiVWXyugU9NBLpwGOpLTEXYubSMtodNyPQrEBnIQZET+Whp7T7SgQ5I54voV
         h76kFlpJ2NluPjFhY2cwbtCcOiJG9aVByPYy9d7TcgNtsWDlppbh6GqjA1dDCP2Ur06i
         LLwU1s0sEhJ9fAPvh9inUlcaDMH9ByQ/vSL0E+u/f68c4QQb3ATBtas27I7xzHJZtK3f
         a0EHaQWTQC9pJQAIIim9Chqry4IVkR1RgiMzk6yIfdy7ma4oeVUW9zx0gBDrppC9t8L8
         PcIOmAGZEWw0U2u9NssKrZcRXo1Fdm5Dw3SHbiYuwjdkeIyuqAwGufVI6Q3/f/gBVFS7
         PCsA==
X-Gm-Message-State: AO0yUKVL1H7mXbxqzVra1T8BRw4lXAC80Ohm0kjThY55vW/ialtXZiJD
	Du2wwAZPNkv/Vs14I0/rWSeFNHbw97k=
X-Google-Smtp-Source: AK7set+29Ze00xg+HxueMBtsRl5JBiZS+IknKSMTqW0Z0jsXRGi5q0LQOYz89QPdUiEAbMDOxbz+og==
X-Received: by 2002:a05:6a20:4891:b0:d9:cde:d2a9 with SMTP id fo17-20020a056a20489100b000d90cded2a9mr28886473pzb.20.1680474603213;
        Sun, 02 Apr 2023 15:30:03 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.30.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:30:02 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 04/11] meta-oe-ptest*-image: enable BBCLASSEXTEND parallel execution
Date: Sun,  2 Apr 2023 15:29:36 -0700
Message-Id: <040cff75f5cc2f926c6ab489c0a4b1776ce7d17d.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680473253.git.tim.orling@konsulko.com>
References: <cover.1680473253.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101882

Similar to "core-image-ptest: Switch to BBCLASSEXTEND parallel execution"

Refactor meta-oe-ptest-image.bb for an image per ptest in the form of
meta-oe-ptest-image-XXX using class extensions.

* Add meta-oe-ptest-all-image.bb depends on ALL meta-oe-ptest-image-XXX in meta-oe
* Add meta-oe-ptest-fast-image.bb depends on meta-oe ptests which take less than ~30s

This allows parallel execution of the tests.

The downside to this approach is the parsing time of an image generating
this number of class extensions is slow but making it easier to execute
and collect test data should outweigh that.

A useful advantage is that the dependencies of each ptest package are
checked/tested individually.

Add to local.conf:
IMAGE_CLASSES += "testimage"

All the meta-oe-ptest-image-XXX can be built with:
$ bitbake meta-oe-ptest-all-image

Subsequently, all the ptest images can be run with:
$ bitbake -c testimage meta-oe-ptest-all-image

You will likely want to limit the number of parallel image tests:

BB_NUMBER_THREADS = "4"

based on the number of TAP devices you have defined or the number of simultaneous
QEMU sessions your server can support.

Results can be summarized with:

$ resulttool report tmp/log/oeqa/testresult.json

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/meta-oe-ptest-all-image.bb         | 25 ++++++++++++
 .../images/meta-oe-ptest-fast-image.bb        |  6 +++
 .../images/meta-oe-ptest-image.bb             | 38 ++++++++++++++++++-
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb
 create mode 100644 meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb

diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb b/meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb
new file mode 100644
index 000000000..0ea03dd2e
--- /dev/null
+++ b/meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Recipe to trigger execution of all meta-oe ptest images."
+HOMEPAGE = "https://www.openembedded.org/"
+
+LICENSE = "MIT"
+
+inherit features_check nopackages
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require conf/include/ptest-packagelists-meta-oe.inc
+
+# Include the full set of ptests
+PTESTS_META_OE = "${PTESTS_FAST_META_OE} ${PTESTS_SLOW_META_OE}"
+
+do_testimage[noexec] = "1"
+do_testimage[depends] = "${@' '.join(['meta-oe-ptest-image-'+x+':do_testimage' for x in d.getVar('PTESTS_META_OE').split()])}"
+
+do_build[depends] = "${@' '.join(['meta-oe-ptest-image-'+x+':do_build' for x in d.getVar('PTESTS_META_OE').split()])}"
+
+# normally image.bbclass would do this
+EXCLUDE_FROM_WORLD = "1"
+
+python () {
+    if bb.utils.contains('IMAGE_CLASSES', 'testimage', True, False, d):
+        bb.build.addtask("do_testimage", "", "", d)
+}
diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb b/meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb
new file mode 100644
index 000000000..f56e841ff
--- /dev/null
+++ b/meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb
@@ -0,0 +1,6 @@
+require meta-oe-ptest-all-image.bb
+
+DESCRIPTION = "Recipe to trigger execution of all fast meta-oe ptest images."
+
+PTESTS_META_OE = "${PTESTS_FAST_META_OE}"
+
diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
index 0166b9c41..951d91f82 100644
--- a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
+++ b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
@@ -1,5 +1,41 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require conf/include/ptest-packagelists-meta-oe.inc
+
 require  meta-oe-image-base.bb
 
 SUMMARY = "meta-oe ptest test image"
 
-IMAGE_INSTALL += "packagegroup-meta-oe"
+DESCRIPTION += "Also including the ${MCNAME} ptest package."
+HOMEPAGE = "https://www.openembedded.org/"
+
+PTESTS_META_OE = "${PTESTS_SLOW_META_OE} ${PTESTS_FAST_META_OE}"
+
+IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
+
+BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS_META_OE').split()])}"
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
-- 
2.34.1


