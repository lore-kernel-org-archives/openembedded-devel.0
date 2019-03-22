Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id A66127C752
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 08:57:22 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id d201so1097733iof.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=dzvsuN/VfJwQC3Rfsa2zBLYNFBSAH8BOWjbrUBBxUDU=;
	b=Yjwv69VBwIZ/7IusT5XvpSWUmB1lroVFatys55h5sAL079bVAA956zLVcp/OIhC8Rc
	nb5FdKzbTiDRPMEFCQS247ndOgTEEgFbr0TC5W9x/vv8CG5nzHKMdOIZ94Fk9NQvjmM0
	Da9K4sVfhiDYlT97W+IbzziATvD2KBhImpC+BiQwzeohqeHHLLAxbDYEB7Ov9UhNfw6T
	QH2wGkKRiQzStnibZdfMqGgYdK/cjK7Fq1PjB533NAvpVV9GrFaSIGQwr6a8eNikOTwE
	U6ZHwTgJitl1mn/R68M+O+zdeXVQ4/R0eu/QUutr1NU7PShkwpMDmoS8Np7CJkwJftMg
	au7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=dzvsuN/VfJwQC3Rfsa2zBLYNFBSAH8BOWjbrUBBxUDU=;
	b=KaHbv2G/S7po1dOd6IsBOb0eqadFOGogqYsNzMRVZsYsclkdqNW1aGFsbiHNdybHvS
	/UkxNW96wPqEAYf3jtc4M+naWMlhDY2sHB3MioXeBRKcT55Y9Wcih2YrLLNwkMiYbfjd
	Yap/NMUc9qAgzqjjZArT1pvDoqBPY43Bv3uJlyvlXes1b/9pbYz3n6aHrvWR6loqpVuq
	AerLhaCqMSaa5BefPGDiEhYO0sjW8wI0bx2Upa10d6OCaldAzVUQ+iV8htCp/4OTrrw7
	r4Z+N/B6bZ2A+8krLeZYBQNck2Fh2SW6hGbpbatRo4Jc2h4SMc1ZmlMdzXuJRAnpIhtx
	XvXQ==
X-Gm-Message-State: APjAAAVdFRF1kSWy/w+a1GYtqzvw8CNEKF8PL5WcjtzqCOfxLFGu0mkz
	czLpzf2fBr0m0w2xTkVZlVu/CTxbL+2qCaQbgtit6A==
X-Google-Smtp-Source: APXvYqxDcqPxqL1pX/0EJWeJ8Fb0E8a+sLgFbqnsQ+RCpVMOCBCrsvMA308gm91KZds0aDK+eZqfUA3Y4ACycCU170I=
X-Received: by 2002:a5e:c249:: with SMTP id w9mr6025545iop.284.1553245043263; 
	Fri, 22 Mar 2019 01:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190321094350.24576-1-schnitzeltony@gmail.com>
In-Reply-To: <20190321094350.24576-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 22 Mar 2019 09:57:11 +0100
Message-ID: <CALbNGRQs1Zat6G5EPyZvZJg+MczKZi_uEpYNjsYCCmQx=BY4uA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] physfs: upgrade 3.0.1 -> 3.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2019 08:57:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2019 at 10:44 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Announcement [1] says:
>
> This is a collection of small fixes to 3.0.1. All 3.0 users should
> definitely upgrade right away.
>
> [1] https://icculus.org/pipermail/physfs/2019-March/001280.html
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../physfs/{physfs_3.0.1.bb =3D> physfs_3.0.2.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-filesystems/recipes-support/physfs/{physfs_3.0.1.bb =3D> phy=
sfs_3.0.2.bb} (74%)
>
> diff --git a/meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb b/me=
ta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
> similarity index 74%
> rename from meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb
> rename to meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
> index 18bedb892..8dc30bd5f 100644
> --- a/meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb
> +++ b/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
> @@ -9,7 +9,7 @@ inherit cmake
>  PE =3D "1"
>
>  SRC_URI =3D "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2"
> -SRC_URI[md5sum] =3D "359f102bcbd62accf84ef32f4863255d"
> -SRC_URI[sha256sum] =3D "b77b9f853168d9636a44f75fca372b363106f52d789d18a2=
f776397bf117f2f1"
> +SRC_URI[md5sum] =3D "dc751294aaf59d1359bbe34e693d1d87"
> +SRC_URI[sha256sum] =3D "304df76206d633df5360e738b138c94e82ccf086e50ba84f=
456d3f8432f9f863"
>
>  EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', =
'')}"
> --
> 2.20.1
>
Just saw, that the license checksum change slipped through (this
happens from time to time - strange) - will send a fixup soon.

Andreas

