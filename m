Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07E2CA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 03:38:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.37878.1757561889203977352
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Sep 2025 20:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X6PzAlC8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1349009e86=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58B3CENO1596483
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 03:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fmkEcXKAZZo0mrolVQd5BQCzCmrUBL3TfEsjtgwB9nY=; b=X6PzAlC8fjjp
	ERb78uvgkyJOZW9tIIhnHlMjeeL04DB5aUDsJLj7dJeiqoNnAuQ134XK/PbRfKiI
	ALZn+lHG6eAH0nxyg3yxgUHMgDcBEW51az8IsdsDBtybOmKVzf0NaCbvwaXKf5qr
	meVWKpNWwlikblNQ8/N5VP47JTIJEfBHmJwYjMDXE6aKTfRKJRUp03CVXDp5bq8O
	ElpD0p7mIb8v/4aPxUDw1xAzZzPcatUNfgOuOCOIYVl5ApQ5kNu76jfz/59LtYCq
	7EVUGTKBkkNvAh9nCxVxEJwiIxX1EBlDqN/P80AfKlb8EutMa7ECk7Bd/k+igUip
	f2jIKqQs3A==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2052.outbound.protection.outlook.com [40.107.96.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve33nxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 03:38:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBMdkLPETLmRInQuHEdDNR+AosYgoAOBJuaB9a+CC/q7FtW29ndqsRgqKgIBUyRfHABJX590lty2Yoh1TfIRA+H1Iw/pfnaF2JppohYeA14J1IxdhhZy01OyLUUxPKEzOkErZFU/SHOi+4zncGEuUuA3qTWJOAR9q4nk7B0jVuwBoqz/oGTKzLJewGpsAedIfvjKOMXU6aEw7b5K5QMg5q1+65Nndck9atUmb2fGB5yYHBjJYv5Zo4/6ASlY6IpsehP74R+Wx+zjIWE2YCr/+0kymxlDa1+j7W9kPwgdo8mC9KiRWL61nPlg7NtALpbGNLzKRj9+7zsoPXeD8fkZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmkEcXKAZZo0mrolVQd5BQCzCmrUBL3TfEsjtgwB9nY=;
 b=VXO+X1jVn3/doFLLQ/etFs9AVJsH6/j+arp4PZiuS8p7FGELsippVQeERR6n5HfeKn58Z0aDmqCmzafExxgYzijZEfiulfkBHiGsy+Seq3p6SnmtCnJb+AbHAONc0u21h1y5vjLXlKB64o8jNWL4WtO5u49TUcTQ1Lj+I3HlLtSGlV2HcMNr21+7U88pl8rIccFmVvHrj/TipC4w0z3rPB7IyIvN5OOTsfVLz0HNEAZLvYJrdQE1kj8vhoeDDm2PoTdkcefAYbofFXDvs1fd+SLshx0/G6h5AjlZveJT0PIRa+tP07R220/b6lxKRopd5G/t5nrbOaJFhxhJI/X/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 03:38:05 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 03:38:04 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][walnascar][PATCH] v4l-utils: Fix QA and build
 errors related to _TIME_BITS on 32-bit
Thread-Topic: [oe] [meta-oe][walnascar][PATCH] v4l-utils: Fix QA and build
 errors related to _TIME_BITS on 32-bit
Thread-Index: AQHb/8no/Li9JqxFiUK7bI/Xm83CsrSNm1Hw
Date: Thu, 11 Sep 2025 03:38:04 +0000
Message-ID: 
 <IA4PR11MB94207CB4386B7615A2F354CCB809A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <18566FD02919233B.1178@lists.openembedded.org>
In-Reply-To: <18566FD02919233B.1178@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=b80c853c-b40d-4d9c-a568-c8c25f2dda07;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-09-11T03:37:49Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|CY8PR11MB6939:EE_
x-ms-office365-filtering-correlation-id: 56b3f34d-2c55-4bc6-0fd7-08ddf0e49de6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?FLDFpeYTBYU0paG3FuK0aNXvBGYJecNQa6t4T2jQabnn7YSwnGh9Vq9oQ4dX?=
 =?us-ascii?Q?1CTuBvt9Abvk3iB6kCqHFkPHeLUSZZW2WJFFiE9UE6XGQAkK20ZHdpyX2NO0?=
 =?us-ascii?Q?c4AOdRiZj912plIm4L33oKBrLUKOsB4aJJtD61AcwCMtQ/p6pmNEmncVOUbt?=
 =?us-ascii?Q?2Pb3g6LhpWNjleyjjPYGGvrO6hAhMS2l2OwbpOnPydfB3HgH+VDk+t6UN0lA?=
 =?us-ascii?Q?euxQrs2hr/38Ev0/WulDKYUlHMGEfwCztxR9CsRqKbglUgRSjH2yFIZIvnJ5?=
 =?us-ascii?Q?FySd37qTLu0ecHRr/lCxGy6ofFtp09051iCYIohX5bpfpIn7T3ybI5YQnIKI?=
 =?us-ascii?Q?0xb55bZTAC6coY9kbPmcb8I1+sjwxR0dKyts++5qHVmhu6AiGOYMrf7vp9mV?=
 =?us-ascii?Q?/i/OOeb4RT93r7nCquNqtq5mvjRT+7nB6iWWCSYAILfi89+XOYOlu8KaZi/3?=
 =?us-ascii?Q?RZn6P77QEKj69jPlIUkwhCUn8IwZB4IQpIT+RGZhFyyyCkT03TPXWoSLRkZZ?=
 =?us-ascii?Q?ZiomOnc5DzsxbT7+G3BvHyyqxeCjmfLId3hGXtoahtg1FnAZkJ4Vs/RiwgiP?=
 =?us-ascii?Q?A1+J2kNWReiLCZGTHnGHKakkd3SI5dd2g9Ft6+DaR5KyimNNL+tG4omTOJeQ?=
 =?us-ascii?Q?bdJl1VZdxAaD74gO+gF/JStTm/EOS/VuF0hx8colKxei65upgEZgeoAABqu9?=
 =?us-ascii?Q?JLcfkJg6Tjq7KaEWcnNI65/hO8wbRRXVS0JcYdtTawkxllKeeQtyhFpNLnTw?=
 =?us-ascii?Q?jipuE/hX6PEk/C/AKj4Fnd3mlmlHk2XFzfaFXxhVX+p8IEWjDN6wQauNoQuq?=
 =?us-ascii?Q?FIwsDMvQq5Pp0LWAhCSDkGCq0UjdwbLwCPLCefs9HB6+Tut1pfXJqYO7irq8?=
 =?us-ascii?Q?4gA5mcPM8E+5+7uA/eU4SKvzrzaRzZJJuUxGWZwwokrYpLlO0MMY49CxQ6AB?=
 =?us-ascii?Q?ChinGt7fPgejKj9Dj/SsVi/cCSJ+yBTV1MllPPwRfc5EFjhtVYG4rUImAGBt?=
 =?us-ascii?Q?2kHm7cwEyi0MTBOnfZMS6epPyMl3OBenujK+Qlf0tEUlMAYzohocDybX2lKi?=
 =?us-ascii?Q?mrYJ0V2HMB7Va7kI5DWz3lygg3xF+nrK5O7Rx+wmwhHLsw7pxzWEeyq1/oSL?=
 =?us-ascii?Q?JBEFgpR7m5HF5yhyWK68SwjFLxvMFDhJcy97XjltEzc+0mInauqBypRZq0Cu?=
 =?us-ascii?Q?jyM35uWLzR4fNcUXAnIPRz3TVRU05NDljsvBHXw9M2QMS6fmrzBh2OcGTPyS?=
 =?us-ascii?Q?JXZs11HysJrHDiRJx/cItvVGUsJsiokU5qGaaW/lXuMQz+vzlt7SQArC5G1r?=
 =?us-ascii?Q?r4wIE2BaNGqhoHy2jZIK9HVlBGFe3cInrIB4eFwvKx1RjpJTRjAr0Eoeh3mp?=
 =?us-ascii?Q?xsjMySH9yUK5VymLukqEySA0W2+P3xJMD36zaqWtIeGCgJHNWEXJAX/5D2tM?=
 =?us-ascii?Q?lGSXrgPYPzaeRJiiaKZbyutxJxZhQOYEECIqFgXBe73z8bGcmRYJmQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2Uq3jy85tSyPjUsQw/pwRQLMNPZDb4m64LbtuRhRCPIsoJIACVjRFwjcbiP7?=
 =?us-ascii?Q?apebsZbF4UQS5MzROG/yEOCbBQxTjOqsJwv0CPt2Wr4ZcaenCKUC4/nZKPvK?=
 =?us-ascii?Q?jpS4JNfh2ZQ7Aa2Bj0EAsWLHRAa7RUhZE/9VMMXyvA9HITgqwta10Kf3bfKX?=
 =?us-ascii?Q?akgTArZ4dU0O2UpIZa22LBrAG0YIazSGJRDYIwNqJC+btjIaovaRlbJePLsM?=
 =?us-ascii?Q?qJi88c4yC99+s+DYrYuxVr/gnA4WU9DwiPIaRkn/qfAyjRoOBYcnC0L7OdyG?=
 =?us-ascii?Q?Bohto/877oXBmVzZG/7OdTJ/zKQTqCkqSqzVeZ8+LAolu2TmPAhjfffA430Y?=
 =?us-ascii?Q?tiv4rDJyi0Sr6CCW9jzb3i75TAduAv7IsELMO5vZKg+yqXTSUFS2bRXNrOer?=
 =?us-ascii?Q?OHaOlS4ubyfCSdSxDJwpMh+KuD3dKFq94UDG+Q3aL5dEtKSIcmFnS1/XNmSe?=
 =?us-ascii?Q?c7J5LY4tUiHsrtYFeaH/0Wf08wOwF7xYSKV5Eb/J8+A3VjvgbagUl0ipTJyY?=
 =?us-ascii?Q?NXYJPyTZAszkeWviyyG6bzrkKxHPyrapVi31b8FmWtlxMCNfDlBvgaNlUT87?=
 =?us-ascii?Q?k3VlIBtY/QQk+KmbetpjpNMBJ+Eqw8oBbHTli+xJGQtwgiu56juKN+tpB6y6?=
 =?us-ascii?Q?nRBWMkcpQJWBwkZ5TUYxhbh2eFtDbtx5+vpf529ZWbJiKghNmdRQGdg8cuse?=
 =?us-ascii?Q?VFpd8G94/G1S+e1QwFO8mgACvcOaLhPfri849Qkwk4ckn+6GkUG/cNRhwPMP?=
 =?us-ascii?Q?9Qb//bHISKo/WQVp6q/TrGgYnM1QOx/9FChI5tJLmNt93rvCrp50j3JIsC9e?=
 =?us-ascii?Q?JDwnkne7Yj0y4ZNQXj1pVU8P7BhA1WbIltkhnMpNJSQpKyEfdAxEMRIdbfg4?=
 =?us-ascii?Q?0TdVTza51rqoiicFjf/7GawWcN+75aMfOPk71x4GgNL4CNDeU2SA13rbqJ3h?=
 =?us-ascii?Q?Hx1Sms0oQqrgmrBvg5iIZjWfCBsvqGGYqVbEGyjd9/RFoYJ7IE/NUA7oW1AJ?=
 =?us-ascii?Q?aUerC8mZDMVvc844FVeBcz2JAd6zhW666ETaHtquXi459r+V1N2Vp+freUxh?=
 =?us-ascii?Q?co+WOdsBu7d7fItpRGwtcYXVDeNSDxnAqxazcVXHRpbZfaLmOXHd1HvWAvxt?=
 =?us-ascii?Q?rH8cNDmdyXTszLfO60zlvasAaFN21vrCn+UXuqoQFSQbQXYtyHei0P8pkB4u?=
 =?us-ascii?Q?OGtMsCLU9G6DsaLolPyZ5XVFeCsqPheebcoeYbWxWK/ypudwH5dLgNs5sb++?=
 =?us-ascii?Q?eGPNz2f2MvWyZDzQR08OIXX6pWb5LumMwTQght9Qip8N7qou8LlM8jtj/XTV?=
 =?us-ascii?Q?capI5XMr+1QciJwPQv/rqaYtfsBVuZiTJwcAeOvK9JmZiWmactICM1JSGfaV?=
 =?us-ascii?Q?hN7poCtfn27orfIZViD7f/FSWQVhQ69EFIqUIlXyLdPAikVejhjq2I0oeUwy?=
 =?us-ascii?Q?2Il1jxBAK/yqLUXI6mXf0aPSkXodWgCOQA60HZtxJ+RtptCj/45sJeidxGC4?=
 =?us-ascii?Q?o2FFRuUyc/ehckvFLd7RvoAhyNqb3GUzp0AmIHPyMjlfvULYxHpGSEnbp+kI?=
 =?us-ascii?Q?qeqx1v07LL6bPnZmbCV8KvxSXbBjhNT/X0NZwHnof5OwRmiPmOAlDDf2CSnT?=
 =?us-ascii?Q?4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b3f34d-2c55-4bc6-0fd7-08ddf0e49de6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 03:38:04.8328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QH6S+ajFDfGUOI5stDpF+MFbcQCLZKfWhaOhZNG8iJHizadWgypX5nXITJ61d9DNqgLMDa4iG3XVP4IiLIzrKe42pxJdUfCU444fzRhZnQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
X-Proofpoint-GUID: VCMsL-B45_CDvRsb5ffa0o4wngW1NIxu
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c24420 cx=c_pps
 a=gXZ/wpAWB1oytwcVMRVXYw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=xOd6jRPJAAAA:8 a=xq3W2uTSAAAA:8 a=18RZwCxeTz_UTRvlDo4A:9 a=CjuIK1q_8ugA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-ORIG-GUID: VCMsL-B45_CDvRsb5ffa0o4wngW1NIxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDAzMCBTYWx0ZWRfX/3YCIUn1ZZaW
 tnTv+bFKUcjz42TEwfw7SnmMODbToHsUQWTcOjYWlAUkA7L6eQ/77x7xFunzbOIfS2ot9m/NjYB
 ttY4H74j4JUHz0ggxTS2z/RE68Pg2Tq0JvDX5QBOQg5qC71toCw1k7r+IHXPcH3sZnfT3qVhJQQ
 TvC7yze695g5MOnlgjjkRNjIJ6JivSpU3cRVE0aTiWBouY7yTZP5DCGNXqtYqpwzzXDMICNacF8
 Fr7wASH8B4wSw+p2jtIzLgOEl0apcjL1K93ueBkXNtoiVZvfr5mYr3TWcNg9UW1c9r+EQHwOFje
 AbGxYlM9VvAAtdPa3UVY9BYopVwpwaRjFLDp2dHqhzXe312zxeylO9JonyM+Co=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 03:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119351

kindly ping for walnascar branch.

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Monday, July 28, 2025 10:14 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][walnascar][PATCH] v4l-utils: Fix QA and build error=
s related to _TIME_BITS on 32-bit

From: Jiaying Song <jiaying.song.cn@windriver.com>

* Remove GLIBC_64BIT_TIME_FLAGS=3D"" to enable _TIME_BITS=3D64 by default,
  which avoids the following QA issue during builds on 32-bit systems:

  WARNING: lib32-v4l-utils-1.24.1+git-r0 do_package_qa: QA Issue: /usr/bin/=
cec-compliance uses 32-bit api 'time'

* Undefine _TIME_BITS to fix the build error:

  /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=3D64 is al=
lowed only with _FILE_OFFSET_BITS=3D64"

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...on.build-fix-arm-_TIME_BITS-64-error.patch | 38 +++++++++++++++++++
 .../v4l2apps/v4l-utils_1.28.1.bb              |  5 +--
 2 files changed, 39 insertions(+), 4 deletions(-)  create mode 100644 meta=
-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BI=
TS-64-error.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build=
-fix-arm-_TIME_BITS-64-error.patch b/meta-oe/recipes-multimedia/v4l2apps/v4=
l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
new file mode 100644
index 0000000000..f41dde0e16
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix
+++ -arm-_TIME_BITS-64-error.patch
@@ -0,0 +1,38 @@
+From 5aabd01e415374fc97eebe80d4635c3bae728f81 Mon Sep 17 00:00:00 2001
+From: Hans Verkuil <hverkuil@xs4all.nl>
+Date: Sat, 12 Apr 2025 12:30:13 +0200
+Subject: [PATCH] meson.build: fix arm _TIME_BITS=3D64 error
+
+Undefine _TIME_BITS to avoid this error on 32-bit arm:
+
+/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=3D64 is all=
owed only with _FILE_OFFSET_BITS=3D64"
+
+Upstream-Status: Backport=20
+[https://github.com/gjasny/v4l-utils/commit/d517cfdcdc16533ab7e06e97c07
+ca089cf261aef]
+
+Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ meson.build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 269a9da7..31927cda 100644
+--- a/meson.build
++++ b/meson.build
+@@ -53,8 +53,12 @@ v4l2_wrapper_args =3D [
+     # As the library needs to provide both 32-bit and 64-bit versions
+     # of file operations, disable transparent large file support (fixes
+     # 'Error: symbol `open64/mmap64' is already defined' compile failure
+-    # otherwise)
++    # otherwise).
++    #
++    # Also disable _TIME_BITS=3D64 since this is allowed only with
++    # _FILE_OFFSET_BITS=3D64, which is now 32.
+     '-U_FILE_OFFSET_BITS',
++    '-U_TIME_BITS',
+     '-D_FILE_OFFSET_BITS=3D32',
+     '-D_LARGEFILE64_SOURCE',
+ ]
+--
+2.34.1
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/meta=
-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
index afe217e1f3..5d21df04af 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
@@ -13,10 +13,6 @@ DEPENDS =3D "jpeg \
 DEPENDS:append:libc-musl =3D " argp-standalone"
 DEPENDS:append:class-target =3D " udev"
 LDFLAGS:append =3D " -pthread"
-# v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to -# both 32 =
and 64 bit file APIs.  But it does not handle the time side?
-# Needs further investigation
-GLIBC_64BIT_TIME_FLAGS =3D ""
=20
 inherit meson gettext pkgconfig
=20
@@ -29,6 +25,7 @@ SRC_URI =3D "\
     git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable-1=
.28 \
     file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch=
 \
     file://0002-media-ctl-Install-media-ctl-pkg-config-files.patch \
+    file://0003-meson.build-fix-arm-_TIME_BITS-64-error.patch \
 "
=20
 SRCREV =3D "fc15e229d9d337e46d730f00647821adbbd58548"
--
2.34.1


