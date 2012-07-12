Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SpQIz-00071K-Cj
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2012 22:48:09 +0200
Received: from mail80-am1-R.bigfish.com (10.3.201.244) by
	AM1EHSOBE010.bigfish.com (10.3.204.30) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Jul 2012 20:06:47 +0000
Received: from mail80-am1 (localhost [127.0.0.1])	by mail80-am1-R.bigfish.com
	(Postfix) with ESMTP id 59CC0220356;
	Thu, 12 Jul 2012 20:06:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275ch8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail80-am1 (localhost.localdomain [127.0.0.1]) by mail80-am1
	(MessageSwitch) id 1342123605233786_29361;
	Thu, 12 Jul 2012 20:06:45 +0000 (UTC)
Received: from AM1EHSMHS016.bigfish.com (unknown [10.3.201.237])	by
	mail80-am1.bigfish.com (Postfix) with ESMTP id 371CE480084;
	Thu, 12 Jul 2012 20:06:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS016.bigfish.com
	(10.3.207.154) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Jul 2012 20:06:45 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Thu, 12 Jul 2012 15:06:45 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Koen Kooi
	<koen@dominion.thruhere.net>
Thread-Topic: [oe] [meta-openembedded v2] cramfs_cvs.bb: fix compile step so
	it can be rerun without failing
Thread-Index: AQHNYGncWkoa8OzIJUKAB+J5oYS/IA==
Date: Thu, 12 Jul 2012 20:06:44 +0000
Message-ID: <CAEsOVNd+w9zgA7SdEDHF24M9fNb+W2pH5rGCX0eyHdwRsFsctA@mail.gmail.com>
References: <CAEsOVNdKQOA1bHMfptKGm7aAabpAxb7+uR7zYxp_W8T9Pf7Tdw@mail.gmail.com>
	<1341590515-9567-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341590515-9567-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-openembedded v2] cramfs_cvs.bb: fix compile step so it can be rerun without failing
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
X-List-Received-Date: Thu, 12 Jul 2012 20:48:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6603D49C09AA844886A321CF54A086B0@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Koen,

Did I miss something for this patch?

-M

On Fri, Jul 6, 2012 at 11:01 AM, Matthew McClintock <msm@freescale.com> wro=
te:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> v2: - use ln -sf instead of separate unlink command
>
>  meta-oe/recipes-support/cramfs/cramfs_cvs.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb b/meta-oe/recip=
es-support/cramfs/cramfs_cvs.bb
> index 667097c..d9b6c06 100644
> --- a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
> +++ b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
> @@ -4,6 +4,7 @@ LIC_FILES_CHKSUM =3D "file://${WORKDIR}/linux/COPYING;md5=
=3D9579385572eb40eded61dcb0
>  DEPENDS =3D "zlib"
>  SRCDATE =3D "20110110"
>  PV =3D "1.1+cvs${SRCDATE}"
> +PR =3D "r1"
>
>  SRC_URI =3D "cvs://anonymous@cramfs.cvs.sourceforge.net/cvsroot/cramfs;m=
odule=3Dlinux"
>  S =3D "${WORKDIR}/linux/scripts/cramfs"
> @@ -16,7 +17,7 @@ EXTRA_OEMAKE =3D "\
>
>
>  do_compile_prepend() {
> -        ln -s GNUmakefile Makefile
> +        ln -sf GNUmakefile Makefile
>  }
>
>  do_install() {
> --
> 1.7.10
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



