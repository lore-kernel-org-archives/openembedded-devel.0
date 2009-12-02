Received: from mail-pz0-f188.google.com ([209.85.222.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1NFkfO-0007hC-SC
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 09:34:34 +0100
Received: by pzk26 with SMTP id 26so4047409pzk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Dec 2009 00:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=bENw1f9OYd89fepVdzkg+JUF5Dee0H8tioX29m5Enog=;
	b=MPUYrjj4TvQ3Ak3Lbhs6KDuiJZckFM2RGbyeTia2x6YkjwekV0lP5YHtwl7aoCr4SI
	gjGxdgDKWzUxAYr+RjJ6rWryHR2VXM/IldejcFOjOy1hINc+T6Dafmg3pio1FJOuGOkg
	Rn+OvVVHImEEBnFCQHqGdbby8AAWCQ1boklmo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=LbQOP/+R84dGlekh54P6piaA5hBo4XYYpwlsD4xg79WRpdvZEyNgAV7o9fOLGZpWjU
	Ui5S+k3E/l1KMs6F6K23VQa6b9zEkCkAAgIBatSve7iMSuCjfRAt1K1n+WO+WFHT7qfS
	s8AeJykBw2HuEWqlw3cXVNp3g3Hbx5Yb6/5cg=
MIME-Version: 1.0
Received: by 10.142.8.12 with SMTP id 12mr733979wfh.70.1259742774712; Wed, 02 
	Dec 2009 00:32:54 -0800 (PST)
Date: Wed, 2 Dec 2009 14:02:54 +0530
Message-ID: <ad82c8890912020032t44008a96m4fb5d477050adbf4@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.188
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: compilation error while building linphone
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
X-List-Received-Date: Wed, 02 Dec 2009 08:34:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks for the help .I solved all the dependency problems.now i can atleast
build.
Now I am getting build error for linphone as follows:

vivek@vivek-desktop:~/development/em-x270/stuff/build$ bitbake linphone
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to
increase performance.
NOTE: Handling BitBake files: \ (7635/7635) [100 %]
NOTE: Parsing finished. 7024 cached, 301 parsed, 310 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 21 of 656 (ID: 201,
/home/vivek/development/em-x270/stuff//openembedded/recipes/coreutils/
coreutils-native_7.2.bb, do_unpack)
NOTE: Running task 30 of 656 (ID: 331,
/home/vivek/development/em-x270/stuff//openembedded/recipes/m4/
m4-native_1.4.12.bb, do_fetch)
NOTE: Running task 45 of 656 (ID: 527,
/home/vivek/development/em-x270/stuff//openembedded/recipes/gettext/
gettext-native_0.17.bb, do_unpack)
NOTE: Running task 57 of 656 (ID: 410,
/home/vivek/development/em-x270/stuff//openembedded/recipes/mpfr/
mpfr-native_2.3.1.bb, do_unpack)
NOTE: Unpacking ../bitbake-downloads/coreutils-7.2.tar.gz to
oetmp/work/i686-linux/coreutils-native-7.2-r0/
NOTE: Unpacking ../bitbake-downloads/mpfr-2.3.1.tar.bz2 to
oetmp/work/i686-linux/mpfr-native-2.3.1-r0/
NOTE: Unpacking ../bitbake-downloads/gettext-0.17.tar.gz to
oetmp/work/i686-linux/gettext-native-0.17-r4/
NOTE: The MD5Sums did not match. Wanted: '0499a958a561781b125c740f18061ea8'
and Got: '6b459ba67d4ec47f106335ab741174c2'
NOTE: Task failed: Checksum of 'ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz'
failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vivek/development/em-x270/stuff//openembedded/recipes/m4/
m4-native_1.4.12.bb do_fetch failed
NOTE: Running task 58 of 656 (ID: 382,
/home/vivek/development/em-x270/stuff//openembedded/recipes/binutils/
binutils-cross_2.18.bb, do_setscene)
ERROR: Task 331
(/home/vivek/development/em-x270/stuff//openembedded/recipes/m4/
m4-native_1.4.12.bb, do_fetch) failed
NOTE: Waiting for 3 active tasks to finish
NOTE: 1:
/home/vivek/development/em-x270/stuff//openembedded/recipes/gettext/
gettext-native_0.17.bb, do_unpack (32401)
NOTE: 2:
/home/vivek/development/em-x270/stuff//openembedded/recipes/binutils/
binutils-cross_2.18.bb, do_setscene (32412)
NOTE: 3:
/home/vivek/development/em-x270/stuff//openembedded/recipes/coreutils/
coreutils-native_7.2.bb, do_unpack (32399)
NOTE: Unpacking ../openembedded/recipes/coreutils/coreutils-7.2/onceonly.m4
to oetmp/work/i686-linux/coreutils-native-7.2-r0/
NOTE: Waiting for 2 active tasks to finish
NOTE: 1:
/home/vivek/development/em-x270/stuff//openembedded/recipes/gettext/
gettext-native_0.17.bb, do_unpack (32401)
NOTE: 2:
/home/vivek/development/em-x270/stuff//openembedded/recipes/coreutils/
coreutils-native_7.2.bb, do_unpack (32399)
NOTE: Waiting for 1 active tasks to finish
NOTE: 1:
/home/vivek/development/em-x270/stuff//openembedded/recipes/coreutils/
coreutils-native_7.2.bb, do_unpack (32399)
NOTE: Tasks Summary: Attempted 54 tasks of which 53 didn't need to be rerun
and 1 failed.
*ERROR: '/home/vivek/development/em-x270/stuff//openembedded/recipes/m4/
m4-native_1.4.12.bb' failed

Regards
vivek tambakad
*

On Tue, Dec 1, 2009 at 11:46 PM, <
openembedded-devel-request@lists.openembedded.org> wrote:

> Send Openembedded-devel mailing list submissions to
>        openembedded-devel@lists.openembedded.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> or, via email, send a message with subject or body 'help' to
>        openembedded-devel-request@lists.openembedded.org
>
> You can reach the person managing the list at
>        openembedded-devel-owner@lists.openembedded.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Openembedded-devel digest..."
>
>
> Today's Topics:
>
>   1. Re: Error while running bibake (Phil Blundell)
>   2. Re: Error while running bibake (Graeme Gregory)
>   3. compiling linphone using openembedded (vivek tambakad)
>   4. Re: compiling linphone using openembedded (Sebastian Spaeth)
>   5. Re: compiling linphone using openembedded (Dr. Michael Lauer)
>   6. [STABLE][PATCH 2/3] xserver-xorg-conf: added BUG support
>      (Marcin Juszkiewicz)
>   7. [STABLE][PATCH 1/3] bug: ship SDIO firmware for WiFi
>      (Marcin Juszkiewicz)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 01 Dec 2009 10:59:54 +0000
> From: Phil Blundell <pb@reciva.com>
> Subject: Re: [oe] Error while running bibake
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <1259665194.4332.317.camel@mill.internal.reciva.com>
> Content-Type: text/plain
>
> On Tue, 2009-12-01 at 05:45 -0500, Robert P. J. Day wrote:
> >   if you feel that strongly about it, why not just have bitbake refuse
> > to run as root?  seems like a simple solution.
>
> sanity.bbclass does already include a check for non-root:
>
>        if 0 == os.getuid():
>                raise_sanity_error("Do not use Bitbake as root.")
>
> I think that ought to be sufficient.  Folks who override the sanity
> checking do so at their own risk.
>
> p.
>
>
>
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 1 Dec 2009 11:10:29 +0000
> From: Graeme Gregory <dp@xora.org.uk>
> Subject: Re: [oe] Error while running bibake
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <20091201111029.GD4345@xora.vm.bytemark.co.uk>
> Content-Type: text/plain; charset=iso-8859-1
>
> On Tue, Dec 01, 2009 at 05:45:36AM -0500, Robert P. J. Day wrote:
> > On Tue, 1 Dec 2009, Graeme Gregory wrote:
> >
> > > On Tue, Dec 01, 2009 at 11:29:46AM +0100, Frans Meulenbroeks wrote:
> > > > 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > > > > hi
> > > > > I want cross compile linphone for compulab EM-x270 board.when i try
> > > > > ? sudo bitbake -b
> > > > > /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > > > > linphone_3.1.0.bb
> > > > > ? ?then i will get the following error
> > > > > ? *bb.parse.ParseError: Could not inherit file
> classes/autotools.bbclass
> > > > > *
> > > > > ? ?pleasse guide me in compiling linphone for compulab board.
> > > >
> > > > first remark:
> > > > there is no need to run bitbake as root.
> > > >
> > > Rephrase that.
> > >
> > > DONT RUN BITBAKE AS ROOT!!!!!!!!!
> > >
> > > That way will only lead to your host machine having bits of its
> > > filesystem replaced/deleted. OE relies on sandboxing the build as a
> > > non priviledged user.
> >
> >   if you feel that strongly about it, why not just have bitbake refuse
> > to run as root?  seems like a simple solution.
> >
> You mean like
>
>        if 0 == os.getuid():
>                raise_sanity_error("Do not use Bitbake as root.")
>
>
> Terminal stupidity is not really my problem, people will learn when
> they need to rebuild their build machines from scratch.
>
> Graeme
>
>
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 1 Dec 2009 17:32:36 +0530
> From: vivek tambakad <vivektambakad@gmail.com>
> Subject: [oe] compiling linphone using openembedded
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
>        <ad82c8890912010402p6defc358rd7c353f92c6b2fa9@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
> Now i login as a user. I exported following paths
>
> export OEBASE=/home/development/em-x270/stuff
> export PATH=$OEBASE/bitbake/bin:$PATH
> export BBPATH=$OEBASE/build:$OEBASE/openembedded
> export BB_ENV_EXTRAWHITE="OEBASE"
>
> and set CACHE variable in usr/share/bitbake/conf/bitbake.conf as
>
> CACHE = "/home/development/em-x270/stuff/build/tmp"
>
> when i compile "bitbake linphone" i get following error
>
> [vivek@primary build]$ bitbake linphone
> Traceback (most recent call last):
>  File "/home/development/em-x270/stuff/bitbake/bin/bitbake", line 143, in
> <module>
>    main()
>  File "/home/development/em-x270/stuff/bitbake/bin/bitbake", line 123, in
> main
>    cooker.parseConfiguration()
>  File "/home/development/em-x270/stuff/bitbake/lib/bb/cooker.py", line 68,
> in parseConfiguration
>    self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
>  File "/home/development/em-x270/stuff/bitbake/lib/bb/cooker.py", line 402,
> in parseConfigurationFile
>    bb.fetch.fetcher_init(self.configuration.data)
>  File "/home/development/em-x270/stuff/bitbake/lib/bb/fetch/__init__.py",
> line 93, in fetcher_init
>    pd = persist_data.PersistData(d)
>  File "/home/development/em-x270/stuff/bitbake/lib/bb/persist_data.py",
> line 52, in __init__
>    bb.mkdirhier(self.cachedir)
>  File "/home/development/em-x270/stuff/bitbake/lib/bb/__init__.py", line
> 138, in mkdirhier
>    if e.errno != 17: raise e
> *OSError: [Errno 13] Permission denied:
> '/home/development/em-x270/stuff/build/tmp'
>
> with regards
>  vivek tambakad
> *
>
> On Tue, Dec 1, 2009 at 4:30 PM, <
> openembedded-devel-request@lists.openembedded.org> wrote:
>
> > Send Openembedded-devel mailing list submissions to
> >        openembedded-devel@lists.openembedded.org
> >
> > To subscribe or unsubscribe via the World Wide Web, visit
> >
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> > or, via email, send a message with subject or body 'help' to
> >        openembedded-devel-request@lists.openembedded.org
> >
> > You can reach the person managing the list at
> >        openembedded-devel-owner@lists.openembedded.org
> >
> > When replying, please edit your Subject line so it is more specific
> > than "Re: Contents of Openembedded-devel digest..."
> >
> >
> > Today's Topics:
> >
> >   1. Re: Error while running bibake (Frans Meulenbroeks)
> >   2. Re: Error while running bibake (Marcin Juszkiewicz)
> >   3. Re: Error while running bibake (Dr. Michael Lauer)
> >   4. Re: Error while running bibake (Graeme Gregory)
> >   5. Re: Error while running bibake (Robert P. J. Day)
> >
> >
> > ----------------------------------------------------------------------
> >
> > Message: 1
> > Date: Tue, 1 Dec 2009 11:29:46 +0100
> > From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> > Subject: Re: [oe] Error while running bibake
> > To: openembedded-devel@lists.openembedded.org
> > Message-ID:
> >        <ac9c93b10912010229g2b53c52fw671178a33c644114@mail.gmail.com>
> > Content-Type: text/plain; charset=ISO-8859-1
> >
> > 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > > hi
> > > I want cross compile linphone for compulab EM-x270 board.when i try
> > > ? sudo bitbake -b
> > > /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > > linphone_3.1.0.bb
> > > ? ?then i will get the following error
> > > ? *bb.parse.ParseError: Could not inherit file
> classes/autotools.bbclass
> > > *
> > > ? ?pleasse guide me in compiling linphone for compulab board.
> >
> > first remark:
> > there is no need to run bitbake as root.
> >
> > 2nd thing you could check is if the file exists in your tree and if so
> > if your path is set properly.
> >
> > FM
> >
> >
> >
> > ------------------------------
> >
> > Message: 2
> > Date: Tue, 1 Dec 2009 11:35:07 +0100
> > From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> > Subject: Re: [oe] Error while running bibake
> > To: openembedded-devel@lists.openembedded.org
> > Message-ID: <200912011135.08560.marcin@juszkiewicz.com.pl>
> > Content-Type: Text/Plain;  charset="utf-8"
> >
> > Dnia wtorek, 1 grudnia 2009 o 11:29:46 Frans Meulenbroeks napisa?(a):
> > > 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > > > hi
> > > > I want cross compile linphone for compulab EM-x270 board.when i try
> > > >   sudo bitbake -b
> > > > /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > > > linphone_3.1.0.bb
> > > >    then i will get the following error
> > > >   *bb.parse.ParseError: Could not inherit file
> > classes/autotools.bbclass
> > > > *
> > > >    pleasse guide me in compiling linphone for compulab board.
> > >
> > > first remark:
> > > there is no need to run bitbake as root.
> > >
> > > 2nd thing you could check is if the file exists in your tree and if so
> > > if your path is set properly.
> >
> > 3rd: do not use "bitbake -b" command but "bitbake" because "-b" expands
> to
> > "--be-not-nice-to-me-and-do-not-build-dependencies".
> >
> > Regards,
> > --
> > JID:      hrw@jabber.org
> > Website:  http://marcin.juszkiewicz.com.pl/
> > LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
> >
> >
> >
> >
> >
> > ------------------------------
> >
> > Message: 3
> > Date: Tue, 1 Dec 2009 11:36:11 +0100
> > From: "Dr. Michael Lauer" <mickey@vanille-media.de>
> > Subject: Re: [oe] Error while running bibake
> > To: openembedded-devel@lists.openembedded.org
> > Message-ID: <F99B6DBE-77CA-4CC6-8A46-D8A0908084C4@vanille-media.de>
> > Content-Type: text/plain; charset=us-ascii
> >
> >
> > Am 01.12.2009 um 11:29 schrieb Frans Meulenbroeks:
> >
> > > 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > >> hi
> > >> I want cross compile linphone for compulab EM-x270 board.when i try
> > >>   sudo bitbake -b
> > >> /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > >> linphone_3.1.0.bb
> > >>    then i will get the following error
> > >>   *bb.parse.ParseError: Could not inherit file
> classes/autotools.bbclass
> > >> *
> > >>    pleasse guide me in compiling linphone for compulab board.
> > >
> > > first remark:
> > > there is no need to run bitbake as root.
> > >
> > > 2nd thing you could check is if the file exists in your tree and if so
> > > if your path is set properly.
> >
> > More remarks:
> >
> > 1. Don't use -b unless you really know what you are doing, better use
> > 'bitbake linphone'.
> > 2. Check whether BBPATH is correctly set (pointing to your conf files).
> >
> > :M:
> >
> >
> > ------------------------------
> >
> > Message: 4
> > Date: Tue, 1 Dec 2009 10:39:17 +0000
> > From: Graeme Gregory <dp@xora.org.uk>
> > Subject: Re: [oe] Error while running bibake
> > To: openembedded-devel@lists.openembedded.org
> > Message-ID: <20091201103917.GC4345@xora.vm.bytemark.co.uk>
> > Content-Type: text/plain; charset=iso-8859-1
> >
> > On Tue, Dec 01, 2009 at 11:29:46AM +0100, Frans Meulenbroeks wrote:
> > > 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > > > hi
> > > > I want cross compile linphone for compulab EM-x270 board.when i try
> > > > ? sudo bitbake -b
> > > > /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > > > linphone_3.1.0.bb
> > > > ? ?then i will get the following error
> > > > ? *bb.parse.ParseError: Could not inherit file
> > classes/autotools.bbclass
> > > > *
> > > > ? ?pleasse guide me in compiling linphone for compulab board.
> > >
> > > first remark:
> > > there is no need to run bitbake as root.
> > >
> > Rephrase that.
> >
> > DONT RUN BITBAKE AS ROOT!!!!!!!!!
> >
> > That way will only lead to your host machine having bits of its
> filesystem
> > replaced/deleted. OE relies on sandboxing the build as a non priviledged
> > user.
> >
> > Graeme
> >
> >
> >
> >
> > ------------------------------
> >
> > Message: 5
> > Date: Tue, 1 Dec 2009 05:45:36 -0500 (EST)
> > From: "Robert P. J. Day" <rpjday@crashcourse.ca>
> > Subject: Re: [oe] Error while running bibake
> > To: openembedded-devel@lists.openembedded.org
> > Message-ID: <alpine.LFD.2.00.0912010544560.8109@localhost>
> > Content-Type: text/plain; charset="iso-8859-1"
> >
> > On Tue, 1 Dec 2009, Graeme Gregory wrote:
> >
> > > On Tue, Dec 01, 2009 at 11:29:46AM +0100, Frans Meulenbroeks wrote:
> > > > 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > > > > hi
> > > > > I want cross compile linphone for compulab EM-x270 board.when i try
> > > > > ? sudo bitbake -b
> > > > > /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > > > > linphone_3.1.0.bb
> > > > > ? ?then i will get the following error
> > > > > ? *bb.parse.ParseError: Could not inherit file
> > classes/autotools.bbclass
> > > > > *
> > > > > ? ?pleasse guide me in compiling linphone for compulab board.
> > > >
> > > > first remark:
> > > > there is no need to run bitbake as root.
> > > >
> > > Rephrase that.
> > >
> > > DONT RUN BITBAKE AS ROOT!!!!!!!!!
> > >
> > > That way will only lead to your host machine having bits of its
> > > filesystem replaced/deleted. OE relies on sandboxing the build as a
> > > non priviledged user.
> >
> >  if you feel that strongly about it, why not just have bitbake refuse
> > to run as root?  seems like a simple solution.
> >
> > rday
> > --
> >
> > ========================================================================
> > Robert P. J. Day                               Waterloo, Ontario, CANADA
> >
> >            Linux Consulting, Training and Kernel Pedantry.
> >
> > Web page:                                          http://crashcourse.ca
> > Twitter:                                       http://twitter.com/rpjday
> > ========================================================================
> >
> > ------------------------------
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> > End of Openembedded-devel Digest, Vol 41, Issue 2
> > *************************************************
> >
>
>
> ------------------------------
>
> Message: 4
> Date: Tue, 01 Dec 2009 13:09:09 +0100
> From: Sebastian Spaeth <Sebastian@SSpaeth.de>
> Subject: Re: [oe] compiling linphone using openembedded
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <4B150765.8030403@SSpaeth.de>
> Content-Type: text/plain; charset=ISO-8859-1
>
> vivek tambakad wrote:
> > *OSError: [Errno 13] Permission denied:
> > '/home/development/em-x270/stuff/build/tmp'
>
> Well, you have previously stuff put there as root and now as user you
> don't have permission to modify it. Surprised?
>
> Delete your tmp dir (or make all files being owned by the user).
>
> spaetz
>
>
>
> ------------------------------
>
> Message: 5
> Date: Tue, 1 Dec 2009 13:21:27 +0100
> From: "Dr. Michael Lauer" <mickey@vanille-media.de>
> Subject: Re: [oe] compiling linphone using openembedded
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <A689A171-1453-4B10-AC0A-484E018DBF21@vanille-media.de>
> Content-Type: text/plain; charset=us-ascii
>
> > Now i login as a user. I exported following paths
> >
> > export OEBASE=/home/development/em-x270/stuff
> > export PATH=$OEBASE/bitbake/bin:$PATH
> > export BBPATH=$OEBASE/build:$OEBASE/openembedded
> > export BB_ENV_EXTRAWHITE="OEBASE"
> >
> > and set CACHE variable in usr/share/bitbake/conf/bitbake.conf as
> >
> > CACHE = "/home/development/em-x270/stuff/build/tmp"
> >
> > when i compile "bitbake linphone" i get following error
> >
> > [vivek@primary build]$ bitbake linphone
> > Traceback (most recent call last):
> >  File "/home/development/em-x270/stuff/bitbake/bin/bitbake", line 143, in
> > <module>
> >    main()
> >  File "/home/development/em-x270/stuff/bitbake/bin/bitbake", line 123, in
> > main
> >    cooker.parseConfiguration()
> >  File "/home/development/em-x270/stuff/bitbake/lib/bb/cooker.py", line
> 68,
> > in parseConfiguration
> >    self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
> >  File "/home/development/em-x270/stuff/bitbake/lib/bb/cooker.py", line
> 402,
> > in parseConfigurationFile
> >    bb.fetch.fetcher_init(self.configuration.data)
> >  File "/home/development/em-x270/stuff/bitbake/lib/bb/fetch/__init__.py",
> > line 93, in fetcher_init
> >    pd = persist_data.PersistData(d)
> >  File "/home/development/em-x270/stuff/bitbake/lib/bb/persist_data.py",
> > line 52, in __init__
> >    bb.mkdirhier(self.cachedir)
> >  File "/home/development/em-x270/stuff/bitbake/lib/bb/__init__.py", line
> > 138, in mkdirhier
> >    if e.errno != 17: raise e
> > *OSError: [Errno 13] Permission denied:
> > '/home/development/em-x270/stuff/build/tmp'
>
> Sounds like your previous building with root messed up permissions. Use
> chmod/chown to correct.
>
> :M:
>
>
>
>
> ------------------------------
>
> Message: 6
> Date: Tue,  1 Dec 2009 19:14:53 +0100
> From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> Subject: [oe] [STABLE][PATCH 2/3] xserver-xorg-conf: added BUG support
> To: openembedded-devel@lists.openembedded.org
> Cc: Marcin Juszkiewicz <marcin@buglabs.net>
> Message-ID:
>        <1259691294-1131-2-git-send-email-marcin@juszkiewicz.com.pl>
>
> From: Marcin Juszkiewicz <marcin@buglabs.net>
>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  .../xorg-xserver/xserver-xorg-conf/bug/xorg.conf   |   65
> ++++++++++++++++++++
>  recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
>  2 files changed, 66 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/bug/xorg.conf
>
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/bug/xorg.conf
> b/recipes/xorg-xserver/xserver-xorg-conf/bug/xorg.conf
> new file mode 100644
> index 0000000..8b6cd94
> --- /dev/null
> +++ b/recipes/xorg-xserver/xserver-xorg-conf/bug/xorg.conf
> @@ -0,0 +1,65 @@
> +#
> +# Initial version of X11 configuration for BugLabs BUG device.
> +#
> +# Up to 2 LCD modules are supported (as DISPLAY=0.0/0.1).
> +# Touchscreen on first screen works properly (req tslib 0.0.6 driver).
> +#
> +# By default software starts on 0.0 only.
> +#
> +
> +Section "Monitor"
> +        Identifier      "Monitor 1"
> +EndSection
> +
> +Section "Monitor"
> +        Identifier      "Monitor 2"
> +EndSection
> +
> +Section "Device"
> +        Identifier      "fbdev Device 2"
> +        Driver  "fbdev"
> +       Option "fbdev" "/dev/fb2"
> +       Option "shadowfb" "true"
> +EndSection
> +
> +Section "Device"
> +        Identifier      "fbdev Device 1"
> +        Driver  "fbdev"
> +       Option "fbdev" "/dev/fb1"
> +       Option "shadowfb" "true"
> +EndSection
> +
> +Section "Screen"
> +        Identifier      "fbdev Screen 2"
> +        Device  "fbdev Device 2"
> +        Monitor "Monitor 2"
> +EndSection
> +
> +Section "Screen"
> +        Identifier      "fbdev Screen 1"
> +        Device  "fbdev Device 1"
> +        Monitor "Monitor 1"
> +EndSection
> +
> +Section "ServerLayout"
> +        Identifier      "Layout"
> +        Screen  "fbdev Screen 1"
> +        Screen  "fbdev Screen 2" Below "fbdev Screen 1"
> +       InputDevice "ts4" "CorePointer"
> +EndSection
> +
> +Section "InputDevice"
> +    Identifier "ts5"
> +    Driver "tslib"
> +    Option "Device" "/dev/input/bmi_lcd_ts5"
> +EndSection
> +
> +Section "InputDevice"
> +    Identifier "ts4"
> +    Driver "tslib"
> +    Option "Device" "/dev/input/bmi_lcd_ts4"
> +EndSection
> +
> +Section "ServerFlags"
> +       Option "AutoAddDevices" "false"
> +EndSection
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bbb/recipes/xorg-xserver/
> xserver-xorg-conf_0.1.bb
> index 95aa82b..67fc683 100644
> --- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> +++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Machine specific xorg.conf files"
> -PR = "r4"
> +PR = "r5"
>
>  SRC_URI = "file://xorg.conf"
>
> --
> 1.6.5.2
>
>
>
>
>
>
> ------------------------------
>
> Message: 7
> Date: Tue,  1 Dec 2009 19:14:52 +0100
> From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> Subject: [oe] [STABLE][PATCH 1/3] bug: ship SDIO firmware for WiFi
> To: openembedded-devel@lists.openembedded.org
> Cc: Marcin Juszkiewicz <marcin@buglabs.net>
> Message-ID:
>        <1259691294-1131-1-git-send-email-marcin@juszkiewicz.com.pl>
>
> From: Marcin Juszkiewicz <marcin@buglabs.net>
>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  conf/machine/bug.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/machine/bug.conf b/conf/machine/bug.conf
> index cec3d5b..3e0389a 100644
> --- a/conf/machine/bug.conf
> +++ b/conf/machine/bug.conf
> @@ -3,7 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the BUG base unit.
>  TARGET_ARCH = "arm"
>
> -MACHINE_EXTRA_RRECOMMENDS = "marvell-gspi-fw"
> +MACHINE_EXTRA_RRECOMMENDS = "marvell-gspi-fw marvell-sdio-fw"
>  PREFERRED_PROVIDER_virtual/kernel = "linux-bug"
>
>  MACHINE_FEATURES = "kernel26 screen touchscreen hotplug alsa wifi usbhost
> usbgadget"
> --
> 1.6.5.2
>
>
>
>
>
>
> ------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> End of Openembedded-devel Digest, Vol 41, Issue 3
> *************************************************
>

