Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0702AC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 03:39:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23789.1698896355518641438
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 20:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=phq3kJa9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9670e035af=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A22pM7i002169
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Nov 2023 20:39:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=jyofdbXJFKlglHE/iFmwQkaia3MAHXTd4BYoUQEjk6w=; b=
	phq3kJa9XVkLiK9eq8v8PUYAS5Nw/ofxMkA0HGGompnbJsZKdNHxqOY/UynYTj+a
	dDp2PFG4897ikDvZWGTdSQ3xYCj9hkkIhiI+Df6DyNtF7OdKOTfJiWDW/xdbOolo
	NQFjFOf1Kw296CZ0OA0eLA1Nq9h617FCRnF/B1jAMQMxFSGGE8MDf0BOO1MCrIaz
	9YhgRBVwHye1F2JxZii/zyiip0mLlyWQIphswW3pgjmAZj3Ss3PemHLiBrolrirS
	fPXYN5T+/0PFFC8dk3Bx2Urdfq7tXRSvZgSaFQAX/rbSEHe34Yt5SSBHZoOUInWk
	5xcyTtHNl9kWmHQOhEYJfQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u430cr1gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 20:39:15 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3A23dEZe024341;
	Wed, 1 Nov 2023 20:39:14 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u430cr1gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Nov 2023 20:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2mMOJ45Kk6RpS9ieo6eXYqEx8en48BlXkdz1X4c4I71vjSEoSmWf6bZW2u8vu2q9pNQwiBvNSQJ8RWtwnFNigtpZ8wX104/t0BjTFWztXMKOZSEgT8tps9ySe/Q9eTtZewV5pqRPlTrFslih+TW5nE/tf09MWc2Ua662+xY1ohNE6wo/aG6+ypcQwrFoar+Z+x1EKJLRnCrRvCGjgdlDPeguinmXblUendJfwBORwRawmRK8tEFtM9qXnlvjMEoAFmO/6bwgG1eiqNX/xVU1l7TtNLwcOsAwwIM0UrS0seSmnzva2QQw+73pOxIFCoeaXFqzx9GzAtpozVziV8l/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyofdbXJFKlglHE/iFmwQkaia3MAHXTd4BYoUQEjk6w=;
 b=SEcP7DkWnTR0xnu63/aog++yXCpaChj2VuaFjSr4wuUDNCO4oOpFlBCilTUfExx+2cxTmb/JwZtIS5tPrpjO2kFkHOGSKKqdkCKolKjWA8zpaRYf/Jr3deIDCa6yZjdmHrSr4DAx63PUqYZPnX5gVoBAiIwvpt1K2s2siBR4KlufUPGIy1c8j9CBt7o4Bmsu7h67OjGEErFcurvz6nKlvcvYDFL72SNUXeF4kkQ0XRK2oqdxB63zSk8mBEOIITmFhCU1MKs/PnJXlEwgulGeogEYw02PNLQVTcw6gStVxGEDBm3WK8Q8F0t2v/EelTWJVqhD5ASc4AeIACPnKhPZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Thu, 2 Nov
 2023 03:39:12 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1df3:e7a0:12de:32fb]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1df3:e7a0:12de:32fb%6]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 03:39:11 +0000
Message-ID: <e71292d0-a848-cbc3-496a-5a926ae84036@windriver.com>
Date: Thu, 2 Nov 2023 11:39:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-oe][PATCH v2] vboxguestdrivers: Remove the buildpath
Content-Language: en-US
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
References: <20231102032939.3447809-1-mingli.yu@windriver.com>
 <b73b222a61dad218bc270f47f77d020c6fc6613b.camel@intel.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <b73b222a61dad218bc270f47f77d020c6fc6613b.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|BL3PR11MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 88912242-29f3-41ce-6d25-08dbdb55470f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RdsFnwUKnqvqQqMZEF+koB9OymXDGiO9lePIkybtlON/8ATQWlLPCrQrd4VC/jEkTefJLXbpNkStv8RslJVMQWZY1+xt1Be0JWoff5KvfdAd4pUKKpnv5pOknboLrzpAoGWJYoFfxsKvYIcR15hiCQarv1Tb1jUDhY0Rt7eHN8InGrjH2kAPks39wE3P5tvHkBESgeLFcVyf0puS8g6CW7B1tP5bOt3gtBmxgC70PfbSNH43r5qj9jUys/yIqpJZSPU4KVgoCIKRD5nFn+29BU9sWdbJ0njVyognPz7DNWl2nijnXq6uq09t9FZfXQoQy7BixKDbPk76K27bEufmbi5HkwkmKEv6Zc5T19PZFZyG6wvLbW7H0Hj/QwOfEEP2zwav0blv4lbFbxsy3a7YQ3Ai3jrEIXhGLTNGRdh74DvgGzYb8jTONX+DHfS/H5Yp5+fR4IyXBbbFUpDSd35DHvxS08Z4xq4XsT5s30is4H7nTsCUCs/DjkILJQqBreXS2Xz+6S/QCPYS2LCcQ2sIlJ8HakAPODaQd8SD2cUtzWyoaMws4zAOsi+XZJC3YpSETQtew7Go7A0TJbO1k6sxo2cRu9gttL5MhuW9ozdRnoWuu/pbJK+5HYTkzl6YWKi1yW3tuYUqKRq6Xs6ffN5jF/CAQO9xAOeifN7jxvHsRS6XN7g8KUjNRGo/nM9T25vU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(396003)(346002)(366004)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799009)(64100799003)(186009)(6512007)(38100700002)(6666004)(6506007)(36756003)(478600001)(31686004)(6486002)(26005)(66946007)(316002)(83380400001)(2616005)(53546011)(66476007)(66556008)(8676002)(8936002)(5660300002)(86362001)(110136005)(31696002)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NE1KQzJISnlOTSs5c3dwalR5ZUFnbkpVQXQ2TGV2eTFIclF0UlV0R3l5SzQr?=
 =?utf-8?B?T1pIWEl4bGduSTV4MFBwemcxbDNMNTFQemQxZVBWbjY3U2F2QjVFa3ZjVS9v?=
 =?utf-8?B?elBsY05LN0NzM3B2ZGFWc002ZHR5MEh3Nk9NOGxSZmlZQlU2QUdEQmRrL2k5?=
 =?utf-8?B?T0g4MENPaCttOE9Ga05HSS9KWGVEMnVNSmR0U1JVbnI4UGppZm5VQ0ZSamlr?=
 =?utf-8?B?Q3RBM3VGc2VBS1BySG1DWVJjYUF2SSsxT3FiUUZZSk1TTzljelhjTExOM2FE?=
 =?utf-8?B?Q0I1RDg0eFlRRld6WlRod2RUZUxQQ3lLL3R1ODlvNXcyTU1XV3BEV29acDRk?=
 =?utf-8?B?NlkyeDQ1NVFzS1dwczZlcGJPMHlKaURQYXlUQWlaQURZcDNNbGlpUVlncVNU?=
 =?utf-8?B?WEJDejJSMXNWbWYzVXlGL0hFbFVIWWNCVXZFU3hKT1p4V3h2VHJoRG12UW9u?=
 =?utf-8?B?OGx1eXp6ZWhRN0U4dG00NDdCLzVZaThUeUtpNEpmWjc1NUNCb3Z5Tm9EVlFV?=
 =?utf-8?B?SGRUOEJ2RVRRQWdlL0RzMUZyTVpiU1BDQ2pqWWd0aTlnT2gwQ24yUitpVHRS?=
 =?utf-8?B?TWdTNXdraTZKMVIrTVVLT1dFSklCUDlNdERZT3BBenJVZndVOGVmTGNCS1FC?=
 =?utf-8?B?SWZ1SUQ0MFFsemRkcnlEenNyVjFwcVJ4NUpZQ3VWTDNWNDM5MnI5MG4zNkVU?=
 =?utf-8?B?OEM0cC9GTTRGQ1BkaEFLdUFST3dKQ3lqMm54bnUvR3RIY2pwWHYvSUdRb3Bn?=
 =?utf-8?B?YUJUT0F3M2V1NEJyYzd5U3ltQzlZcjA1RTV0ZUpBS00xYUx0UDJibUlWbVBQ?=
 =?utf-8?B?dFdsdTJ3VWYxanBHMzRkdzA0RjVLcXZyenJ2WU1xYmgzUnR4MXR5TzhTcTB6?=
 =?utf-8?B?bVdhcFNHL091RFNPa1pNUnR0bElIK1ZzNnZ3SCs3b3ViQ0Zjc1lsRmN2TDRr?=
 =?utf-8?B?SnJtYndqelB1VkYwY0VueWcrVGc4MmJhcW1LSzBETkFzbE92U2tnS0o1K3Fu?=
 =?utf-8?B?SHg3Znpkb1dQM1lMejZ6Skc5R3o1cERWaUdKYWR2cnZXN3lldW5wOGNDMzRn?=
 =?utf-8?B?L01NaE1nOTZlWmJ5eDh3RUU4d2d0NGN0YTh5cjByZ1ZBNVRBUU92VTRpdFJn?=
 =?utf-8?B?b01yTHNrVGt3MXFpdVE1cGgyVEFBTU1sdGhGbWV4SERyelNsUlh6bDJaZnYr?=
 =?utf-8?B?eXh4aGRhdmkzbXh1U2xlaHoxTjFNdUtCaFdhNlE1TjQySzIrVml4ZHh5UUpv?=
 =?utf-8?B?dmYxdTlWb2h6Yi9iVTMvb0xrYno3eHRRS3ZnbC9EeUN5eVErQ0JRU0VOVEcr?=
 =?utf-8?B?K1A1VG93Q2FMTjBsOUlBR1lkS2Z0WVJjNlRnKy9jbDZHZHBFMmVDb3g1QTM3?=
 =?utf-8?B?ZzlGSVRBSVh0ZEtBckZHNThCWmFiMVdIWXRNNVdIQkhVdWs3ZXJPam1nb1BH?=
 =?utf-8?B?cFVkTlVQdENOeVRzVUdLSVhlZXNHcjd3TmRFa2t5RGlzNFB1ZTEyUlJFRFU2?=
 =?utf-8?B?VDdML2R4WWJjcmhqbU1pWXp4KzFGc2p0eXltdTF3bWNMb0VycUFSZjQyMk9x?=
 =?utf-8?B?R3FVdTRMc0pPZDM4U3VwdEE0L2Q2R1plQjB6blN2NkJyVjhrMnZ4TDA4MmxU?=
 =?utf-8?B?eXZhRXh5TVJVdm1zdko4MFlVdDZiU2RSY2U3YUZLZnZOS0pCWU9LYS9BWFhE?=
 =?utf-8?B?eFBBemZESTNEcitRa2dkT3RKRHd0MVRaRklZOVg2Q3lDSHE5M0JpcUxjWmsz?=
 =?utf-8?B?VTQyYmhPdVVaRmJKeXBOZGxNamZpcnVyZ1h6c0FPeU1oNEpzZ0N0MzNGZmdO?=
 =?utf-8?B?ci9Nc0l4TDFvVlBqYzk0MEFyZE0vS2RQR3phaUF3NGtmTmZKQldNQXpXNEFt?=
 =?utf-8?B?R2RjTi9KZlBCZGZIb1llSFozNTUwSzBQR1FKc005aHYreTZrRnJXS0VTQjNG?=
 =?utf-8?B?L0lHQ05zVWoxSE5FQjhnRU1PTkZ3OWYrTnlMODN5blBEc0RNNnFPQVRIU3Jo?=
 =?utf-8?B?d2RyaUZUQUlwdkJlYTljOWthQ3RaaFN4dERORHhSUHpmYTIvZFFraDBlWnhF?=
 =?utf-8?B?Nkh0R1BvakM2UzhSWnNSZEI4VDREeS9UcnVBUFU5RUZvWm9GYUwwTzd6MkU4?=
 =?utf-8?Q?vnRuipLabUoQThB7dDzvs/hj7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88912242-29f3-41ce-6d25-08dbdb55470f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 03:39:11.6939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUNbAjzIanUHMimlI41ALqhTl8wJUyF5gHtMbTm8hBM5wYOyv+bz5A5owG+EHmZ6zzd1poeA7CMxuLcKTdOrKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6362
X-Proofpoint-GUID: pwAcsNejh25ncfDVWIeK0IOxEbZnh-G8
X-Proofpoint-ORIG-GUID: z6EzrJARYSfl-UAc0yDIcPuDjJ342JOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_23,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=966 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311020027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 03:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105832

Hi Anuj,

On 11/2/23 11:33, Mittal, Anuj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Thu, 2023-11-02 at 11:29 +0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Fixes:
>>    WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File
>> /usr/lib/modules/6.1.51-yocto-standard/kernel/misc/vboxsf.ko in
>> package kernel-module-vboxsf-6.1.51-yocto-standard contains reference
>> to TMPDIR [buildpaths]
>>    WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File
>> /usr/lib/modules/6.1.51-yocto-standard/kernel/misc/vboxguest.ko in
>> package kernel-module-vboxguest-6.1.51-yocto-standard contains
>> reference to TMPDIR [buildpaths]
>>    WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File
>> /usr/lib/modules/6.1.51-yocto-standard/kernel/misc/vboxvideo.ko in
>> package kernel-module-vboxvideo-6.1.51-yocto-standard contains
>> reference to TMPDIR [buildpaths]
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../vboxguestdrivers/vboxguestdrivers_7.0.10.bb                | 3
>> ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-
>> support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb b/meta-
>> oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
>> index 8e9013824..847458645 100644
>> --- a/meta-oe/recipes-
>> support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
>> +++ b/meta-oe/recipes-
>> support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
>> @@ -24,7 +24,8 @@ S:task-patch = "${WORKDIR}/${VBOX_NAME}"
>>   export VBOX_KBUILD_TARGET_ARCH="${ARCH}"
>>   export VBOX_KBUILD_TARGET_ARCH:x86-64="amd64"
>>
>> -EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build'
>> KBUILD_VERBOSE=1"
>> +EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build'
>> KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-
>> map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-
>> map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
>> +TOOLCHAIN = "gcc"
>>
> 
> Why is this required? This isn't mentioned in the commit message.

Without this patch, we can observe it still use gcc to compile in 
log.do_compile even we set TOOLCHAIN = "clang" in local.conf.

So we explicitly set TOOLCHAIN = "gcc" to narrow down the toolchain 
support to avoid the build error when build with clang.

And we can remove the line if someone adds the support for clang in the 
future.

Thanks,

> 
> Thanks,
> 
> Anuj
> 

