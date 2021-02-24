Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.54])
 by mx.groups.io with SMTP id smtpd.web09.7803.1614177731369658622
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bqoV0uk5;
 spf=pass (domain: windriver.com, ip: 40.107.236.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFrsdzZng83MbyMslVA9Lp3lzeuRtxI/qkQ+tognpP2drTZe1KYd6f8FjkAC4pgNPFzTvlwONa6UujQ3YcJaQXEYvHKdz42otyMFZvD/n8fMnVFtyX00/usYabiqw/owhJSKE0NCHhNO0f428rJ9L1CjDvti9MlII20GGzKe/Si+gIEcSsEvVCJj2OGh87On1bjKKDNAtBXiRZTf/AneKTzc2hsfVmPWAhdOF9lVLsbf/PFvOKPkN1Nnyct1WGA12drjd5r/Kqjh+pYnN25DO33pJhEZRyi2BX+sz89LxDfxoJk7oMjB7X9dH04TQq+pua+2IppUf9a2NZgmGunREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZUhpnhBUxk5nnZ02Cxb7nuQSvF1onV/gI4/3A0TZvA=;
 b=ne18RyQqvDHG5XJxUFGKZ4pET8/hvJB7a1OV7Hvo0QwliFp496feDxUT7EnMDoG4R1bTIrzTdCm8+Zt4PP9D25e98qXgguv3ZE02sraBCvfdajk1kk32L1/kYqaO2/8XmEibYIGx2xsP3wlFNsVg3Yeeyq/Zz1YFKI4+wYe+M9Crg6sIJFyQc8YFlZNeC+AknijkHyaiOPGOuNNjc8y35Yql1yg8Kotx2BY7gZgIRYDtBhOf39KkdYEMy0nzzktrJYF/c4ad6b3kZPiDJPtDNhFcmUqzrtpiviNAg1tgzUOW8mF/w+rekF8jMkTeLW3bi2eH3NFauCmDHAPzh7xIJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZUhpnhBUxk5nnZ02Cxb7nuQSvF1onV/gI4/3A0TZvA=;
 b=bqoV0uk55oAQfeISKdcAeG9pCn5DlOEY/QYgOP0d12zDElB873xR2C9zrRvJDKW17du69IzLbvoS2yygcaIy7YJsO0VFpP1AQL++c8BgHKOBLwApIaXoWugHpnpyz9WOh2jDsssjC9KoDIoj+7NvhlMQxdh3dTO1SG0unx63wBU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 24 Feb
 2021 14:42:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:42:10 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-mypy: Upgrade 0.800 -> 0.812
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
 <20210223152219.32129-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fcda7d25-3963-9c92-b498-f0dbede600fa@windriver.com>
Date: Wed, 24 Feb 2021 09:42:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210223152219.32129-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:208:23b::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR11CA0022.namprd11.prod.outlook.com (2603:10b6:208:23b::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 14:42:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3196724-72f3-492f-32e3-08d8d8d25da6
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4829:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4829D8DB32841DA06EB680DC9F9F9@SJ0PR11MB4829.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G0Xg19rXbJA2lw06PNR58wJ435J0uTV4v4P1WL6jrBGz2S0CiUvgHFqQ99lPR4OXm1OWlf+BEQhzxtIV4ghwtaS4uiiimGd0yf3uNroEXcz0Bix6k+kbbtMz+te3ZRB0qxYneL5vkdzCRDdMif4xeobZ/7ngepBuconV2GUZw+dUAdaNXdVBYPnS2re+jrVKczvbILNqKF9aOk72pH8UQVRbP6DdkPju88BNwITa6Q346eYDyx2mIHvmcv1sOlmO51LLfIhLOb72YNsaqK2x62i8fkfZn2n2lIp26bLJBAIVXPctZy8nKUQ+gU43rHUgaFkteTW0rYApT3P6fDi9f9FCBnDUw6unA1ygZ0dzDTzG0X+Nw8x0Se0csLCmLIzGZrdA8doAyfziXNTVjGlbpit45Dm5SguEYdR+8Qd+JKXgTeSE/kcUJPDrbDYCMYye/93x1MxUWEcaPsaMKiYvX/Z40vlrV+Zh4yUdCN5pNmkaY/TeqYusSWn6UxlY0rv8Nm6wOOy+MMIwVIccQ51zOWedNBnBLN46GzEwG/unjR23GnxZRlAT5QR7GEpnE5otzbFsTsGVWj1UsIBZpq8P1AfcGY3ogySJT6Ry4D4FmzNON7FtNAXV5jC9P22/UIns1DWPqvBaBqQy/AXUECni3u3T7CXOB9J0oWFZK753gF+hFBXlUUig9A5hGDbuZTvd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39830400003)(6486002)(86362001)(478600001)(186003)(44832011)(31696002)(16526019)(316002)(16576012)(66556008)(966005)(83380400001)(66946007)(2906002)(8676002)(66476007)(2616005)(26005)(31686004)(166002)(53546011)(5660300002)(33964004)(956004)(8936002)(6666004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?M0dyQlBDUDRLUjY5aUtOWEF4Y0FrSldhSVJ5K2RkWlgzcTlJa05RRmEwbXlx?=
 =?utf-8?B?UHNXMktGaEhVYUtBeXlhaDBoLzUyZjF0RVl1dXZzcFd0K1Uzbjh5V2tWc3dQ?=
 =?utf-8?B?VDVJTmsrcHJYZnZHSHltRVlqNVB2aVdmNDBvTktRaWQwL3hzMjVTaEEzSXlp?=
 =?utf-8?B?andLYWs3N2lpd1RvSDlaSnNHdXFaY3MrSFEvRGFaUkZTbU5RdmE3anY0TjdT?=
 =?utf-8?B?RTZhODdldzAvNk14Tmx0VGVVZ3NXMWhCa2FrS1VwcXFpOEs5eFp1OGgvb3Fl?=
 =?utf-8?B?a2RNZ0NPRzZEL2dHUHM5T1VvVkxMMnRoZlBBUE1CR09TeVBFY3RhdC9ENjFo?=
 =?utf-8?B?WnhHTFRqQk9oVFVaS2VWVXBBdkY3YTZsdVVYdUVCdzVsZFQ5L3diYit0UXpz?=
 =?utf-8?B?Y3RxVEtMOUQreGs4Zml0UEpFR1A2aXhpdXkxTVhSc2dGRVBOUGlNblJ5dks5?=
 =?utf-8?B?T0dXWDdlUm8vOWdaQ3ZmNkZpbVhQMElCRnRnNDNBOU9oSmx1OGF5ck02M2FJ?=
 =?utf-8?B?SXlzaEE4dDdUZjF4dDllbGVMM3FIQmxveW9nZ3NCeGNMTFZtU1lweDBXS1Qr?=
 =?utf-8?B?QUoxWE1uam9TcjNnMzVsQU85RDVCQVdtRWtPSGMxdWtNanFwMmtNSVRwSWdO?=
 =?utf-8?B?bEczR0JLS3FPd2g0NEVyRkErTFR3eDh6VTU4RnI0S2ZtWFBKTXVWUnlBay9G?=
 =?utf-8?B?d1lMMWxoMExiYTRDUUMreEZER0FNb2lNQVRwUG10RHJiTjd1b0c1R0Ricll0?=
 =?utf-8?B?bTlxS1ZYRzZ6WW1YSDB6L0E3NE1RbCs5YWVzeklEY01BaHlJb3U0N0pLcUJ3?=
 =?utf-8?B?VUE5YS9MZU1lc1oyS0NWVHEvSDJEUWlxRkt0WlJjenFMRXlnZkk4d1VRazZv?=
 =?utf-8?B?VEJpZSt6TEFCa3Q2NDhyZGlHUTNUVFVrS1VzdEhBOUw2MEU3VUFma2dibVpP?=
 =?utf-8?B?U2FYOVNlRTZYZ0F2UUZjSmtQbFpGWjdvczFlQ0R0SVBFeXY1Y2lVV29UcExN?=
 =?utf-8?B?RDlrWWZ0SXBNdG5JcWxGbjl6Q0RiZXc5S0U3V0h6MEcvSUJ1RWJHK0RROWNw?=
 =?utf-8?B?UUNwYUt6WDIreGYrSWZWTjhyKzV6STBaVXEwWGx0YzBoMW54MEpTRFdRbFRi?=
 =?utf-8?B?YXJWSXFRZXpSVmJQYkY4RHBVNEZ3WWFnTVRkbnR2TDhWaWM1WkJVZUMyZThY?=
 =?utf-8?B?SDNlQzVyM1RLUWJlMDZqY1lKUzNQM3BxVkxmNFZmaWRGNmlTNWtQZ090NjB6?=
 =?utf-8?B?aVp2LzhFRXBsTlZ6Q1orS2lDdTVyTkRaRjY5cjE0OVRTbDQ0NGFuTnlhL1BC?=
 =?utf-8?B?MTJVNWJlMjJXUm9MdnJYNWxEU0Y0UnYvWWJ4eWN6aFd0ZStLVzRxVkNWWm1C?=
 =?utf-8?B?QnhRdHRpbno4VUlYQmdmTll6dHdsTlhXTXZaa3FiWnVUZnZKYnd3cUxvSHgx?=
 =?utf-8?B?WksvVUJXa3Z3Q3RMTys4eHc3RHlJQldpc2VnYnVUd3ZXTUJ3azZJem1yNkRp?=
 =?utf-8?B?S25jV01haTFIZHFuNVJUOTVBZTBQeXAxamo4N0xqeWhtOWN3Y2RoOEFMQ3V1?=
 =?utf-8?B?V0x1bVlXS1lkQWRPcG1xeU5MdUJpaHhxQTF3UTNvUjIrTmxXeVBEMHpySlg2?=
 =?utf-8?B?QSswMFJreG8yYWRDWmJXVUtxYms2d0ovVkJLNTU3bi9tMHNpTUlLK0Vnb3h5?=
 =?utf-8?B?c2g4R3NURWdjaHp2MEZLU0plTTF6Y3hMSCsvVWpFWjkvRVBKVGtoelh6eWd3?=
 =?utf-8?Q?KknEyq1MQ/5LTRNyMkaYkskdCDBIUXyf+lTJ8rl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3196724-72f3-492f-32e3-08d8d8d25da6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:42:10.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmgj4b88xvqKLGKWH7xzOm0Rerhmr7c0lD79FCIlPgbd7b7pLYuuDVPv9ID7Pt/3h0Ljkt7MwnRNErJpmEGbzHUMfuyAatt4S7Lyt0Gu3Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
Content-Type: multipart/alternative;
 boundary="------------285BD407B126B040DF28FBED"
Content-Language: en-US

--------------285BD407B126B040DF28FBED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-23 10:22 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.812:
>
> - Improved source file finding
> - Excluding paths
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-mypy_0.800.bb => python3-mypy_0.812.bb}     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-mypy_0.800.bb => python3-mypy_0.812.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.800.bb b/meta-python/recipes-devtools/python/python3-mypy_0.812.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-mypy_0.800.bb
> rename to meta-python/recipes-devtools/python/python3-mypy_0.812.bb
> index 0d019dfe1a..8faab60b97 100644
> --- a/meta-python/recipes-devtools/python/python3-mypy_0.800.bb
> +++ b/meta-python/recipes-devtools/python/python3-mypy_0.812.bb
> @@ -13,6 +13,6 @@ PYPI_PACKAGE = "mypy"
>
>   inherit pypi setuptools3
>
> -SRC_URI[sha256sum] = "e0202e37756ed09daf4b0ba64ad2c245d357659e014c3f51d8cd0681ba66940a"
> +SRC_URI[sha256sum] = "cd07039aa5df222037005b08fbbfd69b3ab0b0bd7a07d7906de75ae52c4e3119"
>
>   BBCLASSEXTEND = "native"
> --
> 2.17.1
>
>
> 
>

--------------285BD407B126B040DF28FBED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-23 10:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210223152219.32129-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.812:

- Improved source file finding
- Excluding paths

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210223152219.32129-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-mypy_0.800.bb =&gt; python3-mypy_0.812.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_0.800.bb =&gt; python3-mypy_0.812.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.800.bb b/meta-python/recipes-devtools/python/python3-mypy_0.812.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-mypy_0.800.bb
rename to meta-python/recipes-devtools/python/python3-mypy_0.812.bb
index 0d019dfe1a..8faab60b97 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.800.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.812.bb
@@ -13,6 +13,6 @@ PYPI_PACKAGE = &quot;mypy&quot;

 inherit pypi setuptools3

-SRC_URI[sha256sum] = &quot;e0202e37756ed09daf4b0ba64ad2c245d357659e014c3f51d8cd0681ba66940a&quot;
+SRC_URI[sha256sum] = &quot;cd07039aa5df222037005b08fbbfd69b3ab0b0bd7a07d7906de75ae52c4e3119&quot;

 BBCLASSEXTEND = &quot;native&quot;
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------285BD407B126B040DF28FBED--
