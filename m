Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U377r-0003Ef-3w
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Feb 2013 16:41:32 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so717774dak.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2013 07:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LbdtwjHaT1KEmzi9LLdhU+FsKt2WdCjDUYUzk1l+N3s=;
	b=vGsmWMly38IcclIneKXc2bVe7INtXrEhECekUlunqrjEhko+PqV8zjVQH4bvkASyL1
	ObByZDGFd9wXwmN3d/OXRGQeQl0bcZt6jNZsgsvY1iSnGOuGeUf9+snQH0KUxvBRWIGW
	XzI8wIJE9egzvAc3nCbNn+Q/Tb1ooij4nxKgLnwbgOWcO2Sdu0Cq0zJH5gGaCgiCTn+b
	VJ9bAC5pgtuNfoyk/ORKKsDHq3/XJH78tEGW96ytaTX0zMn8CtbRkDBQupoVjLfcxrEZ
	633gwacfXz1TlPm/DQsED7QKnCZN2QX5DFlF53bF5YuCr0q9jSlloJ5CT9EvcRBFyMa0
	Ejpg==
X-Received: by 10.66.74.42 with SMTP id q10mr76784610pav.71.1360164338920;
	Wed, 06 Feb 2013 07:25:38 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a1sm38513145pav.2.2013.02.06.07.25.36
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 07:25:37 -0800 (PST)
Date: Wed, 6 Feb 2013 16:25:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130206152529.GA3271@jama>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
	<1360102723-27891-5-git-send-email-schnitzeltony@googlemail.com>
	<20130206144840.GZ3271@jama>
	<CALbNGRR9isWgLJmRL3thvhkFhirwLR2YqoXfrHPtgMqOHrYQBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRR9isWgLJmRL3thvhkFhirwLR2YqoXfrHPtgMqOHrYQBw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe-meta-systemd 4/5] pointercal-xinput: remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 15:41:34 -0000
X-Groupsio-MsgNum: 43027
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FYmwbMCTM+aCvPj+"
Content-Disposition: inline

--FYmwbMCTM+aCvPj+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 04:12:50PM +0100, Andreas M=FCller wrote:
> On Wed, Feb 6, 2013 at 3:48 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Tue, Feb 05, 2013 at 11:18:42PM +0100, Andreas M=FCller wrote:
> >> Calibration values are stored now in /etc/xorg.conf.d/99-<device>.conf=
=2E After
> >
> > So the plan to replace pointercal-xinput in BSP layers
> > is to convert pointercal.xinput files to 99-<device>.conf files provided
> > by xserver-xf86-conf bbappend?
> I would have appended it to xinput-calibrator because that's where the
> configuration files are used. I can put them also to xserver-xf86-conf
> bbappend - have no strong opinion here.

xinput-calibrator does not need to be MACHINE_ARCH, that's why they were
in separate pointercal-xinput before.

xserver-xf86-config on other hand is usually MACHINE_ARCH so it would be
better to add them there.

Or create new recipe for them and RDEPEND it from xinput-calibrator...

> > And do you have some script to convert them or do you convert them
> > manually?
> >
> I wanted to convert them manually but a script is more reliable - will
> do that next week.
>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FYmwbMCTM+aCvPj+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESdekACgkQN1Ujt2V2gBzqrQCfdDk3s7YjAHsbm+AyMP1l4QIs
SKgAnijM5DUo7GjRpP1wz5ALGPM++g8Z
=8eiw
-----END PGP SIGNATURE-----

--FYmwbMCTM+aCvPj+--
