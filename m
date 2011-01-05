Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PaL3h-0008VI-VY
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 05:33:14 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEJ00MVN5UFJ370@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	04 Jan 2011 21:32:44 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 3288FB; Tue, 04 Jan 2011 21:32:32 -0600
Received: from [192.168.1.2] by rkmorris.us with HTTP; Tue,
	04 Jan 2011 21:32:29 -0600
From: Russell Morris <openembedded@rkmorris.us>
Date: Tue, 04 Jan 2011 21:32:29 -0600
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1294198349769396500@rkmorris.us>
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
X-List-Received-Date: Wed, 05 Jan 2011 04:33:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

A bit more info to try and help out here - as I'm fighting with this as be=
st I can, but it's still kicking my butt ... :-).

=20

It really does look like the executable that is being created is not build=
 for the arm920t (armv4t). I have tried to run the executable on the target=
, and also with a modified version of qemu - and neither one works. If I te=
ll qemu that the target is an arm920t the executable will not run, but if I=
 let it be the default qemu-arm it runs just fine.

=20

Has anyone else been able to get an OE build to run on an arm920t (armv4t)=
 processor?

=20

Thanks,

... Russell

=20




On Sun, Jan 2, 2011 06:34  AM, <openembedded@rkmorris.us> wrote:

>=20
My sincere apologies - as I never got that earlier email (but was having i=
ssues with Norton filtering my email, so I'm sure it was on my side .. :-()=
.
>=20
> To answer your question though - the MACHINE is h1940, and I have tried =
two different DISTRO's ... minimal and angstrom-2008.1. I am using the mast=
er branch of OpenEmbedded, and last updated it ~ 30 days ago.
>=20
> Thoughts?
>=20
> Thanks!
>=20
> ... Russell
>=20
>=20
> On Sun, Jan 2, 2011 00:44 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Sat, Jan 1, 2011 at 10:34 AM, <openembedded@rkmorris.us> wrote:
> > > Hi,
> > >
> > >
> > >
> > > As I have been debugging this it's looking more like a build issue -=
 so let me try the developer group, in case someone here has seen this befo=
re.
> > >
> > >
> > >
> > > Copying over the key point from below ... I (successfully) built the=
 helloworld-image,
> >=20
> >=20
> > what was MACHINE and DISTRO and OpenEmbedded revision you used ? I
> > think I asked same qestion when you posted this to oe-users ml. If you
> > are not going to provide information then I am afraid not many can
> > help you here
> >=20
> > but cannot run the resulting helloworld binary on the target machine -
> > it does execute under QEMU, which doesn't provide support this CPU
> > (arm920t - armv4t). However, a functioning binary from the target
> > (armv4t) machine runs on the target, but not on QEMU (as expected). So
> > it seems that OpenEmbedded is not building for the right machine
> > (which is strange, as the OpenEmbedded built kernel works!).
> > >
> > >
> > >
> > > Any thoughts on this? It seems that OpenEmbedded / bitbake may be us=
ing QEMU to create the binary for the target ... is that right (as it's wha=
t I have seen in a bit of poking around)? This would be a problem, as QEMU =
doesn't support the arm920t processor. Perhaps I have to apply the QEMU pat=
ch that adds this support to QEMU, or change my config to somehow create th=
e executable in a different way?
> > >
> > >
> > >
> > > Any suggestions would be greatly appreciated - as my current built (=
actually, rootfs) is not functioning on the target machine.
> > >
> > >
> > >
> > > Thanks!
> > >
> > >
> > >
> > > ... Russell
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > Subject: Re: [Openembedded-users] H1940 Boot Issues
> > > From: <openembedded@rkmorris.us>
> > > Date: Thu, Dec 30, 2010 11:36 PM
> > > To: Openembedded-users@lists.openembedded.org
> > >
> > >
> > >
> > >
> > >
> > >
> > > Hi,
> > >
> > >
> > >
> > > OK, I haven't given up on this - and now it gets more interesting ..=
. :-). It seems that OpenEmbedded is not properly building a binary for the=
 ARM920T CPU (arm4t) - has anyone else seen this?
> > >
> > >
> > >
> > > I built the helloworld-image, and cannot run the resulting helloworl=
d binary on the target machine - but can run it under QEMU, which doesn't e=
ven support this CPU. However, a functioning binary from the target (arm4t)=
 machine runs on the target, but not on QEMU (as expected). So it seems tha=
t OpenEmbedded is not building for the right machine (which is strange, as =
the OpenEmbedded built kernel works!).
> > >
> > >
> > >
> > > The config files seem to be set up for the right target machine, but=
 the binary is not being built right for some reason. Does anyone have any =
ideas?
> > >
> > >
> > >
> > > Thanks!
> > >
> > >
> > >
> > > ... Russell
> > >
> > >
> > >
> > >
> > >
> > >
> > > On Fri, Dec 24, 2010 09:20 AM, <openembedded@rkmorris.us> wrote:
> > >
> > >
> > >>
> > >
> > >
> > >
> > > Hi,
> > >
> > >
> > >
> > > I have tried quite a few more things here, still with no luck. It re=
ally does seem that OpenEmbedded does not properly / fully build an image t=
hat works on (real?) embedded systems ... :-(. I am out of things to try, b=
ut let me pass this info along in the hope that it will save others some ti=
me / grief if they try to do similar things.
> > >
> > >
> > >
> > > I have tried several different formats / approaches to the rootfs, n=
one of which work (except for the legacy Familiar Linux file system that I =
found). I cannot load the OpenEmbedded rootfs as an initrd, or when extract=
ed to an SD card (as a "normal" file system, either copied from the ext2 fi=
le, or extracted from tar.gz). While this seems to be a rootfs issue, it st=
ill could be the build of init, as replacing the Familiar Linux init.sysvin=
it with the one generated by OpenEmbedded does in fact break the working fi=
le system. I tried reducing the size of generated rootfs (by setting IMAGE_=
ROOTFS_SIZE), but that doesn't seem to be working either (so I cannot use t=
he OpenEmbedded rootfs as an initrd, as it is 64 MB, which seems to cause p=
roblems on the target system). BTW, the OpenEmbedded generated linuxrc file=
 is just a link to /bin/busybox, which seems a bit strange - so perhaps thi=
s is the issue?
> > >
> > >
> > >
> > > Hopefully this helps other folks - by not trying these same things.
> > >
> > >
> > >
> > > ... Russell
> > >
> > >
> > >
> > >
> > >
> > >>
> > >> On Wed, Dec 22, 2010 11:28 PM, <openembedded@rkmorris.us> wrote:
> > >>
> > >
> > >>
> > > Hi,
> > >>
> > >> I have been strugging with this for quite some now, and really am s=
tuck - so I really would appreciate any thoughts or pointers anyone has! Le=
t me try to explain my problem.
> > >>
> > >> I have been able to build OpenEmbedded on my machine, with a target=
 of either h1940 or qemuarm - and for the console-image both build just fin=
e. I can use the kernel for both of these (on the appropriate target), but =
my issue is with the rootfs. If I use the OpenEmbedded built rootfs in qemu=
arm, targeted for either qemuarm or the h1940 (but always using the qemuarm=
 kernel) everything works just fine.
> > >>
> > >> My issue arises when trying to use the rootfs on the h1940 - I cann=
ot get my system to boot, and actually INIT is never launched (but the kern=
el seems fine). If I take an old file system that I was able to find (from =
Familiar Linux, ~ 2004-2005 vintage), it works fine on my h1940 (with the k=
ernel from OpenEmbedded!) ... so the issue seems to be the rootfs. If I jus=
t replace /sbin/init.sysvinit in the Familiar Linux file system with the on=
e from OpenEmbedded - then I get kernel panic (and no init found it says ..=
. :-(). Oddly enough, if I use the Familiar LInux file system with qemuarm =
- it doesn't work, I have file system errors (and kernel panic), but the Op=
enEmbedded built file system (even for the h1940) works just great).
> > >>
> > >> So it seems that I have some sort of filesystem incompatibility ...=
 or am I wrong? BTW, I can load the above mentioned filesystems as ext2 or =
ext3 in (OpenSUSE) Linux, no issues there.
> > >>
> > >> Again, any suggestions of how to fix this would be greatly apprecia=
ted!
> > >>
> > >> Thanks!
> > >>
> > >> ... Russell
> > >>
> > >>
> > >> _______________________________________________
> > >> Openembedded-users mailing list
> > >> Openembedded-users@linuxtogo.org
> > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-us=
ers
> > >> _______________________________________________
> > > Openembedded-users mailing list
> > > Openembedded-users@linuxtogo.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-use=
rs
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
From raj.khem@gmail.com Wed Jan 05 07:47:18 2011
Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PaN9S-0005ew-GI
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 07:47:18 +0100
Received: by yxd5 with SMTP id 5so6229548yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 22:46:54 -0800 (PST)
DKIM-Signature: v
