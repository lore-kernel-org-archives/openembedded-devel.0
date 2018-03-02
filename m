Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id B89AC789AF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 18:16:18 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id p189so6237564vkd.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 10:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ThT37nUTNFT8Bnq7UBeXFBp5OdqDJbSu0+WB4USYSBA=;
	b=p5ShXAGvGaCRG/DnV+hlfFZkctv2SyAkCMbPehfkG8++VIRaocRspdtST4iPX79GCk
	KjUT1Zqd0tuAibI/+Kh99eXJuSFbmAS9Ev7qnia+ga+cIUIE4A3m0Hsi4/mC6Q1qVJ+t
	jHxUVvguL9PKM9OjXKsMKzRECkZImQHL7Ge2Xwxb3wP8NaSJPrtQ95k1I7+h+MjS1wDy
	Nzmeu+JFiwuPtW7CkLmPY6r8qG1N4lHvX0X8/9xvuFvnKOnixR91HXhkOyBLQ85hjbSt
	Wu+7g3IPDIAure1xj3STdXd7u2rs5QLylgQUfmDZlgERm/jC3FQcZ6yLZpy59P4QrHuu
	N1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ThT37nUTNFT8Bnq7UBeXFBp5OdqDJbSu0+WB4USYSBA=;
	b=F0co1YdtKtPbputcqFk2T1nY9Etf4suWjLZHVGkJwo+dXZgn8C6maV/dTsIOIEz/Zz
	2UXmbgnpAcIuz8EFlcGmu40ZeEHayuunmxAZlQs95d3XXPOqppiObe761ayyfV2XQeRK
	Isuh/QeLcAK5u8XYrhh5uW38S06kLb0LV1DIlvJ+OMIrGvpg4JCG+DyHOhImIgRAtZnA
	GIgQ2DBvc23rEZj0yY24XpWFK1WzE3Ee8aJgQHuEOf7o+tV+hlM6BZXLLHZDaXxyhpt4
	DN3wryJGTKOb8xfQZadcWulwDdwkHdDMsq+exxEIZ/Xgwox6C72ovrPX16So9VQ65+51
	wauQ==
X-Gm-Message-State: AElRT7GWQTkox8unOfWIF3cFXzJ/+Jii0m4xnnBjlt8UxAtwYOMsunJv
	b+lbdRmjGgInaN+LNYhOyZiZ1/T1t6Il7siZxZ8=
X-Google-Smtp-Source: AG47ELucCCQIj8RMFqgvuRBRje8HBHqKpgwlD71hGlyNW0J6bs/9mJ+9gnBp/itHPqgwaNVBnhs/DEhZCT9wF0+iyKk=
X-Received: by 10.31.176.130 with SMTP id z124mr4354625vke.88.1520014579481;
	Fri, 02 Mar 2018 10:16:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.52.207 with HTTP; Fri, 2 Mar 2018 10:16:19 -0800 (PST)
In-Reply-To: <CAE=T-s72xDp1uwWSeB3si3Nyq3r=SYhoEgJHscyOkmCqsv6cjg@mail.gmail.com>
References: <20180302170307.jmf5hyru6lwv6kjq@mbedesk.sonatest.net>
	<CAE=T-s72xDp1uwWSeB3si3Nyq3r=SYhoEgJHscyOkmCqsv6cjg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 2 Mar 2018 10:16:19 -0800
Message-ID: <CANx9H-CgyZi-FDu5vhqTMr01TSM1JXcrimWiEWRZNPKE-L0MDg@mail.gmail.com>
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
X-List-Received-Date: Fri, 02 Mar 2018 18:16:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, this is a known issue. I don't know that python-matplotlib was ever
actually complete enough to run. I have about 90% of the solution to make
it run (and add ptest to prove it runs), but sadly this is a free-time
activity and ELC and other things are pre-empting that right now.

On Fri, Mar 2, 2018 at 9:17 AM, Maxime Roussin-B=C3=A9langer <
maxime.roussinbelanger@gmail.com> wrote:

> It should read
>
> "
> python
> import matplotlib.pyplot as plt
> "
>
> instead of
>
> "
> python
> import matplotlib.plot as plt
> "
>
> On Fri, Mar 2, 2018 at 12:03 PM Maxime Roussin-Belanger <
> maxime.roussinbelanger@gmail.com> wrote:
>
> > When I run matplotlib in a genericx86-64 image it's missing the
> dependency,
> > python-cycler.
> >
> > I patch that dependency, and then run it again with
> >
> > "
> > python
> > import matplotlib.plot as plt
> > "
> >
> > Now I get another missing dependency "Cannot import name '_path'"
> >
> > I've tried to make it work, but alas. Have any other developers
> encountered
> > this problem?
> >
> > Is it a problem with the recipe itself?
> >
> > Thanks,
> > Max
> >
> > --
> Max
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

