Received: from [209.85.200.175] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Jqqjc-0005OT-UC
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 16:23:09 +0200
Received: by wf-out-1314.google.com with SMTP id 25so21545wfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2008 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:cc:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
	bh=ExInnOL8N0x7P83+HtA7NM7Qt0GddCSNqTnkfLhYU5E=;
	b=dDGYh24/AZo+DgzDRIgVg1Ez7vxmjn1ZZu8ELfIGVYaS/+vwHcFx+RqLHywTBlmfM3vgE04DODylFEnLODDgFNjiX7ZRbu0JbJvs/u0RjeZyD1UmVYHVbvQlUvoEVMb+LIOibPesSD2QKr/l4BP/mVH0ozdBCmxfvIte9N+H8uQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:cc:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
	b=IwAPsEQALJePyLoohtRhTf/EsFAYMXbqMCATXtYKvtRBi5RhL8GCwMtpzpL6VIeAEDuobcytaZwkwNb5aXwQ9KrJ9CrZ1M2geFCFaVB/n60SzZ+Q9SwHgkj9rJPhexPMO1SB80sOCyAl7hVXvo4mHplfs8vmiJRDlmH930Ymr/Y=
Received: by 10.143.156.15 with SMTP id i15mr331664wfo.276.1209478960328;
	Tue, 29 Apr 2008 07:22:40 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.12.15])
	by mx.google.com with ESMTPS id 29sm15228190wfg.9.2008.04.29.07.22.39
	(version=SSLv3 cipher=RC4-MD5); Tue, 29 Apr 2008 07:22:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1209471859.5642.16.camel@dax.rpnet.com>
References: <200804281451.05548.geoffrey@pager.net>
	<200804282349.46539.zecke@selfish.org>
	<c384c5ea0804281519o596e224bw252bbac9cca4abc6@mail.gmail.com>
	<c384c5ea0804282203n7b743ed7w41e5e4c201b81a13@mail.gmail.com>
	<19c1b8a90804290048g7618e76dw65ad0273504c9c74@mail.gmail.com>
	<c384c5ea0804290507t66765c59w2fbc82366bec675d@mail.gmail.com>
	<1209471859.5642.16.camel@dax.rpnet.com>
Date: Tue, 29 Apr 2008 07:22:38 -0700
Message-Id: <1209478958.30327.1.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: Mixed up STAGING_INCDIR's in uclibc.inc?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Apr 2008 14:23:09 -0000
X-Groupsio-MsgNum: 5049
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-gQY0DoVLLIx74rUOidIX"

--=-gQY0DoVLLIx74rUOidIX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-04-29 at 13:24 +0100, Richard Purdie wrote:
> On Tue, 2008-04-29 at 14:07 +0200, Leon Woestenberg wrote:
> > On Tue, Apr 29, 2008 at 9:48 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > >  That should pull the dependency. but this line
> > >
> > >  DEPENDS =3D "linux-libc-headers"
> > >
> > >  should be changed to
> > >
> > >  DEPENDS +=3D "linux-libc-headers"
> > >
> > >  I think.
> > >
> > No, I think the DEPENDS was *intended* to be overridden with a small
> > *sub*set that is enough for -initial (to prevent cyclic dependencies).
> >=20
> > However, I suspect it should DEPEND on ncurses-native now as well.
> >=20
> > You know, I'll fire off a Poky Linux build on a system without
> > ncurses-dev on the host to verify my thesis,
>=20
> This was a recent fix to Poky. I removed all the -dev packages from our
> build machine and my desktop and can confirm it worked without the -dev
> package installed after the fix. I don't think its needed for -initial,
> just for the main version but I could be wrong. Be sure to use "bitbake
> uclibc-initial" when you test.

if you are doing anything with kconfig in the recipe you will need
libncurses-dev which I think uclibc-initial is doing.

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=-gQY0DoVLLIx74rUOidIX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIFy8uHnJKy6V6em4RAreIAKCvMk1MioslgI4hpTK/P5GjJyRrpgCfYbEu
HZU9NHY2w3uiIXT5Vvosnmk=
=gEj2
-----END PGP SIGNATURE-----

--=-gQY0DoVLLIx74rUOidIX--
