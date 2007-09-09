Received: from [209.85.146.179] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IUTO5-0004d0-0Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2007 22:28:09 +0200
Received: by wa-out-1112.google.com with SMTP id l24so1455929waf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2007 13:25:15 -0700 (PDT)
Received: by 10.114.15.1 with SMTP id 1mr3297308wao.1189369515044;
	Sun, 09 Sep 2007 13:25:15 -0700 (PDT)
Received: by 10.114.208.4 with HTTP; Sun, 9 Sep 2007 13:25:14 -0700 (PDT)
Message-ID: <19c1b8a90709091325ue7f5cf5rd3956add41e45c5@mail.gmail.com>
Date: Sun, 9 Sep 2007 13:25:14 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46E43AB1.4808813@vollmann.ch>
MIME-Version: 1.0
References: <46E3264C.39BD31A5@vollmann.ch>
	<74d0deb30709090150g161e6059q99f23e2ce1336e1c@mail.gmail.com>
	<46E3E02B.22CEE170@vollmann.ch>
	<65784821.20070909143237@vanille-media.de>
	<46E43AB1.4808813@vollmann.ch>
Subject: Re: PREFERRED_PROVIDER (was: Conditional Expressions in Python)
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
X-List-Received-Date: Sun, 09 Sep 2007 20:28:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

which distro are you using. angstrom-2007.1.conf could be your problem

./conf/distro/angstrom-2007.1.conf:335:PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc
       = "glibc-intermediate"

-Khem

On 9/9/07, Detlef Vollmann <dv@vollmann.ch> wrote:
> Dr. Michael Lauer wrote:
> > DEPENDS = "${@['virtual/${TARGET_PREFIX}gcc-initial','virtual/${TARGET_PREFIX}gcc']['nptl' in '${GLIBC_ADDONS}']}"
> >
> > Since Python 2.5, this can be written as:
> >
> > DEPENDS = "${@'virtual/${TARGET_PREFIX}gcc' if 'nptl' in '${GLIBC_ADDONS}' else 'virtual/${TARGET_PREFIX}gcc-initial'}
> Thanks for explaining these lines.
> So, in my case (no NPTL), glibc is a provider of libc-for-gcc,
> and I decided to put it as preferred provider into my local.conf
> (actually it should go into my distro.conf, but that comes later...):
> PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
>
> But what surprise, it still tried to build glibc-intermediate.
> Looking into the log file, I found the following lines:
> > DEBUG: providers for virtual/powerpc-angstrom-linux-libc-for-gcc are: ['glibc', 'glibc-intermediate', 'eglibc-intermediate']
> > DEBUG: update_data()
> > DEBUG: selecting /oe/own/packages/glibc/glibc_2.3.6.bb as PREFERRED_VERSION 2.3.6 of package glibc (for item virtual/powerpc-angstrom-linux-libc-for-gcc)
> > DEBUG: update_data()
> > DEBUG: selecting /oe/rep/org.openembedded.dev/packages/glibc/glibc-intermediate_2.5.bb as PREFERRED_VERSION 2.5 of package glibc-intermediate (for item virtual/powerpc-angstrom-linux-libc-for-gcc)
> > DEBUG: update_data()
> > NOTE: selecting glibc-intermediate to satisfy virtual/powerpc-angstrom-linux-libc-for-gcc due to PREFERRED_PROVIDERS
> This last line is simply wrong:  I've searched the whole repository
> and my overlay for respective lines, and the only file with such a
> preferred provider would be openprotium.conf, and that file isn't read.
>
> My first guess was that the version number 2.5 for glibc-intermediate
> is higher than the 2.3.6 for glibc and it was preferred for that.
> So I put back another line into my local.conf:
> PREFERRED_VERSION_glibc-intermediate = "2.3.6"
>
> But this didn't help.  The relevant lines from the log are now:
> > DEBUG: Added dependency virtual/powerpc-angstrom-linux-libc-for-gcc for /oe/own/packages/gcc/gcc-cross_4.1.1.bb
> > DEBUG: providers for virtual/powerpc-angstrom-linux-libc-for-gcc are: ['glibc', 'glibc-intermediate', 'eglibc-intermediate']
> > DEBUG: update_data()
> > DEBUG: selecting /oe/own/packages/glibc/glibc_2.3.6.bb as PREFERRED_VERSION 2.3.6 of package glibc (for item virtual/powerpc-angstrom-linux-libc-for-gcc)
> > DEBUG: update_data()
> > DEBUG: selecting /oe/own/packages/glibc/glibc-intermediate_2.3.6.bb as PREFERRED_VERSION 2.3.6 of package glibc-intermediate (for item virtual/powerpc-angstrom-linux-libc-for-gcc)
> > DEBUG: update_data()
> > NOTE: selecting glibc-intermediate to satisfy virtual/powerpc-angstrom-linux-libc-for-gcc due to PREFERRED_PROVIDERS
> > DEBUG: adding /oe/own/packages/glibc/glibc-intermediate_2.3.6.bb to satisfy virtual/powerpc-angstrom-linux-libc-for-gcc
>
> Does anybody have any idea why bitbake still believes that it
> should use glibc-intermediate for libc-for-gcc?
>
>   Detlef
>
> --
> Detlef Vollmann   vollmann engineering gmbh
> Linux and C++ for Embedded Systems    http://www.vollmann.ch/
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


