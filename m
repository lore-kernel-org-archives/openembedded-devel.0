Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A51CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 06:09:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.web11.5954.1755238154378061029
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 23:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Bk54tVNt;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755238155; x=1786774155;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OWS5ejlOg/klpz+sUWTxIk9ZBZqN89VpoF+585LU2do=;
  b=Bk54tVNtNzyHqszLsTHI4fTvSA4zOpfeF91QuW3pTNRJjwgMCdMOIkWg
   t0+IvM0vG3n1UwqQ1PuTue2EAoklW8r5PlEbexFG9lpuw6/DU5GOW74Ne
   FT/04SGoXEhxiTxB8V11kKVU7gAQlPDa7t9wUr9gJmvP2uJvARVX4QR3F
   +jij0WeBeRK521oNM8fSyCZqWarjNAw0TMhHz27qmdu5zcw3dd0yNuCyb
   t43BRI/P6hDD4vRnsgyA1gwMDdm/TMp48WDA6oUlyC9PysvfYwEbm1XGU
   i0zG9/eyfRw+LbTI+bTsFbcKXUfCk9mzy946Swd8B0gXkoSuyprgaILY/
   w==;
X-CSE-ConnectionGUID: 0awN4yQwRrCtQfbNnnAhdQ==
X-CSE-MsgGUID: UmlmlfhrR7idTvQ51GR2LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="80142186"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="80142186"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 23:09:14 -0700
X-CSE-ConnectionGUID: X7dheWxJRQqiCO0W0lS8HQ==
X-CSE-MsgGUID: wNGNx6itSLu4DP7V+sIvRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166433156"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 23:09:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 23:09:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 23:09:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 23:09:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyB9ZN6tXKOZIXEruLj36HJGMEwhKRUmh2rcQWytGvXaAFjtCuUzVsRNpNizmAAle3KPbkdykDQ/j96fvsfGda2qOQCbc61KbAlZLyea3tGGAmueXc2E6HehGB+oor0o7bDG/cSpxuzL18730arL0EEe0Qv8DyVJvcDl2J05HhoExiJQxAUsFHHenPw9eCHrCaYAtS4GuUp2Exn7cQkI8wJdaTbBDy/A4TdXinTFysqnjdpbWi6wbnpkupEM44u6BG58zVH7FNmRYI9FrMoA32xMA7C90JAC7Kcw9fGhEzt6AhvpjwcV/aNMFfO2glvzj1uLv9aLoyQ1eVklS9nw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bhEfJIrAOg5X4izMcmzPujTn988+WcYmJfjBXxbKjA=;
 b=PWd8lV1MoB8C5f4hvtlNHtVcnth+0sqTwNBkQv9IgsK/HQXKWFu0PN6FNVXWUFXfsQXOLF6iMXMwZXHs+suzTpQNqM/WnoUDuDVhTOtbpe+4P2ue36OyUSbTHFE5DbMPGj5h5ufOOPyNERJQll8Czj+QxpFnyfkd9t3N88gt+MI6dpY9ryTnd1NCTxZhHhEfZCwtlNmCVKD5FEs1JAshHUO54FU6kmEcl5jKpklhLAJwxTSnLo830f5g+pbngJOW/q19x2xpkvlDWrADrMBPw51b3mWcUpCZTbag3HoaJeEgVMU/uACH0rodANCRH9ZYWrrqpulRnYqXooRvlLJPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8702.namprd11.prod.outlook.com (2603:10b6:610:1cb::7)
 by LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 06:09:08 +0000
Received: from CH3PR11MB8702.namprd11.prod.outlook.com
 ([fe80::f368:94ae:13d7:a3bd]) by CH3PR11MB8702.namprd11.prod.outlook.com
 ([fe80::f368:94ae:13d7:a3bd%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 06:09:07 +0000
From: "Lau, Karn Jye" <karn.jye.lau@intel.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
 conflict by using SRC_URI.
Thread-Topic: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git
 fetcher conflict by using SRC_URI.
Thread-Index: AQHcDZsLPP8TZUoOrk+X1krjohD77LRjNfGAgAAEpGA=
Date: Fri, 15 Aug 2025 06:09:07 +0000
Message-ID: <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=79510229-3cbf-47e6-bd6e-de6256f29579;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-15T05:51:00Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8702:EE_|LV3PR11MB8483:EE_
x-ms-office365-filtering-correlation-id: 186332a1-6311-4d4c-7d9e-08dddbc23ea9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?pkZTxRVZbpMLLxtQ4LWXX9ZRwwBudezEtNyichuZDq2bR5EpazxZTqjNY+XY?=
 =?us-ascii?Q?fqlaqJolGWivHGOI4WUv97uV65WuuxZSSTha5IplweoKmoqf9o+g2FhADNDC?=
 =?us-ascii?Q?URC5383k8ZcecL1KovMdXdc07yHCOmVCJyi6Uq6UptgrVtgQ7fJCc8DtYjJa?=
 =?us-ascii?Q?Xp+PWO5nJjSscNHyWfd01E6y1RM9SWYQqUvD8jbBoDsRCjA4LD9/TzvhKDtE?=
 =?us-ascii?Q?5nq2zEezD8i830HLJJ0ljjMIupZtWAskEMfTe+WNROvzSkzaBENtXypp9sQg?=
 =?us-ascii?Q?dsuKVx43AshpnYq/V3ZCK9+aWROosnROLfwedKQ8gGMXGbsQxbgLcpKeTtzg?=
 =?us-ascii?Q?u6+e5jD/ZZJVwudVJblyEXh28gwXvhGbWVZuz0DSJFtYEOLgq6ahj9aEW9jW?=
 =?us-ascii?Q?24NlHw7lWOa3x7VvYsmIOcWq8UUYoi5ljxqUHqoPIb1bLBA9P5N3CxelJqab?=
 =?us-ascii?Q?HQy9XVGyGo/sU2SZFwRn0TTrPMAVeR4et2PI+yAKZCOwbOPQKqc1HrutIGd1?=
 =?us-ascii?Q?T9+erxgb5Z0n349HpV3JJGxRKzsljg1GAxEdaq2b5il+DguKUik4mygVnzwL?=
 =?us-ascii?Q?Xz3On4FNK2c1xKmicXgO1VAE7PHpK+3zT/pbfxsKTjRlW2IbGqj7uxjF0nSA?=
 =?us-ascii?Q?tNGaUci5fn4mLoxYXhT11LjQv1b1VkOBKuajlyWP44ogyL/VsMflGf2WV5Iv?=
 =?us-ascii?Q?t7KhNeE6l8YgqhQSBF/MUX9jy66op2y/wqB2ebw3YMKM8OGokqLxigK6Pq+6?=
 =?us-ascii?Q?FwAa6HddDvHvwIZ0Kj8Mm4N3k2MksbvqI3BsPDnwKk8QSmiMcjaRzJ88THZb?=
 =?us-ascii?Q?qCqg8zK6CpFbcEyQTlM6lQMXGpl2Kco6QWnI6iISkpeRn6dNWALH4T417w7L?=
 =?us-ascii?Q?RhD7A4L5ykJIw3nACZ9nwgCGwzlWuCCNu2wyRLczzJQ/zhVUi0H3Hhq5WWEJ?=
 =?us-ascii?Q?/Fw97GyXdnvonJIyc1ZOxJpkUQVEExjIm7NlT0c0O0CwnAm1xBsOB1ppBMRT?=
 =?us-ascii?Q?tZgtXpJwQGEjtn7KMBnaPhMeI7ClSwh6fty1e4AsnKH0O4F106wpGp3z9rSW?=
 =?us-ascii?Q?y0pJCs32bEFdzeAnZEUwhDpJWJauFj/52k0KF+vgl8Bq3KkhrGNi+Jc7IXPJ?=
 =?us-ascii?Q?naPiqUpRnrqtOklSsb3myd3qLEkXwFNBY3xvqRczuAzzegF3sldcwZ5+eJq7?=
 =?us-ascii?Q?6JqAyJMDoPVD8vgv+2lBpy1s81HXFzt6npHgD4wpX7NPRBq05ZI3f/PiobRt?=
 =?us-ascii?Q?x2R0oiGdq83kj9Qzf8aarA2JnIwCkGb3R+STzJrUP0Jlr0uuWy77R9HOqNVf?=
 =?us-ascii?Q?D12mmN+mrZ8zs2PelN5a4RrOEeQVr26cq7lwcrZ2ZtmPvitgIEfTHtOEwb+6?=
 =?us-ascii?Q?bWEnXDQcO6h2bmYdOQKUUxkHP43SxkOKXvykw2m0q9fjofdcE5rHSSfe7Uxj?=
 =?us-ascii?Q?MyPctLSttZ8EeU9dUImFxIW5vHyHX7VNySD9GFowWe2zFNSAKYRDvQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8702.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7YdY/n1BaBpTnKOS7xc2fdjy5Z4r6QXWYeAVeZ0aAQaovvpRQMcJTW1Z2re4?=
 =?us-ascii?Q?JtTkAqnWSh4Oidd0m+2ouBFZG/oOMdCi3ilt4LFdR+++8Mh2dywOJqlq196Y?=
 =?us-ascii?Q?bDEit1q+/EARBr1u+ftIbgX4CMU4f2CUpViHJBGdnoJHIqR2ADjFleGG1OOT?=
 =?us-ascii?Q?146D+lwJb+nFqKOYsFHXAXQpumkG895uJPRg0tNoInQHvSIxodJwKfAfL+ic?=
 =?us-ascii?Q?QNGapR7ZH0iLC/zhrRxRF4C02e/Puc0wnc6n0J6tyl39tMqT9cS9DPmDHpF0?=
 =?us-ascii?Q?z/YFKBfyg7PVu72KtY9o20K98D+PmOzfs4KEz5i06HpzxD+kC0HCFbXNCWgX?=
 =?us-ascii?Q?d3sq87UNNA1X0zt+w4DPTAxyq+RxvQTAuixSKc0nmLyiNsyqFMZpTXcEazP6?=
 =?us-ascii?Q?OSrNPDB7THPBsaPL1gCxj7GHDD94nJda8xrt4IbGFYRcUP/kNdHEv/OP32lQ?=
 =?us-ascii?Q?rOwr6E2oYd7jpLnSJP7XLOFwSuwWPViU1bRUQa4bevHqDiwZODoS9okZYeyD?=
 =?us-ascii?Q?vYsLcwfQz+xWUFq2wxOtmc2XQ3X+18P9P4cLflrslPJiDuN8/CtDHqkY4GKc?=
 =?us-ascii?Q?pcFUXhM1iTCSNDU5Bd7LkQzD6KjjULSB5YIGb6xuwdr2gO+DK3Bs/815llhf?=
 =?us-ascii?Q?m7nH8xdHZhwIBDtU/MPCDzXytvEuqN+IQ0IDDx25hlcsjSsRtkl2oZhwoe+9?=
 =?us-ascii?Q?OAc52L/pVm3BiXriprAyqB+4rI7JZvBz0XGemRoR1TzpFJTJdhBCwXnkwkQg?=
 =?us-ascii?Q?k2UFUaECfGO8z8MSblIBaiCbX8C1TmQAatf0+Q6stUQIcOJphq2PSesnPgBi?=
 =?us-ascii?Q?8bne8laflFDw5l6JWtlXLNSpdmTSANLIV6OOw9batLHWAu+bJ7QH+7DziYrx?=
 =?us-ascii?Q?CAA394fUbDoN4KzbqsRdACs4OtNsiCVB3QBqEsjf1b6DUUAUYX4RLm+qbPMc?=
 =?us-ascii?Q?1G7wWh3d2Tw8//mX4jn9Pg1/B3fhcGgDIAS04XYFWyU3NwvenrIvAYh9imgr?=
 =?us-ascii?Q?qd77I1AxGUpKeNIRDWpoMcwZBnNicpLHzg53U1zxgQRSPexrajfMzDcEUy43?=
 =?us-ascii?Q?q/Y///kjO+WiUrnKj/9LTEhTI99WIIPIVWJq0sywdW4FzB6We7EkqiVvSuCy?=
 =?us-ascii?Q?UtjRcsY1qid5G53oTvpjLv3Ck7UZ841LIE2b8N8/nhb7rKNEoFANC8jPKDmS?=
 =?us-ascii?Q?+nsxQkZLgMembAcnI/yHqqkc+J1lIislvpDt60uySelPMD+xdfLoXf4KJnWw?=
 =?us-ascii?Q?YrzIpYck63y8Ius5IYpJgTXbFxl129Z2jzmhj0y7SLXSA9fk1j9SfCn0/96B?=
 =?us-ascii?Q?Nkw+rm2KLueE4xxxBbPywd3gDDMGj4/Y99AxSjxrRRpLD5WG9pcWyyVN6wyz?=
 =?us-ascii?Q?EWCi6QDPho5g+qpv1j3mIs0qN7rZaguGy9hApHXTYyXSwahsHfVH5mWpWCzb?=
 =?us-ascii?Q?PUbGm7oTLRamfdyzhgVMMQV8ISMi+dYDYPVi86eL0AYfTJOuuCF2NQ2VPqwS?=
 =?us-ascii?Q?NeoDYlYGgp6JgRDdXAXLhJ434BJukac/tO2OqmdYzKlb4RKaRo1RU1hTehWA?=
 =?us-ascii?Q?HdKmguoLXqQvZcBaxsekHM1kYMM2CERxrTLEnEcs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8702.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 186332a1-6311-4d4c-7d9e-08dddbc23ea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 06:09:07.7769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysCtnwDY2FEYU7CkZLGfYK90BNzOBtYkYO1crvdXSvfBxqnMwItqU4p3gV1ewaIEhQcRB9ZGTG0IGYYkIUosUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 06:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118959

Hi Peter, it may working fine in master branch
but it not working at all at LTS branch for example yocto 5.0 scargapth, I =
observing our daily build hit into this issue.
Thus submitting this patch

KJ
-----Original Message-----
From: Marko, Peter <Peter.Marko@siemens.com>=20
Sent: Friday, August 15, 2025 1:53 PM
To: Lau, Karn Jye <karn.jye.lau@intel.com>; openembedded-devel@lists.openem=
bedded.org
Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetc=
her conflict by using SRC_URI.

Both tag and SRVREV works with latest oe-core/poky master.
And is actually encouraged to be used so that hash is verified against the =
tag.

I wonder what could be wrong since this is a second patch for this recipe c=
omplaining about errors.

Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-=20
> devel@lists.openembedded.org> On Behalf Of Lau, Karn Jye via=20
> lists.openembedded.org
> Sent: Friday, August 15, 2025 6:11
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git=20
> fetcher conflict by using SRC_URI.
>=20
> From: kjlau0112 <karn.jye.lau@intel.com>
>=20
> if both SRC_URI & SRCREV specify particular source revision will lead=20
> to "Fix Fetcher failure: Conflicting revisions error"
>=20
> Fix by removing SRCREV and specify expected source revision in SRC_URI=20
> by adding revision parmater.
>=20
> Signed-off-by: kjlau0112 <karn.jye.lau@intel.com>
> ---
>  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 4=20
> +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git=20
> a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb=20
> b/meta- networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> index 88b50a406..2591e2cde 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> @@ -23,12 +23,10 @@ LIC_FILES_CHKSUM =3D=20
> "file://LICENSE;md5=3D379d5819937a6c2f1ef1630d341e026d"
>  SECTION =3D "libs"
>=20
>  S =3D "${WORKDIR}/git"
> -SRC_URI =3D "gitsm://github.com/Mbed-
> TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtls-3.6;tag=3Dv${PV} \
> +SRC_URI =3D "gitsm://github.com/Mbed-
> TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtls-
> 3.6;rev=3Dc765c831e5c2a0971410692f92f7a81d6ec65ec2\
>             file://run-ptest \
>             "
>=20
> -SRCREV =3D "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
> -
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>=20
>  inherit cmake update-alternatives ptest
> --
> 2.34.1


