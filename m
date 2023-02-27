Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46996C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:15:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.85572.1677485697820502086
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:14:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TXj7ZUJd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485696; i=@fujitsu.com;
	bh=TJaWEz3x/21HZFeKQfq/ITUY5xM40jCnxtBwVOWlMtU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TXj7ZUJds2D+KwZ8kWmhwlR7Sp2H4XDds2H/MTVNmKRBonfOvFIO/OdjCdNxZ1OVR
	 nPEEftSSItXtHT2KS4qZ0g1wKuLsErhE1ebpTH2FaqCX7cv4Mn/Vl+t2evkG6nt/LO
	 Hh68hwkd4Sr39yMY2Io8c6an0aOIRZ154z8R0FpVxzWAE3IhvCOnmspMm5L0MSYTU1
	 aiZWoaDZgx0RHNTOYbypnJXokNzEC1xmO01b04GTC2p9115PahqZY7LT18sCTk6ZJ/
	 77iCEXvIb9i2P4kyFGrN5a5flDzdmvtAO7Z2jddn1z/gZ8yAV1nlCkLrTsGfI7ygIr
	 +UJsGFwGwy9QQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpFuf9if
  Z4OxcUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePVgXtMBTO4Knrv3GNqYNzE2cXIxSEk8JBR
  4sG5D4wQzhUmiRm969ggnL2MEldvdQNlODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCT2LX+PFgNi4CqxJxPF8FqeAWcJOasOgg2R0JAQWLKw/dgcU4BZ4n3n3aB9QoB1dzs3M
  oOUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/AyLS
  K0bQ4tagstUjXSC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1
  ZBMjMHhTitm6dzCu7/2rd4hRkoNJSZR3kdOfZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvAeTg
  HKCRanpqRVpmTnASIJJS3DwKInwMhsBpXmLCxJzizPTIVKnGBWlxHkPpgIlBEASGaV5cG2w6L
  3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3KgFoCk9mXgnc9FdAi5mAFm9/+ANkcUkiQkq
  qgeni4ScbPsz9WfA2tdB+x/43ezQFWztYLQRaFexfl/R8mveTY+fWti/Tk8WTwx6xnPHJf70h
  NerQwfzQM5Emq79KHnbV+dDeGxkvMFm0oTfvntELxi7zC7YnuDNPFbxf8KHBz1eqNkRp1T6zX
  1GpvSf1587/6LC6jolHTeOBmcm5lHdtJ3K/SC5/Pu9W+INzr1g0f2wyYxGYr7rgZn9s5Y5v0y
  dennFXwnwtc9DLL6FWa57Pe3g8OLHQ7NfPa78fy+wXuHMpQlufI0yny++5YUIaV9v5J+rRHwz
  VFv7XmyXBfHN9m2X/Z4fH7J9UVOrYfh8PfVrCHbUuaZf+1Jx9Pbw/8vxiD3L82CfbPbfLuVaJ
  pTgj0VCLuag4EQAM+1O6WQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-591.messagelabs.com!1677485695!214112!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10388 invoked from network); 27 Feb 2023 08:14:55 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:14:55 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E89E01AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:54 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id DC94F7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:14:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.47.1 -> 0.47.3
Date: Mon, 27 Feb 2023 16:14:01 +0800
Message-ID: <1677485641-11740-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485641-11740-1-git-send-email-wangmy@fujitsu.com>
References: <1677485641-11740-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101292

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
Hold a strong reference to the query sender start task (#1128) (808c3b2)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.47.1.bb => python3-zeroconf_0.47.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.47.1.bb => python3-zeroconf_0.47.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.47.1.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.47.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.47.1.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.47.3.bb
index 0c0304aa2..b1dec03b0 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.47.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.47.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "65ab91068f8fafe00856b63756c72296b69682709681e96e8bb5d101345d5011"
+SRC_URI[sha256sum] = "eb6ad7fdf3ef542c99416c4a5de60c6a4d16d82b336522e0ef6e7d2d2ddca603"
 
 inherit pypi setuptools3
 
-- 
2.34.1


