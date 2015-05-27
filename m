Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id B5DEF737F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 10:35:15 +0000 (UTC)
Received: by wicmc15 with SMTP id mc15so89388759wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 03:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=DrzJtwg+bfBYjMjLAtR6olysBGtlUBoifEyICgloczw=;
	b=0g2NUVPwT3FNdAywCtYrSb2WEDsLbOV25rDA4KKrdcX/azLCbhaZ19wcvv2u+NwFTD
	E3fI782KELDeZV+YmaDjY2rVmhNqcbKs9nemnmfyHgU67c04uLj65j0cqNG8FF14dtfu
	RPh232tuSZbkzM9JkfNxOWZg/3CnMIG7miQ1enkbzzaUharq0PrsC0qdnMCuWUcDM6jZ
	wunRFJuTT70RVazd7p5T3hO3BXZ8rJhy4LlNFZcC/bSX9ABA79mdMI3aHLC6DoG5HfBZ
	LbZzEfN+0F/VSLOsSdbA77+toztxK5S2E4n4OIKpd1WLTTUkugx5JoNjF7coh4F5ZoJF
	FeIg==
X-Received: by 10.194.22.131 with SMTP id d3mr332096wjf.111.1432722916354;
	Wed, 27 May 2015 03:35:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id z9sm2964753wiv.9.2015.05.27.03.35.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 May 2015 03:35:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 May 2015 12:35:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150527103531.GB3683@jama>
References: <1432715647-13207-1-git-send-email-hroussille@adeneo-embedded.com>
MIME-Version: 1.0
In-Reply-To: <1432715647-13207-1-git-send-email-hroussille@adeneo-embedded.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] Adding support for directFB to mplayer2 recipe
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
X-List-Received-Date: Wed, 27 May 2015 10:35:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2015 at 10:34:06AM +0200, Hector Roussille wrote:
> ---

I've fixed commit message format when cherry-picking to master-next, but
please confirm that it's OK to add you SOB line or re-send.

>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe=
/recipes-multimedia/mplayer/mplayer2_git.bb
> index 5b0e1de..b208144 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -121,6 +121,7 @@ PACKAGECONFIG[postproc] =3D ",--disable-libpostproc,l=
ibpostproc"
>  PACKAGECONFIG[vorbis] =3D ",--disable-libvorbis,libvorbis"
>  PACKAGECONFIG[portaudio] =3D ",--disable-portaudio,portaudio-v19"
>  PACKAGECONFIG[mpg123] =3D ",--disable-mpg123,mpg123"
> +PACKAGECONFIG[directfb] =3D "--enable-directfb,--disable-directfb,direct=
fb"
> =20
>  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -O4 -ffast-math"
>  BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> @@ -134,7 +135,7 @@ do_configure() {
>      sed -i 's|/usr/\S*lib[\w/]*||g' ${S}/configure
>      sed -i 's|_install_strip=3D"-s"|_install_strip=3D""|g' ${S}/configure
>      sed -i 's|HOST_CC|BUILD_CC|' ${S}/Makefile
> -
> +    sed -i 's|extra_cflags=3D"-I. $extra_cflags"|extra_cflags=3D"-I. -I$=
{STAGING_INCDIR}/directfb $extra_cflags"|g' ${S}/configure
>      export SIMPLE_TARGET_SYS=3D"$(echo ${TARGET_SYS} | sed s:${TARGET_VE=
NDOR}::g)"
>      ./configure ${EXTRA_OECONF}
>     =20
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

