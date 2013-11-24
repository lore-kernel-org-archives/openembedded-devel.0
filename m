Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id D692F61227
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 14:12:47 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so1747710ead.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 06:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0QtRG7pi2oithOEEEG1VkJwbwJCUCXzLeOy7/3sozAg=;
	b=aH4nUUEehRv1GRi4sbZtlfL4jrQ76cryxEAGQAIY6GrdmGm7b2ClIZuk6F97LlBks2
	VSg8GdnGTNWyyCfJDWoCtSUv0eKqouDkp3a6QA+Zot9mt+HHF3OedR77bpLHlYtRcm+X
	9dd7pdSpJVsg7QYDBekcAMoFJRU+GsA5tvjFYkcCFStyQfB218Z8PaWYwFgfY/VtBXM1
	CIjFbOwGjV6f05tcWc9OKHwPyk9BtRpH1lpQ49p27oGpqFZj83fPj1h+beDS5506lHO2
	klWoGPrcIQvUfDiwTlGptglBwsEbZNLyuDHJkeEY9L5DbBvJfezOacJOSFFTW14xZzmq
	X0Zw==
X-Received: by 10.15.67.195 with SMTP id u43mr5842162eex.14.1385302366712;
	Sun, 24 Nov 2013 06:12:46 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id z1sm92513507eeo.14.2013.11.24.06.12.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Nov 2013 06:12:45 -0800 (PST)
Date: Sun, 24 Nov 2013 15:12:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131124141246.GA2870@jama>
References: <1385022086-30386-1-git-send-email-ulf@emagii.com>
MIME-Version: 1.0
In-Reply-To: <1385022086-30386-1-git-send-email-ulf@emagii.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [PATCH] Ignore Edit backup files
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
X-List-Received-Date: Sun, 24 Nov 2013 14:12:48 -0000
X-Groupsio-MsgNum: 47243
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2013 at 09:21:26AM +0100, Ulf Samuelsson wrote:
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> ---
>  .gitignore |    2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 .gitignore
>=20
> diff --git a/.gitignore b/.gitignore
> new file mode 100644
> index 0000000..5236e1e
> --- /dev/null
> +++ b/.gitignore
> @@ -0,0 +1,2 @@
> +*~
> +

I'll add few more to match with oe-core

/*.patch
*.swp
*.orig
*.rej
*~

> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKSCV4ACgkQN1Ujt2V2gBzLNQCfeJpofiVLcFFi9d/kzjy9TaeH
msgAniEVUyH61ej61EJkcTfNv8XD+I33
=SJrC
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
