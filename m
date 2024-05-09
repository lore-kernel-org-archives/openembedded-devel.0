Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE0CC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 21:41:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.65])
 by mx.groups.io with SMTP id smtpd.web10.3565.1715290889371729889
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 14:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=yjPVWIx0;
 spf=pass (domain: siemens.com, ip: 40.107.22.65, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNfTUkGIFU64HCN17GDGZllonpiAG2Zdm5JCmH6bPv5X6SuDZv+JkvTZwcGfibG5CapKQwqIyqmIAzwPyA9lcr8KO/uWlLj5cpcbNZXxjKprZqC2E8gntxlhF2QWM5h/+FEumqvk+fYrr1DwCsSV2GbYJBsBTtbcYyBmVSvoLr0kn3M4LyH7PLNhPvQomW7htwvvL7z9uDY2N3VQLI+u/vmYYu9vfmsxHsniUdjmdfQxbC8viGb4Kih6yNakkPg4zN93HGggUD/budKtn159Q7CA37rUrwudBeN4ZphnalVp6WZSWHnM7aLmaDWW0qjEvVy1llxs3y+oa1ug0CJpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3esdm/Xry08UAyRvnebRqIeYRDPzdDUvzkmDYPtgLL0=;
 b=Lmlpv80bu8tPnIV8/wxEZC09wfexr5iLI89dTuSydJwZRP8eqXoJt1D4Y7Ap+xF6sOZlc+iVHcPPEX5IZhEWkx7CVn0Kckij1eslfqC4jF5QRUWq65QH6Ru3HGnndOran6eaNz9faIfqIzd7TdhIXzl0fB5AwlasAcE3neN9wHRpPwwHDI/cl0gmkLD6ByPfhy2lQmOoABWAikoKzIA9ode+/GvM5VQRvLjF46+lJmgCm73LREoDWXgxZy43NMtwYP3OvIxwDWRm5wEmYseeCkoLreBq/Vgnooed40StNZlbxxCgZiYYQgNU5xvuncdftpIRpTwYC4ijLbw3Yh66mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3esdm/Xry08UAyRvnebRqIeYRDPzdDUvzkmDYPtgLL0=;
 b=yjPVWIx0ktStniBxsOMgdWDfy2oyymvuQ/QB+3KNdnOfu3/1n0lxJHl1ZTo4NHp/2ab3q+1pK+qd+CVcfbzzlHsx2hThCVCz/sA3zjI/L6dIAErvkGzocYRxhyuzJRdjw9stTjSPRTz9sjOe87OqFL+ipMk12qUziYKtunP+Q0QluNgIgPlinm4yHtQ9lQRdJ6S+F5gioRFboXAWohxi56FcnJEH4Fx/zX8qDYt5sUCryftt5oFSVeqQsUfSRc7pd7NwbUQqUUqS44bQbibVHI3mY/0NE5zt5sxLcqSO1Mb9X/rzR9T4sPijGHAr1w3NxwdjUYgRUVyo+rLr/vbS1w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB5431.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:32a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 21:41:26 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 21:41:25 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [meta-gnome][scarthgap][PATCH] gnome-shell: correct regression
 with glib-2.0 2.78.5
Thread-Topic: [meta-gnome][scarthgap][PATCH] gnome-shell: correct regression
 with glib-2.0 2.78.5
Thread-Index: AQHaoljNETfporhV/Eu7ZiHtXjTLobGPbnTg
Date: Thu, 9 May 2024 21:41:25 +0000
Message-ID: 
 <AS1PR10MB5697D975E4A0A2F308908719FDE62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240509213434.704361-1-peter.marko@siemens.com>
In-Reply-To: <20240509213434.704361-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b56cc240-fdbe-4e69-9515-e947ff80c915;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-09T21:40:56Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB5431:EE_
x-ms-office365-filtering-correlation-id: 0858ac55-8ebb-4f50-ee4d-08dc7070c71a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QUJNci9nMzNUY2JEbnJ3SisyUi9STmZQeVUya0RvUE8xcWdTVXhiYk5rOTcy?=
 =?utf-8?B?TC9oekpvbDJnT09yS0xCd2hEcThQc3ZkY2Q5VkoveXZraVpRU1gySThTQ0VV?=
 =?utf-8?B?TXVyczFPaUpYVnNHcThidkFSWUtGOEdub0ZKdDFrU3JER1V4SkZnc1NIb0x6?=
 =?utf-8?B?SjYrRzhhclBOdFVyMzByNVZEY2JtdnRuYkVVcEM2dUk4dXZiZm5Wdit5ZnZL?=
 =?utf-8?B?cEZDNUp0ek5CcGQxOVJ0YWhxU3dBWnFEL3lOaDFDN0J3SnlwazMwSnpTdmtC?=
 =?utf-8?B?cVh4WDc3NjdPemlnQUp4ZFV1S2xrRU9sdFYzNTF2SjE4aWFja0ZYem5BREp1?=
 =?utf-8?B?MnJTSitaNzR3cEdBdmFCTklsQTk2R2srL3A3blIyc0hia0xzaHdKOVVJdDhl?=
 =?utf-8?B?VjRFbW1ZTVY2VjRodXZnRlkxTXRFWXQ2a0F1M3VvRU93WCtZUFdsWk5XelRl?=
 =?utf-8?B?WUtVNGxVVytQcmM5czBhZ3o5YWZOWmdOMUFrL21WOTB1WlF3NUhOdnlNQ1RK?=
 =?utf-8?B?SURSZUhVNmtMeEw5RndIQmsrMml5Z3V1aHVRKzViRXdwTjVDMnlrY2xIYzBl?=
 =?utf-8?B?QXVwT2o3eDhKbU5OYU9WMnRKTGdVMHFURDhzcmJnV2FxZ3FYc1kwbnVZRWp0?=
 =?utf-8?B?VUg0a0plakprZkRvOTZ1c2lNbGd4K05MeGFLd3dTNGlRZW5QOG01S0hMUnBB?=
 =?utf-8?B?Z090SUdEbEVTTU8ySDkyeFdKMzgyd3VNelNoaThQNGROT3REdlNnYXk1NHpm?=
 =?utf-8?B?WHIzTmo3dTh4QTFMUGcwb2QzSlc0QmVpTlBaeVAyRlZuZDBYU0Q5VkozWURo?=
 =?utf-8?B?OXZqZm5TVlltQmpZaS9YRHJ2R3M1SGJXQ1ZzTFBrZ0ROUkJLY3I3aXQ0Z1Vh?=
 =?utf-8?B?amEyc2d6SlhDaWo1cDJjTlJuckZIZHFXSnZHZmFUMlNCWTZoVkh0MUVOM0ht?=
 =?utf-8?B?UEtmR3VtRG5tUjdvOEJVTmZ1R21QcE53d3RhMlJPL0JwTFVzcDdTRmk4TVdS?=
 =?utf-8?B?SUN2T1A1MW9rdGxlTjcxQlFVUldmUU5VSXlBcUJuSGczM044SEJoZVRLb0pv?=
 =?utf-8?B?S0lUclBUUlZaQlVzaGZiNnNCMWw1MHZZblgxOXJPa200Y09XalF5SmZqMmlI?=
 =?utf-8?B?WXB0NjlMS0pCLzZxRU5vSDNvSmN3R1p0LyswNFBRd0c4N09Xakp4OHYrSVNB?=
 =?utf-8?B?by93MVkwZ25IT0IvTWtRVnJVRG1BRDJDVnVVMTh0b2Vod29ObDdOYjNJOGUv?=
 =?utf-8?B?VUNwV2paTFpqZEhlZUJ2eVRqaVArbkhQNDl1TjZwa1MzcEl1cmtaK0EvQnBq?=
 =?utf-8?B?MlNNUStiL2RDRng1c0lnb0FTOUlTNVBRRG1QR1lad2o0eXRtMFh3eExKcjh4?=
 =?utf-8?B?U2F5aExJcnBrYnhxbzI0Q2VyUkkwYU5iS1ZoUjc5MStpWWU0RDB3ZmJUU1dq?=
 =?utf-8?B?WE5udDV1S1lqbXczSWdiQmdERlB1UVM5Ulo5cVUxbW1wanBZL0VhYUtsYUJP?=
 =?utf-8?B?aFh6bytmY2dQS2RIVTJDOGJxMGUrK3BUdnVsZXVTVzJ1NHVqNEN4eklzdjlu?=
 =?utf-8?B?YXJNTFh1ajBCR1pnZjQ3WG04RWthUTdUeDVZRXdLa0NIV3BidmxHZkxOY3hE?=
 =?utf-8?B?UDVxUFEwOUJTdmJSSHE4akp0Ry9VQmxJMnpHQy9QUm9mZSt2dWFOVzdyQTV1?=
 =?utf-8?B?NDQ2Y3dBWmJIRWYwcm82aEpUMVlMdVZkL005TE5yY1JieHNTRkhkQUVoWXhU?=
 =?utf-8?B?Q3c2dy8vcmhzL0J4dGozRW0zcGh2bmY2c0NwTFpiT0Q2NitqL3Z1Wi95ais4?=
 =?utf-8?B?R3JHaGdHVERNbmtvKzdkQT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TFB1YXJaWVduZ3JGMTdWYlVDcUhkZTRwNDMvZHhza2VqODFabUNnbWFHTmJB?=
 =?utf-8?B?RmRCclFMNnZWeVE0dGFSdTlKUFVhdDZYQTlDdFRxTGVaK00rbG4wT0dBclRm?=
 =?utf-8?B?cFJlaGxHT2hlOGdJVS9ScENCR0dPaWFMbXExZStQOVVqd2VoNDB1REJveFZK?=
 =?utf-8?B?UEdHckQzWjYyeVhBT0tIYytyMU1MdHhJYVp2WThVNHUrOEZSZHNSMno1ckl0?=
 =?utf-8?B?N1FkODdnZnJFZnYyM2dOTEQ0WHkzYThVcTYzV20rOTRLOVdOdFQ3eFNrZ0RP?=
 =?utf-8?B?WDZEaVE4eC9nVFI4S1pvRlB4dDRoSXpBVlFXT0orSVIwQ2o3Ylg1QVpQVmFH?=
 =?utf-8?B?VHY0d25OZmQ5K3diN0E4VkZ4K0YvTzA5VHF1bjJ5ckF1M3lKQlVEUm9CQy9r?=
 =?utf-8?B?OGtoMWNOK3pPRTFlbWdzYzlhUnNMZlpuaE96WHFNaHRHZ1AvdXNaY01OaEpT?=
 =?utf-8?B?VW5MY0k2L3lkdXdKQ3JQKzF6dmVpSDcxZEh2QmczYURpbytidGw5Ujk2QmJw?=
 =?utf-8?B?VWk2dzVBeTFRTVM1UGdybUhSTWc1cE9hekhpRCtQRHZET21oazNva0xJVnRm?=
 =?utf-8?B?bnI5Vy84RzBMb3daYU1TVGpCQi9ueFliZWhCZzFkcjJObFZJN0FtUWp4b3NN?=
 =?utf-8?B?L2JsNGJCSUlYQ2ZQb3FYQ1RPUVNLTVc1L05sbkFmcGdoZjE2UTVEUWdUYWF2?=
 =?utf-8?B?ZjMwT0wvVkRkclVvRjZPeFhkKytublhYTldWTkgyL2RwcjJWcENWbjhnTVdP?=
 =?utf-8?B?cWhqSkxFZzVTN3UvaVExelYvRmFWWTR1T2srTUU2TXpPMDFsU2E1WU5BVkQ4?=
 =?utf-8?B?enMzM3kxUUxvY2M1b0xyM0dWdVpQZ3ZSdVBpbmtUR3gyNys3emxDempVbXBM?=
 =?utf-8?B?bW9DeXB6UkczMTRXUzdnOTZyWTBWbzljQU9nc1BDZEY1aEtOTWppemJkdktk?=
 =?utf-8?B?ZnZjckZlbDdxWW9Fcy9ISmlZUm9YdEwvSGlPcXJiaUhaTi9ialcxTVBlWm9W?=
 =?utf-8?B?S2ZWSXJUcnE5YXd2QmxjRjQ0Wm54TkZ2R0pESVdGcG95TGZ2eWxGUW1uM1Zu?=
 =?utf-8?B?a05Mc2RxaXB2a2RrYXBWdm5MZHd5dmtCQ3FHTGtBMFVsTWVBb1VMSWQ0NEVZ?=
 =?utf-8?B?bk1kYWF0bjFEeTgvVnlBQXFqeXg4Q2l5M0t2N0dDeE9HY1lQNUpwcG0xZ3M1?=
 =?utf-8?B?TmJ6S0dGTFpzcXNNQmE4TjdEV2kyOVEvMnVoVnlkaGxVWnRTKzNHSFhmdGtO?=
 =?utf-8?B?ODk3SGc1YWhQa2JFU3JBaG5DUWxWRitIUmZtWkJsQnZaQXNmYTJyaUlFWlIx?=
 =?utf-8?B?WFlRMDZnbTFwOE5kMkdiUlZoWnlYbWNZM1I5b3JYNFNkOWVjSkxqVEVtcUVI?=
 =?utf-8?B?MWhhZ1dSMWIwTHJQQUREVTkzSkdqUzBhc3VReFJBbUpKT1dzendFd1NpUG9V?=
 =?utf-8?B?K0lzbzFZeFBkeVNKc0N4Sk1PdHZFUmZkZjJHVEJEU09PYXFHcWRkWlNaNjZ4?=
 =?utf-8?B?a2FSNnJqWWZuL1hqTHlLVFo1SnZBdlpyejR3Q2pHUC9zLzlNZExqMWl4QWVt?=
 =?utf-8?B?akZyeUdseWxERFFENEpmWDk1UWpydnpieVJIZ3cybTI5V01vQVN0c1E4Vkw4?=
 =?utf-8?B?ZjdHMG9mVmVOSlFxUk93OHNTaGxiWUIxTEtBVmowZ2JJWThic25DWnVIRnpk?=
 =?utf-8?B?T1lUdmZiMTliaXpNRjZwNlBnWEg4Q2kyaHVJandsYk90cjJFd0dOU3krRyt2?=
 =?utf-8?B?RkdUVlFlQTQxSFlRZmljelRkdi9jTHk2blRhQ3k5c29pSXd6TGFmR0JHSXpG?=
 =?utf-8?B?bVUwMHNvLytGS3lEYzlJd0JQNVNrYnBySEFkQkc4ZlVkNmNCODcraURjUlZC?=
 =?utf-8?B?dU1ZYXh0eVVuQ1E5RDlGV2ZIRHpqOWRFL1Y4TXQ5Mm9XcTAzZzY5aHNLWk9h?=
 =?utf-8?B?d3lyY0hsOURwc096WDNVbUxneDVkSjZYa0Z3bGgveUhTdXpZT0k3SXdXKzlq?=
 =?utf-8?B?N1hPSGU4UTVFRHU1SWVycWN3b3dPanNYSHhJaVlWcW5HdHlEbjg1YlRkbzdo?=
 =?utf-8?B?KzJwd1F6MEVIQ05JUEthUHgyMlJpNkRaOVFHVnNGenhkYWJFT1ZFZFY3N21D?=
 =?utf-8?Q?iD90ael2eVIeSFRnz8qTRon/V?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0858ac55-8ebb-4f50-ee4d-08dc7070c71a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 21:41:25.8389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tx13iN8bvxRnrfkiux+RtxlrUFR/fjIc/anitslYEbT8lRuQI6GhtcLLBs3ZW5RAmC0mbZLgHzH8LDgu72XBJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5431
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 21:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110298

VGhpcyBzaG91bGQgYmUgYWxzbyBhcHBsaWVkIHRvIG1hc3Rlci4NClBldGVyDQo=

