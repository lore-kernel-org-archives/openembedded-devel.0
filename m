Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4A479DED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 18:41:26 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l11so12533532qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 10:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/yof5eP1UWX+/Pb/JG3V//fEaHi3biNvS5eY3k1dVQQ=;
	b=iU+HriUwXJm+rE9H8Q7rC0gZoxoB/8TnXjnGIngpVtB9xkX7hLV6r8p2bzPRX20yfD
	wFtbPjDVI+9miyQCi4/Av92Fwqpr+1Tz+yTgpzIU8FqdRdl4yragdoHZu5VfvIWn54/m
	iPh/+50Hk8Jo5BsgdvrR8ozC51ij3XW/VrYGEFlIpgor6XNGE7ZsvX8D+k3pBsjZp3kG
	Gj90bLoLBrzWBRmxNNaSixLMyTrEvJziS1GnfLL9D8ocpqzd7Uv7QsVK9RqqTouRx0li
	Q+k4ygpUSN4sHsRT6R04IQD07SZWuRkHBP/BT83yGDQGqxP06OulJ3O4yLiy2JGiDT3j
	wMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/yof5eP1UWX+/Pb/JG3V//fEaHi3biNvS5eY3k1dVQQ=;
	b=Hxc1yPnh4QrkdLXbY9+Ehs6151zpbLGJ6328CGvQF0mN0TUTHpgej8ePhC6HPktp4s
	bJ9iPsv3e8REVsUxZUegvbarg5PCVnHecrk4X4TOlJmad7lw5YAqY6QK0zBiLNQ7utBE
	arErKRishJImHbkCQMKiD+V+hxh+3ml7XI66EKmGe+MRh5b3/8UfvFYQEx13zI7BxBCs
	YOUnhPMB5WarCspLr/JKJOIa/jAdMzXGeNdaYuTjFGisLFmKPcVhIBdJn+0Olm+frBF1
	M/I+wUbBrNGbCjamC5u+/c2dPfMwqKw/eqvQWEdzaBXqKsuqWCbxJn+zLg8uv6/+GJP+
	xgtA==
X-Gm-Message-State: AJcUukcBfT8qGSgMhIMicz592O0rpS2Z4BUgGWPW2Qc98pukI0lRCgWP
	98Pza7osbxzWi9EF0ZJ200UPrx+5x38GaEKWrzI=
X-Google-Smtp-Source: ALg8bN5DBLvKSssjwiObd7BgyJ6F6CjG1ISrrrfpOTEwJuDinBOypHQ6UjBJoNQ6NS7NrNMy9qEyBASGhj6jrZFq+J4=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr12731709qte.29.1547750487067; 
	Thu, 17 Jan 2019 10:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20190117183314.23139-1-alistair.francis@wdc.com>
In-Reply-To: <20190117183314.23139-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Jan 2019 10:41:00 -0800
Message-ID: <CAMKF1sqwxU7bVBhVHb=s9DuJZpyMe-WzM=N0aBLHJNuPHnh4cg@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] xorg-driver: xf86-video-ati: Add RISCV to COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 17 Jan 2019 18:41:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 17, 2019 at 10:33 AM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> The ATI drivers can work on non-x86 platforms such as RISC-V, add RISC-V
> as an option in the COMPATIBLE_MACHINE requirement.
>

surprisingly, the v1 built ok on all testing platforms I have
so I have merged that one.

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
> index 969c1a0a6..efd76c92c 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
> @@ -12,7 +12,7 @@ DEPENDS += "virtual/libx11 libxvmc drm \
>  inherit distro_features_check
>  REQUIRED_DISTRO_FEATURES += "opengl"
>
> -COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
> +COMPATIBLE_HOST = '(i.86|x86_64|riscv).*-linux'
>
>  SRC_URI[md5sum] = "40e7c0a5a69aba3d84e0958f58705ea7"
>  SRC_URI[sha256sum] = "72ea3b8127d4550b64f797457f5a7851a541fa4ee2cc3f345b6c1886b81714a0"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

