Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8ED6FF78
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 16:20:12 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id q25so5277196uah.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zxFUE7C8qXxO6GLl1eIYo6NrOrGkP1hnrBCjq3QdXNY=;
	b=YFVwDWI5uuRcXaLYCNZDw31GFcR5rBDotzt4+IuUYuAGny+IXXHXnKAxJuJAGRFGV5
	26r+SEyE5Y3seW8I8HMgskqs1j6Gu7WJcA/rKLoDBAs+PFPOsS8+KRkiw1asTaSuTujQ
	X6+Zx/eNGxYPlf8eLEn+7LwL/ostfr29pYJK+/byiRdNr2YhIZlH8S7R4Y+4gzGL509k
	qAE4L5KRaRbdoNwV2R//ki6Yl3sM5EmLdjsGvQejfMXopcMPOOoJsppbHbVc1OlPLMpl
	LBZHD3YQWBeTteQrtM3Jd05JD8c5n/e4IWaDAyGXJtPGqTE+r11AAYOadLgwDkyw+nli
	uWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zxFUE7C8qXxO6GLl1eIYo6NrOrGkP1hnrBCjq3QdXNY=;
	b=lp7EBdkoI2stl3REsq8rlCJZ/wJ6HlZ5eKExrRURUkLRuSQesX94xxcaAWhoXR//fW
	ctP0rTBBd+tI53HvOmVjU01bVauUusa7HJVA+sgLhKnNhBvITvaV+i1bPtnNfhm0t2OR
	m+X+n6Neuazvu4KgH3ABFyslJKUKbIKM/TkALAkD4wHhTgxFisnbewfTnXpWu3DDh+ES
	bqPzckF/8dYnDk8fcoSxc/eMSwpgGaJqlIVi4+CpOUT8qQQmDW5aNCIQqiLxRYhwEwIh
	Q2iAYRW2GhfySfaXX+NgQQRqiD3+af1HAb2+poewlVYfVFjxg3eJ3VMxqomzJIXwT0Is
	0yJw==
X-Gm-Message-State: AHYfb5j0aYIUVxIU037/ylRh/MkJOYs7iiXDyXEhVJseh9wOiYWXP/es
	OWA+CrXMvj3m9q8abLNB0q2pxRIlJA==
X-Received: by 10.176.72.208 with SMTP id y16mr8801737uac.103.1502382013311;
	Thu, 10 Aug 2017 09:20:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Thu, 10 Aug 2017 09:20:12 -0700 (PDT)
In-Reply-To: <CACMwXoW50hxo_NZbnMGL=C+YBE1wQx0=VL79h2VkHo=yW7f5Hg@mail.gmail.com>
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
	<1502153954-2796-2-git-send-email-mickey.happygolucky@gmail.com>
	<CAMKF1spheqXiBVN4b1oSLjr_EDkL0dcCSkZss-8K27XeF5Y_Cg@mail.gmail.com>
	<CACMwXoVyzWqadsAsjpghRFT10XfFPYtZmua_T=_fNcE8Rmmt-w@mail.gmail.com>
	<CAMKF1so1wecDyNMU70hNHhco2v69Qb3hOLWfsHfaOkjGtuRPUw@mail.gmail.com>
	<CACMwXoVeDiA2AGx2+B4YuBbFNp=WigwgQ8i1He4eyWC77-0JyA@mail.gmail.com>
	<CAMKF1sqED+uoO3+RnOk9R6JHjT79m_tx+_YBRVXAuaC+_LOqBQ@mail.gmail.com>
	<CACMwXoU5zrrQPuemej7sn38v=V9Ak3Q3_P1HBuFFKi_nQ11CAw@mail.gmail.com>
	<CACMwXoXHwjOcQTNY4keisbCLXPJNHEE-N1g+hphaekBM=GCaAg@mail.gmail.com>
	<CA+chaQcwbWWhxP5enPaR55y05e8NWyNc9Si_NTRnGDwN4xs1jw@mail.gmail.com>
	<CACMwXoW50hxo_NZbnMGL=C+YBE1wQx0=VL79h2VkHo=yW7f5Hg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 10 Aug 2017 18:20:12 +0200
Message-ID: <CA+chaQdCbWbQEm+OYsSJUbEk4v8DKm=TeFZp7Y3rHWm0ywe6Pg@mail.gmail.com>
To: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
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
X-List-Received-Date: Thu, 10 Aug 2017 16:20:12 -0000
Content-Type: text/plain; charset="UTF-8"

> I understood that I should use append instead of += in these cases.

That's not the important part. Important is where the override is applied.

DEPENDS_append = " foo"
DEPENDS += "foo"

are not very different, except append is processed a bit later and +=
automatically adds the leading space, but

DEPENDS_class-target_append = " foo"
DEPENDS_append_class-target = " foo"

are very different, first appends to "DEPENDS_class-target" which then
overrides DEPENDS variable (because "class-target") is the override. The
second example appends to normal DEPENDS variable (without overriding it) -
only for target builds.


On Thu, Aug 10, 2017 at 4:27 PM, Yusuke Mitsuki <
mickey.happygolucky@gmail.com> wrote:

> Hello Martin
>
> Thank you so much. It was very helpful.
> Your fix works so fine. I could input Japanese on machine via uim-anthy.
>
> I understood that I should use append instead of += in these cases.
>
>
> 2017-08-10 8:58 GMT+09:00 Martin Jansa <martin.jansa@gmail.com>:
>
>> Hello,
>>
>> Build time dependencies (DEPENDS) unlike runtime dependencies (RDEPENDS)
>> don't care about packages (empty or not), they depend on whatever the
>> recipe stages to sysroot.
>>
>> So depending on PROVIDED anthy-dev is the same as depending on just anthy.
>>
>> The issue you were seeing is because anthy actually wasn't in the DEPENDS
>> for target builds.
>>
>> I've fixed your change when cherry-picking it to master-next, see (and
>> test) this:
>> http://git.openembedded.org/meta-openembedded/commit/?h=mast
>> er-next&id=6360697095094bcc800bbe9f8950c96ae4760e2e
>>
>>
>> On Wed, Aug 9, 2017 at 4:40 PM, Yusuke Mitsuki <
>> mickey.happygolucky@gmail.com> wrote:
>>
>>> Hello Khem
>>>
>>> I wrote:
>>> > I tried that reverted this patch(Added libanthy-dev to
>>> PROVIDES_class-terget uim: Added libanthy-dev to DEPENDS_class-targe) and
>>> added ALLOW_EMPTY_${PN} = "1".
>>>
>>> ALLOW_EMPTY_${PN} = "1" was added into anthy recipe.
>>>
>>> A result is in my recent email.(do_configure was not failed but uim-anthy
>>> feature is dropped at configure script in uim recipe.)
>>>
>>> You say that adding libanthy-dev into DEPENDS_class-target at uim recipe
>>> is
>>> redundant.
>>>
>>> I want to know a solution of this problem.  I do not intend to persist in
>>> my method.
>>> BUT under the present conditions I cannot achieve a purpose.(Wants to use
>>> uim-anthy for Japanese input)
>>>
>>> Are there any good ideas?
>>>
>>> Thanks.
>>>
>>>
>>>
>>>
>>> 2017-08-09 10:43 GMT+09:00 Yusuke Mitsuki <mickey.happygolucky@gmail.com
>>> >:
>>>
>>> > Hello Khem
>>> >
>>> > I tried that reverted this patch(Added libanthy-dev to
>>> > PROVIDES_class-terget uim: Added libanthy-dev to DEPENDS_class-targe)
>>> and
>>> > added ALLOW_EMPTY_${PN} = "1".
>>> > However config.log say "conftest.c:65:25: fatal error: anthy/anthy.h:
>>> No
>>> > such file or directory"
>>> > It means uim-anthy feature is dropped. uim-anthy could not created
>>> > correctly.
>>> >
>>> > I want to avoid that uim-anthy feature dropping at configure script.
>>> >
>>> > What should I do?
>>> >
>>> > Thanks
>>> >
>>> >
>>> > 2017-08-09 10:16 GMT+09:00 Khem Raj <raj.khem@gmail.com>:
>>> >
>>> >> On Tue, Aug 8, 2017 at 6:00 PM, Yusuke Mitsuki
>>> >> <mickey.happygolucky@gmail.com> wrote:
>>> >> > Hello Khem
>>> >> >
>>> >> > Sorry I cannot understand...
>>> >> >
>>> >> > Are you saying to allow empty for anthy package?
>>> >> >
>>> >>
>>> >> yes whichever recipe is providing libanthy-dev add it there.
>>> >>
>>> >> > I want to use uim-anthy package in order to input Japanese on the
>>> >> machine.
>>> >> > I think that it will be a problem if these are empty packages.
>>> >> >
>>> >> > I see that the dependency is not accurate.
>>> >> > anthy recipe seems a bit strange.
>>> >> > Most of the definitions are in the subpackage.
>>> >> > It seems that neither anthy-dev nor anthy-dbg has any meaning.
>>> >> >
>>> >> > Thanks.
>>> >> >
>>> >> >
>>> >> >
>>> >> > 2017-08-09 9:40 GMT+09:00 Khem Raj <raj.khem@gmail.com>:
>>> >> >>
>>> >> >> On Tue, Aug 8, 2017 at 5:33 PM, Yusuke Mitsuki
>>> >> >> <mickey.happygolucky@gmail.com> wrote:
>>> >> >> > Hello Khem
>>> >> >> >
>>> >> >> > Are you saying that  libanthy-dev is not need and anthy only is
>>> >> >> > sufficient?
>>> >> >> >
>>> >> >> > anthy is in DEPENDS already. BUT it is not sufficient.
>>> >> >> > If libanthy-dev is not in DEPENDS_class-target, do_configure will
>>> >> not be
>>> >> >> > failed.
>>> >> >>
>>> >> >> that means the dependency is not accurate. can you add
>>> >> >>
>>> >> >> ALLOW_EMPTY_${PN} = "1"
>>> >> >>
>>> >> >> to anthy recipe and see if that helps ?
>>> >> >>
>>> >> >> >
>>> >> >> > However config.log say like as follows:
>>> >> >> >
>>> >> >> > -----
>>> >> >> > configure:20054: checking anthy/anthy.h usability
>>> >> >> > configure:20054: i586-poky-linux-gcc -m32 -march=i586
>>> >> >> >
>>> >> >> > --sysroot=/home/y-mitsuki/yocto/build_keyboard/tmp/work/i586
>>> >> -poky-linux/uim/1.8.6-r0/recipe-sysroot
>>> >> >> > -c  -O2 -pipe -g -feliminate-unused-debug-types
>>> >> >> >
>>> >> >> > -fdebug-prefix-map=/home/y-mitsuki/yocto/build_keyboard/tmp/
>>> >> work/i586-poky-linux/uim/1.8.6-r0=/usr/src/debug/uim/1.8.6-r0
>>> >> >> >
>>> >> >> > -fdebug-prefix-map=/home/y-mitsuki/yocto/build_keyboard/tmp/
>>> >> work/i586-poky-linux/uim/1.8.6-r0/recipe-sysroot-native=
>>> >> >> >
>>> >> >> > -fdebug-prefix-map=/home/y-mitsuki/yocto/build_keyboard/tmp/
>>> >> work/i586-poky-linux/uim/1.8.6-r0/recipe-sysroot=
>>> >> >> > conftest.c >&5
>>> >> >> > conftest.c:65:25: fatal error: anthy/anthy.h: No such file or
>>> >> directory
>>> >> >> > #include <anthy/anthy.h>
>>> >> >> > -----
>>> >> >> >
>>> >> >> > Then uim-anthy is not created.
>>> >> >> > In order to build uim-anthy, anthy.h is need but it is not
>>> installed
>>> >> >> > into
>>> >> >> > recipes-sysroot.
>>> >> >> > anthy.h is incluced libanthy-dev not anthy.
>>> >> >> >
>>> >> >> > Therefor I think libanthy-dev is need.
>>> >> >> >
>>> >> >> > Let me know you opinions?
>>> >> >> >
>>> >> >> > 2017-08-08 12:48 GMT+09:00 Khem Raj <raj.khem@gmail.com>:
>>> >> >> >>
>>> >> >> >>
>>> >> >> >> On Mon, Aug 7, 2017 at 6:00 PM Yusuke Mitsuki
>>> >> >> >> <mickey.happygolucky@gmail.com> wrote:
>>> >> >> >>>
>>> >> >> >>> anthy.h could not found at confiugre of uim.
>>> >> >> >>> Dependency broke since it began to use recipes-sysroot.
>>> >> >> >>>
>>> >> >> >>> Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
>>> >> >> >>> ---
>>> >> >> >>>  meta-oe/recipes-support/anthy/anthy_9100h.bb | 1 +
>>> >> >> >>>  meta-oe/recipes-support/uim/uim_1.8.6.bb     | 2 +-
>>> >> >> >>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>> >> >> >>>
>>> >> >> >>> diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb
>>> >> >> >>> b/meta-oe/recipes-support/anthy/anthy_9100h.bb
>>> >> >> >>> index a65d324..c507ad7 100644
>>> >> >> >>> --- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
>>> >> >> >>> +++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
>>> >> >> >>> @@ -18,6 +18,7 @@ SRC_URI[sha256sum] =
>>> >> >> >>> "d256f075f018b4a3cb0d165ed6151fda4ba7db1621727e0eb54569b6e2
>>> >> >> >>>
>>> >> >> >>>  DEPENDS_class-target = "anthy-native"
>>> >> >> >>>  RDEPENDS_${PN}_class-target = "libanthy0"
>>> >> >> >>> +PROVIDES_class-target = "libanthy-dev"
>>> >> >> >>
>>> >> >> >>
>>> >> >> >> This seems redundant
>>> >> >> >>
>>> >> >> >>>
>>> >> >> >>>
>>> >> >> >>>  inherit autotools pkgconfig
>>> >> >> >>>
>>> >> >> >>> diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb
>>> >> >> >>> b/meta-oe/recipes-support/uim/uim_1.8.6.bb
>>> >> >> >>> index ed846b9..4cb7b62 100644
>>> >> >> >>> --- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
>>> >> >> >>> +++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
>>> >> >> >>> @@ -14,7 +14,7 @@ SRC_URI[md5sum] =
>>> "ecea4c597bab1fd4ba98ea84edcec
>>> >> e59"
>>> >> >> >>>  SRC_URI[sha256sum] =
>>> >> >> >>> "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1c
>>> b235f"
>>> >> >> >>>
>>> >> >> >>>  DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses
>>> >> intltool"
>>> >> >> >>> -DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native
>>> >> >> >>> takao-fonts"
>>> >> >> >>> +DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native
>>> >> >> >>> takao-fonts libanthy-dev"
>>> >> >> >>
>>> >> >> >>
>>> >> >> >> It should say anthy not libanthy-dev
>>> >> >> >>>
>>> >> >> >>>
>>> >> >> >>>  RDEPENDS_uim = "libuim0 libedit"
>>> >> >> >>>  RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
>>> >> >> >>> --
>>> >> >> >>> 2.7.4
>>> >> >> >>>
>>> >> >> >>> --
>>> >> >> >>> _______________________________________________
>>> >> >> >>> Openembedded-devel mailing list
>>> >> >> >>> Openembedded-devel@lists.openembedded.org
>>> >> >> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-
>>> devel
>>> >> >> >
>>> >> >> >
>>> >> >
>>> >> >
>>> >>
>>> >
>>> >
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>
>

