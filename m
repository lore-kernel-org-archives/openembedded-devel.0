Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N9Igp-0000fD-J5
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Nov 2009 14:29:22 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N9IfY-0007M1-GM for openembedded-devel@lists.openembedded.org;
	Sat, 14 Nov 2009 08:28:00 -0500
Date: Sat, 14 Nov 2009 08:27:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AFEACEE.4050302@balister.org>
Message-ID: <alpine.LFD.2.00.0911140826370.26934@localhost>
References: <alpine.LFD.2.00.0911130443520.1157@localhost>
	<4AFD4DD6.70509@balister.org>
	<alpine.LFD.2.00.0911130732220.17745@localhost>
	<4AFD5440.6080202@balister.org>
	<1258129007.5799.73.camel@dax.rpnet.com>
	<alpine.LFD.2.00.0911131129020.5980@localhost>
	<1258130362.5799.80.camel@dax.rpnet.com>
	<1258152092.13901.11.camel@andromeda>
	<4AFEA793.5020504@balister.org>
	<alpine.LFD.2.00.0911140751320.12790@localhost>
	<alpine.LFD.2.00.0911140758030.13079@localhost>
	<4AFEACEE.4050302@balister.org>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build breakage: python-native-2.6.1
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
X-List-Received-Date: Sat, 14 Nov 2009 13:29:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 14 Nov 2009, Philip Balister wrote:

> On 11/14/2009 07:59 AM, Robert P. J. Day wrote:
> > On Sat, 14 Nov 2009, Robert P. J. Day wrote:
> >
> > > On Sat, 14 Nov 2009, Philip Balister wrote:
> > >
> > > >
> > > >
> > > > On 11/13/2009 05:41 PM, Michael 'Mickey' Lauer wrote:
> > > > > Hi folks,
> > > > >
> > > > > > That readline tweak is a hack and there is a bigger problem here.
> > > > > > I'd
> > > > > > like to solve it completely so yes, I'd like to confirm that was the
> > > > > > problem please. Once someone has done that I also have a proposed
> > > > > > fix:
> > > > > >
> > > > > > http://tim.rpsys.net/python-hostfix.patch
> > > > >
> > > > > Acked-by: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> > > >
> > > > Tested-by: Philip Balister<philip@balister.org>
> > > >
> > > > Fixed on F11.
> > > >
> > > > Philip
> > > >
> > > > PS: Yes, I know RP just pushed the patch.
> > >
> > >    so there's only one package between me and a build of the
> > > beagleboard demo image -- guile-native -- and adrian alonso(?)
> > > allegedly posted a usable fix for that yesterday.  looking good.
> >
> >    i just pulled that python patch and i'm still getting the same build
> > error as yesterday -- segmentation fault:
> >
> > NOTE: make -j4 BUILD_SYS= HOST_SYS= LIBC=
> > STAGING_LIBDIR=/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/lib
> > STAGING_INCDIR=/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/include
> > *** WARNING: renaming "dbm" since importing it failed:
> > build/lib.linux-x86_64-2.6/dbm.so: undefined symbol: dbm_firstkey
> > /bin/sh: line 1: 12842 Segmentation fault      (core dumped)
> > LD_LIBRARY_PATH=/home/rpjday/oe/angstrom-dev/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1:
> > CC='ccache gcc -pthread' LDSHARED='ccache gcc -pthread -shared'
> > OPT='-DNDEBUG -g  -O3 -Wall -Wstrict-prototypes' ./python -E
> > ./setup.py -q build
> > make: *** [sharedmods] Error 139
> > FATAL: oe_runmake failed
> >
> >    this is after "bitbake -c distclean python-native".
>
> It is working for me. Check and see if the patch is applied.

 weird.  i retried the distclean on that package, tried to build again
and now it's fine.  how odd.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


