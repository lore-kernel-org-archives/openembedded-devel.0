Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4743C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 23:52:58 +0000 (UTC)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 by mx.groups.io with SMTP id smtpd.web10.2803.1653004374886015420
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 16:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=Ls+zzLXI;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.76,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1653004375; x=1684540375;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=FwCczLPrcFsc8hEliwqs9LAJJjps5NWjqtdsEvvyqNk=;
  b=Ls+zzLXIc3igQFR/UNJ8H+3k/k5m4eQ6Ku3/OFaXO6SmqFiVZElx2AQp
   Cpu+3VsQe3MFZdSH9tJgUpCxzjp5W0HX/6nk88YYf/xJkCHW9/MdfvIF/
   xtdwov2uGMTmvl/N3/U3sJRp0Yy0qPLw2It0IVkiw4LpnDPkFrpKmWdt7
   uKEgwbo7ua2Ja3jGvxisqUd8ETnMnoIH3VTqNTV/yAQImZXq+Op+3MQfx
   mrihHMYGNFqTKE15LLR9kPXxcDcTOWexi1fjBht1v8u0ymgE59ORQpjIA
   9Ut319YabM0zvmHQfXJ9kZoxKqTw78xw4DRSY2gbhziV9O0QhEht9q3KO
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="56347405"
X-IronPort-AV: E=Sophos;i="5.91,238,1647270000";
   d="scan'208";a="56347405"
Received: from mail-os0jpn01lp2113.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.113])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 08:52:51 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Btcur1KxPSGCk3LQYeCDkHnfz0CmqSwscnDoZkhm2aUxakZatBIl0SlMDKH4aIHFxxarmFx/bAzPQVqT8K55E78Z01UzoXwFuZHL/QCbfJdPFRtB47yKpESULzXk0cJcHFxm06XEaDHziZHw6UINUu5xOjrTAsAF7xZEEzLswjMroBTxWj14XLPWabJBk3n5FmhUHqHDf+AT/XT80bUwbJCfJqvzeFKEQ82ZXzlgUMVbqG9hSpM2Pt/aoTJkopUput92Eb4HDqz/azlqf5N5OXnY5fDN/Y5GTtHOk5KpydT/fLM9+KL/RS2lQtUiM5piKwjvSVS7t1gQS+TyCeCMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwCczLPrcFsc8hEliwqs9LAJJjps5NWjqtdsEvvyqNk=;
 b=nodrObFp763vdPDW4LHGAAeWG786z6RzalU4QL5DuEajd6ZfEBN1iowak5Lard3EgjlmQX1n0LZROJ6W+u9KKscT9BlPbDIAuBnxLwgzMNRJFZkRlxgPFRlJ7jSEdcdGUhRuykArVw3GIk2Lcq0embowQljg2be/EZAtlwt6E0Ycvbynxzhyrep+1NuE9DREyae1wBaSMyGc8eIBS9jNVcb++YC8Vw1zaFCqlkOohx4K3aySofFhHDhPl5ui8Zu3Zcf8UWhlTW9TtOv2LTQYJhKqVdwQclP2cXTWqOu49OJ7A7gZHmH41KzF/cLAI0M7jNNAlyAlwQA+lcXfqIuQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwCczLPrcFsc8hEliwqs9LAJJjps5NWjqtdsEvvyqNk=;
 b=SgN9gBHLglY0hy+l4klcGmzUAXCOr2635+nxPLlVLYvMBhIqsCJakkh5gcZUDp7jQpUgv4JFW0QRwgD0Aa+qxSpZu/U8ZH3j3qHOTZfDIkBBNKnkcPEW5+dpSPXOwN7/J6GSvSLDptK3DQzdAbTurdQiETRnCa7WW0hCBJyXeKU=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS3PR01MB7079.jpnprd01.prod.outlook.com (2603:1096:604:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 23:52:48 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::e006:719b:5582:746f]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::e006:719b:5582:746f%4]) with mapi id 15.20.5273.014; Thu, 19 May 2022
 23:52:48 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-python] [PATCH] python3-aiohue: upgrade 3.0.11 ->
 4.4.1
Thread-Topic: [oe] [meta-python] [PATCH] python3-aiohue: upgrade 3.0.11 ->
 4.4.1
Thread-Index: AQHYapV2a+pENG95Dkqbjl0AsTYlaq0kw6uAgACN5xA=
Date: Thu, 19 May 2022 23:52:48 +0000
Message-ID: 
 <OSBPR01MB1845CC1AE3A837D0C582A102DCD09@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1651999221-25259-1-git-send-email-wangmy@fujitsu.com>
 <80acef64-15e8-2ba4-1944-bd5df9be1e00@gmail.com>
In-Reply-To: <80acef64-15e8-2ba4-1944-bd5df9be1e00@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24882f41-eab6-45ce-8b23-08da39f2adc2
x-ms-traffictypediagnostic: OS3PR01MB7079:EE_
x-microsoft-antispam-prvs: 
 <OS3PR01MB707923F6451C07992DA4FEA0DCD09@OS3PR01MB7079.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 R9QjhTtXY1kYcBOGFBYwFhR2CDvjzh2sTBhZln5XNjqfZXhmwbq6e+vGv1cqah1km5OVXn17RwE6kXNv9fsU4ruenD5ixdWzqh6lYVqIQCVSmrOpSWFZbA6y3wOp+RshZuNCokAiHdmV0C7YKn5AB3Z86EvhHSoXXevJAK0bNgZ0CQC+sjTraInb+UBI6hyIdlaLsWBLsDxqqLvs1DlvsnRAppqjSJ1DyYVpvb1bmcISB+/gkvPB7Zyj/sHC6VCjdBM+zxKfhpZ+LqbiF9Rk/INtzQc62kOEqfONZt/9OwpOiPSFSmC4ApVyCnxc3tM3+kfTcjcbL/QdeEZ9UUfFONeMe/JW4nkw6H3fCtMjV//jcJ081HU2N+9uvob+oyrBDSgVvrcqYSZCWkkqm0CrLrNCP8gZsBltJGBpf7CZieDdQBohBPAr+xh8HF1bFYKz/E+ZtyhZLMNNGj9G2xMYwlZmJb1vBcBwcX30+4jqal+fg4J6SRxO6NlNSF75vhwXhpgWb7dOGgnO4x/LfHgVqyuTfaK1qe/emQ6tWz7ZA9isBrym9V47eDjCS4wA7Ypr/YXsIM+NqAlKvIyfzYy3GHWwpC3wBqQVhOQhtDAMzT7TIZnjdvfqfFKdO/QOEB30hIdNGJbCE3uUrBhUbz8eT4of/dBRNmvOHVQ06olsZ7vQwkz0MWup69IfsssvR9qi9vE/UVlIQBzDj+d5dA0G81pI/o55DTWBEynN8l5fM7SiCCsWMXwtQ77oDjMq6veOGrK8Ih+fGqniTFyezKczce8fw/mRQXo0AYBDTNK0k2CCusVJKP/XfxkCxGi1Lbcqv3/6ygdkcRbDEfKB1EdmoA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(508600001)(66556008)(66476007)(186003)(33656002)(66946007)(122000001)(82960400001)(76116006)(64756008)(8676002)(66446008)(966005)(9686003)(7696005)(85182001)(71200400001)(110136005)(52536014)(2906002)(38100700002)(38070700005)(53546011)(8936002)(55016003)(5660300002)(83380400001)(316002)(6506007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QXdyV2lOU29DN0lqSi9yY2xIaXVzWS9Kd24rZnBPT0dhR0JlekpDRDVyTktm?=
 =?utf-8?B?ZVBadGN2U2ozWVE3YnV3WE11c3pGcGkyOTRlU1E4U1BBbnNKUFJ4a2FvSHZB?=
 =?utf-8?B?bDFScWhSMktNV01OclZaNWJ5TG1xdXY3Zjh0cVFHUk9MZVlLK01sOUZLekRu?=
 =?utf-8?B?Q1MwRTB0NjN3YU9MOWZOaXlUa1J5QUFMS3JLZWExSTQvVjJhdElkZmxYdzNr?=
 =?utf-8?B?eHVHMXBGZDQwUU1DNUxSaUtCUTd4allZRHhVUFp3eEcyTW9wNXNBN1NEcHgx?=
 =?utf-8?B?QUJFdjNDYk5SSDdyU0xic1F2dG01Q01SSmd5dlFlN2RocEJsNzNIbXlXOUxG?=
 =?utf-8?B?aFFhaC9xekc0VDA3cmpqc0pkKzgxVlJYdkJtNmZwa3VqeFhndk1ibWFvWGtE?=
 =?utf-8?B?a21Gd2VJSUVjM1RTQ0lsYURkZkRqSmRodm0rZlVjM0NmcFV0dlNsTG9WV2Yw?=
 =?utf-8?B?dytUemZRSkdHeWFHUHlZempLZmFkTXBGUkZrT3EvbW9tWXNVTFRYMmlKREZj?=
 =?utf-8?B?dXZzTEthUVFYbXZOMzhRZS96SzlSR0MxcHVLbU5xcGUzeksxQ05ob3RxUktP?=
 =?utf-8?B?MGZ6Ymd6dWhyRnpBN1diQytSUEZWdE5BL3dFRllMVnVHZWJhSlFLZkdmUlhZ?=
 =?utf-8?B?TGxCSzRhWTZLREgzWEdFS2hQeDlycWJTUnlvWWZjZ1JxVXlQUjh4UW13eXJQ?=
 =?utf-8?B?REZ3ZHB5SUtPVld0Q3pLT0EwVWtYZjVXZnBDWEhmbm1ibDFpdUNyaFhaUHk2?=
 =?utf-8?B?ZDlHNE50SElNVFFqaFY2SzVrVXQ2TzlkbFI5NHBPamJQVE1CcEtPUUdWcW1G?=
 =?utf-8?B?Y3ZKa213b1gvK1NrWnpRcENCSTExSW5ZcGM2NTZxaHRIeEZyd29TSy91WUk1?=
 =?utf-8?B?b2VkaSszeExrWlFPd2Nsejl2Mm5RbzNWaEU3UG0rMGdMK1ErL3Y3c0VoeUdY?=
 =?utf-8?B?c1ZVN09GaFcxZ01jTzNPTy82NG84YW1iMkIwSUpoOUNFT3dRWmZWWjc5c3hZ?=
 =?utf-8?B?cWRtZEt6bURzTDM3ekFNNHJ5aHRZNDFwbGtsT1h6YUpVYzR0VzFWdHpyajlG?=
 =?utf-8?B?aTdNUHR5WURYTVdVQ0VBK2xjamVVOEZXemdQRW9pLzRBSnZqTk9SNEVlS1NW?=
 =?utf-8?B?aXR0eDBESnJheEdNWjhPcTVzcEthNy8wbFo5OGJONkhhVkQyV29hQ0ozb2ta?=
 =?utf-8?B?YXVIaUJOWHY4Umw1RmRLditTWTZyZHlCT2NPMEJGTy9mQXI1M25lL2pmNVE4?=
 =?utf-8?B?dng0NlI2dTVGbGFwMUpTeTkwOWlWdnlpZnNVYjhSVFlyUU83RmVPMlpiMEp3?=
 =?utf-8?B?L2xzQlVYWTBTRWtJVURZN2FwQUpHcXBFWHE4aDRpa0t6N3ZEN2kzWDV0dmdE?=
 =?utf-8?B?WEl4SHlLMVZuRE9EN0JlRnBwbXFwaEVuT1NRcWZ0NWZkR0NUc25kNGxsKzJK?=
 =?utf-8?B?Mk5XT2NYSDFUODVCakNUQkphZzB4bGhaUXYxOGcyZGY3cjJnaXRnck5QWXlC?=
 =?utf-8?B?M3Q0Q3RzcTNxOGZlNUtyTzJBbzV3SUJVakhtclFHVkMzcytCVGtwb0lBVHp0?=
 =?utf-8?B?WGJaN1hrWDRIVnNLUmFXaUoxNjFjcmdyL20yYjhuRlpRdzhvTkVZelNsQWNF?=
 =?utf-8?B?cmlETzcvS3RhVzlWNUlKdHhXZmZjMDMxa01RdXhocWkxWmpNS1phZzFWamZu?=
 =?utf-8?B?NkVkc3o2dmRacEZzbDlobFR1aVZaQmNRQ1M1V2cwb3QybUhGbzdmdjVKSVlP?=
 =?utf-8?B?d3kvc0JrTWE0bG03Rll2SGl3VE9LbGhJVUVNeDg2SlJyaklSazY4L3FzeDZ4?=
 =?utf-8?B?S010dXNGTjZMdzR4dFppM1llMzJqNENtcGZOb1RnMmFSRWdXM2tvcVlNbnl1?=
 =?utf-8?B?V1NXZU9IejdjMFNkbmg0cHkrZndBRGhCbjlnbDFKNXZlZ1p3blhyaTVFcUtU?=
 =?utf-8?B?LzZuNFlDaFd5c3BTWUFKVkdFblNWN3JVZVJSY20zd0VPSTd4WFdscTVOdG85?=
 =?utf-8?B?MWFwSEtQcjZFUHZ4cGgrNW1FeTJDYUtyanlMMDhxcm1wYWZ5eHFObGpBSy9w?=
 =?utf-8?B?S1hNQzNWWkFJdWM2ZXVXMVk4WDJsS1NKVFBPWmxZd0picjJoL1kxcXJ3emVh?=
 =?utf-8?B?N2R1dVh4NHlqY3hyOE1YRFNON0J0MGF6bXh2c0gxeXd4dllLalQzTTFpa1Nj?=
 =?utf-8?B?YjlrQnVLYUE1dUpuSysyMWpKYlBMdmlyT003S044WFdxTXZ4REc1bXVXbWxH?=
 =?utf-8?B?RjdzRERMVnVGMjMrREM5c2h6blpCM0pJc1dKc2xlY1MxMXZlRk5JMGw2SEtW?=
 =?utf-8?B?WDR6N3NuODdjK1BEeXdtdG9uRytsQzZMRitOMG5NRmFNbjl3bWtXUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 24882f41-eab6-45ce-8b23-08da39f2adc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 23:52:48.6110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 97xisptyT4sd86tfe6zxw9wenOxpQrvrqcZxZ6LLgugd7pKzwUFnb+TPLyd/bFj60YWsCM2ilEsnUebl2e1+Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 23:52:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97206

VGhlIHRpbWUgb2YgbXkgdmlydHVhbCBtYWNoaW5lIGhhcyBub3QgYmVlbiByZXNldCBzaW5jZSBp
dCB3YXMgbGFzdCBzdXNwZW5kZWQsIHJlc3VsdGluZyBpbiBzeXN0ZW0gdGltZSBlcnJvci4gDQpJ
IGhhdmUgbW9kaWZpZWQgdGhlIHNldHRpbmdzIHRvIGVuc3VyZSB0aGF0IHRoZSB0aW1lIGNvbnNp
c3RlbnQgd2l0aCB0aGUgaG9zdC4gSSdtIHZlcnkgc29ycnkgZm9yIHRoZSB0cm91YmxlLg0KDQrC
oCAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpEZXZlbG9wbWVudCBEZXB0LkkNCk5hbmppbmcg
RnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkgTm8uIDYgV2Vuemh1
IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTDogKzg2KzI1LTg2NjMwNTY2LTg1NjgN
CkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWpp
dHN1LmNvbQ0KaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9mbnN0Lw0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+
IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDE4LCAyMDIyIDExOjMyIFBNDQo+IFRvOiBXYW5nLCBNaW5n
eXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWRldmVs
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtcHl0aG9u
XSBbUEFUQ0hdIHB5dGhvbjMtYWlvaHVlOiB1cGdyYWRlIDMuMC4xMSAtPg0KPiA0LjQuMQ0KPiAN
Cj4geW91IGVtYWlscyBhcmUgZGF0ZWQgd3JvbmdseS4gRWcuIGJlbG93IGVtYWlsIGFwcGVhcnMg
dG8gYmUgcmVjZWl2ZWQgb24NCj4gOHRoIG1heSB3aGVyZSBJIGhhdmUgcmVjZWl2ZWQgaXQgb24g
MTd0aCBtYXkuIFRoaXMgY29uZnVzZXMgdGhlIHRvb2xzIHdlDQo+IHVzZSBmb3IgZ3JvayBwYXRj
aGVzIGZyb20gbWFpbGluZyBsaXN0LiBDYW4geW91IGNoZWNrIG9uIHlvdXIgbWFpbCBzZXR1cCBp
Zg0KPiB0aGlzIGNhbiBiZSBmaXhlZCBvbiB5b3VyIGVuZCA/DQo+IA0KPiBPbiA1LzgvMjIgMTo0
MCBBTSwgd2FuZ215IHdyb3RlOg0KPiA+IGFkZCBkZXBlbmRlbmNlOiBweXRob24zLWF3ZXNvbWV2
ZXJzaW9uDQo+ID4NCj4gPiBDaGFuZ2Vsb2cgZnJvbSAzLjAuMTEgdG8gNC40LjENCj4gPiA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiAgICAgIFN3aXRjaCB0byBsaW1pdCBwZXIg
aG9zdCBvbiB0Y3AgY29ubmVjdG9yDQo+ID4gICAgICBEZWxheSBpbml0aWFsaXppbmcgd29ya2Fy
b3VuZCBkaWN0DQo+ID4gICAgICBCdW1wIGJsYWNrIGZyb20gMjEuMTJiMCB0byAyMi4xLjANCj4g
PiAgICAgIFB1dCBiYWNrIGFzeW5jaW8tdGhyb3R0bGUgYmVjYXVzZSBzdGlsbCBpbiB1c2UgZm9y
IHYxIEFQSQ0KPiA+ICAgICAgTWFjIGFkZHJlc3MgZ290IGxvc3QgaW4gdHJhbnNsYXRpb24NCj4g
PiAgICAgIFVwZGF0ZSB0byBmaW5hbCBtb2RlbHMgYW5kIGZpeCBwYXJzZXIgZXJyb3JzDQo+ID4g
ICAgICBGaXggcHl0aG9uIDMuOSBjb21wYXRpYmlsaXR5DQo+ID4gICAgICBGaXggdHlwbyBpbiBi
dXR0b24gZXZlbnRzIGhhbmRsZXINCj4gPiAgICAgIEFkZCBkaWFnbm9zdGljcyBmZWF0dXJlDQo+
ID4gICAgICBTbWFsbCBmb2xsb3cgdXAgZml4IGluIGV2ZW50IGxvZ2ljDQo+ID4gICAgICBBbGxv
dyBtb3Rpb24gc2Vuc29yIHN0YXRlIHRvIGJlIG51bGwvbm9uZSB3aGVuIHNlbnNvciBpcw0KPiBk
aXNhYmxlZA0KPiA+ICAgICAgQWRkIGJhc2ljIHRlc3RzDQo+ID4gICAgICBGaXggZmxvYXQgaW50
IGNvbnZlcnNpb24NCj4gPiAgICAgIEZpeCByYWNlIGNvbmRpdGlvbihzKSB3aGlsZSBhZGRpbmcv
cmVtb3ZpbmcgYSBsaWdodC9kZXZpY2UNCj4gPiAgICAgIExvb3NlbiB1cCBhIGJpdCBvbiBwYXJz
ZXIgZXJyb3JzDQo+ID4gICAgICBGaXggYnV0dG9uIHdvcmthcm91bmQNCj4gPiAgICAgIEFkZCBz
ZXR0aW5nIGVmZmVjdCBmZWF0dXJlIG9uIGxpZ2h0DQo+ID4gICAgICBBZGQgbWlzc2luZyBwYXJh
bWV0ZXJzIHRvIHRoZSBncm91cGVkX2xpZ2h0IHNldF9zdGF0ZQ0KPiA+ICAgICAgRml4IHR5cG8g
aW4gZGVmYXVsdCBlbnVtIG1lbWJlcg0KPiA+ICAgICAgQWRkIHRpbWVkIGVmZmVjdHMgZmVhdHVy
ZSB0byBsaWdodA0KPiA+ICAgICAgQWRkIHN1cHBvcnQgZm9yIGFnZ3JlZ2F0ZWQgZ3JvdXBlZF9s
aWdodHMgY29tbWFuZHMNCj4gPiAgICAgIEhpZGUgZGVwZW5kZW5jaWVzIGluIHJlbGVhc2UtZHJh
ZnRlcg0KPiA+ICAgICAgRml4IGFuZCBjbGVhbnVwIG9mIGJ1dHRvbiB3b3JrYXJvdW5kIGNvZGUN
Cj4gPiAgICAgIEZpeCB0eXBvIGluIHRpbWVkIGVmZmVjdHMgZmVhdHVyDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgLi4uL3tweXRob24zLWFpb2h1ZV8zLjAuMTEuYmIgPT4gcHl0aG9uMy1haW9odWVfNC40LjEu
YmJ9ICAgICAgfCAzDQo+ICsrLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+ICAgcmVuYW1lDQo+IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3tweXRob24zLWFpb2h1ZV8zLjAuMTEuYmINCj4gPiA9PiBweXRob24zLWFp
b2h1ZV80LjQuMS5iYn0gKDc0JSkNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYWlvaHVlXzMuMC4xMS5iYg0KPiA+
IGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1haW9odWVfNC40
LjEuYmINCj4gPiBzaW1pbGFyaXR5IGluZGV4IDc0JQ0KPiA+IHJlbmFtZSBmcm9tDQo+ID4gbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1haW9odWVfMy4wLjExLmJi
DQo+ID4gcmVuYW1lIHRvDQo+IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtYWlvaHVlXzQuNC4xLmJiDQo+ID4gaW5kZXggNDdkOTk2NGIwLi5iM2E4OGZiNjcgMTAw
NjQ0DQo+ID4gLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1haW9odWVfMy4wLjExLmJiDQo+ID4gKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1haW9odWVfNC40LjEuYmINCj4gPiBAQCAtNCw3ICs0LDcgQEAgU0VD
VElPTiA9ICJkZXZlbC9weXRob24iDQo+ID4gICBMSUNFTlNFID0gIkFwYWNoZS0yLjAiDQo+ID4g
ICBMSUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly9MSUNFTlNFO21kNT1kYWIzMWExZDI4MTgz
ODI2OTM3ZjRiMTUyMTQzYTMzZiINCj4gPg0KPiA+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAi
MzFjMGI5MGQ3ZGMyYjYyZjVlMWE5M2U3OGIyYzBkNjM2MGVmNmMwYTg3NDg1YzIxN2E0ZjM5NGM5
MzdmY2U3ZA0KPiAiDQo+ID4gK1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICJmYTNiYjBjZjY4YWVm
ZGQwNzEwNzA0NDQzYzg5NmFiZGE2OWFlMjI3NTAwYWQ5NTM5YWM2YzNkMWQ2ZGFkOA0KPiAwNCIN
Cj4gPg0KPiA+ICAgaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzDQo+ID4NCj4gPiBAQCAtMTIsNCAr
MTIsNSBAQCBSREVQRU5EUzoke1BOfSArPSAiIFwNCj4gPiAgIAkke1BZVEhPTl9QTn0tYWlvaHR0
cCBcDQo+ID4gICAJJHtQWVRIT05fUE59LWFzeW5jaW8tdGhyb3R0bGUgXA0KPiA+ICAgCSR7UFlU
SE9OX1BOfS1wcm9maWxlIFwNCj4gPiArICAgICAgICAke1BZVEhPTl9QTn0tYXdlc29tZXZlcnNp
b24gXA0KPiA+ICAgIg0KPiA+DQo+ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0t
DQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAu
DQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCM5NzE1Nyk6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvOTcxNTcNCj4gPiBNdXRl
IFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85MTE4MjIxMS8x
OTk3OTE0DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1Yg0KPiA+IFtyYWoua2hlbUBnbWFp
bC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K

