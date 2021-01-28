Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.43])
 by mx.groups.io with SMTP id smtpd.web09.24319.1611839214668213798
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KdbeFWHc;
 spf=pass (domain: windriver.com, ip: 40.107.223.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hn4l/Sv3PEZKMGeQcB2GXw3wqqZwAqzDUib/u2o/4LwedFU7bU1TaUdeQoIITB5YOOK7w2fxOkJwTtsTAo0GAMF61kwXRhtdwHLwKkKXnLar3uptfz0boWhRid0mzg5fLsiWdiboI7GTiZ3O4zj+s7u6Kl5qxNDdNIi7ZX60sqhgkhZsrUAO0femR1/E8GUJQC1Ym5q3YlLerq1J6bZg3OL5w/2vvaQrPgntgjCBUlD/TDsTAGLP674W6P9vmmY3ZpSPfMfizgcsex7C5Fy77eToQ6cXzsduP62MQhawPUSMbgD43McfH7sLg7hIafomJson15RQI2VPKesO5lRq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5A95ritAylvaz9L5pCku9s0ZJuzmXuAhBzWg/Enh/9I=;
 b=DVr4hviWabccjuz6N4gp8f3nIptIWNqjXMOWEKvv1n4yyq05tREzleiC1M8b6mve0XlWhwX48m9A5Mm4hjYlAvsKL2uw4f3mlQmuf7ytaqNN82IOYXC6Eq6YETcTgc1wy/oHm33rOxAFqFF9RMrLMrzoVvIN1JsyEpM/RNx7fybq4Yq8J0tErJ51VeYcpwy713MsP2mEMBKL0iXFuUJb+IdVCqgjnkr2u+cahZmIj1hMrYKVga4X2BCYB9yiznG22tVHqW1uJhHxPiyRbaPqN4a73iO09Na0F+awvYCg4SS4UlRl3Irm3OciHDTcXMU8MLjMkmqgyszEZ4VPlxpS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5A95ritAylvaz9L5pCku9s0ZJuzmXuAhBzWg/Enh/9I=;
 b=KdbeFWHcTVfonx6ZHT2KJ8vxHdT6jTMWB4tfzLBx/hdDvQ1R+WYE7rLRVnpOaLSa2Hmzbcji01VE4m3kJvvvbS4T9Cudph0aBYh2OeC1/1dA3vraflWleJuzrw5j7vKrFfalLE88+zXzqDqlY9Y2QBAyol9W+pNyc/K5DxhaH2s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:06:53 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:06:53 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-djangorestframework: upgrade 3.12.1 -> 3.12.2
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1611623608-94159-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <03473afb-d298-a50b-7387-6ee449b3a54d@windriver.com>
Date: Thu, 28 Jan 2021 08:06:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <1611623608-94159-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0048.prod.exchangelabs.com
 (2603:10b6:208:25::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0048.prod.exchangelabs.com (2603:10b6:208:25::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 13:06:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 795a128e-45b3-4dcf-22a6-08d8c38d950b
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29515465335082EDA9AA39379FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sUg5un7w9NFyqswitLqhkcr3oSI9zN6p5TKxFGUe4cM5qJGBZjLKmMqQzL6g3Uu+y8kcGDrTpvUBvBcm1hWOEDUgsC/c422PJugouDm6WsYPUOyNTlNFNsaHTO5ZsxCePiPDKQLhFw37+wprOL24c5YNiI9NEbzMic0+4tzFQL7YfXdL+1xkc+gmMYFVAe03mrH5+KIAQY5IAiIYueNBnIS6O0FWUdmALy+Zhra5Ce/aDeUOH1Uqbjh/7pBJ4oz9zXIg5Ibur2yZsfr7Z0kDzXaqHaJKAklVAI1oJCetq+tVGYG1ud/y99DWm/sFzV64YmoAcixRl4N6XJtJgumFzuH5gvx+guV8I/zj7wK/eurib3xFU0xnFXRlOCLS+E1nqHnMt6UqjJCk+LEiJitsDOncH1miUZ2fAROrjuRMPvpgp+hvvl25Snj+TB17sIVgq9c5PQYZjenevaWTRfzAuFfMmohsL3+ewql6V9sg1UuTbYK8Nde80isPh3RtIvdjpV0QyuJ0cbQmD9Xt7jKLHzU4sgQhCgj5Q9vG9VIYVvEln6/f2WLkv2RHRVZU9tSZgZHcMWAgqI3yuHNHZskl19eDjtFqZ/wht+XhecnS4qyOcRVZYOUpu7TWWrHv6z1zVn8mNGgJzqCRcUO1/73/1dlAUrLtS2ZAD3ENZLk7u2M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TkZDT2FoZ3NMUW1uV0luMDF0SWhVSU94RHRtMmlMZUUyYzVncjdSQy9ORVgz?=
 =?utf-8?B?Um9xSGxmR0owbnJBZmpvV0wzdlZuMHkvcVdWdGdSU2pZSmVhcUl2b0dpUjJQ?=
 =?utf-8?B?Q0RFQWJMa1dhQWZnRmpmTy9NZzNHczFseHdqWlNzSnNSQU94eDFBWS9IVFlD?=
 =?utf-8?B?RWRFRnNHV3Y5U0VlK0xIMGtHM2dUYlFENnExRjg1MDlEaHRSek5BNW1SVjUv?=
 =?utf-8?B?RVk1SHIvTCtLZnFoQSs3Q0x4SDdJWi9EWUlxQlpBY0hnb0tTcWVYdXdVMEZ6?=
 =?utf-8?B?LzFLWndHTUsxWGpmazFCcDRiVURjSmhYeCtTSy9BL3pVcWYxSWM5M0F0WjYv?=
 =?utf-8?B?MGdaUEFHYU9qRmZqQjFQeXZuWXEzUVptcG1XK05LS0R6QW8vWm5nVDhYbGZU?=
 =?utf-8?B?Tk00NkpjYVpjTy9KcmhlTkhYTUd0UHVKekdIajI2dE1KYzk2ZUJOS2txb3hK?=
 =?utf-8?B?c2c5T2gwdXpJMHhSNlZFN2JHZTNCdlUyTGF3M2tIT0lOUWlHdTN0OXVjWHRl?=
 =?utf-8?B?L3B6VmtyTjVmVXlDUVJSUCtlbmU5dmQ0c0FrK0ZrSEE2cWFjT2QrbkFvSzk2?=
 =?utf-8?B?Yy9MR2wvMjZiZE1yQ0JyNERkK1JTNEhQNlJ3QzFMYVAxVnZrQjQzK3N3T2FF?=
 =?utf-8?B?TEltS2hOZVMwTWcvRWJyc0JDNGcwQ3VOcERZL0NSM0hNUE5GNXFBU3hPNC93?=
 =?utf-8?B?K2krZHdQNXBOSXhzaHhocVI1dlIxVDRiUjBXdkFlZzVTQU8vUXVRalFWYXd1?=
 =?utf-8?B?dTZFQ0V2b1ltNm14S250VDUrVXBwdm1CNXlDZVdYN1N3L3JqV2tSdTNjcWlz?=
 =?utf-8?B?bjdrQ1R4QVlRZXpLWHFBYzY5VXFJVEZzUVhrOEtZa3dWbUR4REsrU3hvZXoz?=
 =?utf-8?B?Y0gyS3ZyMHRWVnRlY2tydHdrWDNydXY1QWh3VVZqTnIrUjRXNHFkUG1QUkI0?=
 =?utf-8?B?Y2trTnNrQUF0TUJYbkEzcFJEOWFxRW80dTMrUzFIVkJHa1RmS2NHWVBvUzE1?=
 =?utf-8?B?Mzkwcm9jaEFTSkp6NmUvdmFGajBvbklXSjg4SUVKV1JXMFI2Z0dZL05pWnlU?=
 =?utf-8?B?WXVjWGxkc3F0aEFZQnRWdUk1NnY3aHhrQ0NFRm5EN0hKWnQvdVV1dWJvSkhu?=
 =?utf-8?B?OXFZWmthRFE2UW10dFpkSVV2cUE2S1NtakYxWDdXblNmZVV5MS84MjlzY2Yr?=
 =?utf-8?B?dm5mNkFkMTBPWHZnMmU1OXQxaWFyR0tXb214bXA1VUFTMGZ6eWNYc1c1OWxF?=
 =?utf-8?B?ZGpKa08rUkN5K1dUamQ1TU9SWk51QVlxbitXMDB2bnZ2NUpFN0tZdVdBTVg2?=
 =?utf-8?B?KzRVY3NuSUFJSVNmSFNzWDF4LzBGcS9xRmo0dERmVjNncUtDV1I2OFJUb0xv?=
 =?utf-8?B?Q05MSUV1QXJwbHJEWThHVFAwMEhkWXU1ZHFDa1pSU3JhRmdQNG53a2prd0w4?=
 =?utf-8?Q?C7xeJWrU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795a128e-45b3-4dcf-22a6-08d8c38d950b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:06:53.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkDE6odyxSoXE9QS5kA9P+iWoSuXUd3Or4ftaL461noeWr72UkXUhp2sF8aoxXfqeLxSvysd+Kw0nf9/xaroZYXaYpITTnrloJgIchvz5qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------B53FFD74F77714508D9F44A6"
Content-Language: en-US

--------------B53FFD74F77714508D9F44A6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-25 8:13 p.m., zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...mework_3.12.1.bb => python3-djangorestframework_3.12.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.12.1.bb => python3-djangorestframework_3.12.2.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
> rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb
> index 60bdbaa9e..6742b87b2 100644
> --- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
>   
> -SRC_URI[md5sum] = "47d5ea46923a131c5fbefeb610c6ce2c"
> -SRC_URI[sha256sum] = "d54452aedebb4b650254ca092f9f4f5df947cb1de6ab245d817b08b4f4156249"
> +SRC_URI[md5sum] = "e70d58ee2f83f11d4efe33162bb8af3b"
> +SRC_URI[sha256sum] = "0898182b4737a7b584a2c73735d89816343369f259fea932d90dc78e35d8ac33"
>   PYPI_PACKAGE = "djangorestframework"
>   
>   inherit pypi setuptools3
>
> 
>

--------------B53FFD74F77714508D9F44A6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-25 8:13 p.m., zhengruoqin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1611623608-94159-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1611623608-94159-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...mework_3.12.1.bb =&gt; python3-djangorestframework_3.12.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.12.1.bb =&gt; python3-djangorestframework_3.12.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb
index 60bdbaa9e..6742b87b2 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/djangorestframework">&quot;https://pypi.python.org/pypi/djangorestframework&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1">&quot;file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1&quot;</a>
 
-SRC_URI[md5sum] = &quot;47d5ea46923a131c5fbefeb610c6ce2c&quot;
-SRC_URI[sha256sum] = &quot;d54452aedebb4b650254ca092f9f4f5df947cb1de6ab245d817b08b4f4156249&quot;
+SRC_URI[md5sum] = &quot;e70d58ee2f83f11d4efe33162bb8af3b&quot;
+SRC_URI[sha256sum] = &quot;0898182b4737a7b584a2c73735d89816343369f259fea932d90dc78e35d8ac33&quot;
 PYPI_PACKAGE = &quot;djangorestframework&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B53FFD74F77714508D9F44A6--
