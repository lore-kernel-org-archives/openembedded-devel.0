Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.61.1622740249391145687
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 10:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=ZseR305n;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4ADF482CA0;
	Thu,  3 Jun 2021 19:10:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1622740246;
	bh=U1vo5DPI/xQ84aJkVjWlPs3Em8z/bND3FcQVG+vGULw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZseR305nIMdNT+YEVNOtkWxBa66+s4E4D/zsTRsv1R3nEn40QXzEPCpfJODGZb7hW
	 064DoLNGgE30WA8l5WEG6+hYIQW+JLtu7wmv+QKepJV4lc+0DUieustAIJgAO3IQa4
	 l33iW1IZj4gQL8lksGF7tJfFhTPVtkutSvAvWQJJwVOrxsD6jg1n8dbXj2Nsc5fEeV
	 INjIsALeP7jeJHIQfmwRiCiAVWqrK748VfkfYN2bPs7egi5z9d2C0ay+LpdlOiIVc4
	 xJx8TXhVvuPPAEQVOAMHWYvd0IM4EXxgRr6blL9U+OhquHFk0njQ19c0HoFPVUlAVq
	 CcoGCu7Ix4F9Q==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Armin Kuster <akuster808@gmail.com>,
	Armin Kuster <akuster@mvista.com>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-oe][PATCH] nss: Fix build on Centos 7
Date: Thu,  3 Jun 2021 19:10:40 +0200
Message-Id: <20210603171040.105283-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

Centos 7 has glibc 2.18 and nss-native build fails due to implicit
declaration of function putenv during build. This is because of the
Feature Test Macro Requirements for glibc (see feature_test_macros(7)):

  putenv(): _XOPEN_SOURCE
      || /* Glibc since 2.19: */ _DEFAULT_SOURCE
      || /* Glibc versions <=3D 2.19: */ _SVID_SOURCE

and because nss coreconf/Linux.mk only defines

 -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE

So on such system with glibc 2.18, neither macro makes putenv()
available. Add -D_XOPEN_SOURCE for the Centos 7 and glibc 2.18
native build case.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/nss/nss_3.64.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.64.bb b/meta-oe/recipes-su=
pport/nss/nss_3.64.bb
index fce5a856e..d4d7a8733 100644
--- a/meta-oe/recipes-support/nss/nss_3.64.bb
+++ b/meta-oe/recipes-support/nss/nss_3.64.bb
@@ -45,6 +45,8 @@ TDS =3D "${S}/tentative-dist-staging"
=20
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
+CFLAGS_append_class-native =3D " -D_XOPEN_SOURCE "
+
 do_configure_prepend_libc-musl () {
     sed -i -e '/-DHAVE_SYS_CDEFS_H/d' ${S}/nss/lib/dbm/config/config.mk
 }
--=20
2.30.2

