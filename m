Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A55DC87FC5
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:20 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.4289.1753153991495450583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OaIfc5k2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153993; x=1784689993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n26SP2AAi8fqoYYvVyHkCOoaPYOfqIQZ2p8UVPd73jM=;
  b=OaIfc5k22PgMDcI6JmwBc6omgIdN5AJzM7f0YMYzzJJaHnJMfsyCcnyo
   WBHZM2MnfQlOJOuZinslJWBV7JXLXbXx4PpiNVI3zTuLd1YadbW9DlqKu
   KyQrAUsp5i4QSTZxjSdXxnlkVxgteQUG4Sw8wLQg09Dx5DutFRbezaEuu
   EYtBCKPg0ksSqGrCNFM0Wp6EQTMmkVnhiypkh6N/+22vkOFSi8OLO25yL
   AondWwXFKW9vtwVD3ZQU/0x8mizL4sc0nPsNzzug+JKFJjIV6/VBKQFPF
   iEXzwDJDown/IcZd9Gxjmiz3DGQMlQTdAIZhi2dejObWykQ/hMomQuGGV
   g==;
X-CSE-ConnectionGUID: yQTU2zr6ShayjLF388sW7A==
X-CSE-MsgGUID: yVQtTE8SQOGzDylJfXlyXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="210239159"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="210239159"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:12 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id F36F142A305
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 67F7C100010B
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 77E791A008D;
	Tue, 22 Jul 2025 11:13:07 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-gnome] [PATCH 21/21] gnome-online-accounts: upgrade 3.54.3 -> 3.55.0
Date: Tue, 22 Jul 2025 11:12:29 +0800
Message-ID: <20250722031245.884-21-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118685

"windows_live" meson option is deprecated now

Changelog:
==========
- Add progress spinner for OAuth2 dialogs
- Remove Windows Live! option
- Improve goa_oauth2_provider_ensure_credentials_sync (Jan-Michael
- er)
- Authentication failure in goa IMAP accounts
- Missing files from POTFILES.in
- WebDAV not detected for mail.ru
- goaoauth2provider: fix task chaining for subclasses
- Always lowercase domains when looking up base
- goadavclient: check Nextcloud fallback last
- goabackend: add a composite widget for authflow links
- goadavclient: fix the mailbox.org preconfig
- Fix Nextcloud and mailbox.org preconfiguration
- Add DAV preconfig for mail.ru

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ne-accounts_3.54.3.bb => gnome-online-accounts_3.55.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.54.3.bb => gnome-online-accounts_3.55.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.3.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.55.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.3.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.55.0.bb
index 98e67ad957..eb78bd1327 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.55.0.bb
@@ -8,16 +8,15 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'goabackend',
 
 DEPENDS += "gdk-pixbuf dbus glib-2.0 gcr keyutils"
 
-SRC_URI[archive.sha256sum] = "bcf655dd1ddc22bc25793b6840da19f5cad7ba0b7227ff969ed9c252f036aac5"
+SRC_URI[archive.sha256sum] = "fd69d0aec3b672621f525671b5e54f28b73939920b3fc308ade561a83a727b2d"
 
-PACKAGECONFIG ?= "goabackend kerberos owncloud google windows_live"
+PACKAGECONFIG ?= "goabackend kerberos owncloud google"
 
 PACKAGECONFIG[goabackend] = "-Dgoabackend=true,-Dgoabackend=false,gtk4 libadwaita json-glib libxml2 libsoup rest libsecret webkitgtk"
 PACKAGECONFIG[kerberos] = "-Dkerberos=true, -Dkerberos=false,krb5"
 PACKAGECONFIG[exchange] = "-Dexchange=true, -Dexchange=false"
 PACKAGECONFIG[google] = "-Dgoogle=true, -Dgoogle=false"
 PACKAGECONFIG[owncloud] = "-Downcloud=true, -Downcloud=false"
-PACKAGECONFIG[windows_live] = "-Dwindows_live=true, -Dwindows_live=false"
 PACKAGECONFIG[man] = "-Dman=true, -Dman=false,libxslt-native docbook-xsl-stylesheets-native"
 
 FILES:${PN} += " \
-- 
2.43.0


