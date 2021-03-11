Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.79])
 by mx.groups.io with SMTP id smtpd.web10.3496.1615452528932488513
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 00:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=FU9Jtg8v;
 spf=pass (domain: kpit.com, ip: 40.107.138.79, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjzdwddCzWNTOqsplTlwSYm96TX//P2kKbNNChxLCjN+ttUjjKUjEiLVit9AryG+RpcMonMEv3u+Z/mOTdu/onvcS/RcLGdFR6gaGM7piFnUwySjWHhZoU+m0QvkqOPnx4khb7Jn9gsRpxEITdnoS3VSKQ72vltdY6eEgslHW+Se0gKwU8L96tUKw/KHbX4+qAGcLRzmrrINm7fTI3Sr7ICwupaKmuRvbIAh+Gs/37a4WxHGfwj31WyGRZ461A5sdLQBuAeYBeZ8JcKmL+lsr+iZtwvd6lI2o65EKLTo6406pzlCL4szdh5QGSYBC5DYnKPBsjiMsTsII5rVOWHwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzLBk5ovBedWf5oCBe8b+Sib4lI7WwVJxssxvN4r23w=;
 b=EuLBS7FMn38Wx8WYFAy2HoAJ7y82/RiovOIyzMA3D6qpwraqFcCfsAKQcv+AzNTGTTJPqZjv5l/i2I1zgQOWY23pWKOaO3h7vuwJpnDWK57RlpzA3F0ZoBPdG9fEQXOfT2zMA5BStUCtZ2NYmvMwnBXfmFg+cYUVpiuPq1PuDnnSJUWDgm3wOrNF/DXUB+96BXew2bs5XWKuGVpI4L7E6Ek9w7Avul8QmP04Kl1Ev6pXmGgQJ4tI4DTGqbiScI/fKpPQWKqqDCLHcTQl+3S3npu3cIUWh2SNCjYOWCA16V1euj70C6e7Xc8sNi8m/X6VHBUTLNzj61/3YesjdW5J5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzLBk5ovBedWf5oCBe8b+Sib4lI7WwVJxssxvN4r23w=;
 b=FU9Jtg8v1gRJsF9oozwDsWQyB2Y3maWe3gU9lOhUuCWcnlhSOND/a1TCpZWVsX/9yxYgw7iKPndHQxQn7XrUtnNdZpt4DRdIoD40dXtHtJ3WEHk+ufcn+bxepqRkdfH3GdVidnFP/b8o+5xPwWkVvwti3Jtnn29eXp9c/Z8Bmpg=
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BM1PR01MB2227.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.31; Thu, 11 Mar
 2021 08:48:38 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5120:b913:587f:c87]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5120:b913:587f:c87%3]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 08:48:38 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [meta-oe][dunfell][PATCH] opencv: Security fixes
Thread-Topic: [meta-oe][dunfell][PATCH] opencv: Security fixes
Thread-Index: AQHXFNarcE2Yf28IqkaHGWdFnTtRHKp+fNpL
Date: Thu, 11 Mar 2021 08:48:37 +0000
Message-ID: 
 <BMXPR01MB23583757F3CB650D7FCD9D689F909@BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM>
References: <1615289016-26533-1-git-send-email-Neetika.Singh@kpit.com>
In-Reply-To: <1615289016-26533-1-git-send-email-Neetika.Singh@kpit.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [183.83.47.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1b4b37a3-6581-44b5-5033-08d8e46a76ed
x-ms-traffictypediagnostic: BM1PR01MB2227:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BM1PR01MB22272301FC0E495123BF34A99F909@BM1PR01MB2227.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:234;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aOmgBUIX7v5YTJYAzicRbpY7005ROX9i3jncWc4+5PEGiBI5ehU6C0JqN22wfPDAwloZ4KN4GX9gY955qN1N+QRkpMdGhSOM9ssKvFOileQiA2x+uG2hovfuDchUCW8hSr0L21ohuLnXnlg8yZgL/JW9ESaQrVYbltAGVo5q/XnJ8ZPh67NMsnRjjQLFoLUZSd+mVMKD+Sr7P2C++0DPurXupvIDDLLtVeVpbF2lPeBSui8B0XZrnRZW/9jeklyT+TX0F/2aNNs8MKpU3oFz+uk5ZGortWn3Ly1OADlFMHhgjMswQjRt96pD2fph/wOrfWUZcxBRIeScXM02g0II9qY2B8pQLSknDaZKbVlVbZdGxLoh6SZEeV0ixpbZuHStUeTFcILdE53LIImAE6tNS8bUezYjsr5WJjT8HVBghIro8jG6fi7fXnmmiM1MCTPp5j6OJFJ4GpsMIct99ZiFEvP6pB+6yQ3ZnGxs0ZIsW4SBURQvdV1Cb3dEATVt0I+M9gq3XV3xRQ0c/pr+Go2k310CvBC0khN1I33+AK/N9l5Osl18IIbpv/hKsKSyLDNpnprjmEgk87yCMdDDsBZjYfK+Kqgq/Yw/uLARstCzEf8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39850400004)(83380400001)(9686003)(166002)(26005)(186003)(66446008)(64756008)(66574015)(7696005)(8936002)(316002)(55016002)(86362001)(33656002)(966005)(478600001)(53546011)(5660300002)(107886003)(2906002)(6506007)(19627405001)(91956017)(76116006)(71200400001)(8676002)(52536014)(110136005)(30864003)(15650500001)(4326008)(66946007)(66556008)(66476007)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?WETSaZnD8iMcc3VxcB9QV3CTul86XRMZXonYM892HbuFQ1/2Z4ZwQEB3zkZd?=
 =?us-ascii?Q?F5lGjAICeQ1Os6pYe8q8HcDscLGRIGY1BmoSCK/hFrM7AQSZV+SH97FFha7j?=
 =?us-ascii?Q?FxNFLbxvA68XcwplsogDb6J3JCVq/gtKYxmDQ19qtWOMnYlizCeYU8+U1Q86?=
 =?us-ascii?Q?+ClgKRgjwsRv677/95tp8IpBVLHuSTNP+6OvoL/ZCNtGJgzgWFYzQkcC408g?=
 =?us-ascii?Q?9zzTtPd+1uLRvBGOkeXLwGcELeqCNhIhnVFVmIxd4FMH1ufVYJ7Tj25AMYdZ?=
 =?us-ascii?Q?rmyPB2ZhZpi+5Z07RT2utedC0MJQIN6zsGmnCTS+I19nn3yuD5jnfwfSH9hQ?=
 =?us-ascii?Q?SYDq3hRLRhb3pjIvbNszdIF9QXYYEbfn1WmWEjoUK8+szIef397LxpVRIXO4?=
 =?us-ascii?Q?O29nVCdaPvYoNbGKcKQmyGo8FjIb+grHLgjrwRPuqtp59phi2qLOPKFyUgNL?=
 =?us-ascii?Q?b5sDjPOOtcOagoh3/j1YAalCqHQFM8WSqidQqV+xXOjg3556zDxj2sQNNLqZ?=
 =?us-ascii?Q?MSEaRwUBVqqm87CdT8tW4kZthWPFaFhiHopjVh+qbgzbfNLeDtsan4bhTjDL?=
 =?us-ascii?Q?hDutlxSACmWEX/cMmI65+hdda7seHdbijUSn48iCsC1PSKjL1aIGD6hmW95N?=
 =?us-ascii?Q?XOECJrVXCZh7GaSi+I7PrnMc5ZwSI1kKL1IY8RzpLRVbBt3niVfSIB54XZek?=
 =?us-ascii?Q?nK+Llm9nORpGga0XY/9oCAWyCZ+0/MYvSE5UPAa4vV/X+tN3kQn58V2/zeTI?=
 =?us-ascii?Q?QvH57320dc7VZucewEY/rJW/PgazdbE9tVXla2xHzutCvGY4kym1XVPQJity?=
 =?us-ascii?Q?xlvg4pfgM3mEk7u8UnYlGfxpCVmZkqf4IbAV50SNWqnFVfYKhgJ+FVSuxzDr?=
 =?us-ascii?Q?QbaINegkpnKJo2S0Sb+vBiN9uW/+dL/nV14key2kgyocshSVxhyQ5F0Swgt8?=
 =?us-ascii?Q?EQfCx5+WWDXtj1YOm9OLd2QxkjRUcqRgnkOOz+Sk87mv2hTDjJfiRXBEKkFI?=
 =?us-ascii?Q?dz50pVCRG7npPXvJKEL0eCfqIpksdZmT4n40P+3R3hRbsoGckJgjfUiinQTe?=
 =?us-ascii?Q?yvrW2ohgUKU4vx/A6soAaQwIp6SC9MmuhzJ6odM/nsXpKd1zGxgU9aMD0qDl?=
 =?us-ascii?Q?g99HMUKMlkf6kQ7tgKbVS/AJFkIm2mOwdY055k8aejOpY47virevDlFC+sK2?=
 =?us-ascii?Q?25MAS6x4XrebazrT5BmL2EHeS1JqG6eg18jqTlaVIjYEEnNMid8l7d0c80wm?=
 =?us-ascii?Q?ILcEzgeZodyhGka29IDSSppaMBHBWxfgjNRuW0sKf7pVNPirT3O+ajlEXpwO?=
 =?us-ascii?Q?7Rs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4b37a3-6581-44b5-5033-08d8e46a76ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 08:48:37.9129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nEFsaWIUMZ+Try3pTklctsyxwZEqKEzGVtG27pmwLrCZG208Pztx0oA8m6RPMD2zeVMq3VuK+VjX7LlT1a7Yiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2227
Content-Language: en-IN
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB23583757F3CB650D7FCD9D689F909BMXPR01MB2358INDP_"

--_000_BMXPR01MB23583757F3CB650D7FCD9D689F909BMXPR01MB2358INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Gentle Reminder!

 Thanks & Regards,
 Neetika Singh
 Product Engineering Services (PES)
 KPIT Technologies Limited


________________________________
From: Neetika Singh <Neetika.Singh@kpit.com>
Sent: 09 March 2021 16:53
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Neetika Singh <Neetika.Singh@=
kpit.com>
Subject: [meta-oe][dunfell][PATCH] opencv: Security fixes

From: Neetika Singh <Neetika.Singh@kpit.com>

Added patches to fix below CVE's:

1. CVE-2019-14491, CVE-2019-14492
Link: https://github.com/opencv/opencv/commit/ac425f67e4c1d0da9afb9203f0918=
d8d57c067ed

2. CVE-2019-14493
Link: https://github.com/opencv/opencv/commit/5691d998ead1d9b0542bcfced36c2=
dceb3a59023

3. CVE-2019-15939
Link: https://github.com/opencv/opencv/commit/5a497077f109d543ab86dfdf8add1=
c76c0e47d29

4. CVE-2019-19624
Link: https://github.com/opencv/opencv/commit/d1615ba11a93062b1429fce9f0f63=
8d1572d3418

Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
---
 .../opencv/opencv/CVE-2019-14491.patch             | 148 +++++++++++++
 .../opencv/opencv/CVE-2019-14493.patch             | 237 +++++++++++++++++=
++++
 .../opencv/opencv/CVE-2019-15939.patch             |  73 +++++++
 .../opencv/opencv/CVE-2019-19624.patch             | 157 ++++++++++++++
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb     |   4 +
 5 files changed, 619 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.pa=
tch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.pa=
tch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.pa=
tch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.pa=
tch

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
new file mode 100644
index 0000000..b82bea5
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
@@ -0,0 +1,148 @@
+From 321c74ccd6077bdea1d47450ca4fe955cb5b6330 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Thu, 25 Jul 2019 17:15:59 +0300
+Subject: [PATCH] objdetect: validate feature rectangle on reading
+
+CVE: CVE-2019-14491
+CVE: CVE-2019-14492
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/ac425f6=
7e4c1d0da9afb9203f0918d8d57c067ed.patch]
+Comment: No changes in any hunk
+
+Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+---
+ modules/objdetect/src/cascadedetect.cpp | 43 +++++++++++++++++++++----
+ modules/objdetect/src/cascadedetect.hpp |  6 ++--
+ 2 files changed, 40 insertions(+), 9 deletions(-)
+
+diff --git a/modules/objdetect/src/cascadedetect.cpp b/modules/objdetect/s=
rc/cascadedetect.cpp
+index 4b2078306fe..bd62cd21a1b 100644
+--- a/modules/objdetect/src/cascadedetect.cpp
++++ b/modules/objdetect/src/cascadedetect.cpp
+@@ -47,6 +47,10 @@
+ #include "opencv2/objdetect/objdetect_c.h"
+ #include "opencl_kernels_objdetect.hpp"
+
++#if defined(_MSC_VER)
++#  pragma warning(disable:4458)  // declaration of 'origWinSize' hides cl=
ass member
++#endif
++
+ namespace cv
+ {
+
+@@ -537,7 +541,7 @@ bool FeatureEvaluator::setImage( InputArray _image, co=
nst std::vector<float>& _s
+
+ //----------------------------------------------  HaarEvaluator ---------=
------------------------------
+
+-bool HaarEvaluator::Feature :: read( const FileNode& node )
++bool HaarEvaluator::Feature::read(const FileNode& node, const Size& origW=
inSize)
+ {
+     FileNode rnode =3D node[CC_RECTS];
+     FileNodeIterator it =3D rnode.begin(), it_end =3D rnode.end();
+@@ -549,11 +553,23 @@ bool HaarEvaluator::Feature :: read( const FileNode&=
 node )
+         rect[ri].weight =3D 0.f;
+     }
+
++    const int W =3D origWinSize.width;
++    const int H =3D origWinSize.height;
++
+     for(ri =3D 0; it !=3D it_end; ++it, ri++)
+     {
+         FileNodeIterator it2 =3D (*it).begin();
+-        it2 >> rect[ri].r.x >> rect[ri].r.y >>
+-            rect[ri].r.width >> rect[ri].r.height >> rect[ri].weight;
++        Feature::RectWeigth& rw =3D rect[ri];
++        it2 >> rw.r.x >> rw.r.y >> rw.r.width >> rw.r.height >> rw.weight=
;
++        // input validation
++        {
++            CV_CheckGE(rw.r.x, 0, "Invalid HAAR feature");
++            CV_CheckGE(rw.r.y, 0, "Invalid HAAR feature");
++            CV_CheckLT(rw.r.x, W, "Invalid HAAR feature");  // necessary =
for overflow checks
++            CV_CheckLT(rw.r.y, H, "Invalid HAAR feature");  // necessary =
for overflow checks
++            CV_CheckLE(rw.r.x + rw.r.width, W, "Invalid HAAR feature");
++            CV_CheckLE(rw.r.y + rw.r.height, H, "Invalid HAAR feature");
++        }
+     }
+
+     tilted =3D (int)node[CC_TILTED] !=3D 0;
+@@ -598,7 +614,7 @@ bool HaarEvaluator::read(const FileNode& node, Size _o=
rigWinSize)
+
+     for(i =3D 0; i < n; i++, ++it)
+     {
+-        if(!ff[i].read(*it))
++        if(!ff[i].read(*it, _origWinSize))
+             return false;
+         if( ff[i].tilted )
+             hasTiltedFeatures =3D true;
+@@ -759,11 +775,24 @@ int HaarEvaluator::getSquaresOffset() const
+ }
+
+ //----------------------------------------------  LBPEvaluator ----------=
---------------------------
+-bool LBPEvaluator::Feature :: read(const FileNode& node )
++bool LBPEvaluator::Feature::read(const FileNode& node, const Size& origWi=
nSize)
+ {
+     FileNode rnode =3D node[CC_RECT];
+     FileNodeIterator it =3D rnode.begin();
+     it >> rect.x >> rect.y >> rect.width >> rect.height;
++
++    const int W =3D origWinSize.width;
++    const int H =3D origWinSize.height;
++    // input validation
++    {
++        CV_CheckGE(rect.x, 0, "Invalid LBP feature");
++        CV_CheckGE(rect.y, 0, "Invalid LBP feature");
++        CV_CheckLT(rect.x, W, "Invalid LBP feature");
++        CV_CheckLT(rect.y, H, "Invalid LBP feature");
++        CV_CheckLE(rect.x + rect.width, W, "Invalid LBP feature");
++        CV_CheckLE(rect.y + rect.height, H, "Invalid LBP feature");
++    }
++
+     return true;
+ }
+
+@@ -797,7 +826,7 @@ bool LBPEvaluator::read( const FileNode& node, Size _o=
rigWinSize )
+     std::vector<Feature>& ff =3D *features;
+     for(int i =3D 0; it !=3D it_end; ++it, i++)
+     {
+-        if(!ff[i].read(*it))
++        if(!ff[i].read(*it, _origWinSize))
+             return false;
+     }
+     nchannels =3D 1;
+@@ -1477,6 +1506,8 @@ bool CascadeClassifierImpl::Data::read(const FileNod=
e &root)
+     origWinSize.width =3D (int)root[CC_WIDTH];
+     origWinSize.height =3D (int)root[CC_HEIGHT];
+     CV_Assert( origWinSize.height > 0 && origWinSize.width > 0 );
++    CV_CheckLE(origWinSize.width, 1000000, "Invalid window size (too larg=
e)");
++    CV_CheckLE(origWinSize.height, 1000000, "Invalid window size (too lar=
ge)");
+
+     // load feature params
+     FileNode fn =3D root[CC_FEATURE_PARAMS];
+diff --git a/modules/objdetect/src/cascadedetect.hpp b/modules/objdetect/s=
rc/cascadedetect.hpp
+index f9910530b94..d9a288fcdda 100644
+--- a/modules/objdetect/src/cascadedetect.hpp
++++ b/modules/objdetect/src/cascadedetect.hpp
+@@ -317,12 +317,12 @@ class HaarEvaluator CV_FINAL : public FeatureEvaluat=
or
+     struct Feature
+     {
+         Feature();
+-        bool read( const FileNode& node );
++        bool read(const FileNode& node, const Size& origWinSize);
+
+         bool tilted;
+
+         enum { RECT_NUM =3D 3 };
+-        struct
++        struct RectWeigth
+         {
+             Rect r;
+             float weight;
+@@ -412,7 +412,7 @@ class LBPEvaluator CV_FINAL : public FeatureEvaluator
+         Feature( int x, int y, int _block_w, int _block_h  ) :
+                  rect(x, y, _block_w, _block_h) {}
+
+-        bool read(const FileNode& node );
++        bool read(const FileNode& node, const Size& origWinSize);
+
+         Rect rect; // weight and height for block
+     };
+
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
new file mode 100644
index 0000000..88d6a7f
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
@@ -0,0 +1,237 @@
+From 5691d998ead1d9b0542bcfced36c2dceb3a59023 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Thu, 25 Jul 2019 15:14:22 +0300
+Subject: [PATCH] core(persistence): added null ptr checks
+
+CVE: CVE-2019-14493
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/5691d99=
8ead1d9b0542bcfced36c2dceb3a59023.patch]
+Comment: No changes in any hunk
+
+Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+---
+ modules/core/src/persistence_json.cpp | 12 ++++++++++++
+ modules/core/src/persistence_xml.cpp  | 21 +++++++++++++++++++++
+ modules/core/src/persistence_yml.cpp  | 21 +++++++++++++++++++++
+ 3 files changed, 54 insertions(+)
+
+diff --git a/modules/core/src/persistence_json.cpp b/modules/core/src/pers=
istence_json.cpp
+index ae678e1b8b1..89914e6534f 100644
+--- a/modules/core/src/persistence_json.cpp
++++ b/modules/core/src/persistence_json.cpp
+@@ -296,6 +296,8 @@ class JSONParser : public FileStorageParser
+
+         while ( is_eof =3D=3D false && is_completed =3D=3D false )
+         {
++            if (!ptr)
++                CV_PARSE_ERROR_CPP("Invalid input");
+             switch ( *ptr )
+             {
+                 /* comment */
+@@ -381,6 +383,7 @@ class JSONParser : public FileStorageParser
+         if ( is_eof || !is_completed )
+         {
+             ptr =3D fs->bufferStart();
++            CV_Assert(ptr);
+             *ptr =3D '\0';
+             fs->setEof();
+             if( !is_completed )
+@@ -392,6 +395,9 @@ class JSONParser : public FileStorageParser
+
+     char* parseKey( char* ptr, FileNode& collection, FileNode& value_plac=
eholder )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         if( *ptr !=3D '"' )
+             CV_PARSE_ERROR_CPP( "Key must start with \'\"\'" );
+
+@@ -430,6 +436,9 @@ class JSONParser : public FileStorageParser
+
+     char* parseValue( char* ptr, FileNode& node )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid value input");
++
+         ptr =3D skipSpaces( ptr );
+         if( !ptr || !*ptr )
+             CV_PARSE_ERROR_CPP( "Unexpected End-Of-File" );
+@@ -817,6 +826,9 @@ class JSONParser : public FileStorageParser
+
+     bool parse( char* ptr )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         ptr =3D skipSpaces( ptr );
+         if ( !ptr || !*ptr )
+             return false;
+diff --git a/modules/core/src/persistence_xml.cpp b/modules/core/src/persi=
stence_xml.cpp
+index fb30d90896e..89876dd3da8 100644
+--- a/modules/core/src/persistence_xml.cpp
++++ b/modules/core/src/persistence_xml.cpp
+@@ -360,6 +360,9 @@ class XMLParser : public FileStorageParser
+
+     char* skipSpaces( char* ptr, int mode )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         int level =3D 0;
+
+         for(;;)
+@@ -441,6 +444,9 @@ class XMLParser : public FileStorageParser
+
+     char* parseValue( char* ptr, FileNode& node )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         FileNode new_elem;
+         bool have_space =3D true;
+         int value_type =3D node.type();
+@@ -456,6 +462,8 @@ class XMLParser : public FileStorageParser
+                 (c =3D=3D '<' && ptr[1] =3D=3D '!' && ptr[2] =3D=3D '-') =
)
+             {
+                 ptr =3D skipSpaces( ptr, 0 );
++                if (!ptr)
++                    CV_PARSE_ERROR_CPP("Invalid input");
+                 have_space =3D true;
+                 c =3D *ptr;
+             }
+@@ -502,6 +510,8 @@ class XMLParser : public FileStorageParser
+                 {
+                     ptr =3D fs->parseBase64( ptr, 0, new_elem);
+                     ptr =3D skipSpaces( ptr, 0 );
++                    if (!ptr)
++                        CV_PARSE_ERROR_CPP("Invalid input");
+                 }
+
+                 ptr =3D parseTag( ptr, key2, type_name, tag_type );
+@@ -645,6 +655,9 @@ class XMLParser : public FileStorageParser
+     char* parseTag( char* ptr, std::string& tag_name,
+                     std::string& type_name, int& tag_type )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid tag input");
++
+         if( *ptr =3D=3D '\0' )
+             CV_PARSE_ERROR_CPP( "Unexpected end of the stream" );
+
+@@ -702,6 +715,8 @@ class XMLParser : public FileStorageParser
+                 if( *ptr !=3D '=3D' )
+                 {
+                     ptr =3D skipSpaces( ptr, CV_XML_INSIDE_TAG );
++                    if (!ptr)
++                        CV_PARSE_ERROR_CPP("Invalid attribute");
+                     if( *ptr !=3D '=3D' )
+                         CV_PARSE_ERROR_CPP( "Attribute name should be fol=
lowed by \'=3D\'" );
+                 }
+@@ -740,6 +755,8 @@ class XMLParser : public FileStorageParser
+             if( c !=3D '>' )
+             {
+                 ptr =3D skipSpaces( ptr, CV_XML_INSIDE_TAG );
++                if (!ptr)
++                    CV_PARSE_ERROR_CPP("Invalid input");
+                 c =3D *ptr;
+             }
+
+@@ -781,6 +798,8 @@ class XMLParser : public FileStorageParser
+
+         // CV_XML_INSIDE_TAG is used to prohibit leading comments
+         ptr =3D skipSpaces( ptr, CV_XML_INSIDE_TAG );
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
+
+         if( memcmp( ptr, "<?xml", 5 ) !=3D 0 )  // FIXIT ptr[1..] - out o=
f bounds read without check
+             CV_PARSE_ERROR_CPP( "Valid XML should start with \'<?xml ...?=
>\'" );
+@@ -791,6 +810,8 @@ class XMLParser : public FileStorageParser
+         while( ptr && *ptr !=3D '\0' )
+         {
+             ptr =3D skipSpaces( ptr, 0 );
++            if (!ptr)
++                CV_PARSE_ERROR_CPP("Invalid input");
+
+             if( *ptr !=3D '\0' )
+             {
+diff --git a/modules/core/src/persistence_yml.cpp b/modules/core/src/persi=
stence_yml.cpp
+index 4129ca1dc57..7742e827701 100644
+--- a/modules/core/src/persistence_yml.cpp
++++ b/modules/core/src/persistence_yml.cpp
+@@ -330,6 +330,9 @@ class YAMLParser : public FileStorageParser
+
+     char* skipSpaces( char* ptr, int min_indent, int max_comment_indent )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         for(;;)
+         {
+             while( *ptr =3D=3D ' ' )
+@@ -374,6 +377,9 @@ class YAMLParser : public FileStorageParser
+
+     bool getBase64Row(char* ptr, int indent, char* &beg, char* &end)
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         beg =3D end =3D ptr =3D skipSpaces(ptr, 0, INT_MAX);
+         if (!ptr || !*ptr)
+             return false; // end of file
+@@ -394,6 +400,9 @@ class YAMLParser : public FileStorageParser
+
+     char* parseKey( char* ptr, FileNode& map_node, FileNode& value_placeh=
older )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         char c;
+         char *endptr =3D ptr - 1, *saveptr;
+
+@@ -422,6 +431,9 @@ class YAMLParser : public FileStorageParser
+
+     char* parseValue( char* ptr, FileNode& node, int min_indent, bool is_=
parent_flow )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         char* endptr =3D 0;
+         char c =3D ptr[0], d =3D ptr[1];
+         int value_type =3D FileNode::NONE;
+@@ -508,6 +520,8 @@ class YAMLParser : public FileStorageParser
+
+             *endptr =3D d;
+             ptr =3D skipSpaces( endptr, min_indent, INT_MAX );
++            if (!ptr)
++                CV_PARSE_ERROR_CPP("Invalid input");
+
+             c =3D *ptr;
+
+@@ -634,6 +648,8 @@ class YAMLParser : public FileStorageParser
+                 FileNode elem;
+
+                 ptr =3D skipSpaces( ptr, new_min_indent, INT_MAX );
++                if (!ptr)
++                    CV_PARSE_ERROR_CPP("Invalid input");
+                 if( *ptr =3D=3D '}' || *ptr =3D=3D ']' )
+                 {
+                     if( *ptr !=3D d )
+@@ -647,6 +663,8 @@ class YAMLParser : public FileStorageParser
+                     if( *ptr !=3D ',' )
+                         CV_PARSE_ERROR_CPP( "Missing , between the elemen=
ts" );
+                     ptr =3D skipSpaces( ptr + 1, new_min_indent, INT_MAX =
);
++                    if (!ptr)
++                        CV_PARSE_ERROR_CPP("Invalid input");
+                 }
+
+                 if( struct_type =3D=3D FileNode::MAP )
+@@ -746,6 +764,9 @@ class YAMLParser : public FileStorageParser
+
+     bool parse( char* ptr )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         bool first =3D true;
+         bool ok =3D true;
+         FileNode root_collection(fs->getFS(), 0, 0);
+
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
new file mode 100644
index 0000000..35d62cf
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
@@ -0,0 +1,73 @@
+From 5a497077f109d543ab86dfdf8add1c76c0e47d29 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Fri, 23 Aug 2019 16:14:53 +0300
+Subject: [PATCH] objdetect: add input check in HOG detector
+
+CVE: CVE-2019-15939
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/5a49707=
7f109d543ab86dfdf8add1c76c0e47d29.patch]
+Comment: No changes in any hunk
+
+Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+---
+ modules/objdetect/src/hog.cpp | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/modules/objdetect/src/hog.cpp b/modules/objdetect/src/hog.cpp
+index 9524851eebb..378bab30876 100644
+--- a/modules/objdetect/src/hog.cpp
++++ b/modules/objdetect/src/hog.cpp
+@@ -68,6 +68,7 @@ enum {DESCR_FORMAT_COL_BY_COL, DESCR_FORMAT_ROW_BY_ROW};
+
+ static int numPartsWithin(int size, int part_size, int stride)
+ {
++    CV_Assert(stride !=3D 0);
+     return (size - part_size + stride) / stride;
+ }
+
+@@ -80,13 +81,17 @@ static Size numPartsWithin(cv::Size size, cv::Size par=
t_size,
+
+ static size_t getBlockHistogramSize(Size block_size, Size cell_size, int =
nbins)
+ {
++    CV_Assert(!cell_size.empty());
+     Size cells_per_block =3D Size(block_size.width / cell_size.width,
+-        block_size.height / cell_size.height);
++                                block_size.height / cell_size.height);
+     return (size_t)(nbins * cells_per_block.area());
+ }
+
+ size_t HOGDescriptor::getDescriptorSize() const
+ {
++    CV_Assert(!cellSize.empty());
++    CV_Assert(!blockStride.empty());
++
+     CV_Assert(blockSize.width % cellSize.width =3D=3D 0 &&
+         blockSize.height % cellSize.height =3D=3D 0);
+     CV_Assert((winSize.width - blockSize.width) % blockStride.width =3D=
=3D 0 &&
+@@ -144,20 +149,20 @@ bool HOGDescriptor::read(FileNode& obj)
+     if( !obj.isMap() )
+         return false;
+     FileNodeIterator it =3D obj["winSize"].begin();
+-    it >> winSize.width >> winSize.height;
++    it >> winSize.width >> winSize.height; CV_Assert(!winSize.empty());
+     it =3D obj["blockSize"].begin();
+-    it >> blockSize.width >> blockSize.height;
++    it >> blockSize.width >> blockSize.height; CV_Assert(!blockSize.empty=
());
+     it =3D obj["blockStride"].begin();
+-    it >> blockStride.width >> blockStride.height;
++    it >> blockStride.width >> blockStride.height; CV_Assert(!blockStride=
.empty());
+     it =3D obj["cellSize"].begin();
+-    it >> cellSize.width >> cellSize.height;
+-    obj["nbins"] >> nbins;
++    it >> cellSize.width >> cellSize.height; CV_Assert(!cellSize.empty())=
;
++    obj["nbins"] >> nbins; CV_Assert(nbins > 0);
+     obj["derivAperture"] >> derivAperture;
+     obj["winSigma"] >> winSigma;
+     obj["histogramNormType"] >> histogramNormType;
+     obj["L2HysThreshold"] >> L2HysThreshold;
+     obj["gammaCorrection"] >> gammaCorrection;
+-    obj["nlevels"] >> nlevels;
++    obj["nlevels"] >> nlevels; CV_Assert(nlevels > 0);
+     if (obj["signedGradient"].empty())
+         signedGradient =3D false;
+     else
+
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
new file mode 100644
index 0000000..923ca2a
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
@@ -0,0 +1,157 @@
+From d1615ba11a93062b1429fce9f0f638d1572d3418 Mon Sep 17 00:00:00 2001
+From: Thang Tran <TranKimThang279@gmail.com>
+Date: Mon, 27 May 2019 08:18:26 +0200
+Subject: [PATCH] video:fixed DISOpticalFlow segfault from small img
+
+CVE: CVE-2019-19624
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/d1615ba=
11a93062b1429fce9f0f638d1572d3418.patch]
+Comment: No changes in any hunk
+
+Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+---
+ modules/video/src/dis_flow.cpp          | 67 ++++++++++++++++++++++++-
+ modules/video/test/test_OF_accuracy.cpp | 28 +++++++++++
+ 2 files changed, 93 insertions(+), 2 deletions(-)
+
+diff --git a/modules/video/src/dis_flow.cpp b/modules/video/src/dis_flow.c=
pp
+index a453d8b2b51..806d6f1ddaf 100644
+--- a/modules/video/src/dis_flow.cpp
++++ b/modules/video/src/dis_flow.cpp
+@@ -140,6 +140,8 @@ class DISOpticalFlowImpl CV_FINAL : public DISOpticalF=
low
+     void prepareBuffers(Mat &I0, Mat &I1, Mat &flow, bool use_flow);
+     void precomputeStructureTensor(Mat &dst_I0xx, Mat &dst_I0yy, Mat &dst=
_I0xy, Mat &dst_I0x, Mat &dst_I0y, Mat &I0x,
+                                    Mat &I0y);
++    int autoSelectCoarsestScale(int img_width);
++    void autoSelectPatchSizeAndScales(int img_width);
+
+     struct PatchInverseSearch_ParBody : public ParallelLoopBody
+     {
+@@ -435,6 +437,44 @@ void DISOpticalFlowImpl::precomputeStructureTensor(Ma=
t &dst_I0xx, Mat &dst_I0yy,
+     }
+ }
+
++int DISOpticalFlowImpl::autoSelectCoarsestScale(int img_width)
++{
++    const int fratio =3D 5;
++    return std::max(0, (int)std::floor(log2((2.0f*(float)img_width) / ((f=
loat)fratio * (float)patch_size))));
++}
++
++void DISOpticalFlowImpl::autoSelectPatchSizeAndScales(int img_width)
++{
++    switch (finest_scale)
++    {
++    case 1:
++        patch_size =3D 8;
++        coarsest_scale =3D autoSelectCoarsestScale(img_width);
++        finest_scale =3D std::max(coarsest_scale-2, 0);
++        break;
++
++    case 3:
++        patch_size =3D 12;
++        coarsest_scale =3D autoSelectCoarsestScale(img_width);
++        finest_scale =3D std::max(coarsest_scale-4, 0);
++        break;
++
++    case 4:
++        patch_size =3D 12;
++        coarsest_scale =3D autoSelectCoarsestScale(img_width);
++        finest_scale =3D std::max(coarsest_scale-5, 0);
++        break;
++
++    // default case, fall-through.
++    case 2:
++    default:
++        patch_size =3D 8;
++        coarsest_scale =3D autoSelectCoarsestScale(img_width);
++        finest_scale =3D std::max(coarsest_scale-2, 0);
++        break;
++    }
++}
++
+ DISOpticalFlowImpl::PatchInverseSearch_ParBody::PatchInverseSearch_ParBod=
y(DISOpticalFlowImpl &_dis, int _nstripes,
+                                                                          =
  int _hs, Mat &dst_Sx, Mat &dst_Sy,
+                                                                          =
  Mat &src_Ux, Mat &src_Uy, Mat &_I0, Mat &_I1,
+@@ -1318,9 +1358,20 @@ bool DISOpticalFlowImpl::ocl_calc(InputArray I0, In=
putArray I1, InputOutputArray
+     else
+         flow.create(I1Mat.size(), CV_32FC2);
+     UMat &u_flowMat =3D flow.getUMatRef();
+-    coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *=
 patch_size)) / log(2.0) + 0.5), /* Original code serach for maximal moveme=
nt of width/4 */
++    coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *=
 patch_size)) / log(2.0) + 0.5), /* Original code search for maximal moveme=
nt of width/4 */
+                          (int)(log(min(I0Mat.cols, I0Mat.rows) / patch_si=
ze) / log(2.0)));              /* Deepest pyramid level greater or equal th=
an patch*/
+
++    if (coarsest_scale<0)
++        CV_Error(cv::Error::StsBadSize, "The input image must have either=
 width or height >=3D 12");
++
++    if (coarsest_scale<finest_scale)
++    {
++        // choose the finest level based on coarsest level.
++        // Refs: https://github.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d=
3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L239
++        int original_img_width =3D I0.size().width;
++        autoSelectPatchSizeAndScales(original_img_width);
++    }
++
+     ocl_prepareBuffers(I0Mat, I1Mat, u_flowMat, use_input_flow);
+     u_Ux[coarsest_scale].setTo(0.0f);
+     u_Uy[coarsest_scale].setTo(0.0f);
+@@ -1385,8 +1436,20 @@ void DISOpticalFlowImpl::calc(InputArray I0, InputA=
rray I1, InputOutputArray flo
+     else
+         flow.create(I1Mat.size(), CV_32FC2);
+     Mat flowMat =3D flow.getMat();
+-    coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *=
 patch_size)) / log(2.0) + 0.5), /* Original code serach for maximal moveme=
nt of width/4 */
++    coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *=
 patch_size)) / log(2.0) + 0.5), /* Original code search for maximal moveme=
nt of width/4 */
+                          (int)(log(min(I0Mat.cols, I0Mat.rows) / patch_si=
ze) / log(2.0)));              /* Deepest pyramid level greater or equal th=
an patch*/
++
++    if (coarsest_scale<0)
++        CV_Error(cv::Error::StsBadSize, "The input image must have either=
 width or height >=3D 12");
++
++    if (coarsest_scale<finest_scale)
++    {
++        // choose the finest level based on coarsest level.
++        // Refs: https://github.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d=
3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L239
++        int original_img_width =3D I0.size().width;
++        autoSelectPatchSizeAndScales(original_img_width);
++    }
++
+     int num_stripes =3D getNumThreads();
+
+     prepareBuffers(I0Mat, I1Mat, flowMat, use_input_flow);
+diff --git a/modules/video/test/test_OF_accuracy.cpp b/modules/video/test/=
test_OF_accuracy.cpp
+index affbab65866..b99ffce2a8b 100644
+--- a/modules/video/test/test_OF_accuracy.cpp
++++ b/modules/video/test/test_OF_accuracy.cpp
+@@ -121,6 +121,34 @@ TEST(DenseOpticalFlow_DIS, ReferenceAccuracy)
+     }
+ }
+
++TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanZero)
++{
++    cv::Ptr<cv::DISOpticalFlow> of =3D cv::DISOpticalFlow::create();
++    const int mat_size =3D 10;
++
++    cv::Mat x(mat_size, mat_size, CV_8UC1, 42);
++    cv::Mat y(mat_size, mat_size, CV_8UC1, 42);
++    cv::Mat flow;
++
++    ASSERT_THROW(of->calc(x, y, flow), cv::Exception);
++}
++
++// make sure that autoSelectPatchSizeAndScales() works properly.
++TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanFinestLeve=
l)
++{
++    cv::Ptr<cv::DISOpticalFlow> of =3D cv::DISOpticalFlow::create();
++    const int mat_size =3D 80;
++
++    cv::Mat x(mat_size, mat_size, CV_8UC1, 42);
++    cv::Mat y(mat_size, mat_size, CV_8UC1, 42);
++    cv::Mat flow;
++
++    of->calc(x, y, flow);
++
++    ASSERT_EQ(flow.rows, mat_size);
++    ASSERT_EQ(flow.cols, mat_size);
++}
++
+ TEST(DenseOpticalFlow_VariationalRefinement, ReferenceAccuracy)
+ {
+     Mat frame1, frame2, GT;
+
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recip=
es-support/opencv/opencv_4.1.0.bb
index d781da6..de708fd 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -50,6 +50,10 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Do=
pencv \
            file://0001-Dont-use-isystem.patch \
            file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-=
g.patch \
            file://download.patch \
+           file://CVE-2019-14491.patch \
+           file://CVE-2019-14493.patch \
+           file://CVE-2019-15939.patch \
+           file://CVE-2019-19624.patch \
            "
 PV =3D "4.1.0"

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BMXPR01MB23583757F3CB650D7FCD9D689F909BMXPR01MB2358INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Gentle Reminder!<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<font size=3D"3" face=3D"'Segoe UI',Sans-Serif"></font>
<div name=3D"divtagdefaultwrapper" style=3D"margin:0px">
<div name=3D"divtagdefaultwrapper" style=3D"margin:0px"><font style=3D"" si=
ze=3D"3" face=3D"'Segoe UI',Sans-Serif" color=3D"black"><span dir=3D"ltr" s=
tyle=3D"font-size: 12pt; background-color: white;">
<div id=3D"Signature"><font size=3D"2"><span style=3D"font-size:11pt"><font=
 style=3D"" color=3D"003366"><span style=3D"font-size:9pt" lang=3D"en-IN">&=
nbsp;</span></font></span>Thanks &amp; Regards,<br>
</font>
<div style=3D"margin:0"><font size=3D"2">&nbsp;<font style=3D"" color=3D"00=
3366">Neetika Singh<br>
&nbsp;Product Engineering Services (PES)</font></font></div>
<div style=3D"margin:0"><font size=3D"2"><font style=3D"" color=3D"003366">=
&nbsp;KPIT Technologies Limited<br>
</font></font></div>
<font size=3D"2"></font>
<div style=3D"margin:0"><br>
</div>
<font style=3D"" color=3D"00CCFF"></font>
<div style=3D"margin:0"><font style=3D"" color=3D"00CCFF"></font>
<div><font style=3D"" color=3D"00CCFF"></font>
<div style=3D"margin:0"><span style=3D"font-size:11pt"><font style=3D"" col=
or=3D"00CCFF"><b><span style=3D"font-size:9pt" lang=3D"en-IN"></span><span =
style=3D"font-size:9pt" lang=3D"en-IN"></span></b></font><font style=3D"" c=
olor=3D"#8EAADB"><span style=3D"font-size:10pt" lang=3D"en-IN"><b><br>
</b></span></font></span></div>
</div>
</div>
</div>
</span></font></div>
</div>
<font size=3D"3" face=3D"'Segoe UI',Sans-Serif"></font></div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Neetika Singh &lt;Nee=
tika.Singh@kpit.com&gt;<br>
<b>Sent:</b> 09 March 2021 16:53<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<=
br>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Neetika Singh &l=
t;Neetika.Singh@kpit.com&gt;<br>
<b>Subject:</b> [meta-oe][dunfell][PATCH] opencv: Security fixes</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Neetika Singh &lt;Neetika.Singh@kpit.com&gt;=
<br>
<br>
Added patches to fix below CVE's:<br>
<br>
1. CVE-2019-14491, CVE-2019-14492<br>
Link: <a href=3D"https://github.com/opencv/opencv/commit/ac425f67e4c1d0da9a=
fb9203f0918d8d57c067ed">
https://github.com/opencv/opencv/commit/ac425f67e4c1d0da9afb9203f0918d8d57c=
067ed</a><br>
<br>
2. CVE-2019-14493<br>
Link: <a href=3D"https://github.com/opencv/opencv/commit/5691d998ead1d9b054=
2bcfced36c2dceb3a59023">
https://github.com/opencv/opencv/commit/5691d998ead1d9b0542bcfced36c2dceb3a=
59023</a><br>
<br>
3. CVE-2019-15939<br>
Link: <a href=3D"https://github.com/opencv/opencv/commit/5a497077f109d543ab=
86dfdf8add1c76c0e47d29">
https://github.com/opencv/opencv/commit/5a497077f109d543ab86dfdf8add1c76c0e=
47d29</a><br>
<br>
4. CVE-2019-19624<br>
Link: <a href=3D"https://github.com/opencv/opencv/commit/d1615ba11a93062b14=
29fce9f0f638d1572d3418">
https://github.com/opencv/opencv/commit/d1615ba11a93062b1429fce9f0f638d1572=
d3418</a><br>
<br>
Signed-off-by: Neetika.Singh &lt;Neetika.Singh@kpit.com&gt;<br>
---<br>
&nbsp;.../opencv/opencv/CVE-2019-14491.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 148 +++++++++++++<br>
&nbsp;.../opencv/opencv/CVE-2019-14493.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 237 +++++++++++++++++++++<br>
&nbsp;.../opencv/opencv/CVE-2019-15939.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 73 +++++++<br>
&nbsp;.../opencv/opencv/CVE-2019-19624.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 157 ++++++++++++++<br>
&nbsp;meta-oe/recipes-support/opencv/opencv_4.1.0.bb&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 4 +<br>
&nbsp;5 files changed, 619 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-144=
91.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-144=
93.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-159=
39.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-196=
24.patch<br>
<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch<br>
new file mode 100644<br>
index 0000000..b82bea5<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch<br>
@@ -0,0 +1,148 @@<br>
+From 321c74ccd6077bdea1d47450ca4fe955cb5b6330 Mon Sep 17 00:00:00 2001<br>
+From: Alexander Alekhin &lt;alexander.alekhin@intel.com&gt;<br>
+Date: Thu, 25 Jul 2019 17:15:59 +0300<br>
+Subject: [PATCH] objdetect: validate feature rectangle on reading<br>
+<br>
+CVE: CVE-2019-14491<br>
+CVE: CVE-2019-14492<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/opencv/opencv/com=
mit/ac425f67e4c1d0da9afb9203f0918d8d57c067ed.patch">https://github.com/open=
cv/opencv/commit/ac425f67e4c1d0da9afb9203f0918d8d57c067ed.patch</a>]<br>
+Comment: No changes in any hunk<br>
+<br>
+Signed-off-by: Neetika Singh &lt;Neetika.Singh@kpit.com&gt;<br>
+---<br>
+ modules/objdetect/src/cascadedetect.cpp | 43 +++++++++++++++++++++----<br=
>
+ modules/objdetect/src/cascadedetect.hpp |&nbsp; 6 ++--<br>
+ 2 files changed, 40 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/modules/objdetect/src/cascadedetect.cpp b/modules/objdetect/s=
rc/cascadedetect.cpp<br>
+index 4b2078306fe..bd62cd21a1b 100644<br>
+--- a/modules/objdetect/src/cascadedetect.cpp<br>
++++ b/modules/objdetect/src/cascadedetect.cpp<br>
+@@ -47,6 +47,10 @@<br>
+ #include &quot;opencv2/objdetect/objdetect_c.h&quot;<br>
+ #include &quot;opencl_kernels_objdetect.hpp&quot;<br>
+ <br>
++#if defined(_MSC_VER)<br>
++#&nbsp; pragma warning(disable:4458)&nbsp; // declaration of 'origWinSize=
' hides class member<br>
++#endif<br>
++<br>
+ namespace cv<br>
+ {<br>
+ <br>
+@@ -537,7 +541,7 @@ bool FeatureEvaluator::setImage( InputArray _image, co=
nst std::vector&lt;float&gt;&amp; _s<br>
+ <br>
+ //----------------------------------------------&nbsp; HaarEvaluator ----=
-----------------------------------<br>
+ <br>
+-bool HaarEvaluator::Feature :: read( const FileNode&amp; node )<br>
++bool HaarEvaluator::Feature::read(const FileNode&amp; node, const Size&am=
p; origWinSize)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FileNode rnode =3D node[CC_RECTS];<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FileNodeIterator it =3D rnode.begin(), it_end =3D=
 rnode.end();<br>
+@@ -549,11 +553,23 @@ bool HaarEvaluator::Feature :: read( const FileNode&=
amp; node )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rect[ri].weight =3D 0.f;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
++&nbsp;&nbsp;&nbsp; const int W =3D origWinSize.width;<br>
++&nbsp;&nbsp;&nbsp; const int H =3D origWinSize.height;<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; for(ri =3D 0; it !=3D it_end; ++it, ri++)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FileNodeIterator it2 =3D =
(*it).begin();<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; it2 &gt;&gt; rect[ri].r.x &gt;=
&gt; rect[ri].r.y &gt;&gt;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rect[r=
i].r.width &gt;&gt; rect[ri].r.height &gt;&gt; rect[ri].weight;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Feature::RectWeigth&amp; rw =
=3D rect[ri];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; it2 &gt;&gt; rw.r.x &gt;&gt; r=
w.r.y &gt;&gt; rw.r.width &gt;&gt; rw.r.height &gt;&gt; rw.weight;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // input validation<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_Che=
ckGE(rw.r.x, 0, &quot;Invalid HAAR feature&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_Che=
ckGE(rw.r.y, 0, &quot;Invalid HAAR feature&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_Che=
ckLT(rw.r.x, W, &quot;Invalid HAAR feature&quot;);&nbsp; // necessary for o=
verflow checks<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_Che=
ckLT(rw.r.y, H, &quot;Invalid HAAR feature&quot;);&nbsp; // necessary for o=
verflow checks<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_Che=
ckLE(rw.r.x + rw.r.width, W, &quot;Invalid HAAR feature&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_Che=
ckLE(rw.r.y + rw.r.height, H, &quot;Invalid HAAR feature&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; tilted =3D (int)node[CC_TILTED] !=3D 0;<br>
+@@ -598,7 +614,7 @@ bool HaarEvaluator::read(const FileNode&amp; node, Siz=
e _origWinSize)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; for(i =3D 0; i &lt; n; i++, ++it)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!ff[i].read(*it))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!ff[i].read(*it, _origWinSi=
ze))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( ff[i].tilted )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h=
asTiltedFeatures =3D true;<br>
+@@ -759,11 +775,24 @@ int HaarEvaluator::getSquaresOffset() const<br>
+ }<br>
+ <br>
+ //----------------------------------------------&nbsp; LBPEvaluator -----=
--------------------------------<br>
+-bool LBPEvaluator::Feature :: read(const FileNode&amp; node )<br>
++bool LBPEvaluator::Feature::read(const FileNode&amp; node, const Size&amp=
; origWinSize)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FileNode rnode =3D node[CC_RECT];<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FileNodeIterator it =3D rnode.begin();<br>
+&nbsp;&nbsp;&nbsp;&nbsp; it &gt;&gt; rect.x &gt;&gt; rect.y &gt;&gt; rect.=
width &gt;&gt; rect.height;<br>
++<br>
++&nbsp;&nbsp;&nbsp; const int W =3D origWinSize.width;<br>
++&nbsp;&nbsp;&nbsp; const int H =3D origWinSize.height;<br>
++&nbsp;&nbsp;&nbsp; // input validation<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_CheckGE(rect.x, 0, &quot;In=
valid LBP feature&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_CheckGE(rect.y, 0, &quot;In=
valid LBP feature&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_CheckLT(rect.x, W, &quot;In=
valid LBP feature&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_CheckLT(rect.y, H, &quot;In=
valid LBP feature&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_CheckLE(rect.x + rect.width=
, W, &quot;Invalid LBP feature&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_CheckLE(rect.y + rect.heigh=
t, H, &quot;Invalid LBP feature&quot;);<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
+ }<br>
+ <br>
+@@ -797,7 +826,7 @@ bool LBPEvaluator::read( const FileNode&amp; node, Siz=
e _origWinSize )<br>
+&nbsp;&nbsp;&nbsp;&nbsp; std::vector&lt;Feature&gt;&amp; ff =3D *features;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp; for(int i =3D 0; it !=3D it_end; ++it, i++)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!ff[i].read(*it))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!ff[i].read(*it, _origWinSi=
ze))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; nchannels =3D 1;<br>
+@@ -1477,6 +1506,8 @@ bool CascadeClassifierImpl::Data::read(const FileNod=
e &amp;root)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; origWinSize.width =3D (int)root[CC_WIDTH];<br>
+&nbsp;&nbsp;&nbsp;&nbsp; origWinSize.height =3D (int)root[CC_HEIGHT];<br>
+&nbsp;&nbsp;&nbsp;&nbsp; CV_Assert( origWinSize.height &gt; 0 &amp;&amp; o=
rigWinSize.width &gt; 0 );<br>
++&nbsp;&nbsp;&nbsp; CV_CheckLE(origWinSize.width, 1000000, &quot;Invalid w=
indow size (too large)&quot;);<br>
++&nbsp;&nbsp;&nbsp; CV_CheckLE(origWinSize.height, 1000000, &quot;Invalid =
window size (too large)&quot;);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; // load feature params<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FileNode fn =3D root[CC_FEATURE_PARAMS];<br>
+diff --git a/modules/objdetect/src/cascadedetect.hpp b/modules/objdetect/s=
rc/cascadedetect.hpp<br>
+index f9910530b94..d9a288fcdda 100644<br>
+--- a/modules/objdetect/src/cascadedetect.hpp<br>
++++ b/modules/objdetect/src/cascadedetect.hpp<br>
+@@ -317,12 +317,12 @@ class HaarEvaluator CV_FINAL : public FeatureEvaluat=
or<br>
+&nbsp;&nbsp;&nbsp;&nbsp; struct Feature<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Feature();<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool read( const FileNode&amp;=
 node );<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool read(const FileNode&amp; =
node, const Size&amp; origWinSize);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool tilted;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum { RECT_NUM =3D 3 };<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct RectWeigth<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R=
ect r;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
loat weight;<br>
+@@ -412,7 +412,7 @@ class LBPEvaluator CV_FINAL : public FeatureEvaluator<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Feature( int x, int y, in=
t _block_w, int _block_h&nbsp; ) :<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; rect(x, y, _block_w, _block_h) {}<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool read(const FileNode&amp; =
node );<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool read(const FileNode&amp; =
node, const Size&amp; origWinSize);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rect rect; // weight and =
height for block<br>
+&nbsp;&nbsp;&nbsp;&nbsp; };<br>
+<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch<br>
new file mode 100644<br>
index 0000000..88d6a7f<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch<br>
@@ -0,0 +1,237 @@<br>
+From 5691d998ead1d9b0542bcfced36c2dceb3a59023 Mon Sep 17 00:00:00 2001<br>
+From: Alexander Alekhin &lt;alexander.alekhin@intel.com&gt;<br>
+Date: Thu, 25 Jul 2019 15:14:22 +0300<br>
+Subject: [PATCH] core(persistence): added null ptr checks<br>
+<br>
+CVE: CVE-2019-14493<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/opencv/opencv/com=
mit/5691d998ead1d9b0542bcfced36c2dceb3a59023.patch">https://github.com/open=
cv/opencv/commit/5691d998ead1d9b0542bcfced36c2dceb3a59023.patch</a>]<br>
+Comment: No changes in any hunk<br>
+<br>
+Signed-off-by: Neetika Singh &lt;Neetika.Singh@kpit.com&gt;<br>
+---<br>
+ modules/core/src/persistence_json.cpp | 12 ++++++++++++<br>
+ modules/core/src/persistence_xml.cpp&nbsp; | 21 +++++++++++++++++++++<br>
+ modules/core/src/persistence_yml.cpp&nbsp; | 21 +++++++++++++++++++++<br>
+ 3 files changed, 54 insertions(+)<br>
+<br>
+diff --git a/modules/core/src/persistence_json.cpp b/modules/core/src/pers=
istence_json.cpp<br>
+index ae678e1b8b1..89914e6534f 100644<br>
+--- a/modules/core/src/persistence_json.cpp<br>
++++ b/modules/core/src/persistence_json.cpp<br>
+@@ -296,6 +296,8 @@ class JSONParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while ( is_eof =3D=3D fal=
se &amp;&amp; is_completed =3D=3D false )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!p=
tr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; CV_PARSE_ERROR_CPP(&quot;Invalid input&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
witch ( *ptr )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; /* comment */<br>
+@@ -381,6 +383,7 @@ class JSONParser : public FileStorageParser<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( is_eof || !is_comple=
ted )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
tr =3D fs-&gt;bufferStart();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_Ass=
ert(ptr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
ptr =3D '\0';<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
s-&gt;setEof();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f( !is_completed )<br>
+@@ -392,6 +395,9 @@ class JSONParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; char* parseKey( char* ptr, FileNode&amp; collecti=
on, FileNode&amp; value_placeholder )<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid input&quot;);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( *ptr !=3D '&quot;' )<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; C=
V_PARSE_ERROR_CPP( &quot;Key must start with \'\&quot;\'&quot; );<br>
+ <br>
+@@ -430,6 +436,9 @@ class JSONParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; char* parseValue( char* ptr, FileNode&amp; node )=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid value input&quot;);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr =3D skipSpaces( ptr )=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( !ptr || !*ptr )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; C=
V_PARSE_ERROR_CPP( &quot;Unexpected End-Of-File&quot; );<br>
+@@ -817,6 +826,9 @@ class JSONParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; bool parse( char* ptr )<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid input&quot;);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr =3D skipSpaces( ptr )=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( !ptr || !*ptr )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn false;<br>
+diff --git a/modules/core/src/persistence_xml.cpp b/modules/core/src/persi=
stence_xml.cpp<br>
+index fb30d90896e..89876dd3da8 100644<br>
+--- a/modules/core/src/persistence_xml.cpp<br>
++++ b/modules/core/src/persistence_xml.cpp<br>
+@@ -360,6 +360,9 @@ class XMLParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; char* skipSpaces( char* ptr, int mode )<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid input&quot;);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int level =3D 0;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for(;;)<br>
+@@ -441,6 +444,9 @@ class XMLParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; char* parseValue( char* ptr, FileNode&amp; node )=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid input&quot;);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FileNode new_elem;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool have_space =3D true;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int value_type =3D node.t=
ype();<br>
+@@ -456,6 +462,8 @@ class XMLParser : public FileStorageParser<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; (c =3D=3D '&lt;' &amp;&amp; ptr[1] =3D=3D '!' &amp;&=
amp; ptr[2] =3D=3D '-') )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; ptr =3D skipSpaces( ptr, 0 );<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PARSE_ERROR_CPP(&quot;Invalid =
input&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; have_space =3D true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; c =3D *ptr;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
+@@ -502,6 +510,8 @@ class XMLParser : public FileStorageParser<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr =3D fs-&gt;parseBase64( =
ptr, 0, new_elem);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr =3D skipSpaces( ptr, 0 )=
;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PARSE_=
ERROR_CPP(&quot;Invalid input&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; ptr =3D parseTag( ptr, key2, type_name, tag_type );<=
br>
+@@ -645,6 +655,9 @@ class XMLParser : public FileStorageParser<br>
+&nbsp;&nbsp;&nbsp;&nbsp; char* parseTag( char* ptr, std::string&amp; tag_n=
ame,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; std::string&amp; type_name, =
int&amp; tag_type )<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid tag input&quot;);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( *ptr =3D=3D '\0' )<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; C=
V_PARSE_ERROR_CPP( &quot;Unexpected end of the stream&quot; );<br>
+ <br>
+@@ -702,6 +715,8 @@ class XMLParser : public FileStorageParser<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; if( *ptr !=3D '=3D' )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr =3D skipSpaces( ptr, CV_=
XML_INSIDE_TAG );<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PARSE_=
ERROR_CPP(&quot;Invalid attribute&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( *ptr !=3D '=3D' )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_P=
ARSE_ERROR_CPP( &quot;Attribute name should be followed by \'=3D\'&quot; );=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; }<br>
+@@ -740,6 +755,8 @@ class XMLParser : public FileStorageParser<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f( c !=3D '&gt;' )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; ptr =3D skipSpaces( ptr, CV_XML_INSIDE_TAG );<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PARSE_ERROR_CPP(&quot;Invalid =
input&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; c =3D *ptr;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
+ <br>
+@@ -781,6 +798,8 @@ class XMLParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // CV_XML_INSIDE_TAG is u=
sed to prohibit leading comments<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr =3D skipSpaces( ptr, =
CV_XML_INSIDE_TAG );<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid input&quot;);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( memcmp( ptr, &quot;&l=
t;?xml&quot;, 5 ) !=3D 0 )&nbsp; // FIXIT ptr[1..] - out of bounds read wit=
hout check<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; C=
V_PARSE_ERROR_CPP( &quot;Valid XML should start with \'&lt;?xml ...?&gt;\'&=
quot; );<br>
+@@ -791,6 +810,8 @@ class XMLParser : public FileStorageParser<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while( ptr &amp;&amp; *pt=
r !=3D '\0' )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
tr =3D skipSpaces( ptr, 0 );<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!p=
tr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; CV_PARSE_ERROR_CPP(&quot;Invalid input&quot;);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f( *ptr !=3D '\0' )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {=
<br>
+diff --git a/modules/core/src/persistence_yml.cpp b/modules/core/src/persi=
stence_yml.cpp<br>
+index 4129ca1dc57..7742e827701 100644<br>
+--- a/modules/core/src/persistence_yml.cpp<br>
++++ b/modules/core/src/persistence_yml.cpp<br>
+@@ -330,6 +330,9 @@ class YAMLParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; char* skipSpaces( char* ptr, int min_indent, int =
max_comment_indent )<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid input&quot;);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for(;;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; w=
hile( *ptr =3D=3D ' ' )<br>
+@@ -374,6 +377,9 @@ class YAMLParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; bool getBase64Row(char* ptr, int indent, char* &a=
mp;beg, char* &amp;end)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid input&quot;);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; beg =3D end =3D ptr =3D s=
kipSpaces(ptr, 0, INT_MAX);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr || !*ptr)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn false; // end of file<br>
+@@ -394,6 +400,9 @@ class YAMLParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; char* parseKey( char* ptr, FileNode&amp; map_node=
, FileNode&amp; value_placeholder )<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid input&quot;);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char c;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *endptr =3D ptr - 1,=
 *saveptr;<br>
+ <br>
+@@ -422,6 +431,9 @@ class YAMLParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; char* parseValue( char* ptr, FileNode&amp; node, =
int min_indent, bool is_parent_flow )<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid input&quot;);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char* endptr =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char c =3D ptr[0], d =3D =
ptr[1];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int value_type =3D FileNo=
de::NONE;<br>
+@@ -508,6 +520,8 @@ class YAMLParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
endptr =3D d;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
tr =3D skipSpaces( endptr, min_indent, INT_MAX );<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!p=
tr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; CV_PARSE_ERROR_CPP(&quot;Invalid input&quot;);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
 =3D *ptr;<br>
+ <br>
+@@ -634,6 +648,8 @@ class YAMLParser : public FileStorageParser<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; FileNode elem;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; ptr =3D skipSpaces( ptr, new_min_indent, INT_MAX );<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PARSE_ERROR_CPP(&quot;Invalid =
input&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; if( *ptr =3D=3D '}' || *ptr =3D=3D ']' )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( *ptr !=3D d )<br>
+@@ -647,6 +663,8 @@ class YAMLParser : public FileStorageParser<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( *ptr !=3D ',' )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_P=
ARSE_ERROR_CPP( &quot;Missing , between the elements&quot; );<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr =3D skipSpaces( ptr + 1,=
 new_min_indent, INT_MAX );<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PARSE_=
ERROR_CPP(&quot;Invalid input&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; if( struct_type =3D=3D FileNode::MAP )<br>
+@@ -746,6 +764,9 @@ class YAMLParser : public FileStorageParser<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; bool parse( char* ptr )<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ptr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_PAR=
SE_ERROR_CPP(&quot;Invalid input&quot;);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool first =3D true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ok =3D true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FileNode root_collection(=
fs-&gt;getFS(), 0, 0);<br>
+<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch<br>
new file mode 100644<br>
index 0000000..35d62cf<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch<br>
@@ -0,0 +1,73 @@<br>
+From 5a497077f109d543ab86dfdf8add1c76c0e47d29 Mon Sep 17 00:00:00 2001<br>
+From: Alexander Alekhin &lt;alexander.alekhin@intel.com&gt;<br>
+Date: Fri, 23 Aug 2019 16:14:53 +0300<br>
+Subject: [PATCH] objdetect: add input check in HOG detector<br>
+<br>
+CVE: CVE-2019-15939<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/opencv/opencv/com=
mit/5a497077f109d543ab86dfdf8add1c76c0e47d29.patch">https://github.com/open=
cv/opencv/commit/5a497077f109d543ab86dfdf8add1c76c0e47d29.patch</a>]<br>
+Comment: No changes in any hunk<br>
+<br>
+Signed-off-by: Neetika Singh &lt;Neetika.Singh@kpit.com&gt;<br>
+---<br>
+ modules/objdetect/src/hog.cpp | 19 ++++++++++++-------<br>
+ 1 file changed, 12 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/modules/objdetect/src/hog.cpp b/modules/objdetect/src/hog.cpp=
<br>
+index 9524851eebb..378bab30876 100644<br>
+--- a/modules/objdetect/src/hog.cpp<br>
++++ b/modules/objdetect/src/hog.cpp<br>
+@@ -68,6 +68,7 @@ enum {DESCR_FORMAT_COL_BY_COL, DESCR_FORMAT_ROW_BY_ROW};=
<br>
+ <br>
+ static int numPartsWithin(int size, int part_size, int stride)<br>
+ {<br>
++&nbsp;&nbsp;&nbsp; CV_Assert(stride !=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return (size - part_size + stride) / stride;<br>
+ }<br>
+ <br>
+@@ -80,13 +81,17 @@ static Size numPartsWithin(cv::Size size, cv::Size par=
t_size,<br>
+ <br>
+ static size_t getBlockHistogramSize(Size block_size, Size cell_size, int =
nbins)<br>
+ {<br>
++&nbsp;&nbsp;&nbsp; CV_Assert(!cell_size.empty());<br>
+&nbsp;&nbsp;&nbsp;&nbsp; Size cells_per_block =3D Size(block_size.width / =
cell_size.width,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; block_size.height / cell_size.=
height);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; block_size.height / cell_size.height=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return (size_t)(nbins * cells_per_block.area());<=
br>
+ }<br>
+ <br>
+ size_t HOGDescriptor::getDescriptorSize() const<br>
+ {<br>
++&nbsp;&nbsp;&nbsp; CV_Assert(!cellSize.empty());<br>
++&nbsp;&nbsp;&nbsp; CV_Assert(!blockStride.empty());<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; CV_Assert(blockSize.width % cellSize.width =3D=3D=
 0 &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blockSize.height % cellSi=
ze.height =3D=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; CV_Assert((winSize.width - blockSize.width) % blo=
ckStride.width =3D=3D 0 &amp;&amp;<br>
+@@ -144,20 +149,20 @@ bool HOGDescriptor::read(FileNode&amp; obj)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if( !obj.isMap() )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FileNodeIterator it =3D obj[&quot;winSize&quot;].=
begin();<br>
+-&nbsp;&nbsp;&nbsp; it &gt;&gt; winSize.width &gt;&gt; winSize.height;<br>
++&nbsp;&nbsp;&nbsp; it &gt;&gt; winSize.width &gt;&gt; winSize.height; CV_=
Assert(!winSize.empty());<br>
+&nbsp;&nbsp;&nbsp;&nbsp; it =3D obj[&quot;blockSize&quot;].begin();<br>
+-&nbsp;&nbsp;&nbsp; it &gt;&gt; blockSize.width &gt;&gt; blockSize.height;=
<br>
++&nbsp;&nbsp;&nbsp; it &gt;&gt; blockSize.width &gt;&gt; blockSize.height;=
 CV_Assert(!blockSize.empty());<br>
+&nbsp;&nbsp;&nbsp;&nbsp; it =3D obj[&quot;blockStride&quot;].begin();<br>
+-&nbsp;&nbsp;&nbsp; it &gt;&gt; blockStride.width &gt;&gt; blockStride.hei=
ght;<br>
++&nbsp;&nbsp;&nbsp; it &gt;&gt; blockStride.width &gt;&gt; blockStride.hei=
ght; CV_Assert(!blockStride.empty());<br>
+&nbsp;&nbsp;&nbsp;&nbsp; it =3D obj[&quot;cellSize&quot;].begin();<br>
+-&nbsp;&nbsp;&nbsp; it &gt;&gt; cellSize.width &gt;&gt; cellSize.height;<b=
r>
+-&nbsp;&nbsp;&nbsp; obj[&quot;nbins&quot;] &gt;&gt; nbins;<br>
++&nbsp;&nbsp;&nbsp; it &gt;&gt; cellSize.width &gt;&gt; cellSize.height; C=
V_Assert(!cellSize.empty());<br>
++&nbsp;&nbsp;&nbsp; obj[&quot;nbins&quot;] &gt;&gt; nbins; CV_Assert(nbins=
 &gt; 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; obj[&quot;derivAperture&quot;] &gt;&gt; derivAper=
ture;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; obj[&quot;winSigma&quot;] &gt;&gt; winSigma;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; obj[&quot;histogramNormType&quot;] &gt;&gt; histo=
gramNormType;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; obj[&quot;L2HysThreshold&quot;] &gt;&gt; L2HysThr=
eshold;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; obj[&quot;gammaCorrection&quot;] &gt;&gt; gammaCo=
rrection;<br>
+-&nbsp;&nbsp;&nbsp; obj[&quot;nlevels&quot;] &gt;&gt; nlevels;<br>
++&nbsp;&nbsp;&nbsp; obj[&quot;nlevels&quot;] &gt;&gt; nlevels; CV_Assert(n=
levels &gt; 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (obj[&quot;signedGradient&quot;].empty())<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; signedGradient =3D false;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch<br>
new file mode 100644<br>
index 0000000..923ca2a<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch<br>
@@ -0,0 +1,157 @@<br>
+From d1615ba11a93062b1429fce9f0f638d1572d3418 Mon Sep 17 00:00:00 2001<br>
+From: Thang Tran &lt;TranKimThang279@gmail.com&gt;<br>
+Date: Mon, 27 May 2019 08:18:26 +0200<br>
+Subject: [PATCH] video:fixed DISOpticalFlow segfault from small img<br>
+<br>
+CVE: CVE-2019-19624<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/opencv/opencv/com=
mit/d1615ba11a93062b1429fce9f0f638d1572d3418.patch">https://github.com/open=
cv/opencv/commit/d1615ba11a93062b1429fce9f0f638d1572d3418.patch</a>]<br>
+Comment: No changes in any hunk<br>
+<br>
+Signed-off-by: Neetika Singh &lt;Neetika.Singh@kpit.com&gt;<br>
+---<br>
+ modules/video/src/dis_flow.cpp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 67 ++++++++++++++++++++++++-<br>
+ modules/video/test/test_OF_accuracy.cpp | 28 +++++++++++<br>
+ 2 files changed, 93 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/modules/video/src/dis_flow.cpp b/modules/video/src/dis_flow.c=
pp<br>
+index a453d8b2b51..806d6f1ddaf 100644<br>
+--- a/modules/video/src/dis_flow.cpp<br>
++++ b/modules/video/src/dis_flow.cpp<br>
+@@ -140,6 +140,8 @@ class DISOpticalFlowImpl CV_FINAL : public DISOpticalF=
low<br>
+&nbsp;&nbsp;&nbsp;&nbsp; void prepareBuffers(Mat &amp;I0, Mat &amp;I1, Mat=
 &amp;flow, bool use_flow);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; void precomputeStructureTensor(Mat &amp;dst_I0xx,=
 Mat &amp;dst_I0yy, Mat &amp;dst_I0xy, Mat &amp;dst_I0x, Mat &amp;dst_I0y, =
Mat &amp;I0x,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mat &amp;I0y)=
;<br>
++&nbsp;&nbsp;&nbsp; int autoSelectCoarsestScale(int img_width);<br>
++&nbsp;&nbsp;&nbsp; void autoSelectPatchSizeAndScales(int img_width);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; struct PatchInverseSearch_ParBody : public Parall=
elLoopBody<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+@@ -435,6 +437,44 @@ void DISOpticalFlowImpl::precomputeStructureTensor(Ma=
t &amp;dst_I0xx, Mat &amp;dst_I0yy,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ }<br>
+ <br>
++int DISOpticalFlowImpl::autoSelectCoarsestScale(int img_width)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; const int fratio =3D 5;<br>
++&nbsp;&nbsp;&nbsp; return std::max(0, (int)std::floor(log2((2.0f*(float)i=
mg_width) / ((float)fratio * (float)patch_size))));<br>
++}<br>
++<br>
++void DISOpticalFlowImpl::autoSelectPatchSizeAndScales(int img_width)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; switch (finest_scale)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp; case 1:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; patch_size =3D 8;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; coarsest_scale =3D autoSelectC=
oarsestScale(img_width);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; finest_scale =3D std::max(coar=
sest_scale-2, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++<br>
++&nbsp;&nbsp;&nbsp; case 3:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; patch_size =3D 12;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; coarsest_scale =3D autoSelectC=
oarsestScale(img_width);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; finest_scale =3D std::max(coar=
sest_scale-4, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++<br>
++&nbsp;&nbsp;&nbsp; case 4:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; patch_size =3D 12;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; coarsest_scale =3D autoSelectC=
oarsestScale(img_width);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; finest_scale =3D std::max(coar=
sest_scale-5, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++<br>
++&nbsp;&nbsp;&nbsp; // default case, fall-through.<br>
++&nbsp;&nbsp;&nbsp; case 2:<br>
++&nbsp;&nbsp;&nbsp; default:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; patch_size =3D 8;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; coarsest_scale =3D autoSelectC=
oarsestScale(img_width);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; finest_scale =3D std::max(coar=
sest_scale-2, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++}<br>
++<br>
+ DISOpticalFlowImpl::PatchInverseSearch_ParBody::PatchInverseSearch_ParBod=
y(DISOpticalFlowImpl &amp;_dis, int _nstripes,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; int _hs, Mat &amp;dst_Sx, Mat &amp;dst_Sy,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; Mat &amp;src_Ux, Mat &amp;src_Uy, Mat &amp;_I0, Mat &amp;_I1,<br>
+@@ -1318,9 +1358,20 @@ bool DISOpticalFlowImpl::ocl_calc(InputArray I0, In=
putArray I1, InputOutputArray<br>
+&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flow.create(I1Mat.size(),=
 CV_32FC2);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; UMat &amp;u_flowMat =3D flow.getUMatRef();<br>
+-&nbsp;&nbsp;&nbsp; coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat=
.rows) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code serach for=
 maximal movement of width/4 */<br>
++&nbsp;&nbsp;&nbsp; coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat=
.rows) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code search for=
 maximal movement of width/4 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; (int)(log(min(I0Mat.cols, I0Mat.rows) / patch_size) / log(2.0)));&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* D=
eepest pyramid level greater or equal than patch*/<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (coarsest_scale&lt;0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_Error(cv::Error::StsBadSize=
, &quot;The input image must have either width or height &gt;=3D 12&quot;);=
<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (coarsest_scale&lt;finest_scale)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // choose the finest level bas=
ed on coarsest level.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Refs: <a href=3D"https://gi=
thub.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d3a41c10e41cc9f3a35bb1b523/run=
_dense.cpp#L239">
https://github.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d3a41c10e41cc9f3a35b=
b1b523/run_dense.cpp#L239</a><br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int original_img_width =3D I0.=
size().width;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; autoSelectPatchSizeAndScales(o=
riginal_img_width);<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; ocl_prepareBuffers(I0Mat, I1Mat, u_flowMat, use_i=
nput_flow);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; u_Ux[coarsest_scale].setTo(0.0f);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; u_Uy[coarsest_scale].setTo(0.0f);<br>
+@@ -1385,8 +1436,20 @@ void DISOpticalFlowImpl::calc(InputArray I0, InputA=
rray I1, InputOutputArray flo<br>
+&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flow.create(I1Mat.size(),=
 CV_32FC2);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; Mat flowMat =3D flow.getMat();<br>
+-&nbsp;&nbsp;&nbsp; coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat=
.rows) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code serach for=
 maximal movement of width/4 */<br>
++&nbsp;&nbsp;&nbsp; coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat=
.rows) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code search for=
 maximal movement of width/4 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; (int)(log(min(I0Mat.cols, I0Mat.rows) / patch_size) / log(2.0)));&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* D=
eepest pyramid level greater or equal than patch*/<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (coarsest_scale&lt;0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CV_Error(cv::Error::StsBadSize=
, &quot;The input image must have either width or height &gt;=3D 12&quot;);=
<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (coarsest_scale&lt;finest_scale)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // choose the finest level bas=
ed on coarsest level.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Refs: <a href=3D"https://gi=
thub.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d3a41c10e41cc9f3a35bb1b523/run=
_dense.cpp#L239">
https://github.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d3a41c10e41cc9f3a35b=
b1b523/run_dense.cpp#L239</a><br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int original_img_width =3D I0.=
size().width;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; autoSelectPatchSizeAndScales(o=
riginal_img_width);<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; int num_stripes =3D getNumThreads();<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; prepareBuffers(I0Mat, I1Mat, flowMat, use_input_f=
low);<br>
+diff --git a/modules/video/test/test_OF_accuracy.cpp b/modules/video/test/=
test_OF_accuracy.cpp<br>
+index affbab65866..b99ffce2a8b 100644<br>
+--- a/modules/video/test/test_OF_accuracy.cpp<br>
++++ b/modules/video/test/test_OF_accuracy.cpp<br>
+@@ -121,6 +121,34 @@ TEST(DenseOpticalFlow_DIS, ReferenceAccuracy)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ }<br>
+ <br>
++TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanZero)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; cv::Ptr&lt;cv::DISOpticalFlow&gt; of =3D cv::DISOptica=
lFlow::create();<br>
++&nbsp;&nbsp;&nbsp; const int mat_size =3D 10;<br>
++<br>
++&nbsp;&nbsp;&nbsp; cv::Mat x(mat_size, mat_size, CV_8UC1, 42);<br>
++&nbsp;&nbsp;&nbsp; cv::Mat y(mat_size, mat_size, CV_8UC1, 42);<br>
++&nbsp;&nbsp;&nbsp; cv::Mat flow;<br>
++<br>
++&nbsp;&nbsp;&nbsp; ASSERT_THROW(of-&gt;calc(x, y, flow), cv::Exception);<=
br>
++}<br>
++<br>
++// make sure that autoSelectPatchSizeAndScales() works properly.<br>
++TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanFinestLeve=
l)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; cv::Ptr&lt;cv::DISOpticalFlow&gt; of =3D cv::DISOptica=
lFlow::create();<br>
++&nbsp;&nbsp;&nbsp; const int mat_size =3D 80;<br>
++<br>
++&nbsp;&nbsp;&nbsp; cv::Mat x(mat_size, mat_size, CV_8UC1, 42);<br>
++&nbsp;&nbsp;&nbsp; cv::Mat y(mat_size, mat_size, CV_8UC1, 42);<br>
++&nbsp;&nbsp;&nbsp; cv::Mat flow;<br>
++<br>
++&nbsp;&nbsp;&nbsp; of-&gt;calc(x, y, flow);<br>
++<br>
++&nbsp;&nbsp;&nbsp; ASSERT_EQ(flow.rows, mat_size);<br>
++&nbsp;&nbsp;&nbsp; ASSERT_EQ(flow.cols, mat_size);<br>
++}<br>
++<br>
+ TEST(DenseOpticalFlow_VariationalRefinement, ReferenceAccuracy)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; Mat frame1, frame2, GT;<br>
+<br>
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recip=
es-support/opencv/opencv_4.1.0.bb<br>
index d781da6..de708fd 100644<br>
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb<br>
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb<br>
@@ -50,6 +50,10 @@ SRC_URI =3D &quot;git://github.com/opencv/opencv.git;nam=
e=3Dopencv \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Dont-use-isystem.patch">file://0001-Dont-use-isystem.patch<=
/a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch"=
>
file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://download.patch">file://download.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2019-14491.patch">file://CVE-2019-14491.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2019-14493.patch">file://CVE-2019-14493.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2019-15939.patch">file://CVE-2019-15939.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2019-19624.patch">file://CVE-2019-19624.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;PV =3D &quot;4.1.0&quot;<br>
&nbsp;<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_BMXPR01MB23583757F3CB650D7FCD9D689F909BMXPR01MB2358INDP_--
