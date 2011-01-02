Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PZO6A-0006rP-Iv
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Jan 2011 14:35:51 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEE00074AYJAD50@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	02 Jan 2011 06:35:07 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 08C6B2; Sun, 02 Jan 2011 06:35:00 -0600
Received: from [192.168.1.10] by rkmorris.us with HTTP; Sun,
	02 Jan 2011 06:34:58 -0600
From: <openembedded@rkmorris.us>
Date: Sun, 02 Jan 2011 06:34:58 -0600
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1293971698169074500@rkmorris.us>
In-reply-to: <AANLkTim4xrqcQ2MoikD0jhjf3SJ8=g+HF9ikT=d01k8Y@mail.gmail.com>
References: <1293906868062803500@rkmorris.us>
	<AANLkTim4xrqcQ2MoikD0jhjf3SJ8=g+HF9ikT=d01k8Y@mail.gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 5
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
X-List-Received-Date: Sun, 02 Jan 2011 13:35:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

My sincere apologies - as I never got that earlier email (but was having is=
sues with Norton filtering my email, so I'm sure it was on my side .. :-().

To answer your question though - the MACHINE is h1940, and I have tried tw=
o different DISTRO's ... minimal and angstrom-2008.1. I am using the master=
 branch of OpenEmbedded, and last updated it ~ 30 days ago.

Thoughts?

Thanks!

... Russell


On Sun, Jan 2, 2011 00:44  AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Jan 1, 2011 at 10:34 AM,  <openembedded@rkmorris.us> wrote:
> > Hi,
> >
> >
> >
> > As I have been debugging this it's looking more like a build issue - s=
o let me try the developer group, in case someone here has seen this before=
.
> >
> >
> >
> > Copying over the key point from below ... I (successfully) built the h=
elloworld-image,
>=20
>=20
> what was MACHINE and DISTRO and OpenEmbedded revision you used ? I
> think I asked same qestion when you posted this to oe-users ml. If you
> are not going to provide information then I am afraid not many can
> help you here
>=20
> but cannot run the resulting helloworld binary on the target machine -
> it does execute under QEMU, which doesn't provide support this CPU
> (arm920t - armv4t). However, a functioning binary from the target
> (armv4t) machine runs on the target, but not on QEMU (as expected). So
> it seems that OpenEmbedded is not building for the right machine
> (which is strange, as the OpenEmbedded built kernel works!).
> >
> >
> >
> > Any thoughts on this? It seems that OpenEmbedded / bitbake may be usin=
g QEMU to create the binary for the target ... is that right (as it's what =
I have seen in a bit of poking around)? This would be a problem, as QEMU do=
esn't support the arm920t processor. Perhaps I have to apply the QEMU patch=
 that adds this support to QEMU, or change my config to somehow create the =
executable in a different way?
> >
> >
> >
> > Any suggestions would be greatly appreciated - as my current built (ac=
tually, rootfs) is not functioning on the target machine.
> >
> >
> >
> > Thanks!
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
> >
> >
> >
> >
> > Subject: Re: [Openembedded-users] H1940 Boot Issues
> > From: <openembedded@rkmorris.us>
> > Date: Thu, Dec 30, 2010 11:36 PM
> > To: Openembedded-users@lists.openembedded.org
> >
> >
> >
> >
> >
> >
> > Hi,
> >
> >
> >
> > OK, I haven't given up on this - and now it gets more interesting ... =
:-). It seems that OpenEmbedded is not properly building a binary for the A=
RM920T CPU (arm4t) - has anyone else seen this?
> >
> >
> >
> > I built the helloworld-image, and cannot run the resulting helloworld =
binary on the target machine - but can run it under QEMU, which doesn't eve=
n support this CPU. However, a functioning binary from the target (arm4t) m=
achine runs on the target, but not on QEMU (as expected). So it seems that =
OpenEmbedded is not building for the right machine (which is strange, as th=
e OpenEmbedded built kernel works!).
> >
> >
> >
> > The config files seem to be set up for the right target machine, but t=
he binary is not being built right for some reason. Does anyone have any id=
eas?
> >
> >
> >
> > Thanks!
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
> > On Fri, Dec 24, 2010 09:20  AM, <openembedded@rkmorris.us> wrote:
> >
> >
> >>
> >
> >
> >
> > Hi,
> >
> >
> >
> > I have tried quite a few more things here, still with no luck. It real=
ly does seem that OpenEmbedded does not properly / fully build an image tha=
t works on (real?) embedded systems ... :-(. I am out of things to try, but=
 let me pass this info along in the hope that it will save others some time=
 / grief if they try to do similar things.
> >
> >
> >
> > I have tried several different formats / approaches to the rootfs, non=
e of which work (except for the legacy Familiar Linux file system that I fo=
und). I cannot load the OpenEmbedded rootfs as an initrd, or when extracted=
 to an SD card (as a "normal" file system, either copied from the ext2 file=
, or extracted from tar.gz). While this seems to be a rootfs issue, it stil=
l could be the build of init, as replacing the Familiar Linux init.sysvinit=
 with the one generated by OpenEmbedded does in fact break the working file=
 system. I tried reducing the size of generated rootfs (by setting IMAGE_RO=
OTFS_SIZE), but that doesn't seem to be working either (so I cannot use the=
 OpenEmbedded rootfs as an initrd, as it is 64 MB, which seems to cause pro=
blems on the target system). BTW, the OpenEmbedded generated linuxrc file i=
s just a link to /bin/busybox, which seems a bit strange - so perhaps this =
is the issue?
> >
> >
> >
> > Hopefully this helps other folks - by not trying these same things.
> >
> >
> >
> > ... Russell
> >
> >
> >
> >
> >
> >>
> >> On Wed, Dec 22, 2010 11:28  PM, <openembedded@rkmorris.us> wrote:
> >>
> >
> >>
> > Hi,
> >>
> >> I have been strugging with this for quite some now, and really am stu=
ck - so I really would appreciate any thoughts or pointers anyone has! Let =
me try to explain my problem.
> >>
> >> I have been able to build OpenEmbedded on my machine, with a target o=
f either h1940 or qemuarm - and for the console-image both build just fine.=
 I can use the kernel for both of these (on the appropriate target), but my=
 issue is with the rootfs. If I use the OpenEmbedded built rootfs in qemuar=
m, targeted for either qemuarm or the h1940 (but always using the qemuarm k=
ernel) everything works just fine.
> >>
> >> My issue arises when trying to use the rootfs on the h1940 - I cannot=
 get my system to boot, and actually INIT is never launched (but the kernel=
 seems fine). If I take an old file system that I was able to find (from Fa=
miliar Linux, ~ 2004-2005 vintage), it works fine on my h1940 (with the ker=
nel from OpenEmbedded!) ... so the issue seems to be the rootfs. If I just =
replace /sbin/init.sysvinit in the Familiar Linux file system with the one =
from OpenEmbedded - then I get kernel panic (and no init found it says ... =
:-(). Oddly enough, if I use the Familiar LInux file system with qemuarm - =
it doesn't work, I have file system errors (and kernel panic), but the Open=
Embedded built file system (even for the h1940) works just great).
> >>
> >> So it seems that I have some sort of filesystem incompatibility ... o=
r am I wrong? BTW, I can load the above mentioned filesystems as ext2 or ex=
t3 in (OpenSUSE) Linux, no issues there.
> >>
> >> Again, any suggestions of how to fix this would be greatly appreciate=
d!
> >>
> >> Thanks!
> >>
> >> ... Russell
> >>
> >>
> >> _______________________________________________
> >> Openembedded-users mailing list
> >> Openembedded-users@linuxtogo.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-user=
s
> >> _______________________________________________
> > Openembedded-users mailing list
> > Openembedded-users@linuxtogo.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
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
From mike@mwester.net Sun Jan 02 16:22:34 2011
Received: from p3plsmtpa01-08.prod.phx3.secureserver.net ([72.167.82.88])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PZPlS-0000CP-0N
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Jan 2011 16:22:34 +0100
Received: (qmail 11844 invoked from network); 2 Jan 2011 15:15:32 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa01-08.prod.phx3.secureserver.net (72.167.82.88) with ESMTP;
	02 Jan 2011 15:15:31 -0000
Message-ID: <4D20968B.4030004@mwester.net>
Date: Sun, 02 Jan 2011 09:15:23 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset
