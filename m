Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 533E66080F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 03:01:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6M31834025721
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 20:01:08 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.195]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Thu, 21 Jul 2016 20:01:07 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH][meta-oe] minicoredumper: add the recipe
Thread-Index: AQHRlJqFpLnuQ0tK1UasRv6BMgC5q6AkYLPw
Date: Fri, 22 Jul 2016 03:01:06 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA01310036B1@ALA-MBA.corp.ad.wrs.com>
References: <1459318294-8974-1-git-send-email-rongqing.li@windriver.com>
	<20160412090710.GC2564@jama>
In-Reply-To: <20160412090710.GC2564@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.132]
MIME-Version: 1.0
Subject: Re: [PATCH][meta-oe] minicoredumper: add the recipe
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
X-List-Received-Date: Fri, 22 Jul 2016 03:01:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Tuesday, April 12, 2016 5:07 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH][meta-oe] minicoredumper: add the recipe
>=20
> On Wed, Mar 30, 2016 at 02:11:34PM +0800, rongqing.li@windriver.com wrote=
:
> > From: Roy Li <rongqing.li@windriver.com>
> >
> > minicoredumper provides an alternate core dump facility for Linux
> > to allow minimal and customized crash dumps
> >
> > Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > ---
> >  .../minicoredumper/files/minicoredumper.service    |  9 ++++++++
> >  .../minicoredumper/minicoredumper_1.0.2.bb         | 24 ++++++++++++++=
++++++++
> >  2 files changed, 33 insertions(+)
> >  create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/minicor=
edumper.service
> >  create mode 100644 meta-oe/recipes-kernel/minicoredumper/minicoredumpe=
r_1.0.2.bb
> >
> > diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper=
.service b/meta-
> oe/recipes-kernel/minicoredumper/files/minicoredumper.service
> > new file mode 100644
> > index 0000000..161ce88
> > --- /dev/null
> > +++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.servic=
e
> > @@ -0,0 +1,9 @@
> > +[Unit]
> > +Description=3DEnable minicoredumper.
> > +
> > +[Service]
> > +Type=3Doneshot
> > +ExecStart=3D/bin/sh -c '/bin/echo "|/usr/bin/minicoredumper %%p %%u %%=
g %%s %%t %%h %%e" >
> /proc/sys/kernel/core_pattern'
> > +
> > +[Install]
> > +WantedBy=3Dmulti-user.target
> > diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2=
.bb b/meta-oe/recipes-
> kernel/minicoredumper/minicoredumper_1.0.2.bb
> > new file mode 100644
> > index 0000000..6b55732
> > --- /dev/null
> > +++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
> > @@ -0,0 +1,24 @@
> > +SUMMARY =3D "minicoredumper provides an alternate core dump facility f=
or Linux \
> > +to allow minimal and customized crash dumps"
> > +LICENSE =3D " LGPLv2.1 & BSD"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D45445387350de96a0e70410470e=
e5cab"
> > +DEPENDS =3D "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-li=
nux"
> > +
> > +inherit autotools pkgconfig systemd
> > +
> > +SRC_URI =3D "https://linutronix.de/${BPN}/files/${BPN}-${PV}.tar.gz \
> > +           file://minicoredumper.service \
> > +"
> > +SRC_URI[md5sum] =3D "5ba9d116b52a8e2fb93456260644e753"
> > +SRC_URI[sha256sum] =3D
> "1b0eeb3d70dbd2ad6f2f673e4e3446e5dd784e132730e21d8f9dc0977e47dd9a"
> > +
> > +SYSTEMD_SERVICE_${PN} =3D "minicoredumper.service"
> > +SYSTEMD_AUTO_ENABLE =3D "enable"
> > +
> > +do_install_append() {
> > +	install -d ${D}/${sysconfdir}/minicoredumper
> > +	cp -rf ${S}/etc/* ${D}/${sysconfdir}/
> > +
> > +	install -d ${D}${systemd_unitdir}/system
> > +	install -m 0644 ${WORKDIR}/minicoredumper.service ${D}${systemd_unitd=
ir}/system
>=20
> Use 4 spaces for indentation.

I'm taking care this of and sent a v2 with the following changes:

- Use 4 spaces for indentation
- Add sysv init script
- Use ${systemd_system_unitdir} instead of ${systemd_unitdir}/system

Thanks,
Jackie

>=20
> > +}
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

