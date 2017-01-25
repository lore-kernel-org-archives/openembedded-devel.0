Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 73301719AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 18:29:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r126so44349662wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 10:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=qlFsCdj3ZTHRPP2a3U0jvcRAbDISlqE/KU8Tks0IMLw=;
	b=UxjmT5yAmcvtvaW6JfqvLwyHd44vlkzmM30CqNN8kicy4xmz9uZBvDIzMXbXzf1mMs
	jskDMiOpqiNt2y2SVXlwPB2ixduCy+Vtk9pfUt7XAIQ2L4zHea7qkd0JjUhYt96a1xnn
	OD9oino13WfVa+QmEi10xunFduv/YCnWNAv7Lo20VDVmHNL4gqGfcFR9GUYZmXtXS2vj
	jfqt71bf3GEwai5f9ULl46jYKfASrvYDdA5WHAl9+U4JZPh0AUPZwRikJjVlfU/WfSpu
	l/+mCufwWk4skcRoQGMOg3k+mUG4BH00aaw+iWmIJOGQX49prwDWEKbdfRO1Y6ljSkXa
	2DBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=qlFsCdj3ZTHRPP2a3U0jvcRAbDISlqE/KU8Tks0IMLw=;
	b=SBnZWcSzj/rHObWRw6soCmqyLVAih9bTI6l/DlCi2dA3Q4ysaGBHK0Xh9ITWS+xim0
	1BfU4EjIIfhNsAjcCcg/Y3Kg0QJuamj6ENbWUats/qbIYuz26oREqqB0mOpU7sUfRnpa
	eFdS0rJrqPoBAZLwlB8wC23SI8TT5p5AbtGBKHlWw8ZrJknTpq//42WVJtBnQNVtTrld
	YIBXgzHHuBsyl529mYatGncJsYCsT1MTdsMtZ+44G6uNad8b+BT8l3LgfnZp6TTN05W5
	A7rhjRmAvrboX/k+emLNII2C3GnKApl9IuONJt8ArdxOksZsjuUtvlQzpXmsXakTz+rj
	zjBg==
X-Gm-Message-State: AIkVDXKA/v4fxMB0MngUrKcqkrOUP77LeJH7/7Krl+wbVOGYv/Jcxr04BOxLmy3qse/OoVlIpqm2tva0bAySMg==
X-Received: by 10.28.94.8 with SMTP id s8mr22931293wmb.117.1485368989880; Wed,
	25 Jan 2017 10:29:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.248.129 with HTTP; Wed, 25 Jan 2017 10:29:49 -0800 (PST)
In-Reply-To: <1485334713.6808.1.camel@andred.net>
References: <1485285570-27494-1-git-send-email-armccurdy@gmail.com>
	<1485334713.6808.1.camel@andred.net>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 25 Jan 2017 10:29:49 -0800
Message-ID: <CAJ86T=Xo3HsztJfJfzK2Qj5pv_yNMoRsHVbcwj589MgNsaYU2w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] luajit: mips and mipsel are 32bit targets too
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
X-List-Received-Date: Wed, 25 Jan 2017 18:29:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 12:58 AM, Andr=C3=A9 Draszik <git@andred.net> wrote=
:
> On Tue, 2017-01-24 at 11:19 -0800, Andre McCurdy wrote:
>> When cross compiling, the word size of the compiler set via HOST_CC
>> must match the word size of the target. That's achieved by appending
>> "-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.
>>
>> Unfortunately the current list of over-rides (powerpc, x86 and arm)
>> does not cover all cases. Add mips and mipsel to the list too (which
>> is still not enough to cover all targets or corner cases such as x32,
>> but better than before).
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-
>> oe/recipes-devtools/luajit/luajit_2.0.4.bb
>> index 964dc1d..2049846 100644
>> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>> @@ -24,6 +24,8 @@ BBCLASSEXTEND =3D "native"
>>  BUILD_CC_ARCH_append_powerpc =3D ' -m32'
>>  BUILD_CC_ARCH_append_x86 =3D ' -m32'
>>  BUILD_CC_ARCH_append_arm =3D ' -m32'
>> +BUILD_CC_ARCH_append_mips =3D ' -m32'
>> +BUILD_CC_ARCH_append_mipsel =3D ' -m32'
>
> I suspect this should be using:
>
> BUILD_CC_ARCH_append_mipsarchn32 =3D ' -m32'
> BUILD_CC_ARCH_append_mipsarcho32 =3D ' -m32'

That wouldn't work so well when backported to krogoth and morty (which
is where I personally need the fix).

But maybe there's a more generic way to answer the question "is the
target 32bit?" from within a recipe without needing to keep a list of
over-rides up to date?

> to also cover mips r6?
>
>
> Cheers,
> Andre'
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

