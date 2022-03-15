Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DA0C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 12:14:15 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.10093.1647346454744917936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 05:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i6Vl42KT;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647346452; i=@fujitsu.com;
	bh=33JQvk2jv9WQbgA3X51SR0J2spMB3UeeOt7nQlrBirY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=i6Vl42KT3WvfVmQU6mHM2QrkiB9bAZDqIbYdGJslieBUQVP6Tm++X7swIjDoETm8x
	 NDrALtZXU3EW6RozbCKzlN+B9k2eHp6TZNZcI8F5sJvdQ8KHt6nDcaInTx5FfTDK9m
	 UUtwtwpzNcM/lG4pN1uXcyrxoR68WKPe12nxayYvHM4s560OPUsNTqwdMwUkEYb0Y0
	 dt79+i+pPcOFkCN6jr9y0iomETWO3dw+F9/4jdFrjLcWQ3FGnz15t8fXeo9k6uDwrq
	 IRqgSziGO/lt4aYBw6/8RiyMNYmUlfdZcCqbXy/COdfwwvaie9hcKicyRqpJcekx4C
	 tqEtDdvn+obrA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSVek2SD
  JYNcuRYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP6s63MBXd5KqbcfsjcwHiCu4uRi0NI4Amj
  xJE/75ghnAtMEg8XtjNCOCcYJXZOuwOU4eRgE1CTmH7rBiuILSKgL7F09h6wOLOAisSL3z3sI
  LawgKdE5+3LbCA2i4CqRO/JTqA4BwevgJPEvI0WIGEJAQWJKQ/fg7XyCghKnJz5hAVijITEwR
  cvmCFqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRKKspMzyjJTczM0TU
  0MNA1NDTVNdQ1MjDWS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMqUYsbT
  Oxg39f3UO8QoycGkJMpbWG6QJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCN6UeKCdYlJqeWpGWm
  QOMEJi0BAePkgjvy1KgNG9xQWJucWY6ROoUo6KUOK9aE1BCACSRUZoH1waLykuMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHndQabwZOaVwE1/BbSYCWjxPGk9kMUliQgpqQYmO4PVRxddFKt
  qCN59ovSIMI89//J/wpKR0tFzZzYyLmjdViExVXHynR8GRz7UmklaKXvvioxgesY+Jc9PwuC9
  Q7SCU14xk8GfO/IBGms0D+ut1Al8IFA/M/aZud//H3ve6H5fn1ActyTh6Q+RPv4Jr2KmH4pXd
  OILtfGPePq3yEIgXPyrfHFm1id9bxf7p93nbn74++8OwyPGkxke7/U0TjQ+/iUdMllis2ZC9y
  oZ/7ydT1SCLOROaW5yuzl3TtNOB+5AA/087fWN70+K5QgeLU0p3nmxUHXSirzlK6XulFiXxtb
  mTuwISr2TKua9dNvfvclC2S+e8t6vv3zl5zfv9z+q3m1f2Jjddsjmob0SS3FGoqEWc1FxIgAN
  b/aURQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1647346452!20202!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28609 invoked from network); 15 Mar 2022 12:14:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 12:14:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1F2FD1000F9
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 12:14:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 12D101000F5
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 12:14:12 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 12:13:50 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] smbnetfs: upgrade 0.6.1 -> 0.6.3
Date: Tue, 15 Mar 2022 20:13:35 +0800
Message-ID: <1647346415-79100-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 12:14:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95989

configure.patch refreshed for new version.

Changelog:
========
add files for debian packaging

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-filesystems/smbnetfs/smbnetfs/configure.patch     | 2 +-
 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
index f22b389b1c..31892d230d 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
@@ -1,7 +1,7 @@
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1,5 +1,5 @@
- AC_INIT([SMBNetFS],[0.6.2])
+ AC_INIT([SMBNetFS],[0.6.3])
 -AM_INIT_AUTOMAKE
 +AM_INIT_AUTOMAKE([foreign])
  AC_CONFIG_HEADERS([src/config.h])
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index ddc4962fb2..2d9eab1dd5 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -16,9 +16,9 @@ inherit autotools pkgconfig features_check
 # samba depends on libpam
 REQUIRED_DISTRO_FEATURES = "pam"
 
-PV = "0.6.1+git${SRCPV}"
+PV = "0.6.3"
 
-SRCREV = "a117eec8de7ed7249871da73dcc350283ce72069"
+SRCREV = "736d5e599df3bebce3450125118ac2e70358b0c9"
 
 SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master \
            file://configure.patch \
-- 
2.25.1


