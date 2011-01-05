Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PaZNe-0000F4-GL
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 20:50:46 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEK00HGICAV8EA0@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	05 Jan 2011 12:49:49 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 10EDD1; Wed, 05 Jan 2011 12:49:37 -0600
Received: from [192.168.1.12] by rkmorris.us with HTTP; Wed,
	05 Jan 2011 12:49:34 -0600
From: Russell Morris <openembedded@rkmorris.us>
Date: Wed, 05 Jan 2011 12:49:34 -0600
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1294253374472299500@rkmorris.us>
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
X-List-Received-Date: Wed, 05 Jan 2011 19:50:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

Let me try to answer a few questions in one email ... :-). First of all, I=
 tried the patch - unfortunately no joy. It does the same thing as earlier =
builds - let me try to explain, which will hopefully also answer the questi=
ons below.

=20

I applied the patch, and rebuilt from scratch with the minimal distro (del=
eted the TMPDIR completely before building). I built the helloworld-image, =
to get a statically linked executable, and also because it's a pretty small=
 (=3Dfaster) build.

=20

I then looked at the helloworld executable, and a few interesting notes,

- if I readelf -h helloworld, it reports "Version5 EABI" ... so I assume a=
rm5te still?

- if I try to run helloworld using qemu-arm, it runs fine ... with no cpu =
selected (but I did some checking, and the default cpu for qemu-arm is the =
arm5te). If I try to run with a -cpu arm920t option I get the error message=
 "qemu: uncaught target signal 4 (Illegal instruction) - core dumped"

- I was not able to run this on the target right now, as I'm not near it .=
.. but when I did before I either got a core dump (illegal instruction), or=
 it said basically that the file was not found (depending on the executable=
 I tried to run).

=20

One more interesting fact - if I go inside TMPDIR, and then inside work/ar=
mv4t-oe-linux-gnueabi/gcc-cross-4.5-r28.0+svnr167948/gcc-4_5-branch/testsui=
te/gcc.target/arm, there is some sort of test file, with a filename of pr42=
235.c. Oddly enough the first line in this file says ... /* { dg-options "-=
mthumb -O2 -march=3Darmv5te" }  */


Hopefully this all makes sense. I think this says that the executable is s=
till targeting an armv5te ... but I could be wrong! Unfortunately it wouldn=
't be the first time I was off base, and certaintly it won't be the last ..=
. :-(.

=20

Thanks for all your help!

=20

... Russell

=20

=20


On Wed, Jan 5, 2011 11:45  AM, Khem Raj <raj.khem@gmail.com> wrote:


>=20
On Wed, Jan 5, 2011 at 7:11 AM, Phil Blundell <philb@gnu.org> wrote:
> > On Wed, 2011-01-05 at 08:48 -0600, Russell Morris wrote:
> >> Just to confirm - have you run these on an armv4t target? Only asking=
 because my build completes fine, but the executables don't seem to run on =
the target.
> >
> > What exactly happens when you try to run those executables?  Have you
> > inspected them to see if they look like the right kind of thing, and/o=
r
> > compared them to working ones?
> >
> > p.
> >
> >
>=20
>=20
> yes as Phil asked you should try to localize the offending code in the
> faulty binary. So try to enable
> kernel debugging messages so it tells you where its faulting.
> Secondly if you can take a working system
> and see if the new binary faults in same way ? if not then link the
> binary statically and run it again on working
> system and see if it faults again. If it does then you can debug it
> >
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
From gcho-openembedded-devel@m.gmane.org Wed Jan 05 21:09:11 2011
Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PaZfT-0000sz-Nl for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 21:09:11 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PaZf5-00071c-KC for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 21:08:47 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 21:08:47 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmex=
im
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 21:08:47 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 05 Jan 2011 21:08:33 +0100
Lines: 24
Message-ID: <ig2j41$65t$1@dough.gmane.org>
References: <1294253374472299500@rkmorris.us>
Mime-Version: 1.0
Content-Type: text/plain; charset
