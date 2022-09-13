Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEECFC6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:14:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.3106.1663064050763723160
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=zJzOHbcM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064051; i=@fujitsu.com;
	bh=0tLAnMlJWs8l5ELJ9DhxjAG/zzjIaQHNCxnXYKTlblY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=zJzOHbcM32WF4TYpbZ3tYQwsNpMBb+A5Aez3V9Yhtf+5gY8iKDDVSwS6jNGzMnSP0
	 FqGVejVQYQ1RzGSFOjt9GFWBX8TOxArBH+KOV36zMotLwemRc+dfIBSap+A3m4DIsp
	 xumX3BsNfYb/g7QOpx56U8OL0lsdEOFy7d5atr8gkrRPY/pNJSjdZGRzHNOG3dFM/V
	 JQeaj/7J7pzZo+1UxKhbEEmssZEZJOpQlRcSBWovzAgD3k+WA3d9HpOaIV+BtarKuL
	 0fK2AZHFHoKc0KBzA+p/tqckSWGxB5I+iONquH8J9vknl+j6hdot53/Nly1EnlXv7v
	 XKGL3VO3RkYjQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSfdTuEK
  ywer32hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bK5f+YCv6zV2z7cIaxgXElexcjF4eQwBNG
  ic0Hd0E515kktk3rY+pi5ARy9jBKTPuWBGKzCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLGAncfLvWzCbRUBVonPmKqA5HBy8Ao4SDze4goQlBBQkpjx8D9bKKeAksWPKJlaIVY4Se5
  4uBlvLKyAocXLmExaI8RISB1+8YIboVZSYfbmZBcKukGicfogJwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itEmqSgzPaMkNzEzR9fQwEDX0NAUSBvqGhvoJVbpJuqllurm5ReVZOga6iWWF+ulFhfr
  FVfmJuek6OWllmxiBIZxSnGq3A7GA/t+6R1ilORgUhLljfRSSBbiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwRsfApQTLEpNT61Iy8wBxhRMWoKDR0mElycYKM1bXJCYW5yZDpE6xajLMfNr2wFmIZ
  a8/LxUKXHemd5ARQIgRRmleXAjYPF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr0QY0BS
  ezLwSuE2vgI5gAjrCyFoe5IiSRISUVAPTet3FvJUGfE4am/k9Z9tF+brPd92tseT0PrNLexJD
  Nqw9fOLl8Umb3VKTW6ILBT4djq65IPZOucjRNTl+8ka7eE4nH7foxjnrvHSfOZZvffEgv/R1w
  SsV2ZsLS1U05bkOWrMsb80ObS+VvbFT9H/QnbafH7g5oz9yagVxZjY7lXSxsRRLFy9IaF18it
  11z9VFZ/JXp3Q2qdWG3u1LUv537vB8T1ez+Yt5U55b6s18bs/R9bRL5r1n7M5F+k9O6fNV+PC
  0VD1V2Rgf2W/UmPBI7kTZetUDxyfUZ+lbLfldmPdr02nPpmKDKo8p0jv3PiyUWrdwc+KXW3/E
  zz0qrWhseHBdxqTZbrNvpZjfJiWW4oxEQy3mouJEAIuoGjRqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1663064050!447100!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22357 invoked from network); 13 Sep 2022 10:14:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:14:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 254561000CE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:14:10 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 189B41000CD
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:14:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:14:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.361 -> 0.362
Date: Tue, 13 Sep 2022 18:13:52 +0800
Message-ID: <1663064034-3136-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064034-3136-1-git-send-email-wangmy@fujitsu.com>
References: <1663064034-3136-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:14:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98759

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.361.bb => hwdata_0.362.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.361.bb => hwdata_0.362.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.361.bb b/meta-oe/recipes-support/hwdata/hwdata_0.362.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.361.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.362.bb
index c8daf7d5f9..e408c4db5a 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.361.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.362.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "a934c616e2e666552586caa85af9fc583855df49"
+SRCREV = "8a3647e5da0a157cbf1bff1845b0cdaf1ce1bdb0"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


