Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D64FC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:39:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.49010.1681717130953789928
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B6xh7MhD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717129; i=@fujitsu.com;
	bh=RlXcjtUoiNvLiw3WfXLiIdlPFO6l9dGm9YNTJvg3SK8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=B6xh7MhDAxjL9TZCaIfgYxqdYhRIB8P2gbb1UlHc9gU7QgiZ7BpxyUxzVnsxPcWMu
	 2m6TpOxLhjfPRDgcBtPPSqcYBLR30x2yO6tkdBewo22UnScw1SW6YBFd2JWvEaSo/R
	 pMBaeujl6AbKii9ObC+MnMZq6FW+zCqU2KAR52Z00sfJWZTlCX4XoXm36paei9yKrr
	 RfV7pwXFv52x7CyamB9IqVoG1ziXVZA17aQ8TC+fUYYWWwwcW/Cl3ugg5XIUdCjsJS
	 RrE8pf+RokASzEG4tY0hwld14mQn8Mg6pNCRs+cRjAqkM53tIqBdheOP7XyxUf6Hcl
	 6APm+XeconHNg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqNvx3Sb
  FoO2zscXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjHz8kLGgi6OihVzzrE1MK5k72Lk4hASeMIo
  MXP3fVYI5waTxMf2P2xdjJxAzl5GifnPi0BsNgEpiRv3/4PFRQT0JZbO3sMMYjMLqEi8+N0DN
  ImDQ1jAQeLIVQGQMIuAqsTbnzMZQWxeASeJ5bNXsIPYEgIKElMevgdr5RRwljjce5AZYpWTRE
  PjdVaIekGJkzOfsECMl5A4+OIFM0SvosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMZsWpRWWpRbpGeklFmekZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgaGbUpz8aQfjut6/eocYJTmYlER5X6RapwjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  F312SZFSLAoNT21Ii0zBxhHMGkJDh4lEV7jZ0Bp3uKCxNzizHSI1ClGRSlxXutvQAkBkERGaR
  5cGyx2LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5g3/AjSFJzOvBG76K6DFTECL5ZTAFpc
  kIqSkGpgWvZldMK1xsvzpx5ODTlb/40iKyGVQ2mH4IPKZkunl2+cNK0pfmAue0m54sq3YffXc
  VXXOb96xLvi+db9Xts7Xu3kCrj93feR9UaR5v/yAfvuvkC3n9y8RtgmImzzv2/s/fM4m+d57p
  lcxsG1paFw8pbY+uafqRP1VAbU/ImLPAjYa2tZq1O8oPzTjjOZ2lvdPqmTbnS5Kxn3yWPly1R
  8ZXp/01MtsS9gSFTeKSqc0VDv43+zeoiB8/YF11t+c/a9zcqLzVvKqTQu3Ds4+s+cTd2BfFNu
  Ct32aX3b7VUXpntS6/Nxjyb6y6nUMDHKb3u/wYGtSijF71yCbo15w1/sjw83JHnHOTMVhPxIf
  vVJiKc5INNRiLipOBABJYHWRWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-732.messagelabs.com!1681717128!219148!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12325 invoked from network); 17 Apr 2023 07:38:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:38:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4C2DA1001A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:38:48 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3D4F9100194
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:38:48 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:38:46 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] mctp: upgrade 1.0 -> 1.1
Date: Mon, 17 Apr 2023 15:38:04 +0800
Message-ID: <1681717086-19067-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717086-19067-1-git-send-email-wangmy@fujitsu.com>
References: <1681717086-19067-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102104

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/mctp/{mctp_git.bb => mctp_1.1.bb}         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-networking/recipes-support/mctp/{mctp_git.bb => mctp_1.1.bb} (94%)

diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-networking/recipes-support/mctp/mctp_1.1.bb
similarity index 94%
rename from meta-networking/recipes-support/mctp/mctp_git.bb
rename to meta-networking/recipes-support/mctp/mctp_1.1.bb
index edc614d34..bf3961be4 100644
--- a/meta-networking/recipes-support/mctp/mctp_git.bb
+++ b/meta-networking/recipes-support/mctp/mctp_1.1.bb
@@ -5,9 +5,7 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4cc91856b08b094b4f406a29dc61db21"
 
-PV = "1.0+git${SRCPV}"
-
-SRCREV = "ae3a9162d6c5df0fa50abc34fc951dfd0e3d23c5"
+SRCREV = "a591ad885aa28f113cb45870b2fd5bce48378d6f"
 
 SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https"
 
-- 
2.34.1


