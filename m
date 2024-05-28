Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0E9C41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.12846.1716860952232713309
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JtTxgV9j;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860953; x=1748396953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JnSgeWVbEssH6AB/89Bc29EjMKky2HQfdFgwFB1HoeA=;
  b=JtTxgV9j3UJydIvGmQbGHJUqmXNctaSMzT9ps8yfTQ6YG5IRJ+g6+T+h
   kRXORW415ua414wNSXZrfXJUg7w3bMC/CDRIe+L1WmJoq0ildmKoFIMSv
   oiiktMYHzcZbPXrlMaHpq29ejopEH1riSG7PzW/Hf7YE4RoXdr8wXl9fX
   L8VokO207bVryX/mM4/XuH8xNFpf2nKYzRv+JfouqHBfU8zUDXH3NOXcu
   px34by0I+YTZ8s4blRrMRPFh7UyB/uQdCFQYp+lAiOYYU8iSpmJ87qrzK
   5feq3UxuAmpl6JevZUzpAnxjBLbGSSnsF3SDVo3Z9zBywqdVE20frII1D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160573445"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160573445"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:11 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CB96ECA1E3
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 09D6E51B7D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 866E7411AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 34AA61A000A;
	Tue, 28 May 2024 09:49:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/40] gnome-online-accounts: upgrade 3.50.1 -> 3.50.2
Date: Tue, 28 May 2024 09:47:46 +0800
Message-Id: <1716860901-863-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--4.159400-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyusl2khk/DLwiDJ
	ofIqUuxZNY8yk443mkDkFmW7MAszaPAFOqXbBOEwnXXE+dK/TFAIKj6WwO7KdWBSbru26cn6UZr
	zGtdPWPvaQOodOvehxzI0kAYHtIL0AM0/G7XUdeM/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bl9k8VRsVgnBVVB+QhZ7PRtzUOt9DPA9Kd0KiTeJteVBfS0Ip2eEHnwj/1Rbkzl1EwuTL
	po5HEc1joczmuoPCq3ZlOGvnMf5VBjd5lataoDg0CRXHM4WRRMXrZRBudY2P8yupY/15jl1lkXE
	6U9OBAODB1bJAm6UZIut/uU2errOGh7IgFw1yvMdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110540

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Setup Dialog
  - fix provider icon style
  - fix dialog not closing when cancelled
* Exchange
  - fix account setup field verification
* Microsoft 365
  - fix account storage
  - fix identity retrieval
  - fix email retrieval
* WebDAV
  - fix Fastmail and mailbox.org endpoints
  - fix for content-restricted app passwords
* Translations
  - Mark a user-visible string as translatable
  - Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nline-accounts_3.50.1.bb => gnome-online-accounts_3.50.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.50.1.bb => gnome-online-accounts_3.50.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.1.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.1.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.2.bb
index 66df8902f..adce70770 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.2.bb
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'goabackend',
 
 DEPENDS += "gdk-pixbuf dbus glib-2.0 gcr"
 
-SRC_URI[archive.sha256sum] = "42ee43fd1e2942b9ff6106252ccdc834602815508bf7a3a52c0bdfffa56eaf40"
+SRC_URI[archive.sha256sum] = "df16ad975d139c6bfc4ebb2ec8bb8327297a791ef2bf0b977c78076af5faa98e"
 
 PACKAGECONFIG ?= "goabackend kerberos owncloud google windows_live"
 
-- 
2.34.1


