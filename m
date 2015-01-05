Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5467213F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 12:06:29 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id k11so7710595wes.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 04:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ShRk/Z2hFlJs+yUy2NxS9fjP/q7Zm0H7SMGs20uW50w=;
	b=lajk9fmIS+gqV3JorLsk4LfdGrGr9Z/jOJy6+IvLSj8u3rI58jjFdOCWeizd4WLY8m
	wL2jidgHXcavgXuU25yaApKIhwvthk2Wva1aryZIp003NklO2PZbMMa6nfJCEb/D8ilt
	9jHe4LIPWrq03kJmpsPTR+d5L8h1zKf3XmYWi8JiQruD4+YalAuWeUewZlznsWw4R1e3
	dL0dPW4F3URrP+66kKYZIqFyJSm5xkauRIGGctRmlSCInxF44f75LxCWUKA4pA9HsoH+
	QdC9s0AJJLxCviCP/Mob+p5XMMDM2n1PdQTx3JhiodqTv7EXfBFKpzrbdBZrqX5KAzMe
	7J3Q==
X-Received: by 10.194.71.169 with SMTP id w9mr171658253wju.19.1420459589641;
	Mon, 05 Jan 2015 04:06:29 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jr4sm75150935wjc.20.2015.01.05.04.06.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 04:06:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jan 2015 13:06:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150105120630.GH2484@jama>
References: <1418919660-22187-1-git-send-email-bill.pittman@ni.com>
MIME-Version: 1.0
In-Reply-To: <1418919660-22187-1-git-send-email-bill.pittman@ni.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] packagekit: Change recipe to use native mkdir
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
X-List-Received-Date: Mon, 05 Jan 2015 12:06:37 -0000
X-Groupsio-MsgNum: 53649
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TKDEsImF70pdVIl+"
Content-Disposition: inline

--TKDEsImF70pdVIl+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2014 at 10:21:00AM -0600, Bill Pittman wrote:
> For redhat type systems, the recipe tries to use a version of mkdir from
> sysroots, however mkdir does not exist and the build fails.  Ubuntu syste=
ms
> work because the sed command in the recipe specifically replaces the
> /usr/bin/mkdir path and ubuntu systems use /bin/mkdir.

If you care about packagekit, can you please also check this QA issue?

packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its
RDEPENDS [file-rdeps]

>=20
> Signed-off-by: Bill Pittman <bill.pittman@ni.com>
> ---
>  meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb b/me=
ta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
> index 96cc468..59b0a43 100644
> --- a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
> +++ b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
> @@ -41,7 +41,6 @@ EXTRA_OECONF =3D "--with-security-framework=3Ddummy \
>  do_configure_append() {
>      for i in $(find . -name Makefile) ; do
>          sed -i -e s:${STAGING_DIR_NATIVE}::g \
> -               -e s:${bindir}/mkdir:${STAGING_BINDIR_NATIVE}/mkdir:g \
>                 -e s:/usr/bin/intltool-merge:${STAGING_BINDIR_NATIVE}/int=
ltool-merge:g \
>                 $i
>      done
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TKDEsImF70pdVIl+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSqfkYACgkQN1Ujt2V2gBxr+wCeO/9pfDkyVupIKh4uz27Yb/8N
wsYAn3JtD7XJjuwlDGk3H6SsuOBe1DxO
=mXx4
-----END PGP SIGNATURE-----

--TKDEsImF70pdVIl+--
