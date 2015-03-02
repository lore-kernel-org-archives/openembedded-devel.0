Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB0471F1B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 11:33:02 +0000 (UTC)
Received: by wggz12 with SMTP id z12so32852380wgg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 03:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WkZhk2c3KBqxoEGp8W9US3gQNibo4DHal30RL2ert+M=;
	b=PCaF+Za8/n5OyAgq4FUqMggzpTzqYjdAVia0gi8/HRMmuf9xW7qbLnpGsdnWOBMuF1
	LXhbwMIkHM//JvKPhZbx+N8Qq+B3zV4yE6pHcgwEs7aDZbUa0yw2A71poE7i9mRyNx6D
	H916IMXtgcytBM6/GXJ+RCcWfRYPUXmYxlpVRnRSxZFijuYXeizHFsAmtb/cFTsbjPOg
	mbKZ+EHu+xoqRNATB/Iq49wHHCgTlBf96lvkYVXemQfnfucQ6yslAKUuW+F9T0rkUiYe
	nt33onRFWVmR0CHvuJq6NpwpnqNYsadaygz7pqU0SIL8McrsyvdzYKmx/B3Wvkvafcyf
	dCmA==
X-Received: by 10.194.204.131 with SMTP id ky3mr41620259wjc.95.1425295982894; 
	Mon, 02 Mar 2015 03:33:02 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ka1sm18876372wjc.2.2015.03.02.03.33.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 03:33:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Mar 2015 12:33:25 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150302113325.GA2309@jama>
References: <1425283365-19326-1-git-send-email-Martin.Jansa@gmail.com>
	<54F439E6.3010906@dominion.thruhere.net>
	<20150302102611.GY2309@jama> <54F441BA.7090602@kernelconcepts.de>
MIME-Version: 1.0
In-Reply-To: <54F441BA.7090602@kernelconcepts.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: import recipe from meta-luneos
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
X-List-Received-Date: Mon, 02 Mar 2015 11:33:07 -0000
X-Groupsio-MsgNum: 54581
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GD+uNaHYxbVPHaQt"
Content-Disposition: inline

--GD+uNaHYxbVPHaQt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2015 at 11:55:54AM +0100, Florian Boor wrote:
> Hi,
>=20
> On 02.03.2015 11:26, Martin Jansa wrote:
> >> Please don't ever RDEPEND on kernel modules, even when the recipe will=
=20
> >> build them, it sets a bad precedent.
>=20
> > I think it makes sense in this case.. nobody will ever include them in=
=20
> > kernel image and vboxguestdrivers utils don't make much sense without t=
he=20
> > modules installed.
>=20
> I see its unlikely but in some cases (e.g. highly secure environments) yo=
u do
> not want to use modules at all. So unless there is a real need to depend =
on
> the modules I would just recommend it.

In such environment you won't be installing vboxguestdrivers package, right?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GD+uNaHYxbVPHaQt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT0SoUACgkQN1Ujt2V2gBw3HwCgl0zX6abEO8rVWTayJN95Xl1D
CnAAoJ0gD4Fdb8lgEyJ7GRnCXK6X+pIa
=9QkJ
-----END PGP SIGNATURE-----

--GD+uNaHYxbVPHaQt--
