Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sz69F-0004AT-MH
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 15:18:05 +0200
Received: by wgbdr1 with SMTP id dr1so546310wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2012 06:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G22v6UCDefQ+i9LUoh8wcMUU31jdqpDDBeR9jYP+KFY=;
	b=IFOsjKLYue+JAI+bKOJfCGctd0Fi4AATe2vfFJA7MorRe5R2P0/82A4w+H7afrs1qF
	DQlBUrAe3vkIJPuvRnBRM2DDtQ+3FN1NnxztGv4Wd7KaGIRXNFEIenOEQcZRwaf6KOyD
	a2vllX5y10pfPaZeaoX6qWaC+vehCYr84aOGoatl3ABEcnaiva+rTWo5d/9/XaEVQoR4
	kQcC/pPoRC5D4idaTXjKJRXBlXLWw0I1J4VL7UEl++Bt+WdldqV18v560j3fA4ABtGny
	LMc8zBZi7lSYERnAFyGTxVkOkIRfU7sDeZ7C+e8CbHHXQ8YKOoRVScscTR16NSDo/3M2
	sy6Q==
Received: by 10.216.138.92 with SMTP id z70mr9184054wei.68.1344431178681;
	Wed, 08 Aug 2012 06:06:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm5056735wib.2.2012.08.08.06.06.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Aug 2012 06:06:17 -0700 (PDT)
Date: Wed, 8 Aug 2012 15:06:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120808130616.GB2854@jama.jama.net>
References: <jvqqs2$tn3$1@dough.gmane.org>
	<20120807110710.GS3267@jama.jama.net>
	<jvt31p$dms$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jvt31p$dms$1@dough.gmane.org>
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
X-List-Received-Date: Wed, 08 Aug 2012 13:18:05 -0000
X-Groupsio-MsgNum: 40116
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline

--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2012 at 09:04:49AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 07-08-12 13:07, Martin Jansa schreef:
> > On Tue, Aug 07, 2012 at 12:32:51PM +0200, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
> >>=20
> >> Hi,
> >>=20
> >> I've applied a bunch of patches and hopefully commented on all the ones
> >> I didn't apply. I also cleared the meta-oe patchwork so it's nice and
> >> empty now:
> >> http://patchwork.openembedded.org/project/oe/list/?q=3Dmeta-oe
> >>=20
> >> If your patch hasn't been applied yet into meta-openembedded master and
> >> is lacking comments, please resubmit it as [meta-oe][PATCH v(N+1)]
> >> (substitute N please).
> >>=20
> >> There are a few big deadlines coming up at work, so everything will
> >> have a few days of delay but if you haven't seen any feedback after a
> >> week and the patch is still sitting in patchwork, please send a
> >> reminder. Replying to the patch with 'ping' is usually enough and most
> >> people know where to find me on IRC.
> >=20
> > There are few pending patches IMHO worth including, I can resend them i=
n=20
> > some consolidated pull request (all pushed to jansa/pull already), but=
=20
> > listing pw ids is maybe easier for you to apply them:
> >=20
> > systemctl mask (sorry I forgot to include meta-oe prefix): 33997 33999
> >=20
> > patches from khem wit meta-systemd prefix: 33795 33793 33791 33789	33787

Thanks.

> I didn't apply 33787, that needs coordination with other layers to prevent

OK, for fwiw all BSPs in meta-smartphone layers are updated to use
machine_kernel_pr (in shr branch, master should probably still work with
current meta-oe/master).

> breakage. I think doing a copy + delete a few days later is a better
> migration path.

Yes, good idea, it doesn't have any bad side-effect if MACHINE_KERNEL_PR
logic is applied twice, so this should help other layers to update.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAiZEgACgkQN1Ujt2V2gBwe3ACghutCAComu1Wt2U6G8tVGUiI6
gw4AnRwkdjn3Tygv5p5jcv48ec4SaTYe
=xobZ
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
