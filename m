Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3677.1623381194934306662
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jVjXd/7B;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=179608fda6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15B3DE82031427
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 20:13:14 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 393bk20v6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 20:13:14 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15B3DDpC031422
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 20:13:13 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 393bk20v6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jun 2021 20:13:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWsmvdeMr0MFNqijWXZd996b3w0fjJzcAbi/pYyUZnOhJlKqpxIYxUCbklbaV/YuH8u/PErEnN+l1OTb8vNdSWyhyk75HIiAiYKGZ5HvMXgJdIOOYAz0PjKz1+i0pcJW/gKv57V+LTUkjUWPDVZX0VEF4dGXi07PmJNu7eTMeCh26z5okVpcwLtZL9d1d0qkZY837Dxy/4WU93v28YDLuatMFrSOQfGu9uR/fEOwFiigctc1oZGM/M8kZIJFuOXIJOY7R2OIm7Ox38X/BpbIYhLz6gdR7djac5fDtASKaAF8OvQ1odzwf6UQMtAGZQz/zih0yMbbRA1SXW0uc2NIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RybISXudPdLw5oZ1pIHh368frUCaND8KD9iE3JxBnmw=;
 b=CvaUylqzneGT8poG4titU/JFc9l6bw4FEgmH1Xen46NPjjOQcPr1DmxElvL5rQ2iBoMZh5mKpAzYu90MYOjT6AUnWwYkodcYLSnOtouFaWynmEsFscrEyuWR+piGk6GDB4/qPbxkeUWmm9DaCMF1VUcvMqLz1Tl2DpgGJPjrXc+qro16bHKriyDinmbYC3ICWgZaXJS4ehhaX8t/4/VLliilXcl+c4gsvV6vnEZuLjPMLNxhh7uSVPqnfjcqSIbS80TbNJ5HSpaoDdEJAAHTlpl5pqZM83/3tCY4D8TH57DvZ0vfvh8f8SatHVZBVJqIsU3djv+9TahpSwa6m/LIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RybISXudPdLw5oZ1pIHh368frUCaND8KD9iE3JxBnmw=;
 b=jVjXd/7B84LFv9xwhhOMouB+kYJlRzqPz7kxDMSsl2vtJKv52idOuI0qaRdCj2EzhZX2tbGSjT8BnWVOrw/yqZQXzzAx/dib5iOhdD6Em0FARemkrr0Aa+os3EA2Jc6D368fsaFQNCCTeGQpVbJX4id2h3uvboByVuhiTxWxfDE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4650.namprd11.prod.outlook.com (2603:10b6:303:54::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 11 Jun
 2021 03:13:11 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127%7]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 03:13:11 +0000
Subject: Re: [oe] [meta-oe][PATCH] nspr: Fix build with nativesdk-gcc from buildtools-extended-tarball
To: Robert Yang <liezhi.yang@windriver.com>,
        openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
References: <20210106121440.84402-1-liezhi.yang@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <f0c3e5e1-0baa-724f-9056-2a154d453e28@windriver.com>
Date: Fri, 11 Jun 2021 11:19:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210106121440.84402-1-liezhi.yang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0067.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::31) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK0PR01CA0067.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 03:13:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06d9f43f-9d10-43a6-a671-08d92c86d805
X-MS-TrafficTypeDiagnostic: MW3PR11MB4650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB465098149BD0D82BF0DE38CEF1349@MW3PR11MB4650.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ckkRjWhX6sRlH6tH1HJVVS2JgRDYgreNUDZtR2DsbJliSkDDq5xjxLkDITrU20GQPIb1N4Rg7g7jqSTw4BJGL6U0/fkLjMuTVp8pTdHKVVsfWt5Ll9sRFRL8IbMH4lGJjc0q3WfwzAgp2ZrUI3skhewVGK5U+V+ac/w4QJTgTVD1as7A6NY8C/8+R55Kf5h1Akdnd0xpVu+I25eRbq6Zm6Xh8Ekuo336mZL1q+SfQ+jWDQdBc1VEhTlWq5M4zwr0SQ8zhjyZ4Iy+G4G1ZJLYgRfR5KEfAL5pfV1FFrEZyM5bHbfUvTAXcP6qliXBWAD4xQiDp3h3J6lvSv35rQJi59POrPdrtyI02d7stJOcfM0jcaA0lS4WmReLP+icmc7jUSZ/xliCFSsMqUqHPxHxmlyTfMFRBmzM01OtRKDPPMh/Njb+d3IK6QbkeoTFHQ4zmMNUtq08bR8FjQcOBGG5t5QgnHcWcRhRxwF1mKJnJXU5p5fcZ5xfCsgk5MnJxCkigrjUnvI8wLt3nNkMZuQJq9bglcC06sKLddIg/g0y2YVHz0SzJSuF38XcBDUrh0LtWfRsBR3TF2XE7uU8dvWpNdMkzjec8FSfwnmz6/vSyz7BgnQAOihLP4OYQW4x70yCOdYrFq5slIIn5JzB576nfEHV4j+VKPfrMWgpfUTsRAixpJyKnUhCnCFrndRv6tijVJ9t7dGSopx8ngyeEbcTrlTv8C70xJ3dg1IHr1DB9SyuvGPIhwv+xJSG585LadIHNsHHrNi+sUAtDoDfkrebj2tvltTgDO6p4j20AjD3MAxXkgDFLfauGDCnqT8PWngS5BKRmSjS9zwn+fgeEkaCf3Ks2lIEmePV/jIjUOe1FPI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(6666004)(16576012)(316002)(86362001)(16526019)(2616005)(8676002)(6706004)(186003)(53546011)(6486002)(83380400001)(478600001)(26005)(52116002)(66476007)(956004)(5660300002)(31696002)(66556008)(8936002)(66946007)(966005)(36756003)(38100700002)(31686004)(38350700002)(2906002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZjF0KzJoWkN4OGtjTVNjb1RoZlU1NHhrZ1pqcFQ5TjlWR3hSOW5RVGZMa1lk?=
 =?utf-8?B?VnBvbERFMDRzaDZhcS9VVXp2L2lwS3k5VWdQclNoMG4zVCtHaDFpS3c1Q1ZM?=
 =?utf-8?B?QXhyRDNsdzRiMXRXTlBDZmZjVXJHbkt2cUkwcHZMM2xRQ0RzRzFLTDJRUUlU?=
 =?utf-8?B?QzVYdVlDR3h3bUs0WE5vb0x3QjV6dGhtMWFGREtJSUp4ODVZZ1JNZFZPR1ln?=
 =?utf-8?B?MWd1UVNRNTROVlFhODJNQ3BuOGlIMTRaZHFuYnYxdit2V3Nod0ZUZzZIRm5E?=
 =?utf-8?B?bmVQNW9rMVEwVVZpT0lvNHJxdFpKK25MK2FrTlhtaUwvMEJIQkhUY3ZxZHIx?=
 =?utf-8?B?NnNPQlFhRWRTRXYyS2ZNTnFCSEJ5QzMvNjJHbnNMM1B3RlYrOFFvRnRnbmtl?=
 =?utf-8?B?VGhmVEdPdGlHcVhMcTNzdVZKMkkxMTFyVG9hUkZKd0tkV2pSeldhQW4xUmV0?=
 =?utf-8?B?ZWc0TEpRMDlSTmtXSHlOMnpXbXFmTkNRU1NFRUtxc2xIelhPR3B4NHNXV2dY?=
 =?utf-8?B?bll5S2lRcnNHV3crQWpFZjlLdTBTQVBtUVZJNjRVRExnT1ZxRnhYZzIvMUw2?=
 =?utf-8?B?b1pHcVFIeFQ4d1QyOXBJK1hyaE1mNklFM2RDQTdWc0NBRXlDbzlPWUtaMkRq?=
 =?utf-8?B?dXdpMXJld0VxVjdlTWNuR0lSRGk3RmFSRm12R2tKWHZBWElyTFpURThmd1JX?=
 =?utf-8?B?R1VCT3RrKzd2bHloK1FjQzFDL2R4aVo0UDROY0xFK0h4M2JIL2hsbHR5TVl1?=
 =?utf-8?B?a1dON1VPT3FpZHdndWtXcHl3MmNJUHlrdUJyNDdKWUdTZ2VpRGEwa21zcU5l?=
 =?utf-8?B?OHJwWTRRVjRzSElPdVhwYnNodEhnUDlkd0cyUE9vbURnVFBnNlc5blBsNW9N?=
 =?utf-8?B?cUV4SWRWQ1FKblV1eGpQL2pYajlKNXJFeUFiQlc3bnY5cnd4M1pyQVZteVRP?=
 =?utf-8?B?ZGg2SXJOVGs1Um5MNlc1RERLOFJQZDRMZ0t6TktYM010b3dZRU5PQVppeHhN?=
 =?utf-8?B?VmlmSnpnamkya3FLMjR3dFBmK0w1azhhYUJ6S3NqU082M29LWGVqaUh2ZnY4?=
 =?utf-8?B?K1hMbkJGNEFwdHZDd2RjaGljOFRqelhQS3d0enlZZWRudDY0ditFa0FyZWZX?=
 =?utf-8?B?WWo0S1ZlTzIzaDZPUDhjRGUwWDhCQ1ZXaEpmUnFrYkhKMThlQkFuQTE2UEtJ?=
 =?utf-8?B?MkxvcjlUVU9RWmFid1ZOc1JreXFoNFdPT1NyZktaV1BGVDhwNzU3QTRscmtT?=
 =?utf-8?B?c2FQOWdvOGVRMTl0bWdvVWZTOVBzODNhVlRnNzFsM3RFTU0rSDY2U3BmNkhu?=
 =?utf-8?B?VEZYYUdISmo0R2hXMmkzV3hQYWVvUlU2OXhnTjhvRmpzQWw4d0toQ0FEcW9q?=
 =?utf-8?B?M2lSSXNDT0IyeWIra1ZWeDB0WkRGYkt1WHJBU3dYcWpUV0ZoU3VOTkZxcGhz?=
 =?utf-8?B?MFRENmVuZitPd1NsODEvWVBjSTlNZitNVjRlZ3d4dlB0ekg4YURHRUxWUENn?=
 =?utf-8?B?N3lhZTJFa3hmUisyS1UyZmlHUjV3c0JhSGVxRGoxa0gvTnB4cU44M2JmYS9D?=
 =?utf-8?B?SmZWZG1DZEJlVjZ3eURNMjJ4Y3VscWw2OXlDZWhvWnR3M0p3aGN2L3hiM0h0?=
 =?utf-8?B?VHU1aXFpMDUwajNwV1BZTUhLOUV3emp1am5xWldhMnFhVlFpekxmSVFXT012?=
 =?utf-8?B?djJnbXZWT2FiU1FqUS9yd2hXSHVTVk1EVW56NXV6TTNyNWRlN0cyUFgwOTZl?=
 =?utf-8?Q?kTJfXtWPSuhiSXIMw5FblawzRHUuZLlkp+/AkWe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d9f43f-9d10-43a6-a671-08d92c86d805
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 03:13:11.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UH6HmUqbNOFyAfu9+L77pbXNtC0ZR7FVcdiDa9Qxschc0kqhij9cmh9NEl6PptE1aMzjpTHwUhmfn81rA8q5hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4650
X-Proofpoint-ORIG-GUID: uSQak_-TZGVhhLt_HfIhccVqFs1Kn8G6
X-Proofpoint-GUID: 2-ArVBYBOcfQlp_-QHZwRTEDh0VPKRVR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-10_14:2021-06-10,2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106110019
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

ping.

Thanks,

On 1/6/21 8:14 PM, Robert Yang wrote:
> Fixed when built with nativesdk-gcc from buildtools-extended-tarball:
> $ bitbake nspr-native
> 
> gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
> /path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> /lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
> /path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> /lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
> /path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> /lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
> /path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> /lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
> 
> Referred to:
> https://github.com/linux-test-project/ltp/issues/255
> 
> There should be a bug hidden in nativesdk-gcc or other toolchains, but it's
> very had to figure it out. The quick workaround is using "-lpthread -lrt"
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   ...ts-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch | 47 +++++++++++++++++++
>   meta-oe/recipes-support/nspr/nspr_4.29.bb     |  1 +
>   2 files changed, 48 insertions(+)
>   create mode 100644 meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch
> 
> diff --git a/meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch b/meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch
> new file mode 100644
> index 000000000..c71871c34
> --- /dev/null
> +++ b/meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch
> @@ -0,0 +1,47 @@
> +From 4441e9c15684623adb3d5cbd6c2f27c1f3d212ac Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Tue, 29 Dec 2020 03:57:07 +0000
> +Subject: [PATCH] nspr/pr/tests/Makefile.in: Add -lrt to EXTRA_LIBS
> +
> +Fixed when built with nativesdk-gcc from buildtools-extended-tarball:
> +$ bitbake nspr-native
> +
> +gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
> +/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> +/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
> +/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> +/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
> +/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> +/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
> +/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> +/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
> +
> +Referred to:
> +https://github.com/linux-test-project/ltp/issues/255
> +
> +There should be a bug hidden in nativesdk-gcc or other toolchains, but it's
> +very had to figure it out. The quick workaround is using "-lpthread -lrt"
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + nspr/pr/tests/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pr/tests/Makefile.in b/pr/tests/Makefile.in
> +index 2ccb992..45270e9 100644
> +--- a/pr/tests/Makefile.in
> ++++ b/pr/tests/Makefile.in
> +@@ -274,7 +274,7 @@ endif # SunOS
> + ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
> +     LDOPTS += -Xlinker
> +     ifeq ($(USE_PTHREADS),1)
> +-        EXTRA_LIBS = -lpthread
> ++        EXTRA_LIBS = -lpthread -lrt
> +     endif
> + endif
> +
> +--
> +2.29.2
> +
> diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> index 6307c159e..fa05bc022 100644
> --- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
> +++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> @@ -13,6 +13,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
>              file://0001-md-Fix-build-with-musl.patch \
>              file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
>              file://nspr.pc.in \
> +           file://0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch \
>   "
>   
>   CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE \
> 
> 
> 
> 
> 
