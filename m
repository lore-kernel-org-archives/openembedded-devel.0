Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@rkmorris.us>) id 1Opi33-0007ea-S5
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 15:35:51 +0200
Received: from server ([unknown] [71.170.86.183]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7X00MRH1QHK310@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	29 Aug 2010 08:35:07 -0500 (CDT)
Received: from server [127.0.0.1] by server (Axigen)
	with ESMTPSA id 385665; Sun, 29 Aug 2010 08:35:02 -0500
Received: from [192.168.1.3] by rkmorris.us with HTTP; Sun,
	29 Aug 2010 08:34:58 -0500
From: <openembedded@rkmorris.us>
Date: Sun, 29 Aug 2010 08:34:58 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1283088898854605500@rkmorris.us>
In-reply-to: <1283002966187563500@rkmorris.us>
References: <1282940782400087500@rkmorris.us> <1282944432199625500@rkmorris.us>
	<1283002966187563500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 5
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: openembedded@rkmorris.us
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	MIME_QP_LONG_LINE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Execution of Build Output Failing (Testing)
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
X-List-Received-Date: Sun, 29 Aug 2010 13:35:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
OK, unfortunately I've exhausted all my thoughts on getting my h1940 up an=
d running - it still fails ... actually, stops, after a console output noti=
ng that it has found the compressed RAMDISK image at block 0. After that no=
 more console output ... but it's not completely hung, as I do get a consol=
e message about the Ethernet gadget when plugging in the USB.
A admit though, I'm not sure what to try next - as I have no console outpu=
t after the RAMDISK message, have no keyboard (it's a touchscreen device), =
no logs (using a ramdisk or SD paritition), and I can't connect to the USB =
ethernet interface even though I do get a message about it (but can't ping =
it).
Any debugging suggestions would be greatly appreciated!!!
Thanks,... Russell


On Sat, Aug 28, 2010 08:42  AM, <openembedded@rkmorris.us> wrote:
> Hi,
> It's all working now - thanks! I refreshed the source (via git), and did=
 a complete new rebuild - and now it works.
> Now back to my h1940. If anyone has any debugging suggestions I would de=
finitely appreciate it. Unfortunately it seems to just hang, with no real d=
ebugging information (when "transferring" from the kernel to initrd, each o=
f which has been confirmed on it's own). Of course I don't have a keyboard =
either, so it's even more fun ... :-(.
> Thanks again,... Russell
>=20
>=20
> On Fri, Aug 27, 2010 04:27  PM, <openembedded@rkmorris.us> wrote:
> > OK, I checked - and my kernel file actually has 2.6.34 in it's name, s=
o it seems right.=20
> > Hmmm ... where the heck is 2.6.17-rc3 coming from?
> > ... Russell
> >=20
> >=20
> > On Fri, Aug 27, 2010 03:26  PM, <openembedded@rkmorris.us> wrote:
> > > Yep, this makes complete sense - but I haven't tried to change versi=
ons (at least not on purpose ... :-)). Rather, these are what seem to happe=
n by default. Let me look at the config files a bit more, to see if I can f=
orce this (or if you know, but all means yell about what I'm missing!).
> > > BTW, on the PREFERRED_VERSION items below - likely a dumb question, =
but how is someone to know about this?
> > > Thanks!
> > > ... Russell
> > >=20
> > >=20
> > >=20
> > > On Fri, Aug 27, 2010 03:16  PM, Khem Raj <raj.khem@gmail.com> wrote:
> > > > On Fri, Aug 27, 2010 at 12:37 PM,  <openembedded@rkmorris.us> wrot=
e:
> > > > Hi,
> > > > Thanks for the quick response!
> > > > What's strange is that watching the boot in QEMU it seems to be lo=
oking for 2.6.17-rc3 inside the /lib/modules directory ... but if I mount m=
y initrd (un-gzip, then mount as ext2), and look inside this directory - th=
e directory is 2.6.34 instead! Somewhere / somehow there seems to be a vers=
ioning issue perhaps?
> > > > Thoughts?
> > >=20
> > > yes because the default kernel for qemuarm machine is 2.6.34 and hen=
ce
> > > the modules which are part of rfs are for that kernel.
> > > you should use same kernel to boot qemu for best results.
> > >=20
> > > > Thanks again,... Russell
> > > >
> > > >
> > > > On Fri, Aug 27, 2010 12:41  PM, Khem Raj <raj.khem@gmail.com> wrot=
e:
> > > >> On Fri, Aug 27, 2010 at 6:46 AM,  <openembedded@rkmorris.us> wrot=
e:
> > > >> > Hi,
> > > >> > As I reported recently, I am having issues getting my OE output=
 up and running on my h1940 device. It seems to be some sort of issue betwe=
en the kernel and initrd files, so to debug this I figured that I'd build a=
nd test on QEMU (hoping that the recent udev related issues were my problem=
, and to make sure that I could build "properly").
> > > >> > Given this, I went ahead and built console-image (angstrom 2008=
.1 distro) for qemuarm, to see if it was perhaps just me having issues (whi=
ch is still possible). However, I took the output from the qemuarm build an=
d tried to run it ... and still have issues (not the same as my h1940, but =
still fatal).
> > > >> > On QEMU (verified to work with the QEMU provide example ARM ima=
ges) I am able to boot, at least part way, but end up with a FATAL message =
about a missing directory ... /lib/modules/2.6.17-rc3.
> > > >> > Is this a known issue? Any proposed fixes or workarounds for th=
is?
> > > >>
> > > >> oe.dev works well on qemuarm here with
> > > >>
> > > >> PREFERRED_VERSION_usbutils_local                =3D "0.86"
> > > >> PREFERRED_VERSION_udev_local                    =3D "151"
> > > >>
> > > >> in local.conf and minimal/angstrom distro last time I tried it bo=
oted
> > > >> fine. you can also adapt
> > > >> contrib/qemu/run-qemu.sh to run OE in qemu.
> > > >>
> > > >> > Thanks!
> > > >> > ... Russell
> > > >> > _______________________________________________
> > > >> > Openembedded-devel mailing list
> > > >> > Openembedded-devel@lists.openembedded.org
> > > >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-devel
> > > >> >
> > > >>
> > > >> _______________________________________________
> > > >> Openembedded-devel mailing list
> > > >> Openembedded-devel@lists.openembedded.org
> > > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> > > >>
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-d=
evel
> > > >
> > >=20
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
> > >=20
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
From enrico.scholz@sigma-chemnitz.de Sun Aug 29 16:00:29 2010
Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OpiQu-0007Ji-BC
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 16:00:29 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o7TDxuqq026194
	(version
