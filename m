Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.225.1621531457406076472
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 10:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QbEp0vEl;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0774a447fa=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14KHGl7s009591
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 17:24:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 38nphwga56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 17:24:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1wHD1lVJUbQ+r9RvE+2fQxmGRPjGMpzBty+HOWbwzaIfGT55yuvznEfagVbzz8WA5xa6RPSOb7fZGPpNRy8YpMuXDa+pBjU4R8ZxDi7LULVkup+7YQdRGxgBymJ6BKG3EEzgSOWo+BvY3RiwvMPzbahL7oBJmiV4I3CB2/+RHAd6ABhR0ETDtjKJiSX6dBABIhJt4V8wZc1mP3Qa17Fz18OUTDYccK7yn36UBOCeRGPR/b8p/xuTo5hnjqUZoN89nvBbx4uDS/qMnHO+3tpc19WV+PFT3ws6w9q2MoOi9OnyKHTt+fV/HVngFMMdgYEP6+RdKpo42FDSUvKSOWlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUaGLujLiQV4SqJKyYl8ljSJJSy/bGvTt43fP5xO96c=;
 b=UEo9EERzrzxaHdlbcxFK1aGArqb89htD1o45erFF4umjpVvYL7WmVpCGUQpUK1BPbSeG2PKP8t4IUwjdzkJqcd2/SC/Xm7Or9dWyM41Q3/diqBPUfiTO6FTNIkUS0kOrvgpek/DXLPvlQhqRM6Hz5KhDOZiOyLJwWSzaVLzIdqAlANuj1Qh2QqFytqeo3FXDcsT6BAnXfu+Q29zAzNr88i/k7f5Q+lGchRhkk4KjuU69BP/cMM4o91gt/18azalw52zAuLC1jbIZ23nja2RwucGyBNhNeKajqYPIv4KFTKk9NOGHkyBE+rjHZB9T9rPfeRkgHJcajiPCZEZjyCWYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUaGLujLiQV4SqJKyYl8ljSJJSy/bGvTt43fP5xO96c=;
 b=QbEp0vEleTSHsdXrbkbyAtG34C/VT8vTbtzkccI8hZ/8xcCBt6QH7MAF8w3j9G2ukwoN0gWbJjHpiK1iOWie7EIeyI80nsHWWaORuX0k9+Nt12HXPC/W98hRpaGjflN7VLfq7EAk4PWny+6cjkw0s2SDJdOVp2mtAYlRdCtI1CA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 17:24:14 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4129.031; Thu, 20 May 2021
 17:24:14 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-ujson: fix ptests
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <1680D62BB5234677.10489@lists.openembedded.org>
Message-ID: <1329eaae-42ec-443b-5162-7338ecdcf53b@windriver.com>
Date: Thu, 20 May 2021 13:24:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1680D62BB5234677.10489@lists.openembedded.org>
X-Originating-IP: [2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc]
X-ClientProxiedBy: YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc] (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.31 via Frontend Transport; Thu, 20 May 2021 17:24:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b02b2d90-5776-479b-b728-08d91bb416e0
X-MS-TrafficTypeDiagnostic: BY5PR11MB4308:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4308A0D83B3448555E9D3CB89F2A9@BY5PR11MB4308.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V0ZcN50xGSj0JNIMCqePu/89l+yH3cyALR1GNk8zamIqU1DVzsozT0LCgnVzabPx8HRQ3srZDTZhL4bz7PuZkEg9vflRXrXQ+HvXPoKfiNq+64n8u20E7W/T+uYsug7ZRZgXYC7j8Wfk9lE9lETFu25Uj85wIkmB5c2nB9epGyD2Lfw9Y06hakzE1eCGsUlo3SEMcX3QmwTiLYb9x0olebqVa6C7dM7J2KnLMsGqjkgulVYiDgy4fpyUkPEyVc4xrt5r8Xzrfr8blcpYpAeF2kUlTkzplhQvb2SMsrj8wKIKzHL6BjrL4TycLQy9SxfiNCb/Lp6dSOxb4Z1s/ilQoaUatnzX25GubsBtx/N41E9LrvOny1srli6cZkyEQ3kLPEvtQJAnqIOopDwAIX2t9uRESaLKcSSPL0G7UGB3+W4fYdNd/oc7OepiT+TQdsw2P1A9TZsfZVYzrcMc91BD7XaFARDjff5/cZmUe1zhWIcv9g5A/EHQO96zvsa9o4RE5UJ2RQyE2/CyG9aYwovrrdomXOSYXJhbB+zTLI/bhrgQE7pkh5UxX1c2t25O1/OpXzYyZe/WX0zwnryCjjfFpvK39ZYmAyr6ImwY788S9kkqGfR8wkHPX/sVoH8XujqizL7iysfgeVMoLZuKf0yGF7DAC0SG6ToMMByGbEOCZdJC7CYX4aKanpGbPLMd/ZJUvkx1T2DzV+KxnF+QyCiYYEgMsGgjjZG20j6XC+5VD9t+QUX69bkGjdYvahF+2BnocJYGAuThNxNdq7Z0aV/NSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(366004)(396003)(136003)(33964004)(166002)(83380400001)(2616005)(2906002)(6486002)(6916009)(53546011)(66476007)(966005)(31696002)(16526019)(44832011)(86362001)(31686004)(8676002)(478600001)(36756003)(38100700002)(66556008)(8936002)(5660300002)(316002)(186003)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VDQ2UDdCM3hQQmxLb2thMjR6TmFuQSs2eGtRdlBKNEFtRTY2NnV6L2ZTZXF1?=
 =?utf-8?B?VGNOdzRxUi92TXBYbFA1S3o2VXcxY0VTLzRCR1FCWUlMeVdjYitCTHpWdTE4?=
 =?utf-8?B?VnNCT3JlTkhQbU16U1I1d2pSRWVYWElZSEoxbWxrR1c3RFVFLzFzWm9PeWRm?=
 =?utf-8?B?SDFEa3dxRGhZK1VKUnF6QmhaaGthR1FpQnI4a0txMHM1THF0WFhJTXorZ1hQ?=
 =?utf-8?B?L1NrNHZMcGFScktDVitrcXMzRGdjTjNLWCtuUEtiTDd4Sm1NVGx4RGZ2Vk1z?=
 =?utf-8?B?QnZuYVJQNjF4OVJ2MWx4NkNMN1VWSE1DcVdtQTVLT1dYNUlpRFAvSHM0MGxV?=
 =?utf-8?B?UDlxaDd4Wk1MNmdNUlI5UVIxODJnNVlZSmlIYXhqN0tYS3NubzFZM2ZZWDh5?=
 =?utf-8?B?VUtJWnhram5HYmxFYjY1RExXbFZSa0I2QTdSdlcyS2JkWlZ2UE56NkdIb29n?=
 =?utf-8?B?Zy9paXBlbkkvWGc4ZVlmR042eFZDcUY3ZTQ5bDRTQ1BzaGMrTFVYZ2N6VFh3?=
 =?utf-8?B?eVBZUzFLQzNFdEc2WWcyNTJBYzA2ekxvQVcvK1dDYnNGcFBjUTdwbFhtb0Yv?=
 =?utf-8?B?Y1B3c254d1M1VXUyVXhndEFaODh2RHN1akp1QURQSnlwb0lrZDZNL1BRZVNu?=
 =?utf-8?B?bTFsckhqNFk3TjdLV3VWZmJvVkY5R2VlVEo1Qnc3T2t1a0JWN0I3blhNN3Ix?=
 =?utf-8?B?N2hjdHNqYjdNbCtDMFJ0WjVadXNod3N5ejFZL1hyb0JadzVHVTBHTVEzT3Jh?=
 =?utf-8?B?U0hJMkprQUVMbHM1a29pNGFFVDJqb3czSzVYMlh3YitKUkRQS2FFL1ovbVcv?=
 =?utf-8?B?VjVMNTlyNmNncWZRTXBFeHIzblBVbWlES3VTYVRZY1pLYzJpMCtCcXNLOHBQ?=
 =?utf-8?B?c3RNcURHc0FGOWdybldaRlR4M1JDUmw5ZjZUU2twbmFpU1B1M2dMZ3lPUGU2?=
 =?utf-8?B?K2hpTWsrZllJMUl1QzkralR0K213Y0o2dFhkWVc1bXIwN3BPOVVXYlQ1aE9s?=
 =?utf-8?B?Sml2QXE1ei9iZkRvUjAyUE45cG9hM2VYVWhOSjZ3UjY1ODZJcmNRbXF0VFlh?=
 =?utf-8?B?cFNNUWFOQXBaWHlSL0ZZYUh3SEdvTDhLQTJqVk9OWFg3M2JqRXdpY2VWakJs?=
 =?utf-8?B?U3czRmxha2E2OEQ2eGl4SVdlOTZNSCswTExzQ2VQdndlSXd3Mnp4Z2hqaFdD?=
 =?utf-8?B?cC9GRzgrcFV5M0ZBY2Z6N0NSekV1VUszdlN5UFIxRjI1NnhCRkJaVStaVVhK?=
 =?utf-8?B?RlFzZ2F3cEZ6anFINFlFQmlQSTdlRUE3bVB3b2t5Rm9HSHlvTGh1d3o4eUYw?=
 =?utf-8?B?elkvQ1VZOWM2YmZ2MlJVaVFqTisyc0ZPRWdvc1JsWUV3bDdGV1FqazRZeUhV?=
 =?utf-8?B?enNvbTI0U0h2Nm5RdWIzc3BlTDRtVVk2MnA1QXV5TjZ6ZzdHZ0VwdlQ5REhV?=
 =?utf-8?B?b2tLajIxYTdGMnFweWpTc2F1NnhCcnJ5dStzaVQ3ZW1Ia3N1QzVTZElCbGtT?=
 =?utf-8?B?NHliRVIzbVYvRDVvVmRxdGIxaUpYRUgvTEUzSXFWTDBDaXpxUkhidkNtYTNq?=
 =?utf-8?B?Q1J6RkNNNWYyY3VVSGhmUGJNK1NBNm0zR1hwY0pkN1crUWRidXRkekFFUkZT?=
 =?utf-8?B?K3dvamZHWDRIRCtFalc3L1Rsc2NqOXNaQXdHaUpxSm1EUmZPRzlYMUhtV3ZU?=
 =?utf-8?B?bVJ1WWVnQkZQQXFrSnZkWmpJU1dGL2JJcER3a1VuWVdyWWpPQ3JpWlYvbU95?=
 =?utf-8?B?WjlrSE9td2Q5eHk1OFp3WHBuTTRlYkZwaDJDZkw1QzJSQXcvaGR2TTh4UjR2?=
 =?utf-8?B?UnpnUTFHVk1sUjA0ZjM2R2Rid0I3SVhSZ0x5aDRocU51aW9neEhtQjFJNFFS?=
 =?utf-8?Q?u8UEYgZtrV2fd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b02b2d90-5776-479b-b728-08d91bb416e0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 17:24:14.2993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11pKjwOQUQla2QtukkZiiwYRIX+4nPARqQnWDDJlDaFmz7Ta1UiuhSXWFwLboVOCAl7EopP+zhmbyfYKUdtoL9Kjt34NfoM81oT06XkrlqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
X-Proofpoint-GUID: aRC4nJh834E3Fvia_G8PlXEg9sVoUpmb
X-Proofpoint-ORIG-GUID: aRC4nJh834E3Fvia_G8PlXEg9sVoUpmb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-20_04:2021-05-20,2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200109
Content-Type: multipart/alternative;
 boundary="------------B003BA34ECC0722DDC81F60E"
Content-Language: en-US

--------------B003BA34ECC0722DDC81F60E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-05-20 1:22 p.m., Trevor Gamblin wrote:
> - Add python3-json and python3-pytest to ptest RDEPENDS
> - Correct test file path from tests/https://urldefense.com/v3/__http://tests.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr2M1_LI_A$  to tests/https://urldefense.com/v3/__http://test_ujson.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr27k1QvnQ$  in
>    run-ptest
Going to reword to fix this ugliness...
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-ujson/run-ptest | 2 +-
>   meta-python/recipes-devtools/python/https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$   | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ujson/run-ptest b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
> index 1b3914647..b1539453a 100644
> --- a/meta-python/recipes-devtools/python/python3-ujson/run-ptest
> +++ b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
> @@ -1,3 +1,3 @@
>   #!/bin/sh
>   
> -python3 tests/https://urldefense.com/v3/__http://tests.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr2M1_LI_A$
> +python3 tests/https://urldefense.com/v3/__http://test_ujson.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr27k1QvnQ$
> diff --git a/meta-python/recipes-devtools/python/https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$  b/meta-python/recipes-devtools/python/https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$
> index d79206fe6..43f286d16 100644
> --- a/meta-python/recipes-devtools/python/https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$
> +++ b/meta-python/recipes-devtools/python/https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$
> @@ -20,6 +20,8 @@ RDEPENDS_${PN} += "\
>   "
>   
>   RDEPENDS_${PN}-ptest += " \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-pytest \
>       ${PYTHON_PN}-pytz \
>   "
>   
>
> 
>

--------------B003BA34ECC0722DDC81F60E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-05-20 1:22 p.m., Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1680D62BB5234677.10489@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">- Add python3-json and python3-pytest to ptest RDEPENDS
- Correct test file path from tests/<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__http://tests.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr2M1_LI_A$">https://urldefense.com/v3/__http://tests.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr2M1_LI_A$</a>  to tests/<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__http://test_ujson.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr27k1QvnQ$">https://urldefense.com/v3/__http://test_ujson.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr27k1QvnQ$</a>  in
  run-ptest</pre>
    </blockquote>
    Going to reword to fix this ugliness...<br>
    <blockquote type="cite" cite="mid:1680D62BB5234677.10489@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
---
 meta-python/recipes-devtools/python/python3-ujson/run-ptest | 2 +-
 meta-python/recipes-devtools/python/<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$">https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$</a>   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ujson/run-ptest b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
index 1b3914647..b1539453a 100644
--- a/meta-python/recipes-devtools/python/python3-ujson/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python3 tests/<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__http://tests.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr2M1_LI_A$">https://urldefense.com/v3/__http://tests.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr2M1_LI_A$</a> 
+python3 tests/<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__http://test_ujson.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr27k1QvnQ$">https://urldefense.com/v3/__http://test_ujson.py__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr27k1QvnQ$</a> 
diff --git a/meta-python/recipes-devtools/python/<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$">https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$</a>  b/meta-python/recipes-devtools/python/<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$">https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$</a> 
index d79206fe6..43f286d16 100644
--- a/meta-python/recipes-devtools/python/<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$">https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$</a> 
+++ b/meta-python/recipes-devtools/python/<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$">https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!I6Uvf8dLizvkzD7FmeBcSZtFlL32HSOz5O2PA5IchaAEnuDf12dLNR8s7pd8Pr11OjYnng$</a> 
@@ -20,6 +20,8 @@ RDEPENDS_${PN} += &quot;\
 &quot;
 
 RDEPENDS_${PN}-ptest += &quot; \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-pytz \
 &quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B003BA34ECC0722DDC81F60E--
