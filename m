Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id D93976FFED
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 11:53:45 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2IBrkaL031453; Fri, 18 Mar 2016 06:53:46 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031806534668-1538613 ;
	Fri, 18 Mar 2016 06:53:46 -0500 
Date: Fri, 18 Mar 2016 13:53:14 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160318135314.0cce70c1@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <20160318114948.GA2555@jama>
References: <614cbca3bdce23c4c67f78eab893a21ef6a50663.1458230028.git.adrian.ratiu@ni.com>
	<5663cbe1f0256f5eec13f90acd9b2373932dbbc5.1458230028.git.adrian.ratiu@ni.com>
	<20160317214118.GH2553@jama>
	<20160318104056.4a245741@adi-pc-linux.emea.corp.natinst.com>
	<20160318114948.GA2555@jama>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/18/2016 06:53:46 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/18/2016 06:53:46 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-18_07:, , signatures=0
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
X-List-Received-Date: Fri, 18 Mar 2016 11:53:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Mar 2016 12:49:48 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Mar 18, 2016 at 10:40:56AM +0200, Ioan-Adrian Ratiu wrote:
> > Hello
> >=20
> > On Thu, 17 Mar 2016 22:41:18 +0100
> > Martin Jansa <martin.jansa@gmail.com> wrote:
> >  =20
> > > On Thu, Mar 17, 2016 at 05:54:35PM +0200, Ioan-Adrian Ratiu wrote: =20
> > > > From: Haris Okanovic <haris.okanovic@ni.com>
> > > >=20
> > > > The apache-websocket module is an Apache 2.x server module that may=
 be
> > > > used to process requests using the WebSocket protocol (RFC 6455) by=
 an
> > > > Apache 2.x server. The module consists of a plugin architecture for
> > > > handling WebSocket messaging.   =20
> > >=20
> > > does v2 fix hits?
> > >=20
> > > | checking for libtool... no
> > > | configure: error: could not find an installed libtool
> > > | NOTE: The following config.log files may provide further informatio=
n.
> > > | NOTE:
> > > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnuea=
bi/apache-websocket/1.1.1-r0/git/config.log
> > >=20
> > > ? =20
> >=20
> > v2 fixes just the version number for apache-websocket. I'm not seeing t=
hat error on my machine:
> >=20
> > (...)
> > checking for apachectl... /media/adi/ssd/nilrt-master/build/tmp-glibc/s=
ysroots/x64/usr/sbin/apachectl
> > checking for httpd... /media/adi/ssd/nilrt-master/build/tmp-glibc/sysro=
ots/x86=5F64-linux/usr/bin/httpd
> > checking for libtool... /usr/bin/libtool =20
>=20
> That build machine doesn't even have /usr/bin/libtool, you should use
> libtool provided by libtool-cross recipe.

Ok. I'll make some time today to fix this and send v3.

>=20
> > checking for the httpd modules directory... /usr/lib/apache2/modules
> > (...)
> >=20
> > Is there some kind of host contamination going on here?
> >  =20
> > >  =20
> > > >=20
> > > > Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> > > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > > ---
> > > >  .../apache-mod/apache-websocket=5Fgit.bb             | 32 ++++++++=
++++++++++++++
> > > >  1 file changed, 32 insertions(+)
> > > >  create mode 100644 meta-webserver/recipes-httpd/apache-mod/apache-=
websocket=5Fgit.bb
> > > >=20
> > > > diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websock=
et=5Fgit.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket=5Fgi=
t.bb
> > > > new file mode 100644
> > > > index 0000000..2cfc1f3
> > > > --- /dev/null
> > > > +++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket=5Fgi=
t.bb
> > > > @@ -0,0 +1,32 @@
> > > > +SUMMARY =3D "Websocket module for Apache web server"
> > > > +DESCRIPTION =3D "Process requests using the WebSocket protocol (RF=
C 6455)"
> > > > +HOMEPAGE =3D "https://github.com/jchampio/${PN}/"
> > > > +SECTION =3D "net"
> > > > +LICENSE =3D "Apache-2.0"
> > > > +
> > > > +inherit autotools-brokensep pkgconfig
> > > > +
> > > > +DEPENDS =3D "apache2 apache2-native"
> > > > +RDEPENDS=5F${PN} +=3D "apache2"
> > > > +
> > > > +# Original (github.com/disconnect/apache-websocket) is dead since =
2012, the
> > > > +# fork contains patches from the modules ML and fixes CVE complian=
ce issues
> > > > +SRC=5FURI =3D "git://github.com/jchampio/apache-websocket.git"
> > > > +
> > > > +SRCREV =3D "f5230d8c520dccf8631da94bf90c23f3c1100dcc"
> > > > +
> > > > +PV =3D "0.1.1"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +LIC=5FFILES=5FCHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dc=
e33e26468ba93"
> > > > +
> > > > +EXTRA=5FOECONF =3D "APACHECTL=3D${STAGING=5FDIR=5FTARGET}${sbindir=
}/apachectl"
> > > > +
> > > > +do=5Finstall() {
> > > > +    install -d ${D}${libdir}/apache2/modules/
> > > > +    install ${B}/.libs/mod=5Fwebsocket.so ${D}${libdir}/apache2/mo=
dules/
> > > > +}
> > > > +
> > > > +FILES=5F${PN} +=3D " ${libdir}/apache2/modules/* "
> > > > +FILES=5F${PN}-dbg +=3D " ${libdir}/apache2/modules/.debug/* "
> > > > --=20
> > > > 2.7.3
> > > >    =20
> > >  =20
> >  =20
>=20


