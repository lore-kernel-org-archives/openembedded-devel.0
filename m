Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.5170.1628055464638029779
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 22:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=A/UPxOM/;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=385011de56=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1745biNa026053
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Aug 2021 05:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=BGmcPnIL4tMV/6958wNr9K9rrLh7LeEN0UVhmKU3BZ8=;
 b=A/UPxOM/d27iSX+SRyu4ktXErb59NbClSqPHSeAYRVgA0e0pUGy2E+XmdmT9RMGrrxtx
 mV+wfpCcVuDaZIP7cFxPMwtsy4Lek7IObOKlrPkXroQIICMf7P1UWPGIttIFhaFY14aU
 8yDJt9/Lkn46fdntTvqQCAofOBRC+spjEynPlp6651rp/NCkB8spm2ZQjBsHgO4/AZkG
 bZ1Qyvz+9gEMaytIqf4GsdVWPxXw5R6Df2QZC5Y/KlzdtmhpYHXHa7lEeIQVioa/oLAC
 NJD+kjYZyYPdppFDo28UlSQQeWAw0K0b7YOb8bpnBj/WLdGsHT3dKCcbI7CuO2mFSOiK MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a6x478v66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 05:37:43 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1745bhT5025923
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Aug 2021 05:37:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a6x478v64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Aug 2021 05:37:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUAI/NlOh9a7zgibn9pm+sZPeiJnUFEpUniF7vSIc3HlFkZjqyDIt+QbPYxx1SUFy9l0NlbVEGy1k3MOE5ycvIyqcNJOyt9GrakAXB6Ab1e/KqBCoS4UtjQ9BaD8L2FslkBR2iLMwe2u4z1BlydikKHxflE8+MxpJlOcT/Bzoj3H0chyeIK2WfVy3YG+jxpHNwPqR+nWmNtJYUmFkQqK3518jY9BI7yJNuwg4oRHy18XCEUyQXS8sbRfYYJGy4wpfYZE5nImZigSMe4QkJrW88Ne7PK94Cxl4d+U6AvcXFiG2aBIsSerknuPSFY59Prcp82J5stjoDcy+d6YiTHW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGmcPnIL4tMV/6958wNr9K9rrLh7LeEN0UVhmKU3BZ8=;
 b=evc8ycAiIJP7g7RAhQKC1TsqtAbAwHpdS30ClOOoAaTdcuJdVSwRW/owMNWrjUCeVJZtkIlm60ob0uX6dP2NyEiQzPC25GolcVqiNxPSlCI9FKIWNJRAF6FQtihj8Lu46oCwAoVAVl0xrKAd3J0V4CYuXlnphbTwEWNugQpTwKNEbcVFNWSkm9+6hZjX9Mlr180UONwNqovGQ7iHnCpHlimnAtqgwcFfLd0YxbYSpQMcPG2bCC4mGZPc4/DwZOJIBE2hHt/iZp5UQN2+Ia3Bo3I3gZtDy3vxB3oyfOIRDHWuLJh1r+IoXMtwxFCXrnd+ATRQDl7lvZZm95UjUqP5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1856.namprd11.prod.outlook.com (2603:10b6:300:10f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Wed, 4 Aug
 2021 05:37:29 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e%4]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 05:37:28 +0000
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org,
        Armin Kuster <akuster808@gmail.com>
References: <16959244EFE5AD42.32573@lists.openembedded.org>
Message-ID: <7df92ec1-743d-7b45-2bff-807ad3314c13@windriver.com>
Date: Wed, 4 Aug 2021 13:43:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16959244EFE5AD42.32573@lists.openembedded.org>
X-ClientProxiedBy: HKAPR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:203:d0::18) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HKAPR04CA0008.apcprd04.prod.outlook.com (2603:1096:203:d0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 05:37:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d384394c-3768-430b-0876-08d95709f278
X-MS-TrafficTypeDiagnostic: MWHPR11MB1856:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB18562DB539B8CAB2FFC30C0DF1F19@MWHPR11MB1856.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dNgofCgzkmr3CytojE/MaLKQBrAfR2Rp5ovRjClB3kgMFPMHmlQtW9MoiqYV1QylvXcLAv1Sd0HidT9dYh1QRct4iTROrx0+UQLUxOJ5SRbEMkKFkHacmxqWauPdBG1CTBLovdBKe3VTRRoO3HHYvjrJk5imp0zehjaL4SXQ7DG0tRfLsPdoVg3feFfXsm2EqYHauXamsctoMaTLhcphCiPFcZ55RZD64pweEFt3/jTFfqMD3lkmmqamf70+0WBXS6fkeheNKthpFs5WrhsLgsRV3aiq+YzYWixlzxXPvo+n4ZZLyc0RPKVfAOdNFdifru2f8v7UBsNQn4QOK1lEpgT3hzN3023J/cWrbRKJjm0Ftoy+o1a7pjZRsMxqDAFeMfjVoAmnNv+K25N3xSm6PLtynjJJbXAcFjfJTnApWXthfIeiZdlYyFFwN3PcOU2YpNwIGqUOtVS+NWXOUI42roilvYOWwjBsI+EOM431w2z2ZmuJxsTL+p7E9b4dDN6K8Tq4UNIru58Ay2WsGs4XP5x3bmjkyMsxkM/TVT8ba8H2L30R8v1NawAYh0j/eVtX5tQDvCox2BMEwMG1AvrsMHq2ip1etSkirc1NTrPuIB3aC8gt8oZ3uCIWSvHn/BIDbUvzgUpsgHv4PgUJzQOM4NK/AZ8hKQVt4+veScKpe0olgY8Shqhwq06jiTGRdA65kS7St/1Cn5N7bSzK9r8iHFUWcZ3GinLX7k3jKbRhp3++hbzs7KPRiD9D653bzQ10+RbH8C0HUFMxHfLmSAN8B9BLUGkbGCxxHmFRs7JnWsUS997t44/beQV+YNvm87PVl1iC+775N0+fQVrAXWPxOPt+tpQx8ByIgjkEEVATV2MrjvRBYDDLsa04GY1TdMbxGjbPhAbkjJm4DVRVqmCkgtUSKjAHbqPC7sZmUwcT5QE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(16576012)(66556008)(66476007)(31696002)(966005)(66946007)(316002)(478600001)(6916009)(6706004)(5660300002)(2906002)(6666004)(8676002)(38100700002)(38350700002)(6486002)(83380400001)(31686004)(956004)(2616005)(15650500001)(53546011)(8936002)(36756003)(86362001)(26005)(52116002)(186003)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHd3KzE3SGZya1Z1WnpsNGhFb1hxRVRpeHdyT1J0aERveGdxM09UY1JNQ1BO?=
 =?utf-8?B?R3hVQUNhcHlQMUVvV29zbW54ZmdBa29BaFZ6bDhBMlJEWHNJQVdqRDVvb3Ny?=
 =?utf-8?B?TlZ4emZKU29UK2IrVGJsWkhvVTV6cms3TnFBTi9rczFNTmFhSm45bzdjRGJC?=
 =?utf-8?B?eVBWVm5wK3ZYb3lMMXpJSndCL09tOXNqbE94YjNTKzFaQlJ3dXJWc1lDL2VJ?=
 =?utf-8?B?ZXo5MlFCbXZkNVFhdTduNmFBRk9NeGdNNEUzV2FoTDJyU3M5cEVLZko2M0dV?=
 =?utf-8?B?N2lQQVBCa2xXOUptS1IwMGI1R2Y0V3A1ZWxQMmpqbFMvalJSMkZZOTFyM2pv?=
 =?utf-8?B?b2d3alp4blFlM3hoSU9WdFl5dk5QRnMySER4eEJ6MTdoeTRGci9TUGhhcE53?=
 =?utf-8?B?QVoyU3BNRTdvTE9uNTJaTlpZR0JSVmxkNm1lSGp6L3MrYTNRUmhnbi83TUJw?=
 =?utf-8?B?eDNxUmFIUFR6bmR3WmFpam16OVRZb25GMVpPN3EyL1AxVWtobXdMTHBzY09v?=
 =?utf-8?B?S05nQUtVVGlQeklTN2Jiczhsb1JYeXFWOHpiZGhVOUpuTmZWWk1FbjRsblRQ?=
 =?utf-8?B?c1l1b2VDVnI2NzRlQkVkaFd1Um1wSXhTUEJKRHJaQ3ZXS2JkNTN1bW9Kakdw?=
 =?utf-8?B?ZnVJbVF0eURiZXlhS29EMHIrSW5iS2tiTC9RZnlKNUhqdW5rem5zTFhoZFVH?=
 =?utf-8?B?Qm52YVJlUGZkWjVRUmRjd251UGpvRzNFMFpCZlROOXd4ZS9qdjBBMWl0c1Br?=
 =?utf-8?B?a2JhUFJna0xDU1NiY3I4NlpkTTNFZWl4bEZNaGk1T2syZEs0clNZM2hkUmR4?=
 =?utf-8?B?S0x1OHdHQ1ZHUnpnRTF5TlJlNHlCbTJzbWJlbDdtcFNjTktWRWczREI5MG9y?=
 =?utf-8?B?VmlicHIrL2x2SFJMcDRUSGc5anJlMTFBaEFrWDRRUHJUajNiZmtyNHN0YUxR?=
 =?utf-8?B?WjRmOFY0c1huSzRkQWw2RjIzbHBZUUxGTDVhVmdhU3ZOdndNdXhCZ3FqQVAr?=
 =?utf-8?B?M1dpSU9aNTRBZ1JSSy91MzdOUHV4RXFmUTdFOWFvKzB2RkZXWGMreHpGYTBD?=
 =?utf-8?B?M1JrL3RxcG05cXRub2QveVhTaFYzV3o3WlBTTUF3TUpIZnpCeU9QY28xaU53?=
 =?utf-8?B?YVNyY2YvenJ1NzJiM0d5dlBYT2RjT3g3REMra3dudDlRcGxRT295cmRmWlVB?=
 =?utf-8?B?dlNSM2JyYmFTMFVFNjZGL0g1WDE1U2RoSnR1T0hnZ1RxUUt0YjZCellXK0lq?=
 =?utf-8?B?UVl2N0xaVE1uRW5IUXhDRHQ5Wmk5cTZKNUhvZjVKQXRDMUJ2WC9MQklld3JF?=
 =?utf-8?B?NzFRekVudFU5WTFkUHFsblpIeHQrOFMwaEIzUzRrN21ONlIxNmZRNy9peHhO?=
 =?utf-8?B?bnlxd3J1OGk4QTRCZzdmbEJadzliQVhuYXkxZHNOQmxLUEg2V2hNL3NJOGFz?=
 =?utf-8?B?L1VjVEdyWUJpZHhzMmc5cWhoaDJ3QTB3TVhKOWE0QlZPekFsVnRGcHA3bnlL?=
 =?utf-8?B?a0R6aTZTVkdOaC9wcTRtSEdOYllVSE5KejNNQlhrNjRpSWNYQUY5SElrSlJS?=
 =?utf-8?B?dFI3R2xpTC9paGtDWHBPSEZxUXBveWFHTFV3RXRnWmpGNGpZQmRDb3J6elVm?=
 =?utf-8?B?YzlEeFpBMHYyKzROeTgxKzh6MWZyRlovakRFZTZSQ3BvaFNlWUFvZEVmclFI?=
 =?utf-8?B?Nm5yRmRBemI3Q3RnM3FwM3ROSjdJT2tBWDVmOVREWUJLSG5CTDRQOXdibVlY?=
 =?utf-8?Q?+KtwY9FLZgQR4QGIGWMITo9pJGoIituHnLzhhJ+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d384394c-3768-430b-0876-08d95709f278
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 05:37:28.5105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYN6YR/YYKwt2KptAKESgXVgYrkyqzrModaCYjW0XP7FaHsxGmPojZbSZeNq37NNg4ytNenu3djIiVYb9pSFaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1856
X-Proofpoint-GUID: 0LKWyQrGsJ8WnPYQCwWq38ohJyE9ekY5
X-Proofpoint-ORIG-GUID: ZISleITDYUS9mR9knq3GES0gSi4DB_Tc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-04_02,2021-08-03_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040030
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Thanks,

On 7/27/21 2:32 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Fixes:
> WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-10.5.9.tar.gz, attempting MIRRORS if available
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 2974341bf..e8ff41461 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -4,7 +4,7 @@ SECTION = "libs"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311"
>   
> -SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz \
> +SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>              file://my.cnf \
>              file://mysqld.service \
>              file://install_db.service \
> 
> 
> 
> 
> 
