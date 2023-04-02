Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8456C77B62
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:10 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.56498.1680474607315358990
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OqsbD1OV;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id s72so595418pgs.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZC3BVYCoZoqB5WYkIECYy9FObVXDJvMc6g/3Hr0QNJw=;
        b=OqsbD1OVz9a6nrAbBJn9QdY8yuBSigybxUj1nDNrFsyLflTljHmlg+emMl9A6YlAlH
         ZTJEI4lCjw+F3ZlnrTslLSzJ6kwPlwNWid0gZLuHqXIM7OKL+d0vifPjxG+a/ncz4fcL
         H/78/C7gzaLlv/usqVPge/eqpSPcfKkK8qLBp8WKWv1aLC+up3XoXyWCzI6smQOSsvb5
         9phCXOamU0Udmd9B6qQOUcnjScnZsHz+ycbMrMXaNcvm24e3lBwgVznYOa8qoWatNhM0
         feLmmD7nEZ6ZXVGvwKgWj/XmkmQAeSnEw3e9Zf6DNuep4rQq3/+qsfAEm8HgWKVWPohf
         ihKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC3BVYCoZoqB5WYkIECYy9FObVXDJvMc6g/3Hr0QNJw=;
        b=XwyDUojpCgyUqtkG1XFU1H9lMTgHqENnkfGpe6vdDaV6OTsw/oDVtMrWtQtBfdIIXP
         bBgIqbb5Qaz6m4H2Zw0npyqLkw5A6GAMvqUObBZxiEUe3q/Tj19ps7Y+7ZynbZv/7dVM
         IEMMpG9amGIuhAkY/gRjd86rIM37bs67ZFQj0ENgw4Mw5ulAcrdtsursxAeizMpuyQ6p
         FanEPEDR1UMzg6OmuUBGIWfdsd9Ek3rlU7JqYJECO4qYk0B7jGXhAcfheh7EJVV1WBgw
         TWzootn3143AURfBudgLvzu4EXXSMq52qZ38f65f1hIf9uTXDrEwA0vRWf+Mtzy+O+W2
         fcYA==
X-Gm-Message-State: AAQBX9ekZUbn5HFsvZ11VlK2oWy+P8eIQFE1B81UNyNLLRIr3LORL4nt
	xuiU8zHnIdIWRYyKxDXwtGq0u7vX5LU=
X-Google-Smtp-Source: AKy350bQb8hj1iAVcQtV3pM/eTmdTrYXcTHpk9mWjlwYcHchdtsbhHXgMVCmGuSQx520CeGpqCtB1w==
X-Received: by 2002:a62:3845:0:b0:594:26a7:cbd2 with SMTP id f66-20020a623845000000b0059426a7cbd2mr16645172pfa.8.1680474606327;
        Sun, 02 Apr 2023 15:30:06 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.30.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:30:06 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 06/11] meta-python-ptest*-image: enable BBCLASSEXTEND parallel execution
Date: Sun,  2 Apr 2023 15:29:38 -0700
Message-Id: <eb10fe4ee76016ecb9395c32bb41ca50b9bcd2a2.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680473253.git.tim.orling@konsulko.com>
References: <cover.1680473253.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101884

Similar to "core-image-ptest: Switch to BBCLASSEXTEND parallel execution"

Refactor meta-python-ptest-image.bb for an image per ptest in the form of
meta-python-ptest-image-XXX using class extensions.

* Add meta-python-ptest-all-image.bb depends on ALL meta-python-ptest-image-XXX in meta-python
* Add meta-python-ptest-fast-image.bb depends on meta-python ptests which take less than ~30s

This allows parallel execution of the tests.

The downside to this approach is the parsing time of an image generating
this number of class extensions is slow but making it easier to execute
and collect test data should outweigh that.

A useful advantage is that the dependencies of each ptest package are
checked/tested individually.

Add to local.conf:
IMAGE_CLASSES += "testimage"

All the meta-python-ptest-image-XXX can be built with:
$ bitbake meta-python-ptest-all-image

Subsequently, all the ptest images can be run with:
$ bitbake -c testimage meta-python-ptest-all-image

You will likely want to limit the number of parallel image tests:

BB_NUMBER_THREADS = "4"

based on the number of TAP devices you have defined or the number of simultaneous
QEMU sessions your server can support.

Results can be summarized with:

$ resulttool report tmp/log/oeqa/testresults.json

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/meta-python-ptest-all-image.bb     | 25 ++++++++++++
 .../images/meta-python-ptest-fast-image.bb    |  6 +++
 .../images/meta-python-ptest-image.bb         | 38 ++++++++++++++++++-
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-core/images/meta-python-ptest-all-image.bb
 create mode 100644 meta-python/recipes-core/images/meta-python-ptest-fast-image.bb

diff --git a/meta-python/recipes-core/images/meta-python-ptest-all-image.bb b/meta-python/recipes-core/images/meta-python-ptest-all-image.bb
new file mode 100644
index 000000000..fd4dc4248
--- /dev/null
+++ b/meta-python/recipes-core/images/meta-python-ptest-all-image.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Recipe to trigger execution of all meta-python ptest images."
+HOMEPAGE = "https://www.openembedded.org/"
+
+LICENSE = "MIT"
+
+inherit features_check nopackages
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require conf/include/ptest-packagelists-meta-python.inc
+
+# Include the full set of ptests
+PTESTS_META_PYTHON = "${PTESTS_FAST_META_PYTHON} ${PTESTS_SLOW_META_PYTHON}"
+
+do_testimage[noexec] = "1"
+do_testimage[depends] = "${@' '.join(['meta-python-ptest-image-'+x+':do_testimage' for x in d.getVar('PTESTS_META_PYTHON').split()])}"
+
+do_build[depends] = "${@' '.join(['meta-python-ptest-image-'+x+':do_build' for x in d.getVar('PTESTS_META_PYTHON').split()])}"
+
+# normally image.bbclass would do this
+EXCLUDE_FROM_WORLD = "1"
+
+python () {
+    if bb.utils.contains('IMAGE_CLASSES', 'testimage', True, False, d):
+        bb.build.addtask("do_testimage", "", "", d)
+}
diff --git a/meta-python/recipes-core/images/meta-python-ptest-fast-image.bb b/meta-python/recipes-core/images/meta-python-ptest-fast-image.bb
new file mode 100644
index 000000000..4f93a1595
--- /dev/null
+++ b/meta-python/recipes-core/images/meta-python-ptest-fast-image.bb
@@ -0,0 +1,6 @@
+require meta-python-ptest-all-image.bb
+
+DESCRIPTION = "Recipe to trigger execution of all fast meta-python ptest images."
+
+PTESTS_META_PYTHON = "${PTESTS_FAST_META_PYTHON}"
+
diff --git a/meta-python/recipes-core/images/meta-python-ptest-image.bb b/meta-python/recipes-core/images/meta-python-ptest-image.bb
index d497016d4..a649cbb94 100644
--- a/meta-python/recipes-core/images/meta-python-ptest-image.bb
+++ b/meta-python/recipes-core/images/meta-python-ptest-image.bb
@@ -1,5 +1,41 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require conf/include/ptest-packagelists-meta-python.inc
+
 require  meta-python-image-base.bb
 
 SUMMARY = "meta-python ptest test image"
 
-IMAGE_INSTALL += "packagegroup-meta-python3-ptest"
+DESCRIPTION += "Also including the ${MCNAME} ptest package."
+HOMEPAGE = "https://www.openembedded.org/"
+
+PTESTS_META_PYTHON = "${PTESTS_SLOW_META_PYTHON} ${PTESTS_FAST_META_PYTHON}"
+
+IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
+
+BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS_META_PYTHON').split()])}"
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
+
-- 
2.34.1


