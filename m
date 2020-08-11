Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.54])
 by mx.groups.io with SMTP id smtpd.web11.15565.1597154665976387696
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 07:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FVyTwVFo;
 spf=pass (domain: windriver.com, ip: 40.107.212.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSQdS/b5LSTstNp0sstsUIOvqR2IZ4MCFFhwIQx9KxfWPRp+QGrseFBYC+FHLp6ghWeATx+iHdQZ4/DDqFJhLu2zOojyv2w8vE7KgRhC5CRm0t9sGGvD9QpapljARWju3xFXAo5iUHBWJu0eW9PFhojg78ldHA1XEHzQY3gWu1kFK1LDD4mEDRf/y57H9rBuw6jSA33/9KV2Yf3zs5R2uqDPhVSwPW+fMNNVoqrD8qzyxICMdWsHVaV2QRMOeyOKeOpTRlSz70IF/7YpuJ5Sx1EoaohZsXHcNKzNY8KJhGeCIviDiqD4KaJJILNySuCJq+pbV1QYvkU40bqbigVrkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ePKFvkK/MgZ1c0RUdDVFJWcE0ybDs1PGSiNTZ+BylU=;
 b=CEDvZDhmbjwr5vp3D1g+z8m9hld3oy6dhIhQrgi3bqa27grkMlHsEECIXNJy+3LydKrDkQx295JR8wG3u5pIL3p3BtiyZ96RtNKVnsyjTDOLjhzkcs648P4jXMDuJeERC9n8JltU2wyz1H7U9Uw/I8zJcEOM/ZNG8fgP3N/hwVthDcOKe3H1/wv6Wj7zkPF02eijIMZTT/aFumEjUpiF5ucnoUmiiCsyo7ZSBVmMDhSQGWPk8ddE59JhuqBRmT/qI1aRNDFewFH9hQL/aT9MdRXoQkx6d0TmQm1sSnHk64CLglWtMD9AoK0kHLr9lEbLz9WN3TvgHLt6CfpHC5l2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ePKFvkK/MgZ1c0RUdDVFJWcE0ybDs1PGSiNTZ+BylU=;
 b=FVyTwVFo2idUDCwVvvj1qLpvQhJRhMlQ2l5vRcEplQtkZoOLbfKDNSiZENxXf+/DeM8TtSRO8m4ACYgpTDyhzEeQea/7agxFUAdDbMrGcVpWiof6ebYQESpH2T7VvFCX+luJW4YGhcDMs6UrSP07Ikvnfe0IxZUPuAH64SMbBeM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2904.namprd11.prod.outlook.com (2603:10b6:a03:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Tue, 11 Aug
 2020 14:04:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 14:04:23 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-argexec: Upgrade 1.0.2 -> 1.0.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
 <20200810144318.17106-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8eca5b02-824a-d6d1-4a08-a41de5b52e62@windriver.com>
Date: Tue, 11 Aug 2020 10:04:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200810144318.17106-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Tue, 11 Aug 2020 14:04:21 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f03dbb49-a145-4132-5989-08d83dff727e
X-MS-TrafficTypeDiagnostic: BYAPR11MB2904:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2904D9528E83EDAB9F892B229F450@BYAPR11MB2904.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LYkxyPTpw8MNvr5n9iWxj+m9f+WWcw+7bX04rB946qqBbLmxSMScRH5l4i4Hj4a/XA4Qtm1fSpj062LgiDdvt2SFvgoNjA/zwX+Yx63/LE57/0pkCiuZIIsOFlmsUT2acXwL2RJI22f4ALISzFlxxxrc2e8FeBua3T8+sbCDb2Pi2l1jlyTvHwwDwCiRK4cjhG7VwRGnyPNJdR2lc+zQjH/bAB5jAO44KcDYpvZZ1cNyes8ivOyTdDt01VD8k9lrZ0wwoDNzQKpHL+ptH110/AmMn7mxYZvwekOdj19UThJMIa7jZXNPVP1i7lSNuvsDvl25Fff7FV4OMTvI3NIETfaQCTadcCKpj9ABh2gTF2Zd1VXwo+53QtJbTkh0LUoV/IcA9VTwPaS4mHgt0yhY7romqLxPE2kh5QdV/d1aPBPWQEQIlbDPsVaA/G4kSs/pPLFPzbtaE9LJLbaMl/iSYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(396003)(39850400004)(366004)(136003)(346002)(966005)(86362001)(8936002)(166002)(8676002)(956004)(16576012)(83380400001)(186003)(66476007)(66946007)(2616005)(16526019)(478600001)(6486002)(31686004)(26005)(66556008)(5660300002)(2906002)(36756003)(31696002)(52116002)(44832011)(33964004)(316002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xao1wnLqiGEMRvWy8ayld+QyvxYRf1tUkrVynpeV49z9e2esf/jh1a64i4ubxPqk4TLhqTl4a/tkZuHqYoLusJ8C5wIEhDH2YtLXvPfggeijiG6q9naqqxCy/JimxgYEF0wx0TuZD558Zk59e1NCqZ9RKRznV+J31kSGYOOmmm8d66tfjIegSVxbXMq1m/QH3MpzEtfMCPsB0GQqYv+XmhGtHQ47/LiNC/52wHtoafVq4hgwIm9j8zGbSSXGZnuDiqVqVhnSIYzd81pgRvwepabgKS68gQQWpM+D5kpr4FIaf4sAtC7df/N0Ecb95tjuiO2c7JimAWNyTjTfkDAA3M8570wrDwoxkq1X2h6TGnLJJxvQfJpDmzjV1afvY3m7FNT+RI2+X6wHCnl+t75Ax6W7Yd2tAKbaMCHl/rOYrKNqOjzb3IKNLxaLWDmK5/kW4/4LSxzTZ7titYqbOzeFFPaOGq+SbSeEtrsflt3huj1YYFzthuL4k14YsdboVpNltbuGuOMJVpjiegPU26usLzSg4yYv9ypCZw0FnOmb1tNzkVnYVawpPKdW4lmxOZQ2VjNm2sh7LA6wvfbgn7PRhFPan+7NzUwDCpAjiDqTlMtgDguziK1/K9nJGUAQvt7DODiO0aE/eg7AKustFmrPRQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03dbb49-a145-4132-5989-08d83dff727e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 14:04:22.8288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuAccCId/B2xx0VQ9XduLvB8cIYAkkj+h27IcnJSGYdGUcTY35OzGBRh9mQ+325ty1Uk7b0cEsII92JvGFp0YJ4nhMP7tHLr/mkKLp3WRRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2904
Content-Type: multipart/alternative;
 boundary="------------5F4E107603A9D171BE65E155"
Content-Language: en-US

--------------5F4E107603A9D171BE65E155
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/10/20 10:43 AM, Leon Anavi wrote:
> Upgrade to release 1.0.3:
>
> - Handle calls to decorated functions from non-__main__ modules
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-argexec_1.0.2.bb => python3-argexec_1.0.3.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-argexec_1.0.2.bb => python3-argexec_1.0.3.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
> index 179e07127..a26835b60 100644
> --- a/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
> @@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "9fac09884c54db79e57ab80f0c423794"
> -SRC_URI[sha256sum] = "e271286b280f930aeaae7496454573f8029c3f48ef1dc47c780155dd4a7b9e7f"
> +SRC_URI[md5sum] = "448635948823309312ea9f70b30b6c2d"
> +SRC_URI[sha256sum] = "61f9ae9322e38ae64996848421afbdb018239a99c4e796fe064f172d6c98c3bf"
>   
>   DEPENDS += "python3-setuptools-scm-native"
>   RDEPENDS_${PN} += "\
>
> 

--------------5F4E107603A9D171BE65E155
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/10/20 10:43 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200810144318.17106-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.0.3:

- Handle calls to decorated functions from non-__main__ modules

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200810144318.17106-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-argexec_1.0.2.bb =&gt; python3-argexec_1.0.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-argexec_1.0.2.bb =&gt; python3-argexec_1.0.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
index 179e07127..a26835b60 100644
--- a/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face">&quot;file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;9fac09884c54db79e57ab80f0c423794&quot;
-SRC_URI[sha256sum] = &quot;e271286b280f930aeaae7496454573f8029c3f48ef1dc47c780155dd4a7b9e7f&quot;
+SRC_URI[md5sum] = &quot;448635948823309312ea9f70b30b6c2d&quot;
+SRC_URI[sha256sum] = &quot;61f9ae9322e38ae64996848421afbdb018239a99c4e796fe064f172d6c98c3bf&quot;
 
 DEPENDS += &quot;python3-setuptools-scm-native&quot;
 RDEPENDS_${PN} += &quot;\
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5F4E107603A9D171BE65E155--
