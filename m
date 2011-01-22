Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PgcJ2-0005Ml-V9
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 13:11:01 +0100
Received: by iwn8 with SMTP id 8so2838583iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 04:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=6FI0bqJVfU+FX4EifMnsku6x//x5oOiRAJax18Gs+h8=;
	b=Ss6MRN0Gug+NOoptNIfieRpUjD5MvIGXZKknWgmxGx4zYLIvkVBUbtiiPTnI9A7M7u
	s+4AqHH96pww6pNqY6le/CC/j1XpB/kNWMeJXJX6VpqXAXlVwWPanpw2u/VqkMzoSj4j
	5fjePqNDcpk1u4s+7+nrszoc1evBRR4Up22pI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=eqYPcDqzf856qDfFFp4czSzM31Qija7KGGWwGBbd89nZ1IJQ8f8sI8mkkDr7p9blmn
	PQIZRRC3GS47dN64mh7K9aB4pCR7IMfL3jBtnY+xCI6w9GjLEGsrqlH51707IHW+Fyth
	I0Ae6vCcbYfxpQdQtgzr/MiOXE/y0ohBS05RU=
MIME-Version: 1.0
Received: by 10.231.11.2 with SMTP id r2mr2099877ibr.174.1295698219557; Sat,
	22 Jan 2011 04:10:19 -0800 (PST)
Received: by 10.231.34.69 with HTTP; Sat, 22 Jan 2011 04:10:19 -0800 (PST)
In-Reply-To: <AANLkTins2-KeY8aUkoKHW+H3t0xzNeW+H2a5qfwVTY0U@mail.gmail.com>
References: <20110120181233.GA1789@lit.local.igalia.com>
	<ihbp5c$4ov$1@dough.gmane.org>
	<AANLkTimBieqoDRmVfoYmTVpehrmtCk-N=M8bKgRWumN0@mail.gmail.com>
	<4D39988B.5020204@balister.org>
	<AANLkTins2-KeY8aUkoKHW+H3t0xzNeW+H2a5qfwVTY0U@mail.gmail.com>
Date: Sat, 22 Jan 2011 13:10:19 +0100
Message-ID: <AANLkTi=X7Ri1-z7ghn2YwVBzvDQRT=1EW=iiWf3rgz8_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: problems compiling glibc_2.9-r37.4 under Angstrom
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
X-List-Received-Date: Sat, 22 Jan 2011 12:11:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

[taken the board off cc as this has nothing to do with my original
request to the board]

2011/1/22 Khem Raj <raj.khem@gmail.com>:
> On Fri, Jan 21, 2011 at 6:30 AM, Philip Balister <philip@balister.org> wrote:
>> I think these remarks come from discussion over the pandaboard u-boot
>> situation? If so, let's consider these options:
>>
>> 1) Remove the pandaboard machine from OE since it does not build for some
>> people.
>>
>
> well its a step backwards
>
>> 2) Force Koen to update the recipe to something that builds.
>>
>
> he is master of his own time so its not right to force anybody its all
> volunteer work and we should leverage each others work.
>
>> 3) Do nothing.
>
> Doesnt take us anywhere.
>
>>
>> No one is happy with the set of options, but the reality is some distros use
>> source mirrors and do not have issues. Distros that do not use source
>> mirrors are going to have problems with this and other recipes, so the onus
>> is on them to resolve these issues. Resolving this is issue does not revolve
>> around updating the recipe and pushing it un tested for the Panda, since
>> this is not something that can be tested on another set of hardware.
>>
>> So until someone who has a panda and the time and patience to work with
>> u-boot, minimal will not work for panda. This is because the minimal distro
>> is supposed to not use advanced OE features such as source mirrors and
>> PREFERRED_VERSION pinning. Because of these decisions, it is entirely
>> possible that minimal will not build for all combination by design.
>>
>
> I would propose that we use angstrom-mirrors in minimal distro as a
> backup to fetch
> sources from.
> something like this in minimal.conf would do it
>
> SOURCE_MIRROR_URL +=
> "http://www.angstrom-distribution.org/unstable/sources/"
> INHERIT += "own-mirrors"
>
> if we do not want to inherit angstrom-mirrors class directly.
>>
>

Khem, this is not about panda uboot, but about the behaviour of
members towards others.

As far as u-boot and panda concerns. I don't care any more.
If that is the way TI employees want to support their customers, it is
their choice, not mine.

Wrt the source mirror.
I would suggest to use http://sources.openembedded.org/ as official OE
mirror. We could use the angstrom mirror as starting point to further
populate the OE mirror. Alternately I have a fair amount of tarballs
etc that I can contribute (also some for the older days, but none
related to opie like things) And of course someone could also do a
fetchall or so (I seem to recall Martin already did soemthing like
that in the past)

Best regards, Frans.


