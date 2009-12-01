Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1NFRSl-00085P-TY
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 13:04:15 +0100
Received: by pzk30 with SMTP id 30so3434498pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 04:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=1XTdzJ1Gttqtx7KGNUGG4B1sTSoTdopvlB5LEISRtjA=;
	b=Vb6J5BOuGyaIzefOngRFpfTUy6QM3LF4l2hOctrDGV7R+L0Ld8ZwMedJwbTXkDABCw
	yQMNKLaaweyPT/YmKnpgV8d6lrkbhhJBotlEOPodgpKEOysJDyo8ryFvCn0DbzUwEeu5
	GJs2iYQ98Wf7bUHthKOY/tSLtfFF2c89iyOd0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=e9MhnWDz5QO1d9B0y35hLVmwcjYLN2Xf1QH3stGityQn4ejVFLqYeE+K943Zt2Kp96
	9fRkeMM3aGtGtBu8DoMDCyZIIwadAOzkke5w6ZEvZffH4KHi4qd0HKRe+XrwbD9ec3Lk
	xC4sWhQk+OntGhy/rPj42o/tEu9uVu+pKM4vY=
MIME-Version: 1.0
Received: by 10.142.1.14 with SMTP id 14mr169522wfa.73.1259668956419; Tue, 01 
	Dec 2009 04:02:36 -0800 (PST)
Date: Tue, 1 Dec 2009 17:32:36 +0530
Message-ID: <ad82c8890912010402p6defc358rd7c353f92c6b2fa9@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: compiling linphone using openembedded
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
X-List-Received-Date: Tue, 01 Dec 2009 12:04:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Now i login as a user. I exported following paths

export OEBASE=/home/development/em-x270/stuff
export PATH=$OEBASE/bitbake/bin:$PATH
export BBPATH=$OEBASE/build:$OEBASE/openembedded
export BB_ENV_EXTRAWHITE="OEBASE"

and set CACHE variable in usr/share/bitbake/conf/bitbake.conf as

CACHE = "/home/development/em-x270/stuff/build/tmp"

when i compile "bitbake linphone" i get following error

[vivek@primary build]$ bitbake linphone
Traceback (most recent call last):
  File "/home/development/em-x270/stuff/bitbake/bin/bitbake", line 143, in
<module>
    main()
  File "/home/development/em-x270/stuff/bitbake/bin/bitbake", line 123, in
main
    cooker.parseConfiguration()
  File "/home/development/em-x270/stuff/bitbake/lib/bb/cooker.py", line 68,
in parseConfiguration
    self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
  File "/home/development/em-x270/stuff/bitbake/lib/bb/cooker.py", line 402,
in parseConfigurationFile
    bb.fetch.fetcher_init(self.configuration.data)
  File "/home/development/em-x270/stuff/bitbake/lib/bb/fetch/__init__.py",
line 93, in fetcher_init
    pd = persist_data.PersistData(d)
  File "/home/development/em-x270/stuff/bitbake/lib/bb/persist_data.py",
line 52, in __init__
    bb.mkdirhier(self.cachedir)
  File "/home/development/em-x270/stuff/bitbake/lib/bb/__init__.py", line
138, in mkdirhier
    if e.errno != 17: raise e
*OSError: [Errno 13] Permission denied:
'/home/development/em-x270/stuff/build/tmp'

with regards
 vivek tambakad
*

On Tue, Dec 1, 2009 at 4:30 PM, <
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
>   1. Re: Error while running bibake (Frans Meulenbroeks)
>   2. Re: Error while running bibake (Marcin Juszkiewicz)
>   3. Re: Error while running bibake (Dr. Michael Lauer)
>   4. Re: Error while running bibake (Graeme Gregory)
>   5. Re: Error while running bibake (Robert P. J. Day)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 1 Dec 2009 11:29:46 +0100
> From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Subject: Re: [oe] Error while running bibake
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
>        <ac9c93b10912010229g2b53c52fw671178a33c644114@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
> 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > hi
> > I want cross compile linphone for compulab EM-x270 board.when i try
> > ? sudo bitbake -b
> > /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > linphone_3.1.0.bb
> > ? ?then i will get the following error
> > ? *bb.parse.ParseError: Could not inherit file classes/autotools.bbclass
> > *
> > ? ?pleasse guide me in compiling linphone for compulab board.
>
> first remark:
> there is no need to run bitbake as root.
>
> 2nd thing you could check is if the file exists in your tree and if so
> if your path is set properly.
>
> FM
>
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 1 Dec 2009 11:35:07 +0100
> From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> Subject: Re: [oe] Error while running bibake
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <200912011135.08560.marcin@juszkiewicz.com.pl>
> Content-Type: Text/Plain;  charset="utf-8"
>
> Dnia wtorek, 1 grudnia 2009 o 11:29:46 Frans Meulenbroeks napisa?(a):
> > 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > > hi
> > > I want cross compile linphone for compulab EM-x270 board.when i try
> > >   sudo bitbake -b
> > > /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > > linphone_3.1.0.bb
> > >    then i will get the following error
> > >   *bb.parse.ParseError: Could not inherit file
> classes/autotools.bbclass
> > > *
> > >    pleasse guide me in compiling linphone for compulab board.
> >
> > first remark:
> > there is no need to run bitbake as root.
> >
> > 2nd thing you could check is if the file exists in your tree and if so
> > if your path is set properly.
>
> 3rd: do not use "bitbake -b" command but "bitbake" because "-b" expands to
> "--be-not-nice-to-me-and-do-not-build-dependencies".
>
> Regards,
> --
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 1 Dec 2009 11:36:11 +0100
> From: "Dr. Michael Lauer" <mickey@vanille-media.de>
> Subject: Re: [oe] Error while running bibake
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <F99B6DBE-77CA-4CC6-8A46-D8A0908084C4@vanille-media.de>
> Content-Type: text/plain; charset=us-ascii
>
>
> Am 01.12.2009 um 11:29 schrieb Frans Meulenbroeks:
>
> > 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> >> hi
> >> I want cross compile linphone for compulab EM-x270 board.when i try
> >>   sudo bitbake -b
> >> /home/development/em-x270/stuff/openembedded/recipes/linphone/
> >> linphone_3.1.0.bb
> >>    then i will get the following error
> >>   *bb.parse.ParseError: Could not inherit file classes/autotools.bbclass
> >> *
> >>    pleasse guide me in compiling linphone for compulab board.
> >
> > first remark:
> > there is no need to run bitbake as root.
> >
> > 2nd thing you could check is if the file exists in your tree and if so
> > if your path is set properly.
>
> More remarks:
>
> 1. Don't use -b unless you really know what you are doing, better use
> 'bitbake linphone'.
> 2. Check whether BBPATH is correctly set (pointing to your conf files).
>
> :M:
>
>
> ------------------------------
>
> Message: 4
> Date: Tue, 1 Dec 2009 10:39:17 +0000
> From: Graeme Gregory <dp@xora.org.uk>
> Subject: Re: [oe] Error while running bibake
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <20091201103917.GC4345@xora.vm.bytemark.co.uk>
> Content-Type: text/plain; charset=iso-8859-1
>
> On Tue, Dec 01, 2009 at 11:29:46AM +0100, Frans Meulenbroeks wrote:
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
> Rephrase that.
>
> DONT RUN BITBAKE AS ROOT!!!!!!!!!
>
> That way will only lead to your host machine having bits of its filesystem
> replaced/deleted. OE relies on sandboxing the build as a non priviledged
> user.
>
> Graeme
>
>
>
>
> ------------------------------
>
> Message: 5
> Date: Tue, 1 Dec 2009 05:45:36 -0500 (EST)
> From: "Robert P. J. Day" <rpjday@crashcourse.ca>
> Subject: Re: [oe] Error while running bibake
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <alpine.LFD.2.00.0912010544560.8109@localhost>
> Content-Type: text/plain; charset="iso-8859-1"
>
> On Tue, 1 Dec 2009, Graeme Gregory wrote:
>
> > On Tue, Dec 01, 2009 at 11:29:46AM +0100, Frans Meulenbroeks wrote:
> > > 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > > > hi
> > > > I want cross compile linphone for compulab EM-x270 board.when i try
> > > > ? sudo bitbake -b
> > > > /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > > > linphone_3.1.0.bb
> > > > ? ?then i will get the following error
> > > > ? *bb.parse.ParseError: Could not inherit file
> classes/autotools.bbclass
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
> > filesystem replaced/deleted. OE relies on sandboxing the build as a
> > non priviledged user.
>
>  if you feel that strongly about it, why not just have bitbake refuse
> to run as root?  seems like a simple solution.
>
> rday
> --
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>            Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> ------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> End of Openembedded-devel Digest, Vol 41, Issue 2
> *************************************************
>

