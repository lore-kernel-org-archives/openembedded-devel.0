Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id A961D72D64
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 10:33:33 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so106190480wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=upK6953LKlOI+/xHzIJ6HaUcH+TIGfFizSWe/LKR9DI=;
	b=kAS8ISc6lXn580YXttvCDOhy07STNMgLofv0bmnASFSrQciyCQMEd2/RQ2G5iHR610
	6nKKRCHsoopX26WaNt1geEuCui3SllwKojF1GVHAokZcHRE/UZO8FVJO5zErbzwV+AAQ
	Zy6ulKdd6VeVM8caQl0LWnAiXjqIKRF1etjG8ZGvmZXPM6ZgfY4JbbRO3oGp/2vs72QP
	h+IKBGK35PQ3Ur27gss9/J/6y/1mZ9wiEWXa0Q0RrOM7Gsp9f9+nRGEFxzGZi5PzahAd
	MS0ro15IRdlHBDwVikV/E4dSnPrMn9pKeObg42XlSARraUA0OKlG7zRvSghC+ZWqdE1M
	QdrQ==
X-Received: by 10.194.95.2 with SMTP id dg2mr58384178wjb.53.1432722814324;
	Wed, 27 May 2015 03:33:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id l3sm2938119wik.16.2015.05.27.03.33.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 May 2015 03:33:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 May 2015 12:33:49 +0200
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20150527103349.GA3683@jama>
References: <1431771255-20841-1-git-send-email-max.oss.09@gmail.com>
	<1432661286.2291.4.camel@Saturn.local.all>
MIME-Version: 1.0
In-Reply-To: <1432661286.2291.4.camel@Saturn.local.all>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH] florence: use ${SOURCEFORGE_MIRROR} in SRC_URI
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
X-List-Received-Date: Wed, 27 May 2015 10:33:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2015 at 07:28:06PM +0200, Max Krummenacher wrote:
> Hi all
>=20
> Ping.

Sorry, wasn't noticed, because patchwork didn't pick it:
http://patchwork.openembedded.org/project/oe/list/?state=3D*&q=3Dflorence&a=
rchive=3Dboth

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7657

> florence do_fetch currently fails because the server can't be found.
>=20
> Regards
> Max
>=20
> Am Samstag, den 16.05.2015, 12:14 +0200 schrieb Max Krummenacher:
> > http://switch.dl.sourceforge.net has been down for some time.
> > Use the OE provided mirror variable instead.
> >=20
> > Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> > ---
> >  meta-gnome/recipes-support/florence/florence_0.5.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta-gnome/recipes-support/florence/florence_0.5.1.bb b/me=
ta-gnome/recipes-support/florence/florence_0.5.1.bb
> > index 9eab385..71014f0 100644
> > --- a/meta-gnome/recipes-support/florence/florence_0.5.1.bb
> > +++ b/meta-gnome/recipes-support/florence/florence_0.5.1.bb
> > @@ -10,7 +10,7 @@ PR =3D "r1"
> > =20
> >  DEPENDS =3D "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltoo=
l-native gnome-doc-utils libnotify"
> > =20
> > -SRC_URI =3D "http://switch.dl.sourceforge.net/project/florence/florenc=
e/0.5.1/florence-0.5.1.tar.bz2 \
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/florence/florence/${PV}/florence-${=
PV}.tar.bz2 \
> >             file://0001-Fix-glib-includes.patch"
> >  SRC_URI[md5sum] =3D "56d12e5b47c100d9df172aa5ddc0f609"
> >  SRC_URI[sha256sum] =3D "7b06ed84ef2b7b22d8d2cf0c7d013a05409bd82028240a=
c8719a68b192d5bc62"
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

