Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2059D7469B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 20:57:25 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id j7-v6so3421615qkd.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7CXJ2cJbYXTKfzPHiuDihkKbLb0sj4q3KgRXlDtXYRM=;
	b=lCdHtYq9iSgPivHtny7iepnS0nC16RSidRb38SJBD56FidBnBFsN4B7UbLAV0m7DhZ
	Ffpdbkj3aAmiJge6HyurcsVG9/zYyoWUjI06Wl3VOMRXxLPKH1d+Vmhnjbg0XgR0lpOT
	BLgnP2NDHW/BqCQZAwIlHYQyeVaLrQgHm2vZFPQ69yJPfNRZASxzTwR2wDuY2UhxlabI
	9RnNvGg4BwHoFfE28FXGRjuy9OrXvduQsveFb/unE4UYC6r6OgPpAvIRm7uBdIgVDO3I
	QPVTuBYBoXZjld+3evbAa+pZvynEsvu55Uk0hdus/vubRa0tdN0pGBCAoFNEN1JgQ2vh
	Za8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7CXJ2cJbYXTKfzPHiuDihkKbLb0sj4q3KgRXlDtXYRM=;
	b=NaN0zC/tGUO+d/zChnhnuhSBTpOIhFvrvWbu+bdaRcA4znNj+jwILEGicArLYWLEHY
	JP0KnQQ/nmv7VvBBYMGBvSBWpk+VVJKasTOTAOgz9D1GFpobVG+savG5wNblkO7plxcY
	vmzV2IZ1OhCrJOrQRRdu31hxAoonKejJ77NzSUwVP80RtosY2tmVOR6SRAOOsaX60fmu
	RDbSkhVjNgAXlQirFTQVzTtTxr08i3UTojY8Pwbf3LsL26s2jGiL6qAY9tjcz4F1HbHL
	eJd40SlMcznQxd9pBorI8G5TBJQpZfTVWWszHs9U6WAB0ZrGKIi4sMbXLoo/WnQgC0TF
	dRgw==
X-Gm-Message-State: APzg51DZf5JLg4P6T01kIadeK8HiQNf2SGMRvmhpuZyi7aySNemmhahl
	7GJ7X4ASpmw7OFglM15Xz6nSJED+77oRbc234eA=
X-Google-Smtp-Source: ANB0VdacBAHJEJ02LCGKLnpbbHLiJ7guubo/D1SiGXbsC4skdHGTn3VHPqiBGiEvCi70vNsi0jjLGDEY040CQ3fJHlI=
X-Received: by 2002:a37:e118:: with SMTP id
	c24-v6mr25147142qkm.68.1536094646814; 
	Tue, 04 Sep 2018 13:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20180904115659.46185-1-zhe.he@windriver.com>
In-Reply-To: <20180904115659.46185-1-zhe.he@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2018 13:56:58 -0700
Message-ID: <CAMKF1sqm8h1A07vs7gMhUGLiE+=PZi8QC8EkV1gogHz77X8wQw@mail.gmail.com>
To: zhe.he@windriver.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] spice: Upgrade 0.14.0 -> 0.14.1
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
X-List-Received-Date: Tue, 04 Sep 2018 20:57:26 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build ( with clang )
http://errors.yoctoproject.org/Errors/Details/190549/

On Tue, Sep 4, 2018 at 4:57 AM He Zhe <zhe.he@windriver.com> wrote:
>
> Adjust location of spice-common source as new spice asks spice-common
> to be put under "subprojects" directory.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-networking/recipes-support/spice/spice_git.bb | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
> index 38b8bf306..022a09e19 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -13,18 +13,19 @@ architectures."
>  LICENSE = "BSD & LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
> -PV = "0.14.0+git${SRCPV}"
> +PV = "0.14.1+git${SRCPV}"
>
> -SRCREV_spice = "f1050bfc76c9c4146257e087baf74e0b62d7d218"
> -SRCREV_spice-common = "95743f40a2da39e0a19859c305e69e2c99d39e42"
> +SRCREV_spice = "eaa07ef15cfc3bf57a69da2576af66f028787774"
> +SRCREV_spice-common = "6b93b3fce8909b836ef1d1434d191900d8aa00be"
>
>  SRCREV_FORMAT = "spice_spice-common"
>
>  SRC_URI = " \
>      git://anongit.freedesktop.org/spice/spice;name=spice \
> -    git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common \
> +    git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common \
>      file://0001-Convert-pthread_t-to-be-numeric.patch \
>  "
> +
>  FOO = "\
>      file://0001-build-allow-separated-src-and-build-dirs.patch \
>  "
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

