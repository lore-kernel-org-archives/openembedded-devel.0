Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA88C4332F
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:34:43 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.29575.1652085279824772430
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SGS48mRc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652085278; i=@fujitsu.com;
	bh=ozm7WISLxVI/aMz0He1Xa3wW7bGoX1Nq1iMQtTJ2SxM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SGS48mRcGrmNURQrGj21dm0LxXiktK+P+HGYe0J8SjK1dXxPVsEpcMuEqruFsPdKW
	 hNFCUqgCnMmUQxwM/LSadbPbn7yIZhiD3iu0e/iH/Zns47bUcyWCqdPMH/rO60nH4S
	 ivjBswCrcSH9YOayj/elvYKMoKOEyJgHyLRYsHbbRtm921FI4t69dDqfcVj1YQakIs
	 uwnJu8KxT1xjjAH1l5Lr+TuZeJKDnm3PcNcKkNb5Wys6tEzrWOBvS01Rl8br4SG9Vf
	 PRd1NLPLXHwa0lBtAiEkotCnUiGhDb0wH+ixDp2svcSY96YVimciDHnwFR0wzp1v0B
	 8g/3nassbgcdg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8MxSVf2UkW
  SwfFZqhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0Zz/1vWglPsFTd3LmRpYHzN1sXIxSEk8IRR
  YvPyNlYI5wKTxKb9zcwQzm5GifZvW4DKODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFrCTuLH5HlMXIwcHi4CqxPeDviBhXgEniQ1Nr8BKJAQUJKY8fA/WyingLHH79kawkUJANd
  daVrBC1AtKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYrRLKspMzyjJTczM0TU0MNA1NDTVNbPUNbQ01Uus0k3USy3VTU7NKylKBErrJZYX66UW
  F+sVV+Ym56To5aWWbGIEBnNKsevhHYy7+37qHWKU5GBSEuWtbKpIEuJLyk+pzEgszogvKs1JL
  T7EKMPBoSTBG3IOKCdYlJqeWpGWmQOMLJi0BAePkgjv3RNAad7igsTc4sx0iNQpRl2Ouwv37m
  UWYsnLz0uVEuc9dQGoSACkKKM0D24ELMovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmrbk
  INIUnM68EbtMroCOYgI74GFAKckRJIkJKqoFJk8Mu0NaL9eOz6S3xgd18FRucnX+4aG2LNK9h
  OvWa7bVk8Mo43XOT76ysdAj6on7BPOLr9Umzs5Mv6wbtbPaYkhVma57ZMv8q55HAEInZBfyc8
  6xsy/qvLPTd+Tu0IXr68wgjzc1hM0yW85bWMYv6f0lkc58TOGOzkn6qvbLc/30v5d/ufnqj5d
  pq3YqC3XoN4XfcumRnfc9d66l8/yLrBf2iZmWHwpalbl/3Sio5sS6+LvHodnZFQEu5COvFH9P
  XpBV82r4jkS24TPzg4ksnPFvyOldqrfyi94TH1HDSdl7vbVxtt110GZLlTndvc6j7pd30NPFm
  6I3qiPtNfhP32EqXx+16Iq8YqdA+W4mlOCPRUIu5qDgRAP98a8BtAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-545.messagelabs.com!1652085277!249628!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15907 invoked from network); 9 May 2022 08:34:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:34:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2997910044D
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:34:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1D4C910032A
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:34:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:34:19 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] toybox: upgrade 0.8.6 -> 0.8.7
Date: Fri, 29 Apr 2022 16:16:32 +0800
Message-ID: <1651220195-27553-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651220195-27553-1-git-send-email-wangmy@fujitsu.com>
References: <1651220195-27553-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:34:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97010

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-core/toybox/{toybox_0.8.6.bb => toybox_0.8.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.8.6.bb => toybox_0.8.7.bb} (97%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.6.bb b/meta-oe/recipes-core/toybox/toybox_0.8.7.bb
similarity index 97%
rename from meta-oe/recipes-core/toybox/toybox_0.8.6.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.7.bb
index 50ce50d1c..344156800 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.7.bb
@@ -9,7 +9,7 @@ inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "4298c90a2b238348e4fdc9f89eb4988356c80da3f0cf78c279d2e82b9119034b"
+SRC_URI[sha256sum] = "b508bf336f82cb0739b77111f945931d1a143b5a53905cb753cd2607cfdd1494"
 
 SECTION = "base"
 
-- 
2.25.1


