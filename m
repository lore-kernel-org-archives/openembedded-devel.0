Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 35F276CDCB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:51:13 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so420414eaj.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2013 02:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lBQdLSSIlFv1IodQAVfFYS0+naFNyfMqiRmziJYYfdQ=;
	b=FVF/TBmaDFWSz8huMQ0E58Qq/PAXmq+9n5+kj/SwBL5N592FUu/mfcHAcGqNynWd18
	FcVOQZ1Y9n0vo6EZlU0zA/41jfH/syfJRDHB92/McAOq9puvadbrbMgrHzBMYjzcH4TB
	neY3ec2cY24qUbUpEpJXLPOwQ5kuwp5LtfjuYWe5QNKya0BX+HXnGITLnLCYeRjtrkDH
	/KtDne5ZkJmXIIbfGqz922KhhUlqLrc+YCsMXAwxtFFBQg6+4n7GOVqhYmwpAG8gqjuZ
	RXQNkTQBQDacOPYkgfCYVUEnvxbufsua2J8Cw8tHYPFW1PB7S4n/utNJujKbQeydba7k
	P9aw==
X-Received: by 10.14.172.133 with SMTP id t5mr15786171eel.35.1385117471904;
	Fri, 22 Nov 2013 02:51:11 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a45sm60059908eem.6.2013.11.22.02.51.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Nov 2013 02:51:11 -0800 (PST)
Date: Fri, 22 Nov 2013 11:51:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131122105117.GB3708@jama>
References: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
	<20131121123904.GX3708@jama>
	<CAP71WjxW7KZp3D+gTEGV2ZzDfwPhwxqLUP5qw4Rj4XN_z1=cQA@mail.gmail.com>
	<20131121173050.GA3708@jama>
	<1385109648.23183.38.camel@bril0118.bri.st.com>
MIME-Version: 1.0
In-Reply-To: <1385109648.23183.38.camel@bril0118.bri.st.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: making qt5 package machine specific
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
X-List-Received-Date: Fri, 22 Nov 2013 10:51:14 -0000
X-Groupsio-MsgNum: 47237
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jE+K4o1MICf3EEet"
Content-Disposition: inline

--jE+K4o1MICf3EEet
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2013 at 08:40:48AM +0000, Andr=E9 Draszik wrote:
> Hi Martin,
>=20
> On Thu, 2013-11-21 at 18:30 +0100, Martin Jansa wrote:
> > Ah one more comment.
> >=20
> > qmake5_base.bbclass doesn't look like best place for it.
> >=20
> > I guess you have only target qtbase being MACHINE_ARCH, right?
>=20
> Everything that was built using the previously configured qtbase, e.g.
> qtwebkit - see below.
>=20
> > qmake5_base.bbclass can be inherited by many packages which are
> > TUNE_PKGARCH and don't use (depend) on target qtbase at all, so
> > QMAKE_PACKAGE_ARCH would be used in more recipes then where it's really
> > needed.
>=20
> I don't know enough about qmake, but my thinking is that qmake will
> store the (qtbase) configure options somewhere (from the time when you
> configure qtbase for the target), i.e. qmake during the qtwebkit build
> has access to the configuration from the time qtbase was configured.
> Hence the idea is to make all (target) packages that use (inherit)
> qmake5 to use the same PACKAGE_ARCH override.

You can have recipes which use only qtbase-native and qmake only as
build tool and don't use target qtbase at all.

Such recipes inherit qmake5_base to setup paths etc and shouldn't became
MACHINE_ARCH just because target qtbase (which they don't use at all) is.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jE+K4o1MICf3EEet
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKPNyUACgkQN1Ujt2V2gByw2ACdHdkURRm5iJfIwdibeP1X6VnI
B04AnRG92y14ora0/+0EWRa+dsK+yV2P
=p2P1
-----END PGP SIGNATURE-----

--jE+K4o1MICf3EEet--
