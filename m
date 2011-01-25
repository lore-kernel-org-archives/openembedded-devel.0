Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PhrHT-0005O5-Vm
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 23:22:32 +0100
Received: by iwn8 with SMTP id 8so303815iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 14:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=q8Exydwwjw6Z8u68wOcKBxnkurC04KZwDqSfSUErcbU=;
	b=XCXw+sgX1gSkQXL3orXqELIesx0utqdidT/4rgGTkgEiFnj04CSJq/4nR1jaFJOgFv
	aigfbghWx4a7Nc7ODTTld31Bf7gTuVirC9hNY0qonGsdHLRxm7aY19EGent1ZB1VyuHJ
	jUlIOtNpHxPDiRilgrSwdZ+dkNnNXHqFcxt78=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GBJDL4KvBJS4uwxEaX+uSEyDjs+d8XDGm24B8jzYkwgQm8IC6Hr+mqLidvDj2m/JQN
	Mv/BJnVjkzAjTZwWHMZFcF2c+5rQJ4ZOvxfnLzvIvncRvqaXxcHNRsFV5pyLIlRJcyi6
	TnOY5UJ7O0C9cict1mRP6MmEDGgkY/EwByYX8=
MIME-Version: 1.0
Received: by 10.231.207.66 with SMTP id fx2mr7309545ibb.108.1295994106350;
	Tue, 25 Jan 2011 14:21:46 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Tue, 25 Jan 2011 14:21:46 -0800 (PST)
In-Reply-To: <AANLkTi=oWKGfOnYm5aLZArLCxFjwGz3BJh8e=9Ts8KFf@mail.gmail.com>
References: <1295464913-2642-1-git-send-email-koen@openembedded.org>
	<4D373CFC.8010400@balister.org> <ihmjum$vdq$2@dough.gmane.org>
	<AANLkTinHGa136tXLwyBO2L=TUOQP+kW2WQTLyjBEU0Zx@mail.gmail.com>
	<ihmnv8$n3g$1@dough.gmane.org>
	<AANLkTi=oWKGfOnYm5aLZArLCxFjwGz3BJh8e=9Ts8KFf@mail.gmail.com>
Date: Tue, 25 Jan 2011 23:21:46 +0100
Message-ID: <AANLkTimeD2Z5HLFnMbsEo2ei-Gh=9-jp5O0bntnS4yfM@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] insane bbclass: extend RPATH check to cover sysroots as well
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
X-List-Received-Date: Tue, 25 Jan 2011 22:22:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/25 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2011/1/25 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 25-01-11 15:40, Frans Meulenbroeks wrote:
>>> 2011/1/25 Koen Kooi <k.kooi@student.utwente.nl>:
>>> On 20-01-11 08:10, Koen Kooi wrote:
>>>>>> On 19-01-11 20:35, Philip Balister wrote:
>>>>>>> On 01/19/2011 11:21 AM, Koen Kooi wrote:
>>>>>>>> * Having rpath to sysroot is just as bad as one to workdir
>>>>>>
>>>>>>> When you do a build with this, how many recipes have issues?
>>>>>>
>>>>>> Console-image is clean now :)
>>>
>>> And angstrom-gnome-image as well, so can I get some Acks or tested-bys
>>> please?
>>>
>>>> NAK, I feel other distro's like shr and minimal should be given some
>>>> time to test this too.
>>
>> Martin has already Acked it, fwiw tr
>
> Yeah, saw it. Came in at my site just after I pressed send, but
> timewise it seems to be 2 minutes earlier.
> I'll try to kick off a minimal build this evening (can't do that from
> here) and report the results (that'll probably be tomorrow because the
> build takes some time). Note that I am not an official minimal
> maintainer though, so I cannot ack on behalf of minimal, I can only
> give a tested-by
>
> Not sure if other distro's need to have a say too. The only other ones
> that seem to have activity are kaeilos (which follows angstrom fairly
> closely) and slugos.
>
> Frans

Wrt the test: bumped into a few issues with tzcode/tzdata geing out of
date and the git pull needed to push the patches (so I could use them
on the autobuilder) triggered a rebuild of gcc, so didn't get to
starting the test yet.
Will retry tomorrow. Frans.


