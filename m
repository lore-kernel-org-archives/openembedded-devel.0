Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MdUqV-00049D-La
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 21:59:52 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MdUZv-000FE8-Bz
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 23:42:43 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Aug 2009 23:42:35 +0400
User-Agent: KMail/1.12.0 (Linux/2.6.30-1-amd64; KDE/4.3.0; x86_64; ; )
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>
	<200908181304.08654.khimov@altell.ru> <4A8AEFDE.6020601@cbnco.com>
In-Reply-To: <4A8AEFDE.6020601@cbnco.com>
MIME-Version: 1.0
Message-Id: <200908182342.35155.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9399 [Aug 18 2009]
X-SpamTest-Info: {UDS BL}
X-SpamTest-Info: {DNSBL Rate: low}
X-SpamTest-Method: none
X-SpamTest-Rate: 30
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: x86_64 multilib
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
X-List-Received-Date: Tue, 18 Aug 2009 19:59:59 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 18 =D0=B0=D0=B2=D0=B3=D1=83=D1=
=81=D1=82=D0=B0 2009 22:15:58 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Michael Smith =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Roman I Khimov wrote:
> I had to build my gcc-cross with --disable-multilib because my glibc is
> not multilib. In April you posted a patch series to add multilib support
> for x86_64, but I'm not sure how much of it made it into the tree:
>=20
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/22737

Just the binutils patch, as far as I remember.

> Are you still using that patchset to get working gcc -m32?

Evolved a bit, but most of it should be correct.

OK, I've rebased what I'd had in OE branch and if I've not messed up someth=
ing=20
it should be currently in "rik/amd64" branch. Will check if there is anythi=
ng=20
interesting left in overlay of x86_64 project which from this patchset=20
originated (project itself was released in May and almost not touched since=
,=20
so I had little incentive to continue pushing this changes, unfortunately).=
=20

=46eel free to try/test/enhance with new glibc/gcc versions/corrections, et=
c.=20
I'll probably try to add some new glibc versions on weekend, if time permit=
s.=20
I think the first 4 patches are ready for review/push (although need to tes=
t=20
after rebase), and others mostly need porting to other versions.


