Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SnBMG-0001iJ-Lo
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jul 2012 18:26:17 +0200
Received: from mail4-va3-R.bigfish.com (10.7.14.236) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jul 2012 15:42:46 +0000
Received: from mail4-va3 (localhost [127.0.0.1])	by mail4-va3-R.bigfish.com
	(Postfix) with ESMTP id 9607D1402E1	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2012 15:42:46 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275ch8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail4-va3 (localhost.localdomain [127.0.0.1]) by mail4-va3
	(MessageSwitch) id 1341589359481701_23454;
	Fri,  6 Jul 2012 15:42:39 +0000 (UTC)
Received: from VA3EHSMHS032.bigfish.com (unknown [10.7.14.240])	by
	mail4-va3.bigfish.com (Postfix) with ESMTP id 2084F34004B	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2012 15:42:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS032.bigfish.com
	(10.7.99.42) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jul 2012 15:42:37 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.163]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Fri, 6 Jul 2012 10:44:44 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] cramfs_cvs.bb: fix compile step so it can be
	rerun without failing
Thread-Index: AQHNW45D2R0F75l70k665zan4bU0rg==
Date: Fri, 6 Jul 2012 15:44:44 +0000
Message-ID: <CAEsOVNdMx-EVJZCECXxYTBLcrj0aC+qKLUe7cvJ+g-DryGu4aQ@mail.gmail.com>
References: <1341588382-17688-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341588382-17688-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] cramfs_cvs.bb: fix compile step so it can be rerun without failing
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
X-List-Received-Date: Fri, 06 Jul 2012 16:26:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0F71D923825D544F8C3CC4F4EA81DABE@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Ugh, this is for meta-openembedded...

-M

On Fri, Jul 6, 2012 at 10:26 AM, Matthew McClintock <msm@freescale.com> wro=
te:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta-oe/recipes-support/cramfs/cramfs_cvs.bb |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb b/meta-oe/recip=
es-support/cramfs/cramfs_cvs.bb
> index 667097c..61a3fdd 100644
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
> @@ -16,6 +17,7 @@ EXTRA_OEMAKE =3D "\
>
>
>  do_compile_prepend() {
> +       unlink Makefile || true
>          ln -s GNUmakefile Makefile
>  }
>
> --
> 1.7.10
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



