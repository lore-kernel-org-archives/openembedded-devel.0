Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B877CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 06:52:08 +0000 (UTC)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com [68.232.159.76])
 by mx.groups.io with SMTP id smtpd.web11.21567.1697698317690122848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 23:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=Bc4qbcDd;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.76, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1697698317; x=1729234317;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MQ9kLF+Dqdi2BrwCMUwaRrQiZIJsn2oIzPByoRMfMZk=;
  b=Bc4qbcDdgXezJciSCD0iNaob0Pq5Am1BXJp7CJXb2KLEM0NnItdHl63j
   MPdFm8tBpLgT1xCkeS7T+lIm4ihuPtJRi4NvhFY/m6kBGToGXC0G735qT
   +HqAAhx/RQ4cw/iquJJCzMKUARusqbLJ3ObPNhL77/TY26oF2uTKzxTnY
   YueGH/3kpN2iomyHYn5ObDnZelbQctoH0P8AQfcZ7kz3mqzMjANyoyS7+
   TRjDBPrP8ClBcbfjLBTvpla/c1JXZfXGMy/Or8mV001yUVX1lHtZ7vZfy
   jef9qnDklXRt5ZQ/JqHOm027rtOd4GQ13wrpTrpquuS4qxFh6grnUBH+c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="100119544"
X-IronPort-AV: E=Sophos;i="6.03,236,1694703600"; 
   d="scan'208";a="100119544"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 15:51:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fs1MXSxyunYBSOgoj+Zhctb2o78YNJWj8IGa8Cxg9wVv0M4Kyuh0tMX0DLq9M4FtS+OkRzMytuvkscLgMAV209h53I0TXq795yeHdCc/OtJYSTYvcNLG0ON8BfTokxLgTzrq6k4vXDKngAlirGuMn1akTFWWPWe631B8sHeLkO9ER+dmNsGwtTrHUsW/lG9NzMWrkbZmQWS1E/ek0xvGV0zdXrZ+Qd4p40unvVtYUpbPcMYWaQ4w9cYZIyXmBAyjfWJWM+9a6x7ibrN/2YrJKS1UM1OJTOwGs7FiE0tYCjKnsOjUaNdk07JYc14tUUNFuUbeHUjLULuAimPYuzKBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ9kLF+Dqdi2BrwCMUwaRrQiZIJsn2oIzPByoRMfMZk=;
 b=ghL+0OmlxMOeOYblZN04t8AgAd/pVScQgI68QpxjkwQwvJR+qlGo3/1XVO8OoY+yAU0mpyUFRR07BrRJ2BGUsbB19gxa0ChPgaSw1Qu636lId+gmHOsO9YASnJkBgk4ynEdcVHyjpcpgDVvVdb96BmgdDrKbRTGCYrSOgrQ6dUili8EwgY0sKggBzgSue93Vb6ssn7GCPvNiLBSgOT6qqhAaYCOaqX1gseqModkO6GweNWNXgZUJEr0wG+unc/al6JFXoa7LLpNxm+3ycCJlptBwkI574fQHA1SuT776do2yenqm4/piuv/MKLmgh5cRCqDyxruBJBDUMP1THIXcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by TYCPR01MB8584.jpnprd01.prod.outlook.com (2603:1096:400:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 06:51:52 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::286f:2b02:30a1:e44]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::286f:2b02:30a1:e44%6]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 06:51:51 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: create symlinks from
 /usr/ to /.
Thread-Topic: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: create symlinks from
 /usr/ to /.
Thread-Index: AQHaAMrgXUTYe4VH/0y+bWsAqqYi6rBNvWOAgALvFwA=
Date: Thu, 19 Oct 2023 06:51:51 +0000
Message-ID: 
 <OSBPR01MB1845965B443CCECAD4B7B5D5DCD4A@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1697527418-5791-1-git-send-email-wangmy@fujitsu.com>
 <7F1CE9DA-A95C-4079-9436-F8D233A6A116@arm.com>
In-Reply-To: <7F1CE9DA-A95C-4079-9436-F8D233A6A116@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YWRkNGRmODktOTk2NC00YzM2LTg1OTEtNGVhYjZhMWNj?=
 =?utf-8?B?ZjhlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjMtMTAtMTlUMDY6Mzk6MzhaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|TYCPR01MB8584:EE_
x-ms-office365-filtering-correlation-id: 02e9f77f-826a-4ab9-7567-08dbd06fdfe1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hrtt9VcHtpGCHuxm3XujEgPKtqpQtjuM49Zaw+9kVPdDoeqC392y3e2nTdp2GhU1yxTWk6/WjpHwfCC5LPkz48Mwo4WCy/kKo1rSKUfcBPDaOlAU/LYkv+24xTlj/QfNY4r08S85T1N33fUGe3Tp673vIyjxkRicmKvctEt+i/kjqjsySQwJrSLhw4X0R/Yfpnu2BfIOnX/72sI2LP6y/cSZDYWxeURZwjR4HAxT2DzbaUF0nCxDcT24BejJutBR8WoyyuCXdWB46D+sSw02XNOWNZaL2JnJTWt6yyjiwu86rn8LZ/ngnBcPyV25ekSFFkDVUmfdD2BMvm9joQPeXwMy5Wa6jOxYvZ8X0oawla1DqXGognDBRu4VhvFsuT1od4SgAmLXbMjZl8Gdp+mewhNAOWtKkEV9Xhlv3iEzlrL67tfaPzClokJLmmLr9gkMTmJlpVFDdLfTzNuAn77fiFzk3Z7QreUlQWMaN0XiF5cgrhFCcMsiP+QuV2BIiHu/BQCSzMnGfCac9n+mreCPk58VLlI/QL3biXyaFWB1Desg6c1sb+QRKHfO+mDJRMW3pbJ8aifx0ZgeChf9vtD6j/q8B5iwfZ2h48UPIldFxQBrelf6dDKw8z4ZOkx0zPg1ci/Ix58gFtLWHiiut+E65k0ok7SXZKBiEnD5CZkr5kU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(39860400002)(346002)(230922051799003)(186009)(1800799009)(1590799021)(64100799003)(451199024)(83380400001)(122000001)(7696005)(6506007)(71200400001)(38070700005)(53546011)(66446008)(8936002)(966005)(52536014)(478600001)(82960400001)(26005)(76116006)(316002)(66476007)(66946007)(64756008)(4326008)(6916009)(8676002)(66556008)(33656002)(85182001)(86362001)(41300700001)(2906002)(5660300002)(9686003)(38100700002)(55016003)(1580799018)(66899024);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b2tocndQWS8yeHFEdjF6WnE5TDgzOWY3bzh6YnFKQndocEErQ0hwbWdqWUZC?=
 =?utf-8?B?MHpxUnp5dUpESUZ3d3FrQ0pqalpnNnR4WDJzMlNOK29RVUtQNUx3Q2xseDM4?=
 =?utf-8?B?U29WenVrZ1FTM2RlSUw2cEhwRjY0cTNaM1RKRlZFdUlTNDM1VmRLUmdSaDRa?=
 =?utf-8?B?TXNZRFM0WW9NeHppeVJ6STFkV3hmQmtzUWdkS2J5L1ZCWGZERUszLzVnUlc3?=
 =?utf-8?B?UUc0aEdxdXVHSmhPT2xIQTRqeWtkZnEwN3BSTHN5cVg2VW1UNExMWUZxelJF?=
 =?utf-8?B?aExsRmxXT1ZnUXhnQk1udzdJRVBVMklzUUZwaG1IaWtMMDVnRS9jcWNZeFVi?=
 =?utf-8?B?UGx3VmxVak9obEF4MmgzOXpBTXhDckROR1F3L0JpOVg2amFkdnl5eEVmbnBw?=
 =?utf-8?B?NUxYWUw2MFBvaUU0bHNyakd6NElsdjdOeElBZmRiZ3IrRnh5VDR5T0MxTS9U?=
 =?utf-8?B?cjV6S0JnbnlXdWRLbVpuZTQrSUtja3FkVHhTbkdXb0dhS3JNMG5pYkRlV2Yy?=
 =?utf-8?B?REw1eWhHYloxeUFTRnVuTkNvZjZaT0lFdk5BY0g4VkhPU0pFZ3FEMzF5QnE0?=
 =?utf-8?B?VVowMFhiU0ZMVXZxUFNRN2t5SmJWTFI3K3c3TmNodVFZd1oxRTVuK1hxdGtp?=
 =?utf-8?B?bjAyMDVqU3BzeW92a0pFcURmdHNZaHFXMElmZWxseUdHSW1BMUFFVzQ3OUlr?=
 =?utf-8?B?cGFFcWY1UmYvam9jRHpaTllpWlBQQWVzazVMNzA4bkhuMmxNcGRwbXc2dy8v?=
 =?utf-8?B?cEpwS283bnpQdWh4S0JwS0t6Vk9tZGVISXNpNS9yWHBoU0dLYnhqREZtUHZ2?=
 =?utf-8?B?OTk5STN6Mmt3dUg3THZnTHVGVHQvUjZSNW9lQU5lcGdXY25rR0JuZ1lmamRl?=
 =?utf-8?B?SUNOUmp2elU1RXZEdlRaYmVFa0RxS3UrbW1jOUVQWXpHSUtNSTFHeWNLQkI3?=
 =?utf-8?B?ZGQrZzFma3NHR0tYY2JJVVV1QXBNUFNWdk5rRW5EV25FNVlZY0VnL2twUUM3?=
 =?utf-8?B?NGhvbUJSS3p1cWVpL1pNU3VscGZDWFJpVUZPWXdkbWFNbzIwZWhNZW05YUFh?=
 =?utf-8?B?YlcvWXNDQ3dvSWdwWDBjN1RWUXpyemJNY2hiclRMTmdQcmlicDAyTnROSENL?=
 =?utf-8?B?WWJIYi9CTDRsQVRpMHFsakxUcEUxRFVRNkRrazF5UEhwQ0lVS1lkd3o2ekV0?=
 =?utf-8?B?ZDhKODltUGtzU25ITHFxOXJzcWNVSmN2Nm0ydDZOc2FZYmxtT0xrbzhmOGV1?=
 =?utf-8?B?blN1M00rclQ0akZzc3dNbkdTYjJYV2M3T2dLdU5DamlFVlVrQTl1eVAzL1VJ?=
 =?utf-8?B?bE40akhLcjZkT1R5cTd3UVB3OXJyTDJ3Y0d3R2RMR28vL05wZUE5enVzaXF6?=
 =?utf-8?B?Q25rTTZIREhGeDV2bzgxdmcxN2h5UkZ6OEJaY3RkWWlzd2ovdFVJTlZha2pj?=
 =?utf-8?B?SmlrWGNkZlRGcUQrYXNWT2VMRG5Md3dvWW9laU02VS9nVnY0R3F1dVlhSlZB?=
 =?utf-8?B?S1lmRDBxNkxZMXNmQU8wZWl5SURJTVdvZkVVRGJVbVlOUFZudjJJNkZJaHFl?=
 =?utf-8?B?Q0lCUFp4bnBadGFteUFXV1p3VW9Bc3NHaTk1RjU3NDIyVG9IMTMzRjVWbFNr?=
 =?utf-8?B?WlNCQlBGMkIzUTU3bkFib2dOUVJTcStEUktKVG5kalh6K0pzaHRYRm9QMitT?=
 =?utf-8?B?S0JvRHdLckZOQXRpL0YrV2pyRG1iM0dRS3J1MjY4TENjZldKeEVJOGF4NnN0?=
 =?utf-8?B?L2ZxU1BVY2V5WFlHTVVsRUJHbWZuZWRjNHpGbFNmek9RL3haRWtoMWhnRXZK?=
 =?utf-8?B?azVERzRhR3NROWhlK2tTUVpxNWMrUHd3T2NTdmVYdFRsVTZNd0VFRUNaMk5B?=
 =?utf-8?B?YkRpY0ZNdnVPVUhOckgrTlpHSW9HdmtBK0hjelVlbTZlY21Jd2hMZUJhc0tZ?=
 =?utf-8?B?aDN6d0IzME1lYm04Y3F2dW1PTlpINmZSbnBkMm1KUERwd01PeFgxTjRpaHRP?=
 =?utf-8?B?Q1hiQ1VtNXcvTkM2T3lreEZnL2QyeWE4UnZuYktWQ2pvamhtS1dBZURKVlJK?=
 =?utf-8?B?dDU3eVFmWmgxM2wrc1dZQzU5TXRaWTZsaHhCRWdsV096SHNnVHc2SnRxTVpB?=
 =?utf-8?Q?d1z/95IjL1UHwmaOFvpc2LoSw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+cJwSDCUqgKXg6NLx9LAWlErvCyRI0Kr7Q1Q+KdnVls4O1OnYfzPRiCoJ8kniiwWcBORc6GZamHgctYVuOFp3Vc9rnnT+ccmeHnyIHqMp9o8OwcqjGPVTKEuVWPylM4B5oyIZWwsuTD3c7ctdxB3XYIjXvPHc8tOkqFS5BYOcMzaMkfGsuFBxNjDpNYTvJmVGCMhfboTDYVOaL+M1QKQr16cYR9Gv+KAvU9sxa01idtIxH1vhu2O4v4eyYvf2tW/yecrM+LHw/y4o0uMGMeyAJa4Z5mrXm8AeZ9GC1kwSlo4g/8jEdUjjwik+Kwa3sx5VxqgYW86wdPhMSs8+JsaGkLtNsxjil45uS44twHSv+0hl7MEBcAk0rz7K837/UHkk7PVeUZalbGl6jsnPYDyVb5n22kDUSn6FLl4ckG2RX+Y0ZVTmyEx9WYcJTeugFCWMJe8ChEJIUcqqt2nnwWdnT9GTLSV9a1xYQVpl+I2BPCKAxp4rXFYYsoQsEx3vln8tV5I/XHut6O8U0qmu8FbzXyI5ETWK3G34LWd/xPhQwGbJnTaS3QSHHEHZrX8TGrKyG3vDYo0ild/li/EtVBTOTfXaZXS0OnR6/zEARYb2w7AcrR//ku9znjGrK1Y/MKMcRp9GRktc9zvJNRhCyIWvaXxGZWr2ZqC8P3no3c+SbMAQyYpTPXcgjWlbQlJaL0Xxz7rlSjuTwK92JTlPYOphRzdLM1u6kiW+V/o8O/uN8S7WgFUAH6BjWZjrWqmUKUifaDpynWO7arAUcBXm/QzL9wk/yXoPTF5bC8wrWVTtTC4lkLiqJsPUsKtqrlXR0kv
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e9f77f-826a-4ab9-7567-08dbd06fdfe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 06:51:51.8797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KjjAclazrZSNqj27smSS795PXs9sj3eBaJ6rFnAhxUdfsp/o4bLt2miNNc1tBn5nDPofb2COvl+6Bx3dvBSnCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8584
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 06:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105591

PiBJc27igJl0IHRoaXMgd2hhdCBjcmVhdGVfbWVyZ2VkX3Vzcl9zeW1saW5rcyBpbiBpbWFnZS5i
YmNsYXNzIGRvZXM/ICBXaHkgZG9lcw0KPiBhIERORiBwbHVnaW4gbmVlZCB0byBkbyB0aGlzLCBh
bmQgbm90IGFueXRoaW5nIGVsc2U/DQpCZWNhdXNlIGRuZi1wbHVnaW4tdHVpIGlzIHVzZWQgdG8g
Y3JlYXRlZCByb290ZnMgaW4gYW55IG5hdGl2ZXNkayBlbnZpcm9ubWVudC4NCkl0IGlzIG5vdCBp
biBhIGJpdGJha2UgZW52aXJvbm1lbnQsIHNvIGltYWdlLmJiY2xhc3MgY2Fubm90IGJlIHVzZWQu
DQrCoCAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpEZXZlbG9wbWVudCBEZXB0LkkNCk5hbmpp
bmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkgTm8uIDYgV2Vu
emh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTDogKzg2KzI1LTg2NjMwNTY2LTg1
NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBm
dWppdHN1LmNvbQ0KaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9mbnN0Lw0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0u
Y29tPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDE3LCAyMDIzIDU6NTEgUE0NCj4gVG86IFdh
bmcsIE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IENjOiBvcGVuZW1i
ZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBb
bWV0YS1vZV0gW1BBVENIIHYzXSBkbmYtcGx1Z2luLXR1aTogY3JlYXRlIHN5bWxpbmtzIGZyb20g
L3Vzci8NCj4gdG8gLy4NCj4gDQo+IElzbuKAmXQgdGhpcyB3aGF0IGNyZWF0ZV9tZXJnZWRfdXNy
X3N5bWxpbmtzIGluIGltYWdlLmJiY2xhc3MgZG9lcz8gIFdoeSBkb2VzDQo+IGEgRE5GIHBsdWdp
biBuZWVkIHRvIGRvIHRoaXMsIGFuZCBub3QgYW55dGhpbmcgZWxzZT8NCj4gDQo+IFJvc3MNCj4g
DQo+ID4gT24gMTcgT2N0IDIwMjMsIGF0IDA4OjIzLCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gPHdhbmdteT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gPg0KPiA+IEZyb20gUG9reSA0LjMsIGJ5IGRlZmF1bHQsIHVzcm1lcmdlIGhhcyBi
ZWVuIGVuYWJsZWQuDQo+ID4gU29tZSBpbXBvcnRhbnQgYmluYXJpZXMgaGF2ZSBiZWVuIGluc3Rh
bGxlZCB0byAvdXNyL3NiaW4gaW5zdGVhZCBvZg0KPiA+IC9zYmluIHN1Y2ggYXMgaW5pdC4gU28g
aXQgaXMgbmVjZXNzYXJ5IHRvIGNyZWF0ZSBzeW1saW5rcyBmcm9tIC91c3IvDQo+ID4gdG8gLywg
c3VjaCBhcyAvdXNyL3NiaW4gdG8gL3NiaW4sIC91c3IvYmluIHRvIC9iaW4uDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0K
PiA+IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9kbmYtcGx1Z2luLXR1
aV9naXQuYmIgfCAyICstDQo+ID4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9tZXRhLW9lL3JlY2lwZXMtZGV2
dG9vbHMvZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi10dWlfZ2l0LmJiDQo+ID4gYi9tZXRhLW9l
L3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi10dWlfZ2l0LmJiDQo+
ID4gaW5kZXggOTQwMjM5MjJhMi4uMDcwOTAxOTA1NiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLW9l
L3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi10dWlfZ2l0LmJiDQo+
ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVn
aW4tdHVpX2dpdC5iYg0KPiA+IEBAIC00LDcgKzQsNyBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb25s
eSINCj4gPiBMSUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0
ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyINCj4gPg0KPiA+IFNSQ19VUkkgPQ0KPiAiZ2l0Oi8v
Z2l0aHViLmNvbS91YmludXgvZG5mLXBsdWdpbi10dWkuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9j
b2w9aHR0cHMiDQo+ID4gLVNSQ1JFViA9ICI4MzkxN2EzOTM1YWM3Y2UxZDhkOTZlOTE0ZDk2YTY2
NzkzMTlhMzM2Ig0KPiA+ICtTUkNSRVYgPSAiYmFhYzMyMmE4YTZkNTdlNjJjNzAzZjZlZDUyMzE1
MmJhZWMxOGI0ZiINCj4gPiBQViA9ICIxLjMiDQo+ID4NCj4gPiBTUkNfVVJJOmFwcGVuZDpjbGFz
cy10YXJnZXQgPSAiIGZpbGU6Ly9vZS1yZW1vdGUucmVwby5zYW1wbGUiDQo+ID4gLS0NCj4gPiAy
LjM0LjENCj4gPg0KPiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczog
WW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1Jl
cGx5IE9ubGluZSAoIzEwNTU1MCk6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTA1NTUwDQo+ID4gTXV0ZSBUaGlzIFRvcGlj
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTAyMDEzMzc0LzY4NzU4ODgNCj4g
PiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViDQo+ID4gW3Jvc3MuYnVydG9uQGFybS5jb21dDQo+ID4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0KDQo=

