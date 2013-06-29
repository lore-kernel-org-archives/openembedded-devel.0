Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 15CCD6A4AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 15:35:54 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ey16so1759223wid.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2pLbQRTgTttdHDs1BLvl8u+w3YJQDHbvo6Tqwy66NCg=;
	b=x9NW6+kQkLPlDzGtY2pu0cDAIEEeQ0iuyrKLg5ZRVlYzb0o2hmZK3t4fb2z4AAZisa
	cJjxaFiDHum5RQM9pRCMwh2VCTwCBOEHqjpcZJ/e3ra2Fl9RAPEKK0sJIZ7RLKztpN/l
	H9tozoAHRk8rKafNWyda5q+T9/7Qd3jXmpLA/RT5Jnwoi6FMSgSOKLmmItgPk9EOlTct
	9hZCZ3D8eB/+prC7uGQvfErjQ5xRJPiTthaIUJdRwG4f639jw0IT1mCk86iY/BGUohuM
	XxcSSDRn7IdsJ2tcsH5eBusNlGSeZRlhGdup1J0GPBuWsPJ9SqQBT1SzHnXD8bxFf9CK
	lFZw==
X-Received: by 10.181.12.10 with SMTP id em10mr6968192wid.4.1372520155798;
	Sat, 29 Jun 2013 08:35:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm17579182eez.0.2013.06.29.08.35.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 08:35:55 -0700 (PDT)
Date: Sat, 29 Jun 2013 17:36:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130629153636.GW3261@jama>
References: <1372437419-31205-1-git-send-email-raj.khem@gmail.com>
	<20130629122713.GT3261@jama>
	<3C785BCF-50C1-4144-8EEC-C2EF2663E2C6@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3C785BCF-50C1-4144-8EEC-C2EF2663E2C6@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-browser][PATCH V2 1/3] chromium: Remove older recipes
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
X-List-Received-Date: Sat, 29 Jun 2013 15:35:55 -0000
X-Groupsio-MsgNum: 45250
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="50RDeE14MEV4qpyy"
Content-Disposition: inline

--50RDeE14MEV4qpyy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2013 at 07:30:59AM -0700, Khem Raj wrote:
>=20
> On Jun 29, 2013, at 5:27 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > Fails to apply cleanly:
> >=20
> > patching file recipes-browser/chromium/chromium/google-chrome.desktop
> > Reversed (or previously applied) patch detected!  Assume -R? [n] ^C
> >=20
> >=20
>=20
> don't know what going on there in your tree, but I observed that one of t=
he patch is already applied
> so I rebased the patch set on top of master and resent a V3. retry and le=
t me know if it works
> this time. If not I will push it to a contrib tree and you can cherry pick

I've double checked that my tree was identical to origin/master before
writting this, then I've applied it manually and already pushed it before
I've replied here, so I wonder if there is another repo which wasn't synced?

Because your rebase should show that everything is already there.

I've pushed it to:
origin  git@github.com:OSSystems/meta-browser.git (push)

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--50RDeE14MEV4qpyy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHO/wQACgkQN1Ujt2V2gBy/vgCeNrG3KvWquSfXMabv/6Pthl/U
OKIAmwVRy2dncmjXWMGDSMi7V2HnLr9a
=T3V0
-----END PGP SIGNATURE-----

--50RDeE14MEV4qpyy--
