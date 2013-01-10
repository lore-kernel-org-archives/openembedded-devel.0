Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TtAAt-0005NH-O1
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 05:55:45 +0100
Received: from mail176-co9-R.bigfish.com (10.236.132.246) by
	CO9EHSOBE032.bigfish.com (10.236.130.95) with Microsoft SMTP Server id
	14.1.225.23; Thu, 10 Jan 2013 04:10:02 +0000
Received: from mail176-co9 (localhost [127.0.0.1])	by
	mail176-co9-R.bigfish.com (Postfix) with ESMTP id 8B1B170022D	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 04:10:02 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bh8275dh17326ahz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758hbe9i1155h)
Received: from mail176-co9 (localhost.localdomain [127.0.0.1]) by mail176-co9
	(MessageSwitch) id 1357791000925408_8229;
	Thu, 10 Jan 2013 04:10:00 +0000 (UTC)
Received: from CO9EHSMHS002.bigfish.com (unknown [10.236.132.242])	by
	mail176-co9.bigfish.com (Postfix) with ESMTP id DFDFAA80047	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 04:10:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS002.bigfish.com
	(10.236.130.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 10 Jan 2013 04:09:57 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.21]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0318.003; Thu, 10 Jan 2013 04:09:56 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] libass: add missing dependency on fribidi
Thread-Index: AQHN7uhZmuyAItAu8U6ZF1tuwVdb2w==
Date: Thu, 10 Jan 2013 04:09:56 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A81CB78@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1357739154-21256-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1357739154-21256-1-git-send-email-marcin.juszkiewicz@linaro.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH] libass: add missing dependency on fribidi
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
X-List-Received-Date: Thu, 10 Jan 2013 04:55:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DBC340F5B5591345BF4180741A4F50B1@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 9, 2013 at 7:45 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Tested-by: Matthew McClintock <msm@freescale.com>

-M

> ---
>  meta-oe/recipes-multimedia/libass/libass.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recip=
es-multimedia/libass/libass.inc
> index f398d49..28d6caa 100644
> --- a/meta-oe/recipes-multimedia/libass/libass.inc
> +++ b/meta-oe/recipes-multimedia/libass/libass.inc
> @@ -5,7 +5,7 @@ SECTION =3D "libs/multimedia"
>  LICENSE =3D "ISC"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ae98663bac55afe5d989919d296f=
28a"
>
> -DEPENDS =3D "enca fontconfig freetype libpng"
> +DEPENDS =3D "enca fontconfig freetype libpng fribidi"
>
>  INC_PR =3D "r1"
>
> --
> 1.8.0
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



