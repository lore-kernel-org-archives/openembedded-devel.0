Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BF6C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:34:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.22614.1647419665003686133
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tQ/jFmxK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419663; i=@fujitsu.com;
	bh=CL9tYJL4dBT61QrCDUr/Pc7ypFZcnQ4UBAJ0vvHKh/o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tQ/jFmxKkw0eeGjzde338yGZZH2X0zHtoaFWtga7/mwwG+tr0WKf48d++FXPjcGdF
	 /PrOqJRJ+EK9/MxI4OSyW7U8lwGzmPlC/piWx5tXFbVJfdU+W9mNC/+7+iurRhF66u
	 Ybfdi5bX6ffRKh6kzylC66w0p+G9S4PyvUhLTmSKLCfrre8KKlNnGZ6yZ0Xy/XhA4N
	 4/wu0jMedxBnZ5bz93wgayuFNhxAAYm7gKDbooGBc6ExO+mvZkt5FmF1DML5ErtPIg
	 qQwGo3ORvtFNLLH4/q61rd4DRAZZ8wpMqS/NNEyObLaR7R9FzmuTayCq8sf9a3YFSM
	 9nqQydBE1RgAw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqMu30DD
  JoLWfyeLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXi59hBrwSnOiglnDzE3MJ7h6GLk4hASeMIo
  8eXSNGYI5wKTxNcdO9ggnBOMEpdXfwfKcHKwCahJTL91gxXEFhHQl1g6ew9YnFlAReLF7x52E
  FtYwE1i+5k+sDiLgKrE/BeLwOp5BZwkLi9ZClYjIaAgMeXhe2aIuKDEyZlPWCDmSEgcfPGCGa
  JGUWL25WYWCLtCYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRqukosz0jJLcxMwcXUMDA11
  DQ1NdU10jI1O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAsEwpZn24g3Fx
  30+9Q4ySHExKorznZxomCfEl5adUZiQWZ8QXleakFh9ilOHgUJLg3T0HKCdYlJqeWpGWmQOME
  Zi0BAePkgiv6zygNG9xQWJucWY6ROoUo6KUOC8DSJ8ASCKjNA+uDRaXlxhlpYR5GRkYGIR4Cl
  KLcjNLUOVfMYpzMCoJ89rMAJrCk5lXAjf9FdBiJqDF86T1QBaXJCKkpBqY/NsCS+eteJCV5ff
  Ar4XfZEGA6ImY3M1Pln5VKQyymha8fleG/e0dljYV11f/EWA7xzVdfsIi+9Rzz8Iv384KYju7
  TmS+RkC34Nke5R+LVRKZl319a1pWaD5bYqPW4z2Lt7Vbqt19NHGl+vcpL3ytb0T17S7d1G9yO
  uzFkoCVgf78mVEJBlsl94UcWpexvPJ006oDMydOnVVcfnkX17IDq1sitK4I192pti8+x5lTGf
  LTPNux/XP8979XzbYdk22LkjQ7oSKXeZt734SlB83z2faZBn25kmKRupPVOLj/x6WHrfPuzrj
  Dq5X39Oq8crm9b4+Iv7r6VvP9afuf7cxujCYFF0x0FrMv9Qu29yh0UWIpzkg01GIuKk4EAMlb
  efJGAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1647419661!9430!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18481 invoked from network); 16 Mar 2022 08:34:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:34:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 82FEB1001A4
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:34:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 76F1B100194
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:34:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:34:14 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] weechat: upgrade  3.4 -> 3.4.1
Date: Wed, 16 Mar 2022 16:33:58 +0800
Message-ID: <1647419641-81593-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:34:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96013

Changelog:
==========
- core: set again TLS verification functions after options
  weechat.network.gnutls_ca_system and weechat.network.gnutls_ca_user
  are changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-irc/weechat/{weechat_3.4.bb => weechat_3.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_3.4.bb => weechat_3.4.1.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_3.4.bb b/meta-networking/recipes-irc/weechat/weechat_3.4.1.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_3.4.bb
rename to meta-networking/recipes-irc/weechat/weechat_3.4.1.bb
index edd88c063a..515cd95328 100644
--- a/meta-networking/recipes-irc/weechat/weechat_3.4.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_3.4.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
            file://0001-use-pkg-config-for-gcrypt-instead.patch \
            "
 
-SRC_URI[sha256sum] = "7cd3dcc7029e888de49e13ebbcc3749586ff59c9d97f89f5eeb611067c7bb94c"
+SRC_URI[sha256sum] = "7e088109ad5dfbcb08a9a6b1dd70ea8236093fed8a13ee9d9c98881d7b1aeae7"
 
 inherit cmake pkgconfig
 
-- 
2.25.1


