Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R1D69-0001XZ-KO
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 10:03:05 +0200
Received: by pzk2 with SMTP id 2so13655953pzk.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 00:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=D7QPbfAw0E0xbmsbyPW/rI+0HZXHyZv8FHIBjaZbjgE=;
	b=sjqMtZJV1DsuRjvckGBrlUqqaW4oczthsiLWvhnwixaNzvGoo9Ho+zVGb7XABF6jn/
	PHUh9SpNITLfJrhj+nd/0PqFTU2QNrD+oA3VcKV/6d7RIYqnNCISuWVe3KurVF61eWNx
	93HTx6NHNcbIOqktZcQGPOlqx++OGNnFm5cvE=
MIME-Version: 1.0
Received: by 10.68.7.36 with SMTP id g4mr7932563pba.109.1315382282596; Wed, 07
	Sep 2011 00:58:02 -0700 (PDT)
Received: by 10.142.223.1 with HTTP; Wed, 7 Sep 2011 00:58:02 -0700 (PDT)
In-Reply-To: <1315341136-25548-1-git-send-email-eric@eukrea.com>
References: <1315341136-25548-1-git-send-email-eric@eukrea.com>
Date: Wed, 7 Sep 2011 09:58:02 +0200
Message-ID: <CA+chaQdYjN2tEhr6NXa0Qvix-1MoRPrG3iVMnD6ueLsSvXL+9g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [meta-oe] bianutils-2.20.1: fix checksums
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
X-List-Received-Date: Wed, 07 Sep 2011 08:03:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is probably caused by replacing 2.20.1 tarballs with links to 2.20.1a.

IMHO would be better to change recipes to say 2.20.1a and force
everybody to redownload it with new name (otherwise breaks checksums
for everybody with old 2.20.1 in downloads dir)

Also please provide at least "diff -rq" when sending fix checksums
patches, otherwise checksums are quite useless.

The same applies to "fix checksums for binutils-2.18"..

Regards,

2011/9/6 Eric B=C3=A9nard <eric@eukrea.com>:
> the source archive seems to have changed on the 26 aug 2011, thus
> the checksums have to be updated.
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
> =C2=A0.../recipes-devtools/binutils/binutils_2.20.1.bb =C2=A0 | =C2=A0 =
=C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb b/meta-=
oe/recipes-devtools/binutils/binutils_2.20.1.bb
> index 2558bda..cfceab3 100644
> --- a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
> +++ b/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
> @@ -36,7 +36,7 @@ SRC_URI =3D "\
> =C2=A0 =C2=A0 =C2=A0file://202_elflink_noaddneeded_vs_weak.patch \
> =C2=A0 =C2=A0 =C2=A0"
>
> -SRC_URI[md5sum] =3D "9cdfb9d6ec0578c166d3beae5e15c4e5"
> -SRC_URI[sha256sum] =3D "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53=
df906498afe6f6f8"
> +SRC_URI[md5sum] =3D "2b9dc8f2b7dbd5ec5992c6e29de0b764"
> +SRC_URI[sha256sum] =3D "71d37c96451333c5c0b84b170169fdcb138bbb27397dc062=
81905d9717c8ed64"
>
> =C2=A0BBCLASSEXTEND =3D "native"
> --
> 1.7.6
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


