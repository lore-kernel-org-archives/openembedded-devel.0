Received: from slow3-v.mail.gandi.net ([217.70.178.89])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.sappia@biotechware.com>) id 1Qe2f2-000529-0M
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jul 2011 12:15:20 +0200
X-WhiteListed: mail was accepted with no delay
X-WhiteListed: mail was accepted with no delay
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
	[217.70.183.196])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 5B350399C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2011 12:10:35 +0200 (CEST)
X-Originating-IP: 217.70.178.137
Received: from mfilter8-d.gandi.net (mfilter8-d.gandi.net [217.70.178.137])
	by relay4-d.mail.gandi.net (Postfix) with ESMTP id AEDBB1720A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2011 12:10:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter8-d.gandi.net
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by mfilter8-d.gandi.net (mfilter8-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024) with ESMTP id vTaER5ba5vjs
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2011 12:10:32 +0200 (CEST)
X-Originating-IP: 87.241.57.98
Received: from [192.168.8.53] (fireone.i3p.it [87.241.57.98])
	(Authenticated sender: a.sappia@biotechware.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1A46517208E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2011 12:10:32 +0200 (CEST)
From: Alessandro Sappia <a.sappia@biotechware.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAG4_upTf2tNbusXcBs91dwf9TE+C9yxSmDM-nXc7wHsSHYDhyQ@mail.gmail.com>
References: <1309803629.20865.8.camel@BTW1>
	<CA+2YH7uyJUNWuvcNEC5jnsqkZs9Hnri7sxq0aZXWf1r88tU_qw@mail.gmail.com>
	<1309850758.24550.19.camel@BTW1>
	<CAG4_upTf2tNbusXcBs91dwf9TE+C9yxSmDM-nXc7wHsSHYDhyQ@mail.gmail.com>
Organization: Biotechware srl
Date: Tue, 05 Jul 2011 12:10:31 +0200
Message-ID: <1309860631.20533.4.camel@BTW1>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: Cannot compile helloworld-image
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
X-List-Received-Date: Tue, 05 Jul 2011 10:15:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Il giorno mar, 05/07/2011 alle 00.37 -0700, Chris Verges ha scritto: 
> Hi Alessandro,
> 
> This may be a silly question, but do you have all of the required
> dependencies installed for your OS?  Looks like libtool isn't being
> found.
> 
> http://wiki.openembedded.net/index.php/OEandYourDistro
> 

Yes, I've already read that page.
From what I've seen list of required software is missing of (for ubuntu
distro 64bit):
- chrpath (for newer bitbake)

Rechecking packages gave me that every package in that list is already
installed.
After package list recheck and I didn't get libtool isn't installed on
host (no package in wiki list has libtool as prerequisite).

so after checking required software in wiki I did a
$ sudo apt-get install libtool
just in case.

but compilation fails on bison-native.

Seem solved by using the host bison ASSUME_PROVIDED += "bison-native"
instead of let bitbake compile
(bison from recipes complains about a "perhaps missing m4 macro
gl_GLIBC21").

Waiting for news.

If no news, then good news.

Thanks for now

Alessandro





> Chris
> 
> On Tue, Jul 5, 2011 at 12:25 AM, Alessandro Sappia
> <a.sappia@biotechware.com> wrote:
> >
> > --
> >
> >
> > Il giorno lun, 04/07/2011 alle 22.05 +0200, Enrico ha scritto:
> >
> >> On Mon, Jul 4, 2011 at 8:20 PM, Alessandro Sappia
> >> <a.sappia@biotechware.com> wrote:
> >> > Hi all,
> >> > I just configured OE on my box and I tried to compile helloworld-image
> >> > to check if everything is fine.
> >> > I'm actually unable to complete with success this build because of this
> >> > error:
> >> > -----------------------------
> >>
> >> Try with:
> >>
> >> BB_NUMBER_THREADS = "1"
> >>
> >> and have a look at the thread "[oe] gettext-native fails to build" of
> >> some days ago to know where i copied this hint from! (and maybe try
> >> oe-core branch too).
> >>
> >
> > [outout cut]
> > m4
> > -I /home/alessandro/oe/build/tmp/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-tools/m4 -I /home/alessandro/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/alessandro/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal -I /home/alessandro/oe/build/tmp/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gnulib-local/m4/ -I /home/alessandro/oe/build/tmp/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-runtime/m4 -I /home/alessandro/oe/build/tmp/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-tools/m4 -I /home/alessandro/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/alessandro/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal --force -I ../../m4 -I ../m4 -I gnulib-m4
> > | autoreconf: running: libtoolize --copy --force
> > | autoreconf: failed to run libtoolize: No such file or directory
> > | autoreconf: libtoolize is needed because this package uses Libtool
> > | + oefatal 'autoreconf execution failed.'
> > | + echo FATAL: 'autoreconf execution failed.'
> > | FATAL: autoreconf execution failed.
> > | + exit 1
> > NOTE: package gettext-native-0.18-r6: task do_configure: Failed
> > ERROR: Task 435
> > (virtual:native:/home/alessandro/oe/openembedded/recipes/gettext/gettext_0.18.bb, do_configure) failed with exit code '1'
> > ERROR:
> > 'virtual:native:/home/alessandro/oe/openembedded/recipes/gettext/gettext_0.18.bb' failed
> >
> >
> > It didn't work, but thanks.
> >
> > Ciao,
> >
> > Alessandro
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





