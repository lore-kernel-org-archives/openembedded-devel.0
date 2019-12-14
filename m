Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 01A2A78F72
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 02:36:49 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j5so758569qtq.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 18:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OGP2VZ1aS02Ty7HeRPbMreQOD+FI8NmFkKEukyf1sQA=;
	b=keA/pbhMoTZeE8Tk5s1006hz/CDMbCo9wWAYSf+1GfTOnydG75x4A/z78oXBJfGP77
	WUiEyiNfqXdP23JBUgx3qz5t++kGYyJi5CCFwTlOdC8k++W665tS50IPRBu3XeVf5Si3
	zXCrWrc9vdoGp+JgirD93lfjTWmFfN2pSzS8x8Rz6Wzb2o/0fQa4L6JIZ+Y/NC7s1k4C
	3MD3guCdW4G23Cd78NyvK082iIFhJaqclVPTkaRhNhphoHUknbu0xLW4MJmMTS5zpucs
	XtkgueShs9AZeLUjHy6nU6/1rAPeTqYQ1wdFeowDtaEy0etWhnYvAxtcv3T6zZenFVCs
	GOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OGP2VZ1aS02Ty7HeRPbMreQOD+FI8NmFkKEukyf1sQA=;
	b=VfuL2M6K88zVsxLU6x7a5I51xzAPc1you7ZrdhVIkReVnRezNyVHGHWlZ7bIcA+8W5
	hsp0S3+cuGvNCIYbtu5itjmTT/qzC+wDkFabYgIJuwM/UFac0CYcowR1Vj18XMn5tg/u
	zgRJS5ytj8mtrPwpSCkMggLkgG1f62rRtqoCpDiHJRKhfJEGzTmi9eAxIYHveOnuijkM
	rvoEPjEsoxcu85LZKhYmATnqbk15z5iDpb0KAlKshmWmQFrVLI5tiPh+oqmximHE5mgH
	OH9HECab3QKwES/hxfUCjUo8D8Y/0GGiJI/tN/eowDMF2v6uE17I/CDSIpG8/Ge3LvYP
	2D0Q==
X-Gm-Message-State: APjAAAUmjTKhtaw6GyHqosW9c7sGs7FVBJ+I6aLeau/PIs1mq8ND6mPL
	MM42aigAV431X3wk3CAH7DxOaTIMQod5UFHRD+w=
X-Google-Smtp-Source: APXvYqw9OS4gY1hSWvHu336f8JF4MpurzSOzojCKdAVcJmPLUwQndQT+GopqQqIOFBJc8sCJaIcWBDxTwtywzqb2QLE=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr15329877qtq.53.1576291010669; 
	Fri, 13 Dec 2019 18:36:50 -0800 (PST)
MIME-Version: 1.0
References: <20191211000845.13166-1-schnitzeltony@gmail.com>
	<20191211000845.13166-3-schnitzeltony@gmail.com>
In-Reply-To: <20191211000845.13166-3-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Dec 2019 18:36:24 -0800
Message-ID: <CAMKF1sqDizC0FHRpoTB-BB8gEDyqu8zTa9OX7UMqh3x74M-18Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/3] gjs: exclude mips build
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
X-List-Received-Date: Sat, 14 Dec 2019 02:36:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent another patch to fix mozjs which inturn fixes this problem
so we really do not need to exclude gjs for mips anymore.

see

https://patchwork.openembedded.org/patch/168002/

On Tue, Dec 10, 2019 at 4:09 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.58.3.bb
> index ddd5196b2..02e3e75cc 100644
> --- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
> +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
> @@ -19,6 +19,10 @@ SRC_URI +=3D "file://0001-Disable-tests-on-host.patch"
>  REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>  UNKNOWN_CONFIGURE_WHITELIST_append =3D " --enable-introspection --disabl=
e-introspection"
>
> +# for mips qemu crashes compiling girs
> +# see https://errors.yoctoproject.org/Errors/Details/296905/
> +COMPATIBLE_HOST_mipsarch =3D "null"
> +
>  EXTRA_OECONF =3D " \
>      --without-dbus-tests \
>      --disable-installed-tests \
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

