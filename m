Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94576C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 02:18:03 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web10.4366.1634609882277658920
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 19:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qkPcFuj1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634609880; i=@fujitsu.com;
	bh=kNb14c3uSrqAIf3+W3brepIaZVIX9sNVF96JCCNJzqw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qkPcFuj13wy5Fcz4pmwBpCXy6VGYN+2rxNcac7ZQP3L2Zanp3MWPK/X9MXpPJAbYK
	 5KPKanlHx5U6TJXhpUCV2eMexeRTc7Q4zWRUZYzr4KmV1L9y4QArmnfRgg5dRHccSB
	 VRaA+6j92OmS2RQOc3CI2C93qX9I49avC5Zi0PraQW9easg7VSNwVjW1QSHKN6USIA
	 ytSUrz/cxlQHg9uPMWnHqhsxTLq60HA99MtCR/yv8lXuRiuSrXDvwyeyR0uRWgB2wJ
	 57QSttuFK9R89Ing+kzLTM700vuH4hcgsaroAE/5grcg7UiaDqe5sBSpD0I+foGSlM
	 ZCKFu7SGr6naA==
Received: from [100.113.0.18] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id B6/96-15394-7DA2E616;
 Tue, 19 Oct 2021 02:17:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSfe6Vl6
  iwaUOIYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPm3MPsBQc5Ky7M6mBpYFzP0cXIxSEk8IRR
  Yl7bVVYI5wKTxLzHj9kgnBOMEnOb37F0MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSxgL9GyvpMRxGYRUJVYfayfCcTmFXCWaHnRBFYvIaAgMeXhezCbU8BFouPdG7CZQkA1XV
  caWCDqBSVOznzCAjFfQuLgixdQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6xrqmhrqJVbpJuqlluomp+aVFCUCJfUSy4v1iitzk3NS
  9PJSSzYxAkM4pZDReAfjwdcf9A4xSnIwKYnyOlzMTRTiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  dunkZcoJFiUmp5akZaZA4wnmLQEB4+SCO8/FaA0b3FBYm5xZjpE6hSjopQ4b7YmUEIAJJFRmg
  fXBovhS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeR1ApvBk5pXATX8FtJgJaPFV5xyQxSW
  JCCmpBqaAVZx1D89oTzG9HbqN53VW/jHl3BesDJtLcnhX1O910N6osI3br/Trcj3uxmk5PHMq
  L1b+Nw0Id3+pGaPIPssvcE75zs49rpcL42yk7D/cVX+h6v5+lxrniYk1h2vWLdtXpbJic49sb
  OBNE9GEFlHPKo0rK7mO3PO+Ebxqou5bDV6DyPSlE3yKS08tXX34b0GuQ1FNYNrn2g0yLY8+rL
  MUfDRlxbcjBsEPpPNWSCxfqfJ9t5IA16T2EyI6W7/LtGjyOkvNOz7P0dztMN/M0tavQnPqHF4
  aJ7D/DxDfPFnF8FpxvNC7Ow7s8Rfz658vkVne+GVToS738R1sNt8vGRmciH0w/xQT67rVyimO
  Z5VYijMSDbWYi4oTATqEi2tcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-228.messagelabs.com!1634609879!51435!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15676 invoked from network); 19 Oct 2021 02:17:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Oct 2021 02:17:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CE6F5100452
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 03:17:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id ACC98100461
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 03:17:58 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 19 Oct 2021 03:17:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libxmlb: upgrade 0.3.2 -> 0.3.3
Date: Tue, 19 Oct 2021 10:17:26 +0800
Message-ID: <1634609846-130627-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634609846-130627-1-git-send-email-wangmy@fujitsu.com>
References: <1634609846-130627-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 02:18:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93445

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmlb/{libxmlb_0.3.2.bb => libxmlb_0.3.3.bb}       | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.3.2.bb => libxmlb_0.3.3.bb} (72%)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.2.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.3.bb
similarity index 72%
rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.2.bb
rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.3.bb
index cacb493a1d..0ebd653fe8 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.2.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.3.bb
@@ -2,11 +2,10 @@ SUMMARY = "A library to help create and query binary XML blobs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI = "\
-    git://github.com/hughsie/libxmlb.git \
-    file://run-ptest \
-"
-SRCREV = "994fd0ec3d28da82b5965949a9d925510f603562"
+SRC_URI = "git://github.com/hughsie/libxmlb.git;branch=main \
+           file://run-ptest \
+           "
+SRCREV = "5108556a17bb1c2863c2ca5df088143ea65474a3"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome
-- 
2.25.1


