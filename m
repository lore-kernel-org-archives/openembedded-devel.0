Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PzlnI-0002eF-Fw
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 09:09:24 +0100
Received: by fxm19 with SMTP id 19so1352736fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 01:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=h7x6PYvvKsnQ2DZz+r6eWC/KBcdXYlPipcgUE/fv5s0=;
	b=g6IThJkJFnJVhl8Zfk9XtDSBOF2YTG4l++WIJJbBx0GO5TeoTunBdAT13EmSf76umk
	h3X+xoGHfMLIlz31crEYLF8+m8AEO4qnULm1c34pV6ZHMyXiV1O6R8i3yKocw4hxmqG2
	gylwBwVfrc0p7I8KgYUPTOKzhwnxcrFCZ5pu4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=sLamPJyChThlcKTGSKTUhRmSvDKGE13dATPFKAfm7jJ9Fr7sXyxR7cQR391dkS3wW0
	gQSFAixVF+bgAsvQJ0CpDNcqwYdgJkCQ5XJrEoiS0fZghjQEWnzMwqA2Gjqk/6IdgMFp
	tDRBuHejNumdrEY/hg/ANdZwle1QMoGgqa4Nw=
Received: by 10.223.143.5 with SMTP id s5mr544987fau.60.1300262708314;
	Wed, 16 Mar 2011 01:05:08 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e1sm64591fav.24.2011.03.16.01.05.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 01:05:06 -0700 (PDT)
Date: Wed, 16 Mar 2011 09:05:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110316080500.GA3414@jama.jama.net>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha> <20110315220301.GC3042@denix.org>
	<1300254477.2818.5.camel@eha>
	<989A078976CDAD4CB2DC976EEF70E2A50547990E@eu2-mail.mgc.mentorg.com>
	<4D8061DE.6030106@gmail.com>
	<AANLkTikfnLb0XW6B6M0s+w=VuOkaeq0=MrYwUniQ6B_x@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikfnLb0XW6B6M0s+w=VuOkaeq0=MrYwUniQ6B_x@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Python-native dependency in libxml2
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
X-List-Received-Date: Wed, 16 Mar 2011 08:09:24 -0000
X-Groupsio-MsgNum: 30249
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2011 at 08:28:39AM +0100, Frans Meulenbroeks wrote:
> 2011/3/16 Khem Raj <raj.khem@gmail.com>:
> > On 3/15/2011 11:22 PM, Ahsan, Noor wrote:
> >>
> >> Hello,
> >>
> >> I was looking at the libxml2 package. While going through the recipes I
> >> came to know that its native package depends on python-native package =
as
> >> well. This dependency is defined in libxml2.inc file.
> >>
> >> DEPENDS_virtclass-native =3D "python-native"
> >>
> >> This package build fine after removing this dependency. I am not clear
> >> why this dependency is being added in libxml2 package. Can somebody
> >> clear that to me. While looking at the git log I came to know that this
> >> change is coming from libxml2-native.inc file. But I am not clear why
> >> this dependency was added as this package build fine without it.
> >>
> >> Please help me in understanding this dependency. Thanks.
> >
> > Try to build this recipe from scratch and see if it still works then we=
 can
> > remove the dep

That's not enough, libxml2-native builds fine.. but then xml2po
will fail if there isn't libxml2-native built with python support.

see a25f07ca6159e1cd5b8a215ca5da8405fb1b9053

So yes.. for such tests you should build recipe from scratch _and_ check
if resulting package/sysroot is still the same.

Regards,

> I'm not sure if that is the right way.
> It might well be that typically python-native is already there in a
> scratch build because some earlier package needed it (or even because
> of the scheduling of build steps.
>=20
> Probably a better way is to build with packaged staging (with staging
> dir outside TMPDIR) then rm TMPDIR and bake the package.
> Alternately peek into the package to see if it needs python. If it is
> needed then the DEPENDS should stay.
>=20
> Looking at the issue at hand maybe the best person to ask is Martin
> Jansa as he last touched that line according to git blame:
> 3cd9ddbf recipes/libxml/libxml2.inc  (Martin Jansa
> 2010-02-26 12:32:53 +0100  5) DEPENDS_virtclass-native =3D
> "python-native"
>=20
> The other thing is that further on in the .inc file I see:
> XPY_virtclass-native =3D " --with-python=3D${PYTHON_DIR}"
>=20
> This strongly suggests a hard dependency on python, so removing the
> DEPENDS "because it builds without it" does not seem to be a good plan
> to me.
>=20
> My strong feeling is that recipes should be self-contained (so should
> list all packages they need to build, minus the ones that are
> inherited from classes (and maybe a few implicit ones like maybe make)
>=20
> Frans
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2AbywACgkQN1Ujt2V2gBx84ACfUFEtOFuBm01bj5FiFf91O4dL
GxkAoLuK5ZiiEiCr/HmBmau1SJrhaJOx
=pCA9
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
