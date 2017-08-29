Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 842E17821C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 01:37:23 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id m15so1592941pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 18:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EPUhl/cvwR9lCs6mzovkozX2WQBdSY2DQGuCqCWm0m0=;
	b=lmOyyZCfIarpKMZfKTBjir1IltoeDgkabS/e40hd2XBPlOrQWB6NlCW395tvRSXFzP
	LNhNYxtipjF8MPGRmRaf30ZylbFkD6bWPvqkwaCfsIdgbGiuDOxShk8CuZtLUnApo3Oz
	s6ek+7KhQ9canH1P7S008rX1ykSQVXXUSJyPVzV/N4iBpc6YoN8Wqo6TdDSkaxtlUdJX
	I63tboBguuBLfbTtBx4+HN4YJG9iLezA+bKUKXFYZQlfdeyocXhMKAZVgsI0fpddrrRU
	L7cL+OETaaxsmpo7rcvaYBUf6JQhf54tL+dnApSjpx4iW7ja8wk3qywXtf7Q3qBI+4IK
	nRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EPUhl/cvwR9lCs6mzovkozX2WQBdSY2DQGuCqCWm0m0=;
	b=RUj7yj922D58qW/cRHwgD/kAWGJ817QttzTKyFafdoN35elHyioltXybuwQvPxdOHW
	EeETJnllk4/+JsxeEo8yjePoe5IO2aWc1LXkdQdqkiQhVfmJvzQcsxRlYo4S7sLia76J
	ufFa2ewaWlb/kRfmJ7AUW3N+74Tn3VJd1AnLVdkBCveR0cqjcBgD7HmfX5phzfvfx2Uq
	bs/GqMyCZiij3QK1yXvepSUZnCe9gmC/FxsCKCqwi7p0u2ES2zoU033WjaE4ZfqgUY8D
	43KdYhhsv76QwmKsBGWYwK/AFptpDRuJAO1IFsur0VKe8CMQZMVUwHYrVgCTaX/gdVd0
	2rSg==
X-Gm-Message-State: AHYfb5jzGDnjHhqemFlAc5Uzglrpt9zQUIphkz8HYpJ+K8LRliSG4dz7
	+tlq4gGwwq9TgdOjquv7DoMZdHgFzg==
X-Received: by 10.84.217.137 with SMTP id p9mr3079138pli.404.1503970644700;
	Mon, 28 Aug 2017 18:37:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 28 Aug 2017 18:36:54 -0700 (PDT)
In-Reply-To: <f381675e-2355-f6dc-212d-5f62b7ce3392@windriver.com>
References: <20170828181315.8179-1-fabio.berton@ossystems.com.br>
	<c51a31ee-0d0a-f2ba-8791-c6ac04e0d80f@windriver.com>
	<0d791125-a113-03a5-d1cd-61a54c4a2550@windriver.com>
	<f381675e-2355-f6dc-212d-5f62b7ce3392@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2017 18:36:54 -0700
Message-ID: <CAMKF1sqCjZfcOE0S=Wq4AeFcG309wGFg4Dv4_aRsA=+6uJps_A@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iproute2: Move append to meta-networking layer
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
X-List-Received-Date: Tue, 29 Aug 2017 01:37:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2017 at 6:30 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
>
>
> =E5=9C=A8 2017=E5=B9=B408=E6=9C=8829=E6=97=A5 09:19, Mark Hatle =E5=86=99=
=E9=81=93:
>>
>> On 8/28/17 8:07 PM, Mark Hatle wrote:
>>>
>>> On 8/28/17 1:13 PM, Fabio Berton wrote:
>>>>
>>>> meta-openembedded commit eb8994f44a080d9c7fd2c87b6b6935ad0a55eb27 adde=
d
>>>> iproute2 append to enable tipc PACKAGECONFIG that install libmnl
>>>> package. libmnl recipe is in meta-networking layer and this layer
>>>> needs to be added to bblayers.conf file to build libmnl. Move
>>>> iproute2 append to meta-networking to allow build iproute2 without add
>>>> meta-networking layer to bblayers.conf.
>>>
>>> At first I thought this was the right answer.. but the more I look at
>>> this, the
>>> more issues I find.
>>>
>>> The iproute2 bbappend modifies the PACKAGECONFIG.  The modification of
>>> the
>>> PACKAGECONFIG (other then adding new options) should not be done in a
>>> bbappend,
>>> otherwise it 'changes' the settings for that recipe.
>>>
>>> I'm thinking the right fix is actually to remove iproute2 bbappend.  An=
d
>>> any
>>> distributions or users who need tipc should enable it themselves within
>>> their
>>> distribution configuration files (and also include the meta-networking
>>> layer) as
>>> necessary.
>>
>> Sorry to reply to my reply.. but
>>
>> Simply reverting this ends up with:
>>
>> ERROR: Nothing RPROVIDES 'iproute2-tipc' (but
>>
>> /home/mhatle/git/lpd/master/layers/meta-openembedded/meta-networking/rec=
ipes-extended/tipcutils/tipcutils_git.bb
>> RDEPENDS on or otherwise requires it)
>>
>> So somehow tipcutils requirement needs to be based on the configuration =
of
>> iproute2.  I'm not sure how to do this.
>
>
> Hi Mark,
>
> The tipcutils 2.2 removed the tipc-config tool and recommended to use the
> new configuration tool named "tipc" in iproute2 package for configuring t=
he
> tipc.
> The tipc in iproute2 needs libmnl as dependency but it is in meta-network=
ing
> layer now. so I add this bbappend because we can not enable tipc build in
> oe-core directly.
> Randy had pointed the best way is move libmnl to oe-core and enable tipc
> build in iproute2 by default.

As suggested earlier, please propose a patch to move libmnl to
oe-core, there are many other
packages which depend on it.

>
> Yi
>
>
>>
>> --Mark
>>
>>> --Mark
>>>
>>>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>>>> ---
>>>>   .../recipes-connectivity/iproute2/iproute2_%.bbappend
>>>> | 0
>>>>   1 file changed, 0 insertions(+), 0 deletions(-)
>>>>   rename {meta-oe =3D>
>>>> meta-networking}/recipes-connectivity/iproute2/iproute2_%.bbappend (10=
0%)
>>>>
>>>> diff --git a/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>> b/meta-networking/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>> similarity index 100%
>>>> rename from meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>> rename to
>>>> meta-networking/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

