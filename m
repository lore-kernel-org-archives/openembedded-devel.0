Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCDBC19F2C
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:41:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.6293.1659447686510685602
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iFy0XE2p;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447685; i=@fujitsu.com;
	bh=inba+O1iXt0nAEhLyf4VZKEwkIPw9yTSGeX8aiD6RBU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iFy0XE2pm1hsMilfg6ST9anXifBWzGPlWofY2RsEtUi1kHPvk3wIND6KAPLo67hnE
	 NTqQNZKbIFiQJK2RRJ9e0eXg22NxnjuLhjBbS6oJcKZR0ffV6NYY0WmvQYGeqg1Kn0
	 w67r1zk1fAfQkPlvLLxm1+95Y0wVFN6MEwtJxSiAuSeZKWOH5YIa8dXIGOg113fP6x
	 ahDOm+IbQ9VjvC1s+i8sb27WmKmu9up/Pni/VD/eWgFSXT8gwZUsK5YkeCPD0oDMAp
	 K4l5TNSAb06nIDXPDiuh6QKFeDWGzFT0bdSpergZYK2YSgaPKrIgup2H+49SMN/PPR
	 JV86cAQxHK85w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRWlGSWpSXmKPExsViZ8OxWbdV82W
  Swb0rkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bUrd+ZC9q4K7qnvmduYLzF2cXIxSEk8JBR
  4uyJbhYI5zKTxORf59ghnN2MEkv6TgA5nBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N0DV
  iMs4CxxZd4CFhCbBSi+cNkqJhCbV8BJov/DGzBbQkBBYsrD92C9nED1lyadYeti5ABa5iSxfX
  0hRLmgxMmZT1ggxktIHHzxghmiVVFi9uVmFgi7QmLGjG1sELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYy2SUWZ6RkluYmZObqGBga6hoamQNpY19DESC+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4
  Mjc5J0UvL7VkEyMwlFOK0/t2MG7c90vvEKMkB5OSKK+c4sskIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8t1SBcoJFqempFWmZOcC4gklLcPAoifCe1QBK8xYXJOYWZ6ZDpE4x2nNcvXJlLzPH1N
  n/9jNzLAeTM7+2HWAWYsnLz0uVEuddDtImANKWUZoHNxSWBi4xykoJ8zIyMDAI8RSkFuVmlqD
  Kv2IU52BUEublA5nCk5lXArf7FdBZTEBn6XC9ADmrJBEhJdXAJBS04FLobsaJC5PMDMzYo9NU
  +xPWv9TI3Cab8OtgxOf0r6tVvh6Y6mb4j3n52aZuZ+GzjY4Hqh4vbW7Z/CCJb8MRl2rx2UXd4
  pN12Y4n/i1XDLP9m7Dzk4iTcsJ567/SPt8E/3z74yo6K3zRxTf/rF4HyXcoprbOmhT6Y+5dO0
  /2GQtOGc5vmmsjviJQ7tIiQ5uJ6TsLWNiFDH2ll7x1meu69B7zj50mzyJSjb71ZvTniejkxtz
  kO6D9N+rZ37Szh41eusznP/N/4/QpT2/4ndr6nF2Df/06kRPN582PzPbgcm3Wv2ynOLnH9Fh0
  uvvU9q1N010eGXFYJnudKVy9aOeX/O+zeR5N6zOa8ph7mhJLcUaioRZzUXEiABK/GSp+AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-732.messagelabs.com!1659447685!65344!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25242 invoked from network); 2 Aug 2022 13:41:25 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:41:25 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CF22D152
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:41:24 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C2A2475
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:41:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:41:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libwacom: upgrade 2.3.0 -> 2.4.0
Date: Tue, 2 Aug 2022 21:41:07 +0800
Message-ID: <1659447669-24388-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447669-24388-1-git-send-email-wangmy@fujitsu.com>
References: <1659447669-24388-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:41:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98090

Changelog:
==========
  Update README.md
  Add support for the Huion Inspiroy H1060P
  Add support for Huion MiniDial KD100 (#470)
  Add Chuwi MiniBook X (#508)
  CI: upgrade FreeBSD to 13.1 (#507)
  data: Add XP-Pen Deco L (#509)
  Add support for XP-Pen Artist 12. (#505)
  Revert "Add support for Huion MiniDial KD100 (#470)" (#504)
  Remove leftover autogen.sh (#503)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libwacom/{libwacom_2.3.0.bb => libwacom_2.4.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libwacom/{libwacom_2.3.0.bb => libwacom_2.4.0.bb} (93%)

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.3.0.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.4.0.bb
similarity index 93%
rename from meta-gnome/recipes-support/libwacom/libwacom_2.3.0.bb
rename to meta-gnome/recipes-support/libwacom/libwacom_2.4.0.bb
index 41d8c62424..d690df9229 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.3.0.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.4.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
 
 SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https"
-SRCREV = "b88053851ef81694b9e3927e0857f0f02ff9a8a8"
+SRCREV = "9fd28747534ef776ffecc245721a4faa43bdd89b"
 
 DEPENDS = " \
     libxml2-native \
-- 
2.25.1


