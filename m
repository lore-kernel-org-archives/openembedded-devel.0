Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52C6B719A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 06:33:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA26XwF4013562
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Nov 2016 23:33:58 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.156]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Tue, 1 Nov 2016 23:33:58 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] squid: disable gnu atomic
	operations	for mipsel
Thread-Index: AQHSNNKGI0c4DO1bdUy8+FnPlqww9qDFPDwQ
Date: Wed, 2 Nov 2016 06:33:57 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A322651@ALA-MBA.corp.ad.wrs.com>
References: <20161102061911.18594-1-jackie.huang@windriver.com>
In-Reply-To: <20161102061911.18594-1-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.133]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] squid: disable gnu atomic operations	for mipsel
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
X-List-Received-Date: Wed, 02 Nov 2016 06:33:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Wednesday, November 02, 2016 2:19 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-networking][PATCH] squid: disable gnu atomic operatio=
ns for mipsel
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Disable GNU atomic operations for mipsel since it's
> not supportted.

s/supportted/supported/

Sorry for the typo, fixed and v2 will be sent.

Thanks,
Jackie

>=20
> Refer to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D56300:
>=20
>   There is no hardware support for 8 bytes atomic operations on
>   32-bit MIPS targets.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-networking/recipes-daemons/squid/squid_3.5.20.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb b/meta=
-networking/recipes-
> daemons/squid/squid_3.5.20.bb
> index 364d00e..fc7f768 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
> @@ -38,6 +38,7 @@ USERADD_PARAM_${PN} =3D "--system --no-create-home --ho=
me-dir
> /var/run/squid --she
>=20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('TARGET_ARCH', 'powerpc', 'noa=
tomics', '', d)} \
>                     ${@bb.utils.contains('TARGET_ARCH', 'mips', 'noatomic=
s', '', d)} \
> +                   ${@bb.utils.contains('TARGET_ARCH', 'mipsel', 'noatom=
ics', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6=
', '', d)} \
>                    "
>  PACKAGECONFIG[libnetfilter-conntrack] =3D "--with-netfilter-conntrack=3D=
${includedir}, --without-
> netfilter-conntrack, libnetfilter-conntrack"
> --
> 2.8.3
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

