Return-Path: <mickey.happygolucky@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 11BB777D6C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 14:40:13 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id q25so29374570uah.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dvh/LrXb6EjR+t5khvCYjiIeSOvbJTgS9Xy1yZu6rfs=;
	b=DlTbvzk8OepFoIqPTWGOOHEIT5OdsJlue3/W6ox+M5NzAlwWecg3FKDJxWhf9UoEMu
	7DLv7tls0gpEQppW/IwVxxj5NRmneJKVzjVo9lDfKXp3xJzXBvQjJb5U/XzTu8/0cGuA
	R7XIDso32laFQTe9W+9gMSWg+thR+rIxBI1r0vqQxQaMeU/gR2xNLmSXMJp2jsFikmyz
	70gwEoG3LvVlpQyxR5wXfYK58gw1dDo69dT37xjZUR4R1Z7pjGTME12WsybOYxTB+Inf
	DVnln1uM/Ldih//9twRKthQhBQSY4ypolIA5yQP1XKN15OUHnr/5zVzkpY5yCywqyMn7
	NXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dvh/LrXb6EjR+t5khvCYjiIeSOvbJTgS9Xy1yZu6rfs=;
	b=keu7neG1TxS+n65rW3L59Tmn+qKKRKORQZIgcFHDVGM9L2cXLEWONAjvaogI2Yq7GM
	OldmckeFzgaiAA3CWMjXGQW4N8vuhdCbLCEqN491fJoeAYbu+CJEoXqmDerqqQ7snjkF
	keWqfwziQvlapbmUfDz5NJhe9mPnALaEm3fruLewLl7i4z+KwjvvL+KWs7yeT7gnmPSB
	QbnVMOp8MydIWvRyILza8TDNTu5+3ujQwyYzUsb9eXS4Ck4wVIOpP9McoLaCQK8N+648
	gakoAzf0VpHl76N6C6Rho1qDYym6bxO6pkprbEqyvsJdeHHMg8RbsqP4pKNyfVEIreAO
	xUTw==
X-Gm-Message-State: AHYfb5iLiFR9tAmDy9ksb7KaqvsSrkfTEfAk1hGW0v53S7Glvat/2/I8
	kc+MW1Zlt8lT2weXjBtlmazh0c7Wag==
X-Received: by 10.159.39.41 with SMTP id a38mr3477024uaa.143.1502289614915;
	Wed, 09 Aug 2017 07:40:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.211.129 with HTTP; Wed, 9 Aug 2017 07:40:14 -0700 (PDT)
In-Reply-To: <CACMwXoU5zrrQPuemej7sn38v=V9Ak3Q3_P1HBuFFKi_nQ11CAw@mail.gmail.com>
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
	<1502153954-2796-2-git-send-email-mickey.happygolucky@gmail.com>
	<CAMKF1spheqXiBVN4b1oSLjr_EDkL0dcCSkZss-8K27XeF5Y_Cg@mail.gmail.com>
	<CACMwXoVyzWqadsAsjpghRFT10XfFPYtZmua_T=_fNcE8Rmmt-w@mail.gmail.com>
	<CAMKF1so1wecDyNMU70hNHhco2v69Qb3hOLWfsHfaOkjGtuRPUw@mail.gmail.com>
	<CACMwXoVeDiA2AGx2+B4YuBbFNp=WigwgQ8i1He4eyWC77-0JyA@mail.gmail.com>
	<CAMKF1sqED+uoO3+RnOk9R6JHjT79m_tx+_YBRVXAuaC+_LOqBQ@mail.gmail.com>
	<CACMwXoU5zrrQPuemej7sn38v=V9Ak3Q3_P1HBuFFKi_nQ11CAw@mail.gmail.com>
From: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
Date: Wed, 9 Aug 2017 23:40:14 +0900
Message-ID: <CACMwXoXHwjOcQTNY4keisbCLXPJNHEE-N1g+hphaekBM=GCaAg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 09 Aug 2017 14:40:14 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Khem

I wrote:
> I tried that reverted this patch(Added libanthy-dev to
PROVIDES_class-terget uim: Added libanthy-dev to DEPENDS_class-targe) and
added ALLOW_EMPTY_${PN} = "1".

ALLOW_EMPTY_${PN} = "1" was added into anthy recipe.

A result is in my recent email.(do_configure was not failed but uim-anthy
feature is dropped at configure script in uim recipe.)

You say that adding libanthy-dev into DEPENDS_class-target at uim recipe is
redundant.

I want to know a solution of this problem.  I do not intend to persist in
my method.
BUT under the present conditions I cannot achieve a purpose.(Wants to use
uim-anthy for Japanese input)

Are there any good ideas?

Thanks.




2017-08-09 10:43 GMT+09:00 Yusuke Mitsuki <mickey.happygolucky@gmail.com>:

> Hello Khem
>
> I tried that reverted this patch(Added libanthy-dev to
> PROVIDES_class-terget uim: Added libanthy-dev to DEPENDS_class-targe) and
> added ALLOW_EMPTY_${PN} = "1".
> However config.log say "conftest.c:65:25: fatal error: anthy/anthy.h: No
> such file or directory"
> It means uim-anthy feature is dropped. uim-anthy could not created
> correctly.
>
> I want to avoid that uim-anthy feature dropping at configure script.
>
> What should I do?
>
> Thanks
>
>
> 2017-08-09 10:16 GMT+09:00 Khem Raj <raj.khem@gmail.com>:
>
>> On Tue, Aug 8, 2017 at 6:00 PM, Yusuke Mitsuki
>> <mickey.happygolucky@gmail.com> wrote:
>> > Hello Khem
>> >
>> > Sorry I cannot understand...
>> >
>> > Are you saying to allow empty for anthy package?
>> >
>>
>> yes whichever recipe is providing libanthy-dev add it there.
>>
>> > I want to use uim-anthy package in order to input Japanese on the
>> machine.
>> > I think that it will be a problem if these are empty packages.
>> >
>> > I see that the dependency is not accurate.
>> > anthy recipe seems a bit strange.
>> > Most of the definitions are in the subpackage.
>> > It seems that neither anthy-dev nor anthy-dbg has any meaning.
>> >
>> > Thanks.
>> >
>> >
>> >
>> > 2017-08-09 9:40 GMT+09:00 Khem Raj <raj.khem@gmail.com>:
>> >>
>> >> On Tue, Aug 8, 2017 at 5:33 PM, Yusuke Mitsuki
>> >> <mickey.happygolucky@gmail.com> wrote:
>> >> > Hello Khem
>> >> >
>> >> > Are you saying that  libanthy-dev is not need and anthy only is
>> >> > sufficient?
>> >> >
>> >> > anthy is in DEPENDS already. BUT it is not sufficient.
>> >> > If libanthy-dev is not in DEPENDS_class-target, do_configure will
>> not be
>> >> > failed.
>> >>
>> >> that means the dependency is not accurate. can you add
>> >>
>> >> ALLOW_EMPTY_${PN} = "1"
>> >>
>> >> to anthy recipe and see if that helps ?
>> >>
>> >> >
>> >> > However config.log say like as follows:
>> >> >
>> >> > -----
>> >> > configure:20054: checking anthy/anthy.h usability
>> >> > configure:20054: i586-poky-linux-gcc -m32 -march=i586
>> >> >
>> >> > --sysroot=/home/y-mitsuki/yocto/build_keyboard/tmp/work/i586
>> -poky-linux/uim/1.8.6-r0/recipe-sysroot
>> >> > -c  -O2 -pipe -g -feliminate-unused-debug-types
>> >> >
>> >> > -fdebug-prefix-map=/home/y-mitsuki/yocto/build_keyboard/tmp/
>> work/i586-poky-linux/uim/1.8.6-r0=/usr/src/debug/uim/1.8.6-r0
>> >> >
>> >> > -fdebug-prefix-map=/home/y-mitsuki/yocto/build_keyboard/tmp/
>> work/i586-poky-linux/uim/1.8.6-r0/recipe-sysroot-native=
>> >> >
>> >> > -fdebug-prefix-map=/home/y-mitsuki/yocto/build_keyboard/tmp/
>> work/i586-poky-linux/uim/1.8.6-r0/recipe-sysroot=
>> >> > conftest.c >&5
>> >> > conftest.c:65:25: fatal error: anthy/anthy.h: No such file or
>> directory
>> >> > #include <anthy/anthy.h>
>> >> > -----
>> >> >
>> >> > Then uim-anthy is not created.
>> >> > In order to build uim-anthy, anthy.h is need but it is not installed
>> >> > into
>> >> > recipes-sysroot.
>> >> > anthy.h is incluced libanthy-dev not anthy.
>> >> >
>> >> > Therefor I think libanthy-dev is need.
>> >> >
>> >> > Let me know you opinions?
>> >> >
>> >> > 2017-08-08 12:48 GMT+09:00 Khem Raj <raj.khem@gmail.com>:
>> >> >>
>> >> >>
>> >> >> On Mon, Aug 7, 2017 at 6:00 PM Yusuke Mitsuki
>> >> >> <mickey.happygolucky@gmail.com> wrote:
>> >> >>>
>> >> >>> anthy.h could not found at confiugre of uim.
>> >> >>> Dependency broke since it began to use recipes-sysroot.
>> >> >>>
>> >> >>> Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
>> >> >>> ---
>> >> >>>  meta-oe/recipes-support/anthy/anthy_9100h.bb | 1 +
>> >> >>>  meta-oe/recipes-support/uim/uim_1.8.6.bb     | 2 +-
>> >> >>>  2 files changed, 2 insertions(+), 1 deletion(-)
>> >> >>>
>> >> >>> diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> >> >>> b/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> >> >>> index a65d324..c507ad7 100644
>> >> >>> --- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> >> >>> +++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> >> >>> @@ -18,6 +18,7 @@ SRC_URI[sha256sum] =
>> >> >>> "d256f075f018b4a3cb0d165ed6151fda4ba7db1621727e0eb54569b6e2
>> >> >>>
>> >> >>>  DEPENDS_class-target = "anthy-native"
>> >> >>>  RDEPENDS_${PN}_class-target = "libanthy0"
>> >> >>> +PROVIDES_class-target = "libanthy-dev"
>> >> >>
>> >> >>
>> >> >> This seems redundant
>> >> >>
>> >> >>>
>> >> >>>
>> >> >>>  inherit autotools pkgconfig
>> >> >>>
>> >> >>> diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> >> >>> b/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> >> >>> index ed846b9..4cb7b62 100644
>> >> >>> --- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> >> >>> +++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> >> >>> @@ -14,7 +14,7 @@ SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcec
>> e59"
>> >> >>>  SRC_URI[sha256sum] =
>> >> >>> "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
>> >> >>>
>> >> >>>  DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses
>> intltool"
>> >> >>> -DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native
>> >> >>> takao-fonts"
>> >> >>> +DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native
>> >> >>> takao-fonts libanthy-dev"
>> >> >>
>> >> >>
>> >> >> It should say anthy not libanthy-dev
>> >> >>>
>> >> >>>
>> >> >>>  RDEPENDS_uim = "libuim0 libedit"
>> >> >>>  RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
>> >> >>> --
>> >> >>> 2.7.4
>> >> >>>
>> >> >>> --
>> >> >>> _______________________________________________
>> >> >>> Openembedded-devel mailing list
>> >> >>> Openembedded-devel@lists.openembedded.org
>> >> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >> >
>> >> >
>> >
>> >
>>
>
>

