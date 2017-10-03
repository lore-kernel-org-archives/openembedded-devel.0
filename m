Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C31206FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 05:17:32 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i23so7892136pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 22:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bxn8TZ2tize8FM9jOz8mllFmqTK8sRymnGt2mWVgzCc=;
	b=ErZm7k131A3HQ7fuwaAPZ+bET+2QinCRVCOXyNdzCMeHCcNlEWOU65KLjXDPqgg2XN
	83Y9cYXyys9sa61X1rPbHFO2KRH1mI2Rj2emzoRDijSoqzcnWYJmmmyGffzVnqCbzLK6
	UBlQ+J9Qo3biacqWe2DvYQ1urmE+QFv2Bw0lya1zO9s4igXG4k+xkG4oZN62oeiFIJk2
	VyRBwLNbbN1e+OvPbPdDLShVIo1/a5r4ALyJcJbODjo527RPSuA0nhoYi/oUI6EHCavv
	B84Yjk/rOOt/dwYAIxIdrHK2rSnWEA1gU0rSjbdDWidIZuRosafpbj6Z/0YItiIk4Xw9
	dSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bxn8TZ2tize8FM9jOz8mllFmqTK8sRymnGt2mWVgzCc=;
	b=hE6pk1/LhG+3GJ/kZAsHXwBu4EengSb5SDHZtz+r2s6ShejY0i/pkSrKuMhWKgawrp
	fXnU9A2xOWIIwmdc+BD7++AgleNmEXSGyMcEn//Dz/34OgVQjtlM+ggRdZMuaqHkBAnY
	CyioymcbVemtl/uA6tZTUD4q4La9JonzvplgToUW/mIqNs+OV4dgKngF2ratoUrclAR9
	I2jJVp2XG/qLMbbD4m70WNwYDIzP0mSJMxPSMSyFChbiY+8jNPOTWrbjzgmlT+3EWmuD
	o32dHgr6+b2dM551hDDpIxpMgIL7yi8l4ZbmBctXiPIxmx/fvDoKhuRnVUjPdLNBj8R8
	kCuA==
X-Gm-Message-State: AHPjjUiTJq87CRl2/HM0Xgjmfc/PnI4oGewNClnBRw2voIDcqoGuN/U+
	1prdQcF9SlsXh/QzhAiKkujJTh0VY+eW2K1fKXk=
X-Google-Smtp-Source: AOwi7QBlBQMh9XO81JgSwPzMuwRdY64QY8fEQA0wekzLHa6LB+i/1ijsbo/c066Bx4pZbz6GCZTIek8yw9JTap+qZLk=
X-Received: by 10.101.86.196 with SMTP id w4mr14569669pgs.341.1507007853760;
	Mon, 02 Oct 2017 22:17:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Mon, 2 Oct 2017 22:17:03 -0700 (PDT)
In-Reply-To: <19831714.58pvmM1ExM@peggleto-mobl.ger.corp.intel.com>
References: <cover.1506973045.git.paul.eggleton@linux.intel.com>
	<CAMKF1soN=5DqaviTuLXY5==aLd5AfCJq94Y3bsYU7zSHPc34Qw@mail.gmail.com>
	<2042040.KWICL2DpS3@peggleto-mobl.ger.corp.intel.com>
	<19831714.58pvmM1ExM@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Oct 2017 22:17:03 -0700
Message-ID: <CAMKF1soWoRyRPtLCkcuiLtCvTL99We=PnrQ+wiQnrb=1SwQAVA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/2] mraa: move recipe from meta-refkit-core
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
X-List-Received-Date: Tue, 03 Oct 2017 05:17:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 2, 2017 at 7:21 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday, 3 October 2017 3:03:59 PM NZDT Paul Eggleton wrote:
>> On Tuesday, 3 October 2017 2:45:35 PM NZDT Khem Raj wrote:
>> > On Mon, Oct 2, 2017 at 12:40 PM, Paul Eggleton
>> > <paul.eggleton@linux.intel.com> wrote:
>> > > +# CMakeLists.txt checks the architecture, only x86 and ARM supported for now
>> > > +COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
>> >
>> > May be it should be "linux*" at the end so musl is covered too.
>>
>> I just borrowed this from another recipe in OE-Core - AFAIK though the regex
>> isn't anchored so that shouldn't be necessary. Did you try it? (I'll admit
>> that I haven't).
>
> OK, I did just try with TCLIBC = "musl" and it seems to pass the
> COMPATIBLE_HOST check so the regex is indeed not anchored.

hmm ok.

