Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HQA3a-0002LG-5X
	for openembedded-devel@openembedded.org; Sat, 10 Mar 2007 23:28:54 +0100
Received: from dominion.dominion.void (dominion.kabel.utwente.nl
	[130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l2AMSlLr019799 for <openembedded-devel@openembedded.org>;
	Sat, 10 Mar 2007 23:28:47 +0100
Received: from www-data by dominion.dominion.void with local (Exim 4.60)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HQA3V-0003aS-Jr
	for openembedded-devel@openembedded.org; Sat, 10 Mar 2007 23:28:49 +0100
Received: from 201.38.11.131 ([201.38.11.131]) 
	by dominion.kabel.utwente.nl (IMP) with HTTP 
	for <koen@localhost>; Sat, 10 Mar 2007 23:28:49 +0100
Message-ID: <1173565729.45f3312175874@dominion.kabel.utwente.nl>
Date: Sat, 10 Mar 2007 23:28:49 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org
References: <74d0deb30703100820p5f840c5bief6d31baa9672c0b@mail.gmail.com>
	<45F310AE.50307@dominion.kabel.utwente.nl>
	<74d0deb30703101419n58e32cf4vc1a2b917125e9d6a@mail.gmail.com>
In-Reply-To: <74d0deb30703101419n58e32cf4vc1a2b917125e9d6a@mail.gmail.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.6
X-Originating-IP: 201.38.11.131
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
X-Mailman-Approved-At: Sat, 10 Mar 2007 23:36:11 +0100
Subject: Re: Can cross binutils and gcc be made independent of ARM	version?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Mar 2007 22:28:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Quoting pHilipp Zabel <philipp.zabel@gmail.com>:

> On 3/10/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > pHilipp Zabel schreef:
> > > Hi,
> > >
> > > currently binutils-cross, glibc-intermediate and gcc-cross have the
> > > PACKAGE_ARCH set by the MACHINE, in my case armv4t or armv5te,
> > > depending on the device. This causes them to be built twice,
> > > overwriting each other in CROSS_DIR when building a single
> > > distribution for all machines. Is it possible to change PACKAGE_ARCH
> > > to just "arm" for arm cross packages and glibc-intermediate so that
> > > binutils/gcc only have to be built once?
> >
> > libgcc and libc6.so arm architecture specific, so they indeed need to get
> built multiple
> > times. You don't want every app to SIGILL because you built your machines
> in the wrong
> > order :(
>
> Ah, thanks for clearing that up :(
> So I understand we need multiple builds to get libgcc for every arch.
> But what about the contents of CROSS_DIR?
> ${CROSS_DIR}/arm-angstrom-linux-gnueabi/lib/libgcc_s.so will be built
> for either arch, depending on the order the machine toolchains are
> built.
> Is this just not important, or does it mean I can't build for multiple
> arm architectures in the same build dir at all?

Cross/ (and staging/) aren't the problem, OE packaging libgcc1 from gcc-cross
is.

regards,

Koen




----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


