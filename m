Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyhoS-0001US-Ef
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 13:19:00 +0200
Received: by weyr6 with SMTP id r6so2506803wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 04:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LLc3LJYFdVDe5lJDdS3Skb9Cr+pkHQUP/tSO9JvMkhg=;
	b=nKOifMXQMSx+byRYGGYJdm2KYRupyr3yp0snRsPQd0rzjx7RU4ENUFEE9d0KpCGRrf
	z+jRwYbbMR1+BSyOkBc45oUZ2Y3IXO8TaXrEjXel1BXx1R62PXAp21KgAoRJTJx7E86R
	PiB28LdzL/8xpZOmMUwWIKvHcaLhN4fmAGLkgKFo5lwwOLzCmCzoeByzYIt0khpk6UPQ
	7ULcTienSniJ9NykHha2Hleu075hUAP637CCJ2+j5mZV3/zLURh3oB9pxEB0RRU5hYQM
	SmcBKlTQ5DLFizEQgp+EGLCOnNuM5VxD4W58PzJHWtOYbWkcywlkaTf34EYPWZmfIqAM
	ru2A==
Received: by 10.180.84.169 with SMTP id a9mr26620693wiz.8.1344337634863;
	Tue, 07 Aug 2012 04:07:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dc3sm20758367wib.7.2012.08.07.04.07.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 04:07:14 -0700 (PDT)
Date: Tue, 7 Aug 2012 13:07:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120807110710.GS3267@jama.jama.net>
References: <jvqqs2$tn3$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jvqqs2$tn3$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: meta-openembedded patch queue
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
X-List-Received-Date: Tue, 07 Aug 2012 11:19:00 -0000
X-Groupsio-MsgNum: 40102
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nDmTXYS4kVhtHHfR"
Content-Disposition: inline

--nDmTXYS4kVhtHHfR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 07, 2012 at 12:32:51PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> I've applied a bunch of patches and hopefully commented on all the ones I
> didn't apply. I also cleared the meta-oe patchwork so it's nice and empty
> now: http://patchwork.openembedded.org/project/oe/list/?q=3Dmeta-oe
>=20
> If your patch hasn't been applied yet into meta-openembedded master and is
> lacking comments, please resubmit it as [meta-oe][PATCH v(N+1)] (substitu=
te
> N please).
>=20
> There are a few big deadlines coming up at work, so everything will have a
> few days of delay but if you haven't seen any feedback after a week and t=
he
> patch is still sitting in patchwork, please send a reminder. Replying to =
the
> patch with 'ping' is usually enough and most people know where to find me=
 on
> IRC.

There are few pending patches IMHO worth including, I can resend them in
some consolidated pull request (all pushed to jansa/pull already), but=20
listing pw ids is maybe easier for you to apply them:

systemctl mask (sorry I forgot to include meta-oe prefix):
33997 33999

patches from khem wit meta-systemd prefix:
33795 33793 33791 33789	33787

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nDmTXYS4kVhtHHfR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAg9t4ACgkQN1Ujt2V2gBxGIQCfUHXExQJ33oHZtSDg4PPBrEjX
t6YAoJWbrp/AEKtZ/xJLm7nGX4rm5JhU
=jlMh
-----END PGP SIGNATURE-----

--nDmTXYS4kVhtHHfR--
