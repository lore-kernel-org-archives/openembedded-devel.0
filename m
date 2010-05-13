Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OCTlL-0002kC-GT
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 10:27:25 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 933F768416
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 12:23:19 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 May 2010 12:23:22 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <alpine.DEB.2.00.1005121722300.14972@lynx>
	<201005130953.59314.roman@khimov.ru> <20100513064037.GB3370@jama>
In-Reply-To: <20100513064037.GB3370@jama>
MIME-Version: 1.0
Message-Id: <201005131223.22252.khimov@altell.ru>
X-Altell-MailScanner-ID: 933F768416.18973
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some possible fixes in the OE web pages
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
X-List-Received-Date: Thu, 13 May 2010 08:27:25 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 13 =D0=BC=D0=B0=D1=8F 2010 10:40=
:37 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Martin Jansa =D0=BD=D0=B0=D0=BF=D0=B8=D1=
=81=D0=B0=D0=BB:
> On Thu, May 13, 2010 at 09:53:54AM +0400, Roman I Khimov wrote:
> > =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 13 =D0=BC=D0=B0=D1=8F 2010 0=
1:30:53 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Robert P. J. Day=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > > * on http://wiki.openembedded.net/index.php/OEandYourDistro#Ubuntu,
> > > there's a reference to configuring for qemu-arm:
> > >
> > >   echo 128 > /proc/sys/vm/mmap_min_addr
> > >
> > > from memory, i always simply set that to zero on fedora.  is there
> > > something magic about the value 128?  at the moment, it's at the
> > > default value of 65536 on this ubuntu system.
> >
> > With current qemu in OE mmap_min_addr tricks are not needed at all.
>=20
> On some systems (I have report from fedora and kubuntu) it still needs 0
> in mmap_min_addr :/.
>=20
> Investigating why, but it's slow because it doesn't fail on my box.
>=20
> My guess is that this chunk from
> http://git.qemu.org/qemu.git/tree/linux-user/main.c
> cannot work on systems where normal user is not allowed to read
> /proc/sys/vm/mmap_min_addr and mmap_min_addr is not initialized with
> sane value.

Just checked with Ubuntu and Fedora, it really isn't possible to read=20
/proc/sys/vm/mmap_min_addr as regular user, although it has 644 permissions=
 on=20
it. "Security"? Damn.

[after 15 minutes]

OK, actually there is a useful entry on Launchpad:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/568844

The real solution is in the kernel, it should be fixed for latest Ubuntu an=
d=20
hopefully Fedora will catch up on this issue too.

http://git.kernel.org/?p=3Dlinux/kernel/git/jmorris/security-
testing-2.6.git;a=3Dcommitdiff;h=3D822cceec7248013821d655545ea45d1c6a9d15b3

Interesting that openSUSE with 2.6.31 kernel doesn't have such problems... =
And=20
our main build machine with Debian stable + 2.6.30 kernel works fine too.=20
Probably this check got introduced in 2.6.32.

Well, as the problem is in the kernel really, I think everyone having this=
=20
problem should push distro maintainers to update kernels with the tiny fix=
=20
mentioned above. But as a workaround, yep, "0" setting might work (beware t=
hat=20
it might also not work as in here:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/423513
).


