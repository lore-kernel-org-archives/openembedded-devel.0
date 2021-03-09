Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.74])
 by mx.groups.io with SMTP id smtpd.web12.7193.1615289036411798316
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Mar 2021 03:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=rtCABbOw;
 spf=pass (domain: kpit.com, ip: 40.107.138.74, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M11ajjHfP/UyiV+MTBMiGwuvvQFMcjYbwEXNHGdxg3QtKx1To+DO4Q8jHyxxtDSqZfoMky5rJhcva52UiYS9y+6S62cfFwRj5N281W4qUycPApvD33nOND59c22XfPaJ206Zd4u8s2DvRcgoVQYQXm1E/zWfzj0R24oTysE/Mgqco0o0X4iiHQ4vNoiENOqaNoXEOKlrCgMreEiyed6Zem++bJnDDAWN4ynT7ccciWp+bIQXVdHNNtC/DsUQZ/631rOUecXPHWWn9DqgkxuTqAy6w4LD9XvFaTdcrE41nmtpCZFCCSdnoHOOY47X39LbKROyUzOLWgUltM+9IWrVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dngZnIzGMOHg7AzjnVPGAWRnVttVhdRxyeCXUvI9k0M=;
 b=U8OnIqV6NvXMzeXTyF/3jMG+c5yGVeySAZcRKEmwJtbbIeJKTufIpjXV+SBnIg9eije1duUH/UTSH/27akS+lXLrhyP8uG3ZKkirYNqrELsjUImD5b7TFXEN1ciLR4tYdyDOGc5bZO/cPM7oEr0pn8nWU/i4TChj9UCLKVA47uYRpXzicSgYMO97fiBQ9CcApal1jIgsS++UBA1DvrtY8l1O6GjVp8m1OT2Gi7pAlT75eOjHhb3VKQ+M7n/dF0GnlItr8dgdPx6gCQ2vjRFK7KFhC9GAfVPM/Oqq71ONnx/oHiT5P8tTFGT/uHRs8e7CFM5BxntTy40rW/1rFVxuDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dngZnIzGMOHg7AzjnVPGAWRnVttVhdRxyeCXUvI9k0M=;
 b=rtCABbOwT0w4z6IJRF9r31J9NDzhZl6UCpTNq+uv+1bZfAEXBVZgfQreUbCWcjVuuLqwYfJ61VJFhV9ipryCbnH9X7cuPy+YKNgaG73+gL3Oaw2kxEwRoOJfqLhlaouZMZ84rYh4TH2U4IrMy+yVRM3GkbwryzMn0oZwv39u/Mc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BMXPR01MB2359.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Tue, 9 Mar
 2021 11:23:46 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5120:b913:587f:c87]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5120:b913:587f:c87%3]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 11:23:45 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Neetika Singh <Neetika.Singh@kpit.com>
Subject: [meta-oe][dunfell][PATCH] opencv: Security fixes
Date: Tue,  9 Mar 2021 16:53:36 +0530
Message-Id: <1615289016-26533-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [183.83.47.23]
X-ClientProxiedBy: PN2PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::34) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (183.83.47.23) by PN2PR01CA0059.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 11:23:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 50937d9c-a36c-4280-399b-08d8e2edcd60
X-MS-TrafficTypeDiagnostic: BMXPR01MB2359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB235933EDCDC027B88C11655F9F929@BMXPR01MB2359.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:181;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UxKiXpOCPXd+MRXJ0W/pSJXByZY3VFyYN63R2JN333xptjzuyji+q8dDQ/ugkmwbmf7VmsdEf3fRMjysBrDvFm/6UacA7/TCo2YgDjSH2awDd3ZzWP0jS88tbUd9eet2cA2Dp7HXKdcXZ9plZg4b72jCs1rTkzfdZ0E/q6XH1OK5a2cUfxu1Q6/x9uG3sNezx4ER1raazb/eBtZoJEKn+n49glOpZLPRjg+QDEpRpOsjeunbUEMP0ftyJ59uizzvqKuimZUMGTVGyzNBTsFGxEMTurCG+FNqvVDTYfY8tHeqlTL9iL5IJuAXkFWXkUeZDeFc2LcxrDAm1VaV8BbQQSNJe884O8kyPU8C6gxbHlDeXfHlaf2Dxm/04De8zKi7aSU1GHQCfIA3FpIyw4phmdcRPk6K2tFb8h5F22YB+ldezD/gjY/cu8l/vLAy7dcYvM04fUKy6RlByA/hy58aFwsnwag8r7un0GU8D/8iSfSJdQpCpya3C5th8ljpGn8eqwmK+ff8x9+9BY4MYbmiFJb7oW18ua0OyVu9Q6r9MzlJEQuJaPAF3z8zUVoUQLz+iRpItd9vS8qsFG3ZwLYK3wziCOVT/LAYjTNg/LvWxJjtrMAUisc+kNMx8nb2Zv9iEi/C5L9zasGcw+RijlFRhMGUdQO2r3OK7ZImfw+yUuE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(5660300002)(316002)(66574015)(107886003)(36756003)(52116002)(6486002)(16526019)(15650500001)(186003)(26005)(966005)(478600001)(6666004)(4326008)(8676002)(8936002)(2906002)(6512007)(86362001)(2616005)(66946007)(6506007)(83380400001)(66476007)(69590400012)(66556008)(956004)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?8SzosxPp9dWz+2Ut6ibidugVEHKCE8prYlUUrbrgRJrTon/fqw7iwvyagLyX?=
 =?us-ascii?Q?eTUfs1FvcqE2hLBBo0ZBlZ8QCxPzzw4ZXG5px/cvrnpVe5p5xegV+mvEPG9+?=
 =?us-ascii?Q?VFeaeFxRXprh+H3LcRDYbKL7XSDsCbS+439Y6WbABtuEXWpbgFoHch/QON5r?=
 =?us-ascii?Q?iSQaFQXHnyJxoPE3Redx/5FLMTEHw65dKvBDYhBR+iJp0EVZYKf5uKsQgvmB?=
 =?us-ascii?Q?KM8QW1Nhm7NpRzfjgK4hPh6HsOL+T14+uoeF7AIEV6hkV1E/rmDG+pjNyuqM?=
 =?us-ascii?Q?xtRepoNviy6dKm4NwI7QJAFbTLFhaGxY5h01o96zxFZRYVZMnPpJMhVHMM7m?=
 =?us-ascii?Q?2+V4udjvbjYliBySkFdxTA18j+16xCiyF2z6KsYokL8CB87+Am+jvCn2ncw7?=
 =?us-ascii?Q?i7l9Oy0DBjXX3U2Ceb2aHAEu5q37+9eglIbUYV76T0x9vrMEYLMpxfv0nTfs?=
 =?us-ascii?Q?Gxa6R3Np9VV6w5kL0BlaXIwcxYQkv1cBtYpR1KtQZNeQahXEDi4lW+q/o4hQ?=
 =?us-ascii?Q?oYTBFGZiwrzVE+YO/qyouHAyghhrX2RiYniB5eCUr0Cxf6/SuNOVTJl4GLEJ?=
 =?us-ascii?Q?uqP8bgZRt3NyqtGZsklhxUEh0oo5yxYy0REg6m0YoLM2sOuiWpQYqaN7onlX?=
 =?us-ascii?Q?X6cxeSa+UoHml4zyUtHRTgfIH/+kBWjEhiEx8Nq/fgni9jhMpinfgNr9oD6k?=
 =?us-ascii?Q?wygXg5mertiUgTEJ7T2eZ+xlpPdA3hJhXRum1yVaNjAjGnX0ABoQ6M+hJfOh?=
 =?us-ascii?Q?eyoHzwvhRfd+oji2hU22gnoKf9Pbc7+4PtNb4XRQ5bcMiZ8s+2GrSWlETrF9?=
 =?us-ascii?Q?X7E4PKdbGn4OFnJIcW6/qyoaakS2jnChfdGyJq9lyfBuLuiypZo+pBKOXc0p?=
 =?us-ascii?Q?cZVjFlE728Lhlc+oHdWXdzeQiB2b+3SqhrdWqiqqYQHiKQXQG4VHlmfj1HUV?=
 =?us-ascii?Q?/SZwcYMtb17fGU78kcMWXWzD5Xf/2N9Eo0k/J5teM+1Orp4YSpkLXjo9pEra?=
 =?us-ascii?Q?gMOcZUlfOXTsF8+5yMwVWo7KtV9kqpabxQ1G8Z4vXSptCn3fgLF+H35ufERI?=
 =?us-ascii?Q?gtkF42F8sTpOonRGVXheZL+b81Qp059hhFLJuCU7z+hxM8b1/qe8HCokBjEA?=
 =?us-ascii?Q?IWNJ0Xb7PeAFoQ41sqGvqjvWJzXROvGoO23Ls23bKlCwYdHQs29Egm2AIVfW?=
 =?us-ascii?Q?Qb9YrqbL+YH+LKipNueoS4oVPkmL0Ow3q914ceOoSPKZN0ZEC5hla44ErHoi?=
 =?us-ascii?Q?KucE3+m5z8UrX6ybf55xIjlNkukpGcYZo0+FvPqHVNLhcH7vYTKRrFdLaJyl?=
 =?us-ascii?Q?4Ynnog1wRHXQ3YhQWlHsOCUB?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50937d9c-a36c-4280-399b-08d8e2edcd60
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 11:23:45.7734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etZiDI7+aKVlw/IhOzPbCF4homz79dxys0YjRqKfYJ7hecbEIUQCtBlKY51iAq6mee/c4zH6EaRJpJZ7sLM/KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2359
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

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
