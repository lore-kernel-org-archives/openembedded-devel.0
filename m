Return-Path: <twoerner@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id E46B16003C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 May 2018 02:45:24 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u12-v6so12037857wrn.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 19:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0BaSdbLCxujIbFcffTp1hL1ry/IPGV0QF8k782BAiDg=;
	b=Ru4Eu+tqTAbvxpXT/LGgvwEJVvjhUTUuBpkxrIRstl7Hk2Ta8DUDj7vhdex2+XuUxy
	r7SQ2Cf91nCFHv8wnAyGltYvSH0vI0hfiLZdFPVxnBHrtVbxcg05DiQiyK2fYxpcO9hM
	dB/WqMBTE4md+msYCIardI7h3gLtrmndapO+/1Esm0St1fdoBNA+kszfIURawLV/qboS
	5osPpyodssBFNcuntUcdmA5EKwuZC3nBlPphcyeUo06WEeIBt0faiFvmxWyGrmnZEJtI
	EzxgfmzrgqJMkzmobtrN3G768yHfvdC6Fq6TVNGWVWkMcxswXxF9dWR5zzLtEha/ir3i
	gZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0BaSdbLCxujIbFcffTp1hL1ry/IPGV0QF8k782BAiDg=;
	b=IHzpDsI5vH4BrIqTGWViJ8oIFEHNGJHUGRF4uFWBJGFx0eSlZPF/T+Sin9guvPgvse
	nydOR4JM5RiPo5+o5h7MCvjMUJ82X6gOZgQ8DdK9wh5SxtpshMeI83xbDOsQArqcUl/6
	9D9/+NG0oCnpfvxW9RMmrpc1fc4KrbDHp5Ulj1wLAj/F/OQEIJgsaHorEivM/8+WO84z
	E/yOhN/CblFUcjT+vhWcpkGSxY+bVGIfp2c7h51bhfqVDh6TdjTnblvbtM0K8/RwCZrI
	RBaLwCj4N860A/nOhBGZ9oyrMscwMrTjtWKHwm6LLw4oODA5n8rKCkximY52ynmqdwRt
	qVlA==
X-Gm-Message-State: ALKqPwfhDxyJW5vnItf58MS4zteF5/w3EUIb7n3IM+pl1B8yTVJY+0fl
	Ok7omlBmUFEqGoWFacWHCPt4/FWXYahaJv89yqA=
X-Google-Smtp-Source: ADUXVKIGwtZenp5O39BEh8jbnGaZPHREbxcUVIFYN+lTpcja7aGXvjpgcm5+2OHEEhDe/DQfmYJ+Fg7rya1CVdjsPT8=
X-Received: by 2002:a19:6d02:: with SMTP id i2-v6mr2681517lfc.81.1527302725228;
	Fri, 25 May 2018 19:45:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb07:0:0:0:0:0 with HTTP; Fri, 25 May 2018 19:45:24
	-0700 (PDT)
In-Reply-To: <CAJ86T=XbNpLWxCYmOoTRLyvYGZcwD+7tBeg-xi33p1SDZDzEAw@mail.gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
	<20180524143854.24096-18-twoerner@gmail.com>
	<CAHUNapRj1Sadwo8BAujAuPn3Egs85vshAgz4dGW8f_4dzd0Atw@mail.gmail.com>
	<CAJ86T=XbNpLWxCYmOoTRLyvYGZcwD+7tBeg-xi33p1SDZDzEAw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 25 May 2018 22:45:24 -0400
Message-ID: <CAHUNapRfpD-bB2WWFkyw4FTO5Q0_Mhs+wcwKYx6eEwmfROxN_A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master-next][PATCH v3 17/17] libeigen: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Sat, 26 May 2018 02:45:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 25, 2018 at 3:58 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, May 25, 2018 at 8:22 AM, Trevor Woerner <twoerner@gmail.com>
> wrote:
> > As Anuj pointed out with patch 16/17 of this series (opencv: rely on
> > cmake.bbclass...), so too is this patch wrong and shouldn't be applied.
> > Sorry!
> >
> > Looking closer at this recipe (on an unrelated issue) do we really want
> the
> > include files being part of FILES_${PN}?
>
> No, we don't. It looks like it's been done that way as a workaround
> for the libeigen build not creating anything which would normally go
> in the main package. Setting:
>
>   ALLOW_EMPTY_${PN} = "1"
>
> together with careful review of the packaging rules and probably
> removing the RDEPENDS and RRECOMMENDS over-rides may be a better
> solution.
>
> You should also carefully check that things work as expected when
> libeigen is added to an SDK. That's a corner case which tests
> dependencies between runtime and -dev packages which isn't tested
> during a normal build (for what it's worth, creating an empty runtime
> package by using ALLOW_EMPTY_${PN} = "1" has always been the easiest
> solution whenever I've looked into this kind of issue in the past and
> it "just works" for the SDK case).
>

Sounds good; I'll take a look. Thanks!

