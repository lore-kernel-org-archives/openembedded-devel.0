Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 383DB6CC78
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 17:39:28 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so1972359eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 10:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=doqE7nbAMmStcvJn2uvrQ1TGTg6tHlPBUCoSJPfO25Y=;
	b=i7AqxfiX9RfpwUVboyGGmFiiiToLLQ3qyA7ZDr0tRMiWfrTX//HYT5VR3oG41aYkXl
	t8roTVife9c/Cy4ByeJVfkWIyuXVHy2ZZgRL2m4ID5GQ5sej19Vb5HZlShh19YHgSUhD
	6loxaxOXZpzpPCV/gwgSv/QaG/rRXP4P/WAFj6zqbFvmofTJkw62UInZ/Fiixq7FCT+e
	IuE1bihHa6LNkNvLkPzSQ24Eg/TjBn3+PQ/EYPsBQ8ENT6B7zYjQJp5qNKEntkJxEwqD
	Ah3RspV7qWdESGurayUTey/S0crIymKSe0MpsH4QXAl/iihXf88ZwQ8B4G2yv3yZRUgv
	LDIw==
X-Received: by 10.15.48.197 with SMTP id h45mr23535162eew.0.1380908368917;
	Fri, 04 Oct 2013 10:39:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm30337734eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 10:39:27 -0700 (PDT)
Date: Fri, 4 Oct 2013 19:39:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20131004173934.GL6240@jama>
References: <CALmOhgkzmnVuviF+cAzELRpdZomHDzpHn5-1dZEwa_xznG8JiQ@mail.gmail.com>
	<20131004141433.GG6240@jama>
	<CALmOhgnnSusbb0OPO32TN9C8xQRmqMmW+ZDoEq7d2870JoQfRw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALmOhgnnSusbb0OPO32TN9C8xQRmqMmW+ZDoEq7d2870JoQfRw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Abhijit Potnis <abhijit_potnis@mentor.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: meta-qt5, master, qtwebkit-examples build failure
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
X-List-Received-Date: Fri, 04 Oct 2013 17:39:29 -0000
X-Groupsio-MsgNum: 46451
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DXIF1lRUlMsbZ3S1"
Content-Disposition: inline

--DXIF1lRUlMsbZ3S1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2013 at 12:50:17PM -0400, Trevor Woerner wrote:
> Thanks Martin,
>=20
> On 4 October 2013 10:14, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Just lucky guess, do you have ICU enabled in qtbase?
>=20
> That was a good guess!
>=20
> It appears there's very important rule to know when using meta-qt5's
> master branch (i.e. 5.1.0):
> - if all you need is qtbase then ICU is not required and therefore not
> enabled (to save space)
> - if you need anything on top of qtbase then ICU must be enabled in
> qtbase's configuration
>=20
> Do you think this would be a good thing to include in this layer's
> README (or is it somewhere I should have looked)?

There are few comments in qtbase.inc where people should look when they
are changing PACKAGECONFIG, but you're right that it isn't the place
where most people will look when they get misleading error like this
one.

# separate some parts of PACKAGECONFIG which are often changed
# be aware that you need to add icu to build qtwebkit, default
# PACKAGECONFIG is kept rather minimal for people who don't need
# stuff like webkit (and it's easier to add options than remove)

# gl or gles needs to be enabled in order to build qtdeclarative
# http://qt.gitorious.org/qt/qtdeclarative/commit/e988998a08b1420ed10bd02d9=
d4b3b8ed2289df9
PACKAGECONFIG_GL ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl',
'', d)}"

# accessibility is required to compile qtquickcontrols
PACKAGECONFIG[accessibility] =3D "-accessibility,-no-accessibility"

# gl or gles2 is needed in order to build qtdeclarative
# (qtdeclarative.do_configure fails to find quick module without)
PACKAGECONFIG[gl] =3D "-opengl desktop -no-eglfs,,virtual/libgl"

# depends on glib
PACKAGECONFIG[gstreamer] =3D "-gstreamer,-no-gstreamer,gstreamer"

# needed for qtdeclarative (qtdeclarative.do_configure fails to find
# quick module without)
PACKAGECONFIG[icu] =3D "-icu,-no-icu,${ICU}"

I'm thinking about using bb.warn when building qtbase without one of
them disabled, but again most people won't check qtbase build log when
they see "no such module qtwebkit" error.

I'll add at least some note to README file.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DXIF1lRUlMsbZ3S1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJO/VYACgkQN1Ujt2V2gBxIMgCgkaqYrDS4aYYufS8tvsDXMhAB
UZUAnjW77l//9bYPZW3O5NunUII7eeUd
=YIQy
-----END PGP SIGNATURE-----

--DXIF1lRUlMsbZ3S1--
