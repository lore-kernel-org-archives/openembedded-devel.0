Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QS9FV-00012m-8d
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 16:51:50 +0200
Received: by bwz5 with SMTP id 5so1155504bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=o4DjW87SmzZ3xjR49rMTWRMjxjR7MX7O/qk+lJ67rNM=;
	b=IJEKdWQl9XKndu3GEoYvhnfA1wc/UmygF1FyV4HpiHAnxgrODHzmB5hhnYnn4DroUf
	9OS562iQcug7+0B1sXTxdxdmk+ev9lX0TKLUVZ6j5buI/uSKuhMMxOJsLpvIbrhseV/J
	KOpou/R+EI7ufqZLqBwwEUg9gZsoO0lEO1JWg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pBcNWHFHRAu1rPzTLGKlqCvTMBb8VF2uTPkbbog6+UwejrsmG0XvY8Q+EoVnBnlYVM
	eFlHvr7DI2bJT2+7icPmuq63m3sbZYLrAXRtqEMNjy+yv4dgq5329hAQ74pCBDR3VcYx
	lYOR4y4mYOhnXI68g+IxrD3n6nPdhmoXSxJl0=
Received: by 10.204.126.29 with SMTP id a29mr749452bks.167.1307026117405;
	Thu, 02 Jun 2011 07:48:37 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id ek1sm509974bkb.21.2011.06.02.07.48.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 07:48:36 -0700 (PDT)
Date: Thu, 2 Jun 2011 16:48:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110602144829.GI3281@jama.jama.net>
References: <1307025867-12077-1-git-send-email-morphis@gravedo.de>
MIME-Version: 1.0
In-Reply-To: <1307025867-12077-1-git-send-email-morphis@gravedo.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] minimal: add weak assigned DISTRO_FEED_CONFIGS variable
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
X-List-Received-Date: Thu, 02 Jun 2011 14:51:50 -0000
X-Groupsio-MsgNum: 32479
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TC23+W66xmFESAX"
Content-Disposition: inline

--6TC23+W66xmFESAX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2011 at 04:44:27PM +0200, Simon Busch wrote:
> Some distros are based on the minimal distro but want to supply another f=
eed configuration.
> As minimal uses DISTRO_EXTRA_RDEPENDS to pull distro-feed-configs into th=
e builded image
> the new weak assigned variable DISTRO_FEED_CONFIGS makes it possible to s=
pecify another
> feed configuration.

isn't
DISTRO_FEED_PREFIX
DISTRO_FEED_URI
in
recipes/meta/distro-feed-configs.bb
enought to modify default distro-feed-configs?

and if not cannot we change distro-feed-configs.bb to allow such
modifications?

Regards,

>=20
> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
>  conf/distro/minimal.conf |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 18bcfae..edac24f 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -53,6 +53,8 @@ INHERIT +=3D "package_ipk"
>  IMAGE_FSTYPES ?=3D "tar.gz jffs2"
>  PREFERRED_PKG_FORMAT ?=3D "ipk"
> =20
> +DISTRO_FEED_CONFIGS ?=3D "distro-feed-configs"
> +
>  # Put links to sources in deploy/sources to make it easier for people to=
 be GPL compliant
>  INHERIT +=3D "src_distribute_local"
>  SRC_DIST_LOCAL ?=3D "symlink"
> @@ -135,7 +137,7 @@ DISTRO_EXTRA_APPS +=3D '${@base_conditional("DISTRO_T=
YPE", "release", "", "task-cl
>  # util-linux-ng-mount util-linux-ng-umount: busybox mount is broken
>  # angstrom-libc-fixup-hack: fixes an obscure bug with libc.so symlink
>  DISTRO_EXTRA_RDEPENDS +=3D "\
> -  distro-feed-configs \
> +  ${DISTRO_FEED_CONFIGS} \
>    util-linux-ng-mount util-linux-ng-umount \
>    angstrom-libc-fixup-hack \
>    ${DISTRO_EXTRA_APPS} \
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6TC23+W66xmFESAX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEUEARECAAYFAk3nor0ACgkQN1Ujt2V2gBxi9gCRAQW2wc8v+Hsdis/HH1EwwhK5
cQCgp7pd1ax/RXnaH6r9l3FLBYv6844=
=6hk6
-----END PGP SIGNATURE-----

--6TC23+W66xmFESAX--
