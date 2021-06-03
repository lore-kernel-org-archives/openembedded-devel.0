Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.93.1622740403629764599
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 10:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=w41/BB7i;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EF61282CA0;
	Thu,  3 Jun 2021 19:13:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1622740402;
	bh=eQ9MVBoVgw4vZmJCcpLSZCI/l1deaK9nl13fyBVvEiE=;
	h=From:To:Cc:Subject:Date:From;
	b=w41/BB7il+xGn1+htcnm9vbXeFLqnNiakJA7hin1zQ3KzfQJ8Oa6h7Z70UQKWnzoD
	 m3g3XhVkmES1xKieo2IGHo3qgAJVPLj+DxgmoCt6GBZgKP5iRKrYJrlV4aEoEhz37y
	 D267UZT3/fVD7jIie84+84I5wwYME7KTfUhZnkCGRAdrRajYs6hIjQDGV77WlAH3DL
	 uiBMrs3G+/+FlLXGawtABeMLwIXCfMPnL9q+79FeATleuvESZywEUYp93pco+ez5/K
	 8pcaKRuq94zL55wLKKRw09YlL94zmS0JjdwkUJlRqoVqXwP2kQRx2ZF/mdlnaJrR1e
	 ZFF+3Z9XcYsEA==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Armin Kuster <akuster808@gmail.com>,
	Armin Kuster <akuster@mvista.com>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-oe][dunfell][PATCH] nss: Fix build on Centos 7
Date: Thu,  3 Jun 2021 19:13:16 +0200
Message-Id: <20210603171316.105842-1-marex@denx.de>
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
 meta-oe/recipes-support/nss/nss_3.51.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-=
support/nss/nss_3.51.1.bb
index 0e127975b..30370573d 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -55,6 +55,8 @@ TUNE_CCARGS_remove =3D "-mcpu=3Dcortex-a55+crc -mcpu=3D=
cortex-a55 -mcpu=3Dcortex-a55+crc
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

