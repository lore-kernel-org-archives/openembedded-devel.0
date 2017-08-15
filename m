Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id C8185784F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 14:18:13 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id e124so8425355oig.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Hah1fohBL1hRKexFhhs7llm3mlkoTobnphoTnq4xZ5A=;
	b=Fw7WjjR9ZhXHOqsOMDW+s1+90oZvXTyFsPwkd3Hsqt95gy9WCuQ5mk4Qfr85R5fdXe
	aa3mD6/EoMNYN/JfCyL850Y4g18uia2uJNF5f0viFePj1XKjONdVKxOiHJ+AkwueYCy3
	yxnjxSf0VmaMOdh8nMUdAohGppvON0iK4UQ00IjAkeDsM3HmnrOORt1UTUny3OPI3OrQ
	ejX7dSGiDOmyKlz/s0xzog6hT1qNpwJ3kzShLNmafOJI3kT+M/d9h8O+4Zm2R6DqyPgc
	c+g3oPO7iNqTmm6vgU+05e7gRa2hdizjbayh1bSmE9FhXFAiC/ouf3uIigcxr1octbv+
	H2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Hah1fohBL1hRKexFhhs7llm3mlkoTobnphoTnq4xZ5A=;
	b=sSRuTqt6DUKrLlTOaQb70IM4fDUWPHi4Is0TMcNiwOxf2AvDNsh7eNFjO13KeNAHrI
	K8IcbXjCFY7jzVmL/sPUXt/EpsjhmBJ6Gvj8nEbv6TvzUOylKAO4YPqQZb2t4vPJqMjp
	k6BSRWzZvqH3qHwDTGNrbPQZAGXiiX7Q/3dhMTOXniDhnNRhuLl47IIZqgMf9KZIencm
	T5+Qoje1UGVhN1+tQKEgksiOOMfmNOAHBzEVFu/VRDCIeFFlfBkNPS+awYNbWDB65vw9
	w6RQIBw7BsM1rC2kCRqqh1ygNzkUwm2gk2vQMvPvHQLVQuDto9eHtGeYAvEm58beZyi7
	F5iw==
X-Gm-Message-State: AHYfb5jtw4XnymXThym2dKCsjRm0sCyps/D1R1Tz7aHxyw5zzZGUDyFd
	GvzeGbWSjaN/05ITww0=
X-Received: by 10.202.82.11 with SMTP id g11mr34048752oib.310.1502806694328;
	Tue, 15 Aug 2017 07:18:14 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41]) by smtp.gmail.com with ESMTPSA id
	v186sm11455386oie.44.2017.08.15.07.18.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Aug 2017 07:18:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id x3so8404430oia.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 07:18:12 -0700 (PDT)
X-Received: by 10.202.235.140 with SMTP id j134mr29975881oih.281.1502806692562;
	Tue, 15 Aug 2017 07:18:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.247.10 with HTTP; Tue, 15 Aug 2017 07:18:11 -0700 (PDT)
In-Reply-To: <87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
Date: Tue, 15 Aug 2017 11:18:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrCcP62G1yH6Ww-4ApvEr_n6E0Neg-bkgAnWsNozn7=XQ@mail.gmail.com>
Message-ID: <CAP9ODKrCcP62G1yH6Ww-4ApvEr_n6E0Neg-bkgAnWsNozn7=XQ@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>, 
	Carlos Rafael Giani <dv@pseudoterminal.org>,
	Khem Raj <raj.khem@gmail.com>, Trevor Woerner <twoerner@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Tue, 15 Aug 2017 14:18:14 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Raphael,

On Tue, Aug 15, 2017 at 10:05 AM, Raphael Kubo da Costa
<raphael.kubo.da.costa@intel.com> wrote:
> Otavio Salvador <otavio.salvador@ossystems.com.br> writes:
>
>>>> On Mon, Aug 14, 2017 at 12:22 PM, Jussi Kukkonen
>>>> <jussi.kukkonen@intel.com> wrote:
>>>>> On a related note, this good work is currently a bit hidden in
>>>>> meta-crosswalk -- is there a chance we could get this combined with
>>>>> meta-browser (or whatever place makes sense)? I know next to nothing about
>>>>> chromium packaging so CCing Raphael and the meta-browser maintainers for
>>>>> comments.
>>
>> Indeed it does sound like the proper workaround for now. That said,
>> I'd love to receive more help from meta-crosswalk people and avoid
>> duplication of work in packaging Chromium so I am adding Raphael on Cc
>> here so he can comment about how we can try to work together on this.
>
> The main reason why we haven't worked together yet is procrastination
> from my side :-)
>
> My recipe's working fine and is up-to-date with Chromium's stable
> releases, but I'd love to find a more permanent home for it and stop
> duplicating the efforts, especially as I spend most of my time working
> on Chromium itself, not its Yocto recipe or even Yocto in general.
>
> The main reason why I opted to start my recipe from scratch at the time
> was simplicity: the meta-browser repository used the same recipe for
> Chromium, CEF and Chromium with Ozone-Wayland, offered many different
> options and shipped quite a few patches that made updates quite
> difficult. My recipe is a lot less customizable, but OTOH that makes it
> quite easy to move to new Chromium milestones. If we're able to find a
> balance there, I definitely think we'd be able to get a lot more done
> together.

The newer releases do not require the Ozone patches, AFAIK, and in the
worse case, we can keep a version for CEF use if they don't match.

I think Carlos, Khem and Trevor would also be happy to help to test
and reviewing those patches. So please take a look and see if we can
avoid this duplication as it'd benefit a broader set of users.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

