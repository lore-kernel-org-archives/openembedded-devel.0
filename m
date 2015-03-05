Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5429965C7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:03:57 +0000 (UTC)
Received: by wivr20 with SMTP id r20so7032421wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 06:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YQkjI6vS2v6ZSTi8DTdKxRgoJGN4Fz6A7zwucOUA994=;
	b=TMJ3kDqAG2AWtWfG+pQyNh9JSTFt2KJ63Ki468VTcfQdkZhwplFBcNSdFoJrBhd0L9
	9Oc3QoChIaipsq00ky5LTEBcntvBLrq1BjzdroN1qTUNHvCeI7KyouL7hK9syIVfq6oX
	Pq9LwLwPDprQEQqZjtsgu7DNZjZMmxLZYPaWCWlrGduNoKjdDuQe6nbfAmn4AlnERdRo
	DKyi/M9jJYEJBC0zGB419vk/e4MWNXdrD17x1nmyxlf2PEOpneBTfEUsStgs+LwOp3UD
	7Yf1/twFPFOCsJAgQLHwTWsSSJbDnWkGQegoGiZyy3dRAA0RuOzO2pwJl1fXbPJ5Duw8
	/JSw==
X-Received: by 10.180.208.74 with SMTP id mc10mr66439880wic.38.1425564238945; 
	Thu, 05 Mar 2015 06:03:58 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	vq9sm9063815wjc.6.2015.03.05.06.03.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 06:03:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 15:04:03 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150305140403.GR2337@jama>
References: <20150303182827.GC2337@jama>
	<1425411609-21528-1-git-send-email-Martin.Jansa@gmail.com>
	<20150304022546.GG2337@jama> <3137890.DjIWZ5FYZB@fridolin>
MIME-Version: 1.0
In-Reply-To: <3137890.DjIWZ5FYZB@fridolin>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCHv2] fix build of qtwebengine if qtbase has no accessibility
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
X-List-Received-Date: Thu, 05 Mar 2015 14:03:58 -0000
X-Groupsio-MsgNum: 54645
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e9fMjeYs+GPci+mg"
Content-Disposition: inline

--e9fMjeYs+GPci+mg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2015 at 09:47:23AM +0100, Stephan Binner wrote:
> On Wednesday 04 March 2015 03:25:46 Martin Jansa wrote:
>=20
> > > ++else
> > This doesn't look right and also fails to build.
>=20
> Yeah, dunno how I messed that up yesterday evening. :-/

I've sent additional patch to fix building with accessibility enabled.

Please get it merged in upstream, because your patch seems to be broken
in upstream 5.4 as well.

Regards,

> I will try to get the backport reviewed and integrated into 5.4 branch=20
> upstream and then will post patch with proper branch annotation etc.
>=20
> Regards,
> Stephan
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--e9fMjeYs+GPci+mg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4YlMACgkQN1Ujt2V2gBzypACcDQfLgeK3rmFUm0F3ge52VE3e
7iYAmwe1fbGMS+qQZsy9z7vrp9/ZyJNk
=5vce
-----END PGP SIGNATURE-----

--e9fMjeYs+GPci+mg--
