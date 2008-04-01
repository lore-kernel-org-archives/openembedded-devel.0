Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf@atmel.com>) id 1JgZSB-0006KK-35
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 07:54:39 +0200
Received: from aeglos (217.214.137.124) by pne-smtpout2-sn1.fre.skanova.net
	(7.3.129) (authenticated as 0706224457)
	id 47A77FC401371CAB for openembedded-devel@lists.openembedded.org;
	Tue, 1 Apr 2008 07:54:36 +0200
Message-ID: <005201c893bc$e53f8860$c973fea9@atmel.com>
From: "Ulf Samuelsson" <ulf@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
References: <200803310907.56781.e.robertson.svg@gmail.com><c384c5ea0803310844l1e91faa0m86a699174afeabf7@mail.gmail.com><fsr2gk$t6o$1@ger.gmane.org>
	<200803311134.26764.geoffrey@pager.net>
	<c384c5ea0803311047g1665c14fqfe6fc2417abfb969@mail.gmail.com>
Date: Tue, 1 Apr 2008 07:45:12 +0200
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3138
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3198
Subject: Re: New OE user question
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
X-List-Received-Date: Tue, 01 Apr 2008 05:54:39 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> Hello,
>=20
> On Mon, Mar 31, 2008 at 6:34 PM, Geoffrey Wossum <geoffrey@pager.net> =
wrote:
>> On Monday 31 March 2008 11:12:03 am Koen Kooi wrote:
>>
>> > Leon Woestenberg schreef:
>> > | Can someone suggest a saner distribution for this Samsung chip?
>>  > It's an atmel chip, and atmel itself recommends angstrom:
>>  > =
http://www.linux4sam.org/twiki/bin/view/Linux4SAM/OpenEmbeddedAngstrom
>>
> Whoops on the chip, and yes they do recommend Angstrom when choosing
> OpenEmbedded.
>=20
> Now it seems so far Atmel seems to use buildroot a lot as well.
>=20
>>  recommend against OE / Angstrom.  Interesting side note, it seems =
they
>>  recently had to rollback some of their AVR32 gcc patches in the =
buildroot
>>  mainline because they were breaking stuff there.
>>

There was some minor conflict with the x86, which could probably
be resolved quite easily, but that is not the reason for removing the=20
AVR32 patched.

The main problem for the last month is that AVR32 patches are =
duplicated.
The toolchain patches area about 6-7 MB and it does not make
sense to add bloat for all the buildroot users.

I extended buildroot last year to allow building the AVR32 toolchain =
using
prepatched sources downloaded separately for the AVR32.
The AVR32 patches recently added, duplicated the prepatched
toolchain, and it is simply not worth it, so I reverted it back to
only support the prepatched toolchain.

The AVR32 linux patches were also duplicated in each board directory,=20
and that has also been fixed


> I saw that. I wonder if "there" means uclibc (in case we are affected
> as well), or buildroot specifics (where they break other archs)?


Best Regards
Ulf Samuelsson


