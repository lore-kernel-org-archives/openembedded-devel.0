Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DCCC433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 05:35:23 +0000 (UTC)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com
 [68.232.156.107])
 by mx.groups.io with SMTP id smtpd.web09.8334.1636522521500548355
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 21:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=VvgVVrfd;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.107,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1636522523; x=1668058523;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=/NUYV/o0OGZOwX9ZE+rpjl1DqTT06B0bnDHwCEixX5s=;
  b=VvgVVrfd/3N12T0V0QkPag5y9C0SNqJggc2AiDkSD8PI9tFMw20DbTUf
   mMcPkqkyQdYmyx/YcWU2tiuDru0gYNx4g1gOK5cfoNKIMD1MCqxLrQAPc
   J/ahcBks5b8K3BPwt7eJ1qxNBvpXz5ThIsvSY0eVPaElP43cCsMnCntG7
   e2KRcRlp6bEtZy5TkQQpCYvmKh9mceVY6odV2hnorQrmrCgWRghYrWRv+
   ZooUxkMz0iABTC+HZyj2ZS6OfsRen/pSLWWw1bMHeUElo/A0qbvcA0xo+
   AXLWVc7ZqBUYIh86vsj/csvtxcviYoXfpO7mCCr2AjrpI4GbV0S2woXyB
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="43169329"
X-IronPort-AV: E=Sophos;i="5.87,222,1631545200";
   d="scan'208,217";a="43169329"
Received: from mail-os2jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.53])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 14:35:19 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLE7WYBynQmoP/1AjUokTaxNz84GRSMoTEm9didwyJ/yNUt8G1iyz7lEUTzvxSqnyS7qtn3AWEi+LFVsnrWILUdT7Iar9YZ/fifztXWLfG9DyBQIeD0/2oOWscSouOln772mGWACqdb6WMOVacmTPCd9oKvg0FeQJdVTzRhOl2uVNBOK0XOm0eXBWYJmY5i9xGe/IugTDiBHtsoeBivDAxMb0gGKPkuSinNJbiiivNRRmvU9J0qJ8l7q4LNbEF4cuzKLWl4wyAceGkpk4KJpvi4D0HQSPMgPvwO8jg2I/B/VTHVqSYDhVudGIIab+MNgS7QMZSHAgnJAeR/5LaGRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0Ye8riUawKfSPg/UmW61dZWlHrBd07xA9iFtX85+P8=;
 b=dy/hRLbnS9EbhrMolZB8yObUMvIY9oRQBt+EUA+l0t0dyBN1lgoNCjc6vkT77swXWTtYaRcEDLIUhrhAMEyT2yZUYHKd9jpPckS83frMRpFBYCOTw7umoAG/WiixyW5J062x1hyYzJasHqHamfhB6jlEilAs0o1V8TQUICZCYdnQ16mro7xWJRw1Y0LpzeBi0Qg047AHt5CPD3B7mFYjpJUv/BBQLDauvoxzVxxgzRor/Yj62o4MOfBPCJ8n8kS310kTRCs+4PN3/8hIvY0zK/uACkjRDhvbRzt+E0klk3O6Sa3BgdQ0hLAGHanqMJIDD2oT1w1PnxnOfBsfYnMzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0Ye8riUawKfSPg/UmW61dZWlHrBd07xA9iFtX85+P8=;
 b=QbF16LifcHynKB1nDAAu7c8SWjxuucVBnSoz4tE5AF4ZNE8TH5zTMaZtXu81AAyFTp387Nx8mh0OLC1meUwG8X9/e291BfU6/ma4xbye+LsN2iXtMW+arD2Chcyx4JyqvOkQ93v9xVYIhCBO4iBhTQeiPPnpaLzC/YOz76UDMIM=
Received: from TYYPR01MB7904.jpnprd01.prod.outlook.com (2603:1096:400:fc::6)
 by TYWPR01MB8674.jpnprd01.prod.outlook.com (2603:1096:400:13d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 10 Nov
 2021 05:35:15 +0000
Received: from TYYPR01MB7904.jpnprd01.prod.outlook.com
 ([fe80::f927:13c8:86db:ba40]) by TYYPR01MB7904.jpnprd01.prod.outlook.com
 ([fe80::f927:13c8:86db:ba40%4]) with mapi id 15.20.4649.018; Wed, 10 Nov 2021
 05:35:15 +0000
From: "xuhuan.fnst@fujitsu.com" <xuhuan.fnst@fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "xuhuan.fnst@fujitsu.com" <xuhuan.fnst@fujitsu.com>
Subject: [oe][meta-python] [PATCH] python3-packaging 21.0 ->21.2
Thread-Topic: [oe][meta-python] [PATCH] python3-packaging 21.0 ->21.2
Thread-Index: AdfV9LfmA6RG84A+QcCubgC9RWpXjg==
Date: Wed, 10 Nov 2021 05:35:14 +0000
Message-ID: 
 <TYYPR01MB7904D22926BDDB5A1E0E58FFE9939@TYYPR01MB7904.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5c62612-051d-45b3-7cdd-08d9a40bdfb0
x-ms-traffictypediagnostic: TYWPR01MB8674:
x-microsoft-antispam-prvs: 
 <TYWPR01MB86740ACAD59726B6997F6CCBE9939@TYWPR01MB8674.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:421;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YJew9UC00y6OOugEQxBxKn3Hd4hMp6y4951eNPTENenczXCYk5+58tN4tNIoOPOIqNnz6/QccalI8xNsRvjAy5OJNkOD385/dnScs1KnasjlGyvA2AroKE31I4uCW6IKyy9mlwOMfOASS7P/DgVCnAIfdqDp6wrFRd1zIpkNlJ/j3EpK2xMRCWoKjsJtoGdksD/Ut+WrxIKVFNr5Y/OGiXUsi7U6P9MGrZQdXcaCKYgARI+6ZwY5tQaHePQPcKTKUJgTh3KWJOj2mi05BhYDUWSw7T2+bN0hwlHW4NfQ5xV8g45L0oZ2kRLxGmQbMhewOrw8YmxPQeYe/Sgpr7K1Hc/ORZwJlSqIfrK66poQXFI+rwQkR9DN9AMVnbNwsIuXT7fXvqGksiWiJgDwP4p0QC1AJ4a5JHRBxFRGLv5prHIMpwLaQme6Qm09EJqiZLxbR2JpfnWDCc4s7WXanWE4UnK75o+bI8vIiKf4H72Vj1hWmkTTzGdb1AezhxnzJggD+n6mZLxt1ZvO3D5AI1siu0SBVjlqdt981Q6QZC2RyiuVmmaI58TLmyLNnL94zb0gKl/FJNF5wsshbzaEHcJ25LJa43FSkLcW0zI6QuMMOdk0DtdDs/5T19lPKfQ8S+ibKJ1qRDBCY0V6BopImg5VsMDY/WGoBH1nOCP/Xwr1FTcwiRXyeqb/cr09uxP9TvVtvhDQXStO0IPxgpLqqYV9w68AwFOEMImiN0rAA6FXeSNKOK0FYzvFrB/9CQGWHgqpYPxw9rp99nzdUQt1HKXkRWRFusP2eYWGeWsmTNPbVk0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7904.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(66946007)(52536014)(64756008)(76116006)(66556008)(38100700002)(38070700005)(8676002)(6916009)(86362001)(66446008)(82960400001)(66476007)(316002)(71200400001)(166002)(122000001)(4326008)(83380400001)(5660300002)(26005)(55016002)(33656002)(9686003)(85182001)(2906002)(7696005)(186003)(8936002)(107886003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?bFF1cUJRc3dZS1dvWlF0cVh0RlBsT0JnVnJxbEYrbk5KWXRreTRmWHoxNHdq?=
 =?gb2312?B?cVVBQy9kcCs2M0RrbVhkZ21uc3VxVVZLSjVNajM3ZlFLZlBvTk0wYWJsQVIy?=
 =?gb2312?B?UHJtZVA4UGp3dzFGZjVxSzlQaTdoZmZBWEo1KytuZy9hRTFKYmtLeUc3NU01?=
 =?gb2312?B?U1BHeHdzdnRGRGkxeS9kRFNqZ2JiZGxKWTVSKzVUN1N5NDFSYkZnYjNPYlZ1?=
 =?gb2312?B?cFV0NlpxZGpPRWRZa3cweGo4OFdsd1pEcGNIaWMxM3pVRWh3WFdOTGdXeHNj?=
 =?gb2312?B?Q2RTV1JoY0tOblRXWDRxbkRaZWJDcGtvWitvd3N3ZEdtNW5qWGFyM1UvaDBa?=
 =?gb2312?B?VXZPUmczTzQxQ0FCMnJCRklkV3MyMjJEaGY0a2grb2g3K3YyZWdaVGUwTm9v?=
 =?gb2312?B?Rlg2ZGFSUWVpUDkzOGx5MVVPRC91d0FMdFVTSG0xVndQUVRMRHhXQ2g5L2ZO?=
 =?gb2312?B?T28reThaU1p3cTBFVHk5ZVR3UE9CS3BPbHYvL29kdTJTNXA4ZVg3cy92Qits?=
 =?gb2312?B?cnRmcFk4SkFUeThqd0lybmg0RGQyM0k0UXlHc1JtdHc5ZjFEcC85RytabUxS?=
 =?gb2312?B?TFlBUmFnenRRZVlDYWZoVVVYQU8yeWd1S3pZbC9pb1NpdkJFeDYyZDNlSVRl?=
 =?gb2312?B?TXM4em9EblhEQ3JSckFqemRQWFVMOURObE5zczhXT3hvZEZKbDl2a0tnbEh0?=
 =?gb2312?B?Y3JJT0hRNWtjYlB0aVVxR2w2SWZ2VkFBQ0hmTjJKbFhRMHYzWWJSRGVtZUFo?=
 =?gb2312?B?blVlaVUyWDJvOVlIN2JUR2ZIcGt3ZjRINkRYbGtBeXk5cDN5OXYwbGx5cXBZ?=
 =?gb2312?B?VkNvcG8rWDVzN1M3QzRyTUk3ak5pTm9IOUdlcWlUMEljeE1qcXBPSnczSXh3?=
 =?gb2312?B?S2xCWVUrYmorZWpubXpITi9oRG41cld1K0dtZ3YxR29xeVhiSU9ZM1V1QTVX?=
 =?gb2312?B?TmNubHlJeC9qUjhmYU5pODg2aDU5NGJqaDBlNllqSjAzRTdpaUcrMWFGbkJz?=
 =?gb2312?B?a3FnZ2hVMGVKV1BsZzhrZ0Q5ck1LSzJWamhBcEc4MFBtaHJWZGxJaDk0bnFR?=
 =?gb2312?B?REcreDRxRHc3R3VrVzVYMG5HdzgyUUZONm92aFlqdzFsMTljSUcrWmk2b3d3?=
 =?gb2312?B?WWN5WGI1NTljeUpwVjZtdXB1L2h4Yk85R21jRktVYzErWjZqZmgrU1VWbnpU?=
 =?gb2312?B?bFZtRWgySnk1cjYrR0ZJRkJPU2wvUjB4V0xaVjVhR0NKcHU3bE5UU3ovd2Fs?=
 =?gb2312?B?Q2hmOVVVTmZaa0RReHZOMUc3MDVDUCtrWEZ0czFqRmp5NjhOVVlxWmxNTUFC?=
 =?gb2312?B?QkdVcnd2WlhrbDgzdDlDRi9TWkZ4ejFrd0tFN3JYbWpFVVVNa1lSUjBJWnNQ?=
 =?gb2312?B?cDBMcVE1WEFXQVNMWjZ6Vmd0bHptS2crdkxyWDdDU2tHb0tmd1E3UVh3cWNz?=
 =?gb2312?B?NFFTZ1B4TWRURUEySnc2NlJnMzIzbWJ6WkZ2OXlIYW5HT3lZOXdTS0Y2bHVi?=
 =?gb2312?B?dmYzTTFmeGFQcmlTaTROUFlweDFnM2phRitCOGhLK0lRL2RhbGc1NTJYQXht?=
 =?gb2312?B?V3VkRTc2QnFHc2Q3WXMwVUxqbHYvWnRjUFhwVm1aS0FaMlFGbWpvYjdPcWdq?=
 =?gb2312?B?ZSs1d2pZSndWMG1ZajZ3blJzSWZkKzkvUmdpZXJmTEMrdSszNFJXVysrd3VJ?=
 =?gb2312?B?SXE0RXZDMmZWcE1wSEY2R3VFeVlKWWExK0cvcUo2OFYwMlNWOURIc0taYVVZ?=
 =?gb2312?B?bVlQT1IvQWx0SFBSaHBhd1FDQ0tXMVd5VjRwRWVVb2s1dytxR3pxWi9Kajdt?=
 =?gb2312?B?YmdSOENMUFVQOE0xNTg2d2QxOTBmcjdjaisyRkhrbHpyRXUybmlDK1plZTJB?=
 =?gb2312?B?YUZQSldoVHpENHZTK1ROZ2FwNXhlQnYxVlUrb09kUEJ2MGJpYkd6RUVjM05D?=
 =?gb2312?B?SG9KYkZsRWRRa0l1MjFvSW1BcFFTMWgrV0NwNzh4Yk9YTjRmUDEycjlNWUpJ?=
 =?gb2312?B?cGRURGg0TVNuMk1ueVRZb3M0TzN1S2VrMndLclhSeFdpcXpFdDZFTzVHMjhS?=
 =?gb2312?B?N05PZEI0WkZPcEZnMTRxWks4VWtZa1BPaWN3c2xVYW1ZSjlXYjNhZ2ZCUU9m?=
 =?gb2312?B?UlhBS3ZXZGtheHh0NkM4ZFQzOFVZWlI3VXFOdTVLSDlwazE3SUsyVWRVV3Br?=
 =?gb2312?Q?50BmhILYFjYRyagX2vuch2s=3D?=
Content-Type: multipart/alternative;
	boundary="_000_TYYPR01MB7904D22926BDDB5A1E0E58FFE9939TYYPR01MB7904jpnp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7904.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e5c62612-051d-45b3-7cdd-08d9a40bdfb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 05:35:15.3260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 fWjTW57R7/fiwU2I67Wh4fwQd99q+0KSz7poGuOPFv1XMvbzwD+PspW/s6IO0h8zTHUpvpON8INAZbwxwh6GfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8674
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 05:35:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93901

--_000_TYYPR01MB7904D22926BDDB5A1E0E58FFE9939TYYPR01MB7904jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogWHUgaHVhbiA8eHVodWFuQGZ1aml0c3UuY29tPG1haWx0bzp4dWh1YW5A
ZnVqaXRzdS5jb20+Pg0KLS0tDQouLi4ve3B5dGhvbjMtcGFja2FnaW5nXzIxLjAuYmIgPT4gcHl0
aG9uMy1wYWNrYWdpbmdfMjEuMi5iYn0gICAgfCAyICstDQoxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCnJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3tweXRob24zLXBhY2thZ2luZ18yMS4wLmJiID0+IHB5dGhvbjMtcGFja2FnaW5nXzIxLjIu
YmJ9ICg4MCUpDQoNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcGFja2FnaW5nXzIxLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcGFja2FnaW5nXzIxLjIuYmINCnNpbWlsYXJpdHkgaW5kZXggODAlDQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2FnaW5nXzIxLjAuYmIN
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2FnaW5n
XzIxLjIuYmINCmluZGV4IGYyMGY4ODg2YTQuLjE1ZDVlNmU5MGIgMTAwNjQ0DQotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2FnaW5nXzIxLjAuYmINCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjEuMi5iYg0K
QEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3BhY2th
Z2luZyINCkxJQ0VOU0UgPSAiQXBhY2hlLTIuMCB8IEJTRC0yLUNsYXVzZSINCkxJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWZhYWRhZWRjYTkyNTFhOTBiMjA1YzkxNjc1Nzhj
ZTkxIg0KDQotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdkYzk2MjY5ZjUzYTRjY2VjNWMwNjcwOTQw
YTQyODExMDZkZDBiYjM0M2Y0N2I3NDcxZjc3OWRmNDljMmZiZTciDQorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjA5NmQ2ODlkNzhjYTY5MGU0Y2Q4YTg5NTY4YmEwNmQwN2NhMDk3ZTMzMDZhNDM4MTYz
NTA3M2NhOTE0Nzk5NjYiDQoNCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMNCg0KLS0NCjIuMjUu
MQ0KDQo=

--_000_TYYPR01MB7904D22926BDDB5A1E0E58FFE9939TYYPR01MB7904jpnp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=B5=C8=CF=DF;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:=B5=C8=CF=DF;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Signed-off-by: Xu huan &lt;<a h=
ref=3D"mailto:xuhuan@fujitsu.com">xuhuan@fujitsu.com</a>&gt;<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">---<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">.../{python3-packaging_21.0.bb =
=3D&gt; python3-packaging_21.2.bb}&nbsp;&nbsp;&nbsp; | 2 +-<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">1 file changed, 1 insertion(+),=
 1 deletion(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rename meta/recipes-devtools/py=
thon/{python3-packaging_21.0.bb =3D&gt; python3-packaging_21.2.bb} (80%)<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/meta/recipes-devto=
ols/python/python3-packaging_21.0.bb b/meta/recipes-devtools/python/python3=
-packaging_21.2.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">similarity index 80%<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rename from meta/recipes-devtoo=
ls/python/python3-packaging_21.0.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rename to meta/recipes-devtools=
/python/python3-packaging_21.2.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index f20f8886a4..15d5e6e90b 10=
0644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/meta/recipes-devtools/pyt=
hon/python3-packaging_21.0.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+++ b/meta/recipes-devtools/pyt=
hon/python3-packaging_21.2.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -3,7 +3,7 @@ HOMEPAGE =3D &q=
uot;<a href=3D"https://github.com/pypa/packaging">https://github.com/pypa/p=
ackaging</a>&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">LICENSE =3D &quot;Apache-2.0 | =
BSD-2-Clause&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">LIC_FILES_CHKSUM =3D &quot;<a h=
ref=3D"file://LICENSE;md5=3Dfaadaedca9251a90b205c9167578ce91">file://LICENS=
E;md5=3Dfaadaedca9251a90b205c9167578ce91</a>&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-SRC_URI[sha256sum] =3D &quot;7=
dc96269f53a4ccec5c0670940a4281106dd0bb343f47b7471f779df49c2fbe7&quot;<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+SRC_URI[sha256sum] =3D &quot;0=
96d689d78ca690e4cd8a89568ba06d07ca097e3306a4381635073ca91479966&quot;<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;inherit pypi setuptools3<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-- <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">2.25.1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TYYPR01MB7904D22926BDDB5A1E0E58FFE9939TYYPR01MB7904jpnp_--

