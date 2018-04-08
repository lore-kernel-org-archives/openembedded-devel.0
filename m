Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 123A474943
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 22:33:19 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id 132so7306744qkd.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 15:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Df8817aY4Y2JHt7Wj7xbyaGRK34NRT9kPlrPFtFLFYY=;
	b=J4WQqbMsGZUqkUxdUKkYWGEvi9kWpdsV3CGtw9SKoiaeBkFnrEW9TrX8JcrWEnG2qD
	cHWKUgN20ksmvCUkCVJt39aw6WLqzEwwLec7EYcPCuP8JUWObP3ZpT9wG2HIPTGFCflK
	zieB2leruQhWfkhAkknIsQjN8tAj8Gc4fMqCT70HNFVrn/r0xV2j7ERiXMj/thIzLVTP
	xsYpWPxE9EPAxGQoPQ0QEBfHnYCtqLRA62+s7vfG+QormReBjN1POh5OjBrLpVWVlxMp
	TyGNIOlOBcSXFzTU+AsguqmBSTtYAfUNa651FoKHdRSrhL1WvTqoUNpqPc/9Wf5jYrHp
	8h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Df8817aY4Y2JHt7Wj7xbyaGRK34NRT9kPlrPFtFLFYY=;
	b=KDMX4DvINAerPvfh6Kv20rHwJkGbb59FbYpHJwlIzGYcceJ+owqCiWA4SqWznXDZmi
	aQt3gIgSH4utS9eF+iypuaF+QD3dghb88L2vuznqNHnxJKqIHUgk/q2nKXLaKM4gYsSA
	asSbmFUpVZq9fnafUWAgehTZS1D6B558Blnu+hsOc5g4/gG+eyJlvFAFFOB9M8KleYFw
	fxxS3pYsDvp2/Y+kEu70gTuRahkphn5ixQFMf4UXKt+8fsBNduUobQ014gegKz+4wdcS
	nQSHNQOlBxRt3AyjkLbwtZuhgD1ebHfwyTbFM9tPZukhBQSbvwimn4EFCjYMxBY+MOMv
	whqQ==
X-Gm-Message-State: ALQs6tC4pYl+EPejZOLvpTdtsnf59FVft3jA7dBVIkpNvXn+y+pe4/4Y
	EavTcu7xLhPaG4jdCOkn4iznNA==
X-Google-Smtp-Source: AIpwx49OOK8iXy/Qtr1KS1/hd+Q2q9W9HIk5U551rn39p9mmbQeD721wOnatC2/gPbFGIithnm1iDg==
X-Received: by 10.55.148.1 with SMTP id w1mr45412771qkd.354.1523226800503;
	Sun, 08 Apr 2018 15:33:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:6097:a43d:5d02:3a1c?
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	l52sm13034711qtc.45.2018.04.08.15.33.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Apr 2018 15:33:19 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
	<20180319155951.GW4418@bill-the-cat.ec.rr.com>
	<7699bd0f-bcf3-ffb1-6973-f7cf5835d7ec@gmail.com>
	<CALbNGRQt57sNkjeU6Bk3C1fM2WF-iz5mec_pHTGooX5zYfrszw@mail.gmail.com>
	<CALbNGRSX+RpV2EQLXK-hYmqsi_1TPXurdL6a7VJNzRR3Tzxg8g@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3e096dff-6f09-d111-f230-6f20dbd1724f@gmail.com>
Date: Sun, 8 Apr 2018 15:33:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSX+RpV2EQLXK-hYmqsi_1TPXurdL6a7VJNzRR3Tzxg8g@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded Layers
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
X-List-Received-Date: Sun, 08 Apr 2018 22:33:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 04/08/2018 02:33 PM, Andreas M=C3=BCller wrote:
> On Sun, Apr 8, 2018 at 11:00 PM, Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
>> On Sun, Apr 8, 2018 at 10:39 PM, akuster808 <akuster808@gmail.com> wro=
te:
>>>
>>> On 03/19/2018 08:59 AM, Tom Rini wrote:
>>>> On Sun, Mar 18, 2018 at 02:32:15PM -0700, akuster808 wrote:
>>>>> Hello all,
>>>>>
>>>>> I have been reviewing the meta-openembedded sub-layers and I plan o=
n
>>>>> taking the following actions:
>>>>>
>>>>> Please keep your comments focused on the 3 items below.
>>>>>
>>>>>
>>>>> 1) I plan on resetting the sub-layer maintainers. Several maintaine=
rs
>>>>> listed have been inactive.
>>>>>
>>>>> If a currently listed maintainer is interested in continuing, pleas=
e
>>>>> send me an email.  I plan on removing in-active maintainers in 12 d=
ays (
>>>>> March 30th).
>>> Patches going out today.
>>>
>>>>>
>>>>> 2) I plan removing meta-filesystem and moving recipes to other laye=
rs.
>>> Based on Martin's response, I keep meta-filesystem around one more re=
lease.
>>>>>
>>>>> 3)  Meta-gnome, I have heard feed back regarding this layer. Does i=
t
>>>>> make sense to remove it and push needed recipes out to  other layer=
s?
>>>>>
>>>>>
>>>>> I want to get any restructuring done prior to sumo release to lesse=
n
>>>>> impact on the Sumo maintainer.
>>>> I would suggest that for sumo, any layers that do get moved /
>>>> re-distributed / whatever, a "dummy" version be kept in place that s=
ays
>>>> where it moved to (or where recipes were migrated to, or whatever is=

>>>> appropriate) and then they can be dropped in master.
>>>>
>>> For meta-gnome I decided to BLACKLIST all remaining recipes with plan=
es
>>> to remove them for Thud.  This follows the current blacklist policy.
>>>
>>> - Armin
>>>
>> Sorry but this email slipped through for me. Was busy getting sumo
>> into shape. BTW: have still not the slightest idea what patches might
>> get applied - so I'll stop to send out more.
>>
>> FWIW
>>
>> * I want to continue maintaining meta-xfce.
>> * I still don't like killing meta-gnome. But go on I'll do my own
>> layer for those recipe I take care of. I am tired of people
>> complaining instead sending patches. This is kind of consumer
>> mentality I wouldn't expect here.
>>
> Just to make it clear: I am totally disappointed of the way things are
> handled here and what the priorities are:
>
> I've invested a lot of time in several layers for sumo to
>
> 1. keep recipes up to date
> 2. remove outdated recipes and helping people depending on them
> 3. fix bugs
I appreciate all the time and effort you put in maintaining the layers
you care about.

> 4. ask for when is sumo is going to appear here exactly without
> getting an answer
If I branch for sumo now, it wont be built anymore in the world builds
so we wait until core stops changing.=C2=A0 meta-or always lags in the
branching from core.
>
> There are ~60 patches pending for me and again:=20
pending as in submitted to be included in master or are you waiting for
merges to meta-openembedded core before sending more.=C2=A0 Our builds ar=
e
about 3 day's long and if it bares, they get restarted and that adds to
delays when thing get merged.

> I have no idea what
> status they are in or if there is some rebase necessary or if they're
> going to get blacklisted.

I have been using stagging/master-next for 5 months now.
>
> Forget me as maintainer for something here and go on blacklisting.
That would be a shame but if you are sure, you can send patches to
remove yourself as maintainer of meta-xfce.

- armin
> While you are at it how about blacklisting meta-xfce?
>
> Over and out
>
> Andreas



