Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2681EC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:42:01 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.48406.1681717316874597080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gVRkykyx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717314; i=@fujitsu.com;
	bh=6bln0UT5wxOywJkg7jZHaKmOjaB6Q10+XEER9aNhbio=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gVRkykyxGlMgfPOFb0ztyvgnX4txxbDW89PEjNRRiqMppW7BPMWnYfMmYnPreACt2
	 GewLRsznQQQQdWa03RncGBRqpiByTXmIVBexnas40GrMzBsjPIoLQNacZH8q/PB6U9
	 zIubUyuEHcaNFHQTjKKzpyxfRM+BFu8nFqv21FkWeY9YABdracDZZhIZ83RSp0oss7
	 bDeLBz0mZV1gSe18thVduL1mVYl7e3UnrRknXXVn8VhoAnmEDvdyd5BamLA+urFw+K
	 MA/Du5gaQ96f6IoUy10r1f3jKRI754Q8UjrZevdCpIhlXQuVEVLobNtt0aHZhTuG6F
	 EfwDAhP23qCvQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWdfxh02
  KwcdHNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bjx+fZC+5yVPw51szewNjE0cXIySEk8JBR
  ouWNRBcjF5B9lUni4a5v7BCJvYwSM4+WgdhsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N0DV
  i8s4CGxq7uBCcRmEVCV2LtkHyuIzSvgJHH7+2ZGEFtCQEFiysP3YL2cAs4SKxb+ZoXY5SQxae
  EbRoh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdqVE64dfULaaxNVzm5gnMArOQtI+C0n7Aka
  mVYxmxalFZalFuoaWeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBoZtSzHp8B+Osvr96hxglOZiURHlfpFqnCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgP
  f/NJkVIsCg1PbUiLTMHGEcwaQkOHiURXuNnQGne4oLE3OLMdIjUKUZFKXFe/+9ACQGQREZpHl
  wbLHYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmfQOynSczrwRu+iugxUxAi+WUwBaXJCK
  kpBqYNFZcdFDJK/qZrnuXsTchQKG/WzTg75QKNdUq35eh1f0f5LWYP63naf6QfIS7/PuWkOu/
  DtfMcpNV4Yv6tJopsbLUKYfzfIXVwys3H01u+R21Kfrj6Rn2IktnrFshy269Mlr7As+rrAXLa
  xoWyJTOdKy9u/uNmsw347/3Pr7o7tro3xjovvQ2w5uwtQaif878T9CNDU+9EjetrT/SPELt9u
  EtjtHtf24nLd/EJGX5cG5cmFyDzUnTRnmZ7LafHcn2WiUBBS/ffj346YbOz1ar2Z0OHlwfps/
  WNlzwubW3OOnWFK8/Xv6Lpn5ZfPHzL1uJFztbGmXsnc+w/RUV5Nh79zLjNCutw9sD1xRfuC6g
  xFKckWioxVxUnAgAVYoCXlgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1681717313!739149!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25788 invoked from network); 17 Apr 2023 07:41:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:41:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9DDF2151
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:41:53 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 926FA142
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:41:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:41:52 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.1.0 -> 6.2.0
Date: Mon, 17 Apr 2023 15:41:32 +0800
Message-ID: <1681717292-19167-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717292-19167-1-git-send-email-wangmy@fujitsu.com>
References: <1681717292-19167-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102116

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.1.0.bb => python3-web3_6.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.1.0.bb => python3-web3_6.2.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.1.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.2.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_6.1.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.2.0.bb
index b813e632b..8e09cabbb 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "55e58f2b8705f0911db5a395343b158d5e4edae9973f5dcb349512ae5a349af5"
+SRC_URI[sha256sum] = "7695ee81162c644de0dfd0f5372f96a73be557b46365d218f581ca10197c6389"
 
 inherit pypi setuptools3
 
-- 
2.34.1


