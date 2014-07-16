Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id CF2FC7038D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 12:38:53 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so6136849wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y59ZCjXr2stv/TyEs5sxEm6JlPCNmBPL5yY0xu2TOZQ=;
	b=0DxP/rJKJ58h0rJGfpVxLmREjoSWX3JTdEzNt1LBSkw149RNP19DJ9x9JcjyqS3Ehc
	q0WizB1G34pTZzzzPUC/3M9KIv55j/TDCAyw5Qp5VPt6l/Ta3biqVPy3i+yx3KohrxuB
	QAGqRKJh3HvjY12y1u+YPoILbwDVLmG3DaVObtqPlzho6yz+sMlrpFU2grgGSvFJHy/L
	NZ1T1coTjklDxOptvMXAg4Cdd1ec76ueDFdv72NPZ2pRjlvwUh8qwWz0bXTcT4LHCdup
	sp7hEkiB7WouL2aVhgWyjByGbgYnXbgXtvbJ3pxhLXD+19SSANXfXd0iO3tMif9WJTHn
	Q+lw==
X-Received: by 10.194.158.101 with SMTP id wt5mr1745764wjb.136.1405514333257; 
	Wed, 16 Jul 2014 05:38:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fg1sm8588938wic.17.2014.07.16.05.38.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 05:38:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 14:38:58 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716123858.GU2433@jama>
References: <cover.1405465524.git.TicoTimo@gmail.com>
	<a6acceb1dc1d391e20c3722e685aa7c9cca313b3.1405465524.git.TicoTimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a6acceb1dc1d391e20c3722e685aa7c9cca313b3.1405465524.git.TicoTimo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: paul.eggleton@linux.intel.com
Subject: Re: [meta-oe][PATCH 2/2] meta-python: move recipes from meta-oe
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
X-List-Received-Date: Wed, 16 Jul 2014 12:38:56 -0000
X-Groupsio-MsgNum: 50997
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0cPfB1ccX8kkdppm"
Content-Disposition: inline

--0cPfB1ccX8kkdppm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2014 at 04:32:34PM -0700, Tim Orling wrote:
>      * Move recipes from meta-openembedded/meta-oe that are not
>        depended upon by recipes already in meta-oe (e.g. gateone,
>        anki)

I'll add meta-efl/README update, because of:
ERROR: Nothing PROVIDES 'python-numeric' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-efl/recipes-devtools=
/python/python-efl_1.10.0.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-efl/recipes-devtools=
/python/python-edbus_1.7.0.bb
DEPENDS on or otherwise requires it). Close matches:

>=20
>      * Recipes NOT moved:
>      	 python-futures
> 	 python-pyopenssl
> 	 python-simplejson
> 	 python-tornado
> 	 python-pyqt
> 	 python-sip
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  .../recipes-devtools/python =3D> meta-python/recipes-python}/pyrtm_0.2.b=
b   | 0
>  .../python =3D> meta-python/recipes-python}/python-autobahn_0.8.6.bb    =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-cheetah_2.4.4.bb     =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-cloudeebus_0.6.0.bb  =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-cython_0.20.2.bb     =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-dateutil_1.5.bb      =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-epydoc_3.0.1.bb      =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-feedparser_5.1.3.bb  =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-gdata_1.2.4.bb       =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-gevent_0.13.8.bb     =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-greenlet_0.4.1.bb    =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-ldap/setup.cfg.patch =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-ldap_2.3.9.bb        =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-lxml_3.0.2.bb        =
    | 0
>  .../0001-setup.py-link-in-sysroot-not-in-host-directories.patch         =
  | 0
>  .../python =3D> meta-python/recipes-python}/python-m2crypto_0.21.1.bb   =
    | 0
>  .../recipes-python}/python-matplotlib/fix_setup.patch                   =
  | 0
>  .../recipes-python}/python-matplotlib/fix_setupext.patch                =
  | 0
>  .../python =3D> meta-python/recipes-python}/python-matplotlib_1.1.0.bb  =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-numeric/no-lapack.pat=
ch  | 0
>  .../python =3D> meta-python/recipes-python}/python-numeric_24.2.bb      =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-pexpect_2.3.bb       =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-pip_1.3.1.bb         =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-psutil_0.6.1.bb      =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-pyalsaaudio_0.4.bb   =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-pyserial_2.4.bb      =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-pyudev_0.16.1.bb     =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-pyusb_1.0.0a2.bb     =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-pyyaml/setup.py      =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-pyyaml_3.10.bb       =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-smbus_3.0.3.bb       =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-sqlalchemy_0.7.9.bb  =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-twisted_13.2.0.bb    =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-vobject_0.8.1c.bb    =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-webdav_0.1.2.bb      =
    | 0
>  .../python =3D> meta-python/recipes-python}/python-zopeinterface_4.1.1.b=
b   | 0
>  36 files changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/pyrtm_0.2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-autobahn_0.8.6.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-cheetah_2.4.4.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-cloudeebus_0.6.0.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-cython_0.20.2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-dateutil_1.5.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-epydoc_3.0.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-feedparser_5.1.3.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-gdata_1.2.4.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-gevent_0.13.8.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-greenlet_0.4.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-ldap/setup.cfg.patch (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-ldap_2.3.9.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-lxml_3.0.2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patc=
h (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-m2crypto_0.21.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-matplotlib/fix_setup.patch (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-matplotlib/fix_setupext.patch (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-matplotlib_1.1.0.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-numeric/no-lapack.patch (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-numeric_24.2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pexpect_2.3.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pip_1.3.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-psutil_0.6.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyalsaaudio_0.4.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyserial_2.4.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyudev_0.16.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyusb_1.0.0a2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyyaml/setup.py (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyyaml_3.10.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-smbus_3.0.3.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-sqlalchemy_0.7.9.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-twisted_13.2.0.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-vobject_0.8.1c.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-webdav_0.1.2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-zopeinterface_4.1.1.bb (100%)
>=20
> diff --git a/meta-oe/recipes-devtools/python/pyrtm_0.2.bb b/meta-python/r=
ecipes-python/pyrtm_0.2.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/pyrtm_0.2.bb
> rename to meta-python/recipes-python/pyrtm_0.2.bb
> diff --git a/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb b/m=
eta-python/recipes-python/python-autobahn_0.8.6.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> rename to meta-python/recipes-python/python-autobahn_0.8.6.bb
> diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb b/me=
ta-python/recipes-python/python-cheetah_2.4.4.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
> rename to meta-python/recipes-python/python-cheetah_2.4.4.bb
> diff --git a/meta-oe/recipes-devtools/python/python-cloudeebus_0.6.0.bb b=
/meta-python/recipes-python/python-cloudeebus_0.6.0.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-cloudeebus_0.6.0.bb
> rename to meta-python/recipes-python/python-cloudeebus_0.6.0.bb
> diff --git a/meta-oe/recipes-devtools/python/python-cython_0.20.2.bb b/me=
ta-python/recipes-python/python-cython_0.20.2.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-cython_0.20.2.bb
> rename to meta-python/recipes-python/python-cython_0.20.2.bb
> diff --git a/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb b/met=
a-python/recipes-python/python-dateutil_1.5.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
> rename to meta-python/recipes-python/python-dateutil_1.5.bb
> diff --git a/meta-oe/recipes-devtools/python/python-epydoc_3.0.1.bb b/met=
a-python/recipes-python/python-epydoc_3.0.1.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-epydoc_3.0.1.bb
> rename to meta-python/recipes-python/python-epydoc_3.0.1.bb
> diff --git a/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb b=
/meta-python/recipes-python/python-feedparser_5.1.3.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
> rename to meta-python/recipes-python/python-feedparser_5.1.3.bb
> diff --git a/meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb b/meta=
-python/recipes-python/python-gdata_1.2.4.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb
> rename to meta-python/recipes-python/python-gdata_1.2.4.bb
> diff --git a/meta-oe/recipes-devtools/python/python-gevent_0.13.8.bb b/me=
ta-python/recipes-python/python-gevent_0.13.8.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-gevent_0.13.8.bb
> rename to meta-python/recipes-python/python-gevent_0.13.8.bb
> diff --git a/meta-oe/recipes-devtools/python/python-greenlet_0.4.1.bb b/m=
eta-python/recipes-python/python-greenlet_0.4.1.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-greenlet_0.4.1.bb
> rename to meta-python/recipes-python/python-greenlet_0.4.1.bb
> diff --git a/meta-oe/recipes-devtools/python/python-ldap/setup.cfg.patch =
b/meta-python/recipes-python/python-ldap/setup.cfg.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-ldap/setup.cfg.patch
> rename to meta-python/recipes-python/python-ldap/setup.cfg.patch
> diff --git a/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb b/meta-=
python/recipes-python/python-ldap_2.3.9.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
> rename to meta-python/recipes-python/python-ldap_2.3.9.bb
> diff --git a/meta-oe/recipes-devtools/python/python-lxml_3.0.2.bb b/meta-=
python/recipes-python/python-lxml_3.0.2.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-lxml_3.0.2.bb
> rename to meta-python/recipes-python/python-lxml_3.0.2.bb
> diff --git a/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.p=
y-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-pytho=
n/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.pat=
ch
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py=
-link-in-sysroot-not-in-host-directories.patch
> rename to meta-python/recipes-python/python-m2crypto/0001-setup.py-link-i=
n-sysroot-not-in-host-directories.patch
> diff --git a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb b/=
meta-python/recipes-python/python-m2crypto_0.21.1.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
> rename to meta-python/recipes-python/python-m2crypto_0.21.1.bb
> diff --git a/meta-oe/recipes-devtools/python/python-matplotlib/fix_setup.=
patch b/meta-python/recipes-python/python-matplotlib/fix_setup.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-matplotlib/fix_setup.p=
atch
> rename to meta-python/recipes-python/python-matplotlib/fix_setup.patch
> diff --git a/meta-oe/recipes-devtools/python/python-matplotlib/fix_setupe=
xt.patch b/meta-python/recipes-python/python-matplotlib/fix_setupext.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-matplotlib/fix_setupex=
t.patch
> rename to meta-python/recipes-python/python-matplotlib/fix_setupext.patch
> diff --git a/meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb b=
/meta-python/recipes-python/python-matplotlib_1.1.0.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb
> rename to meta-python/recipes-python/python-matplotlib_1.1.0.bb
> diff --git a/meta-oe/recipes-devtools/python/python-numeric/no-lapack.pat=
ch b/meta-python/recipes-python/python-numeric/no-lapack.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-numeric/no-lapack.patch
> rename to meta-python/recipes-python/python-numeric/no-lapack.patch
> diff --git a/meta-oe/recipes-devtools/python/python-numeric_24.2.bb b/met=
a-python/recipes-python/python-numeric_24.2.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-numeric_24.2.bb
> rename to meta-python/recipes-python/python-numeric_24.2.bb
> diff --git a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb b/meta=
-python/recipes-python/python-pexpect_2.3.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
> rename to meta-python/recipes-python/python-pexpect_2.3.bb
> diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-p=
ython/recipes-python/python-pip_1.3.1.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> rename to meta-python/recipes-python/python-pip_1.3.1.bb
> diff --git a/meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb b/met=
a-python/recipes-python/python-psutil_0.6.1.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb
> rename to meta-python/recipes-python/python-psutil_0.6.1.bb
> diff --git a/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb b/=
meta-python/recipes-python/python-pyalsaaudio_0.4.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
> rename to meta-python/recipes-python/python-pyalsaaudio_0.4.bb
> diff --git a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb b/met=
a-python/recipes-python/python-pyserial_2.4.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
> rename to meta-python/recipes-python/python-pyserial_2.4.bb
> diff --git a/meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb b/me=
ta-python/recipes-python/python-pyudev_0.16.1.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb
> rename to meta-python/recipes-python/python-pyudev_0.16.1.bb
> diff --git a/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb b/me=
ta-python/recipes-python/python-pyusb_1.0.0a2.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
> rename to meta-python/recipes-python/python-pyusb_1.0.0a2.bb
> diff --git a/meta-oe/recipes-devtools/python/python-pyyaml/setup.py b/met=
a-python/recipes-python/python-pyyaml/setup.py
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-pyyaml/setup.py
> rename to meta-python/recipes-python/python-pyyaml/setup.py
> diff --git a/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb b/meta=
-python/recipes-python/python-pyyaml_3.10.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb
> rename to meta-python/recipes-python/python-pyyaml_3.10.bb
> diff --git a/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb b/meta=
-python/recipes-python/python-smbus_3.0.3.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb
> rename to meta-python/recipes-python/python-smbus_3.0.3.bb
> diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb b=
/meta-python/recipes-python/python-sqlalchemy_0.7.9.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
> rename to meta-python/recipes-python/python-sqlalchemy_0.7.9.bb
> diff --git a/meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb b/m=
eta-python/recipes-python/python-twisted_13.2.0.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
> rename to meta-python/recipes-python/python-twisted_13.2.0.bb
> diff --git a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb b/m=
eta-python/recipes-python/python-vobject_0.8.1c.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
> rename to meta-python/recipes-python/python-vobject_0.8.1c.bb
> diff --git a/meta-oe/recipes-devtools/python/python-webdav_0.1.2.bb b/met=
a-python/recipes-python/python-webdav_0.1.2.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-webdav_0.1.2.bb
> rename to meta-python/recipes-python/python-webdav_0.1.2.bb
> diff --git a/meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.b=
b b/meta-python/recipes-python/python-zopeinterface_4.1.1.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb
> rename to meta-python/recipes-python/python-zopeinterface_4.1.1.bb
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0cPfB1ccX8kkdppm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGcmIACgkQN1Ujt2V2gByhKgCgu6HgwEYkfWpC+BiQ7hsfde42
PuQAnij5cr6JGxg/cfxElRO1KfZLIZSu
=ESvr
-----END PGP SIGNATURE-----

--0cPfB1ccX8kkdppm--
