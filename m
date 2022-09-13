Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45F2C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:14:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.3025.1663064055770242006
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CXPdQLGM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064053; i=@fujitsu.com;
	bh=v53z1PvHt8xWw6yphljpdJIDJvW5b7LeSBf3hhFQylI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CXPdQLGMZhTug4gy4mO7V50BDI/sf5ZjQhj9u22x/X9OpXbdUDrnbEdbjcx7VgCtp
	 Y/aEtXCuyAWmPGUpMF0IXRkHEOT/GxJV41Swuma27HxQQMKnKBsUCnbesw6FTj4EV6
	 7MPoa+U+o4LqJPxr+8UyHr0ts0MudICU+EJJbHqZrO0MlpFpZCGmFlkOe09DBzZ0BU
	 odPFI8bDCCNCxrLcTlrII1yjIPY4RYaPVwS5/0sgf4XJaDhRg3B49DvQiFE6nsFU9G
	 RL6ySV5+mNcJ1CmF1Pr9rzoxyQkTSTDpeN5HsRTpOCfWYU/DclDFSek0wONNmgVkzW
	 XSowXbVbwD9+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqPs1XCH
  ZYMo9BYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePH2//MBVc5KhZP+sbYwPibvYuRi0NI4Amj
  xKyFl5i7GDmBnOtMEhPWsUHYexglLk43ALHZBNQkpt+6wQpiiwjoSyydvQesnllAReLF7x6gQ
  RwcwgKuEsc+a4OEWQRUJRpnbmQEsXkFHCXubVoP1iohoCAx5eF7sFZOASeJHVM2sUKscpTY83
  QxE0S9oMTJmU9YIMZLSBx88YIZoldRYvblZhYIu0KicfohJghbTeLquU3MExgFZyFpn4WkfQE
  j0ypG26SizPSMktzEzBxdQwMDXUNDUyBtpGtoaqyXWKWbqJdaqpuXX1SSoWuol1herJdaXKxX
  XJmbnJOil5dasokRGMYpxWkzdzBu2fdL7xCjJAeTkihvpJdCshBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJ3vgQoJxgUWp6akVaZg4wpmDSEhw8SiK8PMFAad7igsTc4sx0iNQpRl2OmV/bDjALse
  Tl56VKifPO9AYqEgApyijNgxsBi+9LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5JcKApvB
  k5pXAbXoFdAQT0BFG1vIgR5QkIqSkGphm7VmT4bruSNspbfUN1Y9WT5E6tkRgC9/kp/8+Snhu
  TFnz8O7CWBdXgYbpOXN6FzxUs61l/22t6Hd+eaHW8T0ndfdKbZg93XGR6ZczCl9cNjKk6YjVK
  vUW5S17whdqNTmYQZXtfOTpoyEmUwIlRFlcrQw+nVw3+6/rH2umtWumz9T+K2MZnTjP9ema2R
  6vTi6a9FDiaxlPhsmWLacLJXk8uwqsCkNuyuiwrWE4VHlFOcMz3rxYZavdQ25/jVXPm19vqzA
  9F5Z0omybscR01ZTjM2P49jJvymcWKRf4sO3+UwsVnapV7yat7OTy25a/rThRP//keru05+9/
  573IYs86finueJvbw4Y7EzJDuESUWIozEg21mIuKEwGc3NHFagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-728.messagelabs.com!1663064053!445652!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19774 invoked from network); 13 Sep 2022 10:14:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:14:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EA78D10018D
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:14:12 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DE97C100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:14:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:14:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libadwaita: upgrade 1.1.4 -> 1.1.5
Date: Tue, 13 Sep 2022 18:13:53 +0800
Message-ID: <1663064034-3136-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064034-3136-1-git-send-email-wangmy@fujitsu.com>
References: <1663064034-3136-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:14:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98760

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.1.4.bb => libadwaita_1.1.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.4.bb => libadwaita_1.1.5.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.4.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.5.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.4.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.5.bb
index 44d18f596b..297cd9f0b4 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.4.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.5.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "fcc6d56669d33ac3d030098d7571d8045a02e18dc083b49a5a5a6325068e6b58"
+SRC_URI[archive.sha256sum] = "e170a658b5a83226912ecd90ba643015c8d2b8bbd6ea91ebe336dfebb584bb33"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.25.1


