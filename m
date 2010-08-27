Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@rkmorris.us>) id 1Op6SF-0004cy-OM
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 23:27:21 +0200
Received: from server ([unknown] [71.170.86.183]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7T009IGVG14P10@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	27 Aug 2010 15:26:26 -0500 (CDT)
Received: from server [127.0.0.1] by server (Axigen)
	with ESMTPSA id 2EDBA4; Fri, 27 Aug 2010 15:26:23 -0500
Received: from [192.168.1.2] by rkmorris.us with HTTP; Fri,
	27 Aug 2010 15:26:22 -0500
From: <openembedded@rkmorris.us>
Date: Fri, 27 Aug 2010 15:26:22 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1282940782400087500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 5
X-SA-Exim-Connect-IP: 206.46.173.11
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
X-List-Received-Date: Fri, 27 Aug 2010 21:27:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Yep, this makes complete sense - but I haven't tried to change versions (at=
 least not on purpose ... :-)). Rather, these are what seem to happen by de=
fault. Let me look at the config files a bit more, to see if I can force th=
is (or if you know, but all means yell about what I'm missing!).
BTW, on the PREFERRED_VERSION items below - likely a dumb question, but ho=
w is someone to know about this?
Thanks!
... Russell



On Fri, Aug 27, 2010 03:16  PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 27, 2010 at 12:37 PM,  <openembedded@rkmorris.us> wrote:
> > Hi,
> > Thanks for the quick response!
> > What's strange is that watching the boot in QEMU it seems to be lookin=
g for 2.6.17-rc3 inside the /lib/modules directory ... but if I mount my in=
itrd (un-gzip, then mount as ext2), and look inside this directory - the di=
rectory is 2.6.34 instead! Somewhere / somehow there seems to be a versioni=
ng issue perhaps?
> > Thoughts?
>=20
> yes because the default kernel for qemuarm machine is 2.6.34 and hence
> the modules which are part of rfs are for that kernel.
> you should use same kernel to boot qemu for best results.
>=20
> > Thanks again,... Russell
> >
> >
> > On Fri, Aug 27, 2010 12:41  PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> On Fri, Aug 27, 2010 at 6:46 AM,  <openembedded@rkmorris.us> wrote:
> >> > Hi,
> >> > As I reported recently, I am having issues getting my OE output up =
and running on my h1940 device. It seems to be some sort of issue between t=
he kernel and initrd files, so to debug this I figured that I'd build and t=
est on QEMU (hoping that the recent udev related issues were my problem, an=
d to make sure that I could build "properly").
> >> > Given this, I went ahead and built console-image (angstrom 2008.1 d=
istro) for qemuarm, to see if it was perhaps just me having issues (which i=
s still possible). However, I took the output from the qemuarm build and tr=
ied to run it ... and still have issues (not the same as my h1940, but stil=
l fatal).
> >> > On QEMU (verified to work with the QEMU provide example ARM images)=
 I am able to boot, at least part way, but end up with a FATAL message abou=
t a missing directory ... /lib/modules/2.6.17-rc3.
> >> > Is this a known issue? Any proposed fixes or workarounds for this?
> >>
> >> oe.dev works well on qemuarm here with
> >>
> >> PREFERRED_VERSION_usbutils_local                =3D "0.86"
> >> PREFERRED_VERSION_udev_local                    =3D "151"
> >>
> >> in local.conf and minimal/angstrom distro last time I tried it booted
> >> fine. you can also adapt
> >> contrib/qemu/run-qemu.sh to run OE in qemu.
> >>
> >> > Thanks!
> >> > ... Russell
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
From openembedded@rkmorris.us Fri Aug 27 23:34:04 2010
Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@rkmorris.us>) id 1Op6Yj-0002FI-DW
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 23:34:04 +0200
Received: from server ([unknown] [71.170.86.183]) by vms173017.mailsrvcs.n=
et
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7T006MBYJJ0V30@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	27 Aug 2010 16:33:24 -0500 (CDT)
Received: from server [127.0.0.1] by server (Axigen)
	with ESMTPSA id 1AF6F8; Fri, 27 Aug 2010 16:33:18 -0500
Received: from [192.168.1.4] by rkmorris.us with HTTP; Fri,
	27 Aug 2010 16:33:16 -0500
From: <openembedded@rkmorris.us>
Date: Fri, 27 Aug 2010 16:33:16 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1282944796856928500@rkmorris.us>
In-reply-to: <1282944432199625500@rkmorris.us>
References: <1282940782400087500@rkmorris.us> <1282944432199625500@rkmorri=
s.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 4
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: openembedded@rkmorris.us
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level:
X-Spam-Status: No, score
