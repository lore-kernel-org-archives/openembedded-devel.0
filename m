Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@rkmorris.us>) id 1Op4lC-0004jH-JR
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 21:38:48 +0200
Received: from server ([unknown] [71.170.86.183]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7T00F6HT72NNB0@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	27 Aug 2010 14:37:50 -0500 (CDT)
Received: from server [127.0.0.1] by server (Axigen)
	with ESMTPSA id 302E2D; Fri, 27 Aug 2010 14:37:48 -0500
Received: from [192.168.1.2] by rkmorris.us with HTTP; Fri,
	27 Aug 2010 14:37:47 -0500
From: <openembedded@rkmorris.us>
Date: Fri, 27 Aug 2010 14:37:47 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1282937867899813500@rkmorris.us>
In-reply-to: <AANLkTi=00LEM9HsXtK8m4LPU0aW6Q-kBOPVaB-6DxfYq@mail.gmail.com>
References: <AANLkTin5LRCz6PU_x6Mw+V2Xf8W=i+n4RLqQjwON1R7+@mail.gmail.com>
	<1282916770549933500@rkmorris.us>
	<AANLkTi=00LEM9HsXtK8m4LPU0aW6Q-kBOPVaB-6DxfYq@mail.gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 4
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: openembedded@rkmorris.us
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Fri, 27 Aug 2010 19:38:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
Thanks for the quick response!
What's strange is that watching the boot in QEMU it seems to be looking fo=
r 2.6.17-rc3 inside the /lib/modules directory ... but if I mount my initrd=
 (un-gzip, then mount as ext2), and look inside this directory - the direct=
ory is 2.6.34 instead! Somewhere / somehow there seems to be a versioning i=
ssue perhaps?
Thoughts?
Thanks again,... Russell


On Fri, Aug 27, 2010 12:41  PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 27, 2010 at 6:46 AM,  <openembedded@rkmorris.us> wrote:
> > Hi,
> > As I reported recently, I am having issues getting my OE output up and=
 running on my h1940 device. It seems to be some sort of issue between the =
kernel and initrd files, so to debug this I figured that I'd build and test=
 on QEMU (hoping that the recent udev related issues were my problem, and t=
o make sure that I could build "properly").
> > Given this, I went ahead and built console-image (angstrom 2008.1 dist=
ro) for qemuarm, to see if it was perhaps just me having issues (which is s=
till possible). However, I took the output from the qemuarm build and tried=
 to run it ... and still have issues (not the same as my h1940, but still f=
atal).
> > On QEMU (verified to work with the QEMU provide example ARM images) I =
am able to boot, at least part way, but end up with a FATAL message about a=
 missing directory ... /lib/modules/2.6.17-rc3.
> > Is this a known issue? Any proposed fixes or workarounds for this?
>=20
> oe.dev works well on qemuarm here with
>=20
> PREFERRED_VERSION_usbutils_local                =3D "0.86"
> PREFERRED_VERSION_udev_local                    =3D "151"
>=20
> in local.conf and minimal/angstrom distro last time I tried it booted
> fine. you can also adapt
> contrib/qemu/run-qemu.sh to run OE in qemu.
>=20
> > Thanks!
> > ... Russell
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
From raj.khem@gmail.com Fri Aug 27 22:17:59 2010
Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Op5MY-000859-3Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 22:17:50 +0200
Received: by iwn2 with SMTP id 2so2795409iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 13:16:54 -0700 (PDT)
DKIM-Signature: v
