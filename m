Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q6qwz-00078v-OA
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 23:04:41 +0200
Received: by bwz5 with SMTP id 5so4525460bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 14:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=1kV2h/ygwkyZcdfrAUFJ2qeLYmvnn6P/4WV2COQTxyE=;
	b=s/8TrykklWPANSqv3YA3yR+cWLcEOt6HGPA8d0uNDd9a2wzzANGovtLH1CGSk+Psvx
	pqZiRG0USfmUZu42lVcGsGpmlqk/cSvluWM39sdE73EBwxt9K5+o1v7baG0q8gFtr38O
	XdJnBEp95HfNcyNOgkPiMbWsIyNlwujt073Nw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iXIXi164sVZGwOC/qq2EpE97AM6Rgtd5CuTlyDf5BjJNWejswJFR3gXIH+GUsygBXc
	+WH+ZOGA5XK+xPmwM0tfxzGz6d5ZaPyE7EcW1iTcDqEcyj8WkUJMzRmr+hTfy/LTwl0m
	bH3iZrExZX9Qs9Zk0GdDSmyvYd575/Gn6Fh6I=
Received: by 10.204.171.65 with SMTP id g1mr600126bkz.45.1301950956933;
	Mon, 04 Apr 2011 14:02:36 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm3342188bkt.5.2011.04.04.14.02.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2011 14:02:36 -0700 (PDT)
Date: Mon, 4 Apr 2011 23:02:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110404210234.GD30816@jama.jama.net>
References: <1301949631-6761-1-git-send-email-philippedeswert@gmail.com>
	<1301949631-6761-2-git-send-email-philippedeswert@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1301949631-6761-2-git-send-email-philippedeswert@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2] 2/2] ephoto: new svn build recipe
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
X-List-Received-Date: Mon, 04 Apr 2011 21:04:41 -0000
X-Groupsio-MsgNum: 30910
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline

--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2011 at 11:40:31PM +0300, Philippe De Swert wrote:
> Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
> ---
>  recipes/e17/ephoto_svn.bb |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/e17/ephoto_svn.bb
>=20
> diff --git a/recipes/e17/ephoto_svn.bb b/recipes/e17/ephoto_svn.bb
> new file mode 100644
> index 0000000..3b6cadf
> --- /dev/null
> +++ b/recipes/e17/ephoto_svn.bb
> @@ -0,0 +1,12 @@
> +LICENSE =3D "MIT Creative Commons Attribution-ShareAlike 2.5"
> +PV =3D "0.1.0+svnr${SRCREV}"
> +PR =3D "${INC_PR}.0"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddf45d9de58df0b48f515eae8d2421=
257"
> +LIC_FILES_CHKSUM =3D "file://COPYING.icons;md5=3Dd4e4f10748f3146a089aaa2=
3c9ade59b"
> +
> +require e-module.inc
> +
> +DEPENDS +=3D "elementary ethumb ecore eio"
> +
> +SRCNAME =3D "${PN}"

both applied, thanks!

btw: subject is a bit wrong, too many closing brackets ], so "2/2] " ends in
the begining of commit message

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2aMeoACgkQN1Ujt2V2gBx7CwCeO0W0k/71p/TCM//8NmDKBmX3
m4gAn0jsnKrbVzcbhJhQi97V1PajnhRg
=r04p
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
