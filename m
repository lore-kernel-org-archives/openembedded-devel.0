Return-Path: <dmkhn@proton.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D37C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 06:04:30 +0000 (UTC)
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
 by mx.groups.io with SMTP id smtpd.web11.69944.1747116263546509430
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 May 2025 23:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@proton.me header.s=protonmail header.b=Ew6ApPJd;
 spf=pass (domain: proton.me, ip: 79.135.106.30, mailfrom: dmkhn@proton.me)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747116260; x=1747375460;
	bh=tkzqY+1Yub61uNs6iZxOsTrhpcNAPgfk9aVSWHC+5Gg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Ew6ApPJd6ZnJgMctNgsSup1n4J304xFd1N/xXeXkgSCYUCtLI52CuU1nWOyE3DCnb
	 i/KTRVkWu302cEVqdfsdCl2sjgP9xYginIG9F1fbv55paCR+lxRZwLojgEw2f0fqXO
	 WnVqJlfPJm0Hku35H0vzobfq0YlvJSF6JflzcYDsNQTges2orYazFrK+QVdVuh4ju2
	 orMTgrSfK4YhxXeZL6OlviJyo5rOhr0ugRw5Q3uf6H2RKfkIfZBt3hPwo1dRvHEqOl
	 LVrOmNu/apZncyaKDnmRqLJgKslLMmxQWB9BjhPUn3d9gzIqLtW6CPs5T/+tpB6aKw
	 VLaei4gQxjnfw==
Date: Tue, 13 May 2025 06:04:14 +0000
To: openembedded-devel@lists.openembedded.org
From: dmkhn@proton.me
Cc: tymoteusz.burak@3mdeb.com, raj.khem@gmail.com, Denis Mukhin <dmukhin@ford.com>
Subject: [meta-oe][PATCH v1] dediprog-flasher: enable native builds
Message-ID: <20250513060149.3971753-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e1873680b6592fdeedcfc8331436619f91cc0712
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 06:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117391

From: Denis Mukhin <dmukhin@ford.com>

Update dediprog-flasher recipe to support native class variants.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 .../dediprog-flasher/dediprog-flasher_1.14.20.bb      | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.=
bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
index 83a88ab75f..4c6d6bf6f1 100644
--- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
@@ -12,18 +12,23 @@ SRC_URI =3D " \
     file://0002-Makefile-add-conditional-stripping.patch \
     "
=20
-EXTRA_OEMAKE =3D "NOSTRIP=3D1"
+EXTRA_OEMAKE =3D "NOSTRIP=3D1 DESTDIR=3D${D} PREFIX=3D${prefix}"
=20
 PV =3D "1.0+${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
=20
-do_install () {
-    oe_runmake DESTDIR=3D${D} PREFIX=3D/usr install
+do_install() {
+    oe_runmake install
 }
=20
+# NB: /etc/udev/rules.d is packaged outside of ${prefix}
 FILES:${PN} +=3D " \
+    /etc/udev \
+    ${bindir} \
     ${datadir}/DediProg \
 "
=20
 inherit pkgconfig
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1



