Return-Path: <andrei.kholodnyi@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 43EB67680E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 21:12:29 +0000 (UTC)
Received: by vkao3 with SMTP id o3so46941431vka.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 14:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=fwLjCD2jOILLLaIMSUa5lqq2eoFQH9r4T5Xmy+a8GJA=;
	b=epQZuZEpas72BYnbeVgww1QOu+rqSX8qa9PfFj7D3xTh04PyHQnoJV4bNy+mKipb1T
	RZdTWfam0BQjtRl5L0fzepMy/Bs4jjA7ZJMgjMyCR1SfBsOXhnax6liFGFgC/r7oPA8I
	1aYChBYM8anJSCNbzJDnwnmLFQl8DwPrnugdwSZ/rdk0w6gCfRiCOFFqZ6SgoLRgUbEC
	5PfG5jx3J6qIGZ2z5ostQpWDwZQEyJE4qOKpyACb7byzUln2Q/pUwDXtCD7bsgp8e1tV
	N+srrVic5SvJcJ6Ys7AU61QVtbH/eQENGdzZJJUaaFv80dx0eOfj4Ak21W3aLXoz8f91
	Oohw==
X-Received: by 10.31.169.73 with SMTP id s70mr7092825vke.28.1442697149561;
	Sat, 19 Sep 2015 14:12:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.95.86 with HTTP; Sat, 19 Sep 2015 14:12:10 -0700 (PDT)
In-Reply-To: <1442691768-30079-2-git-send-email-andrei.kholodnyi@gmail.com>
References: <1442691768-30079-1-git-send-email-andrei.kholodnyi@gmail.com>
	<1442691768-30079-2-git-send-email-andrei.kholodnyi@gmail.com>
From: Andrei Kholodnyi <andrei.kholodnyi@gmail.com>
Date: Sat, 19 Sep 2015 23:12:10 +0200
Message-ID: <CABYVMoQ9dcd9z-VGBmnfG+uyrTdNB7=e8gUikJeCq5=n2SYJOQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] lvm2: add --with-systemdsystemunitdir in configuration Otherwise sed command for blk-availability.service may fail. It will look for the service file in a wrong location
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Sep 2015 21:12:31 -0000
Content-Type: text/plain; charset=UTF-8

I apologize for the inconvenience, need to look why my gmail sends patches
twice

2015-09-19 21:42 GMT+02:00 Andrei Kholodnyi <andrei.kholodnyi@gmail.com>:

> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
> b/meta-oe/recipes-support/lvm2/lvm2.inc
> index 2b2d8ed..8114d5f 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -27,6 +27,7 @@ EXTRA_OECONF = "--with-user= \
>                  --enable-lvmetad \
>                  --with-udev-prefix= \
>                  --with-usrlibdir=${libdir} \
> +                --with-systemdsystemunitdir=${systemd_unitdir}/system \
>  "
>
>  PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux',
> 'selinux', '', d)}"
> --
> 2.1.4
>
>


-- 
Believe is not enough, you must know

