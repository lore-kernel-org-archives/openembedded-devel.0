Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id D80887169F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 17:21:07 +0000 (UTC)
Received: by wgen6 with SMTP id n6so35831955wge.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=gDEfgvswAoDwFofSSO6fVrQ5x5sCV6f7K32VYX9NcLY=;
	b=sZP2ItD0ZEY039DfRlsAJlcwxJYwCidpd4+H+ooN4rRa0aSZloyo2yVsm4Uptx+V7B
	TpjoxhQyT6sV8n47Wzm/dwLRHCD+0/Z/Npn0/Q8GvuYQWdIcNy3XQxVR8BZ2ZXaXVTYu
	bNwkEHcEuMBjI8xI4tL0jVThZTZdVmo7rWW6WlNMlc7IZQct0VRdpoNXhlA67P/jvo9B
	eFqyAWSNabqAaUCRrk9iJxAtV1kBFtcy/AnD0UjxU9PAbl+xhUGX5XhS8oeszi9QmHwB
	+RdSIcWBhvtC59TXtP0210t5RWKiCeikawkHXE/APpcK2DxHBGeKdknMCkirHid9cNDs
	w1SA==
X-Received: by 10.194.83.39 with SMTP id n7mr181646wjy.65.1430328068198;
	Wed, 29 Apr 2015 10:21:08 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	xb3sm35408813wjc.38.2015.04.29.10.21.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Apr 2015 10:21:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Apr 2015 19:21:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150429172116.GC2369@jama>
References: <20150429142718.GA2369@jama>
	<1041545773.3837422.1430325277784.JavaMail.root@openwide.fr>
MIME-Version: 1.0
In-Reply-To: <1041545773.3837422.1430325277784.JavaMail.root@openwide.fr>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Wed, 29 Apr 2015 17:21:08 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2015 at 06:34:37PM +0200, Alexis Cellier wrote:
>=20
>=20
> ----- Mail original -----
> > De: "Martin Jansa" <martin.jansa@gmail.com>
> > =C0: openembedded-devel@lists.openembedded.org
> > Envoy=E9: Mercredi 29 Avril 2015 16:27:18
> > Objet: Re: [oe] [meta-qt5][PATCH] qmake5_base.bbclass: fix typo
> >=20
> > On Tue, Apr 28, 2015 at 04:12:27PM +0200, Alexis Cellier wrote:
> > > In the qt.conf file created, fix typo on "TargetSpec" (was
> > > "TartgetSpec").
> >=20
> > How was this tested before sending?
>=20
> Oh sorry, I've missed that I've also had a change in the file
> qtbase.inc:
>  # qtbase is exception, we need to use mkspecs from ${S}
> -QMAKE_MKSPEC_PATH =3D "${B}"
> +QMAKE_MKSPEC_PATH =3D "${S}"
>=20
> You want me to make a second patch or a new patch (or nothing)?

nothing, I'll amend your patch with this change before sending it for
another round of jenkins builds, thanks

Does the same apply for nativesdk-qtbase.inc?

>=20
> > In my builds it causes:
> > | Cannot read
> > | /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.4.1+gitAUTOIN=
C+f58e882b75-r0/build/mkspecs/linux-oe-g++/qmake.conf:
> > | No such file or directory
> > | Could not read qmake configuration file
> > | /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.4.1+gitAUTOIN=
C+f58e882b75-r0/build/mkspecs/linux-oe-g++/qmake.conf.
> >=20
> > So I agree it's a typo, but if we cannot make it work, then we should
> > remove the line completely.
>=20
> It is needed for qmake project that does not used qt (it's how
> I found the typo). About this, it seems that when you don't
> install qtbase, you don't have the mkspecs in the libdir, so=20
> you need to override the mkspecs path by the native mkspecs
> path, as you only have built qtbase-native (added by
> qmake5.bbclass). But I should open another thread for this,
> when I'll be sure about this.
>=20
> > >=20
> > > Signed-off-by: Alexis Cellier <alexis.cellier@openwide.fr>
> > > ---
> > >  classes/qmake5_base.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/classes/qmake5_base.bbclass
> > > b/classes/qmake5_base.bbclass
> > > index 44575c4..dbdaf78 100644
> > > --- a/classes/qmake5_base.bbclass
> > > +++ b/classes/qmake5_base.bbclass
> > > @@ -79,7 +79,7 @@ HostBinaries =3D ${OE_QMAKE_PATH_HOST_BINS}
> > >  HostData =3D ${OE_QMAKE_PATH_HOST_DATA}
> > >  HostLibraries =3D ${OE_QMAKE_PATH_HOST_LIBS}
> > >  HostSpec =3D ${OE_QMAKESPEC}
> > > -TartgetSpec =3D ${OE_XQMAKESPEC}
> > > +TargetSpec =3D ${OE_XQMAKESPEC}
> > >  ExternalHostBinaries =3D ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
> > >  Sysroot =3D ${STAGING_DIR_TARGET}
> > >  EOF
> > > --
> > > 2.3.5
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
>=20
> --=20
> Alexis Cellier
> OpenWide Ing=E9nierie
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

