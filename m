Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8tqG-00041s-4z
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 14:01:57 +0200
Received: by iwn35 with SMTP id 35so2157139iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 05:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=+NrelgxsX5PlmpDDnacbGWu0jjWz1NCixH7/6uvrhhU=;
	b=soF8aJcfIM7smeKaNwyf2deQx042uVVtpMDrZ49xzaEEbFqOdz/n+oXYFkLFn2qK6P
	ROjkj9PrjQsN3C5XmhvhuWQmwdB6IICixKtU6vnMTi6oDKVtJ3/gyetK8CbuR900gesS
	Me2j/9l3mX275meze1Phc0cysxDjg4CkdsCCw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=OHAB77GSiVbokl5r5P5KikzcefWfuciJFIVYHUjKL+TqcuaDfCXHoin1yEtvAYtdDV
	2e0+D6lzm+2QDSJOBRcw6wLGhoi0P3xj8qwEBvK1TDAvOLMcXVcu2d8IHE8d6lDE1WPm
	kvdj4tY0bw47JMAnqJUtzg0Oy6TPOtriNE4vE=
MIME-Version: 1.0
Received: by 10.231.176.73 with SMTP id bd9mr804086ibb.134.1287662477635; Thu,
	21 Oct 2010 05:01:17 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 21 Oct 2010 05:01:17 -0700 (PDT)
In-Reply-To: <1287657524.16386.437.camel@rex>
References: <i9p1d0$7q4$1@dough.gmane.org> <4CC00D57.4070601@xora.org.uk>
	<i9p2uf$f40$1@dough.gmane.org> <4CC0104B.4070108@xora.org.uk>
	<AANLkTi=74mwvxLLwCjEhV3OMCyOdpfRZeU0Z-bf6TM+P@mail.gmail.com>
	<1287657524.16386.437.camel@rex>
Date: Thu, 21 Oct 2010 14:01:17 +0200
Message-ID: <AANLkTimn0RDABjQbJcO3dWHpWPWD6giY1taSVixn0MHp@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 12:01:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/21 Richard Purdie <rpurdie@rpsys.net>:
> On Thu, 2010-10-21 at 12:20 +0200, Frans Meulenbroeks wrote:
>> 2010/10/21 Graeme Gregory <dp@xora.org.uk>:
>>
>> >>
>> > Such a pity git doesnt have increasing rev numbers, a cool adition would
>> > be a flag in layer that showed the last rev of core it was tested with.
>> >
>> > Layer was tested with core 1 but core is now 999 would give an
>> > indication on drift between layers and core.
>> >
>> > Graeme
>>
>> Triggered by this (and apologies if I am drifting off-topic).
>> It would be nice if with amend.inc you could specify the PR of the
>> underlying recipe that this amend is for (and get a warning or error
>> if there is a mismatch)
>
> For reference poky now has the PRINC = "x" variable which increases the
> base PR by x, assuming a standard format PR value. This is intended for
> use in .bbappend files.
>
> Cheers,
>
> Richard
>

Maybe I was not clear enough on this, but my proposal would be that
you could say in your amend file something like
BASEPR_CHECK("r12")
or something like that (I did not really think about what the best
syntax would be).

If you were building and the base recipe did not have the PR you
specified you'd get a warning (or maybe even an error) so you would
know that something changed under water.

Best regards, Frans


