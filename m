Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.59])
 by mx.groups.io with SMTP id smtpd.web10.15691.1597154686783909462
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 07:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=T2X1UEHW;
 spf=pass (domain: windriver.com, ip: 40.107.212.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYPrCHpeS1Mpr8KCP8do3R22LcJ2kVF6/3pPo6qZDtxhX6oeFYjKK57qzNjL5Jst3nuXRzOFamWVgswY720Ssy4TrqIGmc2wcV5iCxL+4QFVFurYqB33SPtM7C4IuEIwnbjMjdXIq7EHbRzCGGyV79cjQfZAXBBxMJGkIjPN10dKslK9e8qYuL5welPRI4p1zi7o7MYGgADz747sUGvjwrNUpKeUeUunzxoL7safPqn96WH9vDT3QvyMvEPXwkVgrqR2sYqNtWZEKPteQJC9b0uBp2G/7wuP6FwUnsAuDUfdcSxRPcvlbtQFh96oA49nXAWblts53dAaEJUlG0rfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td2QK/KkkbTfrctcMMM6gEsfYa6ojRK4iyCxPk7NfIY=;
 b=OD6NQXQ2o/HL9hdVB3bYkOCtmUzCOldc7CYX9hiGeklH1nordH9Xq5gHe0/TG20dNw/eD3v90t7Upmr95FeZT5dOT2Y4dWtRZtMRcHuayMnL6iYwclhbjjVmTGhJjSDml+mGVvuCINthDrpjNuDXKgvtx4XNXCAbMgQMXVPrR932uPuMoq39QSoMLdui4s9rPyXfyUAwTLYbA8b4R6ftXygWaBXys6jMJH25ffEg2l8/XFbL/L5pN6Mm9eWlt9U34SvALWBWnDfa4Ok+NlYhA+kzvnWcaLre0v0EE4YCagJb7FuCKX9GDik2hexVPwQQ2lI7cYCYC3JcvxGYz4k1rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td2QK/KkkbTfrctcMMM6gEsfYa6ojRK4iyCxPk7NfIY=;
 b=T2X1UEHWH5XzXMlxIOyNif9wm7dafGHmIwEz+61WKh8DZubdv1V+aS7cY8Va3ZsDAwGsSne7qPD+vsh8wZ+XvbHz1+J9k1H6f96MKzL+NouulD4FkYmMewG6YyiWbR6srhjiibmQ1+/2aZxNbBw8725tLcXeCAjJFupD0MvRjVw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2904.namprd11.prod.outlook.com (2603:10b6:a03:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Tue, 11 Aug
 2020 14:04:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 14:04:45 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-cantools: Upgrade 35.1.0 -> 35.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
 <20200810144318.17106-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ae9f78c7-034c-1293-ccaa-5e41523f1149@windriver.com>
Date: Tue, 11 Aug 2020 10:04:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200810144318.17106-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 14:04:44 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8d7512d-d45d-4162-d8c2-08d83dff8045
X-MS-TrafficTypeDiagnostic: BYAPR11MB2904:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29044AFB35AAD45F4CCF45189F450@BYAPR11MB2904.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:317;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4hvt13DOJ0RjeS2yhXY/Za5LPEifNP+Sls6z22y1W/D9anZi0a95Fk5aybH2uBiDAWel139q91CZKWhLbl5Pld8WR6oIwcWMIldf42YDiu7A5ySsMcHRU2Kd+DzY5m2z9CjKLB/3zn/XBU2QW8C1nERGNmrtI8zMrrle7AMRG4KlR0VHkOnpGqbO/FNXeE31yOKDPQGyLUbwLhfrDfdR7RTUi/3myflIiBOl/Y/MUqEwx65kZDdmhcIR/MpysaU+DDVzGmqEGN3poXe3fDg/4dpuaPlHkfWbPgZgHYvK0DkP9rf5KwU6DEUiMEsFSRi08rlxgjIdzCQJ1SSSb3JF92MVNscQliZbA6WuyfLBK4ABobTEeYfBawdoaEqQM2XzJMnmIFOAxkAN+KcA8GEPA4TSPxR5cOUSSGyYHxipwbkafFkJBhksB3CRY73qxhnvsDMZiU47F4cKd1SB2GUdbQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(396003)(39850400004)(366004)(136003)(346002)(966005)(86362001)(8936002)(166002)(8676002)(956004)(16576012)(83380400001)(186003)(66476007)(66946007)(2616005)(16526019)(478600001)(6486002)(31686004)(26005)(66556008)(5660300002)(2906002)(36756003)(31696002)(52116002)(44832011)(33964004)(316002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CsFITK01cH+B+h5D8WetM77GhNX11A0sraC4tusb82whr9Nc14ZTAaDFWyFE9wiL0Epg1qXgMmQkKpXVMKQQ7sZnN2kFz3InQJcsqLNNNLLZrK3N0GK3fHiCdSkjfVj9E6SCyE5CsLJj0mqoWiL9mr8roX57FicXdQqctMgAEK3S396WMDxMVnLrDSp0U4roOizWst0+MweGi+BvCAmioYkHkSZFWqw2MSwkmPYyroFdfZD0olpkJqmnM/rHCK4c1TEeBOxE7mmeptn0Qhv9bfFYDLIfthdPg/+YtTnMkWwxMTmOnipUruoyNKMGEwtGPuXivslWix0T9psYR+VW4t+hjewr00cDetAihFvo61cpQzsoxJYVa0EMseue5uMpiJgodOkSoHvrpq3wbPwN3OPGC/aCT1pZZOP0I6BBevzktX4NvrIlmISI9ju1PpEoK7aV3d01baUAFEFN8qe+K8Fppb5z+X+b+9uCrezer/eb+2ZHLJVVig65HRhW/glTl8KQOetZq2ki9/sduH0UXwlwzzdkV976bQdMshC3bOJzl7oaX0PuTzzIQ7C4PF5nTkrLtQRTDgj2Tje7JJAJL5ht4ATRkqjDgrrsxXycsbncKDYjWu6/mHioX+NQ4rSV9ARxRCjDlK5nNIMVdZwYDQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d7512d-d45d-4162-d8c2-08d83dff8045
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 14:04:45.3219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vV841nRjXU2cISrKCRGLWuS3oSO45BahB2BCddMLXehL6euvIylbIaJDTZ8d9rvD42wVI5AaeW7Rm8DwyHIxOj8UI+xI+8bxdMxoe0DyV28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2904
Content-Type: multipart/alternative;
 boundary="------------AC52A60DCDCD2E1AFA47D068"
Content-Language: en-US

--------------AC52A60DCDCD2E1AFA47D068
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/10/20 10:43 AM, Leon Anavi wrote:
> Upgrade to release 35.3.0:
>
> - Fix dump of signal types in DBC files
> - Fix SIG_VALTYPE_ item on DBC dump for extended frame id messages
> - Fix compile error
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-cantools_35.1.0.bb => python3-cantools_35.3.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cantools_35.1.0.bb => python3-cantools_35.3.0.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb b/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
> index a9638fbd2..c79e51e33 100644
> --- a/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
>   
> -SRC_URI[md5sum] = "46b71bbfec33146d9dbba708489a8ae2"
> -SRC_URI[sha256sum] = "bd0ac5b16bb7fe2ada0c9436c91a0b3795217bed7126296dde1565919a3f44f1"
> +SRC_URI[md5sum] = "068514ac776e03ebaa8b2d02dd16fc77"
> +SRC_URI[sha256sum] = "5e3a6f679ad3dcb31142e388e052187d5fc5bd481c4fc3b2791eaa1e681cca98"
>   
>   PYPI_PACKAGE = "cantools"
>   
>
> 

--------------AC52A60DCDCD2E1AFA47D068
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
    <blockquote type="cite" cite="mid:20200810144318.17106-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 35.3.0:

- Fix dump of signal types in DBC files
- Fix SIG_VALTYPE_ item on DBC dump for extended frame id messages
- Fix compile error

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200810144318.17106-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-cantools_35.1.0.bb =&gt; python3-cantools_35.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_35.1.0.bb =&gt; python3-cantools_35.3.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb b/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
index a9638fbd2..c79e51e33 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/eerimoq/cantools">&quot;https://github.com/eerimoq/cantools&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd">&quot;file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd&quot;</a>
 
-SRC_URI[md5sum] = &quot;46b71bbfec33146d9dbba708489a8ae2&quot;
-SRC_URI[sha256sum] = &quot;bd0ac5b16bb7fe2ada0c9436c91a0b3795217bed7126296dde1565919a3f44f1&quot;
+SRC_URI[md5sum] = &quot;068514ac776e03ebaa8b2d02dd16fc77&quot;
+SRC_URI[sha256sum] = &quot;5e3a6f679ad3dcb31142e388e052187d5fc5bd481c4fc3b2791eaa1e681cca98&quot;
 
 PYPI_PACKAGE = &quot;cantools&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AC52A60DCDCD2E1AFA47D068--
