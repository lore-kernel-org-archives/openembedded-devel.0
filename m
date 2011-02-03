Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pkuar-0000JI-26
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 09:31:09 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id DEC8D491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Feb 2011 09:30:14 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 3 Feb 2011 09:30:14 +0100
Message-ID: <4D4A6796.1070006@dresearch.de>
Date: Thu, 03 Feb 2011 09:30:14 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D4929CB.6040009@dresearch.de> <4D49552D.3010705@dresearch.de>
In-Reply-To: <4D49552D.3010705@dresearch.de>
X-OriginalArrivalTime: 03 Feb 2011 08:30:14.0852 (UTC)
	FILETIME=[94B63040:01CBC37C]
Subject: Re: profiling howto?
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
X-List-Received-Date: Thu, 03 Feb 2011 08:31:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 02.02.2011 13:59, schrieb Steffen Sledz:
> Am 02.02.2011 10:54, schrieb Steffen Sledz:
>> Has anybody some instructions/hints how to enable profiling
>> support for selected libs and/or binaries in OE?
>=20
> The local.conf.sample does contain this section:
>=20
> # Uncomment these to build a package such that you can use gprof to pro=
file it.
> # NOTE: This will only work with 'linux' targets, not
> # 'linux-uclibc', as uClibc doesn't provide the necessary
> # object files.  Also, don't build glibc itself with these
> # flags, or it'll fail to build.
> #
> # PROFILE_OPTIMIZATION =3D "-pg"
> # SELECTED_OPTIMIZATION =3D "${PROFILE_OPTIMIZATION}"
> # LDFLAGS =3D+ "-pg"
>=20
> This seems to do the work for the complete image.

Hmmmm? Unfortunately not in all cases. Enabling the options mentioned abo=
ve and making a clean build results in

 | ...
 | checking for .preinit_array/.init_array/.fini_array support... no
 | configure: error: Need linker with .init_array/.fini_array support.
 | ERROR: Function do_configure failed
 NOTE: package glibc-2.9-r36.3: task do_configure: Failed
 ERROR: TaskFailed event exception, aborting
 ERROR: Build of /home/sledz/work/openembedded/recipes/glibc/glibc_2.9.bb=
 do_configure failed
 ERROR: Task 127 (/home/sledz/work/openembedded/recipes/glibc/glibc_2.9.b=
b, do_configure) failed with 256

Any ideas?

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



