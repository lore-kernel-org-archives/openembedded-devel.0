Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FBDC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:20:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.31313.1654518017147746258
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sZ8SwjA3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518015; i=@fujitsu.com;
	bh=kjc6o0/dkbg2/BOuxxQP9pToo8ozL9uFb//rUgv9XCY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sZ8SwjA3u6Hb0Hq11w2L4MwQsCEO48p/frEGVB+j5QN9Fe1qBSpJJMDaf9PYvQKI2
	 SC075t5f3iRd1pNk+K+mhXZVtuXkzfUnv7Cyd/5b7totYJGeEXwD35BCHV9s8+K1rr
	 Zx88C2Q0lno8NwwPrRO9r9xrOXjDH1iSVh2jXSaKF7/2qVFSJ9aZMpyIO4gUIXGKTp
	 MB65MbF3LyXN6bCj9ZjmSCVikZdEN+QLkhUNxGNs8cn0FFWFkqyDzQIoTIdz0l4QNb
	 sNdKD9bAOmPkL/vnjKaCWK921ifQowfX7OU3d7ai/DO2Jx9c08ixWS1VXxArsjFVMa
	 EXl1kNCxc9x4w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8OxWff/h7l
  JBhdWiVhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBnLD31gL/jAUXHryya2BsZ+ji5GLg4hgYeM
  EksalrJBOGeZJO7M3M8E4exmlFh89gp7FyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  4DVCAs4SnzeuhgszgIUP9IyF6yeFyj+aME6RhBbQkBBYsrD92A1nAJOEjvmrQbrFQKq2f71CB
  tEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtCYsaMbWwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjFZJRZnpGSW5iZk5uoYGBrqGhqa6xsa65iZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBYZxSrOi1g/HVip96hxglOZiURHntr81NEuJLyk+pzEgszogvKs1JLT7EKMPBo
  STBe/wNUE6wKDU9tSItMwcYUzBpCQ4eJRFe63dAad7igsTc4sx0iNQpRkuOqbP/7WfmWA4mZ3
  5tO8AsxJKXn5cqJc4b9B6oQQCkIaM0D24cLO4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBL
  mLQaZwpOZVwK39RXQQUxAB/k8mANyUEkiQkqqgUn4hiuD/edfvILBa1Ld9PLeNEXsnvn4+XaB
  VK4ZX6fuifbs3RvfXxGkJPHgTfU8uUVfq1VuvfygZqmzgVHd13BGhPeUE2VNlqzq17f9D3zsn
  Gog5uIeF/Jy8evM3e+vHb+js2HR48+5faZOUl5OP99yPp1hKh+/5U3OE4njr5bNUDjGE71tRf
  Ss0CXHOFiERRWOGzHzyDzUEpz9ZgnrjSLeiBcfonsyY9zVlmqdPmcrL3xya7zXFsE9z9y+qm3
  +mLa2NmQGx36j9Nc5fowCiivnPL3tvNxsdaP72mTB3m2PjBNmrkgK0pz+8sW5Hy6qrqcmr8qq
  3ZS8UDk/K3+JtmpqvGOUhfE+9UnCq6SXhSixFGckGmoxFxUnAgCSD9fbdgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1654518015!628565!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28730 invoked from network); 6 Jun 2022 12:20:15 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:20:15 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id DA1E48A1
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:20:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B832E801
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:20:14 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:19:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] function2: upgrade 4.2.0 -> 4.2.1
Date: Mon, 6 Jun 2022 20:19:09 +0800
Message-ID: <1654517949-9033-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654517949-9033-1-git-send-email-wangmy@fujitsu.com>
References: <1654517949-9033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 12:20:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97421

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../function2/{function2_4.2.0.bb => function2_4.2.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/function2/{function2_4.2.0.bb => function2_4.2.1.bb} (92%)

diff --git a/meta-oe/recipes-support/function2/function2_4.2.0.bb b/meta-oe/recipes-support/function2/function2_4.2.1.bb
similarity index 92%
rename from meta-oe/recipes-support/function2/function2_4.2.0.bb
rename to meta-oe/recipes-support/function2/function2_4.2.1.bb
index 2843939ee..8e3718102 100644
--- a/meta-oe/recipes-support/function2/function2_4.2.0.bb
+++ b/meta-oe/recipes-support/function2/function2_4.2.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Provides improved implementations of std::function."
 HOMEPAGE = "https://naios.github.io/function2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
-SRCREV = "02ca99831de59c7c3a4b834789260253cace0ced"
+SRCREV = "f569a63cfe369df867a1a4d17aaa12269156536c"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/Naios/function2;branch=master;protocol=https"
-- 
2.25.1


