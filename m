Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J3Z2K-0000fR-2K
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2007 16:34:44 +0100
Received: by fg-out-1718.google.com with SMTP id 22so69071fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2007 07:30:06 -0800 (PST)
Received: by 10.86.82.16 with SMTP id f16mr4281132fgb.60.1197732606803;
	Sat, 15 Dec 2007 07:30:06 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 28sm5778132fkx.2007.12.15.07.30.05
	(version=SSLv3 cipher=OTHER); Sat, 15 Dec 2007 07:30:05 -0800 (PST)
Date: Sat, 15 Dec 2007 17:35:13 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1515905492.20071215173513@gmail.com>
To: "Leon Woestenberg" <leon.woestenberg@gmail.com>
In-Reply-To: <c384c5ea0712150526i2a8147c5ud43b5e79c52a7feb@mail.gmail.com>
References: <164348748.20071215043923@gmail.com>
	<c384c5ea0712150526i2a8147c5ud43b5e79c52a7feb@mail.gmail.com>
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
X-List-Received-Date: Sat, 15 Dec 2007 15:34:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Leon,

Saturday, December 15, 2007, 3:26:40 PM, you wrote:

> Hello all,

> On Dec 15, 2007 3:39 AM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
>>    ANGSTROM_MODE config variable has proven to be very useful and
>> successful feature during the Angstrom evolution. IMHO, it is worth
>> generalization of its meaning and naming to become a generic
>> additional OE distro configuration parameter. So, I'd like to propose
>> it to be renamed to SYSTYPE, with the description "Select particular
>> system variant of a distribution which supports such feature, e.g.,
>> underlying libc type."
>>
> NAK on the name and the combination with other settings:

>>   Obviously, it wouldn't be limited to libc type, but intended to be a
>> generic sub-parameter of a distro, it could be debug/release type,
>> size type (minimal/standard/extended), whatever. The usage idea is to
>>
> C library selection is mostly orthogonal from the
> debug/profile/test/release/whatever type.
> Also, C library selection is mostly orthogonal from the size type (in
> fact, that's a target, not
> a property of it).

  Well, SYSTYPE has another aim and idea in its introduction. I hinted
about that in original mail, now let me make it explicit: the proposal
is about introduction of the standard OE variable name for distro
parameter tweaking. Its meaning however completely depends on the
distro. Some distro needs switch libc's. Some needs to switch WMs.
Others need to switch many other things, possibly, in combinations.
Very good. OE recommends a standard general syntax for that - a
SYSTYPE. Exact format of what goes into SYSTYPE and its semantics is
up to distro (and users will know about all that by reading distro's
docs). (Now that we talk about validation, it puts additional
syntactic constraints on SYSTYPE value, that's why I'm personally not
keen to start with [rigid] validation from the beginning).

>> have standard name for such generic parameter, plus semantically it
>> should be expected that a distro allows to build different SYSTYPE's
>> side-by-side in the same build dir (like Angstrom does for libc
>> variants).
>>
> *If* you want to go for this, I would propose DISTRO_LIBC instead and
> NOT mix this with any other settings, which are orthogonal and mostly
> unrelated.

> (I.e. the fact that I want to profile my image, is independent on
> whether I built with eglibc or glibc).

> Also, I agree with Koen that we then end up in the situation where
> people may assume this flag is always respected, while it's dependent
> on the distro.

> -1 for the proposal

  Please rethink.

> +0 for the making DISTRO_LIBC a global C library selector.

  Gotcha! That's exactly what I'm trying to avoid - proliferation of
adhoc distro config parameters! We have ANGSTROM_MODE now, supposedly
FooNas will want to call it FOONAS_LIBC, with lots others alike. Then
lots of others will introduce lots of others config parameter, making
OE maintainers and users screem. No, let's think it out now, acting on
numerous complaints that OE is too complex to setup (which includes
configuration) by mere humans. How it was before, there're two
parameters had to be set to build a proper package/image: DISTRO and
MACHINE. As we all hopefully agree that tweaking high-level distro
settings without formally introducing a new distro is a nice thing,
let's add one another parameter to this, and let users and developers
know that it is the recommended way to do it. So, a user could build a
package/image using:

DISTRO=<distro> SYSTYPE=<systype> MACHINE=<machine> bitbake <package>

   In ideal world (and we'll get there, I trust), this will be possible
after OE checkout, without adding any weird configs with weird
settings users can't get. Then, we'll even address rights of
environment-use-challenged users, by adding corresponding options to
bitbake itself:

bitbake --distro=foo --systype=bar --machine=baz package

  And nothing really precludes SYSTYPE to be not just "libc", but
"libc,release", or "libc,release,wm=xfce", or
"libc,release,wm=xfce,weird_user_config=some_file.conf".

> Regards,



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



