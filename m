Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40010C3F2D4
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 02:14:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.19917.1656555261266774077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 19:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KBfqLq5J;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656555259; i=@fujitsu.com;
	bh=7b0KlhIGHL6zQBmEci1H3AfLMKbOcz0JYxWYbIDVklE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KBfqLq5JbpkkWR+m1mNAbmNpzeE/0zHVYmwIfBGBlrEKp8pJGj8C7kA4y06sqhcQx
	 CsI8D4zUsVahDSVqW0BFMwH8osKoAuycf20EosIQBCt6ECTsbXIKrUmjcP6cPJdyNg
	 fWAxHGUSo+ItdsbsErtZjKn251nQ7iskrc3c9ZGJMOFTGmZPaclkhXw7ebWKS35USN
	 Bn3bJhf2ccKq6zjvRnPmjakMyEwrCZ2h5y8kUWdSFYG34rHZKimz++dAgOuf5RHcgP
	 CQ3k5pAZ4gWk79aQ4xyEo83R84dj1ZyTXe48oCM1ZS2d0dISFH5LFaCtkiV8Veez+a
	 ZKVpmLNAxqXJg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqPuLbW+
  SwYujEhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8athy8ZC75xVDzYmNXAOJ+ji5GLQ0jgCaNE
  U/cCRgjnOpPE04efWSCck4wSDZPbmbsYOTnYBNQlHt98zQhiiwjoSyydvQcsziygKtF9cQ07i
  C0s4CUx9+cTJhCbBSi+98QKIJuDg1fAXWL7JLCwhICCxJSH78FaeQUEJU7OfMICMUZC4uCLF8
  wQNUoSJ1Z8hKqvkHh9+BJUXE3i6rlNzBMY+WchaZ+FpH0BI9MqRqukosz0jJLcxMwcXUMDA11
  DQ1NdY11DS0u9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAkEwpZj6+g3FK
  30+9Q4ySHExKorxPp+1JEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBu55hb5KQYFFqempFWmYOM
  D5g0hIcPEoivDe+A7XyFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqcdyUL0AwBkKKM0jy4Eb
  BYvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJcBGPlCPJl5JXCbXgEdwQR0xM5pYEeUJCK
  kpBqYZjF7H016HbjSZINasV7aVnWPpjk5wn9LbZjEV5+f8VSEy+D6XbO7lb4fJwj1linK3Q5e
  t+ulRvqVwNOCW6bf3df430qyOvjE1BKNA/kNa0vPp6f7bLz/MPpF2cwsqVtZEr1RSp3RSsbhP
  isEmsrvx3392av7k/vbygVSVR4Ws9xXXJd6PePK9q1ct2f4rdmTs6Kncdat/Ptf0+4UWBtszz
  z0K2rTmU1bOUs+mjQaOz/Icfz1xzX1iltHWWL486+Lz79j2Dghc/nDG+9+SG6eoF4qGPxM8MZ
  Phx+Li/7LnTEqFnr22m7Jh59JFooWfozm27sZV5geuL1lrcWF6W2/2Ipu3zjbdr4lbcO/9AtJ
  DUosxRmJhlrMRcWJAHKH3XtQAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-587.messagelabs.com!1656555258!243611!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18822 invoked from network); 30 Jun 2022 02:14:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 02:14:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EBD75100190
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:14:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E0097100043
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:14:17 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 03:14:16 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiohue: upgrade 4.4.1 -> 4.4.2
Date: Thu, 30 Jun 2022 10:14:00 +0800
Message-ID: <1656555244-20637-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 02:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97623

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-aiohue_4.4.1.bb => python3-aiohue_4.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.4.1.bb => python3-aiohue_4.4.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.4.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.4.2.bb
index b3a88fb67..63d29a48f 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.4.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "fa3bb0cf68aefdd0710704443c896abda69ae227500ad9539ac6c3d1d6dad804"
+SRC_URI[sha256sum] = "871c27da3d5a5b7d7c5049e6d23713425a2f251639ff1fb5fac460724ba42f15"
 
 inherit pypi setuptools3
 
-- 
2.25.1


