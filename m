Return-Path: <M.Vovard@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B13C001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 09:32:18 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.157197.1692178331566615236
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 02:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=rChAkPTz;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: m.vovard@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1692178328; x=1694770328;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fHt7/5ayAkIQiHy9fBC+xlleJjlGwzE05XdLWnFoubo=;
	b=rChAkPTzrin0s7eIptLbupJsX0QrTo5y5tgu3ubKNAvq4046Jux5PX/HkKzbeRam
	PDAyNmJAe6xahNKFON9zs/fUKfzuLUMgWgp9fxUmcywAzZSMrCHsJfwVM/R2flqZ
	PoB6ZK6yKYOjeCQxNgW0SGFNy3ityiai6VNZ8f7oeQ8=;
X-AuditID: ac14000a-923ff70000007ecb-11-64dc97986b1e
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 52.58.32459.8979CD46; Wed, 16 Aug 2023 11:32:08 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Aug
 2023 11:32:08 +0200
From: Marine Vovard <m.vovard@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2] python3-kivy: Require X11 or Wayland in DISTRO_FEATURES
Date: Wed, 16 Aug 2023 11:31:26 +0200
Message-ID: <20230816093126.508832-1-m.vovard@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42JZI8nAqztj+p0Ug9Uf1C0uHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujIc/ljIVdHBUvN/xm72B8S9bFyMnh4SAicTfHxuZuxi5OIQE
	ljBJLPl2nh3CecIoceRpH1CGg4NNQENi3VFHkAYRAX2JpbP3MIPYwgIREncnrmQHsVkEVCVu
	bJ7ACGLzClhInLvWALVAXmLmpe/sEHFBiZMzn7CA2MxA8eats5khbAmJgy9egNlCQPEF76/A
	9U4795oZwg6V6Pxzn2UCI/8sJKNmIRk1C8moBYzMqxiFcjOTs1OLMrP1CjIqS1KT9VJSNzGC
	gkyEgWsHY98cj0OMTByMhxglOJiVRHh7eG+lCPGmJFZWpRblxxeV5qQWH2KU5mBREue938OU
	KCSQnliSmp2aWpBaBJNl4uCUamBcc+kpw/NzArX8sh2P1/FaFa+YdNaeb8LTSaz5J0+8X5nN
	fTl0x/GlxVvXFn7imnGnZiXj3euRJ8xdVu477FFZ4/Pr39WQvKWXNn2peZM1jzloellYCbfR
	+lk9hx3DlXbUn0l+3riO5YzuCYb9KvofC1MYVk77eu7LZy8Xj/C4e7H1ITWuBybtUmIpzkg0
	1GIuKk4EAFDETw8gAgAA
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 09:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104423

At least one of the following DISTRO_FEATURES needs to be present: X11 or
Wayland. The recipe now work with pure Wayland.

Signed-off-by: Marine Vovard <m.vovard@phytec.de>
---
Change v1->v2:
* Check that X11 or Wayland is present in DISTRO_FEATURES
---
 meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
index ca1fc5f96..b02c55a85 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
@@ -43,7 +43,9 @@ export KIVY_GRAPHICS
 KIVY_CROSS_SYSROOT="${RECIPE_SYSROOT}"
 export KIVY_CROSS_SYSROOT
 
-REQUIRED_DISTRO_FEATURES += "x11 opengl gobject-introspection-data"
+REQUIRED_DISTRO_FEATURES += "opengl gobject-introspection-data"
+
+ANY_OF_DISTRO_FEATURES = "x11 wayland"
 
 DEPENDS += " \
     gstreamer1.0 \
-- 
2.25.1


