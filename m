Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9A7C38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 07:03:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8284.1720595021800601252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 00:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7921d6a311=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A4KUV3008899
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 07:03:41 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x3j4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 07:03:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUwRdazOTWTdtG+qlbm3lTshGa3A9AFvrMlDw4yf8zvYlQQq0MT0RuLvRz0rLXo/G6cl9jFpINahj4ISHpKrlJ93FGHq7811kSegkcPcZNBW85DCosqO7XzxdIVnub4ZO5sWMOLB93dWGJOxPhp4HD9GO0NFrRGgDUbSeHTXJYqgn7asMy8D2k5leNMGAQTKLLJqtgVlir9Qv25L/9iGHb7NeFmwqchvvijaBeZPzQwgaAmUTLFQxq8scYhwex3QewWX62LjFbbG/fjAzUJAW/P6Gnah5jdWMFrz5ex7zb0Qmmloh5QkIPCl/7PW5JC8OdY7UAM6XcY0KpSpEVXhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aNVPi+jB2baeOLuIuXmhiIjlFJWuKPQT5STRRpGEgc=;
 b=TLNFqVHIwRubdNl6nOnt4mGXypZTiur5q9RcD+R8wtkUwrojKSAVjsIMjSH586vzOX91LSDRcbpTuQJZfa3tiRXAFDYvY5kiNf/rqKiV9xbIBvngMlfUaiTL6MVdP4sN5K6WSAwRQLNZEVr8Po02+nrrtSK8CeElgX56qLhbKWDxVOFj5qyc45MoGc+5WfG2zWDyTQqQfsodgY9FSmr22Hr2kEKU3otg3f0LtCHL/fRcGJPLfndL1nIKGwiNfkw6uBjmC3IQYJmuxnseQE79OI7GuRpXBw57kWuN6gnWf8+Zt5JyzaVwvQH+uvrf3UHqF0jv46Pm6Oi43HBSAtgGbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 07:03:34 +0000
Received: from PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840]) by PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840%4]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 07:03:33 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [scarthgap][master][meta-oe][PATCH] rrdtool: Fix
 do_populate_sysroot QA issues
Thread-Topic: [oe] [scarthgap][master][meta-oe][PATCH] rrdtool: Fix
 do_populate_sysroot QA issues
Thread-Index: AQHati4M1kz5BYirw0SXQZ7hXZHS8LHvwWDp
Date: Wed, 10 Jul 2024 07:03:33 +0000
Message-ID: 
 <PH8PR11MB69280C25C76A145377E2ECA9B8A42@PH8PR11MB6928.namprd11.prod.outlook.com>
References: <17D5AEEFE4F27572.11931@lists.openembedded.org>
In-Reply-To: <17D5AEEFE4F27572.11931@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6928:EE_|SA2PR11MB4812:EE_
x-ms-office365-filtering-correlation-id: b21ce4ed-2fd5-459b-0d27-08dca0ae6958
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aWhKV1plOXhEZ0tOaTVJYWVvYWdCTFhvSmRIRW5naEpCMk1RaFY4R084aWww?=
 =?utf-8?B?L1Q4eGQ2TUhGeW5ZVWFBOFBicUJaMTNzdnFxbmZVdngvUE1LSWVMOVdzV2VO?=
 =?utf-8?B?Rm9iWnk0WDQvcytRc1F3d3lROWFPeUovSnRyN1BMbnRyWmdGK2x6MVIzekJs?=
 =?utf-8?B?dEI5OUJyWWVFeFhudnRtZjZxekU0UUVJVzIvTFpwMThka2dWaWRQenpORk9h?=
 =?utf-8?B?QVE5Wi9qUjRIeXJDWk1Wb1lNbU1OVGNVUEEzSVp4cjlDMktuZlVHeGtpYlhi?=
 =?utf-8?B?ZDhPZ1orMEFrektvYzRFWThSRzdTdFRTTGlKUkg0L0FwZUJweDhqbnFzZWF0?=
 =?utf-8?B?clF5RlNjNHNzdTgxV1FWbThWM3JyWERETVlRSzVacTV2RjdtOE9MVERSSUZ0?=
 =?utf-8?B?L25kZTJ3dHZ3aUVRMVM4UGRTOGNJUXRySEhrV1J4bFNJdVNWMzRlMUpRdGp6?=
 =?utf-8?B?cm1LcnF0NXh6V0poMWVzbFlzdk5SRmZYQ0k2bXlnZ01KSzQ4VVR2Y29uV0pu?=
 =?utf-8?B?QkswUi9vZHg5d3FUYUkwbFAxZFJtMjFGb2h2QityUVBRaEJTc080am5Gc3Ji?=
 =?utf-8?B?eVpZUWtNVGlvUzVvVktORVZFWjl2eFhJb0VWOURKdDJNVmZXQ3U2R2tsOVBh?=
 =?utf-8?B?c3JYQkNOSlYvKzF0WlR0bjAwNUxEd3Q2ZlZvWm5xaUJncHdxbVJIdGdvSmNE?=
 =?utf-8?B?U0VlMWdIY1N3aFdjRS9NWWVjSkJodlBCL05ESDhWZlN6ZlZ6T1JYdkRxb25B?=
 =?utf-8?B?d1ZDRkpiTXgxd0xncDVlTEJOQmE5WHpIU1hJaHBDMlpudThoZEVSVkdDVy8x?=
 =?utf-8?B?anNQRVp1dGlHRk9aWnFXZGhqZ1FsVXRHRFZzUTAwa1d0TUpGd1poMGJvb2xv?=
 =?utf-8?B?dFVENHRVTHFTWEZTMmNNYnZyZEx1RkxhcWVXK29mUFdKS2lncjA3c2JTNVNU?=
 =?utf-8?B?bWNoaXREUGx4cS9nYTFtSVBybTdpWVBROWR4SDY4UVNYWUJweEZlOHR2cW9N?=
 =?utf-8?B?SENkWjJ2YmZobUlQc3hIZExsOVJ4clJodEdZcHVzRVgyUEV4eisxczhGVDNi?=
 =?utf-8?B?NzJDallzWG1wR1hVS2ZUNW00Y0g5eGVSWmxhVDN2TTFYODU0SHJ3Wm9JUWtF?=
 =?utf-8?B?K3RxSG8yVlpTTE5pRzByVTdpRlFuVUNWWUV2OGdDM0FyUFVlcDRMS2dVZk9k?=
 =?utf-8?B?VldSd0VWMFVRRVNHNjl4S3FCYTB4c3B2UDFFaytmVG9XS3labk9QcVdxMUhP?=
 =?utf-8?B?cmVFVXFBNVZMQlBJL3k4ajM0cWVVUHZETGszUnRQYmlXVlV2cGx1aTVpa3NF?=
 =?utf-8?B?Y1ArL0xrOTE2Q25SSXpaN05oRHZzcG1LOGF3b3krUjdRNTlkYkF5SEtFdWxa?=
 =?utf-8?B?b2N6ZFkzVlEyeWhGWks5S2h5SGhEVy8wdnJYRXdkQzNuTXZUZG5lYjFYOWxQ?=
 =?utf-8?B?OG5yK3RPU0YrUWJYaFpxTnhOTm9SeUc2QXFFZFNaeXF1ZUxxeVFMekRDM0tF?=
 =?utf-8?B?Q21YZ2Q5aG92dmpBb0JHMUxRMXJnWjZWSDcyTi8vcUJCT1NQQzV5bHNEcXlu?=
 =?utf-8?B?TzFkUUIzUGwyaStBczVKa0NQcTd5d2tlUktzc09YRHl5dVR5TWlkZHpyYUJE?=
 =?utf-8?B?VnRMRjY0ekl0SzRYR2tnbFNKRVVPY0UycG1pcGJQd1NNcHhzSGdvV3VEREZn?=
 =?utf-8?B?dDNNckV3ZVEvRGhhZlFaRm53SS80WCt0Mjc0R2hwMituRFpZTjlQbkJwR09q?=
 =?utf-8?B?aVQ3WXdMc1JJNGRxV3ZNL0J0TGcwVk9ZOS9nb20xNjlxMGsxZG00dm1ScWJD?=
 =?utf-8?B?YUZBNEFuVzNSOG5IWG0xRTMwaWdTZ0lyMjRkYm1OUHFFY2wzV3lRR3NoaWE5?=
 =?utf-8?B?b00rT01md0N5aW1tcC9xUGlZb29yUGpLQ3RlSlpvQzdLTHc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6928.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z2NMN09IOFpJOURyVXFoUmNXOUNsaTVOcnNydzZ5alNPVW5vdVZ3SGZOdjNU?=
 =?utf-8?B?Zmh6ZzZuMnlIdDRJNCszOXV6YVlNWlcwY2hZUTlrQVROekRVeGMwMTh2OTl0?=
 =?utf-8?B?S2krbWRDRXFQc0lxNnFtcDVTOFNrQlJBZ2RmSVFNT2ZFVHFSaDJPQkcxa1BP?=
 =?utf-8?B?M2FOdStDOFdJSmRsbFlMNDhjK2w4MG90WXhkbUIxdEV5S3liUk5tVnowL1dS?=
 =?utf-8?B?elJkMHlKYTNweFBoMGgxcXVxM2cvZ1EzMnQ3UStUSUFob3Z6LzByY09vQTdY?=
 =?utf-8?B?VDR6U2daODJjVHA4WllMNmZweVE0WUwrV2I3Qy84RFZmSXMxS2taczFyYWVu?=
 =?utf-8?B?RlhtVWw4SUw5aTViYVlmbkFLRVd1cnUraXVrYUZxZEtmcmNWYm9ic0lmQzg4?=
 =?utf-8?B?QzlYNGQ3bXJpOHBhdlhQYmlZbTNkckVjelh0d1Q2UDM0MnNNNnhpOXhSVkVp?=
 =?utf-8?B?anFkS2xIVXJNcXVzQi9xc0wrMitoOU4xbkZKdVlGMk4xRUd3SStmWDBCTG9q?=
 =?utf-8?B?S3laMHBUNTMrRGk2SVlDUGtkeTNKRXRFQkIwdGhSQWNVWkd4eG04MGhXWWVR?=
 =?utf-8?B?UEpsd0FQOFJ2QVlRYkw5SkJraEI4bnQ4Q0NaZ291MloyLzZTTVRVSGtQaE9K?=
 =?utf-8?B?NDV0ZzRoUzdoWXdpNmczWXpDNUpoSk9XaVJ3U0JmOXkrclVwdXVRamppTVRJ?=
 =?utf-8?B?cjE0a2hMVWxvQTFydUN2YS9OTHIxRHZtZUlUM0tKd1NZS1RzakNnbkdKZUh4?=
 =?utf-8?B?enFDMzByaWVodEoraWlhcTF6cmhVckZBWHhDWDljMm56MUtrNHhKcmExZlVK?=
 =?utf-8?B?eWFJS3RIWmoybzF0SzBweFJqWFpyUFpuakMzbXQzUy9pczl2R1dNRVhoazFr?=
 =?utf-8?B?MlR2SVlZdE5HYnNxbklMUWN5NnZWbnpOaHJhK3VCMkZtUUI1THc5R0d5eER6?=
 =?utf-8?B?M1RuR2IxOGxKL2xHaVQycjFFZFRhaHUwUnZ2UVVvbjY5N2FsbmJCUHFLMUxO?=
 =?utf-8?B?T20zVEtNVlRjZHFCSDMyMFBLa2dEb0h1VkdlajJEeFRYZDlOaXZrL2wyMW5z?=
 =?utf-8?B?TGR0dkwzSTVxWndGanVYa3laQVpYcE5mZmJNVkhsMHBLMmo4SU9vdm5hQXNQ?=
 =?utf-8?B?MnJUOFJPOWZQSWVWUTZ5TUR3aG5Hc0x6REZtbzNOMWxXeitYRXIyWXlPV2Y2?=
 =?utf-8?B?QTNTNDZOeHRRejBQRlhtSFNVcmkzTk95TmtOOWtTcnFMdTNacVY0aFZuRGdZ?=
 =?utf-8?B?T20wUUQ4emdmODhoVEdWc1E5SmxSbFFHU1N0a05Wb2xuK05YSU5Ud0tWMzJQ?=
 =?utf-8?B?SjdaWXl2dndCOTBNaXNLeHNrTG44bU11WHZwZUlUczNBUURTUGRlK21wT3A5?=
 =?utf-8?B?VGtGOTVZK1hkY0JTNzVwTXFpWjJOd2s3T1hkZUg2TEI0RURnSWZjTTAwMGM0?=
 =?utf-8?B?QUZpYzZlUDkzY0JtSXRINk9wc2E1UnpYNzQ5VnJyRzFSN013SWdlQWQ3NXht?=
 =?utf-8?B?V1BBejZKTGJlQnFjYjRDZFRDR1YvS2NPM3h6QWhhLzFRUFJubUJZSW41c3E4?=
 =?utf-8?B?OVVnL2ZkbHovSVRBaW9yZG5XYWk3bXJaa3d2Y2tsS2VDZmlZMDU5c2hzdURa?=
 =?utf-8?B?UDhuNHNyTGErSkt4SW5sZDdiZkNBbEVNbVhua2krUk1TL2VwK1ZPbkRtVGta?=
 =?utf-8?B?czhXbUd0Q1lGM0xpeVRjdndpWDdneU03N29ESzQySE1zaXNlcHVSS3Z6S21v?=
 =?utf-8?B?L05RYWlnaE1LSkJMemJLYzBYa3lVcmc3Wk85NHBCYnFnTFpiSnpSSWxSSXgz?=
 =?utf-8?B?MUlBMEdydW9CNUxUeUdkOGZ1TEJyNlZOVFBMS1NNYlc1R2lCeCtLQTd4TU9G?=
 =?utf-8?B?em9wYmp6Y0NRVSt5UDFNaGw1aHp3QnBaYWZ0ejZtSmJBYktuSXNBRXUvK25o?=
 =?utf-8?B?NXlDS0Jib1d2ckFQTzFnajM5WVcwekFKSlErY0JIN1MvUEJEOW10VlBod2Mx?=
 =?utf-8?B?TDNzYStiVDJ4TTZKd2VrYkt3dTFlaDkvS1l3NmsvVEUyL3Jhd0xSaU5TK3RY?=
 =?utf-8?B?aDU0OFZrU09XNUwzc3lYK2VwRWtzWmdlbVl6OU5UVlozZW5JRm9aNksyT3k4?=
 =?utf-8?B?alRUa0JLSDcwWGtMQ0Z5czhjNnVrQ1dwNGgvaTVjWjRQL1NmS0tzK3JIcDlv?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: multipart/alternative;
	boundary="_000_PH8PR11MB69280C25C76A145377E2ECA9B8A42PH8PR11MB6928namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6928.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21ce4ed-2fd5-459b-0d27-08dca0ae6958
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 07:03:33.1824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnlLpm+Y/atGOzQtoHiOPJEbX74z+fwNcg00Yd7hVXNgfsacUGHA7Gf/0qg8Nfplmo0Kj0Y/mcca7K/oOW5PIEYIS4l4edv9ONRRlfQs/+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
X-Proofpoint-ORIG-GUID: KAah-vUNf9tryk4IwJ7-zj_oxzoRYMrL
X-Proofpoint-GUID: KAah-vUNf9tryk4IwJ7-zj_oxzoRYMrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_03,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407100050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 07:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111290

--_000_PH8PR11MB69280C25C76A145377E2ECA9B8A42PH8PR11MB6928namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

IGtpbmRseSBwaW5nIGZvciBzY2FydGhnYXAgYnJhbmNoLg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KRnJvbTogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBvbiBiZWhh
bGYgb2YgU29uZywgSmlheWluZyAoQ04pIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxKaWF5
aW5nLlNvbmcuQ049d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KU2VudDog
VHVlc2RheSwgSnVuZSA0LCAyMDI0IDExOjIwDQpUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPg0KU3ViamVjdDogW29lXSBbc2NhcnRoZ2FwXVttYXN0ZXJdW21ldGEtb2VdW1BBVENIXSBy
cmR0b29sOiBGaXggZG9fcG9wdWxhdGVfc3lzcm9vdCBRQSBpc3N1ZXMNCg0KRnJvbTogSmlheWlu
ZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2luZHJpdmVyLmNvbT4NCg0KVGhpcyBjb21taXQgYWRk
cmVzc2VzIHRoZSBzaGViYW5nIHNpemUgaXNzdWUgZW5jb3VudGVyZWQgaW4gdGhlDQpkb19wb3B1
bGF0ZV9zeXNyb290IHRhc2sgb2YgdGhlIHJyZHRvb2wtbmF0aXZlIHJlY2lwZS4gVGhlIGlzc3Vl
DQp3YXMgY2F1c2VkIGJ5IHRoZSBzaGViYW5nIGxpbmUgaW4gdGhlIGNnaS1kZW1vLmNnaSBmaWxl
IGV4Y2VlZGluZw0KdGhlIG1heGltdW0gYWxsb3dlZCBsZW5ndGggb2YgMTI4IGNoYXJhY3RlcnMu
DQoNClRoZSBmb2xsb3dpbmcgZXJyb3Igd2FzIG9ic2VydmVkOg0KDQpFUlJPUjogcnJkdG9vbC1u
YXRpdmUtMS44LjAtcjAgZG9fcG9wdWxhdGVfc3lzcm9vdDogUUEgSXNzdWU6IDogL3dvcmsveDg2
XzY0LWxpbnV4L3JyZHRvb2wtbmF0aXZlLzEuOC4wL3N5c3Jvb3QtZGVzdGRpci93b3JrL3g4Nl82
NC1saW51eC9ycmR0b29sLW5hdGl2ZS8xLjguMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL3No
YXJlL3JyZHRvb2wvZXhhbXBsZXMvY2dpLWRlbW8uY2dpIG1heGltdW0gc2hlYmFuZyBzaXplIGV4
Y2VlZGVkLCB0aGUgbWF4aW11bSBzaXplIGlzIDEyOC4gW3NoZWJhbmctc2l6ZV0NCkVSUk9SOiBy
cmR0b29sLW5hdGl2ZS0xLjguMC1yMCBkb19wb3B1bGF0ZV9zeXNyb290OiBkb19wb3B1bGF0ZV9z
eXNyb290IGZvciB0aGlzIHJlY2lwZSBpbnN0YWxsZWQgZmlsZXMgd2l0aCBRQSBpc3N1ZXMNCu+7
vw0KVGhlIHNvbHV0aW9uIGltcGxlbWVudGVkIGludm9sdmVzIG1vZGlmeWluZyB0aGUgc2hlYmFu
ZyBsaW5lIGluIHRoZQ0KY2dpLWRlbW8uY2dpIGZpbGUgdG8gdXNlICcvdXNyL2Jpbi9lbnYgcnJk
Y2dpJywgZW5zdXJpbmcgaXQgYWRoZXJlcw0KdG8gdGhlIGxlbmd0aCBsaW1pdC4NCg0KU2lnbmVk
LW9mZi1ieTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2luZHJpdmVyLmNvbT4NCi0t
LQ0KIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9ycmR0b29sL3JyZHRvb2xfMS44LjAuYmIgfCA1
ICsrKysrDQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEv
bWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JyZHRvb2wvcnJkdG9vbF8xLjguMC5iYiBiL21ldGEt
b2UvcmVjaXBlcy1leHRlbmRlZC9ycmR0b29sL3JyZHRvb2xfMS44LjAuYmINCmluZGV4IGNiZTFh
ZjI4NS4uNWFmYjNmMmY0IDEwMDY0NA0KLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3Jy
ZHRvb2wvcnJkdG9vbF8xLjguMC5iYg0KKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3Jy
ZHRvb2wvcnJkdG9vbF8xLjguMC5iYg0KQEAgLTEwMyw2ICsxMDMsMTEgQEAgZG9fY29uZmlndXJl
KCkgew0KICAgICAgICAgJHtCfS9leGFtcGxlcy8qLnBsDQogfQ0KDQorZG9faW5zdGFsbDphcHBl
bmQ6Y2xhc3MtbmF0aXZlKCkgew0KKyAgICAjIFJlcGxhY2UgdGhlIHNoZWJhbmcgbGluZSBpbiBj
Z2ktZGVtby5jZ2kNCisgICAgc2VkIC1pICcxc3xeLiokfCMhL3Vzci9iaW4vZW52IHJyZGNnaXwn
ICR7RH0ke2RhdGFkaXJ9L3JyZHRvb2wvZXhhbXBsZXMvY2dpLWRlbW8uY2dpDQorfQ0KKw0KIFBB
Q0tBR0VTID0rICIke1BOfS1wZXJsICR7UE59LXB5dGhvbiINCiBQQUNLQUdFUyA9KyAicnJkY2Fj
aGVkIg0KDQotLQ0KMi4yNS4xDQoNCg==

--_000_PH8PR11MB69280C25C76A145377E2ECA9B8A42PH8PR11MB6928namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQombmJzcDtraW5kbHkgcGluZyBmb3Igc2NhcnRo
Z2FwIGJyYW5jaC48L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9u
dC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2Us
IENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjog
cmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9k
aXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9
Ii0xIj4NCjxkaXYgaWQ9ImRpdlJwbHlGd2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxp
YnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0iZm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48
Yj5Gcm9tOjwvYj4gb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgJmx0
O29wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnJmd0OyBvbiBiZWhhbGYg
b2YgU29uZywgSmlheWluZyAoQ04pIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQogJmx0O0pp
YXlpbmcuU29uZy5DTj13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcmZ3Q7PGJy
Pg0KPGI+U2VudDo8L2I+IFR1ZXNkYXksIEp1bmUgNCwgMjAyNCAxMToyMDxicj4NCjxiPlRvOjwv
Yj4gb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgJmx0O29wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9i
PiBbb2VdIFtzY2FydGhnYXBdW21hc3Rlcl1bbWV0YS1vZV1bUEFUQ0hdIHJyZHRvb2w6IEZpeCBk
b19wb3B1bGF0ZV9zeXNyb290IFFBIGlzc3VlczwvZm9udD4NCjxkaXY+Jm5ic3A7PC9kaXY+DQo8
L2Rpdj4NCjxkaXYgY2xhc3M9IkJvZHlGcmFnbWVudCI+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMXB0OyI+DQo8ZGl2IGNsYXNzPSJQbGFpblRleHQiPkZyb206IEppYXlp
bmcgU29uZyAmbHQ7amlheWluZy5zb25nLmNuQHdpbmRyaXZlci5jb20mZ3Q7PGJyPg0KPGJyPg0K
VGhpcyBjb21taXQgYWRkcmVzc2VzIHRoZSBzaGViYW5nIHNpemUgaXNzdWUgZW5jb3VudGVyZWQg
aW4gdGhlPGJyPg0KZG9fcG9wdWxhdGVfc3lzcm9vdCB0YXNrIG9mIHRoZSBycmR0b29sLW5hdGl2
ZSByZWNpcGUuIFRoZSBpc3N1ZTxicj4NCndhcyBjYXVzZWQgYnkgdGhlIHNoZWJhbmcgbGluZSBp
biB0aGUgY2dpLWRlbW8uY2dpIGZpbGUgZXhjZWVkaW5nPGJyPg0KdGhlIG1heGltdW0gYWxsb3dl
ZCBsZW5ndGggb2YgMTI4IGNoYXJhY3RlcnMuPGJyPg0KPGJyPg0KVGhlIGZvbGxvd2luZyBlcnJv
ciB3YXMgb2JzZXJ2ZWQ6PGJyPg0KPGJyPg0KRVJST1I6IHJyZHRvb2wtbmF0aXZlLTEuOC4wLXIw
IGRvX3BvcHVsYXRlX3N5c3Jvb3Q6IFFBIElzc3VlOiA6IC93b3JrL3g4Nl82NC1saW51eC9ycmR0
b29sLW5hdGl2ZS8xLjguMC9zeXNyb290LWRlc3RkaXIvd29yay94ODZfNjQtbGludXgvcnJkdG9v
bC1uYXRpdmUvMS44LjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zaGFyZS9ycmR0b29sL2V4
YW1wbGVzL2NnaS1kZW1vLmNnaSBtYXhpbXVtIHNoZWJhbmcgc2l6ZSBleGNlZWRlZCwgdGhlIG1h
eGltdW0NCiBzaXplIGlzIDEyOC4gW3NoZWJhbmctc2l6ZV08YnI+DQpFUlJPUjogcnJkdG9vbC1u
YXRpdmUtMS44LjAtcjAgZG9fcG9wdWxhdGVfc3lzcm9vdDogZG9fcG9wdWxhdGVfc3lzcm9vdCBm
b3IgdGhpcyByZWNpcGUgaW5zdGFsbGVkIGZpbGVzIHdpdGggUUEgaXNzdWVzPGJyPg0K77u/PGJy
Pg0KVGhlIHNvbHV0aW9uIGltcGxlbWVudGVkIGludm9sdmVzIG1vZGlmeWluZyB0aGUgc2hlYmFu
ZyBsaW5lIGluIHRoZTxicj4NCmNnaS1kZW1vLmNnaSBmaWxlIHRvIHVzZSAnL3Vzci9iaW4vZW52
IHJyZGNnaScsIGVuc3VyaW5nIGl0IGFkaGVyZXM8YnI+DQp0byB0aGUgbGVuZ3RoIGxpbWl0Ljxi
cj4NCjxicj4NClNpZ25lZC1vZmYtYnk6IEppYXlpbmcgU29uZyAmbHQ7amlheWluZy5zb25nLmNu
QHdpbmRyaXZlci5jb20mZ3Q7PGJyPg0KLS0tPGJyPg0KJm5ic3A7bWV0YS1vZS9yZWNpcGVzLWV4
dGVuZGVkL3JyZHRvb2wvcnJkdG9vbF8xLjguMC5iYiB8IDUgKysrKys8YnI+DQombmJzcDsxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1leHRlbmRlZC9ycmR0b29sL3JyZHRvb2xfMS44LjAuYmIgYi9tZXRhLW9lL3Jl
Y2lwZXMtZXh0ZW5kZWQvcnJkdG9vbC9ycmR0b29sXzEuOC4wLmJiPGJyPg0KaW5kZXggY2JlMWFm
Mjg1Li41YWZiM2YyZjQgMTAwNjQ0PGJyPg0KLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVk
L3JyZHRvb2wvcnJkdG9vbF8xLjguMC5iYjxicj4NCisrKyBiL21ldGEtb2UvcmVjaXBlcy1leHRl
bmRlZC9ycmR0b29sL3JyZHRvb2xfMS44LjAuYmI8YnI+DQpAQCAtMTAzLDYgKzEwMywxMSBAQCBk
b19jb25maWd1cmUoKSB7PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7ICR7Qn0vZXhhbXBsZXMvKi5wbDxicj4NCiZuYnNwO308YnI+DQombmJzcDs8
YnI+DQorZG9faW5zdGFsbDphcHBlbmQ6Y2xhc3MtbmF0aXZlKCkgezxicj4NCismbmJzcDsmbmJz
cDsmbmJzcDsgIyBSZXBsYWNlIHRoZSBzaGViYW5nIGxpbmUgaW4gY2dpLWRlbW8uY2dpPGJyPg0K
KyZuYnNwOyZuYnNwOyZuYnNwOyBzZWQgLWkgJzFzfF4uKiR8IyEvdXNyL2Jpbi9lbnYgcnJkY2dp
fCcgJHtEfSR7ZGF0YWRpcn0vcnJkdG9vbC9leGFtcGxlcy9jZ2ktZGVtby5jZ2k8YnI+DQorfTxi
cj4NCis8YnI+DQombmJzcDtQQUNLQUdFUyA9KyAmcXVvdDske1BOfS1wZXJsICR7UE59LXB5dGhv
biZxdW90Ozxicj4NCiZuYnNwO1BBQ0tBR0VTID0rICZxdW90O3JyZGNhY2hlZCZxdW90Ozxicj4N
CiZuYnNwOzxicj4NCi0tIDxicj4NCjIuMjUuMTxicj4NCjxicj4NCjwvZGl2Pg0KPC9zcGFuPjwv
Zm9udD48L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_PH8PR11MB69280C25C76A145377E2ECA9B8A42PH8PR11MB6928namp_--

