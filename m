Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E460B65F2A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 08:11:41 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so780961wgg.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xzWf/6bLHszOkZvrR6+bR5TW2wsAIRcCTdO6j00BRZw=;
	b=Rp/RfPc4A3VN0JicSTEr5jy9Od3mG9gwTFnzcyOWzVnWX/O3xZGoNG3FJbqWaLOvxV
	tPlRcOaQaj340nPH8FPjjqZg/UyBpStEm+hnbWmycy7lzMapd+Gnw61CvS7chIbCUp4N
	Uv81tsoZ9zsKeewx6LOD1doSyNx5vT1k5oWpVB4zoGdXF8c9MxsmZhERUnIwPH1fR0xf
	/32TBi5Xend20VI5GqmsSNqHDsW0QmjRgBn7uR3IcN3LzCLY1ex0t7uhA5rdRZoXX7I7
	qw3OiiMCZyLn0e0G3BnfWHLWsOLHJ9pU/6chgA0XjfafmhhN1AugHOOuVUcKdgiZFIV1
	ScHA==
X-Received: by 10.180.85.101 with SMTP id g5mr4424638wiz.51.1406707902662;
	Wed, 30 Jul 2014 01:11:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ey16sm52660802wid.14.2014.07.30.01.11.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 01:11:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 10:12:05 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140730081205.GI16445@jama>
References: <1406053708-24207-1-git-send-email-TicoTimo@gmail.com>
	<CANx9H-AuCdp4dnFKmA7Ygq0J=2nNR_E2c-LN-1_1OaZF2LLSPg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-AuCdp4dnFKmA7Ygq0J=2nNR_E2c-LN-1_1OaZF2LLSPg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-python][PATCH] meta-python: fix conf/layer.conf, follow typical structure
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
X-List-Received-Date: Wed, 30 Jul 2014 08:11:48 -0000
X-Groupsio-MsgNum: 51318
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWJxWxNlJUNgDlXi"
Content-Disposition: inline

--pWJxWxNlJUNgDlXi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2014 at 10:34:35AM -0700, Tim Orling wrote:
> Ping.
> I haven't seen any comment on this patch at all.

I don't have strong opinion on this, but I don't like much the structure
with 1 recipe per directory, so I prefer single python directory with
all python modules together.

Also using the original structure from meta-oe has the advantage that
additional layers which were using include or require of some file from
python directory don't need any adaptation after meta-python was
separated (I've noticed it in one of our layers and that's why I've
submitted recipes-python -> recipes-devtools change).

> On Tue, Jul 22, 2014 at 11:28 AM, Tim Orling <ticotimo@gmail.com> wrote:
>=20
> > Intended structure was meta-python/recipes-python/*.bb, but
> > this is not typical. Rather, let's follow the typical structure
> > and have meta-python/recipes-python/<package>/python-<package>.bb
> >
> > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > ---
> >  meta-python/conf/layer.conf                                           =
| 4
> > ++--
> >  .../recipes-python/{python =3D> autobahn}/python-autobahn_0.8.6.bb    =
  | 0
> >  .../recipes-python/{python =3D> cheetah}/python-cheetah_2.4.4.bb      =
  | 0
> >  .../recipes-python/{python =3D> cloudeebus}/python-cloudeebus_0.6.0.bb=
  | 0
> >  meta-python/recipes-python/{python =3D> cython}/python-cython_0.20.2.b=
b | 0
> >  .../recipes-python/{python =3D> dateutil}/python-dateutil_1.5.bb      =
  | 0
> >  meta-python/recipes-python/{python =3D> epydoc}/python-epydoc_3.0.1.bb=
  | 0
> >  .../recipes-python/{python =3D> feedparser}/python-feedparser_5.1.3.bb=
  | 0
> >  meta-python/recipes-python/{python =3D> gdata}/python-gdata_1.2.4.bb  =
  | 0
> >  meta-python/recipes-python/{python =3D> gevent}/python-gevent_0.13.8.b=
b | 0
> >  .../recipes-python/{python =3D> greenlet}/python-greenlet_0.4.1.bb    =
  | 0
> >  .../recipes-python/{python =3D> ldap}/python-ldap/setup.cfg.patch     =
  | 0
> >  meta-python/recipes-python/{python =3D> ldap}/python-ldap_2.3.9.bb    =
  | 0
> >  meta-python/recipes-python/{python =3D> lxml}/python-lxml_3.0.2.bb    =
  | 0
> >  .../0001-setup.py-link-in-sysroot-not-in-host-directories.patch       =
| 0
> >  .../recipes-python/{python =3D> m2crypto}/python-m2crypto_0.21.1.bb   =
  | 0
> >  .../{python =3D> matplotlib}/python-matplotlib/fix_setup.patch        =
  | 0
> >  .../{python =3D> matplotlib}/python-matplotlib/fix_setupext.patch     =
  | 0
> >  .../recipes-python/{python =3D> matplotlib}/python-matplotlib_1.1.0.bb=
  | 0
> >  .../recipes-python/{python =3D> numeric}/python-numeric/no-lapack.patc=
h | 0
> >  meta-python/recipes-python/{python =3D> numeric}/python-numeric_24.2.b=
b | 0
> >  meta-python/recipes-python/{python =3D> pexpect}/python-pexpect_2.3.bb=
  | 0
> >  meta-python/recipes-python/{python =3D> pip}/python-pip_1.3.1.bb      =
  | 0
> >  meta-python/recipes-python/{python =3D> psutil}/python-psutil_0.6.1.bb=
  | 0
> >  .../recipes-python/{python =3D> pyalsaaudio}/python-pyalsaaudio_0.4.bb=
  | 0
> >  meta-python/recipes-python/{python =3D> pyrtm}/pyrtm_0.2.bb           =
  | 0
> >  .../recipes-python/{python =3D> pyserial}/python-pyserial_2.4.bb      =
  | 0
> >  meta-python/recipes-python/{python =3D> pyudev}/python-pyudev_0.16.1.b=
b | 0
> >  meta-python/recipes-python/{python =3D> pyusb}/python-pyusb_1.0.0a2.bb=
  | 0
> >  meta-python/recipes-python/{python =3D> pyyaml}/python-pyyaml/setup.py=
  | 0
> >  meta-python/recipes-python/{python =3D> pyyaml}/python-pyyaml_3.10.bb =
  | 0
> >  meta-python/recipes-python/{python =3D> smbus}/python-smbus_3.0.3.bb  =
  | 0
> >  .../recipes-python/{python =3D> sqlalchemy}/python-sqlalchemy_0.7.9.bb=
  | 0
> >  .../recipes-python/{python =3D> twisted}/python-twisted_13.2.0.bb     =
  | 0
> >  .../recipes-python/{python =3D> vobject}/python-vobject_0.8.1c.bb     =
  | 0
> >  meta-python/recipes-python/{python =3D> webdav}/python-webdav_0.1.2.bb=
  | 0
> >  .../{python =3D> zopeinterface}/python-zopeinterface_4.1.1.bb         =
  | 0
> >  37 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-python/recipes-python/{python =3D> autobahn}/
> > python-autobahn_0.8.6.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> cheetah}/
> > python-cheetah_2.4.4.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> cloudeebus}/
> > python-cloudeebus_0.6.0.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> cython}/
> > python-cython_0.20.2.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> dateutil}/
> > python-dateutil_1.5.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> epydoc}/
> > python-epydoc_3.0.1.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> feedparser}/
> > python-feedparser_5.1.3.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> gdata}/python-gdata_1.2=
=2E4.bb
> > (100%)
> >  rename meta-python/recipes-python/{python =3D> gevent}/
> > python-gevent_0.13.8.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> greenlet}/
> > python-greenlet_0.4.1.bb (100%)
> >  rename meta-python/recipes-python/{python =3D>
> > ldap}/python-ldap/setup.cfg.patch (100%)
> >  rename meta-python/recipes-python/{python =3D> ldap}/python-ldap_2.3.9=
=2Ebb
> > (100%)
> >  rename meta-python/recipes-python/{python =3D> lxml}/python-lxml_3.0.2=
=2Ebb
> > (100%)
> >  rename meta-python/recipes-python/{python =3D>
> > m2crypto}/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-dir=
ectories.patch
> > (100%)
> >  rename meta-python/recipes-python/{python =3D> m2crypto}/
> > python-m2crypto_0.21.1.bb (100%)
> >  rename meta-python/recipes-python/{python =3D>
> > matplotlib}/python-matplotlib/fix_setup.patch (100%)
> >  rename meta-python/recipes-python/{python =3D>
> > matplotlib}/python-matplotlib/fix_setupext.patch (100%)
> >  rename meta-python/recipes-python/{python =3D> matplotlib}/
> > python-matplotlib_1.1.0.bb (100%)
> >  rename meta-python/recipes-python/{python =3D>
> > numeric}/python-numeric/no-lapack.patch (100%)
> >  rename meta-python/recipes-python/{python =3D> numeric}/
> > python-numeric_24.2.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> pexpect}/
> > python-pexpect_2.3.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> pip}/python-pip_1.3.1.bb
> > (100%)
> >  rename meta-python/recipes-python/{python =3D> psutil}/
> > python-psutil_0.6.1.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> pyalsaaudio}/
> > python-pyalsaaudio_0.4.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> pyrtm}/pyrtm_0.2.bb (10=
0%)
> >  rename meta-python/recipes-python/{python =3D> pyserial}/
> > python-pyserial_2.4.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> pyudev}/
> > python-pyudev_0.16.1.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> pyusb}/
> > python-pyusb_1.0.0a2.bb (100%)
> >  rename meta-python/recipes-python/{python =3D>
> > pyyaml}/python-pyyaml/setup.py (100%)
> >  rename meta-python/recipes-python/{python =3D> pyyaml}/
> > python-pyyaml_3.10.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> smbus}/python-smbus_3.0=
=2E3.bb
> > (100%)
> >  rename meta-python/recipes-python/{python =3D> sqlalchemy}/
> > python-sqlalchemy_0.7.9.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> twisted}/
> > python-twisted_13.2.0.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> vobject}/
> > python-vobject_0.8.1c.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> webdav}/
> > python-webdav_0.1.2.bb (100%)
> >  rename meta-python/recipes-python/{python =3D> zopeinterface}/
> > python-zopeinterface_4.1.1.bb (100%)
> >
> > diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> > index 4e8eca3..db9ec2b 100644
> > --- a/meta-python/conf/layer.conf
> > +++ b/meta-python/conf/layer.conf
> > @@ -1,8 +1,8 @@
> >  # We might have a conf and classes directory, append to BBPATH
> >  BBPATH .=3D ":${LAYERDIR}"
> >
> > -# We have recipes directories, add to BBFILES
> > -BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bba=
ppend"
> > +# We have recipes-* directories, add to BBFILES
> > +BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb
> > ${LAYERDIR}/recipes-*/*/*.bbappend"
> >
> >  BBFILE_COLLECTIONS +=3D "meta-python"
> >  BBFILE_PATTERN_meta-python :=3D "^${LAYERDIR}/"
> > diff --git a/meta-python/recipes-python/python/python-autobahn_0.8.6.bb
> > b/meta-python/recipes-python/autobahn/python-autobahn_0.8.6.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-autobahn_0.8.6.bb
> > rename to meta-python/recipes-python/autobahn/python-autobahn_0.8.6.bb
> > diff --git a/meta-python/recipes-python/python/python-cheetah_2.4.4.bb
> > b/meta-python/recipes-python/cheetah/python-cheetah_2.4.4.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-cheetah_2.4.4.bb
> > rename to meta-python/recipes-python/cheetah/python-cheetah_2.4.4.bb
> > diff --git a/meta-python/recipes-python/python/python-cloudeebus_0.6.0.=
bb
> > b/meta-python/recipes-python/cloudeebus/python-cloudeebus_0.6.0.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-cloudeebus_0.6.0.bb
> > rename to meta-python/recipes-python/cloudeebus/python-cloudeebus_0.6.0=
=2Ebb
> > diff --git a/meta-python/recipes-python/python/python-cython_0.20.2.bb
> > b/meta-python/recipes-python/cython/python-cython_0.20.2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-cython_0.20.2.bb
> > rename to meta-python/recipes-python/cython/python-cython_0.20.2.bb
> > diff --git a/meta-python/recipes-python/python/python-dateutil_1.5.bb
> > b/meta-python/recipes-python/dateutil/python-dateutil_1.5.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-dateutil_1.5.bb
> > rename to meta-python/recipes-python/dateutil/python-dateutil_1.5.bb
> > diff --git a/meta-python/recipes-python/python/python-epydoc_3.0.1.bb
> > b/meta-python/recipes-python/epydoc/python-epydoc_3.0.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-epydoc_3.0.1.bb
> > rename to meta-python/recipes-python/epydoc/python-epydoc_3.0.1.bb
> > diff --git a/meta-python/recipes-python/python/python-feedparser_5.1.3.=
bb
> > b/meta-python/recipes-python/feedparser/python-feedparser_5.1.3.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-feedparser_5.1.3.bb
> > rename to meta-python/recipes-python/feedparser/python-feedparser_5.1.3=
=2Ebb
> > diff --git a/meta-python/recipes-python/python/python-gdata_1.2.4.bb
> > b/meta-python/recipes-python/gdata/python-gdata_1.2.4.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-gdata_1.2.4.bb
> > rename to meta-python/recipes-python/gdata/python-gdata_1.2.4.bb
> > diff --git a/meta-python/recipes-python/python/python-gevent_0.13.8.bb
> > b/meta-python/recipes-python/gevent/python-gevent_0.13.8.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-gevent_0.13.8.bb
> > rename to meta-python/recipes-python/gevent/python-gevent_0.13.8.bb
> > diff --git a/meta-python/recipes-python/python/python-greenlet_0.4.1.bb
> > b/meta-python/recipes-python/greenlet/python-greenlet_0.4.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-greenlet_0.4.1.bb
> > rename to meta-python/recipes-python/greenlet/python-greenlet_0.4.1.bb
> > diff --git a/meta-python/recipes-python/python/python-ldap/setup.cfg.pa=
tch
> > b/meta-python/recipes-python/ldap/python-ldap/setup.cfg.patch
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-ldap/setup.cfg.pat=
ch
> > rename to meta-python/recipes-python/ldap/python-ldap/setup.cfg.patch
> > diff --git a/meta-python/recipes-python/python/python-ldap_2.3.9.bb
> > b/meta-python/recipes-python/ldap/python-ldap_2.3.9.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-ldap_2.3.9.bb
> > rename to meta-python/recipes-python/ldap/python-ldap_2.3.9.bb
> > diff --git a/meta-python/recipes-python/python/python-lxml_3.0.2.bb
> > b/meta-python/recipes-python/lxml/python-lxml_3.0.2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-lxml_3.0.2.bb
> > rename to meta-python/recipes-python/lxml/python-lxml_3.0.2.bb
> > diff --git
> > a/meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-=
in-sysroot-not-in-host-directories.patch
> > b/meta-python/recipes-python/m2crypto/python-m2crypto/0001-setup.py-lin=
k-in-sysroot-not-in-host-directories.patch
> > similarity index 100%
> > rename from
> > meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-in=
-sysroot-not-in-host-directories.patch
> > rename to
> > meta-python/recipes-python/m2crypto/python-m2crypto/0001-setup.py-link-=
in-sysroot-not-in-host-directories.patch
> > diff --git a/meta-python/recipes-python/python/python-m2crypto_0.21.1.bb
> > b/meta-python/recipes-python/m2crypto/python-m2crypto_0.21.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-m2crypto_0.21.1.bb
> > rename to meta-python/recipes-python/m2crypto/python-m2crypto_0.21.1.bb
> > diff --git
> > a/meta-python/recipes-python/python/python-matplotlib/fix_setup.patch
> > b/meta-python/recipes-python/matplotlib/python-matplotlib/fix_setup.pat=
ch
> > similarity index 100%
> > rename from
> > meta-python/recipes-python/python/python-matplotlib/fix_setup.patch
> > rename to
> > meta-python/recipes-python/matplotlib/python-matplotlib/fix_setup.patch
> > diff --git
> > a/meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch
> > b/meta-python/recipes-python/matplotlib/python-matplotlib/fix_setupext.=
patch
> > similarity index 100%
> > rename from
> > meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch
> > rename to
> > meta-python/recipes-python/matplotlib/python-matplotlib/fix_setupext.pa=
tch
> > diff --git a/meta-python/recipes-python/python/python-matplotlib_1.1.0.=
bb
> > b/meta-python/recipes-python/matplotlib/python-matplotlib_1.1.0.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-matplotlib_1.1.0.bb
> > rename to meta-python/recipes-python/matplotlib/python-matplotlib_1.1.0=
=2Ebb
> > diff --git
> > a/meta-python/recipes-python/python/python-numeric/no-lapack.patch
> > b/meta-python/recipes-python/numeric/python-numeric/no-lapack.patch
> > similarity index 100%
> > rename from
> > meta-python/recipes-python/python/python-numeric/no-lapack.patch
> > rename to meta-python/recipes-python/numeric/python-numeric/no-lapack.p=
atch
> > diff --git a/meta-python/recipes-python/python/python-numeric_24.2.bb
> > b/meta-python/recipes-python/numeric/python-numeric_24.2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-numeric_24.2.bb
> > rename to meta-python/recipes-python/numeric/python-numeric_24.2.bb
> > diff --git a/meta-python/recipes-python/python/python-pexpect_2.3.bb
> > b/meta-python/recipes-python/pexpect/python-pexpect_2.3.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pexpect_2.3.bb
> > rename to meta-python/recipes-python/pexpect/python-pexpect_2.3.bb
> > diff --git a/meta-python/recipes-python/python/python-pip_1.3.1.bb
> > b/meta-python/recipes-python/pip/python-pip_1.3.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pip_1.3.1.bb
> > rename to meta-python/recipes-python/pip/python-pip_1.3.1.bb
> > diff --git a/meta-python/recipes-python/python/python-psutil_0.6.1.bb
> > b/meta-python/recipes-python/psutil/python-psutil_0.6.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-psutil_0.6.1.bb
> > rename to meta-python/recipes-python/psutil/python-psutil_0.6.1.bb
> > diff --git a/meta-python/recipes-python/python/python-pyalsaaudio_0.4.bb
> > b/meta-python/recipes-python/pyalsaaudio/python-pyalsaaudio_0.4.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyalsaaudio_0.4.bb
> > rename to meta-python/recipes-python/pyalsaaudio/python-pyalsaaudio_0.4=
=2Ebb
> > diff --git a/meta-python/recipes-python/python/pyrtm_0.2.bb
> > b/meta-python/recipes-python/pyrtm/pyrtm_0.2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/pyrtm_0.2.bb
> > rename to meta-python/recipes-python/pyrtm/pyrtm_0.2.bb
> > diff --git a/meta-python/recipes-python/python/python-pyserial_2.4.bb
> > b/meta-python/recipes-python/pyserial/python-pyserial_2.4.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyserial_2.4.bb
> > rename to meta-python/recipes-python/pyserial/python-pyserial_2.4.bb
> > diff --git a/meta-python/recipes-python/python/python-pyudev_0.16.1.bb
> > b/meta-python/recipes-python/pyudev/python-pyudev_0.16.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyudev_0.16.1.bb
> > rename to meta-python/recipes-python/pyudev/python-pyudev_0.16.1.bb
> > diff --git a/meta-python/recipes-python/python/python-pyusb_1.0.0a2.bb
> > b/meta-python/recipes-python/pyusb/python-pyusb_1.0.0a2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyusb_1.0.0a2.bb
> > rename to meta-python/recipes-python/pyusb/python-pyusb_1.0.0a2.bb
> > diff --git a/meta-python/recipes-python/python/python-pyyaml/setup.py
> > b/meta-python/recipes-python/pyyaml/python-pyyaml/setup.py
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyyaml/setup.py
> > rename to meta-python/recipes-python/pyyaml/python-pyyaml/setup.py
> > diff --git a/meta-python/recipes-python/python/python-pyyaml_3.10.bb
> > b/meta-python/recipes-python/pyyaml/python-pyyaml_3.10.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-pyyaml_3.10.bb
> > rename to meta-python/recipes-python/pyyaml/python-pyyaml_3.10.bb
> > diff --git a/meta-python/recipes-python/python/python-smbus_3.0.3.bb
> > b/meta-python/recipes-python/smbus/python-smbus_3.0.3.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-smbus_3.0.3.bb
> > rename to meta-python/recipes-python/smbus/python-smbus_3.0.3.bb
> > diff --git a/meta-python/recipes-python/python/python-sqlalchemy_0.7.9.=
bb
> > b/meta-python/recipes-python/sqlalchemy/python-sqlalchemy_0.7.9.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-sqlalchemy_0.7.9.bb
> > rename to meta-python/recipes-python/sqlalchemy/python-sqlalchemy_0.7.9=
=2Ebb
> > diff --git a/meta-python/recipes-python/python/python-twisted_13.2.0.bb
> > b/meta-python/recipes-python/twisted/python-twisted_13.2.0.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-twisted_13.2.0.bb
> > rename to meta-python/recipes-python/twisted/python-twisted_13.2.0.bb
> > diff --git a/meta-python/recipes-python/python/python-vobject_0.8.1c.bb
> > b/meta-python/recipes-python/vobject/python-vobject_0.8.1c.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-vobject_0.8.1c.bb
> > rename to meta-python/recipes-python/vobject/python-vobject_0.8.1c.bb
> > diff --git a/meta-python/recipes-python/python/python-webdav_0.1.2.bb
> > b/meta-python/recipes-python/webdav/python-webdav_0.1.2.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/python-webdav_0.1.2.bb
> > rename to meta-python/recipes-python/webdav/python-webdav_0.1.2.bb
> > diff --git a/meta-python/recipes-python/python/
> > python-zopeinterface_4.1.1.bb b/meta-python/recipes-python/zopeinterfac=
e/
> > python-zopeinterface_4.1.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-python/python/
> > python-zopeinterface_4.1.1.bb
> > rename to meta-python/recipes-python/zopeinterface/
> > python-zopeinterface_4.1.1.bb
> > --
> > 1.9.3
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pWJxWxNlJUNgDlXi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPYqNUACgkQN1Ujt2V2gBwFgwCgr6Q14gzHpDS/UCNI2QQPi44f
hbgAniAUElOLkpJK0i5Akha+psU86I15
=oDRx
-----END PGP SIGNATURE-----

--pWJxWxNlJUNgDlXi--
