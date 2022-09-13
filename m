Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52A7C6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:15:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.3034.1663064156825315569
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rA5tjD3A;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064157; i=@fujitsu.com;
	bh=bBK1AkRydj4+E9t59hiLRLibQB44TTeuE2zdLNxoO8s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rA5tjD3AHb70d43qabyPIJv+mg8Damzir1SC36SpyMYMIA79MdDlmgrYeQkHCfODg
	 ZvWKndLzF+mDOrpErn+rI3b7Mj7aEOgp3Zg6rMpOvyjMria3ASWB35dE5rGtGaCp6X
	 mZ2aqtpcHGQwZ+mhHtIzcU9SrEncFSOx5ETp8NaM4z2+4MLjmKdNDz/pnPK88Yr5ld
	 w69yVke75Svv08okk9jkR9/CRcxvST2TiNZaKMjw1jQqsZvXqiH1lj1LwDy5xXbjq1
	 qLwEbjaK731MFZ11pnQTgDfzqQRwdCXJ2lBvWaUzhNpLnz9K5r3zv3/zW8FdP6AGgT
	 dxshuSnN6kpmQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8MxSTcmQiH
  Z4PoXa4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPhlZnMBa/4Kg7cvsjSwHiYt4uRk0NI4Amj
  xPVF6l2MXED2dSaJ/kMPWCCcPYwSH4/+YgWpYhNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hgRCJh2eYQMIsAqoSz99tYwGxeQUcJaa8nwZmSwgoSEx5+B6slVPASWJz3x1WiCMcJV
  7ffcQMUS8ocXLmExaI8RISB1+8YIboVZSYfbkZak6FROP0Q0wQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjDZJRZnpGSW5iZk5uoYGBrqGhqa6lpZAylIvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMIxTipPLdzBu3/dL7xCjJAeTkihvpJdCshBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJ3vgQoJxgUWp6akVaZg4wpmDSEhw8SiK8PMFAad7igsTc4sx0iNQpRkuOtQ0H9jJzXL
  1yBUjO/Np2gFmIJS8/L1VKnHemN1CDAEhDRmke3DhY3F9ilJUS5mVkYGAQ4ilILcrNLEGVf8U
  ozsGoJMwrEQY0hSczrwRu6yugg5iADjKylgc5qCQRISXVwJQ5IS41ROBhXPQftlPKK64XPZ5w
  5Ny8vGn1MXP3e8s/DNHZGb9r80ajPZ3zjXL0v2ZnS82QObtq6dOUW+sci9TfVz+9W7fpy2S9x
  FaJdaqvSo9M7488wp7ktmL316iIpTIXD81x+9QuxSEc5Lm0ydvpo2np5hLruXK7ClgZHBjjtF
  ksFwad8JrmOmHxApfIcD6D/Bzrt+6eq0rbd8999GTNxFdsa5fkyS7x/3lkq9keh7dBpwoD2YW
  ecz9XutzZ2/NlnphN7WcVrfNGpxx98z8wvvPdUyWWe/XVLVGWsyc/CV5Z/vpBwA9FPn/eO/u3
  Pl1f5JTTWb7TwkE6NmLKq4SVOzfobUvcI+P1P9rhV6kSS3FGoqEWc1FxIgAjUwUXdgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1663064156!89441!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1064 invoked from network); 13 Sep 2022 10:15:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:15:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6193E1000CE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:15:56 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 517B81000FC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:15:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:15:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfstests: upgrade 2022.08.07  ->
 2022.08.21
Date: Tue, 13 Sep 2022 18:15:40 +0800
Message-ID: <1663064143-3176-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064143-3176-1-git-send-email-wangmy@fujitsu.com>
References: <1663064143-3176-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:15:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98763

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...fstests_2022.08.07.bb => xfstests_2022.08.21.bb} | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.08.07.bb => xfstests_2022.08.21.bb} (78%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.07.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.21.bb
similarity index 78%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.07.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.21.bb
index ba8b1a24e0..d8caa13ba8 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.07.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.21.bb
@@ -4,14 +4,13 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038
 
 SRCREV_FORMAT = "xfstests_unionmount"
 
-SRC_URI = "\
-    git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests \
-    git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
-    file://0001-Add-a-return-type-to-aio_rw.patch \
-    file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
-"
+SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests \
+           git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
+           file://0001-Add-a-return-type-to-aio_rw.patch \
+           file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
+           "
 
-SRCREV_xfstests = "16ddbd1aee295f64695916cf3621aef57f1163ba"
+SRCREV_xfstests = "bf1ef26900eec3b028c1b0f55f65b3b233e47c56"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


