Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BD12071C1F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 21:17:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u132so7134010wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 14:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pBP5CpDHJVV+DAr3BQp/1aESUjAKSd9SkktTy9At0EU=;
	b=eSVW7KtslDbJzxoqF6d3Qk03qBGIZ4tcoGUvBLAQ6acS8/BK0fxbwuvxpjHYPB2FHP
	vxGijKrzCIA5Vd3hrBp7bERicwfupAugJfuuszZi4fp1J+KXfW00Tusjv9qsYJ64NYlr
	SzKMW0NBES0F8aP1JsrLOqIn8CZFmOohzd0yPM8YoL28pgMoPwDzMjzY17/k6ZO9i6FX
	iOLlq/6CRLvZG1FSza7SlLPKyaCCdfixvKQvmRKOLmE0zCUR+iq+97qXdvLOQ4xGI0LT
	/nqAxBPzaty5aNYpyWqnS6aILrDYUcJLnZkAMHn85hP+5liwVrozmN61sFGnxABPD0fX
	iQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pBP5CpDHJVV+DAr3BQp/1aESUjAKSd9SkktTy9At0EU=;
	b=QFTAtp+R23xJNkZ6h/sf3kaVIQTSG/xLBwLbIARUqYfNNnLE5qO9Ft0fxU+bQExbbP
	fj2Lw/usLHLUiNOdrtwlZbwPqL1Moi1K7d0fHcg0jOGYcFyfDYlTmIRIjjq+/1/B7ZjC
	dBOqs8Ja1/qxuC3vhSNMfKHWwXiYIzLMqoZnxy28Pq2Xc817HXhK21D6KgeR6NAFB1Ml
	9LePmb4FtkTv4sAIrH74RmJwklgjl3Blo675Jxn3wVlpHYGlBrqIY9/Mox1T+S5ZEYcu
	ErTRqkHpRBiabs+iMUzsumjS+z2MEWG7xXZcrDcp8HCmMV8aQFDXK1eQNbfs4PDwzHAT
	f2/w==
X-Gm-Message-State: AFeK/H2Kdsmj2H4Rh3F4YN/4XjI3D/bDcnORzrtSO9xc2YPRvPMeXTB8huCUmijMOD3+nLpzSCrZwXHbupfBgw==
X-Received: by 10.28.1.68 with SMTP id 65mr7350863wmb.63.1489353472171; Sun,
	12 Mar 2017 14:17:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.150.195 with HTTP; Sun, 12 Mar 2017 14:17:51 -0700 (PDT)
In-Reply-To: <CA+chaQcCQYK3Mbe-Ko1cpv_LWt40w17C6Xd-e3yLWoqjQV5yrg@mail.gmail.com>
References: <1489280314-12185-1-git-send-email-andrea.adami@gmail.com>
	<043bc3e6-5d17-140c-7f74-7d584cfd0639@gmail.com>
	<CA+chaQcCQYK3Mbe-Ko1cpv_LWt40w17C6Xd-e3yLWoqjQV5yrg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Sun, 12 Mar 2017 22:17:51 +0100
Message-ID: <CAAQYJAs2hHU75c4vCS0MSJEoBEm27qNc+iH8OWQ6KgjxS6KB3A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] klibc: add dependency on coreutils-native
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
X-List-Received-Date: Sun, 12 Mar 2017 21:17:53 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 12, 2017 at 10:02 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Or we can add nl to HOSTTOOLS, there are already few items from
> coreutils-native already IIRC and nl doesn't look dangerous for

Indeed, I'd prefer this as well.
But if this isn't sorted out in oe-core then please apply this patch.

Cheers
Andrea



> incompatibility between different DISTROs (and if it is then dash people
> would already notice and fix it in their code).
>
> e.g. gcc-native seems to cause more issues than coreutils-native and we
> still depend on host distro providing sane gcc
>
> On Sun, Mar 12, 2017 at 2:02 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>>
>> On 3/11/17 4:58 PM, Andrea Adami wrote:
>> > As seen doing world builds after the host-tools changes dash needs nl.
>> >
>> >   GEN     usr/dash/builtins.c
>> > TOPDIR/tmp-glibc/work/core2-64-oe-linux/klibc/2.0.4-r0/git/usr/dash/
>> > mkbuiltins: 100: TOPDIR/tmp-glibc/work/core2-64-oe-linux/klibc/2.0.4-r0/
>> git/
>> > usr/dash/mkbuiltins: nl: not found
>> >
>> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> > ---
>> >  meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> b/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> > index f00e31a..bd0ab61 100644
>> > --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> > +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> > @@ -4,7 +4,7 @@ minimal entaglement, and portability, not speed."
>> >  SECTION = "libs"
>> >  LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
>> >  LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=
>> d75181f10e998c21eb147f6d2e43ce8b"
>> > -DEPENDS = "linux-libc-headers perl-native"
>> > +DEPENDS = "linux-libc-headers perl-native coreutils-native"
>>
>> Nothing particular against this patch but, if we are getting down to
>> building own versions of coreutils, that means we are pretty much
>> generating a build distro almost, I wonder if we can have sanitized
>> distros where we can trust them to assume some of these provides.
>>
>> >  SRCREV = "4d19974d7020488f63651244e1f9f51727c3f66c"
>> >
>> >  SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
>> >
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

