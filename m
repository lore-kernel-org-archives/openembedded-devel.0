Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id AE5F0700F0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 20:25:33 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id u5-v6so9260409ybf.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2018 13:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=alg+LZUUAX3aElVTk6qqQpd6yyiHKYq5tXvUor1oE40=;
	b=VE4i7XFxNsyu1YqztW7qYISmOghvu0SR/PW9xEfrkD0jXmR1jQzNNORAEY46rrrGaE
	Obq2Y9DS7C2z/T1pOeDs9ODBgLiyBx8yR6he8OKEQNjD+t0DmH9S6vt7YpZo4bujGeCd
	wSkYALRV2WSZhyRU4tac6G6yolFLVBPvJuaC0wYrDrcRtOW36tHKC8JVikAC2do1u4sH
	px/opjC3M0ftrzZMNi2ImCWcx+i3YlPi6YuXWV6N0wzjb3++DpQTRPhJYf3cRG8DmhPI
	8MzOeliSehmB3cjE74uYW8H1o/Lq+ad1Pkctzi9+rPNyYR9TCx6AtXVqwP2oq36Eqjhz
	tchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=alg+LZUUAX3aElVTk6qqQpd6yyiHKYq5tXvUor1oE40=;
	b=nil1N31AqAzRHI9aAlgA3cC7lQLPFZwqTcz34X4i3ukzdVLsLiJGa9T+OCZpKDBSeE
	SsOZ7jf6SJiBIbNGS39PsOCiB4XbVE3vPOw3wUjFfyiPCrV42TtJwBC+EoJiwxbtORAg
	BmYSgxEHV1pm/hjO6rb/D+u03ScgEjTNn6XbTj1q6V2tc/BvFJ/AhWvYdFTnjE8FFLLz
	toEpG1zHfbUBwmsqXVgLqQogLpgAkE/83hCMDaq2vx7aBJdMN1GF5DenBeXV0j8hEO/3
	wnfvGqQoteOLHRcKs16dSTwWuxXGM95kiIt3exbClcqubzieOAskU2PwgT8hZ2hXAjPn
	5enA==
X-Gm-Message-State: ALQs6tCZV5wKy6BtOIpXuoSKh+AMQb1W4I83TzVHu50TFKqdadtc63BH
	5keUzcE3UFc+NNup8vsoEbtYv25SfWBy0pb/Kvg=
X-Google-Smtp-Source: AIpwx48ujXAxqVRU4KLTCM7OoWfqn1x1STyudY4Cc+IWTy89HTx/7Ear2Z79ee01w/3XB71MFfdP9an/TKdpQukUY2M=
X-Received: by 10.129.108.137 with SMTP id h131mr2955851ywc.180.1522873534165; 
	Wed, 04 Apr 2018 13:25:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP;
	Wed, 4 Apr 2018 13:25:33 -0700 (PDT)
In-Reply-To: <20180404191013.38136-2-raj.khem@gmail.com>
References: <20180404191013.38136-1-raj.khem@gmail.com>
	<20180404191013.38136-2-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 4 Apr 2018 22:25:33 +0200
Message-ID: <CALbNGRQ+hFGBqvt0VNLLHeVBjFk7M3sZgiybiVwQBr3kqduviw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH V2 2/2] qtwebkit: Fix build on armv7ve (rpi)
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
X-List-Received-Date: Wed, 04 Apr 2018 20:25:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 4, 2018 at 9:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v1 -> v2:
> - Drop disabling GI
>
>  recipes-qt/qt5/qtwebkit_git.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
> index e8c0868..c8e8328 100644
> --- a/recipes-qt/qt5/qtwebkit_git.bb
> +++ b/recipes-qt/qt5/qtwebkit_git.bb
> @@ -18,6 +18,14 @@ DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt gperf-
>  ARM_INSTRUCTION_SET_armv4 = "arm"
>  ARM_INSTRUCTION_SET_armv5 = "arm"
>
> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
> +# https://bugs.webkit.org/show_bug.cgi?id=159880
> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
> +ARM_INSTRUCTION_SET_armv7a = "thumb"
> +ARM_INSTRUCTION_SET_armv7r = "thumb"
> +ARM_INSTRUCTION_SET_armv7ve = "thumb"
> +
>  # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
>  # 5.10.meta-qt5.1
>  SRC_URI += "\
> --
> 2.16.3
>
I've checked the links you are referring: Both

* are related to webkit and from 2016
* deal with runtime errors not build errors as referred in patch description.

So what do you want to fix exactly?

Andreas

