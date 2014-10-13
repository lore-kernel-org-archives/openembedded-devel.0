Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id C1A8C6A362
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 12:43:24 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id h11so3255600wiw.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 05:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nF8lsbiR/GN/1kpxsqwgPskPV7ha1K/g+G+HeekqJXU=;
	b=oaCDb4OoXoCDJ81x09hXTxkiPv7CNc0jidYOGdXnef2xzv9JlXGceEHaOpNxj9TWZO
	xRehFA6krWOeOdwfqM3j0kwnpTHmHvADLBrLAuVfeMskCF/2eJOdpRJS1i4GMUthfM95
	pChTMmCWibuh4NSpXng2CxFkcrXJC9iPhf1x2YHru5/p5sSnmmrHv8I3VZRnoi/TFew4
	zMbzOShEZ7yuVbGigW/THBQdQ+mN/Omc4mbS4+/fwiyYEiFcT0oazyzJ2uequ+35d4fs
	ILIU1iIm6Ezub8hnP+vyokVVMKeMg981Wa/fLLJgxjfzSLlby3baixtOcUeQatjhNchN
	B3dg==
X-Received: by 10.194.134.100 with SMTP id pj4mr21411889wjb.72.1413204204771; 
	Mon, 13 Oct 2014 05:43:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bc5sm14583282wjb.14.2014.10.13.05.43.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Oct 2014 05:43:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Oct 2014 14:45:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141013124510.GG3000@jama>
References: <cover.1413180347.git.wenzong.fan@windriver.com>
	<0ba4f373d7be41147888b6a71728f7771ef28bb8.1413180347.git.wenzong.fan@windriver.com>
	<543BC7AB.6060908@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <543BC7AB.6060908@pabigot.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/1 v3][meta-networking] ntp: fix path to drift file
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
X-List-Received-Date: Mon, 13 Oct 2014 12:43:31 -0000
X-Groupsio-MsgNum: 52478
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iRjOs3ViPWHdlw/I"
Content-Disposition: inline

--iRjOs3ViPWHdlw/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2014 at 07:38:03AM -0500, Peter A. Bigot wrote:
> On 10/13/2014 01:17 AM, wenzong.fan@windriver.com wrote:
> > From: Wenzong Fan <wenzong.fan@windriver.com>
> >
> > The default path of ntp drift file is /etc/ntp.drift, ntp daemon
> > maybe fails to create this file since the user ntp is not always
> > permitted to write /etc.
> >
> > Refer to other distributions such as RedHat, Debian, just moving
> > the file to /var/lib/ntp which the home dir of user ntp.
>=20
> Note that this new version depends on=20
> http://patches.openembedded.org/patch/81585/ which provides the=20
> packaging of ntp's home directory, which wasn't captured into=20
> master-next.  That would be obscured by the presence of the previous=20
> version of this patch which (IMO) improperly uses volatile to create=20
> that directory.

Thanks for keeping eye on me, it should be fixed in master-next now.

>=20
> Peter
>=20
> >
> > Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> > ---
> >   meta-networking/recipes-support/ntp/files/ntp.conf |    2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/ntp/files/ntp.conf b/meta-=
networking/recipes-support/ntp/files/ntp.conf
> > index 875b7eb..676e186 100644
> > --- a/meta-networking/recipes-support/ntp/files/ntp.conf
> > +++ b/meta-networking/recipes-support/ntp/files/ntp.conf
> > @@ -1,7 +1,7 @@
> >   # This is the most basic ntp configuration file
> >   # The driftfile must remain in a place specific to this
> >   # machine - it records the machine specific clock error
> > -driftfile /etc/ntp.drift
> > +driftfile /var/lib/ntp/drift
> >   # This should be a server that is close (in IP terms)
> >   # to the machine.  Add other servers as required.
> >   # Unless you un-comment the line below ntpd will sync
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iRjOs3ViPWHdlw/I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ7yVYACgkQN1Ujt2V2gBxIiQCgkplwoUF7pFxJuWods/tASUAK
Ps4An24cFLozj3+K5e3fwsjz2XRfVdYD
=bTg3
-----END PGP SIGNATURE-----

--iRjOs3ViPWHdlw/I--
