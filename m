Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id F3B02706A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:51:53 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so9277250wes.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 08:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Opp+8mEd4D1kBrTgHYdWnfgAf5TsMC2w/cyTAFVHBhk=;
	b=iIa8tFtZSJp767uV9jsxVGGxJWWftEylkVwrD7zwY8caEyObbR2DHN5pee3eZHxQcO
	suUyqVPhvJWBcgnkmnNK9skJbiG6VdnivO547qi3cjDiz1hwbM3JQfKG7l/WOJhj0BSB
	pC/LX3rWNYqfYWB4E8D+qsmmMkQbTd3y65hTgLo/P63zfnnTOgDLIHRTp5EncmYeQXG8
	uumbaReAXdTSP5kzip0pyfb3anxXaDopVbOheSLELmA7SQyNhBwCDmSwUGATrKqGQfTk
	uetD87iZQ7l6Hr1ckAIIizy2lB1FwZg1OqR+tGI1fhMkytP1yeFsHbnOweRk+cj1WVpm
	Fq/g==
X-Received: by 10.180.109.161 with SMTP id ht1mr7857901wib.67.1406044312315;
	Tue, 22 Jul 2014 08:51:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex4sm55219017wic.2.2014.07.22.08.51.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 08:51:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Jul 2014 17:52:07 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140722155207.GU22875@jama>
References: <1406028895-834-1-git-send-email-Martin.Jansa@gmail.com>
	<1406028895-834-2-git-send-email-Martin.Jansa@gmail.com>
	<CANx9H-B-XpPeLtcT0fGzNSNOn-gREp5MVQh7Su-kMpxBAsMt6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-B-XpPeLtcT0fGzNSNOn-gREp5MVQh7Su-kMpxBAsMt6g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 2/2] meta-python: rename recipes-python to recipes-devtools
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
X-List-Received-Date: Tue, 22 Jul 2014 15:51:55 -0000
X-Groupsio-MsgNum: 51184
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w+MAdceOglSEzbpc"
Content-Disposition: inline

--w+MAdceOglSEzbpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2014 at 08:33:00AM -0700, Tim Orling wrote:
> I'd rather not keep the original structure, part of my motivation for
> creating the layer was to not hide python recipes three directories deep.
> The structure of the meta-perl layer seems more natural to me.

meta-perl has also three directories deep structure, just with each
recipe in separate directory.

> However, I realize and regret that the layer.conf in my original patch was
> broken and I need to fix it. Please see v2 for meta-python creation.

It was already merged in master.

> On Tue, Jul 22, 2014 at 4:34 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > * match old structure from meta-oe
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-python/{recipes-python =3D> recipes-devtools}/python/pyrtm_0.2.bb
> >  | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-autobahn_0.8.=
6.bb
> >  | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-cheetah_2.4.4=
=2Ebb
> >   | 0
> >  .../python/python-cloudeebus_0.6.0.bb
> >   | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-cython_0.20.2=
=2Ebb
> >   | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-dateutil_1.5.=
bb
> >  | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-epydoc_3.0.1.=
bb
> >  | 0
> >  .../python/python-feedparser_5.1.3.bb
> >   | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-gdata_1.2.4.bb
> >   | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-gevent_0.13.8=
=2Ebb
> >   | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-greenlet_0.4.=
1.bb
> >  | 0
> >  .../python/python-ldap/setup.cfg.patch
> >  | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-ldap_2.3.9.bb
> >  | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-lxml_3.0.2.bb
> >  | 0
> >  .../0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> > | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-m2crypto_0.21=
=2E1.bb
> > | 0
> >  .../python/python-matplotlib/fix_setup.patch
> >  | 0
> >  .../python/python-matplotlib/fix_setupext.patch
> > | 0
> >  .../python/python-matplotlib_1.1.0.bb
> >   | 0
> >  .../python/python-numeric/no-lapack.patch
> > | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-numeric_24.2.=
bb
> >  | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-pexpect_2.3.bb
> >   | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-pip_1.3.1.bb
> >   | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-psutil_0.6.1.=
bb
> >  | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-pyalsaaudio_0=
=2E4.bb
> > | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-pyserial_2.4.=
bb
> >  | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-pyudev_0.16.1=
=2Ebb
> >   | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-pyusb_1.0.0a2=
=2Ebb
> >   | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-pyyaml/setup.=
py
> >  | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-pyyaml_3.10.bb
> >   | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-smbus_3.0.3.bb
> >   | 0
> >  .../python/python-sqlalchemy_0.7.9.bb
> >   | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-twisted_13.2.=
0.bb
> >  | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-vobject_0.8.1=
c.bb
> >  | 0
> >  .../{recipes-python =3D> recipes-devtools}/python/python-webdav_0.1.2.=
bb
> >  | 0
> >  .../python/python-zopeinterface_4.1.1.bb
> >  | 0
> >  36 files changed, 0 insertions(+), 0 deletions(-)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > pyrtm_0.2.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-autobahn_0.8.6.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-cheetah_2.4.4.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-cloudeebus_0.6.0.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-cython_0.20.2.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-dateutil_1.5.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-epydoc_3.0.1.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-feedparser_5.1.3.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-gdata_1.2.4.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-gevent_0.13.8.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-greenlet_0.4.1.bb (100%)
> >  rename meta-python/{recipes-python =3D>
> > recipes-devtools}/python/python-ldap/setup.cfg.patch (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-ldap_2.3.9.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-lxml_3.0.2.bb (100%)
> >  rename meta-python/{recipes-python =3D>
> > recipes-devtools}/python/python-m2crypto/0001-setup.py-link-in-sysroot-=
not-in-host-directories.patch
> > (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-m2crypto_0.21.1.bb (100%)
> >  rename meta-python/{recipes-python =3D>
> > recipes-devtools}/python/python-matplotlib/fix_setup.patch (100%)
> >  rename meta-python/{recipes-python =3D>
> > recipes-devtools}/python/python-matplotlib/fix_setupext.patch (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-matplotlib_1.1.0.bb (100%)
> >  rename meta-python/{recipes-python =3D>
> > recipes-devtools}/python/python-numeric/no-lapack.patch (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-numeric_24.2.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-pexpect_2.3.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-pip_1.3.1.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-psutil_0.6.1.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-pyalsaaudio_0.4.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-pyserial_2.4.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-pyudev_0.16.1.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-pyusb_1.0.0a2.bb (100%)
> >  rename meta-python/{recipes-python =3D>
> > recipes-devtools}/python/python-pyyaml/setup.py (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-pyyaml_3.10.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-smbus_3.0.3.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-sqlalchemy_0.7.9.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-twisted_13.2.0.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-vobject_0.8.1c.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-webdav_0.1.2.bb (100%)
> >  rename meta-python/{recipes-python =3D> recipes-devtools}/python/
> > python-zopeinterface_4.1.1.bb (100%)
> >
> > diff --git a/meta-python/recipes-python/python/pyrtm_0.2.bb
> > b/meta-python/recipes-devtools/python/pyrtm_0.2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/pyrtm_0.2.bb
> > rename to meta-python/recipes-devtools/python/pyrtm_0.2.bb
> > diff --git a/meta-python/recipes-python/python/python-autobahn_0.8.6.bb
> > b/meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-autobahn_0.8.6.bb
> > rename to meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
> > diff --git a/meta-python/recipes-python/python/python-cheetah_2.4.4.bb
> > b/meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-cheetah_2.4.4.bb
> > rename to meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
> > diff --git a/meta-python/recipes-python/python/python-cloudeebus_0.6.0.=
bb
> > b/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-cloudeebus_0.6.0.bb
> > rename to meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
> > diff --git a/meta-python/recipes-python/python/python-cython_0.20.2.bb
> > b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-cython_0.20.2.bb
> > rename to meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> > diff --git a/meta-python/recipes-python/python/python-dateutil_1.5.bb
> > b/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-dateutil_1.5.bb
> > rename to meta-python/recipes-devtools/python/python-dateutil_1.5.bb
> > diff --git a/meta-python/recipes-python/python/python-epydoc_3.0.1.bb
> > b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-epydoc_3.0.1.bb
> > rename to meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
> > diff --git a/meta-python/recipes-python/python/python-feedparser_5.1.3.=
bb
> > b/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-feedparser_5.1.3.bb
> > rename to meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
> > diff --git a/meta-python/recipes-python/python/python-gdata_1.2.4.bb
> > b/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-gdata_1.2.4.bb
> > rename to meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
> > diff --git a/meta-python/recipes-python/python/python-gevent_0.13.8.bb
> > b/meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-gevent_0.13.8.bb
> > rename to meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
> > diff --git a/meta-python/recipes-python/python/python-greenlet_0.4.1.bb
> > b/meta-python/recipes-devtools/python/python-greenlet_0.4.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-greenlet_0.4.1.bb
> > rename to meta-python/recipes-devtools/python/python-greenlet_0.4.1.bb
> > diff --git a/meta-python/recipes-python/python/python-ldap/setup.cfg.pa=
tch
> > b/meta-python/recipes-devtools/python/python-ldap/setup.cfg.patch
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-ldap/setup.cfg.pat=
ch
> > rename to meta-python/recipes-devtools/python/python-ldap/setup.cfg.pat=
ch
> > diff --git a/meta-python/recipes-python/python/python-ldap_2.3.9.bb
> > b/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-ldap_2.3.9.bb
> > rename to meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
> > diff --git a/meta-python/recipes-python/python/python-lxml_3.0.2.bb
> > b/meta-python/recipes-devtools/python/python-lxml_3.0.2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-lxml_3.0.2.bb
> > rename to meta-python/recipes-devtools/python/python-lxml_3.0.2.bb
> > diff --git
> > a/meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-=
in-sysroot-not-in-host-directories.patch
> > b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-lin=
k-in-sysroot-not-in-host-directories.patch
> > similarity index 100%
> > rename from
> > meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-in=
-sysroot-not-in-host-directories.patch
> > rename to
> > meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-=
in-sysroot-not-in-host-directories.patch
> > diff --git a/meta-python/recipes-python/python/python-m2crypto_0.21.1.bb
> > b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-m2crypto_0.21.1.bb
> > rename to meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> > diff --git
> > a/meta-python/recipes-python/python/python-matplotlib/fix_setup.patch
> > b/meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch
> > similarity index 100%
> > rename from
> > meta-python/recipes-python/python/python-matplotlib/fix_setup.patch
> > rename to
> > meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch
> > diff --git
> > a/meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch
> > b/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.pa=
tch
> > similarity index 100%
> > rename from
> > meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch
> > rename to
> > meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
> > diff --git a/meta-python/recipes-python/python/python-matplotlib_1.1.0.=
bb
> > b/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-matplotlib_1.1.0.bb
> > rename to meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
> > diff --git
> > a/meta-python/recipes-python/python/python-numeric/no-lapack.patch
> > b/meta-python/recipes-devtools/python/python-numeric/no-lapack.patch
> > similarity index 100%
> > rename from
> > meta-python/recipes-python/python/python-numeric/no-lapack.patch
> > rename to
> > meta-python/recipes-devtools/python/python-numeric/no-lapack.patch
> > diff --git a/meta-python/recipes-python/python/python-numeric_24.2.bb
> > b/meta-python/recipes-devtools/python/python-numeric_24.2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-numeric_24.2.bb
> > rename to meta-python/recipes-devtools/python/python-numeric_24.2.bb
> > diff --git a/meta-python/recipes-python/python/python-pexpect_2.3.bb
> > b/meta-python/recipes-devtools/python/python-pexpect_2.3.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pexpect_2.3.bb
> > rename to meta-python/recipes-devtools/python/python-pexpect_2.3.bb
> > diff --git a/meta-python/recipes-python/python/python-pip_1.3.1.bb
> > b/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pip_1.3.1.bb
> > rename to meta-python/recipes-devtools/python/python-pip_1.3.1.bb
> > diff --git a/meta-python/recipes-python/python/python-psutil_0.6.1.bb
> > b/meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-psutil_0.6.1.bb
> > rename to meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
> > diff --git a/meta-python/recipes-python/python/python-pyalsaaudio_0.4.bb
> > b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.4.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyalsaaudio_0.4.bb
> > rename to meta-python/recipes-devtools/python/python-pyalsaaudio_0.4.bb
> > diff --git a/meta-python/recipes-python/python/python-pyserial_2.4.bb
> > b/meta-python/recipes-devtools/python/python-pyserial_2.4.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyserial_2.4.bb
> > rename to meta-python/recipes-devtools/python/python-pyserial_2.4.bb
> > diff --git a/meta-python/recipes-python/python/python-pyudev_0.16.1.bb
> > b/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyudev_0.16.1.bb
> > rename to meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
> > diff --git a/meta-python/recipes-python/python/python-pyusb_1.0.0a2.bb
> > b/meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyusb_1.0.0a2.bb
> > rename to meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb
> > diff --git a/meta-python/recipes-python/python/python-pyyaml/setup.py
> > b/meta-python/recipes-devtools/python/python-pyyaml/setup.py
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyyaml/setup.py
> > rename to meta-python/recipes-devtools/python/python-pyyaml/setup.py
> > diff --git a/meta-python/recipes-python/python/python-pyyaml_3.10.bb
> > b/meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyyaml_3.10.bb
> > rename to meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
> > diff --git a/meta-python/recipes-python/python/python-smbus_3.0.3.bb
> > b/meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-smbus_3.0.3.bb
> > rename to meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
> > diff --git a/meta-python/recipes-python/python/python-sqlalchemy_0.7.9.=
bb
> > b/meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-sqlalchemy_0.7.9.bb
> > rename to meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
> > diff --git a/meta-python/recipes-python/python/python-twisted_13.2.0.bb
> > b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-twisted_13.2.0.bb
> > rename to meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
> > diff --git a/meta-python/recipes-python/python/python-vobject_0.8.1c.bb
> > b/meta-python/recipes-devtools/python/python-vobject_0.8.1c.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-vobject_0.8.1c.bb
> > rename to meta-python/recipes-devtools/python/python-vobject_0.8.1c.bb
> > diff --git a/meta-python/recipes-python/python/python-webdav_0.1.2.bb
> > b/meta-python/recipes-devtools/python/python-webdav_0.1.2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-webdav_0.1.2.bb
> > rename to meta-python/recipes-devtools/python/python-webdav_0.1.2.bb
> > diff --git a/meta-python/recipes-python/python/
> > python-zopeinterface_4.1.1.bb b/meta-python/recipes-devtools/python/
> > python-zopeinterface_4.1.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/
> > python-zopeinterface_4.1.1.bb
> > rename to meta-python/recipes-devtools/python/
> > python-zopeinterface_4.1.1.bb
> > --
> > 2.0.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w+MAdceOglSEzbpc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPOiKcACgkQN1Ujt2V2gBySbgCgj+xS7sj8edCwz7mJTNkt0QEw
2goAnjuL2pAE6DgOcINeranHcSZwFhqk
=ZVLq
-----END PGP SIGNATURE-----

--w+MAdceOglSEzbpc--
