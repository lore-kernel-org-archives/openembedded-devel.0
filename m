Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 55BC578093
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 23:45:12 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j124so4814588pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 15:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4IH8SHD6/U26K9o1QAXz5bO5N5f+UOFlwnYjT/KVIUo=;
	b=WEre/NRU4FbXEUAxqB/5bshk4wgaGIAonqIGxADwdB8oZ5PzmhXBdBQik3wYPlJ/JK
	nmBpFrRmvvGg/misLFZalZKimpF/D5qxGjmw5pyg/k/QMHDO7wKa+S1NAx/YJ9TzhPyi
	WEcKOH6PTADdNYidum9qvDiSQQoQaCrbE/HJiqK/AWH0nUJRpaspXVyiJbzOGjWzpLqc
	apeHhzrsC95gQcIX+wg87b4gj2Xl5UMmQdz5JzcT3oA+2C7wJMzQao2gTlIOtJfPYk0j
	ZEBrD1x7Gs9gIGs0MOCqlKPXwZMY6pplBR377o5vl8YRrNqFUhZGrgDijVjEx4IX0cio
	woGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4IH8SHD6/U26K9o1QAXz5bO5N5f+UOFlwnYjT/KVIUo=;
	b=C6pyFIPfFTCynfoE06YknPQCJv2+aha9PlrcdfmZftzH6k2eKJ1EXlyVG61c0wFeIh
	IzAM1Hko4F6XnMxBEMNmfqVnrnonQ1YCwbsO+Jet5laBqCKGOA5jYA+0HKKmW30I1PwA
	xifHvUXWCtu3uETKiVJ4NmoWgfQtk+RkQ2D3fnb0ONyEAe3RUC/bQ4FMhQe8CmuuCo0t
	LVIevrtTfSnSxRb58xKSBnewZUXCblCn/Yc+rtOOHHB4wTG+Eodd0ANbNnVQospxHW0Q
	0Sv1OMfivfehSROy74GOoa8Vgo+TPSA//oOYcrz7uoBxxXlKvHa5STzIhuCZPUghu6R7
	oy5Q==
X-Gm-Message-State: AKGB3mLExDWeQj0Dvva7xKRywRtApklxwXboIx6OTjcBgS8/4hqTH0f5
	7jnbi6ywyp8Wxj3pzbIOgMwhfUvjAl/qcuWYVOQ=
X-Google-Smtp-Source: ACJfBovwO2bGxR2gppKINqTVMk76vwoex4d5f9pL/Vc3t5MyNzup9fvN2t5EjRrkvGh7elewn1AVG43lRXFT7H7AYX4=
X-Received: by 10.84.241.137 with SMTP id b9mr11141236pll.441.1513295113189;
	Thu, 14 Dec 2017 15:45:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Thu, 14 Dec 2017 15:44:42 -0800 (PST)
In-Reply-To: <CALbNGRRefZ4qPeE8NiEztCgzM6RMJHWw+7BDyNfm+neRhffVNw@mail.gmail.com>
References: <20171214100929.11094-1-schnitzeltony@gmail.com>
	<20171214100929.11094-2-schnitzeltony@gmail.com>
	<CAMKF1so8LTwxZsGT1xXXX0eo=KCJwg4G3u4wYiR1VDkWef1VtQ@mail.gmail.com>
	<CALbNGRRefZ4qPeE8NiEztCgzM6RMJHWw+7BDyNfm+neRhffVNw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2017 15:44:42 -0800
Message-ID: <CAMKF1sr2wBPFCNsn8BMLRVQ8Fm+=8d2W84vkdMLGCqjyGGxd8Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/5] fltk: add -fPIC to compile flags
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
X-List-Received-Date: Thu, 14 Dec 2017 23:45:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 2:46 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Thu, Dec 14, 2017 at 6:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I will test it out with PIE but
>> I wonder if it will be better to add this to the Makefiles.
>
> I've looked into this further and think fltk needs more love:
>
> * native recipe makes fltk-config reachable - not the best idea. I
> introduced native recipe but was looking for fluid only.
> * all shared libraries are named like libfltk*_SHARED.so*. I think this i=
s
> the reason yoshimi links against static library because it cannot find
> shared ones.
>
> Long story short: What do you mean by 'PIE'? I would like to test that
> either before sending out another rework of fltk.
>

try with security_flags.inc.

> Andreas

