Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D127C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:22:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.29477.1652084557421996094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=m7n1yq9H;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084555; i=@fujitsu.com;
	bh=/J/vSEDWqWLJxkKxYIWY+EdHUApqsCOOdZGL4JVJn0s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=m7n1yq9HQKo7p++TN4/KhDxk7LHElUs1eo0sX0AOVQOzopQwiKDmNPaYYrt8mbr6F
	 SEHQrtl4Hck8ermYcmCqD9AseYvhv3dPypPx1BZFpjdQNXuuuAwrnUDywH4Pn4cjA5
	 /h6TG+bhg/3kl+KNcjL4PuxR0b2/nGiZIyrN9kZuLvubvl9pqiJ3i/aSyGpRIeoxvb
	 ECHs9S+5kuP+pIRfJnzMUhdGgtjkJ2i1Lo7mPIidf6CJFgsdT1WmCZMykeU8k32IJx
	 ZmA3aBteXYeEHb0a7U7xQfFByYostjYoBaVxhfu6nloD9Ag07MFl025TaW7reVIvL5
	 i1RT4SZYzueCQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8ORqOt9viL
  JoO+NlMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjF7+y+mgr/sFZvPv2NvYFzO3sXIxSEk8IRR
  YkPDE6YuRk4g5wKTxP4NURCJ3YwSX5saWEESbAJqEtNv3QCzRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC9hJvFz4lQ3EZhFQlXhw6QlYDa+Ak8T/Y5PAeiUEFCSmPHwPFucUcJZYP/EXG8RiJ4kfP2
  6xQdQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0TirKTM8oyU3MzNE1NDDQNTQ01TU21TU0sdRLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM45Ri5ak7GE+v+ql3iFGSg0lJlLeyqSJJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgSvwymgnGBRanpqRVpmDjCmYNISHDxKIrx3TwCleYsLEnOLM9MhUqcYjTnuLty7l5nj6p
  Ure5mFWPLy81KlxHm/nwUqFQApzSjNgxsEi/VLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR
  560Cm8GTmlcDtewV0ChPQKR8DSkFOKUlESEk1MDUYet/sanl/utnFVb+1UcBxt0rX53LxJvVJ
  jp8sjt5IaG1g9JNJ/fdXROPMd+u+3gXTXnQ03ZPSY7h23KvDQ8u0WOq3xAezqTIRW6JK71uWb
  /yn0NYfaFFQ/PvS5b2CM3/mcUR90fecc2LZ3nl+S4u8smJdBH4+vD8tf2bxnZ19BTtEf64Ucz
  il+uvy3KLD2XmHt2+yO3ZY8cPXsrTVgvWrj3+fanKpvMt0EXOBD5PGnnYvre/n6z0uxZw4Kev
  1WE9db/52/saghOwvz4Xu7JpqUb7rpxLD/R6r8tWTmzk4drR9nWE7d3lXl1mXoKkzT7qswsdZ
  p60WpixbfmfiBea4m8/15/Pc2VnqFJteoMRSnJFoqMVcVJwIAO4W2K1wAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-548.messagelabs.com!1652084555!204866!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29511 invoked from network); 9 May 2022 08:22:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-25.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:22:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E251A100195
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:22:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B3D3110018E
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:22:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:22:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.358 -> 0.359
Date: Fri, 29 Apr 2022 16:02:59 +0800
Message-ID: <1651219381-27379-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219381-27379-1-git-send-email-wangmy@fujitsu.com>
References: <1651219381-27379-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:22:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96993

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.358.bb => hwdata_0.359.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.358.bb => hwdata_0.359.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.358.bb b/meta-oe/recipes-support/hwdata/hwdata_0.359.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.358.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.359.bb
index 59513bbb9..35648541a 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.358.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.359.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "ae144d896eea90e527a57276accaf0da043c9f83"
+SRCREV = "bf3322565b3bf5c35c90e42ca6cf4928f2f2d481"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


