Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S9Aeo-0005xp-3b
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 08:36:02 +0100
Received: by wera1 with SMTP id a1so5090258wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MkL8/YTVO9zu+eHIWG1fufPGyk6fzPmoTphPWO9pc4o=;
	b=LU1yz8vX6j8afdfSLeJlwFGCOJya364PfZp0OdahAGo01hVyvCxRqS8LExOBYfNkCg
	Bqz7rENXkyu23FTtaZc6h6QQY3BPXqXfMegmzM4559FVBDIDIF4/RvzR7jt52r2B3Hmu
	eHfERtwABlqBsl2zdlBHXH7GBPrn6F1naBMlZliBbfcidE4X2KUItUmb2YBPvxF4XYKB
	wSyuCJt22spvKRAupgmMz3Vl5s/YpQZoCNIWuKP2hY0LtwUKsNSQyavhPAvsgpTL76o0
	GrbyEHia9Pe+0vhXlCu8iXMsXWjkaNuHumR57bg45cP+dq7P73xmkovRY/X8NEMhz3sQ
	bBLA==
Received: by 10.180.94.33 with SMTP id cz1mr10844315wib.13.1332055632214;
	Sun, 18 Mar 2012 00:27:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k7sm23274086wia.5.2012.03.18.00.27.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 00:27:11 -0700 (PDT)
Date: Sun, 18 Mar 2012 08:27:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120318072709.GI3855@jama.jama.net>
References: <1332029635-5078-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1332029635-5078-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH] keymaps: edit script to reuse 2.6 kernel keymaps
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
X-List-Received-Date: Sun, 18 Mar 2012 07:36:02 -0000
X-Groupsio-MsgNum: 37814
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ogUXNSQj4OI1q3LQ"
Content-Disposition: inline

--ogUXNSQj4OI1q3LQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 18, 2012 at 01:13:55AM +0100, Andrea Adami wrote:
> * The keymap.sh script installed by oe-core recipe has a check
> * for KERNEL_MAJMIN=3D`uname -r | cut -d '.' -f 1,2`
> * so the keymaps-2.6.map's are ignored when running 3.x kernels
> * Thus, we replace the suffix of the runtime kernel with "2.6" in the .bb=
append.
> * Bump PR

Anyone interested in systemd support for keymaps?=20
Here is .bbappend and .service I'm using:

meta-smartphone/meta-shr/recipes-bsp/keymaps/

And it's also assuming keymaps-2.6.map file.

Cheers,

>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-bsp/keymaps/keymaps_1.0.bbappend |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes-bsp/keymaps/keymaps_1.0.bbappend b/recipes-bsp/keyma=
ps/keymaps_1.0.bbappend
> index d3310c1..039b30c 100644
> --- a/recipes-bsp/keymaps/keymaps_1.0.bbappend
> +++ b/recipes-bsp/keymaps/keymaps_1.0.bbappend
> @@ -1,4 +1,4 @@
> -PRINC =3D "1"
> +PRINC =3D "2"
> =20
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> =20
> @@ -20,6 +20,11 @@ SRC_URI_append_jornada6xx   =3D " file://keymap-uk-620=
-660.map \
>  				file://keymap-uk.map \
>  				"
> =20
> +# we still use keymap-2.6.map files
> +do_configure_append () {
> +    sed -i -e 's/KERNEL_MAJMIN=3D.*$/KERNEL_MAJMIN=3D"2.6"/' ${WORKDIR}/=
keymap.sh
> +}
> +
>  do_install_append () {
>      case ${MACHINE} in
>          c7x0 | tosa | akita | spitz | collie | poodle | h2200 | h4000 | =
hx4700 | jornada6xx )
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ogUXNSQj4OI1q3LQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9ljk0ACgkQN1Ujt2V2gBz1kACgtnTx5cM7AGjyRbB4pipECiNo
51cAnjKSe0XL1oroOhRhjljupbvAcAZl
=oBqe
-----END PGP SIGNATURE-----

--ogUXNSQj4OI1q3LQ--
