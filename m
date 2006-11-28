Received: from [66.249.82.233] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <smarts40@gmail.com>) id 1Gp5w8-0006Er-P3
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Nov 2006 17:36:01 +0100
Received: by wx-out-0506.google.com with SMTP id t14so2031286wxc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2006 08:35:47 -0800 (PST)
Received: by 10.70.11.5 with SMTP id 5mr1966378wxk.1164731746543;
	Tue, 28 Nov 2006 08:35:46 -0800 (PST)
Received: by 10.70.72.19 with HTTP; Tue, 28 Nov 2006 08:35:46 -0800 (PST)
Message-ID: <d35f8e370611280835k4131b343mcd6fce8f19145af0@mail.gmail.com>
Date: Tue, 28 Nov 2006 11:35:46 -0500
From: "ryan m" <smarts40@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d35f8e370611270945m476ce62ajd984a10b88a377e@mail.gmail.com>
MIME-Version: 1.0
References: <d35f8e370611231002y55670b94pdf874232ed520003@mail.gmail.com>
	<3B660B4ACB06BE488E3938F95115E4DE01552823@IMCSRV4.MITRE.ORG>
	<d35f8e370611270849p753bd86cm317c67adac205405@mail.gmail.com>
	<051E8FA4-9EF9-4EB1-A90A-7DA376E65664@cs.berkeley.edu>
	<d35f8e370611270945m476ce62ajd984a10b88a377e@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: Mooi Choo Chuah <mcchuah@gmail.com>
Subject: [dtn-users] DTN on Gumstix
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
X-List-Received-Date: Tue, 28 Nov 2006 16:36:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The summery of my set-up
I've download the premade oe setup from:
http://ewi546.ewi.utwente.nl/mirror/www.openzaurus.org/official/unstable/3.5.4/sdk/
I cross compiled static tcl 8.4 and berkeleydb from source
now I'm trying to compile dtn from dtnrg.org and the configure script is
dieing on testing the tcllib ... config.log is below with the actual error.

the main error is:
multiple definition of `strtoul'

details are below of what I've gone through so far

---------- Forwarded message ----------
From: ryan m <smarts40@gmail.com>
Date: Nov 27, 2006 12:45 PM
Subject: Re: [dtn-users] DTN on Gumstix
To: dtn-users@mailman.dtnrg.org

 configure:6523: checking for tcl library in /opt/arm-linux-libraries/lib: -
ltcl8.4 -ldl -lm -lpthread
configure:6551: arm-linux-gcc -o conftest -g -O2
-I/opt/arm-linux-libraries/include  -static -L/opt/arm-l
inux-libraries/lib conftest.c -ltcl8.4 -ldl -lm -lpthread  >&5
/usr/local/arm/oe/lib/gcc/arm-linux/3.4.4/../../../../arm-linux/lib/libc.a(
strtoul.o)(.text+0x0): In funct
ion `strtoul':
: multiple definition of `strtoul'
/opt/arm-linux-libraries/lib/libtcl8.4.a( strtoul.o)(.text+0x0): first
defined here
/usr/local/arm/oe/lib/gcc/arm-linux/3.4.4/../../../../arm-linux/bin/ld:
Warning: size of symbol `strtoul'
changed from 572 in /opt/arm-linux-libraries/lib/libtcl8.4.a(strtoul.o ) to
96 in /opt/arm-linux-libraries/
lib/libtcl8.4.a(strtoul.o)
/opt/arm-linux-libraries/lib/libtcl8.4.a(tclUnixCompat.o)(.text+0xc): In
function `TclpGetGrGid':
: warning: Using 'getgrgid' in statically linked applications requires at
runtime the shared libraries fro
m the glibc version used for linking
/opt/arm-linux-libraries/lib/libtcl8.4.a(tclUnixCompat.o)(.text+0x8): In
function `TclpGetGrNam':
: warning: Using 'getgrnam' in statically linked applications requires at
runtime the shared libraries fro
m the glibc version used for linking
/opt/arm-linux-libraries/lib/libtcl8.4.a(tclUnixFCmd.o)(.text+0xc44): In
function `GetGroupAttribute':
: warning: Using 'endgrent' in statically linked applications requires at
runtime the shared libraries fro
m the glibc version used for linking
/opt/arm-linux-libraries/lib/libtcl8.4.a(tclUnixFile.o)(.text+0x568): In
function `TclpGetUserHome':
: warning: Using 'getpwnam' in statically linked applications requires at
runtime the shared libraries fro
m the glibc version used for linking
/opt/arm-linux-libraries/lib/libtcl8.4.a(tclUnixCompat.o)(.text+0x4): In
function `TclpGetPwUid':
: warning: Using 'getpwuid' in statically linked applications requires at
runtime the shared libraries fro
m the glibc version used for linking
/opt/arm-linux-libraries/lib/libtcl8.4.a(tclUnixFCmd.o)(.text+0xd14): In
function `$a':
: warning: Using 'endpwent' in statically linked applications requires at
runtime the shared libraries fro
m the glibc version used for linking
/opt/arm-linux-libraries/lib/libtcl8.4.a(tclUnixCompat.o)(.text+0x14): In
function `TclpGetHostByAddr':
: warning: Using 'gethostbyaddr' in statically linked applications requires
at runtime the shared librarie
s from the glibc version used for linking
/opt/arm-linux-libraries/lib/libtcl8.4.a(tclUnixCompat.o)(.text+0x10): In
function `TclpGetHostByName':
: warning: Using 'gethostbyname' in statically linked applications requires
at runtime the shared librarie
s from the glibc version used for linking
/opt/arm-linux-libraries/lib/libtcl8.4.a(tclIOSock.o)(.text+0x48): In
function `TclSockGetPort':
: warning: Using 'getservbyname' in statically linked applications requires
at runtime the shared librarie
s from the glibc version used for linking
collect2: ld returned 1 exit status

any idea how to fix this?

On 11/27/06, Michael Demmer < demmer@cs.berkeley.edu> wrote:
>
> It will likely be helpful to look in the config.log file to find out
> exactly what's going wrong when configure fails its tests. It's a lot of
> output to wade through, but you should be able to find the gcc output from
> the failing linking step(s).
> -mike
>
>
>
> On Nov 27, 2006, at 8:49 AM, ryan m wrote:
>
> I think I'm running into what you ran into, I running
>
> ./configure --build=`uname -m` --host=arm-linux
> --with-db=/opt/arm-linux-libraries  --with-tcl=/opt/arm-linux-libraries
> --enable-static
>
> I've also tried added --without-tclreadline since that's been suggested a
> few times to cause linking issues, but both ways I get the following
> configure error:
>
> configure: checking for tcl installation (version 8.4)
> checking for tcl.h (version 8.4) in /opt/arm-linux-libraries/include...
> yes
> checking for tcl library in /opt/arm-linux-libraries/lib: -ltcl8.4 -ldl
> -lm -lpthread ... no
> checking for tcl library in /opt/arm-linux-libraries/lib: -ltcl84 -ldl -lm
> -lpthread ... no
> checking for tcl library in /opt/arm-linux-libraries/lib: -ltcl -ldl -lm
> -lpthread ... no
>
> the static tcl stuff is in there:
>
> root@runabout:/opt/arm-linux-libraries/lib# ls -l
> total 4824
> -rw-r--r-- 1 edifyteam edifyteam 1426564 2006-11-27 11:29 libdb-4.4.a
> -rw-r--r-- 1 edifyteam edifyteam     820 2006-11-27 11:12 libdb-4.4.la
> -rwxr-xr-x 1 edifyteam edifyteam  975701 2006-11-27 11:12 libdb-4.4.so
> lrwxrwxrwx 1 root      root           12 2006-11-27 11:29 libdb-4.so ->
> libdb-4.4.so
> -rw-r--r-- 1 edifyteam edifyteam 1426564 2006-11-27 11:29 libdb.a
> lrwxrwxrwx 1 root      root           12 2006-11-27 11:29 libdb.so ->
> libdb-4.4.so
> -r-xr-xr-x 1 root      root      1058426 2006-11-27 11:32 libtcl8.4.a
> -rw-r--r-- 1 root      root         7126 2006-11-27 11:32 libtclstub8.4.a
> drwxr-xr-x 8 root      root         4096 2006-11-27 11:32 tcl8.4
> -rw-r--r-- 1 root      root         7224 2006-11-27 11:32 tclConfig.sh
>
> so I was looking at rules.make and I wasn't sure were to add a -L
> directive since
>
> LDFLAGS         =   -L/opt/arm-linux-libraries/lib
> -L/opt/arm-linux-libraries/lib
>
> is already in there
>
> note: I'm trying the openembedded system which openzaurus team uses for
> development, i figured I try something that is set up specifically with for
> the zaurus after my brush with scrachbox producing incompatible binaries
> (hello world app wasn't even recognized as an executable binary by the
> zaurus), anyways I had to do static since this system doesn't have the
> libraries for linking dynamic libraries (at least according to DTN2's
> configure), perhaps there's a reason for this on the zaurus?
>
> On 11/23/06, Durst, Robert C. <durst@mitre.org > wrote:
> >
> >  Hey,
> >
> > I used the gumstix (www.gumstix.com ) version of buildroot (
> > http://docwiki.gumstix.org/Buildroot).  I saw your earlier message, and
> > wondered if there might be a problem with floating point emulation in your
> > environment.  I tried scratchbox earlier, and didn't really like it.
> > Buildroot has been much cleaner for me ( http://buildroot.uclibc.org/buildroot.html
> > ).  There are some gumstix-relevant patches, don't know if the zaurus
> > would require patching also.  Buildroot might be worth a look.
> >
> > BTW -- I had problems linking with the tcl library (not internal to tcl,
> > but having DTN *find* the tcl library).  I ended up creating a separate
> > directory, dragging the tcl stuff into it, and putting a -L directive into
> > the Rules.make to point to it.  Haven't figured out or fixed what the
> > foul up was there.
> >
> > Hope you're having a Happy Thanksgiving.
> > Bob
> >
> >  ------------------------------
> > *From:* ryan m [mailto:smarts40@gmail.com ]
> > *Sent:* Thursday, November 23, 2006 1:02 PM
> > *To:* Durst, Robert C.
> > *Subject:* Re: [dtn-users] DTN on Gumstix
> >
> > I was just wondering what cross compile environment you used, are there
> > directions online on how to set it up?  That's the big problem I'm running
> > into now.  I've tried scratchbox but it doesn't seem to want to find ieee
> > lib when I try to compile tcl.  Any help you could offer would be greatly
> > appreciated.
> >
> > thank you,
> > ryan
> >
> > On 11/23/06, Durst, Robert C. < durst@mitre.org> wrote:
> > >
> > >  Hi, all.  I just wanted to let folks know that I managed to get DTN
> > > running on the Gumstix (cx) platform.  It took some minor gyrations, and I
> > > had a problem that caused me to use the file db instead of berkeley db.
> > > (Further banging my head against the wall might have caused berkeleydb to
> > > relent, but my head was sore enough already.)  Have successfully run dtnping
> > > and dtnsend with static routing (all I need in this application).
> > >
> > > Most of the hassle was in getting the cross-compilation set up
> > > properly and getting libraries pointed to appropriately.  I'll try to
> > > summarize things (unless somebody else already has and I didn't notice) in
> > > the coming days/weeks.  Have some other things to do first.
> > >
> > > Regards,
> > > Bob Durst
> > >
> >
> >
>
>

