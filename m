Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id E23F06010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jan 2017 00:56:41 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id 34so298034951uac.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2017 16:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=vSLFtOJGoCZ7/F8E3bDS7E3Pvk4UmmK4ibSStz41NOc=;
	b=sb/scMQMjh5JyhUIfL5+GQme8QHFYOKrMfG40Uji6JQpe+zZqhL4NH4TTgTug3ujrj
	JQn3rQ73huvA/WQDEeLYGDhsxnPcx5bnvBWu5ldU1mrV3H8lljUCeroS4GyME3sMxqvF
	eEnwhIms7qVP5Q23gI43/ZSXoDjFvXEwZzRJQUiZTfvcdRI7qcvB4hMuernuAFhgbDJw
	uMknbNfXcLIpQ6wa5W9vbARQxpEG2Qgl/fujY8UgF76MZzBdubDs4kamZ55k/ui/NvBF
	91yWBTDCX5sxmWd7txfXSjO9Y6nm0khn/50ZTYo6dqy5IPjMuKmHdAWP9LtqvU1vtPOQ
	iaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=vSLFtOJGoCZ7/F8E3bDS7E3Pvk4UmmK4ibSStz41NOc=;
	b=TXSzcWAMU88wQ1DFZpEa5jea6OSycicHeTYyICm32dzLLMBqgOeO+GCRN0v/iMR9xO
	ZJScAU32OS0ZGV7SyeArdM6yggoV8Y6aephipbyeB6kWNeEuRZCOwraPHQNSEz1cs89w
	xJvPwATYYIcrLA+Ip1McZqHDXwAlandjgefHn3xJlWIkzMZGznx9tsEv7UnSPUSNN1So
	RPdpp0CLpeqOXPmpna+T31ieUO8FQpRbf2HpYqF1esVPuP31/T0H/xZuQV1qUEB8Sm9F
	nKApoIvHbwf5LxhkKHEw0Xwc4anJjnB1xk6Lyg/uak9jK58XsNiJLYTU6w+epHwlzxOa
	yX1Q==
X-Gm-Message-State: AIkVDXI82wRRiSDEBfN/ZwfHNULpH8h5v3PvwtDQPuWz3FYebDmd4kK6KuJkuQynXnVzM7GktKdX+aQFcpNU6g==
X-Received: by 10.159.35.19 with SMTP id 19mr48946585uae.47.1483491401549;
	Tue, 03 Jan 2017 16:56:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Tue, 3 Jan 2017 16:56:41 -0800 (PST)
In-Reply-To: <CAMKF1so8B_AXK4AyB4YTveyRe23Z-hoq7c-C5xSa9E3KrcykMA@mail.gmail.com>
References: <1483462910-24912-1-git-send-email-schnitzeltony@googlemail.com>
	<1483462910-24912-2-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1so8B_AXK4AyB4YTveyRe23Z-hoq7c-C5xSa9E3KrcykMA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 4 Jan 2017 01:56:41 +0100
Message-ID: <CALbNGRREnqfg_MQE3awdgALu=4RYMh+uqc7Zn7gj_mXBYoa=YQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] raptor2: initial add 2.0.15
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
X-List-Received-Date: Wed, 04 Jan 2017 00:56:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 3, 2017 at 6:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jan 3, 2017 at 9:01 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> +LICENSE =3D "GPLv2 | LGPLv2"
>
> minor nit. It should be LGPL-2.1
> --
Correct & thanks. A here and there polished V2 comes after final test.

Andreas

