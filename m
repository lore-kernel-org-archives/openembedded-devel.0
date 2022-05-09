Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C789C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 09:02:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.29734.1652086964788237535
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 02:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kK057gxV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652086962; i=@fujitsu.com;
	bh=fROu78q/9im9NskStkjDfcLsDH9V22APeVmm+VPsvl8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kK057gxVa2gCGJZWMECv7RLRLcRkuwxRASJ26lJQf9Vez/O59+KW2AzYiePUxIAuH
	 RshqlzqO8F314aaRwiSYbxIIXadzZUvyqGScwEss8lH2Rl9Sqb+7MDoZK/YWHfYjSu
	 l4oBQ5lFog9L+9mPx1J/+c+9+VVkRb0FFhK27lt74FBbir1qe+F0dLbr6ny5izG3Gd
	 OsB62e449gkLYaQdpn9jWKpfea30bHAVxHBhIjBO0M+03kq3SxqFvPRb+Fgmo0gMSU
	 JdwayeBcPOwKz16H5IiZNQ0kPF3lajl1NzD2DwFv0qruBE17+4a0/G9RTl+FAjks5M
	 AXKAyOwWronKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSXfTjYo
  kg+9XRC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxr19ezFvwWqFgyXaWB8SFfFyMXh5DAE0aJ
  rUf/MkE4F5gkZmydxQLh7GeUaHj3gr2LkZODTUBX4sWPxSwgtoiAvsTS2XuYQWxhAXuJo1vWM
  YHYLAIqEqdfzgKL8wq4S6z4egIsLiGgIDHl4XuouKDEyZlPwOYwC0hIHHzxAijOAVSjKDF7uj
  xEeYXE68OXmCFsNYmr5zYxT2Dkm4WkexaS7gWMTKsYrZOKMtMzSnITM3N0DQ0MdA0NTXWNjXQ
  Njcz0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECgy+lWKFuB+O1lT/1DjFK
  cjApifKuv1qRJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC9yNITrAoNT21Ii0zBxgJMGkJDh4lE
  d4ukDRvcUFibnFmOkTqFKMux99Pf/cyC7Hk5eelSonzJl4HKhIAKcoozYMbAYvKS4yyUsK8jA
  wMDEI8BalFuZklqPKvGMU5GJWEecNBpvBk5pXAbXoFdAQT0BEfA0pBjihJREhJNTBtmH3ssON
  W/5WT//BfE7u8NFuMgfP5lUrR3pZJdR3CsdaZT79cvN05ObvshVXuXDHnHZ0TFaZXn5bU5bvN
  Oost7/aCJbIsE71y7fjlTzGz+vdecll9cr1IOgfjnmP3zf44PvUJKp/uWftO+f+CJdn6chP6p
  /YmGlyd9WKuJeOE9CNqEaGPj/G3v5DK7D9+N7qV3V6EjU9KgOWCT+Ul2W0Hcj1rIlt/fptRYL
  NFoNbyYfHJ3wpil9u9GNYmu83lb+Noc/FsWxhQ/bKxIMl68qRs/sKp25dJ+i7b46uwgPG6OJf
  mgd2pbQ/Myh1Wqs/TXVJuH1CTo7hHv/hc+nelnZ2T7hldf7j5qWWbFm9iqxJLcUaioRZzUXEi
  AAoNGJhFAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1652086962!158425!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30304 invoked from network); 9 May 2022 09:02:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 09:02:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id EE7DD100331
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:02:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E16281000FE
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:02:41 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 10:02:20 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] gtk4: upgrade 4.6.2 -> 4.6.3
Date: Mon, 9 May 2022 17:02:12 +0800
Message-ID: <1652086932-2858-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 09:02:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97019

Overview of Changes in 4.6.3, 21-04-2022
========================================

* GtkOverlay:
 - Bring back positional style classes

* GtkFileChooser:
 - Prevent unwanted completion popups
 - Fix small problems in save mode
 - Fix buildable suport of GtkFileFilter

* GtkPopover:
 - Fix button positions in right-to-left locales

* GtkLabel:
 - Fix small issues with link handling

* Tooltips:
 - Don't restrict the minimum tooltip length

* Theme:
 - Don't use opacity for overlay scrollbars
 - Fix selection text color in  vertical spin buttons

* GSK:
 - Accept textures that are generated by webkit
 - Align offscreen rendering to the pixel grid

* Accessibility
 - Fix a crash in startup when orca is running

* Input:
 - Fix display changes in GtkIMMultiContext
 - Fix activating on-screen keyboards
 - Always propagate hold events in GtkEventControllerScroll

* Windows:
 - Fix a critical warning in clipboard handling
 - Report serial numbers for events

* MacOS:
 - Prevent fullscreen transition reentrancy

* Translation updates
 British English
 Czech
 German
 Indonesian
 Latvian

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-gnome/recipes-gnome/gtk4/{gtk4_4.6.2.bb => gtk4_4.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtk4/{gtk4_4.6.2.bb => gtk4_4.6.3.bb} (98%)

diff --git a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.2.bb b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.3.bb
similarity index 98%
rename from meta-gnome/recipes-gnome/gtk4/gtk4_4.6.2.bb
rename to meta-gnome/recipes-gnome/gtk4/gtk4_4.6.3.bb
index fdfe3635c..a0a60fd45 100644
--- a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.2.bb
+++ b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.3.bb
@@ -33,7 +33,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ff263af609a50eb76056653592d929459aef4819a444c436f6d52c6f63c1faec"
+SRC_URI[sha256sum] = "a57acd0e4482981700fdf86596c7413cb61ef47f75e4747fda809e8231b8d96c"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.25.1


