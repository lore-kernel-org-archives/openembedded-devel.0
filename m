Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U1N3g-0000oI-EC
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2013 21:18:06 +0100
Received: from mail113-va3-R.bigfish.com (10.7.14.244) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.23; Fri, 1 Feb 2013 19:16:52 +0000
Received: from mail113-va3 (localhost [127.0.0.1])	by
	mail113-va3-R.bigfish.com (Postfix) with ESMTP id BBEBE24024A	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 19:16:52 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1ee6h1de0h1202h1e76h1d1ah1d2ahzz177df4h17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946hbe9i1155h)
Received: from mail113-va3 (localhost.localdomain [127.0.0.1]) by mail113-va3
	(MessageSwitch) id 1359746211453154_1747;
	Fri,  1 Feb 2013 19:16:51 +0000 (UTC)
Received: from VA3EHSMHS003.bigfish.com (unknown [10.7.14.244])	by
	mail113-va3.bigfish.com (Postfix) with ESMTP id 6B34140226	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 19:16:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS003.bigfish.com
	(10.7.99.13) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 1 Feb 2013 19:16:49 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.50]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0318.003;
	Fri, 1 Feb 2013 19:16:48 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Liu Ting-B28495 <B28495@freescale.com>
Thread-Topic: [oe][meta-java][for denzil] 2/4] llvm: not use pythonnative class
Thread-Index: AQHOAGNQz1ejQDaBU0G5B9660MlRGphlYHqA
Date: Fri, 1 Feb 2013 19:16:46 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A868D6C@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1359712968-22554-1-git-send-email-b28495@freescale.com>
	<1359712968-22554-3-git-send-email-b28495@freescale.com>
In-Reply-To: <1359712968-22554-3-git-send-email-b28495@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [meta-java][for denzil] 2/4] llvm: not use pythonnative class
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
X-List-Received-Date: Fri, 01 Feb 2013 20:18:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <47F1B5C65192204093B51043719865A1@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 1, 2013 at 4:02 AM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>

This patch needs more explanation.

-M

> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  recipes-core/llvm/llvm.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
> index de52443..65d36c5 100644
> --- a/recipes-core/llvm/llvm.inc
> +++ b/recipes-core/llvm/llvm.inc
> @@ -26,13 +26,13 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D0ac5f7=
99a2d89477c75b0a378b221855"
>  DEPENDS =3D "llvm${LLVM_RELEASE}-native llvm-common"
>  DEPENDS_virtclass-native =3D "llvm-common-native cmake-native"
>
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
>
>  SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.tgz"
>
>  S =3D "${WORKDIR}/llvm-${PV}"
>
> -inherit cmake perlnative pythonnative
> +inherit cmake perlnative
>
>  # Defines the LLVM supported arches. By now we always build either for $=
{BUILD}
>  # (native) or ${TARGET}. In the future it may make sense to enable all b=
ackends
> --
> 1.7.5.4
>=



