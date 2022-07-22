Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C00C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:17:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.18127.1658917063684409670
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ApfEX9AB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658917061; i=@fujitsu.com;
	bh=rsoJGQ79QPFICJ8WsqRPEdwlYhENG4dpjopmzDJ92RM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ApfEX9ABCAInmKcyhuufh7TikfMt3d3inZS0hAEv3nWUTPPt4lDxyt+CzqI5h8J8B
	 GvyfZgmPcD55GoXMvD0XoM/SVOQDfj73ihkgGe2rwGhD3LyRhe5VmX5Qd5dOqCPluF
	 7kJzzvJY40SRVhC7j6i050g5JOdFFoAPlMmoYGZcKgX1ydwPprhNaUoFtihABf09Dx
	 4UE4aSiNE7Ij4pC5yF0cn5eXiN33y5VGvcmadIW9ouON2YcUcoqbEaII9/BMLDmxPT
	 VncYYQEC10ORz1Y49ZpYbmjHPbRlJaXLvaQS9twS+boineHPEQxFMsmeXLf4Z5wO45
	 yGozhJMQVj8lw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORpHtU4GG
  Swd25shYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a8vbEFFzgrbu/8x9TA+Iqji5GLQ0jgIaPE
  7nkz2SCcK0wSbzafZepi5ARyDjBK/FqvCWKzCehKvPixmAXEFhHQl1g6ew8ziC0s4C/xZ+oeo
  Dg7B4uAqsQqry5GDg5eAQ+Jc6+DQQokBBQkpjx8D1bMKyAocXLmE7AhzAISEgdfvGAGKZcQUJ
  SYPV0eorxC4vXhS8wQtprE1XObmCcw8s1C0j0LSfcCRqZVjDZJRZnpGSW5iZk5uoYGBrqGhqa
  6lma6hpbGeolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIFhl1KccHAH44p9
  v/QOMUpyMCmJ8rq/fZAkxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3L8fDJCHBotT01Iq0zBxgD
  MCkJTh4lER4k3mB0rzFBYm5xZnpEKlTjLocdxfu3cssxJKXn5cqJc4bwwdUJABSlFGaBzcCFo
  +XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzzuYHmsKTmVcCt+kV0BFMQEdsUXgAckRJIkJ
  KqoEp6pq+vFSlRaL7nlsFN7gVVSOS697PZPmyKT/J998qY7EE9ZWZ3rtDrJa/sFP5Ui7lXjH1
  0KwXTY01K0JfzBPtEbi2cEvTF1snSavSxy/L9ncd9l7SIu2baOT2aumhnWcU5nFEcZw4PvXCr
  ImhDwJkyy84W1dOTd2zUrbiNUN7gI78PmU1wadqjcdOWC8obj5SZyPj6sau++hC6iMvb6+CEN
  1sXYnnV7KYMw1+Np/6HqajnTnLZfONA13ylZvsmZe07SmdVN+ysP3Jpvy3NYKV5QstohTETWy
  /KW2PEth3eZVQJ6/Md3u2h+EHNwluW61/Kmj9vFC7iXd8TseqMdX7q4V86Tuq5OH+f+9mQyWW
  4oxEQy3mouJEAJmvFetCAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-732.messagelabs.com!1658917061!230916!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29527 invoked from network); 27 Jul 2022 10:17:41 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 10:17:41 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DEB361AF
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:17:40 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D36721B1
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:17:40 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 11:17:39 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.9.0 ->
 2.9.1
Date: Fri, 22 Jul 2022 12:04:06 +0800
Message-ID: <1658462646-26202-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 10:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98012

Bug Fixes
    there was a raise missing for throwing exceptions (#1077) (d1f17b0)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-google-auth_2.9.0.bb => python3-google-auth_2.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.9.0.bb => python3-google-auth_2.9.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.9.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.9.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.9.1.bb
index 868d70b4c8..e884abac1b 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.9.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "3b2f9d2f436cc7c3b363d0ac66470f42fede249c3bafcc504e9f0bcbe983cff0"
+SRC_URI[sha256sum] = "14292fa3429f2bb1e99862554cde1ee730d6840ebae067814d3d15d8549c0888"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


