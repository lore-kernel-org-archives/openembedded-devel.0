Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Feb 2020 01:48:03 UTC
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C920A6154B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 01:48:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Feb 2020 17:40:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,458,1574150400"; d="scan'208";a="224337921"
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
	by orsmga007.jf.intel.com with ESMTP; 18 Feb 2020 17:40:49 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.77]) by
	PGSMSX107.gar.corp.intel.com ([169.254.7.43]) with mapi id
	14.03.0439.000; Wed, 19 Feb 2020 09:40:47 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 2/4] pm-graph: Renamed from analyze-suspend
Thread-Index: AQHV5r6tSEat5ZBbwEa1ruOnGYP2caghvYvw
Date: Wed, 19 Feb 2020 01:40:47 +0000
Message-ID: <C0207330DF60C5409302EC78C3FE68F303443370@PGSMSX101.gar.corp.intel.com>
References: <20200219005058.2921658-1-raj.khem@gmail.com>
	<20200219005058.2921658-2-raj.khem@gmail.com>
In-Reply-To: <20200219005058.2921658-2-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTZmNWRmNmQtZjY3ZC00ZGRjLWI3OGUtNTg5MmYzNzM1YzM4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNDJcL0hwSXlNTlpjYzVBbFFZd2VJMk5YXC95bVFFQWV5alBLWmZPaHVUblVwZldSZFhQdHBCejF5Y01wR25JM1hpIn0=
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 2/4] pm-graph: Renamed from analyze-suspend
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
X-List-Received-Date: Wed, 19 Feb 2020 01:48:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is this different from the one that is already in meta-oe?

https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/=
pm-graph

Thanks,

Anuj

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: Wednesday, February 19, 2020 08:51 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH 2/4] pm-graph: Renamed from analyze-suspend
>=20
> Moved to tip to get py3 support
> Point SRC_URI to new location
> Adjust for name changes
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../pm-graph_5.5.bb}                                 | 12 ++++++++----
>  .../packagegroups/packagegroup-meta-oe.bb            |  2 +-
>  2 files changed, 9 insertions(+), 5 deletions(-)  rename meta-oe/recipes=
-
> benchmark/{analyze-suspend/analyze-suspend_5.5.bb =3D> pm-graph/pm-
> graph_5.5.bb} (74%)
>=20
> diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.=
5.bb
> b/meta-oe/recipes-benchmark/pm-graph/pm-graph_5.5.bb
> similarity index 74%
> rename from meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5=
.bb
> rename to meta-oe/recipes-benchmark/pm-graph/pm-graph_5.5.bb
> index bb0aad3413..4f6f3bd40c 100644
> --- a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb
> +++ b/meta-oe/recipes-benchmark/pm-graph/pm-graph_5.5.bb
> @@ -1,4 +1,4 @@
> -SUMMARY =3D "Analyze Suspend"
> +SUMMARY =3D "Analyze Suspend/Resume"
>  DESCRIPTION =3D "analyze-suspend is a tool for system developers to visu=
alize \  the
> activity between suspend and resume, allowing them to identify \  ineffic=
iencies and
> bottlenecks."
> @@ -14,10 +14,11 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e"
>  #   - CONFIG_FUNCTION_TRACER=3Dy
>  #   - CONFIG_FUNCTION_GRAPH_TRACER=3Dy
>=20
> -RDEPENDS_${PN} +=3D "python-core python-datetime python-stringold"
> +RDEPENDS_${PN} +=3D "python3-core python3-datetime python3-stringold"
>=20
> -SRC_URI =3D "git://github.com/01org/suspendresume.git;protocol=3Dhttps"
> -SRCREV =3D "cf59527dc24fdd2f314ae4dcaeb3d68a117988f6"
> +PV .=3D "+git${SRCPV}"
> +SRC_URI =3D "git://github.com/intel/pm-graph;protocol=3Dhttps"
> +SRCREV =3D "3a8cd2fa9aee3afbc7f7e844885ffdcfaf5a1097"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> @@ -27,3 +28,6 @@ do_install() {
>  }
>=20
>  BBCLASSEXTEND =3D "native"
> +
> +RPROVIDES_${PN} =3D "analyze-suspend"
> +
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-
> oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index bad4aa769e..3933619add 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -46,7 +46,7 @@ RDEPENDS_packagegroup-meta-oe =3D "\  "
>=20
>  RDEPENDS_packagegroup-meta-oe-benchmarks =3D "\
> -    analyze-suspend dhrystone iperf2 linpack phoronix-test-suite \
> +    pm-graph dhrystone iperf2 linpack phoronix-test-suite \
>      tiobench bonnie++ fio iperf2 iperf3 lmbench s-suite whetstone \
>      libc-bench memtester sysbench dbench iozone3 libhugetlbfs \
>      nbench-byte tinymembench \
> --
> 2.25.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

