Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.93513.1597858756390560080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 10:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=lkPWKQ4V;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=vdtb=b5=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BWw4y4ZBkz4X
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2020 19:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1597858754;
	bh=znl6Rtf5oVhM4zUEF2tzyuDVbVbj8c22ZgEwm8wWQqA=;
	h=From:To:Subject:Date:From;
	b=lkPWKQ4VgE0qINbzF2EgOYrPknFstWuqwSb4Ebv+Fw+kAjk6UjFJehuw9mGOp3QPA
	 TkecY8Qh8LcrKyY2JE9tAwv3coQ9Ifs3Fp6B3UFnJaIA8ly7eC4oAf8i9ZCLcpmVTk
	 cJ5lztVMqa7Lu8ha0VcqsulgVubU2p8b7/2Y9RGZc7KdwMNRZf2JCpKQ9JK4YAXH4n
	 tJk/mTF2LcOWd07RVzT2TNte6IfRKHPig1k/6rnIEb9PxSHie/k2pdRAAaFP/mVtVE
	 B9FQDeJK7Hi0C0+QQVpQ8Egz/oMz4f0lKvr752EsFkkbbodKER7m8ugupTDWsnJ7Bz
	 iD2XrLtAu/MUIChXCs46qwXmG7xxzHm+0yczzyL9irT2bFLNE5oUKWia29cTU5mT0k
	 RDdBdDEp6lIDl8F0YI43ESfRS9P3ViQS8LarWbAvTvG4AwCES2xZIC1SAfc2vQTjZC
	 A3ubchK/8Ht/GKlbpmka+m3SDVeMYjiEZnJO9tKQFWbiMYyo/FMjH3woC8/SnqMnbv
	 MW69R10GMGrOUHxtkrBLJ9r7hVcA3gPfDUGjkvOPKhMISzNKDV6moFImfrXGCV2iXi
	 Tew5axHhx+udim1VOn85Bq6MC38t8aaM0jZRZj7jlHfVJ+ITVAJBzbnVwr7PDpnn/L
	 rVVpmP9YyOkTGo+tQmt6dies=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-settings-daemon: Remove duplicate outdated SRC_URI hashes
Date: Wed, 19 Aug 2020 20:39:13 +0300
Message-Id: <20200819173913.25327-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

They got overwritten later with the correct values.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb      | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
index 8d90a7a40..d14d6b503 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
@@ -6,9 +6,6 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "528b0b7cc2dd22c6026a9c8739c71fa7"
-SRC_URI[archive.sha256sum] = "7ce4979817866911a94ecb75b36db56797e038c0c524c5c1a81aefccafc17337"
-
 DEPENDS = " \
     colord \
     geocode-glib \
-- 
2.17.1

