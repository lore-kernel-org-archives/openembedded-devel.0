Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 12DA5788DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 03:41:34 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id k8-v6so10845537uaq.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 20:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D6wseh6rUu5cOvgMx6ylVLtdFm/3kW0OVfGKPGWzJ7g=;
	b=DlBeBB9M0Jpo5lMqTO9PC0IP6766W4jN+nI7JcNzmCGHbhQHW/FgciCAp1RkrXWSnB
	Pz5bWcAxl96JFMhwER07iJNLY6rfimbToklgkslldIrhtCR1mjoGoGGc6ckyWUqmRe+I
	k6flPLvKUKlepbyAsPqV97h81sMYBARxihlI/S4MEqtnOho9eKrZZHfii/CC9TCbfSm4
	Y+CYi1yilGvJSVJVQd7yRXsTU407zkfRJ11DUW8VLN9OtyePNzqTe7wyJFIMtTp+H3iU
	J0REgstajMouiKKz4/cuAbTq8BwoOheH/fODZ+bM5hwsNxz7AUd5iB5slj/JzbcKlo7i
	SaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D6wseh6rUu5cOvgMx6ylVLtdFm/3kW0OVfGKPGWzJ7g=;
	b=Ecb1AI3H36xZ4NGfIzE+ItbEdZBQaBEKwTBgihkG3YSqcI59njjpavgjNpm/CeBDOW
	yzr84n5inLwTCjxi7acf/jkrD1AhNhrqVkVxhmsa/cuIFSJ2rqh2qmskOo1eBYyADjjp
	GBjQ9UbyunMdWoV+7+xgic+IVeAIx/bKtraBoyv2ChNUwCjKSfmvwwmfpEckVGMcpIJG
	jhPwoim6w19g4yMrS+pxYlEFWPfklT/3vXQcYDGH9CJyR+ZStviLeVVvwte5CICiJMN0
	tZcJueOTcxIoU89EN/HmG7rAeb7hY9f7O8OeWf/aUErIVd+5z+WdGgHr9QeipsqP6Ib3
	DhyA==
X-Gm-Message-State: AOUpUlHWMiTP/0zg8Okq0IU6MgbJjouM0/BGwCFWuWEzLI2zBrpVJrjm
	zMfmn431kgcUEe/pxViBXuqSGwOcOBqubVr0auw=
X-Google-Smtp-Source: AAOMgpeByd4B4WkRpIP6he3W/ppQSfzuIuWHCKHISbAnjAd1WmzvDZIFlw6BQ4l5UEmctt6oP2lHGkEgNIBrIpbECC8=
X-Received: by 2002:ab0:6545:: with SMTP id
	x5-v6mr2769711uap.139.1531798895674; 
	Mon, 16 Jul 2018 20:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180717033250.6843-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20180717033250.6843-1-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Jul 2018 20:41:09 -0700
Message-ID: <CAMKF1sr0L=KJrcowTzz2jNmBEf5zOH6aWWA4LC9m++HWY7pqCQ@mail.gmail.com>
To: hongl.fnst@cn.fujitsu.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-oe][PATCH] numactl: 2.0.11 -> 2.0.12
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
X-List-Received-Date: Tue, 17 Jul 2018 03:41:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 8:33 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade numactl 2.0.11 to 2.0.12.
>
> 2.Modify README to README.md
>

Checksum also seems to have changed. Can
you find what is causing this change ?

> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/numactl/numactl_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
> index b9cbcf0..57b7203 100644
> --- a/meta-oe/recipes-support/numactl/numactl_git.bb
> +++ b/meta-oe/recipes-support/numactl/numactl_git.bb
> @@ -9,10 +9,10 @@ RDEPENDS_${PN} = "perl"
>
>  inherit autotools-brokensep ptest
>
> -LIC_FILES_CHKSUM = "file://README;beginline=19;endline=32;md5=5644cc3851cb2499f6c48e52fe198bd9"
> +LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
>
> -SRCREV = "ea3a70681c2f523fe58e1d44527f478ca76db74e"
> -PV = "2.0.11+git${SRCPV}"
> +SRCREV = "841253d1313b01a968c380cae4f498f20c46e5aa"
> +PV = "2.0.12+git${SRCPV}"
>
>  SRC_URI = "git://github.com/numactl/numactl \
>      file://fix-null-pointer.patch \
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

