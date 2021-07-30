Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.25630.1627659428484755499
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 08:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KvQpaoF0;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38454ad370=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16UDtTKc001956
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 15:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=OBjl5t+P8IwTaTzzKLZajIYuzMzHfUnBbHxoEPAjUB8=;
 b=KvQpaoF0C1/o+Rx1rt+BYAZ3ic94WqBYygIfWEi8Wh0VRr7Ogp+JtlWGJwj7DBKaF5DQ
 uWsUcPP8ktyh1iSsSsc4gP1gxBBKvUpGKbwE+jQbuC0l4g9jRIxBrU8GbUHWiuy2zUhH
 +eNMuj4P1CLM/F0TjRVDXEdRfGt7O3QduY9gjx3jwG9q45wlU4uXsmSXFnZOQk8PvHKz
 mggE1kRrzoyBm3Zlnaoq65w7JnB5Wtapi1CnH24O4KDli7ctMuLpd2EmwAoRRRl5VcOv
 zFJNXDF/3wevUwKZ1XHptp6G2pyO7YdrgKeiVcpEUTj/8MXlhto5BBv1qo0emeBMK61y Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a3wqm949b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 15:37:05 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16UFb5rG024341
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 15:37:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a3wqm9498-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jul 2021 15:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSLO+VmVudlz7xP1g9R/qLlOqtiIePDyvZMl5s3dYmY3+KwJnZscf1sjIcFIZPFYc5StsyyNTmOaYfMSbQKWbruG3OnnJM9LEbB+ANcoIsjNV+3ZiS2eL38e1wARRR3gMGusOkJlkDfvSg11Qu+L7pu8ND6h9arIDbrJf0husykOFFnZJZititxYJDXmR/EoGyGJEdoqPKN2vkazgS2iUd/T5NXVtygMrlyFjw4ck/busSs5cmbmjMn6T0ZCwb8GrJ0QbwLdzDQoin6L5Cba42EyGuFBQBoSLdipi8mkTbHTYvr3i5oapx0OuwKDr9wAQTpC6sN44ghUiLS2pcKGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBjl5t+P8IwTaTzzKLZajIYuzMzHfUnBbHxoEPAjUB8=;
 b=DaQ9vrFMFcMvu8o27C0HSNgoU9mxauN0FPu1KxtYRdtyljTzHXxtPhVBqHfObIJO/9d21xV4U/9Ja6kW4zSra8pz3fXBZgplgUA2PChJx4WYYeIizuxhlp3RQsnmb+v3zj9/sFENwD/lXlcS0Be2YYq3IbvqRYI7EkJCq+ub22CHLxxHNyrwubwmjjdHJe//gYCKoTyltcV9QbGUNakT3EiGA9OM0zNmV0FAjg5Nlt7+b9kgJs/CLZT8Cu8IEZIMTr5cWaB4LKtsmM9tk+uTFfroi01kFbJA6JHdlj/yE2k/+VEnpGSD0+Z6Jevbu30svT/xQKgcJHADP8UBS0ho5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Fri, 30 Jul
 2021 15:37:02 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579%6]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 15:37:02 +0000
Subject: Re: [hardknott][meta-python][PATCH 1/1] python3-urllib3: Upgrade 1.26.4 -> 1.26.5
To: Joe Slater <joe.slater@windriver.com>,
        openembedded-devel@lists.openembedded.org,
        Armin Kuster <akuster808@gmail.com>
References: <20210720185352.134342-1-joe.slater@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <36590d9a-37b4-d42c-123e-dfac19c88cdb@windriver.com>
Date: Fri, 30 Jul 2021 11:36:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210720185352.134342-1-joe.slater@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0166.namprd05.prod.outlook.com
 (2603:10b6:a03:339::21) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR05CA0166.namprd05.prod.outlook.com (2603:10b6:a03:339::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.10 via Frontend Transport; Fri, 30 Jul 2021 15:37:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e522976-2b6e-435e-1cf5-08d9536fe095
X-MS-TrafficTypeDiagnostic: DM6PR11MB4202:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB42020B571EA343BD0544DCDFF8EC9@DM6PR11MB4202.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0sk58Rl9fE+wYCjNUC4BAjNM1h+s526pC61sgSZ26EtD7I69LrSw+ENi99aFpXwKZtVwaK8c+1OiXUwKLVna6COwjkEBjh3n2gZ3pat513xCK4DuV3ikbt+sVDk2IuM4lFyO4+LE4zYFk6kY9w/c+5PZTBpgOPmAVRrh1Zb0XPypMTpxHv0RdtKnDngbuEruJgxPhzyo35K4wgMsoqsg2Ky/YFRAI4lswSNOQfRdrUgZDGG0RWOQA7O5K/rTieZPojAQXFuvFhnOLwXsZLWqg8QruTC5tv0vbZ6xhPcL7rc3msF08bxOFppw8Ti27+WhbSTYNi+Mz2jiU4TZlJ0mECACHktIQ0Y8vY5Hamm7QaSohghXhnS1RgWECFxltk6kweGmDGF47X88Z9HleR4l0Q0V+x4JWiUJxdhmRWDwsEcPojcEUdhtsPp3Dc0DpCw1mgVx865keCnyOZxUj6kH0895AimjxLsQX1TPfYF+i77Ri2iyvkrq6BDT7AYGTng0F+B5U4YlYPL+FeJ/8CHk4IhUqy+ZK6Jjig85IstsGe5VjhVf+9dXV3UGWWoSUcrroGmrZqoBFifKXSrgnk8iO6wGSWoCXmS+oIZInvWiGxO6NdcJrMby5RkrZObs3clKr537nsF+Y1aciZZ7UO0RgaWa/N6iqI670/0NdcDNfvVIjQV9YHQXDPAMGR4kqT6IOj2MA0NZL/qU1fw4Jlp3WeflJutJtYTsP6y7ZUyV9/MuwY1Rzu1aZP+oMKTfBPMel0Zld9Hr34a0BXKoQcIQpjvjQ6y0kFIZ0UhcQefdEw7gCUAe5bPRKRX0m8s24E6Et8hk5ALCxAl6t0upMGLE68PsYoQFGZSLznpK9f4t7t2G0Xf9bZVs6QgpVX452iZGQeNZQuSiCS9j++0/w9giDA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(396003)(346002)(376002)(5660300002)(36756003)(66476007)(52116002)(86362001)(66556008)(38100700002)(53546011)(38350700002)(2616005)(16576012)(956004)(2906002)(6486002)(110136005)(26005)(83380400001)(8936002)(966005)(478600001)(8676002)(31696002)(316002)(31686004)(186003)(66946007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STVsNTI1SzNYVkFMWDM1Ymhseis4RFk3ckZNZyt2VytLUlFLOUppS3dxQWlP?=
 =?utf-8?B?MngweWYvR2JocllCQ1dWOGNjVHNTZDlvazN5UXBjWXZwNEtqUFB4dkswdk9Y?=
 =?utf-8?B?TWJJUzNoQ0dSRVJSWHV3eUxRRHg4VFFZWUZvTVo2OEFHVmNKWlJtNlZiKzZY?=
 =?utf-8?B?UXJNa2I3NUs3TVFiV0RqN1VjaWNXVTBmZk1TWFkvaXhVYmNoTlFCWXA0cnNE?=
 =?utf-8?B?NS9ZMkVHTUJKbWVnaHlseGJWYzhodEQvNHVCbkFJbGNUQUFha2NPSWpKQmRh?=
 =?utf-8?B?UDkvNjZXQTZ2QklYSHBXT1N6RUtQb3IxVVpKQUJCK3ppd2lwUVc3ZG8yeTFK?=
 =?utf-8?B?TExacytvMmhSWUZDWDh4SExlMSs5TEhjMVo1RnBxK0lEait3NDdVOWlCM0tE?=
 =?utf-8?B?bVN3anIzRVlxQTdRcXR5RFd4QWFOajcxZittOWRZTzM4cXhSUTNKeExyM24x?=
 =?utf-8?B?Vk1NSHQwWG15VEc0NEkyRG9CdHBkSThYZEZtVGxPcC9IVE13cHdSRTBOSkdz?=
 =?utf-8?B?WWJOZXpHNUFYbGl0VlN6VVhZMlhTSE9SUWkwOVpGQng4TCtjN0t1dTg4ZzQv?=
 =?utf-8?B?VlBTTEhweG9lU1ZSdHhKNFhpUnZQSFAwSlNTUXFiTzR3U1BENkdjRm9qeEtq?=
 =?utf-8?B?R2Z0bDlHSERSSHpZVXh4S1dBbG9JU0JScEhPZGdWQ0hlSGZGUjd0ZlNZZ3p4?=
 =?utf-8?B?Z09kTnVRSTdXODdRZHQ1blBBSWJpTGxiM0VFazhZMG5FcXFWcm45YUxsZ1Er?=
 =?utf-8?B?ZWhSRWF2dkd2eDVnd3pBWDZnOHRPQWYvR1JzUmVydkJwWVFlTnR1MkVRaGNY?=
 =?utf-8?B?cFFFeTZTb2NkQzJHTFBGLzVSdGIyVmZtbUlqMFlHbnR0TnRuSFVmVlRRT1Rs?=
 =?utf-8?B?WUVPdS94bU1UT0NUQ3lGTk9ZWFpDRDRVL1p0dUFvQWp2Yk1RYkN4c003NnVO?=
 =?utf-8?B?Y0ZFSkhMQ3E0NFlRNVNST25OanN5ODl3ZDJpZjhmVW14QjNFWENoWk9vdXYy?=
 =?utf-8?B?K2lTNERCTStWUlVkODlBMjVmZlpXQUNnelp5ZzM3RjlKS002eS9wc21ndXlX?=
 =?utf-8?B?RFpkSlFSK2hkcmhCOWNJOGZyN0t5SkIrVEdsbzZ5TERvU3FFNXF6U0E4OHVK?=
 =?utf-8?B?OWprUWFTYVhwVUE5eGxLVlpsa2ZPNEpEZFhmNnl2S1QyU2lWSVBBQUN6RHRZ?=
 =?utf-8?B?Uzh5eUFzOS90MFlPL09hNng5aTI0bkx2WkNmczNqa2llWEhHSnprdFY5eU1N?=
 =?utf-8?B?VU9TU3Vnc0ZaZzlwTDdYL0w3VTNjbmkzY2dubTZSS3NTbURFbW1yS0lORmUv?=
 =?utf-8?B?WjV5V1NEWW85Nmt4T2pLZTEvNUJuS0NSY2tWdzJBK2NJUVlLUnFiUG05cTVm?=
 =?utf-8?B?QzNWZGNYMnRXMGRleVNVM0lBQWJUOFZXcG5qeGl5d3VrS1ViTWJEZnk1cEFQ?=
 =?utf-8?B?TkFkMU5ETWJpSXNLT09rMGpiTW9DYnhIU3pqVlJxclF1bStkQWJsN3lUU1hl?=
 =?utf-8?B?b0FTNVRkVkM3OGk0azdiWk1SWWJpaTdDUU85VDRKRjdNMUhSWVkwcWNjckVS?=
 =?utf-8?B?WWFaUmpIbTdrSFYyNXJIRnVGMnI0M0xkQ0Q2RkdIa1hLbWxFWnM0N21icUNj?=
 =?utf-8?B?UmtjMzRUSW1CZzU5MlN1bENyQ3AzeDZCMVhnSDczUlZ0cXVKNEhMS0Q4WTMv?=
 =?utf-8?B?TktWN3VycEw5WmthMnR1aUZKN0dkVm50eXBvcHZ6MFE5a20zSFNSZVh4aXNO?=
 =?utf-8?Q?2UExynMm0/8E1U/3AMpArJVA/VHzTMLCcBLi65E?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e522976-2b6e-435e-1cf5-08d9536fe095
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 15:37:02.5468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QEFhfEr+nJBunF1MTS8ufG+FmvFb1s4B7TmN9YaiMy6hVV5j/8qtqg23e25dgi8BquGoZUdUY5M+ci0oj98XgkGv4iPhTsG74wz/QbMc/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4202
X-Proofpoint-GUID: hm4JMzy3xzVJHkSOPROU1G44BnmGLFUF
X-Proofpoint-ORIG-GUID: FhBhQ06UajkZ5RARQMBNwYDQjH3fCQhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-30_08,2021-07-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300104
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-07-20 2:53 p.m., Joe Slater wrote:
> From: Leon Anavi <leon.anavi@konsulko.com>
> 
> Upgrade to release 1.26.5:

Armin,

Did you miss this one, I don't see it in:
 
https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Thanks,

../Randy
> 
> - Fixed deprecation warnings emitted in Python 3.10.
> - Updated vendored six library to 1.16.0.
> - Improved performance of URL parser when splitting the authority
>    component.
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> Fixes CVE 2021-33503.
> 
> (cherry picked from commit bb39c29a46e44fcc082aed0ce8772f4267a41d2d)
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   .../{python3-urllib3_1.26.4.bb => python3-urllib3_1.26.5.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.4.bb => python3-urllib3_1.26.5.bb} (86%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
> rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
> index 0a31fb1e2..f2fb33c6d 100644
> --- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
>   
> -SRC_URI[sha256sum] = "e7b021f7241115872f92f43c6508082facffbd1c048e3c6e2bb9c2a157e28937"
> +SRC_URI[sha256sum] = "a7acd0977125325f516bda9735fa7142b909a8d01e8b2e4c8108d0984e6e0098"
>   
>   inherit pypi setuptools3
>   
> 


-- 
# Randy MacLeod
# Wind River Linux
