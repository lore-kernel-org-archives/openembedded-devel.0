Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4E5E56F8B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 22:19:04 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so1168115eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 15:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nmBmXZNYTSCGJZIVg7ISM6Qd4ubRNN+q/glSI6Tt7I0=;
	b=zNUeIusvRf9FDTeZB5UMsD4gVpLGDWV7XM52caOp6g/cn0ONXLHILpp1vSe3oKpuya
	fgT5IO93tQZkrqVX2q/DNP59xjHnmHCHQP2tl8vy/JyTE8sWncuMo3OXC4w3RNoTKq+X
	czssIsEIsub6LHgZ+FH9vIg42V6vV5faQ0TsEIA1CRp9FIUxquJF8UMxicLI+rP9LDpu
	rkXrug6SVHtpk7wH0s6KSX3m/98mBexQ5TdPqcbe3Fjsv58qU/aA0p2tj4zbIu1gkHPn
	JIOux/KIBFNXYmLbWsSQn14pHGPwO1PHPTWdW5DeCj/7LEABFwW6vF7YLwndw9RJ3xV2
	bUFA==
X-Received: by 10.15.34.136 with SMTP id e8mr111401eev.109.1395353944734;
	Thu, 20 Mar 2014 15:19:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id w6sm7228297eex.9.2014.03.20.15.19.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Mar 2014 15:19:03 -0700 (PDT)
Date: Thu, 20 Mar 2014 23:19:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140320221906.GH3726@jama>
References: <CAFeBWL4=C3dWdGNX2UgGUJGu1EGdpodocwJ5hbJLDWowa-OePw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL4=C3dWdGNX2UgGUJGu1EGdpodocwJ5hbJLDWowa-OePw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: libxfce4ui build fail on master branch
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
X-List-Received-Date: Thu, 20 Mar 2014 22:19:06 -0000
X-Groupsio-MsgNum: 48783
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fmEUq8M7S0s+Fl0V"
Content-Disposition: inline

--fmEUq8M7S0s+Fl0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2014 at 02:11:04PM -0700, Adam Lee wrote:
> Hello everyone, I am building my dora bsp layers with OE/poky master to
> prepare for 1.6 release.
> My console image built just fine, but I am getting this error while
> building xfce image.
>=20
> NOTE: Executing intltoolize --copy --force --automake
>=20
> NOTE: Executing ACLOCAL=3D"aclocal
> --system-acdir=3D/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-po=
ky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-cop=
y/"
> autoreconf --verbose --install --force --exclude=3Dautopoint
>=20
> autoreconf: Entering directory `.'
>=20
> autoreconf: configure.ac: not using Gettext
>=20
> autoreconf: running: aclocal
> --system-acdir=3D/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-po=
ky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-cop=
y/
> --force
>=20
> aclocal: error: couldn't open directory
> '/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi=
/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/':
> No such file or directory
>=20
> autoreconf: aclocal failed with exit status: 1
>=20
> ERROR: autoreconf execution failed.
>=20
> WARNING: exit code 1 from a shell command.
>=20
> ERROR: Function failed: do_configure (log file is located at
> /media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/=
libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/temp/log.do_configure.2388)
>=20
>=20
> This
> <https://github.com/gumstix/Gumstix-YoctoProject-Repo/blob/dev/default.xm=
l>is
> my manifest just in case.
>=20
> Thank you for your help!

See patches on ML from last week

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fmEUq8M7S0s+Fl0V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMraVoACgkQN1Ujt2V2gBzqrQCgkW20XnJc+QZFunwm6BDRPXdd
wYoAni+coq8T5LLm3/fnzB78uvz2pkMF
=ynbp
-----END PGP SIGNATURE-----

--fmEUq8M7S0s+Fl0V--
