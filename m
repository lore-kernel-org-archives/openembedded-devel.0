Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7951C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 06:23:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1118.1652336580297219471
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 23:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=WphQ6Px4;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=2131886fa4=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24C6HwXf001355
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 23:22:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=hsv4YI8lUBnCpbjt/Jm9QrKFLRdNWrsB91y60iGD6g4=;
 b=WphQ6Px4nI0JNZeeOfdrnVqyJ5GubkYWSM7GAoz19xgIw1LDJdLrAZIn4z+pF4g8zzDC
 MpL/JwYgZNzcw5yu8osvCP2mwU3X+11xF8K8IU2pOK5Ufe3EYV9p2zJtnBUqK2NvdCSG
 IyxBv3e5KQf4p0fmJKX+j26mYnewDz6DerRmK2axolhuZnmtO5LuzrfUHspS+Mtg4ynT
 zwNY8Do0FKSxOAlpRH6YIpkdqNSz8S2aVLQ8SbPlkiQuqNaRjI0qXcWIeBc1u22qdbd5
 eojOxy79L44xEoOqKrT5uFb6hm0sKOtwDbjea4u5tMqBaNZv3VyTaLag5Wqy90enZBMM Gw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fxde5k0qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 23:22:59 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24C6MwXd012282
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 23:22:58 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fxde5k0qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 May 2022 23:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoCd9Q0br61ezFZNPjJE+NxhwhG4vXUsEIcrWWB01WB2vlGOrYh50o1N/+WqjaAC6YNH0IRRRrQYHof4j0tI+fkO8CSI6+vCT8YKaqZ5X/vl46l2pFrT5xXRgeOphqgqr4r180alvP4VdL4jRjO7Hj1Y2gH0/1a2BIwJHRoZHDVFDv8kLVhSwASBq+olo9ZRdLnN3odEEMtH17EqLxAnQrgx8Fx+b/Ni2l35Ok8ssnHIaiBbRl8HbYA7gBrrC7LM8wATPPQTjATkYsy5nviet++GsNrf5RslCSFtskXPN4V1RBBp47uf+eEfJxX1azv3sxbhuax9aLB6rCVBdo/gcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsv4YI8lUBnCpbjt/Jm9QrKFLRdNWrsB91y60iGD6g4=;
 b=CEniB6prFNa7eyTLwi2uL6RoHpJzILELUddZiASuseGmOKeRhl0Fo5n0TE5d4HRp+xj3c99hjVaQtFUfHlLKixNvanW9UkVJqbtSjBadZd4L719y4vqi4Jrhbf9/ONXR4PrCrYx3Rqt1yo4MFpwkdM0MbbXlVRMRIp1CP9ulBR+3o1BVEB43kFcMnL5SjGPFGECErfdEWE2tz4SSimkELQ8PrzxIW2UOgZtnGbEwNCh+sGbI7ujC+f0w6SoLA/m0M4i6uICGJyML1iFuim4LUNzJ+6h8H4Tj+jh4g4VntufoBRabW/zYHxplvp/+kdq9WUUh+Ehu7CBf0pvsFJSoUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 MWHPR1101MB2238.namprd11.prod.outlook.com (2603:10b6:301:55::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Thu, 12 May
 2022 06:22:55 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68f2:234c:af29:f0bf]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68f2:234c:af29:f0bf%7]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 06:22:55 +0000
Subject: Re: [oe] [meta-oe][PATCH v2] wxwidgets: enable to use private fonts
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220511074522.28499-1-kai.kang@windriver.com>
 <CAMKF1so30+Ec6+vMCCaKaXy8hrJUeT3pDk=sE2Xa=DPY-VxHFQ@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
Message-ID: <12c05411-f04e-f956-4ca7-051bc4c0a5fe@windriver.com>
Date: Thu, 12 May 2022 14:22:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: 
 <CAMKF1so30+Ec6+vMCCaKaXy8hrJUeT3pDk=sE2Xa=DPY-VxHFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK0PR01CA0071.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::35) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb9f9ee8-a321-41a4-dbff-08da33dfd9be
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2238:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB223874EFDC94B2AD206240D095CB9@MWHPR1101MB2238.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5QclkT15vnEXBe6vp25vRngwN8jApt+2sv01rRZ03yV3WFlh5Hv39Wpgqd0QgJBSRXn7yaEV00xcuKPUvrvJ0Db7dr3dw1kQbVD3r8FgIxmSeRHq32lagU3OYgbGyzLHx14prpxSmW5b6LJkYUi1TKyFA2Txon2Xc//uhXZmGUCC3kp1djwXLHIbnC7UAwXxEgBzzq6TYNfrxTLCDeLcz6vx/Kl6GQXNumIPxTxoHe8evAwVI+POC29fFFhJF0iuCmmbWPL5eTKQ0oBmFaoTEparuBCTvhBrxVCuA0d99CTSelzY5ieI+MxAhXXJnWrhBsKOkKR2cu5AmOZ1sa44Lm2Y0DIHtcEoPrMPUiIetbYXOJwjDwAyrY36E2zFCyvGqJ5+pk1fW+hnxtih5Zh08grFB3aY4V0kQSH6gmaVgVCE8b/BQXRhiTdAcUznGVO7YN/YwQ/4myb91fm8XyhVintyW8TbNplJRZrX8YgrQ9gE/RkC1kK4aO3s/RkWvjf6+c70At/PyFuaJSs5fF8HThqU+4Ayo13qZgHJCCddnn+nsG+ciZbC+uyOVZUAT9LojTMnHacWMXmwKMLz3vdj7d7WwDBvmOhwCVYQfXs87J2qWb0c6uOp+NJTZBNAMtvjKuvBL8vlExZrjQ3SM9QSXXyp//Bm3/mceJuG/9ACTHSTQrto2ts38DF8M7yTifwwM1RCiFcHA6PrU+8JXnBYX3ux7ut5cUU95l2G0BQENUrVti1dXGye43YaCMqGL9kOPnBGa7E9QuSce9qUxMuFqkZyXRdiymGkwTw5/V1WXd+dhx/D5/UdMi9AyaCihFT8JLUVhhKD+NjlIpBfuJMXijoKzaBs8HqDFgFsA5rC5NRsSK25Rc/9Ckm2sUGZGtXvaxiNnzk3F3URcQAgLtYu/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6512007)(26005)(6486002)(66556008)(66476007)(966005)(316002)(6666004)(186003)(52116002)(2906002)(31696002)(4326008)(8676002)(86362001)(6916009)(66946007)(38100700002)(38350700002)(2616005)(6506007)(83380400001)(31686004)(8936002)(36756003)(53546011)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2hwYTJVOXBEbm9LanJiTVhKaG5LSFJqVHlMRGZuU1dWWVd4NHB6VU9UcW41?=
 =?utf-8?B?cmd5U1FXOStPSWdBeTR0ZUxDMzU5RUI0a0gyWWtub1FSL2F0dWlPc0M2UHNy?=
 =?utf-8?B?QVJtNmxOanhuTEpEL0h2Tm4zcEVZbXlYTWNUVHJaMWVlQnRVa012UWZjamV1?=
 =?utf-8?B?RFcxbldiaHhkcVFIR1psUUcwdTlpSjFYYWRrZ01nQTViZUJ5V0pjU2R2RUVT?=
 =?utf-8?B?KzhNYW8zR0h2R1NWaGQ0MVd0bHBqbHlQWWorVzBrTmpzMUJGQmg3dDNCSXZa?=
 =?utf-8?B?QzloSk9RVXloT0Ixb3dKQVlVb0NLZjBtY3JzcGRTc2MxSnl2a3ArS2l0VjM1?=
 =?utf-8?B?WjNUTHlHNkpqc2JEWG9rNlQ1MWdxUlhQbVRlSUFGU1N4aU1sekp5UmovSENZ?=
 =?utf-8?B?U3hrbVVyRzJlVXR4QXBveWFBaG5nVStMRWpxSkNIODlEWVYzL1p1QkwxSys5?=
 =?utf-8?B?eWhzdyt6RkkyS0RhZHlJeFpoaHpXWU5ROWZVeUd2aUtENXZZeTlFZG9PR29T?=
 =?utf-8?B?WjdIY0RiTmxRWmlNYXlIaktGc2xIMm5keS9xRXJlQ1FubjVWWC9TUlh5cXJy?=
 =?utf-8?B?T1JZUFdNeEdOM0lDZFo1OGRXV0Fod3ZqS0I0Y2xMUGs4bnBGdzZBM1BGNVIy?=
 =?utf-8?B?NlZlM0MzODRzYVRuYXFQaitWQkx4SGF1YXVkTlBwR21BMm1la0tpSUJCb2x2?=
 =?utf-8?B?WDJtUlM2NW1zQzhPRXZId29FSHpxSnFtU0NHQ0RlSERtRzhWM2NVWHBTa1Fz?=
 =?utf-8?B?Zm96ZUl3S2R3bWRoZjZ6YzdzM1ExR3p0YVR3YlZ5eGlnQVlHZHdJam1WZi9m?=
 =?utf-8?B?K0Zyc0RqRlRhcHpQNjVaT3dnaURSdnRocjhlczNZaFBxK25IQWtFTWtyY0g2?=
 =?utf-8?B?MXZkYkcvV2kweXBIZ2JubTJYZWdRcU9HYzIya2hlYVc5Z2lkakZXc041bTlH?=
 =?utf-8?B?VHdjM0dpWVoxd3k1S2RNMm5Wcm82NFlMSnNVYUF6Y0xteWlFTWp0dEIwYThm?=
 =?utf-8?B?VU9XMy8zM2xreG9iMWZLcmp5d0hEbFV4L2pkNzdXSlhxWHhValdPbEx2cGN6?=
 =?utf-8?B?MWVLd1lzdW1DSlFuSTk0SUxOTGFlOEpySlhnaStEVzkyeWtBTnZyWmVaR1c1?=
 =?utf-8?B?bjJsMG9BaUR2SjB3aGdjZ2FmOEN0RDQ5andkSzRmS3Q1L2RQdE4wbkptejRa?=
 =?utf-8?B?OTB0RmEvNGFNWll0cy9SS09uMGZLMXVNNDlQdjBoOFhSVDBOc2FvWU01WkRi?=
 =?utf-8?B?cm1mWlkrdmx3MTFGdlVNNDhGbmF5aTJQdGJlRTBpVnQ2c1NVWGtvL1ZoZDJk?=
 =?utf-8?B?Rm5saU9wbzMwZkwvQzVMY0d1WU9oSzlkMUdPQUdRemwvMTEzZDFQNEl6a0g2?=
 =?utf-8?B?T0RUMml1N0pBOXBmcVVQUmNQRnp4MUJvclhEbHV1SG42cDIvNGJBaVIrR2ZM?=
 =?utf-8?B?Z1pGSWo1TGtrVU9GVTV6M0xaR01SczVaSzc2RFdZZWtPTzdEdHVQZURwWjV2?=
 =?utf-8?B?MnpianBucFkyVktYZk03RGdhZ0lTRU5YQTNPTEdtNU5XeFFkZW0xc2V6VWgz?=
 =?utf-8?B?c1VwcHZla0xHUDlsckpJZWdKL0pNYUxLMk9KVUJ0bG9pamVRK1plajE1dENJ?=
 =?utf-8?B?YTVHRFJzOHV6UEdXSnVxcVhWUVhUOFQ4Umk5eThZV00xL1dsY2F4ZndNdWxG?=
 =?utf-8?B?TXhiVytrQVhZWkVpekhNSjhEU2J5SnY0Q05EOTlOY0VocGhLTFVudXlDK0JJ?=
 =?utf-8?B?TXA1MTNRRFFXRGsrZHlsOEErcHJMeVk4NHJQWVUyQThnc3M5aTUzWXR2d21v?=
 =?utf-8?B?MC8xcG1JMDRnLzZLNWJTZnFDdytoaGFldkZPaDBiQnkwaDZRSFo2L0RFR2VS?=
 =?utf-8?B?ZEQ3dzYyYUFGU0ViQ01QbmdxeEZzcU1pa0xlbGU2YlBKY0VYREZCbDRsbE5s?=
 =?utf-8?B?bmlBYlJsaGJSdUd1WGlobXB5MnRVdytvelhwY3BZN1REVWhZR1h1NHJmVzd5?=
 =?utf-8?B?U3ptRVo4emh3REtobmZHcGE1S2tZZmNRMkowWjdpbnJtdEZFS0FZaEhMbmt5?=
 =?utf-8?B?ZmxDK3ZlU3ZJa0NwTlVuelVOZ2FrZTEzNHlCazBLNmg2Z2U2cHhwaW1sR01k?=
 =?utf-8?B?dFk3eTZmdkZkSndYZ24zaW5TZE5MdXhucHMyZzVQbzFleURmRzdTaWlld2dS?=
 =?utf-8?B?SVV2WHBEVzg0N1hKVlZUK3ZJVi9Yc0lmMER2Njd6bjVSUi9Fc1ZlVjBWWXgw?=
 =?utf-8?B?bUJNLy9QSDBjdStsVWVCOG1Ybno1cEFFNDBZVVRha0dCTFFhcWswd3ZkNkJn?=
 =?utf-8?B?a2twZG9UVC9yQXdSWCtBNWZpNFdvV0ViMW54YlVOWGlWVUtCOHhqZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb9f9ee8-a321-41a4-dbff-08da33dfd9be
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 06:22:55.1651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QiYlRTCxwWaMWib7DCBMVLXlgZc53qrDO7cV74I0Vv4QsuI1Ur2ehwcr8vpey1zQcVw/uVDwXMnV91Ekdi17/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2238
X-Proofpoint-GUID: k1tUJnRINIdBvoOqymoc0MWHSMQRwuqI
X-Proofpoint-ORIG-GUID: CVbgzDTrJmddOZFhcsJXiNnGDtpLCBK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 mlxlogscore=721 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205120029
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 24C6HwXf001355
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 06:23:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97046

On 5/11/22 11:21 PM, Khem Raj wrote:
> On Wed, May 11, 2022 at 12:45 AM kai <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Enable option wxUSE_PRIVATE_FONTS of wxwidgets if build with gtk. It
>> allows application to use the font from the given file even if it is
>> not globally installed on the system.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> v2:
>> * use upper case 'ON' to align with others in oe
>>
>>   meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/m=
eta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>> index 6b57cb54c..b9b1dcf0d 100644
>> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>> @@ -39,6 +39,7 @@ EXTRA_OECMAKE +=3D " \
>>       -DwxUSE_LIBTIFF=3Dsys \
>>       -DwxUSE_REGEX=3Dbuiltin \
>>       -DwxPLATFORM_LIB_DIR=3D${@d.getVar('baselib').replace('lib', '')=
} \
>> +    ${@bb.utils.contains('PACKAGECONFIG', 'gtk', '-DwxUSE_PRIVATE_FON=
TS=3DON', '', d)} \
> why not add it to the packageconfig setting itself ?
It is an useful feature for wxwidgets with gui, so I want it=C2=A0 to be=20
enabled by default. And it requires pango to make it work.

I can see gtk3 depends on pango but qtbase doesn't. So only check 'gtk'=20
here.

Regards,
Kai

>
>>   "
>>   EXTRA_OECMAKE:append:libc-musl =3D " \
>>       -DHAVE_LOCALE_T=3DOFF \
>> --
>> 2.17.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#97033): https://lists.openembedded.org/g/openembed=
ded-devel/message/97033
>> Mute This Topic: https://lists.openembedded.org/mt/91031050/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


