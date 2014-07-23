Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBF2701DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 08:00:02 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so751703wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=I3k7f3UE9eLC3Izm9SU/1Ix5/EJzLYLfc4LmsdSPSE4=;
	b=LptD8mSTc2n4YvaOYC2w4Ky3+6/DT8OOgzwB58JNSFz2sU5LGI9cPuoVXlOwEMMSQq
	7FANPYsmzP7P7ArOwt3H3RQXtmWU5H59ivYIdamzy8DCGgcWSnIJq8ImSvSEgSRMNVYe
	rEhdQDFpwLhpmODgRd3iIWZmwd9v0vu6D7IJQQa4P+s1ehQkbKlY9E0F/PXkuMxg5D9m
	OeGXtqNF4GBDPVCRPhYzhGW8nT7P7ub9Ufvn0/gqgAuPWzAt1ggj1nDQiESrtyLyY445
	tAA1Y5DQfkqV8CY6ZjVuAUUgql2uPsxOaGhxJ7GLjgraCBZcv/HR7A26EBkWkY+TnPbj
	zxbA==
X-Received: by 10.180.210.239 with SMTP id mx15mr465207wic.65.1406102403552;
	Wed, 23 Jul 2014 01:00:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gi15sm4028792wjc.20.2014.07.23.01.00.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 01:00:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Jul 2014 10:00:19 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140723080019.GZ22875@jama>
References: <cover.1405465524.git.TicoTimo@gmail.com>
	<20140722190116.GY22875@jama>
	<CAOLEWZVAwu4nRBUuSsES-qPqY5T7YubtwTeB=uxssqgy5JA+Yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOLEWZVAwu4nRBUuSsES-qPqY5T7YubtwTeB=uxssqgy5JA+Yg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 0/2] meta-python creation
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
X-List-Received-Date: Wed, 23 Jul 2014 08:00:04 -0000
X-Groupsio-MsgNum: 51197
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JGq01gMRpXZxBGpH"
Content-Disposition: inline

--JGq01gMRpXZxBGpH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2014 at 06:03:14PM -0700, Stephen Arnold wrote:
> And when you say "depend" in that context, you mean add it to your local
> bblayers, right?

If you're using meta-networking already then yes.

I meant "depend" section in README file so that people are aware of this
dependency.

> Just checking...
>=20
> Steve
>=20
>=20
> On Tue, Jul 22, 2014 at 12:01 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Tue, Jul 15, 2014 at 04:32:32PM -0700, Tim Orling wrote:
> > > ********
> > > This layer is intended to be the home of python modules for OpenEmbed=
ded.
> > > Modules in this layer need to be independent of openembedded-core and
> > > meta-openembedded/meta-oe. Because of this, modules required by 'gate=
one'
> > > and 'anki' are not included and remain in:
> > >         meta-openembedded/meta-oe/recipes-devtools/python.
> >
> > meta-networking/README should be updated to depend on meta-python
> >
> > ERROR: Nothing PROVIDES 'python-m2crypto-native' (but
> > meta-oe/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb DEPENDS
> > on or otherwise requires it).
> >
> > >
> > > Maintainers:
> > >         Tim "moto-timo" Orling <TicoTimo@gmail.com>
> > >         Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
> > > ********
> > >
> > > The following changes since commit
> > 239debcd8a0359aad64406476b801948f9b8ff14:
> > >
> > >   usleep: add 1.0 recipe (2014-07-15 15:03:43 +0200)
> > >
> > > are available in the git repository at:
> > >
> > >   git://git.openembedded.org/meta-openembedded-contrib timo/meta-pyth=
on
> > >
> > http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dtimo/meta-python
> > >
> > > Tim Orling (2):
> > >   meta-python: create layer
> > >   meta-python: move recipes from meta-oe
> > >
> > >  meta-python/COPYING.MIT                            | 17 +++++++
> > >  meta-python/README                                 | 53
> > ++++++++++++++++++++++
> > >  meta-python/conf/layer.conf                        |  9 ++++
> > >  .../recipes-python}/pyrtm_0.2.bb                   |  0
> > >  .../recipes-python}/python-autobahn_0.8.6.bb       |  0
> > >  .../recipes-python}/python-cheetah_2.4.4.bb        |  0
> > >  .../recipes-python}/python-cloudeebus_0.6.0.bb     |  0
> > >  .../recipes-python}/python-cython_0.20.2.bb        |  0
> > >  .../recipes-python}/python-dateutil_1.5.bb         |  0
> > >  .../recipes-python}/python-epydoc_3.0.1.bb         |  0
> > >  .../recipes-python}/python-feedparser_5.1.3.bb     |  0
> > >  .../recipes-python}/python-gdata_1.2.4.bb          |  0
> > >  .../recipes-python}/python-gevent_0.13.8.bb        |  0
> > >  .../recipes-python}/python-greenlet_0.4.1.bb       |  0
> > >  .../recipes-python}/python-ldap/setup.cfg.patch    |  0
> > >  .../recipes-python}/python-ldap_2.3.9.bb           |  0
> > >  .../recipes-python}/python-lxml_3.0.2.bb           |  0
> > >  ...y-link-in-sysroot-not-in-host-directories.patch |  0
> > >  .../recipes-python}/python-m2crypto_0.21.1.bb      |  0
> > >  .../python-matplotlib/fix_setup.patch              |  0
> > >  .../python-matplotlib/fix_setupext.patch           |  0
> > >  .../recipes-python}/python-matplotlib_1.1.0.bb     |  0
> > >  .../recipes-python}/python-numeric/no-lapack.patch |  0
> > >  .../recipes-python}/python-numeric_24.2.bb         |  0
> > >  .../recipes-python}/python-pexpect_2.3.bb          |  0
> > >  .../recipes-python}/python-pip_1.3.1.bb            |  0
> > >  .../recipes-python}/python-psutil_0.6.1.bb         |  0
> > >  .../recipes-python}/python-pyalsaaudio_0.4.bb      |  0
> > >  .../recipes-python}/python-pyserial_2.4.bb         |  0
> > >  .../recipes-python}/python-pyudev_0.16.1.bb        |  0
> > >  .../recipes-python}/python-pyusb_1.0.0a2.bb        |  0
> > >  .../recipes-python}/python-pyyaml/setup.py         |  0
> > >  .../recipes-python}/python-pyyaml_3.10.bb          |  0
> > >  .../recipes-python}/python-smbus_3.0.3.bb          |  0
> > >  .../recipes-python}/python-sqlalchemy_0.7.9.bb     |  0
> > >  .../recipes-python}/python-twisted_13.2.0.bb       |  0
> > >  .../recipes-python}/python-vobject_0.8.1c.bb       |  0
> > >  .../recipes-python}/python-webdav_0.1.2.bb         |  0
> > >  .../recipes-python}/python-zopeinterface_4.1.1.bb  |  0
> > >  39 files changed, 79 insertions(+)
> > >  create mode 100644 meta-python/COPYING.MIT
> > >  create mode 100644 meta-python/README
> > >  create mode 100644 meta-python/conf/layer.conf
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > pyrtm_0.2.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-autobahn_0.8.6.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-cheetah_2.4.4.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-cloudeebus_0.6.0.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-cython_0.20.2.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-dateutil_1.5.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-epydoc_3.0.1.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-feedparser_5.1.3.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-gdata_1.2.4.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-gevent_0.13.8.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-greenlet_0.4.1.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D>
> > meta-python/recipes-python}/python-ldap/setup.cfg.patch (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-ldap_2.3.9.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-lxml_3.0.2.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D>
> > meta-python/recipes-python}/python-m2crypto/0001-setup.py-link-in-sysro=
ot-not-in-host-directories.patch
> > (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-m2crypto_0.21.1.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D>
> > meta-python/recipes-python}/python-matplotlib/fix_setup.patch (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D>
> > meta-python/recipes-python}/python-matplotlib/fix_setupext.patch (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-matplotlib_1.1.0.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D>
> > meta-python/recipes-python}/python-numeric/no-lapack.patch (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-numeric_24.2.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-pexpect_2.3.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-pip_1.3.1.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-psutil_0.6.1.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-pyalsaaudio_0.4.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-pyserial_2.4.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-pyudev_0.16.1.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-pyusb_1.0.0a2.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D>
> > meta-python/recipes-python}/python-pyyaml/setup.py (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-pyyaml_3.10.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-smbus_3.0.3.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-sqlalchemy_0.7.9.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-twisted_13.2.0.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-vobject_0.8.1c.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-webdav_0.1.2.bb (100%)
> > >  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-pyt=
hon}/
> > python-zopeinterface_4.1.1.bb (100%)
> > >
> > > --
> > > 1.9.3
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JGq01gMRpXZxBGpH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPPa5MACgkQN1Ujt2V2gByi1wCfQOjxzO7gjsOp0NcOcZvwA3nr
4IoAnjoZjsimQxboiBxXx6zk1T+NRHVE
=7oOX
-----END PGP SIGNATURE-----

--JGq01gMRpXZxBGpH--
