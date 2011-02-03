Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pkyu3-0007i4-HW
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 14:07:15 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id EFDE0491278;
	Thu,  3 Feb 2011 14:06:20 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 3 Feb 2011 14:06:20 +0100
Message-ID: <4D4AA84C.1050001@dresearch.de>
Date: Thu, 03 Feb 2011 14:06:20 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Holger Freyther <holger+oe@freyther.de>
References: <4D4929CB.6040009@dresearch.de>	<4D49552D.3010705@dresearch.de>	<4D4A6796.1070006@dresearch.de>	<AANLkTinyw5W+jaZVba1LyAn5h1c-1kCDt9vXPBERhzk2@mail.gmail.com>	<4D4A88FC.3090706@dresearch.de>
	<4D4A91D9.2040406@freyther.de> <4D4A96A0.4080402@dresearch.de>
	<4D4A9739.6040909@freyther.de> <4D4A9A94.6030108@dresearch.de>
	<4D4A9C30.8010803@freyther.de>
In-Reply-To: <4D4A9C30.8010803@freyther.de>
X-OriginalArrivalTime: 03 Feb 2011 13:06:20.0923 (UTC)
	FILETIME=[26DC04B0:01CBC3A3]
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 03 Feb 2011 13:07:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 03.02.2011 13:14, schrieb Holger Freyther:
> On 02/03/2011 01:07 PM, Steffen Sledz wrote:
>=20
>> But i've no idea what the real problem is. It looks like it's not rela=
ted to the ".init_array" but to the missing `mcount' symbol.
>=20
> This symbol access get added by gcc due the -pg option. Now the questio=
n is
> who should provide this symbol? I would assume it is glibc (actually gr=
epping
> glibc source tree shows it is in gmon/mcount.c).
>=20
> I am not sure why you want to use gprof but anyway...
>=20
> a) do not use gprof on glibc...

I'm not interested in using gprof on glibc. I'm interested in profiling s=
ome other libs/apps only.

But the suggested method to prepare just some packages for profiling does=
 not work jet (see other subthread).

So i tried the suggested method from local.conf.sample with the mentioned=
 result. :(

> b) change the tests to have a mcount symbol...

Sorry, but i did not have time and knowledge to do this.

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



