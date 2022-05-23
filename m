Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7DBC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:09:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.25203.1653293391641233363
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 01:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BsUUY/Wu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653293389; i=@fujitsu.com;
	bh=P9gfZmdNgUghmCR+hKJvdKxaSFPcLzY4NQ6T86+bJjU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BsUUY/WutWtwymYyRuYjMjCyHTkZyQQoXr3nuaqqOhUyN4s2WzhJnCyxahHgLd18a
	 IahkiLAa4EtjAEUSIuUIkOsvtWGHr0jBi2oQqyYpq4mryUpAMiG1Po878VD6Gg6rem
	 Lxp7Lur+yxCkvlh4ksrs+e+STVblKyrWCth85uJASY9RiattVkNyLu5WlHeZ2AglPx
	 +xYHjrSPjGwdirTH/8c5dnqmH5ptwC7D6t6hK0hm/REFDB/bWLZrIduxQ4GTDRYP1o
	 r8iyh4QwEo8ILT2l/3fhD4aayhUmuf9OC4y2tpT5qO3EnZ9KPsufegfDIr6Phem9DK
	 nxKd3Gqnl60CQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORpOvr2J1
  kcHePksXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFm6SPmgiaOirtzRBoYF7N3MXJxCAk8ZJS4
  3NLIDOGcZZI4Nu8iK4Szh1HixYVOti5GTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O4BG
  sXBISzgIbG70xckzCKgKrH15mOwEl4BJ4nf1xoZQWwJAQWJKQ/fQ8UFJU7OfMICMUZC4uCLF8
  wQNYoSsy83s0DYFRIzZmxjg7DVJK6e28Q8gZF/FpL2WUjaFzAyrWK0SirKTM8oyU3MzNE1NDD
  QNTQ01TXVNTI21kus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzJlGLWlzsY
  p/f91DvEKMnBpCTKe9SuO0mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBC+fPVBOsCg1PbUiLTMHG
  B8waQkOHiURXkYHoDRvcUFibnFmOkTqFKOilDivI0hCACSRUZoH1waLyUuMslLCvIwMDAxCPA
  WpRbmZJajyrxjFORiVhHnrQabwZOaVwE1/BbSYCWhxr0QnyOKSRISUVANTWdu/zG7X/7N4k/m
  XMTa8Wz7N/t3URbbHZUPXJEamcTVO1d5oKXsw747DtbvmcWzC7heeiXmVrjXvNt9nOvf6vgf/
  e9bMLyuba1WucudjZsZKO6OQ4vCJF+9ZyV66kJ5x6uTzVxwdfqenXD4n5/203/V+rvO+jGPKH
  kd2JeTdYeQ9MDF0t/DxDetPndJMfD31qN4pPe99D6pv21WcuuxldVbVpLtPIf/c1XbT3TIcq5
  tsp4XcLHy9+95Unttf0sN3cIuuPlBw3LFTeHn+iTs85etXMbxpF9zKbWwzYXHJd7U157N4/5S
  2Z0+a5seVrGWyk2+SXtqnP+03uD5MfxjQbvpoz6Vlj7pDlq6W9AjzVGIpzkg01GIuKk4EAGqP
  ueREAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1653293389!138304!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29753 invoked from network); 23 May 2022 08:09:49 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 May 2022 08:09:49 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1F457D6C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:09:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 13FA0B59
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:09:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 23 May 2022 09:09:37 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.31.5 -> 1.31.7
Date: Mon, 23 May 2022 16:09:23 +0800
Message-ID: <1653293366-31516-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 08:09:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97227

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.31.5.bb => nbdkit_1.31.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.31.5.bb => nbdkit_1.31.7.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.5.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.7.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.31.5.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.31.7.bb
index 79b0001b5..2de32cc1e 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.5.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
 
-SRCREV = "a671de5017546149ef38bfdbdae95c675538b93b"
+SRCREV = "7c0e2d19d30eb0bd2e079febb5a2c31f65e5023d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


