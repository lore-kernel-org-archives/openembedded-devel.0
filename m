Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3059.1622093023244077757
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 22:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Z/w90lNV;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0781c5d9f2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14R5NgAf003970;
	Wed, 26 May 2021 22:23:42 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 38sn840qhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 May 2021 22:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMcfS53Z6vjXLUzGuiT9j56p5Z5uSJ62xORDKY7lCQpdmyLulSQAYWPc465073Q/fCyhQBtrI5oWrixwKIbmj2THfSfNcBkKxAtlNdyTA2S0xQcnq9Nr7NdX/veBzvEmH3YFssD9pwfWygOaqKq5fhoV7MDHYMqPMH0CU4pRYhyoVyn74m/m502uSispfEafQWcgMWrko/V61FP2BOYsawHbCKEkLb4gBVQpuiGKK+M2k0hXwxp9nc/qHaWvgmnqPTYoCAepQUqZd+TC5+Ds0b/2PkbvyuWAnUeUiakEcJlr9jkwt4BzIhohOCt6RWnI/HmPRuu5sNk27f4NiZbAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQqWPLfhTTEThRbBLWnQlAFXMOCDMYL3hoT8cdt0A3g=;
 b=D81h2JlQim2TqRY/JiuGunyUY6t134nCarcKz3A7+92Z5lBwPS+Bp7TFvTspE0uVQzhd74WcXD6xXULaIb4aTfLEwiyYEC4qB3VKmk5mobhnHjrK7MtYgidwL+E7pY4zr/Jb1aOYrRevcoKmZYR1hmyMl7gsa8HG0tugx2etyzPfVw3+qAzzMjjbtx0M/0w5fc39AobVZ6joepdMbE2WuHI7cswvaaESIc4Zyb1dgr5PeFkzTUyOskzb0LZynJmAIK0oIv2XB0Fl6ApuA6PG/KZ8NV57x+NGowNBQu6ZA7ty+Van67n5elq9ORwzq1VGT7wsS5IfRmLireX0UCnuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQqWPLfhTTEThRbBLWnQlAFXMOCDMYL3hoT8cdt0A3g=;
 b=Z/w90lNV/Z1d+WpUI83WndnZTbtx3El5KoKWZX7uBEM/zll5me692L8eJIOxIWfqFzr9lQP7LyGA5nWoh/KsSNVGbEdF9R7OJkWGQq46Bi9YYjXZajQv//EBqbYx0z6MJ9s9whwEYUROUNS3tgP1zb5PEwMErgLs2BsvFLvHZdM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2190.namprd11.prod.outlook.com (2603:10b6:301:5b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 27 May
 2021 05:09:01 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4173.020; Thu, 27 May 2021
 05:09:01 +0000
Subject: Re: [meta-networking][PATCH] dhcp-relay: Use recent config.guess and config.sub for bind
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210527045029.1366384-1-raj.khem@gmail.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <f5bade8c-7814-0fdf-111a-9e400aa328b4@windriver.com>
Date: Thu, 27 May 2021 13:08:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210527045029.1366384-1-raj.khem@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0194.apcprd02.prod.outlook.com
 (2603:1096:201:21::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HK2PR02CA0194.apcprd02.prod.outlook.com (2603:1096:201:21::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 05:09:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6ae7550-f95c-4322-288c-08d920cd8a3e
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2190:
X-Microsoft-Antispam-PRVS: 
 <MWHPR1101MB2190A265EA9097EE15B3EF36F9239@MWHPR1101MB2190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 pnyqqo3cFMOyRBzbKQgPIjf0R1+0bDsb/0Lo60OL+VyX7R8BI+O71U29WfSfTGxvLvjoWZNAJ5OcSMP+Sao90JyVTqB5WyLL83tGbwbHWF4FoNHhSbCoHbz+YJ5263D+eX5H5olJu6R0vQSXsCdYvPCMRwOuzmOHDQSqi2A5R4ycaEqYKoZjUa4pQrHF0wjP1acU+o6gfxN+XwcdaCH2Kb+NPopGzM0Yrgk6tGbYrlglbteUSKTV/l9sgXBUlzI4j43B4QHQ+cJ0NKF7pVx80dl/9f8nM31gRjZuXE0bRX6wZoHbpSF4CeWGuibmSjcYBcutBn+hRy6AGXEGv5gV+YthNFfOj+IxFRZw9Zm2nKoMQ1F9Oyeb74JjOsy0oBvkC/0FDrprp4RTRHDkzcUhfrG4DummWa5vT/2vNRrjs/kJPoohsEH+x/PGFo8SgXGvOgPSrczPoV4+bb/iZsGIfoevhaOrEnLjPfJLFeP7mEooYlbPZNPj5sxI6TvFK06P/H/KHQJZhrLuWxvhxX4MxfgwBSWT63ZzzbVE6h1fHiRKLDekiO2WRGThdkhXPQKZZFCjMmOfv1aiLFLYnP/WRYTT5pjpJ89ijj1uJC4V4yLn/LuxbB3/1LBX24uwRf36d+Zr2U7ePv/JsNyYeoIj+DS9tIyIj5HTdHBn0sAD6aEJYZdmvC/ZMVlY9EsOmFDS73TrpWMhAxNC99ZMk/cN6diUh/6PIoAl2hQD6gC8pnHEARgkKDhJEOHY7LkJT5OB
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(366004)(346002)(136003)(66946007)(316002)(6666004)(478600001)(66556008)(2906002)(36756003)(6486002)(16526019)(5660300002)(31686004)(6706004)(186003)(66476007)(8936002)(8676002)(2616005)(16576012)(956004)(38350700002)(86362001)(52116002)(26005)(44832011)(38100700002)(31696002)(53546011)(83380400001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?utf-8?B?bmJqRm9XMEN5eXRvUXBUc2FyT1p4TVJXcWJnYzAwWFI4R1JOVUJCNjJnS3Jh?=
 =?utf-8?B?R0hpYVJOTHByTzh3SlVlM2VHeTY0cGtVWHRzYmptRzVJeldnaFhpOUpsdVNU?=
 =?utf-8?B?dVJLME9QRnVVcDU5bSttN2M2U2ZGTFdGY0c1NWZWYU9xeUs2SVpQeVc2a3JM?=
 =?utf-8?B?V1h1OHJiSWo0QUN4OFVkQ1F1L05NbncwSkF4c3dhczkzdVdpM0I0LzRpWWkx?=
 =?utf-8?B?T2JxY0J6MVhXNkRySzlYQUxIeUxvUWdQeUVQRzE2NEUzRHlYQmFsa3RUczZh?=
 =?utf-8?B?QjZNcnZEUjlGZlFSVVp5WEltU2RROEwxWTROZXlzZk9FbHU1eEkvYWM5NnVn?=
 =?utf-8?B?dklRNmZyVXY2YnJjQW82UnV6NnY5VFozVnNjKytoUnRnZXdYYmxKbmJhTUF3?=
 =?utf-8?B?YUZVT09ZQUZRdjR3WE55L0c3YXdqclVuYmpuWm5GbDhUZlJuWGRJZ3Iycm0r?=
 =?utf-8?B?K2JYMVRoWEFpSE5LVFpHRU56YnBRWFpsOWZtQkszWlkrdjNYVkcxdjR3UklL?=
 =?utf-8?B?Z1RhZ0xDY0pxS2E2bEhPMm96TExKZnozVkNrNWJ0dHVlYy94MlpKN3pYeXlv?=
 =?utf-8?B?Nld5VmcvNHNNdzFON1BMenNzTCtXcWlvRklJR1oxWXQvMkZrQ0l5OEE1UWdI?=
 =?utf-8?B?R010a0g3QURTVTdUSVZ1RGR1R2hwUnJodTcrcG1Ib3kyWmtLbEtZUjJDcExQ?=
 =?utf-8?B?aC95NEZ2UzdlK3dUb3gvZkw5K2pNSXN3dnBLQ3cyL1ZNRUJxUHZnMnhsL01F?=
 =?utf-8?B?RUVoclczTGN6THFoQ2E1MC9WOFNac0NISWl6aFpVcW1tbmtCeSsybkFBWVRs?=
 =?utf-8?B?cnNFaEduUWlpYjV6RjQ3NCtWNGpLcWJML1ROeWNFaHI5blprMjB4QlBpM0RJ?=
 =?utf-8?B?Ymtlb3VwSDJwY2NhVEZYZXlMcFI4M1dQNHVFME9abTB1SXh2eTBEajBXOVAx?=
 =?utf-8?B?RzR2VHVkc2QwSEp1a0pZdUsvS215T1RIYVhEVFI1T29vcWU2aHhMZXRKODN6?=
 =?utf-8?B?bytmYkJFU0tMSnR5V2dUWUJRZzhZc0VabmM2d1lKMVRhUnZPVUV0b2RVVGZm?=
 =?utf-8?B?QjFKdWFROEZ2VkRrb1RCVUFUbitKQnA5MFpxOVVNdzFzQ0ZCaEZKaXVWaHNH?=
 =?utf-8?B?OHE1eU1BU1VZVVNyUmw1NjBndHdEZ3VweXlZeko4dVZQRzhXUE44Z1hUT0Zt?=
 =?utf-8?B?NTJPeDEzakIwRXk1UXh6MXVXdG9mbUJBLzdtRTJGbENkcGhZRFQwaTJab0Qz?=
 =?utf-8?B?bG9FZG9Dd0hlUlUzZzV5L3lRQWR4N0NHMGlTaU9hMFl4Nno5elF6YytvS3li?=
 =?utf-8?B?QjVocEFPcDFLUkNhM3V6MmZPUDBlOS9lZlBJL0pET2JhSjNjZ1UrRlJnMzQr?=
 =?utf-8?B?WUZrNHRheTBnRiswWTdvaHBJcmdPcVBJVWg2VTQ5eWtYTmlPd25rcHhQaGdz?=
 =?utf-8?B?cjA4N0hBOCtUYnZURlprb2hYZ0ErZm0vNlpGc09TcmF2eXZNRXhiME85OXFQ?=
 =?utf-8?B?Smo3NjBPb0VHMU9nYTVJQWwvTTFhL2pIN2xoRHFwRVNRSTFZYWVRS2JVSm5O?=
 =?utf-8?B?SWNJbUxuQnRVbHhDYTdSSVRYVE00NHBaRVBqWnVWbVBkQ3h6SGt5aDdNTGhV?=
 =?utf-8?B?VUhITlpjOExMM2ZSOHUvU1BYRFpZNTA4QWM4cURIU1VPem9FRlV3Z0p4aTE4?=
 =?utf-8?B?eTRKUzFnZy83a3YxckZQR25teUtFQzh6bzVGQ2E1a3gyeXA2azRNQTBLdUpZ?=
 =?utf-8?Q?7ew7ioHoOYf7lbIGGkrLleeb71CWm/NH72MnxrH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ae7550-f95c-4322-288c-08d920cd8a3e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 05:09:01.2695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvwZcxwjCkkGhidBo0RF2+RnC8Ff0lyq6J4GzakxzuznhNOk9MqxTuq8rY8FJN5p61lVcAIMpXgB+1aytfkW9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2190
X-Proofpoint-GUID: SBHQUcSBezLrXzaMVAfOUwEtgD9Pkbya
X-Proofpoint-ORIG-GUID: SBHQUcSBezLrXzaMVAfOUwEtgD9Pkbya
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-27_01:2021-05-26,2021-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105270035
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thanks. It LGTM.


//Yi

On 5/27/21 12:50 PM, Khem Raj wrote:
> vendored version of bind is quite old which does not have all newer
> architecture info like riscv in gnu-config files captured in the bind
> tarball, therefore update these files before configuring bundled bind
>
> Fixes build on rv32/rv64
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Yi Zhao <yi.zhao@windriver.com>
> ---
>   .../recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb           | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
> index bd816106c5..2af41b217a 100644
> --- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
> @@ -43,6 +43,12 @@ EXTRA_OECONF = "--enable-paranoia \
>   do_configure_prepend () {
>       cp configure.ac+lt configure.ac
>   }
> +do_compile_prepend() {
> +    rm -rf ${S}/bind/bind-9.11.14/
> +    tar xf ${S}/bind/bind.tar.gz -C ${S}/bind
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/bind/bind-9.11.14/
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/bind/bind-9.11.14/
> +}
>   
>   do_install_append () {
>       install -d ${D}${sysconfdir}/default
