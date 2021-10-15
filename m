Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7CDC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 19:21:04 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.1771.1634325661963042346
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=G7wrDU/C;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BCEE88362D;
	Fri, 15 Oct 2021 21:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634325659;
	bh=QdC+3o8h8R1s5CRbFS0COqV+W70kpBIw9KZk9Fb7tUg=;
	h=From:To:Cc:Subject:Date:From;
	b=G7wrDU/CYlzfwCTHT4cwbnYtzmtG6w2VyRjzqwLT6oH2bcIwi9T1EEoZ3ZCROKNSi
	 a23ONO1z/s+mJlJIwciEu6cGaBozZaur0PjKX+Ok2ED0yQFmdErxS1ldQHgnFQGjjE
	 4ISQMlb/kd/HH5lIIEj09K2L65hERx4l4m9nhXxx9WpstSt9bGtB8tTjHsSP7ktMYO
	 4l3CPC6cetV3vFlq1uz3MqULXW8jRulQwh39pvoPJ0FOGq0vxwPL7HzQlkO1hq/Vld
	 KG4dorTDe3PG3ZFgQ63aAZezYFuQriQg7aJgyEx8/uT6vju4Md3BXnysbQvadYZXoA
	 C1Knp/0V4brEg==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Martin.Jansa@gmail.com,
	Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] apitrace: Conditionally enable X11 support
Date: Fri, 15 Oct 2021 21:20:53 +0200
Message-Id: <20211015192053.48812-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 19:21:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93333

In case DISTRO_FEATURES contain both x11 and opengl, enable X11 support
in apitrace, because all the requirements are satisfied.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
---
V2: Switch to PACKAGECONFIG and make x11 support configurable that way
---
 meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb b/meta-oe=
/recipes-devtools/apitrace/apitrace_10.0.bb
index 57ec1f8e0..eb8e0318e 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
@@ -16,9 +16,11 @@ DEPENDS +=3D "zlib libpng python3-native"
=20
 inherit cmake
=20
+PACKAGECONFIG ??=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'x11 openg=
l', 'x11', '', d)} "
+PACKAGECONFIG[x11] =3D "-DENABLE_X11=3DON,-DENABLE_X11=3DOFF,libx11"
+
 EXTRA_OECMAKE +=3D "\
     -DENABLE_GUI=3DOFF \
-    -DENABLE_X11=3DOFF \
     -DENABLE_STATIC_LIBGCC=3DOFF \
     -DENABLE_STATIC_LIBSTDCXX=3DOFF \
     -DPython3_ROOT_DIR=3D/usr/bin/python3-native \
--=20
2.33.0


