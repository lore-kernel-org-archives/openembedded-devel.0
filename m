Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBF8F6E5CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 07:34:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBM7Y1UL000841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 23:34:01 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.162]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Mon, 21 Dec 2015 23:34:01 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH 2/2] openjdk-8: skip the dev-so test
Thread-Index: AQHROWZPYZoosUf3gEC3iIgTrXrWy57WoN8w
Date: Tue, 22 Dec 2015 07:33:58 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C7772BF@ALA-MBA.corp.ad.wrs.com>
References: <1450423916-4811-1-git-send-email-jackie.huang@windriver.com>
	<1450423916-4811-2-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1450423916-4811-2-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.138]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH 2/2] openjdk-8: skip the dev-so test
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Dec 2015 07:34:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this since openjre-8 also has same issue, I will re-patch in
a .inc. But a question I have is, why do we needs a different packaging
strategy for openjdk-8 and there are two recipes: on for openjdk-8 and
another for openjre-8? Openjdk-7 is using one recipe to provide
openjdk-7-jdk and opendk-7-jre.

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Friday, December 18, 2015 3:32 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-java][PATCH 2/2] openjdk-8: skip the dev-so test
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Fixed:
> ERROR: QA Issue: non -dev/-dbg/nativesdk- package contains symlink .so:
> openjdk-8 path
> 'work/core2-64-poky-linux/openjdk-8/72b05-r0/packages-split/openjdk-8/usr=
/lib/jvm/openjdk-
> 8/jre/lib/amd64/server/libjsig.so'
> [dev-so]
>=20
> The symlink .so is valid so we just skip the test
> just like what we does in openjdk-7.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  recipes-core/openjdk/openjdk-8_72b05.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/recipes-core/openjdk/openjdk-8_72b05.bb b/recipes-core/openj=
dk/openjdk-8_72b05.bb
> index d962b1f..8aa9f9f 100644
> --- a/recipes-core/openjdk/openjdk-8_72b05.bb
> +++ b/recipes-core/openjdk/openjdk-8_72b05.bb
> @@ -92,6 +92,9 @@ PROVIDES_${PN} =3D "java2-vm"
>  RPROVIDES_${PN} =3D "java2-runtime"
>  PROVIDES_${PN} =3D "java2-runtime"
>=20
> +# There is a symlink to a .so but this one is valid.
> +INSANE_SKIP_${PN} =3D "dev-so"
> +
>  inherit update-alternatives
>=20
>  ALTERNATIVE_PRIORITY =3D "100"
> --
> 2.3.5
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

