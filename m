Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PadOi-0003bg-1G
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 01:08:08 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEK00A6VO7Z0YQ0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	05 Jan 2011 17:07:11 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 2015CB; Wed, 05 Jan 2011 17:07:06 -0600
Received: from [192.168.1.2] by rkmorris.us with HTTP; Wed,
	05 Jan 2011 17:07:03 -0600
From: Russell Morris <openembedded@rkmorris.us>
Date: Wed, 05 Jan 2011 17:07:03 -0600
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1294268823607761500@rkmorris.us>
In-reply-to: <AANLkTikeER27XKSAJQ_A+ujdKAqtuowqZBD0jsG0ZoES@mail.gmail.com>
References: <1294253374472299500@rkmorris.us>
	<AANLkTikeER27XKSAJQ_A+ujdKAqtuowqZBD0jsG0ZoES@mail.gmail.com>
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
X-List-Received-Date: Thu, 06 Jan 2011 00:08:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

A few answers / thoughts, below (marked with RMo).

=20

Thanks for all the help and suggestions!

=20

... Russell


On Wed, Jan 5, 2011 02:23  PM, Khem Raj <raj.khem@gmail.com> wrote:


>=20
On Wed, Jan 5, 2011 at 10:49 AM, Russell Morris
> <openembedded@rkmorris.us> wrote:
> > Hi,
> >
> >
> >
> > Let me try to answer a few questions in one email ... :-). First of al=
l, I tried the patch - unfortunately no joy. It does the same thing as earl=
ier builds - let me try to explain, which will hopefully also answer the qu=
estions below.
> >
> >
> >
> > I applied the patch, and rebuilt from scratch with the minimal distro =
(deleted the TMPDIR completely before building). I built the helloworld-ima=
ge, to get a statically linked executable, and also because it's a pretty s=
mall (=3Dfaster) build.
>=20
> OK thats bad. Now can you recompile the kernel with user debugging
> enabled ? and reboot then it will dump lot more info on console on
> error you need to turn on CONFIG_DEBUG_USER in .config
=20
[RMo] Sorry, a dumb question here - but how do I do this? I can see .confi=
g in the temp directory - is this where you want me to modify it?
>=20
> >
> >
> >
> > I then looked at the helloworld executable, and a few interesting note=
s,
> >
> > - if I readelf -h helloworld, it reports "Version5 EABI" ... so I assu=
me arm5te still?
>=20
> thats EABI version it has nothing to do with ARM architecture versions
=20
[RMo] OK, thanks!
>=20
> >
> > - if I try to run helloworld using qemu-arm, it runs fine ... with no =
cpu selected (but I did some checking, and the default cpu for qemu-arm is =
the arm5te). If I try to run with a -cpu arm920t option I get the error mes=
sage "qemu: uncaught target signal 4 (Illegal instruction) - core dumped"
> >
>=20
> OK good so it seems there is still some intructions generated which
> are not supported in armv4t
=20
[RMo] That's what it seems like. To confirm - what is the best way to test=
 this ... with qemu-arm, and/or on the target? Just trying to make sure I t=
est it in a way that makes sense!
>=20
> > - I was not able to run this on the target right now, as I'm not near =
it ... but when I did before I either got a core dump (illegal instruction)=
, or it said basically that the file was not found (depending on the execut=
able I tried to run).
>=20
> Yes it wont change I think.
=20
[RMo] Definitely agreed.
>=20
> >
> >
> >
> > One more interesting fact - if I go inside TMPDIR, and then inside wor=
k/armv4t-oe-linux-gnueabi/gcc-cross-4.5-r28.0+svnr167948/gcc-4_5-branch/tes=
tsuite/gcc.target/arm, there is some sort of test file, with a filename of =
pr42235.c. Oddly enough the first line in this file says ... /* { dg-option=
s "-mthumb -O2 -march=3Darmv5te" }  */
>=20
>=20
> thats just a gcc dejaGNU regression testcase it does not mean anything
> for compiling the root file system
=20
[RMo] Ok, thanks!
> >
> >
> > Hopefully this all makes sense. I think this says that the executable =
is still targeting an armv5te ... but I could be wrong! Unfortunately it wo=
uldn't be the first time I was off base, and certaintly it won't be the las=
t ... :-(.
> >
> >
> >
> > Thanks for all your help!
>=20
> as koen suggested try it with angstrom-2008 and see if that helps too.
=20
[RMo] Absolutely - started already. I thought you were looking for the min=
imal distro, but I may have misunderstood. In any case, trying this now ...=
 :-).
>=20
> >
> >
> >
> > ... Russell
> >
> >
> >
> >
> >
> >
> > On Wed, Jan 5, 2011 11:45  AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >>
> > On Wed, Jan 5, 2011 at 7:11 AM, Phil Blundell <philb@gnu.org> wrote:
> >> > On Wed, 2011-01-05 at 08:48 -0600, Russell Morris wrote:
> >> >> Just to confirm - have you run these on an armv4t target? Only ask=
ing because my build completes fine, but the executables don't seem to run =
on the target.
> >> >
> >> > What exactly happens when you try to run those executables?  Have y=
ou
> >> > inspected them to see if they look like the right kind of thing, an=
d/or
> >> > compared them to working ones?
> >> >
> >> > p.
> >> >
> >> >
> >>
> >>
> >> yes as Phil asked you should try to localize the offending code in th=
e
> >> faulty binary. So try to enable
> >> kernel debugging messages so it tells you where its faulting.
> >> Secondly if you can take a working system
> >> and see if the new binary faults in same way ? if not then link the
> >> binary statically and run it again on working
> >> system and see if it faults again. If it does then you can debug it
> >> >
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
> >> >
> >>
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
From openembedded@rkmorris.us Thu Jan 06 05:38:34 2011
Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PahcQ-0007mo-86
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 05:38:34 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173005.mailsrvcs.=
net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEL00LQZ3J4PJA0@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	05 Jan 2011 22:37:52 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 105A1C; Wed, 05 Jan 2011 22:37:43 -0600
Received: from [192.168.1.10] by rkmorris.us with HTTP; Wed,
	05 Jan 2011 22:37:41 -0600
From: Russell Morris <openembedded@rkmorris.us>
Date: Wed, 05 Jan 2011 22:37:41 -0600
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1294288661406628500@rkmorris.us>
In-reply-to: <1294268823607761500@rkmorris.us>
References: <1294253374472299500@rkmorris.us>
	<AANLkTikeER27XKSAJQ_A+ujdKAqtuowqZBD0jsG0ZoES@mail.gmail.com>
	<1294268823607761500@rkmorris.us>
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
