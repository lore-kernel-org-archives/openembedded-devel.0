Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CF0C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 07:42:48 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.8116.1676878958640814854
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 23:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ou8zg+P2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676878957; i=@fujitsu.com;
	bh=DzkuUOgRzR1/a5VzG08DFiR4ucOUwFIcMTSE9co7IJg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ou8zg+P2Yn3tELbagN7x5hgsq8blI3wSfWTv731ZjBROfX8BlTvDfJX2NVLypMe++
	 rLnyUcKyFuPyZ+/fKCSDY9NbdmSIWv1w/SjE2/2VV64iOlmXSNr9Thzv1pbGauqAof
	 s+/p+86lCf18MGg19KKsLP50SGXyNOMnhqylyzOhlLY71B4vWbAwL0cOfOINz1mHny
	 /M9fXFh1YcWbKaxNsW3RZ3BOFHgKrFbIxYy6n44bPV5n58WOQbF4B53n1o7fVEg5KY
	 wsuJKw3R/mfUKh66oDjtDjfxLKnI1PuN8cGBCQ2IrrnWP0H2lbP+AgtLYrugzoqQkQ
	 0B8BImxqzWG3Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqJuj8jn
  ZYOZpCYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePgwSbGgs0cFbu/bmdvYLzG3sXIxSEk8IRR
  Yvmrk2wQzg0micnzbrBAOHsZJSbvvwVUxsnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi989Y
  DXCAtYSEw8uZOpi5OBgEVCVOLVVFSTMK+AkMfXFFhYQW0JAQWLKw/dgrZwCzhKPN15iASkXAq
  pp+sIDUS4ocXLmExaI6RISB1+8YIZoVZSYfbkZakylROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMpsWpRWWpRbqGeklFmekZJbmJmTl6iVW6iXqppbrlqcUlQJnE8mK91OJiveLK3OScFL28
  1JJNjMDATSlmYd7BeLjnr94hRkkOJiVR3k3Cn5OF+JLyUyozEosz4otKc1KLDzHKcHAoSfBWK
  QLlBItS01Mr0jJzgFEEk5bg4FES4ZWWBkrzFhck5hZnpkOkTjEqSonzKigDJQRAEhmleXBtsM
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9zjIdp7MvBK46a+AFjMBLXb/8QFkcUkiQkq
  qgSlA360r4F7l4//znpiGLv99OTDspsquqbG9Og8Mv3As8Di3//PlxTbMh18vTuvSK2V/ufhS
  rqFaygP+irdnc5/yHUq8wjeRr6PpVey+qalWobpsCqk7WW1rD24OsWI0/n+2Qvz1jt648xsXP
  k1t9KswVuHXjTteGHD18cPpc45fWHf+np3UhfVCKb2ZnzQKWrK/zZk6Z9PMJS7KXVfXbhBYti
  Hww3PHZX7upyI0LY0FHgqvW6L1o0poypf02Ea2hyKT79v6f+naFDOl+F0mR1KMzMSQLWkzd/0
  8FH7g/NLjRixWr+vSM9PsJ7u9SvANctJYPNv0kqn1j+YLZiwq259P/HD6/Q7HrGWnN/ue1t+p
  xFKckWioxVxUnAgAW/GX/VcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1676878956!162749!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13524 invoked from network); 20 Feb 2023 07:42:36 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Feb 2023 07:42:36 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 03205100191
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:36 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DDBAB100043
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Feb 2023 07:42:34 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sip: upgrade 6.7.5 -> 6.7.7
Date: Mon, 20 Feb 2023 15:41:52 +0800
Message-ID: <1676878912-15532-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676878912-15532-1-git-send-email-wangmy@fujitsu.com>
References: <1676878912-15532-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101163

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Significantly reduced the memory requirements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.7.5.bb => sip_6.7.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.7.5.bb => sip_6.7.7.bb} (83%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.7.5.bb b/meta-oe/recipes-devtools/sip/sip_6.7.7.bb
similarity index 83%
rename from meta-oe/recipes-devtools/sip/sip_6.7.5.bb
rename to meta-oe/recipes-devtools/sip/sip_6.7.7.bb
index fb42ef476..5e361d972 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.7.5.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.7.7.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "9655d089e1d0c5fbf66bde11558a874980729132b5bd0c2ae355ac1a7b893ab4"
+SRC_URI[sha256sum] = "dee9c06fa8ae6d441a401f922867fc6196edda274eebd9fbfec54f0769c2a9e2"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


