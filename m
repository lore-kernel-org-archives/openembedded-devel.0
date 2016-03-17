Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3648D73163
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 21:44:44 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so12457118wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PQlxelZbSD2xIGCNTfT6mOz0iLqhYup/iYR4+9uL2o8=;
	b=fLF0OPNgtjzJCW9zjVMrj0ZLIUR7vUHEAy10x+bqhtNe8evI/V82dYbrpH4JFX2WC7
	+hVexV6S+tR+mBJjhCM+lUAsTlbIUVgqExk9Y2kY/hJKcKLxjsie1s/HmFFCP9cjyWOW
	XljYjDfeAWYfLFD4EFJk0+fsZprtD6kKmOmS3R74yfnoq4/SdwJeNG9Ojb3nTuTkCNCZ
	bROH42BfynqG3rEp1hPMpDwWVXt3A1n1wXmFv5upYaPzE4NszhI1PynWk16a+bVPf+I/
	iQP35rhrDFUOntj4BmmFH2Y8zqKu8ecMO+i6JAOnoDU3NdwbwurJJOoHuRtNyYQi3F6k
	SOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PQlxelZbSD2xIGCNTfT6mOz0iLqhYup/iYR4+9uL2o8=;
	b=Q9iKzD+bRVBxJ1Wqn/NTtfmCcB0vB+fZJRHtIyINLAVtSIvd/i8Bk4fmUqzEmBLQnH
	OaFkDQjXuaHl3ygztJAq4bGSyA28oogpcwGVuuqyfTbwfcMB9f18tbTYRiPNdaP7hPZj
	3qlqwtJYDrzDmtWSPnVZtTEaFhPSo3L467v9HQ5sZmNgaWOjzkmgygIwL1L3M1YbUB8H
	F2pB+dnQsMibphFTMJn8AklG7AeXRHGyNMRuCE0QEe+rZo07t+JcTD5HTeHOQzlwykKa
	RKNLgFJbCcD6tdAtrO579Gr/AmeNptnSlFz7KmdgDzzILcFVFegx65hhmrNP5ln3Kcv8
	V4UQ==
X-Gm-Message-State: AD7BkJIn9npubOvfVecXIQgVtDhfTmd4Fj9SUanx9U7Dpsxn5Xud4URG+GB4YguHOaZwjQ==
X-Received: by 10.28.228.137 with SMTP id b131mr12748848wmh.16.1458251085337; 
	Thu, 17 Mar 2016 14:44:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q139sm9938860wmd.2.2016.03.17.14.44.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 14:44:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 22:48:28 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160317214828.GJ2553@jama>
References: <614cbca3bdce23c4c67f78eab893a21ef6a50663.1458230028.git.adrian.ratiu@ni.com>
	<5663cbe1f0256f5eec13f90acd9b2373932dbbc5.1458230028.git.adrian.ratiu@ni.com>
	<20160317214118.GH2553@jama>
MIME-Version: 1.0
In-Reply-To: <20160317214118.GH2553@jama>
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
X-List-Received-Date: Thu, 17 Mar 2016 21:44:45 -0000
X-Groupsio-MsgNum: 60555
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZG+WKzXzVby2T9Ro"
Content-Disposition: inline

--ZG+WKzXzVby2T9Ro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2016 at 10:41:18PM +0100, Martin Jansa wrote:
> On Thu, Mar 17, 2016 at 05:54:35PM +0200, Ioan-Adrian Ratiu wrote:
> > From: Haris Okanovic <haris.okanovic@ni.com>
> >=20
> > The apache-websocket module is an Apache 2.x server module that may be
> > used to process requests using the WebSocket protocol (RFC 6455) by an
> > Apache 2.x server. The module consists of a plugin architecture for
> > handling WebSocket messaging.
>=20
> does v2 fix hits?
>=20
> | checking for libtool... no
> | configure: error: could not find an installed libtool
> | NOTE: The following config.log files may provide further information.
> | NOTE:
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/a=
pache-websocket/1.1.1-r0/git/config.log

Whole log:
http://errors.yoctoproject.org/Errors/Details/56598/
>=20
> ?
>=20
> >=20
> > Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  .../apache-mod/apache-websocket_git.bb             | 32 ++++++++++++++=
++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 meta-webserver/recipes-httpd/apache-mod/apache-webs=
ocket_git.bb
> >=20
> > diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_g=
it.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> > new file mode 100644
> > index 0000000..2cfc1f3
> > --- /dev/null
> > +++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> > @@ -0,0 +1,32 @@
> > +SUMMARY =3D "Websocket module for Apache web server"
> > +DESCRIPTION =3D "Process requests using the WebSocket protocol (RFC 64=
55)"
> > +HOMEPAGE =3D "https://github.com/jchampio/${PN}/"
> > +SECTION =3D "net"
> > +LICENSE =3D "Apache-2.0"
> > +
> > +inherit autotools-brokensep pkgconfig
> > +
> > +DEPENDS =3D "apache2 apache2-native"
> > +RDEPENDS_${PN} +=3D "apache2"
> > +
> > +# Original (github.com/disconnect/apache-websocket) is dead since 2012=
, the
> > +# fork contains patches from the modules ML and fixes CVE compliance i=
ssues
> > +SRC_URI =3D "git://github.com/jchampio/apache-websocket.git"
> > +
> > +SRCREV =3D "f5230d8c520dccf8631da94bf90c23f3c1100dcc"
> > +
> > +PV =3D "0.1.1"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e2646=
8ba93"
> > +
> > +EXTRA_OECONF =3D "APACHECTL=3D${STAGING_DIR_TARGET}${sbindir}/apachect=
l"
> > +
> > +do_install() {
> > +    install -d ${D}${libdir}/apache2/modules/
> > +    install ${B}/.libs/mod_websocket.so ${D}${libdir}/apache2/modules/
> > +}
> > +
> > +FILES_${PN} +=3D " ${libdir}/apache2/modules/* "
> > +FILES_${PN}-dbg +=3D " ${libdir}/apache2/modules/.debug/* "
> > --=20
> > 2.7.3
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZG+WKzXzVby2T9Ro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbrJiwACgkQN1Ujt2V2gBxxUwCfTsGGWHEBKgu0NXzWjidHXRZ4
v9gAn2xlYhwQOtFBtSMF4ExavcFLbJMn
=wVat
-----END PGP SIGNATURE-----

--ZG+WKzXzVby2T9Ro--
