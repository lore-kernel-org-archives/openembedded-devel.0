Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4851BCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 05:50:28 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.20])
 by mx.groups.io with SMTP id smtpd.web11.5726.1755237024241867486
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 22:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=gzubV4es;
 spf=pass (domain: siemens.com, ip: 52.101.69.20, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByCXIBVcYzvrVgWEt8U7DOw73fOP9CqSZBqPP3KFG+XPDXL9pTECpsPz5+KNaGOCMQegr5MFzM1DDRI2W1LnqVoxOVub3PHtKGu6JZajTfVQuZdWB42SP1HdvReOd+VfnQbOU3b7yUqrd4GnsFyKYzkTzHvwQsT6oREto/CN9e1+7gKBctd7EJyKK5mm0KW4T2YRbGCuvTgOCuYzyDv/i27JDTA12QIsAjIyQfrub4a4iW1eIhZABW4xo0Z6p+hw9SXH2soSrmcSqJ0B10Jh/0ecsgdAe39gucIi9AxP2wtCgc+uQDvOV0ZaJZpTwnZnY42lKZKxNgg5hEyWNbRhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HeQXzqpWQLoeHRHxcou24q+AWQ+0VztGvJwiW4QA7E=;
 b=Vl0nzKGe2kdaeMRKM79AIBoXDfiL8ZbVLOWm2BMo0TWumRNVeJmBmWdNRKvKmOcUfHmMv+ntlOm3Sk50kCsLLQ3SQJfBlr1g7S+B7b1CHHwwJGE9yoZjZLEBP7TBE8LJyi3DSE2w4MC4NtRyyJNDuomjwui3CXX/JEWv2ODYQ8HRgFZswHBOW8mFMs/PQAi+UFFOG/I6kD3rCfPC9471TzgTk0d/q2BkscP2xNsivAminc5/wGjy9EqN0rC2R+HzGH+XOIYhKZZ7fGXotBCKAhQzp1s0iOrigynaoYiw+zovllZWoQTT9yArldQmjO4p2eRV7LDRircGWZ7ATTkCqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HeQXzqpWQLoeHRHxcou24q+AWQ+0VztGvJwiW4QA7E=;
 b=gzubV4esha+m0HeEvqdgdtKBTiGz13g2ZpMF6DLR69pv8rrzcGPbhhSjMn1jZ38hC2cwWUWXbHfRRiQbu6vvO13tYbA58q41s6Whiyi9o2FHVnAYxTOAjZfcCp5FbDqUdIa0VFOEBNF7A07IUr/ieYOfnTrOeIlorV2UHCM274Gmo8bREDnIX5/h/blxypZZnuP/jnzYceY/Ji9VcS+GxJaAzmD0bwS3sunz/FDFjACdU3WfRkx+4xB3c1nDtvEY6jXRlvkrKpf2dxTU7W0VHFONa1GDknGSihlLIGQPt0cZxCXo53iH/B2XzQK1ThwmpWdh/flFHkhsZ00Qnlkc0Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU2PR10MB7725.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:46d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 05:50:20 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 05:50:20 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, "d.schultz@phytec.de"
	<d.schultz@phytec.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: RE: [oe] [meta-networking][PATCH] meta-networking: mbedtls: Remove
 tag from SRC_URI
Thread-Topic: [oe] [meta-networking][PATCH] meta-networking: mbedtls: Remove
 tag from SRC_URI
Thread-Index: AQHcDW3uOH8r4xsflEq4btHtM5QDRrRi93UAgAA+CUA=
Date: Fri, 15 Aug 2025 05:50:20 +0000
Message-ID: 
 <AS1PR10MB56976A442C0ACF5610557FC4FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250814225042.3310913-1-d.schultz@phytec.de>
 <CAMKF1sqM_bVMcSJ+929XJ8DK_4_NDhDN75KtnTtF=Rz+bRkFgQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqM_bVMcSJ+929XJ8DK_4_NDhDN75KtnTtF=Rz+bRkFgQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2edb654c-d55e-4fb4-bf94-53fd76c87d59;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-15T05:48:07Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU2PR10MB7725:EE_
x-ms-office365-filtering-correlation-id: 4bbfaf3e-a12a-4a17-52f1-08dddbbf9ed3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MHJWRWlOY01JNnEwdHJQVFBpK2xSTjEvaWlUWTQyOEtZcHA4WXhtVUpJQTFm?=
 =?utf-8?B?dURUb09tZnk5MC9qYXZiTENnYlNCS1RoVDFaQjJDbStVTUwzb3FvdzJNM0NR?=
 =?utf-8?B?QWpBa2lnTGFjMDRDZVRWMlFKMWZFRmNlWEVOREVXSGFDclVWSDFHbjZyUVRE?=
 =?utf-8?B?RHZSelFBU0h5NkowckdOUXN5QS9XV0owWWVRMGNJdTVqaU16RjRKUGRXMEt2?=
 =?utf-8?B?RnhyQ1RpUlppT1RkSjYzSWlRTjhaQ2xxdHJyeVB4MTV5Q1E0Y2R2T29jS2FC?=
 =?utf-8?B?TnJFN0dBKzZWTUo4V2Zpanlqam5RWkRvNmFoMDM4dWRIdE54ODZxbVNQMVJw?=
 =?utf-8?B?YUJoTjdBM2g0VzBuQzhsc2pRR3ZrTXZwczBPdGpwRGxCSVFyNGRxNGNWUUNr?=
 =?utf-8?B?VW1TWGdML3pOMzhSZHdEK1JuUmlYRlBZS1FEREhFa1krbCtBWXJia0NnUy9i?=
 =?utf-8?B?Z2U0Q0dlYkE0dzBpUUQ3RGpzTTZMZXZiV1ZtbTNhSlQyOFh5cEdOaVlkbCtx?=
 =?utf-8?B?U2MzSWxPc1JNWWxkb3pyS28zdm03aC9jWkJVdTZLT09KbEdFSndnaCt0dUt2?=
 =?utf-8?B?NVpVOFF2ZlE4RTh2Q0doYTMyYitsRXY0RUxqK0xTWmpSc01lc1N6bXdyVkFj?=
 =?utf-8?B?Z3ZHbEpua0dndWFVRThaakxFRlQzZlFsQldRaUpXL3daU016OVM1anBJd3k2?=
 =?utf-8?B?cnM0VHBmSWU0V0R2dDZtNGRONGVqcnFpcU9aZ2NDZWQ4Wm5iWDRybGRDaStK?=
 =?utf-8?B?ZHh6VjBLNnVKR0FRandHRUt6VWNDQWkybDRwcVRHRmhoMC9oaTFuZEVJNkhy?=
 =?utf-8?B?VUF0bmRDb2NlWEpCQm5BbHRHcW1Sc28xd0o5ZklKeXl4ZUdOMnZ5REQzWEhG?=
 =?utf-8?B?SmZoSHlMNUVxR1lGQmQvdjJQd0M4YkpWUGhLc1RmaFAza1ArNTE3eXBaNjBr?=
 =?utf-8?B?cUVub0dueEFmcGVJUzVxME9kVmt2TzY0UDF4SGdsWXR0Y0VpbUxlMzAxYzJQ?=
 =?utf-8?B?NVNpZ0FmWW1QSk10S1RLb0VnN3ZGVXpvTzhIZjVQcE1ZY1NBSXRFYS9OMS9D?=
 =?utf-8?B?ZGM3TDR3dmdJZ0UvUCtXWXUyaVgwSkJYWXRuTmhOc08rK2d4cGc4N3U5SmRy?=
 =?utf-8?B?S3RDN0lORzkwcEZ6c1d5Uy84V1hlNVU5YzlCclJ4UGkyUmt0QzZhbHQwY0NU?=
 =?utf-8?B?UXNOQnFxcVM3V3VYR25JY0g0eFF4bHVJZEEzZlhBcS8yd3JsVlZrNk9Lbjhz?=
 =?utf-8?B?bnlHTVU0RUI0RnowOWp6Rm05SkpiVWIwR05QSG9pVGY3dGhkeVpLNlZTZVJP?=
 =?utf-8?B?ak5VT0hUckJBVjhXMTh2TCs0dEVhNzhac0lVbG9zS0pTZ1RlTGN5a0EyRGZX?=
 =?utf-8?B?SFVOUmhDUE5VZ203clJKaDdkMW5GY2JyaUtXeWwxYU5JNXozQnBnUzNXSzBu?=
 =?utf-8?B?ZHNCZ3ZiRStUVzJzWnlVaGd3MjhpYS9RWDRTUmJPMUpzbC9TeDZzSnZLSkVz?=
 =?utf-8?B?ejNQV2c1VS9IaXJSdW1aQmV5RGdHQ2JzM1BrZjBScjJPSW5zcHhBNEFlcFVy?=
 =?utf-8?B?S0RmeHd5T2ZUdUpVbGttak1pTVJET290bHRpU3I0ZTN3aFcyZmk2L3QyK2xU?=
 =?utf-8?B?Z2pJVlJtTzNwY3NPUUtiRVo5elpWSlZxb1g1L0RzVkdrSzIrQ1pVOE14YWZ3?=
 =?utf-8?B?RWRRQmk3b1p6ajV5bTR3bVRjVzJsc2Q4YjJ5Y0Vmd1NZeHNab2t2Rm9hRkg4?=
 =?utf-8?B?Y0JMd0xQL2V6THl4UFZYMEVJdGtmejkxR2YxTXg5bDNKTWVmSytWc3hiRlUx?=
 =?utf-8?B?L0ZrYjRheTlJSlNDdmxEUXl6TlVsa0xKazV5Y1BDS3FCZ0VBTms4bFdXV2Yy?=
 =?utf-8?B?Nko2ZnEzTE9iQ1kxMkVCQkZkbkMrZEVKVENXclFHVnYvTEtISWdiSlhIckZB?=
 =?utf-8?B?ZEZWbi9zYWVVZTFYdGZMU1NUZkdJamkwVmxXbXJkVFFZc1RySk82QVFTMDFF?=
 =?utf-8?B?TzI1bXNDeEVRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M1ZHcDRZNklocVlmUTJuUU51Y1RxYSsram5xdGovTVN2NmtsbVI1TTZmUnNE?=
 =?utf-8?B?KzFGMXB5Nm94ZGtNYUFDQjMyTHdGTFY3TGpmWjcwVDFiOVloVXhpc1N2Q3l2?=
 =?utf-8?B?M1FlUHpCbmlNVXZpQlZsWmFEUFgwaVNBeEJqQW9XYnV0djhjSVp6SlhVd1l4?=
 =?utf-8?B?Wld2VUtnb2ZRN3duN3lCZG5GZ0g1RVg0NGlVK0JsWk5xMm9iRTNncWtYM3Jy?=
 =?utf-8?B?VWJ0UnhJN2hQSGRUSFdCbDM4a1AyczZ1dVlQbTJmTVZ1a2k2OTA1bFpNTllP?=
 =?utf-8?B?YTNiVGZhMU1PMEFVejluVTBiVVBZeW1Cd3hTL09uV3RBRTZ4NnJmWnByMHZs?=
 =?utf-8?B?MGJQN0NvZVdBeitpRTZGRUtGZllYVCtVNmVaOGpCVzNpZ0dCMzdKalp6VWNZ?=
 =?utf-8?B?RjdPSHBkdVIwaVlxZlhqOE5KVkJoRmx6MjF3dlYvcExDd0xNNUs0UUdOdVdv?=
 =?utf-8?B?c1V1enVXaERubDdibnZKck1jaHFvc1Y0bTFkOFNRUWFFNU41VVhvWjg2aDJs?=
 =?utf-8?B?KzlNNE9CL2pvaERZT1oxdkFHOVBscWprMXk0WDVvRzNTT0V1dW9sTVJRdDR1?=
 =?utf-8?B?eWlIb2kvd0g0U002ZUduL01Dc09ReGNoTFRrbnNXN3l2SDdrSlFtSVJxdDlZ?=
 =?utf-8?B?S2xHZC80WUczRlBxUnBSNFdZUWZ3amUzMkh6bCtzM0U0R3RUd1BBVmpvMWpD?=
 =?utf-8?B?SWpTQ3QxS2hmSXU3bXphVjZWWHdkalNCQ0dScWZGZEFoOXpqdE1EWElhR1NT?=
 =?utf-8?B?L2xNWDNOMk51SVZYZlFYUU5CS2h2SkhnM2cza0ttNzl2RTNiaUlDTW0rc0lk?=
 =?utf-8?B?MUhrdFlZL3pNNzF5bUxwR1JyYjRSYi9YKyttZzZncTBKQWdzQ3o2L01GRFhL?=
 =?utf-8?B?U2laUCtsellQZi96K2lZWktRSFpVMTcybHkwTFFvNjI5b3dMMXdFcjZNSzNB?=
 =?utf-8?B?bVlKNXAzbitlTTB0MmZWU0VielNGeDRySzZQM2NubFVRaXMrZzN2WVVTT2pM?=
 =?utf-8?B?akYwdm51TGY2Nm1rS2cwQ2xDYjUxcE04OWNFeXFpK2dNWi92TjRSdVVCQm82?=
 =?utf-8?B?a0x1TFpxeE1qVE9YVjJqWWpqUVlkclIxTUdKa2xneWJFZHQ2MDNiN3ZHVkVE?=
 =?utf-8?B?VW8waFg4VnQ4OTNPSTFlRS9tNnE5VzNyQU9DeHhBMEN5RG1aTURPK3RtZDZP?=
 =?utf-8?B?N1ZJNU5zckVRVXhacG16SzMvUjZodmtUWTZWeEFMVWJtWGI3clkwK1o0K2tC?=
 =?utf-8?B?dlEwNUJQdDVBQzc2SzVZZ1MwdEJPV2o3TjhUT0Z1d0RQS0RLbEx5cEwyb2pp?=
 =?utf-8?B?NXBSZWdEUE1pb0luUHA5cXRKMG1ZWjN4KzlXRTI3aGE0QkpONk42Q0IxQXhZ?=
 =?utf-8?B?c2lzM2ZhWkloaURmUlJYWEZBLzFqeS9YV1RGbDFtUkJjWkVNNkQwdTZYNlZY?=
 =?utf-8?B?Q2FjblNhaEpBd0ZENDY4ek8wNEJQenMzOVU2WFExWTFmbVYySUkvYUdablN6?=
 =?utf-8?B?WEpzVzdYczRaalNlb2VYU09KYngyUEg3ZnBrYlh1enMvWTI4MDBQc0xrYlZq?=
 =?utf-8?B?cFljQUFHWUtRREszMEF0d214NXhTTzZidDZRVTFRZThCOGdHTndSN01TMEtr?=
 =?utf-8?B?WTE0MXJvWjJ1VnZwTlRrUWR0eWNXbEp3aGhyMTFOanorM2dZejhBR2tPd1JZ?=
 =?utf-8?B?amlXVk1OanVoMTBOS1BZbytkdzdpbHlCWUJqSC9NYU1uL2pCNWVQeGxKVE9F?=
 =?utf-8?B?UzZSZ3J5bXJwNHdNeUJQS3FzOTVDaWhSR0dnelNXOE1EZEx1c2hwZXFpalZ2?=
 =?utf-8?B?Wmg3WGd1a1dXM3RPMWpxR2VSblFVeVcwcUwveUk2L2M2ZmwwckU4MXBzWmhu?=
 =?utf-8?B?YXd2TDNRaTdLWDBtcHVab2QwTTZweGpic3NQNlZqZXlxYW1DUFlXTlllRlBk?=
 =?utf-8?B?aDNyZTlvWjErY25QYnJteFlFdE9PSng0OU5tdllleHBITFVSVmoxd1dXWWpD?=
 =?utf-8?B?V0FFSzVPNGFINW5adWlJMkhabzVoUW5TSXFrMjE3bmcweWFwbTBzS3NKTzZk?=
 =?utf-8?B?MTJhVlFiU2FHeFVrZlhkOUxaQ0krZ0IwN0RHVm1rUGF5Wk5WZ0xSQnRxbVIx?=
 =?utf-8?Q?RYo6yLE2jm/pf1+0n37xlLMq7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbfaf3e-a12a-4a17-52f1-08dddbbf9ed3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 05:50:20.6222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G1sOOkc/mVQLSBlQce9IqUCfOe8OmVUBTAiLo1vFD/jPq9QWSxrj2Wat3y9Jar1a195Ac/gHp7S4oiMNaOozeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7725
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 05:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118956

VGhhdCBlcnJvciBpcyBzaG93biBvbmx5IHdoZW4gIjtyZXY9JHtQVn0iIGlzIHNwZWNpZmllZCAo
d2hpY2ggaXMgbm90IHRoZSBjYXNlIGluIHRoaXMgcmVjaXBlKSBvciBhIGxheWVyIG1vZGlmaWVz
IHNvbWV0aGluZy4NCkZldGNoaW5nIHdvcmtzIGZvciBtZSB3aXRob3V0IHRoaXMgcGF0Y2gganVz
dCBmaW5lLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGRldmVs
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBLaGVtIFJhaiB2aWENCj4gbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAxNSwgMjAyNSA0OjA2
DQo+IFRvOiBkLnNjaHVsdHpAcGh5dGVjLmRlDQo+IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZzsgdXBzdHJlYW1AbGlzdHMucGh5dGVjLmRlDQo+IFN1YmplY3Q6
IFJlOiBbb2VdIFttZXRhLW5ldHdvcmtpbmddW1BBVENIXSBtZXRhLW5ldHdvcmtpbmc6IG1iZWR0
bHM6IFJlbW92ZQ0KPiB0YWcgZnJvbSBTUkNfVVJJDQo+IA0KPiBJIHdvbmRlciB3aHkgaXQgd29y
a3Mgb24gYXV0b2J1aWxkZXIuIENhbiB5b3UgdHJ5IHdpdGggYml0YmFrZSAtY2NsZWFuYWxsID8N
Cj4gYW5kIHNlZSBpZiBmZXRjaGluZyB3b3Jrcy4gSSBjYW4gc2VlIHRoZSBTUkNSRVYgaXMgc2Ft
ZSBhcyB2My42LjQgdGFnLg0KPiANCj4gT24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMzo1MeKAr1BN
IERhbmllbCBTY2h1bHR6IHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxkLnNjaHVsdHo9
cGh5dGVjLmRlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IHdyb3RlOg0KPiA+DQo+ID4gVGhp
cyByZWNpcGUgdXNlcyBTUkNSRVYgYXMgd2VsbCBhcyBkZWZpbmVzIGEgdGFnIGluIHRoZSBTUkNf
VVJJLg0KPiA+IE9ubHkgdXNlIFNSQ1JFViBzaW5jZSB0aGlzIHdpbGwgZ2VuZXJhdGUgYW4gZXJy
b3IuDQo+ID4NCj4gPiBGaXggZm9sbG93aW5nIGVycm9yOg0KPiA+ICAgWy4uLl0gRmV0Y2hFcnJv
cjogRmV0Y2hlciBmYWlsdXJlOiBDb25mbGljdGluZyByZXZpc2lvbnMNCj4gPiAgIChjNzY1Yzgz
MWU1YzJhMDk3MTQxMDY5MmY5MmY3YTgxZDZlYzY1ZWMyIGZyb20gU1JDUkVWIGFuZCB2My42LjQN
Cj4gPiAgIGZyb20gdGhlIHVybCkgZm91bmQsIHBsZWFzZSBzcGVjaWZ5IG9uZSB2YWxpZCB2YWx1
ZQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFNjaHVsdHogPGQuc2NodWx0ekBwaHl0
ZWMuZGU+DQo+ID4gLS0tDQo+ID4gIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9tYmVkdGxzL21iZWR0bHNfMy42LjQuYmIgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEt
bmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tYmVkdGxzL21iZWR0bHNfMy42LjQuYmIN
Cj4gYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbWJlZHRscy9tYmVkdGxz
XzMuNi40LmJiDQo+ID4gaW5kZXggODhiNTBhNDA2Yi4uYTBkYzZhNjg5YSAxMDA2NDQNCj4gPiAt
LS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbWJlZHRscy9tYmVkdGxz
XzMuNi40LmJiDQo+ID4gKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5
L21iZWR0bHMvbWJlZHRsc18zLjYuNC5iYg0KPiA+IEBAIC0yMyw3ICsyMyw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0U7bWQ1PTM3OWQ1ODE5OTM3YTZjMmYxZWYxNjMw
ZDM0MWUwMjZkIg0KPiA+ICBTRUNUSU9OID0gImxpYnMiDQo+ID4NCj4gPiAgUyA9ICIke1dPUktE
SVJ9L2dpdCINCj4gPiAtU1JDX1VSSSA9ICJnaXRzbTovL2dpdGh1Yi5jb20vTWJlZC0NCj4gVExT
L21iZWR0bHMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYmVkdGxzLTMuNjt0YWc9diR7UFZ9
IFwNCj4gPiArU1JDX1VSSSA9ICJnaXRzbTovL2dpdGh1Yi5jb20vTWJlZC0NCj4gVExTL21iZWR0
bHMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYmVkdGxzLTMuNiBcDQo+ID4gICAgICAgICAg
ICAgZmlsZTovL3J1bi1wdGVzdCBcDQo+ID4gICAgICAgICAgICAgIg0KPiA+DQo+ID4gLS0NCj4g
PiAyLjI1LjENCj4gPg0KPiA+DQo+ID4NCj4gPg0K

