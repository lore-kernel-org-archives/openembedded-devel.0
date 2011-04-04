Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q6qn3-0006YN-TG
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 22:54:26 +0200
Received: by bwz5 with SMTP id 5so4518153bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 13:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=jvNUww9aYlHxgzY3bj5EllfCxpr++6N4XMjx//Gvv9w=;
	b=KqGaZbFVg7y8f3Mf0sn/AIL92x+B97Esg22Wmti/N2z8KsWYoYn4pYDcjusILPqcjf
	shuYyhJpMrqnoe1B3s2jyQvGCLpz4yJ9rQd0LfCdaGEiscvS9lzJ4l1sP67sItsLOvdF
	IN2zHTE3bPxi4an6sBZezVW5XlHmkrNGgwC+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=OalD4k65Lc9GApdJ3SXHzDvigx92+6H5fc80fhhwqBCI6f18A0zTpEvb2CaOnIx1fS
	QjuFQMf9HCSyzddl/sk/5qTf148TgKF5H7iuyxIsyRElHUeWKeYjqIwceaSWPJELb8r4
	pUUtMY7DnOOW6GaTfohDabPAPKOMJnbkQONBg=
Received: by 10.204.187.129 with SMTP id cw1mr1594272bkb.138.1301950340639;
	Mon, 04 Apr 2011 13:52:20 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm3338092bkt.5.2011.04.04.13.52.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2011 13:52:19 -0700 (PDT)
Date: Mon, 4 Apr 2011 22:52:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110404205213.GC30816@jama.jama.net>
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
X-List-Received-Date: Mon, 04 Apr 2011 20:54:26 -0000
X-Groupsio-MsgNum: 30909
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline

--Bu8it7iiRSEf40bY
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

we usually use shorter CC-BY-SA in this case CC-BY-SA2.5

will fix while pusing it (when it gets available on patchwork)

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
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2aL30ACgkQN1Ujt2V2gBzluwCfSEDoHSybVz5GjY4YC0jfBZj3
NmEAn3PZ+o/FTbBYsAyPpiCpKNTQTxuS
=belR
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
