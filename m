Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBA071957
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 01:35:02 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id g53-v6so4017949qtg.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 18:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nD6vTbrNo3usoSITTXX5F/yoM6S9/K4iwKKwMwEmqfs=;
	b=KfJrwUKzr0F5jwMfX7JXXI3voMXWLicasazNFO6wfVBBxRuAg9+pqm6a+v2lbGC35T
	GT5YE1oc4uatZAqLbM8JHwRYWWadr6lJbaEA3a5Vb+rnEmEXBgIJhakEGXoRL5ajKfjZ
	WUhX9nHx3gn6HAH5gO9/sfcdzvu7a09YgDPwcO+HQja3DhKX/Uza543tCC4SuyzM00yN
	jpIstN6EH7Q0eShiNBnjBtq1+7Xf6VrpJ8Md10TqUNq1FQRXZZWXGxe0LctvlvGX/j7j
	SdEOSxlh1vpv9XLm3DMaYmeCTlk3wy9VkPxg5dckSq/x/DQ4azgJ5oAH7tpFwUwSWvWo
	PDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nD6vTbrNo3usoSITTXX5F/yoM6S9/K4iwKKwMwEmqfs=;
	b=PHdIFLUR/EhhDqVwuv+D8Jp2WuHuqsXwU0QWEoNgXw+SQ02g0KoE+0nLZG3aKjJkKa
	PeXXcdei2mCw0mIIEJCUvXhQjOoXe+gDVwfX/fdo9QBTKT9jbAQ7dMQ/TtGE9/YEOIcO
	hqtG6iKNwXhlijwnV1ggRQIuM54hcliwh04ik1O6qVscPOnxJBNdNRc+ZfvZASXwVSt2
	JUvg8YGHXp93q/wTGA1/D1Bt/eA9xtIhQwFS6VIKp90LTGucR9L9w01tO6DNr0rfCB9h
	vG9jqUKsCh2BBr6cl3FLyDTR/gvMNzJgTVkGpl4T3x5Xp0zDyBKKTnon80ta31zD1oJK
	plkA==
X-Gm-Message-State: APzg51BfVGhY2nMV4A8Ksp+Xm1ZKYa8PGDSo6CJYtb8ZmdWUqgJ4ntRM
	P+F9o4yCJmyhjK8hmimBq+zNBDtss8tjJrX4lD4=
X-Google-Smtp-Source: ANB0Vda8m7Bf7jogUo9hqlb5HGJO8r4c+uZ9dD2g4qtkvBnXdhMUkFCdTbDeOUhAFaiudHwMTC6/Wvopbib9bawVkSg=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr4498320qte.218.1535506502935; 
	Tue, 28 Aug 2018 18:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <1535482087-19250-1-git-send-email-texier.pj2@gmail.com>
In-Reply-To: <1535482087-19250-1-git-send-email-texier.pj2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Aug 2018 18:34:37 -0700
Message-ID: <CAMKF1sqvY9Rx7dtf3tRKzi2f9+sagj4=HQGM3eK-tkFpTnsxsg@mail.gmail.com>
To: Pierre-Jean TEXIER <texier.pj2@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] spitools: 0.8.1 -> 0.8.3
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
X-List-Received-Date: Wed, 29 Aug 2018 01:35:02 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Pierre
On Tue, Aug 28, 2018 at 11:48 AM Pierre-Jean Texier
<texier.pj2@gmail.com> wrote:
>
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
> ---
>  meta-oe/recipes-support/spitools/spitools_git.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
> index 3f6cdc6..4944e25 100644
> --- a/meta-oe/recipes-support/spitools/spitools_git.bb
> +++ b/meta-oe/recipes-support/spitools/spitools_git.bb
> @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
>
>  PR = "r0"

Drop this while you are here.

>
> -BPV = "0.8.1"
> +BPV = "0.8.3"
>  PV = "${BPV}"
> -SRCREV = "318bcae5249722873bf58b27afdd20473c7047cc"
> +SRCREV = "a3f1f68a048d0d2321ee562b3744dd1162cad22f"
>
>  S = "${WORKDIR}/git"
>
> @@ -16,4 +16,3 @@ SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
>
>
>  inherit autotools
> -
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

