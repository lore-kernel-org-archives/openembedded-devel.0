Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE00C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:41:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.6145.1659447691136764371
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B6lggxIn;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447688; i=@fujitsu.com;
	bh=xC76wCDupqL3L4nIzWrU25+7uBAAskxdYeROoIZCEmU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=B6lggxInLUy2aKj02HZdPa87jt3ys8sXmkMJ6+jUIZhePOZMGRmXGReMojagJgsLa
	 dT1nzOQ9Kl465KSqf5NLUsSCen1zFomFBwJvJF0R0F3GXk9WMKYTyBBwz7ybMEEIIY
	 ldcH1htSOmpoBtlkk8sBLVoQzn2fEgtlJhMlrTRzSpg2W4SQ1mmRWJcJrUE8KRnCNy
	 UnHPKCaBSwCySZNg2+7tNxDTRctxEFfHyV4/c6tXIYG5Szjgk0VwkxeGHY7J1/6CAj
	 xGgMUtUBKff1yXh0brJABvhnVgbjBhQ+wGU5ijvpsdK5jFs2AbGWZ1S8CDWomuAEQs
	 g84Zy7/THugDw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8ORpNuh+TL
  JYPYZGYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPhrICCHo6KTcdmsTcwrmfvYuTiEBJ4yCix
  4s5Sli5GTiDnCpPEsR3CEPZuRok77SEgNpuAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+97CD2
  MICXhJz/7UwgdgsQPG3iyaD2bwCThIHTv8C65UQUJCY8vA9WC+ngLPEpUln2LoYOYB2OUlsX1
  8IUS4ocXLmExaI8RISB1+8YIZoVZSYfbmZBcKukJgxYxsbhK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaN1UlFmekZJbmJmjq6hgYGuoaGprrERkGmil1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmb
  nJOil5dasokRGMApxQoZOxi/r/ypd4hRkoNJSZRXTvFlkhBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3luqQDnBotT01Iq0zBxgNMGkJTh4lER4z2oApXmLCxJzizPTIVKnGC05ps7+t5+ZYzmYnP
  m17QCzEEtefl6qlDjvcpAGAZCGjNI8uHGwiL/EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi
  XD2QKT2ZeCdzWV0AHMQEdpMP1AuSgkkSElFQDk0DR/i0lfV03J+s2BjSwzEtPm/bx+6/73uLb
  jlZF68iyTmv/33/9EatYlKXoHi3Nac393d9/21usWrzLarMa+8zNuV2rfh17GvFUU/fxOttpR
  o2VT1+ITjmbd7bHTOth773fk4vt3c5cWt8Wuyfn+Ae23Krk/8uyponWfLH8Ydck47o8sqCkwN
  zXJL5KJ+DteZO3ay7X3b29eoXW9/rOGNWIyHWVOmfD1TmKTm8I6eE+/izijESkQ9PtdcxRmwW
  mqlsdkvzLqJv04+U1m73HjxyYPmXjzc8XhBoNZm85fHDj9NwOf9fD3td4azmKHt98Y/R3abyV
  W0nEIfUOwfzNWULeZokGOnJXTy+8vDHKSImlOCPRUIu5qDgRANx3v5pzAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1659447688!3809!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32346 invoked from network); 2 Aug 2022 13:41:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:41:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 330F01B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:41:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 27F971AE
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:41:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:41:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.31.14 -> 1.31.15
Date: Tue, 2 Aug 2022 21:41:08 +0800
Message-ID: <1659447669-24388-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447669-24388-1-git-send-email-wangmy@fujitsu.com>
References: <1659447669-24388-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:41:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98091

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.31.14.bb => nbdkit_1.31.15.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.31.14.bb => nbdkit_1.31.15.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.14.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.15.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.31.14.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.31.15.bb
index 3f2107445e..373cdb0546 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.14.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.15.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "35b42a161f3f3c7cf388e33dbaa5bd7082aac9d8"
+SRCREV = "a02ea15ec4e2c5ac533cee51824d5b9dd2933cc3"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


