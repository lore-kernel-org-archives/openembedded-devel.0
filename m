Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5E8C636D7
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 06:38:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.7764.1676702296054411232
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 22:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YxLYQkBv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676702294; i=@fujitsu.com;
	bh=LbR4F1/zlI9E6wskkFEWcIPQa6lWy9h6zgCrWvo15bA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YxLYQkBvY4BRc6u/okhBGOp+MHhDv4JqKafO13diRIYd6VjTfkv7g9z2+vyIyf8eq
	 r83fJOnYTRNewflhkDaSH3gszVgYVaCYmF77uYUjx8jxsVmqeUK+O2MYeLIvKtDv5a
	 Y9XlCAtM648t2ZL9R96Bap88NpSywXLoHuJ5psYLLHdkUzxrLUK7ERF4aXYAqi+6Wo
	 +CflMPQQfO8FcQbdJyXTF4Lnn+GGjiz6feH+idVdq6wX1OmjlzJIqmYZzwJWkDcf/A
	 bBIZQNBMT/Itu5iOgwb0L2FbLHxCwJawc25FVmQ49LiXKsG5psTH7VXBXahbB5FVB/
	 R85E7VUI5nf3Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSTek6EO
  ywZwpZhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aPn/tYC05zVlyY1MrWwHiTo4uRi0NI4Amj
  xIPWzWxdjJxAzg0miR3HGSESexkljvQ8ZgFJsAlISdy4/x+sSERAX2Lp7D3MIDazgIrEi9897
  CC2sICnxNyeK4wgNouAqsSuN/uBajg4eAWcJDbsLQAJSwgoSEx5+B6slVPAWWLKrydMEHudJA
  7ObQeL8woISpyc+YQFYryExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3SNdFLKspMzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3ZTihLQdjK19f/UOMUpyMCmJ8n7e9j5ZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvz4IPyUKCRanpqRVpmTnAOIJJS3DwKInwnk4HSvMWFyTmFmemQ6ROMSpKifMypAIlBEASGa
  V5cG2w2L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3Kch2nsy8Erjpr4AWMwEtXsD8FmR
  xSSJCSqqByZatqsz3S1jToT2Mc8/drZjD6lCzm0fB5/Aap4TG7zvPLDvB4ixqv/dgiMjMF5Gs
  v6VbXDeGKIgsm6Ipx8F35C/PxJenDihF/5SWl26dvdpK0GHfc5kjN59ckly5QuVp/LEE0W0pc
  RYPhd5UbZ/A6jcz46LXhgVB79hi7z40iny9tzzUXbjB4vKOcz6Tp3Xwpe+7zTN71rS4/+vZ3d
  LtoxqmnGa6IJdnKFvm5HT3vhif9XlTd8elVRu2fTZUmZ+98nN2oa7Vjc0M5/7V7xYrV/OW32a
  3U97lyINaqWPeBa3a9/b51h6d+aulxKGCi1FXRVEkfNmkV/mXd6j6pFUld8R1nPt++HIUm+vH
  VPn1SizFGYmGWsxFxYkAJ+0aM1gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-732.messagelabs.com!1676702292!53726!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29119 invoked from network); 18 Feb 2023 06:38:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 06:38:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 54CB21000E7
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:12 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 48AB51000D7
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 06:38:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libtalloc: upgrade 2.3.4 -> 2.4.0
Date: Sat, 18 Feb 2023 14:37:51 +0800
Message-ID: <1676702273-30706-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676702273-30706-1-git-send-email-wangmy@fujitsu.com>
References: <1676702273-30706-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101131

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtalloc/{libtalloc_2.3.4.bb => libtalloc_2.4.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.4.bb => libtalloc_2.4.0.bb} (96%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.0.bb
similarity index 96%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.4.0.bb
index 1c5922205..f8fef9f82 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://0001-talloc-Add-configure-options-for-packages.patch \
            file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
 "
-SRC_URI[sha256sum] = "179f9ebe265e67e4ab2c26cad2b7de4b6a77c6c212f966903382869f06be6505"
+SRC_URI[sha256sum] = "6df36862c42466ef88f360444513870ef46934f9016c84383cc4008a7d0c46ba"
 
 inherit waf-samba
 
-- 
2.34.1


