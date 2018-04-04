Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 670C774D01
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 20:45:52 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id d7-v6so9055686ybn.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2018 13:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EH53fDFBGIZGdz+KK3C17bq7Z6pi0MZ2KZ7VP37rX00=;
	b=Jm6/3yvtV8zTopyoxbMJnrRaAVBa+tH1gWw6+mPu7LbqE7VzuixvTvI9h+mlanl8YW
	PIh6+ZdjikZkWDTOgJppK0Hd0vpNFTTroG38qKoCHO0HILI3zee3s1YawQnoq2Vf7wGv
	7kOr7MB/6BVwEoTkbHd0a0Wde+3FXqzK7tKXfptzU6OuTCqQ858RvA3ka+cyYSnN2hHs
	R2fHgDr87IVXMLPnVK/g0XdnCbOZpdB38ICwk8mJzk4ge/9QyHY5xntrrGH+lxcAF9ZC
	Kzb24qAsYi/h1s//wh+EGwSdA15mTtVHSlDQhiZ5jFJqnJXPgg+0gFAu+D8GUgtVvWXZ
	8tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EH53fDFBGIZGdz+KK3C17bq7Z6pi0MZ2KZ7VP37rX00=;
	b=XEOG8sHy1SB0eZ0gG7reR91eo+iyItKRyPcIErAdU3BoMemniCqtSlo39p447Cnkyx
	YCQz38wMHt2jDAAQ8/ZugZpccP7H1GqW30ezrzDS+k4f8TiJb7DsR0S+Bx9n6YQeCSKO
	1fanSNhvIRd4xS5fQU8QtD/eQWDBVqhFYSq84hE5So8k1u1C4fr4YTwWN94Ll0XqRJ/7
	XrJtPuqacZE/5z1WBONNorH2q4sjK7vqD0U00T4R21pn/zev/Oox2qrCAM7LNuHJJxxD
	dU3VAe/GZH9WYjYfQnx0ICLkJvNgdA7EOMJFoav1VlJ5x9idJeA6woGCarTLxsLS2klz
	AjWA==
X-Gm-Message-State: ALQs6tCdOe/GHFvZ8YdoU6R1EnvqaFYcUmHV+lFbv+u7Kfk12VZrVapL
	pKL3Mb4IyZ36MUtbjP+pvCtJH9B442wKnkNO9qw=
X-Google-Smtp-Source: AIpwx4/6BatVa1/6GCEs+c1ZcKv5Yc9xTDFv4tVNeaENvob2nEFLpO1cSqDtBpItlHyxiYmLG2MBbqPPZucwengWa/c=
X-Received: by 10.129.122.72 with SMTP id v69mr3097941ywc.145.1522874753803;
	Wed, 04 Apr 2018 13:45:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP;
	Wed, 4 Apr 2018 13:45:53 -0700 (PDT)
In-Reply-To: <CALbNGRQ+hFGBqvt0VNLLHeVBjFk7M3sZgiybiVwQBr3kqduviw@mail.gmail.com>
References: <20180404191013.38136-1-raj.khem@gmail.com>
	<20180404191013.38136-2-raj.khem@gmail.com>
	<CALbNGRQ+hFGBqvt0VNLLHeVBjFk7M3sZgiybiVwQBr3kqduviw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 4 Apr 2018 22:45:53 +0200
Message-ID: <CALbNGRTnVNgT0By0afjm09z72zD0wJcH=uGrxTkY1gtjgDBC4Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Apr 2018 20:45:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2018 at 10:25 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Wed, Apr 4, 2018 at 9:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> v1 -> v2:
>> - Drop disabling GI
>>
>>  recipes-qt/qt5/qtwebkit_git.bb | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_gi=
t.bb
>> index e8c0868..c8e8328 100644
>> --- a/recipes-qt/qt5/qtwebkit_git.bb
>> +++ b/recipes-qt/qt5/qtwebkit_git.bb
>> @@ -18,6 +18,14 @@ DEPENDS +=3D "qtbase qtdeclarative icu ruby-native sq=
lite3 glib-2.0 libxslt gperf-
>>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
>>
>> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
>> +# https://bugs.webkit.org/show_bug.cgi?id=3D159880
>> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
>> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthu=
mb).
>> +ARM_INSTRUCTION_SET_armv7a =3D "thumb"
>> +ARM_INSTRUCTION_SET_armv7r =3D "thumb"
>> +ARM_INSTRUCTION_SET_armv7ve =3D "thumb"
>> +
>>  # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
>>  # 5.10.meta-qt5.1
>>  SRC_URI +=3D "\
>> --
>> 2.16.3
>>
> I've checked the links you are referring: Both
>
> * are related to webkit and from 2016
> * deal with runtime errors not build errors as referred in patch descript=
ion.
>
> So what do you want to fix exactly?
>
I have looked into this further and found that I stumbled for same

commit 511a3764506ce6bbdc5e9441a8f4e9d862ea1102
Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
Date:   Mon Jan 4 11:04:16 2016 +0100

    qtscript/qtwebkit: disable thumb for armv4 and armv5 only to fix
segfault on armv7

Curently recipe has

ARM_INSTRUCTION_SET_armv4 =3D "arm"
ARM_INSTRUCTION_SET_armv5 =3D "arm"

Isn't thumb default any more?

Andreas

