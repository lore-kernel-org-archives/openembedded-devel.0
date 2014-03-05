Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC6F6116C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 19:30:24 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id m10so1240575eaj.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 11:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7epTvA8E91EKDcDVT0W3tEHFpdXdz81f32SJx82txbU=;
	b=ZGcxqKuIxSnZWkr4X1kNM4Pn3lVGqUjj2bWXOGLbQEelSr5Mm02kdnxelInv173J17
	FN75cV30ZP5nuMJkgQ4HOaQa1PSaIuYolL3ijNTldUEhD6MNmdkOEbe/IaZJusavdcUo
	aPDsd8YcpKzb3rOsLFiGpHefSXEDqQvm2MagtNzx9J/t850w1tiSKIDkpVQlDv6mvr6x
	pgFzOK8RUsDyRSdeBcM+3k8LoCLstvwyZGzqL19RL9EN+raq95Td9q4inuLDxLf6N4e+
	xXBpwPsMxkUx8QufpDr/Odw79XLuADUIeXTR6Te0tSNCGuwBbxOidHSLSIHOefMxXIES
	WbqQ==
X-Received: by 10.15.27.200 with SMTP id p48mr4566018eeu.105.1394047825104;
	Wed, 05 Mar 2014 11:30:25 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm12691988eeg.8.2014.03.05.11.30.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 11:30:23 -0800 (PST)
Date: Wed, 5 Mar 2014 20:30:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Message-ID: <20140305193027.GD26981@jama>
References: <cover.1394010806.git.ajlennon@dynamicdevices.co.uk>
	<ce88733ef0143e96e323aff0ac34909d43eda4bf.1394010806.git.ajlennon@dynamicdevices.co.uk>
	<20140305172026.GX26981@jama>
	<53176169.9060501@dynamicdevices.co.uk>
MIME-Version: 1.0
In-Reply-To: <53176169.9060501@dynamicdevices.co.uk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH 1/1] daq: Update from 2.0.1 to 2.0.2
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
X-List-Received-Date: Wed, 05 Mar 2014 19:30:25 -0000
X-Groupsio-MsgNum: 48532
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82sSsPTX2JCK/L1V"
Content-Disposition: inline

--82sSsPTX2JCK/L1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2014 at 05:39:53PM +0000, Alex J Lennon wrote:
>=20
> On 05/03/2014 17:20, Martin Jansa wrote:
> > On Wed, Mar 05, 2014 at 03:49:13PM +0000, Alex J Lennon wrote:
> >> daq-2.0.1.tar.gz is missing from SRC_URI location. Presumably replaced=
 with 2.02.
> > Sorry I haven't noticed it when replying on oe-core version, but can you
> > please remove 2.0.1 version in the same patch and sent with -M?
> >
> > Do you know if it fixes do_install issue when building on host with
> > dash? It's reported regularly in:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > Thanks!
>=20
> Apologies. I thought I had the removal of 2.0.1 in there. Clearly I
> shouldn't be doing this
> type of thing before the first coffee of the day!

:)

I've added 2.0.1 removal when cherry-picking this to master-next.

> I'll take a look at the issue you mention before I resubmit

Thanks, I've started new world build, please watch status e-mails to see
if it happens there as well again, it's possible that dash isn't the
(only) reason for the failure..

>=20
> Cheers, Alex
>=20
> >> Signed-off-by: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
> >> ---
> >>  meta-oe/recipes-connectivity/daq/daq_2.0.2.bb |   16 ++++++++++++++++
> >>  1 file changed, 16 insertions(+)
> >>  create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> >>
> >> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/r=
ecipes-connectivity/daq/daq_2.0.2.bb
> >> new file mode 100644
> >> index 0000000..2675e2a
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> >> @@ -0,0 +1,16 @@
> >> +SUMMARY =3D "The dump DAQ test the various inline mode features "
> >> +HOMEPAGE =3D "http://www.snort.org"
> >> +LICENSE =3D "GPLv2"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd738dc1ae631d8b2=
1c40e0"
> >> +
> >> +PARALLEL_MAKE =3D ""
> >> +
> >> +DEPENDS =3D "libpcap libpcre "
> >> +
> >> +SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
> >> +            file://disable-run-test-program-while-cross-compiling.pat=
ch "
> >> +
> >> +SRC_URI[md5sum] =3D "865bf9b750a2a2ca632591a3c70b0ea0"
> >> +SRC_URI[sha256sum] =3D "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4=
a51f605309beac269a8"
> >> +
> >> +inherit autotools
> >> --=20
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>   =20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82sSsPTX2JCK/L1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMXe1MACgkQN1Ujt2V2gBzOywCdEbFDlOXRgMCKXOHEeddbIk2u
fgwAoKnotE0Mtl4c5n8lb8JbiOYhqAzw
=jhR1
-----END PGP SIGNATURE-----

--82sSsPTX2JCK/L1V--
