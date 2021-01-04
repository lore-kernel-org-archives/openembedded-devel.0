Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.49])
 by mx.groups.io with SMTP id smtpd.web09.14926.1609774331153941908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ipyebl14;
 spf=pass (domain: windriver.com, ip: 40.107.94.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJX7K5mhEn+FylBjQ/onzwvrkFWl5AujJDudLBBGihIS803DqhF0WQSW9bmCwtJxuB2mloTYYoku5wsU60XxefHnSzpKLt0TFv0kpixwg7P2axWtNKQ6DBSpq6rk67fpcqnG7K+OAaajq9+uRV+viSFL5G79IhzkRhdwLi2LVcLULSNu1YADs+ls6B7Zi+AzDq78FO0uVBRsYaPhm4JGxN1uTwI8IxJ1CkYewBcsOgNx2bLxoCHrFhsZqVAHgqu3m2th92YKi68JsKLu6QH8sU6iEbGPg4bPmxF+d0LjtgqVfzwXeVEMqvh+ozWyaxy3IxVPOFewAqoAe6CHonJ8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbQSNBLYMP5k66yabDnX+//ByKS08bAx9JJYL/SZqDQ=;
 b=hVZYrKc6XXd8UWNWKiNZZQjduU/APwnd0VEgRhB83/qWVQ2Xrptx0TWoG+I0v8Sl7Qut4yy+BXRJT0mzNjHZy/uYFZXOeRtBFiCfU72LsuUr5YeZeCAUZ9bRgZl/nDI34Q5F+snMdXhEGaHD4j6AuDi9VAWGX/tNt3If3vgAKsBCPyItJ35cxt6KIrNmu9SLoCkQZs/QaeJnKXXvWbqPRU/mm5eutjizFaZ40YAeyZORe8+5UlZ9/hYvmmZb6/XIA+Qjq9N0968J6Ubs2QgCrXg7tyTAqrkmru7VXL9qA5kwVOps/TnX+b+G05jw8Zd2g5Qtb1vPXJZoaXv+ChAKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbQSNBLYMP5k66yabDnX+//ByKS08bAx9JJYL/SZqDQ=;
 b=Ipyebl14zB5JtWlR4Ors2W21JEm+2QahHI3YeuD8zhHMSGSP012DjV5GvqCIkax1s99DCfMOvx1BB7UMvGtSGBhaSPzUfKacm3aBLr3IrujOi+i6tdZciLlffQLfwmA4eMHcrG8xGd73r/seUkW/kv+Z1tz/IayOtsfOh/yJ048=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 15:32:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 15:32:10 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-bandit: upgrade 1.6.2 -> 1.7.0
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1608613364-66959-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4e3f54f4-1b96-9b7b-e60b-951e8675f48d@windriver.com>
Date: Mon, 4 Jan 2021 10:32:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1608613364-66959-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0428.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0428.namprd13.prod.outlook.com (2603:10b6:208:2c3::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend Transport; Mon, 4 Jan 2021 15:32:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ed8a100-b1b5-4ab9-5f7c-08d8b0c5e700
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50534C490BFED4AC4BB2324C9FD20@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4VIPs65Hv7B0P3FoG9i2OBNalSsXBst9O5u0QT4KNF8wq++w/6HfLN9mi12hOAo60+ID6b9s6+/OhuEQU15N0PAjwaK0Kb6O3OpQ9z8MKEFSYtTBLKASAWwMEmRZPtrjTyKei/u4jlwdNN0M5gsHYTw9e78YHD3ex3HfGNqEpTe1B/bXrTGFNN0Hga9fw1UDRt2dpFbJVggMXGEUciSK8W2IEzg9mzOI94IpDCMQOWirtP4umoVT+0ZL54ODWt99i0L1UK3VjSgM2yTtv247ugyINVJproN3y/vMAVkJhAA/+76lCO6HbaOJwIWOlFcjf1T646vFWRX+89Xni2OlFiJvGcdI/HxCo+RUPaGXW+Skd5jR0t8DLyv552xIHiwv06wRQ/NJG7fWTawwO9AVvEQ9/xj0chj7S3nyUpkslHecPGqdlxwu7fIqo39BBF/Pkc+52mwXWVCpE/1VSJsmeJpCSwQAMcXvoVtU5Jx9zkDN1zg9hS4REOudYgIL3jmA1hyPX2nNVRRBJ/r9h7vCRsteBz+BxCfcwdk6cNJvGc0ICreyhvJChZ/sG3a8qjTg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(66556008)(52116002)(2616005)(478600001)(53546011)(166002)(66946007)(36756003)(966005)(66476007)(26005)(31696002)(6486002)(4001150100001)(16526019)(2906002)(956004)(186003)(5660300002)(86362001)(8676002)(33964004)(83380400001)(44832011)(16576012)(8936002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NUNGaVNqQnBqZnhmenJ4eTBPdVQweldzY0xCT1JXSHozaGxPT0N2YTZBbis3?=
 =?utf-8?B?b2R5cWZQNFgxcnMzOGtORGJycEQzY3RJQzR0QSs1bHFIM09yVmllL0dJWVNQ?=
 =?utf-8?B?ZTNZSWYvTEViL2FIOC9MTXF5YUJmWDFoeE5XL1NHOVphWE5oYVkreDUza2xT?=
 =?utf-8?B?ZWptcktxZll1L05zb1dPL0RRVTZaeWNCb3lmQnNpWnU2d2orSE5EblAyZTlM?=
 =?utf-8?B?bkh3SU0xYm5PR1h0Z1BxdVFoRE9SMzVWTWhMbUtLVlBiOTlWWkxNQU9ZUHd2?=
 =?utf-8?B?RHFYbDdzdW1Ka0xSemVsZmc5SEllMFluNDNUa2ROWTRjUnQwRVRzMDZsbGJl?=
 =?utf-8?B?OGMvRGQycUFVM1cyMUwvdjB1Vldmc3VlSVR5b0lURC95aEZtc2gxK0RZb3RT?=
 =?utf-8?B?d1VwcmpLc05YZHF3YzN5NnBLOWZIZEsrUFpoanBDVVQ0RFFTVHl4NUluZjNo?=
 =?utf-8?B?bkYxQVJGZ3paM3J2YXpkSElBK2FzSHovdmRYaXlHMXIzVTlQQjdYbjBXNzVH?=
 =?utf-8?B?bEtDVDU3WkhCSjJlZUdQVEdjMkVBM1R5QUxaeG9MdHBpbXIvSDlxNmdjK2hH?=
 =?utf-8?B?NVhsMjdWcUcxMUpLaW5mY0c0WFRvQVBOaExmWFR3Yk9xNExOa0JXNnZ0a3JO?=
 =?utf-8?B?bHc4cytuV054Q3FFUUc0ZWdVTThwZ2p0TXlISEFxUmF6Vk02ZHhXMzYzL2Zv?=
 =?utf-8?B?VGVPdk1kQVphc2I2dDM1Mmc0S0RyUGp5ZmpwNHFkUDV1NVNReXFuSndVYWlZ?=
 =?utf-8?B?emk5aXNGV2lVWXJvWU5PQVBjNU1Obm5nR1hBdHliNU9FUXRmTUpBSEl5TXZU?=
 =?utf-8?B?djl6RXd5YjRCOHZESWxkOEZKa1llcktlNXFuaDdDTWxGc0ZCdFVUUFUvUENY?=
 =?utf-8?B?cXV1WUt3Vm9HUVhvb1gvbGVxdHV4cjY3WThDTTNMb0RiVVZSTGJyUGdIYm1m?=
 =?utf-8?B?WFpTYk5pM2FpZ1htZytMZFM4SnZucE1HM1VFRVdsTUtML2VBa3BncVBWRG85?=
 =?utf-8?B?QjY1UEZWYTNpUkZIYzkraFVEbDA1Ym45Mk9mNEdpeTJGeW1OMG8xUHNPb2Vr?=
 =?utf-8?B?KzBGQ1cwWi9CWjZxdSsyK1d1Z2lJajc1OThTT241SU1LMzJHdWlJU0hBdHpu?=
 =?utf-8?B?YTlKMk5VQ01HdnZVZDk2dEt5REZZOEM0Tm0vUTF0ekc3a3BTaWljK2FKRWFS?=
 =?utf-8?B?NUVrTEx5TUpIK0pHN0xNZmEwclNkTFdPaEVVQUcxdloxNS9LaE8zaStzT0Zx?=
 =?utf-8?B?V1J2ZHFqQ1d0YVRyVUNsVnFuRm5pS2xjVmpkQzdZQW9qQUs0WFlmR2NPNFJz?=
 =?utf-8?Q?4+geTQAIDfSLqlwkaK79uv76i+zxv4h2Y9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:32:10.2562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed8a100-b1b5-4ab9-5f7c-08d8b0c5e700
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQJzXGXiqOfYBymn31LubvieBDPlIc3MTMhE+JVHL7AdS/eVrs+LpWUauCrXSiWXVNPLQrO/XZdUL2QJ3YaP2IS4fFN0VtL+j9Q5SY17dxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: multipart/alternative;
 boundary="------------83D02045390DE267DD4C17A4"
Content-Language: en-US

--------------83D02045390DE267DD4C17A4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-22 12:02 a.m., zangrc wrote:
> CHANGES
> =======
>
> 1.7.0
> -----
>
> * Create CODEOWNERS (#661)
> * Remove blacklist call to input() (#662)
> * Give some tips on how to resolve B101 in the doc (#616)
> * Remove universal support on the wheel (#655)
> * Update pythonpackage.yml
>
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-bandit_1.6.2.bb => python3-bandit_1.7.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-bandit_1.6.2.bb => python3-bandit_1.7.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb
> rename to meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb
> index fa28861e9..2ef956e07 100644
> --- a/meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb
> @@ -2,8 +2,8 @@ SUMMARY = "Security oriented static analyser for python code."
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>   
> -SRC_URI[md5sum] = "c6a6772d7afa0af8828b3384e73b7085"
> -SRC_URI[sha256sum] = "41e75315853507aa145d62a78a2a6c5e3240fe14ee7c601459d0df9418196065"
> +SRC_URI[md5sum] = "24965f102dc62129d3fafe4fe596a3b8"
> +SRC_URI[sha256sum] = "8a4c7415254d75df8ff3c3b15cfe9042ecee628a1e40b44c15a98890fbfc2608"
>   
>   DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
>   
>
> 
>

--------------83D02045390DE267DD4C17A4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-22 12:02 a.m., zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1608613364-66959-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">CHANGES
=======

1.7.0
-----

* Create CODEOWNERS (#661)
* Remove blacklist call to input() (#662)
* Give some tips on how to resolve B101 in the doc (#616)
* Remove universal support on the wheel (#655)
* Update pythonpackage.yml


Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1608613364-66959-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-bandit_1.6.2.bb =&gt; python3-bandit_1.7.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.6.2.bb =&gt; python3-bandit_1.7.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb
index fa28861e9..2ef956e07 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb
@@ -2,8 +2,8 @@ SUMMARY = &quot;Security oriented static analyser for python code.&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2">&quot;file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2&quot;</a>
 
-SRC_URI[md5sum] = &quot;c6a6772d7afa0af8828b3384e73b7085&quot;
-SRC_URI[sha256sum] = &quot;41e75315853507aa145d62a78a2a6c5e3240fe14ee7c601459d0df9418196065&quot;
+SRC_URI[md5sum] = &quot;24965f102dc62129d3fafe4fe596a3b8&quot;
+SRC_URI[sha256sum] = &quot;8a4c7415254d75df8ff3c3b15cfe9042ecee628a1e40b44c15a98890fbfc2608&quot;
 
 DEPENDS = &quot;python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------83D02045390DE267DD4C17A4--
