Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tswl0-0002Nj-Gu
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 15:36:04 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so1068439pac.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 06:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=J9LnXiL+26r3SOkEQZf/ZAjKI0Jt++YaFNVwlEo7vMw=;
	b=Eb7aFJuCyP82eVCjGn2lb4Ux8+uj+AYXNHDV2EIUHSecwEnCr5tLbQ8Xl1mh9gEpYf
	bWiWjMgxfWcRd4I+OtW4xbaY0s89Yz1SKJgFIAILEMGUAzE6JhviLa3h+CYeqhsep8TC
	Cbp0iYxA2tZyZyBVU/ilQhz0YOktJXHG96ptf9+zgTmw/quWC5q9YULwL3VU6GwR9LEk
	VeoKVdBihyCIpODcsrdUSOXr7urRX+4nRtY/zwQnQIFwmDPag/GhlTgKQvSv6DxgAvTV
	K4jumSemj8TI3zCDPJl709JDfpLMcnJLxdGr6309Q6hAry/tElLititYMwLiXFjvHdLQ
	gkVA==
X-Received: by 10.66.80.202 with SMTP id t10mr189641651pax.81.1357741241811;
	Wed, 09 Jan 2013 06:20:41 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x6sm42894998pav.29.2013.01.09.06.20.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 06:20:39 -0800 (PST)
Date: Wed, 9 Jan 2013 15:20:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130109142043.GM3722@jama.palm1.palmone.com>
References: <20121220132241.10D7310354@opal>
	<20121222200925.GD8988@jama.palm1.palmone.com>
	<CAJTo0LYQetj+657NjT+BHpg6jCOzUq63Ad2ghesThWvcLiSxcw@mail.gmail.com>
	<20121223093932.GF8988@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20121223093932.GF8988@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] Ross Burton : python-mako: install standalone, not as an egg
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
X-List-Received-Date: Wed, 09 Jan 2013 14:36:04 -0000
X-Groupsio-MsgNum: 42596
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="00sTfE/IIAT5d2r5"
Content-Disposition: inline

--00sTfE/IIAT5d2r5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 23, 2012 at 10:39:32AM +0100, Martin Jansa wrote:
> On Sun, Dec 23, 2012 at 09:03:56AM +0000, Burton, Ross wrote:
> > On Saturday, 22 December 2012, Martin Jansa wrote:
> >=20
> > > This is causing new QA issue, please fix that
> > >
> > > python-mako-0.7.2: python-mako: Files/directories were installed but =
not
> > > shipped
> > >
> > > /home/jenkins/shr/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_=
64-linux/usr/bin/mako-render
> > >
> > > No idea why I haven't noticed it on first test..
> > >
> >=20
> > Or how I'm sure I've never seen that. Maybe interaction with some ther
> > patch. Need to use setup tool.bbclass anyway, will investigate.
>=20
> FWIW: python-mako builds without QA warnings after reverting this patch.

ping :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--00sTfE/IIAT5d2r5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtfLsACgkQN1Ujt2V2gBxAHQCeKG6tXt5i9oam7islCW/12U/9
zTEAn00IYcEnssaQ9VUuUTnhQTc3fGBT
=cUpd
-----END PGP SIGNATURE-----

--00sTfE/IIAT5d2r5--
