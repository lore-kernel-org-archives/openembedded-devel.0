Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8098D7EF31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 14:50:33 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w17so5006369qto.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 07:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8Vz31W6uTiPvPC51hJtKyeNHfoTt/bhjmsFAg8YoL/0=;
	b=iFbIFBWl4lqNrkTAcQzq4HMDn4qpnpQrxiLNp0fnr3EU24s1DXYqErLwzMdPwy19sW
	Tz84gYA7sDNnPBIIoRGwLXOiCpgCQ2DJ8MlalV/J+rNwMdtkLBaaKSK1OUkIlKY1DRar
	tSINj/WOCe5rZNQIxl5diR5nwimgeJbPRNRpCefDVtje5o3gdZ3x0SyfyYv+ee0F4t1e
	v5twBnT7vX8ID50kKKbedH84sughKqQcED1CZZI5XSF0TlI3EH0dRNOMAl9g+IvYmFBt
	Bjn2Bfrj4GMA5GoNDP/SxUSRhx7qZtDUsKa8xZHH9AeRQpP03NCesl23EfqGc1pc4rbg
	p6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Vz31W6uTiPvPC51hJtKyeNHfoTt/bhjmsFAg8YoL/0=;
	b=epVK5g33oSlLD1Kg2c4JewzUK+phV3bfi/SQkyFZrbY9gy6WrzBTY3xCwPvSFtejBK
	Qr3s9Yghc+kyXZWLaIQJS+7v8sT3C2nmEelN92ociAW5UpPysG3T5ZpO+8OX5wO1D/Kw
	vTiE/5CH7fMq1jLRUuY6NFIHuG/lb02+WjbH+A2dQBApCHHbH4b8ig1FSTJ/QThy/iuF
	I4mqecOQEba3U3mHYmP4dvdZWrOEKQHprO404RKsJNjDTz3spN9CaQTR3uf8tPdCu+0o
	FrMhhHjAml8xsLIDcRfxUshBFe8YSrKLjEhRQKgUbUcccJADNgtM3yZ3+XHMN7nvWohW
	dfbA==
X-Gm-Message-State: APjAAAUY9X1wPS8xSpvqjvchD+N/qaGKCpoWBmVG50hYs6tPDMbYnAGK
	miKcM/V/4F2tw/z7eO5eVa8xHiCfgKs6JlRMOP70Q8j3bQE=
X-Google-Smtp-Source: APXvYqysXeuVHGulYtipM6iOESC9ctA6ieBIuBh9gSJ5inNHXkytyCe+uqTrInAkvcTeE/RsFPp/NX3qzIE9ofk8sZo=
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr65047529qvg.181.1564066233999;
	Thu, 25 Jul 2019 07:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190724145100.88293-1-psaavedra@igalia.com>
In-Reply-To: <20190724145100.88293-1-psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Jul 2019 07:50:18 -0700
Message-ID: <CAMKF1sr=ZDeq_CaJeo2UiezXAOpcRfwR7EVacDczSqT5zWtn3g@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH v5 1/7] pyzy: add pyzy recipe
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
X-List-Received-Date: Thu, 25 Jul 2019 14:50:33 -0000
Content-Type: text/plain; charset="UTF-8"

This needs

CXXFLAGS_append_class-target = " -Wno-error=narrowing"

to fix DoublePinyinTable.h:86:1: error: narrowing conversion of '-1'
from 'int' to 'char' inside { } [-Wnarrowing]


On Wed, Jul 24, 2019 at 7:59 AM Pablo Saavedra <psaavedra@igalia.com> wrote:
>
> The chinese pinyin and bopomofo conversion library
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  meta-oe/recipes-support/pyzy/pyzy_git.bb | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pyzy/pyzy_git.bb
>
> diff --git a/meta-oe/recipes-support/pyzy/pyzy_git.bb b/meta-oe/recipes-support/pyzy/pyzy_git.bb
> new file mode 100644
> index 000000000..2a1df6187
> --- /dev/null
> +++ b/meta-oe/recipes-support/pyzy/pyzy_git.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "The Chinese PinYin and Bopomofo conversion library"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
> +SECTION = "inputmethods"
> +
> +SRCREV = "6d9c3cdff364e0da75e1c26222240f26370ebf73"
> +SRC_URI = "git://github.com/pyzy/pyzy.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS = "glib-2.0 util-linux sqlite3"
> +
> +EXTRA_OECONF += " \
> +    --disable-opencc \
> +    --disable-db-open-phrase \
> +    --disable-db-android \
> +"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

