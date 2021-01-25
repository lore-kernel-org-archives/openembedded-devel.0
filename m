Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.49])
 by mx.groups.io with SMTP id smtpd.web11.35867.1611578598119481817
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZPVwyaeJ;
 spf=pass (domain: windriver.com, ip: 40.107.244.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSqRGK76gxclnInaZf4cS5CgguQoCsI7a8bcu5S0Nj+i/LME6jKGPumqr+6aHTvofk0Xp5G1v+sQXl3fWuM+jbx+XdivO4X5WiBxz7IjrO3AE2TVLHua2gTA11tkvD9aPmteiU2sZfsWYhm+SlqAI08pTvqoa8RH28iFzymTE8Mg52eRSTgpKoGTYZIanJOlPkLzaBxAPHx2UEI2N2Gp3lbrZNIOo9SKyqblyCg73ZrI3mK9sHcZ1kOnoxeLEzF4exI381chs4w2B/o8YSHsViVjcVg42G84SLqOEzaiyEYzVGy6ZdBorZefJya/6+4njT1EQ5G0HHDN3f39cHmRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mx4BEpQBxv/TCUXUb1m5zA0htwcuLOiEDeOPNjYbExg=;
 b=Mj1vyUhJ1suU/CUs+iEIpGNPaF4w09aOQh+jPUBHlefrGfBNdrRXmrEW2hat9+0aVm1MsZz3ANQXTMyTgfE17rLl+tco7BGtj//I1EMYHiw0FBkkJb6YLpqQV+1FqNKnriE4HpIl7jqUYKRN35rDIpJlsLsmdeU8KRpval0V28QejJ2RpIgkD3c/TRKr0IQWOGPhIh2SmOiVOI790t3n3rVmGyrLQTuzRZuPs+IHnWJ92vBqwoPNTNULJga6Rv4+Ws2dMK4wB1nXnndvxQACcV2WfgGk0COS5ckaQryw2TbByL4u0WK94eCBekjBjlAELnn7bviUOG34uKP//PCZvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mx4BEpQBxv/TCUXUb1m5zA0htwcuLOiEDeOPNjYbExg=;
 b=ZPVwyaeJxmw2ZJ47vFusyc3kmDHGTPIBINIOpq+l2jZ0bZmqtalA9Q3oTOjNrsd4CV4BHxB5QyjBGRHCuAXnDaQqmvHqs5KWAEqvOkRHMckybRQ4RsDjmG9OmLcbyDDdYPVp7/NYwSzVQ6faL53lb6PpllFhRjNUrINU830hAXM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3678.namprd11.prod.outlook.com (2603:10b6:208:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Mon, 25 Jan
 2021 12:43:17 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:43:17 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-smbus2: Upgrade 0.4.0 -> 0.4.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210122101126.25982-1-leon.anavi@konsulko.com>
 <20210122101126.25982-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <25bb9ad8-3788-7144-578a-c3109c00b220@windriver.com>
Date: Mon, 25 Jan 2021 07:43:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210122101126.25982-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0443.namprd03.prod.outlook.com
 (2603:10b6:408:113::28) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0443.namprd03.prod.outlook.com (2603:10b6:408:113::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend Transport; Mon, 25 Jan 2021 12:43:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c91b5a3-8d36-4e12-1108-08d8c12ec9b5
X-MS-TrafficTypeDiagnostic: MN2PR11MB3678:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3678485020B2503D2FB0CA4E9FBD9@MN2PR11MB3678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JYFCKZ2t9luvAm/yEMK/9hOIpsNPakDz5akgz9WHeicA61PyWPPayxtKNPORZbvMlcuLXQTXKyGN0L+figK5CzkyyPg0ubNXlNTrG/mybkVhmhUYvFxVFJ15gxKR1u1cOI18BcMWKme4Dhm2Caww9h0bvy5hnLA8hafBHxPBSbFQ0nrsgwGWd+gL6Ym1/7C5csxnWFcxNOIh1wNi0HyVIoOqmG9x1VeMHJ1P4qltON0DP4QlE9XrVHj2FTYyYdNZb7vJUyokhFGz9t3E164Q4rToMrOMUV9dPixQBBpvelb8PY/qFEL60vcHlfZBuV9wQ1omCaGEt4yHO0Mcdm/2H0w5YlTdMWVP5FA3dLOwIRtRoe0r31EQAv/UXza47nHlEwYhrtbjs28nxLNUSr0Tv4iDRAVmxVmt+rbb0A2XGVS/wGXQ0GKZA4vajjb2moI38RFE2jyPiXMZp8Pu8qtYvWOWqFmwLLVh8hw8RroODiQs/iP6Ywf8rdskZ37ZPzM3bfF34ofOef+LqwYp1lma8QEv88q/DdHZqFU2p0RmD2o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39840400004)(346002)(33964004)(2906002)(966005)(478600001)(186003)(316002)(956004)(5660300002)(52116002)(166002)(66556008)(53546011)(66476007)(16526019)(8936002)(36756003)(6486002)(66946007)(26005)(31696002)(44832011)(31686004)(8676002)(86362001)(83380400001)(16576012)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TGY5ZnNSbmV4WnpxKytqSUpDS250eWtSWE5GRHVmYjduMVBlbWxPZFdZOXYw?=
 =?utf-8?B?aG9Fd0ZsNUJwSXQwSUNYeUVDOGY5bmlqMnVpQm9EZGI2WXQ5a2VwWG9vUXp4?=
 =?utf-8?B?WHVkMHh6dmczMjRQWC9ZNitlMDhITUVtenJDSmpuL1dJWWxtT0tjVlZPTVRk?=
 =?utf-8?B?dCtBTHBzU0puZEw3K3ptS3VGSWR4bERuSEFLSENwcEtwYkxOZUtnaVNHZ0hJ?=
 =?utf-8?B?anNDQi9jUldQOFRqVFc5L1MwdklldUpGYklyc0U4WWJaNlJoQ1hYM0pPeTlo?=
 =?utf-8?B?b1NPU3Z5YS94ZW5SQUt2NE9xMEkxMFQrOU1GekxVU3pNamFURWw0bzd5dDFn?=
 =?utf-8?B?ZDlnSGMyUTRCWHF0bFM0Q0lONzFxQ1RKcUdmamhrS3FiZDZsVnE2N1ZWWjkv?=
 =?utf-8?B?dXRLeGxlWW9Lc0RieEFEOFZqcmpVUzJsaXJKcm9MTjBTSnZsREk0cStzNzFh?=
 =?utf-8?B?aWI1MGNxMHRzclNQUHVpZGtqVEhJN3B0YTQrcTFtZzVNNjJ2eHFPZjRZTk13?=
 =?utf-8?B?WFlvdFo3RkwyblJUZnRFekdyYWdWYjhUVXZxY290aExnQjVlTU5POGJ5c2FI?=
 =?utf-8?B?a0xzTEp5cnIrOVQ2Y2hVYW0zZE9yeUM4S3pOd3Y1SEZVQ1RNcVZmZy8vbklJ?=
 =?utf-8?B?ZENBai9Uc0plNVNzTUxIYzBOdUdPOTBpNjZ1Z2Y5cjhZTHhqbU9hYm1HcXBF?=
 =?utf-8?B?dWsvMitWdkJjTk9wUHkvTyt2OFV3ZVloK3NPd0NVdVdRcmVZSnJXTlY0bXJU?=
 =?utf-8?B?YU5BRndiRm9UaVZ5eXBuMlp3SDBIazRVVzJ5aUZ0T0ZkTm1Nd25Sc2tLeGJ6?=
 =?utf-8?B?NjMyMlVpbzZIdkFFc25ROTc1OTlpRmszRjNZTFdOUG9CajB4Yk1DNHc5RGZF?=
 =?utf-8?B?M3cvbEFudklDaHcwS3FWejJGb2R1d04zS3JFWGJEQ0Y3VUNBMC9BKzdoUXpa?=
 =?utf-8?B?Z05lRnNjeG9pZzBwUmR0OEdoMWhaUkVieEJwMmJsaHBmOXV6eG1jdENYV1pI?=
 =?utf-8?B?cWNrUEJobS9IVmphK2VLOXRjYXFsNFVETURZS09CRzJWano4YkNYRGg4b2RM?=
 =?utf-8?B?My9zNnduZEhNNjczZUdKVlk2WFhlaXVkWUhvVWEzeVJFNmFrWUdtNjhTTW05?=
 =?utf-8?B?S3lXU0dwdkZpOHh0NUJoanpWWFhPS0dkN0Rnb0NwR1N6amdzSmhJM1pDK3cz?=
 =?utf-8?B?eXhRTHJBWllnbGJrSXkzYWpTMEZuWjEyNlJ5R2MwZFBTRVdBMVJ2NVEzYmRV?=
 =?utf-8?B?NHdHd0JGOXVJYXIyWlp4WnhaVjJlOEZkdTkwU2g5SXNTUHR5Qk1xU1ViQU9t?=
 =?utf-8?Q?tmqvZOC0xw8wCmDuxqaRea2p1b89V8XsZh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c91b5a3-8d36-4e12-1108-08d8c12ec9b5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:43:17.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqZn8yvjz8/dwZp0DMeUE9IeAFrPM3UVeIJq/L9EAxSpxIpmbLS+L0r8JVcus6HGlqGRiZupeUO1T4flKzqFB9T7KXmVUsIksdHiX0ITTAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3678
Content-Type: multipart/alternative;
 boundary="------------8AAC125210E2128AF27E3B92"
Content-Language: en-US

--------------8AAC125210E2128AF27E3B92
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-22 5:11 a.m., Leon Anavi wrote:
> - SonarCloud quality checks.
> - Tests added to the dist package.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-smbus2_0.4.0.bb => python3-smbus2_0.4.1.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-smbus2_0.4.0.bb => python3-smbus2_0.4.1.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
> index 1f6f61137..fe0b8d1ef 100644
> --- a/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[sha256sum] = "1b5c690715e1efab39e41038147dfba75afc72a10f76b3f0310d783e9f8a83a6"
> +SRC_URI[sha256sum] = "6276eb599b76c4e74372f2582d2282f03b4398f0da16bc996608e4f21557ca9b"
>   
>   CLEANBROKEN = "1"
>   
>
> 
>

--------------8AAC125210E2128AF27E3B92
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-22 5:11 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210122101126.25982-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- SonarCloud quality checks.
- Tests added to the dist package.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210122101126.25982-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-smbus2_0.4.0.bb =&gt; python3-smbus2_0.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smbus2_0.4.0.bb =&gt; python3-smbus2_0.4.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
index 1f6f61137..fe0b8d1ef 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecdainheritpypisetuptools3-SRC_URI[sha256sum]=">&quot;file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = &quot;</a>1b5c690715e1efab39e41038147dfba75afc72a10f76b3f0310d783e9f8a83a6&quot;
+SRC_URI[sha256sum] = &quot;6276eb599b76c4e74372f2582d2282f03b4398f0da16bc996608e4f21557ca9b&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8AAC125210E2128AF27E3B92--
