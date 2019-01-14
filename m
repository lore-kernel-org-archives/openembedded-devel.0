Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5505B6D549
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 18:43:24 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id r14so93991qtp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 10:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yI2r4NqXa+hpPhnX5dBTzBvk3FzEAaaxF7Iw/IYP9M0=;
	b=KNfePrxcC6PfjHlywObRwYgTyoZ9a/LwNcrAnsKSg8Y4AXNwxXq+NnKhSFcs9zB4ki
	selMON/bHP+iIddgCYUDE8oVNyZpDGEAXojjBuAoQXImcQ+iiCIbWxl/FzXMm+SADiHO
	X0lTVKWP1UZ4N1bHks+3XGaPnqXhPgNFOPG90fqBbZ/OMhhkYLmlqc11nrIjVAPFT2HJ
	TSxoUlWEuPy4B0KhA/NX42dY74De1KsZ9L2QVcuEyCqdJNrhqCVynJ40OJcmPakUsauT
	RBLqUFJWPT7yeF7h7aY+BA2EMRtnZ3PjyrskPaURcepvDFBFJQU8/auXXB5kp6BoILQd
	AUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yI2r4NqXa+hpPhnX5dBTzBvk3FzEAaaxF7Iw/IYP9M0=;
	b=NMn1kRb5IECRi/T60s6OavabsODIe3I8lySMCTwZRC13cGW4HoguQxZIKtmNmEbMwr
	/IkqYhIuLfwppBYD0zLF6ShGJwo7RREMc8ncJS6brR7Sg3LdkXxSsD24EsHGz/dbGSU9
	SqUnmvMq2+EpmLu/upQWM0iUmL+w+VyKp+IuMDbXi6T3aaPj469OoL99sarac0IlF8Mb
	rSXtRUezgVF29NuRT41Mby/ejMsixOZ75yG1gPc8gmSk/7JlMXmmgw9mDqhuVZFx6uT3
	0bt1tS0U1cJabG9qGnabYeTXPb4W/Gkun2EiKxMLo2liGk8JhnCM9bHREbaRI5jNJk5h
	5+0Q==
X-Gm-Message-State: AJcUukfU/gTampGX/y6skCZ2qFfweI/Wtax1/+PIG+v8QcBiAWrX7gxG
	ACVx4wI27K24ZvFOOd4xJLbl6YIbuxnb6T1uJvY=
X-Google-Smtp-Source: ALg8bN5mVkdoNMgVASrItBZN+lqe9rS59LEU8LapTkQTPI7EQbfrHWU+T1sMzuRJW1l3tgiHCP60/KqnNgohwySDLhU=
X-Received: by 2002:a0c:93e2:: with SMTP id g31mr25304372qvg.194.1547491404967;
	Mon, 14 Jan 2019 10:43:24 -0800 (PST)
MIME-Version: 1.0
References: <20190112213132.2501-1-akuster808@gmail.com>
In-Reply-To: <20190112213132.2501-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Jan 2019 10:42:58 -0800
Message-ID: <CAMKF1sqtcs=7nnqtiimDX8m9hWGofeY-2zp7_MkCNt5kss+wfQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/9] drbd: update to 9.0.16
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
X-List-Received-Date: Mon, 14 Jan 2019 18:43:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 1:31 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../drbd/{drbd_9.0.8-1.bb => drbd_9.0.16-1.bb}             | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-support/drbd/{drbd_9.0.8-1.bb => drbd_9.0.16-1.bb} (75%)
>
> diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb
> similarity index 75%
> rename from meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
> rename to meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb
> index fa4d10b4c1..8794c4f917 100644
> --- a/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
> +++ b/meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb
> @@ -11,8 +11,9 @@ DEPENDS = "virtual/kernel"
>  SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
>             file://check_existence_of_modules_before_installing.patch"
>
> -SRC_URI[md5sum] = "c1dd58043f46e9926b579aa65d4ea980"
> -SRC_URI[sha256sum] = "87f72d46db9bad926415b3ab9f5f1397de8c581d2e2ec1addbdd5ce2604e6123"
> +SRC_URI[md5sum] = "6414a9eef2807c8210b6403e36ce3ea4"
> +SRC_URI[sha256sum] = "6074b0d643f4bbae4641d3b4bc30f4840e74f2a212dd9c6555b8141e530e5789"
> +
>  inherit module
>
>  EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
> @@ -20,5 +21,3 @@ EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
>  do_install () {
>      oe_runmake install DESTDIR="${D}"
>  }
> -
> -PNBLACKLIST[drbd] = "implicit declaration of function 'setup_timer'; 4.15 head file issue?"

This is going to now mean that kernels whic enable this module by
default will end up with mutliple providers
see http://errors.yoctoproject.org/Errors/Details/216468/
but I guess thats upto distros to decide. So I will accept this

> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

