Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E516C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 09:12:18 +0000 (UTC)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com
 [216.71.156.125])
 by mx.groups.io with SMTP id smtpd.web12.6965.1657617130601216084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jul 2022 02:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=N2MtWXXZ;
 spf=neutral (domain: fujitsu.com, ip: 216.71.156.125,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1657617131; x=1689153131;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vPIRpLwTr5MU/kO/wjcLJHXnAKokFM48MES7y/89F0o=;
  b=N2MtWXXZGGsYr2/QcEaklR8hnFiSL2+x8SBvPEYAaHgm3BKZKX2HoL7T
   PuGq/4E5Zsklu4xwY/mplXTPX7e/2l7QC0l4X8mIfGzvfJRpNcun5eR0H
   TKR43qcSdVzTV3SE9BK+x+ung3QQtlIhTCND2zfa9Tn5gcwXdho0m4Afe
   9Quz3gHQUXtcjKcz4PWew7Q+Mlr/OO+NdH2yuTEc0AB/5t6KHo9h+WPXt
   GZL4nz0R00FH3iUx50GkiVQ2IYTlDp8oeHWHhvd9vv/XheC7kv2pqnOwi
   SYdoTulCR0AuRnGOXd/ZOQFS4iwhAauRWCKCSWb512cL1qi/O6UmquubZ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="60325264"
X-IronPort-AV: E=Sophos;i="5.92,265,1650898800";
   d="scan'208";a="60325264"
Received: from mail-tycjpn01lp2177.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.177])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 18:12:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwJYiSM7ZUH0JEHmQxSvbnVkrM8ekDN9b3Al34HCWVkwfbGO4dDRhrPgBIUJ3yZofi3hdx25Jrc86Lb6U6PJ/eMW+rus5nHIv+s23maBWcjCmgABP/YlyuDGyV7jqWNnRJNST4muZtSVPXPtae4HG7RlrdORJ/ODRL0RJsh8RoI4h07vfDM+eRP2jjDjTbs23BjWESc/mTQEmdOs5TQpTOxML4cqlNsGAtn/OeZNTsmL+ySCYIf2D/WRoUFnqerbrQWSAN4xh85x7/O4IpcllqOyj85eGA2hUpzKQlVj0pBDJjFGfJgCwmd7NeMJVPj+J5fk94rTmyhtOE2dOjkBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPIRpLwTr5MU/kO/wjcLJHXnAKokFM48MES7y/89F0o=;
 b=H94/zMu77uBy33+yba0jKc5pVpaGGOoh81O/PqEEQZNzpw9M2I7JXdhOcjmISoMhnzK3sfRcTWbZXsiBCTc9DPZOuo8CVRRZOqvnbV5oRJs6YNcX0GxJ1D2uw0Xf2daryr0EhzCqsC3zrwu9MJM6gL8toKjR4g2ohFNKwdEqJGI0k3oq+xHmOmrk31nRfFCNi7dWJUAHdb0oU2N3h0++ZfNdrC2pN7WshhjmrQaLZ+vpItYITnU0RqtY7+eCj5btEYhi5nhrmXHCJ2LMpis6nBfWCQkkYyZ9pCDVnyv7V4veRlkjGSaLgOl7nDCK3E9cKjCvnh6AxGwRV3WIN+HQNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPIRpLwTr5MU/kO/wjcLJHXnAKokFM48MES7y/89F0o=;
 b=ZU/UyQzZy3xIETp4nMBJJTj5YZVoK7BtcfvHIo6iEvBmU4gid0RrEYJLrfHnZMjkV+RSZaS46TeJ5wE43U1B/zbxGPZPJtwdeW232vDb/K32vgg68fJjeKkRVCP5NYPvNP7ikrGCencSStONgIqYRhhh2wfSu7FL/CF3K64aORc=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OSAPR01MB4833.jpnprd01.prod.outlook.com (2603:1096:604:69::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 09:12:05 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::4c4f:9d9b:ae06:4299]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::4c4f:9d9b:ae06:4299%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 09:12:05 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] libraw: upgrade 0.20.2 -> 0.21
Thread-Topic: [oe] [meta-oe] [PATCH] libraw: upgrade 0.20.2 -> 0.21
Thread-Index: AQHYlQMmDyVdmAR57U6JnZC2g1YB3616YgkAgAASsWA=
Date: Tue, 12 Jul 2022 09:12:04 +0000
Message-ID: 
 <OSBPR01MB18454E9124D7A934AF713BB5DC869@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1657529116-24181-1-git-send-email-wangmy@fujitsu.com>
 <1657529116-24181-2-git-send-email-wangmy@fujitsu.com>
 <CAMKF1sokmjDiwFTPYqhg72=64DnwCRpYTh-y0W3n=POTAtRqUA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sokmjDiwFTPYqhg72=64DnwCRpYTh-y0W3n=POTAtRqUA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZmVkNmI5ODQtZTc1NC00MGJiLTg2NWUtZGRjMThhN2Nl?=
 =?utf-8?B?YmFhO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMi0wNy0xMlQwOToxMTozMVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8603ecfa-a6cb-4421-3c6c-08da63e696d4
x-ms-traffictypediagnostic: OSAPR01MB4833:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m2LFtUduDezw1vjKPRCXl7OjafEXiT9euwxf5sPAs/O87kCm7rQBpPG3PwtW1NHSryzI5m3GE6tHJoBzNosgP9SU9w1l1o66IjP21Fnc6C3XC1fKRYovFroCqCIijQI+WrvltWJ6rrxgZCXJtOHVqEQ+jzq9NUI0zReVTWvyriv/fZ1VzWl/ztF0CTXoikqlTFbdwFHd3K68cUe9SdrBS5QJI5wh+XlAG0fF4WguJX9lhAruf/8zPQNdFRQ9P4WmmscOSGZLigX/5iA7RYFEN94WEtviwO0zEmtebrE3VmiA+lEaNIJFKAQGc8YXkwILa5owGY33gSAFpB8UfWtmKZf3OpucVAXBp5539P4eyvkTWMJKyrWliycEpTjafZGlhUjqKKo29TIYo01/iLakKOicg0nuXgleGOSOQYqhIKUCq0gulTj12OMd7g7xRjEOF0/1g63aBzMRNp3pBUf+ev2EHflxV9rkfW42sFXnujTAznqpE8Zs5UplyRqYGv3BnvWVF7lxcSiyEO2viQE+6dFFbgkqAJlVGnewRpvtyBan8EIImIExMY5NLDmqYjVv3NOSeGeIDbZeYqA8Gk5fKUJ2qu/byxwVgmkuIRhUEhMrTvISVoSVAhXfjkP6ZOaLrfHAg32jH6hqZP4Ld/s0toXsX92rY8K854L1jI6vpIhHCRvtaD+PHvNdXzFkBfkCAlRl/YoP6jtk/J7wpduX1lYpXltXyeaWvNr5C7wcJwZ+7GzZtORZWczz23GACUJqV3Qna2zrUdGIictp3xhexXRXHPxqEgdA+z3n96e9/0ktOpWfRnF46rehVXBHKo9WTJeLkBYNcAQsjGvNTbww+2txSHqsvUHQNb1JZVSd4ceInKkoRzvoUtu8SXPA0oH8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(66946007)(122000001)(86362001)(38100700002)(38070700005)(4326008)(83380400001)(52536014)(33656002)(66476007)(85182001)(66556008)(71200400001)(64756008)(66446008)(8676002)(8936002)(966005)(316002)(55016003)(5660300002)(53546011)(41300700001)(6506007)(478600001)(82960400001)(9686003)(7696005)(26005)(2906002)(6916009)(76116006)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?elVqQ2o1MFRLN0JpWUdsM2Nsa0FJc1JDaUpGY1o5Qzh1eDNmUnE0TEFTTVkw?=
 =?utf-8?B?d3JUWTdqald3Vmx0RFYrQXFsRzA4aEdpcHNZcUtuemVFb0Vmb3V4b2ZGYVl3?=
 =?utf-8?B?bU12U2owUUJzRSt0TDE2Nlo3Y0FkTS9PNjZoVndWZ3ZuMVNFTTAxNzZDRG8y?=
 =?utf-8?B?YmFiV24wM1JienhnUjFuZWNENzBCb0Z5RW5ER2dxbTZzOEdrSERNZHR3cThu?=
 =?utf-8?B?YmJkeDM4aTc1V3F6VWx2aHNNUFJjQ2NHNDIyOXdpOEVrU0pTRjRnbmdvSnpv?=
 =?utf-8?B?UnRwNERvZGp1QVNEbSt5bUpYL0dIQmpkMk1EWU5NbEpqQUYvVHlNcVRidU1u?=
 =?utf-8?B?YVB5VWNmcEVXTHZhc3VOYlpjN3NpM3NVc3ZiNG9kS1lYQ3d5RC9tZ05iejNC?=
 =?utf-8?B?bVREeWFzd25kRk5walNTVEJLdXA1TWJqemdoaDEwdHYwNFFZeFJnSEFKK3JO?=
 =?utf-8?B?K2VUVGNXdGY3Z0FNK1RYYTU1My95UlMxc2lJTENSRDdHdk9kaEc1ZThlTm5H?=
 =?utf-8?B?c1gxN1UyMndLTSt3bDREU3k0ZkNFZ0xMQ1piY0RZM2NOaUZIREdLVzJIZ1BG?=
 =?utf-8?B?L1pMR3BLVnRpWFIzU3FNcnZadHBnVkxuaXIzakU3U2dFZW9od3owY2VHT3lh?=
 =?utf-8?B?QlZkbmVmT2RPRFNEcG51anBnb1RBMFhGV3BSTW9YdGdhMmcvUHd2WU5vZ2lW?=
 =?utf-8?B?aFlZVm5YU0JLWTJkTEg1T2FJL0kyektWL1FCdVlzcThiYjNkdW9ldnJxWHN3?=
 =?utf-8?B?N0RZOWVRZDBWRGErZ1dDcnNVV2xVc3h2by9NWjdnTHkwamJKSVZjR0ZwbGV2?=
 =?utf-8?B?RmJsbU05LzJWQURpdnJBVkM4ZXV6UFJTSS8vRCtOQTBISlBzSmxQQStVVTQ3?=
 =?utf-8?B?alhhT2l1Umk1SXNON0RtT0l1TTN6akJEOTI3WGhyYllDS0tJVUtUQXl6RTJr?=
 =?utf-8?B?eG1YT2FtS3pkUW5UbjJNUWp6aWZITGZCdXVRYTFQMU5vbEtza1BVb21CV2RK?=
 =?utf-8?B?amRKSytJTDZ5Z0pxNjdZZUpya1JWdVdCcVlXSlp1T2gzV29uN1RsVlJMamRW?=
 =?utf-8?B?ZitEUW9MUGlWZGEwV1R6SGpjcHY2dW9hWDRBY05KY1VpZnNiQ1pTRkFIbEh1?=
 =?utf-8?B?RmdRdWRDRENEOVRweWxqOWVyYTRKSnUrTnVUakREVHJyUDU4RmpEK0ZzUkl0?=
 =?utf-8?B?eG9leTZUL0puYXF0c015ZFFpQnNmUzAvYmx2QS9xS0daVnRadHhRdlFMNjF6?=
 =?utf-8?B?TFhOcE13d01kbHBMbElUOUlUd00weDhINXhOc0U1ZDVHMnRPWW02cXlGVk5B?=
 =?utf-8?B?K2RKQkYwaWdLQTZxVzFpbC9McDRxQzVhK1RxOEVRbnNxRXBSazNBQllGYnhh?=
 =?utf-8?B?TmRwTXI2VnlnaWYyMkN4dWxaTGxHL05haW9taHlCS2VuNjZJQ1M0eDgrb0hn?=
 =?utf-8?B?bktQRkNRWWJiN3Q1amVHSzhQMzNxZUhSVXBJUTZ1N08vc2JmNDErU01TSzZz?=
 =?utf-8?B?L3EydnIzMUxhZ0htYXJ1YWFETHZSemJDcGdkSVVvREZSdmVEU0xrWEdXbFQ0?=
 =?utf-8?B?cHQ3dGlBQ0MrSFJmRE9JVVZBY0Nqbi9VQ1hUV2pzTGxueURRazdMVTR6RThm?=
 =?utf-8?B?cGQ2VVJXRWphNkRjR0hEVVoyK05GRlBDTC9Pb3I1WTFsZFZXSXcyMlRrZ2Nv?=
 =?utf-8?B?blNYaVR0YkV1ditpaXF3Z0JUb1hEYnpqUWFPNE0vVnJEQ0JKYkxxNE95UW5a?=
 =?utf-8?B?NXBhRlVKNi9GVmlNYU1YWUdyZ1VBTzVHa1JiNnVpd0E0dmd6bTZlZk9MZGVm?=
 =?utf-8?B?ZlI4S2JSNlpsNGQ1cmN4d0ZrL0dTTHduNS9USEt0cW9sK0xDd0IxcVEwVjVY?=
 =?utf-8?B?aTQvZ3dMTGt2dm1WT09VVGhlZTl3aGtuTDNua3JkZ3JEc0dwK1FXaEdhbWhu?=
 =?utf-8?B?L3dVSU1LSUYwcUdFSW9OWjJYYzVzTlhPOXl1MExCYm10WGlVc3RTaTdhZTlj?=
 =?utf-8?B?UTk0N25qaUpseUFvR1F1WFVVRlR0dUI5ZjJJSDNxRGJnMStVL0ZVSGtMbnlK?=
 =?utf-8?B?WmF1WlEyTnlsY25GTzE2eVE4cDdKSyt6TEpHajhEZW1RY2kzaklHaVBacFNs?=
 =?utf-8?Q?TVqI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8603ecfa-a6cb-4421-3c6c-08da63e696d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 09:12:04.9840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 xT8aYlUrPuLvLYnJ1XYd2VCI6T4638fu1t+ZGaRMfyGn1aPVzn+8hjnJ47CGLCtAy0vLv8NcNQCQztL2LHz5FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4833
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Jul 2022 09:12:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97814

SSBqdXN0IGNvbmZpcm1lZCB0aGF0IDAuMjEgaXMgc3RpbGwgYSBiZXRhIHZlcnNpb24uIA0KSSB3
aWxsIHNvbHZlIHRoaXMgcHJvYmxlbSB0b2dldGhlciBhZnRlciB0aGUgc3RhYmxlIHZlcnNpb24g
aXMgcmVsZWFzZWQuDQoNCsKgIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRldmVsb3BtZW50
IERlcHQuSQ0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihG
TlNUKSBOby4gNiBXZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMOiArODYr
MjUtODY2MzA1NjYtODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0K
TUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQpodHRwOi8vd3d3LmZ1aml0c3UuY29tL2NuL2Zuc3Qv
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRl
dmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgS2hlbSBSYWoNCj4gU2VudDogVHVlc2RheSwg
SnVseSAxMiwgMjAyMiA0OjA1IFBNDQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2Fu
Z215QGZ1aml0c3UuY29tPg0KPiBDYzogb3BlbmVtYmVkZWQtZGV2ZWwgPG9wZW5lbWJlZGRlZC1k
ZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1v
ZV0gW1BBVENIXSBsaWJyYXc6IHVwZ3JhZGUgMC4yMC4yIC0+IDAuMjENCj4gDQo+IGdlZ2wgaXMg
ZmFpbGluZyB3aXRoIHRoaXMgdmVyc2lvbiBvZiBsaWJyYXcNCj4gDQo+IGh0dHBzOi8vZXJyb3Jz
LnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMvNjYwMDk0Lw0KPiANCj4gSSB0aGluayB5
b3UgbmVlZCB0byBmaXggZ2VnbCB3aXRoIHNvbWV0aGluZyBsaWtlIHRoaXMNCj4gDQo+IGh0dHBz
Oi8vZGlzY3Vzcy5waXhscy51cy90L3ByZWxpbWluYXJ5LWxpYnJhdy1zdXBwb3J0LWNhbGwtZm9y
LXRlc3RpbmcvMjc2NzYvMw0KPiANCj4gT24gTW9uLCBKdWwgMTEsIDIwMjIgYXQgOTo0OSBBTSB3
YW5nbXkgPHdhbmdteUBmdWppdHN1LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBMaWNlbnNlLVVwZGF0
ZTogQ29weXJpZ2h0IHllYXIgdXBkYXRlZCB0byAyMDIxLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2xp
YnJhdy97bGlicmF3XzAuMjAuMi5iYiA9PiBsaWJyYXdfMC4yMS5iYn0gICAgICAgICAgICAgICB8
IDQgKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKSAgcmVuYW1lDQo+ID4gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlicmF3L3tsaWJyYXdf
MC4yMC4yLmJiID0+IGxpYnJhd18wLjIxLmJifQ0KPiA+ICg2MyUpDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlicmF3L2xpYnJhd18wLjIwLjIuYmINCj4g
PiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnJhdy9saWJyYXdfMC4yMS5iYg0KPiA+IHNp
bWlsYXJpdHkgaW5kZXggNjMlDQo+ID4gcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLXN1cHBv
cnQvbGlicmF3L2xpYnJhd18wLjIwLjIuYmINCj4gPiByZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVz
LXN1cHBvcnQvbGlicmF3L2xpYnJhd18wLjIxLmJiDQo+ID4gaW5kZXggMTk0MDg2NGEyLi45OTdm
N2FkNDQgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlicmF3L2xp
YnJhd18wLjIwLjIuYmINCj4gPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJyYXcv
bGlicmF3XzAuMjEuYmINCj4gPiBAQCAtMSw5ICsxLDkgQEANCj4gPiAgU1VNTUFSWSA9ICJyYXcg
aW1hZ2UgZGVjb2RlciINCj4gPiAgTElDRU5TRSA9ICJMR1BMLTIuMS1vbmx5IHwgQ0RETC0xLjAi
DQo+ID4gLUxJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0NPUFlSSUdIVDttZDU9NzRjOWRm
ZmRjNDI4MDVmOWMwZGUyZjk3ZGY2MDMxZmMiDQo+ID4gK0xJQ19GSUxFU19DSEtTVU0gPQ0KPiAi
ZmlsZTovL0NPUFlSSUdIVDttZDU9MTUwMWFlMGFhM2M4NTQ0ZTYzZjA4ZDZmN2JmODhhNmYiDQo+
ID4NCj4gPiAgU1JDX1VSSSA9DQo+ICJnaXQ6Ly9naXRodWIuY29tL0xpYlJhdy9MaWJSYXcuZ2l0
O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiDQo+ID4gLVNSQ1JFViA9ICIwMjA5YjZhMmNh
ZWMxODllNmQxYTliMjFjMTBlOWU0OWY0NmU1YTkyIg0KPiA+ICtTUkNSRVYgPSAiOWI5NDZkOTRi
ZDY1ZDc0NDUzODkyNmMyYjEyOTU3ODY0ZTE4N2I5YiINCj4gPiAgUyA9ICIke1dPUktESVJ9L2dp
dCINCj4gPg0KPiA+ICBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcNCj4gPiAtLQ0KPiA+IDIu
MjUuMQ0KPiA+DQo+ID4NCj4gPg0KPiA+DQo=

