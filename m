Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.77])
 by mx.groups.io with SMTP id smtpd.web08.30980.1611540947313296648
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jan 2021 18:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pW2Mzr2w;
 spf=pass (domain: windriver.com, ip: 40.107.237.77, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4rK8FZ/7LoIo4X9V8m789ItJ77mCftL77GF4Ah7bRcxUhxtwLDkkezAdAqTMYZCqQbiJ6UiCRqXWWk+NxCg3UoAByD8AnEcUtEqMz6w+SJ4G8FLFE6ToohGm+Zh6BfRB9Had2S8vHxB1CSjHYruLsYjTkiYoOy8P8Bz8kM323TYSUtiv3IxJFMphy8h14YpxOV64rGL0f7DkgSMe2E8ioefod7yu74Bq+qpVAnqbNXeGxtjuDMvYkrCwl+x7sBl+TeJslUKw7IspTjhYe2npI4W28ks0nCfHRKxwvceMMvhzN69Tvfw2u/ua3+T76d37VBkFZbj+Xt1pkpTMCqw1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1U5I+6GBU2Y6usG+f0uawaQs3jRa7nCDwn0o5+U9C8=;
 b=SnnksxTjbgdncI7Cu2o6FUKpxTDWu7O8DfMwFCWADv5PBSxuHBhkOsO7ZVBQg9qeCGjgOXsKUU7jdGa1RnqU0/68q0eJ3c1gm4qMIwsD8OnKRmxbUXns7NjPGQxNwgZz5y8ylDPYBHx8YAvXNHdcsVLEHWYFkk4a6j6KPLeN4wlDOt/MgzEzrqzxAPrpBjh2rqm5nbgpZp8rsx9elamDYtFwXJoB6iHKkyNnqfi3I23j0ZgsxU3yiL8EIwcblfK93frgaAdt7yP62hmzZjYfYUsGlR/Qx/ptx1OY9EkJ4aS79j4WvU8jm6wMFlnJGoIXmHpZH0tdnvO2BChp8MmRPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1U5I+6GBU2Y6usG+f0uawaQs3jRa7nCDwn0o5+U9C8=;
 b=pW2Mzr2wNEw9GB3cd+aRRdtu3JA0M1T0yvQoTlkcNuiYlBaNHPBxjHu6rjbvG5pzc5yQPMWRWXMvFavpNbE1ZBXmlPy4XAFB3Wk9JEJ13Ty9+/CXp9Z0TeT94tSc1rZjBGY5XyulzHCubUJj6FXFwYxdRVfnuwSyp5ucC/+L6ws=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3360.namprd11.prod.outlook.com (52.135.113.94) by
 SA0PR11MB4719.namprd11.prod.outlook.com (20.181.61.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10; Mon, 25 Jan 2021 02:15:44 +0000
Received: from SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::8c3:3679:8a12:ac28]) by SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::8c3:3679:8a12:ac28%3]) with mapi id 15.20.3784.017; Mon, 25 Jan 2021
 02:15:44 +0000
Subject: Re: [oe] [PATCH 2/2] lmbench: lat_fifo: Fix cleanup sequence
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel@lists.openembedded.org
References: <20210122101652.46438-1-zhe.he@windriver.com>
 <20210122101652.46438-2-zhe.he@windriver.com>
 <CAMKF1sozWaDwOdO8AgY+O_8a7VNjnKSV5yMOccQuFJDokLDSnw@mail.gmail.com>
From: "He Zhe" <zhe.he@windriver.com>
Message-ID: <f50e9679-9c1a-b51f-9758-6f8194dc5607@windriver.com>
Date: Mon, 25 Jan 2021 10:15:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1sozWaDwOdO8AgY+O_8a7VNjnKSV5yMOccQuFJDokLDSnw@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YTOPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::48) To SN6PR11MB3360.namprd11.prod.outlook.com
 (2603:10b6:805:c8::30)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.175] (60.247.85.82) by YTOPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 02:15:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d18c4358-7d71-4efc-e15f-08d8c0d71c48
X-MS-TrafficTypeDiagnostic: SA0PR11MB4719:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB47190F95CAAAD66204CF66E68FBD0@SA0PR11MB4719.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6zyMvf//DAS0QT+wXtWaTme4zYbsEiWfPkknO/rT6zN9o7GxaGA8Gbt+46OfTxkyQ/yfU+LjQyKhIQVS6GU4hnWlDS0I2Bn1EOnYz8uti+5T5pFxjUy1qLnr8Zbb+HJqsc+041L7e2MMWLsmBC7eC3q6Ja7bJ8esScKvdvyCE+Ii1NcEagJGuNnbsb+plv5gsTuzoZABtoPlc4Vmaim2K5ZEVcJEbMmXGcCZ8e0JhonoBkadShYMyeRWuIrIq44oeH1ezAGS/U1B7lxcMTp3nuO0JG3ZgZoMtfIDX43jcnlFN4nBdSMH9HLeV9XXKPlK5GIQJSKLz4GjeRAhZBoDtCcCZFFDH9GSytBvw8Kl7+oJf6q6D5fUXaHwOmMdSC4mmUU7ZqTbP2mccCyIeoTc3NPJ0B4hr4dM7B4ul/VwP/0kgplOz2rNRDXe4TVyKOK2vRh3KPUG9JdpqRNBTq9yTBZ5KR2R3iLY3nErw4eBSXjGwxGej5udGFwIEYlYyRXTDB67e7vy47C9w5Ljmwxlf/vWnjjDoX/ajjfr1kz5jIremN8w5/uq7X5C+DEkJNJq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3360.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39840400004)(52116002)(36756003)(2616005)(86362001)(16576012)(6666004)(8676002)(4326008)(956004)(16526019)(186003)(26005)(53546011)(66476007)(83380400001)(31696002)(2906002)(6706004)(478600001)(31686004)(5660300002)(6916009)(966005)(66556008)(6486002)(8936002)(316002)(66946007)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ElnaH50VfDfYYOqxRi89lqmljjuYQ2GRscmYaJ3xdafoDStOCOAkWloMRBbT?=
 =?us-ascii?Q?OYirGadBf0XOF4OE72UUl8Id0Smp5QEunfGTz+ZEfThQ33WGbHHhBxGnshgR?=
 =?us-ascii?Q?eHuUPD9XDm1kdRAxfxZeJSzMY6d7xq1FdYq4YNoSAIY2SD1F0mpElt8DOrYV?=
 =?us-ascii?Q?3wCziCqDmhLzkSpJ7y71icI88ZWYZ+NrVUfQoNld62y80Q3KN9Bg7uIHnXA1?=
 =?us-ascii?Q?spens6S7x4Sqn9X1fMa96pmFxii/bUb+UnkckGrPcqGPYSf0p94QTlNBncgn?=
 =?us-ascii?Q?dmeP1poe0+BI18kcObFrOKWNndSL1l62tLtX+jVedWNNSXH8ocU5PDHF96qQ?=
 =?us-ascii?Q?cW+g1g1KpNaxGRVb7VfVn49KS4IelCQEHc4L/Ab940dkWWCy10UAPi6d+LTb?=
 =?us-ascii?Q?ZLBpSbcVXLSPRJPjZIukGpqKkYPx1SHFO7uN8z8SMVvJVn8DdEM4gAuUiYVX?=
 =?us-ascii?Q?BL5cTpFDpK6RDv/Xqs84JFcxFolQII3l9l3EP1hatzmxPgCECJdZHPUprFfA?=
 =?us-ascii?Q?BwMSF6psfMSKYT4lzjiOUuavGD6vF525MtQXOZU8UB9uAdqkRq9OI8zYn/u+?=
 =?us-ascii?Q?LMMbVQmRx8GtAMj11z9Jj2+WBcSHMysr0tUyVZnCFcDZpUNzrxP8dYHPXqbw?=
 =?us-ascii?Q?HOEpLpphQgo8JM6q9Ni9GQUEbSJpOModqG8fa+PJ+QIBh3F7H5uX1cWGO/+k?=
 =?us-ascii?Q?l5pjqfoSUurjUtCtXz1gd79tJqINz89YV7zypLQiBs/evQLPQGR+P5LJakRm?=
 =?us-ascii?Q?wSuAaLBwqDvktPdppeoLrMDHOoobmQlowvJ/s5Tzx4SH3x4Uccxtf+iTQ/Dn?=
 =?us-ascii?Q?gXwwpVkVkfyYxjMe+G4PKhe8E+XzwAF2fRl/2P8csiegRu+DHR7OkHEB2+on?=
 =?us-ascii?Q?omg8lBunRVduTDtohpOmSTPJt0fALwfnNI6e5Qe27LuyOddR6WSiXzk5IHwc?=
 =?us-ascii?Q?MNrWiRSQ09JvLiE2KmYsM0iunSOBPe5Lkcj7PmPSn33d8IVra5SZqJBLwPCp?=
 =?us-ascii?Q?nuan?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18c4358-7d71-4efc-e15f-08d8c0d71c48
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 02:15:44.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgpusMcavz/sVPN4kd7iwXwFh9ZHOQdhK6YuhHdlaHpcYbRYNO/S+5aLdpSorN2uwQec9vC5Ff1E6hEzTCblCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

I'd like to but seems the upstream has been dead for years.
The latest in the mailing list was in 2016.
https://sourceforge.net/p/lmbench/mailman/lmbench-users/

Zhe

On 1/23/21 2:04 AM, Khem Raj wrote:
>
> Can you submit this upstream as well please=C2=A0
>
>
> On Fri, Jan 22, 2021 at 2:17 AM He Zhe <zhe.he@windriver.com <mailto:zhe=
.he@windriver.com>> wrote:
>
>     Files should be unlinked after all users exit. Otherwise we might ex=
perience
>     (w) read/write on pipe: No such file or directory
>
>     Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver=
.com>>
>     ---
>     =C2=A0.../0001-lat_fifo-Fix-cleanup-sequence.patch=C2=A0 | 42 ++++++=
+++++++++++++
>     =C2=A0.../lmbench/lmbench_3.0-a9.bb <http://lmbench_3.0-a9.bb>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +
>     =C2=A02 files changed, 43 insertions(+)
>     =C2=A0create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3=
.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch
>
>     diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-l=
at_fifo-Fix-cleanup-sequence.patch b/meta-oe/recipes-benchmark/lmbench/lmbe=
nch-3.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch
>     new file mode 100644
>     index 000000000..42b14cece
>     --- /dev/null
>     +++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo=
-Fix-cleanup-sequence.patch
>     @@ -0,0 +1,42 @@
>     +From 78912c0ac5e090095a2f2bd6226e02cce949e72e Mon Sep 17 00:00:00 2=
001
>     +From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>     +Date: Fri, 22 Jan 2021 10:03:38 +0000
>     +Subject: [PATCH] lat_fifo: Fix cleanup sequence
>     +
>     +Files should be unlinked after all users exit.
>     +
>     +Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windrive=
r.com>>
>     +---
>     + src/lat_fifo.c | 12 ++++++------
>     + 1 file changed, 6 insertions(+), 6 deletions(-)
>     +
>     +diff --git a/src/lat_fifo.c b/src/lat_fifo.c
>     +index c625161..85bb9d1 100644
>     +--- a/src/lat_fifo.c
>     ++++ b/src/lat_fifo.c
>     +@@ -120,16 +120,16 @@ cleanup(iter_t iterations, void * cookie)
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (iterations) return;
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 unlink(state->filename1);
>     +-=C2=A0 =C2=A0 =C2=A0 unlink(state->filename2);
>     +-=C2=A0 =C2=A0 =C2=A0 close(state->wr);
>     +-=C2=A0 =C2=A0 =C2=A0 close(state->rd);
>     +-
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (state->pid > 0) {
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill(state->pid, =
15);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill(state->pid, =
SIGKILL);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0waitpid(stat=
e->pid, NULL, 0);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state->pid =
=3D 0;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 unlink(state->filename1);
>     ++=C2=A0 =C2=A0 =C2=A0 unlink(state->filename2);
>     ++=C2=A0 =C2=A0 =C2=A0 close(state->wr);
>     ++=C2=A0 =C2=A0 =C2=A0 close(state->rd);
>     + }
>     +
>     + void
>     +--
>     +2.29.2
>     +
>     diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb <ht=
tp://lmbench_3.0-a9.bb> b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.=
bb <http://lmbench_3.0-a9.bb>
>     index 68c7e7b4f..21e81ecf2 100644
>     --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb <http://lm=
bench_3.0-a9.bb>
>     +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb <http://lm=
bench_3.0-a9.bb>
>     @@ -28,6 +28,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/lmbench/lmbench=
-${PV}.tgz \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-src-Makefile-u=
se-libdir-instead-of-hardcoded-lib.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-lmbench-Point-=
webpage-lm-to-target-directory.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-doc-Fix-typos-=
in-manual-pages.patch \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-lat_fifo-Fix-c=
leanup-sequence.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     =C2=A0SRC_URI[md5sum] =3D "b3351a3294db66a72e2864a199d37cbf"
>     =C2=A0SRC_URI[sha256sum] =3D "cbd5777d15f44eab7666dcac418054c3c09df9=
9826961a397d9acf43d8a2a551"
>     --=20
>     2.17.1
>
>
>    =20
>

