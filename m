Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PrEaW-0003SL-9q
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 20:04:56 +0100
Received: (qmail invoked by alias); 20 Feb 2011 19:03:37 -0000
Received: from p4FE0F124.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.224.241.36]
	by mail.gmx.net (mp002) with SMTP; 20 Feb 2011 20:03:37 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19WV+oFvI1W967SB8LjN7sUjoFLKUBCp5REVAZfnS
	l+uKsaJsnm543x
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Feb 2011 19:58:38 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
	<4D612958.70402@mentor.com>
	<AANLkTi=TqJ-+OdXWVNrvmHUxNg2CSEhbzSOEM-GtZ7QK@mail.gmail.com>
In-Reply-To: <AANLkTi=TqJ-+OdXWVNrvmHUxNg2CSEhbzSOEM-GtZ7QK@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201102201958.38316.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Sun, 20 Feb 2011 19:04:56 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 20 February 2011 19:26:23 Frans Meulenbroeks wrote:
> 2011/2/20 Tom Rini <tom_rini@mentor.com>:
> > On 02/20/2011 05:42 AM, Frans Meulenbroeks wrote:
> >> 2011/2/19 Tom Rini<tom_rini@mentor.com>:
> >>> On 02/19/2011 06:26 AM, Otavio Salvador wrote:
> >>>> On Sat, Feb 19, 2011 at 11:52, Andreas Mueller<schnitzeltony@gmx.de>
> >>>> 
> >>>>  wrote:
> >>>>> On Saturday 19 February 2011 10:45:38 Frans Meulenbroeks wrote:
> >>>>>> I am fine with the patch, but perhaps a better solution would be to
> >>>>>> introduce a var to decide whether it is a fatal or not.
> >>>>>> That way people distro's that use libtool 2.4 can decide to make it
> >>>>>> a fatal. (or individual users in their local.conf)
> >>>>>> 
> >>>>>> Frans
> >>>>> 
> >>>>> How comes that I sometimes feel handled as spammer ;-) ?
> >>>>> 
> >>>>> see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-
> >>>>> February/029534.html
> >>>>> 
> >>>>> anyway - treating RPATH errors as fatal has lead to many QA fixes and
> >>>>> further
> >>>>> will follow...
> >>>>> 
> >>>>> my opinion now: keep RPATH errors fatal as developer's  whip :-)
> >>>> 
> >>>> I agree about keeping it configurable.
> >>>> 
> >>>> Besides I think that we ought to keep it fatal until quite near of
> >>>> release since we'll be "forced" to fix most of many of them.
> >>> 
> >>> I just want to state, again, that most of these just go away with
> >>> libtool 2.4.  Now, if people are looking for something to work on that
> >>> won't just go
> >>> away with an update to libtool 2.4:
> >>> - iscsi-target needs some love again for various kernel versions as
> >>> that looks to be killing calamari and neek for nas-server-image
> >> 
> >> Peeked at iscsi-target for calamari. Some inet fields have changed
> >> name in 2.6.32 or so, and apparently this is not handled fully.
> >> Instead of trying to fix it, I moved the calamari recipe to 2.6.34
> >> (which I'm already using for half a year or so, but apparently never
> >> pushed).
> > 
> > Thanks.
> > 
> >> I'll also see if I can update the neek version (probably also by
> >> moving the kernel version forward.
> >> Tomorrow I'll discuss this with Walter who afaik is the only other neek
> >> user.
> > 
> > Note that I also see:
> > - uclibc total failure, but I assume unsupported and I'll drop
> > - minimal fails everywhere else with:
> > ERROR: QA Issue with staging: libsupc++.la failed sanity test (workdir)
> > in path
> > /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-image
> > /DISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/usr/
> > lib ERROR: QA Issue with staging: libstdc++.la failed sanity test
> > (workdir) in path
> > /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-image
> > /DISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/usr/
> > lib ERROR: QA staging was broken by the package built above
> 
> Peeked some more itnto this.
> 
> If I peek in ./nios2-linux/usr/lib/libsupc++.la I see:
> 
> # libsupc++.la - a libtool library file
> # Generated by ltmain.sh - GNU libtool 1.4a-GCC3.0 (1.641.2.256
> 2001/05/28 20:09:07 with GCC-local changes)
> #
> # Please DO NOT delete this file!
> # It is necessary for linking the library.
> 
> # The name that we can dlopen(3).
> dlname=''
> 
> # Names of this library.
> library_names=''
> 
> # The name of the static archive.
> old_library='libsupc++.a'
> 
> # Libraries that this one depends upon.
> dependency_libs='
> -L/home/frans/oe/tmp_minimal/work/nios2-linux/gcc-cross-4.1.2-r27.2/gcc-4.1
> .2/build.i686-linux.nios2-linux/nios2-linux/libstdc++-v3/src
> -L/home/frans/oe/tmp_minimal/work/nios2-linux/gcc-cross-4.1.2-r27.2/gcc-4.
> 1.2/build.i686-linux.nios2-linux/nios2-linux/libstdc++-v3/src/.libs -lm
> -L/home/frans/oe/tmp_minimal/work/nios2-linux/gcc-cross-4.1.2-r27.2/gcc-4.
> 1.2/build.i686-linux.nios2-linux/./gcc
> -L/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/nios2/nios2-linux/bin
> -L/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/nios2/nios2-linux/lib
> -L/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/nios2/lib/gcc/nios2-l
> inux/4.1.2
> -L/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/nios2/lib/gcc/nios2-l
> inux/4.1.2/../../../../nios2-linux/lib
> -L/home/frans/oe/tmp_minimal/sysroots/nios2-linux/lib
> -L/home/frans/oe/tmp_minimal/sysroots/nios2-linux/usr/lib -lgcc_s -lc
> -lgcc_s
> 
> ...
> 
> For other platforms I see
> # libsupc++.la - a libtool library file
> # Generated by libtool (GNU libtool 1.3134 2009-11-29) 2.2.7a
> #
> # Please DO NOT delete this file!
> # It is necessary for linking the library.
> 
> # The name that we can dlopen(3).
> dlname=''
> 
> # Names of this library.
> library_names=''
> 
> # The name of the static archive.
> old_library='libsupc++.a'
> 
> # Linker flags that can not go in dependency_libs.
> inherited_linker_flags=''
> 
> # Libraries that this one depends upon.
> dependency_libs=''
> ...
> 
> Note the different versions of libtool and the different dependency libs
> I guess the libsupc++ comes from gcc and nios2 has a very old gcc
> (4.1.2), but there is no newer version (nios2 support is not
> mainlined).
> Anyone a suggestion?
> 
> Frans.
In my case the QA RPATH error was caused by the value found in 

libdir=..

But here situation seems a bit different. How about manually setting to correct 

libdir=/usr/lib

and continue build?

Andreas


