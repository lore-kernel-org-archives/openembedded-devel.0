Return-Path: <mickey.happygolucky@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id B827D60777
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 00:44:44 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 80so3162576uas.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 17:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fFFltCt9NNASDYvYpqtDGw6Bv7DNYnePQkRfsScHWN4=;
	b=gXlv/Pj+jxzeV+YGY5nfkFV4eumDGweHms4NUQKPIotIBJzBUSzFQdK+BlPMkaaLEU
	WIw3mGxH1r/A8YV+4HTDxNjr1Wqgt/DiV14c6wnWzN7UsdqQnsi+3hWqDsb4RYnSHa/G
	BfSd3hcRndc44n6ZIgCbadgedHDJZhWSNcj4kcOzIVKIroBgnFwo8h4Hu1ZaUM/db+ST
	oYp47K3TC0AyD32bp4vTZZPxbe4uhYjSyVWP4tSU5KoosPD9Iyf0qWK/No2bs7g3Qjhf
	EODF/v+KOE5Ish3HyV69toz64s6qCzeO+MC7Yv74WsdbhAIz3j7vUfXkChxsnFN4S31h
	6p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fFFltCt9NNASDYvYpqtDGw6Bv7DNYnePQkRfsScHWN4=;
	b=g8/jAeuKFAgYFxr3FURIqov9qF7NnjRSx8npLmGb32qhH94nso5aJEH9Qn4cCFWlF7
	kAYT4flwiqeZoZomzNCQrY/kBUS5e3xnE8UyCOfh4c6sTIZpmpxOBgCvxc6M7vv3avUX
	4U4QTVnGAaBjZQO8dfRHfjN2+LBn40tI6fpbEUTURWV64ZygXm+P4mhxVXzeoVtNXBUR
	QR9shEYObrqVDER+T5C1hQso9LAt2+dHtopN2LNFnvRQbtNNKyR+MnQdUXeCbKy4MayY
	uQzMgV2XfhNXfkiqbVtgoBCIDFB7nfAO0zaZ4dvsd7JHyGrwnCstuP5Y6YiL8J74hbIa
	YGow==
X-Gm-Message-State: AHYfb5i9iKmRR1U6BtuEnMLzdsfJXnSj7aMt5gCukGn1SHgJ8bKn4Leb
	Uf1L4MravAhdKJd0/1XfiWc2hhqqVw==
X-Received: by 10.159.39.41 with SMTP id a38mr2173210uaa.143.1502239485694;
	Tue, 08 Aug 2017 17:44:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.211.129 with HTTP; Tue, 8 Aug 2017 17:44:45 -0700 (PDT)
In-Reply-To: <CAMKF1spheqXiBVN4b1oSLjr_EDkL0dcCSkZss-8K27XeF5Y_Cg@mail.gmail.com>
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
	<1502153954-2796-2-git-send-email-mickey.happygolucky@gmail.com>
	<CAMKF1spheqXiBVN4b1oSLjr_EDkL0dcCSkZss-8K27XeF5Y_Cg@mail.gmail.com>
From: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
Date: Wed, 9 Aug 2017 09:44:45 +0900
Message-ID: <CACMwXoVVsEupsNpT5BhVQ9JpYhKy4bOpLVO2oyhNBCST9-LA1w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/6] anthy: Added libanthy-dev to PROVIDES_class-terget uim: Added libanthy-dev to DEPENDS_class-target
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
X-List-Received-Date: Wed, 09 Aug 2017 00:44:44 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Khem

Are you saying that  libanthy-dev is not need and anthy only is sufficient?

anthy is in DEPENDS already. BUT it is not sufficient.
If libanthy-dev is not in DEPENDS_class-target, do_configure will not be
failed.

However config.log say like as follows:

-----
configure:20054: checking anthy/anthy.h usability
configure:20054: i586-poky-linux-gcc -m32 -march=i586
--sysroot=/home/y-mitsuki/yocto/build_keyboard/tmp/work/i586
-poky-linux/uim/1.8.6-r0/recipe-sysroot -c  -O2 -pipe -g
-feliminate-unused-debug-types -fdebug-prefix-map=/home/y-mit
suki/yocto/build_keyboard/tmp/work/i586-poky-linux/uim/1.8.
6-r0=/usr/src/debug/uim/1.8.6-r0 -fdebug-prefix-map=/home/y-mit
suki/yocto/build_keyboard/tmp/work/i586-poky-linux/uim/1.8.6-r0/recipe-sysroot-native=
-fdebug-prefix-map=/home/y-mitsuki/yocto/build_keyboard/tmp/
work/i586-poky-linux/uim/1.8.6-r0/recipe-sysroot=   conftest.c >&5
conftest.c:65:25: fatal error: anthy/anthy.h: No such file or directory
#include <anthy/anthy.h>
-----

Then uim-anthy is not created.
In order to build uim-anthy, anthy.h is need but it is not installed into
recipes-sysroot.
anthy.h is incluced libanthy-dev not anthy.

Therefor I think libanthy-dev is need.

Let me know you opinions?




2017-08-08 12:48 GMT+09:00 Khem Raj <raj.khem@gmail.com>:

>
> On Mon, Aug 7, 2017 at 6:00 PM Yusuke Mitsuki <
> mickey.happygolucky@gmail.com> wrote:
>
>> anthy.h could not found at confiugre of uim.
>> Dependency broke since it began to use recipes-sysroot.
>>
>> Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
>> ---
>>  meta-oe/recipes-support/anthy/anthy_9100h.bb | 1 +
>>  meta-oe/recipes-support/uim/uim_1.8.6.bb     | 2 +-
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> b/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> index a65d324..c507ad7 100644
>> --- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> +++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> @@ -18,6 +18,7 @@ SRC_URI[sha256sum] = "d256f075f018b4a3cb0d165ed6151f
>> da4ba7db1621727e0eb54569b6e2
>>
>>  DEPENDS_class-target = "anthy-native"
>>  RDEPENDS_${PN}_class-target = "libanthy0"
>> +PROVIDES_class-target = "libanthy-dev"
>
>
> This seems redundant
>
>
>>
>>  inherit autotools pkgconfig
>>
>> diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> b/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> index ed846b9..4cb7b62 100644
>> --- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> +++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> @@ -14,7 +14,7 @@ SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
>>  SRC_URI[sha256sum] = "7b1ea803c73f3478917166f04f67cc
>> e6e45ad7ea5ab6df99b948c17eb1cb235f"
>>
>>  DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
>> -DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native
>> takao-fonts"
>> +DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native
>> takao-fonts libanthy-dev"
>>
>
> It should say anthy not libanthy-dev
>
>>
>>  RDEPENDS_uim = "libuim0 libedit"
>>  RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

