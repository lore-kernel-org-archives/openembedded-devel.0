Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PAI49-0001XB-Ni
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 10:06:17 +0200
Received: by qwd6 with SMTP id 6so1142408qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 01:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=9hMvpHj7zR1YtcAwNfIZcXysOppDcvrR0sZLQdmucU8=;
	b=V3vdTre5sjmxP6ThOVS8OLS/JNHUQv3JlDuLMDxQHkfQ4pJRWd7nwwNobknkXM/pWz
	C/f1AAAFC8pSBvMyR46GLgK/TcVJBttwY2RTGpvVPN1as6EmQFya2VUF2aCwsyZmS+DD
	TmqHXrEqnk7DX/4pPiq6tBTAQIprQacc7/kw8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RkGHcTqrhOgdKktVzAUUw3IrHS6Fvk8d5JNM/fsRvIpmpd7nYJBkdG/4K1j7PyWUK2
	2eE4TOjmLH8W31I8/YKk/ddp+qKJkvvNqRTfENCry6LlWqIFPiJjdiwrfP6q1py0C/76
	BG+s9A8Q0LjppFaRv6GfC8Buo9z3VNE1GKpKU=
MIME-Version: 1.0
Received: by 10.229.183.20 with SMTP id ce20mr5895299qcb.203.1287993919480;
	Mon, 25 Oct 2010 01:05:19 -0700 (PDT)
Received: by 10.229.18.197 with HTTP; Mon, 25 Oct 2010 01:05:19 -0700 (PDT)
In-Reply-To: <AANLkTim1GALcyTjqpHAmy1L=8SqomVLqrKr7dYOwFhc4@mail.gmail.com>
References: <AANLkTim1GALcyTjqpHAmy1L=8SqomVLqrKr7dYOwFhc4@mail.gmail.com>
Date: Mon, 25 Oct 2010 10:05:19 +0200
Message-ID: <AANLkTikDAdLBYfZpkfKpBCU7JOEx+i9g=yJjzwoeeM+v@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Revert + apologies (was: Re: [oe-commits] Frans Meulenbroeks : lsof/lsof_4.83.bb: removed unneeded EXTRA_OEMAKE)
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
X-List-Received-Date: Mon, 25 Oct 2010 08:06:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Frans,

nerverthless some recipes of the group *did* build flawlessy after
removing the EXTRA_OEMAKE.

ifupdown/ifupdown_0.6.10.bb
ifupdown/ifupdown-ubuntu_0.6.8.bb
man-pages/man-pages_3.21.bb

I tested only a few...probably others too.

It looks to me this was a quick hack to make broken recipes build...

Anyway, thank again for your work. Keep on!

Andrea

On Mon, Oct 25, 2010 at 8:45 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/10/25 Andrea Adami <andrea.adami@gmail.com>:
>> build breaks on do_compile after that commit
>>
>> Needs investigation
>>
>> Andrea
>
> Oops.
> Apparently this was not well enough tested. My sincere apologies!
> I've reverted all the patches that removed EXTRA_OEMAKE = "".
>
> What happened was that I was being told on irc that comparing the
> output from bitbake -e before and after making the change was
> sufficient.
> I've tested one recipe more in-depth and that worked fine, then
> further relied upon comparing the bitbake -e results.
> This proved to be a sound method when dealing with EXTRA_OECONF.
> Apparently however it was not good enough for EXTRA_OEMAKE and some if
> not most recipes are not in my regular build (definitely the older
> versions are not).
>
> I'll try to peek into this later. Anyway, again my apologies for any
> inconvenience caused and thanks to Andrea for reporting this!
>
> Best regards, Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


