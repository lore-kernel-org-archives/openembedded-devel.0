Return-Path: <alexis.cellier@openwide.fr>
Received: from zimbra3.corp.accelance.fr (zimbra3.corp.accelance.fr
	[213.162.49.233])
	by mail.openembedded.org (Postfix) with ESMTP id 777B9738EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 16:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by zimbra3.corp.accelance.fr (Postfix) with ESMTP id B3BE27CCF9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 18:34:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra3.corp.accelance.fr
Received: from zimbra3.corp.accelance.fr ([127.0.0.1])
	by localhost (zimbra3.corp.accelance.fr [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id FXk4PXqs8+xq
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 18:34:37 +0200 (CEST)
Received: from zimbra2.corp.accelance.fr (zimbra2.corp.accelance.fr
	[213.162.49.232])
	by zimbra3.corp.accelance.fr (Postfix) with ESMTP id DE7457CCB9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 18:34:37 +0200 (CEST)
Date: Wed, 29 Apr 2015 18:34:37 +0200 (CEST)
From: Alexis Cellier <alexis.cellier@openwide.fr>
To: openembedded-devel@lists.openembedded.org
Message-ID: <1041545773.3837422.1430325277784.JavaMail.root@openwide.fr>
In-Reply-To: <20150429142718.GA2369@jama>
MIME-Version: 1.0
X-Originating-IP: [81.56.46.209]
X-Mailer: Zimbra 7.2.6_GA_2926 (ZimbraWebClient - FF3.0 (Linux)/7.2.6_GA_2926)
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: fix typo
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
X-List-Received-Date: Wed, 29 Apr 2015 16:34:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



----- Mail original -----
> De: "Martin Jansa" <martin.jansa@gmail.com>
> =C3=80: openembedded-devel@lists.openembedded.org
> Envoy=C3=A9: Mercredi 29 Avril 2015 16:27:18
> Objet: Re: [oe] [meta-qt5][PATCH] qmake5_base.bbclass: fix typo
>=20
> On Tue, Apr 28, 2015 at 04:12:27PM +0200, Alexis Cellier wrote:
> > In the qt.conf file created, fix typo on "TargetSpec" (was
> > "TartgetSpec").
>=20
> How was this tested before sending?

Oh sorry, I've missed that I've also had a change in the file
qtbase.inc:
 # qtbase is exception, we need to use mkspecs from ${S}
-QMAKE_MKSPEC_PATH =3D "${B}"
+QMAKE_MKSPEC_PATH =3D "${S}"

You want me to make a second patch or a new patch (or nothing)?

> In my builds it causes:
> | Cannot read
> | /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.4.1+gitAUTOINC+=
f58e882b75-r0/build/mkspecs/linux-oe-g++/qmake.conf:
> | No such file or directory
> | Could not read qmake configuration file
> | /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.4.1+gitAUTOINC+=
f58e882b75-r0/build/mkspecs/linux-oe-g++/qmake.conf.
>=20
> So I agree it's a typo, but if we cannot make it work, then we should
> remove the line completely.

It is needed for qmake project that does not used qt (it's how
I found the typo). About this, it seems that when you don't
install qtbase, you don't have the mkspecs in the libdir, so=20
you need to override the mkspecs path by the native mkspecs
path, as you only have built qtbase-native (added by
qmake5.bbclass). But I should open another thread for this,
when I'll be sure about this.

> >=20
> > Signed-off-by: Alexis Cellier <alexis.cellier@openwide.fr>
> > ---
> >  classes/qmake5_base.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/classes/qmake5_base.bbclass
> > b/classes/qmake5_base.bbclass
> > index 44575c4..dbdaf78 100644
> > --- a/classes/qmake5_base.bbclass
> > +++ b/classes/qmake5_base.bbclass
> > @@ -79,7 +79,7 @@ HostBinaries =3D ${OE_QMAKE_PATH_HOST_BINS}
> >  HostData =3D ${OE_QMAKE_PATH_HOST_DATA}
> >  HostLibraries =3D ${OE_QMAKE_PATH_HOST_LIBS}
> >  HostSpec =3D ${OE_QMAKESPEC}
> > -TartgetSpec =3D ${OE_XQMAKESPEC}
> > +TargetSpec =3D ${OE_XQMAKESPEC}
> >  ExternalHostBinaries =3D ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
> >  Sysroot =3D ${STAGING_DIR_TARGET}
> >  EOF
> > --
> > 2.3.5
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20

--=20
Alexis Cellier
OpenWide Ing=C3=A9nierie

