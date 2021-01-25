Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.51])
 by mx.groups.io with SMTP id smtpd.web09.35468.1611578046253386291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZiL/Q1t+;
 spf=pass (domain: windriver.com, ip: 40.107.220.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EC2vrVddMG0aSpHXEM+4zAOd8Q9rXFUQQ8kt6hS69RSWi9xBXIAaZKaA9KKKOcXDGcicqNzGtm9QK5EaI7c0B7ilIbIDyUCL7jS3eFtqC9JSpeqv+q07yhTxUh/SnsMrPzHngax0YjabIQZV7u0FTgng5qI83GFIVuO5EvfjSzxcTi6TOo/i7aKXDIszYWk6flG9pWQmMbSbYr/8e0u63AjivCZszQQ93OEpPjni4oLVdNcvV7G9UkpyieAoG1Ni8CPsReIOkJ2roK1MbK+QIJGxs45Y/2zxoWomFS6J9yKWUR5NJ+GAFVD/284gHK2xW0K5lYNf5SlWsFu21DprVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIaCir29+xzyO56KwdcImRSqyIKMqZCPHP2Jciird38=;
 b=jl7afu4LSFHwZF6dYZ9tsKenJFeXOQGtbjnxAVLN3kja9APg15dywfcgU2M9BPwpXFB64QDFQrRnSEr38UavN7pYxVibgL7xoDwLBRY0Zbii4ocvg6KPK+k8ixLeDO6YefWo6JkfdmQj8xzwF1NkhA6nXiO7PWYGkVpBIUzSZqsPdEyPZZNXRiuYrjdVk2J5Wn80uqfiW4YoqSvQxi/SfHH/wp91Sy3vVknoJUt+SAnM/YZl/pK4ceJgHV6rulHtSYazxKZ60aUn2sbO8b2Bt3xwfzEM1N57gDWRdALmuLwSR+fRGH2LoRW+R1jnZd1n99z+h4xYhxWM7F/+77L+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIaCir29+xzyO56KwdcImRSqyIKMqZCPHP2Jciird38=;
 b=ZiL/Q1t+63zO0fVpmwwbYu5JBJ1Jcj6FEBMpsABVoeUrYJlmqcg5ZTdwJSK7s693XZMIq8hBsRW+1WCwIY1IhmowsnkULXs4M+x5iJ0Pfg4qEw9JLzK8Pvm32pdeXCkYNH1Yh83Q6O60kqE6LmgwtVzvjp9Ark4ogIgB8GqV2Lc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:34:03 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:34:03 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-google-api-python-client: Upgrade 1.12.5 -> 1.12.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
 <20210120111027.12947-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fa49e474-3c06-e6d3-fccb-f9779d952ea3@windriver.com>
Date: Mon, 25 Jan 2021 07:34:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210120111027.12947-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:408:fc::14) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0069.namprd03.prod.outlook.com (2603:10b6:408:fc::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Mon, 25 Jan 2021 12:34:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f41731d-28df-495c-6d10-08d8c12d7fca
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3984F89130537EE892C9900C9FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s0pen6cF6V/jbzmfCTMXmSDnZ5g2VGQ1y/8lyqdWigp9OsQUG5fiU1LfR/gTq9rpC38d7c0lUGpSEu8xYfGUZ2JGCwsf4U8WtyiBdUr2RP33qEJKpFPHATN11xBmeA+ulEyiJPw7iMGPqPwBhRcjo44gqQ9q7k3/kMIeAyqPvtrGwNlOUY01nYjE6+pcS9Zn4m0Dvu+bFYj00/WCeBK+SbQh/d+Lc+SMPwfXUuJhhmMaEN49+jXowMbEp4W38jcHZUj2jEfyPRxNA6duPG4iTiD1aXB+uZzZ5HYAfobf7K9i2E0FYTL5PVLDDipWY27VnQ18eo7jXTcmgw/81jR+n+e6utqJ7RXVmwRbshVKAr3QdYVk6AHaYnmoFqdpdtlVsbHfLO6vuWMIorlACMdL69H4dVqCU2Uiu7Xw9dwrvtqm7IhKU9Pt3wOD6A2hvn/bP0WQ3Xn+Nx7Jz3qa8G/xardaikMDkilC5Pmdt8lyJkaNvYhK6f5SPpHSVIe2u+A0NvmTTj9B996xxuEwLzzuG3qTTfFnxvY2vWLMuUKTavA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39840400004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(478600001)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(36756003)(8676002)(52116002)(2906002)(316002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZTZuUGJMRFZwZUVmZHF2WTdaS2EzcTRxVGRvanprN2p0ZnZEdVRkTjExOVZv?=
 =?utf-8?B?N3ZXdFVOVjJzaGtFZWdTUWF6bUc0cUd0ZE9od0ZyTG13M29oUlpYd1lQVTJy?=
 =?utf-8?B?OG1jc0lpWTZJaFdzcVp0dFh2cGdhcExQbFNBUEpVNXB6b0owbHBlVjdBb3NM?=
 =?utf-8?B?ZmJYNURxblFTdTh2VHRBRk0vYXFJZ0YrWk13RzVBck5BN1RzWXFYbWd3NUw4?=
 =?utf-8?B?Um0rVWFKM1ZZeDFtdWdhWWZyQ3JXeC9vY3dPZmF2Q21BcTN4Q3d1cFZkMjlk?=
 =?utf-8?B?TzEwWUZyQ2R3aFZYZHRuWGFnNU5qM1RPM0VZYTJmandKUFBTb0huaHpDVHNF?=
 =?utf-8?B?a0R3WExZejBpUyt2RThURHdzRHZxR3VkQ0FJbTZaM3hLSE5NYXRZSldreXZX?=
 =?utf-8?B?aGNOYTV4ak54UjltQ1RDRU9hVFhyQytmejFSeUN4ZTQzNDBudk5zeS9VbGh1?=
 =?utf-8?B?ck90Q3liTzUvR1lpK1R6MVdENjVLaWhSOXkwMHh0dDNRdlBCVzEwNFI0b3Zs?=
 =?utf-8?B?bFJYcnpwcjB3VUo5dm1hK1dITFFxM1BVbGltOWJ6TVczcFQvY3pZZGUwckU4?=
 =?utf-8?B?SE1VM0VRZmlRUDU5b3kzclZpeFlGZG94MDFSRU9ITlFwSHlxSGhaU0h5M0p6?=
 =?utf-8?B?Y0hMT05DTVZXMkRVcm9nMHpFcmRCemNmYnpiajBjQWxxVnhwVWJkSTlGSTly?=
 =?utf-8?B?dkRkOW9CWFp1TG8vWCs4NTRKdTVmSmZCUng4Ym9teVhBNDZDVW40MWQrN2E5?=
 =?utf-8?B?V3R3aTRGMUFENCtlUVlYNk9PMGd1OHNqNU5zUUlsRnFycFBIN3IxTTM0eDk4?=
 =?utf-8?B?N2dGOG1ZWVdFcVdwYWFaVmRZb1RSb3RHc0Q0TW4wWWN4TVNWOTZBUzFoS1Mv?=
 =?utf-8?B?QUVuWHhHM0xBYmpORDlvVnlta2pXdS9lbjlUSWpmcnpiMEl5aDRLNnI5dk12?=
 =?utf-8?B?cnA2ME5IM29xbm9HMXRRbjBxalNPKzkyWXN5c3h4WnlKVEttRWhJZFVZQXhP?=
 =?utf-8?B?eWN3RWQvYU4rV1FTdktKWlNUbW92NHdRWGZvZTNBcXdNV3poZUdhZUpJblRv?=
 =?utf-8?B?MmdnaGVGYkNoQnd3U2ZDNXJBb2k1M3k2TS94elVLNWYxUGpTOWdnaUNjbHo0?=
 =?utf-8?B?RDdEaFFiWmVGaTgxY2ZZYmhYZXB3Q0t3L0ZzQXNGaE9KRk91WVhJbmNLNGIr?=
 =?utf-8?B?czRLWGM1V3RPdnpZbFd2V01TNHdicnQrSkhVNEhtUDhDaEVDLzJSWkc1c3JK?=
 =?utf-8?B?VUxSR0xFU3RkMU1DL0J4UVF4TFdydngzT3V2U0xuNnVldThZZHU4VVdSL2F0?=
 =?utf-8?Q?eyQQwseXFd4Bhxo2Zh3xIVJWNEp/aQH8P1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f41731d-28df-495c-6d10-08d8c12d7fca
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:34:03.6385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfKLxcpZr0XU5fFH/OO15aVv1bmdpfquxNbQdncPxNZsd05jnZ/4cu3C8KDALa7Sbby+b1dKmW0egT+IAfOpx3Hr5LDpKqrE+N5l27dhoTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------D5D41A85052148DF8ED146D1"
Content-Language: en-US

--------------D5D41A85052148DF8ED146D1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-20 6:10 a.m., Leon Anavi wrote:
> - add httplib2 authorization to thread_safety
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...nt_1.12.5.bb => python3-google-api-python-client_1.12.8.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.5.bb => python3-google-api-python-client_1.12.8.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
> rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
> index 87c221241..1774f962e 100644
> --- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
> @@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
>   
> -SRC_URI[md5sum] = "4aee3820666e80944f38c39176193d5c"
> -SRC_URI[sha256sum] = "1892cd490d164e5ec2f2168dc3b4fa0af68f36ca15a88b91bca1826b3d4f2829"
> +SRC_URI[sha256sum] = "f3b9684442eec2cfe9f9bb48e796ef919456b82142c7528c5fd527e5224f08bb"
>   
>   inherit pypi setuptools3
>
> 
>

--------------D5D41A85052148DF8ED146D1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-20 6:10 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210120111027.12947-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- add httplib2 authorization to thread_safety

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210120111027.12947-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...nt_1.12.5.bb =&gt; python3-google-api-python-client_1.12.8.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.5.bb =&gt; python3-google-api-python-client_1.12.8.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
index 87c221241..1774f962e 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
@@ -3,7 +3,6 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/googleapis/google-api-python-client">&quot;https://github.com/googleapis/google-api-python-client&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3">&quot;file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3&quot;</a>
 
-SRC_URI[md5sum] = &quot;4aee3820666e80944f38c39176193d5c&quot;
-SRC_URI[sha256sum] = &quot;1892cd490d164e5ec2f2168dc3b4fa0af68f36ca15a88b91bca1826b3d4f2829&quot;
+SRC_URI[sha256sum] = &quot;f3b9684442eec2cfe9f9bb48e796ef919456b82142c7528c5fd527e5224f08bb&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D5D41A85052148DF8ED146D1--
