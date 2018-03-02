Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0A1567873C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 19:24:00 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id j7so3084583ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 11:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tDCuukbzHNr4QBb4H0FxKV/5NEAyzGckgiNMyvQkPP0=;
	b=bAUzROqedlenRhbDBqu1dPtsHkpG9wloHfxyePyFfjJygvApgVppCHE4zf2yCp2V6K
	NVm6vqkG4cisoKtr62MbqS7Pn0ybWeLg3ZBb2LMvM0eMmM3aW2WNAuC38+hQ4EVdqCav
	YfPBxHsPWHWRgJ6oAkxN6QnfgTizobG9W/BF8InDZzwS/8/2VcKAUeIspFH2RoSM7pBI
	g/SIcBqrzovlCjG3OatIoRKD1RzO6Ip25mYqd4PilC74GjDps1ti1NAHz5Kgwv5xZSOD
	QfinVKiYKDmgVrU0tP8VvVPHUk9uFLKM6aC4zRhmAgWDDTYgLIT6a9DNHfft/ZlhIF8U
	Ga+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tDCuukbzHNr4QBb4H0FxKV/5NEAyzGckgiNMyvQkPP0=;
	b=oFkEUeXyNcozp6OXBbnfMPiwhEAhiPKjswUx+GVmB7VY4sIXYzFCKkveMmWVOgMVYW
	srXD0KBfY7X7MKTrdPFGsDDx628qU0BpMc8SghkZXYhKXNNBOgyyAqPRqunO+HBI8wBE
	TjExOINhmRbEOybyFXNESlXsral9JOn/2OKVV80s9U3tgv8KM3e7lCon+mJkmM0Zqa05
	t3hP3qs7pPVe1Wmzu8LBaMXx5MwCJJ/NyfbFDlKfruE9sTCHrAYnO3RbgFMRkqcJLYcU
	AA2DhJJ5ACWjDUJuugBrbvAMgq+lmErwPCpJN6fcqWrEvlBqbVyWb29AAOJGh663A9Vq
	lV2Q==
X-Gm-Message-State: AElRT7G//OlSmjMKe8L9w7G9Vx8BV338/+LAcc35wl1KGRVFyKKziFej
	4j0QfRiQLanHsRd4b9BcdvOCZbv7qXJDn5p32+A=
X-Google-Smtp-Source: AG47ELskZCZTKQwUChzurMQKIPa8b8+agg5NbRTzUyQRVXkVHgNLQmf7e4/n+9m02wuSAi4B1qv73eNWVt+X8B2X4Zk=
X-Received: by 10.36.64.140 with SMTP id n134mr3844100ita.84.1520018642233;
	Fri, 02 Mar 2018 11:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20180302170307.jmf5hyru6lwv6kjq@mbedesk.sonatest.net>
	<CAE=T-s72xDp1uwWSeB3si3Nyq3r=SYhoEgJHscyOkmCqsv6cjg@mail.gmail.com>
	<CANx9H-CgyZi-FDu5vhqTMr01TSM1JXcrimWiEWRZNPKE-L0MDg@mail.gmail.com>
	<CANx9H-B9+hpz0rG8LzOQeNVbxBXm5brWnrvwie5+Eqw_QDB+qg@mail.gmail.com>
	<CANx9H-C+--t0rp4U=qC_ZF2SP6Hg7dW6wXsFeKLvb9swRF_35g@mail.gmail.com>
In-Reply-To: <CANx9H-C+--t0rp4U=qC_ZF2SP6Hg7dW6wXsFeKLvb9swRF_35g@mail.gmail.com>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Date: Fri, 02 Mar 2018 19:23:51 +0000
Message-ID: <CAE=T-s5BfZbHx_rCnEnVdUQ-ft56e6TE7DMvc5odSgfVov34AQ@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
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
X-List-Received-Date: Fri, 02 Mar 2018 19:24:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nice! Thanks for the work you've put in that recipe.

It might be enough for what I have to do.

Looks like still missing "${PYTHON_PN}-importlib" in the RDEPENDS.

Do you have a mirror or a tar.gz that correspond to the SVN repository?
Looks like sourceforge has been down for a while...The one on the download
page of the libagg website isn't the correct version.

On Fri, Mar 2, 2018 at 1:42 PM Tim Orling <ticotimo@gmail.com> wrote:

> Also, the documentation specific recipes are not committed yet, because
> they are just raw 'devtool add' status right now and have not been run ti=
me
> tested or scrubbed for proper submittal. That will have to wait until aft=
er
> ELC.
>
> On Fri, Mar 2, 2018 at 10:39 AM, Tim Orling <ticotimo@gmail.com> wrote:
>
>> Rather than keep all the work I have done in the dark, I pushed the (not
>> ready for prime time) WIP branch to contrib [1]. I was a bit over zealou=
s
>> and tried to also get the documentation to build (as there are tests for
>> documentation). I also have not completely gotten the pytest.ini to skip
>> tests as needed (some of the tests hang or take too long to run or have
>> other issues). I have been working on this off and on for months.
>>
>> [1]
>> http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/pyth=
on-matplotlib-2.1.2-WIP
>>
>> On Fri, Mar 2, 2018 at 10:16 AM, Tim Orling <ticotimo@gmail.com> wrote:
>>
>>> Yes, this is a known issue. I don't know that python-matplotlib was eve=
r
>>> actually complete enough to run. I have about 90% of the solution to ma=
ke
>>> it run (and add ptest to prove it runs), but sadly this is a free-time
>>> activity and ELC and other things are pre-empting that right now.
>>>
>>> On Fri, Mar 2, 2018 at 9:17 AM, Maxime Roussin-B=C3=A9langer <
>>> maxime.roussinbelanger@gmail.com> wrote:
>>>
>>>> It should read
>>>>
>>>> "
>>>> python
>>>> import matplotlib.pyplot as plt
>>>> "
>>>>
>>>> instead of
>>>>
>>>> "
>>>> python
>>>> import matplotlib.plot as plt
>>>> "
>>>>
>>>> On Fri, Mar 2, 2018 at 12:03 PM Maxime Roussin-Belanger <
>>>> maxime.roussinbelanger@gmail.com> wrote:
>>>>
>>>> > When I run matplotlib in a genericx86-64 image it's missing the
>>>> dependency,
>>>> > python-cycler.
>>>> >
>>>> > I patch that dependency, and then run it again with
>>>> >
>>>> > "
>>>> > python
>>>> > import matplotlib.plot as plt
>>>> > "
>>>> >
>>>> > Now I get another missing dependency "Cannot import name '_path'"
>>>> >
>>>> > I've tried to make it work, but alas. Have any other developers
>>>> encountered
>>>> > this problem?
>>>> >
>>>> > Is it a problem with the recipe itself?
>>>> >
>>>> > Thanks,
>>>> > Max
>>>> >
>>>> > --
>>>> Max
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>>
>>>
>>
> --
Max

