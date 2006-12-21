Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GxSaa-0002Yc-Uo
	for openembedded-devel@openembedded.org; Thu, 21 Dec 2006 19:24:21 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBLILoLr023941 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2006 19:21:50 +0100
Message-ID: <458AD0BE.2090100@dominion.kabel.utwente.nl>
Date: Thu, 21 Dec 2006 19:21:50 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <458AC366.3030405@dominion.kabel.utwente.nl>
	<1151969252.20061221194402@gmail.com>
In-Reply-To: <1151969252.20061221194402@gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	kBLILoLr023941
Subject: Re: [RFC] Enable tune-thumb.inc for all armv5t and armv6t	machines
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
X-List-Received-Date: Thu, 21 Dec 2006 18:24:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Koen,
>=20
> Thursday, December 21, 2006, 7:24:54 PM, you wrote:
>=20
>> Hi,
>=20
>> Today I seperated the thumb bits from
>> conf/machine/include/ipx4xx.conf into
>> conf/machine/include/. I'd like to enable for all >=3Dv5t machines, bu=
t I'm unsure about
>> using positive or negative logic.
>=20
>   What about armv4t?

The codesourcery people are telling horror stories to everyone about armv=
4t, but I don't
believe them anymore after
http://www.openembedded.org/repo/org.openembedded.dev/packages/gcc/gcc-4.=
1.1/unbreak-armv4t.patch
'fixed' EABI on armv4t. I get the distinct feeling csl is trying to stron=
garm people into
using armv5 and armv6.

>  plus, thumb has known drawback of reduced performance.

I know the 'bx' insn causes a pipeline flush on xscales, any other drawba=
cks? And more
importantly, any numbers?


> In ideal case, thumb usage would be set per-package

Yes, that's where ARM_INSTRUCTION_SET comes in :), although enabling it i=
s messier as
disabling it.
I wasn't impressed by the numbers[1], but samba lost 0.5MB, so that's a c=
andidate

regards,

Koen

[1] =C3=85ngstr=C3=B6m already uses -Os, so the binaries are already pret=
ty small
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFitC+MkyGM64RGpERAtKJAKCdc1K3PuY8xMYrqhY7rvSR37+DuwCgo243
AKRNY2KVB7q8VsxoUDAmJY8=3D
=3Dcau0
-----END PGP SIGNATURE-----


