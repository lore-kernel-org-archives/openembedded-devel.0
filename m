Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01589C7619A
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:21 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.56509.1680474615460813145
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fLJdjQbs;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id le6so26262708plb.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6PdVQjI1aZhbKuMdav/5xL2+HV2YS5qoFYbMxKDf9E0=;
        b=fLJdjQbsngY9f/hC+bwSnlh7RFwQxtBKV0L54D6Lr38dILCpj3q205UdqgHE7qMOFA
         n+LG0GX9zc7RaQ5UzPgBu/uvHyyarIU9/dDFDDNVbC/K/aH5tZgdMpnt/lm1r7JgfMLg
         h/mGAt9WhouatCTJdbzscvVLqpnNTJx1kSb13vixaygBBGpjNXYcHIvAY5uWIltDDt7i
         QsiHDQUnKp90S/8l+jCXub74wJiXGB1GL2O/P5pcYaVnkZtmnCwb6j2vREGGdhtU/dX1
         hYeLzktyCDX5VlBrRNrjdZsRKab4HKOaOuiSn88VO3OpRCAel65bisxiGu1JzVDJxd0Q
         rU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PdVQjI1aZhbKuMdav/5xL2+HV2YS5qoFYbMxKDf9E0=;
        b=cyEsoThv1rHBFbOcggPYryA9t03wCvlf3k+vYe08VyfWrLpXBToyqt/G6WuSh+KoOO
         lLg1UMHT34FVVOm52WZXpU40cv5BbD/GRsbvisdducqhM8UwgUcasP5olHY3JGi81xcP
         MgQigjIFmiXGX+sQmR3deAWHyhZa+/eRhDfudAbfiH/4TvJcBpcC4McjLUFTW8uO0fi/
         f6gLfjVQNnDFnmGf4HnybGfYhQBwYfkPSg49MG7cAazk3d76YCFkFjTxbjPoOC/uf1D4
         4mp17+/uh61vmn4u5gg+WEDQ51WwbCfa3rR3GvV7WAI9t2zzKlPvOHNx39f9T/yZR7nI
         Vlsw==
X-Gm-Message-State: AO0yUKUr//Wi3eeJSLjmrA9YDBMFMDCQVXUo9IbMl97hLl9cQiSNgq6Y
	wDiAKGbgQ14fKhGn0govD+Keq0u43XI=
X-Google-Smtp-Source: AK7set/O22AsN49E/bh18oCl4akbiSO/agtaIPCn3/dfm7VGELxOJdpoI46prM8ka9/TF3TFuaDb5g==
X-Received: by 2002:a05:6a20:6597:b0:da:eebd:7f6c with SMTP id p23-20020a056a20659700b000daeebd7f6cmr28436774pzh.56.1680474614457;
        Sun, 02 Apr 2023 15:30:14 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.30.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:30:14 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 11/11] meta-perl-ptest*-image: enable BBCLASSEXTEND parallel execution
Date: Sun,  2 Apr 2023 15:29:43 -0700
Message-Id: <6ce55616d1db9dbd490032581f89e1033aad9bb3.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680473253.git.tim.orling@konsulko.com>
References: <cover.1680473253.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101889

Similar to "core-image-ptest: Switch to BBCLASSEXTEND parallel execution"

Refactor meta-perl-ptest-image.bb for an image per ptest in the form of
meta-perl-ptest-image-XXX using class extensions.

* Add meta-perl-ptest-all-image.bb depends on ALL meta-perl-ptest-image-XXX in meta-perl
* Add meta-perl-ptest-fast-image.bb depends on meta-perl ptests which take less than ~30s

This allows parallel execution of the tests.

The downside to this approach is the parsing time of an image generating
this number of class extensions is slow but making it easier to execute
and collect test data should outweigh that.

A useful advantage is that the dependencies of each ptest package are
checked/tested individually.

Add to local.conf:
IMAGE_CLASSES += "testimage"

All the meta-perl-ptest-image-XXX can be built with:
$ bitbake meta-perl-ptest-all-image

Subsequently, all the ptest images can be run with:
$ bitbake -c testimage meta-perl-ptest-all-image

You will likely want to limit the number of parallel image tests:

BB_NUMBER_THREADS = "4"

based on the number of TAP devices you have defined or the number of simultaneous
QEMU sessions your server can support.

Results can be summarized with:

$ resulttool report tmp/log/oeqa/testresults.json

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/meta-perl-ptest-all-image.bb       | 25 ++++++++++++
 .../images/meta-perl-ptest-fast-image.bb      |  6 +++
 .../images/meta-perl-ptest-image.bb           | 38 +++++++++++++++++--
 3 files changed, 66 insertions(+), 3 deletions(-)
 create mode 100644 meta-perl/recipes-core/images/meta-perl-ptest-all-image.bb
 create mode 100644 meta-perl/recipes-core/images/meta-perl-ptest-fast-image.bb

diff --git a/meta-perl/recipes-core/images/meta-perl-ptest-all-image.bb b/meta-perl/recipes-core/images/meta-perl-ptest-all-image.bb
new file mode 100644
index 000000000..236043c22
--- /dev/null
+++ b/meta-perl/recipes-core/images/meta-perl-ptest-all-image.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Recipe to trigger execution of all meta-perl ptest images."
+HOMEPAGE = "https://www.openembedded.org/"
+
+LICENSE = "MIT"
+
+inherit features_check nopackages
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require conf/include/ptest-packagelists-meta-perl.inc
+
+# Include the full set of ptests
+PTESTS_META_PERL = "${PTESTS_FAST_META_PERL} ${PTESTS_SLOW_META_PERL}"
+
+do_testimage[noexec] = "1"
+do_testimage[depends] = "${@' '.join(['meta-perl-ptest-image-'+x+':do_testimage' for x in d.getVar('PTESTS_META_PERL').split()])}"
+
+do_build[depends] = "${@' '.join(['meta-perl-ptest-image-'+x+':do_build' for x in d.getVar('PTESTS_META_PERL').split()])}"
+
+# normally image.bbclass would do this
+EXCLUDE_FROM_WORLD = "1"
+
+python () {
+    if bb.utils.contains('IMAGE_CLASSES', 'testimage', True, False, d):
+        bb.build.addtask("do_testimage", "", "", d)
+}
diff --git a/meta-perl/recipes-core/images/meta-perl-ptest-fast-image.bb b/meta-perl/recipes-core/images/meta-perl-ptest-fast-image.bb
new file mode 100644
index 000000000..5d8afa08e
--- /dev/null
+++ b/meta-perl/recipes-core/images/meta-perl-ptest-fast-image.bb
@@ -0,0 +1,6 @@
+require meta-perl-ptest-all-image.bb
+
+DESCRIPTION = "Recipe to trigger execution of all fast meta-perl ptest images."
+
+PTESTS_META_PERL = "${PTESTS_FAST_META_PERL}"
+
diff --git a/meta-perl/recipes-core/images/meta-perl-ptest-image.bb b/meta-perl/recipes-core/images/meta-perl-ptest-image.bb
index a9b4cc3c7..7cca6402b 100644
--- a/meta-perl/recipes-core/images/meta-perl-ptest-image.bb
+++ b/meta-perl/recipes-core/images/meta-perl-ptest-image.bb
@@ -1,9 +1,41 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES += "ptest"
+
 require  meta-perl-base.bb
 
 SUMMARY = "meta-perl build ptest image"
 
-inherit features_check
+require conf/include/ptest-packagelists-meta-perl.inc
 
-REQUIRED_DISTRO_FEATURES += "ptest"
+DESCRIPTION += "Also including the ${MCNAME} ptest package."
+HOMEPAGE = "https://www.openembedded.org/"
+
+PTESTS_META_PERL = "${PTESTS_SLOW_META_PERL} ${PTESTS_FAST_META_PERL}"
+
+IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
+
+BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS_META_PERL').split()])}"
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
+# If a particular ptest needs more memory, it can be customized:
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
 
-IMAGE_INSTALL += "packagegroup-meta-perl-ptest"
-- 
2.34.1


