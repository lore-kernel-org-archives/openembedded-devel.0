Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8vNT-000134-Gz
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 13:35:50 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8vMD-0000zk-8v for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 07:34:29 -0500
Date: Fri, 13 Nov 2009 07:34:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AFD4DD6.70509@balister.org>
Message-ID: <alpine.LFD.2.00.0911130732220.17745@localhost>
References: <alpine.LFD.2.00.0911130443520.1157@localhost>
	<4AFD4DD6.70509@balister.org>
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
X-List-Received-Date: Fri, 13 Nov 2009 12:35:50 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 13 Nov 2009, Philip Balister wrote:

> On 11/13/2009 04:45 AM, Robert P. J. Day wrote:
> >
> >    building beagleboard-demo-image:
> >
> > NOTE: make -j4 BUILD_SYS= HOST_SYS= LIBC=
> > STAGING_LIBDIR=/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/lib
> > STAGING_INCDIR=/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/include
> > *** WARNING: renaming "dbm" since importing it failed:
> > build/lib.linux-x86_64-2.6/dbm.so: undefined symbol: dbm_firstkey
> > /bin/sh: line 1:   515 Segmentation fault
> > LD_LIBRARY_PATH=/home/rpjday/oe/angstrom-dev/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1:
> > CC='ccache gcc -pthread' LDSHARED='ccache gcc -pthread -shared'
> > OPT='-DNDEBUG -g  -O3 -Wall -Wstrict-prototypes' ./python -E ./setup.py -q
> > build
> > make: *** [sharedmods] Error 139
> > FATAL: oe_runmake failed
> >
> >    that's it, that's the entire log file.  and it's entirely
> > reproducible.
>
> Well, your and my setups are the same :) Graeme is the the other F11 user and
> it is working for him :(

  i'm not on F11 anymore, i'm effectively on F12 (fully-updated f12
beta).  i made the upgrade a couple days ago and that's when those
other packages broke.  hmmmm ... i really should have made that
chronological connection.

  but after the upgrade, i did a full rebuild of everything and those
were the only packages to fail.  so, percentage-wise, that's not bad.

rday
--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


