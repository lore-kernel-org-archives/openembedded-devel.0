Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8C33C7DC69
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 17:11:22 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id y49so7098191qta.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 10:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IM3zH3NU5De6UxCeKe9P6r+xcq92c7+EDZ7SzvCuU8E=;
	b=ammxtSToxcI9cGxoT4Ma2B5lAmJgdzBGM+2LLRXeUyCUMxPJEvFPfZcMbbe3xH8T1Q
	hOUEEpKk5ueUOdcWbMEXOBPLGAPuCOUuy7Dl9869s3u0RRUtLV8xArLcHPdabfWoKgwm
	9C7/7Kl1sxj4yHxQUjW0QNhqZY9U1HkXO8axGUwqABgpRusJw99zqhiWQAPxyuWMkDsB
	buFcCkb3vIIpFyfXYOgFFrCiVMLiVb+CpVw8r034dYluJ+7xWMpnDkV98lsMym8GgC2w
	Hg9hqyBw+rSTIdVus10ro+qTC4njqUSadTp/SYgauUaAEqqLy71zeeXZ2hFL51g4V5yZ
	qrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IM3zH3NU5De6UxCeKe9P6r+xcq92c7+EDZ7SzvCuU8E=;
	b=liJdUkGhsPBqXs/9h4jLMqhoZ3B/bK2mOFpMolQ9Aio4S/9L4H3p6f8X/miNMmQAMO
	Hyj3kdHE6oVlBoPkDW1KZ2LchkXlCxCpH5o7W96V6/NL0U6rdL5EIBCszfUNJAGMRaN8
	Ak4OrnDbD81t2DXiNUNVHvw01Oh2TT96NQsQDDbm0Yy4Z2OCmVlF9KORiy/WXteScjoi
	dcr0lHxlmDNsn/4pFGloJCA9VHdZSpq4SaoDlJAtynNJcIxqAw2j3c8me8YOX2/iOo8O
	/mEaP30Z4OKz+90TJItgGy7SHWDoRNkUgAP49kufV4mN9fciV1GeBdL8zq6HKbibl5Ro
	rUzA==
X-Gm-Message-State: APjAAAUEVoCkD6jfHwuronZq6mux5UhNMQZAma3dzSpQfEpN5UMEP3Yu
	7hulkUOMJ6KNra95Xhfm9cs6M5tU8VIvrzSRVWs=
X-Google-Smtp-Source: APXvYqwsVuz6q27+V+ZE9UpKGRM0Mglwx5YHWtI3QTY233gFHNZ9fzgGcB+kLge8+4GVZsLzH2cGeanYLXzR4rlhRe0=
X-Received: by 2002:a0c:92f9:: with SMTP id c54mr19095211qvc.194.1556557883394;
	Mon, 29 Apr 2019 10:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <1556430934-190585-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1556430934-190585-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Apr 2019 10:10:57 -0700
Message-ID: <CAMKF1sqOhmF0_ifkFvLBH2SGEtudLRvCMg0fDwG2S8u0RtmQ6Q@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] postgresql: fix compile error
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
X-List-Received-Date: Mon, 29 Apr 2019 17:11:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 27, 2019 at 10:56 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> configuration:
> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
> MULTILIBS ?= "multilib:lib32 multilib:libn32"
> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
> require conf/multilib.conf
>
> SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
> DEBUG_BUILD = "1"
> EXTRA_IMAGE_FEATURES += "dbg-pkgs"
>
> with above configuration and option -Og, postgresql compile failed with:
> | make[4]: Nothing to be done for 'all'.
> | make[4]: Leaving directory '/tmp/work/mips-pokymllib32-linux/lib32-postgresql/11.2-r0/build/src/fe_utils'
> | {standard input}: Assembler messages:
> | {standard input}:58887: Error: branch out of range
> | <builtin>: recipe for target 'tab-complete.o' failed
> | make[3]: *** [tab-complete.o] Error 1
> | make[3]: Leaving directory '/tmp/work/mips-pokymllib32-linux/lib32-postgresql/11.2-r0/build/src/bin/psql'
> | Makefile:41: recipe for target 'all-psql-recurse' failed
> | make[2]: *** [all-psql-recurse] Error 2
>
> replace -Og with -O to fix this error
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-dbs/postgresql/postgresql.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> index 85f1917..1d985a4 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> @@ -72,6 +72,11 @@ EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
>  EXTRA_OECONF_sh4 += "--disable-spinlocks"
>  EXTRA_OECONF_aarch64 += "--disable-spinlocks"
>
> +DEBUG_OPTIMIZATION_remove_mips = " -Og"
> +BUILD_OPTIMIZATION_remove_mips = " -Og"
> +DEBUG_OPTIMIZATION_append_mips = " -O"
> +BUILD_OPTIMIZATION_append_mips = " -O"
> +

perhaps its better to include mipsel as well while here.

>  PACKAGES_DYNAMIC += "^${PN}-plperl \
>      ^${PN}-pltcl \
>      ^${PN}-plpython \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

