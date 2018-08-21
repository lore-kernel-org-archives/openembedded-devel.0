Return-Path: <diego.rondini@kynetics.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E92D0790D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 09:25:07 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id y5-v6so19323265qti.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=A1MYsiib8QwWxQrbckDnap7yg53ea2FhIv61g1q+1mQ=;
	b=EFp+T3L/VEoX2kDKIGHqHeyqJXQqh+vNudS/vlXqPLT8kBqn7sYofz0UfKDEIFF13x
	XQKzDLYob2nYDsai3Ffe+eO8MqVkbhHpKLHjIx6ouOu2HdqjjiJBrHKLT2ISXnNQg7hF
	FaQEP/Qu1RyOlDJhpa/Pe6uSrVeUC1AZ2oI547A+E6LXPEwU/QVFtuUa57vD92vVtffr
	kpKb/U3/gvI3VAb9zFRiNBt64vJ21DI3fH/eG/Zv47Rrc7ZTggZo9SPMdRXDGUSFgj2r
	9jx6YTG/Tf3lF1AAKvgv1JTqlGv3WwesorIF4UPnpPOqoC6fDp2nVLRIylBV/3zxxg+3
	//ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=A1MYsiib8QwWxQrbckDnap7yg53ea2FhIv61g1q+1mQ=;
	b=q3SkFZhtsXu9Y9T4JJco5ZpoiY8zuQJExdODtFYi7UDmui9a4c60Nn67aH9/9CIVPS
	sOEp9ApKhLEYNxvRVDHplrp3NdsPl1EpqzA77pmqgnJbijIfsws5NmJ3Edr95CRkLqZc
	ZH6Ab9/61H/V4qgDphtKC2eyLKo+4GL6sXBRx3DmuSUtkMh667mRM1YCalTRhKuS7nFm
	NvDOX2f3/G1CZr56jEpFpq9L6r6WSWHVVed4zjBJpqvP1MbQtvKV/+dKdPQgtmSxuygs
	pCsBQQzDW3rqiMD5fH5PvBID0uHhQ2pi856LE2ibPh9QGiP7fHCKUbupfRZWLJO6USf3
	1WxA==
X-Gm-Message-State: AOUpUlEY1rXnBeMOmE4dijyszTUIMbX9FbD4A8mHZAOOjqH8HZ4P8dlS
	DZ76A2YupBI4dp7MOAQIOjnfg5qAN6cgJ0dRu7pchzhKhfwLxg==
X-Google-Smtp-Source: AA+uWPwnYZI47UNpoxkqI06rl4lKJN5o21f3paR0PKq6mSQ5/gwRTV/d54OxR/8jQhWTfFTzQvx7cuPy+T7v3+ggk18=
X-Received: by 2002:aed:3688:: with SMTP id
	f8-v6mr49018664qtb.276.1534843508509; 
	Tue, 21 Aug 2018 02:25:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:357a:0:0:0:0:0 with HTTP; Tue, 21 Aug 2018 02:24:48
	-0700 (PDT)
X-Originating-IP: [79.7.224.57]
From: Diego Rondini <diego.rondini@kynetics.com>
Date: Tue, 21 Aug 2018 11:24:48 +0200
Message-ID: <CAMfw5YrWn2_PAgRwhA72D2rTaftnkA50cBdhettQu-oooFD_Lg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] tbb: check the version of the cross gcc instead of host gcc
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
X-List-Received-Date: Tue, 21 Aug 2018 09:25:08 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm hitting an OpenCV crash that is caused by libtbb.
The problem is described here:
https://software.intel.com/en-us/forums/intel-threading-building-blocks/topic/636519
https://software.intel.com/en-us/forums/intel-threading-building-blocks/topic/641654

GCC versions >= 6.x default optimizations are too aggressive for TBB.
TBB disabled those optimizations in release 2017.0:
https://github.com/01org/tbb/blob/615bb971db8784ab6c005a856e8ed3e8cea61d9b/CHANGES#L377
but if the host gcc version is detected, instead of the cross gcc, the
optimization is not disabled, thus uncovering the crash.

My suggestion is to backport this commit:
http://cgit.openembedded.org/meta-openembedded/log/meta-oe/recipes-support/tbb?h=master
in pyro, rocko and sumo.
The commit will allow to properly detect cross gcc version (which is
>= 6.x in all the above releases), and thus deactivate the compiler
optimization causing the crash.

I've tested on rocko, and the backported patch fixes the crash I'm experiencing.

Best regards,
Diego Rondini
Sr. Embedded Engineer

Kynetics
www.kynetics.com

