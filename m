Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.10786.1595565989000610919
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 21:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=b/NJcoHH;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: mohamad.noor.alim.hussin@intel.com)
IronPort-SDR: FnEbIrvfkpo9jjiLjx0ECSjWIhF77IizrcQdsdcozqwKo/mPz4WFlRCbnEPuQFtRwl7eVSp7rq
 igHX4xpf2zoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="215248688"
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="215248688"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 21:46:28 -0700
IronPort-SDR: Wb9gSk9Dhx/5v6ncSSlxCwdIGRhV+2IoMKV/UGzkSUIsdzgLqZkUWi4vKey60R9CSnc8jt0azZ
 n8D57v6nekyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="463102397"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
  by orsmga005.jf.intel.com with ESMTP; 23 Jul 2020 21:46:28 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 23 Jul 2020 21:46:28 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 23 Jul 2020 21:46:27 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 23 Jul 2020 21:46:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 23 Jul 2020 21:46:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNDgeGFyaF0ojRE4DZ7owo/AEGsTyfqFaYSFWV18xUm30j/9LO0M0FmpvO3Kyf8OF3WUW0Ppub8iKv06+2VjzU5odu5QyuoVWGx3HM/Hvk3x4SsIgKP4TX6szmj6O9znFFd2qlRgy4StJggPJUYXphWtIKa1oL2OjrqXX8epsgNJVn/JOBlY85Wg4Xy2wzJx/pZPNRy59kiCZyvk5S84+stw9/FuyioJjB6DXWeSYeTnxuBYdHitSh2S1RdHEkizs9KAtMe4X5az1K4Z4DxpqS43o6nRIZ5ddxEdUA33u22uPHpHdfvB6MyeloQYQo3iFSPT+7WukgYtfep8fReOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vL10TnhJCMoJhBs9kPczwaHorwKE9sGl3chezUj2SwA=;
 b=KMYGQeBiJSeFLCaIBjaw0CsIGdhtgh0oZ0r6lUtIHxjcTzhzamuqslsjmmrnthEF+Nj5QvggIFPj78ACc+0UD3I/R3X/ZZVmVXhcBIbTOfl116q10J+ImVrzl+yhv1dBIREkDFFs6Uln4+dy6GfhGSuR4AtyE4YGH38SDBmHYttn57xxjYySkRRXtoiPKke35v7hG+0onrrRUuYg0UvHAeFQi5FceKFp9kCZwKEH4J6K17l2ree863S+OGFW8aQ6cs4KY699BG3DB5ihGjUngxmPagvrPN6FSbHn2J7opQJKMBnGbUKBT08nroDkOz2UvjYT39qDGstYy8nq/bLkCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vL10TnhJCMoJhBs9kPczwaHorwKE9sGl3chezUj2SwA=;
 b=b/NJcoHH9YJLm88JbxoFHrk0xFAakQk2PW8sjqIaGiwghs4TxqxrUK9BBdU0Xfk0BbzJT7kSvKUPKv/uqHzGaP8s034+1mEJKB1EyYK5BKaKlQloPaewMbp8h+Hd4cjq3uo92dCBNzbGVtL/YE5hHWalVxSNOFC36m776p2Pi/s=
Received: from SN6PR11MB3534.namprd11.prod.outlook.com (2603:10b6:805:d0::31)
 by SN6PR11MB2576.namprd11.prod.outlook.com (2603:10b6:805:5b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 04:46:23 +0000
Received: from SN6PR11MB3534.namprd11.prod.outlook.com
 ([fe80::f8ad:7af4:c3b5:b9e0]) by SN6PR11MB3534.namprd11.prod.outlook.com
 ([fe80::f8ad:7af4:c3b5:b9e0%4]) with mapi id 15.20.3216.024; Fri, 24 Jul 2020
 04:46:23 +0000
From: "Hussin, Mohamad Noor Alim" <mohamad.noor.alim.hussin@intel.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Mittal, Anuj" <anuj.mittal@intel.com>
Subject: Re: [oe] [zeus][meta-oe][PATCH] glog: fix do_fetch error
Thread-Topic: [oe] [zeus][meta-oe][PATCH] glog: fix do_fetch error
Thread-Index: AQHWA0hQDT9YtbPSuUK6xLFyyWGJEakW4tOw
Date: Fri, 24 Jul 2020 04:46:22 +0000
Message-ID: <SN6PR11MB3534B5002527FD7361285B0F8D770@SN6PR11MB3534.namprd11.prod.outlook.com>
References: <1585211139-14799-1-git-send-email-anuj.mittal@intel.com>
In-Reply-To: <1585211139-14799-1-git-send-email-anuj.mittal@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [115.164.186.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcd29259-6a8a-424c-6808-08d82f8c840a
x-ms-traffictypediagnostic: SN6PR11MB2576:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2576FE66FDF7A5A5563729D28D770@SN6PR11MB2576.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /SAJ99wA7XcYIDiU+gpNUA/q0BRIQN99wgOj8bsK2b97B/ctQyC16cQunVBi2pBMbL/0pUKMDO8gPD/QR4C5JTW+u4PALaMZ5NBcyWP4H2sDR41Ym3qLpWzgVM4avHBnCXUNpbyzo7S4vRCVdtkIAKL7rbiTPnXhW/JcJ6yek8ecw8azzcmrXQBvwQMC17pX/lOFimkVxbbYBG7HyfrJ1tweglJB5dyWwdLy6o4n/BQ4bpQxB2+Y/kcyH+jRrfsCCTEpXdb8BDUf7d41gZnqcAu7eo9pfIfzSki0RcI1stVCOxeKM65iwmth5UVsO1FC+pjYnlrj/ByllPtE+sAavg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3534.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(5660300002)(52536014)(76116006)(83380400001)(66476007)(66446008)(66556008)(66946007)(110136005)(4326008)(71200400001)(2906002)(64756008)(316002)(55236004)(7696005)(6506007)(53546011)(26005)(8676002)(86362001)(186003)(33656002)(107886003)(8936002)(55016002)(9686003)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ZykWhg4gu6aPIeCOagEwz3XM/ENL1/fYSiXZyu2cDmgRZT/sG9Dv/QPX6vl5pxyfAKGCXYD3gFIQd3VfK8Sx1GKjPklxnFhxs5v+NnqFO9v87llHblREnaW/V4YwSffPGDi+/N45a2dzNvGl/HwcTjwgUxv4fdxpzh+35/v6kA0HH1BBQXkakpILDJU3Paa9A9Spa6E7BnjPaoh5Tlonk4mBbIZpJhuu8odMKbBv2i3j5DXLXzj0tiwST1M4R/x8X4ArRfFoW3FaeUbgKuEnf5fGw8aBvqvTuwbagx6IVgQR4ILUkWFgDPaL0OSL/otZOhsIeRRapx0N53U/Qhrl6/m3EvwRFshyBu648wPBjBDZ8zV/safBkc6rjNLVScojkdf0r3RQ8mRWsp8twgJdPN0buwwbIcXzjVLPHqBehXAM0bSrxB+6fiSXMaMymkuukoRhdDP/DYNaJm8uLZynNJEficK/qSsjfoFLTBguJrMmLdb7L1x/izmCVN90iD6P
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd29259-6a8a-424c-6808-08d82f8c840a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2020 04:46:22.8187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8N2JX+8d9jzUSkGg60VjaPC/XtpuvPLomp1m6KHU/kgHbp/XzSfxoahpI4rPKo3okPdV/O5erI8bh8Hg0d1VWTOXdaZWtHyPTb8YFtvEZJADcGm7wUfjxiw6GLxyu0CL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2576
Return-Path: mohamad.noor.alim.hussin@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Please backport this patch to zeus branch.=20
Thanks.

Regards,
Alim Hussin

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Anuj Mittal
Sent: Thursday, March 26, 2020 4:26 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [zeus][meta-oe][PATCH] glog: fix do_fetch error

From: Quanyang Wang <quanyang.wang@windriver.com>

This fixes the build error as below:
WARNING: glog-0.3.5-r0 do_fetch: Failed to fetch URL git://github.com/googl=
e/glog.git;branch=3Dv035, attempting MIRRORS if available
ERROR: glog-0.3.5-r0 do_fetch: Fetcher failure: Unable to find revision a6a=
166db069520dbbd653c97c2e5b12e08a8bb26 in branch v035 even from upstream
ERROR: glog-0.3.5-r0 do_fetch: Fetcher failure for URL: 'git://github.com/g=
oogle/glog.git;branch=3Dv035'. Unable to fetch URL from any source.

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com> (cherry picked from commit fab=
032f70de330dc618b9419a42ec90d49253f9b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-support/glog/glog_0.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-s=
upport/glog/glog_0.3.5.bb
index 3de01ef..70eef72 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddc9db360e0bbd4e4=
6672f3fd91dd6c4b"
 DEPENDS =3D "libunwind"
=20
 SRC_URI =3D " \
-    git://github.com/google/glog.git;branch=3Dv035 \
+    git://github.com/google/glog.git;nobranch=3D1 \
     file://0001-Rework-CMake-glog-VERSION-management.patch \
     file://0002-Find-Libunwind-during-configure.patch \
     file://0003-installation-path-fix.patch \
--
2.7.4

