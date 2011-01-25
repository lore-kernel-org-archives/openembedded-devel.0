Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PhksS-0003dg-GK
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 16:32:16 +0100
Received: by iyj18 with SMTP id 18so5776894iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 07:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=BEFKaoeO+en7YcSqMfBNMHpK7BNCcvIGxFL5bBLwkB4=;
	b=EK9rsDA31pxHnJWep91bmorkYsKyLSNdmwVhjvdLJkJtZ+8nmPw8wuidSFOLwQnQe3
	UNi/A4IsIAeBYxrtRt/l5gAB245/1X2t+zXXb0yMssiggkzgg+T1yDweg7z41JORbCgI
	jy41Xs0q+gVAYRQW2IJX3qewd4Wa3sk4orxFA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Tv6gC0GNiv/uuN65/VAFb5w1Io3Rqz0MtZaYam+rmfFS4kanMPDmkZh30Wv70IX3YT
	wIXFJXpzFKYoJz+PZYJd+RrO1pyZbW3Iz5ceyW6kUgOc7Q3M41no0bfuMn9nULjjxzOO
	9eOvLAPke5tmRRFG65mNUSUWzICBViUlHUKgo=
MIME-Version: 1.0
Received: by 10.231.166.205 with SMTP id n13mr6741964iby.58.1295969488700;
	Tue, 25 Jan 2011 07:31:28 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Tue, 25 Jan 2011 07:31:28 -0800 (PST)
In-Reply-To: <ihmnv8$n3g$1@dough.gmane.org>
References: <1295464913-2642-1-git-send-email-koen@openembedded.org>
	<4D373CFC.8010400@balister.org> <ihmjum$vdq$2@dough.gmane.org>
	<AANLkTinHGa136tXLwyBO2L=TUOQP+kW2WQTLyjBEU0Zx@mail.gmail.com>
	<ihmnv8$n3g$1@dough.gmane.org>
Date: Tue, 25 Jan 2011 16:31:28 +0100
Message-ID: <AANLkTi=oWKGfOnYm5aLZArLCxFjwGz3BJh8e=9Ts8KFf@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Jan 2011 15:32:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/25 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 25-01-11 15:40, Frans Meulenbroeks wrote:
>> 2011/1/25 Koen Kooi <k.kooi@student.utwente.nl>:
>> On 20-01-11 08:10, Koen Kooi wrote:
>>>>> On 19-01-11 20:35, Philip Balister wrote:
>>>>>> On 01/19/2011 11:21 AM, Koen Kooi wrote:
>>>>>>> * Having rpath to sysroot is just as bad as one to workdir
>>>>>
>>>>>> When you do a build with this, how many recipes have issues?
>>>>>
>>>>> Console-image is clean now :)
>>
>> And angstrom-gnome-image as well, so can I get some Acks or tested-bys
>> please?
>>
>>> NAK, I feel other distro's like shr and minimal should be given some
>>> time to test this too.
>
> Martin has already Acked it, fwiw tr

Yeah, saw it. Came in at my site just after I pressed send, but
timewise it seems to be 2 minutes earlier.
I'll try to kick off a minimal build this evening (can't do that from
here) and report the results (that'll probably be tomorrow because the
build takes some time). Note that I am not an official minimal
maintainer though, so I cannot ack on behalf of minimal, I can only
give a tested-by

Not sure if other distro's need to have a say too. The only other ones
that seem to have activity are kaeilos (which follows angstrom fairly
closely) and slugos.

Frans
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNPuMoMkyGM64RGpERAqb6AJ4kMGJ1alDw/I5JZQ4ktQ8R6tT3+wCfQgDJ
> DW0T7/k96XHQKeqGGS+5WXQ=
> =QlxQ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


