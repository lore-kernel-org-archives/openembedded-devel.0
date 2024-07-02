Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A054C2BD09
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 01:44:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14816.1719884653914259264
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 18:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=791334c1e8=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4620U1Gn021440
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Jul 2024 01:44:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 402986acmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jul 2024 01:44:13 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4621iC0p026511;
	Tue, 2 Jul 2024 01:44:12 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 402986acmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 01:44:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9HiAKsA1TP3Am+kE1iXmDQH47EGdM6hQapyWVMvrll3o6ZKH5ArgJ4NcW/i6jxE5s3MObksrWh+TDZdHSgKqlFfPFD8DBO/QMqhboBOB+nzck0Shgj10mTSTRWoQvqM2qM8Xn+UXv8jP6I7GRM3bU7nA/S2DDMKR87ICcZ0wXLFpFbPCIOLvve+DOIu3V4vZHf58j87CTWaN0unY1kag3+B/6/rzX4/axzEWSb4Bv99baOA5dROycnzVpL3mJEUCMtE1IeZgKiCStyl14W8EySZmCB0mEPdUkOxoAQzEjqvqvxuqvfKIoAcUo1qxcCFaLf+12L/f94HJ0JHeTiHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tQmxm3coEghgYrYySpCNm6Zv1MJLjSSWhmmeRebTcA=;
 b=k11pBdMT83xMTYo8dRLzC42AXijIH68n9elGw4yrEKENY6ktgpz2ww80gWiwoP/z2L+3pMOJ61hzO56ou/Le+wKnWPz7oYFK3jZxWDQEw6nxvwruweXdKvLshucHTV5Ow2ksF2xZtc79tIOhftgwBz8by2OdPFZ7PyL1HH50cb8F9jd8iz88daYNa51jhHGcVxb/Rbc1LYthT9ukmQYP43YPL7/XxG0f2fTxl30+Di/PdlY1tZMWF5c4IGuUL59a2d+FANPnChpXuKjQ4rO6nk1Kire+b7RbX1N37XPiaal+jpFymyBi2Af+s9uMipNiC4ul7qKFiroO6/b9Z50OyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 by MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Tue, 2 Jul
 2024 01:44:06 +0000
Received: from IA1PR11MB6417.namprd11.prod.outlook.com
 ([fe80::fe57:61ca:7119:ccf7]) by IA1PR11MB6417.namprd11.prod.outlook.com
 ([fe80::fe57:61ca:7119:ccf7%5]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 01:44:06 +0000
From: "Yan, Haixiao (CN)" <Haixiao.Yan.CN@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] v4l-utils: do_package_qa: QA Issue:
 /usr/bin/cec-compliance uses 32-bit api 'time'
Thread-Topic: [oe] [meta-oe] v4l-utils: do_package_qa: QA Issue:
 /usr/bin/cec-compliance uses 32-bit api 'time'
Thread-Index: AdrKJ8PIyIBKwlJzTRK3OQOQfB4EWABcieUAACHDMAA=
Date: Tue, 2 Jul 2024 01:44:06 +0000
Message-ID: 
 <IA1PR11MB64176FB4191DD66B4C1AD0D0DFDC2@IA1PR11MB6417.namprd11.prod.outlook.com>
References: 
 <IA1PR11MB641711E1B9EFCB32A7BA6845DFD12@IA1PR11MB6417.namprd11.prod.outlook.com>
 <CANNYZj_VyHskoFVvac_bv6HA9_=ta-zmEHzNcmnCESm7aqcXkg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_VyHskoFVvac_bv6HA9_=ta-zmEHzNcmnCESm7aqcXkg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6417:EE_|MN0PR11MB6208:EE_
x-ms-office365-filtering-correlation-id: 96bb6e51-a970-437f-42f5-08dc9a3875a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RGJ3MDYxaFRKU0UrcmRHNktVM1Nla0xKYndPdDdYc0doRTRkcEhGNlJYeXlT?=
 =?utf-8?B?ZzFLbjNQZFI3OUcxcy9KVXR6YWRCUERBTXM2RGZ6R2NHeG9HcWpNck43N1Fo?=
 =?utf-8?B?amg0Y2ZNRTBwblpFMUwyNWY2RDFQMVFlVmlJS1R0c3pDa1RZSEo1bE1zYnVX?=
 =?utf-8?B?SlpGUXVYdGd1eGN5NngySXp5TGVhYVdsQlJFS1lyYnptSkwrVHc3N0t5YnNh?=
 =?utf-8?B?N05ZZU54M1lsZmtzbnh6SlpGL0dEN2ZKeTBYQkYvN3F0a2RwaDRDY0RlS1A0?=
 =?utf-8?B?NUU2enVYMGJUS0NuNUhrY2kzVkF6OVk3VEtNTTVNU3ZncXZTc285VkcrWDBV?=
 =?utf-8?B?NEpDV25aQXhzTWNBQWVCeVZiVjdJVDdMaldFZmJpQnRBUVRYcHBZbU4rRXRH?=
 =?utf-8?B?ZFBvWDlzM1FYTGR4R0libnd2MmNlVTIybHErVFMvVDFObzRkU2NqQXB5OVpT?=
 =?utf-8?B?THIxUmZaeUZWLzV0RzNoeXJrTGVpSjk0NldDTzkrdDZsQ0Z4QlNsN0xiZTVQ?=
 =?utf-8?B?SzZ4N0x0Uml6YUpmTnVDRlRsQldTR2pZQ1VsWFZONEpSZHl1L2F5UFJYNktZ?=
 =?utf-8?B?c2UxOTlQOVNyby9vcnVLV2pUZzFxNXZHeXRGNnpUdjUxaW5Tb2IvdVdCMk1E?=
 =?utf-8?B?OEVyTzAyWE9hZlR4bGlJWFBON1BvdEhuN3VQZURUQWI1WjNqMnpDdjFMTVdO?=
 =?utf-8?B?ZHV1Z3BvMG5MNCs1MGNYdU1ZWG9xRTNZQzBPM0o4WUhJVi9Hczdsd2JoVCta?=
 =?utf-8?B?a20vTG5HTmpLRGhkNStiWFZoUFNsMWo2ZFhZa1hMTjFVaWxNaTF5dHFRY2RH?=
 =?utf-8?B?NWxrcjVxQ0I4R3Q1WUhuQVFPeVpqZ0ZWUlJ6MmdNWk9qdm9TSkU5VGJGZlN1?=
 =?utf-8?B?b001Mm1pR2d2K1Zab1RSMHN0ZVRKUStYWG1DSHU5Zyt3VHZwcXY2S2FXYmpV?=
 =?utf-8?B?RituWisvaEd3MFJCRnpzRVZUdWV4UEJTY3o4dE9KUVZrYk8zdDhrUVBBc3Ry?=
 =?utf-8?B?OFYvYkZSdFZhL092amFiZWFmaU10dDJaQ1pBNDlpTVFUbEdrQit1UGJwSDRw?=
 =?utf-8?B?cVEwT3N2OVlScXdxdFFJbnpjYWdrM1QyMmJPOTllc2dxZ2dTQmVZU1U1QTFi?=
 =?utf-8?B?UTgvbWF5aXBubmtHZ1ZESEU4NUZBdFpERjd5akQyYWxRZVBQWEI0MkRzelN1?=
 =?utf-8?B?R2I4dExIdXVrdUcxU3dGdkhFTHQ2cm1tK0RmN2NtRnZjdU5xUWdwRmovZkNX?=
 =?utf-8?B?aHArUUhiN0pTSDhaaWE5UlYwcTRoTW13R21RdE1lTzJMb2JkNnlaK1JZUW00?=
 =?utf-8?B?MWJzZE1pODgxL0V1c3lPMjBhSHBpYTRZUWhXdDVVTU5MWms1ZURFTnJsMmJu?=
 =?utf-8?B?bGhEc3dxYW9xdEZOYnBYZ1VHQkptVXVHSkhOQmlXWE04QkY3YngzczN0NzQv?=
 =?utf-8?B?K010Rm9NZnRmRnc0YzNIVnZibjAwOUtFVXpaTDk5R0p5ZGtVbXVtQm95MHlE?=
 =?utf-8?B?L1UwcjVPeWUvazVBK2RCTjZiOUNyYUVGYzV1a0paZXlEbU5tODRFQ2t6RDNx?=
 =?utf-8?B?WFFRWko5OW5GUFYzcTkyZGhJUld1eGdYZUtIV1VrMlp3cmRmS0N5YUFFa3Rq?=
 =?utf-8?B?RkRFYTErbG5NUTYxbm03clRvQ1Q4NGNOMHR5czhLeGdkQnJPL08zRU02K01u?=
 =?utf-8?B?LzhNaFZVUU1kejd6MG5nbms4SlFyQnA1c01vQ1diWGdMekZDbGs5aDZ5VXIy?=
 =?utf-8?B?c3VNTWc5cHRkL3A1aWNwSCttWTRZNnFWN2JwaTJFMk5rbFRseHA0QmovU1ZV?=
 =?utf-8?Q?exJFaYr+fLpV3MeCV/QfRN6p5NzXz4iKM1EBs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6417.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dGxNWGFzd3RwWnAveTJNU1RPOGRlMVcxRDZ5dERrS0t2VjNHMEUyN0g4Vjhj?=
 =?utf-8?B?ZXF4ZWJvWndrUGVNRmlyUVdoc2NGMVd1WVh3QzZIbGRmWHpOQzJQNUVZczg3?=
 =?utf-8?B?dGpoclNUYVRYSFd0dWZVcHp2TzVBUlpZcU9pRDhGWmIrSFdGNWhWM2Fqa0Rq?=
 =?utf-8?B?clZTdGNSRTd0ZUE0L2p2bitET1lKcUJQekZhMjYyZndwMXpqUDMxSFc4QWMw?=
 =?utf-8?B?VE9jbjEzcUpZT2JkK3JxQktCN3l1QmFsSmdhRTNkSjdSMjgvMXZzL2R6WHdq?=
 =?utf-8?B?d3FHRnI4NXQ1TmZPQ3h0YkRteVU3RUEvMmh4bFhLRS8rWWt2RmhQQllqTFkv?=
 =?utf-8?B?ZmV6RkRFam9Mb2JJMFM0RjBOVDlIVmJTL21YZ215a3dZd29FaXpwZXhIVEpK?=
 =?utf-8?B?aWxtRHRrTS81WmlYdGI4U0pmMENtZnBTT0pwZkszVGpaZEdjVE5Qa282SVZx?=
 =?utf-8?B?akNTeEREZjdqc2s0S21LYXppMzRKOTIxQkU4eWV0NCs2dWxNTCtxTStEQlIw?=
 =?utf-8?B?dHF5WkJzK1FvRUo0UkwzUnl1cDk0cytobVVYN3l6ZEZzdVptOS9FT2FTckN3?=
 =?utf-8?B?dEVmdjRwN1pCaEZIQXFnb3htUDBSbUdHOUpkb0pCSjBPTzRCTmVsejNnbWl3?=
 =?utf-8?B?SDZYVk05MjJhaVdkK3dtNm1PYjFBZ0pCN2lsSUIwUVdFNnlQWFZPRHVYUVNx?=
 =?utf-8?B?MDJ3c3grbUNJOVlOV0piZGZlRlk5clRlUW9ra29XVTZTVFNuTHR5d0g3RHBn?=
 =?utf-8?B?NWJHK3kyOTg1R3E1NmdZRUFLU1ZESS85YUZCREZUR1lXenQ3UlpGK203QTYr?=
 =?utf-8?B?djBxVGE2Z1ZrTlVma2RtOWQwTVhxM3l6TUZpQ0lVTXpQL2d2N1F6NzRTV2tS?=
 =?utf-8?B?azdXZDUxdGp1bnJ4bUhnc3ROR1lLYWN0TG5ZS3Z5ejRqMjZ0TE5HZUFUajdG?=
 =?utf-8?B?Y2Q0bG5UU1pCVDZkQmhvSkVNUGlWL29DMmVJMm14SkZoT004K3BIRzRzOGZO?=
 =?utf-8?B?VTRzS3NkSzV3UCt5SlEya1U4Q29wMTNNbUZRNC9Za2VXSnBITC81ckd0Rnl6?=
 =?utf-8?B?R3d2c2tNWmh1c1VWMmRWTko1QThDUTRuM1BubjFJajlPMFVJN01NZHFaMUdk?=
 =?utf-8?B?TmxKVTlnRTRPWHNqWkhKWmM5MHI5ZmFiWk16NkVGWkIyNTJpdUhsTmNIV2pa?=
 =?utf-8?B?SXgzQmRrZHZWWmwzMndWTlVJSkd4S2tMZ2g0L0RPTmNLeXZLUTF4RVJGUmZR?=
 =?utf-8?B?RTZ3cmZwb0Y2OWoyOGtCVGZlRmJ4dnlMYVlwQ0p6dDBNayt2ZVN3anB3WUEx?=
 =?utf-8?B?UTNLTCtVRDJucnpiVXJzSjdETUE0OWQ5eHNueXdZeEhhamFOajdncnlhZS90?=
 =?utf-8?B?d0tOOWtPaitWczZPRWJHSHZxdFJwQ21NV2tpWkRDK3Y4K1VZTmtJb29IWjlo?=
 =?utf-8?B?OXpvYlJ4S0cybll4NU5kTVZvblF5d1JxM2FYTmNQS0NiUmJ5SWRabGtlWjZJ?=
 =?utf-8?B?YmxId2tONzlmRlFWNzU0QVYwT3VBMExEU2w5clJydG4xa2VQT29nNG5GRXhD?=
 =?utf-8?B?amxpUGd2OUgvcFlReDF2VDlUcVp4dlBGTFllVDAxTnI3ZWo0UkdUdWwvYnZH?=
 =?utf-8?B?WUtYdUxBb3dRSzIxMUdWWHFHSEkrNFUrY2RnUk5ZU25lS05TUXZYcWFxekdz?=
 =?utf-8?B?UUIvUUxuRE1tbEdDUVdxcW02R3NCc2p0dy8vdU5WTjVBTTFvRFJhU3RlYk9p?=
 =?utf-8?B?c1V5cXF4ak5wTS9ncks3UFI2K1RUSjMveXhoRWJnOWhMTkwyaTdFM21lckVi?=
 =?utf-8?B?R1VXNWl5MjQrekVYdmR5RnM4UVZNcHFKRkNoM2x6USsyQi92MFdXWVcrZ0lN?=
 =?utf-8?B?alFQSk9rWjBIUHVhTDRzR0xlTVNBRmhwOS9BVm83Snl3SDAwbW9KOTFvRVNB?=
 =?utf-8?B?eUt2TitsRE82bVA0SmZJZjJNWlgrWkJoL2VZaWh5N3hEN2I2ZUZxcW9JVGhj?=
 =?utf-8?B?Y09CckNOcmcrdFlCUTdpcjIrR3hsdUh3cEFGQVJHY2V5QkZRZ1kwb2xMZVJz?=
 =?utf-8?B?WmhKdUZTeXNSN28xaUJueElOTjdKTUpsOXlqMzJkMmJ6WFNqYlRrcWh0QWVs?=
 =?utf-8?B?bG1lSG9uclEzOWZicmdmUEMwdUhiOS9ibUtQYXJHUjJ0NlFNM0VEaGpEelMy?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6417.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bb6e51-a970-437f-42f5-08dc9a3875a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 01:44:06.1825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: quJqPkasHga/IveNav/lF7TbGlBUFq/IIdUIrCnQ4fFei3PE/67OiTCR4YB37h854pHOg+MKlBj6Im23LE+gOO46KgoixBlmgGT7tHuqksc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6208
X-Proofpoint-GUID: 1bqQWvKIi2_cVCeHg_6rK-1FcT3q9Kgx
X-Proofpoint-ORIG-GUID: pC2TOana3-JT04yyvt_hVfMq6i73xRO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_23,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407020011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jul 2024 01:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111212

SSBoYXZlIHNlZW4gc29tZSBkaXNjdXNzaW9uIG9uIGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
Zw0KdjRsLXV0aWxzOiBmaXggY29tcGlsYXRpb24gd2l0aCA2NC1iaXQgdGltZV90DQoNCk5vdCBz
dXJlIHRoaXMgY29tbWl0IGlzIHJlbGF0ZWQgdG8gdGhlIHFhIHdhcm5pbmcgaXNzdWUuDQpJIGhh
dmUgbm90IHJlY2VpdmVkIGFueSByZXNwb25zZS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPiANClNl
bnQ6IE1vbmRheSwgSnVseSAxLCAyMDI0IDU6MzUgUE0NClRvOiBZYW4sIEhhaXhpYW8gKENOKSA8
SGFpeGlhby5ZYW4uQ05Ad2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdIHY0bC11dGls
czogZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IC91c3IvYmluL2NlYy1jb21wbGlhbmNlIHVzZXMg
MzItYml0IGFwaSAndGltZScNCg0KQ0FVVElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9u
IFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCENCkRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZS4NCg0KSSBndWVzcyB5b3UgY2FuIHN1cHByZXNzIHRoZSBxYSBjaGVjayAo
bGlrZSBkb25lIGluIHRpbWU2NC5pbmMgZm9yIG90aGVyIGNvbXBvbmVudHMpLCBhbmQgb3BlbiBh
IHRpY2tldCB1cHN0cmVhbT8gQnV0IGZpcnN0IGNoZWNrIGlmIHRoZSB0aXAgb2YgbWFzdGVyIGJy
YW5jaCBoYXMgZG9uZSBhbnl0aGluZyB0byByZXNvbHZlIHRoZSBpc3N1ZS4NCg0KQWxleA0KDQpP
biBTYXQsIDI5IEp1biAyMDI0IGF0IDE1OjI3LCBZYW4sIEhhaXhpYW8gKENOKSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8SGFpeGlhby5ZYW4uQ049d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4NCj4gSGksDQo+DQo+IFdoZW4gYnVpbGRpbmcgMzItYml0
IGxpYiBmb3IgdjRsLXV0aWxzLCBtZXQgdGhlIFFBIHdhcm5pbmcgaXNzdWUuDQo+DQo+IFdBUk5J
Tkc6IGxpYjMyLXY0bC11dGlscy0xLjI2LjErZ2l0LXIwIGRvX3BhY2thZ2VfcWE6IFFBIElzc3Vl
OiANCj4gL3Vzci9iaW4vaXIta2V5dGFibGUgdXNlcyAzMi1iaXQgYXBpICdpb2MgdGwnDQo+IC91
c3IvYmluL2lyLWtleXRhYmxlIHVzZXMgMzItYml0IGFwaSAnc3RhdDY0Jw0KPiBTdXBwcmVzcyB3
aXRoIElOU0FORV9TS0lQID0gIjMyYml0LXRpbWUiDQo+IC91c3IvYmluL21lZGlhLWN0bCB1c2Vz
IDMyLWJpdCBhcGkgJ2lvY3RsJw0KPiAvdXNyL2Jpbi9tZWRpYS1jdGwgdXNlcyAzMi1iaXQgYXBp
ICdzdGF0NjQnDQo+IFN1cHByZXNzIHdpdGggSU5TQU5FX1NLSVAgPSAiMzJiaXQtdGltZSINCj4g
L3Vzci9iaW4vcmRzLWN0bCB1c2VzIDMyLWJpdCBhcGkgJ2lvY3RsJw0KPiAvdXNyL2Jpbi9yZHMt
Y3RsIHVzZXMgMzItYml0IGFwaSAnY3RpbWUnDQo+IFN1cHByZXNzIHdpdGggSU5TQU5FX1NLSVAg
PSAiMzJiaXQtdGltZSINCj4gL3Vzci9iaW4vdjRsMi1jdGwgdXNlcyAzMi1iaXQgYXBpICdzZWxl
Y3QnDQo+IC91c3IvYmluL3Y0bDItY3RsIHVzZXMgMzItYml0IGFwaSAnZnN0YXQ2NCcNCj4gL3Vz
ci9iaW4vdjRsMi1jdGwgdXNlcyAzMi1iaXQgYXBpICdjbG9ja19nZXR0aW1lJw0KPiAvdXNyL2Jp
bi92NGwyLWN0bCB1c2VzIDMyLWJpdCBhcGkgJ2lvY3RsJw0KPiAvdXNyL2Jpbi92NGwyLWN0bCB1
c2VzIDMyLWJpdCBhcGkgJ25hbm9zbGVlcCcNCj4gL3Vzci9iaW4vdjRsMi1jdGwgdXNlcyAzMi1i
aXQgYXBpICdmY250bDY0Jw0KPiAvdXNyL2Jpbi92NGwyLWN0bCB1c2VzIDMyLWJpdCBhcGkgJ3N0
YXQ2NCcNCj4gU3VwcHJlc3Mgd2l0aCBJTlNBTkVfU0tJUCA9ICIzMmJpdC10aW1lIg0KPiAvdXNy
L2Jpbi92NGwyLWNvbXBsaWFuY2UgdXNlcyAzMi1iaXQgYXBpICdzZWxlY3QnDQo+IC91c3IvYmlu
L3Y0bDItY29tcGxpYW5jZSB1c2VzIDMyLWJpdCBhcGkgJ2ZzdGF0NjQnDQo+IC91c3IvYmluL3Y0
bDItY29tcGxpYW5jZSB1c2VzIDMyLWJpdCBhcGkgJ2Nsb2NrX2dldHRpbWUnDQo+IC91c3IvYmlu
L3Y0bDItY29tcGxpYW5jZSB1c2VzIDMyLWJpdCBhcGkgJ2lvY3RsJw0KPiAvdXNyL2Jpbi92NGwy
LWNvbXBsaWFuY2UgdXNlcyAzMi1iaXQgYXBpICdmY250bDY0Jw0KPiAvdXNyL2Jpbi92NGwyLWNv
bXBsaWFuY2UgdXNlcyAzMi1iaXQgYXBpICdzdGF0NjQnDQo+IFN1cHByZXNzIHdpdGggSU5TQU5F
X1NLSVAgPSAiMzJiaXQtdGltZSINCj4gL3Vzci9iaW4vdjRsMi1jb21wbGlhbmNlIHVzZXMgMzIt
Yml0IGFwaSAnc2VsZWN0Jw0KPiAvdXNyL2Jpbi92NGwyLWNvbXBsaWFuY2UgdXNlcyAzMi1iaXQg
YXBpICdmc3RhdDY0Jw0KPiAvdXNyL2Jpbi92NGwyLWNvbXBsaWFuY2UgdXNlcyAzMi1iaXQgYXBp
ICdjbG9ja19nZXR0aW1lJw0KPiAvdXNyL2Jpbi92NGwyLWNvbXBsaWFuY2UgdXNlcyAzMi1iaXQg
YXBpICdpb2N0bCcNCj4gL3Vzci9iaW4vdjRsMi1jb21wbGlhbmNlIHVzZXMgMzItYml0IGFwaSAn
ZmNudGw2NCcNCj4gL3Vzci9iaW4vdjRsMi1jb21wbGlhbmNlIHVzZXMgMzItYml0IGFwaSAnc3Rh
dDY0Jw0KPiBTdXBwcmVzcyB3aXRoIElOU0FORV9TS0lQID0gIjMyYml0LXRpbWUiDQo+IC91c3Iv
YmluL3Y0bDItc3lzZnMtcGF0aCB1c2VzIDMyLWJpdCBhcGkgJ2ZzdGF0NjQnDQo+IFN1cHByZXNz
IHdpdGggSU5TQU5FX1NLSVAgPSAiMzJiaXQtdGltZSINCj4gL3Vzci9iaW4vZGVjb2RlX3RtNjAw
MCB1c2VzIDMyLWJpdCBhcGkgJ2lvY3RsJw0KPiAvdXNyL2Jpbi9kZWNvZGVfdG02MDAwIHVzZXMg
MzItYml0IGFwaSAnc2VsZWN0Jw0KPiBTdXBwcmVzcyB3aXRoIElOU0FORV9TS0lQID0gIjMyYml0
LXRpbWUiDQo+IC91c3IvYmluL2NlYy1jb21wbGlhbmNlIHVzZXMgMzItYml0IGFwaSAnY3RpbWUn
DQo+IC91c3IvYmluL2NlYy1jb21wbGlhbmNlIHVzZXMgMzItYml0IGFwaSAnbG9jYWx0aW1lJw0K
PiAvdXNyL2Jpbi9jZWMtY29tcGxpYW5jZSB1c2VzIDMyLWJpdCBhcGkgJ2Nsb2NrX2dldHRpbWUn
DQo+IC91c3IvYmluL2NlYy1jb21wbGlhbmNlIHVzZXMgMzItYml0IGFwaSAnaW9jdGwnDQo+IC91
c3IvYmluL2NlYy1jb21wbGlhbmNlIHVzZXMgMzItYml0IGFwaSAnZ2V0dGltZW9mZGF5Jw0KPiAv
dXNyL2Jpbi9jZWMtY29tcGxpYW5jZSB1c2VzIDMyLWJpdCBhcGkgJ2ZjbnRsNjQnDQo+IC91c3Iv
YmluL2NlYy1jb21wbGlhbmNlIHVzZXMgMzItYml0IGFwaSAndGltZScNCj4gL3Vzci9iaW4vY2Vj
LWNvbXBsaWFuY2UgdXNlcyAzMi1iaXQgYXBpICdzZWxlY3QnDQo+IFN1cHByZXNzIHdpdGggSU5T
QU5FX1NLSVAgPSAiMzJiaXQtdGltZSINCj4gL3Vzci9iaW4vY2VjLWNvbXBsaWFuY2UgdXNlcyAz
Mi1iaXQgYXBpICdjdGltZScNCj4gL3Vzci9iaW4vY2VjLWNvbXBsaWFuY2UgdXNlcyAzMi1iaXQg
YXBpICdsb2NhbHRpbWUnDQo+IC91c3IvYmluL2NlYy1jb21wbGlhbmNlIHVzZXMgMzItYml0IGFw
aSAnY2xvY2tfZ2V0dGltZScNCj4gL3Vzci9iaW4vY2VjLWNvbXBsaWFuY2UgdXNlcyAzMi1iaXQg
YXBpICdpb2N0bCcNCj4gL3Vzci9iaW4vY2VjLWNvbXBsaWFuY2UgdXNlcyAzMi1iaXQgYXBpICdn
ZXR0aW1lb2ZkYXknDQo+IC91c3IvYmluL2NlYy1jb21wbGlhbmNlIHVzZXMgMzItYml0IGFwaSAn
ZmNudGw2NCcNCj4gL3Vzci9iaW4vY2VjLWNvbXBsaWFuY2UgdXNlcyAzMi1iaXQgYXBpICd0aW1l
Jw0KPiAvdXNyL2Jpbi9jZWMtY29tcGxpYW5jZSB1c2VzIDMyLWJpdCBhcGkgJ3NlbGVjdCcNCj4g
U3VwcHJlc3Mgd2l0aCBJTlNBTkVfU0tJUCA9ICIzMmJpdC10aW1lIg0KPg0KPiBBZnRlciBpbnZl
c3RpZ2F0aW5nLA0KPiBtZXRhLW9wZW5lbWJlZGRlZC9tZXRhLW9lL3JlY2lwZXMtbXVsdGltZWRp
YS92NGwyYXBwcy92NGwtdXRpbHNfMS4yNi4xDQo+IC5iYg0KPiAjdjRsMiBleHBsaWNpdGx5IHNl
dHMgX0ZJTEVfT0ZGU0VUX0JJVFM9MzIgdG8gZ2V0IGFjY2VzcyB0byAjYm90aCAzMiBhbmQgNjQg
Yml0IGZpbGUgQVBJcy4gIEJ1dCBpdCBkb2VzIG5vdCBoYW5kbGUgdGhlIHRpbWUgc2lkZT8NCj4g
I05lZWRzIGZ1cnRoZXIgaW52ZXN0aWdhdGlvbg0KPiBHTElCQ182NEJJVF9USU1FX0ZMQUdTID0g
IiINCj4NCj4gR0xJQkNfNjRCSVRfVElNRV9GTEFHUyA9ICIgLURfVElNRV9CSVRTPTY0IC1EX0ZJ
TEVfT0ZGU0VUX0JJVFM9NjQiIHdoaWNoIGRlZmluZWQgaW4gb2UtY29yZS9tZXRhL2NvbmYvZGlz
dHJvL2luY2x1ZGUvdGltZTY0LmluYyB3YXMgcmVzZXQsIHNvIHJlc3VsdCBpbiB0aGlzIFFBIGlz
c3VlLg0KPg0KPiB3aGVuIGNvbW1lbnQgR0xJQkNfNjRCSVRfVElNRV9GTEFHUyA9ICIiICwgdGhl
cmUgaXMgYnVpbGQgZXJyb3IuDQo+IC9idWlsZC12NGwvdG1wLWdsaWJjL3dvcmsvY29yZTItMzIt
d3JzbWxsaWIzMi1saW51eC9saWIzMi12NGwtdXRpbHMvMS4yNi4xK2dpdC9saWIzMi1yZWNpcGUt
c3lzcm9vdC91c3IvaW5jbHVkZS9mZWF0dXJlcy10aW1lNjQuaDoyNjo1OiBlcnJvcjogI2Vycm9y
ICAgICAiX1RJTUVfQklUUz02NCBpcyBhbGxvd2VkIG9ubHkgd2l0aCBfRklMRV9PRkZTRVRfQklU
Uz02NCINCj4gMjYgfCAjICAgZXJyb3IgIl9USU1FX0JJVFM9NjQgaXMgYWxsb3dlZCBvbmx5IHdp
dGggX0ZJTEVfT0ZGU0VUX0JJVFM9NjQiDQo+DQo+IHRoZSBidWlsZCBlcnJvciBpcyBjYXVzZWQg
YnkgdjRsLXV0aWxzIG1lc29uLmJ1aWxkOg0KPiB2NGwyX3dyYXBwZXJfYXJncyA9IFsNCj4gICAg
ICMgQXMgdGhlIGxpYnJhcnkgbmVlZHMgdG8gcHJvdmlkZSBib3RoIDMyLWJpdCBhbmQgNjQtYml0
IHZlcnNpb25zDQo+ICAgICAjIG9mIGZpbGUgb3BlcmF0aW9ucywgZGlzYWJsZSB0cmFuc3BhcmVu
dCBsYXJnZSBmaWxlIHN1cHBvcnQgKGZpeGVzDQo+ICAgICAjICdFcnJvcjogc3ltYm9sIGBvcGVu
NjQvbW1hcDY0JyBpcyBhbHJlYWR5IGRlZmluZWQnIGNvbXBpbGUgZmFpbHVyZQ0KPiAgICAgIyBv
dGhlcndpc2UpDQo+ICAgICAnLVVfRklMRV9PRkZTRVRfQklUUycsDQo+ICAgICAnLURfRklMRV9P
RkZTRVRfQklUUz0zMicsDQo+ICAgICAnLURfTEFSR0VGSUxFNjRfU09VUkNFJywNCj4gXQ0KPg0K
PiBEX0ZJTEVfT0ZGU0VUX0JJVFMgd2FzIHJlc2V0IHRvIDMyIGR1cmluZyBjb21waWxlLg0KPg0K
PiBJcyB0aGVyZSBhbnkgc29sdXRpb24gZm9yIHRoaXMgaXNzdWU/DQo+DQo+IFRoYW5rcywNCj4g
SGFpeGlhbw0KPg0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUg
KCMxMTExNTkpOiANCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWRldmVsL21lc3NhZ2UvMTExMTU5DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL210LzEwNjk0NDYzMS8xNjg2NDg5DQo+IEdyb3VwIE93bmVyOiBv
cGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNj
cmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVs
L3Vuc3ViIA0KPiBbYWxleC5rYW5hdmluQGdtYWlsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4NCg==

