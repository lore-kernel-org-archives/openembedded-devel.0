Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 48B10789B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 18:42:34 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id q7so6304517vkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 10:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pwIf86mu8u6RhnP8zUgFzcFOgQT8sWTv+PZJ2RceZxs=;
	b=JT026w2S1cimvQ9ERdCqriTrmoA8vaO3ThVy7AIeyIt05gbo/1gDqlSIMNEAzVTBaL
	iF68Yy0QdHG1lyt+AQ2/aewf1focNDb/hucJKj4ueg1sZvkLB9wmqZZ/MrCEaYr6JkMg
	MSbvim2A+3FghprcAcFtHavadkI6Yl9BEhGn9kqAiEQL6d9xW859lBdxpMhmDkN4Y/g4
	V/bVsCMKgOA4UGgPhITOTBLfhMbbEfDFrusnL5GxBsMFKKn2PTdyIAmMaX3lKV2jBQ+x
	L5DChabUVnXG8+YtWl+zil7YH51Rw1N6agcTxRkumYoQTieyNTNSbjxL/gpeIegPr567
	DvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pwIf86mu8u6RhnP8zUgFzcFOgQT8sWTv+PZJ2RceZxs=;
	b=X1HpZokcvulJdCHyLinkw62lB2x3BciIwzvjKEDIX8/XTsQkrLiAKTzZh4nsGb+8K+
	GQydwtPybPK+KvCgkGJsWhQQy47OM7fdVq1CXsbLzer57Pb3+MescZe36yoi96naAY5F
	dmEKmhpwlvfIexWkpMktwZ3Wm6pXYiYPv0qRvbV69wmlHdZVscA99E+ztvjpyfta2d0E
	c3VpghTS+9tR5MFYdic3haZCddd+So9MSQaJL3HWQ3eBUDqqtD0khD8x97+SG4laxulj
	cTz6gw1OsRtiK8hShC1n94vpN49NnnRHP6LJ3ynnxHVOPLFT3FlQoTo7YXePYiE+YqH4
	ENmw==
X-Gm-Message-State: APf1xPCVaATLUQZuaqc9AdbxKAV8t47A/yHO/kWm7UkxX8QeRLHlc66n
	48mRS12NqJcljbYgvWo+nTaEPDw28hVknV4D0IU=
X-Google-Smtp-Source: AG47ELswpKeLeI2LkshjVSDSU1JaeCys5XRi3DRk0t3+eMrXAD9L1IFb8IqwKLzTMTRkoQzWXvKpiNI3LYd03DZR5jk=
X-Received: by 10.31.201.70 with SMTP id z67mr4385012vkf.154.1520016155256;
	Fri, 02 Mar 2018 10:42:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.52.207 with HTTP; Fri, 2 Mar 2018 10:42:34 -0800 (PST)
In-Reply-To: <CANx9H-B9+hpz0rG8LzOQeNVbxBXm5brWnrvwie5+Eqw_QDB+qg@mail.gmail.com>
References: <20180302170307.jmf5hyru6lwv6kjq@mbedesk.sonatest.net>
	<CAE=T-s72xDp1uwWSeB3si3Nyq3r=SYhoEgJHscyOkmCqsv6cjg@mail.gmail.com>
	<CANx9H-CgyZi-FDu5vhqTMr01TSM1JXcrimWiEWRZNPKE-L0MDg@mail.gmail.com>
	<CANx9H-B9+hpz0rG8LzOQeNVbxBXm5brWnrvwie5+Eqw_QDB+qg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 2 Mar 2018 10:42:34 -0800
Message-ID: <CANx9H-C+--t0rp4U=qC_ZF2SP6Hg7dW6wXsFeKLvb9swRF_35g@mail.gmail.com>
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: meta-python/python-matplotlib
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
X-List-Received-Date: Fri, 02 Mar 2018 18:42:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also, the documentation specific recipes are not committed yet, because
they are just raw 'devtool add' status right now and have not been run time
tested or scrubbed for proper submittal. That will have to wait until after
ELC.

On Fri, Mar 2, 2018 at 10:39 AM, Tim Orling <ticotimo@gmail.com> wrote:

> Rather than keep all the work I have done in the dark, I pushed the (not
> ready for prime time) WIP branch to contrib [1]. I was a bit over zealous
> and tried to also get the documentation to build (as there are tests for
> documentation). I also have not completely gotten the pytest.ini to skip
> tests as needed (some of the tests hang or take too long to run or have
> other issues). I have been working on this off and on for months.
>
> [1] http://git.openembedded.org/meta-openembedded-contrib/log/
> ?h=3Dtimo/python-matplotlib-2.1.2-WIP
>
> On Fri, Mar 2, 2018 at 10:16 AM, Tim Orling <ticotimo@gmail.com> wrote:
>
>> Yes, this is a known issue. I don't know that python-matplotlib was ever
>> actually complete enough to run. I have about 90% of the solution to mak=
e
>> it run (and add ptest to prove it runs), but sadly this is a free-time
>> activity and ELC and other things are pre-empting that right now.
>>
>> On Fri, Mar 2, 2018 at 9:17 AM, Maxime Roussin-B=C3=A9langer <
>> maxime.roussinbelanger@gmail.com> wrote:
>>
>>> It should read
>>>
>>> "
>>> python
>>> import matplotlib.pyplot as plt
>>> "
>>>
>>> instead of
>>>
>>> "
>>> python
>>> import matplotlib.plot as plt
>>> "
>>>
>>> On Fri, Mar 2, 2018 at 12:03 PM Maxime Roussin-Belanger <
>>> maxime.roussinbelanger@gmail.com> wrote:
>>>
>>> > When I run matplotlib in a genericx86-64 image it's missing the
>>> dependency,
>>> > python-cycler.
>>> >
>>> > I patch that dependency, and then run it again with
>>> >
>>> > "
>>> > python
>>> > import matplotlib.plot as plt
>>> > "
>>> >
>>> > Now I get another missing dependency "Cannot import name '_path'"
>>> >
>>> > I've tried to make it work, but alas. Have any other developers
>>> encountered
>>> > this problem?
>>> >
>>> > Is it a problem with the recipe itself?
>>> >
>>> > Thanks,
>>> > Max
>>> >
>>> > --
>>> Max
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>
>

