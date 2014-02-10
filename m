Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id DF7616E753
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 13:16:42 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id j5so9509167qaq.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 05:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=L9HBNBFTysurZZC3r9TaAFZBPCaFRQY3HOSsP9gwuHY=;
	b=SbAo91LYKXrHb7/jzJevdO+iTRoygaRb+aXJiNSsCcaiAOi/BA/6WEMEa7NefB+5Kn
	0Zi/z2w1tJTZyPh+xpp7RcqdbkZEeCgJcOY9GpT31NEiaBLAIf+BXlzdj0estmRsJwBj
	z8o8w+jVTNoMGCFgj3XUWlVJj7TkUwwLyq9DtRxNFDRfDl3yjWSZafQA8cyRu8SFD451
	GqF9cIkWGb/esQikXm3TPKJZdFu4QHpmw5keeoe0gJbI+JVc3eByk0Z/+Uw7/FlFfwZU
	r1/X1+MDxMVDvKlteKeUWIquOjIpv6ABEs4q3NqGA7rh3TuwTZBCbgqw+s0LPgct8vFu
	sQWg==
X-Received: by 10.140.35.211 with SMTP id n77mr13525440qgn.82.1392038203242;
	Mon, 10 Feb 2014 05:16:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Mon, 10 Feb 2014 05:16:22 -0800 (PST)
In-Reply-To: <CAMCfZKFW8mb1d=Q2eJ9mRx8xprbN2dHUQJwZvG-UkUF5Q6TRXw@mail.gmail.com>
References: <CAMCfZKFW8mb1d=Q2eJ9mRx8xprbN2dHUQJwZvG-UkUF5Q6TRXw@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 10 Feb 2014 11:16:22 -0200
Message-ID: <CAMCfZKFNHREoyX9L2xbwYAoxrcUq1R8-=74u2V1Aiw45QmkC6g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: xbmc build failing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Feb 2014 13:16:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Folks,

To workaround the screensaver compilation error I've added "--disable-rsxs"
on EXTRA_OECONF.

Looking at "xbmc/screensavers/rsxs-0.9/configure" It's possible to pass
"--disable-euphoria" option to configure.
How can I accomplish this from xbm_git.bb recipe?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/


On Sun, Feb 9, 2014 at 8:28 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:

> Folks,
>
> I'm trying to get xbcm built for beaglebone black (dora branch), but it's
> failing.
>
> I'm having the same issue as this e-mail sent 2 months ago:
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2013-November/093304.html
>
>  Searching on internet I couldn't find any fix.
>
>
> Regards,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br
>
> /*long live rock 'n roll*/
>

