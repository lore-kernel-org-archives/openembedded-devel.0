Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445D9C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 04:05:16 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web10.39354.1743998711762608434
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 21:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=yV4NJNPO;
 spf=pass (domain: fujitsu.com, ip: 216.71.158.34, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1743998712; x=1775534712;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=W8QjcwbFZAMpMAYnxN/xPsqHPBwGVHcLHUwgkGTgIjE=;
  b=yV4NJNPObPX0S/+mfaCmzYtvPZoJf35c2e23YZuXCqAJ+uLUiNaCk74o
   mrl2gDBPAkUuPUSD/LCgsmxuU1NJqRnkhj9CUWqxe6aA6IdNHO90qCoQ+
   Jg5/cJ0pCoUxkfYNu3RElwsf2pBpNsnf20fip27HdK6mtGrrUAEcH32nV
   E+FGZAU9QeqymPvyodFInoXBW1mIhdK4NANNx0Ja+cyRrLKRnEI1iQYpd
   y5R2CpGWQD8haNdkBImMlcweOadDm4m00Rg+ImX0TQyMaQjtaqgKbCYwL
   O8Tcn9l1h2kax05pcvYDfBYZ4Rp8/v1JTRpGvnBCU8ecYBoYBHNZ2gRl7
   g==;
X-CSE-ConnectionGUID: aH2VSm4YQEWx7ZmvZZIPeg==
X-CSE-MsgGUID: tYGFT+6WTwqUdahp0+9rag==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="151898920"
X-IronPort-AV: E=Sophos;i="6.15,193,1739804400"; 
   d="scan'208";a="151898920"
Received: from mail-japaneastazlp17010005.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.5])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 13:05:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcqHNQ6PdQn9MPtBXOcJ+hOczrYhbY7UL3yt72uVoI8faglS+0Pa38S15CaNMg8cQ7vUE6iMXD8mrwFRMjoEPspsPOA4Yk9UyKVx6fD+s+UpJpFjX+xpx/XcWcxLQCkn9GO5fvcTLBnCt5n9V/Ht3ogsqg/SvM3ly64P/vzLrXAftv0nO5wwj39KKoPDyTQGQmtRzzBrxASABUDyMcqrit7HiEObLqhPXrzZP1zDQiyDtyK5lkymgUeguDQl9G1PdfLFpU7NxVY3XxQzN9kV6e7sJs1KSMonI7C0clzEd0kZ1BujnJclbM14obAyJ6wbWJJmcoLXyLmeika27rhQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8QjcwbFZAMpMAYnxN/xPsqHPBwGVHcLHUwgkGTgIjE=;
 b=PHcknLv0Kx02kPNsTCwzFpOMogwMiuOwhhv8j79IjpR8KABPU3ejoy3ni5ObskfyoH7s6F/CjonLAJaZrttaLwCK9vuSI6+vAvx6xpCxsZUWzblOzpR0b9kLrjmwoW9q1Vv2dPPiSMMbGJ6w0f0U1ilpVQAzySXcoCGb82DDt1gngXm90y5ZuAs/WLh0W3NclKJ8FXNtLE0JyKW2ii+G9UBV8MBZZGOHMntOqdfdsLUMlASl4KWAYcoFD5WdYx1pf2NwWNanIMvUyP+7umTyDDbuLF4aBFqPBRte+XgfxgvaWi+MVKTssdMYTPgtD87VnHlly2pUq53FmfkhVrTylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TY3PR01MB10029.jpnprd01.prod.outlook.com
 (2603:1096:400:1de::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 04:05:01 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 04:05:01 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [OE-core] [PATCH v3 1/2] python3-webcolors: upgrade 24.8.0
 -> 24.11.1
Thread-Topic: [oe] [OE-core] [PATCH v3 1/2] python3-webcolors: upgrade 24.8.0
 -> 24.11.1
Thread-Index: AQHbp2SQxN8YR1tpm0qwNF6cF6zyprOXlXdA
Date: Mon, 7 Apr 2025 04:05:01 +0000
Message-ID: 
 <TY3PR01MB110561C81EEE7A6C1CBDB72F2A0AA2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <1833E837E68A80B4.21691@lists.openembedded.org>
In-Reply-To: <1833E837E68A80B4.21691@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=ef299f2b-4fa2-4947-ab92-2f27d9dea037;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2025-04-07T04:04:20Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TY3PR01MB10029:EE_
x-ms-office365-filtering-correlation-id: e70b82f7-6370-4941-ace1-08dd75895ec3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?SmorK3UzRS83czk1ampmUEg5ZlB6RWkwSDIyc2RFSjVla1Mwd01LbTdROXJX?=
 =?gb2312?B?a0NYZTJhRkpLdVo5NU1PUjM5eHNSSCtyaEdxVVNJRHNtZTZZbTV4NWdIbDRS?=
 =?gb2312?B?dW1LVlduUURETVhrWUxzM2V6UDZrNlB3MjRMQjhrSnlzL3Y2WmxBR3VpeFNX?=
 =?gb2312?B?RXBZaklOYi9vcDVFMzdTN3ExV1NqS2lJdDRxQmppbXFaODFWSWNEWUVTWGJV?=
 =?gb2312?B?RUwwQThLOW1KQkoyeUJEMTMzalRPV2NOdmhhUGlMalk5emlNaWx3SDQ4TDdH?=
 =?gb2312?B?ZTFya1k2K1RSSmtxLytQNnJZZWsveHY5NmMyTlVsQkhSbWg2dllCWkZKSjBI?=
 =?gb2312?B?dUNMTHZwUmMyVnE0TGFsNGxZTCtVczlpazR6dkhYazM3R0tJYm0wSWVibHR6?=
 =?gb2312?B?TVRnUU14K09aSHhwOWlHTlpVYzVGZVZ6ZWI5NU9KQUxZUlBnTkIxMHE0N1VP?=
 =?gb2312?B?NkZFSmFubk1XNVNPQTNEL0svMnV2dGZ3YzQ0SDZHUHdaUHd2Vlp2V1k5UzhI?=
 =?gb2312?B?N1dtOWVZNDM0eS9kT2pHejhlVWJrUlRoNjlKeVRDZmVKUEtJNXA3NGhFc2Fu?=
 =?gb2312?B?VkozdHNYaVdrTmFMaFNBMHMrbGFPa2ZXbDNsazQrdFY3blBESmNZL3JhTitT?=
 =?gb2312?B?MC9HYXFCSHVSVjRDdFdYSDdlK1Z2UDVqUExiMVRsOUdQbWZaTWVSRW5scm5Y?=
 =?gb2312?B?K3pjeS9tcjl4UVVRdkFUTTdnTWNnRVNlMUMrSWNWWTRiK1BWcVlmREt6WXVR?=
 =?gb2312?B?MFRqTHZyMU81NDVrK2s4cDVySkVWVkR3SHZxeHZPM1VlUGp3SlNWVC9IdTJJ?=
 =?gb2312?B?UXMzNWJKUnlReHlrcis4Z1RnYW5IOFNqOHJTeXBDY1liMU1jTU94NHJwSVRP?=
 =?gb2312?B?YVBrR2RMOThNVmFnMUxlekE0b09yRHVRd1luaEl1Y3RhR0hiRG5rUTBJMGFs?=
 =?gb2312?B?b0FPcGJIamN3bkZaUFlUZWY1L1Z2T1NMbXErTmpYVzFzeEpKZlVpQVdRSm16?=
 =?gb2312?B?b2h2SVkybjFQdjFicjhxZzVzTVczekNHTkFqMVpHUlVUKzZyR3pnTm5Mb2Z3?=
 =?gb2312?B?amhDZHFxWm43V3lIbTdmODBDVmRPYTZ2dTFWU1N0eUcyaGd0K04yMUt6c3VO?=
 =?gb2312?B?dDJna1RaSVBWWHdqVUdpRFkxU0hFZ1BRYy9YOURIYWY4Z2FCVm14VXBYV01u?=
 =?gb2312?B?b0V5WlBWazdTK2V6OU9IVEZ2bmF4dGhLNzFCVGMxSkRxbVlQUjY1cUxaN09r?=
 =?gb2312?B?OUJEdnlvZVNYWUlPTjJrNXFZOEJzT2JBdStiVGJFcTErUlJoY3FJbTRYMzc4?=
 =?gb2312?B?Y0FSeW1heEdYNStNR29xSDhrS3J5ZHo0UGRqNUZtVmZjcE1vZndSK1cxT3dr?=
 =?gb2312?B?N3hqVkM4c29lWkVuQ05wOVgwczBWNlprZDk4eml3Q09jNDdiQ2k3K0xSSE80?=
 =?gb2312?B?NGtZOTBPbVBKY0pzam14bnQwTFl5b3I3TWhWWHQvbmZTdmRTSTJoLzZEZHpq?=
 =?gb2312?B?S3BLUWlsZG5PZEZwZVkwS1ZSWHAyRGpWREhUT3JxUEdiTFo0cnA2SEcyamF4?=
 =?gb2312?B?UWVzcU1rL0hFTUp1MG44YmNPQmNxSWFIYTBBaDhtbDB0YW5NQmJFMUd4VzJ6?=
 =?gb2312?B?TS9SMi96UC8zaHVkNS9ORGkxOGZzVmhPRDlDTEs0eHlYVXBaZUh4Z1Z0dGtj?=
 =?gb2312?B?ZTZuOVdzMTUyWGNlNHBsNi9aNmN1VUdwZEdrdXlqUzJQa2JqUk5Id3RWYUVF?=
 =?gb2312?B?UGY4cVlMeWJKbGJwVzRNRUpmbzUyMTliaXFlNXVMYkRzSDRQbTQwMVU0cE1P?=
 =?gb2312?B?bEdndklUSzUzRVp3QmFvNkF5UDF0TmVCdHBiODVEK3VFaVpwUk9PaCtzaXJu?=
 =?gb2312?B?ODFBK29tUjg4YldDVERjaHFQL3pWd1A5eVZ4RmRDZFc5WGt3VFZWMnVnZjRy?=
 =?gb2312?Q?Wwl58+gxzX0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?UDE2VjVSQ1RRNEVsdUVNQXJWRnlod0FPL3NtNHRlYUxTaTZWMHkwdHU3Ritq?=
 =?gb2312?B?TUNDMHNxRi84bThsVlJ1K1NCcEpldWhVcE45LzkvbFh1eksrMHk5VTRoaE8r?=
 =?gb2312?B?UFVtbmlPdEdsUFEwZ1dyV25zWlZaL1VRd1pDOGNHbU0vYi96SXNJQXZmRy82?=
 =?gb2312?B?NkdmbnlRTW92ZENPRWtDcXJlNE5PQ2YrTVFzTDBwZEg1TWRLa3pjWnp3V1Jr?=
 =?gb2312?B?OTh6UkFDMHhGZEdKUFlDM3BhazR6anlIUy9BOHM0blhyS05RRjNxcURIV05i?=
 =?gb2312?B?R2QwVm01RXpTb2pkTmNLSmc5KzY3VnhLTVdsVGtDRDFBUDJQc0o2U0lPWUI3?=
 =?gb2312?B?N3M5V1E0WmIvSlZQbFVGQ1Y5RFBaT2ZqRmFOOFhRdHl5S3djWVJNa2NWTXQz?=
 =?gb2312?B?cnZsNm56WGVydERvVG1XTWU0ZVNDeUtxQS83MURvOS9kS0V4ZFRHbXQzTkp3?=
 =?gb2312?B?aVJxNmlKSUZ4a1pVMDg2YXcvVWtaOXZsWllhb3RNd1NwNytMNzdKOEQ3Ynpx?=
 =?gb2312?B?VGRPQWZVRlgwMU1xazQ4cEhNTmE2Zk5NK1ErK0F5eFVmaFlhbzF6NStqamlG?=
 =?gb2312?B?QlhWY0I0M0pldUFMeTR0ajFOUXRrMzk5d2FQakFFeGdEVTF6QnlVdUt1Q2ha?=
 =?gb2312?B?UGQzZ25RTDl0MHFnUi9iNDlWR1pqcEVYc3QwOTVGaXdjV1lMM05CV011SGRn?=
 =?gb2312?B?ZEMvWStUQWFCL1lkT2N5RHRvaE4wb0NRRkpXYW9yaDU0OFdDZUVkRlU3WDJN?=
 =?gb2312?B?TzhpMTRkZ3VlQkkwbzRpdVdEQ2tHS3VSei9SamtwZkRnMVZPNVhBZ0diVjFr?=
 =?gb2312?B?RnFpem1INHEvOHJJSFYwS2lEaW8xanI2OVY2QmlsNWFSV2tmZzRBbUYvaWwv?=
 =?gb2312?B?MDNHRndnclh0cVFHaGZoaHp2dDNObnNGUmVlYTQxblREQ2ZFRmUyVlZRU0Rs?=
 =?gb2312?B?SlJwQ1d5ZkFEaHlCYXZWRGhHQ0lRVU1kc3ZkYWR1Z2RNMUJTY3Q0SG14SW9j?=
 =?gb2312?B?WkNqWkFQU29tUEM4NVNlMUgvSURMOWZpRGF2cnlUSFQ1K3o4YXJlWWpYS1Jw?=
 =?gb2312?B?YXBScytqYW4yWVVMUWlWczFiOWlSRmZwRE9KNmFSUXZDNW9BZ2xHeXY3elRF?=
 =?gb2312?B?NFlhUE1ia3NEQ3RXNEZHc2JOWEZ4NnZGNGhhNTc4SkZCVGVXbFg3MFZoRXdX?=
 =?gb2312?B?OGYvMUpTTCs1ci9aaUViVWtVSUtwY2RJaWY1VU1ZSUJKUzlMQm9pUHJHRlFw?=
 =?gb2312?B?aVl1U1RZTWdKcmw3MFRQdzNWWTUvc0NkcGYzaFU4WFFSZ3BZdm9mcXBHOG5P?=
 =?gb2312?B?RnlQRzlOaUJITmdCdy9mWWRRa3dqalZ1YXptMVlHWXp4T3RGVCt5Vld6MzI4?=
 =?gb2312?B?cjR1RDBYZStocDJEeTZ0VVptdkNJeGMxK0lVUmRmaU1EL1pDL0tLSDg0Q2hq?=
 =?gb2312?B?eURWa0RubUtEblBSRElxaVlmcVZMM1hmRlpEOWtFVTdBbHUvMU5NaFVDREpz?=
 =?gb2312?B?WkhDWXl1Nm5yaHY1a0FyVHpxOXYvYkNsdlM0ZnA0RjBnQ3A2SDM0UHlvS0dM?=
 =?gb2312?B?QXJId2pzQWFjbW9hcEk1cWVNTGl6NnJudTZhK2FoZTNVOXcxdXROaHBjMGtP?=
 =?gb2312?B?KzE3ZkUxYVYzTTlGUUc1SFpiTEZSZEgraDN4eW94M2NsMlZFcTNPWkU3cms5?=
 =?gb2312?B?QkpPZHc2K2t6dldqZzllbXU1VzdEeXdWTUtobGZiQ1ZmTjRkamsxWkJqTmZR?=
 =?gb2312?B?V2tORGhWS1NVRnN6RmpRemo0RUtJbHUxQW4wWDk1Wms5YmZzYzlZdDFlK3du?=
 =?gb2312?B?ZWpEMG1YR3I5UitlL3h6USsrdm5qZ1R3K3FUOTR5aVlkQjhWd2hWREQyM2dL?=
 =?gb2312?B?c1Z5OFJGeis0R0V1SE8yKzYrSFFia0NDSmM1R2lheFY4SGNDQUVadDZOUGk5?=
 =?gb2312?B?WDROWGk4STdzdlU2bGpldXdRdDhEbitZWjFTNHQ5dTlUTnhPTHAzZGNpQ2o1?=
 =?gb2312?B?djBXcmFBeGVYNXlqam9tR2RDZHA3TmtIcXJCVkM5OTRuT3BWY29PK2hqSmlG?=
 =?gb2312?B?SUxYNFExckJPcjA2MGdCcWp5RXZOWGtHRmJXa2xhSHZRaHdPSjRKY2prR0Rq?=
 =?gb2312?Q?4+1hSqYI6PMCdzocLra4t5v8c?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xcpTvHUMJERogRtiob6pDF1BKmyQyX3aio/5Y12CcBlogbmJnz+jCVYE0SE9/K37nf+ZO3Q8vTg1hTqgzWw4OR2AjwI2+GidDLo4uZ8mwNdC0wYqdnwmy1j3+tKhHi/mfI3hcvZoG0onwqGb9a2IgjITarEQ1zpvNBLIy09syFtUyFfCSfdQpjfHhcERuKIHju1v9F6PohpyUE1vVgAazjLmfo7hLEJ1TVseBHJPqoJ4WYQdkS7g4qVithRoviM8wviISJVu6rH6b8rbYi4OpuHMTrWrQZOjwz2QiMKUktIUnaCgw7qDCsCPy8sT/doF4F+brJ5iy/1XU6ENqRahUJIIHPF31PKfqs0lNl1Yo6ELoGU6lrxdbylmE6jeMvgxpoYqHDrIbs/oB9M3JExNb2DOnSd22jhzs3BA/7klKxS/hr/57+bItLRy7kzGKkT2NK5fLc2cXYCIg1P/7hoae0FuMrKPwhd3dHFkera+CnT0tYcvdMwIGtFGg4Umrczx16IPNGw8HmgE1JC7RnLz1l+fNcQ4fJDrDQn6x16aEzrY8wsPVx0D5IdBce4jPcVEib1MQEtVAlJmRuUDPE1Pci2sy+dL112ZoDIcrS7q+1khyMK7dn5squAES/Rw+N8K
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70b82f7-6370-4941-ace1-08dd75895ec3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 04:05:01.6695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: udOHT+i7gdYON0b0lkMKPked0s6M9IS/u/VgPpwtml1AVwP3DXmBlh/CLYVdWP//3y6qvAvT9WgnMAyXwwBYXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 04:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116616

U29ycnksIGlnbm9yZSB0aGlzIHBhdGNoc2V0LCB3aGljaCBzaG91bGQgYmUgc2VuZCB0byBvZS1j
b3JlDQoNCkkgaGF2ZSBjaGFuZ2VkIHRvIHNlbmQgdG8gb2UtY29yZQ0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
T24gQmVoYWxmIE9mIGxlaW1hb2h1aSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
ZW50OiBNb25kYXksIEFwcmlsIDcsIDIwMjUgMTA6MjYgQU0NCj4gVG86IE1hdGhpZXUgRHVib2lz
LUJyaWFuZCA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0KPiBDYzogUmljaGFy
ZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBLaGVtIFJhag0K
PiA8cmFqLmtoZW1AZ21haWwuY29tPjsgb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc7IExlaSwNCj4gTWFvaHVpL8DXIMOvu9sgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4N
Cj4gU3ViamVjdDogW29lXSBbT0UtY29yZV0gW1BBVENIIHYzIDEvMl0gcHl0aG9uMy13ZWJjb2xv
cnM6IHVwZ3JhZGUgMjQuOC4wIC0+DQo+IDI0LjExLjENCj4gDQo+IEZpeCB0aGUgaXNzdWUgdGhh
dDoNCj4gIHwgVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOg0KPiAgfCAgIEZpbGUN
Cj4gIi9tbnQvdGVzdC9idWlsZF9hdWgvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9weXRo
b24zLXdlYmNvbG9ycy8yNC4NCj4gMTEuMS9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYi9w
eXRoDQo+IG9uMy4xMy9zaXRlLXBhY2thZ2VzL3B5cHJvamVjdF9ob29rcy9faW1wbC5weSIsIGxp
bmUgNDAyLCBpbiBfY2FsbF9ob29rDQo+ICB8ICAgICByYWlzZSBCYWNrZW5kVW5hdmFpbGFibGUo
DQo+ICB8ICAgICAuLi48NCBsaW5lcz4uLi4NCj4gIHwgICAgICkNCj4gIHwgcHlwcm9qZWN0X2hv
b2tzLl9pbXBsLkJhY2tlbmRVbmF2YWlsYWJsZTogQ2Fubm90IGltcG9ydCAncGRtLmJhY2tlbmQn
DQo+IA0KPiBweXRob24zLXdlYmNvbG9ycyBoYXMgbWlncmF0ZWQgdG8gcGRtLWJhY2tlbmQgIHwg
ZGlmZiAtLWdpdA0KPiBhL3B5cHJvamVjdC50b21sIGIvcHlwcm9qZWN0LnRvbWwgIHwgaW5kZXgg
NmZjZWM3Ny4uOWYyZGZhOSAxMDA2NDQgIHwgLS0tDQo+IGEvcHlwcm9qZWN0LnRvbWwgIHwgKysr
IGIvcHlwcm9qZWN0LnRvbWwgIHwgQEAgLTEsNjUgKzEsMTEwIEBAICB8DQo+IFtidWlsZC1zeXN0
ZW1dICB8IC1yZXF1aXJlcyA9IFsic2V0dXB0b29scz49NjEuMCJdICB8IC1idWlsZC1iYWNrZW5k
ID0NCj4gInNldHVwdG9vbHMuYnVpbGRfbWV0YSINCj4gIHwgK3JlcXVpcmVzID0gWw0KPiAgfCAr
ICAgICJwZG0tYmFja2VuZCIsDQo+ICB8ICtdDQo+ICB8ICtidWlsZC1iYWNrZW5kID0gInBkbS5i
YWNrZW5kIg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0
c3UuY29tPg0KPiAtLS0NCj4gIC4uLm4zLXdlYmNvbG9yc18yNC44LjAuYmIgPT4gcHl0aG9uMy13
ZWJjb2xvcnNfMjQuMTEuMS5iYn0gfCA3ICsrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkgIHJlbmFtZQ0KPiBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3tweXRob24zLXdlYmNvbG9yc18yNC44LjAuYmIgPT4NCj4gcHl0aG9uMy13ZWJj
b2xvcnNfMjQuMTEuMS5iYn0gKDcwJSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI0LjguMC5iYg0KPiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEuMS5iYg0KPiBzaW1p
bGFyaXR5IGluZGV4IDcwJQ0KPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI0LjguMC5iYg0KPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNC4xMS4xLmJiDQo+IGluZGV4IGM1
ZWQ0YmQ3ZDMuLmNkYTYzZDJhMzUgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuOC4wLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEuMS5iYg0KPiBAQCAtMywx
MCArMywxNSBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3Qvd2ViY29sb3Jz
LyINCj4gIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIg0KPiAgTElDX0ZJTEVTX0NIS1NVTSA9DQo+
ICJmaWxlOi8vTElDRU5TRTttZDU9Y2JhZWJlYzQzYjdkMTk5YzdmZDhmNTQxMWIzYjA0NDgiDQo+
IA0KPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjA4YjA3YWYyODZhMDFiY2QzMGQ1ODNhN2Fj
YWRmNjI5NTgzZDFmNzliZmVmMjdkZDJjMmM1YzI2MzgxNzI3N2QNCj4gIg0KPiArU1JDX1VSSVtz
aGEyNTZzdW1dID0NCj4gImVjYjNkNzY4ZjMyMjAyYWY3NzA0NzdiOGI2NWYzMThmYTRmNTY2YzIy
OTQ4NjczYTk3N2IwMGQ1ODlkZDgwZg0KPiA2Ig0KPiANCj4gIGluaGVyaXQgcHlwaSBweXRob25f
c2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0LXB5dGhvbi1weXRlc3QNCj4gDQo+ICtERVBFTkRT
ICs9ICIgXA0KPiArICAgIHB5dGhvbjMtcGRtLW5hdGl2ZSBcDQo+ICsgICAgcHl0aG9uMy1wZG0t
YmFja2VuZC1uYXRpdmUgXA0KPiArIg0KPiArDQo+ICBSREVQRU5EUzoke1BOfTpjbGFzcy10YXJn
ZXQgPSAiXA0KPiAgICAgIHB5dGhvbjMtc3RyaW5nb2xkIFwNCj4gICINCj4gLS0NCj4gMi40My4w
DQoNCg==

