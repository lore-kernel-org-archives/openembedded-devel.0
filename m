Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8ADA26FFCE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 21:50:59 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p65so44686690wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HUe9Zk4VV930WXOWDm3aGty4lVmZmeqqaOzuw0TqL4w=;
	b=RKlVCe0djiuCkApVZ8zckhJe1VsI6kJrgTME09FcM09FRYGFTPPtJXNlql7+AoXysX
	yiINM8RzJIUO2CTm9asZloGLmS2b+XSfuHhVVM5OZl9I57Hc6oy1jd/TFYK/EpvgMQ5V
	rODEtnL9U6Dw8g2LipcBboJz8JFMJY7a0VhRqPvYTDIScXQtJ+bmawa6OvuTN5XW724L
	qf1G+yZR5yuVZHvydqeRjGzjZRjMAniV6iiDRjgyTVDIthy3spakQcEegSA/iDEh3qA4
	TnZ+UBaxJ/siJmXY85zrOPtRhP/SvU5A+ZfL1/hMhSMS5TvpVld5U1y+R0iXZfLKoL+M
	Bekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HUe9Zk4VV930WXOWDm3aGty4lVmZmeqqaOzuw0TqL4w=;
	b=cWjXhauajtKlSXmfCDLPYab7qaoXgnD6ev2bOquJ2Zy2PMYT5X+TzC+O2uH0yuia5Y
	JSPrNYauZU9SXbql3sGEVKRM5un1uAL0jCB+nUSwdJG2vZ08XS7QhB/3QQ0m/H4/HQ8A
	eSCn45XMbLmNodra5nurRsMwtXcBK3TZpXNJw6ikYHFh4WhaDvJOdeXTwA6n0LyVx9Rx
	orcT5TGNLkWCACwZQi5urW+lSudz/7XISVGXV59EEuyWIiXhOsUJlqmTR0PspsHFEeTY
	Bxo7btdCjg8hTTW5szsn/LPwb3dxsGLnxNO+Tv2AFqZyRa0F1rb7JGUjacR8fmu/2A4u
	0goA==
X-Gm-Message-State: AD7BkJIWvwU7nlAOMtopa2wwSLaiCVzoCM/Z1doepvCxjoAyYJCTemyX+1Qs7sJA4vfc2g==
X-Received: by 10.28.48.136 with SMTP id w130mr39779691wmw.54.1458251459615;
	Thu, 17 Mar 2016 14:50:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ls5sm9442468wjb.33.2016.03.17.14.50.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 14:50:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 22:54:42 +0100
To: Pushpal Sidhu <psidhu@gateworks.com>
Message-ID: <20160317215442.GL2553@jama>
References: <1457543217-11211-1-git-send-email-akuster808@gmail.com>
	<20160309191156.GH2542@jama> <56E07715.8060801@gmail.com>
	<CAD1M062aSMPUfMzCKZ2+8uZcV0q77sm3WHwvQexY2x5uO9hV+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD1M062aSMPUfMzCKZ2+8uZcV0q77sm3WHwvQexY2x5uO9hV+g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][jethro][PATCH][V2] python-m2crypto: fix SSLv2 symbol issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2016 21:51:00 -0000
X-Groupsio-MsgNum: 60558
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VBq/nvTu32OVLBUP"
Content-Disposition: inline

--VBq/nvTu32OVLBUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 03:21:33PM -0700, Pushpal Sidhu wrote:
> Hi,
>=20
> On Wed, Mar 9, 2016 at 11:18 AM, akuster808 <akuster808@gmail.com> wrote:
> >
> >
> >
> > On 03/09/2016 11:11 AM, Martin Jansa wrote:
> > > On Wed, Mar 09, 2016 at 09:06:57AM -0800, Armin Kuster wrote:
> > >> From: Armin Kuster <akuster@mvista.com>
> > >>
> > >> missed using "-D"  for OPENSSL_NO_SSL2 swig_features.
> > >
> > > fido version:
> > > http://patchwork.openembedded.org/patch/117291/
> > > needed -D as well, right?
> >
> > yes.
> >
> >
> > >
> > > I've pushed both to fido-next and jethro-next
>=20
> When will this be merged into fido/jethro? I've been running into this
> build breakage for about a week now and if I patch it myself, I'll
> only run into a conflict again later, causing more build issues.

I'm still seeing multiple issues caused by last openssl upgrade, e.g.
ruby, pywbem, crda

Are they all supposed to be fixed by this?

> > thanks
> > -armin
> > >
> > >>
> > >> ERROR: Failed to import the "M2Crypto" module: .../usr/lib/python2.7=
/site-packages/M2Crypto/__m2crypto.so: undefined symbol: SSLv2_method
> > >>
> > >> disable using SSLv2_method if not supported in openssl. This is now =
the case
> > >> with the advent of CVE-2016-0800
> > >>
> > >> Signed-off-by: Armin Kuster <akuster@mvista.com>
> > >> ---
> > >>  ...y_build_with_SSLv2_when_it_is_not_available.patch | 20 +++++++++=
+++++++++++
> > >>  .../python/python-m2crypto_0.21.1.bb                 |  4 +++-
> > >>  2 files changed, 23 insertions(+), 1 deletion(-)
> > >>  create mode 100644 meta-python/recipes-devtools/python/python-m2cry=
pto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
> > >>
> > >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/don=
t_try_build_with_SSLv2_when_it_is_not_available.patch b/meta-python/recipes=
-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_a=
vailable.patch
> > >> new file mode 100644
> > >> index 0000000..526c23f
> > >> --- /dev/null
> > >> +++ b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_b=
uild_with_SSLv2_when_it_is_not_available.patch
> > >> @@ -0,0 +1,20 @@
> > >> +Upstream-Status: Backport
> > >> +https://gitlab.com/m2crypto/m2crypto/commit/ac01b38302474920288c1a9=
eb63fd35fa8d1db5b
> > >> +
> > >> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> > >> +
> > >> +Index: M2Crypto-0.21.1/SWIG/_ssl.i
> > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >> +--- M2Crypto-0.21.1.orig/SWIG/_ssl.i
> > >> ++++ M2Crypto-0.21.1/SWIG/_ssl.i
> > >> +@@ -48,8 +48,10 @@ extern const char *SSL_alert_desc_string
> > >> + %rename(ssl_get_alert_desc_v) SSL_alert_desc_string_long;
> > >> + extern const char *SSL_alert_desc_string_long(int);
> > >> +
> > >> ++#ifndef OPENSSL_NO_SSL2
> > >> + %rename(sslv2_method) SSLv2_method;
> > >> + extern SSL_METHOD *SSLv2_method(void);
> > >> ++#endif
> > >> + %rename(sslv3_method) SSLv3_method;
> > >> + extern SSL_METHOD *SSLv3_method(void);
> > >> + %rename(sslv23_method) SSLv23_method;
> > >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.2=
1.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> > >> index ff6203f..9daea5e 100644
> > >> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> > >> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> > >> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db0e1f0b7d=
0ce8a62c18b1287b991800e"
> > >>
> > >>  SRC_URI =3D "http://pypi.python.org/packages/source/M/M2Crypto/M2Cr=
ypto-${PV}.tar.gz \
> > >>             file://0001-setup.py-link-in-sysroot-not-in-host-directo=
ries.patch \
> > >> -           file://0001-M2Crypto-Error-fix.patch"
> > >> +           file://0001-M2Crypto-Error-fix.patch \
> > >> +           file://dont_try_build_with_SSLv2_when_it_is_not_availabl=
e.patch"
> > >>
> > >>  SRC_URI[md5sum] =3D "f93d8462ff7646397a9f77a2fe602d17"
> > >>  SRC_URI[sha256sum] =3D "25b94498505c2d800ee465db0cc1aff097b1615adc3=
ac042a1c85ceca264fc0a"
> > >> @@ -19,6 +20,7 @@ inherit setuptools
> > >>
> > >>  SWIG_FEATURES_x86-64 =3D "-D__x86_64__"
> > >>  SWIG_FEATURES ?=3D ""
> > >> +SWIG_FEATURES +=3D "-DOPENSSL_NO_SSL2"
> > >>  export SWIG_FEATURES
> > >>
> > >>  # Get around a problem with swig, but only if the
> > >> --
> > >> 2.3.5
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VBq/nvTu32OVLBUP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbrJ50ACgkQN1Ujt2V2gBwxBQCfYoTi5dr0vw7UfUCdgzKcvj7U
1nYAni9j7sRablHnmY1ODsx+Yi+g+SVg
=B/+W
-----END PGP SIGNATURE-----

--VBq/nvTu32OVLBUP--
