Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A65EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 15:41:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16081.1686757315277364728
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jun 2023 08:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EXoieDC8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=552986e421=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EBJ5WV026447
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 08:41:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=7QLJfZ0t2Mic4SQWZqd/h0z7eA0dKzf3YXBYGHWxxoc=;
 b=EXoieDC8q86OsZrEY/jEcrNDMQwlLLYq84gfIHGah6jmjeGojcDmeV2FZx/3q99+oMJw
 nVYamBdV1tgMCQdb0hOaxx2eIZE9+J/ms9gbreyaKsk0EApDDLVZOiTFYEtj8ce/At0a
 twoVEO/5COcpF5Laptzkwk7WBcjaazQmXbK1E0JLE+6hray9X9JLz7MWYcwwb/5um1ra
 WRpOMsHRAivZuLCU0JiAlvOZsbSx0ou0DHzt//wLDfWBKUXdoHZW2Fo6f+vz0zDuOCp7
 bzmB+pPRGBL/l4MtDLBmiCRAlb/dWnW6p3ixCsBHMe2aHiCd9lVxGJzy4yNoSxoHSa05 WA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4mf33vm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 08:41:54 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35EFfslr023847
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 08:41:54 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4mf33vm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jun 2023 08:41:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nb/16llif4WPilbXYayfeq5mgyu7cfuG6AqWCHQb/ALWvTv9m6kzZavZZ07Hp6B4erkz5/wLI+KQq7NP3anS6+OXQQcQsk0pzDlxJ1ojK2BCcafASPgTJx6ixvM9R9enfE7RFzzdn3RcoVYfjt7iQs6o5661xP5iOjF1ttjF4+vAE7bDtsygBpCsX3VhcrQztH23GRp+Ivnp6b6cbodtrfjacqtoF0emvC1s4uak2YHgt7Nw7VTc5esycdwuT2mUAY41hXiXOXlB5tXM86LCH8PvLtx3+nAWwIx7JAawlLUepN36SUBOIblpvmTNPEqZlsXgog1bIbrhUlyp56g2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QLJfZ0t2Mic4SQWZqd/h0z7eA0dKzf3YXBYGHWxxoc=;
 b=QunJdJZR2/bkzG6+HOTLliKLYJ4+PuAlpzr8KWMWsBOrIccsbSJ9GAiDAljM1DN7sfnucd8h4Q+8NqBfLcKIttSbYV4VUdcviXE6hcyXzxVvAIBwActqX3PVrJqiL9aUpN9/+HVmR6uPPJ3x8zyaTuI/vTwrEF3wvm2D/LdNHyUnSYtZ0kh85GDuuM2A8ADlAjSd9jRShPhWWwqv+VUJhWRVaQ3BA0IAMTxbmExnuszICDu6OgqZqkiVWFSnKTSUDsK/EfMz4AArCMl1MeeRvKZa+8ricKk0RwRQ/ulqOQERzRw7LvDdDa3AlJwpfQFm2J42srwyRI10c5mqOHgEEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 15:41:50 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::c257:292:f881:ea]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::c257:292:f881:ea%7]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 15:41:50 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [v3][meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle
 (continuous)'
Thread-Topic: [v3][meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle
 (continuous)'
Thread-Index: AQHZnsljOICI6Ji8M0qr6RsO7RH1sq+KZ9iAgAAFs5A=
Date: Wed, 14 Jun 2023 15:41:50 +0000
Message-ID: 
 <BY5PR11MB399222744470B071426ED281885AA@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20230614140611.2415960-1-joe.slater@windriver.com>
 <CAMRc=Mdh3po_oMNU4mRJxkzatgaDGCJE-JNX3o4zdQp3iQZ5Hg@mail.gmail.com>
In-Reply-To: 
 <CAMRc=Mdh3po_oMNU4mRJxkzatgaDGCJE-JNX3o4zdQp3iQZ5Hg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|DS0PR11MB6446:EE_
x-ms-office365-filtering-correlation-id: 611d7c51-87d5-4867-31c5-08db6ceddea5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CAe1cwLz311xiVb19Ln3Mg+5IEmGy3OPsI2INGGnQ0ZfWLZ1fGGhxXP2A6qAiTFtqgr1NAys4gmBe0BsTcYYh8q+ykhw1j57H5unCZfqQiTpIKnEruYY+prdaRrDsqklw2Unwz/tW8Tlf/RBnGuitkuLJp/qLXATmdNEDOF2Fpjc8eiN4KLrP54qYAruhCBAOdu1gyyCXwxMsU/m4qA03IVCBGo0Gi3dZrG9rDsOapKywSUCS9VphL5ziJOuNJC3K13q3xGas2ipNTL0PcAgfHjzFrfiPRPpd830MzCnj5i6yidklKwuq8s7joPZOor8QyQFDEDcerI1a11oQvs+pgwhi9J9Ke/Wm35s65cmMU8cKHJjHyXlXJFa9ICMZ2xYDnvIWHHL/Xto0KBWwLckzBsNEUgZyyub+FCY2oSnIl4PAJBUIkRVnSM158+plU9rpxuOG5aoswmER/je7ZfQaXEH8IlBJ+YBLroQMfe+htv9hger935M169AMcJdJZoKgv4CER521eGuZ8U3sGdOJzXwaDPWhrU5ehcZxAYJcu2Yt1ozmUb2Jocyy3Tifm/WDXv9p6tUjJUOW8qgyf/+HBwg4uGj37zcg3dJwUXpSU2wre5yiYSvWPvRELYS2AW8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(366004)(396003)(346002)(136003)(451199021)(122000001)(38100700002)(38070700005)(55016003)(71200400001)(478600001)(54906003)(7696005)(316002)(52536014)(41300700001)(5660300002)(8676002)(8936002)(64756008)(66476007)(6916009)(66446008)(76116006)(66946007)(4326008)(2906002)(66556008)(83380400001)(26005)(9686003)(186003)(107886003)(6506007)(53546011)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OHdqM1NHQlpBTEJ5UDByRUszZlBJTWZzQ3ZReno3N083VlYzNnc3UXh3M0xK?=
 =?utf-8?B?VC9laUM2NXB0c3UyMUhZVEY5VVJxTlpnK04rKzducjhRMEpSUmNCQUhOQ1NO?=
 =?utf-8?B?MXJLUDNpNy8xU2VZbXRVeVk0U2RnTC9YWEJZaklLTmJaZUM4aGcwK1BBYThj?=
 =?utf-8?B?a2NUKzlCbzdQNGFWQkwxWFpwcGxQa3ltS2NJeHZYYmhRZUFYRjVMZHpHeWR2?=
 =?utf-8?B?cUNuT3YrNjdZblJPUUQ1UXU2cUNvMlZjdjJrbGUxNGE5WUN4MTdkem9TN21i?=
 =?utf-8?B?ajVZb3hwQWFPNy9aNFhsTXlhLytHVnFUZ203U0JaQk5RL0d2ZnpGM1VCVnpa?=
 =?utf-8?B?WXJNQjEyVHN5cHZsR0lnbFllT1E1NzJrSi9kbDY5aC9uclhmTWFzNG9oYWlC?=
 =?utf-8?B?QittNnZhWDI3V3U1V2RTRER1c2VBK1VjK2RaMEsvVks3MHFZa1UrUE5PZXFr?=
 =?utf-8?B?K3lGWi9PQWt3Mk54QkJaUFVxMWxuTHBDQ2g2RWFnK1F6elNma1RDZW1LRVJp?=
 =?utf-8?B?SjkyVmpJMDJuYjNtakJtVmJhaVZLdU9YOW9MaFk0bFQ1em1BaTYySUVPS2pP?=
 =?utf-8?B?ZldPSjR2VkFCWTZnY0tjNXJndlM0WlRHVXViWllSR0dXR1cwdjFCeXprcVZR?=
 =?utf-8?B?Snc4NDNESlc5TEpydXRGWFNZQkpxNElBUnZSajZYcHdxU041eFZaeUdtRjZx?=
 =?utf-8?B?TUVuWEluOSs0VFozYkZLNzhOaFY3RktZRnRYSlZ6VkhmMFhVV2RKN2VVbUxw?=
 =?utf-8?B?ZjNaQklsSzBqMzR0RXBTQWVSeHRvV0RRS0hBREVPYjgzeDVUZUlveHlSdzJv?=
 =?utf-8?B?MThldExXa0ZwT0xmQ1RzUVFEKyt1SXlnY2ZXTDkxdHIwK3FKcWNwTGE4WnlT?=
 =?utf-8?B?Vm9jYTlDQ0gyLzVLS2p4REp2RmRFcGRjbHgrQTBYeEVFWmxoYjRtUlI3SHlW?=
 =?utf-8?B?ZFJlSzU1UnMyMEVtRzBuWW5UMTRRUFdUdit3bkNKeDc4ckJTWlRQM01QUWJ4?=
 =?utf-8?B?OGxkeDYxc2JWbkkrT3B1U0lmSm9zYktYQ0lud2VOelNQSTd1YVQ5YUl4a3Rr?=
 =?utf-8?B?WmUyeUh4MEJ6KzY3WkVjMGtnYWV4QzB1a1B6WXZFeWswaFFLRTBoaHdZd1Vr?=
 =?utf-8?B?T1VlNnR2ZGJvOW9HOU1PaGJaMUh1Mmw4TFF0QWV2Wk90NktRY3NNS1B1eGhx?=
 =?utf-8?B?SDh6YzVlOG9VREI0OUplTHFIS2kzUnlPNmhxL0dPTXlPbjlZcy90Nm9JaXJK?=
 =?utf-8?B?a0FOclJoQkpOM3ZOd1pKNE45WVhWU2hLMis2THlKTXJ4Y1RVNG80K1loSURQ?=
 =?utf-8?B?L0VUUFFNRGJxeHhJQytqRWdoS1BIU3RmQ3VYY3ZmV1dUSVJaMUh4VVpHbDJu?=
 =?utf-8?B?OUludWFmYWtadndHMVhRMnBxcU9CSGhjQ1VQdUJFaEo5d0gxTkFXY0ZET1pY?=
 =?utf-8?B?Vk1GRUlPZ0d1QnF1clBKYzRhLzYxR1JnZ0VDcm01Z0QySW9WNS8xOVltc2J5?=
 =?utf-8?B?VDNSNzgwZ1Z0YjRnU0VuTnRISG9Pemd4N3NQbHQ5aE8xVm5ycnM2UmxPQWFq?=
 =?utf-8?B?eWxQMWNJRThQVmRjalorRGdXWk5rRmE2d25wQmFRbFNCWmJjSXpBNmlUUWlm?=
 =?utf-8?B?c0Ntc2h2anRGSTNwZTdjZDNxb2ozOTdSWU9IN1FFYjR5Mmo4NTFBNU9RTUUy?=
 =?utf-8?B?a1NYWEtoVW9uR0Joc0RwaDV6YTZYcVZQa3ErZEJXUDJlOTAyaVpmZDVSb29a?=
 =?utf-8?B?TERoZitXdDNOdjFsYW1zMTBwdytqbGhoczczb1ByUGlPV1k5LzVUU2JEeWZ5?=
 =?utf-8?B?SFllVmI2ek1jenFlWTlyd1Z6Uyt5OXgxYVpmT25pTGtycitDZmNmWFRZZlZG?=
 =?utf-8?B?ZGxWYnRGcnJqUURUczB5RG81S2Q1eEk1SFVSNGNkM1BGNmlXc3B4UjV1U2l1?=
 =?utf-8?B?RHA5K05EVHYrbVBUelc0OUhTMndLZHF1ZGZ6dHdFZ1FNVHBqb085KzhNZlJT?=
 =?utf-8?B?bGFSc1AxdE5TaFBBU3FUcnRLbXhuanpaOUlzUlZyaXZsSlRTL0JjVFMrbHRJ?=
 =?utf-8?B?cStUZENNWlVNVUZSTnZ6bUR5N2hoK0g0dkpNNVZlYnFFY3dUcEVQcU8vS094?=
 =?utf-8?Q?9AU5sfdkwVgQCAoJ12y2l6iIs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611d7c51-87d5-4867-31c5-08db6ceddea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 15:41:50.0964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JJq13il2Sp2Ji4xWdn6Gon9jSk7jUDOHJ8yqCCU193AMYv0a2m9GZl8nI9/HT8vak8x/rpentFQT7Og41gSdHF0Jj/msdyRYVV9sALbROtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
X-Proofpoint-ORIG-GUID: S27s6ILPPLivI-EbOb2m7egrJ7Ns3Bks
X-Proofpoint-GUID: 2iWJgy44-MkAM2tXeYOy_wZhOY4PsYoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_11,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 15:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103287

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDE0LCAyMDIzIDg6
MTMgQU0NCj4gVG86IFNsYXRlciwgSm9zZXBoIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+DQo+
IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgTWFjTGVvZCwg
UmFuZHkNCj4gPFJhbmR5Lk1hY0xlb2RAd2luZHJpdmVyLmNvbT4NCj4gU3ViamVjdDogUmU6IFt2
M11bbWV0YS1vZV1bUEFUQ0ggMS8xXSBsaWJncGlvZDogbW9kaWZ5IHRlc3QgJ2dwaW9zZXQ6IHRv
Z2dsZQ0KPiAoY29udGludW91cyknDQo+IA0KPiBPbiBXZWQsIEp1biAxNCwgMjAyMyBhdCA0OjA2
4oCvUE0gPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBK
b2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+DQo+ID4NCj4gPiBMb29rIGZvciBs
ZXZlbCB0cmFuc2l0aW9ucyB3aGVuIHRlc3RpbmcgdG9nZ2xpbmcgdmFsdWVzIGJlY2F1c2UgdXNp
bmcNCj4gPiBmaXhlZCBkZWxheXMgdG8gYXNzdW1lIHZhbHVlIGNoYW5nZXMgaXMgbm90IHJlbGlh
YmxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9lIFNsYXRlciA8am9lLnNsYXRlckB3aW5k
cml2ZXIuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZ3Bpby10b29scy10ZXN0LWJhdHMtbW9kaWZ5
LnBhdGNoICAgICAgICAgfCA2NyArKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9saWJncGlv
ZC9saWJncGlvZF8yLjAuMS5iYiAgICAgICAgICAgICAgICB8ICAyICsNCj4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IG1l
dGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYmdwaW9kL2xpYmdwaW9kLTIueC9ncGlvLXRvb2xzLXRl
c3QtYmF0cy1tb2QNCj4gPiBpZnkucGF0Y2gNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL21l
dGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYmdwaW9kL2xpYmdwaW9kLTIueC9ncGlvLXRvb2xzLXRl
c3QtYmF0cy1tDQo+ID4gb2RpZnkucGF0Y2gNCj4gPiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0
L2xpYmdwaW9kL2xpYmdwaW9kLTIueC9ncGlvLXRvb2xzLXRlc3QtYmF0cy1tDQo+ID4gb2RpZnku
cGF0Y2gNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLjRk
NDk0Njc5NjgNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQvbGliZ3Bpb2QvbGliZ3Bpb2QtMi54L2dwaW8tdG9vbHMtdGVzdC1iYQ0KPiA+ICsrKyB0
cy1tb2RpZnkucGF0Y2gNCj4gPiBAQCAtMCwwICsxLDY3IEBADQo+ID4gK0Zyb20gNTNmOTY3MGQ2
YWYxYmQwNzQ1YzFkZjljNDY5YjI2OWM3MjYwN2IyMyBNb24gU2VwIDE3IDAwOjAwOjAwDQo+ID4g
KzIwMDENCj4gPiArRnJvbTogSm9lIFNsYXRlciA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPg0K
PiA+ICtEYXRlOiBUdWUsIDYgSnVuIDIwMjMgMDg6MDQ6MjcgLTA3MDANCj4gPiArU3ViamVjdDog
W1BBVENIXSB0b29sczogdGVzdHM6IG1vZGlmeSBkZWxheXMgaW4gdG9nZ2xlIHRlc3QNCj4gPiAr
DQo+ID4gK1RoZSB0ZXN0ICJncGlvc2V0OiB0b2dnbGUgKGNvbnRpbnVvdXMpIiB1c2VzIGZpeGVk
IGRlbGF5cyB0byB0ZXN0DQo+ID4gK3RvZ2dsaW5nIHZhbHVlcy4gVGhpcyBpcyBub3QgcmVsaWFi
bGUsIHNvIHdlIHN3aXRjaCB0byBsb29raW5nIGZvcg0KPiA+ICt0cmFuc2l0aW9ucyBmcm9tIG9u
ZSB2YWx1ZSB0byBhbm90aGVyLg0KPiA+ICsNCj4gPiArV2Ugd2FpdCBmb3IgYSB0cmFuc2l0aW9u
IHVwIHRvIDEuNSBzZWNvbmRzLg0KPiA+ICsNCj4gPiArU2lnbmVkLW9mZi1ieTogSm9lIFNsYXRl
ciA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPg0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQo+ID4gKw0KPiA+
ICtVcHN0cmVhbS1zdGF0dXM6IGFjY2VwdGVkDQo+ID4gKw0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBK
b2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+DQo+ID4gKy0tLQ0KPiA+ICsgdG9v
bHMvZ3Bpby10b29scy10ZXN0LmJhdHMgfCAyMSArKysrKysrKysrKysrKysrLS0tLS0NCj4gPiAr
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+ICsN
Cj4gPiArZGlmZiAtLWdpdCBhL3Rvb2xzL2dwaW8tdG9vbHMtdGVzdC5iYXRzIGIvdG9vbHMvZ3Bp
by10b29scy10ZXN0LmJhdHMNCj4gPiAraW5kZXggYzgzY2E3ZC4uOTI5YzM1YSAxMDA3NTUNCj4g
PiArLS0tIGEvdG9vbHMvZ3Bpby10b29scy10ZXN0LmJhdHMNCj4gPiArKysrIGIvdG9vbHMvZ3Bp
by10b29scy10ZXN0LmJhdHMNCj4gPiArQEAgLTE0MSw2ICsxNDEsMjAgQEAgZ3Bpb3NpbV9jaGVj
a192YWx1ZSgpIHsNCj4gPiArICAgICAgIFsgIiRWQUwiID0gIiRFWFBFQ1RFRCIgXQ0KPiA+ICsg
fQ0KPiA+ICsNCj4gPiArK2dwaW9zaW1fd2FpdF92YWx1ZSgpIHsNCj4gPiArKyAgICAgIGxvY2Fs
IE9GRlNFVD0kMg0KPiA+ICsrICAgICAgbG9jYWwgRVhQRUNURUQ9JDMNCj4gPiArKyAgICAgIGxv
Y2FsIERFVk5BTUU9JHtHUElPU0lNX0RFVl9OQU1FWyQxXX0NCj4gPiArKyAgICAgIGxvY2FsIENI
SVBOQU1FPSR7R1BJT1NJTV9DSElQX05BTUVbJDFdfQ0KPiA+ICsrICAgICAgbG9jYWwNCj4gPiAr
K1BPUlQ9JEdQSU9TSU1fU1lTRlMvJERFVk5BTUUvJENISVBOQU1FL3NpbV9ncGlvJE9GRlNFVC92
YWx1ZQ0KPiA+ICsrDQo+ID4gKysgICAgICBmb3IgaSBpbiB7MS4uMTV9OyBkbw0KPiA+ICsrICAg
ICAgICAgICAgICBbICIkKDwkUE9SVCkiID0gIiRFWFBFQ1RFRCIgXSAmJiByZXR1cm4NCj4gPiAr
KyAgICAgICAgICAgICAgc2xlZXAgMC4xDQo+ID4gKysgICAgICBkb25lDQo+ID4gKysgICAgICBy
ZXR1cm4gMQ0KPiA+ICsrfQ0KPiA+ICsrDQo+ID4gKyBncGlvc2ltX2NsZWFudXAoKSB7DQo+ID4g
KyAgICAgICBmb3IgQ0hJUCBpbiAkeyFHUElPU0lNX0NISVBfTkFNRVtAXX0NCj4gPiArICAgICAg
IGRvDQo+ID4gK0BAIC0xNTY3LDE1ICsxNTgxLDEyIEBAIHJlcXVlc3RfcmVsZWFzZV9saW5lKCkg
ew0KPiA+ICsgICAgICAgZ3Bpb3NpbV9jaGVja192YWx1ZSBzaW0wIDQgMA0KPiA+ICsgICAgICAg
Z3Bpb3NpbV9jaGVja192YWx1ZSBzaW0wIDcgMA0KPiA+ICsNCj4gPiArLSAgICAgIHNsZWVwIDEN
Cj4gPiArLQ0KPiA+ICstICAgICAgZ3Bpb3NpbV9jaGVja192YWx1ZSBzaW0wIDEgMA0KPiA+ICsr
ICAgICAgZ3Bpb3NpbV93YWl0X3ZhbHVlIHNpbTAgMSAwDQo+ID4gKyAgICAgICBncGlvc2ltX2No
ZWNrX3ZhbHVlIHNpbTAgNCAxDQo+ID4gKyAgICAgICBncGlvc2ltX2NoZWNrX3ZhbHVlIHNpbTAg
NyAxDQo+ID4gKw0KPiA+ICstICAgICAgc2xlZXAgMQ0KPiA+ICsNCj4gPiArLSAgICAgIGdwaW9z
aW1fY2hlY2tfdmFsdWUgc2ltMCAxIDENCj4gPiArKyAgICAgIGdwaW9zaW1fd2FpdF92YWx1ZSBz
aW0wIDEgMQ0KPiA+ICsgICAgICAgZ3Bpb3NpbV9jaGVja192YWx1ZSBzaW0wIDQgMA0KPiA+ICsg
ICAgICAgZ3Bpb3NpbV9jaGVja192YWx1ZSBzaW0wIDcgMA0KPiA+ICsgfQ0KPiA+ICstLQ0KPiA+
ICsyLjI1LjENCj4gPiArDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0
L2xpYmdwaW9kL2xpYmdwaW9kXzIuMC4xLmJiDQo+ID4gYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9saWJncGlvZC9saWJncGlvZF8yLjAuMS5iYg0KPiA+IGluZGV4IDMzNzU1NGNkODkuLjY5NThm
MmQ4NDEgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGliZ3Bpb2Qv
bGliZ3Bpb2RfMi4wLjEuYmINCj4gPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJn
cGlvZC9saWJncGlvZF8yLjAuMS5iYg0KPiA+IEBAIC05LDYgKzksOCBAQCBMSUNfRklMRVNfQ0hL
U1VNID0gIiBcDQo+ID4NCj4gPiAgRklMRVNFWFRSQVBBVEhTOnByZXBlbmQgOj0gIiR7VEhJU0RJ
Un0vJHtQTn0tMi54OiINCj4gPg0KPiA+ICtTUkNfVVJJICs9ICJmaWxlOi8vZ3Bpby10b29scy10
ZXN0LWJhdHMtbW9kaWZ5LnBhdGNoIg0KPiA+ICsNCj4gPiAgU1JDX1VSSVtzaGEyNTZzdW1dID0N
Cj4gImI1MzY3ZDI4ZDA0NWIzNjAwN2E0ZmZkNDJjY2VkYTRjMzU4NzM3ZWY0ZjJjZTIyYjBjMWQw
NWVjNTdhMzgzOTIiDQo+ID4NCj4gPiAgIyBFbmFibGUgYWxsIHByb2plY3QgZmVhdHVyZXMgZm9y
IHB0ZXN0DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0KPiBSZWx1Y3RhbnQ6DQo+IA0KPiBSZXZp
ZXdlZC1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8u
b3JnPg0KPiANCj4gQWx0aG91Z2gsIEknbSBhc2tpbmcgbXlzZWxmIC0gd2h5IGRvIHlvdSBuZWVk
IHRoaXM/IEhhdmUgeW91IHNlZW4gYW55IGZhaWx1cmVzDQo+IHdpdGggcHRlc3Q/IENhbiB0aGlz
IHdhaXQgZm9yIGEgZnVsbCByZWxlYXNlPw0KDQpbU2xhdGVyLCBKb3NlcGhdIA0KWWVzLCB3ZSBo
YXZlIHNlZW4gZmFpbHVyZXMuICBJdCBpcyBub3QgbXkgY2FsbCBhcyB0byB3aGVuIHRoZXkgbmVl
ZCB0byBiZSBmaXhlZC4gIEkgY2FuIHVuZGVyc3RhbmQgbWV0YS1vZSB3YW50aW5nIHRvIHdhaXQg
Zm9yIGEgcmVsZWFzZS4gIElmIHRoYXQgaXMgdGhlIGNhc2UsIEknbGwgaGF2ZSB0byBzZWUgd2hh
dCBwZW9wbGUgd2FudCB0byBkbyBsb2NhbGx5IGFzIGEgdGVtcG9yYXJ5IGZpeC4NCg0KSm9lDQoN
Cj4gDQo+IEJhcnQNCg==

