Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 70B8472F6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:22:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so1316404wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I+bQbXjAi2MMAYtMSuqsguxSsbCtzFNiXgzWeQRxMw8=;
	b=UyClrRyFwlo84t/ATMSpCFWCMf9jOjPP0+fAQvH0Ix0wl54pEeheqNTrvmDEoUxJDU
	XlFl/t4KptKOnLLF3QO4JJSG6nkA0v9PPxe6yHg1arblKGDmIhB2FFCFpuqudGWXFCAR
	R+VeLDW9DXPuf3bx4BQTaA1ptkcNckUUCUJEuE83K+Z0SSI06uNzHNGdNTLLCxdAbKdL
	LkZGSdfpY4o3FsV7BhmOa+RhHrw8KaV7r1TDCKqFbGG8d+cUNbj4aK4jSVvbThmEQ5Us
	Qgqwg3ugNG6c5+k1QqZtWp8qPDI3ZAuluUjQqbqNxs0cWsg99Wv6m38RMxa4/AV3ZV9k
	RzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I+bQbXjAi2MMAYtMSuqsguxSsbCtzFNiXgzWeQRxMw8=;
	b=TJupVTH94kdhw+stPST9BNpQehEYq6KZHlsa5HrOYVLXq2amjad/ddGewOwD3fNCCy
	mnOZDOGCKg2SHALxAF/4sbSvDFp/ZR3G3Qt9uzUFTUnFfNLuc2TPSrvoYN/0U7bac1mw
	aihl/AuILISdLXbH5OkGB/q4a4ESKCeMD83Qu/RvEgltw4mdgIfS8x9Kj6gmqXv6DXc9
	CalZJb+Old4ECYAyK6VZdQF3zof1dr5EBVt8MM/IalpZT+E8TE1ViqvgY3OIKlh8VpWl
	DZKWx/Ai5c91Tn4Mfd/apqy2fwTvT2xyBnlro5zRhSGv+pEzr2HBX09+PsFaImIFPiIN
	EDvg==
X-Gm-Message-State: AMke39mmt6AlZkPzdKuOc2TzejNHFJNHtmhkWBbeIRA3rk5oQVUjZhbde7LT2+5amVEx6XIYBC7gdtu3KqozGQ==
X-Received: by 10.28.211.80 with SMTP id k77mr15811906wmg.124.1488273755245;
	Tue, 28 Feb 2017 01:22:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Tue, 28 Feb 2017 01:22:34 -0800 (PST)
In-Reply-To: <1487975723-10180-1-git-send-email-derek@asterius.io>
References: <1487975723-10180-1-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Feb 2017 10:22:34 +0100
Message-ID: <CA+chaQeS8Ld3S3mveAR7khLECbax-eGejUAEyL0vrPJrP8AH9w@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] efivar: unblacklist package and those that depend on it
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
X-List-Received-Date: Tue, 28 Feb 2017 09:22:35 -0000
Content-Type: text/plain; charset=UTF-8

It still doesn't build, recent log:

http://errors.yoctoproject.org/Errors/Details/134285/

probably missing pkgconfig inherit as above those undefined references to
popt* it also shows:

/bin/sh: 1: pkg-config: not found
/bin/sh: 1: pkg-config: not found


On Fri, Feb 24, 2017 at 11:35 PM, Derek Straka <derek@asterius.io> wrote:

> The package appears to build without modification
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb | 4 ----
>  meta-oe/recipes-extended/efivar/efivar_0.24.bb         | 3 ---
>  2 files changed, 7 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
> b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
> index f2b9454..b25cfca 100644
> --- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
> +++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
> @@ -25,7 +25,3 @@ EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS}
> -I${S}/src/include `pkg-config --cf
>  do_install () {
>      install -D -p -m0755 src/efibootmgr ${D}/${sbindir}/efibootmgr
>  }
> -
> -
> -
> -PNBLACKLIST[efibootmgr] ?= "Depends on blacklisted efivar"
> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
> b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
> index 4c7793f..f641a30 100644
> --- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
> +++ b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
> @@ -40,6 +40,3 @@ do_install_append_class-native() {
>  }
>
>  BBCLASSEXTEND = "native"
> -
> -
> -PNBLACKLIST[efivar] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/132821/"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

