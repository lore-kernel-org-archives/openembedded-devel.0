Return-Path: <raj.khem@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3E79C65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 02:41:38 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id u82so1688319ywc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 19:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=rQQ0IK9WhEznBmL7eQ+17d2jEQ/Y8goRmwNaqOwS5uI=;
	b=F30CCp8F1uAkIJnWaK8dG91qIxWurZhSZ0lQceQd+ei0QqsjUmbDsztpzp2T0EDofx
	y1Pl587ExhAeKOklpAZfsPobwYdJhpiUmRWaxAuRAGsn1tt87eFJCDSd7r90ukbXHMdJ
	lpaR6bURzLtG0JJmnlmYcwUVyoyBJAt4CXXFbOPJ4mal/ve4RNs6DIDo5WB24wfbucWT
	LplIT/pHuqj6g7P/rEbMMs7oWXNiz4S2qCxpq3tk9zfWFdm25xlYeWiUN3gkAEK4ZTaK
	RTHoWoBB/4Chi2Z44TukTHu2GpGskm2X+JlSlXgGukyfZim2GR17MphwnqD4L8ilvxph
	gofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=rQQ0IK9WhEznBmL7eQ+17d2jEQ/Y8goRmwNaqOwS5uI=;
	b=AbZF/KbWW+nuG120Ks6/y++c3wX9FPbuL15yr0rL15OLgJjoPo6qvHM/6bFBOrloNz
	tjTqAP/E4F3OGi4mNFWg5lRk8DNgwJ2+SdHyo7ACZxOuuqg+1nwKXRPiF/CikYOgfnvI
	gwZqEmwG+iNgzbB78+P0wkIyNYRMgw5l2tPi7vwDANXIzoS7PEsAgSODa34Obh0S3ODW
	l7p3OhKDsIjjTb+ppxTUHZB9/TfK7RyPTVCSwnsvydZSZKRaEtuvvCCXV2oZk7QFO19I
	XbSYlrIhk0b5hv5ATPi3PIE5SA6XyFVOJrzyfr/eS7mrRBeRZqeGIJyzIJnbCh/b16Hw
	I+Hw==
X-Gm-Message-State: AE9vXwPTiR5JEuuAfrGBj7LAHEviSJKM6lIvWXOwduW5wEbJ0wSqPuaT0e3ZIZHY63badxY3LyOiSh0Njln9Bw==
X-Received: by 10.129.42.213 with SMTP id q204mr33873199ywq.269.1474425699471; 
	Tue, 20 Sep 2016 19:41:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Tue, 20 Sep 2016 19:41:09 -0700 (PDT)
In-Reply-To: <1474159646-8902-2-git-send-email-schnitzeltony@googlemail.com>
References: <1474159646-8902-1-git-send-email-schnitzeltony@googlemail.com>
	<1474159646-8902-2-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Sep 2016 19:41:09 -0700
Message-ID: <CAMKF1srsroUidAY9TRiuxT9KWYru5Guq22F2vSnYg_cw2EmpCg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] imagemagick: depend on fftw not virtual/fftw
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
X-List-Received-Date: Wed, 21 Sep 2016 02:41:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 17, 2016 at 5:47 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> index adfcf55..74fe369 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> @@ -3,7 +3,7 @@ SECTION =3D "console/utils"
>  LICENSE =3D "ImageMagick"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D22d47a47bf252ca3ed7f71273b536=
12e"
>  # FIXME: There are many more checked libraries. All should be added or e=
xplicitly disabled to get consistent results.
> -DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freet=
ype"
> +DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"

have we integrated all of the fftw recipes ?

>
>  # Important note: tarballs for all patchsets within a version are delete=
d when
>  # a new pachset is created. To avoid multiple patches for each patchset,=
 try to
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

