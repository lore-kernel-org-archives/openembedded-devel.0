Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E338FC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 06:32:39 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.23596.1748241152373043427
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 May 2025 23:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=nKjE4anq;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=NH1gzTNE;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1748241152; x=1779777152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WdZtLC7obG/Go/ATQkXyr9E8/he7r4ygsfPzukXHGzY=;
  b=nKjE4anqitJOHiqWqOe2IqZYGzaefVi5PG+gJscaMFKxw5S+cKRTgq9g
   n9LkveRTxPNmHUBwA13r8ULAQ1+VUkeTWcLgirwwcX7MRq/AVM5Bk/7iJ
   axvMvKqqsaKtV6vXSo8pgwEYex2MZluQtOMYSU3CntDvmg2ixURmAtmU8
   WHwhfaZcfFiOKn99ceeAGPWzqTsZ7/kK/Jot1ktpzqkETQSUV4PRQYikL
   5mfwuM4MvtVrqQw6095JAtnxp4ltd9U9yZG8SbC3YZoyvqcLROY+78urL
   Oe14eE3XRIxH+gNZUzrH6WfutRWoaWAIH0i7vBC8dYZ59gc8dbG9a9RSw
   g==;
X-CSE-ConnectionGUID: /YqMJZSIQwGHedM/z2pu9Q==
X-CSE-MsgGUID: BwUHTfyQRh6cN2+KBYLU7Q==
X-IronPort-AV: E=Sophos;i="6.15,315,1739833200"; 
   d="scan'208";a="44278402"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 May 2025 08:32:29 +0200
X-CheckPoint: {68340AFD-2D-68AAF6F9-E177A1A4}
X-MAIL-CPID: 192954AB6F2E80F7BCFDB1B79D43087E_2
X-Control-Analysis: str=0001.0A006396.68340B03.0073,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36167166AE8;
	Mon, 26 May 2025 08:32:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1748241145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdZtLC7obG/Go/ATQkXyr9E8/he7r4ygsfPzukXHGzY=;
	b=NH1gzTNEVI9QyNzpl6z66uYmslmWbxQ4FzcZgEsHbqlgTkPxgWKSqA62Y9xht9xkh1GDfB
	0pFLtrlb27GL2P8gDAmwQCdJHKRol4aRK5Jd3II1ARRtbt8aUksyVkSd2GrV61nEESCJE1
	5GLQLBhH6rKHTt23/vjweIK720G+5e1mtKt8K2SM99bkmoKUHS23dU14RYVwAVAy4RKaIQ
	LlYs75wgvumhtgpjDz9+VOFHbytXMW/fdCgR6GgEa2pgqPDfvgVM/+/1rBDvunoBPPh2QJ
	GkNCjsbQRiDbMxEwYapt/6VNVtdfPPEOgDXZ5A7DQHwXgE/LVC+r2SXIelkK4w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: upstream@lists.phytec.de, L.Anderweit@phytec.de
Subject: 
 Re: [oe] [meta-oe][scarthgap][PATCH] lmsensors: Fix build without sensord
Date: Mon, 26 May 2025 08:32:24 +0200
Message-ID: <2787297.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5004930.GXAFRqVoOG@steina-w>
References: 
 <20250505095620.14907-1-l.anderweit@phytec.de> <5004930.GXAFRqVoOG@steina-w>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 06:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117621

Hi,

Am Donnerstag, 15. Mai 2025, 16:52:32 CEST schrieb Alexander Stein:
> Am Montag, 5. Mai 2025, 11:56:20 CEST schrieb Leonard Anderweit via lists=
=2Eopenembedded.org:
> > When building with sensord disabled (PACKAGECONFIG =3D ""), do_install
> > would fail because it tried to build sensord which was skiped in
>=20
> small typo: skiped -> skipped
>=20
> > do_compile.
> > Error log:
> > make: *** No rule to make target 'rrd.h', needed by 'prog/sensord/rrd.r=
d'. Stop.
> >=20
> > Avoid building sensord in do_install by explicitly setting PROG_EXTRA.
> >=20
> > (master rev: fc88c96c4e40d9dbc6097c4679ac79ed55356730)
> >=20
> > Fixes: 86b20b84ec27 (lmsensors: Clean stale files for sensord to avoid
> > incorrect GCC header dependencies)
> >=20
> > Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> Otherwise this fixes the build issue
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Any feedback when this will be picked up? lmsensor build without sensord
are still broken.

Best regards,
Alexander

>=20
> > ---
> >  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-o=
e/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> > index e3186132c76c..6e4cf29f479f 100644
> > --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> > +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> > @@ -48,7 +48,8 @@ S =3D "${WORKDIR}/git"
> >  EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
> >          MACHINE=3D${TARGET_ARCH} PREFIX=3D${prefix} MANDIR=3D${mandir}=
 \
> >          LIBDIR=3D${libdir} \
> > -        CC=3D"${CC}" AR=3D"${AR}"'
> > +        CC=3D"${CC}" AR=3D"${AR}" \
> > +        PROG_EXTRA=3D"sensors ${PACKAGECONFIG_CONFARGS}"'
> > =20
> >  do_configure:prepend() {
> >      sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile
> > @@ -59,7 +60,7 @@ do_compile() {
> >      sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
> >      sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g' \
> >                  ${S}/lib/Module.mk
> > -    oe_runmake user PROG_EXTRA=3D"sensors ${PACKAGECONFIG_CONFARGS}"
> > +    oe_runmake user
> >  }
> > =20
> >  do_install() {
> >=20
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



