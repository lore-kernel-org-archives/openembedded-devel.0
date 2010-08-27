Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Op2x1-0002OR-0e
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 19:42:52 +0200
Received: by iwn2 with SMTP id 2so2697914iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ltofhTztMFOTJoz0GXjApk237n2z4vQ9pnFmWhzcJnk=;
	b=vQepJAhXv53RsqV94zAK6jxxKQyEwPOktMWJYw9MYDUy+BOaHInRMP95pg0Grncz36
	E1z9bpPKSHdYonR49eb8TK/Ypwf91SEzTVu08x74KVk5zlnogTJt9nsFgR3OHnpatYwM
	1MC9H+dMOdifg9QQtCbZJ8y32gOWwGByGG+bU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=LKaGuFJv6Y9K4B7eExv+2aCC55MLonOkJXC0Fs6ptXcnfiTNz53KC/2sqZ+dApyyxg
	2dsX5CNj0xdK5aK2hCWCTxchTR5DxpPcn6g64Qh8GECo70OGpK4sMtgXSMvl9M1yZATo
	3aDK0es1Bntpxh6wy28EXvv9L6e0blBPZRJbI=
Received: by 10.231.153.5 with SMTP id i5mr1402358ibw.105.1282930937228; Fri,
	27 Aug 2010 10:42:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 27 Aug 2010 10:41:57 -0700 (PDT)
In-Reply-To: <1282916770549933500@rkmorris.us>
References: <AANLkTin5LRCz6PU_x6Mw+V2Xf8W=i+n4RLqQjwON1R7+@mail.gmail.com>
	<1282916770549933500@rkmorris.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Aug 2010 10:41:57 -0700
Message-ID: <AANLkTi=00LEM9HsXtK8m4LPU0aW6Q-kBOPVaB-6DxfYq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Fri, 27 Aug 2010 17:42:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2010 at 6:46 AM,  <openembedded@rkmorris.us> wrote:
> Hi,
> As I reported recently, I am having issues getting my OE output up and ru=
nning on my h1940 device. It seems to be some sort of issue between the ker=
nel and initrd files, so to debug this I figured that I'd build and test on=
 QEMU (hoping that the recent udev related issues were my problem, and to m=
ake sure that I could build "properly").
> Given this, I went ahead and built console-image (angstrom 2008.1 distro)=
 for qemuarm, to see if it was perhaps just me having issues (which is stil=
l possible). However, I took the output from the qemuarm build and tried to=
 run it ... and still have issues (not the same as my h1940, but still fata=
l).
> On QEMU (verified to work with the QEMU provide example ARM images) I am =
able to boot, at least part way, but end up with a FATAL message about a mi=
ssing directory ... /lib/modules/2.6.17-rc3.
> Is this a known issue? Any proposed fixes or workarounds for this?

oe.dev works well on qemuarm here with

PREFERRED_VERSION_usbutils_local                =3D "0.86"
PREFERRED_VERSION_udev_local                    =3D "151"

in local.conf and minimal/angstrom distro last time I tried it booted
fine. you can also adapt
contrib/qemu/run-qemu.sh to run OE in qemu.

> Thanks!
> ... Russell
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


