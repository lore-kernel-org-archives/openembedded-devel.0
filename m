Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PkuDN-0008Re-EF
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 09:06:53 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 46D9A491278;
	Thu,  3 Feb 2011 09:05:56 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 3 Feb 2011 09:05:56 +0100
Message-ID: <4D4A61DE.8070808@dresearch.de>
Date: Thu, 03 Feb 2011 09:05:50 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D4929CB.6040009@dresearch.de> <4D49552D.3010705@dresearch.de>
	<4D49584D.3010502@freyther.de>
In-Reply-To: <4D49584D.3010502@freyther.de>
X-OriginalArrivalTime: 03 Feb 2011 08:05:56.0314 (UTC)
	FILETIME=[2F5AF3A0:01CBC379]
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
X-List-Received-Date: Thu, 03 Feb 2011 08:06:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 02.02.2011 14:12, schrieb Holger Freyther:
> On 02/02/2011 01:59 PM, Steffen Sledz wrote:
>> Am 02.02.2011 10:54, schrieb Steffen Sledz:
>>
>> But is it possible to enable profiling for selected libs and/or binari=
es only?
>=20
> yes, you can use the classic override system... just place _pn-PN to th=
ese
> variables or such. But be aware that if your app will call some other l=
ibrary
> and there are no framepointers there will be no backtrace.. same applie=
s to
> functions written in assembly, e.g. memcpy...

Hmmmm? This doesn't seem to work. :(

If local.conf contains this
 ------------->snip<------------
 PROFILE_OPTIMIZATION =3D "-pg"

 SELECTED_OPTIMIZATION_pn-libsoup =3D "${PROFILE_OPTIMIZATION}"
 LDFLAGS_pn-libsoup =3D+ "-pg"

 SELECTED_OPTIMIZATION_pn-libgupnp =3D "${PROFILE_OPTIMIZATION}"
 LDFLAGS_pn-libgupnp =3D+ "-pg"

 SELECTED_OPTIMIZATION_pn-libgssdp =3D "${PROFILE_OPTIMIZATION}"
 LDFLAGS_pn-libgssdp =3D+ "-pg"
 ------------->snip<------------

after a clean build tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4=
-2.29.91-r0/temp/run.do_compile.7972 contains this
 ------------->snip<------------
 export TARGET_CFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-optim=
izations -frename-registers -fomit-frame-pointer -O2 -ggdb2"
 ------------->snip<------------

If setting the optimization params globally in local.conf to
------------->snip<------------
PROFILE_OPTIMIZATION =3D "-pg"
SELECTED_OPTIMIZATION =3D "${PROFILE_OPTIMIZATION}"
LDFLAGS =3D+ "-pg"
------------->snip<------------

everything seems to be OK:
------------->snip<------------
export TARGET_CFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp=
.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -pg"
------------->snip<------------

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



