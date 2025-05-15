Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8A7C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 14:52:45 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.14642.1747320759537603840
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 May 2025 07:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=WdRWiGn7;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=tsH3jmKI;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747320759; x=1778856759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lu3XuV0RpKO3RQrSoUyNvnSyZmcRcICY3Gnkm5K5QHU=;
  b=WdRWiGn7a9Nz4TscBxrL5MVQcEfQdUNm9va7C36GOCf7r5jLAol2jNA2
   W6CzJDvTXJfrBOPCDKXiNPslM6CfMPN/XXit20PpTO0lXAkY5xaPDqSCe
   3kD8PkRaNNVW/CK46PMLJwkn4QbegBeaQyk/maBQNlWXbA5Rhep/0QgPl
   wIEFQ2WMeq3SlYr/m8U4/E+iK6M1sZGyLxUfMEcgUhAbxw30lcL2kzzjb
   ikqxZJOFLcdgTJycNMgRPviTdlB05BNPPAwi5pz7Q+munxMKru3Q1enF4
   l7KFY3o23qOYCkukHccteYbGWMErlSTZ64ZYgkzDyL84ZDTltdvaETSTt
   w==;
X-CSE-ConnectionGUID: cn+Lx/VgT+qB5EtKH2eNpw==
X-CSE-MsgGUID: QIoll4RwRnacEGiLK4KSGg==
X-IronPort-AV: E=Sophos;i="6.15,291,1739833200"; 
   d="scan'208";a="44102710"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 May 2025 16:52:37 +0200
X-CheckPoint: {6825FFB5-4-68AAF6F9-E177A1A4}
X-MAIL-CPID: EA02A107B2459EB848C3E7DF0C8ED143_2
X-Control-Analysis: str=0001.0A00639A.6825FFBA.0041,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98E2A168729;
	Thu, 15 May 2025 16:52:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747320752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lu3XuV0RpKO3RQrSoUyNvnSyZmcRcICY3Gnkm5K5QHU=;
	b=tsH3jmKIGoR6Wl6XXJb2TVgRzv844nVCCL+MTk1Hpv5GuY3PJ+Khz1J0zeCQSzOeS99Add
	pSUn54F628qmp3TPDaB3++7ek6D6uxEJ4EXbUVcfCMs2pHsS00TeBhjydvaikd39krLvC/
	AcwxC5Aqfg511qIaEqAQK30Zer2DhA+FSQQg9/R+ND2nslaOyjhUUgkf+eOLpP8UKOzsvJ
	a/z71eOTNp+LKCAPb6tStjyAr9hDQqKd/5Yg6qDsBH/oS/NiQAMlN1JnSQjmmmwebH2oDN
	01pReKXu0k1D6uDY3gUcuvYP3RSlMh0Z4yEjkqRFnI5bFs3ISEOcWZ2r5CExFA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: upstream@lists.phytec.de, L.Anderweit@phytec.de
Subject: 
 Re: [oe] [meta-oe][scarthgap][PATCH] lmsensors: Fix build without sensord
Date: Thu, 15 May 2025 16:52:32 +0200
Message-ID: <5004930.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250505095620.14907-1-l.anderweit@phytec.de>
References: <20250505095620.14907-1-l.anderweit@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 May 2025 14:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117423

Am Montag, 5. Mai 2025, 11:56:20 CEST schrieb Leonard Anderweit via lists.o=
penembedded.org:
> When building with sensord disabled (PACKAGECONFIG =3D ""), do_install
> would fail because it tried to build sensord which was skiped in

small typo: skiped -> skipped

> do_compile.
> Error log:
> make: *** No rule to make target 'rrd.h', needed by 'prog/sensord/rrd.rd'=
=2E Stop.
>=20
> Avoid building sensord in do_install by explicitly setting PROG_EXTRA.
>=20
> (master rev: fc88c96c4e40d9dbc6097c4679ac79ed55356730)
>=20
> Fixes: 86b20b84ec27 (lmsensors: Clean stale files for sensord to avoid
> incorrect GCC header dependencies)
>=20
> Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Otherwise this fixes the build issue
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/=
recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> index e3186132c76c..6e4cf29f479f 100644
> --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> @@ -48,7 +48,8 @@ S =3D "${WORKDIR}/git"
>  EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
>          MACHINE=3D${TARGET_ARCH} PREFIX=3D${prefix} MANDIR=3D${mandir} \
>          LIBDIR=3D${libdir} \
> -        CC=3D"${CC}" AR=3D"${AR}"'
> +        CC=3D"${CC}" AR=3D"${AR}" \
> +        PROG_EXTRA=3D"sensors ${PACKAGECONFIG_CONFARGS}"'
> =20
>  do_configure:prepend() {
>      sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile
> @@ -59,7 +60,7 @@ do_compile() {
>      sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
>      sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g' \
>                  ${S}/lib/Module.mk
> -    oe_runmake user PROG_EXTRA=3D"sensors ${PACKAGECONFIG_CONFARGS}"
> +    oe_runmake user
>  }
> =20
>  do_install() {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



