Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53C9CDB465
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 02:00:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.198242.1697508024879708011
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Oct 2023 19:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SfrbSrNv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8654aefd5e=chi.xu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39H0p9YM024272
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 19:00:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=xdeWKSBgZEbE0xp3Od5hTztgfcfZDH1o9paegUijgjM=; b=
	SfrbSrNvoZDNTlfO+HiLqjNLGe/jSvKQNqrciYxAfXE6vgTtzIoB4qZTcORMDgMr
	9meWU0u1Chbp/ZozSJtvu4tB8oBCRXA1Y8dZInODO6j9JylmUsgPjWRzrBqLOujs
	7nwUScpIZg4y3jE4iXFVFb+tadwolh2qPm/PMvUx0rzx/O5Y4KzSOBPHFmDwMa64
	9fQkaw6fE3EefLHGW8pX94rfCWnLjbogiZtCUB+NgZzk0ZjaIGwAON8m4WHAz5pQ
	JGLzFER+3KX1xBTPl/zcr9NqOdKkEBE1Td1rLd32Y6eYRQVk0eEF5PszyCughxVe
	Q3Fgy5s5goQMwSsLwilJSg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tqp90tdek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 19:00:23 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39H20NPV025510;
	Mon, 16 Oct 2023 19:00:23 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tqp90tdej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 19:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI8GLeuOR6NjULpoKq823EUEUeLZmqTaOLT/805OGBztMLodJej0M7zbEijihpwsRxhZwvTSCzST4YN29pqOhK9u6eaBtKDQcl4OHYS5sUwozZou6TvYHcjA5dwe9aKMkY05MJfBlrzxWUgJhE+Q9FiZ0tJqglgLwYZWiN+9Q/u8F72AyI+HVslOtrTtmNOS2oNVlm/R6QVX/kqmIYxpMFt0dAfn5fFuXmJ4bcpVkmZ5z3qFIO+Zfpu2geKLhqYfa5C8WTC6UZTHlvheANS9XerrB9o3+eaWcuuTxW4H2Ev1ULTlimf1PreMBMB9CPKWHrF04AviS90VvSm+BJXXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdeWKSBgZEbE0xp3Od5hTztgfcfZDH1o9paegUijgjM=;
 b=Ub2cspMkwycA1zTR1KLCMLh5aqaCyp+LmidJi0tKz3FJR2xzk+PYjAI8sq/3wLiXvjRalNGJg7bCZeqleHo51gpK4jMNH12s4pBKbwpWf/sLYGediM2kEuOhyenjSCAgDT3ZGL+mNcNirpz4BN7tdYa52cxEoJfoj28gcg4z7Hge0lnqU70ohyUhzB52MMLj07moi2uppbYhPw1LgKUuYtlFup9kP1q2AdPSUFtAEHld892RI64vmME9FkmRwp5fFUsBMS1ADzcWL/P9yfc8xl/pKv/TasgH9cSAJ/RTcT6rk55PVYv9esnfZVexBTRP19fJl7+Qss81/+WDDVyvEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13)
 by MW4PR11MB5798.namprd11.prod.outlook.com (2603:10b6:303:185::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 02:00:13 +0000
Received: from DM4PR11MB5390.namprd11.prod.outlook.com
 ([fe80::1115:b93c:23c0:8ff8]) by DM4PR11MB5390.namprd11.prod.outlook.com
 ([fe80::1115:b93c:23c0:8ff8%7]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 02:00:12 +0000
From: "Xu, Chi" <Chi.Xu@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] re2: Add ptest support
Thread-Topic: [oe] [meta-oe][PATCH] re2: Add ptest support
Thread-Index: AQHaAJyP08nr04eszk+10wuentp+37BNOJaw
Date: Tue, 17 Oct 2023 02:00:12 +0000
Message-ID: 
 <DM4PR11MB53905F02ADA3D27604B7CF1B9AD6A@DM4PR11MB5390.namprd11.prod.outlook.com>
References: <20231017011718.144753-1-chi.xu@windriver.com>
 <CAMKF1srPUnze5t5win9RhH_XOfC+dcCxafsz_v7dtmkZduCErQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srPUnze5t5win9RhH_XOfC+dcCxafsz_v7dtmkZduCErQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5390:EE_|MW4PR11MB5798:EE_
x-ms-office365-filtering-correlation-id: b6e3242e-9e8e-4252-5176-08dbceb4ccc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TmdfL0fdPxCpduWVz6DA2C2zg5Y16CNBMQ1SSbVWjTFHhWM8IueKF5d4jfywavSzGykwM/peMI0yvejgk6/8v929CdGeHWDSwCzTTq837UMlQM4y6Oi42Y8XzEyzNdLcyVLJDeqr0JeN4Pms/rJn5ytESXNvXnvL5SYCns6yb5JoVfVKncNN+Ws681QxiQ70m+iL9h8g11BgeobfmSxCJHuTcl/Tj9KG0qqm/mOXusDrNyymrT1QZckpLgcGXiB3hO9UTi7g4TYXo8/SfW8JNCKzSv4Lz/sH4DkB8k5rlmEmlWMUaJEW7fuVwdcqn+1rKIG6RU2tv0ZrF2KZDPDTq3fYzGa4QTzhkBY7Vt/zzGkwML7XfddqO8eJox0cj1VFImAxOdKnXUKIWMNa7K2wGaHlclUNyP0Ee2PBCMb3ZjlZDLBs603aNcR9I64ARLTR6UO6hl3J74KC01CsjhSwDe+HAFx2GNaTHTlrJGh/Rn0M/Jxeyd56thX3VfTM2b9DMsf0eOKhuyZaZV7H3H0XQNpSkDkCyLmKuaUKWfu6f3UekNbrbf89Qc/olwfTtrNZYSKrxieY5sTgsfF025vqEadF5AVGphY2lEwCrC6R0LEP9nuCEOVQSVLSQPnjG/4c+B56WXsvtO/bA86SdKnx1K9+eUsRBV0eBFfmeI5R/uY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5390.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(39850400004)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(64756008)(66946007)(66556008)(66476007)(66446008)(76116006)(966005)(8676002)(8936002)(4326008)(5660300002)(71200400001)(66899024)(52536014)(7696005)(53546011)(6506007)(55016003)(38100700002)(38070700005)(122000001)(9686003)(86362001)(26005)(83380400001)(2906002)(33656002)(358055004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QnZFSTkrdmZGRUJ5aDZUSnFXMEU2L0FXZGlhZ2FEK2ZnL1pJV3dVSmlxWmtl?=
 =?utf-8?B?RGJUcG50RFpWWVFyZ0JFSTN1WlBCaEJyNFlkUkw4NE5IZjN1Q2s2SC9NeWFF?=
 =?utf-8?B?bTVtSitLR0oyL2N0ajBNbm0ybS84UUtXb20vcVlHVmd0dmhQQmUvc2Zlek55?=
 =?utf-8?B?VnFTd0MrczJnV0hkTndMSlRqKzMzckFJb1hlMzlFbkVvbkwrT1B1UWNCZUND?=
 =?utf-8?B?eDl2TUFuOXRmOXlnZnhyL1V3djZFeVh1ejlhK3NGcXVKbU1kN1dOMTlVcThF?=
 =?utf-8?B?d2M0RkRjYmsrVWZJMFNPeEV1T3EvQ25EQXdFY0RHaTY1NFcxUTROWFNyd0lN?=
 =?utf-8?B?QWhrMlFTTjVmQklLdzRReDBxWFVnbnVjNGJockExem1aSWdROWdsV2RaRTZS?=
 =?utf-8?B?bFFleXVsR3loMjlVWTFrTk02TkhlS1hCS3Q3MXJ4MlppOW55Z2E3cktQTzA2?=
 =?utf-8?B?clZlWG9jcEk2eExPUnJraEhaUXF1TCtwZlhtNVYrUjZLQ2FLbmxYUFlIc2Er?=
 =?utf-8?B?ZGxoeisvVFp0UkFnYklBRWZ1Q3V6ZzNDakRoMlhQNGVkY3IwajhNWVhDakM3?=
 =?utf-8?B?bER2YWZXVE9CaUdQU0Vsc0dZSkZVc1ZCSFN6NHA0K0pCczdhWWFocEJrRzIr?=
 =?utf-8?B?VktIMGIwY20zcEt3cUUrczhpL2R0QldLMTZ6cTBVMVhWVTl6SFdCbVFMbFFN?=
 =?utf-8?B?UGloQ2l0MG9Qcnkxb3ZnWFpJVmNGcndXeGh0NFlnU3cxUi9wNGdMc2xoVHZM?=
 =?utf-8?B?aUNlOTdiaXFKVXNrZVJaZXM1a3d1ckN5dFVTR2dLb1JkK2dWeS9QQ25nSDlG?=
 =?utf-8?B?TVRBUlBjY0IzcE9yWlJwV0xiOXcrMEc3c1lFS1M2T25qeWo3c0xkZ3c4TThq?=
 =?utf-8?B?Ylp0YkliVkQzWm5FdGpPN2loZXkrWm1pWWk3UjFhWVVSekhKdnpsRmk0TXZK?=
 =?utf-8?B?cGtiekVzZUVBdWY3ekh3MUtIU0lmZGpkaml0U0pZNmphdjI3OVZURXNla3pq?=
 =?utf-8?B?MVlieE1EQzZNcG9kdlNyemJIQm9wOXZvN3NlQkt5aU1EdWFCQWZJU3h3cjRJ?=
 =?utf-8?B?WmpKM09XTjQ3eWRlRUJSZUZpaHBMVUtpaGR2Uk5EYTdrYWQ2R09YbHdHZnc1?=
 =?utf-8?B?b3FyclpDcngzUmlPRHV1Y0FXczJ5bk9Kd1lZSmp3aTBhOEFKSVcrdUtKVmti?=
 =?utf-8?B?UmxQWFpSalA1ZnJ6SE8zb2Q1SXdJNXVwMUZDQng5WEJ0SW8zSGtzUGRWVGI1?=
 =?utf-8?B?cmJFY0ZQZHhRMVBlT0lPeDM5VGdYUU41bmFkeGc3L1hraTBsc1gxdWZBRHhJ?=
 =?utf-8?B?NkZGTGFRYURqU2xWNm5Xckpic3YzdEJCSmZBTkRrbElBS2F1ZGVGS0FLYVRJ?=
 =?utf-8?B?SU5UbHZSc1hBWlpzU29iTVhCOGtwR0pFOFJMUTduOE5XWlhpVndJR3lHUkk1?=
 =?utf-8?B?NFZZOEh5Q1A2bHNTQTFqMmFOaHVuRWRTc04yR0F3c2dGZmx1Z0JyZGx5anE3?=
 =?utf-8?B?N2xhdExRQzJaUCthUElZY0l2RkpUcklUcWJnRksyWTFXSFNoQjJXRmJxVlNu?=
 =?utf-8?B?ZDBHVWhjeFY0NjkvUW9TZDVlbGYza0Ztdk1jRWdFaUF5QjZDSC82bkx1Ulpq?=
 =?utf-8?B?UnQyVGcyNFU2aDg5UEZxd2tBQmRzSitaZDRUV3pnVjBSWXRzb2I3YzRwSnN4?=
 =?utf-8?B?aU8yeFAzMXVFZWZBdEtMdFpXa0Vvazd3SEdTYjlKZE5rT2V6TkpUQVAwNk5v?=
 =?utf-8?B?eEdvMTMveHdSTFZBaE1hb2xBWU1SUWRmamJKL2ZNYXVJU2JSazdhWVFsRFRt?=
 =?utf-8?B?U0NPcGQ2YlRCVWtPQ3FaTSs2U0tXL0lySDlMcHJLWG9oSTZES0dvQzV5RWE0?=
 =?utf-8?B?OGFYTSt6b0RsTVNTbVc0V0UyR2JTYmhhcGpuZE5Vcm5yaFBmZFR6cGNTV3E1?=
 =?utf-8?B?OXdWZ21HUTBCbVpIbktmUzdvT3k5SXlhMlFiNFJYOFB3cnpRNm5RWjFGQ0lm?=
 =?utf-8?B?TnlWRW1pQXV6NjdIbUV0UG9QTVlRVFo5RG1GeWdNWE45a2dRamF2WEdVN2U2?=
 =?utf-8?B?TXpub0tMaVBZZlFBWmJXOTlGSlREK0xpVG93YkNCVVRjaEsrSWtMR25UTWhU?=
 =?utf-8?Q?UsWM9Tx4M1bJuIW7+OSPMnNE6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5390.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e3242e-9e8e-4252-5176-08dbceb4ccc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 02:00:12.7755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: llfK2+D01DTeQrO5NuKzpCR9wTt7oYoI1J2BZHBlxvs2TitSPLJolxZ9d+31CGV9EzqMMmRT8/ilpUr7cXz6dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5798
X-Proofpoint-GUID: Cc6Dh51Rtw08CyRBc1nhva8TS_mjBexo
X-Proofpoint-ORIG-GUID: gdylfi_n0RMki_5VZWpDX_z7TzIAhkKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310170016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 02:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105547

R2V0IGl0Lg0KQ2FuIEkgdW5kZXJzdGFuZCB0aGF0IGlmIGFsbCB0aGUgdGVzdCBjYXNlcyBwYXNz
LCB3ZSBzaG91bGQgYWRkIHB0ZWF0IHRvIFBURVNUU19TTE9XX01FVEFfT0Ugb3IgUFRFU1RTX0ZB
U1RfTUVUQV9PRSBpbiB0aGUgcGF0Y2g/DQoNClRoYW5rcywNCkNoaQ0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+
IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTcsIDIwMjMgOTo1MiBBTQ0KPiBUbzogWHUsIENoaSA8
Q2hpLlh1QHdpbmRyaXZlci5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0hdIHJlMjog
QWRkIHB0ZXN0IHN1cHBvcnQNCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBh
IG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQhDQo+IERvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kDQo+IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IFRoYW5rcyBmb3IgYWRkaW5nIHB0ZXN0LCBJ
IHNlZSB0aGF0IGl0IHBhc3NlcyBhbGwgdGVzdHMgYnV0IHJ1bnMgZm9yIGxvbmdlci4NCj4gTWF5
YmUgYWRkIGl0IHRvIFBURVNUU19TTE9XX01FVEFfT0UgYXMgd2VsbC4NCj4gDQo+IE9uIE1vbiwg
T2N0IDE2LCAyMDIzIGF0IDY6MTfigK9QTSBDaGkgWHUgPGNoaS54dUBlbmcud2luZHJpdmVyLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBDaGkgWHUgPGNoaS54dUB3aW5kcml2ZXIuY29tPg0K
PiA+DQo+ID4gVGVzdCByZXN1bHRzOg0KPiA+IHJvb3RAcWVtdXg4Ni02NDp+IyBwdGVzdC1ydW5u
ZXIgcmUyIC10IDcyMDANCj4gPiBTVEFSVDogcHRlc3QtcnVubmVyDQo+ID4gMjAyMy0xMC0xNlQw
ODozNg0KPiA+IEJFR0lOOiAvdXNyL2xpYi9yZTIvcHRlc3QNCj4gPiBQQVNTOiBjaGFyY2xhc3Nf
dGVzdA0KPiA+IFBBU1M6IGNvbXBpbGVfdGVzdA0KPiA+IFBBU1M6IGZpbHRlcmVkX3JlMl90ZXN0
DQo+ID4gUEFTUzogbWltaWNzX3BjcmVfdGVzdA0KPiA+IFBBU1M6IHBhcnNlX3Rlc3QNCj4gPiBQ
QVNTOiBwb3NzaWJsZV9tYXRjaF90ZXN0DQo+ID4gUEFTUzogcmUyX3Rlc3QNCj4gPiBQQVNTOiBy
ZTJfYXJnX3Rlc3QNCj4gPiBQQVNTOiByZWdleHBfdGVzdA0KPiA+IFBBU1M6IHJlcXVpcmVkX3By
ZWZpeF90ZXN0DQo+ID4gUEFTUzogc2VhcmNoX3Rlc3QNCj4gPiBQQVNTOiBzZXRfdGVzdA0KPiA+
IFBBU1M6IHNpbXBsaWZ5X3Rlc3QNCj4gPiBQQVNTOiBzdHJpbmdfZ2VuZXJhdG9yX3Rlc3QNCj4g
PiBQQVNTOiBkZmFfdGVzdA0KPiA+IFBBU1M6IGV4aGF1c3RpdmUxX3Rlc3QNCj4gPiBQQVNTOiBl
eGhhdXN0aXZlMl90ZXN0DQo+ID4gUEFTUzogZXhoYXVzdGl2ZTNfdGVzdA0KPiA+IFBBU1M6IGV4
aGF1c3RpdmVfdGVzdA0KPiA+IFBBU1M6IHJhbmRvbV90ZXN0DQo+ID4gRFVSQVRJT046IDIwODUN
Cj4gPiBFTkQ6IC91c3IvbGliL3JlMi9wdGVzdA0KPiA+IDIwMjMtMTAtMTZUMDk6MTENCj4gPiBT
VE9QOiBwdGVzdC1ydW5uZXINCj4gPiBUT1RBTDogMSBGQUlMOiAwDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBDaGkgWHUgPGNoaS54dUB3aW5kcml2ZXIuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRh
LW9lL3JlY2lwZXMtc3VwcG9ydC9yZTIvcmUyL3J1bi1wdGVzdCAgICAgfCAgMyArKysNCj4gPiAg
bWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvcmUyL3JlMl8yMDIzLjAzLjAxLmJiIHwgMTYgKysrKysr
KysrKysrKy0tLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBtZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9yZTIvcmUyL3J1bi1wdGVzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBl
cy1zdXBwb3J0L3JlMi9yZTIvcnVuLXB0ZXN0DQo+ID4gYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9yZTIvcmUyL3J1bi1wdGVzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXgg
MDAwMDAwMDAwLi44YmQ1ZmQxZWYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvcmUyL3JlMi9ydW4tcHRlc3QNCj4gPiBAQCAtMCwwICsxLDMgQEAN
Cj4gPiArIyEvYmluL3NoDQo+ID4gKw0KPiA+ICtjdGVzdCAtLWZvcmNlLW5ldy1jdGVzdC1wcm9j
ZXNzIHwgc2VkIC11ICdzL1wqXCpcKi8gICAvZycgfCBhd2sgJy9UZXN0DQo+ICsjL3tnc3ViKC9Q
YXNzZWQvLCJQQVNTIik7IGdzdWIoL0ZhaWxlZC8sIkZBSUwiKTsgZ3N1YigvU2tpcHBlZC8sIlNL
SVAiKTsNCj4gcHJpbnQgJDYiOiAiJDQ7IGZmbHVzaCgpO30nDQo+ID4gZGlmZiAtLWdpdCBhL21l
dGEtb2UvcmVjaXBlcy1zdXBwb3J0L3JlMi9yZTJfMjAyMy4wMy4wMS5iYg0KPiA+IGIvbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvcmUyL3JlMl8yMDIzLjAzLjAxLmJiDQo+ID4gaW5kZXggNzhiZjY5
NWE0Li5mZTIxMGQ1MTAgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQv
cmUyL3JlMl8yMDIzLjAzLjAxLmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQv
cmUyL3JlMl8yMDIzLjAzLjAxLmJiDQo+ID4gQEAgLTYsMTcgKzYsMjcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9DQo+ICJmaWxlOi8vTElDRU5TRTttZDU9M2I1YzMxZWI1MTJiZGYzY2IxMWZmZDU3MTM5
NjM3NjAiDQo+ID4gICMgdGFnIDIwMjMtMDMtMDENCj4gPiAgU1JDUkVWID0gIjI0MWUyZTQzMDgz
NmU4MGY5M2Q3MDRkMWYwNmNkM2U3ZmUzMTAwZjUiDQo+ID4NCj4gPiAtU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL2dvb2dsZS9yZTIuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBzIg0K
PiA+ICtTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZ29vZ2xlL3JlMi5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMgXA0KPiA+ICsgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5z
KCdQVEVTVF9FTkFCTEVEJywgJzEnLCAnZmlsZTovL3J1bi1wdGVzdCcsICcnLCBkKX0gXA0KPiA+
ICsgICAgICAgICAgIg0KPiA+DQo+ID4gIFMgPSAiJHtXT1JLRElSfS9naXQiDQo+ID4NCj4gPiAt
aW5oZXJpdCBjbWFrZQ0KPiA+ICtpbmhlcml0IGNtYWtlIHB0ZXN0DQo+ID4gK1JERVBFTkRTOiR7
UE59LXB0ZXN0ICs9ICJjbWFrZSBzZWQiDQo+ID4NCj4gPiAgRVhUUkFfT0VDTUFLRSArPSAiIFwN
Cj4gPiAgICAgICAgIC1EQlVJTERfU0hBUkVEX0xJQlM9T04gXA0KPiA+IC0gICAgICAgLURSRTJf
QlVJTERfVEVTVElORz1PRkYgXA0KPiA+ICsgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQ
VEVTVF9FTkFCTEVEJywgJzEnLA0KPiA+ICsgJy1EUkUyX0JVSUxEX1RFU1RJTkc9T04nLCAnLURS
RTJfQlVJTERfVEVTVElORz1PRkYnLCBkKX0gXA0KPiA+ICAiDQo+ID4NCj4gPiArZG9faW5zdGFs
bF9wdGVzdCAoKSB7DQo+ID4gKyAgICBjcCAtciAke0J9LypfdGVzdCAke0R9JHtQVEVTVF9QQVRI
fQ0KPiA+ICsgICAgY3AgLXIgJHtCfS9DVGVzdFRlc3RmaWxlLmNtYWtlICR7RH0ke1BURVNUX1BB
VEh9DQo+ID4gKyAgICBzZWQgLWkgLWUgJ3MjJHtCfSMke1BURVNUX1BBVEh9I2cnIGBmaW5kICR7
RH0ke1BURVNUX1BBVEh9IC1uYW1lDQo+IENUZXN0VGVzdGZpbGUuY21ha2VgDQo+ID4gKyAgICBz
ZWQgLWkgLWUgJ3MjJHtTfSMke1BURVNUX1BBVEh9I2cnIGBmaW5kICR7RH0ke1BURVNUX1BBVEh9
IC1uYW1lDQo+ID4gK0NUZXN0VGVzdGZpbGUuY21ha2VgIH0NCj4gPiArDQo+ID4gICMgaWdub3Jl
IC5zbyBpbiAvdXNyL2xpYjY0DQo+ID4gIEZJTEVTOiR7UE59ID0gIiR7bGliZGlyfSINCj4gPiAg
SU5TQU5FX1NLSVA6JHtQTn0gKz0gImRldi1zbyINCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo+
ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBh
bGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgj
MTA1NTQ1KToNCj4gPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRk
ZWQtZGV2ZWwvbWVzc2FnZS8xMDU1NDUNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDIwMTAxMTUvMTk5NzkxNA0KPiA+IEdyb3VwIE93bmVy
OiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVu
c3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
DQo+IGRldmVsL3Vuc3ViDQo+ID4gW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiA+DQo=

