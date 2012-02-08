Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rv6zV-0001R0-48
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 13:51:17 +0100
Received: by eekd41 with SMTP id d41so141215eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CNHkglofw2BALHf2EosBjmelfpG6WwJh6Sss85Xziyg=;
	b=WBbE9tjw06R6AdFtqUoQRihCZO0LkFRjXMUoOH9/F5/4Bh2imbzCVhVxRFQ5A1PXCv
	EHj1WXhyGVc5VHmDvySlk3I15HtNgSq/vi72jwUxsgWFT7z6CS8ddc58fpyPrNu99iqN
	eatv9wqlzrUYvxF/9vYwSwq4u7TQ5gCOx+Sh8=
Received: by 10.14.120.207 with SMTP id p55mr8077841eeh.28.1328704993974;
	Wed, 08 Feb 2012 04:43:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n58sm4810147een.10.2012.02.08.04.43.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 04:43:13 -0800 (PST)
Date: Wed, 8 Feb 2012 13:43:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120208124311.GB3647@jama.jama.net>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
	<CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
	<jgtl0v$gd6$1@dough.gmane.org>
	<CAP9ODKp7S2+HR3umrnd9RzT5JE0X_T_cjWPzi6S5WUdZ-SAzoQ@mail.gmail.com>
	<jgtov9$fhv$1@dough.gmane.org>
	<CAP9ODKp7LW3f3-fKk_K_iZsfw2p7R3sH+b_8-QFXNQ89u90+dA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp7LW3f3-fKk_K_iZsfw2p7R3sH+b_8-QFXNQ89u90+dA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Wed, 08 Feb 2012 12:51:17 -0000
X-Groupsio-MsgNum: 37012
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2012 at 10:28:12AM -0200, Otavio Salvador wrote:
> On Wed, Feb 8, 2012 at 10:14, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
>=20
> > Images with sysvinit will be working the same as before, just with
> > libsystemd-logind.so.X being installed. Images with systemd get working
> > session tracking.
> >
>=20
> AFAIK polkit uses consolekit or systemd. In case you build it with systemd
> you break consolekit support.
>=20
> However a stronger point IMO is that some changes, for one or another init
> system, might involve specific compilation options and thus making their
> runtime incompatible as it's the case of polkit. Usually people will want
> one or another init system and I see no gain in have both available.
>=20
> Forcing user to use a bbappend to have one working well is the wrong way.

I think that only usable alternative _if it works_ is to build polkit
linked always to libsystemd-logind.so.X and force users of sysvinit
to use small part of systemd (libsystemd-logind.so.X packaged in systemd-lo=
gind).

Then we could keep add --enable-systemd to polkit etc., but if this
breaks stuff which worked with consolekit, then distro policy would be
better.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8ybd8ACgkQN1Ujt2V2gBxNeACfYrH39bU1EdyoNqDRhxkPMoj4
VZ0An0WgeoYXw6TaiOACqY2fgxe5oPcG
=Fhja
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
