Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbUI2-0000iw-Gq
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 10:41:19 +0100
Received: from mail6-ch1-R.bigfish.com (10.43.68.254) by
	CH1EHSOBE010.bigfish.com (10.43.70.60) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 08:48:13 +0000
Received: from mail6-ch1 (localhost [127.0.0.1])	by mail6-ch1-R.bigfish.com
	(Postfix) with ESMTP id 71224A014F	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 08:48:21 +0000 (UTC)
X-SpamScore: -23
X-BigFish: VS-23(zz154cP9371I936eK542M1432Nzz1202hzz8275ch8275bh8275dhz2dh2a8h668h839h8e2h8e3h944h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail6-ch1 (localhost.localdomain [127.0.0.1]) by mail6-ch1
	(MessageSwitch) id 1324025299356447_6491;
	Fri, 16 Dec 2011 08:48:19 +0000 (UTC)
Received: from CH1EHSMHS009.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.253])	by mail6-ch1.bigfish.com (Postfix) with ESMTP id
	53263440057 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 08:48:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS009.bigfish.com
	(10.43.70.9) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 08:48:07 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.68]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Fri, 16 Dec 2011 02:48:07 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH meta-oe 1/9] bridge-utils: add
Thread-Index: AQHMu5uQjaA2zmU2Skeop2tBXttldZXeet6A//+eKRA=
Date: Fri, 16 Dec 2011 08:48:07 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A02CE5D@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<jcesvl$4n1$1@dough.gmane.org>
In-Reply-To: <jcesvl$4n1$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH meta-oe 1/9] bridge-utils: add
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
X-List-Received-Date: Fri, 16 Dec 2011 09:41:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-
> devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
> Sent: Friday, December 16, 2011 3:46 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH meta-oe 1/9] bridge-utils: add
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 16-12-11 03:39, b19537@freescale.com schreef:
> > From: Zhenhua Luo <b19537@freescale.com>
> >
> > bridge-utils provides tools for ethernet bridging.
> >
> > Signed-off-by: Zhenhua Luo <b19537@freescale.com> ---
> > .../bridge-utils/bridge-utils.inc                  |   30 +++
> > .../bridge-utils/bridge-utils_1.4.bb               |    6 +
> > .../bridge-utils/files/ifupdown.sh                 |  245
> > ++++++++++++++++++++ 3 files changed, 281 insertions(+), 0
> > ++++++++++++++++++++ deletions(-)
> > create mode 100644
> > meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc create mode
> > 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
> > create mode 100644
> > meta-oe/recipes-connectivity/bridge-utils/files/ifupdown.sh
> >
> > diff --git
> > a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
> > b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc new file
> > mode 100644 index 0000000..5ac6c83 --- /dev/null +++
> > b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc @@ -0,0
> > +1,30 @@ +DESCRIPTION =3D "Tools for ethernet bridging." +HOMEPAGE =3D
> > "http://bridge.sourceforge.net/" +SECTION =3D "console/network" +LICENS=
E
> > =3D "GPL"
>=20
> That's not a valid license
[Luo Zhenhua-B19537] The LICENSE is GPLv2, I will correct it in v2 patch

> > +DEPENDS =3D "sysfsutils" +RRECOMMENDS_${PN} =3D "kernel-module-bridge"
>=20
> That needs to move below do_install. Does it also need ifupdown?
[Luo Zhenhua-B19537] ifupdown.sh is not needed, it will be dropped in v2 pa=
tch.=20


Best Regards,

Zhenhua



