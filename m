Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q118m-0003lj-TC
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 19:44:45 +0100
Received: by pzk35 with SMTP id 35so558767pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 11:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=v8MVY1+/Kv5ISks565FJUuvHkPwiLjypuxxx7EkYWgo=;
	b=HFnAnDcR2f63ratjBoGkSPl2bSR+cPPkZcpndy+AxIkEWqmzokB021Y6RHqKgTMKRb
	FWhHtz5n3ozismXA77nh/Mv5EMdIKfP15W4YDQ8UT3+InrS0WNWHJ0ach1mPgEBxtXP2
	MX5Ypn04U0LSie1btTGnjBBm82p+P9SUmwTYw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=RjoD/yi8VOUF19iTrFIjrF/uDkA5rDP87Pg0ZcYuYGehaLLysSY4VZBXsiq9Jwyyo9
	4nxlqJw8mBWrIQk/LOC/T8Mspu1A3Tho44seCqn7pUdD45aUQwez01/Xc+i6MIRNFZfZ
	ckTdrC2r88i2WcI1Oe8g2ouJ/4vGUouoZ5cRw=
Received: by 10.142.178.14 with SMTP id a14mr1330734wff.254.1300560176699;
	Sat, 19 Mar 2011 11:42:56 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 25sm4673809wfb.10.2011.03.19.11.42.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Mar 2011 11:42:54 -0700 (PDT)
Date: Sat, 19 Mar 2011 11:44:03 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110319184403.GB14868@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4D81226B.4060704@gmail.com> <4D81331E.2070604@mentor.com>
	<4D814E28.6080701@gmail.com> <4D84B726.5060302@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D84B726.5060302@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: perl-native_5.10.1 fails
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
X-List-Received-Date: Sat, 19 Mar 2011 18:44:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/03/11 07:01), Tom Rini wrote:
> On 03/16/2011 04:56 PM, Jan Paesmans wrote:
> >On 03/16/11 23:01, Tom Rini wrote:
> >>On 03/16/2011 01:49 PM, Jan Paesmans wrote:
> >>>Hi all,
> >>>
> >>>When trying to build an x11-image for pm9263 with angstrom-2010.x,
> >>>perl-native fails to build.
> >>>The error is listed below. As far as I can tell, the problem is that a
> >>>gcc flag is passed to the linker, -fstack-protector. I tried to find out
> >>>where this -fstack-protector could come from, but the only trace I could
> >>>find was in the Configure of perl-native itself. There is no mention
> >>>that it is set when Configure is called in the configure step, nor in
> >>>any of the environment variables during the do_configure or
> >>>do_compile step.
> >>>
> >>>I run Ubuntu 10.10 with gold as the linker. I thought that it might be
> >>>the gold linker but neither gold nor ld seem to have this option when
> >>>reviewing the man-page.
> >>
> >>Can you edit the recipe and add in:
> >>EXTRA_OEMAKE = 'LD="${CCLD}"'
> >>

actually when inheriting native it export LD=ld in envronment and thats
whats used in makefiles

You could try setting

export LD=${CC}
just after inherit native in the perl-native recipe

I have a simialr fix lined up for oe-core
> >>And do a bitbake -c clean perl-native then bitbake perl-native
> >>Thanks.
> >>
> >That did the trick. Now perl-native compiles fine. However when I
> >checked the output of the log.do_compile I did notice a change a the
> >behaviour. I was expecting the -fstack-protector flag to be gone,
> >instead it is still there. However, instead of invoking ld for the final
> >link, now gcc is invoked. Below you can find the relevent section of the
> >log file. Also in attachment is a patch with the change you suggested.
> 
> OK, thanks.  I'll put this into a patch this weekend.  What's going
> on is that while I'm not sure where -fstack-protector is coming from
> (but it's a useful flag), as you saw, 'ld' chokes on it.  But for
> linking you shouldn't really ever invoke ld directly but rather via
> gcc, so passing LD=${CCLD} overrides perl's makefiles and we invoke
> gcc as the linker and it handles the flag right in this case.
> 
> >
> >Thanks for the help.
> >Regards,
> >
> >Jan
> >
> >Running Makefile.PL in ext/DynaLoader
> >../../miniperl -I../../lib Makefile.PL INSTALLDIRS=perl
> >INSTALLMAN1DIR=none INSTALLMAN3DIR=none PERL_CORE=1 LIBPERL_A=libperl.so
> >LINKTYPE=static
> >Processing hints file hints/linux.pl
> >Unrecognized argument in LIBS ignored:
> >'-Wl,-rpath-link,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib'
> >Unrecognized argument in LIBS ignored:
> >'-Wl,-rpath,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib'
> >Unrecognized argument in LIBS ignored: '-Wl,-O1'
> >Unrecognized argument in LIBS ignored: '-fstack-protector'
> >Writing Makefile for DynaLoader
> >make[1]: Entering directory
> >`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
> >make[1]: Leaving directory
> >`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
> >Making all in ext/DynaLoader
> >  make all PERL_CORE=1 LIBPERL_A=libperl.so LINKTYPE=static
> >make[1]: Entering directory
> >`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
> >../../miniperl "-I../../lib" "-I../../lib" DynaLoader_pm.PL DynaLoader.pm
> >../../miniperl "-I../../lib" "-I../../lib" XSLoader_pm.PL XSLoader.pm
> >cp XSLoader.pm ../../lib/XSLoader.pm
> >cp DynaLoader.pm ../../lib/DynaLoader.pm
> >AutoSplitting ../../lib/DynaLoader.pm (../../lib/auto/DynaLoader)
> >rm -f DynaLoader.xs
> >cp dl_dlopen.xs DynaLoader.xs
> >../../miniperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp
> >-noprototypes -typemap ../../lib/ExtUtils/typemap DynaLoader.xs>
> >DynaLoader.xsc&&  mv DynaLoader.xsc DynaLoader.c
> >gcc  -c   -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe
> >-fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE
> >-D_FILE_OFFSET_BITS=64 -O2   -DVERSION=\"1.10\" -DXS_VERSION=\"1.10\"
> >-fPIC "-I../.."  -DLIBC="/lib/libc-2.12.1.so" DynaLoader.c
> >rm -rf ../../DynaLoader.o
> >cp DynaLoader.o ../../DynaLoader.o
> >make[1]: Leaving directory
> >`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
> >rm -f libperl.so
> >gcc  -o libperl.so -shared -O2
> >-L/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
> >-L/usr/local/lib -fstack-protector op.o perl.o   gv.o toke.o perly.o
> >pad.o regcomp.o dump.o util.o mg.o reentr.o mro.o hv.o av.o run.o
> >pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o
> >utf8.o taint.o deb.o universal.o xsutils.o globals.o perlio.o perlapi.o
> >numeric.o mathoms.o locale.o pp_pack.o pp_sort.o   DynaLoader.o -lnsl
> >-ldl -lm -lcrypt -lutil -lpthread -lc
> >LD_LIBRARY_PATH=/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1
> >gcc  -o perl
> >-L/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
> >-Wl,-rpath-link,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
> >-Wl,-rpath,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
> >-Wl,-O1 -fstack-protector -L/usr/local/lib -Wl,-E
> >-Wl,-rpath,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.10.1/CORE
> >perlmain.o  libperl.so `cat ext.libs` -lnsl -ldl -lm -lcrypt -lutil
> >-lpthread -lc
> >LD_LIBRARY_PATH=/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1
> >./miniperl -Ilib mkppport
> >running
> >/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/miniperl
> >-I../../lib PPPort_pm.PL
> >
> >
> >
> >
> >_______________________________________________
> >Openembedded-devel mailing list
> >Openembedded-devel@lists.openembedded.org
> >http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> -- 
> Tom Rini
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


