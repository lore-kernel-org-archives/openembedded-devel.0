Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NMmIm-0005p0-2P
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 18:44:15 +0100
Received: by iwn32 with SMTP id 32so3353318iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 09:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=jh7PwV/Ny+SUEWtqzpUG7HsI1KYovSWoeFbAQB7J8Jo=;
	b=kVFMwYw6XFcrwZvbk5Mu+od3xULlrmc4b/xvCYHW8/w9sE1Yz9f3NF/WJ6W1vHJ8qC
	NyfAZlZFdn495GQ+Jo7VCGfpRu4RLGeEPxI6adhksahArMMkUTdiDJ5lilqDSUBDgSzO
	6WL8h2tSGzUFeOhscqGSJc8q/6keeneB+4NLM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=R+1WFJ+HhBqNd4sN+eB/NhnNXxpZBVQeaD2RfX2kZBO6q6oWqLBfJFxi3NZ+Vi74T5
	WD2HUnal+pqpeBmMloNkW6Gd8DZMpcC6Vbbf52ysjdPXXyATIWgNN162cwTDd/nH+oXK
	x1Cl8FiQOrtTQHtIi4ss98nFQwx0o2hEOjeOQ=
MIME-Version: 1.0
Received: by 10.231.143.12 with SMTP id s12mr4267844ibu.38.1261417340081; Mon, 
	21 Dec 2009 09:42:20 -0800 (PST)
In-Reply-To: <hgndpv$i9t$1@ger.gmane.org>
References: <1261080453-12752-1-git-send-email-raj.khem@gmail.com>
	<1261081378.6896.472.camel@lenovo.internal.reciva.com>
	<hglsfj$2vi$1@ger.gmane.org>
	<19c1b8a90912201813i54c9e5d9r6e1545a3a9106f74@mail.gmail.com>
	<hgndpv$i9t$1@ger.gmane.org>
Date: Mon, 21 Dec 2009 09:42:20 -0800
Message-ID: <19c1b8a90912210942l31f117d4k8a16800bfff79d49@mail.gmail.com>
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
X-List-Received-Date: Mon, 21 Dec 2009 17:44:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 21, 2009 at 1:06 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 21-12-09 03:13, Khem Raj wrote:
>> On Sun, Dec 20, 2009 at 11:04 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>>> On Thu, 2009-12-17 at 12:07 -0800, Khem Raj wrote:
>>>>>
>>>>> * This is not supporting multilib
>>>>> * Only 64-bit userspace can be built.
>>>>>
>>>>> --- /dev/null
>>>>> +++ b/conf/machine/include/tune-x86_64.inc
>>>>> @@ -0,0 +1,4 @@
>>>>> +TARGET_CC_ARCH = "-mtune=generic"
>>>>> +BASE_PACKAGE_ARCH = "x86_64"
>>>>> +FEED_ARCH = "x86_64"
>>>>> +PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586 i686"
>>>
>>> NAK! Don't use underscores in machine names since it's what bitbake is using
>>> to mark overrides. I fell into that trap twice already :(
>>>
>>> Also, please explain to me what you plan to do with 'FEED_ARCH'.
>>
>> I was thinking of using amd64 but ARCH has to be
>> x86_64 at least for gcc so I think we can not avoid
>> it. may be we should make bitbake ignore certain
>> overrides like x86_64 if thats possible at all.
>
> We re-write arch already for kernel recipes, so why can't we do the same
> for gcc?

Good point. If gcc was the only one then yes it was relatively ok. But
here we are talking about gcc and some other packages which
have x86_64 for target architecture in their configure scripts. I
thought of writing a class for target arch mapping but the recipes
which
depend upon TARGET_ARCH in some way will need to be taken care of. If
this approach sounds reasonable I can try a bit more on amd64

Thanks
-Khem

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLLzqAMkyGM64RGpERAtuHAJ9YxU54qCR7lAiUbjkxRqBi7ISycACeOkMG
> yrR9wiUNLhHC4im/yz7j92s=
> =Lk4J
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


