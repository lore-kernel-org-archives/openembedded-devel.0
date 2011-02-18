Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PqN5H-00044V-NZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 10:57:07 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 24966491284;
	Fri, 18 Feb 2011 10:55:56 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 18 Feb 2011 10:55:56 +0100
Message-ID: <4D5E422B.3040703@dresearch.de>
Date: Fri, 18 Feb 2011 10:55:55 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
	<4D5A92BC.1010906@dresearch.de>
In-Reply-To: <4D5A92BC.1010906@dresearch.de>
X-OriginalArrivalTime: 18 Feb 2011 09:55:56.0303 (UTC)
	FILETIME=[097399F0:01CBCF52]
Cc: koen@openembedded.org
Subject: Re: linux-libc-headers version (reloaded)
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
X-List-Received-Date: Fri, 18 Feb 2011 09:57:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 15.02.2011 15:50, schrieb Steffen Sledz:
> Am 15.02.2011 15:12, schrieb Andreas Oberritter:
>> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>>> "Kernel headers are backwards compatible, but not forwards compatible=
.  This
>>> means that a program built against a C library using older kernel hea=
ders
>>> should run on a newer kernel (although it may not have access to new
>>> features), but a program built against newer kernel headers may not w=
ork on an
>>> older kernel."[2]
>>
>> Isn't this what the variable OLDEST_KERNEL is good for, when compiling
>> glibc?
>=20
> If i'm right this goes to the --enable-kernel=3DVERSION configure optio=
n of glibc just to optimize the library.
>=20
> "the configure option --enable-kernel=3DX.Y.Z allows to strip out compa=
tibility for kernel versions before X.Y.Z."
>=20
> Imho it is not legitimately to follow that glibc has compatibility code=
 for all kernels greater or equal X.Y.Z.
>=20
> Another question is the handling in other libc implementations.
>=20
> And finally there are a lot of programs using userland kernel headers d=
irectly.

Ping!

If i interpret responses from Tom and Phil right they agree with me (or a=
t least do not disagree). ;-)

But i miss reactions from the distro maintainers (especially =C5ngstr=F6m=
).

Regards,
Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



