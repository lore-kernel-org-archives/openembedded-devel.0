Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB54C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:43:03 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.4041.1665391376072264525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JT+nm3DB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391373; i=@fujitsu.com;
	bh=U6OElXvAJBgzogtCL0PkpEvLqCz7oUkfs4+zXROnYFo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JT+nm3DBQtlNNQuH82cxYhAhJ/O2WiRK6+Z62Rs/ljDGg1BgyWY0vXVXH4ZHqgh+/
	 vFfutQm4k3SGOKw53b8gf2+lqliqHmd/oIEvsg4ULFbxJDSM6fc0QRWnWyF9T5Gezo
	 kJorx78czVB2YTcVnvbLoD3sSbkpmecsfUKeCNLTQrWjHdSOMTNhAUB3Y6Uyi5mZcL
	 S29wiP64k4L2xqvEcQ5zmvH2UXrsjHbf+mx+0gN8znp6GJ0VZw0/SsmywOfsQQO1wn
	 4Web+jVeL/rb6ShhLZL+6xGF2l2w9jIj+/LfkZLAZrErvHYCplGKJ/0WpHOHUOG8pg
	 leo043mc05daw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8OxWZf3tnO
  ywZNmFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN9+QK2gqtcFafvxTUwrubsYuTiEBJ4yChx
  ecNNdgjnMpPEmnlT2CCcA4wS655cZOpi5ORgE9CVePFjMQuILSKgL7F09h5mEFtYwFXic+c/N
  hCbRUBV4tzTOUCTODh4Bdwlfu2QBAlLCChITHn4HqycV0BQ4uTMJ2BjmAUkJA6+eMEMUi4hoC
  gxe7o8RHmFxKxZbUwQtprE1XObmCcw8s1C0j0LSfcCRqZVjDZJRZnpGSW5iZk5uoYGBrqGhqa
  6lua6hsaWeolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIHBl1Kc2L2DcfW+
  X3qHGCU5mJREeQ0OOScL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuB9cgMoJ1iUmp5akZaZA4wEm
  LQEB4+SCO+Di0Bp3uKCxNzizHSI1ClGRSlx3vabQAkBkERGaR5cGyz6LjHKSgnzMjIwMAjxFK
  QW5WaWoMq/YhTnYFQS5r10BWgKT2ZeCdz0V0CLmYAWn7zqBLK4JBEhJdXAFHjv4EHvm4I833N
  Z1faYWQoevC2QILUjxG/i+meOvB/Wur5gXZzBsNhmp0/mvPne3ssqS5Jzv8ptOrxz2zfltUUv
  ArPvrlk5r+VjxqfPTtIRLM/fHJklwaDnWlxpV1bK5ys8U26XXOAhvQXu0bPtlavdH7YfMciZM
  W+lsVSBwXSm9TyPfmrFzJrD4i7TcCz7zrUgyYTH7TelnAP9rRuXW8QeX1TapfblOufLU32SS/
  OX+pY7rHBaHfhktfv/1yudu/Lfz2TfNt8x0Hlv+Nf5S6fe5f4jLTJp8uOFHxepzmV9fSbYz4V
  vSmpc1JHnEav+K0ny11WtPz5B0elRI+clYcePV7tL1LYoFevp3uf5p8RSnJFoqMVcVJwIAFiC
  vCk5AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-732.messagelabs.com!1665391372!3042!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25959 invoked from network); 10 Oct 2022 08:42:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:42:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7E955153
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:42:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 71D947B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:42:52 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:42:51 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] stunnel: upgrade 5.65 -> 5.66
Date: Mon, 10 Oct 2022 16:42:38 +0800
Message-ID: <1665391358-2453-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 08:43:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99123

Changelog:
===========
  New features
      OpenSSL 3.0 FIPS Provider support for Windows.
  Bugfixes
      Fixed building on machines without pkg-config.
      Added the missing "environ" declaration for BSD-based operating systems.
      Fixed the passphrase dialog with OpenSSL 3.0.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../stunnel/{stunnel_5.65.bb => stunnel_5.66.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.65.bb => stunnel_5.66.bb} (93%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.65.bb b/meta-networking/recipes-support/stunnel/stunnel_5.66.bb
similarity index 93%
rename from meta-networking/recipes-support/stunnel/stunnel_5.65.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.66.bb
index ab7ff43223..17c8c5360c 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.65.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.66.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "60c500063bd1feff2877f5726e38278c086f96c178f03f09d264a2012d6bf7fc"
+SRC_URI[sha256sum] = "558178704d1aa5f6883aac6cc5d6bbf2a5714c8a0d2e91da0392468cee9f579c"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.25.1


