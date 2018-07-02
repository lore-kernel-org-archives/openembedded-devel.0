Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id A4CDB75436
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 06:10:09 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id d74-v6so8512142vke.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Jul 2018 23:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1e38k7smIxEC7FMlkao8TTeD6nuxMT1inX0UbLSdmig=;
	b=PDN1hBHLGYuJ9Zxr4Nt+/PpEb25Nz/Vs7kFds/PnKKBqmuUc4EJvJRgYsroXOSvDUx
	F8j4dweUupqQGuAe575jBNhwzFM1W20dmZpUywDrV0nvQBAtV2fa7oI7a2Jyxdv/loGE
	sS5HYjggO7AHLW6Lq528eAVO43C8sWkmULDguxRL+XnXKmf8QGl5EzyiZ37K8UH3K7Yi
	2C9mpo+zPFTPqLVo07wLNTVCouzgCrQNdjnYfmtFtzGSqK/sMPOjizVkTfKHuHBJXzHS
	WAKH3FNZ9i84/U78TUziztld4/dWH2iFkSeFYYy4rmiG6OtJCiOYZxUJov+txsE1KZ7C
	kLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1e38k7smIxEC7FMlkao8TTeD6nuxMT1inX0UbLSdmig=;
	b=mhxZw/jaqj6FKOGQ5NUzlfwYXFaMBk4WHGPYhS63hznaRsl44FZid5gNjM0kYQA0XS
	G/rfJnUfS4s03BoEv3iWifw+2CSEeL2/J3lnOYctI6ZuOh6QCXSsD1cX+uTkDdTwZXhL
	bpXe1LyKBFDQToOS+9AygEQ2D4K9FbSsYDkbt1VwfLRZ+cCsaBBncpyBMllCnK0mZGS9
	goGCxIqA2lJCTKJlEA1U+dimyS6tOgmxcVCS5QyxDxXqA1tY72s2YrZFXXxZfl3hw4JP
	YRrd6xy8IGan+0NJ7jAHXhUi4CqbdyoIwpocEYnnyCLsdNmoE8u8acL1CuH5OY/AbTap
	+HzQ==
X-Gm-Message-State: APt69E0t//6eABlxumDv/daCNw4hhANVHKqDlAHtpHFGd0clkWNQA2n/
	lW0L1hc8EmMjmZmT4y0DwXipIjzYwUYZnyH5WqM=
X-Google-Smtp-Source: AAOMgpc0nnqr6igj/OLYIui1JE/oRCPGM18d/tQBqhbWvms+3ud2qCBkPVOM8BootWtv8p/OprSxam5uglFp+dQoUCI=
X-Received: by 2002:a1f:e605:: with SMTP id d5-v6mr4620452vkh.4.1530511810171; 
	Sun, 01 Jul 2018 23:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <1530498665-132100-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1530498665-132100-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Jul 2018 23:09:44 -0700
Message-ID: <CAMKF1spEavbzFD9JN8UDERdcawBZfjC_MkAwbc_j8d-r=nSCcQ@mail.gmail.com>
To: changqing.li@windriver.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] crash: fix do_compile relocation error
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
X-List-Received-Date: Mon, 02 Jul 2018 06:10:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 1, 2018 at 7:31 PM Changqing Li <changqing.li@windriver.com> wr=
ote:
>
> error info:
>
> id: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2:
> symbol _nsl_default_nss version GLIBC_PRIVATE not defined in
> file libnsl.so.1 with link time reference
>
> Recent glibc change removed libnss-nis module from glibc and
> a new recipe libnss-nis.bb was added. After this change,
> we need to include native libnss_nis in crash. otherwise,
> with "nis" in /etc/nssswitch.conf, we will met above error=EF=BC=8E
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-kernel/crash/crash_7.2.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb b/meta-oe/recipe=
s-kernel/crash/crash_7.2.0.bb
> index 440a69d..09fe50d 100644
> --- a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
> +++ b/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
> @@ -11,6 +11,7 @@ LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fa=
e504"
>
>  DEPENDS =3D "zlib readline coreutils-native"
> +DEPENDS_append_libc-glibc =3D " libnss-nis-native"

A native dependency which is specific to a target libc seems not
right. It should depend on
build host libc which in this case is always glibc so please drop the overr=
ide.
>
>  SRC_URI =3D "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.g=
z;downloadfilename=3D${BP}.tar.gz \
>             http://ftp.gnu.org/gnu/gdb/gdb-7.6.tar.gz;name=3Dgdb;subdir=
=3D${BP} \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

