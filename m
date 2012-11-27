Received: from co9ehsobe001.messaging.microsoft.com ([207.46.163.24]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TdTir-0001Es-80
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 23:33:45 +0100
Received: from mail148-co9-R.bigfish.com (10.236.132.235) by
	CO9EHSOBE035.bigfish.com (10.236.130.98) with Microsoft SMTP Server id
	14.1.225.23; Tue, 27 Nov 2012 22:04:24 +0000
Received: from mail148-co9 (localhost [127.0.0.1])	by
	mail148-co9-R.bigfish.com (Postfix) with ESMTP id D2599880104	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 22:04:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 2
X-BigFish: VS2(zz98dI9371I1432Izz1de0h1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh162dh1631hbe9i15d0l1155h)
Received: from mail148-co9 (localhost.localdomain [127.0.0.1]) by mail148-co9
	(MessageSwitch) id 1354053861452479_8406;
	Tue, 27 Nov 2012 22:04:21 +0000 (UTC)
Received: from CO9EHSMHS018.bigfish.com (unknown [10.236.132.249])	by
	mail148-co9.bigfish.com (Postfix) with ESMTP id 62C5658005A	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 22:04:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS018.bigfish.com
	(10.236.130.28) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 27 Nov 2012 22:04:17 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0318.003; Tue, 27 Nov 2012 22:04:16 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Liu Ting-B28495 <B28495@freescale.com>
Thread-Topic: [oe][meta-oe] samba: Fix build on Fedora 17
Thread-Index: AQHNyVn/Sg+xDfUmS0GJoykdAxQe0Zf+Q3iA
Date: Tue, 27 Nov 2012 22:04:15 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A7AE823@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1353661652-29949-1-git-send-email-b28495@freescale.com>
In-Reply-To: <1353661652-29949-1-git-send-email-b28495@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Guo Chunrong-B40290 <B40290@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Zhenhua-B19537 <B19537@freescale.com>, Luo
Subject: Re: [meta-oe] samba: Fix build on Fedora 17
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
X-List-Received-Date: Tue, 27 Nov 2012 22:33:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <97000571C5A26C4AA3AA750864114A51@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2012 at 3:07 AM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>
>
> Fedora 17 has /bin/perl, this causes samba build to put perl interpreter
> path as /bin/perl But we set perl location for target as /usr/bin/perl
>
> This mismatch of perl path causes failure of rootfs image creation:
> | error: Failed dependencies:
> |       /bin/perl is needed by samba-3.6.8-r1.ppce5500
>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta-oe/recipes-connectivity/samba/samba.inc      | 2 ++
>  meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recip=
es-connectivity/samba/samba.inc
> index faa2be0..c4430d1 100644
> --- a/meta-oe/recipes-connectivity/samba/samba.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
> @@ -88,6 +88,8 @@ do_install_append() {
>          install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.s=
o ${D}${libdir}/libnss_winbind.so.2
>          install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so $=
{D}${libdir}/libnss_wins.so.2
>
> +        sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}=
/findsmb
> +

Extra space?

-M

>  }
>
>
> diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/=
recipes-connectivity/samba/samba_3.6.8.bb
> index cc09a48..7c54dae 100644
> --- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> +++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> @@ -3,7 +3,7 @@ require samba-basic.inc
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
>  SRC_URI +=3D "\
>      file://config-h.patch \
> --
> 1.7.11.7
>=



