Return-Path: <lchristina26@hotmail.com>
Received: from BAY004-OMC4S19.hotmail.com (bay004-omc4s19.hotmail.com
	[65.54.190.221])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE4560B05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 21:19:11 +0000 (UTC)
Received: from BAY168-W43 ([65.54.190.199]) by BAY004-OMC4S19.hotmail.com with
	Microsoft SMTPSVC(7.5.7601.22712); Wed, 13 Aug 2014 14:19:13 -0700
X-TMN: [w95wWpx4bxyi4cAwh5peXugo+DxHUxYV]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BAY168-W436E95B6FB906F1EE0D722D6EB0@phx.gbl>
From: LC Mac <lchristina26@hotmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Aug 2014 15:19:12 -0600
Importance: Normal
In-Reply-To: <20140813211436.GA14848@jama>
References: <BLU436-SMTP223AFD3FCC0CB7D577EB9D6D6EA0@phx.gbl>,
	<20140812221225.GT14848@jama>,
	<BAY168-W105F8D49A2D581CB059AAD5D6EB0@phx.gbl>,
	<20140813211436.GA14848@jama>
MIME-Version: 1.0
X-OriginalArrivalTime: 13 Aug 2014 21:19:13.0039 (UTC)
	FILETIME=[3ADB11F0:01CFB73C]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] Submitting cyassl recipe
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
X-List-Received-Date: Wed, 13 Aug 2014 21:19:13 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I should've looked up one line. Thanks!

From: martin.jansa@gmail.com
Date: Wed=2C 13 Aug 2014 23:14:36 +0200
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH v2] Submitting cyassl recipe for consider=
ation in being added to meta-oe/meta-networking/recipes-connectivity. Cyass=
l is a lightweight=2C embedded SSL/TLS library. For more information: www.w=
olfssl.com. The cyassl recipe is a fully

On Wed=2C Aug 13=2C 2014 at 02:53:19PM -0600=2C LC Mac wrote:
> Hi Martin=2C=20
>=20
> I'm a bit confused by the line cyassl-${PV} -> ${BP}.=20
=20
cyassl-${PV} =3D=3D ${BP}
=20
so please replace "cyassl-${PV} with ${BP}
=20
> Could you explain that? When you say drop the S assignment=2C do you mean=
=20
> delete the entire line or leave the line like this:=20
> ${WORKDIR}/${PN}-${PV}? I cannot get the recipe to build with any of the
>  proposed changes.=20
=20
"${WORKDIR}/${PN}-${PV}" is default value=2C drop whole line=2C because it'=
s
unnecessary
=20
>=20
>=20
> Thanks=2C
>=20
> Leah
>=20
> From: martin.jansa@gmail.com
> Date: Wed=2C 13 Aug 2014 00:12:25 +0200
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v2] Submitting cyassl recipe for consid=
eration in being added to meta-oe/meta-networking/recipes-connectivity. Cya=
ssl is a lightweight=2C embedded SSL/TLS library. For more information: www=
.wolfssl.com. The cyassl recipe is a fully functional bb file tested with t=
he YoctoProject.
>=20
> On Tue=2C Aug 12=2C 2014 at 01:42:39PM -0600=2C lchristina26 wrote:
> > Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
> > ---
> >  .../recipes-connectivity/cyassl/cyassl_3.1.0.bb     | 21 +++++++++++++=
++++++++
> >  1 file changed=2C 21 insertions(+)
> >  create mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_=
3.1.0.bb
> >=20
> > diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.b=
b b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > new file mode 100644
> > index 0000000..441d321
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > @@ -0=2C0 +1=2C21 @@
> > +SUMMARY =3D "CyaSSL Embedded SSL Library"
> > +DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C and =
\
> > +               optimized for embedded and RTOS environments. It can be=
 \
> > +               Up to 20 times smaller than OpenSSL while still support=
ing \
> > +               a full TLS 1.2 client and server."
> > +HOMEPAGE =3D "http://www.yassl.com/yaSSL/Products-cyassl.html"
> > +BUGTRACKER =3D "http://github.com/cyassl/cyassl/issues"
> > +SECTION =3D "libs/network"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING=3Bmd5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
> > +
> > +SRC_URI =3D "http://www.yassl.com/cyassl-${PV}.zip"
> =20
> cyassl-${PV} -> ${BP}
> =20
> > +
> > +
> > +SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> > +SRC_URI[sha256sum] =3D "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2=
adc16d2507b5d0b03e"
> > +
> > +S =3D "${WORKDIR}/${PN}-${PV}"
> =20
> This is default value=2C drop S assignment
> =20
> > +
> > +inherit autotools
> > +
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> =20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel 		 	   =
		 =20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
=20
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

-- =0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel 		 	   		=
  =

