Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id CC1CC7ED22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 03:09:09 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 4so575946qki.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 20:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9YxKrCjmUojKAOW3RsWn+w1gN0+aZiwvErwM17H6rQI=;
	b=Mnmgi/Tf66HZefRDJCMpxmahn0N2mfjXQ/M68tL3hor5Xsh7Q49P1NCTNL7k98AbGJ
	lR+BkJRMB3OJFxUtukFgKwaDJeicaukZKam6l/IGWbhdCaaZAQeffheUdxFngQ0XInYy
	8yOivp/OatkoeECS4au4hIbxG9FfoMlM1jb/TqHrss1FKC4PeXD+WtfIV6gf9nKM56vH
	G1vv+gKaKGl3/y15IeN8Bt3WgZUSUZGnGy9HzhHnZzNZvzCHHNrasTRkKYf8nk5miu+p
	ELvbZ7HOHL8sDPZmAPK32yWHQUdcvBvKLOHJdjaUNo8OxCSaARhbPzxXSsvhrezdpWw3
	6iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9YxKrCjmUojKAOW3RsWn+w1gN0+aZiwvErwM17H6rQI=;
	b=ON2fRzs6yAsBytK4FgJYdMdz3dHXdDdh1nZl/C+sVFeTZRP4mJ6TqcUGdbADkV4ogo
	Vt6gFWUN+fgho04I07I8Y1QmR7QrDMRsqAChFaUxTbctqS4HSsWnRZtcrAeP3YFdB3tO
	1CroNbTXluDY/PM8i6SMPnnFgQrP9yvC3BAOnDTCOqAwtGULY+f4aL6QYCvUVzmH5t1T
	+qtNSLDDxzDrTI0M1UqbaEcLNSQneDidEz1masgKETpZGmTApPFhU1L7dd4lyhwqLld6
	A69ch2llNOemlljo5GQmHw4fbzkGOTXJ1ugwaA026qI9FRa5fOpQNClKb/k/ZHL5vB9x
	PqWQ==
X-Gm-Message-State: APjAAAWkMTrgc81MPnZm/+1N6NUFCV/3s4vOLjsf1il5Gtq3oSJBUwyn
	lZBw+4m/rVappFcJna247yxLqprCJxIEhB4oaIPbc57YRB0=
X-Google-Smtp-Source: APXvYqwI0JHfV06h4a0iecpjykadTYAEAeZbC+eO9EIekr0vxb17vJo3Wxe7Cu4CCZV4l+VqmnRcGLKh0U7g3QMU9lI=
X-Received: by 2002:a05:620a:13d1:: with SMTP id
	g17mr1240453qkl.9.1569467350204; 
	Wed, 25 Sep 2019 20:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190926005223.12612-1-open.source@oleksandr-kravchuk.com>
	<20190926005223.12612-2-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190926005223.12612-2-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2019 20:08:44 -0700
Message-ID: <CAMKF1sqUXPNTAq+BLdsW0GOXVssYd97zw68-aR9=OHOOuLC=PA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2][meta-oe 2/2] tesseract-lang: update to 4.0.0
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
X-List-Received-Date: Thu, 26 Sep 2019 03:09:10 -0000
Content-Type: text/plain; charset="UTF-8"

Fails on musl

https://errors.yoctoproject.org/Errors/Details/272006/

On Wed, Sep 25, 2019 at 5:53 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../{tesseract-lang_git.bb => tesseract-lang_4.0.0.bb}      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-graphics/tesseract/{tesseract-lang_git.bb => tesseract-lang_4.0.0.bb} (82%)
>
> diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
> similarity index 82%
> rename from meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb
> rename to meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
> index ac36a91a3..75c2bc00e 100644
> --- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb
> +++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
> @@ -3,16 +3,16 @@ SUMMARY = "tesseract-ocr language files"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=9648bd7af63bd3cc4f5ac046d12c49e4"
>
> -PV = "3.04.00+git${SRCPV}"
> -SRCREV = "3cf1e2df1fe1d1da29295c9ef0983796c7958b7d"
> +SRCREV = "590567f20dc044f6948a8e2c61afc714c360ad0e"
>  SRC_URI = "git://github.com/tesseract-ocr/tessdata.git"
> +
>  S = "${WORKDIR}/git"
>
>  inherit allarch
>
>  do_install() {
>      install -d ${D}${datadir}/tessdata
> -    cp -R --no-dereference --preserve=mode,links -v ${S}/*.traineddata ${S}/*.cube.* ${S}/*.tesseract_cube.* ${D}${datadir}/tessdata
> +    cp -R --no-dereference --preserve=mode,links -v ${S}/*.traineddata ${D}${datadir}/tessdata
>  }
>
>  python populate_packages_prepend () {
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

