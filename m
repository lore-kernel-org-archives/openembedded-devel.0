Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J420I-0005eH-LC
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2007 23:30:34 +0100
Received: by fg-out-1718.google.com with SMTP id 22so193175fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2007 14:25:49 -0800 (PST)
Received: by 10.86.62.3 with SMTP id k3mr5726772fga.15.1197843949736;
	Sun, 16 Dec 2007 14:25:49 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id y18sm5934232fkd.2007.12.16.14.25.46
	(version=SSLv3 cipher=OTHER); Sun, 16 Dec 2007 14:25:47 -0800 (PST)
Date: Mon, 17 Dec 2007 00:31:11 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <487953198.20071217003111@gmail.com>
To: Marcin Juszkiewicz <openembedded@haerwu.biz>
In-Reply-To: <200712162148.14183.openembedded@haerwu.biz>
References: <164348748.20071215043923@gmail.com>
	<200712162148.14183.openembedded@haerwu.biz>
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
X-List-Received-Date: Sun, 16 Dec 2007 22:30:34 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hello Marcin,

Sunday, December 16, 2007, 10:48:13 PM, you wrote:

> Dnia sobota, 15 grudnia 2007, Paul Sokolovsky napisa³:

>>    ANGSTROM_MODE config variable has proven to be very useful and
>> successful feature during the Angstrom evolution. IMHO, it is worth
>> generalization of its meaning and naming to become a generic
>> additional OE distro configuration parameter. So, I'd like to propose
>> it to be renamed to SYSTYPE, with the description "Select particular
>> system variant of a distribution which supports such feature, e.g.,
>> underlying libc type."

> Basically I like idea of unifing this. In Poky we have POKYLIBC for it.
> But it should be in DISTRO_ namespace as this makes distro change.

>>   Obviously, it wouldn't be limited to libc type, but intended to be a
>> generic sub-parameter of a distro, 

> DISTRO_LIBC

>> it could be debug/release type, 

> DISTRO_TYPE

>> size type (minimal/standard/extended), 

> This is handled by distro overrides when it comes to configurations 
> (busybox, uclibc, kernel configs) and images content.

>> whatever. 

> DISTRO_* can be added at any time as long as they have sense.

>> The usage idea is to have standard name for such generic parameter, plus
>> semantically it should be expected that a distro allows to build
>> different SYSTYPE's side-by-side in the same build dir (like Angstrom
>> does for libc variants).

>> And nothing really precludes SYSTYPE to be not just "libc", but
>> "libc,release", or "libc,release,wm=xfce", or
>> "libc,release,wm=xfce,weird_user_config=some_file.conf".

> This is *SICK* as this really should be set in local.conf. Imagine how to
> handle something like this:

  That was just a display that such syntax (i.e. single var) doesn't have
any restrictions. The actual syntax of the value is fully offloaded to
a specific distro. And I don't expect any distro in OE mainline having
something more than scalar value soon.

> DISTRO=umbaumba-18.7 MACHINE=spitz SYSTYPE="uclibc 
> uclibc_config=tweaks/uclibc.config release,wm=openbox 
> openbox_config=tweaks/openbox.onfig kernel=tweaks/linux-rp-umbaumba 
> kernel_config=tweaks/kernel/spitz.defconfig" bitbake 
> umbaumba-default-image

> All what this command do is possible with auto/local.conf files.

  So, let it me recount it again: the talk is not just about renaming
ANGSTROM_MODE to something, but about defining a user-level, whitebox
parameters to configure OE build. We had a long and hot discussion
recently about making OE more friendly for novices and casual
developers. I was opponent of any patch/wrap measures, but something
should be done to make OE more easily configurable nonetheless.

  The approach I argue here is: let's define finite, small, easily
graspable set of parameters and then work towards making OE work out of
the box requiring a user to set just those parameters, and preferrably
set in easy and obvious way.

  Editing auto/local.conf and bunch of DISTRO_* parameters do not qualify
for this purpose, those are developers' stuff, requiring reading
lots of docs and good understanding of OE.

  Summing up, arguments for the original proposal:

1. One variable vs many: psychologically, it's much easier to remember
one setting than many. Knowledge that *all* additional configuration
is passed via one variable gives additional psychological boost that
you have powerful and flexible tool in your hand, and know that tool \
well enough to use it. (I mean only *whitebox* distro parameters here,
never a talk about replacing dozens of OE variables with the one;
developers will keep fiddling with all of them).
  Next, as I pointed, once we settle on the set of the OE whitebox
variables (and I really hope it will be this three-some of DISTRO,
<var_in_question>, MACHINE), it would be natural to allow to specify
them on bitbake command line. This would require finite and small set
of them.

2. SYSTYPE vs LONG_BUT_FULLY_CORRECT_VARIABLE_NAME: I love namespaces
and stuff myself, but again, with such paradigm, there would be 2
top-level namespaces: whitebox vars and blackbox vars. Whitebox vars
face large community of users, so there names should be short and
catchy, and not necessarily fit with blackbox var names. As an
example, distro code might parse SYSTYPE="release,glibc" and set
DISTRO_LIBC="glibc", DISTRO_TYPE="release" based on that, for peruse
by other parts of OE blackbox.


   So, renaming ANGSTROM_MODE to DISTRO_LIBC is obviously move in the
right direction, but let's consider if we're ready to move on wider front
at the same time. I personally already have in my tree changes which
allow to just check out OE and bitbake, have bitbake on the path,
create a build dir in well-known location, and then type

DISTRO=angsrom SYSTYPE=uclibc MACHINE=h4000 bitbake initramfs-bootmenu-image

or

DISTRO=angsrom MACHINE=hx4700 bitbake x11-image

or

DISTRO=generic-uclibc-opt MACHINE=wdmybook bitbake nano

or

DISTRO=openwrt-sdk MACHINE=brcm24 bitbake nano


And voila. No config file copying and editing. No
obscure environment variable setting. No wrapper scripts. No
Makefiles. It just works.


> +1 from me for DISTRO_LIBC and good thought other DISTRO_ vars
> -2 for me for SYSTYPE variable
> -oo for SYSTYPE usage like command above




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



