Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD41C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:20:27 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.10451.1645449623830948054
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y6Pxj30X;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449622; i=@fujitsu.com;
	bh=uK60L1iEcjGgDuFzR4cE70i2xNG6itLaAEC/P2rbzVA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Y6Pxj30XDsDUFS1uDzPM1AnUVFfQnwoIkasvNwuvxd9XgFaDQ9IdWKx4HkX6LWSzJ
	 SqTJuqaySHimw313k+AqIcXAYMH4ldC3Zv/Q6J/gDOoQBvhq12TtLZTgfsZRWSoISk
	 lMrE4UTCmmHMvbiQtcg7480WMVrIJyqEODKO+DQg7ZejMWmest9EN15cDLwgqJgHHw
	 NaaG7uwxAvNAWn0hEgQrsgOZELfQ8uQ/GEc5FacgTfeMJI/1bYJaaru2m8SQfghpIe
	 Y4g7HXIByNOrvZvGRrHgva9Lvd+TQ3SoTYQT9eFGCoPK5mE+cyVQ/pjhH5gMB0seh3
	 6vjvWmd9HAFpA==
Received: from [100.115.7.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id E7/7E-12292-59193126;
 Mon, 21 Feb 2022 13:20:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxRXfqROE
  kg68TlCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oydK5tYC65wVVxodm1gvMDZxcjFISQwk0ni
  4PGzLF2MnEDOCUaJSS/zQGw2ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5hB7GFBdwlll1by
  wRiswioSiyZcBrM5hVwkvh2r5ERxJYQUJCY8vA9WC+ngLPEjOtdTBC7nCQeLdnKClEvKHFy5h
  MWiPkSEgdfvGCG6FWUmH25mQXCrpCYNauNaQIj/ywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2h
  goGtoaKprqGukl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGIwpxYxMOxiX
  9f3UO8QoycGkJMpb2y6cJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV7gfKCdYlJqeWpGWmQOMD
  Ji0BAePkghveTNQmre4IDG3ODMdInWKUVFKnPcTSJ8ASCKjNA+uDRaNlxhlpYR5GRkYGIR4Cl
  KLcjNLUOVfMYpzMCoJ8+pMAJrCk5lXAjf9FdBiJqDFU7KEQBaXJCKkpBqY4nbPcljMypA+b7V
  axvmdb+w3Pej75pMreF7PInJ3/u4ZsoyvmNnOH918dU658+aM+F5WqY08fwtcrY+qR6gvTEvW
  zpRp6gvRvRfjt7Djj5XQRobn5/ZcC7gy/ZHnao81/d4v+xnn+JR/fNdmu1VoJl/8Na3sDQ1Pl
  lmZZoY2FHkeNOHewXVYpn3SpQvHv65hfnHHb4kl/+FuzVmdxnEcAZK7fFIPze+Meh61IkxlW/
  8cv6Xz9TkY7r1gkk9lvzY5859Xevf5xU3Cd4+khy0N7Y7JsLY6ddDQt//kYrNbV9dPXs1juub
  AmQr5WewW59eVP8uqOGF+sC5H3CKCwYvh9fSQV47P12syZ4ae9yxRYinOSDTUYi4qTgQA6dCJ
  +UEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1645449621!8276!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17330 invoked from network); 21 Feb 2022 13:20:21 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:20:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21LDKDHU017111
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:20:21 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:20:14 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-autoar: upgrade 0.4.2 -> 0.4.3
Date: Mon, 21 Feb 2022 21:19:59 +0800
Message-ID: <1645449601-23151-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645449601-23151-1-git-send-email-wangmy@fujitsu.com>
References: <1645449601-23151-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:20:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95407

Changelog:
=========
* Prevent NULL dereference when extracting to root
* Do not include basename in error messages
* Do not request password when encryption is unsupported
* Propagate libarchive errors when extraction failed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-autoar_0.4.2.bb => gnome-autoar_0.4.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-autoar/{gnome-autoar_0.4.2.bb => gnome-autoar_0.4.3.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.2.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.3.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.2.bb
rename to meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.3.bb
index 24e7760fa8..0015e9f05b 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.3.bb
@@ -14,7 +14,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc vala
 
-SRC_URI[archive.sha256sum] = "1d20694079300e12feabdb77304a969d1cc190d1d12a949be845cad01c78a5d3"
+SRC_URI[archive.sha256sum] = "7bdf0789553496abddc3c963b0ce7363805c0c02c025feddebcaacc787249e88"
 
 do_compile:prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gnome-autoar/.libs"
-- 
2.25.1


