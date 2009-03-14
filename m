Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LiRbZ-0007C5-Od
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Mar 2009 12:00:37 +0100
Received: by bwz9 with SMTP id 9so3207381bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2009 04:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XSrCijzwyIOmIcwr6VqsvjoR4Q8G71Oz5soOBGSwL28=;
	b=XDlFLZCiJI3rdxPY7j9PFugUdu7RGdS+EoYSEs33nIIy7BoBPZUCoI8S2QPUAjQF+Y
	xqFG99yP5hXFL5AX6JVfnyFU5hI/QsCrboLZ47FhCLVqkJ9AyotP2tNkL9rWO0bSvRy4
	br0G4PpoM4ffowf5Ie2CyI6wmJbBfyC300MF0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tXJm/otBmJvo2BGIa16AqnyPlG2rzV08rlEJjZvvBqMvOJskUJd2pkvO/ZGrr4D1zL
	RT6pY6xsjC/K1/qn0n1C4sXZymIYynWX1822nnUWhC8ze2H4LhsTrDkgNK2Alz2SlQtF
	1vd9inEr49Iq1AZvnXt0Qv+KZeaNar0jPsEAU=
MIME-Version: 1.0
Received: by 10.223.115.80 with SMTP id h16mr1141892faq.94.1237028410973; Sat, 
	14 Mar 2009 04:00:10 -0700 (PDT)
In-Reply-To: <19c1b8a90903131040k5d7b1f40kfbfafbb787e45341@mail.gmail.com>
References: <ac9c93b10903120252x292ff544gca18ac8684ce0f2f@mail.gmail.com>
	<19c1b8a90903121037g5726bf99qadca1e5d95dcae7@mail.gmail.com>
	<ac9c93b10903121334j3a6cfad8u8e4591ddecf80394@mail.gmail.com>
	<19c1b8a90903121458ufac02e7p878b6badfe29878@mail.gmail.com>
	<ac9c93b10903130815t10265676ld8e464ab460689dd@mail.gmail.com>
	<19c1b8a90903131040k5d7b1f40kfbfafbb787e45341@mail.gmail.com>
Date: Sat, 14 Mar 2009 12:00:10 +0100
Message-ID: <ac9c93b10903140400h7cddb9d5x74b72b8055db907a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: g++ lib problem
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
X-List-Received-Date: Sat, 14 Mar 2009 11:00:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

True but why not add long double function prototypes to glibc as we have them.
Might save someone some headache later on.

For my specific problem:
In the package I added a patch for this, and I raised the issue with
the author of the sw who informed me that the long double accuracy was
not really needed, so guess the problem will be gone in the next
release anyway.

Frans

2009/3/13 Khem Raj <raj.khem@gmail.com>:
> On Fri, Mar 13, 2009 at 8:15 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2009/3/12 Khem Raj <raj.khem@gmail.com>:
>> [...]
>>>
>>> I see it gets it from libm but g++ specifiies -lm for you where as gcc
>>> does not. I think the problem is that ARM have same precision for
>>> double and long double so glibc defines __NO_LONG_DOUBLE_MATH for ARM
>>> as a result the prototypes for the *l functions are not emitted into
>>> math.h. Although in glibc they are aliases for the corresponding
>> [...]
>>
>> Khem,
>>
>> Thanks for the explanation.
>> Should we change the glibc package to resolve this?
>>
>
> hmmm IMO I think you should fix the application to not ask for long
> double functions on platforms where long double is
> not different than double and fixing glibc could be ok too. Care for a patch :)
>> Frans
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


