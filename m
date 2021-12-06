Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE82C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:20:58 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.52917.1638804056565134981
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EZJVW/z1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638804054; i=@fujitsu.com;
	bh=ABtI8+/q6FkfDrO1K8OCibMqfGVGBNGtI5ONqgzicyU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EZJVW/z1OqrlDRN9K9Q8LBBixEmVWQpzW2HPNSqrMgMRMHEYVwcJCJmKJVQ+Dn/W/
	 hDHXg7e2pZtyEtwn+P0VuQqhTk86V4zOkd6pM9JNNifFAmy72YyqHl6oKKSRqf5XzZ
	 025fpu181sSq/F9ZvADRwbC12DMWj/Kxq8ypAzrhOvQZOzK5yf0SU0DiRBQAf3ymHs
	 XB2IZLv7ccc9HvQ4lGKHehLXXpEteWAUvsXgQFoSblLvKB1vl2dOEkMMuGby/YvNMT
	 9UkpQHhSybP3gfoFtIabCkGSgBM9WM0WIisPyoJGMRI/L3LLHA2+yF7wRCqkPFlmVc
	 N+wUgQcsSFljg==
Received: from [100.113.1.109] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id A2/38-29929-65A2EA16;
 Mon, 06 Dec 2021 15:20:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxSTdMa12
  iwdVZvBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a5v/eYCj5xVJz+mt/A2MPRxcjJISTwhFHi
  8FfXLkYuIPsCk8SVxztYIZzjjBLLVixgAaliE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBSovPgdSYQmwUo/rPpMBuIzSvgKLHz+2WwuISAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGkWJ2ZebWSDsColZs9qgetUkrp7bxDyBkX8WkvZZSNoXMDKtYrRIKspMzyjJTczM0TU0MNA
  1NDTWNdQ1NdRLrNJN1Est1U1OzSspSgRK6iWWF+sVV+Ym56To5aWWbGIEhmNKIaPxDsaDrz/o
  HWKU5GBSEuX1EFuXKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCt1EDKCdYlJqeWpGWmQOMDZi0B
  AePkgjvQU2gNG9xQWJucWY6ROoUo6KUOG8zSEIAJJFRmgfXBovHS4yyUsK8jAwMDEI8BalFuZ
  klqPKvGMU5GJWEeWeDTOHJzCuBm/4KaDET0OKY/tUgi0sSEVJSDUwsx2NXJJwK/Sf123L+HXZ
  nhf2LVLo8/W9Fn3iktNh5keHBuqv/+dsfGG567DgnUbu9IC6Zv3UPZ975RiHttMs+Upvl5+V7
  cEz+OyF55jQFRu79tmpWpgyVs7Zzd734sDa8gnPhmjRW9nNbeoozg/+vn+cxl32LvxHPLAbRq
  ct5jmhn39uUtfPSK7u+8D+LBHWL5pUae28KKXIrqPE59P5A4bsUJ7kIi30cfD1qJc5vl14w7A
  1Yq1d0+J1h6Gf1HZO/yAVMNU1nYhENEr90a/72c/2REjNs3x1xSFlWnOq49bjZ5PzrjUsO63y
  YOuWP03yN4k/vnqqJl91mvxbYMOED09pL/vOle7IsSycnNSixFGckGmoxFxUnAgDaJwjdQgMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-232.messagelabs.com!1638804053!360119!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18787 invoked from network); 6 Dec 2021 15:20:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Dec 2021 15:20:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B8275100456
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:20:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 970B2100455
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:20:53 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 15:20:49 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gsl: upgrade 2.7 -> 2.7.1
Date: Mon, 6 Dec 2021 23:20:37 +0800
Message-ID: <1638804037-8145-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Dec 2021 15:20:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94217

Changes:
  update libtool version numbers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/gsl/gsl_2.7.1.bb | 4 ++++
 meta-oe/recipes-support/gsl/gsl_2.7.bb   | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/gsl/gsl_2.7.1.bb
 delete mode 100644 meta-oe/recipes-support/gsl/gsl_2.7.bb

diff --git a/meta-oe/recipes-support/gsl/gsl_2.7.1.bb b/meta-oe/recipes-support/gsl/gsl_2.7.1.bb
new file mode 100644
index 0000000000..a4dc1437e2
--- /dev/null
+++ b/meta-oe/recipes-support/gsl/gsl_2.7.1.bb
@@ -0,0 +1,4 @@
+include gsl.inc
+
+SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
+SRC_URI[sha256sum] = "dcb0fbd43048832b757ff9942691a8dd70026d5da0ff85601e52687f6deeb34b"
diff --git a/meta-oe/recipes-support/gsl/gsl_2.7.bb b/meta-oe/recipes-support/gsl/gsl_2.7.bb
deleted file mode 100644
index d40eebb4ca..0000000000
--- a/meta-oe/recipes-support/gsl/gsl_2.7.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include gsl.inc
-
-SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
-SRC_URI[sha256sum] = "efbbf3785da0e53038be7907500628b466152dbc3c173a87de1b5eba2e23602b"
-- 
2.25.1


