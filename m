Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B161FC3F6B0
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 06:30:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.29729.1658989812656626557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 23:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=aaJjbENj;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658989812; x=1690525812;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=syf77n570pNdpXUPLOGk6YDkho2qB5RV1PD3MNsSBzw=;
  b=aaJjbENjLgVNg5FXeLtuBVAe2Xc2QRhK6zIuKvFdFDYlqnDnY9qQuSPL
   nBS20o5BJ7DTjkiduccJM8qtq9Ng3oAWYXVm4GYlDvElLMCGrtb/N1s4G
   ZToO4WnV+PPXrMr6SkQWYi3pVxTyPhNrawpv32quOCAHOQ32cM45RX8K+
   yosh2WtpptrliWLnOt2mB1GysMLXpaf6U6l1qhnuEE90AImftD4dVwmGM
   dQ4yjm6IfM9xPFxqTXS9RS3MWewt7sEw5d4thKpKi3DFYcBiTvrK7lphN
   UgPu94lZ6hovgWC4QdopAZV2SMSR5nUACL8XbRfl/YIn5rHTKGhhi2n6R
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288445890"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200";
   d="scan'208";a="288445890"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 23:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200";
   d="scan'208";a="727217517"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP; 27 Jul 2022 23:30:11 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 23:30:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 23:30:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 27 Jul 2022 23:30:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7oWvU2ofygqKTETryWemSG1b4VcfBRCxQ8Aw4rXNX8Sh9PnLzdySuLyDalXbOzgxmy/RlYyH7fzvhAeJqKnJ7e6Ruuxb5D0ra9dVuYQH0eJ7W0OTzLviJvw/Z5Byr+ivvip3CSJVe/qWvfv9pylUYe9xHlInnFrQrvNpSFlERFh0AXgRFkDrkJ0MVgmzwHMaIe2oSNXBA1J//gOaTLWfMq3MPD4Qs8b+5Dru91eaqFdRItBYkBukYr8g3CodIVAo/dq8Xx42WSQ12TVe/0PEMx+izBseuGGUxjhEi/vaHyPFfEKRRwAqM90uig+0m9W1l5C33BMizFbqdbY7RZ+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2t2pf1TzYvIoTwwlGR8SUo0yFNEHI1YSKqatyhdgog=;
 b=Ut8+t25r/Tndap0RZG+J7SUQfQzUsa5AofSrb108Tl7CxXkuYk3p7fIi1nRm3ZbzzksQmmAkt8JiW0GchIgqPMkPwKai4Uw9+K+7BQh8WLZhc0oT4Do56K12pO4ntzZA88fy9Xk+NN6YAgMi4lwOupf4aL6g/SjzCG6Oy+SazzHHLACHHVA2yokabEe6HZ8dt6Sg7rPcu0gykZak15H4xSg2Oqk2M7VYCnxS9P3GcfkBP3whUDQGRWlHBVPye7rmu9QKJr/Zr7XbXQBS35Syl1v5bwciKRCp4Q+GYkT5gs5aTPicpUUs1qyg9YOAXBvsrYJZKqGiuYFS7LaUvs8pDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24)
 by BL0PR11MB3363.namprd11.prod.outlook.com (2603:10b6:208:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 06:30:03 +0000
Received: from SA2PR11MB5036.namprd11.prod.outlook.com
 ([fe80::ac18:5202:d833:c32c]) by SA2PR11MB5036.namprd11.prod.outlook.com
 ([fe80::ac18:5202:d833:c32c%4]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 06:30:03 +0000
From: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
To: Jon Mason <jdmason@kudzu.us>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: =?iso-8859-1?Q?Eil=EDs_N=ED_Fhlannag=E1in?=
	<elizabeth.flanagan@huawei.com>, "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Bartosz Golaszewski
	<bartosz.golaszewski@huawei.com>
Subject: RE: [yocto] [meta-zephyr][PATCH v2] zephyr-kernel-src: bump the v3
 version to v3.1.0
Thread-Topic: [yocto] [meta-zephyr][PATCH v2] zephyr-kernel-src: bump the v3
 version to v3.1.0
Thread-Index: AQHYoO2VPtdhTwXklk6ScKG1kH+qgq2QusgAgAKXOQA=
Date: Thu, 28 Jul 2022 06:30:03 +0000
Message-ID: 
 <SA2PR11MB5036FCB09C48C1DAEE6F7871C4969@SA2PR11MB5036.namprd11.prod.outlook.com>
References: <20220726124510.74315-1-brgl@bgdev.pl> <Yt/9/P0knXvXR00S@kudzu.us>
In-Reply-To: <Yt/9/P0knXvXR00S@kudzu.us>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 165dfaa1-1654-4021-d411-08da70629b10
x-ms-traffictypediagnostic: BL0PR11MB3363:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 b0D3meUlkQe50SwCeDUZDkll9h1AeMONy+TowcRTYB5K8gCQxgmN2m+FaNKkaVJ7jA08iSA3yMsVHLrptBckq+t7K87GL9ucTtcaVho6ee9gO7CtLg088tgbsBcGXumn94GwflvzoIdYKWVkgocXXOCxSsm8u5mM6hz5Y9efKxO06P2lKHTKUnvMLLCqUq5pX/8mNzPw/+Awpe4N+0tzet3Of7naon7xg5vOtfU79P3epBOjycNbhyDo3OBZmrEnHZwzV+mPMipyRw9c23PszVw226i5k+FdWaXta1uUTQWSIgcWAYD1FuiVc0YrUWM27JOjSGbRwIxx0bVON5Pt0VA3IWgBgIzSrp7wG28AAlKEc47B1QY1SM5xXgp79dkqgTP/ECmLrOj0uJRdyHV9awwwqqZRBoXxa0R3UbE5BcoGkV3PHu5hyDz+VmAcJComENlI4mIFe2DEY6gM+qG5s24I/W3wHZ2SwNV2oNmyUH4DvUF5zYPhhWsR1loaWCpVEtgff7PsEyBXj96oHjsMKDfrSBvxcWA6K7qML78HButpDGV/q/isYDSoRF99dI8hRiJYAq2RDN0c1lpfGurSixvWXGlkxA40zqE5WK/+BjXEKoTIQSOfhbBu2IZbcWMpg+VHuc5qLuWZxm0Q84OpVZ5U5HW1McJCCHGAKL88VnG5gjUNP6DY2u1YBuLCaMQ9SzB1ZTgTvgDNw3j5ae/ni5Pf15Vsci4hC0HP8gAeGOhQpnarpIrlNpNUG6mnnB3lUCnMwgc3Udh8ZlDZZLiJsBaKw5kt6O5jXx7T/0JBZf/gaM9VsSM5a4wUFfuOvzBM5u+2Ph5TXcCF5Tlc58Ywtw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB5036.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(376002)(39860400002)(396003)(6506007)(86362001)(53546011)(26005)(9686003)(122000001)(38070700005)(7696005)(82960400001)(38100700002)(66574015)(41300700001)(186003)(83380400001)(52536014)(55016003)(33656002)(66556008)(8676002)(64756008)(66446008)(4326008)(76116006)(66476007)(30864003)(8936002)(66946007)(5660300002)(2906002)(478600001)(71200400001)(110136005)(966005)(54906003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?IcxaLwCfEOsywKLaQYr405wbWRYqZq7G3NnAyaj2lVrEZL3/SuIvZ42jp5?=
 =?iso-8859-1?Q?lfp78/F5VzcxfS06jj8PbvbfpAEOJKNhidReSzgZOE7Fq4EzqpdwZRXQsZ?=
 =?iso-8859-1?Q?kXs03koGJTr1Cnqq/kkmNuuZnOekQpYtWEyf9daAaKtryqCI6jNTtTb81A?=
 =?iso-8859-1?Q?HY9yZ8wCGZ5LEvyCJy7S3YqPx0sbHlZeaS3b4RLIA+aJ7szqYnD4Nve0Fe?=
 =?iso-8859-1?Q?blsE2Zh9RjFL1zijwH5WB5U7Y8j3ofROL6oXk5oLFAv+urUSSvjkfrF0vY?=
 =?iso-8859-1?Q?SRGEcrdw8loijzHsKTCcV2V7f+QHNmLmZpeD0CBqN7+8JrEFvsVvSfcS5e?=
 =?iso-8859-1?Q?r0HTTn+CntGsj+hz1176XXlAw4HpPIqqx8VD2EkejREgqARgYHDIzyX7M/?=
 =?iso-8859-1?Q?9jVse2evf4RjpTtcmwAsRE2B0ETlip3Lg7kp0G7hcjzhMDmdNFX5KHQjxZ?=
 =?iso-8859-1?Q?8qc7WlkmT4fcvtHBH4DxHuWiPAAx+U027Hl1rOlmOZXT2c+bPKvbN76oPa?=
 =?iso-8859-1?Q?tAYTynctZ7wNPe3YSLXsqoVlvM9GYbDmMbyVrPDaWxTcWgUnVLVS5/ZbDs?=
 =?iso-8859-1?Q?7nn6Ekjz0+CA+d3S8AD3H4MrE51noFSWmV+0kKYib5nPICRN0S3oZt4LGS?=
 =?iso-8859-1?Q?YyowIMGw89M4aajb/+fkvx9xZr7WBqCzG/S2gU08YykRl/8mslfzokCL9m?=
 =?iso-8859-1?Q?SZkQN5RqTGM9EQbOmDMXRop6+rqPspnHm9fo56dVcC5HOKrKzkVY7OHeJW?=
 =?iso-8859-1?Q?NXZErWvrhGR/GEsF/PvQl0G8w/pe0zzxuVTz4V2cmTEl31vTJF51BSHQUl?=
 =?iso-8859-1?Q?bEyZHxLHN0RLzaka6hawyDSq6CPlw2/dgNGWoyBpCucf5O7GwwyRmhwAks?=
 =?iso-8859-1?Q?hFy2uNM245G6cmBhWaunXQBi4Mf/OxtvSRvfzu9XLcDXGVSh1ltoHNGnvW?=
 =?iso-8859-1?Q?PacY7qcEXChFFftZd8vu2sC/bNi2kv1Ltw6+ciQSZqic8GB2od1YNbEbpG?=
 =?iso-8859-1?Q?Ji6XKEpFgaMbEFcghs6gv34lvA7OHwoBTdOUBpKDyLIVg5PkXlkyEI4O/9?=
 =?iso-8859-1?Q?6nODalv4GDzmK8iNCQHkhf/Zirs1TCz0h3K6/HzXSOtZMmpagfhkITXcxA?=
 =?iso-8859-1?Q?oZauRsNTXAkr/VF6xYAK422LSvanNk8H7glVv7B+VFV6hVGvnGyvGisyCA?=
 =?iso-8859-1?Q?/UottBe2r59DV1u0iRUMLw2q/Ymrr4tdqPfO8eb9e+U0EagA8tSOg8cx7H?=
 =?iso-8859-1?Q?yCkCP2M+stmHICs6rV4FGkAtXkjAJP2X1sPvsy4CTuyvnkWp2ju4fKB3Ke?=
 =?iso-8859-1?Q?GOH5Fjc5f3cnHu+B2ycQmyucCesYBmlkCTBx/OODiS4e57a74yK3CsEfWR?=
 =?iso-8859-1?Q?/n3oHIzpoMPqfO7ycL9DE/JjNNbqlMpTRXvqf4jdrNwnLCqSmYtaAgTxy4?=
 =?iso-8859-1?Q?/FaX5uDTbSPoO+oRYlrQXwrEoLT/MQRcyybGyiF/8xUxQegktgAIQVzqJI?=
 =?iso-8859-1?Q?7JT7TXBBJTYxofOeNI+ELsnqLNLuKZyLgnb4QoL+8T7Q3BPiPlJmDYZ9yr?=
 =?iso-8859-1?Q?9al8LdqDmr4hDamifOT2WkHDjR6xM/hXasMOrEBjx747RGGT/H+/O47oWL?=
 =?iso-8859-1?Q?6pJJQP5XZBoqP5KG3IypVP9i/gXFfSjWHhlhtejC0HzKTTBPoW1c32Zw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5036.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 165dfaa1-1654-4021-d411-08da70629b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 06:30:03.6867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 mcBUmFlq4ZzuZZiCf6zfRO5v2GpaLuBpCqvJnPaXwnt0wpFsGXcEl+a5e8JaS0IcPRh0b8bZlg40IBMGDxmJnqoqRfZcNUWD0I0PzxVuVME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3363
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 06:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98032



> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Jon Mason
> Sent: Tuesday, July 26, 2022 10:45 PM
> To: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Saini, Naveen Kumar <naveen.kumar.saini@intel.com>; Eil=EDs N=ED
> Fhlannag=E1in <elizabeth.flanagan@huawei.com>;
> yocto@lists.yoctoproject.org; openembedded-
> devel@lists.openembedded.org; Bartosz Golaszewski
> <bartosz.golaszewski@huawei.com>
> Subject: Re: [yocto] [meta-zephyr][PATCH v2] zephyr-kernel-src: bump the
> v3 version to v3.1.0
>=20
> On Tue, Jul 26, 2022 at 02:45:10PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@huawei.com>
> >
> > This upgrades the 3.x series to using v3.1.0.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@huawei.com>
> > ---
> > - add a rebased version of the toolchain patch for v3.1
>=20
> intel-x86-64 machine isn't happy
> It looks like it's not able to find stdint.h
>=20
> https://gitlab.com/jonmason00/meta-zephyr/-/jobs/2771910955
>=20
>=20
> >  ... 0001-2.7-cmake-add-yocto-toolchain.patch} |  0
> > .../0001-3.1-cmake-add-yocto-toolchain.patch  | 63 +++++++++++++++
> > .../zephyr-kernel/zephyr-kernel-src-2.7.2.inc |  7 +-
> > .../zephyr-kernel/zephyr-kernel-src-3.0.0.inc | 70 -----------------
> > .../zephyr-kernel/zephyr-kernel-src-3.1.0.inc | 76 +++++++++++++++++++
> >  .../zephyr-kernel/zephyr-kernel-src.inc       |  5 +-
> >  6 files changed, 146 insertions(+), 75 deletions(-)  rename
> > meta-zephyr-core/recipes-kernel/zephyr-kernel/files/{0001-cmake-add-
> yo
> > cto-toolchain.patch =3D> 0001-2.7-cmake-add-yocto-toolchain.patch}
> > (100%)  create mode 100644
> > meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-3.1-cmake-add
> > -yocto-toolchain.patch  delete mode 100644
> > meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.0.
> > inc  create mode 100644
> > meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.1.0.
> > inc
> >
> > diff --git
> > a/meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-cmake-add-
> y
> > octo-toolchain.patch
> > b/meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-2.7-cmake-a
> > dd-yocto-toolchain.patch
> > similarity index 100%
> > rename from
> > meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-cmake-add-
> yoc
> > to-toolchain.patch rename to
> > meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-2.7-cmake-add
> > -yocto-toolchain.patch diff --git
> > a/meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-3.1-cmake-a
> > dd-yocto-toolchain.patch
> > b/meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-3.1-cmake-a
> > dd-yocto-toolchain.patch
> > new file mode 100644
> > index 0000000..a16eabf
> > --- /dev/null
> > +++ b/meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-3.1-cma
> > +++ ke-add-yocto-toolchain.patch
> > @@ -0,0 +1,63 @@
> > +From 39f1dd116d00b6c2135c4ccd216341dcd2f2917e Mon Sep 17 00:00:00
> > +2001
> > +From: Naveen Saini <naveen.kumar.saini@intel.com>
> > +Date: Tue, 26 Jul 2022 14:12:18 +0200
> > +Subject: [PATCH] cmake: add yocto toolchain
> > +
> > +Upstream status: inappropriate [OE specific]
> > +
> > +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > +---
> > + cmake/compiler/gcc/target.cmake     |  7 -------
> > + cmake/toolchain/yocto/generic.cmake | 13 +++++++++++++
> > +cmake/toolchain/yocto/target.cmake  |  1 +
> > + 3 files changed, 14 insertions(+), 7 deletions(-)  create mode
> > +100644 cmake/toolchain/yocto/generic.cmake
> > + create mode 100644 cmake/toolchain/yocto/target.cmake
> > +
> > +diff --git a/cmake/compiler/gcc/target.cmake
> > +b/cmake/compiler/gcc/target.cmake index 014447e67e..b510f47d59
> 100644
> > +--- a/cmake/compiler/gcc/target.cmake
> > ++++ b/cmake/compiler/gcc/target.cmake
> > +@@ -94,13 +94,6 @@ execute_process(
> > +   OUTPUT_STRIP_TRAILING_WHITESPACE
> > +   )
> > +
> > +-assert_exists(LIBGCC_FILE_NAME)
> > +-
> > +-get_filename_component(LIBGCC_DIR ${LIBGCC_FILE_NAME}
> DIRECTORY)
> > +-
> > +-assert_exists(LIBGCC_DIR)
> > +-
> > +-LIST(APPEND LIB_INCLUDE_DIR "-L\"${LIBGCC_DIR}\"")  LIST(APPEND
> > +TOOLCHAIN_LIBS gcc)
> > +
> > + # For CMake to be able to test if a compiler flag is supported by
> > +the diff --git a/cmake/toolchain/yocto/generic.cmake
> > +b/cmake/toolchain/yocto/generic.cmake
> > +new file mode 100644
> > +index 0000000000..45e5777e2a
> > +--- /dev/null
> > ++++ b/cmake/toolchain/yocto/generic.cmake
> > +@@ -0,0 +1,13 @@
> > ++set(COMPILER gcc)
> > ++set(LINKER ld)
> > ++set(BINTOOLS gnu)
> > ++
> > ++set(ZEPHYR_SYSROOT ${ZEPHYR_SYSROOT}) set(SYSROOT_DIR
> > ++${ZEPHYR_SYSROOT}) set(LIBC_LIBRARY_DIR "\"${SYSROOT_DIR}\"/")
> > ++set(LIBC_INCLUDE_DIR ${SYSROOT_DIR}/include) LIST(APPEND
> > ++TOOLCHAIN_LIBS gcc)
> > ++
> > ++LIST(APPEND LIB_INCLUDE_DIR "-L\"${STAGING_LIBDIR}\"")
> > ++
> > ++set(TOOLCHAIN_LIBS gcc)
> > +diff --git a/cmake/toolchain/yocto/target.cmake
> > +b/cmake/toolchain/yocto/target.cmake
> > +new file mode 100644
> > +index 0000000000..9881313609
> > +--- /dev/null
> > ++++ b/cmake/toolchain/yocto/target.cmake
> > +@@ -0,0 +1 @@
> > ++# SPDX-License-Identifier: Apache-2.0
> > +--
> > +2.34.1
> > +
> > diff --git
> > a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.7.
> > 2.inc
> > b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.7.
> > 2.inc
> > index 7a4da21..537a565 100644
> > ---
> > a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.7.
> > 2.inc
> > +++ b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-
> > +++ 2.7.2.inc
> > @@ -62,4 +62,9 @@ SRCREV_tfm =3D
> "c74be3890c9d975976fde1b1a3b2f5742bec34c0"
> >  ZEPHYR_BRANCH =3D "v2.7-branch"
> >  PV =3D "2.7.2+git${SRCPV}"
> >
> > -SRC_URI:append =3D " file://dtc.patch"
> > +SRC_URI:append =3D " \
> > +    file://dtc.patch \
> > +    file://0001-x86-fix-efi-binary-generation-issue-in-cross-compila.p=
atch \
> > +    file://0001-2.7-cmake-add-yocto-toolchain.patch \
> > +
> > +git://github.com/zephyrproject-
> rtos/hal_cypress.git;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/modul=
es/hal/
> cypress;name=3Dcypress \ "
> > diff --git
> > a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.
> > 0.inc
> > b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.
> > 0.inc
> > deleted file mode 100644
> > index 64594a0..0000000
> > ---
> > a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.
> > 0.inc
> > +++ /dev/null
> > @@ -1,70 +0,0 @@
> > -SRCREV_FORMAT =3D "default_cmsis"
> > -
> > -#
> > -# Generated with:
> > -#
> > -# #!/usr/bin/python3
> > -#
> > -# import yaml
> > -# import sys
> > -#
> > -# if __name__ =3D=3D "__main__":
> > -#     with open(sys.argv[1], "r") as fd:
> > -#         data =3D yaml.safe_load(fd)
> > -#
> > -#         for project in data["manifest"]["projects"]:
> > -#             print("SRCREV_{} =3D \"{}\"".format(project["name"],
> project["revision"]))
> > -#
> > -
> > -SRCREV_default =3D "4f8d78ceeb436e82f528511998515f6fc137c6cd"
> > -SRCREV_canopennode =3D "1052dae561497bef901f931ef75e117c9224aecd"
> > -SRCREV_civetweb =3D "094aeb41bb93e9199d24d665ee43e9e05d6d7b1c"
> > -SRCREV_cmsis =3D "b0612c97c1401feeb4160add6462c3627fe90fc7"
> > -SRCREV_edtt =3D "1fc2e6f7d2a01a01074456f2ef2ccf1f3df7fac1"
> > -SRCREV_fatfs =3D "09a9d913c61dccbb8ff92d8943b452c614ac5292"
> > -SRCREV_fff =3D "6ce5ba26486e93d5b7696a3e23f0585932c14b16"
> > -SRCREV_altera =3D "23c1c1dd7a0c1cc9a399509d1819375847c95b97"
> > -SRCREV_atmel =3D "9f78f520f6cbb997e5b44fe8ab17dd5bf2448095"
> > -SRCREV_cypress =3D "81a059f21435bc7e315bccd720da5a9b615bbb50"
> > -SRCREV_espressif =3D "bcd7565ffa390d5774dc2fbe71a002faa9a7d082"
> > -SRCREV_gigadevice =3D "242a7f4be7a3136606c7a65169775f7ef85ad444"
> > -SRCREV_infineon =3D "f1fa8241f8786198ba41155413243de36ed878a5"
> > -SRCREV_microchip =3D "870d05e6a64ea9548da6b907058b03c8c9420826"
> > -SRCREV_nordic =3D "a42b016d7c7610489f5f8c79773fedc05ba352ee"
> > -SRCREV_nuvoton =3D "b4d31f33238713a568e23618845702fadd67386f"
> > -SRCREV_nxp =3D "9629f15fd80169cc9669e3fbb1260467c3aeb175"
> > -SRCREV_openisa =3D "40d049f69c50b58ea20473bee14cf93f518bf262"
> > -SRCREV_quicklogic =3D "b3a66fe6d04d87fd1533a5c8de51d0599fcd08d0"
> > -SRCREV_rpi_pico =3D "191f5ba46fda49523cdaaef27583d1c875ba2c36"
> > -SRCREV_silabs =3D "be39d4eebeddac6e18e9c0c3ba1b31ad1e82eaed"
> > -SRCREV_st =3D "575de9d461aa6f430cf62c58a053675377e700f3"
> > -SRCREV_stm32 =3D "300109f80730cb2477bfcc706a6602b9870336b3"
> > -SRCREV_telink =3D "ffcfd6282aa213f1dc0848dbca6279b098f6b143"
> > -SRCREV_ti =3D "1992a4c536554c4f409c36896eda6abdc414d277"
> > -SRCREV_xtensa =3D "0e577021bb66e644afd067cd9f7c71ab11b62b3d"
> > -SRCREV_libmetal =3D "f237c9d420a51cc43bc37d744e41191ad613f348"
> > -SRCREV_littlefs =3D "33509ed9c3d369cdb9d909cd40c5eea8f64a902c"
> > -SRCREV_loramac-node =3D "12019623bbad9eb54fe51066847a7cbd4b4eac57"
> > -SRCREV_lvgl =3D "783c1f78c8e39751fe89d0883c8bce7336f55e94"
> > -SRCREV_lz4 =3D "8e303c264fc21c2116dc612658003a22e933124d"
> > -SRCREV_mbedtls =3D "3e3e58a92de76069730c63e0d524f40fea948a61"
> > -SRCREV_mcuboot =3D "89936c338e46f43cb177a8b928cd80b90f3ace8f"
> > -SRCREV_mipi-sys-t =3D "d9da086b11cda494d85f4d8a9829f505c2d5e380"
> > -SRCREV_nanopb =3D "d148bd26718e4c10414f07a7eb1bd24c62e56c5d"
> > -SRCREV_net-tools =3D "f49bd1354616fae4093bf36e5eaee43c51a55127"
> > -SRCREV_nrf_hw_models =3D
> "b8cea37dbdc8fc58cc14b4e19fa850877a9da520"
> > -SRCREV_open-amp =3D "cfd050ff38a9d028dc211690b2ec35971128e45e"
> > -SRCREV_openthread =3D "b7aa7686d3f4e326bd25abc234b209159977c26d"
> > -SRCREV_segger =3D "3a52ab222133193802d3c3b4d21730b9b1f1d2f6"
> > -SRCREV_sof =3D "500d77e0ac84ac2c969e0d4b2142cca192e893bc"
> > -SRCREV_tflite-micro =3D "9156d050927012da87079064db59d07f03b8baf6"
> > -SRCREV_tinycbor =3D "40daca97b478989884bffb5226e9ab73ca54b8c4"
> > -SRCREV_tinycrypt =3D "3e9a49d2672ec01435ffbf0d788db6d95ef28de0"
> > -SRCREV_TraceRecorderSource =3D
> "e8ca3b6a83d19b2fc4738a0d9607190436e5e452"
> > -SRCREV_trusted-firmware-m =3D
> "5d32c3e64b3d589548e881eeeeb37d84944c90af"
> > -SRCREV_tf-m-tests =3D "52814181f0fde6d1422fac204d42cde30c62e40e"
> > -SRCREV_psa-arch-tests =3D "0aab24602cbef30f6422e7ef1066a8473073e586"
> > -SRCREV_zscilib =3D "12bfe3f0a9fcbfe3edab7eabc9678b6c62875d34"
> > -
> > -ZEPHYR_BRANCH =3D "v3.0-branch"
> > -PV =3D "3.0.0+git${SRCPV}"
> > diff --git
> > a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.1.
> > 0.inc
> > b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.1.
> > 0.inc
> > new file mode 100644
> > index 0000000..f38d7f9
> > --- /dev/null
> > +++ b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-
> > +++ 3.1.0.inc
> > @@ -0,0 +1,76 @@
> > +SRCREV_FORMAT =3D "default_cmsis"
> > +
> > +#
> > +# Generated with:
> > +#
> > +# #!/usr/bin/python3
> > +#
> > +# import yaml
> > +# import sys
> > +#
> > +# if __name__ =3D=3D "__main__":
> > +#     with open(sys.argv[1], "r") as fd:
> > +#         data =3D yaml.safe_load(fd)
> > +#
> > +#         for project in data["manifest"]["projects"]:
> > +#             print("SRCREV_{} =3D \"{}\"".format(project["name"],
> project["revision"]))
> > +#
> > +
> > +SRCREV_default =3D "2ddd73feafd3316af2c547c34d6969bea637d5c6"
> > +SRCREV_canopennode =3D "53d3415c14d60f8f4bfca54bfbc5d5a667d7e724"
> > +SRCREV_chre =3D "0edfe2c2ec656afb910cfab8ed59a5ffd59b87c8"
> > +SRCREV_civetweb =3D "094aeb41bb93e9199d24d665ee43e9e05d6d7b1c"
> > +SRCREV_cmsis =3D "5f86244bad4ad5a590e084f0e72ba7a1416c2edf"
> > +SRCREV_edtt =3D "1ea61a390d2bfcf3b2ecdba8f8b0b98dfdffbd11"
> > +SRCREV_fatfs =3D "a30531af3a95a9a3ea7d771ea8a578ebfed45514"
> > +SRCREV_fff =3D "6ce5ba26486e93d5b7696a3e23f0585932c14b16"
> > +SRCREV_altera =3D "0d225ddd314379b32355a00fb669eacf911e750d"
> > +SRCREV_atmel =3D "78c5567c05b6b434dd7d98f49156319df4217bac"
> > +SRCREV_espressif =3D "df85671c5d0405c0747c2939c8dfe808b7e4cf38"
> > +SRCREV_gigadevice =3D "63a72ca90b7e0d7257211ddc5c79e8c0b940371b"
> > +SRCREV_infineon =3D "4af06965f57ba1e7d170e6a97d24c33785543a8c"
> > +SRCREV_microchip =3D "5d079f1683a00b801373bbbbf5d181d4e33b30d5"
> > +SRCREV_nordic =3D "a85bb3676d61d1ae202088e0d3fec556056b2c9e"
> > +SRCREV_nuvoton =3D "b4d31f33238713a568e23618845702fadd67386f"
> > +SRCREV_nxp =3D "2302a1e94f5bc00ce59db4e249b688ad2e959f58"
> > +SRCREV_openisa =3D "40d049f69c50b58ea20473bee14cf93f518bf262"
> > +SRCREV_quicklogic =3D "b3a66fe6d04d87fd1533a5c8de51d0599fcd08d0"
> > +SRCREV_rpi_pico =3D "191f5ba46fda49523cdaaef27583d1c875ba2c36"
> > +SRCREV_silabs =3D "be39d4eebeddac6e18e9c0c3ba1b31ad1e82eaed"
> > +SRCREV_st =3D "52a522ca4a8a9ec1e9bb5bb514e1ab6f102863fe"
> > +SRCREV_stm32 =3D "51b373cd3455b8c2b9babbf6ff41918116a442ac"
> > +SRCREV_telink =3D "ffcfd6282aa213f1dc0848dbca6279b098f6b143"
> > +SRCREV_ti =3D "905a5d4134899630071f9383aadaaf266e8f8cd2"
> > +SRCREV_xtensa =3D "0e577021bb66e644afd067cd9f7c71ab11b62b3d"
> > +SRCREV_libmetal =3D "850a3c3fd5bc655987021dc9106d8e8cd0f7e061"
> > +SRCREV_liblc3codec =3D "3951cf1b71ff3be086c9b9b595e473e12301337c"
> > +SRCREV_littlefs =3D "652f2c5646e79b881e6f3099686ad3b7af9e216c"
> > +SRCREV_loramac-node =3D
> "12019623bbad9eb54fe51066847a7cbd4b4eac57"
> > +SRCREV_lvgl =3D "df717ac87a9fd80246cc8df24554475e59bda21f"
> > +SRCREV_lz4 =3D "8e303c264fc21c2116dc612658003a22e933124d"
> > +SRCREV_mbedtls =3D "7fed49c9b9f983ad6416986661ef637459723bcb"
> > +SRCREV_mcuboot =3D "e58ea98aec6e5539c5f872a98059e461d0155bbb"
> > +SRCREV_mipi-sys-t =3D "a5163c1800a5243f8b05d84c942da008df4cb666"
> > +SRCREV_nanopb =3D "d148bd26718e4c10414f07a7eb1bd24c62e56c5d"
> > +SRCREV_net-tools =3D "f49bd1354616fae4093bf36e5eaee43c51a55127"
> > +SRCREV_nrf_hw_models =3D
> "b8cea37dbdc8fc58cc14b4e19fa850877a9da520"
> > +SRCREV_open-amp =3D "8d53544871e1f300c478224faca6be8384ab0d04"
> > +SRCREV_openthread =3D "e2a765599aa0379d0f72f0149a9cbafec070c12d"
> > +SRCREV_segger =3D "3a52ab222133193802d3c3b4d21730b9b1f1d2f6"
> > +SRCREV_sof =3D "2efc3ea41c0074c6dab5f376fafaa26f52c25c75"
> > +SRCREV_tflite-micro =3D "9156d050927012da87079064db59d07f03b8baf6"
> > +SRCREV_tinycbor =3D "9e1f34bc08123aaad7666d3652aaa839e8178b3b"
> > +SRCREV_tinycrypt =3D "3e9a49d2672ec01435ffbf0d788db6d95ef28de0"
> > +SRCREV_TraceRecorderSource =3D
> "e8ca3b6a83d19b2fc4738a0d9607190436e5e452"
> > +SRCREV_trusted-firmware-m =3D
> "7c53a6e76130a85303f83b15d868a92fdcd5f5be"
> > +SRCREV_tf-m-tests =3D "c99a86b295c4887520da9d8402566d7f225c974e"
> > +SRCREV_psa-arch-tests =3D "a81f9da287569f169d60026916952641b233faa8"
> > +SRCREV_zcbor =3D "882c489a7d9fdfff31d27666914a78a9eb6976d7"
> > +SRCREV_zscilib =3D "fc979a8dcb74169c69b02835927bff8f070d6325"
> > +
> > +ZEPHYR_BRANCH =3D "v3.1-branch"
> > +PV =3D "3.1.0+git${SRCPV}"
> > +
> > +SRC_URI +=3D " \
> > +    file://0001-3.1-cmake-add-yocto-toolchain.patch \ "

[Naveen] Patch 0001-x86-fix-efi-binary-generation-issue-in-cross-compila.pa=
tch is also required for v3.1.0. It needs rebasing too.
I will sent v3 with the fix.

> > diff --git
> > a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.inc
> > b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.inc
> > index bf9ceaf..e9b35c9 100644
> > ---
> > a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.inc
> > +++ b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.
> > +++ inc
> > @@ -19,7 +19,6 @@ SRC_URI =3D "\
> >      git://github.com/zephyrproject-
> rtos/fatfs.git;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/modules/fs/=
fatfs;na
> me=3Dfatfs \
> >      git://github.com/zephyrproject-
> rtos/hal_altera.git;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/module=
s/hal/al
> tera;name=3Daltera \
> >      git://github.com/zephyrproject-
> rtos/hal_atmel.git;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/modules=
/hal/a
> tmel;name=3Datmel \
> > -    git://github.com/zephyrproject-
> rtos/hal_cypress.git;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/modul=
es/hal/
> cypress;name=3Dcypress \
> >      git://github.com/zephyrproject-
> rtos/hal_espressif.git;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/mod=
ules/ha
> l/espressif;name=3Despressif \
> >      git://github.com/zephyrproject-
> rtos/hal_infineon.git;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/modu=
les/hal
> /infineon;name=3Dinfineon \
> >
> > git://github.com/zephyrproject-
> rtos/hal_microchip.git;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/mod=
ules/h
> al/microchip;name=3Dmicrochip \ @@ -52,11 +51,9 @@ SRC_URI =3D "\
> >      git://github.com/zephyrproject-
> rtos/hal_telink.git;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/module=
s/hal/t
> elink;name=3Dtelink \
> >      git://github.com/zephyrproject-
> rtos/lz4.git;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/modules/lib/l=
z4;name
> =3Dlz4 \
> >      git://github.com/zephyrproject-rtos/tflite-
> micro.git;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/modules/lib/tfli=
te-
> micro;name=3Dtflite-micro \
> > -    file://0001-cmake-add-yocto-toolchain.patch \
> > -    file://0001-x86-fix-efi-binary-generation-issue-in-cross-compila.p=
atch \
> >  "
> >  S =3D "${WORKDIR}/git"
> >
> >  # Default to a stable version
> > -PREFERRED_VERSION_zephyr-kernel ??=3D "3.0.0"
> > +PREFERRED_VERSION_zephyr-kernel ??=3D "3.1.0"
> >  include zephyr-kernel-src-${PREFERRED_VERSION_zephyr-kernel}.inc
> > --
> > 2.34.1
> >
> >

