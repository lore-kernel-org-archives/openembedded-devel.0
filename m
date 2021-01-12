Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.76])
 by mx.groups.io with SMTP id smtpd.web09.11313.1610467776997505180
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eXiolBjV;
 spf=pass (domain: windriver.com, ip: 40.107.243.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXaJIMNpsjq/k0XLQkolHeH8zw5j2clot4aC3AG574ywSqwtjE+AUSQWkfLxJKhsouuHpCtphcwo05If9eFH6wS8vhgkzIccD8hzvxOwFFlAJ1LSin0CKAK2/EAKBpx/UOxMEumdpayfUMSS7G+HI0+Edl8Ne0jagBXunXnlPouMJFICjhrD4f/2fC8mES1PTU+YhaeKnwfufZWRsWuwNZqXYBRZ9XQY6Ytm8L2YHZy0WUFOukKnNj8JNXAcHcUuxa33gZGS4CDoiaMjZuFAsZkSVCRn89Zqb+1VudDm+7/Qt2QUSsDOkVN2l9medhfF7zbmtT7kZth/dG+xlP8q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07QeH6VMUQrQGs48YN4mTpEARQd4XCpUa/czYRCR0Iw=;
 b=e1m0elI2b+6rnw0suS89fw2ycxeHS7vKSa6wAVDmrG8SOJx5agjxQhRNnw0eTtQmHAzfGukbbMyZ9QbUZBz4QmDJSEZTmrlZpRRCLeAimFeORBJH0j0mZn4zxZQOy2R5Rii2pzGgkGWRReQFY4rKdSj+TeRCtNnS7EhA2Rb4A+qOeTWMEJvM+PYqkC2mRUYuLiuXISu14Jd6g3ZPcC5R8GbOAHSS+QrnCmsQ8zBA64tsT4OAgW3T+vfT6Yrg7fScP1d+GcniEN3LrGjQUQcM9smUQIBF1tUA8lCjbc00fpadZFVDMlX3lCuzQPynImh1PiBerm0AKWV4vi3SABSDyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07QeH6VMUQrQGs48YN4mTpEARQd4XCpUa/czYRCR0Iw=;
 b=eXiolBjVaTz2q4jqOzfia8EHXouT1mdDUX70jNQ000zp3l7BjNZwL13sbLLbN3cI3YV/jq7r+YOkW0ezgSOPryc7fHPT/kjscxoOmnv3X5hAORbHqE+EQuU8kPPHdIqcSUXmoHYlVOKtq37LINoNWlbdtBHldslvd2HDjSdMiDw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 16:09:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:09:34 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-jsonrpcserver: Upgrade 4.1.3 -> 4.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210108102814.9560-1-leon.anavi@konsulko.com>
 <20210108102814.9560-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <680e4076-e035-a401-173f-389d01825d36@windriver.com>
Date: Tue, 12 Jan 2021 11:09:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210108102814.9560-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:208:23a::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:23a::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 16:09:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60088d29-23ca-47da-caf6-08d8b7147431
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2807A9FD323354FB2EEF18B89FAA0@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6lghPFZGQxTJdJ34SXvTkd+3jq3JsBBae8WLPaonNew/PXAITUtkBHPe479kxReA+l9JoRuH693d8fq3f5f4mu1oiAU9YcynyXe5zZaTNJZlykV96aKg2j+TMihtjXGQyPU9sO8OgbgDL7e96Rs4TOuMrKUKDD+Jbn58Sg66Ql9aEzlQ7jyucKTjpLZYy65ZTb+3q3EMByEPFuHRO7wHpzYQllurWs8+SJcYbJiSg89KY/lldV3M8BGE3e093HMgFFgb0UCMVDUAL6bod/eMQV++8t/d5rvL7W/72VE4dzsjVDUycqdTCAEVyRVkEPXqLti75dQJSf5SDlogMPTHfM27loQqrENMrRzmTmuxiXwdqwaRKX0UedR0ktBtj46uGdTQLDJC+d751xBM2RXKrsDkfRuI3c1MFPiHDm1uFEj+nZ1CEywRb0CT77OduaScdHI7zfzmtYUvpsioH+D98FZ8GYoPA9fuo6ew3S+V2Q+AU0T0t+72g0AjlCH0zthSnrQLYLWOsZwxgXs2dCr6vXbrmM5XhAeNRjOZBQS0Dd5m/X3ZiK6eg8p8a85kWMb2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39840400004)(396003)(376002)(366004)(86362001)(31696002)(166002)(26005)(31686004)(5660300002)(44832011)(36756003)(53546011)(66476007)(478600001)(33964004)(16526019)(66946007)(83380400001)(6486002)(66556008)(16576012)(316002)(966005)(8676002)(2616005)(8936002)(2906002)(52116002)(956004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?akRNcmhIVklvalhMZnAwVzhXTWE0NDVkeXcrZEZFUGUwQTJyWDAwVHVKQWhz?=
 =?utf-8?B?YlFHZ09IcUVCazg3TkNuNVlCVk05aTVWdDUwcDZZQTlHV3QxbG1KWHRKRE01?=
 =?utf-8?B?UEJzMjI3ekFHd3hTRTA5LzZSaDl2YzcycG9YUzIxTFRINnhYY2g5cmNnRm16?=
 =?utf-8?B?d2tJUHVWR3FOcEVsaDBVMmFmOWc0TjJOZFhLMDNua3UwYTV0VFZBelkwUUJG?=
 =?utf-8?B?UjEvcDl6a2hscEZ3MENEMmx3bll0MERSSGYyOFA5QWtiSWM0OHhBU2NnUk9F?=
 =?utf-8?B?M1Jnb0luNFo2VkJ2S1lTanljMitBamRQNWdZS1B6ckVzMnAyN1lHbkszamI1?=
 =?utf-8?B?dEh0bjI4b1F5WXUyTU53VkFXbzhyd3IyZHh5d05sQTdXWlRnUStaM24vTkpM?=
 =?utf-8?B?T0ZqVEQ2UmFTOWhqSFd2Sm52MDhJOWtFRHhad1BSWmdoSW14bTlGeE55SWRx?=
 =?utf-8?B?UFllVEtnV3JUUityb1hwSWx0b3RjY0N3cHJkQUJoMk4xOHMvMTFheTdublFp?=
 =?utf-8?B?YlBNNzd6Z3VOZnlKSGpZT2tEYnRadzczTVRjVkpzanI1b1dlZTc2N3MwaWY4?=
 =?utf-8?B?czlrQmZsRkhPQ0YrRmpjNjAxSm9VQk53TWUzUmFBRW9hZlZFeEplVEZaNGJy?=
 =?utf-8?B?a0sxdnZiMHlDVzhpSjlrVHN4QWZkRmJ2Q1FVQlloeDErOEVFcG1zM1JFODVv?=
 =?utf-8?B?NXpBcEJ2R1I3aVcvcnJVdnVWZ3piL21aNmxIRmdFbGo2aEs1eStldkJJSEF6?=
 =?utf-8?B?VzFrNzlTN29YTGJMMTh1T3FOYzNhU09JUXY4Q3pFSzNDTStlS0paWHA5NEpI?=
 =?utf-8?B?Qk9lSWh5eUNDQm1NRWpFQUw4RVF1ZWkydEhqV2Nwb1A2d1lMSk55Y0NkUzYz?=
 =?utf-8?B?eTRSNUthQ0puN2tic3FOQzZScldaRG1SVERhS0QyK21hWkdLWTBiYzR4dUh4?=
 =?utf-8?B?bkx4Wkd4MERFcEZXNEdrUjk1OVJhWnlGSEZGR2cxRDFRb080RFJIa1d0Y0tM?=
 =?utf-8?B?d01aL3R5b012a1JFL2JXTXdFS21UZk5jd2s2SWk5V1F1MTVqcDVFWnF5Tnp4?=
 =?utf-8?B?V2UwN2dhOEV6OVV5TnJzWXE5QkVNL0VHU2ZIcC9wMnN3SS9Jb1A3UXdiSFpL?=
 =?utf-8?B?Q0IxM1JZMHF2cXYzelBnQXRtZ1lYeFNaaDhSSmtmU3p2YStjRVlmQkR1cjZL?=
 =?utf-8?B?S25OVVd3aWVBMzFsMXRkNjhBVHI0MjlhUXNXUmN0WUZ0OGZCdHVrYWgxSm5D?=
 =?utf-8?B?R1JvdG9zdjVibks2UC90NUM1SXk5L1VyNTJHdXVSQUZ4Nmd2TUtUMUY3NXF3?=
 =?utf-8?Q?Nl06uXXFXZ6njHbMZ3xuuSe6OKZBQOtKgV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:09:34.8614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 60088d29-23ca-47da-caf6-08d8b7147431
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTrpJwG8I16Uxr8Cn1M0uCDxs3A4JVjodgQ+XpAkjvoNvrLFpNhi5RTZ3Uh1+XhEUlw0ucLhFtkKOjmaaTVsYCnn377eXr7aLm7pphZu9xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------359BD3238D04A76672B3EA7F"
Content-Language: en-US

--------------359BD3238D04A76672B3EA7F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-08 5:28 a.m., Leon Anavi wrote:
> - Add ability to use custom serializer and deserializer
> - Add ability to use custom method name
> - Deny additional parameters in json-rpc request
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...3-jsonrpcserver_4.1.3.bb => python3-jsonrpcserver_4.2.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_4.1.3.bb => python3-jsonrpcserver_4.2.0.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
> rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb
> index 75a0926f0..53f01f622 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
>   
> -SRC_URI[md5sum] = "e73b0bd90e99115d3f9e0ac42882c5b7"
> -SRC_URI[sha256sum] = "649680c293facb6ae7c3f5c8028e4623c55195db5216847e9f25f85cba2d443a"
> +SRC_URI[sha256sum] = "0c9e5b9445621138521e912016ae39b3badadd2607140dcbb0c8062934ab4854"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------359BD3238D04A76672B3EA7F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-08 5:28 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210108102814.9560-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add ability to use custom serializer and deserializer
- Add ability to use custom method name
- Deny additional parameters in json-rpc request

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210108102814.9560-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...3-jsonrpcserver_4.1.3.bb =&gt; python3-jsonrpcserver_4.2.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_4.1.3.bb =&gt; python3-jsonrpcserver_4.2.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb
index 75a0926f0..53f01f622 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/bcb/jsonrpcserver">&quot;https://github.com/bcb/jsonrpcserver&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15">&quot;file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15&quot;</a>
 
-SRC_URI[md5sum] = &quot;e73b0bd90e99115d3f9e0ac42882c5b7&quot;
-SRC_URI[sha256sum] = &quot;649680c293facb6ae7c3f5c8028e4623c55195db5216847e9f25f85cba2d443a&quot;
+SRC_URI[sha256sum] = &quot;0c9e5b9445621138521e912016ae39b3badadd2607140dcbb0c8062934ab4854&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------359BD3238D04A76672B3EA7F--
