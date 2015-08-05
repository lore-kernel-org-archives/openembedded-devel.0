Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9092C60089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 12:36:48 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so22121353wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RLyVI9h3WLGh/eI79HEBgtevvf5LMjdJQN+giaAnDzA=;
	b=jojKt9oMnCYFd54OOm9ksW4w40XSY0sKgGtE+9mCc7WTgwAm/OMog/QlT84K3FD5bO
	VaZM8LkgSaPdNTrBT29EUd+57AWVOITS++kSh7N79oXo1eC8ukTljrLdC4qhHwq/epkV
	FSjgrKxrW4jfbj9LLFeqVYOO19W3lxvphm8XezcZjqvpglbqPDtlx5fguwLP0LK5S+og
	upzLzIDXLPnkh0L6J1VA/OYz2P3BBn6MGbgLhlkOBvEr1uuCDBlx4INNgSRYh0A+6u0i
	CyZfU5U+mWdG0Dd8dXgKisFhQwqo8Kj5GocfmvEqOyqWx8CemtcHIRRNo9Caks4nOwBc
	/iBw==
X-Received: by 10.194.221.4 with SMTP id qa4mr20061593wjc.145.1438778208722;
	Wed, 05 Aug 2015 05:36:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i6sm3931245wje.33.2015.08.05.05.36.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Aug 2015 05:36:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Aug 2015 14:37:04 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150805123704.GA2452@jama>
References: <1429280204-27191-3-git-send-email-Martin.Jansa@gmail.com>
	<1438628438-9452-1-git-send-email-Martin.Jansa@gmail.com>
	<1438628438-9452-2-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1sqPdo2ByELw+pCkVPGtYHRXVJAWEo8d3tONXtKcyJmu3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqPdo2ByELw+pCkVPGtYHRXVJAWEo8d3tONXtKcyJmu3g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 2/2] qt5-plugin-generic-vboxtouch: add -Wno-narrowing to fix build with gcc-5.2
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
X-List-Received-Date: Wed, 05 Aug 2015 12:36:52 -0000
X-Groupsio-MsgNum: 56546
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2015 at 04:05:26PM -0700, Khem Raj wrote:
> On Mon, Aug 3, 2015 at 12:00 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb b/recip=
es-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
> > index 5352d15..2676bdd 100644
> > --- a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
> > +++ b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
> > @@ -9,12 +9,15 @@ LIC_FILES_CHKSUM =3D " \
> >      file://evdevmousehandler.cpp;beginline=3D1;endline=3D40;md5=3D9081=
062f6e7f74b6e62ad7ecee4a71be \
> >  "
> >
> > -PV =3D "1.0+gitr${SRCPV}"
> > +PV =3D "1.1.3+gitr${SRCPV}"
> >
> >  DEPENDS =3D "qtbase"
> >
> > +# Needed with gcc-5.2 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D6=
5801
>=20
> this comment it wrong. It should have said needed with gcc5 < 5.2
>=20
> > +CXXFLAGS +=3D "-Wno-narrowing"
>=20
> we now have 5.2 in OE-Core and its fixed in 5.2, Can you try to remove it=
 ?

I wrote this change, because it was failing with gcc-5.2 (I don't
remember if it was failing with 5.1 as well).

>=20
> > +
> >  SRC_URI =3D "git://github.com/nemomobile/qt5-plugin-generic-vboxtouch.=
git"
> > -SRCREV =3D "7d7a6dfd501c43687e7bb110610cac5f7c9abd4b"
> > +SRCREV =3D "d613ad1cc64d7a6a9b38df4d49146170be6876aa"
> >  S =3D "${WORKDIR}/git/vboxtouch"
> >
> >  inherit qmake5
> > --
> > 2.5.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXCAz4ACgkQN1Ujt2V2gBzgFgCgoAtvpeUiOFwVuWrJs2BFZkN+
a8wAn2AXd7V8ZgzIObdostrIApHjrzbU
=oFqt
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
