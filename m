Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N8yvH-0004p6-0h
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 17:22:58 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nADGIT5O027092 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 16:18:29 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FUuUlXS+3esc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 16:18:29 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nADGIO5q027079
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 16:18:26 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AFD5440.6080202@balister.org>
References: <alpine.LFD.2.00.0911130443520.1157@localhost>
	<4AFD4DD6.70509@balister.org>
	<alpine.LFD.2.00.0911130732220.17745@localhost>
	<4AFD5440.6080202@balister.org>
Date: Fri, 13 Nov 2009 16:16:47 +0000
Message-Id: <1258129007.5799.73.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
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
X-List-Received-Date: Fri, 13 Nov 2009 16:22:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-11-13 at 07:42 -0500, Philip Balister wrote:
> On 11/13/2009 07:34 AM, Robert P. J. Day wrote:
> > On Fri, 13 Nov 2009, Philip Balister wrote:
> >
> >> On 11/13/2009 04:45 AM, Robert P. J. Day wrote:
> >>>
> >>>     building beagleboard-demo-image:
> >>>
> >>> NOTE: make -j4 BUILD_SYS= HOST_SYS= LIBC=
> >>> STAGING_LIBDIR=/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/lib
> >>> STAGING_INCDIR=/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/include
> >>> *** WARNING: renaming "dbm" since importing it failed:
> >>> build/lib.linux-x86_64-2.6/dbm.so: undefined symbol: dbm_firstkey
> >>> /bin/sh: line 1:   515 Segmentation fault
> >>> LD_LIBRARY_PATH=/home/rpjday/oe/angstrom-dev/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1:
> >>> CC='ccache gcc -pthread' LDSHARED='ccache gcc -pthread -shared'
> >>> OPT='-DNDEBUG -g  -O3 -Wall -Wstrict-prototypes' ./python -E ./setup.py -q
> >>> build
> >>> make: *** [sharedmods] Error 139
> >>> FATAL: oe_runmake failed
> >>>
> >>>     that's it, that's the entire log file.  and it's entirely
> >>> reproducible.
> >>
> >> Well, your and my setups are the same :) Graeme is the the other F11 user and
> >> it is working for him :(
> >
> >    i'm not on F11 anymore, i'm effectively on F12 (fully-updated f12
> > beta).  i made the upgrade a couple days ago and that's when those
> > other packages broke.  hmmmm ... i really should have made that
> > chronological connection.
> >
> >    but after the upgrade, i did a full rebuild of everything and those
> > were the only packages to fail.  so, percentage-wise, that's not bad.
> 
> I'm on F11 fwiw.
> 
> I got this from gsb and a core file:
> 
> http://pastebin.ca/1669812
> 
> Philip

Can someone with this problem please run a python-native build with
http://tim.rpsys.net/python-debug.patch applied?

There should be some debug at the end of the do_compile log afterwards.
I see:

Looking in ncursesw for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in ncurses for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libncurses.so

and I'm guessing it finds ncursesw in /lib/lib64 for some people.

I also see some other worrying entries on my system :(

Cheers,

Richard




