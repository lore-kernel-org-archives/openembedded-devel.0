Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1Pbb6Q-00024F-1X
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Jan 2011 16:53:14 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEP00AWQLBK9C20@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	08 Jan 2011 08:52:32 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 0CC3CA; Sat, 08 Jan 2011 08:52:24 -0600
Received: from [192.168.1.2] by rkmorris.us with HTTP; Sat,
	08 Jan 2011 08:52:22 -0600
From: Russell Morris <openembedded@rkmorris.us>
Date: Sat, 08 Jan 2011 08:52:22 -0600
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1294498342052029500@rkmorris.us>
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
X-List-Received-Date: Sat, 08 Jan 2011 15:53:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

Some updates on this - to keep everyone in the loop. First of all though -=
 thanks very much for all the ideas and suggestions, they are very much app=
reciated. A special thanks to Vasily, who took the time to get me a copy of=
 his kernel (and helped a lot with debugging)!

=20

I have now been able to get my OE builds up and running on my h1940 - both=
 console-image and opie-image are working as expected. While I admit I was =
sidetracked by qemu-arm not running (and it still doesn't, perhaps an armv4=
t bug there also?), the root cause of this is the OE generated kernel. With=
 the kernel that Vasily provided I am able to run with the two rootfs' note=
d above.

=20

If anyone has any things they would like me to try related to the kernel, =
so we can get that working in OE as well, please let me know. I would like =
to help out here if possible, to try to give back to OE (and try to "repay"=
 all the help folks gave me).

=20

Thanks again,

... Russell

=20

=20

=20

PS: I was able to get gdb to attach to qemu-arm running helloworld, but wa=
s not able to get any symbol table / code to load with it ... :-(.

=20

=20

=20


On Thu, Jan 6, 2011 08:30  AM, Russell Morris <openembedded@rkmorris.us> w=
rote:


>=20
Hi,
>=20
>=20
>=20
> Unfortunately I can't really do much on the target - as I can't get to t=
he point where I can log in (no ssh connection, no local keyboard, etc.) ..=
. :-(. I may be able to try to debug it when run through qemu-arm ... have =
you ever tried that?
>=20
>=20
>=20
> I'll do some poking around to see if this is possible.
>=20
>=20
>=20
> Thanks,
>=20
> ... Russell
>=20
>=20
>=20
>=20
> On Thu, Jan 6, 2011 00:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
> >=20
> On Wed, Jan 5, 2011 at 8:37 PM, Russell Morris <openembedded@rkmorris.us=
> wrote:
> > > Hi,
> > >
> > > OK, a few more updates ...
> > > - I built using the angstrom-2008.1 distro, but I have the same issu=
e. I also ran the helloworld application on the target as well, getting the=
 error message "Illegal instruction" (the same as qemu, which I guess is go=
od).
> >=20
> >=20
> > If you can reproduce the issue on target then I would suggest that run
> > the helloworld under gdb or gdbserver on target and see where its
> > happening.
> >=20
> > > - I found the .config file that you are referring to, and made this =
change. I built and ran the debug kernel, but no more information is provid=
ed (other than "Illegal instruction").
> > > - as a side note, I have to edit sumversion.c to fix a "known" issue=
 (http://linux.derkeiler.com/Mailing-Lists/Kernel/2007-05/msg08279.html). Y=
ou may want to update this in the master branch.
> > >
> > > Any other ideas?
> > >
> > > Thanks,
> > > ... Russell
> > >
> > >
> > >
> > >
> > > On Wed, Jan 5, 2011 05:07 PM, Russell Morris <openembedded@rkmorris.=
us> wrote:
> > >> Hi,
> > >>
> > >>
> > >>
> > >> A few answers / thoughts, below (marked with RMo).
> > >>
> > >>
> > >>
> > >> Thanks for all the help and suggestions!
> > >>
> > >>
> > >>
> > >> ... Russell
> > >>
> > >>
> > >> On Wed, Jan 5, 2011 02:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >>
> > >> >
> > >> On Wed, Jan 5, 2011 at 10:49 AM, Russell Morris
> > >> > <openembedded@rkmorris.us> wrote:
> > >> > > Hi,
> > >> > >
> > >> > >
> > >> > >
> > >> > > Let me try to answer a few questions in one email ... :-). Firs=
t of all, I tried the patch - unfortunately no joy. It does the same thing =
as earlier builds - let me try to explain, which will hopefully also answer=
 the questions below.
> > >> > >
> > >> > >
> > >> > >
> > >> > > I applied the patch, and rebuilt from scratch with the minimal =
distro (deleted the TMPDIR completely before building). I built the hellowo=
rld-image, to get a statically linked executable, and also because it's a p=
retty small (=3Dfaster) build.
> > >> >
> > >> > OK thats bad. Now can you recompile the kernel with user debuggin=
g
> > >> > enabled ? and reboot then it will dump lot more info on console o=
n
> > >> > error you need to turn on CONFIG_DEBUG_USER in .config
> > >>
> > >> [RMo] Sorry, a dumb question here - but how do I do this? I can see=
 .config in the temp directory - is this where you want me to modify it?
> > >> >
> > >> > >
> > >> > >
> > >> > >
> > >> > > I then looked at the helloworld executable, and a few interesti=
ng notes,
> > >> > >
> > >> > > - if I readelf -h helloworld, it reports "Version5 EABI" ... so=
 I assume arm5te still?
> > >> >
> > >> > thats EABI version it has nothing to do with ARM architecture ver=
sions
> > >>
> > >> [RMo] OK, thanks!
> > >> >
> > >> > >
> > >> > > - if I try to run helloworld using qemu-arm, it runs fine ... w=
ith no cpu selected (but I did some checking, and the default cpu for qemu-=
arm is the arm5te). If I try to run with a -cpu arm920t option I get the er=
ror message "qemu: uncaught target signal 4 (Illegal instruction) - core du=
mped"
> > >> > >
> > >> >
> > >> > OK good so it seems there is still some intructions generated whi=
ch
> > >> > are not supported in armv4t
> > >>
> > >> [RMo] That's what it seems like. To confirm - what is the best way =
to test this ... with qemu-arm, and/or on the target? Just trying to make s=
ure I test it in a way that makes sense!
> > >> >
> > >> > > - I was not able to run this on the target right now, as I'm no=
t near it ... but when I did before I either got a core dump (illegal instr=
uction), or it said basically that the file was not found (depending on the=
 executable I tried to run).
> > >> >
> > >> > Yes it wont change I think.
> > >>
> > >> [RMo] Definitely agreed.
> > >> >
> > >> > >
> > >> > >
> > >> > >
> > >> > > One more interesting fact - if I go inside TMPDIR, and then ins=
ide work/armv4t-oe-linux-gnueabi/gcc-cross-4.5-r28.0+svnr167948/gcc-4_5-bra=
nch/testsuite/gcc.target/arm, there is some sort of test file, with a filen=
ame of pr42235.c. Oddly enough the first line in this file says ... /* { dg=
-options "-mthumb -O2 -march=3Darmv5te" } */
> > >> >
> > >> >
> > >> > thats just a gcc dejaGNU regression testcase it does not mean any=
thing
> > >> > for compiling the root file system
> > >>
> > >> [RMo] Ok, thanks!
> > >> > >
> > >> > >
> > >> > > Hopefully this all makes sense. I think this says that the exec=
utable is still targeting an armv5te ... but I could be wrong! Unfortunatel=
y it wouldn't be the first time I was off base, and certaintly it won't be =
the last ... :-(.
> > >> > >
> > >> > >
> > >> > >
> > >> > > Thanks for all your help!
> > >> >
> > >> > as koen suggested try it with angstrom-2008 and see if that helps=
 too.
> > >>
> > >> [RMo] Absolutely - started already. I thought you were looking for =
the minimal distro, but I may have misunderstood. In any case, trying this =
now ... :-).
> > >> >
> > >> > >
> > >> > >
> > >> > >
> > >> > > ... Russell
> > >> > >
> > >> > >
> > >> > >
> > >> > >
> > >> > >
> > >> > >
> > >> > > On Wed, Jan 5, 2011 11:45 AM, Khem Raj <raj.khem@gmail.com> wro=
te:
> > >> > >
> > >> > >
> > >> > >>
> > >> > > On Wed, Jan 5, 2011 at 7:11 AM, Phil Blundell <philb@gnu.org> w=
rote:
> > >> > >> > On Wed, 2011-01-05 at 08:48 -0600, Russell Morris wrote:
> > >> > >> >> Just to confirm - have you run these on an armv4t target? O=
nly asking because my build completes fine, but the executables don't seem =
to run on the target.
> > >> > >> >
> > >> > >> > What exactly happens when you try to run those executables? =
Have you
> > >> > >> > inspected them to see if they look like the right kind of th=
ing, and/or
> > >> > >> > compared them to working ones?
> > >> > >> >
> > >> > >> > p.
> > >> > >> >
> > >> > >> >
> > >> > >>
> > >> > >>
> > >> > >> yes as Phil asked you should try to localize the offending cod=
e in the
> > >> > >> faulty binary. So try to enable
> > >> > >> kernel debugging messages so it tells you where its faulting.
> > >> > >> Secondly if you can take a working system
> > >> > >> and see if the new binary faults in same way ? if not then lin=
k the
> > >> > >> binary statically and run it again on working
> > >> > >> system and see if it faults again. If it does then you can deb=
ug it
> > >> > >> >
> > >> > >> > _______________________________________________
> > >> > >> > Openembedded-devel mailing list
> > >> > >> > Openembedded-devel@lists.openembedded.org
> > >> > >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembe=
dded-devel
> > >> > >> >
> > >> > >>
> > >> > >> _______________________________________________
> > >> > >> Openembedded-devel mailing list
> > >> > >> Openembedded-devel@lists.openembedded.org
> > >> > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedd=
ed-devel
> > >> > >>
> > >> > > _______________________________________________
> > >> > > Openembedded-devel mailing list
> > >> > > Openembedded-devel@lists.openembedded.org
> > >> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-devel
> > >> > >
> > >> >
> > >> > _______________________________________________
> > >> > Openembedded-devel mailing list
> > >> > Openembedded-devel@lists.openembedded.org
> > >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> > >> >
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
> > >>
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
> > >
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From jefflance01@gmail.com Sat Jan 08 20:04:45 2011
Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1Pbe5k-000837-Ni
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Jan 2011 20:04:45 +0100
Received: by gyh20 with SMTP id 20so7249821gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jan 2011 11:04:13 -0800 (PST)
DKIM-Signature: v
