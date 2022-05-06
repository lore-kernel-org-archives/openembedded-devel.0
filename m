Return-Path: <t.remmet@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6EDC433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 12:12:27 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by mx.groups.io with SMTP id smtpd.web11.8529.1651839140531740787
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 May 2022 05:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@phytec.de header.s=a4
 header.b=jfUNCLzb;
 spf=pass (domain: phytec.de, ip: 195.145.39.210,
 mailfrom: t.remmet@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1651839137; x=1654431137;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2U/ODDfR0iWx6It8IH0mmG+b2FpHnKjefuhaKr71Gfg=;
	b=jfUNCLzbDr/8969Vxd+lCUz5HZef+E8ep0X4CpjloE6YzK8s4XWQoS94qsSL5Nml
	FLtb3R/ooE8Ft8Ja4pfKpVGPPyvfu4ds1Q2BuCRpTZ9liqfpUzDK8p6JgxqavYRy
	Rg7ekx1A0dedTcC/DfwiCzJKvPkjDn4eJJtjoPFeADY=;
X-AuditID: c39127d2-077d9700000060c5-a5-627510a06420
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
 D5.BA.24773.0A015726; Fri,  6 May 2022 14:12:16 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2022050614121664-853695 ;
          Fri, 6 May 2022 14:12:16 +0200
From: Teresa Remmet <t.remmet@phytec.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] meta-networking: Add meta-phython to
 BBFILES_DYNAMIC
Date: Fri, 6 May 2022 14:12:16 +0200
Message-Id: <20220506121216.3099707-1-t.remmet@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
  17, 2016) at
 06.05.2022 14:12:16,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 06.05.2022 14:12:16
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFnrFJMWRmVeSWpSXmKPExsWyRoCBS3eBQGmSwc2nNhYXDy9ldmD0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXRt/CdqaCyawVv75vZWxg3M7SxcjJISFgInFn4h3mLkYuDiGB
	bYwSC7t6GCGcc4wSxxqXs4JUsQloSDxdcZoJxBYR0JX4+GEuI4gtLBAm8fxHA1ANBweLgIrE
	6lt2IGFeAUuJ7e9Ps0MskJeYeek7O0RcUOLkzCcsIPMlBK4wSrxfPBPqCiGJ04vPMoPYzALa
	EssWvmaewMg7C0nPLCSpBYxMqxiFcjOTs1OLMrP1CjIqS1KT9VJSNzECw+PwRPVLOxj75ngc
	YmTiYDzEKMHBrCTCKzyrJEmINyWxsiq1KD++qDQntfgQozQHi5I47/0epkQhgfTEktTs1NSC
	1CKYLBMHp1QD4/o4FfYY95qNuhfKpfnkA3a/UoqsL5jM/Od/3cnZIlobfm0wFyrgeC+/63xX
	cKPNQ/4SMzefqTsvfv7gfmjN3XmZ8rvEnPVTD60/8sApb0lcm6JfslLwt19dLQ/5W+bmz54Z
	Y3b7wDdP5ec+3uzPVn3ccer0Z20FXb/TVt53xXjnx3169Uw8QYmlOCPRUIu5qDgRABILjvb9
	AQAA
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 May 2022 12:12:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96973

Activate recipes in dynamic-layers of meta-networking.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 meta-networking/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.c=
onf
index 3069cfb6a39d..a7d6da8fd7d7 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -24,3 +24,6 @@ SIGGEN=5FEXCLUDE=5FSAFE=5FRECIPE=5FDEPS +=3D " \
   wireguard-tools->wireguard-module \
   wireless-regdb->crda \
 "
+BBFILES=5FDYNAMIC +=3D " \
+    meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
+"
--=20
2.25.1


