Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD4EC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 16:48:44 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.48553.1679503714228052154
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 09:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gxi5Efva;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202303221648309afab3a669e721a6be-1yo4ql@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202303221648309afab3a669e721a6be
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 22 Mar 2023 17:48:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=r7L5mUAbMdi26gYEeGT1kAnkEDD5xsR07Zg+RcqGZiU=;
 b=gxi5EfvahbiA9he7tbawVokcAOZRgXvXC9+tb1D3LuC8CuKBoH77WHKM6PYGtiDp7XDUWm
 AyWLfE8OTVNoy90iB7rdaUUxfQ2mZM5M2ZBsP4bmzadP95c8WVwPVjVWYogkZweHqOoY3hRB
 3o0L5OZJ3D6mFtq6WOcYjccP8iOOM=;
From: "P. Marko" <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][langdale][PATCH] c-ares: fix CVE-2022-4904
Date: Wed, 22 Mar 2023 17:47:38 +0100
Message-Id: <20230322164738.3967-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 16:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101639

From: Peter Marko <peter.marko@siemens.com>

Backport based on https://github.com/c-ares/c-ares/issues/496

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../c-ares/c-ares/CVE-2022-4904.patch         | 66 +++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.18.1.bb   |  4 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
new file mode 100644
index 000000000..0a0e8f0b6
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
@@ -0,0 +1,66 @@
+From 9903253c347f9e0bffd285ae3829aef251cc852d Mon Sep 17 00:00:00 2001
+From: hopper-vul <118949689+hopper-vul@users.noreply.github.com>
+Date: Wed, 18 Jan 2023 22:14:26 +0800
+Subject: [PATCH] Add str len check in config_sortlist to avoid stack overflow
+ (#497)
+
+In ares_set_sortlist, it calls config_sortlist(..., sortstr) to parse
+the input str and initialize a sortlist configuration.
+
+However, ares_set_sortlist has not any checks about the validity of the input str.
+It is very easy to create an arbitrary length stack overflow with the unchecked
+`memcpy(ipbuf, str, q-str);` and `memcpy(ipbufpfx, str, q-str);`
+statements in the config_sortlist call, which could potentially cause severe
+security impact in practical programs.
+
+This commit add necessary check for `ipbuf` and `ipbufpfx` which avoid the
+potential stack overflows.
+
+fixes #496
+
+Fix By: @hopper-vul
+
+CVE: CVE-2022-4415
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/9903253c347f9e0bffd285ae3829aef251cc852d]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/lib/ares_init.c    | 4 ++++
+ test/ares-test-init.cc | 2 ++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/lib/ares_init.c b/src/lib/ares_init.c
+index 51668a5c..3f9cec65 100644
+--- a/src/lib/ares_init.c
++++ b/src/lib/ares_init.c
+@@ -1913,6 +1913,8 @@ static int config_sortlist(struct apattern **sortlist, int *nsort,
+       q = str;
+       while (*q && *q != '/' && *q != ';' && !ISSPACE(*q))
+         q++;
++      if (q-str >= 16)
++        return ARES_EBADSTR;
+       memcpy(ipbuf, str, q-str);
+       ipbuf[q-str] = '\0';
+       /* Find the prefix */
+@@ -1921,6 +1923,8 @@ static int config_sortlist(struct apattern **sortlist, int *nsort,
+           const char *str2 = q+1;
+           while (*q && *q != ';' && !ISSPACE(*q))
+             q++;
++          if (q-str >= 32)
++            return ARES_EBADSTR;
+           memcpy(ipbufpfx, str, q-str);
+           ipbufpfx[q-str] = '\0';
+           str = str2;
+diff --git a/test/ares-test-init.cc b/test/ares-test-init.cc
+index 63c6a228..ee845181 100644
+--- a/test/ares-test-init.cc
++++ b/test/ares-test-init.cc
+@@ -275,6 +275,8 @@ TEST_F(DefaultChannelTest, SetAddresses) {
+ 
+ TEST_F(DefaultChannelTest, SetSortlistFailures) {
+   EXPECT_EQ(ARES_ENODATA, ares_set_sortlist(nullptr, "1.2.3.4"));
++  EXPECT_EQ(ARES_EBADSTR, ares_set_sortlist(channel_, "111.111.111.111*/16"));
++  EXPECT_EQ(ARES_EBADSTR, ares_set_sortlist(channel_, "111.111.111.111/255.255.255.240*"));
+   EXPECT_EQ(ARES_SUCCESS, ares_set_sortlist(channel_, "xyzzy ; lwk"));
+   EXPECT_EQ(ARES_SUCCESS, ares_set_sortlist(channel_, "xyzzy ; 0x123"));
+ }
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index 2cd00cb57..5614d1310 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -5,7 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
+           file://CVE-2022-4904.patch \
+          "
 SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
-- 
2.30.2


