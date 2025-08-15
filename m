Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD16CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 11:05:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web11.9060.1755255925583253458
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 04:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=DeJAEAdp;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755255925; x=1786791925;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=2tZPgOFtTSCdwu7KVBZzrLlZyEWkuTQddjlWv3enY1A=;
  b=DeJAEAdpMPnjPNsLPqORcYXYhZzaFTpttCDqwmPqu+y/sn7M2hy8AlEv
   DafoL5HJaDbFlYlBpJQkqUvJaOQcEO1bbM0Dp9pDho2muE1hMyYo7sutx
   q3VYhWuf/o2bw3qujUL69xp8Z0LP+qGlpvS6GG3wBM1Czdg3f45Qv1kcw
   V5coCBIDuxJH8TRnisY/FiUVp6OGIH7y9tp75JKhi0HgpVgWIqvAknuqu
   lnuYKtCh7JiKB3/txB3oZDPV/WROVAVkasCkWn+/gg8VWRnKggo8F+bXh
   segsOihap0ar2HdyuimD8J9e/DR3U/EOlaNtKiSKdfgH6PFP0ntldUv76
   w==;
X-CSE-ConnectionGUID: 3TGb0BX5SEabJkQzZz+36w==
X-CSE-MsgGUID: w3cRDWUfT9GnGY2chiIKIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="45151770"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="txt'?scan'208";a="45151770"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 04:05:25 -0700
X-CSE-ConnectionGUID: sp4dZ45VRDOyX6r87HleZg==
X-CSE-MsgGUID: KJemhRauRgWA1HsUs2SYow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="txt'?scan'208";a="171451600"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 04:05:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 04:05:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 04:05:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.86)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 04:05:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2zE/nBMcObm9Wots9hC7o3W0VRFUuh3Zv8GRTYq8IsvZ11a92uNtiCKbVqJWLPGWlkzYLQKZLdrtwCUgabmP2uQ8VYAD741iDLIarAjKm6yX8zADneuLEvumH64DElG49Koo+F0nvgdK202ppYEwSLakM1fvktf0kNgkSKDUAsXHlSAWuBlBGyl193hikK75VoJcOVv1te7yXziE2cblrPGVEkwtty80zR2eBwN+Atkft8X3xe6vHEZq7IWcA0/JG6ynWzYpZJmJAfTbbcq/WwiHG7dmHX2FW+k2v+nL3P0gVd1U+MQ+W8+9fnqQsgJZbuzYoaxuYlyuku5YZL6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jm9L0TmQADy/AmDX3iX+1KJAFMekrYnykMVnWV8L3ts=;
 b=fZCgUX0mrfJd9XKJqcWgSms7HqQNM9v74I8DO75j7hHvGmggEUzK6jeWJgWNJPLgYJcT0Bieg178QY00Cqq1vTBgdhfo9rka6ceJRTCY7FLSL1al+IlstRgp6sIsu1AIQop1f+f7zKsEHVzP+D8sE1V69eDdZO6vSpwt61XFNPymCDwIAfF3BIDfv6wsAxKWTW/bUbV9WfpIDG5Q5CIw1nN1jPP9YoZcnNly8rEwjnn2qt07Bbvo0Xf3AtAeK71RM90z4fMeufGEBV1lUcPOd/EzNxoiv4+0sKbm27A2QopBd9cv0luELv+urVAy6e2TTt0YXfPWNAx1xnwIttHGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8702.namprd11.prod.outlook.com (2603:10b6:610:1cb::7)
 by DM3PPFB0F355549.namprd11.prod.outlook.com (2603:10b6:f:fc00::f45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 11:05:22 +0000
Received: from CH3PR11MB8702.namprd11.prod.outlook.com
 ([fe80::f368:94ae:13d7:a3bd]) by CH3PR11MB8702.namprd11.prod.outlook.com
 ([fe80::f368:94ae:13d7:a3bd%4]) with mapi id 15.20.9031.018; Fri, 15 Aug 2025
 11:05:22 +0000
From: "Lau, Karn Jye" <karn.jye.lau@intel.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
CC: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
 conflict by using SRC_URI.
Thread-Topic: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git
 fetcher conflict by using SRC_URI.
Thread-Index: AQHcDZsLPP8TZUoOrk+X1krjohD77LRjNfGAgAAEpGCAAACpEIAAIPQggAAQygCAAADToIAABUCAgAAA57CAAAHNgIAAA+6AgAATMsA=
Date: Fri, 15 Aug 2025 11:05:22 +0000
Message-ID: <CH3PR11MB8702E0C49B62D28F6895DE97D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
 <AS1PR10MB5697355DC7874A906AB2E20EFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj9bSkBW1DRgHe8JDvYxgsfjowYCAg8RCyxSi6pVtwhJXA@mail.gmail.com>
 <LV8PR11MB8699B8D2F8167A3F836B80F5D734A@LV8PR11MB8699.namprd11.prod.outlook.com>
 <CANNYZj_eghchJhG0DmgF=nUUrCuaq3okE1GUYCCtZ8FbqNs6Eg@mail.gmail.com>
 <AS1PR10MB56978F72114B25000930724BFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj-kk=gwG0G2tbzW1V4ZzZy2CV5NfRRgHXzcbSkoi5hWVA@mail.gmail.com>
 <aJ8Dmd5RBIT1vKgs@nuoska>
In-Reply-To: <aJ8Dmd5RBIT1vKgs@nuoska>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8702:EE_|DM3PPFB0F355549:EE_
x-ms-office365-filtering-correlation-id: 587365e1-7559-4c04-f622-08dddbeba12f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4053099003|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DEaNZiXwRjQjr3nRmitjdoCD/1lyaaUfWHO0wKEX+mFryHoztgClxMZmwcx2?=
 =?us-ascii?Q?nRNLQxVtgD+pGgSC94Cbc2jNZeaWoBovrDoRtTAdrQBceXO5ePLQP6Zi6X+R?=
 =?us-ascii?Q?PRs8LEYsis1ydhlmy7uOLCJMej0K00qGkcUto+xb0St583osZBK578WuKDm+?=
 =?us-ascii?Q?NE4b5tmpE/9Vi3NyttKVotIXABxgaNJib0xZszrSi6qAhHEZ29X5RmQGoZW+?=
 =?us-ascii?Q?5a4NSDmUAJohAyVtU9BuzBIBskra8gQsUejRkCzR9Rg9uMCIChHX+QdZsyaf?=
 =?us-ascii?Q?8jKyrLTQloJKQcsnibjLE87BtsQir/OJY8sdFNFF62zSjcVRDqi3DvErX3NI?=
 =?us-ascii?Q?x0XXQA0FQDqPzdzrEmZwM/5prMvaugYGUg+bE6qsX6LYNBIpQuqdiHIII1cL?=
 =?us-ascii?Q?9JIHSRtOQ8oRiCLDBDbnMSkWprewy9ImARhHd3JXoXvnNu3rjqJEDvQrOoJp?=
 =?us-ascii?Q?0EWmFj1umO0xbQooTRAMdaUFbgBct5v7N8mPH8ibDUw0uuWoLOkMjHDOluEV?=
 =?us-ascii?Q?RVpFK7ZTNuVNTv9i90ybPgSEpcI6misb4Y2SfDs+ttmBZ6Ncdcoyj5hjQjp4?=
 =?us-ascii?Q?UT8ItH5hjVmgUK6MvNqQFTS9ICLDZ5toc2o6KS4/zz8806sPIlP7CzzGFz+X?=
 =?us-ascii?Q?/PRklMK4UCwKiUB4i+/N4V1kY14rL4LiL/kHlELqg/PKdLFcqtxPFkousSMK?=
 =?us-ascii?Q?EZ2YvSdIrUSHqKnjBlAR5oO/bfrKVWxWjBGbQRbm1RuLnVQM10ymp4UgYdQJ?=
 =?us-ascii?Q?RhLUq+oAvE08FLS+D5wP3pR9O8WDYDprji24ikmWnitfYqjNmMXsBTiyc57+?=
 =?us-ascii?Q?abmFnQmAkr6E8IfsUelcIOeYB3uUiFAFU9Bvq1523D+roB4UIWS9JQuaBtmV?=
 =?us-ascii?Q?3aZnafBiXxfj9ILl5oKbbWTGhbHnUIXREpTKoNVeubOeCwvAir0LafovZs48?=
 =?us-ascii?Q?n7Sr0HzK0qb76NZaf9YALHTBTY3blLIZ0SUv04Xy2oPPwUyPsJGfBBxArH48?=
 =?us-ascii?Q?0oChk5ESbcBllkZ8HURdZs9D+Ps782wLRb/ncuigJRflYwOYWxXHQCcUybP5?=
 =?us-ascii?Q?wTJUOq3Wk7xM+oIF9d4pbqeatNwQ6qC7pZ/etY7b6aoHvznkssbKR+6r3U30?=
 =?us-ascii?Q?eqn1cw0rkqmNdRZLO7qyIPZsS8+swVIQ88TqgQDFkitce0CdnysPgrIsxkkd?=
 =?us-ascii?Q?iJt45UCGHI4C89ALkJPHTWP4lTkbGIaWol0kgrXJAr53ckoCrV2VhdOGR/3H?=
 =?us-ascii?Q?ChkORYkeWPxU/iiIPmxE+UQmyxBbk5kgD1Ks+G5gMb7MAOuSUAIxn5MCiOYg?=
 =?us-ascii?Q?tBTjT5129ynVM8x343RmhCvMxLePFbEka7ZimBjQSZwU3o0/yJCOfatYI3Sw?=
 =?us-ascii?Q?/0xxh7AtIUL8bJYCU+GboSZsBR/WohLGkNad/Wc/yPROvjTWppbT3PdTOiDo?=
 =?us-ascii?Q?7w8yNAtHjso=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8702.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4053099003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V1BiFpPdpHEEL9wiA912O7zn5TeRvLymApzrUGhCYNt1joRVIw/N5EZmxVML?=
 =?us-ascii?Q?noqMnre1VwrfeO95sgdLhNtgFYy+phl4tlBBxto1rU/US2F2aTzqO7A6lnjL?=
 =?us-ascii?Q?7l0LzwkWDBEvbU6ORpQDcP05Enngd+ky8eSYrVnddw0alPvRT6qPF4cWrCVD?=
 =?us-ascii?Q?jWfKYhBsghV3a1XH6y0yUzZJ4ZD1NdXjrKxarjN1fHVJyqS7/rn7h1OrvEla?=
 =?us-ascii?Q?nKttvPi9aClyRxu12331fliJD8VBt/2Y9DKoyVTTzjvdEzRoN6tlvJU51jqA?=
 =?us-ascii?Q?UTHBDwfy2jkxstqwg28hdh1HQIBWFZJyYnRjea8/CYrz2QP8UseT4pSdVx0V?=
 =?us-ascii?Q?tflmD2mcrh7LhvBvY+UJeLVGG+v8yCaGxC7R1vELumzHhwd6CtGeaFwvVfKb?=
 =?us-ascii?Q?bG9/y4oClL9HHr6jltkH2NLdtLUgnz+OSOuMZIXFnyA3UY6Ca3a7yv+gU2fh?=
 =?us-ascii?Q?4AqMGAZDFtyWX+m6Fy65fphdlUqECY6JYn6OqwHQ1WYe/yLHZnEFRFhyFV5E?=
 =?us-ascii?Q?lpMtKp49YYqq8HFXo5h2ddJ0ilf/XcoPeVvMoZA9PCw1WmcYzSDcW0WjVHt+?=
 =?us-ascii?Q?MRecN+eyB/4sWOUgiMVlxsgLpjxMuBmSrby/t2zWMkhRgjk7GE4mAF2xuC5X?=
 =?us-ascii?Q?dIkB+D6OoDeYryVPw7JDk+gowiajb2hWR/p1qO2NSDvxrM6bLQ2gMVhzi+Nr?=
 =?us-ascii?Q?x/1fGjbxQ8eemnXoEMzAPh9VDFvwAYHTrjdB55HudhJ+Kq+mUN15+LwA72S9?=
 =?us-ascii?Q?sKl+lWoZvgIuoJQ+OlMSRDAemPA6FhTdYQV8AwpGAzQ3DuJhnqwCi71FT01j?=
 =?us-ascii?Q?35KbFQ/JkB/2thed1HHD3CgYXrJfQwGc7X5bYQpCbzW48cOu4VSfDvKGT6S7?=
 =?us-ascii?Q?H0I52/5MZno9m2Kie9SE8X88W+hQVfxpt6VDgnqlrk9T5JdgD1qPqYOUD0I2?=
 =?us-ascii?Q?brFX4HZTBZwsrRzSiTqqQ7yXJ1gHEHCfnvlSBNwtnqDcvenET4Np0pKKnLJe?=
 =?us-ascii?Q?EoIxzd/9KqEOASIG6DPRBvQsinyClSqaPUtRrvqMNWW5+M+Q2CJ38GAfNioU?=
 =?us-ascii?Q?FtNl1V3LEdWCoItoCQvIzFpx86s2uL1FwwSKb/l0Oes/zY8ICuT/nBfy8E2F?=
 =?us-ascii?Q?fk3lIWl4UIQ/bogQDr0qowZ2e+sJqqEazodWsuPll7KZ4mlYWvitE85v4Pqj?=
 =?us-ascii?Q?m5SrYumNrlcPHk3qr397lDlpgaoeEep4ExbQRH2kL7yF1i2hQ3DPcduBBrCY?=
 =?us-ascii?Q?2WmGVQjYG0O6cdHgqTUSUNJx/A4o5iNf4xF3sZrDhvLUZTZsxLhPfUrfLmue?=
 =?us-ascii?Q?1d7L9HIKHsj6/U5Y4LplIIJwUPKPjO4UJkLY/3ZiYVKrJafZlbyOzTgAu9QS?=
 =?us-ascii?Q?y4gLUORatPgfRH/rhF8G5toYDiMarGqDsqJkyfN8EgY4FiEMrUk7wihwY3B8?=
 =?us-ascii?Q?4uC4uXyXCgsv3xaYpq6QNE05n7Gv3wD5M38UMiOrAosDZ+PSFw2WCvgD7o1O?=
 =?us-ascii?Q?Gj1AcCIMbd9KWprFtG+l0PDIt3+l96S80ou/abtlC+PBXk9/ms4ZSY2FuPXs?=
 =?us-ascii?Q?blolqGfp8oelTDTHLibCYipVPQEziiscvDe7e2xf?=
Content-Type: multipart/mixed;
	boundary="_002_CH3PR11MB8702E0C49B62D28F6895DE97D734ACH3PR11MB8702namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8702.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587365e1-7559-4c04-f622-08dddbeba12f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 11:05:22.4279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9eiELiDn/J9fulVi2QsFl3ZAdUHOIp/ut1jt5KkNmOmdteC9icrnN2407YzZAJmLotI7Z69mEt6e1nKAiQccow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB0F355549
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 11:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118975

--_002_CH3PR11MB8702E0C49B62D28F6895DE97D734ACH3PR11MB8702namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi folks I resubmitted a new patch , just realized that will be better inst=
ead of trying to reply the same thread, again  I apologize for unintentiona=
lly "spamming"
I try the best to contribute, upstream fix and contribution is not the best=
 of my knowledge, I will try improve at my end=20

KJ

-----Original Message-----
From: Mikko Rapeli <mikko.rapeli@linaro.org>=20
Sent: Friday, August 15, 2025 5:53 PM
To: alex.kanavin@gmail.com
Cc: Marko, Peter <Peter.Marko@siemens.com>; Lau, Karn Jye <karn.jye.lau@int=
el.com>; openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetc=
her conflict by using SRC_URI.

Hi,

On Fri, Aug 15, 2025 at 11:39:25AM +0200, Alexander Kanavin via lists.opene=
mbedded.org wrote:
> On Fri, 15 Aug 2025 at 11:36, Marko, Peter <Peter.Marko@siemens.com> wrot=
e:
> > This was moved from scathgap-next to scarthgap yesterday, so timing=20
> > is clear
> > https://lists.openembedded.org/g/openembedded-devel/message/118942
> >
> > The successful autobuilder runs are a mystery.
> > Maybe the code throws only if the sources are not in downloads (e.g. au=
tobuilder has these from master).
>=20
> The more worrying scenario is that there was no actual build at any=20
> point before this landed, I hope that is not the case.
>=20
> I don't object to the fixes, just want to find out where the quality=20
> gating process failed.

FWIW, most users of mbedtls in the Arm firmware land embed the git repo or =
sources directly and don't use this recipe. This is problematic for SBOM, C=
VE security handling etc but this how things are currently. Users are u-boo=
t, trusted-firmware-a, trusted-firmware-m, OP-TEE etc. Thus this recipe may=
 have very few users even when mbedtls is used in a lot of places.

Cheers,

-Mikko

--_002_CH3PR11MB8702E0C49B62D28F6895DE97D734ACH3PR11MB8702namp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Fri, 15 Aug 2025 11:05:19 GMT";
	modification-date="Fri, 15 Aug 2025 11:05:21 GMT"

Received: from CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15)
 by CH3PR11MB8702.namprd11.prod.outlook.com with HTTPS; Fri, 15 Aug 2025
 11:01:43 +0000
Received: from CH0PR04CA0071.namprd04.prod.outlook.com (2603:10b6:610:74::16)
 by CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 11:01:41 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::b9) by CH0PR04CA0071.outlook.office365.com
 (2603:10b6:610:74::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 11:01:41 +0000
Received: from edgegateway.intel.com (134.134.137.112) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 11:01:41 +0000
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 edgegateway.intel.com (10.7.248.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 04:01:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 04:01:37 -0700
Received: from orviesa002.jf.intel.com (10.64.159.142) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 04:01:37 -0700
Received: from orvoesa107.jf.intel.com ([10.18.183.147])
  by orviesa002-1.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 04:01:37 -0700
Received: from mail02.groups.io ([66.175.222.108])
  by mgamail.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 04:01:36 -0700
From: "Lau, Karn Jye via lists.openembedded.org"
	<karn.jye.lau=intel.com@lists.openembedded.org>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking][scarthgap][PATCH] mbedtls: drop tag parameter
 from SRC_URI.
Thread-Topic: [oe] [meta-networking][scarthgap][PATCH] mbedtls: drop tag
 parameter from SRC_URI.
Thread-Index: AQHcDdP8IbLf7C1DY06nndHDboXCUw==
Sender: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Aug 2025 10:58:44 +0000
Message-ID: <185BEBC11AD53B51.30607@lists.openembedded.org>
List-Help: <mailto:openembedded-devel+help@lists.openembedded.org>
List-Subscribe: <mailto:openembedded-devel+subscribe@lists.openembedded.org>
List-Unsubscribe: <https://lists.openembedded.org/g/openembedded-devel/leave/11253397/6860922/1739532088/plugh>
Reply-To: "Lau, Karn Jye" <karn.jye.lau@intel.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthSource: ORSMSX903.amr.corp.intel.com
X-MS-Exchange-Organization-ComplianceLabelId: 12ee4da9-25d2-4141-a122-b55133cf49dd
X-MS-Has-Attach: yes
X-Auto-Response-Suppress: All
X-MS-Exchange-Organization-Network-Message-Id: af32a817-a818-4606-289d-08dddbeb1d4a
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
x-ms-exchange-organization-originalclientipaddress: 10.64.159.142
x-ms-exchange-organization-originalserveripaddress: 10.167.17.4
received-spf: Pass (mgamail.intel.com: domain of  postmaster@mail02.groups.io
 designates 66.175.222.108 as  permitted sender) identity=helo;
 client-ip=66.175.222.108;  receiver=mgamail.intel.com;
  envelope-from="bounce+67613+118974+6860922+11253397@lists.openembedded.org";
  x-sender="postmaster@mail02.groups.io";  x-conformance=sidf_compatible;
 x-record-type="v=spf1";  x-record-text="v=spf1 ip4:66.175.222.12
 ip4:66.175.222.108  ip4:45.79.227.220 ip4:45.79.224.9 ip4:45.79.224.7
  ip4:192.53.124.123 ip4:173.255.243.56 ip4:192.53.124.254
  include:mail.zendesk.com include:smtp.zendesk.com ~all"
x-ms-publictraffictype: Email
authentication-results: spf=softfail (sender IP is 134.134.137.112)
 smtp.mailfrom=lists.openembedded.org; dkim=fail (body hash did not verify)
 header.d=lists.openembedded.org;dmarc=fail action=none
 header.from=lists.openembedded.org;
x-forefront-antispam-report: CIP:134.134.137.112;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgegateway.intel.com;PTR:edgegateway.intel.com;CAT:NONE;SFS:(13230040)(4022899009)(82310400026)(7053199007)(4053099003);DIR:INB;
x-ms-office365-filtering-correlation-id: af32a817-a818-4606-289d-08dddbeb1d4a
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|82310400026|7053199007|4053099003;
x-ms-traffictypediagnostic: DS3PEPF000099D3:EE_|CY8PR11MB7315:EE_|CH3PR11MB8702:EE_
x-ms-exchange-crosstenant-originalarrivaltime: 15 Aug 2025 11:01:41.0341 (UTC)
x-ms-exchange-crosstenant-network-message-id: af32a817-a818-4606-289d-08dddbeb1d4a
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-fromentityheader: HybridOnPrem
x-ms-exchange-transport-crosstenantheadersstamped: CY8PR11MB7315
x-ms-exchange-transport-endtoendlatency: 00:00:02.6166920
x-ms-exchange-processed-by-bccfoldering: 15.20.9031.000
x-ms-exchange-crosstenant-authas: Anonymous
x-ms-exchange-crosstenant-authsource: ORSMSX903.amr.corp.intel.com
Resent-From: <karn.jye.lau@intel.com>
x-organizationheaderspreserved: ORSMSX903.amr.corp.intel.com
x-eopattributedmessage: 0
x-crosspremisesheaderspromoted: DS3PEPF000099D3.namprd04.prod.outlook.com
x-crosspremisesheadersfiltered: DS3PEPF000099D3.namprd04.prod.outlook.com
x-originatororg: intel.onmicrosoft.com
x-ms-exchange-crosstenant-originalattributedtenantconnectingip: TenantId=46c98d88-e344-4ed4-8496-4ed7712e255d;Ip=[134.134.137.112];Helo=[edgegateway.intel.com]
x-ironport-av: E=Sophos;i="6.17,290,1747724400";    d="scan'208";a="166627310"
x-extloop1: 1
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(910005)(944506478)(944626604)(4710137)(4713098)(4999163)(920097)(930097)(140003);
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uYy/qMqgjrQgP3Qo2hlI5XuIkwf7KGPcB+Xf+IZwDBTEYRYm/8Dt5v6rwL?=
 =?iso-8859-1?Q?k7l5epdhMGq6ulCbveqK1phUzWJse7qkU6LIqq6uNbM02jcGKARmCooz/K?=
 =?iso-8859-1?Q?4qJJqeUY7eDdyVzFTUFwfVowfLpvQ19xTc+k6DljtkAQiUY4IcKR6dmmeP?=
 =?iso-8859-1?Q?qAJBXjuAdqcBWDmCl2PfwgPMNMAyfsWwRymI3tj6mBBh5FkDXn1e5U/axf?=
 =?iso-8859-1?Q?n2z4+dFZeniDLGy8Gp12uZQ3zkprJWEfLZdbVNmlru07SOJtkfgtS5wLqL?=
 =?iso-8859-1?Q?jQma1mjuYNrby0LAxM1AmU1l36yNZKrGHeX1rycgeIrH1+LERRkinJrbRk?=
 =?iso-8859-1?Q?jr8V9aPGzbNsD6uApbk2xWTJaSpx0wi7O42fTeDDa4wY3uy8iEW6RvFksV?=
 =?iso-8859-1?Q?0Osv2OJmoxDb+H0watu9wn6PKcW7zaKCS6nH4G6Fe8wtbTZX8kdbe/CgT5?=
 =?iso-8859-1?Q?YhNKWgbhAgfMjC9yjbSbrM4oIOgYeCeYYFo93AavatYygWdDmHAQgqFfgC?=
 =?iso-8859-1?Q?euDJwxa24Au1Kq5+V38WyHtS5krtyrcBoFCdPlsksz27KKuz2E8XRnyEu7?=
 =?iso-8859-1?Q?106XzqM1EWtArpcFFSJX33S3K2+J7x2NkZJwUHLeEVOek18+upMRuPs1Gn?=
 =?iso-8859-1?Q?rbIUL5NBqQ2t/uts6VvVf2i+joBTOugQAAg6UxbeuZbPBbX6Z+65ZrtgNv?=
 =?iso-8859-1?Q?08HbTKbwOFQ0L/47HKYNv2M3r53sn1vg3/xCmNerhQK2DlNFI4Q1OWZbI6?=
 =?iso-8859-1?Q?OPlH3/I2c92302CRRwr2jm763eKlAQE4L9D6pAVk4s1EvU2ml2zOhIgZ72?=
 =?iso-8859-1?Q?Zx9aefODn8b+71eR6TjuDdyOMvNBtYSOORh7uqILXCqsl0QZnw5cxNXWDc?=
 =?iso-8859-1?Q?/YFc/BOT6FmKfiBAAvB6NRjX5Bq0dTJMkClMycixL0GlJuuMP/vvQyL4/8?=
 =?iso-8859-1?Q?+BI2+um9IMk9Nyt8OU4FjN7WdKwJlyhfIDH6lcJi8fAFnJBBHw9L3NC/6P?=
 =?iso-8859-1?Q?LuhZjo4Eu0oAlUlGB/v5NF4T5vISzAntaaIkGQ03hEPHMMd4BfI3+8Qecz?=
 =?iso-8859-1?Q?F6m0EdonCBC/xS6VbD6d+1wSnB/0frAdIJnAzrr7q1lfZzqH3B67qUXomG?=
 =?iso-8859-1?Q?ZUdrP1Jn4pgig9hAdhy4iyHl0SvNMLDOgfaiQkUobb3pPRszIqgA/La4Cm?=
 =?iso-8859-1?Q?RKZ8Gk7YscGLZ5dkxgqqQtqbkgjLrEYu0zbWkBjZ8zmRKCAQtR3R18iJhj?=
 =?iso-8859-1?Q?nEu2hU913nrIURgSPtQjabYlWJOFbp9pi8c0AhctfAy1TxccUEUiuNAvse?=
 =?iso-8859-1?Q?cWAefs8iB2AvJoqpUEzaEQc+qkdQ2ZvypMlLMXPrkMN1+0+SDYdOFhKzz4?=
 =?iso-8859-1?Q?mDVn2nwJUN3rANVDBHcqBKVuL55R318Cdat3vWbgRNbnhvtT9qCmBj8qlq?=
 =?iso-8859-1?Q?MANzqh/oy3TwUqFeQYGh8K43nXe6Jzx9EysDwdA2x3wF0Uz+XERkeXrTNx?=
 =?iso-8859-1?Q?3T2g28p6QDw+Cy/psCHikpWhmUuhsbLgvm69RxwvXkxuAVKcbRV7aIO5a3?=
 =?iso-8859-1?Q?78xKNdU3VncBd5RbpzKc1q5gfUuPQnvFPN2MjqHbQXUUx/oN63t1icjdyf?=
 =?iso-8859-1?Q?O/fbGcuKwYgN11C+j1/dz1Ncz52W7F+wuoOhtexJP1lLHc3addWAMjDd5K?=
 =?iso-8859-1?Q?8DyPh9IIGouwH9WrSvvu/KxQAOkfVr14u2miiM6PoP8oKi9NePmMj8uTng?=
 =?iso-8859-1?Q?1A3gVElmsdmpoVnwZgmhw7uzBrc2nExHPb50MVdW3a4BZePw5HKotQKGsd?=
 =?iso-8859-1?Q?IH23Un/ZduRudFN9sH6TfPrereNOtoR/7vKQWDD0H1joBgkCvS4HYMeIPP?=
 =?iso-8859-1?Q?UVfnCB69fqQfoTUQgH9MAmo+zqYUSJlvErI3+WvvEKWgAlfrRdnxno/IxM?=
 =?iso-8859-1?Q?C3G+vYTI/kdHPqFn78ttnAoUReEiQ8ynNzQAJ4WOnBRSA9ozeNqUaolHSb?=
 =?iso-8859-1?Q?q2Qm674JmfLr2oQQCHQKo/Q5sp5j/AKIiIcTnuLPo/tNH+BcW8eXsXd4Dt?=
 =?iso-8859-1?Q?p8419QXX7uNksofg0zGHwUatNxHiwU5Gc/6XpZXO0dEAFfbwc2oVRGoCXw?=
 =?iso-8859-1?Q?MwZCzWzd5ECxMVuW7R6vzWsOLNW631gAJf5CrPlu6fp2TK9DEsgSTg/tt9?=
 =?iso-8859-1?Q?mj3iv545ldgn5DUKraiWtyupVDhGWCzAfAw3UbZfQPIbmnEEnLqJ3afdU8?=
 =?iso-8859-1?Q?l288dZcfIs0cOoYZ7t0QHOKC+VoCP1P5Wbf2VyACdPUct4YA0si7hicYIk?=
 =?iso-8859-1?Q?Tl2ItpN7qgabmV8iyVCFMKodOmsSfjQ/ks0P?=
Content-Type: multipart/mixed;
	boundary="_002_185BEBC11AD53B5130607listsopenembeddedorg_"
MIME-Version: 1.0

--_002_185BEBC11AD53B5130607listsopenembeddedorg_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: kjlau0112 <karn.jye.lau@intel.com>

Keep SRCREV and remove tag paramater to avoid
Fix Fetcher failure: Conflicting revisions error

Signed-off-by: kjlau0112 <karn.jye.lau@intel.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb =
b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
index 88b50a406..91adf6f5a 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a6c=
2f1ef1630d341e026d"
 SECTION =3D "libs"

 S =3D "${WORKDIR}/git"
-SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Dmbedtls-3.6;tag=3Dv${PV} \
+SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Dmbedtls-3.6;\
            file://run-ptest \
            "

--
2.34.1


--_002_185BEBC11AD53B5130607listsopenembeddedorg_
Content-Type: text/plain; name="ATT00001.txt"
Content-Description: ATT00001.txt
Content-Disposition: attachment; filename="ATT00001.txt"; size=433;
	creation-date="Fri, 15 Aug 2025 11:01:43 GMT";
	modification-date="Fri, 15 Aug 2025 11:05:20 GMT"
Content-ID: <47902BEDD5ADAE49A2F650428C797AAA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

DQotPS09LT0tPS09LT0tPS09LT0tPS09LQ0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdl
cyBzZW50IHRvIHRoaXMgZ3JvdXAuDQpWaWV3L1JlcGx5IE9ubGluZSAoIzExODk3NCk6IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzEx
ODk3NA0KTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQv
MTE0NzE1ODg3LzY4NjA5MjINCkdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YiBba2Fybi5qeWUubGF1QGludGVs
LmNvbV0NCi09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg==

--_002_185BEBC11AD53B5130607listsopenembeddedorg_--

--_002_CH3PR11MB8702E0C49B62D28F6895DE97D734ACH3PR11MB8702namp_--

