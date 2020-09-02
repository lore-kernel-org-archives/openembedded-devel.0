Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.76])
 by mx.groups.io with SMTP id smtpd.web12.10202.1599060565682509955
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IfueXNe9;
 spf=pass (domain: windriver.com, ip: 40.107.236.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+85oRKHQf8ybIqPTRtCfPxcLCb70/5LpLrnE5Qi/f4NAJmAgqdl3FHHOde4Hd8fq0lxHwBUDSJiDDvjTgOZ4MLz/rmsbLQQMpvsu9KY9P0W/6irMrpnKSbJJ0cw6luo76GWXh0KAKuk3/rp3RIIDLvn/GYdM/kkKtbsCq/VgrSOZYW57sPIbMOSiDBIXhia0fUswKK4dtIDtHlY1Dp40QcX6Y4ZslaJ++EG23M2wBwid2vzpECVrwNz5pQ1mdDKDIYJ0QvkpCE6MFlIBQYVmRC0YUKjRTqoBNsE9MQtseb63QzIGZqK4zPSY0TYl9C/H4tsC0Ow391jvQP2TUiExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0ixHJmZ6b/Tk2oQV7grGuQuZJtTSatS8pG5a410DfM=;
 b=es9Pj4OMK9n0OdqbYbKNNxHFjAEPbP1DbfOkcIeKeMwKEy7iPkihxjp3fe104INgqnPlO91B3k4rK24N1sWgKMSO+TJ5j2h5Y06kUOQdvfBkmpPjSkCO2ND9Yze/sw5O9OfMO+GbA3R6BnaJHSn86mqR37hOWR3W4qp3qlB0oytQ7PMYgiehGTM9xlFxk5W3kAWmOPOFXgjsuDkASWNZWc/tckbeMf+dZIShZa5KKATGigw9RxrmTefoRc1CozYCCiJYxz7OYDvWFtZsARIo8bpEWwcvBkICCXcGWszvVUYsWRLX/90FbU7YwgcCXHOFvbsg8vW0LIWdGSYJzPQc2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0ixHJmZ6b/Tk2oQV7grGuQuZJtTSatS8pG5a410DfM=;
 b=IfueXNe9EITAMOf/BidY9U8HKvSMbaIEae+gldxEBTLE/rKWzpI7p6X0QJuP6+JCVY+87jmZpVo7LEf1e7s1Kx9JlO/VrwCRB/yimiBqIAWEOhZnKl0aDW9mBwyvarhUcC1tbxCdNcj+wzKO2ZSQsF8m0G1Kp/c2AzOvwkIMr1Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:29:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:29:24 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-parse: Upgrade 1.16.0 -> 1.17.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
 <20200831070318.6573-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <890f0967-bc0a-8840-bfc4-2a2db9fde880@windriver.com>
Date: Wed, 2 Sep 2020 11:29:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831070318.6573-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:29:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d12b6250-0efa-4a07-ad39-08d84f54f8a3
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30305D70E2E2CE899775DA7E9F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CKAhRCwRu+WFomPnmAIrF/V4g/FDblDgMAe5Fz7FvS2pntbrWVTSeN57DWU3lrmSJeFIpNiKtnvjF0Xfuzw61lR0xYXKBlhej/qDXSMnuAAqfQOUaWNMzZ6+TLi8f8WDfvJSrVGi5wWAhj3q0aK3KDLHrJBtUHsxUFF8q4AVXoHQrUJUPe3k0Gylbg3OaKvE71sUkxM8X4Xprrm2nsyZfgNmxwAuD1+sC2PWhd/kTlyu9IgS66qfv7hE/q/2Unuz7AAbKUFkt2M9TfB3JkTW3aKoubeR+Jg5msTpuul7E6xhFs+UheaHxg5m58ysxVYT20JoNWS6nFQHL06b9uquXcxlcZc9/QIf0Lc3NVlbGl+Vg6tpTm/gQRKRxVvzY4vlgQwiHv88SjlW3AV1YtzrWICeB8AxRiQOPkIHv18BwpeawSP+JUnQMos/rhGkhQX8ZBUj4LGHW/GJ+XyJZxrhvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4cWzfLdmH8bq+FftTdMB3ItiK2PoTQrxeezQ15h0Gmb8ZZyLjz5jdY+u0oRA7TNwjxNaxGigvBDD77Ga4GZbcnWYtC4quUd9qjGLWSfUClAFvcoL5f+qXFd+3UWj6YcN2iveToXG3fuoTu6wK1AGkYgIi6mw+81dKKrBuGFdAyL8MNw4hrytDHWf7N+t1wluGD5cL2qY0O5Q/oCXwjogPTuWihSIZEGg94efdU9Nql5lAChJaFSAq/8rzUg02BHO4CeRzwOcuUAhOVEqmp3RQVQvCg4y1mt9Csah86YDPRW1AgwDcjTkTVZHZAuAD/2zq2hBiHRq4W9yeGsk2rVz8G97FfgXeCkvy5l/VxbGbQzck+nRQ9/bab0MH8M6eWleqm++fyQt1Wm1yjPpSU5S6E0bKXw/9RVPKwQxwctI4TwJ9RgKQ8KqxDiDn9WTVZ96Uv8z1NdbMoAjYtr89yZSqaltHLMECGBWlnC4vBf8KSU2W8PAnkA6xBYhF3WpZYZL2gDbjOdiNZBVxt79mMNRXtNk8UeZDG2n35L6l5LW+Jk2HGgThCCvYk9jaXMz3owjawG8gafdS1t6FezTMhmeARUvUdVpGafcYW1tWo7IOM2WCAMEv3yOMpk+dywdzVLOb98TVKfPEzfUyVd52ZvjEg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12b6250-0efa-4a07-ad39-08d84f54f8a3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:29:24.3876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEOh/dCVDXEH1wC6wXHeAuPS4HRst/5ByTGp/rEp6w35sb/ScLR22vUJ4syfweNZNbDhcJOF75r5kfWm+5xugD1zlrVMH2NkEYsNa2k6z2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------90892463361DA000AAD89CEA"
Content-Language: en-US

--------------90892463361DA000AAD89CEA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/20 3:03 AM, Leon Anavi wrote:
> Upgrade to release 1.17.0:
>
> - Make left- and center-aligned search consume up to next space
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-parse_1.16.0.bb => python3-parse_1.17.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-parse_1.16.0.bb => python3-parse_1.17.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-parse_1.16.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
> rename to meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
> index a1e945276..7acf780e3 100644
> --- a/meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
>   
> -SRC_URI[md5sum] = "ba263b3143e9528ae960bbba4d56bf25"
> -SRC_URI[sha256sum] = "cd89e57aed38dcf3e0ff8253f53121a3b23e6181758993323658bffc048a5c19"
> +SRC_URI[md5sum] = "5b753ffb1470ffa4b3e6e16956048316"
> +SRC_URI[sha256sum] = "c7806139a481ec8c8336a54418894c8b201314f8ecc63e55f438f4b72bdc4485"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------90892463361DA000AAD89CEA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/31/20 3:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200831070318.6573-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.17.0:

- Make left- and center-aligned search consume up to next space

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200831070318.6573-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-parse_1.16.0.bb =&gt; python3-parse_1.17.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.16.0.bb =&gt; python3-parse_1.17.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.16.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
index a1e945276..7acf780e3 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/r1chardj0n3s/parse">&quot;https://github.com/r1chardj0n3s/parse&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05">&quot;file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05&quot;</a>
 
-SRC_URI[md5sum] = &quot;ba263b3143e9528ae960bbba4d56bf25&quot;
-SRC_URI[sha256sum] = &quot;cd89e57aed38dcf3e0ff8253f53121a3b23e6181758993323658bffc048a5c19&quot;
+SRC_URI[md5sum] = &quot;5b753ffb1470ffa4b3e6e16956048316&quot;
+SRC_URI[sha256sum] = &quot;c7806139a481ec8c8336a54418894c8b201314f8ecc63e55f438f4b72bdc4485&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------90892463361DA000AAD89CEA--
