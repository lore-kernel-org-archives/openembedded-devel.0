Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id E5E6E74056
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 12:39:47 +0000 (UTC)
Received: by widdi4 with SMTP id di4so196701452wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Ci8NGHZ2g0r3j2kurzU3Hb4Gwx6shekNUzRqc/vGCf0=;
	b=LG+gvNoXGkAaS3sjGKQNs2BSrW7HDogg3p8BN+rvlWUyONELJ1S2rMPpocBSOFG/8Z
	j/4+hxvvslbb9kzi2Z69MktNNSTnlFvDM3A1KjUasV0gWJy+O1iyRKKatjMnLsXqL7A9
	aw5/HUEWRf2MyjbylJpSYFT3NquwyrwdFBbhZfZ4mCRKPy2mNdBqB02H9MbBgv9a/6BH
	TZATkrxPKiUzCAPAG7ad2qeKUW+eeOqXO5zVlVVS56ogKPpVOvUi4jvrzt1yzSckpvCi
	VCHfcAUz4jEbPhEWTxFrCwkdpuJmXldW7OgBmfoOGBtB4IMhksG0K2hhzUJbhrjsnwKv
	ibfA==
X-Received: by 10.180.189.42 with SMTP id gf10mr8342986wic.39.1431520788484;
	Wed, 13 May 2015 05:39:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id nb9sm7890339wic.10.2015.05.13.05.39.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 05:39:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 May 2015 14:39:57 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150513123957.GB2411@jama>
References: <55532B2B.8050209@dev.rtsoft.ru>
 <555338B0.5060401@gmail.com>
MIME-Version: 1.0
In-Reply-To: <555338B0.5060401@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH]
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
X-List-Received-Date: Wed, 13 May 2015 12:39:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2015 at 02:42:40PM +0300, Andrey Rusalin wrote:
>=20
>=20

Missing SOB line and patchwork doesn't pick forwarded inline patches
correctly.

I've fixed both when cherry-picking to master-next, but please reply that y=
ou agree with your SOB.

>=20
> -------- Forwarded Message --------
> Subject: 	[meta-qt5][PATCH]
> Date: 	Wed, 13 May 2015 13:44:59 +0300
> From: 	arusalin <arusalin@dev.rtsoft.ru>
> To: 	openembedded-devel@lists.openembedded.org
>=20
>=20
>=20
> --=20
> Best Regards,
> Andrey Rusalin.
>=20
>=20
>=20
>=20

> From 7040c6382af3d99f53b3f9fa45336cb911438923 Mon Sep 17 00:00:00 2001
> From: Andrey Rusalin <arusalin@dev.rtsoft.ru>
> Date: Wed, 13 May 2015 14:25:42 +0400
> Subject: [PATCH] Fixed dependency for sql-mysql option of qtbase package
>=20
> ---
>  recipes-qt/qt5/qtbase.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 50cb505..d2654ef 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -84,7 +84,7 @@ PACKAGECONFIG[cups] =3D "-cups,-no-cups,cups"
>  PACKAGECONFIG[dbus] =3D "-dbus,-no-dbus,dbus"
>  PACKAGECONFIG[xcb] =3D "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-ut=
il-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
>  PACKAGECONFIG[sql-ibase] =3D "-sql-ibase,-no-sql-ibase"
> -PACKAGECONFIG[sql-mysql] =3D "-sql-mysql,-no-sql-mysql,mysql"
> +PACKAGECONFIG[sql-mysql] =3D "-sql-mysql,-no-sql-mysql,mysql5"
>  PACKAGECONFIG[sql-psql] =3D "-sql-psql,-no-sql-psql,postgresql"
>  PACKAGECONFIG[sql-odbc] =3D "-sql-odbc,-no-sql-odbc"
>  PACKAGECONFIG[sql-oci] =3D "-sql-oci,-no-sql-oci"
> --=20
> 1.9.1
>=20
>=20

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

