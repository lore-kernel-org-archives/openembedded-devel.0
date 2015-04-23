Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 98EC96AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 17:00:26 +0000 (UTC)
Received: by widdi4 with SMTP id di4so223394759wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 10:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Tp1hlBci4o1/cr5ASedVsD7PsShqQLd1uQeXMqSqDrE=;
	b=MZKzRVlioGpLc9KItckkrQOq2EGkeiASEOWdiNDRZEWwlUWclTynP+On3PA/8MlWc6
	4zw43LBUgu3/8EV15ITmC8BLhVUQG43SK9LQo4XSw6KVfasUweE4b5FQqXgHoJQOjg0n
	3101jHmabQiro4GF5+diOqsyqhMV2p6C6UEStet8zHv7G52BYH89OKPOmtU+7ihB8Atg
	rcT2kLPxSiV3llUbWNY2gv8fMU+20tQbJlISbgOiHuLpnv+MBoI9irvaeWFSN0yVCYLA
	qU93+wXpnnEK1hUJAeXrcjJFIOGaJfrUOCmsAi28nTDuoS5sx7Z3kDc5qVqr9RcVACTB
	dXzA==
X-Received: by 10.194.2.16 with SMTP id 16mr7216947wjq.46.1429808427654;
	Thu, 23 Apr 2015 10:00:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id it5sm30046183wid.3.2015.04.23.10.00.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Apr 2015 10:00:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Apr 2015 19:00:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150423170040.GE2336@jama>
References: <1429799251-14057-1-git-send-email-cristian.iorga@intel.com>
	<20150423151619.GB2336@jama>
	<969F26A8BAB325438E7EB80D3C3134FB2F4B50F7@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F4B50F7@irsmsx105.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-systemd][PATCH] bluez4_4.101.bbappend: update according to bluez4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Apr 2015 17:00:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2015 at 04:21:17PM +0000, Iorga, Cristian wrote:
> What is left into that bbappend is not suitable for inclusion into bluez4=
 recipe.

Why? Every other recipe in meta-openembedded layers already has these
lines.

> I am not sure why I should move it meta-oe... Does not seem to be present=
 in oe-core. Or am I wrong?

top level directory in meta-systemd says in which layer the recipe is
(now there are only .bbappends for oe-core, because the rest was already
migrated to corresponding layers), you're moving bluez4 recipes from
oe-core to meta-oe, so this .bbappend should be moved as well.

>=20
> Thanks,
> Cristian
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Thursday, April 23, 2015 6:16 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-systemd][PATCH] bluez4_4.101.bbappend: update acc=
ording to bluez4
>=20
> On Thu, Apr 23, 2015 at 05:27:31PM +0300, Cristian Iorga wrote:
> > bluez4 recipe has been updated with proper systemd support, so update=
=20
> > meta-systemd append accordingly.
> >=20
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > ---
> >  .../oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend         |=
 5 -----
> >  1 file changed, 5 deletions(-)
> >=20
> > diff --git=20
> > a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> > d=20
> > b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> > d
> > index da01b05..260c02e 100644
> > ---=20
> > a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> > d
> > +++ b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bba
> > +++ ppend
>=20
> It should be either moved from oe-core to meta-oe directory or better mer=
ged into bluez4 recipe and removed from meta-systemd.
>=20
> > @@ -1,9 +1,4 @@
> > -inherit systemd
> > -
> > -EXTRA_OECONF +=3D "--with-systemdunitdir=3D${systemd_unitdir}/system/"
> > -
> >  RPROVIDES_${PN} +=3D "${PN}-systemd"
> >  RREPLACES_${PN} +=3D "${PN}-systemd"
> >  RCONFLICTS_${PN} +=3D "${PN}-systemd"
> > -SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
> >  SYSTEMD_AUTO_ENABLE =3D "disable"
> > --
> > 2.1.0
> >=20
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

