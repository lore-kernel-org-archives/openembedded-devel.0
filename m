Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89D8EFB819
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 08:49:38 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16116.1771922974196047087
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 00:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=PB7R6ybP;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.20, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHOq3fvp4srS+LcneytvI3pWL134N5F7rJ4ohzqg8CUdGmfZUdctWuP7PdXx/MHapxW07qJBtA7mA3UJ6ZC8qZavsP+iPfYjxH4rn+TLrtJaW/a6WV1eEELDJBl1pCzH/VRH5NtnViKFNjL5a3DT0BDLajFUY0N1mbw1DtpdCb4ayYLUQkUS/tmwF125SYpUfbgfGV3kZCsYZjzX1b1/e3YHuTpoJg3HDPWubzMQRvUY448Qwk6E9uFYNxnT9MWTAW/mLvj3+Pw1qlKAcxjWlgL5EYLGVcs5iR9hyjCiBgHvp7PNZX1jGHjaKYLVZZlNGJ9NMl9TdPM70kYt0wKiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNBPv3aXD0OOAdWBdHh7b3EX/LIagZSfdJKwGGwpFwA=;
 b=aKMytoOTHW1EbJn+Rn6LnMcGC//zCwOQzLQSjTyOIoA9I9IeXPfdQy10eyPzGDkwn0WP4o0jGR+qYbpfH1FOLl3qchR+bzSlbDiu9D8kdx8kWj5nf6+mzG24uk6xO4oblDGovmQgf/4jxadWcfaGa+QBZ9JagnyJfHRzA0bcugBut5/upNaNhPeDkgfnLvIdp/CrBUA4vknTFUG6CJaFPIEWM13bT/Vha/msRbrAvSZfHOWPWT36cSu6DtcwRh1qELwkxkmqMS5fcdElAVYfa1WNhfgCwUEtvjksQK+cia4JltE52Vr8uHT0UMme3Z3ng8yOkMUr6n+bw2tIcaIo3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNBPv3aXD0OOAdWBdHh7b3EX/LIagZSfdJKwGGwpFwA=;
 b=PB7R6ybPoJgBy6XEN3IQTDgBC+Q2T7G4LpL4/D5lhXnDTk3Npc2jSl/qvKyFPIJx/D4kgQj27+/U74N1encQo97ooUILMfyD2yfmGGPe2lsZFM1rVcJzzWNP+1pCbByBVJF2Fm/99SOP2W12ZE6OsZwBmPQOCSskkq+6Y9PA4BXBKs/dVsNECry9FWZ11x4bPZbg0aLXDCLC+uFPfq+N3TCGKeq39pV7pthepR2+jQ8xGp4VGXwu4yMSpB3HLVTjsUOArSVT+kXN3tshT9Vh1GQiJmKOyOiR+4VGI0MbPFuFWHBheInozSqNMUdZYhMzq1n9GkfajoTeCaIS8rwD0w==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by TYWPR01MB8363.jpnprd01.prod.outlook.com (2603:1096:400:160::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Tue, 24 Feb
 2026 08:49:30 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 08:49:30 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: reply: [oe][meta-oe][PATCH] tigervnc: Fix do_rootfs Error
Thread-Topic: reply: [oe][meta-oe][PATCH] tigervnc: Fix do_rootfs Error
Thread-Index: AQHcnrZBk8IdNwtO7069Lij3B+uHcbWRMzoW
Date: Tue, 24 Feb 2026 08:49:30 +0000
Message-ID: 
 <TY3PR01MB10110979EF0CC170FA92E1D319B74A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
References: <20260214013547.22916-1-liuyd.fnst@fujitsu.com>
 <e9706102-3c2d-4173-99ab-32116e0a49ce@gmail.com>
In-Reply-To: <e9706102-3c2d-4173-99ab-32116e0a49ce@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-02-24T08:49:29.468Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|TYWPR01MB8363:EE_
x-ms-office365-filtering-correlation-id: eee36e78-82d2-43c7-a204-08de73819fb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|8096899003|7053199007|13003099007|1580799027|38070700021;
x-microsoft-antispam-message-info: 
 =?gb2312?B?RGV2L29FSXhxTTZ2WnJ0WFNwQ3pWN2tzSUh1V3VCTmI2b2x1aGZUMHBaVzV2?=
 =?gb2312?B?NnZsTys0VC9MMzdsaytJYmhjU3VHUStCUGFYNWZmbzJrU1ZIcXRPM3lQMU1L?=
 =?gb2312?B?ZHEvR1I2L3pkZm9jaGI0UTFKNWlFY0Qyd1JNd1RjdnhsSFUrMjJ5VVcrekNz?=
 =?gb2312?B?ODlkZURoZzRFNWVoMnhtM0Npd3M0emhQYU9BeU1NZSszUzhwMjBnSzd3YWJX?=
 =?gb2312?B?eXNPNzRGckZ0WHNEZ0ZuWENqWjZFMEV1ZTNzWEtqZVlJOWhnN3o5aklnbFpx?=
 =?gb2312?B?NkEzZEpNTnJ0WFowT3JvNGw3ZzRPMTVYbkthZUpZZU9NbDc5R01iWTZueFFQ?=
 =?gb2312?B?THdzcDNuNFUzWUVRSFRBK1VYS09FNUhpaDgwVm9ITExjcFAxelN6TVVGbWdi?=
 =?gb2312?B?bDJnaUJjUmZLNHZNanlRbDAzcDZJY01jdHEzSmZHK0x2cStkdDNYcGxnTXJ4?=
 =?gb2312?B?ZUlEdXRqODIvZzVVVVc2R1JiRmhmNWlMWkxaQnd5S0F5WVBpVkxjZTFrOWdG?=
 =?gb2312?B?T1BxeUF4d2NNMFFISUJJZ2llOFUwUE4rSkU3dXdNdmJGcE1VL28zVmFVcTNN?=
 =?gb2312?B?RDRpeS9seTBzN3orbmZJemV4czFMV1FJNnFNRmpRUUFna0d1cXRxa3V3YW43?=
 =?gb2312?B?cDQwcjBSYXErQ2U4YTBBRDE5WncwOUZmYTY5VjRMWEVKcTl2QXBjbzdyOFBV?=
 =?gb2312?B?VTY4V1hLUG5qWWZISUp1RlRyZDArdjVhOTNPeGZVTko3U2wwYm1GbDZGUXFv?=
 =?gb2312?B?WEdBNloxNzRvZUZnaFZDMzhoTkc1cXZMeWZVQ3E5cmZMcEg1dnZaU3VqMVFF?=
 =?gb2312?B?dnZ1RDBmTmI2cU5yZFQ4V2RWTU0zQ3dxUFZDdmxsZlBEMnJkUWxhSUU3MXNn?=
 =?gb2312?B?TnNnVkZiWTRpQkZMQUY2aWtnNm9GQXpJM0NyUjF5b0x1c2VXZHpCM2kyekcv?=
 =?gb2312?B?QUhLTm1OOFhyYk9neWR3Mnd6TXdmQ0VnWFprYWUwSGJRbmpURi9JcStPL0Vl?=
 =?gb2312?B?TFZBYWI4VE1FZWx6NzlKem5GcHQ4eE0yWGNTVU4yR3JaSEJpSlIxcmlaQmY2?=
 =?gb2312?B?cS9obGZNR0krVUkzZSs2MEg1SG9xRUFuNXByRGIwVFlRM096WnpLRnNMcTZU?=
 =?gb2312?B?N1lJUU9UV1hRQkdvVU4xcnF4OVZnM2d1R1Vlc085UlRQZnNRUk1NN1ArT2hp?=
 =?gb2312?B?b2FEVmN1dnNCWS9wUjZlbE0zLzN6WC9ucElnb1pzSC81OEFDYWV3a0IrdFF5?=
 =?gb2312?B?azNONG43S3p5OGdXQUJoeURPS2JmNDNMclBLcVhLSGE1Y1NXOSttOHJ4QURY?=
 =?gb2312?B?WmVBWUducU9LWlRXN0FMNUVrYU51RzZNc3RiZnZDYzVOZ3BUaG5CZElsT25H?=
 =?gb2312?B?TmZhUnM5anZ5T0Z5Tnhxa1czN2RZMVpTZUlHbEVnYTVxN01JcVFoS29QeU1S?=
 =?gb2312?B?WEYvRXlQcUlwa2FUNy80bGMySXdvazBrbXJaTFBaRHNHaUpZcFIxck1jR2JU?=
 =?gb2312?B?a3o4OEcyTUpvL0ozV3JiK1FySStWc2xlMm5BMDA1Mkh3dWIvMUlOVmJpalNj?=
 =?gb2312?B?cVp3Y2l5cUdCcTh0UE54VWRjeTh5M0Nvc0JvNVU5RXRTUFB4T2MzMVBpaTdQ?=
 =?gb2312?B?Q0FTVS8vM0plNjdGaTd0QzRPa2FZdG9ZRU1UM2NzeFhVMVVCbWY1WWM2bHpC?=
 =?gb2312?B?cXF1U2p0S0dML203ZFppZE4wSlVJT1NNbm1zNlZRdmMwZnlPUGxBYW5sWG9K?=
 =?gb2312?B?amZIVlZCelFSenQ4S2JiRjRqRVEyOWFEeEwxWlFlNk5qb3BaeXJQQ0RUY0Z0?=
 =?gb2312?B?dlk0MVd1VDNnZVVRSDd0aTBGVE9wYTdEZGNLdVh5cDA3M2ZmT2l6czhtWktX?=
 =?gb2312?B?ZGFnbjlnYTZnRzdPMlQ1YTE2eFZOTk9zWm1JYmYvZVFScUQzNlExMzNMekF4?=
 =?gb2312?B?R2FnZFRiVGFoMmZIQTdOYnhUR2JpRDR5OUZhemlkQ1U1dDRDNjhKU2ZlTEgw?=
 =?gb2312?B?dmt3bitHZSttWGVRZ0hvdnpONWxFZ3htSjFGRmZuaDN0UWI3c2taeWhleWxa?=
 =?gb2312?B?OVBoYVYrWW5UUDd2OXJhU2tnYWJ0Nk56OEwrRjgrNWNnWVhkaXRGVmFMaHFZ?=
 =?gb2312?B?UVRpa21uK0lGU21JNnE4NTBYS3R2VVpnVytxYVhOWUdBd3ZUR0orcXFXZnB6?=
 =?gb2312?B?MVE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(8096899003)(7053199007)(13003099007)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?TnNrSXV2eWJSL2MveEZBSW1mTWRIYm9jdnBiUHRiVGN0MXUzcFVzb3YwTGZa?=
 =?gb2312?B?S0hUeEdzTzJaeXBMZWZIbzZ0NlhQL1NzeGw0SVJnSFdrc3ArNkZWYnpnVDI5?=
 =?gb2312?B?aGFCMnQ5WGNyOHZFajM1WjBSeEVsanpKNnlrdlBHOVI4b2NsNWFsSzc1Tkxs?=
 =?gb2312?B?NFQyWVNRMlExbmxvWnRFVEZ6MStsNUgrcDE2NGJQeDRxMGpCLzB5NDZZeUxY?=
 =?gb2312?B?b0lqQjlYaGZXelBEQkR5aHFyaVA1QWZUNCtxeUNKUE9RSWN5ekJhTHJzZTlL?=
 =?gb2312?B?WURGa3lDc1FBRGNIZ3MvUUxlRTJIU09haUxVNW9aS1dwWkhDRlBRYWFqWmQw?=
 =?gb2312?B?MlgzRWdTTFdNdzJkRHVUaFZDUFBmSUtpMzFwV08xR0xLM1F5cFM4NGJWUFIr?=
 =?gb2312?B?SE9WdGpZNCs5UzhrRDdWMU8zbHNreVNST1NyS2xaT1JjRGVvenRMandPOXZ2?=
 =?gb2312?B?WjhaV1VKRkZSOUx3bFdLRWsxTWZ0WmVzeGNxUTZ1OVlkWVJFbXRYMzJadExM?=
 =?gb2312?B?Rmp2K1VTRjlmZTQ5MFRDNXdZOEhpZUxXdEhyTE5qeGpGV2owM0grNVlJQmps?=
 =?gb2312?B?b3ErTGFWSlQ5dWtqdFBlVWhBRGdMY01WeHB2bDBsY1Y1OWsrcWlOemRBNE8y?=
 =?gb2312?B?bVdyTnNoOENWak10NFA1QVpqYW1BdzNvTnlCcnE3MnlWSFdLTFZLdXY5VWxD?=
 =?gb2312?B?cWhJM0ZMTXJqU3NaOC9MSENEUHRnTmU1dm5ZRDFuWkxiVzF4cmZqMTlJM2di?=
 =?gb2312?B?TDdERUVkVGlrYmpVL3N2eE9qOFlFZTNxeGVjelJIWURHOVRjVjFwOVQ3Ynl1?=
 =?gb2312?B?T1JEMVFoY3M3UHlaaDR0NXdURDh1dHZNc0Q4M0JTV3JTNU9wSWFNZ2k3TUFu?=
 =?gb2312?B?c2hMT0JQRklPWThpTFMrNHkxK3VuQUVlbVJZZ1FkSGxHOGZHcXIxbWlGcTRx?=
 =?gb2312?B?NlJLdkt0ZkltWW9yeE5NVEw1OGF0T0JuTC9WeWRxN05TclZVcUJZcE5LSi9s?=
 =?gb2312?B?bGVwaEJKRnI5VWpPUlMxanppanh2aE0vUTNhQ0R0bVlBckx1R3pBbDArNk5i?=
 =?gb2312?B?YVc4S0Roajd1OGNabzlXcU9GN2VWRDB5b0ZIU3ZCaWk2WTJqTTZZWm02TWQ2?=
 =?gb2312?B?R1gxTDhqVzIyZlhzNlFjcXpaYmhNT2duVTRsZFh6ZEhkd2ZDODUvZHA0VjNI?=
 =?gb2312?B?UXFIeVNrM09TVitkOVpIc3lUUEJjZ01FMWpDMzZlek1ra3BmNkdndVhUVG1W?=
 =?gb2312?B?dEtUeCtZUTFtejZXQVlJaEQ5UXpndkdFZjNNeVpEZXhBWXF4WmFQUFUrbk9N?=
 =?gb2312?B?cVhidjNvY3BVZHNjYkdwYW11am5GN0JuRVBvVDJhU09rRjJuUUFDVThCeVk1?=
 =?gb2312?B?aDVMT2RXWG04WXlsbFV4eXVWam5HdmxLRmwwcERNUG9DS3JlYllCOVVRWDlu?=
 =?gb2312?B?MFRPbm9rRXUycnRpSCtPZDZyNms4MGJWS09RL29RR05PMGg5dkNvc2lpV21j?=
 =?gb2312?B?YjI3YStCR2kranJvRmt3R2Z5MmtBODZKdVBNdnVwWXpOSGhIUXZaallhZDVB?=
 =?gb2312?B?UVZPWEFHbW5nMjdjZlkvY2x5SC82M2oybnRCcldkYkpDb1A1MThvVnFpUElh?=
 =?gb2312?B?WHhpSm5ZUEhpdkFxbC9MR0lNVC9ENXpKb2pIRE1pWkhQYnA0STNUQzByR2RC?=
 =?gb2312?B?WjVRNTJDRGtwZTRoR1VpUm5tbUpqVXZFVTR1MEZSaTdqbFpWVW42L0pqdW5M?=
 =?gb2312?B?aW9Ba1VNblhOTHpVUjVUVUt6NnNnbjdKQlRKZjNkQmd6MTU5MWNxMVFVd1F6?=
 =?gb2312?B?cSs1U0NjbXZ5RDgySVpPNWRGU0F5QSs2Z3A0a1I4QTZMazEyQ3p2OXhxcnNX?=
 =?gb2312?B?Y3FlKzhFelF4cnhSUkJlaDArSW5xNXZxVjRWQ0FzWHNVUWwrdUFlbEVJN2tx?=
 =?gb2312?B?eDFQSmlyV1lxUDZoVU5wODlVOHhEWktqVlRKc2lJTTVUUEFYd2grZGxZUHp5?=
 =?gb2312?B?YXVnOERsSFpmTGRhdFNPRU9TWFJyUVZQZUoyUDhUZGhUWXR0TEZGckptdkR6?=
 =?gb2312?B?Qk5IMUNWczRkSnluS3V2bHhiNnI0RXlselppWXFoSlEvTG1uOFk3bHlWUHNk?=
 =?gb2312?B?aUlycUpsN0RHZFVVN2NjRkRYb29DVXpHWkNtbDU4eFpUZG9nbHBKZVB1NEtj?=
 =?gb2312?B?eWZWOGNWNThZaG5tOWZRSHBvVnRXQTNhMlR3YWpJdFpIN3Nob1FjcW9mejh3?=
 =?gb2312?B?bkF5cXN1ZE53ZktsOXFiVjM1L0tRcGNjY0RLUHlsN0VXY1R5dEJEd2V4VExF?=
 =?gb2312?B?QzFibytLVUUyc2JGVEk3dUxqWWxZbC9qT1ZYOVBiS2tleWlNUmNNQT09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB10110979EF0CC170FA92E1D319B74ATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee36e78-82d2-43c7-a204-08de73819fb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 08:49:30.0181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8nb+arqk184mUccFJtmXcAfFcidc6P5bBXvfXUfFYdWGozWpn9QfK3JZ4/MVrpvxWjGdUmwKgET6j754S23v7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8363
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 08:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124573

--_000_TY3PR01MB10110979EF0CC170FA92E1D319B74ATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgR3lvcmd5DQoNCiAgICBJICB1c2UgZm9sbG93aW5nIHNldHRpbmcgdG8gcmVwcm9kdWNlIHRo
aXMgZXJyb3IuDQpJTklUX01BTkFHRVI6Zm9yY2V2YXJpYWJsZSA9ICJzeXN0ZW1kIg0KVklSVFVB
TC1SVU5USU1FX2luaXRfbWFuYWdlciA9ICJzeXN0ZW1kIg0KSU1BR0VfSU5TVEFMTDphcHBlbmQg
PSAiIHRpZ2Vydm5jIg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+
yMs6IEd5b3JneSBTYXJ2YXJpIDxza2FuZGlncmF1bkBnbWFpbC5jb20+DQq3osvNyrG85DogMjAy
NsTqMtTCMTbI1SAwNDowMw0KytW8/sjLOiBMaXUsIFlpZGluZy/B9SDS0rahIDxsaXV5ZC5mbnN0
QGZ1aml0c3UuY29tPjsgb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
PG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K1vfM4jogUmU6IFtv
ZV1bbWV0YS1vZV1bUEFUQ0hdIHRpZ2Vydm5jOiBGaXggZG9fcm9vdGZzIEVycm9yDQoNCk9uIDIv
MTQvMjYgMDI6MzUsIFlpZGluZyBMaXUgKEZ1aml0c3UpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIHdyb3RlOg0KPiBGaXggdGhlIGZvbGxvd2luZyBlcnJvcjoNCj4gRVJST1I6IGNvcmUtaW1h
Z2UtbWluaW1hbC0xLjAtcjAgZG9fcm9vdGZzOiBQb3N0aW5zdGFsbCBzY3JpcHRsZXRzIG9mIFsn
dGlnZXJ2bmMnXSBoYXZlIGZhaWxlZC4gSWYgdGhlIGludGVudGlvbiBpcyB0byBkZWZlciB0aGVt
IHRvIGZpcnN0IGJvb3QsDQo+IHRoZW4gcGxlYXNlIHBsYWNlIHRoZW0gaW50byBwa2dfcG9zdGlu
c3Rfb250YXJnZXQ6JHtQTn0gKCkuDQoNCkhvdyBjb3VsZCBJIHJlcHJvZHVjZSB0aGlzPw0KSSBh
ZGRlZCB0aWdlcnZuYyB0byBJTUFHRV9JTlNUQUxMLCBhbmQgYnVpbHQgaXQgb25jZSB3aXRoIHN5
c3RlbWQgYXMNCklOSVRfTUFOQUdFUiBhbmQgb25jZSB3aXRoIHN5c3Zpbml0IChhbHNvIGFkZGVk
IHN5c3RlbWQvc3lzdmluaXQgdG8NCkRJU1RST19GRUFUVVJFUyksIGJ1dCB0aGUgYnVpbGQgc3Vj
Y2VlZGVkIGluIGJvdGggY2FzZXMuDQpBbSBJIG1pc3Npbmcgc29tZSBjb25maWcgc3RlcD8NCg0K
PiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWlkaW5nIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0KPiAt
LS0NCj4gIG1ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy90aWdlcnZuYy90aWdlcnZuY18xLjE2LjAu
YmIgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3RpZ2Vydm5jL3RpZ2Vydm5jXzEuMTYuMC5i
YiBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy90aWdlcnZuYy90aWdlcnZuY18xLjE2LjAuYmIN
Cj4gaW5kZXggYTU0MTNhOTEwOC4uMTI4NTQ2MzJkNSAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9y
ZWNpcGVzLWdyYXBoaWNzL3RpZ2Vydm5jL3RpZ2Vydm5jXzEuMTYuMC5iYg0KPiArKysgYi9tZXRh
LW9lL3JlY2lwZXMtZ3JhcGhpY3MvdGlnZXJ2bmMvdGlnZXJ2bmNfMS4xNi4wLmJiDQo+IEBAIC05
NSw2ICs5NSw3IEBAIEZJTEVTOiR7UE59ICs9ICIgXA0KPiAgIg0KPg0KPiAgU1lTVEVNRF9TRVJW
SUNFOiR7UE59ID0gInZuY3NlcnZlckAuc2VydmljZSINCj4gK1NZU1RFTURfQVVUT19FTkFCTEU6
JHtQTn0gPSAiZGlzYWJsZSINCj4NCj4gIENWRV9TVEFUVVNbQ1ZFLTIwMTQtODI0MV0gPSAiZml4
ZWQtdmVyc2lvbjogVGhlIHZ1bG5lcmFibGUgY29kZSBpcyBub3QgcHJlc2VudCBpbiB0aGUgdXNl
ZCB2ZXJzaW9uICgxLjE1LjApIg0KPiAgQ1ZFX1NUQVRVU1tDVkUtMjAyMy02Mzc3XSA9ICJmaXhl
ZC12ZXJzaW9uOiBUaGUgdnVsbmVyYWJsZSBjb2RlIGlzIG5vdCBwcmVzZW50IGluIHRoZSB1c2Vk
IHhzZXJ2ZXIgdmVyc2lvbiAoMjEuMS4xOCkiDQo+DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0t
DQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0K
PiBWaWV3L1JlcGx5IE9ubGluZSAoIzEyNDQwMCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzEyNDQwMA0KPiBNdXRlIFRoaXMgVG9w
aWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTc4MDM0NTAvNjA4NDQ0NQ0K
PiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1kZXZlbC91bnN1YiBbc2thbmRpZ3JhdW5AZ21haWwuY29tXQ0KPiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KPg0KDQo=

--_000_TY3PR01MB10110979EF0CC170FA92E1D319B74ATY3PR01MB10110jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Hi Gyorgy</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);">
<span style=3D"font-size: 12pt;">&nbsp; &nbsp; I&nbsp; use following settin=
g to </span><span style=3D"font-size: 11pt;">reproduce this error.</span></=
div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
INIT_MANAGER:forcevariable =3D &quot;systemd&quot;</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
IMAGE_INSTALL:append =3D &quot; tigervnc&quot;</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>=B7=A2=BC=FE=C8=CB:</b>&nbsp;Gyorgy Sarvari &lt;skandigraun@gmail.com&gt=
;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b>&nbsp;2026=C4=EA2=D4=C216=C8=D5 04:03<br>
<b>=CA=D5=BC=FE=C8=CB:</b>&nbsp;Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.f=
nst@fujitsu.com&gt;; openembedded-devel@lists.openembedded.org &lt;openembe=
dded-devel@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b>&nbsp;Re: [oe][meta-oe][PATCH] tigervnc: Fix do_rootfs =
Error</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">On 2/14/26 02:35, Yiding Li=
u (Fujitsu) via lists.openembedded.org wrote:<br>
&gt; Fix the following error:<br>
&gt; ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of =
['tigervnc'] have failed. If the intention is to defer them to first boot,<=
br>
&gt; then please place them into pkg_postinst_ontarget:${PN} ().<br>
<br>
How could I reproduce this?<br>
I added tigervnc to IMAGE_INSTALL, and built it once with systemd as<br>
INIT_MANAGER and once with sysvinit (also added systemd/sysvinit to<br>
DISTRO_FEATURES), but the build succeeded in both cases.<br>
Am I missing some config step?<br>
<br>
&gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb | 1 +<br>
&gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb b/me=
ta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb<br>
&gt; index a5413a9108..12854632d5 100644<br>
&gt; --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb<br>
&gt; +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb<br>
&gt; @@ -95,6 +95,7 @@ FILES:${PN} +=3D &quot; \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; SYSTEMD_SERVICE:${PN} =3D &quot;vncserver@.service&quot;<br>
&gt; +SYSTEMD_AUTO_ENABLE:${PN} =3D &quot;disable&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; CVE_STATUS[CVE-2014-8241] =3D &quot;fixed-version: The vulnerabl=
e code is not present in the used version (1.15.0)&quot;<br>
&gt;&nbsp; CVE_STATUS[CVE-2023-6377] =3D &quot;fixed-version: The vulnerabl=
e code is not present in the used xserver version (21.1.18)&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#124400): <a data-auth=3D"NotApplicable" class=3D"O=
WAAutoLink" id=3D"OWA8814d28a-0acd-5c42-8cea-3335d78ecf40" href=3D"https://=
lists.openembedded.org/g/openembedded-devel/message/124400">
https://lists.openembedded.org/g/openembedded-devel/message/124400</a><br>
&gt; Mute This Topic: <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" =
id=3D"OWA231a25d5-ad81-0387-4676-0131b6f23385" href=3D"https://lists.openem=
bedded.org/mt/117803450/6084445">
https://lists.openembedded.org/mt/117803450/6084445</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=
=3D"OWAb29b767a-cba8-4695-5be6-eb916f05a39a" href=3D"https://lists.openembe=
dded.org/g/openembedded-devel/unsub">
https://lists.openembedded.org/g/openembedded-devel/unsub</a>&nbsp;[skandig=
raun@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</body>
</html>

--_000_TY3PR01MB10110979EF0CC170FA92E1D319B74ATY3PR01MB10110jp_--

