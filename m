Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.3550.1620958582026491724
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 19:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GB1ISn0I;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958580; i=@fujitsu.com;
	bh=4YJCSx4XZaTRYCVxJKEY/Ka1vc1KUVOOuPcKtVFpBQo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GB1ISn0I08HCbpgternmt/+Kd3jgWQ5KO+iVutZu0q9k812pkxPgCebRd4GopS+9g
	 0pGkN2IIt8HGCt+gVU7qYtK4T/pA1mbPHsjWKBCJlTHU47gTZ805MLzv1QOs7NRJ3w
	 IOEiiSa7RFgwdq28ZA5hjBqli7MlefnI01HKQj9L4J7hnTRbBw37axbLbUwfPgU1sS
	 lwlHgtheWrjF5aJSe1She4lHXZuZgTNrTr8knWMVb5r2sMol2LHaxgDsKFGAaEnf+B
	 A5ed74m9MXFWrFXg9GlgNebW6z0ACMA0owCB0gxumaWi4tWgGLqWY9wN7pB77hBJol
	 5iWO+mqZohIMw==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id B5/1A-15146-37DDD906; Fri, 14 May 2021 02:16:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1S26Ozf
  B4PdOUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePEq3OMBVvZKx4e387ewHiGrYuRk0NIYDaT
  xIKVnF2MXED2bkaJXXv62UESbAK6EucerwWzRQT0JZbO3sMMYgsL2EvcaN4IZrMIqEps+b0Mr
  IZXwEPi4Ob7LCC2hICCxJSH75kh4oISJ2c+AYszC0hIHHzxAijOAVSjKDF7ujxEeYXEjBnb2C
  Yw8sxC0jELSccCRqZVjJZJRZnpGSW5iZk5uoYGBrqGhsa6JrqGxgZ6iVW6SXqppbrJqXklRYl
  AWb3E8mK94src5JwUvbzUkk2MwDBKKWRp2sH4+9UHvUOMkhxMSqK8Jz1nJwjxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4HW/MzdBSLAoNT21Ii0zBxjSMGkJDh4lEV57kDRvcUFibnFmOkTqFKOil
  DhvK0hCACSRUZoH1waLo0uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmlQKbwZOaVwE1/Bb
  SYCWjxjemzQBaXJCKkpBqYljlo3A7TDSk1NZTV7vq0Zsua5ENS7pfvbdrycMKhjMfGFQHrS8T
  316w18v21tFlzwee7zNmP5wn84t/j8H2q57zpe39ufvvlcJtffpmHrsf8RtmMWXG9uy8a55xb
  sP7iIf5ul9vBtV8TPkj8Fl4klFgtpbAw9bQd83K/X3s+FB5atMum5uWknfoXTJtMXwbY+uXNv
  dq6P+DDvOanoueMGcUPHt4rr3op7YuX7r/5ES5tCxa5VPkf/F6S+5O/99i/LndLT5dl1hYvYn
  68W3uj68iDl1Mbpf6u2yewyELaWP+2T6XBw8/Ne5wnsTYpnar7kcBwuX6Xgr3P+mdnVefmPj7
  47fnuOoNfCd2RbxgFDyixFGckGmoxFxUnAgCntgCXHgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-245.messagelabs.com!1620958577!196356!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8987 invoked from network); 14 May 2021 02:16:18 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-22.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:16:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2GHM2004209
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 03:16:17 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:16:15 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libxmlb: upgrade 0.3.0 -> 0.3.1
Date: Fri, 14 May 2021 10:16:08 +0800
Message-ID: <1620958568-16506-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libxmlb/{libxmlb_0.3.0.bb => libxmlb_0.3.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.3.0.bb => libxmlb_0.3.1.bb} (90%)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.0.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.1.bb
similarity index 90%
rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.0.bb
rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.1.bb
index d677d2436f..72d3aba44f 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.0.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.1.bb
@@ -6,7 +6,7 @@ SRC_URI = "\
     git://github.com/hughsie/libxmlb.git \
     file://run-ptest \
 "
-SRCREV = "8f2f28eda419dbe31cb1a9aa022f0ca9d30ecb6a"
+SRCREV = "98fc241305306de9468249301474820696acb4be"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome
-- 
2.25.1

