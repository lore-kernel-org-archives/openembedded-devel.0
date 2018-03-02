Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id ED839789AB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 18:39:56 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id f5so6652820uam.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 10:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cD1zJfXMUJvYUBAkKIZX+bewiZlfSqvbOaUI/UkVpmU=;
	b=ApMXuDGUGQ/97noICjFpFMtRdO6DI7udSEPN64NtoTNCduVg/KG7GBeFYByCHlvhjw
	a90k6Hc8dwfih3CMQCpXRRtLc5gTgodQwV1w0GlWP62B1PMFFFN+cyua1cnhDjbFsT6T
	lu03L/t2lB4bediN2Mc87BwOZs6N6fCJ6dfbBbhBxvb1p/mWZ4pBXGOTYG8ddDD94H03
	IH3RlkHAP9P/8MYEyQGMZlG6tjgSj6rvV2gOVCgZQYAUuNmLO/V3WaQhmuuUTtZf/Tq8
	sC8/T0lWOwd6DGG5e2itE0NXYiYakHuwaKOi3Rcqlx8W+5JL1btL19mlc2LB3ba2KNmR
	leqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cD1zJfXMUJvYUBAkKIZX+bewiZlfSqvbOaUI/UkVpmU=;
	b=l7pFA7psZFB6tl8lAGDgtali1JKuN953sMDKrkkPuNMKDDpJaGfQUZ3/xOcCPqDiEO
	vK/LvOaZjYoGMSBB0GBUStmQKulcmXtBM0HLyNiWxjY11XU1NP9OuyVgVZq4t9aO1z4N
	z4utB5tQyzg5V2DQMzqjStX+dO3uV/QoEehvd59yvG+TVNHdRkk4DhuCztMJqMZNG1ow
	K2xB51f2c5zRzlFxLA31yokI40EaZtYUnMuGiXKHVQuQLSMUc0lYOwDUzm7gsH3QFn2F
	iktHe/2cRuuwksZFBiUzdhnGA1RJSXoUSkFoQ9xRWw4zPkWOi+eAmnQNVBid6t+TQX70
	OkZA==
X-Gm-Message-State: APf1xPAu8BgO6HFFFaJ27TI9vEJsgdofXr8I3vQF3Wbxy+quYoMeG1bR
	BFVlCYsO/jTNuhamUE/tx9wdFQeJuvFy3Yp+VRU=
X-Google-Smtp-Source: AG47ELsxMCFV4wdYbGldouV2GDUVPjNmzqIJQEbYphxjj9AyW8VGlGflVx+lpeb+hzFbamGE0gZmlpZvZ/LLSj5NrIs=
X-Received: by 10.159.61.88 with SMTP id m24mr4524203uai.139.1520015997689;
	Fri, 02 Mar 2018 10:39:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.52.207 with HTTP; Fri, 2 Mar 2018 10:39:57 -0800 (PST)
In-Reply-To: <CANx9H-CgyZi-FDu5vhqTMr01TSM1JXcrimWiEWRZNPKE-L0MDg@mail.gmail.com>
References: <20180302170307.jmf5hyru6lwv6kjq@mbedesk.sonatest.net>
	<CAE=T-s72xDp1uwWSeB3si3Nyq3r=SYhoEgJHscyOkmCqsv6cjg@mail.gmail.com>
	<CANx9H-CgyZi-FDu5vhqTMr01TSM1JXcrimWiEWRZNPKE-L0MDg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 2 Mar 2018 10:39:57 -0800
Message-ID: <CANx9H-B9+hpz0rG8LzOQeNVbxBXm5brWnrvwie5+Eqw_QDB+qg@mail.gmail.com>
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
X-List-Received-Date: Fri, 02 Mar 2018 18:39:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rather than keep all the work I have done in the dark, I pushed the (not
ready for prime time) WIP branch to contrib [1]. I was a bit over zealous
and tried to also get the documentation to build (as there are tests for
documentation). I also have not completely gotten the pytest.ini to skip
tests as needed (some of the tests hang or take too long to run or have
other issues). I have been working on this off and on for months.

[1]
http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/python-=
matplotlib-2.1.2-WIP

On Fri, Mar 2, 2018 at 10:16 AM, Tim Orling <ticotimo@gmail.com> wrote:

> Yes, this is a known issue. I don't know that python-matplotlib was ever
> actually complete enough to run. I have about 90% of the solution to make
> it run (and add ptest to prove it runs), but sadly this is a free-time
> activity and ELC and other things are pre-empting that right now.
>
> On Fri, Mar 2, 2018 at 9:17 AM, Maxime Roussin-B=C3=A9langer <
> maxime.roussinbelanger@gmail.com> wrote:
>
>> It should read
>>
>> "
>> python
>> import matplotlib.pyplot as plt
>> "
>>
>> instead of
>>
>> "
>> python
>> import matplotlib.plot as plt
>> "
>>
>> On Fri, Mar 2, 2018 at 12:03 PM Maxime Roussin-Belanger <
>> maxime.roussinbelanger@gmail.com> wrote:
>>
>> > When I run matplotlib in a genericx86-64 image it's missing the
>> dependency,
>> > python-cycler.
>> >
>> > I patch that dependency, and then run it again with
>> >
>> > "
>> > python
>> > import matplotlib.plot as plt
>> > "
>> >
>> > Now I get another missing dependency "Cannot import name '_path'"
>> >
>> > I've tried to make it work, but alas. Have any other developers
>> encountered
>> > this problem?
>> >
>> > Is it a problem with the recipe itself?
>> >
>> > Thanks,
>> > Max
>> >
>> > --
>> Max
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

