Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 872F0744F5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 11:29:44 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id f63-v6so8042385oic.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MZvDVjuDHXfmG9jUAHhKV3N9HERG0Suk9TNPvbhAIkg=;
	b=n8rK6g9JZWN0fRlpF7x6YdlsnsHp1zBdlCi4Wtx2+tmtVbReyLzGsC93L9TDMDMeKK
	degqgoSnMDx596KADe7V6Btbpuzc1oaI5Z2DyxFVIlAREJCNvOKacqXR7xXquUOiWUUT
	44njp8ekvRX4SgVErnxAlpADf6R1+lGM1++7Zb0l3tgfCKpRTZGfivk7F/y3XNSdUr+h
	2gBQsGL0TddP9b4GkLreGu1ladU8aw5qjVAqv9vubf3q1PvH90vBDo2w3kC4YTREpWUy
	tQDKKRfaX1rx9EU17AFXI+7RxhaUEMeT/OwvHlozNwGyiCCF3lkls6LR/Jr3Sv50Gbsw
	YTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MZvDVjuDHXfmG9jUAHhKV3N9HERG0Suk9TNPvbhAIkg=;
	b=uRhlVbQR+nuwqgq4TeXapt9uRTPUhuD2DDoIK6rHHY4KWvGqAH6mRjVvsbOMyh1Qvl
	GdfO045sFR/DJ1pdqIdVEgPO0YeGZVouJcAW5ox/TtIft3HgZtf49dkZ6TCVZgQvbPrY
	Fj8RVmUaxTpAwn4bjaPWGglOgKe4w/6EBVHBhC5sCVA53IWa+h8UHOfwy5R+1g0/yMov
	dN93l/Ws0TmhCJfSfocBgAx4byzhu7c2US/RzSnoEAC3rNb7kaMOmVgJIZr0i7/QGZAp
	YM6ZPn6ZMO5KSZalFwiM5l30wziASpJ9myHyHXjTn3wvm+mOajuTbCWYiYRThxd++u4U
	Lm0A==
X-Gm-Message-State: ALQs6tBK4s1wbvRTyVzNIyCj6tRutz1/8TvkeMhItXv6HxR7qNEZAky4
	qIXfhvmJpB5JaWgfmk7OHYttdhTRx5x12fItpYI=
X-Google-Smtp-Source: AIpwx4944pe5LgrinvEynpa33HfWrtHukGs2X5j9gGLA+1SxO80U7k3V7KsjjdX0cxAh0buG4H4TEyAAlABYAeYH3nU=
X-Received: by 2002:aca:af0e:: with SMTP id
	y14-v6mr8474560oie.224.1523618985309; 
	Fri, 13 Apr 2018 04:29:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Fri, 13 Apr 2018 04:29:44 -0700 (PDT)
In-Reply-To: <paq34l$o0b$1@blaine.gmane.org>
References: <CALbNGRT5ZWGZ=YCaSgpmryCzQFPKxDFYLCbOgSP3T1L9gJ0L3g@mail.gmail.com>
	<1523588270-121531-1-git-send-email-hongxu.jia@windriver.com>
	<papp8c$n9j$1@blaine.gmane.org>
	<f6d6ee40-e3f2-d105-738b-2369bb26323a@windriver.com>
	<paq34l$o0b$1@blaine.gmane.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 13 Apr 2018 13:29:44 +0200
Message-ID: <CALbNGRSCe0H8NJ7YTa1uBKpnWEmqDp7wEX15QjBBgWHx4HgSRg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH V2][meta-gnome] metacity: add back and change upstream
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
X-List-Received-Date: Fri, 13 Apr 2018 11:29:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2018 at 1:11 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Op 13-04-18 om 11:08 schreef Hongxu Jia:
>> On 2018=E5=B9=B404=E6=9C=8813=E6=97=A5 16:22, Koen Kooi wrote:
>>> Op 13-04-18 om 04:57 schreef Hongxu Jia:
>>>
>>>> +
>>>> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/m=
eta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
>>>> +PR =3D "r1"
>>> Please drop the PR=3Dr1 line, since the recipe gets readded there shoul=
dn't be an issue for package feeds.
>>>
>>
>> I do not drop it on purpose, if the oe developer do not
>>
>> update the repo frequently, the missing RP caused confusing?
>
> I don't think it is too confusing, if someone really needs it a bbappend =
is easy enough to write and drop into their DISTRO layer.
>
Best solution would be to re-add to a recent 3.xx and remove PR then...

Andreas

