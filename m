Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593AAFB3CE8
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 09:20:07 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47045.1774862395594412807
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 02:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=YV/35yhp;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.12, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTZxVfhgqHPr8F7tn+anSBxTdnVfMtkrcWB32PE2YzQV013iYIOWvTn6H22+bMOlZ6jVuFT78cEuED8qw+Y4xcpIUA6k7mMhxtvTr/gp/VpRCWBJUaU7pgV9NywUXly39/3kRcK8kYcktWOGBSp5aZEoCF4iAgNkAcFR3JTW49M9417S/rXqJOTCr5KhscraPMx0lidSuT6YbMuhraXLPXzR5z52fjWj99Kwb7rTHTU5Bhjv41alM9LN5Z+eyDysEzFag4m4/oxTb/3AQHjZvxjvQdhJr0mipk2Dsmxs37vMiZypJoXzCllEmUQWjOit42CVS9b3ZlYBp7MIKqqiCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6uoXuIGMa488COdESgdUXghkZJWxHz+UIU96BIJCec=;
 b=puNPXYtjO7wQlazh/BKplMU475DlGrLrAIWOc7zAWnWQL0nH9lyvjPUF5fF6w+JuwYbaCxUq4KxU6FELSmlTDtvJyOAzePhW7Wl0IgAtY6ZdQ3bPj8s/adzjNdeoTti0RRDGK6nym1Nu1+ovY7FSosQvTuJ2G0XocsKNWrufTd8eXavYFc30WtrMI7VgUz/fSBBM6ESc2YaHwKmVZncAnNpmehLMJ+s8dxebS+1T1yQaBUyXnHgUXq/59UzvyuuWdsiRj9JHH1TqUEfX9b6x9LreRPTIGlURsZ7123knKEhoeNwYlZGGlR1BroNC5dN/9tJ/S+TybXEOLIsaFLxrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6uoXuIGMa488COdESgdUXghkZJWxHz+UIU96BIJCec=;
 b=YV/35yhpj4zTF0C+M1quCiCL0Cn19APCJtED9yC5DJAtZaFgUEdUMG2zF5ciVvUOzHedFo7xCr9Wk2ZvmnSLYXyP2MHreeLq3KaBiEj1Qn5FpvB5aXjBctgCd/7AE40CpTO5im+ReMXrDd2IgroTwFU9zlQWjmPUHaHMG3DqP/k3gWOBRnOTW3gUtN61V+ORjkY1UMWdoc9MfBp2z49NA6vnGNTRRGjJzrUB0HBC2EMBTrF80nscSng5fbobteQrCKnk/1BRN9/udIfYr0AreXPpe68if4Vei1f3QXKxgvbBHdAhQ5F7jhPH50NNXv24+tA6iyfAdVCSblpi0W+Bng==
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com (2603:1096:604:386::5)
 by OS7PR01MB14543.jpnprd01.prod.outlook.com (2603:1096:604:38d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 09:19:51 +0000
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97]) by OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 09:19:50 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-python][PATCH] python3-fastapi-cli: upgrade 0.0.20 ->
 0.0.24
Thread-Topic: [oe][meta-python][PATCH] python3-fastapi-cli: upgrade 0.0.20 ->
 0.0.24
Thread-Index: AQHcp8rGauO4uBrZbk+i+oeirnlWIbWo3cuYgB4fTo8=
Date: Mon, 30 Mar 2026 09:19:50 +0000
Message-ID: 
 <OS7PR01MB14444DE10B533691FDE1714589B52A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
References: <20260227092309.1381-1-liuyd.fnst@fujitsu.com>
 <18981023E82CFDB8.1454197@lists.openembedded.org>
 <OS7PR01MB14444F32E377A4873BCE24D999B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS7PR01MB14444F32E377A4873BCE24D999B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-30T09:19:49.737Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14444:EE_|OS7PR01MB14543:EE_
x-ms-office365-filtering-correlation-id: a3ef6e1d-ff9c-4e99-2c38-08de8e3d7f08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021|13003099007|8096899003|1580799027;
x-microsoft-antispam-message-info: 
 w+s5SBMBzMPzXsvP/ewpKxsiutWvzCl1mbSzm9YRmhHM3Kln7x0A2ckd/+in0klsFW2QGDjDLhskntatVf6E19Lf0sofJ5xHyqC0wKg10fi7wak5Q3RHD92caxTuiQgIj6+It79sxSDP1IDQY3kRKkrKjC1WDC+zedEirbRiRCawPAxgYP9bHiKwQ4E4sC0dMTHNDfYQLOM0gmcElJJ6oMKnTCzSTSfRacAbNs/EtxlYjdsU3iDchUgxcutHuQHqmeJ5bsGMdpEE3WIos8JWV6fcme2yMsbVlp3AiyaR6vqwXtOKfM7FnYbQZcADk9PC7lOMXgNB4169PwMEcckF3CzCyqf2XPgHBUlqpqECkcvxpbk1I5QrpII9BStcEsouxFe9Zk3beH/HVAdIvJqxYe5hwBjNyzFZX79f5f6xNsx56IKBTJewVhIVDSPJglTogIs0PzrWXYTvFLB0KC3KUo83SHwj9/ahsWdZlVoKN+SG0G0idRbi4GfuB5jljLm5X4jsprmKkZK2/S34b+TWbKW9X2Fuhcre1tjoAqACOkfziwuqoe5LDYdqRBVkgR+Rjt+V/jBhEaCy1Iz1adWJfipHWWWu3VlWHSWtLt2I6xs3O6cCELxE7olEhRa08rk2y9bJRGWIx5F+FMfdbKFVFVe4FIfzzQfe2c5ry9PoEJH1qB8fVeOFazXS8Xd72c5aqKnXvJGIJ6BK5vShbNCAWGDqnLOzOm1NJbHP7P9sPGFKAPnBzez8QwRizLZ7RCKEjBGlnHmjBrY2D77M/T3Rrg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14444.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021)(13003099007)(8096899003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?cjBPWFo4N2s2YVJQa0FSajcxN29FQUp5MXdsb21EdGdTbGtWWU9ja1I3Undx?=
 =?gb2312?B?RjdnS25odDRkeVZPeDV6T1lQS0NXSGhzNDJ5d0RlRGtNNkkxM2FSRUUxdHg3?=
 =?gb2312?B?Z0pSOG5PWWM1YmdLYkljdkNiS0xVd2lKZ2R1Vkd5eldkNzRoL2tNckJZWGd4?=
 =?gb2312?B?RHRtc2xEakxTb3k1SjlSdldka2Y2SVNpUzhIa1JMUlVjUXowNHBnaXlkVlJa?=
 =?gb2312?B?aWVKMWE5Z2J1Z04vdXUvYi85TEF6K3JTNUZ0eUlacU8yNmprVEt2Y212akwz?=
 =?gb2312?B?RmFmWEtTdHFKS0JDN21LTFdmMmxFUERZS0RjNmMyVFRtQmJ4WWZma3dEUUlJ?=
 =?gb2312?B?cWJpZnNuckh0aW9qVDVPZlJ6QmhDVklNOTJGaHJOZlBQR0o3Kzc2UFRBUGZi?=
 =?gb2312?B?Wm40cnRiaElOK3lpSjJ5VHB2Sm9ITkkzV25TTHRRdmJNVlhhY3JkZ2hVWFJD?=
 =?gb2312?B?ZXJ3NXhxYngyMzFpbXo0UTFBbE50WHhGbFN4YzVMNmRybDdTdmZBUm1rNFJu?=
 =?gb2312?B?eGhHQnFQRzg3YXRyb0lHOUJMdy91dlUwUXQyREhSeTJRS3djbXUwaW9RNG5o?=
 =?gb2312?B?MmRuT2pEcUJYQytDOXI5SDlTaVVMbHlXa2M1RGhwM0RSVE8wSXVKemZwYllz?=
 =?gb2312?B?SE9RVkZEV253aVdGeExPWXRCR1dQeFdiYWIyd1FDZkVwbjh5VCtqazJIK2c0?=
 =?gb2312?B?TG9ScnRZQnZhSXhadkx4U2ozWVkvSWJTQm5lUk9lbGorRXZQaERCeStaT2NX?=
 =?gb2312?B?TmUvMjFYYVcyUU1FcXo1dFVsdTBTdnlSUWUyL3g2RDZVMEs3Y1djVFpGclMr?=
 =?gb2312?B?eEo2S1NLc0pIeGJ1OWNrbVZZUGFzQlEvUkJiYUM5UE1LQ2kvcXdMdTBkcVBW?=
 =?gb2312?B?TDJyeW5KMjRaS1lrVnpOOWRFLzMxTXBWc2VwWjlrbzZpelJ4Uks1M0F5QnNP?=
 =?gb2312?B?L0d5UEcwRFVSdnBRaEJNQWpRVXBNUVhVODQwSWRoSUJmMmFHZ3NtL05GcFd6?=
 =?gb2312?B?RVVUbml4RWE3M3JiOWtRVVdTclVsMGNzaitZaWRnc256UGVubmVhVk15Rk9t?=
 =?gb2312?B?TW5MamNUTitMS2xoWi9ScmtWT3ljMktsUy81UVY2Y20xanZDQU9QNnZFSitV?=
 =?gb2312?B?MWdRU1ZCeWovUGIyOXUrUGZkcXdHUFlXSzZjeHZpa2VRSGdvTmhqSWtLRzY0?=
 =?gb2312?B?YlZnTlpHd1NKTVRueU1kcE5UajNRTXVlVTB3WEZmODRlWlNQQVJ6N3pkV1hv?=
 =?gb2312?B?YXMrZlViWnByQVN2Slk0dWNZaTRLM2FqdHNDSm1wckI2ci80WnJzY2xMWlJi?=
 =?gb2312?B?dzdVc0NzYlRVWUl3bkFnOENhbDVzZy9HeTZkdHloVDlSd24xMit0NFpQYWVv?=
 =?gb2312?B?Ynl1ZUpYNCtCaFNXbHo0TmtrRk85TFowSnd0VWNGYWNNRjRkaXk0dWsrWU10?=
 =?gb2312?B?Mytta210ZmhWOExzUUlQVjBXWkJoS3huZmh2cGVKbENFRllUYklRVHRHR3lr?=
 =?gb2312?B?Yk1nS0JPMExZMkJNQXFvL1BtUUwwOHFKTUxGRnJhcnNoWGZ0cS93UDlOclQx?=
 =?gb2312?B?NWdGSHF1RXBPRVNvZVNBTjFCcW9LUkxZeU13eTNPTGgxRk9QVS9HM2xSVWNR?=
 =?gb2312?B?M1NneFhrRnNPb1VCVUk0amYvWWV0Yksxb0Mzb3BYMzJRNWJrQkNYcEFWemp3?=
 =?gb2312?B?elovdGRZa1l4NE5DT1lZdEJRenloTHZJKzlyTW9QMjB4MHZsSVV1c2dIRmRz?=
 =?gb2312?B?YlVtV2lyaHAzc1FqdVdkQnNnd1RpM3pZNlk1UFJvNmtaY3NYQndEYlZ0VFVh?=
 =?gb2312?B?TlNXTzAraFI3eUdGdzlGbzFUb1ZRVzlQTkdQbDk0SHJwZXVRODFVbU9OUmo4?=
 =?gb2312?B?TUMvbzR0bmZMWjg2UFNuU1BBV2hiUVhPeEdjcnYyTERtdm5RdFVxMllsMndJ?=
 =?gb2312?B?R0RiSEdCVGxwV2gxZ0kyTVBDK1ZyMXVPMFVzMXFOakRkR3F5NEVURllFQ28x?=
 =?gb2312?B?UGV2bFlTbkZ3dkdSMTV4aDgweWNSWWpodmxvSGZzZTJsQ2FLR2pYQ0x6cmVT?=
 =?gb2312?B?K1BIWEJsOXlzVjdDbEZPR3VCWVNUZzVHbEQ4RTFkZlNTN1h3Z3VEV3YxUG15?=
 =?gb2312?B?N1RocGxxZFhFOUVhMnlIa1orSHVaM1hWOEtvK3BYRm5MZERxWHBtbkU2Tmky?=
 =?gb2312?B?WHZpU21wN3pDVDJKQmxWa0x0c1I0bCtSN2FrOXd5TWlZRjRSV1ZsNEtBTXVk?=
 =?gb2312?B?MmZ2b0NWV0dTQ3RrT1VOM1BFLzlMSDQxWjlsTUF4QnhZT3ZGVmVMNXpiM0sx?=
 =?gb2312?B?cFFyb3I3eFQwRndIUlNIajlwVUFzU0hMTnFvcS9iT2FsNmtydUR6QT09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB14444DE10B533691FDE1714589B52AOS7PR01MB14444jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	eWDshdM3gCedCYn5st8ysQnq1bs77QzBNdkKuswx/RSfEA6/cRn/b9gIUtclmcbIkq0x/hKRosIIJkTGNp0HLr2bpCZhFNccQu8ORxRSwYrI9xbypXQWvboTwhsS3M+h8Am5U4YgYK4JpZ+ayJdovasOE3mhGqxAjoYnMJEWCvoUplYG/50tkvmwLkp0ZPAvfTCaZz3/RpMYzjflSEcZXu8kmjTy+NB6vPcTxojoSRyprAWE5qHk6pWFg7ohprrvKcBYwGdhuCubO7guKSkzsysbYT7Qz3MSC7ExRQkV/Zf8VWI9f1ymSV5zV3wp7O+wNdEWVnK38UTbO8zVU0AAag==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14444.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ef6e1d-ff9c-4e99-2c38-08de8e3d7f08
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 09:19:50.8539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xp5OaBkuYxjjx+ni7LTvnP2ti/oCU0NCYAJnU9dI8JFUZW6z9KLgC6Rk1qMzong7FtHeyPtZYFfAFmDVofZu3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14543
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 09:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125843

--_000_OS7PR01MB14444DE10B533691FDE1714589B52AOS7PR01MB14444jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7IyzogTGl1LCBZaWRp
bmcvwfUg0tK2oSA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCreiy83KsbzkOiAyMDI2xOoz1MIx
McjVIDEzOjE5DQrK1bz+yMs6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCtb3zOI6IFJl
OiBbb2VdW21ldGEtcHl0aG9uXVtQQVRDSF0gcHl0aG9uMy1mYXN0YXBpLWNsaTogdXBncmFkZSAw
LjAuMjAgLT4gMC4wLjI0DQoNCnBpbmcNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQq3orz+yMs6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVu
ZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gtPqx7SBZaWRpbmcgTGl1IChG
dWppdHN1KSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bGl1eWQuZm5zdD1mdWppdHN1LmNv
bUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0Kt6LLzcqxvOQ6IDIwMjbE6jLUwjI3yNUgMTc6MjMN
CsrVvP7Iyzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5l
bWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K1vfM4jogW29lXVttZXRhLXB5
dGhvbl1bUEFUQ0hdIHB5dGhvbjMtZmFzdGFwaS1jbGk6IHVwZ3JhZGUgMC4wLjIwIC0+IDAuMC4y
NA0KDQpDaGFuZ2Vsb2cNCiAgaHR0cHM6Ly9naXRodWIuY29tL2Zhc3RhcGkvZmFzdGFwaS1jbGkv
cmVsZWFzZXMvdGFnLzAuMC4yNA0KDQpTaWduZWQtb2ZmLWJ5OiBMaXUgWWlkaW5nIDxsaXV5ZC5m
bnN0QGZ1aml0c3UuY29tPg0KLS0tDQogLi4uaG9uMy1mYXN0YXBpLWNsaV8wLjAuMjAuYmIgPT4g
cHl0aG9uMy1mYXN0YXBpLWNsaV8wLjAuMjQuYmJ9IHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KIHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1mYXN0YXBpLWNsaV8wLjAuMjAuYmIgPT4gcHl0aG9u
My1mYXN0YXBpLWNsaV8wLjAuMjQuYmJ9ICg4MyUpDQoNCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZhc3RhcGktY2xpXzAuMC4yMC5iYiBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmFzdGFwaS1jbGlf
MC4wLjI0LmJiDQpzaW1pbGFyaXR5IGluZGV4IDgzJQ0KcmVuYW1lIGZyb20gbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1mYXN0YXBpLWNsaV8wLjAuMjAuYmINCnJl
bmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZhc3Rh
cGktY2xpXzAuMC4yNC5iYg0KaW5kZXggNzZkZGI0MDliYy4uOTA2MjRiODZhNSAxMDA2NDQNCi0t
LSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmFzdGFwaS1j
bGlfMC4wLjIwLmJiDQorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWZhc3RhcGktY2xpXzAuMC4yNC5iYg0KQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0g
Imh0dHBzOi8vZmFzdGFwaS50aWFuZ29sby5jb20vIg0KIExJQ0VOU0UgPSAiTUlUIg0KIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWUwY2Y4ZDgxMWVhMjA0NjUyOTQwMzcw
N2IyNjZmYjVhIg0KDQotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQxN2MyNjM0ZjdiOTZiNmI1NjBi
YzE2YjAwMzVlZDA0N2Q1MjNjOTEyMDExMzk1ZjQ5ZjAwYTQyMTY5MmJjM2EiDQorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjFhZmM5YzllMjFkN2ViYzhhM2NhNWUzMTc5MGNkOGQ4Mzc3NDJiZTdlNGY4
YjkyMzZlOTljYjM0NTFmMGRlMDAiDQoNCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BkbQ0KDQotLQ0K
Mi40My4wDQoNCg==

--_000_OS7PR01MB14444DE10B533691FDE1714589B52AOS7PR01MB14444jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
ping</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Liu, Yi=
ding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@fujitsu.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA3=D4=C211=C8=D5 13:19<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openembedded-devel@lists.openembedded.org &lt;op=
enembedded-devel@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [oe][meta-python][PATCH] python3-fastapi-cli: upgr=
ade 0.0.20 -&gt; 0.0.24</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
ping</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> opene=
mbedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.openembed=
ded.org&gt; =B4=FA=B1=ED Yiding Liu (Fujitsu) via lists.openembedded.org
 &lt;liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA2=D4=C227=C8=D5 17:23<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openembedded-devel@lists.openembedded.org &lt;op=
enembedded-devel@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> [oe][meta-python][PATCH] python3-fastapi-cli: upgrade =
0.0.20 -&gt; 0.0.24</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Changelog<br>
&nbsp; <a href=3D"https://github.com/fastapi/fastapi-cli/releases/tag/0.0.2=
4">https://github.com/fastapi/fastapi-cli/releases/tag/0.0.24</a><br>
<br>
Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
---<br>
&nbsp;...hon3-fastapi-cli_0.0.20.bb =3D&gt; python3-fastapi-cli_0.0.24.bb} =
| 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta-python/recipes-devtools/python/{python3-fastapi-cli_0.0.2=
0.bb =3D&gt; python3-fastapi-cli_0.0.24.bb} (83%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20=
.bb b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb<br>
similarity index 83%<br>
rename from meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20.=
bb<br>
rename to meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb=
<br>
index 76ddb409bc..90624b86a5 100644<br>
--- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20.bb<br>
+++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb<br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://fastapi.tiangolo.com/=
">https://fastapi.tiangolo.com/</a>&quot;<br>
&nbsp;LICENSE =3D &quot;MIT&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3De0cf8d811e=
a2046529403707b266fb5a">file://LICENSE;md5=3De0cf8d811ea2046529403707b266fb=
5a</a>&quot;<br>
&nbsp;<br>
-SRC_URI[sha256sum] =3D &quot;d17c2634f7b96b6b560bc16b0035ed047d523c9120113=
95f49f00a421692bc3a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1afc9c9e21d7ebc8a3ca5e31790cd8d837742be7e4f8b=
9236e99cb3451f0de00&quot;<br>
&nbsp;<br>
&nbsp;inherit pypi python_pdm<br>
&nbsp;<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_OS7PR01MB14444DE10B533691FDE1714589B52AOS7PR01MB14444jp_--

