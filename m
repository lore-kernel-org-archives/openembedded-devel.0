Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PZ7EF-0004HQ-Pu
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 20:35:04 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEC00H4LWXP0D20@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	01 Jan 2011 12:34:37 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 2E6F40; Sat, 01 Jan 2011 12:34:30 -0600
Received: from [192.168.1.2] by rkmorris.us with HTTP; Sat,
	01 Jan 2011 12:34:28 -0600
From: <openembedded@rkmorris.us>
Date: Sat, 01 Jan 2011 12:34:28 -0600
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1293906868062803500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 6
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: H1940 Boot Issues -> Executable Build Problems?
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
X-List-Received-Date: Sat, 01 Jan 2011 19:35:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

As I have been debugging this it's looking more like a build issue - so let=
 me try the developer group, in case someone here has seen this before.

=20

Copying over the key point from below ... I (successfully) built the hellow=
orld-image, but cannot run the resulting helloworld binary on the target ma=
chine - it does execute under QEMU, which doesn't provide support this CPU =
(arm920t - armv4t). However, a functioning binary from the target (armv4t) =
machine runs on the target, but not on QEMU (as expected). So it seems that=
 OpenEmbedded is not building for the right machine (which is strange, as t=
he OpenEmbedded built kernel works!).

=20

Any thoughts on this? It seems that OpenEmbedded / bitbake may be using QEM=
U to create the binary for the target ... is that right (as it's what I hav=
e seen in a bit of poking around)? This would be a problem, as QEMU doesn't=
 support the arm920t processor. Perhaps I have to apply the QEMU patch that=
 adds this support to QEMU, or change my config to somehow create the execu=
table in a different way?

=20

Any suggestions would be greatly appreciated - as my current built (actuall=
y, rootfs) is not functioning on the target machine.

=20

Thanks!

=20

... Russell

=20

=20


=20



Subject: Re: [Openembedded-users] H1940 Boot Issues
From: <openembedded@rkmorris.us>
Date: Thu, Dec 30, 2010 11:36 PM
To: Openembedded-users@lists.openembedded.org






Hi,

=20

OK, I haven't given up on this - and now it gets more interesting ... :-). =
It seems that OpenEmbedded is not properly building a binary for the ARM920=
T CPU (arm4t) - has anyone else seen this?

=20

I built the helloworld-image, and cannot run the resulting helloworld binar=
y on the target machine - but can run it under QEMU, which doesn't even sup=
port this CPU. However, a functioning binary from the target (arm4t) machin=
e runs on the target, but not on QEMU (as expected). So it seems that OpenE=
mbedded is not building for the right machine (which is strange, as the Ope=
nEmbedded built kernel works!).

=20

The config files seem to be set up for the right target machine, but the bi=
nary is not being built right for some reason. Does anyone have any ideas?

=20

Thanks!

=20

... Russell

=20

=20


On Fri, Dec 24, 2010 09:20  AM, <openembedded@rkmorris.us> wrote:


>=20



Hi,

=20

I have tried quite a few more things here, still with no luck. It really do=
es seem that OpenEmbedded does not properly / fully build an image that wor=
ks on (real?) embedded systems ... :-(. I am out of things to try, but let =
me pass this info along in the hope that it will save others some time / gr=
ief if they try to do similar things.

=20

I have tried several different formats / approaches to the rootfs, none of =
which work (except for the legacy Familiar Linux file system that I found).=
 I cannot load the OpenEmbedded rootfs as an initrd, or when extracted to a=
n SD card (as a "normal" file system, either copied from the ext2 file, or =
extracted from tar.gz). While this seems to be a rootfs issue, it still cou=
ld be the build of init, as replacing the Familiar Linux init.sysvinit with=
 the one generated by OpenEmbedded does in fact break the working file syst=
em. I tried reducing the size of generated rootfs (by setting IMAGE_ROOTFS_=
SIZE), but that doesn't seem to be working either (so I cannot use the Open=
Embedded rootfs as an initrd, as it is 64 MB, which seems to cause problems=
 on the target system). BTW, the OpenEmbedded generated linuxrc file is jus=
t a link to /bin/busybox, which seems a bit strange - so perhaps this is th=
e issue?

=20

Hopefully this helps other folks - by not trying these same things.

=20

... Russell

=20

=20

>=20
> On Wed, Dec 22, 2010 11:28  PM, <openembedded@rkmorris.us> wrote:
>=20

>=20
Hi,
>=20
> I have been strugging with this for quite some now, and really am stuck -=
 so I really would appreciate any thoughts or pointers anyone has! Let me t=
ry to explain my problem.
>=20
> I have been able to build OpenEmbedded on my machine, with a target of ei=
ther h1940 or qemuarm - and for the console-image both build just fine. I c=
an use the kernel for both of these (on the appropriate target), but my issue is with the rootfs. If I use the OpenEmbedded built =
rootfs in qemuarm, targeted for either qemuarm or the h1940 (but always usi=
ng the qemuarm kernel) everything works just fine.
>=20
> My issue arises when trying to use the rootfs on the h1940 - I cannot get=
 my system to boot, and actually INIT is never launched (but the kernel see=
ms fine). If I take an old file system that I was able to find (from Famili=
ar Linux, ~ 2004-2005 vintage), it works fine on my h1940 (with the kernel =
from OpenEmbedded!) ... so the issue seems to be the rootfs. If I just repl=
ace /sbin/init.sysvinit in the Familiar Linux file system with the one from=
 OpenEmbedded - then I get kernel panic (and no init found it says ... :-()=
. Oddly enough, if I use the Familiar LInux file system with qemuarm - it d=
oesn't work, I have file system errors (and kernel panic), but the OpenEmbe=
dded built file system (even for the h1940) works just great).
>=20
> So it seems that I have some sort of filesystem incompatibility ... or am=
 I wrong? BTW, I can load the above mentioned filesystems as ext2 or ext3 i=
n (OpenSUSE) Linux, no issues there.
>=20
> Again, any suggestions of how to fix this would be greatly appreciated!
>=20
> Thanks!
>=20
> ... Russell
>=20
>=20
> _______________________________________________
> Openembedded-users mailing list
> Openembedded-users@linuxtogo.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
> _______________________________________________
Openembedded-users mailing list
Openembedded-users@linuxtogo.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users

