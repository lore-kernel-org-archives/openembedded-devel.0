Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.63])
 by mx.groups.io with SMTP id smtpd.web11.14141.1590158196104437391
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 07:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XTLXpsEo;
 spf=pass (domain: windriver.com, ip: 40.107.92.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfAE1O/3MWOz22FS6eVuJaQG0OnMFmnOxgo4XgA5Y4zccf0D4S4jC9V0Xz4Yf1EE6/LhWiVTeHkOsueBE/m7Ed8GO0vDqg97mqzH1oQxszZxAytpAS1FiNCn4KgURfQYT9AspzzepQHFulsY98YVO+YjRkpS6ihZZyoWEvE396TtSRlkqt0+TW0FebCsy7Z152al0Pdi0q/U4gBs24Hlc1lsjKsla5FEoeO7z9kbnC2iYZzDIn2IUn1i9N/LkhDlwt51sN/OZIHlmJx4x9z5qxnqsGJAUOgbpVRmjsqkmIrb+fhp8rTr9WeESI0rlBHhSED5AYA8+K/f5RjmVPyAHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FwuzDfu2JyLkrki8Wthds5zoHAwwXaBkdbJIJwyW3A=;
 b=VYTXwjiHC4909JSbvHChN5SvO/U6gvRsvuhGhJZ4jnpO+blvfuuudeiQ3jZu7WylEKq7w24JzkmjPlSGNRbQaZ/RDp6ocwvAmuRb0h7UugD37Ed5/qZsOEM7puPXFdFRiT80jcfJ5EQE3bBRUSZ5H65HDdm2YSyk1T3GCKRey6BIIsayFPtP1HVoELrXKX6htXtkOFAtQtyZrlx2yPIrDxHL8yFgP1kSeYWqhBbHSYltE+6s3uC8yPPaSLrAkpwX054C1prXh6e8h1DY6sDAdLJoj3PtH7AuJ+KVF1uwxXMCez23AKFH/Sjh5ZM+B+/UMt/hzS8qmQdMoQ2jQ56kmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FwuzDfu2JyLkrki8Wthds5zoHAwwXaBkdbJIJwyW3A=;
 b=XTLXpsEo+unfMkEDW0e4K/w47MqkYPPDzokVcWnP+HZs1aX7Ca3pv6NbEjJ6wwdoETdmJQNvzs6HpcXqZDwaxTjnUIR0Cps8oMQyyKPyfoSBB8evqj9yV3pyZWVFk5/8/elCgyTftQXaodZ8IP1WLSrVqXYF/gx+4w7/A6ufViY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3876.namprd11.prod.outlook.com (2603:10b6:405:77::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 14:36:34 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 14:36:34 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-parallax: Upgrade 1.0.5 -> 1.0.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200521231325.685-1-leon.anavi@konsulko.com>
 <20200521231325.685-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <557ee894-5774-e033-6c85-bdcf165d90b5@windriver.com>
Date: Fri, 22 May 2020 10:36:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200521231325.685-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::29) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 14:36:34 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b8bea4a-dff2-4df1-57da-08d7fe5d870c
X-MS-TrafficTypeDiagnostic: BN6PR11MB3876:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3876D1969C9C734E37BCC5A59FB40@BN6PR11MB3876.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rkaZZZvE0p4btSe0pHz501RVgRbfb4pSUKIgTrulrYxzTe26uvuY5Nv13Gml86Rq+Y7yozOWAoXs0VO6a6Fr0Vkh0GUZW1nZSPjo1WFldzE2DuLlxfyBLWvtToGxcIwVgX+qtMB+CLciWGLv+5BNb5Z4QgO0myrXOhTizrweJvRPZgZGnBVz3t6MOlo2gLh0ZvZZMM9cspds3HjEQRPhoPwYcfRNrn/4+MM27o4UdDh51rk+sthj9qhqM3MMNpY6aAnq1BoMu362x8LcyI7yx059R/DiPAIEctgxeV2qjP19ooQVsXK8ubEeVQ+plW6lRMKYAzWga2PSLX4FEjT8E/vULbpsx62M0ASQflwo2gQngEYzlQpDY/UXrkbCGMmFlAQ+Bi2cN5a/B+M+WmbgIDshuVf+p5NMwvjgdkK0tsNJX/5GZOtVDxqcytMk6bTsecb9Nob4cOT/I2+co3pWOw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(396003)(136003)(39850400004)(31696002)(966005)(86362001)(66476007)(66556008)(66946007)(5660300002)(36756003)(33964004)(16576012)(52116002)(2906002)(31686004)(316002)(44832011)(2616005)(956004)(16526019)(53546011)(478600001)(8676002)(166002)(186003)(26005)(6486002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UnMEwqKMDmuaxmK76MNa98eZHPuMdrBYuhfhqMGQtxY9vN2UAudgi9YvnNbrmfcdoHyTK6w23nbF5ljpcEdmfQgBRamVhDycg0tZZCmdxnf4W5CaB9o1xSSanUhQgj6uR3ozj8LkmgtY4cgw66O+n2yr/ChUfF/VLMgDP5tMeK5G8TAz1i2EX5KcB/bmIOdPPEcBry4cw9DFPq1nCfXZxRSqfNR3Tf/Jjy3hAAU6/t1znO6RTSEr3FCzCq/qQv2E3aBIx5WqDWbVxNK532S/vlXobotxKWSjW2Ua2YQGWNUHQ5xWxjFOd3NzYMrEM9DvnrQ9Ib3iA3j7Hlswc5wvCKGCForJdypvGI8cdTlO9OlwBo0x/I0Qa2ZMGAq2UyWLZP71zr762/mbur0cwGR5MaaI7JbarRtTRHmaKI1lqkIYrB5vPc6PsTX+7zm3ba9RRDIYKyd5KTdy+owKnZ8oZ5z/TrDDfc2o75vJrKqMb5FfsPxjL+Tsnn2gwQq484tv
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8bea4a-dff2-4df1-57da-08d7fe5d870c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 14:36:34.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1ogKuIb2jppAa8y3CNdgYfrgepVoe/a4zrrdtHXC9XZrBdD0lAAUtZGHhX+v12S1m2AKTv8ROwd27umk5anAlm8qep0T+NwzB1uq1GW4bY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3876
Content-Type: multipart/alternative;
 boundary="------------043E673E39EE20803E2F8922"
Content-Language: en-US

--------------043E673E39EE20803E2F8922
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/21/20 7:13 PM, Leon Anavi wrote:
> Upgrade to release 1.0.5.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-parallax_1.0.5.bb => python3-parallax_1.0.6.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-parallax_1.0.5.bb => python3-parallax_1.0.6.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
> rename to meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
> index 60631d43a..40876d352 100644
> --- a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/krig/parallax/"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=52c67ffa6102f288a0347f8c5802fd18"
>   
> -SRC_URI[md5sum] = "f8d04e9e246291536b705df7f60a55c9"
> -SRC_URI[sha256sum] = "e9e4dc500f1306a638df0f19d4ef976a623b260fc614c55cb1fd0d8410b3c4ba"
> +SRC_URI[md5sum] = "e312397b083426af84db7076dc2a28d7"
> +SRC_URI[sha256sum] = "c16703202ff67aed4740c0727df304abe9f3e7851e653533b24de21b338d9081"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------043E673E39EE20803E2F8922
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/21/20 7:13 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200521231325.685-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.0.5.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200521231325.685-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-parallax_1.0.5.bb =&gt; python3-parallax_1.0.6.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parallax_1.0.5.bb =&gt; python3-parallax_1.0.6.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
index 60631d43a..40876d352 100644
--- a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/krig/parallax/">&quot;https://github.com/krig/parallax/&quot;</a>
 LICENSE = &quot;BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=52c67ffa6102f288a0347f8c5802fd18">&quot;file://COPYING;md5=52c67ffa6102f288a0347f8c5802fd18&quot;</a>
 
-SRC_URI[md5sum] = &quot;f8d04e9e246291536b705df7f60a55c9&quot;
-SRC_URI[sha256sum] = &quot;e9e4dc500f1306a638df0f19d4ef976a623b260fc614c55cb1fd0d8410b3c4ba&quot;
&#43;SRC_URI[md5sum] = &quot;e312397b083426af84db7076dc2a28d7&quot;
&#43;SRC_URI[sha256sum] = &quot;c16703202ff67aed4740c0727df304abe9f3e7851e653533b24de21b338d9081&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------043E673E39EE20803E2F8922--
