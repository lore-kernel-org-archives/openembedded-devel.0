Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id F210774C37
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2018 09:28:28 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id p3-v6so15419689itc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 May 2018 02:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gnoFZksVRzEntMY+NMatgoaa9pPdNreZblXR/Iu5G90=;
	b=PYv+9cYiJDsKglHAHcgvq4pkKs5+rL1HV54Aoz1NbcuxReQ75We5nA96BKbJOeneL/
	0g/jDPkFnO/+HEFRYNEE5YrTxWA9WWuwcqOVu5Jke3/CN8jjpgMPuGtlxIC6yS+6pBhP
	XCtEp7150Px8PqSqReUjFLmahdNfSfivhkcvct5gx1C4VPEkBrj4NuFa2iLf2/XXppoM
	nzq2I28FfNG7r0+AtKdP5Zr6RAOo0AR89t3fXKTkHj66Aj3D0sV9bmDL86xUCKU5Acxy
	9GmjfzH7rb5FxGcKvWcHcpon1Jc3jzZ9flMw9Xcm4USxPiv3U+IDpGv24a5nbY8/50P/
	PXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gnoFZksVRzEntMY+NMatgoaa9pPdNreZblXR/Iu5G90=;
	b=beGuOB4eiqNhRcO/2rPTkQsmA6CuWKm3djqpKoHddD5p7w7YxylXkegdC1/ED4ADF3
	KaYTmaGIgT5bgJ/vDKcyB3MuCsZAHApfoJ7RtIx92uVK4ZgLROEyLY5uZbuobr6Ril4E
	S1L9XL24jvYcf9sgoKauBsnTE2S3TIgNOKA1qnVY1pfTwyOkl7s1SHA9onZnCnli0bG5
	bzRn6r0+cUpLuUGFOn2K1v0BScjs1v0tk2rptl6QrskFmrSzFM8lSpitoGE7Z1rt15+B
	cktjt+wAVS3FT3nfaO9KlNe+ht+Flks0wmU4Xv1MhlOue6uVUWyM/abmRrZPsIHZYb2r
	N9+w==
X-Gm-Message-State: ALKqPweDON2wwRX+Ye7Q8NOtfpfDDEBgBCO5Vlt+Mn7XMz2Y89R/VNw3
	HpMuciES1F2tQW0T7nTK0W5F/3hm9sM2UcBk64gSDw==
X-Google-Smtp-Source: AB8JxZrUpMqBz8JLMBt/qmvSkGd/ldLy49HqSDI/O84MA1ONIbIrrIK4x9ebRzQpy3EjVZC3qFwHzaP6huWAwune0VE=
X-Received: by 2002:a24:d2c4:: with SMTP id
	z187-v6mr5126758itf.60.1525771709830; 
	Tue, 08 May 2018 02:28:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Tue, 8 May 2018 02:28:09 -0700 (PDT)
In-Reply-To: <20180504183725.22134-1-mac@mcrowe.com>
References: <20180503094308.7549-1-mac@mcrowe.com>
	<20180504183725.22134-1-mac@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 May 2018 10:28:09 +0100
Message-ID: <CAJTo0LZ2G_4cMxoAQm2AWgRnkeP5VXRURH9c82qaBpA0bop59A@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@jci.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCHv2] jdepend: Retrieve source from Git rather than tarball
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
X-List-Received-Date: Tue, 08 May 2018 09:28:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/1=
14916.html,
fwiw

Ross

On 4 May 2018 at 19:37, Mike Crowe <mac@mcrowe.com> wrote:

> When Bitbake downloads jdepend-2.9.1.zip itself and I download
> https://github.com/clarkware/jdepend/blob/master/dist/jdepend-2.9.1.zip ,
> the calculated hashes don't match the ones included in the recipe.
>
> The hashes were last changed in commit
> dd5c43fca8289b8795a9214aee616775e1493109 on 1st March, but GitHub claims
> that the file being downloaded was published on 20th January, so I can't
> explain why they are wrong.
>
> It seems that we can't really rely on these tarballs to remain unchanged,
> so let's download the Git hash that corresponds to v2.9.1 instead. This
> should always remain valid.
>
> Cc: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  recipes-core/jdepend/jdepend_2.9.1.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> I'll let whoever wants to merge this decide whether to take v1 with
> the updated hashes or v2 using the Git repository.
>
> diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-core/jdepend=
/
> jdepend_2.9.1.bb
> index 5f09a8b..dfbf493 100644
> --- a/recipes-core/jdepend/jdepend_2.9.1.bb
> +++ b/recipes-core/jdepend/jdepend_2.9.1.bb
> @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D
> f5777d32a7709d558c2877d4a6616230"
>
>  HOMEPAGE =3D "https://github.com/clarkware/jdepend"
>
> -SRC_URI =3D "https://github.com/clarkware/jdepend/archive/${PV}.zip;
> downloadfilename=3D${BP}.zip"
> +SRC_URI =3D "git://github.com/clarkware/jdepend"
> +SRCREV =3D "57980590313a5dbde236a3eb2c8958e9e53e6a10"
> +S =3D "${WORKDIR}/git"
>
>  inherit java-library
>
> @@ -18,7 +20,4 @@ do_compile() {
>    fastjar cf ${JARFILENAME} -C build .
>  }
>
> -SRC_URI[md5sum] =3D "9b91efe1d770e023893f89f4dde8434e"
> -SRC_URI[sha256sum] =3D "536b5082d64e4f4dddd514ce30178f
> 36c7a31b34d969275f278f72e522e7f7c9"
> -
>  BBCLASSEXTEND =3D "native"
> --
> 2.11.0
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

