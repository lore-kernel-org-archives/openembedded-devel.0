Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmiGD-00054D-B2
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 10:54:21 +0100
Received: by mail-da0-f50.google.com with SMTP id h15so2761432dan.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 01:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=kyz0xEbx1mlvU2hlLLAq9THNVXkv9WZLuyTnAJ7wDGQ=;
	b=nMjLIGMhPzWl5jsTaxCieUpBB546jYGaa+PrZGtvKdeJWGV3sijtHesKJxO1PYTWZd
	47KPpAARm86LAlB4MvFrrc+g1tSw00JOasvhho7ptu2YzlvPqIbXdVO0ArDVFikWqSvu
	kp2kEY+To2xo9RFE79MpNGaZ00PuKy5UqeXn3g2mDlJI6Vw1b9VUVHMQWGns/I+EV4B0
	OZ/WR0bRRhQdV/p9/bMxQNB7VA1oIx71ZLUrNCcwSKcO/5ScnsXPnE+VnSvo1VtW6hDL
	w+75lf77UKhRjesHlTGPquBTWR1/Ps9n6mHoNM1fGusvzKLXNxWX1ivrHrwmZ2JhKf2h
	UTBw==
X-Received: by 10.66.81.198 with SMTP id c6mr52740087pay.50.1356255572126;
	Sun, 23 Dec 2012 01:39:32 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wg3sm10273836pbc.28.2012.12.23.01.39.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 01:39:30 -0800 (PST)
Date: Sun, 23 Dec 2012 10:39:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20121223093932.GF8988@jama.palm1.palmone.com>
References: <20121220132241.10D7310354@opal>
	<20121222200925.GD8988@jama.palm1.palmone.com>
	<CAJTo0LYQetj+657NjT+BHpg6jCOzUq63Ad2ghesThWvcLiSxcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYQetj+657NjT+BHpg6jCOzUq63Ad2ghesThWvcLiSxcw@mail.gmail.com>
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
X-List-Received-Date: Sun, 23 Dec 2012 09:54:21 -0000
X-Groupsio-MsgNum: 42327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GV0iVqYguTV4Q9ER"
Content-Disposition: inline

--GV0iVqYguTV4Q9ER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 23, 2012 at 09:03:56AM +0000, Burton, Ross wrote:
> On Saturday, 22 December 2012, Martin Jansa wrote:
>=20
> > This is causing new QA issue, please fix that
> >
> > python-mako-0.7.2: python-mako: Files/directories were installed but not
> > shipped
> >
> > /home/jenkins/shr/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64=
-linux/usr/bin/mako-render
> >
> > No idea why I haven't noticed it on first test..
> >
>=20
> Or how I'm sure I've never seen that. Maybe interaction with some ther
> patch. Need to use setup tool.bbclass anyway, will investigate.

FWIW: python-mako builds without QA warnings after reverting this patch.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GV0iVqYguTV4Q9ER
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDW0VQACgkQN1Ujt2V2gBwtvACfZZAHEehy1nzNp7FlyTzfFCqd
K6gAnRRcD7RlhPUqL0cprDUZDyyty8rY
=TPfa
-----END PGP SIGNATURE-----

--GV0iVqYguTV4Q9ER--
