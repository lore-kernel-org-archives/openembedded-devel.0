Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC3EC4332F
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 03:43:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.111548.1671939815411776311
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 19:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pvBfMpwc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93580d9d13=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BP3gTi4005901
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 03:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=w9lv9ijdQgd/8a3y2fMeVCSV0cTLstNUKGgw7034jyE=;
 b=pvBfMpwcPve9rlLoch6f++D8MtuvHb33ebPKjYet6820cpoKMfPVl+uV4xabIzEi0cBY
 rxTX2J9DnEMGqez1VqHvWKNxwCweI0YK6Gge84TlEj6FEamNs3zFqxMsyFcwpjGL3gMb
 opnNZuBWbh/gBvP9GQm7UbhP1PX+WN9RhvIdZFozp59MgiTWHLwea8plZVJ1Nl5HK19y
 mRVHw99bY8pErau6TwLPEO5f4OSfia/92qCHHypB82ZhLxIibRBhiULWEWMiy4UTjI/K
 fPlfuIHeVhHWB/G++0eZn8Ug672t0d02XKfL30memJsBv0GOa8VG6lDLINYJpeBuGZFx AA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn30jut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 03:43:34 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BP3hXwG007021
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 03:43:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn30jus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Dec 2022 03:43:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqJ8+HLVAOzfPsErM2K7ehgnOEkNHceWaxaSk3WCZ1MU9Js9bHa+VVodQUenMSqrApCnd5wiCtcCewumlG/Yb888I/JtEg9c+wnsvA0SWJQgWnBKpXmZMENl8qO/x1g1/hLrD6OlRjkPTvpGUQ1sPoG4BWrP9tfbi7brix9K4RgUTBwBEwHza/o+N34BJ1XdW60I/mI4grYPlWQSR1GmZslnvQkKWp1hrIy6rhC4kYcJJAILsE+xb6xbosPR2zEY33l/D6niOUj3jz2d31xDCuo6RoAL455u94QoN/R/54dMleKze97W9yKqJ4bT4qmIay+cXFy3C+rOrrbkyDBXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9lv9ijdQgd/8a3y2fMeVCSV0cTLstNUKGgw7034jyE=;
 b=B2NowJ0hlp5yD35ma8cJ7XDlx0Z001MZCjDrKYyrbYl7AXaWqa2/xdIe6DQvER8Je5MLZFjG2hJDhI0QlNZtUgnas0+eboD67ic0DRB22gudTJCl7PiMxFsYfGGMUT5OxEovl7xhnMQ16PH/FPXrv55mtKlLNQioYGcAjCLCRwV0AHnqW5ZyNiuiaOgaQgb+tvQarBGIlRkcuFqXVJROzYq5dYNcwLcnsXZvPiODH6x5oiqiPXV4SAejROWdqzY84fwZSOsLWTEbjQoKH+tnAkECOwrObyyO1mk+OFdb0n95Mc8HFB8KscRV22rJy6Tay6OtiYXgbjdWhB4TP6vaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB7067.namprd11.prod.outlook.com (2603:10b6:806:29a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Sun, 25 Dec
 2022 03:43:30 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%8]) with mapi id 15.20.5944.013; Sun, 25 Dec 2022
 03:43:29 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Armin Kuster <akuster808@gmail.com>, omkar <omkarpatil10.93@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "omkar.patil@kpit.com"
	<omkar.patil@kpit.com>
CC: "ranjitsinh.rathod@kpit.com" <ranjitsinh.rathod@kpit.com>
Subject: RE: [oe][meta-filesystems][dunfell][PATCH] ntfs-3g-ntfsprogs: Upgrade
 2022.5.17 to 2022.10.3
Thread-Topic: [oe][meta-filesystems][dunfell][PATCH] ntfs-3g-ntfsprogs:
 Upgrade 2022.5.17 to 2022.10.3
Thread-Index: AQHY+l4D6CJkrO57x0+wEpCf56bEAK5DMVSAgDr/lQA=
Date: Sun, 25 Dec 2022 03:43:29 +0000
Message-ID: 
 <CO6PR11MB56024AE54CF9E7C4DA1F23EAEDEF9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20221117082359.19378-1-omkarpatil10.93@gmail.com>
 <9d34f83a-c684-08ac-cead-9e3ed1b659c6@gmail.com>
In-Reply-To: <9d34f83a-c684-08ac-cead-9e3ed1b659c6@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SN7PR11MB7067:EE_
x-ms-office365-filtering-correlation-id: 550d15a0-dbb3-4b57-011c-08dae62a304b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5Pgo5bIuZTSJwKhtjvXFDYZJhPJSYMqR7t+hYa1yzu8fSUrXZ1pP4ic26PBWE/o/EF4FTLHxrO/25WOs4SOpQ0Pa+acBLGEggJqCO6OIp6Xo4WaQMI84q8COUeh9Zwear/DiYJ/8dsmJ3YXyMKfKBTFOMDLaeWSjMhsKOSFy+Zxnf0F62VPgRLrFZV3+drJCAkKCCrxSL5OgP1vbd+v+/m8/bpp5tBtdI06plx/EyPUNsqrrv/GajCRVih7iCfiHGjpDp87kdzTcjO2xRxurkD3RV4w+evIop+etWwPCVn97JK83FInGbaCEbHza/0HnK2sBKOlBEUUb0sIzRDW/ZQ6NGbsuLwnFGMSmwdGmfB2B1GCdGNHNkFQLb0kNpBFDxNaK2b+Yk1lfF74aoaqpvjP8Z66o3fxvmUu2KuR11lzvZxP6Bsrs1AjhUKYVdtytn7YiaqQIES9XiWMAc0sKAlZoWabCJkvmaKd8TVTOJAERfc8XA3FpYTSUg+BZuiOS4A5cFXm19GLZX4PRmvsTYL5qlhmICohVehtaCtqn6UnfwrXXNludFyDTyAcxc6Nf7uFKtmGioUlxG9odyOg0kcNleFDbaNbQhkOO6PUF95iE3RiEdk7/RNupwiaegerB3muKMekVEd4JYW3NhosMAhjluGWmYS5KaiW2fnnvH2x0yiiUrT+on3c9m2Ft0T6aWhHlE6wvZ+lLoC5E+0y6I/wVF0PdKVniTuz8VrsOPTL1kELpqX/ivZSYGbsR/fbN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39840400004)(396003)(346002)(451199015)(122000001)(55016003)(110136005)(2906002)(478600001)(52536014)(38070700005)(316002)(64756008)(8936002)(66556008)(76116006)(66946007)(66476007)(38100700002)(86362001)(4326008)(8676002)(66446008)(83380400001)(71200400001)(5660300002)(26005)(33656002)(186003)(6506007)(41300700001)(7696005)(9686003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YTQ3MEZIdWtpQjdnUW5OR1k5bElCS3VTYjVCT2h1Und4WFpXc1ZZcHp4allR?=
 =?utf-8?B?eXpUc3dGa0ZUZFhReVp4VGxJcmVDZzVKZ0Myb0Q4ZG1tdGU0ejZYZ3B1Tmxl?=
 =?utf-8?B?dHZyZEthZDV0ekMwSWZCU1cyZWtQN1UrbWNiUjFvTFk5aE5oa2R3VnhORXNS?=
 =?utf-8?B?VUtBZkVUVHFJVWhEYWZFd2dyeHpwQnh3UXRUME5TNDl1WHE1TWR0UzNnRisv?=
 =?utf-8?B?MmRPam41ak9pWGhHeHN3eWRZUURNbWxIU0lMTDE2M3FzMFJ5bEJ5UU13Ums2?=
 =?utf-8?B?MS9LN21BdUhXSENTQXFTYUlDV1l2RGtQaVozS0YxZmIwdm5xZTVXMkJhVmFZ?=
 =?utf-8?B?dmR4VXF4cUNhVFRHdmwzS0tCU21XREh2V3VGam5rOEYwd00wOGNOZjJnZGwz?=
 =?utf-8?B?SE9lcUhvbEt0N0RTWHEzL28zZFF0NjllR0NZSGM0VWRYK0Q0dzhsVjZONlU0?=
 =?utf-8?B?NFFVUCtBZldJVzNRZlVPM09BdndzRmZOaUE1RFRHQkhZWThHWlNUR3FSSTUy?=
 =?utf-8?B?MVhITzIrMGFWUWVtZSt0aUVacFVya0JneHFFdTg5aHlNaVVWbE50NWhYZHRa?=
 =?utf-8?B?RE5Gb0xZVldudjZYVmRFUFY4aG1VUW1mdFcraXVhNjBYRnVXdGgwMUhYdU5i?=
 =?utf-8?B?VThFRlBGRXFvVm4zSHE3RkNYRlk2RkJKaUFrMldQd0JRckZxWDdlL1pLUGEv?=
 =?utf-8?B?cFRjMk1acHp3RlRLbmZsbEFWMlIvMXNSTEhMQXdTbE1mSFBPNkE1bmlNR0FL?=
 =?utf-8?B?RjluZGNwMVRZTmFKVGwrbFZndEFhNEdvZklmMi9TZVVQU0lEV25RV3hzVE83?=
 =?utf-8?B?dW5iQ1VneUprVEpidzhuOGE3T2NhTm0zdWJOMjFxS2htQUVqREZDcHgxL2gr?=
 =?utf-8?B?YjVCeG51cGs1NVUraEhZdVFVM2tJRGtXYms0Z0twc3l3YUlLV015QXlUSGIz?=
 =?utf-8?B?TEhTR2xVWVcxcSs4RGIzNzFlMWQrWUExa0g4K1F2QTN5Uzh2Yk1hLzIyT0Yw?=
 =?utf-8?B?MENkYjloYTZqZGtQWm93RnRYMlluUnB5M2lkN2o5d0djSzlmSFV3WGpoaGwz?=
 =?utf-8?B?aW5HT2NkaU9pZ0N4VDJTR1RhRWJYczd2VlMwNnQ1QjFwVWx3eVNTTVZMUVpG?=
 =?utf-8?B?WlRxdVZuTkRrZlFyeVdvUkJIYzV5QW8vVUZIYXQ5dFdOcm9MdjJValdqMDFG?=
 =?utf-8?B?Z1hMckZjUmVZWHUwNnkxWmJ2djkrT1diY2pLbjJBVXhFVXBLdTJSaXpGeFpC?=
 =?utf-8?B?RFk5T0ZiSVFaM1pNM2U2bnBhVzBIVlBrQnhHTE5IMGFFbjJLRXdVTzlzZWhO?=
 =?utf-8?B?WHh5aVRDQmY3ZDA5WXl4c3o4a2g3QkhSMENOQkFNaHVGaCtkZUluK1A4bExk?=
 =?utf-8?B?TUJEcmp5WnNXUkl3RzBpNmp0RFpBb293S3Y3eExXUmFLR3ZUUzlLb0V3WjNG?=
 =?utf-8?B?V1Njb0pLeTB0VXZJSVV5cGRnS2UwSEVhQnlBU0dNOGtacXQ1dDNUMjkrNkl2?=
 =?utf-8?B?QjlsRjZ6bzgwcFNqTmVpUE1kMnl1NWFvL3VhUDByY3pkaVRxbFhPa01LVm0r?=
 =?utf-8?B?U3g0QWNuZHlJY0hzenRvTm9vTWdxelF6a09rRW5zQkdvM3BtQnJ6MG9RTTNz?=
 =?utf-8?B?RTU2TmlVaWxjaVEwVkZBcDhmWTdmaGdxSkJOc00xaXBTQzc0Z3VKRjYxUUMr?=
 =?utf-8?B?TTd2MWN0WVhsaWhZSGF1SWMxcHNhQVA2aTkyWUtGWmd6NCtJaFpSTzA5eWtD?=
 =?utf-8?B?S2Y2dUdvd1ZNVlJqUkZPSWp6c0gwWmNnb3JBNmR2dUhqNXd1R241REdXZmhn?=
 =?utf-8?B?YjMzd2R4MDVuVTB6WEs4SjY4S0lhMld2dVNNOUZSa0FIZjNyejBoRUZFOHJH?=
 =?utf-8?B?bFZNRXc1OU5yUkdwRktNQXdvOU90ZEFpRC9FUUk0REdtRXEwTTdZS2lRdWQ0?=
 =?utf-8?B?Smc0Mkx4S1FLbHlRNFRsSU5zVjV1T2ZnS0YvbVpTUWgraUpFTVNVSkViMlEv?=
 =?utf-8?B?QlBEa0N6THo3M0poSlZWVWZDbnBiUmtYdHdRaVFoZUl5cTlxWnFqL0M0TDJh?=
 =?utf-8?B?c0RTbTBTQStMUStITGpwNVNURTZvN3U4Vyt0REdabVhBT044dVlzdGkxSDJ2?=
 =?utf-8?Q?hFAbmBvWaA8qPaUFWQ6t/Q6pq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550d15a0-dbb3-4b57-011c-08dae62a304b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2022 03:43:29.9114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RiY3shrvfkeLwdYy8YWT6Za4aEDFpVBrS3DN6hZWqB7x4wuSu2rfqig0ZRaK+ESqYeHu6yPPH4cbqWpdPjfm1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7067
X-Proofpoint-ORIG-GUID: rO80h7IUuYT_j9W8ePZo36mZYBQ8_8h6
X-Proofpoint-GUID: x5efRi2SDB1q8qvyctufEPm06NkbTkkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-25_02,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212250030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 03:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100225

SGkgQXJtaW4sDQoNCkkgYWxzbyBqdXN0IG5vdGljZWQgdGhhdCB0aGUgbmV3IHJlbGVhc2VkIGtp
cmtzdG9uZSBkb2VzIG5vdCBjb250YWluIHRoaXMgcGF0Y2guDQpJIHRoaW5rIGFsbCBjdXJyZW50
bHkgbWFpbnRhaW5lZCBicmFuY2hlcyBzaG91bGQgY2hlcnJ5LXBpY2sgdGhpcyB1cGdyYWRlIHBh
dGNoLiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KUmVnYXJkcywNClFpDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFs
ZiBPZiBBcm1pbiBLdXN0ZXINClNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxNywgMjAyMiAxMDo0
NCBQTQ0KVG86IG9ta2FyIDxvbWthcnBhdGlsMTAuOTNAZ21haWwuY29tPjsgb3BlbmVtYmVkZGVk
LWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IG9ta2FyLnBhdGlsQGtwaXQuY29tDQpDYzog
cmFuaml0c2luaC5yYXRob2RAa3BpdC5jb20NClN1YmplY3Q6IFJlOiBbb2VdW21ldGEtZmlsZXN5
c3RlbXNdW2R1bmZlbGxdW1BBVENIXSBudGZzLTNnLW50ZnNwcm9nczogVXBncmFkZSAyMDIyLjUu
MTcgdG8gMjAyMi4xMC4zDQoNCg0KDQpPbiAxMS8xNy8yMiAzOjIzIEFNLCBvbWthciB3cm90ZToN
Cj4gRnJvbTogT21rYXIgUGF0aWwgPG9ta2FyLnBhdGlsQGtwaXQuY29tPg0KPg0KPiBDaGFuZ2Vz
Og0KPiBSZWplY3RlZCB6ZXJvLXNpemVkIHJ1bnMNCj4gQXZvaWRlZCBtZXJnaW5nIHJ1bmxpc3Rz
IHdpdGggbm8gcnVucw0KPg0KPiBGaXggQ1ZFLTIwMjItNDAyODQNCg0KV29uJ3QgdGhpcyBhZmZl
Y3QgbGFuZ2RhbGUgYW5kIEtpcmtzdG9uZSB0b28/DQoNCi1hcm1pbg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBPbWthciBQYXRpbCA8b21rYXJwYXRpbDEwLjkzQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAg
Li4uM2ctbnRmc3Byb2dzXzIwMjIuNS4xNy5iYiA9PiBudGZzLTNnLW50ZnNwcm9nc18yMDIyLjEw
LjMuYmJ9IHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiAgIHJlbmFtZSANCj4gbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLWZpbGVzeXN0
ZW1zL250ZnMtM2ctbnRmc3Byb2dzL3tudGZzLTNnLW50ZnNwcg0KPiBvZ3NfMjAyMi41LjE3LmJi
ID0+IG50ZnMtM2ctbnRmc3Byb2dzXzIwMjIuMTAuMy5iYn0gKDk1JSkNCj4NCj4gZGlmZiAtLWdp
dCANCj4gYS9tZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtZmlsZXN5c3RlbXMvbnRmcy0zZy1udGZz
cHJvZ3MvbnRmcy0zZy1udGZzcA0KPiByb2dzXzIwMjIuNS4xNy5iYiANCj4gYi9tZXRhLWZpbGVz
eXN0ZW1zL3JlY2lwZXMtZmlsZXN5c3RlbXMvbnRmcy0zZy1udGZzcHJvZ3MvbnRmcy0zZy1udGZz
cA0KPiByb2dzXzIwMjIuMTAuMy5iYg0KPiBzaW1pbGFyaXR5IGluZGV4IDk1JQ0KPiByZW5hbWUg
ZnJvbSANCj4gbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLWZpbGVzeXN0ZW1zL250ZnMtM2ctbnRm
c3Byb2dzL250ZnMtM2ctbnRmc3Bybw0KPiBnc18yMDIyLjUuMTcuYmIgcmVuYW1lIHRvIA0KPiBt
ZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtZmlsZXN5c3RlbXMvbnRmcy0zZy1udGZzcHJvZ3MvbnRm
cy0zZy1udGZzcHJvDQo+IGdzXzIwMjIuMTAuMy5iYg0KPiBpbmRleCBjYjUyYzU1NjcuLmVmYjMz
MWQ3YiAxMDA2NDQNCj4gLS0tIA0KPiBhL21ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy1maWxlc3lz
dGVtcy9udGZzLTNnLW50ZnNwcm9ncy9udGZzLTNnLW50ZnNwDQo+IHJvZ3NfMjAyMi41LjE3LmJi
DQo+ICsrKyBiL21ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy1maWxlc3lzdGVtcy9udGZzLTNnLW50
ZnNwcm9ncy9udGZzLTNnLW4NCj4gKysrIHRmc3Byb2dzXzIwMjIuMTAuMy5iYg0KPiBAQCAtMTAs
NyArMTAsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly90dXhlcmEuY29tL29wZW5zb3VyY2UvbnRmcy0z
Z19udGZzcHJvZ3MtJHtQVn0udGd6IFwNCj4gICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWxpYm50
ZnMtM2ctTWFrZWZpbGUuYW0tZml4LWluc3RhbGwtZmFpbGVkLXdoaWxlLWhvc3QucGF0Y2ggXA0K
PiAgICINCj4gICBTID0gIiR7V09SS0RJUn0vbnRmcy0zZ19udGZzcHJvZ3MtJHtQVn0iDQo+IC1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMDQ4OWZiYjY5NzI1ODFlMWI0MTdhYjU3OGQ1NDNmNmFlNTIy
ZTdmYTY0OGMzYzliNDljNzg5NTEwZmQ1ZWI5MyINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJm
MjBlMzZlZTY4MDc0Yjg0NWUzNjI5ZTZiY2VkNDcwNmFkMDUzODA0Y2JhZjA2MmZiYWU2MDczOGY4
NTQxNzBjIg0KPiAgIA0KPiAgIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3d3dy50dXhl
cmEuY29tL2NvbW11bml0eS9vcGVuLXNvdXJjZS1udGZzLTNnLyINCj4gICBVUFNUUkVBTV9DSEVD
S19SRUdFWCA9ICJudGZzLTNnX250ZnNwcm9ncy0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRneiIN
Cj4NCj4gDQo+DQoNCg==

