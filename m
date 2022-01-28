Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13708C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 04:48:30 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.3302.1643345308481166936
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 20:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=JbvfaU6I;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643345308;
  x=1674881308;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=84tvhlJjiP8m3cVCQlAJbs5d5UA4/u+izEnBqmF0TOw=;
  b=JbvfaU6IumIw7jAjpjrNvGo66lkFukG+FB3T3nXWw4vONhbER9TWtW0F
   1ZBZUh5yciVE0qiVH6mGa6T4dtqyVdcD3Rn1841gLBr2Wj1qvgTHCPFdg
   5+oiDJ7ozRaAUpewMSwuqLF7Rjc08dsuydSN9bZjfghmD7DvAS1NIyruN
   JU8PVBqh80hri65cZX1Q7rOWiOKt8Kz9gtySNhptwRWcT1BCsLy3yJY1i
   MKkFqR+qdQDYYuSAW6HlWUrnlfH2YB9710M8URPrkW0q74yEAt3/+if6I
   pmo+oDgOpUMbXOmAkbuu9UczEiZNSU7XHosMwOt/apf7gtwXb1YCcLiG9
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Fabio Estevam <festevam@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>,
	"hs@denx.de" <hs@denx.de>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>
Subject: RE: [oe] [PATCH v3 meta-oe] rtc-tools: Add a recipe
Thread-Topic: [oe] [PATCH v3 meta-oe] rtc-tools: Add a recipe
Thread-Index: AQHYE9KcsmVUkEz+ukGtlSAl8TCAkqx323pA
Date: Fri, 28 Jan 2022 04:48:25 +0000
Message-ID: <d204889ebaf04514b6ec2863a5104052@axis.com>
References: <20220127230607.35740-1-festevam@gmail.com>
In-Reply-To: <20220127230607.35740-1-festevam@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 04:48:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95142

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Fabio Estevam
> Sent: den 28 januari 2022 00:06
> To: openembedded-devel@lists.openembedded.org
> Cc: otavio.salvador@ossystems.com.br; hs@denx.de; alexandre.belloni@bootl=
in.com; raj.khem@gmail.com; Peter Kjellerstedt <peter.kjellerstedt@axis.com=
>; Fabio Estevam <festevam@denx.de>
> Subject: [oe] [PATCH v3 meta-oe] rtc-tools: Add a recipe
>=20
> From: Fabio Estevam <festevam@denx.de>
>=20
> rtc-tools is a useful utility developed by Alexandre Belloni
> for testing RTC kernel drivers, such as y2038 support.
>=20
> Based on the initial recipe from Heiko Schocher <hs@denx.de>.
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../0001-rtc-tools-Add-a-Makefile.patch       | 44 +++++++++++++++++++
>  .../rtc-tools/rtc-tools_1.0.0.bb              | 18 ++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-=
tools-Add-a-Makefile.patch
>  create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
>=20
> diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-A=
dd-a-Makefile.patch b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-=
tools-Add-a-Makefile.patch
> new file mode 100644
> index 000000000000..c1d1fa97eaa3
> --- /dev/null
> +++ b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-
> Makefile.patch
> @@ -0,0 +1,44 @@
> +From b19924f797d69475b1857272231500c97ba9959c Mon Sep 17 00:00:00 2001
> +From: Fabio Estevam <festevam@denx.de>
> +Date: Thu, 27 Jan 2022 18:40:29 -0300
> +Subject: [PATCH rtc-tools v2] rtc-tools: Add a Makefile
> +
> +Add a Makefile to make installation and uninstallation
> +process easier.
> +
> +Upstream-Status: Submitted [https://marc.info/?l=3Dlinux-rtc&m=3D1643324=
26030004&w=3D2]
> +Signed-off-by: Fabio Estevam <festevam@denx.de>
> +---
> +Changes since v1:
> +- Simplify the Makefile by taking Peter Kjellerstedt's feedback in
> +the oe-devel list.

This doesn't belong in the Makefile.patch file, it belongs after the=20
commit message as it relates to the review process and has no bearing=20
once this is integrated.

> +
> + Makefile | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> + create mode 100644 Makefile
> +
> +diff --git a/Makefile b/Makefile
> +new file mode 100644
> +index 0000000..71a4c9c
> +--- /dev/null
> ++++ b/Makefile
> +@@ -0,0 +1,16 @@
> ++prefix ?=3D /usr
> ++bindir ?=3D $(prefix)/bin
> ++
> ++EXEC =3D rtc-range rtc rtc-sync
> ++
> ++all: $(EXEC)
> ++
> ++clean:
> ++	$(RM) $(EXEC)
> ++
> ++install:
> ++	install -d $(DESTDIR)$(bindir)
> ++	install $(EXEC) $(DESTDIR)$(bindir)
> ++
> ++uninstall:
> ++	$(RM) -r $(addprefix $(DESTDIR)$(bindir)/,$(EXEC))
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb b/meta-=
oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
> new file mode 100644
> index 000000000000..64ea3173d8a4
> --- /dev/null
> +++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Useful programs to test rtc drivers"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74274e8a218423e49eefdea80bc55=
038"
> +
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/${BP=
N}.git;protocol=3Dhttps;branch=3Dmaster \
> +           file://0001-rtc-tools-Add-a-Makefile.patch \
> +           "
> +SRCREV =3D "acc442e7af4e1e783432a43d37f1a7938c692659"
> +
> +S =3D "${WORKDIR}/git"
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"

You forgot to remove the TAGET_CC_ARCH line.

> +
> +EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
> +
> +do_install() {
> +	oe_runmake install
> +}
> --
> 2.25.1

//Peter


