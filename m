Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NMXo1-00071v-Tt
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 03:15:33 +0100
Received: by iwn32 with SMTP id 32so2925635iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2009 18:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=jxXIZWWI09iNlFAqNYnfYCK9EA7zZ/z8PciAr9zCej0=;
	b=eriJGa2X4o6IHMR8psC2XThRMoZFTXJDByBMpSBzRcp4PD+StmYfj6c3evUONDPNa+
	bkPBbAizR3qS0ZPV/tvPKPLuedgPH0fkyasE0CAChY74nhD/aeX+hLmajFIPCzNjWQjV
	4ISdOTvvmJpVNsB6PE5SBvDhQJMN7LaX3tFRs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EweHvdHKeRUn2SUfrWg8/sRjVqkC4EYqRDr7C5owEhDQz++qHYxEQ+9/gFr58BqOYR
	46mRBJ2KBEJvPlnIDVzO5lFG8WiSf8OOrJAmTEMY3xqQ/za1I3/xiPe3IEXTbA29LQKi
	VVM1sZRlGSdRSjoXKpB1spguAcuJ4EkirfjgY=
MIME-Version: 1.0
Received: by 10.231.157.83 with SMTP id a19mr88068ibx.41.1261361618655; Sun, 
	20 Dec 2009 18:13:38 -0800 (PST)
In-Reply-To: <hglsfj$2vi$1@ger.gmane.org>
References: <1261080453-12752-1-git-send-email-raj.khem@gmail.com>
	<1261081378.6896.472.camel@lenovo.internal.reciva.com>
	<hglsfj$2vi$1@ger.gmane.org>
Date: Sun, 20 Dec 2009 18:13:38 -0800
Message-ID: <19c1b8a90912201813i54c9e5d9r6e1545a3a9106f74@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] conf/machine: Add x86_64 machine.
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
X-List-Received-Date: Mon, 21 Dec 2009 02:15:33 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 20, 2009 at 11:04 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> On Thu, 2009-12-17 at 12:07 -0800, Khem Raj wrote:
>>>
>>> * This is not supporting multilib
>>> * Only 64-bit userspace can be built.
>>>
>>> --- /dev/null
>>> +++ b/conf/machine/include/tune-x86_64.inc
>>> @@ -0,0 +1,4 @@
>>> +TARGET_CC_ARCH = "-mtune=generic"
>>> +BASE_PACKAGE_ARCH = "x86_64"
>>> +FEED_ARCH = "x86_64"
>>> +PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586 i686"
>
> NAK! Don't use underscores in machine names since it's what bitbake is using
> to mark overrides. I fell into that trap twice already :(
>
> Also, please explain to me what you plan to do with 'FEED_ARCH'.

I was thinking of using amd64 but ARCH has to be
x86_64 at least for gcc so I think we can not avoid
it. may be we should make bitbake ignore certain
overrides like x86_64 if thats possible at all.

>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


