Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1StKLb-0005Z6-21
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 17:14:59 +0200
Received: from mail176-co1-R.bigfish.com (10.243.78.229) by
	CO1EHSOBE013.bigfish.com (10.243.66.76) with Microsoft SMTP Server id
	14.1.225.23; Mon, 23 Jul 2012 14:48:25 +0000
Received: from mail176-co1 (localhost [127.0.0.1])	by
	mail176-co1-R.bigfish.com (Postfix) with ESMTP id 6CDA93000CD;
	Mon, 23 Jul 2012 14:48:25 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I168aJ1432Izz1202hzz8275ch8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail176-co1 (localhost.localdomain [127.0.0.1]) by mail176-co1
	(MessageSwitch) id 1343054903161708_28492;
	Mon, 23 Jul 2012 14:48:23 +0000 (UTC)
Received: from CO1EHSMHS015.bigfish.com (unknown [10.243.78.227])	by
	mail176-co1.bigfish.com (Postfix) with ESMTP id 25BCE9C00A5;
	Mon, 23 Jul 2012 14:48:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS015.bigfish.com
	(10.243.66.25) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 23 Jul 2012 14:48:21 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Mon, 23 Jul 2012 09:48:20 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Koen Kooi
	<koen@dominion.thruhere.net>
Thread-Topic: [oe] [meta-oe] cramfs_cvs.bb: fix compile step so it can be
	rerun without failing
Thread-Index: AQHNaOIzGfWfBPRUMUiMFXGOqb1pdQ==
Date: Mon, 23 Jul 2012 14:48:19 +0000
Message-ID: <CAEsOVNcuNkxvbtKmwD=YsBNZ4Lf_A-GMv2rB1dKZzSkA8fkCQQ@mail.gmail.com>
References: <1342802112-9917-1-git-send-email-msm@freescale.com>
In-Reply-To: <1342802112-9917-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe] cramfs_cvs.bb: fix compile step so it can be rerun without failing
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
X-List-Received-Date: Mon, 23 Jul 2012 15:14:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4AC16B2AD0E1BC45B478F7093E07E53A@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Koen,

To get the applied against the denzil branch do I need to submit again
with a for-denzil or should I just request a cherry-pick?

-M

On Fri, Jul 20, 2012 at 11:35 AM, Matthew McClintock <msm@freescale.com> wr=
ote:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
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



