Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J5Rj8-0005G7-Bj
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2007 21:10:42 +0100
Received: by ug-out-1314.google.com with SMTP id i24so593778ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2007 12:05:34 -0800 (PST)
Received: by 10.67.115.4 with SMTP id s4mr3843749ugm.41.1198181134062;
	Thu, 20 Dec 2007 12:05:34 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 31sm302580fkt.14.2007.12.20.12.05.31
	(version=SSLv3 cipher=OTHER); Thu, 20 Dec 2007 12:05:32 -0800 (PST)
Date: Thu, 20 Dec 2007 22:10:48 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <30318843.20071220221048@gmail.com>
To: "Leon Woestenberg" <leon.woestenberg@gmail.com>
In-Reply-To: <c384c5ea0712201038v167f7a86jfc2189e04bae0ec1@mail.gmail.com>
References: <164348748.20071215043923@gmail.com>
	<c384c5ea0712150526i2a8147c5ud43b5e79c52a7feb@mail.gmail.com>
	<1515905492.20071215173513@gmail.com>
	<c384c5ea0712201038v167f7a86jfc2189e04bae0ec1@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] ANGSTROM_MODE -> SYSTYPE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2007 20:10:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Leon,

Thursday, December 20, 2007, 8:38:12 PM, you wrote:

> Hello Paul,

>> ...the proposal
>> is about introduction of the standard OE variable name for distro
>> parameter tweaking. Its meaning however completely depends on the
>> distro.
>>
> Do you see the contradiction? A *standard* OE variable name that
> *completely depends* on the
> distro. Please, no.

  Well, it seems you mix up *levels*. The variable with standard
*name*, whose *value* gets interpreted by a distro, what's a problem
here? You know, it's like PATH unix envvar - it is standard,
but different systems and different users put different stuff there.

>> Some distro needs switch libc's. Some needs to switch WMs.
>> Others need to switch many other things, possibly, in combinations.
>> Very good. OE recommends a standard general syntax for that - a
>> SYSTYPE. Exact format of what goes into SYSTYPE and its semantics is
>> up to distro (and users will know about all that by reading distro's
>> docs). (Now that we talk about validation, it puts additional
>> syntactic constraints on SYSTYPE value, that's why I'm personally not
>> keen to start with [rigid] validation from the beginning).
>>
> MACHINE and DISTRO are extremely well understood: they select one
> option out of a list, and the name implies what you select.

> Extremely user friendly.

> SYSTYPE does not fulfill these two properties in your proposal.

 ??? How it is not? Do you have a proposal for better name?

>> > +0 for the making DISTRO_LIBC a global C library selector.
>>
>>   Gotcha! That's exactly what I'm trying to avoid - proliferation of
>> adhoc distro config parameters! We have ANGSTROM_MODE now, supposedly
>> FooNas will want to call it FOONAS_LIBC, with lots others alike. Then
>>
> No, "DISTRO_LIBC". Literally. Like Marcin set out more explicitly than I did.
>> bitbake --distro=foo --systype=bar --machine=baz package
>>
> Argh. No!

  Indeed? Maybe you even have arguments? ;-) Or rather, maybe you have
the whole paradigm how make OE more friendly for newcomers/casual
users? Please share, that's what I'm trying to solve here.

>>   And nothing really precludes SYSTYPE to be not just "libc", but
>> "libc,release", or "libc,release,wm=xfce", or
>> "libc,release,wm=xfce,weird_user_config=some_file.conf".
>>
> Sorry, you didn't convince me, at all.

> I strongly agree with Richard to either not do this (therefore my -2),
> or either to define a sane namespace that some distro's might support,
> agreeing with Marcin.

  We somehow interpret differently what Richard wrote. Per my
understanding, his concern was that it won't be clear if given feature
will be supported by some distro, or no. SYSTYPE offers validation to
solve this issue.

> Regards,



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



