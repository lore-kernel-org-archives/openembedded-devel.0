Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38D1C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:45:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.25288.1646653516890511189
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aN5EKriD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653515; i=@fujitsu.com;
	bh=rd+oYaPjHPGjO3EBgmZaml0oSYlE77RDesT/iBsF3Co=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aN5EKriDK7MizdliVeUN6eDy3IfojnTj15Z0VogFCflB4qbvwFSPWplDa326du14d
	 C98uVLD+OmdtAnW8UlQk9RDkarNbMvExkv9vn7sNeMs7aCc8tj44WPrFqWKaUji+bd
	 j+xwLr2NQbbnJxaJbWhI3/1x4Dpjlx0xmuiNPncUS1zNEgaZ2YrtiYwfgvn6aqsHIU
	 FASyp0eJBGfOxk+ATFi6g0+tk6VeXHKZlLZwyjP3f+YYG6QoIMwy+dLVrBlBHquK9Z
	 qFP+16nTJOE2OMUotCF/tmn8XOLPmIAkhZWnLwYSCn2+dpWyLv0/8NDkqPhBcO0ymi
	 X5sk6qtpOhMNQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSdfrg2q
  SwfZpGhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8akKYdZCo5wVnxf+5ytgfExRxcjF4eQwBNG
  ifnnL7FCOBeYgJx+NgjnOKPEm4dzWLoYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCTmDJnMRuIzQIUPzrpK1gNr4CTxIrjk5hAbAkBBYkpD99DxQUlTs58wgIxR0Li4IsXzB
  A1ihKzLzezQNgVErNmtUH1qklcPbeJeQIj/ywk7bOQtC9gZFrFaJ1UlJmeUZKbmJmja2hgoGt
  oaKprbAGkDPUSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQIDM6VYLX8H49+V
  P/UOMUpyMCmJ8qYsUE0S4kvKT6nMSCzOiC8qzUktPsQow8GhJMH76Q1QTrAoNT21Ii0zBxglM
  GkJDh4lEd7jl4DSvMUFibnFmekQqVOMilLivNfeASUEQBIZpXlwbbDIvMQoKyXMy8jAwCDEU5
  BalJtZgir/ilGcg1FJmHczyBSezLwSuOmvgBYzAS2uslUCWVySiJCSamBao3hsqrMZa2VY/pw
  1bfYGB/ZUZCZNCVF2WSGa7pg6TbrV41upa2ye/b/z5cu01SZc63nG7Gd/0yrJaXeas+UvDmex
  t/F6QbeOLnHS0LvKeEx7ucaKxN55xxc895wyV8fOaq2tTAdTderM28usSjLY/TxYEnbOel6ZJ
  /T+tmbIlh1O3azcd1bILlVe/sj1btYE91XtJ2+auMznXNRfKiOVc1Dn4I7CON6tusIqWXF3Ts
  /TeZpQ+GuChXKKL+vSZk5+4RsP+Q3CX7+vttQLvyR+WmDfh8tP/RQ0e37sWybmmOvAcXDC1/4
  2U6kdV332RDKyuHDk73TU/8y9XTnA7NbW7Zvlf55bpznt2s+czUosxRmJhlrMRcWJALdpcBRH
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1646653514!18005!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1654 invoked from network); 7 Mar 2022 11:45:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:45:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4C1C2100359
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:45:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3FB4110033B
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:45:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:44:57 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-autobahn: upgrade 22.1.1 -> 22.2.2
Date: Mon, 7 Mar 2022 19:44:44 +0800
Message-ID: <1646653487-55825-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:45:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95836

Changelog:
=========
fix: auto ping/pong logs should be debug instead of info (#1524)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-autobahn_22.1.1.bb => python3-autobahn_22.2.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_22.1.1.bb => python3-autobahn_22.2.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_22.1.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_22.2.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_22.1.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_22.2.2.bb
index f149b1221..c63770564 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_22.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_22.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "17e1b58b6ae1a63ca7d926b1d71bb9e4fd6b9ac9a1a2277d8ee40e0b61f54746"
+SRC_URI[sha256sum] = "60e1f4c602aacd052ffe3d46ae40b6b75f8286b3c46922c213b523162e58c17e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


