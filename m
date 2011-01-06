Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PaqsX-0007g6-4M
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 15:31:49 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEL006HWUZNCK20@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	06 Jan 2011 08:30:59 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 2B1DC9; Thu, 06 Jan 2011 08:30:53 -0600
Received: from [192.168.1.12] by rkmorris.us with HTTP; Thu,
	06 Jan 2011 08:30:50 -0600
From: Russell Morris <openembedded@rkmorris.us>
Date: Thu, 06 Jan 2011 08:30:50 -0600
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1294324250696546500@rkmorris.us>
In-reply-to: <AANLkTikAUk3sDOQ+iZxAHqaVhfBeT460bd8YQtVmT-Vo@mail.gmail.com>
References: <1294253374472299500@rkmorris.us>
	<AANLkTikeER27XKSAJQ_A+ujdKAqtuowqZBD0jsG0ZoES@mail.gmail.com>
	<1294268823607761500@rkmorris.us> <1294288661406628500@rkmorris.us>
	<AANLkTikAUk3sDOQ+iZxAHqaVhfBeT460bd8YQtVmT-Vo@mail.gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 6
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: H1940 Boot Issues -> Executable Build Problems?
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
X-List-Received-Date: Thu, 06 Jan 2011 14:31:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

Unfortunately I can't really do much on the target - as I can't get to the=
 point where I can log in (no ssh connection, no local keyboard, etc.) ... =
:-(. I may be able to try to debug it when run through qemu-arm ... have yo=
u ever tried that?

=20

I'll do some poking around to see if this is possible.

=20

Thanks,

... Russell

=20


On Thu, Jan 6, 2011 00:15  AM, Khem Raj <raj.khem@gmail.com> wrote:


>=20
On Wed, Jan 5, 2011 at 8:37 PM, Russell Morris <openembedded@rkmorris.us> =
wrote:
> > Hi,
> >
> > OK, a few more updates ...
> > - I built using the angstrom-2008.1 distro, but I have the same issue.=
 I also ran the helloworld application on the target as well, getting the e=
rror message "Illegal instruction" (the same as qemu, which I guess is good=
).
>=20
>=20
> If you can reproduce the issue on target then I would suggest that run
> the helloworld under gdb or gdbserver on target and see where its
> happening.
>=20
> > - I found the .config file that you are referring to, and made this ch=
ange. I built and ran the debug kernel, but no more information is provided=
 (other than "Illegal instruction").
> > - as a side note, I have to edit sumversion.c to fix a "known" issue (=
http://linux.derkeiler.com/Mailing-Lists/Kernel/2007-05/msg08279.html). You=
 may want to update this in the master branch.
> >
> > Any other ideas?
> >
> > Thanks,
> > ... Russell
> >
> >
> >
> >
> > On Wed, Jan 5, 2011 05:07  PM, Russell Morris <openembedded@rkmorris.u=
s> wrote:
> >> Hi,
> >>
> >>
> >>
> >> A few answers / thoughts, below (marked with RMo).
> >>
> >>
> >>
> >> Thanks for all the help and suggestions!
> >>
> >>
> >>
> >> ... Russell
> >>
> >>
> >> On Wed, Jan 5, 2011 02:23  PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >> >
> >> On Wed, Jan 5, 2011 at 10:49 AM, Russell Morris
> >> > <openembedded@rkmorris.us> wrote:
> >> > > Hi,
> >> > >
> >> > >
> >> > >
> >> > > Let me try to answer a few questions in one email ... :-). First =
of all, I tried the patch - unfortunately no joy. It does the same thing as=
 earlier builds - let me try to explain, which will hopefully also answer t=
he questions below.
> >> > >
> >> > >
> >> > >
> >> > > I applied the patch, and rebuilt from scratch with the minimal di=
stro (deleted the TMPDIR completely before building). I built the helloworl=
d-image, to get a statically linked executable, and also because it's a pre=
tty small (=3Dfaster) build.
> >> >
> >> > OK thats bad. Now can you recompile the kernel with user debugging
> >> > enabled ? and reboot then it will dump lot more info on console on
> >> > error you need to turn on CONFIG_DEBUG_USER in .config
> >>
> >> [RMo] Sorry, a dumb question here - but how do I do this? I can see .=
config in the temp directory - is this where you want me to modify it?
> >> >
> >> > >
> >> > >
> >> > >
> >> > > I then looked at the helloworld executable, and a few interesting=
 notes,
> >> > >
> >> > > - if I readelf -h helloworld, it reports "Version5 EABI" ... so I=
 assume arm5te still?
> >> >
> >> > thats EABI version it has nothing to do with ARM architecture versi=
ons
> >>
> >> [RMo] OK, thanks!
> >> >
> >> > >
> >> > > - if I try to run helloworld using qemu-arm, it runs fine ... wit=
h no cpu selected (but I did some checking, and the default cpu for qemu-ar=
m is the arm5te). If I try to run with a -cpu arm920t option I get the erro=
r message "qemu: uncaught target signal 4 (Illegal instruction) - core dump=
ed"
> >> > >
> >> >
> >> > OK good so it seems there is still some intructions generated which
> >> > are not supported in armv4t
> >>
> >> [RMo] That's what it seems like. To confirm - what is the best way to=
 test this ... with qemu-arm, and/or on the target? Just trying to make sur=
e I test it in a way that makes sense!
> >> >
> >> > > - I was not able to run this on the target right now, as I'm not =
near it ... but when I did before I either got a core dump (illegal instruc=
tion), or it said basically that the file was not found (depending on the e=
xecutable I tried to run).
> >> >
> >> > Yes it wont change I think.
> >>
> >> [RMo] Definitely agreed.
> >> >
> >> > >
> >> > >
> >> > >
> >> > > One more interesting fact - if I go inside TMPDIR, and then insid=
e work/armv4t-oe-linux-gnueabi/gcc-cross-4.5-r28.0+svnr167948/gcc-4_5-branc=
h/testsuite/gcc.target/arm, there is some sort of test file, with a filenam=
e of pr42235.c. Oddly enough the first line in this file says ... /* { dg-o=
ptions "-mthumb -O2 -march=3Darmv5te" }  */
> >> >
> >> >
> >> > thats just a gcc dejaGNU regression testcase it does not mean anyth=
ing
> >> > for compiling the root file system
> >>
> >> [RMo] Ok, thanks!
> >> > >
> >> > >
> >> > > Hopefully this all makes sense. I think this says that the execut=
able is still targeting an armv5te ... but I could be wrong! Unfortunately =
it wouldn't be the first time I was off base, and certaintly it won't be th=
e last ... :-(.
> >> > >
> >> > >
> >> > >
> >> > > Thanks for all your help!
> >> >
> >> > as koen suggested try it with angstrom-2008 and see if that helps t=
oo.
> >>
> >> [RMo] Absolutely - started already. I thought you were looking for th=
e minimal distro, but I may have misunderstood. In any case, trying this no=
w ... :-).
> >> >
> >> > >
> >> > >
> >> > >
> >> > > ... Russell
> >> > >
> >> > >
> >> > >
> >> > >
> >> > >
> >> > >
> >> > > On Wed, Jan 5, 2011 11:45  AM, Khem Raj <raj.khem@gmail.com> wrot=
e:
> >> > >
> >> > >
> >> > >>
> >> > > On Wed, Jan 5, 2011 at 7:11 AM, Phil Blundell <philb@gnu.org> wro=
te:
> >> > >> > On Wed, 2011-01-05 at 08:48 -0600, Russell Morris wrote:
> >> > >> >> Just to confirm - have you run these on an armv4t target? Onl=
y asking because my build completes fine, but the executables don't seem to=
 run on the target.
> >> > >> >
> >> > >> > What exactly happens when you try to run those executables?  H=
ave you
> >> > >> > inspected them to see if they look like the right kind of thin=
g, and/or
> >> > >> > compared them to working ones?
> >> > >> >
> >> > >> > p.
> >> > >> >
> >> > >> >
> >> > >>
> >> > >>
> >> > >> yes as Phil asked you should try to localize the offending code =
in the
> >> > >> faulty binary. So try to enable
> >> > >> kernel debugging messages so it tells you where its faulting.
> >> > >> Secondly if you can take a working system
> >> > >> and see if the new binary faults in same way ? if not then link =
the
> >> > >> binary statically and run it again on working
> >> > >> system and see if it faults again. If it does then you can debug=
 it
> >> > >> >
> >> > >> > _______________________________________________
> >> > >> > Openembedded-devel mailing list
> >> > >> > Openembedded-devel@lists.openembedded.org
> >> > >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedd=
ed-devel
> >> > >> >
> >> > >>
> >> > >> _______________________________________________
> >> > >> Openembedded-devel mailing list
> >> > >> Openembedded-devel@lists.openembedded.org
> >> > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-devel
> >> > >>
> >> > > _______________________________________________
> >> > > Openembedded-devel mailing list
> >> > > Openembedded-devel@lists.openembedded.org
> >> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> >> > >
> >> >
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
> >> >
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
> >>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From openembedded@rkmorris.us Thu Jan 06 15:38:29 2011
Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1Paqyz-00080R-46
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 15:38:29 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173009.mailsrvcs.=
net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEL0059GVBACFA0@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	06 Jan 2011 08:37:58 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 1BE82C; Thu, 06 Jan 2011 08:37:51 -0600
Received: from [192.168.1.12] by rkmorris.us with HTTP; Thu,
	06 Jan 2011 08:37:48 -0600
From: Russell Morris <openembedded@rkmorris.us>
Date: Thu, 06 Jan 2011 08:37:48 -0600
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1294324668746829500@rkmorris.us>
In-reply-to: <ig3sgf$f5j$1@dough.gmane.org>
References: <1294253374472299500@rkmorris.us>
	<AANLkTikeER27XKSAJQ_A+ujdKAqtuowqZBD0jsG0ZoES@mail.gmail.com>
	<1294268823607761500@rkmorris.us>	<1294288661406628500@rkmorris.us>
	<ig3sgf$f5j$1@dough.gmane.org>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 5
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe] H1940 Boot Issues -> Executable Build Problems?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/open=
embedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject
