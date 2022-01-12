Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E26EC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 08:09:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20474.1641974988266960653
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 00:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=kKay8LYH;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8011898d9a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20C7gFmR003078
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 00:09:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=//hivM0pRQQAQRDJznBD+5nI3MZRi3ZP89nvFrzM0BA=;
 b=kKay8LYHpzvtGwJ1eiGA/sYCj04v4OsGPaALA92JR5ik5QMtTzVxBF+MmyUAUj6SpiIu
 hAoI3FupN+yFDjEtO1vBCb6QLFhMheHxCRf7nIWBJh25MmbHF9iW4O5ipGaJbHDZ70bF
 GOsnnDqc9GfLgK079hdNRsRvK7qRk/6Q/Vn/ftbgK88ISdEMdt2DNUQ+v6SYZaOFj50V
 IN1u90Q0ulUNeqt68+nPwQad674tEpcyKnByZb15+7T7PCf9Dhd1gi4Nt6AFPkDUgBrw
 qKN1wZSaM0hDdb97DbypaNhZvkVatWs4axGipZ9yq7vSXyxKRsGkzZZ+fRa+rZSjrAj+ og==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dggv39mq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 00:09:47 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20C89lxr025859
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 00:09:47 -0800
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dggv39mq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jan 2022 00:09:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1fwcJxu8U3RZZ87/7MQ0zTLnar25USu8dphHzBBebCkUdqxx0TOovh5JNxOqTRTRNca7Kx5eaj7FEYtu7udnDYQhocPhXP8r/AuMEgZFroC01vxvqiYgk2+qE0aLMXiXU/km9yo7KxwqHCFAmx2QylSJugb0kP3a0QmpUG7VVrnvEuxVyHU0an7ZfBMnlWkz9rQ4hQHGBajfoJsTTPybolxj6jAXhHp88MTI1+76Fp08gJyy1FmD6AI4wfrpIR60Sv3iFml4UHAOAIWYKZzhQcGGzMpu1/wsKScV0T+Ngrs4TZM7PmOKOfBP5Y2xO84VtvwfuCqwK8Pd6qpEpudfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//hivM0pRQQAQRDJznBD+5nI3MZRi3ZP89nvFrzM0BA=;
 b=RaGjr+OTaQTFANvEs8WVeklB42zMGTLsdlk2HxiZnn6Q8CefNJur1pcZLlud2PZztInYKKo4f7e3cFezPC8q5cEsdJxDIUJUjnkGd1N9LlN3TpxjvZhL2z8q1zDl8Nb3Rn0GZP1zHzGUPr0AhWZX0CpdToemuQ1QY8vmLiyS8MXG6qv2LNiOwliUcuTKkNx9/Iw2WmttGoZXALCoM+kbKfgzDLUPWC5xXL1+ffQcbw7Df65VUiHvDj04wxuyOIwnO+KrvGQyVDDzwkleXQ3qR1HKSZgNTB76jh1QOMn/5H6+SMhzeciIzqQdFqQRhjk31nVfl9c7TY9YoevNyrliKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2192.namprd11.prod.outlook.com (2603:10b6:301:59::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 08:09:43 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::3d37:c25a:72c6:6601]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::3d37:c25a:72c6:6601%5]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 08:09:43 +0000
Subject: Re: [oe] [meta-oe][PATCH] php: avoid textrel QA Issue warning
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20220107080821.16187-1-mingli.yu@windriver.com>
 <526c12ba-e0c1-31be-6c68-df43b80d211e@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <ad5567ed-ded2-790d-a7c6-c1adf9251705@windriver.com>
Date: Wed, 12 Jan 2022 16:09:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <526c12ba-e0c1-31be-6c68-df43b80d211e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR04CA0063.apcprd04.prod.outlook.com
 (2603:1096:202:14::31) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa4ff732-f727-4157-1da1-08d9d5a2e3bd
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2192:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2192347D9E68DC1587EB54C3F1529@MWHPR1101MB2192.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:451;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/7pQsd2/C8rVxL3DpH7ngjJG6/NX9rzNwycH2dgbxhUzjLWltfDD298sHm9Dvdn/pM1GKlr9mI5sp3ACowxElS+8q1CkjfnMQiH99aI9k7oy3U3VpQ1JadtmQIiJy8laODDlmhzj13QkFBEQF3i/iip1202yZP908Qg++MLMvAtNmUTKlGadQRKZyxk2M2KiH6enpN3xav5YbK0gKUsIdsszdSI4rPDZLetxMX/UX/Xg/wMh1tTWfaZGw9X3iYpWrim47duHSsu6qFt6SWFDukjIEpAW0r0zjToxdAcVlCqtMpsRggsy95f7OZ9LQu0xONTfFP++MyfKgDmKKkYupitYR9O+DSO6w4pdfLc1XPU31bKFBu3tv6G85MZn7JH1Ud7QjUumNG6u00wIp31OgHMUpgpYDtwpO/LnwTlb/v5y+DW/OhaQZkSX+3vn4g6fFdxH8eS01uRCKt8TBA4uSs60Ag6HWHdINpJzDkcdBG7TDSqfeRE9y8sYoyge25BHfejesagtPrdQ+BvZO0f7+zFy/rYShi+sgInTFEdIPTtOHm1VA65l6vahfkArdDh3xpZBTWW2hv7AM1IoRIwYzHQNwF7UzGBXjYz7bzN4MV453rn52vs3K4obIpZDDccpqkF9Owc+HOZKtOWgctNLLXQaoGsMD+RzIFKxKIv8O3CJKIisQbvhaRv5inhmAeNvZIKisOwmrYeoRO6IVVTEO6k587td+UTLD9TL6RqJ8x/xlTSEdRotzss7RWMywswkkO2MFqZf7yzBkKry6AgwUo1fk+itilEJx5EWeWR8uR7y9i8Nr3zyizk/n2taGIMFBXSKfvTGnJeSsAKGHMDdkLUPGfCpzCIfDBrSzlwpMaXqs2MHnJ9mJ9ICoW9Bp+Oz4Oauw8wCL/C6LT8brzervQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6486002)(8676002)(31696002)(5660300002)(2616005)(86362001)(26005)(2906002)(31686004)(186003)(53546011)(966005)(6506007)(38350700002)(38100700002)(52116002)(36756003)(6666004)(316002)(508600001)(66556008)(6512007)(83380400001)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z3pWbDlkQ0FMVkNNWXo4YkUyYU4rM1UzTHlhV2J4SFV2cTE1R3ZoYzBIMXdl?=
 =?utf-8?B?c25icEN5WVdWbG1Fa21GNGVOZVFyMlBHd0RsVXI1YmJ2aEZMZkl3eDF0bkVk?=
 =?utf-8?B?ZFlHTFZRTEtUQSt1TkNzcm90dDBmSmdNOXRtTVdVaFpOMnlSaW05VXhzdkNn?=
 =?utf-8?B?Um9seThsdFRqaFdIa25RYnVxYU9OSlV4alpBcmdmRzRVYzFTcHd1VVp3cVhP?=
 =?utf-8?B?L3c4ZHNwSWNQRFNDRzR6SDBXRWhqM2wxdEdma3pSTUNrUVc5ZTk4WnhjZExw?=
 =?utf-8?B?bFhxYi9ONHhIQmRtUzA1cTdvSWhabHdUc1ZDRHJONWl3Vm1BMjM3SlU1SXBl?=
 =?utf-8?B?dW90WDI1R013S1ZwL0hyaW05TzU0cnVuZkNhNkcydWNDVUppYmkxUFhHSFZK?=
 =?utf-8?B?REdnTy9nT1pxdDIzSG9xYnpDWSswWGRFT0llTUhKeW95Wkd1VEQwVnBiYldm?=
 =?utf-8?B?YXBONGZLL09aelB1RVVtRzFXeXBrT2pRNjdwbG5uc2dLQWJRZFhKSXRWZWhu?=
 =?utf-8?B?ckw5KzRCOGxnRkdkYWxxVWU0T01rWk1KbW1UOUJXTE5vb3pvcnF4SGs5UXlI?=
 =?utf-8?B?WGdVRStobGZIYXYzUnRtWUMvaDU3eWZ0ZFZuck5BT2MwRDhOT3dCRHdVL3hl?=
 =?utf-8?B?bnpGSjl6Y2RaTldZaGd2dzFiSkkvZWF1QjJBRlc3bnNTdzVhSnZKMkFQZEgv?=
 =?utf-8?B?cU9TTThKZFNCT2N1cVVGNjJIZytxV283d1kyUFdTUmlYU1lYZmYvbjU1SmJX?=
 =?utf-8?B?dWFPeFFlZFJPWDluZllDM05NRk01SXhreFFoMDVKWGJpQzdybXM3R211OXJM?=
 =?utf-8?B?L3o3Z1cvQnlQSUZjZnZEbnZyVTR3L1owenhnVWpZSHRwRFNveFJCUXU5cFlW?=
 =?utf-8?B?Smx3N0xkY2xUemQ0alMxUDJsSTV5NG81UVE1MVBBNVJjdy8wRHRzbmE2bDRp?=
 =?utf-8?B?OE12N1lRM0dXdHN1U29LQ0J6V0F3M2pXL1lBRXdJR1lLNW0wbmJVNWNRajlM?=
 =?utf-8?B?MmJLQ0NyYnlNeFBDWmlwR1FGWXBhWklYZlNkMHBEV1NBUkhnWWdZYjQvRSt0?=
 =?utf-8?B?ZkFMVWY2ckRJY1JOclg3cDNjMlZZeEc0S01OZGlZQVJxQUx4UUpWdzVFZ0l6?=
 =?utf-8?B?ejIzSGtFS3Q0SkdEbFozNVpEeUtnVk9yTG8wc0tCRE5mOUNrUVUycWdKV21w?=
 =?utf-8?B?SzBhdGFma2VrWmZ0RjlXc1ZLSmYzVHhtMlMxZ0hkenlDWkxTZ3VFVXBCNXR2?=
 =?utf-8?B?bDdBSXBDTDJFS1B0bEhzL3EzUVdNRTVUZHlqODhiM3JuQzlhaWdtTElhSjV2?=
 =?utf-8?B?VlFpYzJLVXJIb3ozOS9iQ0JtdjZCNG9IV1BIY2JXVTljdk5zN1FWMlgwQk5I?=
 =?utf-8?B?Y3ZJTFY4b3kxYnhpeHRZTDhYb2xVRTZiaGhQOEp2LzZML3lwSzBhZ20yWE96?=
 =?utf-8?B?citZWDBnWlVMS1gzaVFvUGQwb3g0djZJWCtNeEdaUGkzSnBwck9zNnlDSUZR?=
 =?utf-8?B?UUZubXBZVEo4anZ6RklwY1cxTWtQdlBxZ3hYRzdOQ21qMDh3c3l6NjJ2SDFM?=
 =?utf-8?B?OCtZcmV5WVh2Mk9MWkpxOXBhMmhTZGxnNmxBWDNVU3VEc3kwQzZrYmdVS3pS?=
 =?utf-8?B?TUk3STQveVhEVDhtREZRZ3UvK1lrQ3YwSEV2bFpZQVMyS3l4aGRGYklFOUhY?=
 =?utf-8?B?ZE0yVW1EN3hQYjl5NDBjYlNRU2Qwd1FmRmVWT2JrYXEyQkRpZnZhb214dSs4?=
 =?utf-8?B?VVVYSnhhVmlDYzFPWmh3Snh1RWNiRWVBOUJaaFB5N3dQZ1RId0dyUmVSditz?=
 =?utf-8?B?RGlhSmNxc3RnZTVMdllHVkNqVW53RUc5aVZUbWZ2Si9iaFIycW4vakVtQllq?=
 =?utf-8?B?U0FqN29JMks0NHloamxNWWdUdXBwRWRManRSU0NKdUYwbXF4cE5tTS9QcCtS?=
 =?utf-8?B?ZHErU3J2SlZMellHb0I5K25BTTJ0b2hWWHFpL1hXTlY3ZHZ3eURVczF3Y0Fj?=
 =?utf-8?B?Y1h5V1FEamlmai9WdUJtR1hCNU53bEZva2hLeWRBZytUckFDZ3VZQjJTNDNk?=
 =?utf-8?B?bTk5RlBqOFBEYU9NaG54NTRDR3RCN3hVcGhNaFJTVkVPdlRKWnhUYnoyV1FW?=
 =?utf-8?B?ejFOb09IUHNZV24rSHNFbVRIQURrQzNGRmpkdlNRaXZmRk1LRlJLck8vNHE1?=
 =?utf-8?Q?teuhyl/jOIb1XNzImJ1ofn4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa4ff732-f727-4157-1da1-08d9d5a2e3bd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 08:09:43.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CIPq5x3aGpLk/NtGC+eQN0VlLBon+p9JTcyw3ujbvaOdwhPh/UR4uHesZg2amU1XjJg2UM57jmN73KSnRIiZVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2192
X-Proofpoint-ORIG-GUID: vXg0pCIDAOukVwF-l23g1zPcbFwIdq8L
X-Proofpoint-GUID: ce_eEW_nmvQCoE62_ZGVuF28f4Muzm2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 clxscore=1011 mlxscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20C7gFmR003078
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 08:09:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94778



On 1/8/22 2:48 AM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On 1/7/22 12:08 AM, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Fixes:
>> WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php: ELF=20
>> binary /usr/libexec/apache2/modules/libphp.so has relocations in .text=
=20
>> [textrel]
>> WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue:=20
>> lib32-php-opcache: ELF binary=20
>> /usr/lib/php8/extensions/no-debug-zts-20200930/opcache.so has=20
>> relocations in .text [textrel]
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>> =C2=A0 meta-oe/recipes-devtools/php/php_8.1.0.bb | 5 +++++
>> =C2=A0 1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php_8.1.0.bb=20
>> b/meta-oe/recipes-devtools/php/php_8.1.0.bb
>> index 593eb3955..fd4a78786 100644
>> --- a/meta-oe/recipes-devtools/php/php_8.1.0.bb
>> +++ b/meta-oe/recipes-devtools/php/php_8.1.0.bb
>> @@ -217,6 +217,11 @@ ALLOW_EMPTY:${PN} =3D "1"
>> =C2=A0 INITSCRIPT_PACKAGES =3D "${PN}-fpm"
>> =C2=A0 inherit update-rc.d
>>
>> +# WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php:=20
>> ELF binary /usr/libexec/apache2/modules/libphp.so has relocations in=20
>> .text [textrel]
>> +#WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue:=20
>> lib32-php-opcache: ELF binary=20
>> /usr/lib/php8/extensions/no-debug-zts-20200930/opcache.so has=20
>> relocations in .text [textrel]
>> +INSANE_SKIP:${PN}:x86 +=3D "textrel"
>> +INSANE_SKIP:${PN}-opcache:x86 +=3D "textrel"
>> +
>=20
> should this use :append instead of +=3D ?

+=3D should be okay and it works well with +=3D.

Thanks,

>=20
>> =C2=A0 FILES:${PN}-dbg =3D+ "${bindir}/.debug \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libexecdir}/apac=
he2/modules/.debug"
>> =C2=A0 FILES:${PN}-doc +=3D "${PHP_LIBDIR}/php/doc"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94678):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/94678
>> Mute This Topic: https://lists.openembedded.org/mt/88257182/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

