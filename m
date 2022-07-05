Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59687C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 06:39:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.81216.1657003143587310923
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 23:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HlpHrPWg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657003142; i=@fujitsu.com;
	bh=R+9sx4olR22Uu7dsw1L8f7vZ13iNli5xikC7725mwko=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HlpHrPWgBBF+Qacj86Nvn/7CQOt6FjumZ3T8LJqIX3JUk1MoJj166xEApPY0joYKY
	 Oi5NGjBZFQvalSUAMtvGnxjXwdGJIoAO2p+6BKN+AZqrG9muESJ4mt6k/ocAE/EpIF
	 xd9UdYtEaKx7UQZy3ishnb+b2Iv3P4JdBAWkVniiEfqfBCv+9hfCOGIztUM3FcJqLW
	 IzYgWVCeZJaZ+rYU/6ymCvrjEmJAE9eafBWFSo0eF0Wf8IeVecyAvFiIdwcTyx4/eI
	 BSOyqlPSdXaw7bedGN5+vtlyt4p053YIatjaVBZ/B/afZIvgW82v4sEE6OsKXCwrfn
	 T+GZEPuzP1V8w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWbf1zuE
  kg5Y2eYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePejfusBfN4K95v28DcwHiOu4uRi0NI4AGj
  RMuiJYwQzmUmiQPPLrNCOLsZJa482cTexcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgL2EpMPdTOB2CxA8QdTH4PV8Ao4SZxZNResV0JAQWLKw/dgcU4BZ4m3s16ydTFyAC1zkj
  jYUApRLihxcuYTFojxEhIHX7xghmhVlJh9uZkFwq6QmDFjGxuErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo3VSUWZ6RkluYmaOrqGBga6hoamusbGuobmlXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYBinFCtu3sE4ceVPvUOMkhxMSqK8cVcPJwnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4GW+ApQTLEpNT61Iy8wBxhRMWoKDR0mEd8VpoDRvcUFibnFmOkTqFKMux8yvbQeYhV
  jy8vNSpcR5d98CKhIAKcoozYMbAYvvS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEebluA03
  hycwrgdv0CugIJqAjblQdADmiJBEhJdXA1HvJY7mlV/quX/Z87QpqX2T8E/UilGauEtqrN8Pd
  5+WfDqFomTmHXgvWLRDapCLzwzlacyk3R23vRKHf4QoXf8TN+W166GCYWYSEc+iOB9MnrOwyi
  VALCnBOSfxvyFDwlmmmTIfGhujPh8xDrlrHrbLbs/hHWufFie/U+4NdSrjLd2xbFL7vWKS3Gv
  /eJ9K5misivga7vVjFxBtlUNogb7uOfQu7yJslXnYH5UuT751425+lrfclKdrwXczquTNSNsz
  cbr2Eid1VR6BKvdQ1pfDHq7VTNmttaU8Iifwkw+a81zyh9anpiZfTbAI8XKQyD/nrJjfVG+Ql
  LzdtyT6t2+jIOumY+/n3KklHryixFGckGmoxFxUnAgDitm2jagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1657003141!44075!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12008 invoked from network); 5 Jul 2022 06:39:01 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Jul 2022 06:39:01 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 35F767B
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:39:01 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 297CF73
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:39:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Jul 2022 07:38:59 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gtk4: upgrade 4.6.4 -> 4.6.6
Date: Tue, 5 Jul 2022 14:38:34 +0800
Message-ID: <1657003117-14465-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657003117-14465-1-git-send-email-wangmy@fujitsu.com>
References: <1657003117-14465-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 06:39:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97709

Changelog:
==========
* Fix translations in GTKs own ui files

* Wayland:
 - Fix a problem with the activation protocol
 - Don't force the HighContrast icontheme
 - Ensure that our cursor surfaces don't violate
   protocol constraints

* Windows:
 - Fix a problem with builtin icons if the
   hicolor icontheme is not installed

* GtkFileChooser:
 - Fix pasting text into the name field

* GtkText:
 - Remove an assertion that is sometimes hit

* Accssibility:
 - Fix a problem in the accessibility tree

* Translation updates:
 Brazilian Portuguese
 German
 Persian
 Polish
 Portuguese
 Russian
 Swedish
 Turkish
 Ukrainian


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gtk4/{gtk4_4.6.4.bb => gtk4_4.6.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtk4/{gtk4_4.6.4.bb => gtk4_4.6.6.bb} (98%)

diff --git a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.4.bb b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.6.bb
similarity index 98%
rename from meta-gnome/recipes-gnome/gtk4/gtk4_4.6.4.bb
rename to meta-gnome/recipes-gnome/gtk4/gtk4_4.6.6.bb
index 9f4737168..dcebd0de5 100644
--- a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.4.bb
+++ b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.6.bb
@@ -33,7 +33,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a79a2bbcc7931b703fc4fa1fcbe1b906e229a1522d854d522801766a79bcac9f"
+SRC_URI[sha256sum] = "7bbfe4d13569f7c297ed49834ac7263e318b7bf102d3271cb466d5971f59ae70"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.25.1


