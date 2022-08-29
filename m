Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803FCECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 07:41:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.68146.1661758900886656612
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 00:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cjDViMtC;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661758899; i=@fujitsu.com;
	bh=4v8SRNRdkEG4bA9ANUhP+Pn9GmFQUfiexAbijR1ci2g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cjDViMtCwNAfg/IxRx78lGG7XBVjzWnL1f2weW3jrQfVO+gd2EYIaQS2UhBfWU+xI
	 bVRMPztFcploai2ns5GEH1mnLYSlc3TMmUjdW7LmbKdDt3JSaidW6RuNvXqP2hxU4p
	 UZCAJUWkVVIsULRG0ehHBvXu8fvQmoTk0mqn6AXQiZY7RdJkK1mEbIPq7wWtoKc8Vl
	 4cfDftotA6fgQUzwFwGfq4A3aewmpJDiPyJaFWxs44MXf0SgtmndWDz5T8H3e2uOy+
	 Qx4TBNXmCvHlXVCwzWR228JWrGQJyCbOiv5DaHN3yTCZ3G8MPPcumobJkax6smC3cS
	 GkdfQgtyK/KHQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORqLsplyf
  Z4PkMVYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePCz59MBXPEK+bMmcTUwHhPpIuRi0NI4Amj
  xMJzXYxdjJxAzg0miU+fKiESexklVvcfYwFJsAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgInFz2SEmEJtFQFVi+9TTQDYHB6+Ao8TtRk6QsISAgsSUh+/BWnkFBCVOznzCAjFGQu
  LgixfMEDWKErMvN7NA2JUSe2b1M0HYahJXz21insDIPwtJ+ywk7QsYmVYxWicVZaZnlOQmZub
  oGhoY6Boamuoam+oaWpjoJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEBmVK
  sfKOHYxtq37qHWKU5GBSEuU9lsOTLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC90kaUE6wKDU9t
  SItMwcYITBpCQ4eJRHeRJBW3uKCxNzizHSI1ClGe46ps//tZ+ZYDiZnfm07wMyxaV/XAWYhlr
  z8vFQpcd4skDYBkLaM0jy4obCIvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmDcbZApPZl4
  J3O5XQGcxAZ31cAk3yFkliQgpqQYmywt9f687X4w8NfVO/IUAxyQdlifdzidWTXYNVHu85E/L
  44dbzvY4p63fLOW0p3GByZ7QbCsZ/69CpxQyr3I9OzLpfNdW1VCnEJ/r/ssm3T2W96Jxww7L+
  otyWtOcy82y+h9Ky654tDQ2Ou5WsEq2PPOFS6rOjeeM0rPvJM7yfrdmvpb827nzyrS7+TkdN5
  Q0fLvewGX4we2sV0WkdGaV6PRiDsFYQdU3G9X57RjNYs6XSh66MOfA7NdB9dy8l9faaPmqBj3
  PLprt7nqZw/jOx6gpa/qenVZL8O6cJfPmVGjnmpunK6XV/597ZX9HRLJyXfj9FXdV9NNXM6WW
  Tv21myF5pcdnPbN1+xw3Vn5VYinOSDTUYi4qTgQAPB4aYGMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-571.messagelabs.com!1661758898!338582!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11111 invoked from network); 29 Aug 2022 07:41:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 07:41:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4704110019A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:41:38 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3A1EE100199
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:41:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 08:41:36 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH v2] babl: upgrade 0.1.94 -> 0.1.96
Date: Mon, 29 Aug 2022 15:41:23 +0800
Message-ID: <1661758883-5274-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 07:41:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98519

0001-meson-Do-not-run-git-rev-parse-during-configure.patch
removed since it's not available in 0.1.96

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t-run-git-rev-parse-during-configure.patch | 35 -------------------
 .../babl/{babl_0.1.94.bb => babl_0.1.96.bb}   |  6 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-gnome/recipes-gimp/babl/babl/0001-meson-Do-not-run-git-rev-parse-during-configure.patch
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.94.bb => babl_0.1.96.bb} (76%)

diff --git a/meta-gnome/recipes-gimp/babl/babl/0001-meson-Do-not-run-git-rev-parse-during-configure.patch b/meta-gnome/recipes-gimp/babl/babl/0001-meson-Do-not-run-git-rev-parse-during-configure.patch
deleted file mode 100644
index bb129a4178..0000000000
--- a/meta-gnome/recipes-gimp/babl/babl/0001-meson-Do-not-run-git-rev-parse-during-configure.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0e41b11b23c91293d1b39a8ec4cb80c68fb26ad7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 28 Apr 2022 07:35:31 -0700
-Subject: [PATCH] meson: Do not run git rev-parse during configure
-
-This option will try to deduce if babl is being built from git tree or
-release tarball, there should be a better way like checking for .git
-directory etc. instead of doing git operations needing network
-
-see
-https://gitlab.gnome.org/GNOME/babl/-/commit/2dc7fc403fe427a889913ef0cfb71de85b4326ec#note_1439732
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 7e7a935..649b456 100644
---- a/meson.build
-+++ b/meson.build
-@@ -451,7 +451,7 @@ if git_bin.found() and run_command(
-     git_bin,
-     'rev-parse',
-     '--is-inside-work-tree',
--    check: true,
-+    check: false,
- ).returncode() == 0
-   git_version_h = vcs_tag(
-     input : 'git-version.h.in',
--- 
-2.36.0
-
diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.94.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.96.bb
similarity index 76%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.94.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.96.bb
index 7161356c11..85cc7793cc 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.94.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.96.bb
@@ -14,9 +14,7 @@ DEPENDS += "lcms"
 CFLAGS:append:toolchain-clang:mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS:append:toolchain-clang:riscv64 = " -ffp-exception-behavior=ignore "
 
-SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz \
-           file://0001-meson-Do-not-run-git-rev-parse-during-configure.patch \
-           "
-SRC_URI[sha256sum] = "b6a8b28f55e0c17f5031fb7959e72ffe0fbf8196d1968ad6efc98d1b492c3bbe"
+SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
+SRC_URI[sha256sum] = "33673fe459a983f411245a49f81fd7f1966af1ea8eca9b095a940c542b8545f6"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


