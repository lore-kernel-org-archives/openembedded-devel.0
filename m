Received: from mail-ey0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chris.spehn@gmail.com>) id 1PRECw-0003Cs-7D
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 02:25:06 +0100
Received: by eyf5 with SMTP id 5so2600327eyf.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Dec 2010 17:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=K+O4dXVwDXP51n14Iri7W7L8R7Ip1wxXnwxD1BPlaBA=;
	b=HRn8rtUCOINYSPXT2RafmEWDnXpo1G9bBf9yNzrYL7X+i32VfVrNBaSCyPMkOuW54h
	6JG6821kf2+1IBmz2yD6xK6PuPmJdOTt1Z047xV3Y8FHNSZNrVXppQnLy47fi2MQcK71
	2h5h6PeMqBvgf/beV9rv5lav/knBN2Nu0+M6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=uDIrMb8pjTDBh9cjYPz9jeRg2jzw3By4KcZ5UPpXiQ2PcgodSakLeKOQDOX8qlnO1T
	95NFEvbZ3mN2b8OCXfV0lghJEUaXq347X9s7254XiJQeVkymMmXhHfh1CVYaDq+NqKpI
	FHUk+6ICOu/GTtm881i+b5SjknNLy7H3Abcpk=
MIME-Version: 1.0
Received: by 10.213.29.131 with SMTP id q3mr1660460ebc.89.1292030615356; Fri,
	10 Dec 2010 17:23:35 -0800 (PST)
Received: by 10.213.22.16 with HTTP; Fri, 10 Dec 2010 17:23:35 -0800 (PST)
In-Reply-To: <20101210173607.GC31742@excalibur.local>
References: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
	<1291732373-17953-4-git-send-email-GNUtoo@no-log.org>
	<20101209143500.GD29826@excalibur.local>
	<AANLkTi=XyUfKKrFLrgwb3GAcNH6gqTRXA3OCSb-hoRKm@mail.gmail.com>
	<20101210173607.GC31742@excalibur.local>
Date: Fri, 10 Dec 2010 19:23:35 -0600
Message-ID: <AANLkTimxQuA44LT6=1MkZWfmE9S1SWEEi+eLiZyRBRNY@mail.gmail.com>
From: Chris Spehn <chris.spehn@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.170
X-SA-Exim-Mail-From: chris.spehn@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] xserver-xorg-conf: add iphone3g support
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
X-List-Received-Date: Sat, 11 Dec 2010 01:25:06 -0000
Content-Type: text/plain; charset=UTF-8

When I was using Ubuntu and other distributions, the touch screen was
always located under /dev/input/event1. For some reason, SHR places it
under /dev/input/event2. I can't tell you why either because I have no
idea. I can tell you that every time I have booted SHR the touchscreen
has been located under event2.

On Fri, Dec 10, 2010 at 11:36 AM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> Hello.
>
> On Thu, 2010-12-09 at 13:05, Chris Spehn wrote:
>> I think Jama mentioned this to me on irc in #openmoko-cdevel, but I
>> simply forgot about it. I can make a pointercal file instead of using
>> the xorg.conf option.
>
> The hardcoded input device worries me a bit more then the ts calibration. :)
>
> The other three pathces are fine to go in via GNUtoo. And if you can tell my why
> it always will be the same device this one is fine, too. :)
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


