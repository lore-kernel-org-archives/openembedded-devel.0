Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id B846F7722D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 22:28:55 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b205so50516884wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 14:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=r3ETIO3XsAe0jyXpTTJQJ1GQuYMFhofwRGpVTYgjtmo=;
	b=HwaYdIpMbL0vm+kUnZztssJo8+Vqj4b0xQ7ku7ZopNj1RrsMONjkXFxvIlc2fgUbwt
	IBkgY2KPuedsiaZWYtZ0cw1QHqLXRo1h39ojhi9YuGGei+4f/02/RWDiATOx/zOCxHUd
	CFCEX+YfFPzu7Ex8OQPLEzXrVTQd+tQMVkEovl1kZilYMu+WE2aczGXzizhrPpiZMpjk
	5Tzf5fNKXb0S2iXqEMl5LNcg5nBrm4IQEQCPJ5ybMF0OdWtU9ftJ+zw3lL+BsFhZwXxG
	mE5HE+xFSAQDYgjAJBiFQkAFOFqE86QabevwuSQQptryMN1VLpR++KRyBUtGGnIVeNRg
	56ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=r3ETIO3XsAe0jyXpTTJQJ1GQuYMFhofwRGpVTYgjtmo=;
	b=F5aS148j6S+idfRdVINo+9tFr9YjAu3dlnS2y9j2onct6lSQUCEG/9dhFBtUhDYN4c
	YU3OfOQ1iZSXhnmhL1/8WD0IViLPMIdhxHt020L6al6GjB697YGe1LDa1IWzGKRbiYft
	xe6glHthU1dTaGT2XzgMYDfK+Ml6JqA9BrJ7itcFzfMxchcOooIk1RBNWG3gyxlBjXZA
	xb2jqYTLD5wgDDzqf4p9gLnN1sdgwOUgHL9/14bFrNE6O/bBDziaZH+Q3uvz05qztwSk
	KFLbDrb5skX3HucgK9dGqxC/LV0eE/z5J9JPBYo+m80n2C4YXpt1eNbBTqswgrJKehdy
	l4bw==
X-Gm-Message-State: AG10YOTyM4kQTCBCQww/ZJDftzQYtQfisNfJp7i+iYD52dW7bpcZ+D7TmfAmnKS3aHpBVA==
X-Received: by 10.28.53.4 with SMTP id c4mr958961wma.34.1456439335960;
	Thu, 25 Feb 2016 14:28:55 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id w17sm302906wmw.5.2016.02.25.14.28.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 14:28:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Feb 2016 23:30:08 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160225223008.GE2565@jama>
References: <1456418243-11769-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJ86T=UoPcL3+jwzmxDgjAApVqmCBqBkKM=OhUxUbTunPLtntw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UoPcL3+jwzmxDgjAApVqmCBqBkKM=OhUxUbTunPLtntw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe] recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode, links"
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
X-List-Received-Date: Thu, 25 Feb 2016 22:28:57 -0000
X-Groupsio-MsgNum: 60216
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aZoGpuMECXJckB41"
Content-Disposition: inline

--aZoGpuMECXJckB41
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2016 at 12:45:06PM -0800, Andre McCurdy wrote:
> On Thu, Feb 25, 2016 at 8:37 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > * Using "cp -a" leaks UID of user running the builds, causing
> >   many QA warnings.
> > * See this thread for details:
> >   http://lists.openembedded.org/pipermail/openembedded-core/2015-Novemb=
er/112904.html
>=20
> Would using "cp -a --no-preserve=3Downership" be a clearer way to
> express what you're actually trying to do?

Yes, I was just blindly following
http://lists.openembedded.org/pipermail/openembedded-core/2016-January/1156=
58.html
but I don't have strong opinion either way, both are too long to write.

>=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-efl/recipes-devtools/python/python-edbus.inc              |  2 +-
> >  meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb           |  2 +-
> >  meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb   |  2 +-
> >  meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  2 +-
> >  .../recipes-support/cim-schema/cim-schema-docs_2.40.0.bb       |  2 +-
> >  .../recipes-support/cim-schema/cim-schema-exper_2.39.0.bb      |  2 +-
> >  .../recipes-support/cim-schema/cim-schema-final_2.40.0.bb      |  2 +-
> >  meta-oe/recipes-benchmark/fio/fio_2.2.6.bb                     |  2 +-
> >  meta-oe/recipes-devtools/lua/lua_5.3.2.bb                      |  2 +-
> >  meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb          |  2 +-
> >  meta-oe/recipes-multimedia/live555/live555.inc                 | 10 ++=
+++-----
> >  meta-oe/recipes-navigation/orrery/orrery_2.7.bb                |  2 +-
> >  meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb             |  4 ++=
--
> >  meta-oe/recipes-support/tbb/tbb_4.1.bb                         |  2 +-
> >  meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb    |  2 +-
> >  15 files changed, 20 insertions(+), 20 deletions(-)
> >
> > diff --git a/meta-efl/recipes-devtools/python/python-edbus.inc b/meta-e=
fl/recipes-devtools/python/python-edbus.inc
> > index 1d8098f..3e72261 100644
> > --- a/meta-efl/recipes-devtools/python/python-edbus.inc
> > +++ b/meta-efl/recipes-devtools/python/python-edbus.inc
> > @@ -39,7 +39,7 @@ do_install_append() {
> >          done
> >          cd ${S}
> >          install -d ${D}${datadir}/${PN}/
> > -        cp -a examples ${D}${datadir}/${PN}/
> > +        cp -R --no-dereference --preserve=3Dmode,links -v examples ${D=
}${datadir}/${PN}/
> >          find ${D}${datadir}/${PN}/examples -name ".svn" | xargs rm -rf
> >      fi
> >  }
> > diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb b/met=
a-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> > index 7cc0ec7..71e2bfc 100644
> > --- a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> > +++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> > @@ -19,7 +19,7 @@ do_install() {
> >      install -d ${D}${libdir}
> >      install -m 0644 libebml.a ${D}${libdir}
> >      install -m 0755 libebml.so.* ${D}${libdir}
> > -    cp -a libebml.so ${D}${libdir}
> > +    cp -R --no-dereference --preserve=3Dmode,links -v libebml.so ${D}$=
{libdir}
> >
> >      install -d ${D}${includedir}/ebml
> >      for i in ../../ebml/*.h; do
> > diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.=
bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
> > index 19a7edb..1ad87cb 100644
> > --- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
> > +++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
> > @@ -21,7 +21,7 @@ do_install() {
> >      install -d ${D}${libdir}
> >      install -m 0644 libmatroska.a ${D}${libdir}
> >      install -m 0755 libmatroska.so.* ${D}${libdir}
> > -    cp -a libmatroska.so ${D}${libdir}
> > +    cp -R --no-dereference --preserve=3Dmode,links -v libmatroska.so $=
{D}${libdir}
> >
> >      install -d ${D}${includedir}/matroska
> >      for i in ../../matroska/*.h; do
> > diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.=
bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> > index e8df06c..06f3707 100644
> > --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> > +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> > @@ -85,7 +85,7 @@ do_install_ptest() {
> >      for i in ${S}/dist ${S}/include ${B}/include ${S}/mibs ${S}/config=
ure \
> >          ${B}/net-snmp-config ${S}/testing; do
> >          if [ -e "$i" ]; then
> > -            cp -a "$i" ${D}${PTEST_PATH}
> > +            cp -R --no-dereference --preserve=3Dmode,links -v "$i" ${D=
}${PTEST_PATH}
> >          fi
> >      done
> >      echo `autoconf -V|awk '/autoconf/{print $NF}'` > ${D}${PTEST_PATH}=
/dist/autoconf-version
> > diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-docs=
_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.4=
0.0.bb
> > index 093f0d4..31875ea 100644
> > --- a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0=
=2Ebb
> > +++ b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0=
=2Ebb
> > @@ -18,7 +18,7 @@ do_unpack() {
> >
> >  do_install() {
> >          install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}-docs
> > -        cp -a ${S}/* ${D}${datadir}/doc/cim-schema-${PV}-docs
> > +        cp -R --no-dereference --preserve=3Dmode,links -v ${S}/* ${D}$=
{datadir}/doc/cim-schema-${PV}-docs
> >  }
> >
> >  FILES_${PN} =3D "${datadir}/doc/*"
> > diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-expe=
r_2.39.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2=
=2E39.0.bb
> > index e4ed7b3..4b07c0b 100644
> > --- a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.=
0.bb
> > +++ b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.=
0.bb
> > @@ -16,7 +16,7 @@ do_install() {
> >          install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
> >          install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schem=
a-${PV}
> >
> > -        cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/
> > +        cp -R --no-dereference --preserve=3Dmode,links -v ${S}/* ${D}$=
{datadir}/mof/cimv${PV}/
> >          chown -R root:root ${D}${datadir}/mof/cimv${PV}
> >          for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
> >                  sed -i -e 's/\r//g' $i
> > diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-fina=
l_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2=
=2E40.0.bb
> > index 7ab9c4d..5675384 100644
> > --- a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.=
0.bb
> > +++ b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.=
0.bb
> > @@ -21,7 +21,7 @@ do_install() {
> >          install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
> >          install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schem=
a-${PV}
> >
> > -        cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/
> > +        cp -R --no-dereference --preserve=3Dmode,links -v ${S}/* ${D}$=
{datadir}/mof/cimv${PV}/
> >          chown -R root:root ${D}${datadir}/mof/cimv${PV}/
> >          for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
> >                  sed -i -e 's/\r//g' $i
> > diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb b/meta-oe/recip=
es-benchmark/fio/fio_2.2.6.bb
> > index 5bf387c..db67173 100644
> > --- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> > +++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> > @@ -37,5 +37,5 @@ do_configure() {
> >  do_install() {
> >      oe_runmake install DESTDIR=3D${D} prefix=3D${prefix} mandir=3D${ma=
ndir}
> >      install -d ${D}/${docdir}/${PN}
> > -    cp -a ${S}/examples ${D}/${docdir}/${PN}/
> > +    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/examples ${=
D}/${docdir}/${PN}/
> >  }
> > diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb b/meta-oe/recipe=
s-devtools/lua/lua_5.3.2.bb
> > index f97ed50..07a1a43 100644
> > --- a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
> > +++ b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
> > @@ -55,7 +55,7 @@ do_install () {
> >  }
> >
> >  do_install_ptest () {
> > -        cp -a ${WORKDIR}/lua-${PV}-tests ${D}${PTEST_PATH}/test
> > +        cp -R --no-dereference --preserve=3Dmode,links -v ${WORKDIR}/l=
ua-${PV}-tests ${D}${PTEST_PATH}/test
> >  }
> >
> >  BBCLASSEXTEND =3D "native"
> > diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb b/me=
ta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
> > index 85035d9..0ac8fad 100644
> > --- a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
> > +++ b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
> > @@ -33,7 +33,7 @@ do_install_append() {
> >      install ${B}/ptts/tipcTC ${D}/opt/tipcutils/ptts/
> >
> >      install -d ${D}${sysconfdir}
> > -    cp -a ${S}/scripts/etc/* ${D}${sysconfdir}/
> > +    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/scripts/etc=
/* ${D}${sysconfdir}/
> >      chown -R root:root ${D}${sysconfdir}
> >  }
> >
> > diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/r=
ecipes-multimedia/live555/live555.inc
> > index 0c8208a..0d11de9 100644
> > --- a/meta-oe/recipes-multimedia/live555/live555.inc
> > +++ b/meta-oe/recipes-multimedia/live555/live555.inc
> > @@ -34,11 +34,11 @@ do_install() {
> >      install -d ${D}${includedir}/liveMedia
> >      install -d ${D}${includedir}/UsageEnvironment
> >      install -d ${D}${libdir}
> > -    cp -a ${S}/BasicUsageEnvironment/include/*.hh ${D}${includedir}/Ba=
sicUsageEnvironment/
> > -    cp -a ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/
> > -    cp -a ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/
> > -    cp -a ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/
> > -    cp -a ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEn=
vironment/
> > +    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/BasicUsageE=
nvironment/include/*.hh ${D}${includedir}/BasicUsageEnvironment/
> > +    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/groupsock/i=
nclude/*.h ${D}${includedir}/groupsock/
> > +    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/groupsock/i=
nclude/*.hh ${D}${includedir}/groupsock/
> > +    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/liveMedia/i=
nclude/*.hh ${D}${includedir}/liveMedia/
> > +    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/UsageEnviro=
nment/include/*.hh ${D}${includedir}/UsageEnvironment/
> >      # Find all the headers
> >      for i in $(find . -name "*.hh") $(find . -name "*.h") ; do
> >          install ${i} ${D}${includedir}
> > diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/=
recipes-navigation/orrery/orrery_2.7.bb
> > index 617afbc..40a6df3 100644
> > --- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
> > +++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
> > @@ -23,7 +23,7 @@ do_configure_prepend() {
> >  }
> >  do_install_append() {
> >      install -d ${D}${datadir}/orrery
> > -    cp -a ${S}/data/* ${D}${datadir}/orrery
> > +    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/data/* ${D}=
${datadir}/orrery
> >      chown -R root:root ${D}${datadir}/orrery
> >      install -d ${D}${datadir}/icons
> >      install -m 0755 ${WORKDIR}/orrery.png ${D}${datadir}/icons
> > diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-=
oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
> > index 18979d5..35c891e 100644
> > --- a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
> > +++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
> > @@ -19,10 +19,10 @@ EXTRA_OECONF =3D "--without-x \
> >
> >  do_configure() {
> >      export topdir=3D${S}
> > -    cp -a ${S}/autoconf/configure.in ${S}
> > +    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/autoconf/co=
nfigure.in ${S}
> >
> >      if ! [ -d ${S}/platforms/${DISTRO} ] ; then
> > -        cp -a ${S}/platforms/unknown ${S}/platforms/${DISTRO}
> > +        cp -R --no-dereference --preserve=3Dmode,links -v ${S}/platfor=
ms/unknown ${S}/platforms/${DISTRO}
> >      fi
> >
> >      gnu-configize --force
> > diff --git a/meta-oe/recipes-support/tbb/tbb_4.1.bb b/meta-oe/recipes-s=
upport/tbb/tbb_4.1.bb
> > index 55212dc..09ed6ec 100644
> > --- a/meta-oe/recipes-support/tbb/tbb_4.1.bb
> > +++ b/meta-oe/recipes-support/tbb/tbb_4.1.bb
> > @@ -26,7 +26,7 @@ do_compile() {
> >  do_install() {
> >      install -d ${D}${includedir} ${D}${libdir}/pkgconfig
> >      rm ${S}/include/tbb/index.html -f
> > -    cp -a ${S}/include/tbb ${D}${includedir}
> > +    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/include/tbb=
 ${D}${includedir}
> >      install -m 0755 ${B}/build/linux_*_release/lib*.so* ${D}${libdir}
> >      install -m 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig
> >  }
> > diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.b=
b b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
> > index b8faf12..ac32185 100644
> > --- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
> > +++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
> > @@ -20,7 +20,7 @@ inherit allarch
> >
> >  do_install() {
> >      install -d ${D}${datadir}/${BPN}
> > -    cp -a * ${D}${datadir}/${BPN}
> > +    cp -R --no-dereference --preserve=3Dmode,links -v * ${D}${datadir}=
/${BPN}
> >      chown -R root:root ${D}${datadir}/${BPN}
> >      # Don't install patches to target
> >      rm -rf ${D}${datadir}/${BPN}/patches
> > --
> > 2.7.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aZoGpuMECXJckB41
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbPdzYACgkQN1Ujt2V2gBxY0QCfZ7lv/o2efe4x7nRbTy7R+7nj
Mz0An2VJ1pk8jO/pclsGqL/j00rXil3R
=nfjA
-----END PGP SIGNATURE-----

--aZoGpuMECXJckB41--
