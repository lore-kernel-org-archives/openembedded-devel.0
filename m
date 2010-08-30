Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oq9XF-0001tB-Mk
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 20:57:04 +0200
Received: by iwn2 with SMTP id 2so4968424iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 11:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=gFPxRvEt73woRJpAl4ReHhqxJaL+kCGXdG7fDNkTV3s=;
	b=fLe9EAjmQM5EwjN5A+O52D2KzugElP89Hi07ApkywQmx8S2DvAsKo2qYjsVuZ/FHJ1
	cRk5h0sUEu4v1UzOj5D/qGtg4E81/eSVqsFC3/JOjkrrwWJyQvI9X4ojvwVE6WFjLyim
	5Mg6N/3jwOY4+TPnHhBsbjbe7ihmkTWiki+ps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Iw/pB8T/tSjI3bLQ1xHbQROB7M88csm30EpboDpQ9wEyMD9O/6BEEus7HDzXwdCCWS
	8NvcGSt/OCTIfIGQCcHtM5AS53Q34BzyEYVrt4EwiYVmbbxM/o5ekUZIHl2Ki9gOT2BZ
	JjGowziO2tNcxThnSv+jxKaGb15lWK2JG1IPw=
MIME-Version: 1.0
Received: by 10.231.148.83 with SMTP id o19mr5852607ibv.112.1283194574193;
	Mon, 30 Aug 2010 11:56:14 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 30 Aug 2010 11:56:14 -0700 (PDT)
In-Reply-To: <4C7BFB14.2010009@balister.org>
References: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>
	<4C7BF64A.6080408@balister.org>
	<AANLkTikfDN6d8X+OgR0AYRyPM78GXwN_RqFAxp48e9d0@mail.gmail.com>
	<4C7BFB14.2010009@balister.org>
Date: Mon, 30 Aug 2010 20:56:14 +0200
Message-ID: <AANLkTinsotKZ9dtqgOMx_9T0x=1833GvpjpPzutYq+FS@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-omap-psp-2.6.32 breaks iscsi-target
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
X-List-Received-Date: Mon, 30 Aug 2010 18:57:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/30 Philip Balister <philip@balister.org>:
> On 08/30/2010 02:35 PM, Frans Meulenbroeks wrote:
>>
>> 2010/8/30 Philip Balister<philip@balister.org>:
>>>
>>> On 08/30/2010 01:47 PM, Frans Meulenbroeks wrote:
>>>>
>>>> The current beagleboard angstrom and minimal distro's (and maybe
>>>> others) use the linux-omap-psp_2.6.32.bb recipe to build the kernel.
>>>
>>> What is iscsi and why would I need it on the Beagleboard?
>>
>> http://stgt.sourceforge.net/
>>
>> the pacakge is from
>> http://iscsitarget.sourceforge.net/
>> It is used by tgt (http://stgt.sourceforge.net/)
>>
>> with it you can e.g. mount an iscsi disk.
>> iscsi is for instance also supported by windows 7 and by various NAS-es.
>> Its throughput is better than Samba or NFS.
>>
>> So for beagle it could act as mechanism to e.g. retrieve content from a
>> NAS.
>
> So the trade off is a kernel that has the best chance of fully supporting
> the OMAP3 peripherals, or attaching to a NAS that is windows centric.

If you had taken the time to read the links I gave you would know it
is absolutely not windows centric. Far from that.
And I am not saying we should change the kernel. Probably the best
solution is to have a patch that undoes the effects from the .33 patch
that crept into the kernel.
Another option could be to give the kernel a different version number.
It is not a real .32 kernel, but probably making it .33 rc1 is not a
good choice either.

Btw I have no idea what other packages are broken due to this.
>
> The point I am trying to make is we can't expect all packages to build for
> every MACHINE/DISTRO combination. People have to make tradeoffs.
>
Yes, and if fixes are possible then why not repair things.
I think being able to access an iscsi nas could be beneficial.
(e.g. when using the beagle as a mythtv frontend)

Frans


