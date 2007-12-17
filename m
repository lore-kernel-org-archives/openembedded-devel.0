Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J469d-00025N-PV
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2007 03:56:30 +0100
Received: by fg-out-1718.google.com with SMTP id 22so211362fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2007 18:51:43 -0800 (PST)
Received: by 10.86.26.11 with SMTP id 11mr5901105fgz.72.1197859903695;
	Sun, 16 Dec 2007 18:51:43 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 12sm16755023fks.2007.12.16.18.51.41
	(version=SSLv3 cipher=OTHER); Sun, 16 Dec 2007 18:51:41 -0800 (PST)
Date: Mon, 17 Dec 2007 04:57:06 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1414530972.20071217045706@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1197845911.4653.54.camel@localhost.localdomain>
References: <164348748.20071215043923@gmail.com>
	<200712162148.14183.openembedded@haerwu.biz>
	<487953198.20071217003111@gmail.com>
	<1197845911.4653.54.camel@localhost.localdomain>
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
X-List-Received-Date: Mon, 17 Dec 2007 02:56:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Monday, December 17, 2007, 12:58:31 AM, you wrote:

> On Mon, 2007-12-17 at 00:31 +0200, Paul Sokolovsky wrote:
>>    So, renaming ANGSTROM_MODE to DISTRO_LIBC is obviously move in the
>> right direction, but let's consider if we're ready to move on wider front
>> at the same time. I personally already have in my tree changes which
>> allow to just check out OE and bitbake, have bitbake on the path,
>> create a build dir in well-known location, and then type
>> 
>> DISTRO=angsrom SYSTYPE=uclibc MACHINE=h4000 bitbake initramfs-bootmenu-image
>> 
>> or
>> 
>> DISTRO=angsrom MACHINE=hx4700 bitbake x11-image
>> 
>> or
>> 
>> DISTRO=generic-uclibc-opt MACHINE=wdmybook bitbake nano
>> 
>> or
>> 
>> DISTRO=openwrt-sdk MACHINE=brcm24 bitbake nano
>> 
>> 
>> And voila. No config file copying and editing. No
>> obscure environment variable setting. No wrapper scripts. No
>> Makefiles. It just works.

> I'm not convinced about this :(. Why?

> The appearance of a standard DISTRO_LIBC variable implies that "glibc"
> and "uclibc" options are always going to work.

  Exactly. That's another reason not to create DISTRO_LIBC, or at
least, not to treat it as something more than internal setting.

> What if the distro
> doesn't support one of them? Is a bug report about some parameter passed
> to this variable not working for a given distro valid?

  This - validation of SYSTYPE setting - was already discussed
actually. To remind, quick and easy way to do it is to make distros
which support SYSTYPE to set SYSTYPES_SUPPORTED to, say,
"glibc eglibc uclibc". If SYSTYPES_SUPPORTED is not set, while
SYSTYPE, sanity.bbclass will barf out. Otherwise, it will check that
${SYSTYPE} appears in ${SYSTYPES_SUPPORTED} and barf out otherwise.

  The drawback is that it puts artificial constraints on ${SYSTYPE}
syntax. More general way would be to have SYSTYPE_SUPPORTED. If unset,
non-empty SYSTYPE causes sanity error. Otherwise, validation of its
value is left to the distro config/class files.

> The point is that all this configuration is distro specific. It should
> be up to the distro to decide what kind of users it wishes to cater for
> and how to enable those users to use OE.

  Yes, but as recent discussion showed, users doubt that, and think
that *OE* (not just a distro) should be more friendly to them. It
would be unwise to ignore that - there were many voices with different
usecases. To address this, OE should provide best practices on user-facing
configuration methods (in particular).

> If Angstrom wants single variable configuration (or triplet variable
> configuration with MACHINE, DISTRO, DISTRO_MODE/whatever) then thats
> fine. Rolling that out onto every other distro breaks the distro
> abstraction though.

  It won't be "roll out onto". It will be a best practice worked out
over long time by a big distro. We just need to polish it up to be
a real best practice, not just something which could be done.

> If you want to add some common code which handles such a variable
> variable that is also fine. I just worry about making it a generic and
> mandatory variable, I think it should remain distro specific (and hence
> up to the maintainers of a given distro).

  Let's put it that way: if a distro has some high-level,
user-adjustable setting(s) to tweak, they are advised to allow to do
this via SYSTYPE. They are free not to use it, or to use any other
configuration method of course. But if we agree on such a
recommendation for SYSTYPE, and distros actually will use it, that
will make users' life easier, for example, we will be able to write
2-paragraph Quick Start instructions which will actually describe 90%
of what someone, who is not a distro engineer, may need to know about
OE to get his initial tasks done.

> Cheers,

> Richard

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



