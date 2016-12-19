Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5C3772BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 14:13:57 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id w194so13197466vkw.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=ZNydy3MzOvopwfcGmvUMYF2A1fbJp9OYNvJmloIZhzw=;
	b=Oe2Ehpo4S+r8SvCdlWWJY8BlMP9PNVPscwhEXdV5fNO1A+CghbpR48LK0jkdbZucsS
	23+aQJpi1Xmdlca61phdJJaeFe0kY0pdDjQcQz19bkYbQ+KL3lJ6yhpk2fThD8Ed7fYr
	GxBgW2AnL6a5bWzUg8YmKr3zZBngJ/1bLw0r/HxlJX06QLjRR6n8FlYPmB993d64zwIt
	e7zoHoh4H8Xe9LXZ/ZzXvtMuXY+r14J2XSDYS+Cgy+Q5HXwXHwp9eBkVw+3qfRQ+4zEA
	TRC+7Fb8+r0YmVQpzuPUfLCdYjNxuS6jEvSS+Knzt6bU1fs3FFqTvTdrpJDOEbfUyDqo
	ExEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=ZNydy3MzOvopwfcGmvUMYF2A1fbJp9OYNvJmloIZhzw=;
	b=CpGHw2FTxaHRlbNy2jW2k7AATNsx9bculPNNqyWbTZCgDMTAyILbkrpHDl1BepBkH7
	/lDVQ2/vwpn8g8m8QN2Hspsop3OIEUNg5qaC9NRJqjnv3nVAYczaWfSWv7EDWB0ddjG8
	y6GWCNayEdAX8e4cuHWYjGdbFoTLvE7utUHBfH4ELM0IHLHIc/3PMTo3eutzXM5mxDX/
	9fK7ikjWwsDRTqW9gUgUcjTbuaGT6TssOVa+3kDOpSrWjCoKtKAbQqvggCdSjnFuyqKk
	EkZg56e/4V+IqpJgf09F0naCxGA6N5HeRrkinRq2LV04TDN81L713hDLcK31GeFUMywQ
	OFuA==
X-Gm-Message-State: AIkVDXKLtR7mgZrpw0XW4wqLGbLwL0+Le0EXQpUFpOtVqnKqVIDZVIunU74oDBG4tWWpyLsddEWdWviyyl3PjQ==
X-Received: by 10.31.189.14 with SMTP id n14mr4887085vkf.81.1482156839106;
	Mon, 19 Dec 2016 06:13:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Mon, 19 Dec 2016 06:13:58 -0800 (PST)
In-Reply-To: <CAJ86T=Xq4AnvmvZ5ciNjvymN+VPMWe_f0xm95HepLq-B0ypXDA@mail.gmail.com>
References: <1482152989-3982-1-git-send-email-armccurdy@gmail.com>
	<CALbNGRT1MSt=O90M6g9GHMmqm8nYSk4mdcSm59EK2u=f4i-qKw@mail.gmail.com>
	<CAJ86T=Xq4AnvmvZ5ciNjvymN+VPMWe_f0xm95HepLq-B0ypXDA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 19 Dec 2016 15:13:58 +0100
Message-ID: <CALbNGRSngHPNxuEwzqp6im8AAR6=RvmTd9qejWf=yammtcFr0w@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libconfig: add support for libconfig-native
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
X-List-Received-Date: Mon, 19 Dec 2016 14:13:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 3:11 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Dec 19, 2016 at 5:27 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Mon, Dec 19, 2016 at 2:09 PM, Andre McCurdy <armccurdy@gmail.com> wro=
te:
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta-oe/recipes-extended/libconfig/libconfig_1.5.bb | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb b/meta=
-oe/recipes-extended/libconfig/libconfig_1.5.bb
>>> index fb6e50e..94daa88 100644
>>> --- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>>> +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>>> @@ -12,3 +12,5 @@ inherit autotools-brokensep pkgconfig
>>>
>>>  SRC_URI[md5sum] =3D "a939c4990d74e6fc1ee62be05716f633"
>>>  SRC_URI[sha256sum] =3D "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a=
02429eec61e68703f6"
>>> +
>>> +BBCLASSEXTEND =3D "native"
>>> --
>>> 1.9.1
>>>
>> Please tell us why libconfig needs native biuld in commit message.
>
> A private recipe in a private meta layer - the names of which are
> probably not very useful or interesting in a meta-oe commit message.

So why not just an append in that layer?

Andreas

