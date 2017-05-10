Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 07A1E6FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 05:56:51 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id l50so27693746wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 22:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J6939zF6UFZQuXPMYQJKGoCjIENzrPy6hs2ierjTeTY=;
	b=N/VhP8QJo1skCNbUOxt95KlCG/qTyq4ZM1jpxkMGZwldbF2IsRCA6++0ogxptOScH/
	K4x3ns+eHK9vFifb++AJ10zTo+DggM55wYPUr53aSl18xjKRTHMknEDHaHZ78rIZiBnD
	rc67nIv+/uapBZTxhJT60e8QFPzlmGeZRhNqJJb+FbOj0xOgxU4nYG4/BhamWeXarvyG
	n1x4ti3ss8Bze00Cn3m9sgkNJzuY+tl4RdtOVp2+uB0MzSXUUwLVAsFdjd4wDeNF4qia
	XHi1eHZ0K/wWWWhgJ0SDvPeYRsH4QR30GQpTAUCkB17yy0ClJRgF53KWFjWswhMhOapW
	5l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J6939zF6UFZQuXPMYQJKGoCjIENzrPy6hs2ierjTeTY=;
	b=aBy/z3tEMaPltr5W+ZPl3Cp7nXp6xZUWPpcVBVj9xfjrOsVoxykuhSHBt52h+IhyaO
	4fxvKycy9yC9IyYWwmwF6sKUesa5MZLMx0TFf9XJOKikdX82DjL/AF8q1/n+u2iONwV4
	jKMd71jdDLqbWIHyMT2Qr4dVpO2zuMdZ23Ok0CjYgmz2STEQXN6VR27SvnvZdXZkVtAd
	x3UK40ldCXMpIGL+Z/Kpnnoo9NREslO8/ln3B3BRXyzPUNQfbnqWCEFUzZcgj25edgR8
	vBEefC5iwAqpZmwPYU2MUaUaoRaI7WpobRVifY92U7v4okwDoOogWA9j5XJS3DZPV0WQ
	Cbfw==
X-Gm-Message-State: AODbwcDGGamodqHPw2cNk13uEY3RjqGkLW5UpMzsIGBkff1f9527qpYE
	8MYgO4CbweswbetZppg2kV+xuuYKGA==
X-Received: by 10.80.178.228 with SMTP id p91mr2809141edd.131.1494395812202;
	Tue, 09 May 2017 22:56:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 9 May 2017 22:56:21 -0700 (PDT)
In-Reply-To: <20e4f085-fa4f-bc37-9133-fcf3891fd9b3@siemens.com>
References: <e9ec2489-e51f-222b-a4e0-2f537eff1e7d@siemens.com>
	<CAMKF1sqbD4106u6rkQUTkAyzhqXyR6yMMByrLqFVyZGAS9KeNQ@mail.gmail.com>
	<20e4f085-fa4f-bc37-9133-fcf3891fd9b3@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 May 2017 22:56:21 -0700
Message-ID: <CAMKF1soeDgDRj737nWY3hHQwTHdQoVHugr4fCJLtqN_pJjLkWg@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-java: Building openjre-8 on a non-gcc-6 host
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
X-List-Received-Date: Wed, 10 May 2017 05:56:59 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 9, 2017 at 10:53 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 2017-05-10 07:46, Khem Raj wrote:
>> On Tue, May 9, 2017 at 10:34 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>> Hi all,
>>>
>>> seems like the current cross rules for openjre-8 at least break if the
>>> host compiler < gcc-6: -fno-lifetime-dse gets injected based on the
>>> cross compiler version, which is 6, but is also used for the few native
>>> pieces of that build.
>>>
>>> Any suggestions how to fix that properly? I had to temporarily redirect
>>> my default gcc from 4.8 to gcc-6.
>>>
>>
>> see if you can check  -fno-lifetime-dse options is supported in
>> Makefiles before using the option, that way you can ensure that its
>> only used with
>> compilers which support it
>
> OK, that means another patch to openjdk, right? OTH, the injection comes
> from the recipes. Are you synchronizing with upstream on the those
> cross-build issues?

yes it should be handled in the jdk build system., no I am not doing
this upstream

>
> Jan
>
> --
> Siemens AG, Corporate Technology, CT RDA ITP SES-DE
> Corporate Competence Center Embedded Linux

