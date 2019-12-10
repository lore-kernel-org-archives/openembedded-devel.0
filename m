Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7437F965
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 22:54:36 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id z3so4948245qvn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 14:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0tc2fRHiGBJPRJfark220nYwO7gVUHT5qV3xKI/laSs=;
	b=JJjkVSm6An8euDYCcTSlQVXjRvJmXS2lJ7XwnP+oyQlFknd3HQmCn2cM4kCIDw3lMV
	LnNf9hsiWLaXE+gNkP5deYraCZf0eXJ47qF343EAOa2wHWj+Ln3ftUd03h0BK2UVNT9N
	utdRD/8PNXHp+UHYDlB+bYFVTuZ7ljz0OpFQuwLx2u46poQEqEl63OhVns2Lngj6r0rn
	DpM6H24wZi395l6O0C9+0n7dzeIKgVLVR54jgjam7HptJQu0rUgIDZ3FGBgRI9/LbWZ1
	LDftQfEwAa+zFJXfkTCAaHu+Ul2wGwfEXm5ahhJb6Sre75ePmjbof9/fd2G08LMYcNRb
	h9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0tc2fRHiGBJPRJfark220nYwO7gVUHT5qV3xKI/laSs=;
	b=ZsaDMLUpjIa9y2SRuGF7UaqNIKoLLxq3XWl54ZN99qP2jbJw6JT9N2nVbci04idzKA
	018FJAG9gByOiMemupvplaChJpcOVwjK27AuTbDQyx/9LT+TEeGq8cf2ALqPs98jHxc7
	gzeHUPLoBUyVA4KYwG4sfEfouFiguV4ehA1Hta7eooUALWPNkg1A8AWVMuy2fI5i3aYb
	qZznwJxJGKvpb83KJv/7Yt4SY0FB7M9jtNKEQjuXon0VUX/og9dMZQK5b3P+CXTPaYD7
	/b/38BU5ZXo+pWzj+yIYQ6P+Nh3XH2GeiJUWo5tCgWsnSErKNwA7qwAaz4HEP9kd6yLy
	nTbA==
X-Gm-Message-State: APjAAAWSmrfoJs1w1F4QqCIc/NkAwVcuLILvczLlAf0JK0eYb5tPPhRQ
	xrARBJRpGufKpVqkN+/3WZzZvI9nibbcqd3qkYI=
X-Google-Smtp-Source: APXvYqwF00FxRLoZZJuLh64IfSTqAcWspGaB3A58+meCVN3bnYD+KuUslji2YGgaNPXErUKTbVGOiE+W3tvxvEp6BDA=
X-Received: by 2002:a0c:ada3:: with SMTP id w32mr266839qvc.99.1576018476443;
	Tue, 10 Dec 2019 14:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20191210093850.6292-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20191210093850.6292-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2019 14:54:10 -0800
Message-ID: <CAMKF1spvn+Uqi2q4QsxajLcY0wjPN6dG3vSW-gS4=qmu2dcrbQ@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: update to version 6.0.14 and unblacklist
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
X-List-Received-Date: Tue, 10 Dec 2019 22:54:36 -0000
Content-Type: text/plain; charset="UTF-8"

Fails with clang http://errors.yoctoproject.org/Errors/Details/296908/
I guess it needs to use KERNEL_AR

On Tue, Dec 10, 2019 at 1:39 AM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>
> ---
>  ...oxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} (92%)
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.0.14.bb
> similarity index 92%
> rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
> rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.0.14.bb
> index 0f8d7af3f..bd7339e1a 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.0.14.bb
> @@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
>  SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
>      file://Makefile.utils \
>  "
> -SRC_URI[md5sum] = "c9c2f162ac5f99d28d8c0ca43b19ed01"
> -SRC_URI[sha256sum] = "5580e875349341a1aabc6d5d2f697d242f277487316faaf1fbe68d9014f788d4"
> +SRC_URI[md5sum] = "2766d6f628dcd8f0bc216d0f8a2abc8e"
> +SRC_URI[sha256sum] = "5e12b14f0c38bf195d9592d76a9e0a128df2d38cd77c26ce5b5488397715dd0c"
>
>  S = "${WORKDIR}/vbox_module"
>
> @@ -78,6 +78,3 @@ FILES_${PN} = "${base_sbindir}"
>
>  # autoload if installed
>  KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
> -
> -PNBLACKLIST[vboxguestdrivers] = "Needs forward porting to kernel 5.2+"
> -
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

