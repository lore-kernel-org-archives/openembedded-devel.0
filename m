Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id B9E4978440
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 17:26:47 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l81so9966912wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 10:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kmxnA8NCH5Sj1u1C+CynMixMaHmLgq1swPBUuDQrjkY=;
	b=FoGjjTCwEjldT1tBYsXydO9kd+g6mHDwM5l9BFQrPkUdrvf2/YB5hpt964eyPTC27G
	Pl4UdWwvSMEl7/u7I+pkK/i//hxwisvxpluYHQFJVb69mzYJELSUZ4o4fgRRGSyFj8BT
	FR9bD2t4s5/nuumSOaFQc1QdE7PmB392GBZSwtJ12d/4nma/ngZpfoIOcvuoW15gkEDr
	9X5+/TbMk9OihENyFp/izmNxhQ39O2lNPkutzr61vs+FgZ5ctC2ZSJepXO4zNZqqR+/5
	XhuZoktfQGAvMY7M1we43trhMmRvmskWXgEb3Du9pGPzGZ7n8Y+5joGweAlY3i2m8jF6
	f6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kmxnA8NCH5Sj1u1C+CynMixMaHmLgq1swPBUuDQrjkY=;
	b=d2vIcefDkhOToa6QNVq/tp1NB8PUKIbuquViKVefSnmzdfueEeNU9zyFiiBL5QgmXD
	na5+pZMAXyaRCJ2iKMt+mjXc9JMv1o+RgyS41qvYK9fX67oLdT+7y8h2S3MXRwxymgun
	98CZRksyRt88c1Xni5zGvrXKnCV98h52wggYwKU94pVpynqGBqOlgI/O/u53SzGsIVds
	U8Vzohz/C5mWzT+O1KeAyNE1NXr25eCF1L4qjP0zlC27asNc058BLUGcQYQ/HYEuerjB
	kIf3SBxU7OiANr2eGxWAmyUVlAKjvQ5Zh2dDSuPxS8fKUE4GcwAwgbujJYc9fontSzia
	5zhA==
X-Gm-Message-State: AIVw112uhAMzwpmSNDfSlzNm4MuLnMTro1at2Wm7d1mTSehRcD3KXXzY
	9oprmVW+1m9Ha3rHa601kJSXaLxLAQ==
X-Received: by 10.80.217.141 with SMTP id w13mr9013263edj.228.1500744408397;
	Sat, 22 Jul 2017 10:26:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Sat, 22 Jul 2017 10:26:18 -0700 (PDT)
In-Reply-To: <CAMKF1sruKooyyNm=PSV_CZKo8agS2Zub655KZE4E6qfkHHNL+Q@mail.gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
	<20170718031013.44536-10-raj.khem@gmail.com>
	<CA+chaQcPvJNaX1UseBsHY7K1Ggzkf2DYbSg3i45MGwAHu7f56w@mail.gmail.com>
	<CAMKF1sruKooyyNm=PSV_CZKo8agS2Zub655KZE4E6qfkHHNL+Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Jul 2017 10:26:18 -0700
Message-ID: <CAMKF1sqSdye3sXLmi1MBwMbRnAzXRPnzm453HCLqgzo4t_1k7A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 10/17] efivar: Upgrade to 0.31
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
X-List-Received-Date: Sat, 22 Jul 2017 17:26:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 22, 2017 at 8:04 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Jul 22, 2017 at 2:13 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> For target version it fails to apply gold linker patch:
>>
>> Applying patch 0004-fix-unknow-option-for-gold-linker.patch
>> patching file gcc.specs
>> Hunk #1 FAILED at 14.
>> 1 out of 1 hunk FAILED -- rejects in file gcc.specs
>> Patch 0004-fix-unknow-option-for-gold-linker.patch does not apply (enfor=
ce
>> with -f)
>>
>> and native version fails in do_compile with:
>> In file included from dp.c:27:0:
>> util.h:109:10: error: expected expression before =E2=80=98int=E2=80=99
>>           int *: int_add(a,b,c),   \
>>           ^
>>
>
> Interesting, I will take a look again

I just rebased kraj/master

https://github.com/kraj/meta-openembedded/commit/26ac6c0863936618321eadaa12=
c2fa9d562b6261

it rebased fine and also built fine for intel-corei7-64

