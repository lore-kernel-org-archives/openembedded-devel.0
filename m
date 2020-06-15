Received: from mailout03.rmx.de (mailout03.rmx.de [94.199.88.101])
 by mx.groups.io with SMTP id smtpd.web11.14020.1592214940326664439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 02:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.101, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout03.rmx.de (Postfix) with ESMTPS id 49lmsx6S4hzlZrh
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2020 11:55:33 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 49lmsx0qt8z2TTND
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2020 11:55:33 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Mon, 15 Jun 2020 11:55:32 +0200
Received: from n95hx1g2.localnet (192.168.54.121) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 15 Jun
 2020 11:55:32 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 2/4] ttf-dejavu: Extend for native and nativesdk
Date: Mon, 15 Jun 2020 11:55:31 +0200
Message-ID: <2750201.qHO2VWJEnn@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <CALbNGRSJb8fUA23=C+ecLN5-VpXb=sh2=cBCy8nR1_2shuBS4Q@mail.gmail.com>
References: <20200609063212.3788-1-ceggers@arri.de> <20200609063212.3788-3-ceggers@arri.de> <CALbNGRSJb8fUA23=C+ecLN5-VpXb=sh2=cBCy8nR1_2shuBS4Q@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.121]
X-OriginalArrivalTime: 15 Jun 2020 09:55:32.0114 (UTC) FILETIME=[1B976720:01D642FB]
X-RMX-ID: 20200615-115533-49lmsx0qt8z2TTND-0@kdin02
X-RMX-SOURCE: 217.111.95.7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Dienstag, 9. Juni 2020, 15:21:50 CEST schrieb Andreas M=FCller:
> On Tue, Jun 9, 2020 at 3:06 PM Christian Eggers <ceggers@arri.de> wrote:
> > When using doxygen together with the "dot" tool (graphviz package), a
> > ttf font package is additionally required.
> >
> > Probably this change could also be moved to ttf.inc.
>
> Extend an allarch recipe to native - sounds odd to me...

My main aim is to get the tools for doxygen into the SDK so that
all developers in the team use the same set of tools for our project.

The SDK has two different sysroots:
- cortexa7t2hf-neon-vfpv4-poky-linux-musleabi (target software)
- x86_64-pokysdk-linux (host software)

When I build the package "foo", the files will be installed into the target
sysroot. When I build "nativesdk-foo", the files will be installed into the
host sysroot.

At least the oe-core package
meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
already extends for native and nativesdk.

Probably the SDK should have a third sysroot for architecture independent
files (allarch packages). Using fonts from the target sysroot for host
applications looks strange for me.

regards
Christian




________________________________
 [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1=
.jpg] <https://microsites.arri.com/stellar/>

Get all the latest information from www.arri.com<https://www.arri.com/>, Fa=
cebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRI=
Channel>, Instagram<https://instagram.com/arri> and YouTube<https://www.you=
tube.com/user/ARRIChannel>.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=FCnchen - Registergericht: Amtsgericht M=FCnchen - Handelsregistern=
ummer: HRA 57918
Pers=F6nlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: M=FCnchen - Registergericht: Amtsgericht M=FCnchen - Handelsregistern=
ummer: HRB 54477
Gesch=E4ftsf=FChrer: Dr. Michael Neuh=E4user; Stephan Schenk; Walter Trauni=
nger; Markus Zeiler
