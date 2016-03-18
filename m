Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id AF40C6011C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 11:45:53 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l124so27722846wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 04:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=L4Wgujtdn73xVYsoIWunyZePMsMglq+z1TVBVKysp/4=;
	b=q2TbE4K6L+ToIS5vijkz/rNYYED8F3z/Fafg3missv8BxM0/o2JJRLAJJi3R6XGRqN
	maJpeQK+ytxtWN2kVLNEQ5OpQ4g45XMQDYhoNqopEdSbkXohaVW/LeFwGNfvcZWgoXzi
	QnaWNbMPqBOUqpejLqpSbC3i2+DHL+dBSuvIrso71Q+zYSlj5p2XX8DlfIFGuhun54U0
	+Gv96/9rUzAnggyIIdkra5NNtcfum1MGbstdPz/Uldi3sZgRRai8fObnM1AjuEEsvq2T
	E9f9WUkGBxr8FLFv5C7AKWaLOcYzSeT/e36i2liac82vzcuYwLcm5vASuasdKFXnGGN5
	Pkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=L4Wgujtdn73xVYsoIWunyZePMsMglq+z1TVBVKysp/4=;
	b=b9HJqnMH5eGAEJ+nH/q7SLcwSDNaeigWfFyczmILUZu/vqrhQ58JVVhVvkOkaQ45Yy
	MZcmLmfDJzjUVb9XVCUSrzhTvbm2kjtmU0743X2YM63a/zirxLGXpM7oWr/vEVlLo7ls
	p6vswUmLtuDbCiy12x9KGyXwxg+vj16xJAhA9fR2ssGIMdHMhPctXWjLJm+YbNWpMAzN
	RtDrmGcppLuc5M4r7ZOn//euH2CFwNYULuPY1eWUv3RTqOlvdBdozNtRYFEaiurmUxTt
	DXZrNRfg4hlwN+UQs3+1oC6ruU+cW6B/wmjcG2pRyBXJKEBXDoPJDD9PWRIu8SuWhosc
	IzxQ==
X-Gm-Message-State: AD7BkJL/moIuWLbs6ytljBiNBPhXVzlVzwJ1CVTl0i/DkjqE0rbOwg/rQJ8yC1DR3aiP/g==
X-Received: by 10.28.91.83 with SMTP id p80mr44260707wmb.48.1458301553927;
	Fri, 18 Mar 2016 04:45:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u4sm11923909wjz.4.2016.03.18.04.45.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 04:45:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Mar 2016 12:49:48 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160318114948.GA2555@jama>
References: <614cbca3bdce23c4c67f78eab893a21ef6a50663.1458230028.git.adrian.ratiu@ni.com>
	<5663cbe1f0256f5eec13f90acd9b2373932dbbc5.1458230028.git.adrian.ratiu@ni.com>
	<20160317214118.GH2553@jama>
	<20160318104056.4a245741@adi-pc-linux.emea.corp.natinst.com>
MIME-Version: 1.0
In-Reply-To: <20160318104056.4a245741@adi-pc-linux.emea.corp.natinst.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Haris Okanovic <haris.okanovic@ni.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 2/2] apache-websocket: Add recipe
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
X-List-Received-Date: Fri, 18 Mar 2016 11:45:56 -0000
X-Groupsio-MsgNum: 60567
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2016 at 10:40:56AM +0200, Ioan-Adrian Ratiu wrote:
> Hello
>=20
> On Thu, 17 Mar 2016 22:41:18 +0100
> Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Thu, Mar 17, 2016 at 05:54:35PM +0200, Ioan-Adrian Ratiu wrote:
> > > From: Haris Okanovic <haris.okanovic@ni.com>
> > >=20
> > > The apache-websocket module is an Apache 2.x server module that may be
> > > used to process requests using the WebSocket protocol (RFC 6455) by an
> > > Apache 2.x server. The module consists of a plugin architecture for
> > > handling WebSocket messaging. =20
> >=20
> > does v2 fix hits?
> >=20
> > | checking for libtool... no
> > | configure: error: could not find an installed libtool
> > | NOTE: The following config.log files may provide further information.
> > | NOTE:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/apache-websocket/1.1.1-r0/git/config.log
> >=20
> > ?
>=20
> v2 fixes just the version number for apache-websocket. I'm not seeing tha=
t error on my machine:
>=20
> (...)
> checking for apachectl... /media/adi/ssd/nilrt-master/build/tmp-glibc/sys=
roots/x64/usr/sbin/apachectl
> checking for httpd... /media/adi/ssd/nilrt-master/build/tmp-glibc/sysroot=
s/x86_64-linux/usr/bin/httpd
> checking for libtool... /usr/bin/libtool

That build machine doesn't even have /usr/bin/libtool, you should use
libtool provided by libtool-cross recipe.

> checking for the httpd modules directory... /usr/lib/apache2/modules
> (...)
>=20
> Is there some kind of host contamination going on here?
>=20
> >=20
> > >=20
> > > Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > ---
> > >  .../apache-mod/apache-websocket_git.bb             | 32 ++++++++++++=
++++++++++
> > >  1 file changed, 32 insertions(+)
> > >  create mode 100644 meta-webserver/recipes-httpd/apache-mod/apache-we=
bsocket_git.bb
> > >=20
> > > diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket=
_git.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> > > new file mode 100644
> > > index 0000000..2cfc1f3
> > > --- /dev/null
> > > +++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> > > @@ -0,0 +1,32 @@
> > > +SUMMARY =3D "Websocket module for Apache web server"
> > > +DESCRIPTION =3D "Process requests using the WebSocket protocol (RFC =
6455)"
> > > +HOMEPAGE =3D "https://github.com/jchampio/${PN}/"
> > > +SECTION =3D "net"
> > > +LICENSE =3D "Apache-2.0"
> > > +
> > > +inherit autotools-brokensep pkgconfig
> > > +
> > > +DEPENDS =3D "apache2 apache2-native"
> > > +RDEPENDS_${PN} +=3D "apache2"
> > > +
> > > +# Original (github.com/disconnect/apache-websocket) is dead since 20=
12, the
> > > +# fork contains patches from the modules ML and fixes CVE compliance=
 issues
> > > +SRC_URI =3D "git://github.com/jchampio/apache-websocket.git"
> > > +
> > > +SRCREV =3D "f5230d8c520dccf8631da94bf90c23f3c1100dcc"
> > > +
> > > +PV =3D "0.1.1"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26=
468ba93"
> > > +
> > > +EXTRA_OECONF =3D "APACHECTL=3D${STAGING_DIR_TARGET}${sbindir}/apache=
ctl"
> > > +
> > > +do_install() {
> > > +    install -d ${D}${libdir}/apache2/modules/
> > > +    install ${B}/.libs/mod_websocket.so ${D}${libdir}/apache2/module=
s/
> > > +}
> > > +
> > > +FILES_${PN} +=3D " ${libdir}/apache2/modules/* "
> > > +FILES_${PN}-dbg +=3D " ${libdir}/apache2/modules/.debug/* "
> > > --=20
> > > 2.7.3
> > >  =20
> >=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbr61kACgkQN1Ujt2V2gBzHegCgr1vHBQ1THHg4FfhKwiLoh94o
dWgAn13lZhDeExiF2vMgexB7InqFDebV
=E1Ke
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
