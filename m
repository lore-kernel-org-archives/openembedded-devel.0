Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.89])
 by mx.groups.io with SMTP id smtpd.web10.6831.1615733548711344029
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Mar 2021 07:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aQuWKlTY;
 spf=pass (domain: windriver.com, ip: 40.107.243.89, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoFbgGowH6ijO1vj4Llg0ak836tJYm6OWARS8hUu4zCBQGkFxcSifkahCvBO9jHa0ZaVuzoypBfMzIYhiCHGCRdfBYJnBysgPye4g5ch5xFulzY9fUdPoGgHRNHSEB1nEJiIISz8VctUsZD9Qjl6OcqhB2LZXI20NdKMQJ2OePJKZVv6w/PNQAm5stmC5OfXDcqoKc2f5DjDVx4iXR7C3xGbAhN+FUWdSfAYEo1eKSfkY9NUQRasmKiR1j1CBIju1KWrI/TSkHQC+q/9+Yfd7f/h3a4FYhCaY7/tu1/v+mADfzN693N3M5Eq6jaYUPTx6VvM5Wix7Ujo4Et9cEvIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw5jEfni1sUsujgsVYzQTIzQAngz3Van7hfz91DA7vA=;
 b=Je1ubEQqXjxpKEcla10bgif7gqstcdkNwT4OZlIlDFdrlNTUu6uR8e5uYTllZ0oHyMbOFP7e0WMIJaYO+2Zt1g7wh0Ecg7GaiZuWY9ljNJFPepfdTKjHC52oHwA8QQjqweUGvN2Qakrt5pxQgtUtjFfFvhCuV1GRJamuuJzCqt1mFW+HXNbEMwAsCgDIkOQl+27XV72t9+MR3nnpZT2mvvNZ6tLHAhNjZBArB1A5hhcHtQEvgmMWM8XfIjx5ZHB8Ma1Iv4tywzJSjfMCrCWUl3xlccTXKE9KNOrTtZD/nCbBf2R1ry5bXOxM0HcQPKAhYh0s0wZdmhpLxFk6lHMFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw5jEfni1sUsujgsVYzQTIzQAngz3Van7hfz91DA7vA=;
 b=aQuWKlTYnJWyiBxhXidWu2SOdrcd322udL+t0XQ1ggwQ3WxdRuba6Hby24NmkIJDfWrmtaTfWt6f8kVecw8oZnxmpwXCl9quD4cTsUNF2xGd9A7cEMyPtfLEDFA/4KLadNfIihRqH88AJ35XIyp0kq9j3FYgv/MGbDnXJlMZEOo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4473.namprd11.prod.outlook.com (2603:10b6:5:1de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 14:52:24 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 14:52:24 +0000
Subject: Re: [oe] [PATCH 1/2] zstd: upgrade 1.4.8 -> 1.4.9
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <20210313213415.396489-1-Randy.MacLeod@windriver.com>
 <CANNYZj9hdSLBmqsTSg0wW0Lb54QHyw1ms16TzQfafQeeU-OURw@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <4e3dd1ab-3c30-c009-ea57-06e6f864854a@windriver.com>
Date: Sun, 14 Mar 2021 10:52:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CANNYZj9hdSLBmqsTSg0wW0Lb54QHyw1ms16TzQfafQeeU-OURw@mail.gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0126.namprd03.prod.outlook.com (2603:10b6:a03:33c::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sun, 14 Mar 2021 14:52:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a0cb101-0b00-49bb-e40d-08d8e6f8c77e
X-MS-TrafficTypeDiagnostic: DM6PR11MB4473:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB44738EF2A0B2ED2A5B114216F86D9@DM6PR11MB4473.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZVM79knIFnU29ogOIgb7SqLWi1YsAhttnninzMLNWzocrZNywL/TAbiy0160Usdes6p1jL0K3q/oxKLEfXhlHgVHKWZ/Gs4WcSfqhDsL2xgnFdey0oR9o/hRxPtXbW3SoVdMbqpagnqLSMzf66Tj41XO7oGrQEP12N6WCKhGQmdTokHublqjVkubeKVoV7smVJmV8YFGGhCrPLah1myNXGoO1uFhGR2brY10ZzUnUFQpXiGTufE7YKVDGQyLRK9pD1RrZ00tNrHNaqBBTr7iBa6BicMLBy/vPB3wvcqBSwr7VMJQ9B8PZiQW345wGYDBy/87Ml3EiDuCYgA/LvMsUTV/qKW1h/7qoImkJ4/MWoi/rrPHgMEdeExrcf9mr0lcD80UB0kQ0PBmK4HknpU9pUQeOGhF2llcol+y4oPLPRWJjkX/1cVNdZSwKlIFsz5xVCJXfdj+HCAV3/CR0GLpM8KQK4dCA5Qcq2Kwmt2/x8wkWAr7FYYTclk2lgUq+5ptkRK1JF+R9525O2L01we6NvOuevYBFBtcjTxgg1XTXinZ69DeSPBycp3EhTS6TFRQs6D0H5rZJhrmL3vrAuO+vlduFDlLEzDuo3gkzH6yBcQ+ZzU69pWSonTKrU9Ejc2cJVMhQXnMNGDQ2/ehnek7IN0hRj2P+mYsQ12sBl2EDDe3BPkxjLXnU/l4xocle41gSajcsAlxC7+Zg0kxtiUefuMt4IZug2ifxqDHqlbvwSE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39830400003)(366004)(136003)(346002)(8936002)(6486002)(16576012)(316002)(186003)(966005)(4326008)(52116002)(31686004)(478600001)(16526019)(66476007)(66946007)(66556008)(6666004)(8676002)(86362001)(26005)(36756003)(53546011)(83380400001)(31696002)(956004)(6916009)(5660300002)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/FTl6mEngJOIIGUebowo/gMC4aUgPfAHIYELLP8CriGCode7iXugAoeNsfQJ?=
 =?us-ascii?Q?lMmnTL6rhMSUa5j0iJFp9iBB+RbcB8hCs0Nz18512G8A8ByEpk10Waqpa0rk?=
 =?us-ascii?Q?xy/VOxKWuEhVI7GAFdWU132+Rdd5Z5o1f/Hb3M5DBuUKb5tWluEKWIVzERJK?=
 =?us-ascii?Q?F26O5pFd9BVNWAsH5UzT2ZVPgvyb7sBryUp3Rkwvd+gvtmywYqP+5LmwnPRb?=
 =?us-ascii?Q?XX3Q0yAPvZjITd6/MoZxZr2U2aFiSS/LDO+NIXlWnhJ4oJ3iFt0kcUfPMnaH?=
 =?us-ascii?Q?tgLNVNzq9spVZD7SzvgOA8I4G0c/jZJSEjFGRbSFPHnfQ/HHIVfsURRbmqOc?=
 =?us-ascii?Q?8gHhOc/L39qDovSmPSfjToEiqLQlpNdhqoUtke/VfTFjyhzevSVntJeCTsV0?=
 =?us-ascii?Q?rR+BMAu6qXWppZN3o7uks6+l+9mYgsP5oewKmpdunkv4rn4pRKUpxB1uCVDb?=
 =?us-ascii?Q?4Mz46sEnnevnLpomLepxqIH+xyQZFBauHqQSg0UphyonXAVre+/qzkeJswp4?=
 =?us-ascii?Q?io+lqXXY7v5qvr+MhQg2wjL8FAm9inFGoxGwMmulKFAhEylT0GFOoUTuJ4P1?=
 =?us-ascii?Q?9/pmeAZgu6IBVfn4IvsDHHkdxuBttbq8HUY16qRkiGzjovwfxX6jn1aFpk5I?=
 =?us-ascii?Q?F83VxxF1yyOPPY+P9LxDF30NmsAdR2RXbkWkmQgqF6pqsjygA/v42pkxM3eU?=
 =?us-ascii?Q?6xqOJwus7Ye0NYLePC8rMw1S8tXMJYnL8zBiodCriw/B6srjjxpHfBVVkzSW?=
 =?us-ascii?Q?tQDne8x3yBqBr1tZEh7AWyDp45dPVDtLPg1TdrRMKYpxVMF2Rh7fKaDTduhb?=
 =?us-ascii?Q?a3zEnVIE8qGxWA3uK18XdPj0YQVpctnUhckhMMnaX/b7ii+SIRAEX2/Hb0Hi?=
 =?us-ascii?Q?49Dcs48ph0vEzDFkAcq163fDXUL243jQl9V1/hFaU0DkDwGoOJR9A1Mg1l2f?=
 =?us-ascii?Q?/PZJr+tbvdTF+tFA5zPvNyUVWw7dlzxkO29EIlPdVcTxbOJckCiiTBT8yETS?=
 =?us-ascii?Q?s/nwyHwbRc5did/RSxYzrJIwG+Qp+Atu4z7yMHeK5PYQby4Kn35YwJZpcDDf?=
 =?us-ascii?Q?9XBBifbqp21zAzEOYDyCAOO5zgXGG/s6CIPgtLLwDlYz+VYudRyC8tI1Q6rI?=
 =?us-ascii?Q?D2rw4dbaU+5uUBrm31rQ2nBs/vRWQS8b8nxcTuuF1jiLLtNgYdfI1+5gY1Cy?=
 =?us-ascii?Q?Q84DVRvR+S7V104q0uS6q5U/58UzXjEx+4LcS0/2gDGWjTEdcxarA1oXdhZ6?=
 =?us-ascii?Q?gce+hsZFaS2wr4KRe8vS9A0joSSQZmVq4UmFMARrD8dcp+s69ospKaT6x+ZM?=
 =?us-ascii?Q?A0Jjt2i5iD0pQC2zYj/BHN9f?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0cb101-0b00-49bb-e40d-08d8e6f8c77e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2021 14:52:24.7844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZkUzQ1ynTZTF7XssGoR/h2Dn62gxECBAYTImQi4+IIA9hsq6boklXnXuHROxkpNRf/ub6z7RYQktx5W3yfVuSSDgSPT64hSzNpPyQVbIKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4473
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-03-13 5:37 p.m., Alexander Kanavin wrote:
> Zstd has been added to oe-core I think? Somehow it wasn't removed from=
=20
> meta-oe :-/

Ah, right.
I'll send this update to oe-core and remove the recipe from meta-oe.

Thanks,

../Randy

>=20
> Alex
>=20
> On Sat, 13 Mar 2021 at 22:34, Randy MacLeod <randy.macleod@windriver.com=
=
=20
> <mailto:randy.macleod@windriver.com>> wrote:
>=20
>     Drop backported patch.
>=20
>     CHANGELOG:
>=20
>     v1.4.9=C2=A0 (Mar 1, 2021)
>     bug: Use `umask()` to Constrain Created File Permissions (#2495,
>     @felixhandte)
>     bug: Make Simple Single-Pass Functions Ignore Advanced Parameters
>     (#2498, @terrelln)
>     api: Add (De)Compression Tracing Functionality (#2482, @terrelln)
>     api: Support References to Multiple DDicts (#2446, @senhuang42)
>     api: Add Function to Generate Skippable Frame (#2439, @senhuang42)
>     perf: New Algorithms for the Long Distance Matcher (#2483, @mpu)
>     perf: Performance Improvements for Long Distance Matcher (#2464, @mp=
u)
>     perf: Don't Shrink Window Log when Streaming with a Dictionary
>     (#2451, @terrelln)
>     cli: Fix `--output-dir-mirror`'s Rejection of `..`-Containing Paths
>     (#2512, @felixhandte)
>     cli: Allow Input From Console When `-f`/`--force` is Passed (#2466,
>     @felixhandte)
>     cli: Improve Help Message (#2500, @senhuang42)
>     tests: Remove Flaky Tests (#2455, #2486, #2445, @Cyan4973)
>     tests: Correctly Invoke md5 Utility on NetBSD (#2492, @niacat)
>     tests: Avoid Using `stat -c` on NetBSD (#2513, @felixhandte)
>     build: Zstd CLI Can Now be Linked to Dynamic `libzstd` (#2457, #2454
>     @Cyan4973)
>     build: Hide and Avoid Using Static-Only Symbols (#2501, #2504, @skit=
t)
>     build: CMake: Enable Only C for lib/ and programs/ Projects (#2498,
>     @concatime)
>     build: CMake: Use `configure_file()` to Create the `.pc` File
>     (#2462, @lazka)
>     build: Fix Fuzzer Compiler Detection & Update UBSAN Flags (#2503,
>     @terrelln)
>     build: Add Guards for `_LARGEFILE_SOURCE` and `_LARGEFILE64_SOURCE`
>     (#2444, @indygreg)
>     build: Improve `zlibwrapper` Makefile (#2437, @Cyan4973)
>     contrib: Add `recover_directory` Program (#2473, @terrelln)
>     doc: Change License Year to 2021 (#2452 & #2465, @terrelln &
>     @senhuang42)
>     doc: Fix Typos (#2459, @ThomasWaldmann)
>=20
>     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com
>     <mailto:Randy.MacLeod@windriver.com>>
>     ---
>      =C2=A0meta-oe/recipes-extended/zstd/{zstd_1.4.5.bb
>     <http://zstd_1.4.5.bb> =3D> zstd_1.4.9.bb <http://zstd_1.4.9.bb>} | =
3 +--
>      =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>      =C2=A0rename meta-oe/recipes-extended/zstd/{zstd_1.4.5.bb
>     <http://zstd_1.4.5.bb> =3D> zstd_1.4.9.bb <http://zstd_1.4.9.bb>} (9=
1%)
>=20
>     diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
>     <http://zstd_1.4.5.bb> b/meta-oe/recipes-extended/zstd/zstd_1.4.9.bb
>     <http://zstd_1.4.9.bb>
>     similarity index 91%
>     rename from meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
>     <http://zstd_1.4.5.bb>
>     rename to meta-oe/recipes-extended/zstd/zstd_1.4.9.bb
>     <http://zstd_1.4.9.bb>
>     index d0cc625aa..0063a31be 100644
>     --- a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb <http://zstd_1.4.5=
.bb>
>     +++ b/meta-oe/recipes-extended/zstd/zstd_1.4.9.bb <http://zstd_1.4.9=
.bb>
>     @@ -12,10 +12,9 @@ LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3Dc7f0b161edbe52f5f345a3d1311d0b32 \
>      =C2=A0inherit lib_package
>=20
>      =C2=A0SRC_URI =3D "git://github.com/facebook/zstd.git;nobranch=3D1
>     <http://github.com/facebook/zstd.git;nobranch=3D1> \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-legacy-bui=
ld-after-2103.patch \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>=20
>     -SRCREV =3D "b706286adbba780006a47ef92df0ad7a785666b6"
>     +SRCREV =3D "e4558ffd1dc49399faf4ee5d85abed4386b4dcf5"
>      =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>=20
>      =C2=A0S =3D "${WORKDIR}/git"
>     --=20
>     2.27.0
>=20
>=20
>    =20
>=20


--=20
# Randy MacLeod
# Wind River Linux
