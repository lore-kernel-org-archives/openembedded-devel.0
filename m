Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sc0vK-0008Jp-UP
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 23:04:19 +0200
Received: by eaal1 with SMTP id l1so1686419eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2012 13:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=WEUeBKSCCbZFXvS4Zr1+rdWxzVEoEji9YiLZ+5ylz3E=;
	b=UQYQTOB0qPM5nM0sxtkrX3eMR86JJWEQVaKyeZdQ4H/cr2OjUQZHx0hmSwmrb3dAOX
	+E2G4JUGv2TNLh4vr4KGUT4qqwFk10x2a0G9wolIHvbfEU5gR+JyWmZhgeuFcvfAklYe
	CBkaGv5/l1eylLja5FD1+JP2KZ6WRiWn2Zzdr3+zGrn8Ch2nEu8CPh6UCMWRukyZHolX
	GBZvrhzvVrW0/VuhRwoLlW24T1ub5QoEsNPAQq09lNxng1NvUSlpKv7tU8/dXkQ9w7LT
	6E4ovI8fjguqlHG3ANlmli7eigc2sUcu5NU+lBbVL1B2EF/PrH6FIeIhL8RfIa7XQR/m
	1i+g==
MIME-Version: 1.0
Received: by 10.14.94.201 with SMTP id n49mr2384609eef.158.1338929632563; Tue,
	05 Jun 2012 13:53:52 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Tue, 5 Jun 2012 13:53:52 -0700 (PDT)
In-Reply-To: <4FCE2F51.3030003@gmail.com>
References: <4FCC5A7B.8040204@gmail.com>
	<CAMKF1spW20v28PG+Te=5nfiGR0upuRqTRTr7G3w3SZTeR1zi7w@mail.gmail.com>
	<4FCE2F51.3030003@gmail.com>
Date: Tue, 5 Jun 2012 13:53:52 -0700
Message-ID: <CAMKF1sqdnyayLoU0Fdhxgy07uUdHDiB3D6pF5gpZpjb8HFFx7w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gcc-crosssdk-initial can not compile. Get message: this target does not support --with-float
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2012 21:04:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, June 5, 2012, Martin Erts=C3=A5s <martiert@gmail.com> wrote:
> Sure. Will do it first thing in the morning. Think this actually happens
in compile though, for some reason. Do you want me to paste it and give a
link, or is it ok with an attachment?

Paste in is ok
>
> - Martin
>
> On 06/04/12 18:32, Khem Raj wrote:
>>
>> On Sun, Jun 3, 2012 at 11:49 PM, Martin Erts=C3=A5s<martiert@gmail.com>
 wrote:
>>>
>>> Hi.
>>>
>>> When trying to compile meta-toolchain, it crashes during
>>> gcc-cross-initial with the error:
>>>
>>> this target does not support --with-float
>>> Valied --with options are: arch arch_32 arch_64 cpu cpu_32 cpu_64 tune
>>> tune_32 tune_64
>>
>> can you post log.do_configure of this package somewhere ?
>>
>>> The reason for this is a commit that happened 2012-05-01 in openembedde=
d
>>> core, called "gcc: Grok for callconvention-hard to enable hard float".
>>> Reverting this patches makes it compile, and still I get the
>>> --mfloat-abi=3Dhard when compiling with the resulting toolchain.
>>>
>>> I'm compiling on a x64 Linux machine, with the target being a cortexa9
>>> processor. I have the DEFAULTTUNE set to cortexa9hf-neon. What should
>>> the patch do, and what will happen if I disable it?
>>>
>>> Best regard
>>> Martin
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

