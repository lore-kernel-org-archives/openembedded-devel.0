Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABD8C54791
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 20:58:40 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.24573.1708635514468891006
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 12:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y0ZuSrMw;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e471caaa71so62323b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 12:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708635513; x=1709240313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYsWYWAUihSIf0HOlh3sHZVJCJxWST2EY324zNy6seg=;
        b=Y0ZuSrMwN6kXnaERPqs2aHRrMXmlqMgZKHdlE3IFeMWBodEdOHZwGb1Tp198UTxX8D
         wRod4yQc0fI5YPXMdQIIB+tmQLN6t++BfKwwqaMAqH645VOMQwSO46UArUBx7axIcosQ
         baU/bLkvy/GGwZSBBqQCHzl6owi8oI/7c4DUYc7KHrcNZ7iI7TgFepSQtIg3MBtEDzG3
         pqh8f0u+4jR9nv1+VuXzYJVKJZNoimTm8gy38TbwDnVtZDvZrj5xqoUMCB3qLwA0Psz8
         SoFtxUU5+7MEA6A1Kdxf1iuv65i8UIXjim6VmcViVeWa9+PWVXz4poxfAJlsAl0ehZqQ
         299w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708635514; x=1709240314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYsWYWAUihSIf0HOlh3sHZVJCJxWST2EY324zNy6seg=;
        b=HxHtbaYz8VF6M/TRyhFGMfj/EoDQfnWFF5tifDfUNiyheVFfGMSC4VT5CfEhrfbFrt
         MpkEuO0+a7WBgA2ZkbL/R+GCL6vi8ghT8XfKIQUVyX4B84JNupiUqVjpFn24uWgKT5RI
         hnqpLC6xDPdidgWE9Fwkjvs3m/fg32WWL1NpTdlunEWLYxJ+mJSqlwdjdwYKEGdR1ppj
         pTamVsi6O6K4m52wCwauwXuUpRpSq4ZKZ2ZHlxGRqGRepO8jwglP1pqkLwG2A0rL8n6k
         UWMCG2kwIKpD42JYfvuIz6Ux6Jl/59pD0gZ3ZF2PK7jsrNqecwwP81jdSn5Sr4heCyaY
         7E8w==
X-Gm-Message-State: AOJu0YyVjFh5+3yxddSqtDpuY9ROEjHKc28xN/7kGOa7i79IJHA43M0i
	qdJ9ns6ZmNmynEJ5HOxYgaKZUyoRW5aEvL/ogy4fd2jvpc2QycuTa+gFWAXFbIE=
X-Google-Smtp-Source: AGHT+IEXbiAXezGKVXr0Szy9OaKowTRCjUX3UZQFzYWbRDmtHjyh75yItQerlUnFc/80xrT5FpvdLg==
X-Received: by 2002:a05:6a20:8927:b0:19e:487e:3994 with SMTP id i39-20020a056a20892700b0019e487e3994mr17781876pzg.57.1708635513485;
        Thu, 22 Feb 2024 12:58:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7619])
        by smtp.gmail.com with ESMTPSA id y5-20020a62ce05000000b006e2dde36edesm11444010pfg.120.2024.02.22.12.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 12:58:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 4/4] meta-filesystems: Add meta-filesystems-image-ptest
Date: Thu, 22 Feb 2024 12:58:27 -0800
Message-ID: <20240222205827.2813212-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222205827.2813212-1-raj.khem@gmail.com>
References: <20240222205827.2813212-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 20:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108997

This will help in running ptests like core layer, right now there are
just 3 but I hope to get more contributions now that infra is in place

to run all ptests

bitbake meta-filesystems-image-ptest-all

to run a single recipe ptests

bitbake meta-filesystems-image-ptest-fuse3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ptest-packagelists-meta-filesystems.inc   | 18 +++++++++
 .../meta-filesystems-image-ptest-all.bb       | 25 ++++++++++++
 .../meta-filesystems-image-ptest-fast.bb      |  5 +++
 .../images/meta-filesystems-image-ptest.bb    | 40 +++++++++++++++++++
 4 files changed, 88 insertions(+)
 create mode 100644 meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
 create mode 100644 meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest-all.bb
 create mode 100644 meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest-fast.bb
 create mode 100644 meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest.bb

diff --git a/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
new file mode 100644
index 0000000000..f57bbab930
--- /dev/null
+++ b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
@@ -0,0 +1,18 @@
+#
+# Lists of the ptest in meta-filesystems, sorted into two sets by the time they take
+# Please keep these sorted in alphabetical order
+#
+# A first pass at getting all meta-filesystems recipes which inherit ptest
+# meta_filesystems_ptest_recipes=$(bitbake-layers show-recipes --recipes-only --layer meta-filesystems --inherits ptest --bare | sed -e '1,/=== Matching recipes: ===/d')
+# ptests which take less than ~30s each
+
+PTESTS_FAST_META_FILESYSTEMS = "\
+    e2tools \
+    fuse3 \
+"
+
+PTESTS_SLOW_META_FILESYSTEMS = "\
+"
+PTESTS_PROBLEMS_META_FILESYSTEMS = "\
+    sshfs-fuse \
+"
diff --git a/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest-all.bb b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest-all.bb
new file mode 100644
index 0000000000..ffbfa1a3f6
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest-all.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Recipe to trigger execution of all meta-filesystems ptest images."
+HOMEPAGE = "https://www.openembedded.org/"
+
+LICENSE = "MIT"
+
+inherit features_check nopackages
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require conf/include/ptest-packagelists-meta-filesystems.inc
+
+# Include the full set of ptests
+PTESTS_META_FILESYSTEMS = "${PTESTS_FAST_META_FILESYSTEMS} ${PTESTS_SLOW_META_FILESYSTEMS} ${PTESTS_PROBLEMS_META_FILESYSTEMS}"
+
+do_testimage[noexec] = "1"
+do_testimage[depends] = "${@' '.join(['meta-filesystems-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_FILESYSTEMS').split()])}"
+
+do_build[depends] = "${@' '.join(['meta-filesystems-image-ptest-'+x+':do_build' for x in d.getVar('PTESTS_META_FILESYSTEMS').split()])}"
+
+# normally image.bbclass would do this
+EXCLUDE_FROM_WORLD = "1"
+
+python () {
+    if bb.utils.contains('IMAGE_CLASSES', 'testimage', True, False, d):
+        bb.build.addtask("do_testimage", "", "", d)
+}
diff --git a/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest-fast.bb b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest-fast.bb
new file mode 100644
index 0000000000..0eb5344d9e
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest-fast.bb
@@ -0,0 +1,5 @@
+require meta-filesystems-image-ptest-all.bb
+
+DESCRIPTION = "Recipe to trigger execution of all fast meta-filesystems ptest images."
+
+PTESTS_META_OE = "${PTESTS_FAST_META_FILESYSTEMS}"
diff --git a/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest.bb b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest.bb
new file mode 100644
index 0000000000..90d6a92c1b
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-ptest.bb
@@ -0,0 +1,40 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require recipes-core/images/core-image-minimal.bb
+require conf/include/ptest-packagelists-meta-filesystems.inc
+
+SUMMARY = "meta-filesystems ptest test image"
+
+DESCRIPTION += "Also including the ${MCNAME} ptest package."
+HOMEPAGE = "https://www.openembedded.org/"
+
+PTESTS_META_FILESYSTEMS = "${PTESTS_SLOW_META_FILESYSTEMS} ${PTESTS_FAST_META_FILESYSTEMS} ${PTESTS_PROBLEMS_META_FILESYSTEMS}"
+
+IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
+
+BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS_META_FILESYSTEMS').split()])}"
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
2.43.2


