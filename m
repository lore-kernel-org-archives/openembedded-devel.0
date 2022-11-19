Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308D0C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:38:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.15914.1668843508845890242
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x8u/q7o2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843507; i=@fujitsu.com;
	bh=z5i6vSU93A69SsmGWI/sfMtq5awzm4qAK3cHzZNKa44=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=x8u/q7o2tGUBVZUJ6tf5aSFc8nWtTB2OmlB+8AFTamT+5DV2ls58t/tBbf/pkdWe2
	 Y3Smq0ip+5PBLI26q1KR9t9oTxaRrJs9/vdKVqdoVyqGiMG+OJ8hITHQercAShKPLI
	 X+pB5av9abYNbV5GOLjhBkXNm6s7OjAD6UXC/bXy8rcMmdE2G8w3lmr4rxTZdkjnFK
	 5wTbHYdFOBCJuOJorawrpludlq1W1ksur00nXQ2qpEqig0GsYs9IHxvl4SUHU+tKpb
	 Ey07FRMGUyrIpF5Oqv8fou8koTIgqcLetpVbI+7GqH/6yutFscApVAICu9BUfymY7O
	 CZLy7FxlgQxbg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8OxWfdTe0W
  ywcorShYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8anhTNYCvbzV0xY/p+lgfE3bxcjF4eQwCNG
  iY9rG9kgnKtMEu0PJrNCOHsYJdoaVzB2MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgKvGm8yoLiM0ioCrx+upTsBpeAUeJF1smgNkSAgoSUx6+h4oLSpyc+YQFYo6ExMEXL6
  BqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYjQrTi0qSy3SNbTQSyrKTM8
  oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMx5Ri9ZM7GDcs+6N3
  iFGSg0lJlHdve3myEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneuLaKZCHBotT01Iq0zBxgbMCkJ
  Th4lER4RXyA0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEudNApkhAFKUUZoHNwIWp5cYZa
  WEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNOB5nCk5lXArfpFdARTEBH5DiXgRxRkoiQkmpgmtN
  0nHt3Dse3P18r9kjLVgr2RHqWHeaIMju4YuGEGHWWvec/8Z87HbrQf+6Sb2kG7YLqqyatMdv1
  4Gfnsqy/4j6/OtrYmCsvzC12DQi/KcN1ifvbVK+nLunBuSWG/+6/O/FKxl9ZYrHaInuPDSYdY
  jvMSw+6bOuzYs3J+Xf1VNdHMaWF91xzvWSfLv3SuSJRMdVfuPF4k8G3Lolt0lo7Bd8dt23b4H
  Dtzcu5lpuCQ/7M8LSYvTn4/KHbOdfvHFqUZ7Nlb+k5yYCdPuJ8h501k0XWbspgWD2dU3JaRMG
  16ZM106SKxcv0OjSPTuP2jnSYcf7t8skXGryL3Kx35y+xeqz5PMtGz3q1dvO3p01zlFiKMxIN
  tZiLihMB7HqonU4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1668843506!179445!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10146 invoked from network); 19 Nov 2022 07:38:26 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:38:26 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 37B3C4B1A
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:38:26 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2B3304B11
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:38:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:38:24 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] glibmm-2.68: upgrade 2.72.1 -> 2.74.0
Date: Sat, 19 Nov 2022 15:38:02 +0800
Message-ID: <1668843486-2933-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99626

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Glib:
* ustring: Add release()

Gio:
* ListStore: Don't derive a gtkmm__GListStore GType
* DBus::Proxy: get_connection(), get_interface_info(): Add refreturn
* AppInfo: Add get_default_for_type_async/finish(),
  get_default_for_uri_scheme_async/finish()
* File: Add make_symbolic_link_async/finish()
* ListStore: Add property_n_items()
* Resolver: Add lookup_by_name_with_flags(),
  lookup_by_name_with_flags_async/finish()
* ListStore: Add find()
* File: Add create_tmp()

Documentation:
* Glib::RefPtr: Improve the documentation
* Gio::Action: Improve the documentation

gmmproc:
* Improved handling of final types
* Improve handling of gi-docgen syntax in C documentation

Build:
* Meson build: Avoid unnecessary configuration warnings
* Meson/MSVC: Add more warnings to ignore
* NMake Makefiles: Ensure g[lib|io]mm[config.h|.rc] are created
* Require glib-2.0 >= 2.73.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glib-2.0/{glibmm-2.68_2.72.1.bb => glibmm-2.68_2.74.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.72.1.bb => glibmm-2.68_2.74.0.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.72.1.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.74.0.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.72.1.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.74.0.bb
index f13cf9d50..5028a8bb8 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.72.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.74.0.bb
@@ -13,7 +13,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "2a7649a28ab5dc53ac4dabb76c9f61599fbc628923ab6a7dd74bf675d9155cd8"
+SRC_URI[archive.sha256sum] = "2b472696cbac79db8e405724118ec945219c5b9b18af63dc8cfb7f1d89b0f1fa"
 
 S = "${WORKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.25.1


