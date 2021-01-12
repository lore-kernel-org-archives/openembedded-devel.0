Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.69])
 by mx.groups.io with SMTP id smtpd.web09.11372.1610467989132712928
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iXTzouA6;
 spf=pass (domain: windriver.com, ip: 40.107.243.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4tQS4So61y5m+3VPwTh8JqGVK6jqYmgv4u1Fg6SexEbaeC5ry+KY8WTGNRWlggTtXsiPTuq4JYf8yn+m60saBSgsWzcFZKdKA1eXJttB0dCcgmJJ6rS1Ie/ENrg+9mEFCLHa14haIyNNX8V4qYCDWAem80bp4C3mrsjGXbSj2QVfz+RYzhMa67ovO9vneTd+cuuk1ap2WmxxiGa/tKDNb7ILknM7TwQAa6uLGzh+r/HiDtbzvfQ9fDiAwGFdmFVgqccdeK6UnhXdNivPSn61Fv3SNBZFloDrZmkcOi2kMugSwR9hd65iWenQ8aCPx9Tr5mvtH1wdtqZnwMy+BANFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWxqiOHxakjsm1uRh5GM1FRQarkDqU7yLGVfZ0OED/I=;
 b=e7xJfbdCd+U9Kd2v3iPQskrvtbUn1AqAEjHvGwtdfAeRuACSFJYny3yf8nFAq125LgcbqJZM9GOTVyfEdJ5fdUZDt0MTPhhkBCntwYJrArYfNtYTNV+uLR/LkB3lVsH0gZVI6g+cViJXzCFLL/MsNquxctp783oXa39IXlbgFAQBc9SmlhkQruBub8HunLqp8bIX7mDGLa2SVo1WdFj5wAGSW3ByHhGZqgzUVEHM02elz3JRUpWKo8lWsBd7LuxSfOxxNSTVg1V9rRVJzF+WmEuRrQMrIonjM3Ls5t/mtP4o26YEOp6H2EKbG5TZij5Woj1Qp/Qj7vcqKnjdHfyXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWxqiOHxakjsm1uRh5GM1FRQarkDqU7yLGVfZ0OED/I=;
 b=iXTzouA6AOXBNOHqNmrLmXVlfzzne50tk9Egrn+nv5f9WrWuvU6qqg4/TLwrp3PYBlIbnj8BOQ/LmzRhZ5SUE7vfSLgVJ1VV9d2rdMNVVDUyhkSByDR4kPH/LhwmwWceOL3ML2KrVsLlM1SZKp7b5d7FmjJA5j9zInTKeRkt+Fs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 16:13:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:13:08 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-croniter: Upgrade 0.3.37 -> 1.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
 <20210111152512.23506-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8b965210-c54b-933c-1d29-253be7087812@windriver.com>
Date: Tue, 12 Jan 2021 11:13:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210111152512.23506-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:208:fc::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR02CA0007.namprd02.prod.outlook.com (2603:10b6:208:fc::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 16:13:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c505f1f-ee56-4f2f-23a5-08d8b714f33b
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2807B5D6A299CAB28066EC129FAA0@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p7iTV3ow7hB7nJHh9C50y3zfm2/7WNlKXorTa3Ze1d/Mv0vM3xyHCZk0OU/Kb+7wQwwrhxJyau0+MiFFJGOPHlMsY9pditNl/UtUF7O7VCp9EPjOlInFt0B7n/PR6lAFV+/UyLwvxWkuo8Y8z5kMtKX6vrtoB2sW+h+0+zyO0phiW31jr15IHGhoni5qOqHLB2GKpMjqroS6n4AntVN0JbOO50g0SSAJpoZKltLnNqspCgzxyJuftjnkw8hE+5yfqmciyFEEahVdA3McsAz2FHSFHyP2m4sWnsgDkRiy/flS9Qbqofx8uj8vZglqrefxQ5xRHlllktHZb57IvmjqVix1E92AFZCPiHMqKoAX/X7ylu+T0W4b6gGk+dLQunYiM91Ke3T36ct2s9dz33HSwIT6kim7HkhnosHOypfZwJmURkKQ2rWngB566ZQo1p2bdVRCf7trLvlZ1V/T9l4nQrok+p/eXy273IVPg7xt7CtWUnixiCcJbejTnvdV/zyDozIQ4wYzq60DG9wd/31kGFUSwq5G5bNHjZw9t0IaBBApcNrquY+ydShy3MztSEKI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(966005)(2616005)(8676002)(6486002)(66556008)(316002)(16576012)(186003)(52116002)(956004)(8936002)(2906002)(26005)(44832011)(5660300002)(31686004)(86362001)(31696002)(166002)(66946007)(83380400001)(16526019)(36756003)(53546011)(66476007)(33964004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RDlCVlh0QkRoQlh4aXVkVUVJUTFLVGx6ZXJSd1VoeG9kdUVhd3o3YW5Qc3NP?=
 =?utf-8?B?YTIxLzN3L1lIT1FSWEtLbnJkSEo1K3VTd0NkTzZWNUdicW4zcUVaYzZVLzFW?=
 =?utf-8?B?RHhjeUtHYmZMN1hCMWxKa2JpQXIzWVBOVmxocGUwd05kNlNXeUcxMHZHVE5L?=
 =?utf-8?B?RHFSaUw1RmVCYVR5OHVTdlRPQXNBejFLMWxibkRQTndjamxtbnFPdEZrWVdm?=
 =?utf-8?B?YVV2dTBjdm5qUmVXRVBVZ3AyNTlWS0p4RGRxdlFUQkx2aEJ6RXNuZUZsNGNK?=
 =?utf-8?B?Y3ZheWZQdWZ0MG5rMjkvRStJajNzbFdWZEtQcUpaRTBqOWVVQWtCakY1RS96?=
 =?utf-8?B?SGlBaHBJNVZsSnYxRTk5RSs4NGNjY3VOMUc4elJDZGhkSk1GTCtBS1BrTGFN?=
 =?utf-8?B?Yjg3VDFabVY3aG1VNjZuMWFTZ0dhNHB0VnlQQmxHSElBLzdSKzhwY2Y5RXJj?=
 =?utf-8?B?MDBjSGtwY09rVWYycmRSL0t1QzVvYXhEWXFqRlJCVXhsV3ljand6WllXSkJw?=
 =?utf-8?B?bzQvM0tuRWNzbEwzOUZjaUtnN0s5djEwUTltNXgzSzZCZGpJOWtmenIxUFBD?=
 =?utf-8?B?UUFZMVVyUmNTSFJnQTFGZVQ5bmtKbVVYNXpHQVQwaVRIaHdXREJJamJEcXRV?=
 =?utf-8?B?OHIxTmxWYXVhQnBqVSs5aExCN0dBcFFnQTA4QjJxMDljN2UzdDdyaWtGRlVX?=
 =?utf-8?B?V3JjbHVoWTd1R0FiYnFYQjVnUmVtMHZvdnhYZ0I0dWJWMGdCUkYvVkphWVJa?=
 =?utf-8?B?UTkzM0pqMnBuNTR4c1pmSTYvNFQ5djdsUWFBYzcrYXgrMVZQNkJzY3JLaXRi?=
 =?utf-8?B?RzRQT0RweDBRUTZMRkZQUVRvMGR1VUl2M1FqaDRLS0JrOXFvNURIZGdCT2JE?=
 =?utf-8?B?dXZEZk9xc3FwQ3BVMWI5d2xMcmYwclhGZlphM0dIcGUxT25QR0NIYVBHamlT?=
 =?utf-8?B?R3hFYXNhdXgxTXU1UXM1Sm1Kd2lXelpzR1lYWXJTaVpBbmE4a0dSZmNvZ2Fi?=
 =?utf-8?B?TkJyVEhybTU5R3NGK1RzM1BUb0daRmxNZWwzNmtnaERXQ0RITmJoWTJCVTd3?=
 =?utf-8?B?VDZubVRBUFZoSEZwVmdJT0pYTHo5eFp6Y3VCWVJUZFMra0o4NXhab1Q1RnQr?=
 =?utf-8?B?ZzlCUW1nSEtab0Rpb24rYnpIbjdJNVJmUnJSZFM0cUpUUzFNeEFZVytOR0tO?=
 =?utf-8?B?TlVhYmRLVWh4dDQ1NnhaMDF2YzZkNWZnek51dWsycGpKK1JvdDFmbVRIOUFv?=
 =?utf-8?B?WXloSTNPU0ErZnVlOEtaY0xUOTVpVXZCSXAwMnZaUHpCNDhMZzNEQSt4cThT?=
 =?utf-8?Q?Ed8L2rgcfRAz6bS2E41GJK6cv8OBstMc9B?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:13:07.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c505f1f-ee56-4f2f-23a5-08d8b714f33b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzCLdUkt8FSXIk2AcapfwZGPjAU8RkKFx3asvGSKMvoPaPLb/ZfFbs1rVXOTvfq7aeHaX1PTkESwHKshHU9uHxOn1hY7GUFfdEFH5V4uXKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------AB7CB77DACBD5B5951ED257F"
Content-Language: en-US

--------------AB7CB77DACBD5B5951ED257F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-11 10:25 a.m., Leon Anavi wrote:
> - no changes, just to make sense with new semver2 (making croniter
>    on a stable state)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-croniter_0.3.37.bb => python3-croniter_1.0.1.bb}   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-croniter_0.3.37.bb => python3-croniter_1.0.1.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
> rename to meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
> index 28c4057cd..0ffae0c0d 100644
> --- a/meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
> +++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
>   
>   PYPI_PACKAGE = "croniter"
>   
> -SRC_URI[sha256sum] = "12ced475dfc107bf7c6c1440af031f34be14cd97bbbfaf0f62221a9c11e86404"
> +SRC_URI[sha256sum] = "9d9942beaae10c0f9f5de4dcbfab4d85b10638cf407195b82d990bc086d6de0d"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------AB7CB77DACBD5B5951ED257F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-11 10:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210111152512.23506-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- no changes, just to make sense with new semver2 (making croniter
  on a stable state)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210111152512.23506-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-croniter_0.3.37.bb =&gt; python3-croniter_1.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_0.3.37.bb =&gt; python3-croniter_1.0.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
index 28c4057cd..0ffae0c0d 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2">&quot;file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2&quot;</a>
 
 PYPI_PACKAGE = &quot;croniter&quot;
 
-SRC_URI[sha256sum] = &quot;12ced475dfc107bf7c6c1440af031f34be14cd97bbbfaf0f62221a9c11e86404&quot;
+SRC_URI[sha256sum] = &quot;9d9942beaae10c0f9f5de4dcbfab4d85b10638cf407195b82d990bc086d6de0d&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------AB7CB77DACBD5B5951ED257F--
