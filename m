Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC5FC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 07:18:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.49467.1699255115218062005
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 23:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P6apQP/D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9674c4edfc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A666F6n009963
	for <openembedded-devel@lists.openembedded.org>; Sun, 5 Nov 2023 23:18:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=jGz9m8klLEdcRUjbbWiukNxP+Sk/IxlMcnKUgZXJE2Y=; b=
	P6apQP/D2AdSsRyaCiNcVZhwfD6x/CiwSMhUdsypnLUEcP6OmlkLDScmAxZHt5OZ
	YvSFLuFLOSn+2hsHHTJ1mxbpNb+ghaENCzoI4iSAn3jNWD7le1sMKRjvvXmzQawr
	+cFncQi1R4S/p/i37LA6d2BT/IQf9oY0YNxgm6AAPFuM62KpEuLO/wTVucSqBwT+
	2kHV/O7JXYa119l1b2hP2bcWK1nHbjLMHusF1Ue+1lTF2H1UEjbKDE1H1oloIj1f
	wL8iMxprqYlHruvKxNFxHe0e0kioKEOo2gt0AC45adBkDeBloY/KS6MsfO5IDdQN
	BSeBaQQd/ql6DTKEtUD1jw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u5h8096u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 23:18:34 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3A67EIKo006613
	for <openembedded-devel@lists.openembedded.org>; Sun, 5 Nov 2023 23:18:33 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u5h8096tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 05 Nov 2023 23:18:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMyIFCcJ/CO+hB0TwKONDx5SEPy5E9tBIi9SoK7Q5Yb9NNSOlXvrVtaX+EGTU9fOo8aRI34krT6zY431WOfxpS8a2YwyrKLv7NK/kr2YgU9vF0g7/0ymU4YcynF/y9kUJ//JZ3cWLaB+3TtjJy7AX/TMulrvlhMDz15oihjMOduR/UsJktyOmm4SDlcD19tKfY+VMgsPss1aKYEWuTfyYcNgSrhHWh1rp0CgOuQSoHijKyxVBHuEWbxjPXEJWCkvjysB+C/kNedwvM9rGguxgJnouGcLh0G6M9tIYyWpAP6K4tuW8r7y8r1M/aEF5hD4Mmsh80YbkOaJK0V5vyTU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGz9m8klLEdcRUjbbWiukNxP+Sk/IxlMcnKUgZXJE2Y=;
 b=NTVMo1/01SEazGeB1lsjLK+N93Dv2VtxujTLrNW77r1dWMdnw84TJviNKWxC5LGpOMgvPbErTKs4vBG0H+gIWhNOugK6TcWTW9RMGdmfRkJe5ivCBKcthUBAf15Gq5FL7q8X4Liug0wWHaxWpTei+Q3R6gBHdAYs9U8+4O/WLZu+6P5MrMxpBTDD/GT0TIzvojnzFWKquz8fveOJmbzrF9G2tH1zy7hq/hgc+tiVBs/7Hl5vNSm2CTBDgGiE3qa0URzvirKNNJx6w5iFUcMUii/HfbJbZW3Yd4wYLQEfOakLl0z2RGmeG2/HJWWUr/hKFxhRAb/fhZUDRMlwmkTVOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MN2PR11MB4584.namprd11.prod.outlook.com (2603:10b6:208:264::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 07:18:29 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::c0d4:7b72:20c6:3a07]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::c0d4:7b72:20c6:3a07%3]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 07:18:28 +0000
Message-ID: <053d4a01-59d6-46dd-8174-8a27177c3f69@windriver.com>
Date: Mon, 6 Nov 2023 15:18:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][mickledore][PATCH] mbedtls: upgrade 2.28.3
 -> 2.28.5
To: openembedded-devel@lists.openembedded.org,
        Armin Kuster <akuster808@gmail.com>
References: <178D9978619D8F55.14388@lists.openembedded.org>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <178D9978619D8F55.14388@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0214.apcprd06.prod.outlook.com
 (2603:1096:4:68::22) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MN2PR11MB4584:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d73a410-8217-4649-e6a8-08dbde989280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m+b3CgEaaAZXbuOzgyqRjnX7qEIQ1zHE4UwtP+3Mglv6kilCrz2GvypgCyk/Z3DkC0Shy/uXCieZ72kl/S5FfAnFwurTONcj4plnARjhw1Yp0MY5CJxQmzTsSWZIGtOdLwf+RlSmpskDCwdwBCAtB3A/wejmJsGibhruNPlCHk/Jf+ykWpHj6F3ZqAx0oUMUFOPIl3DUvfhEvtwFmVY4jzq51YHubGB+iLu0vQuafBbjwGhAjRDjOLm2WdA0TfCL2LITvlBlNHrbhPYY96+Cs3LtNhLLJ36ZHbPvYpYMjjEVt6cUfz8C1j+EDwSnihS0469iiALkMGMvMSSySTyrG4xsyrZC/SYW9KitxitXF+C6jAiNjGudR20cmcYgicqDsKs/h+USVFXrNLuwuACM/ycJ7PbGXanrMzz84L4vI05N2jAbeoTWVyie67Bx+TdjCBW2HjLNUvzxZhdbwVmlhOJVXmC4gklARoxqPGB97OLye4V4grWSKDrNWfTJN23jVLGbCerNQ+cWyDap8dSLZKmdE/6G9p1TDjHWDAx9xNrJD6Amunt8irF+bW+udBUO5feH5vUpYC2wxsPohuBlCC7Aj/Zom9U4Y9eHVCqjfKxMlpqejz0wqPUaJmgVjv5QoCrw4YanG1ZuL94WfC+tDQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39850400004)(396003)(346002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(41300700001)(66946007)(44832011)(8676002)(8936002)(66476007)(66556008)(966005)(6486002)(478600001)(31686004)(5660300002)(6916009)(316002)(2906002)(6512007)(66899024)(6506007)(6666004)(26005)(2616005)(36756003)(83380400001)(53546011)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkFiZXRnNnV5UkJzRWR3SnYwYVJVNFFMNnRoZng4WHZhYzNpOHpRekE1dFdC?=
 =?utf-8?B?TFROQngyVVU3d3NyNVZOTzZJUTQ1NTBBM1pxZEZIRHF4RHFnVUN2VVlQMStO?=
 =?utf-8?B?cFJ4dUpWUE9YYXg2MlFScnJRVE45OERXMHpLTDJOYXp4RUszOEtpUUNteXF5?=
 =?utf-8?B?Z1RQWEZRM2dKWmJTRXgybHhwRm9MNHI1bXQxRHV3VlpiTVlyZkRWcmw1VVI5?=
 =?utf-8?B?VEp1OC94Ym84d055V0hWMlJNVG5naWV6S0E4aHhMMlVrMUIweEdDTG5MWDgr?=
 =?utf-8?B?Vm1TZmNmeHdadHRuUm00azlkOTNyaHBsdnE5WGhaTlBveWc4aVc5dnVWZldz?=
 =?utf-8?B?MnZWRDJVRWhOd1lGSzRnQlJ2SE9SdjJkeEprVHBCMFpzMXRPZjI1a2MwRXRv?=
 =?utf-8?B?M3NyQzN0emEwK0tZbzc2WkRkVDQ0UEVlU2NIcHp1dGh4UlNGdXVqTm9QSFc3?=
 =?utf-8?B?cFM5N0FzSWtoeEZWNnROTExtV3NSVWg0TEVQQjBJTm41UTVKMDNaUWdmY2Iy?=
 =?utf-8?B?QWNiZkhERVV3dDFnZWdvY3UyNmhRRkhsSDk4WnpwN1dwVzVDVVY1d0hJVzRI?=
 =?utf-8?B?bElrZ2Y1UUFMSGUrMGdJVW1hTDRhQ3kxZnViSTUzSXk0MVFDM0JOcmF3K3NT?=
 =?utf-8?B?RDJLVzRzdXJSYmpHbHRNVUs0c1BmU0lPRVAwYVFvOXZLKytZS2xtd1FoQzBM?=
 =?utf-8?B?TWtlWGlpTEUxWGJ6VUZZYm1yQkRrNnFlSTFKL1AzZFlZZktvdFlkT0tuNE9q?=
 =?utf-8?B?akpGeTJLa1hrRHppR1BpWVVlK0twWGgzWGw0bXliK2pEZlpXQUtmNlh2MHNO?=
 =?utf-8?B?dkthc3QvOVd3eTVJV1FlY3ZhRzVmaGxVdk9OM3hnblBLRWt0eUs1aFE4alh3?=
 =?utf-8?B?MzdYbTJ4b0liQXZSS1RPYlJXdmhvbCt0eWV5OVpsVm81NWFjYTU4T0RLQnJI?=
 =?utf-8?B?MC81bCtQN3dvYjV3THNicGtQWmc5S21CcXp3NWJpblRXL1Q3MlcxaE9SS05n?=
 =?utf-8?B?L2JTcVVTUVFvVjA1VUJId0h2YURDdjhSQTJsYitxcGpZM2RNanlORXJwZURw?=
 =?utf-8?B?VitRWUhCZmFzQzMzZjNTcVhidG5SN01KVUpzYU5HaVRwUDFBUjlVVElwUDJ4?=
 =?utf-8?B?SjU2QmNLK0RFQ3FZdElBY28rZjlFNUpyK2FpWEZwTTFBTGNrNnI1RGdlbmti?=
 =?utf-8?B?cmJUZWRSaVRRSlk0VFlzcE5IUTRIM2NwenpGNm1DbDNYY2xOSEJqbGVUQ1JL?=
 =?utf-8?B?MEN1d0s2WWtOc3Zvb01CclovNHJqTmhJd2VJU2Nib0ZSZjRHOFJleEhNc2pF?=
 =?utf-8?B?cWJTN01uNG9NQ3ZEd1Z0VzBYVWc0cVRhcUN0MFVtS29BMnZ6cUFNWHhZTzQv?=
 =?utf-8?B?bk1CRkhLa3p4MEFVbVNBQnZYTHZSaXczemF5eGlteCtscE02SGxlUnFIR3FL?=
 =?utf-8?B?S3VvRE9xb3czcEtUZ3J2WC90MmpjZ2Uxa2tLV2JReWNaUUQveXJWRG9rRVIx?=
 =?utf-8?B?a0Z1dTc5NEFZalBtS2lxcXQvK1VGSTJXL2kyMU04V2FtTVE5NUphYlk3SFJU?=
 =?utf-8?B?cE5jWmtheFZXa2VsbXI5RHFkWE1LVm9HRnpEemRxbDJKUjhpVGpJVzRzV1RV?=
 =?utf-8?B?WEs0Y3cvRk1QUm0xTnNqbXZRVUtPeUJjck96OFVNOFE0Wi9wVHJMTTExZ2Nr?=
 =?utf-8?B?bWQ5VFVXWjZROVM1cUFnYVJRTFd2ME1RWU1CMmNBeUs1ZHZFSHhvTHdjUnk4?=
 =?utf-8?B?RHR4eTBGaGQxa2lWbnVMelBtazBEbkpzVllpL21EdXpFZ1BNV0dSVGVpU0ln?=
 =?utf-8?B?V2plblQ5akMzNGZOd1VUcVhMNEd5Q2pHbFFYdjJFbFRhOC93M0cxbnNqakFP?=
 =?utf-8?B?STg5U1A1cmx2TWdseDV6VHRMbTdPOXZUNnI1RkM2UmFDTjBSR2UzYlZ5L2dW?=
 =?utf-8?B?WXRBeExMc3VEL1NkVk0xajNROUFVMG8vWHczOGkrbDNmWnpvaDdlS0ZJak15?=
 =?utf-8?B?b0p3dVZEOGN3S0t6cmdsTGVmbG9zeHptYUdnSHFIMkVIOUZxQU02SENSTWpU?=
 =?utf-8?B?a0JqQTJZZlI4VklFYThKaERIK3RHU2lRdURsbWFXVTBNZjBVYXZJdTFnSS84?=
 =?utf-8?Q?KM7pMIqNh5ywp+zpAN5eQcBhp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d73a410-8217-4649-e6a8-08dbde989280
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 07:18:28.0318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxVYn1rkx/2519bE9SfQh4RuzO3zfmjOwNgFC1uOuir61XzRm3MvSDbDEMiegQOjVITayN+TWqY1Z1Ha1ySP9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4584
X-Proofpoint-ORIG-GUID: aq9B0sFJbu5yASF0wzyIfJnNoOas8x4Y
X-Proofpoint-GUID: cWjWeZtv-twEBRMmURkEgQ_bLjs7HO0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_05,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311060062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 07:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106396

Ping ...


//Yi


On 10/13/23 15:16, Yi Zhao wrote:
> This release includes security fix for CVE-2023-43615.
>
> Changelog:
> https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.5
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   .../mbedtls/{mbedtls_2.28.3.bb => mbedtls_2.28.5.bb}            | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.3.bb => mbedtls_2.28.5.bb} (98%)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
> similarity index 98%
> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
> index ce094d5af..a1c283d9e 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   SECTION = "libs"
>   
>   S = "${WORKDIR}/git"
> -SRCREV = "981743de6fcdbe672e482b6fd724d31d0a0d2476"
> +SRCREV = "47e8cc9db2e469d902b0e3093ae9e482c3d87188"
>   SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
>              file://run-ptest \
>             "
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105462): https://lists.openembedded.org/g/openembedded-devel/message/105462
> Mute This Topic: https://lists.openembedded.org/mt/101935447/7283133
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

