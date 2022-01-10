Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC78C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 00:17:01 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web11.25498.1641773819467258244
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jan 2022 16:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1
 header.b=LwmSEfZ/;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.101,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1641773820; x=1673309820;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=KZ7Dy+aHySKy9NSSMQVo9RY8ddTgYwO9Z2cKEqdLw+k=;
  b=LwmSEfZ/G7f0fMbJsCaNQrNGoOPJteQwrF5F5uup/U+jFoEqB5ekFyJC
   ccn/gWIp3vuJR9/P/2uslrAV0gqyMq717N8UQzzDlD0+gljbtLTzbYThH
   EwJoqCljgvZ7ru396Qf7Ei3AbrJXOnAZbui3Gw4woayTwZ6LZkBclhp/4
   jOyfMi7oStunFx8v3M3Hu1+hNcBmcEeWk9Qqk7z58wb7vUVi3crGPxcKQ
   lAFvq3aOSy4KvBLpxJFG097T9S4bEnjwaZJgSWQT6/A5gj/mMNix1cVwx
   +2mXkAJTXJxFFHrrOFUJtfVEEC8O48wuTN8Bz+fKv75yN0q5wJkBSp8D8
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="47132268"
X-IronPort-AV: E=Sophos;i="5.88,275,1635174000";
   d="scan'208";a="47132268"
Received: from mail-tycjpn01lp2170.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.170])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 09:16:56 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2aMO8ahdTkwaeUGuOPfX3B59Kp2sgp99pGoVEj0b6VYhrYWD/6apHgtkYAPa1+hxMARdfeXSqYb4HgbUrD1lNcUeGqSka5rZgfugWm8ftOh1R/xoGSHK/xofh4nWKSRu18pTlWcimqE5e9pEHNeVV8V7P1iMwiyqwpUgV+9iPPOVURbV+Kz1gfUqqNErewfXiAN6s6Oo5zCfu6OiXDFwQh02w2+zpEcf3CA01S1AwX2AlbPLM2A9f8pLpZYluIamxL0kN8NywCMqVxywGy+zpxwzesIXkUS+9zkXnlgAjqHo3dK0db0oRxjY1HPIrl4zGsOBsJ89aGSv2frEE64Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ7Dy+aHySKy9NSSMQVo9RY8ddTgYwO9Z2cKEqdLw+k=;
 b=Di9kXRaIMNY8gr3khwMRwW4vPQvUvbZFen7RCjktbPtg64zIuSSvV/hD00/x7PYqunHbulxy8sxGSldhpqHKEjvkxtKkrt60W1ShUqElzNfHo1ySvqDw5Ywi9CPQqpnDACfGuWlm8NeBiznGa4lUNh+WUbpfRtEwXLpfoDqVxxEfeaTIJFEraY0Gmo4/slf9Mb1GARJvOMJ5pKwU1NkfFxHYWPMwmqlw7Bz7wey0ypUDKjbg7V623O+n5AuMERMCOA73wP+v7tPTecd6OsBty64Dfexrk170kGREm6qOmD34lvbPWqM/LwxHxzC0Kjt0TU/L7R8MVNLBy7XLzSDniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ7Dy+aHySKy9NSSMQVo9RY8ddTgYwO9Z2cKEqdLw+k=;
 b=YnmGvnrhHmcnQwjTPSqi3E76cpK5lg3siOnHWccDXJgcF3gKIoVZXGxfNWB3FUWBYDBs7yW1U65gVlKn0WpAx/4rehEqjYXiD8YYkQD3gOdGleo22Q/KbG7rpXSFs5Wk9VxFWp1s/KGtWsAdC2roPeifh+0jUoKUfZ9bRzUuFv4=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OSAPR01MB2611.jpnprd01.prod.outlook.com (2603:1096:604:2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 00:16:52 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::30c2:e4b4:cf0c:973c]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::30c2:e4b4:cf0c:973c%5]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 00:16:52 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 1.1.2 -> 2.1.2
Thread-Topic: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 1.1.2 -> 2.1.2
Thread-Index: AQHYA9LPerwMrRXWn0idx8cUm5Zde6xX52MAgAN+xAA=
Date: Mon, 10 Jan 2022 00:16:52 +0000
Message-ID: 
 <OSBPR01MB1845113D00FC9BB6477A62EFDC509@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1641565655-53792-1-git-send-email-wangmy@fujitsu.com>
 <1641565655-53792-2-git-send-email-wangmy@fujitsu.com>
 <0ffbbd0b-3010-70d8-30c7-240fcbaeeed6@gmail.com>
In-Reply-To: <0ffbbd0b-3010-70d8-30c7-240fcbaeeed6@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1f0d54e-fb18-4188-54a9-08d9d3ce80cf
x-ms-traffictypediagnostic: OSAPR01MB2611:EE_
x-microsoft-antispam-prvs: 
 <OSAPR01MB26110CB3ED8B7C60D9DBB730DC509@OSAPR01MB2611.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HzPzxGXbRilGZ8lNMxxPuuXiaKTGC8/jKQMTzYnfuFv50bW2L7No4jlTVCPgDc6e3et+rZjKxvzMseHs5sipMi436AJU5jqvuezlNV10yl7BaliUDiXruRjakdl/nW6+ni/DnGHs5a2gexKPgkanDix4hjHfzTlOyEVJn6/SgTIzmasCQrKlDs/W6kvMDyzT7I4nFbx2b3we+FBJroBouwLbgdFdJ+XoTi9KOFcn8IA9MpcN/T5VMTot9itu4Pn/B0PU5du9QbZATaNmN5oJiZM0lUUFSEbMdFjteVdzjDOcniZUJLAnoKUI9CMjK8VpX9Ee/I9iJXQhi+DIH5Z1o3DD24ZLXUtEYJlDfITDXW++X6HDezVFVG5lUiKi2GBWLBj3aqZO62a813JrEMf2rKcKeMIUYCXON3SJZfM4DdE04gdAV472tYQcizH8eLOrn/6bY03umEaigV7IXPKv6yz2sLOOijlf+jMJpl3lH2I/r/FlI0ZaDeCtPj2HyXlkXFDvjKhzbLz7ETrPXi+F5kQ0NSaqv4Pff18IUUcyYVf8AZDribWcp3fOZUeG9ByTV5LWzOFd+imCq05kgG/EWWj6Sx15RDuKA8g1uMqrxlwxJfBqPgNwuzDK4cnrHosdVhbaNvOWvDbKbjsS1yGdsP29Q5BrGgMgyTz8iBFp7k3sTgdT8mMNRWE0Goq/GSFaCT0AFCf9G4djZjekqapJ2Ey0V1x1Iaj6RtKWTuKt4WMoFRCOdDxqUXraOTcx8NHdSd99SRQRW74YURtsWsAkP5ZybAbhN9SxABGmhBLndAOgXXvUVXloJAvaVM6oo4ybqFezj2SESapVyjImtbpbjQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(83380400001)(33656002)(508600001)(64756008)(6506007)(53546011)(38070700005)(122000001)(52536014)(66556008)(26005)(85182001)(66476007)(66946007)(76116006)(316002)(38100700002)(186003)(9686003)(5660300002)(2906002)(82960400001)(66446008)(55016003)(966005)(7696005)(71200400001)(8936002)(8676002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S0wvT0ptbVBhS1dmcnJYTGRyVHhISVNERFpmbm9GUzg2ZDYyS3NvdzZWM1o2?=
 =?utf-8?B?akgvOHJRSFo4em1zZEE5cTFhcTdrV1QvbGQrdi9tMHJOdmIwNjBJTVFZTWFv?=
 =?utf-8?B?MFJrRUhPNVhZN3FkWnY4QnFtSEpobklETnFRQ3E3anJ6aFpLaXIrWW15aXZs?=
 =?utf-8?B?YWZPR3d2cWdMOU1wUjgxNFpHK2pOY2FRU01RWlU3WVQ4QkxXUDg3L1VjWHpO?=
 =?utf-8?B?VERmc3BJcDUwMlZpdnIrUHB6RlNDR2lJMGZJTkVqazFUb2N4bG1DZlJiOHZ5?=
 =?utf-8?B?TXhBTWc1WDZhN2Jnb2sxWEM4VTNoaXkvcVdpY1FKdFpVa0phUnZBL2pJMnNx?=
 =?utf-8?B?Wld4TER4WmEvZTB1WmlxazNjU0dyb0MwWlZya3dPdGxKMGNnMm5yUE1aMkg2?=
 =?utf-8?B?aFhYZmdNWnNYdTZUaFBrTzV3Mm1Ha3hQcFVUZ2hvUGhKM3JhYW5uci91amd1?=
 =?utf-8?B?Ukh3a2hxMXA0WU9KVSt1dkZkeHFYS1JhTHF5RDA0OTg1c0VkNzNhVmZGVkZE?=
 =?utf-8?B?SlhCUzFJVzFWa0ljQWlkdFJ1RldybThjT1VlK241TEJVMkE1L0RPWHN2U0Q5?=
 =?utf-8?B?a3RCY3hLR00wRUlmbS8zNGRtNmJITnNmV3RlUzI5YU1YcUN4bFI4MWNBWmVJ?=
 =?utf-8?B?Uk9wVm5nR1NjdzRpMWJpL09wMXcyQ0QydUhiZEYwQ05QY3pkTkM2dFpPbnUw?=
 =?utf-8?B?TWJsZFVOYUVEMm9vZnF1ZHhYaXZtellJN2o2VUtqbURJK1k2MUFqSmhJaE9E?=
 =?utf-8?B?VmZGR3RCTFZnejFzbmVINVlmTVFOUjNyRlFLTnJIWWp6dzlzTHd5M0JHSkkx?=
 =?utf-8?B?eStwUkNqb092aEZCK2IwRE1SdHpZbVBnSndGSVVuUW5JaGdldTI3UE1JTjdC?=
 =?utf-8?B?cHZicHd2SDlQanQyTm5UVlB2UVBZVFZiVlorYm1yM2x0QWJmZHkzSVViODZX?=
 =?utf-8?B?TUdJTFluaUlReHYxalFNcUhsaHFCS0NWVVpuYVlXRHF6YzRjZ2xVUDBIaklR?=
 =?utf-8?B?UHVvUlAxQVAvWkNMbUJXZTFXalc5RlNUNVBPVE16QmxENzVRVUJkNWpFT29K?=
 =?utf-8?B?VDVJNFZrM0ZCTzBiVWpQMS9BNFNTMW16OUlHaFE4alpSdVlzc1JKS0lBcW5N?=
 =?utf-8?B?VUFkVnlyZ1ZVV0tlZ1AwakhGcTJhdFhZdyt5ZVRvaTZXQTRqZTMzUGV3TTRn?=
 =?utf-8?B?OTJ0anB5eWx1czBKQkZhaE1lL1hNSEJEQlpzbEdMMW1CdXZNRWZuZDM3V0dU?=
 =?utf-8?B?RU9CQkRyd2VpTFNSR3c3MEoySkdrMVhaZG81Qk5aNE1HNmxFT1BnWlJXUFov?=
 =?utf-8?B?N3haUmxlc3c3TFhFZEszZ1pSWUtjZXhuMWFaUm5KdDNWczFESDJIcks5RVhC?=
 =?utf-8?B?SFpxbmVXRXUzSkVlZjFZMHFseFl3MmhqTzN0Zy9TUWlOTFpVdnRJTkpzNHBY?=
 =?utf-8?B?a2dnYWJxQ21KR1Z3MktPK0dyVTRzUFlKVXZPRnI5cW9iQmQ4c2g3R0VoKzVh?=
 =?utf-8?B?dDdSMHlhRE9UdFlEL0MwYm5vMDFoeUhFdk5tZmxhSElsQm1xdVRtNWZHei8r?=
 =?utf-8?B?eFVTWWVGSk54NGkreHdubVZ5NGxqUXBLTmlFMyt3eGJ0MFAxSDBpUHFyelVW?=
 =?utf-8?B?RW1JRGJSdHRXcnBkMjJPekRNakU0L01FNGNESFdURVE0SkpCZ1liWVZTMWZo?=
 =?utf-8?B?YS9GME13SkdnY1BFYTltK2w0Y3EyN25OUFQ1bEc5WW0xTlZYNk1ScWxzMTJr?=
 =?utf-8?B?T2NUanh5K3JMcUtTOTR0Y08zVGQvVm9aZXFNY2Z1WnJmMEk0VEI1TklNVnhz?=
 =?utf-8?B?YlRQWmRDVldLOWNGM3Bzd3R5Sm1qK1crd1dyY3NRYS81Wkxjb01qN21lRjVi?=
 =?utf-8?B?SCtWLzZiVkE5dGxMVGs4MVhGSTBPSTl1OW53a29kS0xrYWhUd2RoNXR3dHlM?=
 =?utf-8?B?a00wbUpoKzlGQTFzY2NNbHJUZGhSQm5oL1BKL21zLytuVnJrWTZ1UG5zWlpC?=
 =?utf-8?B?eXJjK3lSaWhoRGRUMklVT0R0bHdoVHRvc2lrSUl1M0p3eUVPQ1RaMWlWU0xC?=
 =?utf-8?B?UDlXeHhHVU1TYXlBTFVlTm41c0dza0hoeVdpSUUrRnNaWFV5c0xzekhFaVEr?=
 =?utf-8?B?a0FRdFNNdUhjM0ZxOFI1NGxtdlJBVGU5aXRER1hzNzIzanl0Yjl6aHNRMUd2?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c1f0d54e-fb18-4188-54a9-08d9d3ce80cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 00:16:52.6649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 WzNztPCx9wOGMoLQePOXzsuuac6zyV4JV9bfbbPVBSm8b96lNWLGPWXXw8OFvUE4+T/ExMmhmRyiYkLnnt9JQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2611
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 00:17:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94705

RG8geW91IG1lYW4gdGhhdCBJIHNob3VsZCBjaGFuZ2UgdGhlIG5hbWUgb2YgcmVjaXBlIHRvIGRu
ZmRyYWdvcmFfMi4xLjEuYmI/DQoNCkluIGFkZGl0aW9uLCBJJ2QgbGlrZSB0byBhc2sgeW91IGFi
b3V0IHRoZSBuYW1pbmcgcnVsZXMgb2YgcmVjaXBlLiANCkNvdWxkIHlvdSB0ZWxsIG1lIHdoZW4g
dG8gdXNlXyBnaXQuYmIsIGFuZCB3aGVuIHRvIHVzZV8gdmVyc2lvbm51bWJlci5iYj8NCg0KwqAg
LS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRGV2ZWxvcG1lbnQgRGVwdC5JDQpOYW5qaW5nIEZ1
aml0c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpIE5vLiA2IFdlbnpodSBS
b2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUw6ICs4NisyNS04NjYzMDU2Ni04NTY4DQpD
T0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRz
dS5jb20NCmh0dHA6Ly93d3cuZnVqaXRzdS5jb20vY24vZm5zdC8NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiBT
ZW50OiBTYXR1cmRheSwgSmFudWFyeSA4LCAyMDIyIDI6NTEgQU0NCj4gVG86IFdhbmcsIE1pbmd5
dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV0gW1BB
VENIXSBkbmZkcmFnb3JhOiB1cGdyYWRlIDEuMS4yIC0+IDIuMS4yDQo+IA0KPiANCj4gDQo+IE9u
IDEvNy8yMiA2OjI3IEFNLCB3YW5nbXkgd3JvdGU6DQo+ID4gQ2hhbmdlbG9nOg0KPiA+IEJ1Z3Mg
Zml4ZWQgZm9yIHRoaXMgcmVsZWFzZQ0KPiA+IDxodHRwczovL2dpdGh1Yi5jb20vbWFuYXRvb2xz
L2RuZmRyYWdvcmEvaXNzdWVzLyMjIyMjPg0KPiA+ID09PT09PT09PQ0KPiA+IEZpeGVkIHdyb25n
IGFjY2VzcyB0byBtYW5hdG9vbHMuc2VydmljZSBtb2R1bGUgKGlzc3VlICMyMDIpIEZpeGVkDQo+
ID4gaXNzdWUgIzE4OSAiTm8gbGluZSBicmVhayB0byBmaXQgdGhlIHdpZHRoIG9mIHRoZSB3aW5k
b3cgaW4gZG5mZHJhZ29yYSINCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3
YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4gICBtZXRhLW9lL3JlY2lwZXMtZ3JhcGhp
Y3MvZG5mZHJhZ29yYS9kbmZkcmFnb3JhX2dpdC5iYiB8IDQgKystLQ0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvZG5mZHJhZ29yYS9kbmZkcmFnb3JhX2dpdC5i
Yg0KPiA+IGIvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL2RuZmRyYWdvcmEvZG5mZHJhZ29yYV9n
aXQuYmINCj4gPiBpbmRleCBmZGMxNjRkNTYuLmE2N2JkOWJjYiAxMDA2NDQNCj4gPiAtLS0gYS9t
ZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvZG5mZHJhZ29yYS9kbmZkcmFnb3JhX2dpdC5iYg0KPiA+
ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9kbmZkcmFnb3JhL2RuZmRyYWdvcmFfZ2l0
LmJiDQo+ID4gQEAgLTksOCArOSw4IEBAIFNSQ19VUkkgPQ0KPiAiZ2l0Oi8vZ2l0aHViLmNvbS9t
YW5hdG9vbHMvZG5mZHJhZ29yYS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwDQo+ID4g
ICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVRvLWZpeC1lcnJvci13aGVuLWRvX3BhY2thZ2UucGF0
Y2ggXA0KPiA+ICAgICAgICAgICAgICAiDQo+ID4NCj4gPiAtUFYgPSAiMS4xLjIrZ2l0JHtTUkNQ
Vn0iDQo+ID4gLVNSQ1JFViA9ICIxOWUxMjMxMzJjZmQ0ZWZkODYwZTUyMDQyNjFjM2MyMjhiZmU4
MGE4Ig0KPiA+ICtQViA9ICIyLjEuMiINCj4gPiArU1JDUkVWID0gIjVjYmJjMDdjOWQwMTVhZjI4
NGE0MjRhMTcyYTM3OWIzODVmMDViNmYiDQo+ID4NCj4gPiAgIFMgPSAiJHtXT1JLRElSfS9naXQi
DQo+ID4NCj4gPg0KPiANCj4gcGxlYXNlIHJlbmFtZSB0aGUgcmVjaXBlIGFzIHdlbGwgdG8gcmVm
bGVjdCBQViB3aGlsZSB5b3UgYXJlIGhlcmUuDQo+IA0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0
byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjOTQ2ODgpOg0KPiA+IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzk0
Njg4DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
bXQvODgyNjE3NjQvMTk5NzkxNA0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwr
b3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWINCj4gPiBb
cmFqLmtoZW1AZ21haWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==

