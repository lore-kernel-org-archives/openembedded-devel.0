Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PpMFl-0000WQ-FG
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 15:51:45 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 2E76D491286;
	Tue, 15 Feb 2011 15:50:37 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 15 Feb 2011 15:50:37 +0100
Message-ID: <4D5A92BC.1010906@dresearch.de>
Date: Tue, 15 Feb 2011 15:50:36 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
In-Reply-To: <4D5A89CD.803@opendreambox.org>
X-OriginalArrivalTime: 15 Feb 2011 14:50:37.0243 (UTC)
	FILETIME=[B4DFB0B0:01CBCD1F]
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
X-List-Received-Date: Tue, 15 Feb 2011 14:51:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 15.02.2011 15:12, schrieb Andreas Oberritter:
> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>> "Kernel headers are backwards compatible, but not forwards compatible.=
  This
>> means that a program built against a C library using older kernel head=
ers
>> should run on a newer kernel (although it may not have access to new
>> features), but a program built against newer kernel headers may not wo=
rk on an
>> older kernel."[2]
>=20
> Isn't this what the variable OLDEST_KERNEL is good for, when compiling
> glibc?

If i'm right this goes to the --enable-kernel=3DVERSION configure option =
of glibc just to optimize the library.

"the configure option --enable-kernel=3DX.Y.Z allows to strip out compati=
bility for kernel versions before X.Y.Z."

Imho it is not legitimately to follow that glibc has compatibility code f=
or all kernels greater or equal X.Y.Z.

Another question is the handling in other libc implementations.

And finally there are a lot of programs using userland kernel headers dir=
ectly.

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



