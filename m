Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6637038D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 12:49:56 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so866792wes.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 05:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Neb4Q0GI057/EPEbqgfdthhscG7vJKqW4O8t3pTu22c=;
	b=LX2g4klaF5h3B08Tn+rFbIxRCCpTKLsEINyvaIqQGewLI266mtFay8J6YF2XlUq9Sv
	BRy08kVr7tadT8BTdY6LUMoR0I27+1c8aKVbfTXrxtiwsuT8yg+hzCYWXSDFp0Gh97qF
	zSeZMKRZvEyWKLS+MYEGa9BzrTjYAjEpuoU7wGBPjEFjUZkx/HzDrh+YFlDyoHyPc0/8
	twwDrs8A/LRbAKq4OJDd82k85xB2QQhpTjs1zPc0GcvcRGREKflRtFCiAuBKf5w8/vh6
	yM9kgQcwGuNq8DO57zS0kO2tZw9T/6QoVNY2GNOLWT4Fi8agw7/zMNpJZJv/3K7iNAwb
	V2Ag==
X-Received: by 10.180.198.244 with SMTP id jf20mr13619383wic.40.1405514997891; 
	Wed, 16 Jul 2014 05:49:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ja9sm56205149wic.8.2014.07.16.05.49.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 05:49:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 14:50:07 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716125007.GV2433@jama>
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
X-List-Received-Date: Wed, 16 Jul 2014 12:49:59 -0000
X-Groupsio-MsgNum: 50998
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kZn00QyXxdr8qbeL"
Content-Disposition: inline

--kZn00QyXxdr8qbeL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2014 at 04:32:34PM -0700, Tim Orling wrote:
>      * Move recipes from meta-openembedded/meta-oe that are not
>        depended upon by recipes already in meta-oe (e.g. gateone,
>        anki)
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

meta-python/recipes-python/*bb isn't included in BBFILES, causing this
warning:
WARNING: No bb files matched BBFILE_PATTERN_meta-python '^/home/jenkins/oe/=
world/shr-core/meta-openembedded/meta-python/'

I'll move them to python subdirectory, but please be more careful when
sending _tested_ patches.

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

--kZn00QyXxdr8qbeL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGdP8ACgkQN1Ujt2V2gBxaPQCgqvt+wmKcLw1gs/o9bevL2plL
sxwAnjGFsX+Nt/tzOGK9Y8cwDNVZOQch
=jAw6
-----END PGP SIGNATURE-----

--kZn00QyXxdr8qbeL--
