Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.68])
 by mx.groups.io with SMTP id smtpd.web11.20103.1590175362373100970
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 12:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=d8ieNRBP;
 spf=pass (domain: windriver.com, ip: 40.107.237.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fak9cUDbaeiUTpEh9J4BbWjmTjjSS1kdiXIgKGN97kIbCbO2WFLAQwPWYASHyAdGXgRaJya0x/aNk3zETm8ijfyhIBa7kx1lM59eHUfgv8aupI5kB/sw7juQYeXUPEhXA8+nDzU1pgTDU/rEkH8Qr6y8iTcG9OPvC2ST0gBOCCVXCJE871iYumwJRleKMqV/p4hlVefuXcNAF8EdvwmlWpHkGzUedGBKD9rMy29fRoP/wzvRgFx099Y7ioz6l4DeZTumsaluhavJgEUizEJMA8T2MUllq0FKE8x4eUR7uXg+qD54bdUk37U4bW4T4Shq3Ln879jsP3YvPmM1vpObxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCBNEKf/5JL0S9bMCB+l+Bp1h3ypRXfU1EEOyyB3eiQ=;
 b=bPFNyHCsEK95jM0os+zp4PHzkJJQKbl7gNqI4e3hTfYfJ2rT5GmGE07LN2+UfWbGP+DBbQTbCu5xO3ntHcl1JwFIc5fTJ8DdSzgDvqOc1837t0fKyY4ziIrCWtxs4cMuQ1wCWW3kz7xK5tdubwVtVm135Ysasy6m2TtxF5kOuDa34bSPlbl3FiMvESl3dlAOGCTjOWAmqkwTPJUmGVMDv12lSMXQC+Cdg4QW5DLS/cGjJXpebwZr4I4tt2YN5z88wkroGpUrJLKynEOiMUiG8HEd8HjU2+OR2QWAEh4RxRI9LxRdUvscDbDdAUi7pE3lTQKlfAJbPg28irTk94q1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCBNEKf/5JL0S9bMCB+l+Bp1h3ypRXfU1EEOyyB3eiQ=;
 b=d8ieNRBP93Z7LJU+PY6+2xxEyRH8JYN+6z7BDHzbcBPZvbA4IAHq1/EihhohO4QjaQSTiLhv31Zcroi+jpvguc0fl8iKwARUXpTEeOZGD6ObFRfTgQdgfHRkDRl77bb9RluxdrT6/9hg0wy73jlnxcoRDdXA7Gyw6sgFmLgOn+w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4004.namprd11.prod.outlook.com (2603:10b6:405:7c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 19:22:40 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 19:22:40 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-pid: Upgrade 2.2.5 -> 3.0.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200522134007.10925-1-leon.anavi@konsulko.com>
 <20200522134007.10925-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <16f53515-f340-c650-1881-8ba43de21e5a@windriver.com>
Date: Fri, 22 May 2020 15:22:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200522134007.10925-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::17) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 19:22:39 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b471ac16-7f28-4a29-abb5-08d7fe857e5f
X-MS-TrafficTypeDiagnostic: BN6PR11MB4004:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB400427FEFD68C81264C636819FB40@BN6PR11MB4004.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZrNDH8vQV8grnQOVCwduPUNjmwDW5oxLyFG2KOqrGAnd64KgOVmWsx9hWlQnXnhZHnJlsXg2TdaVETJ5V6xg+hRqECguqyw3gwGIKYqR77gQhZzhtsjhllwpFobK7uN+cfj1gFPCgyMcVsdmYHg2GZipVZ6kVCgIKpFH37JaN+3CIilnLr+etryV2x3WC9FIvPBWlx8xVS8uE15Nfi4vqRGggn5vdgHtHKuR35IYfZfzWyHxqRAs9RIY8tfG31SoliFJMyU5XV7q4o5h+YKDyAVJ5xqcXWegp81lMjJskkKSq+7E6OSyX4XtFo1E/p+fO4N8SpERXA8OVi+7w6k89MDaxAz/VyKMb9/BNc6rw6SXpYL5LAQlO3bMwE29nC4T0yJ0yHQqxEa+EcCMtbk7mnq8XnUm0blMFQZ67Arz80v3/dKfkWFOahFjVcpuucJMHyIsnNazXedCErp0w5CGPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(396003)(136003)(39850400004)(346002)(366004)(33964004)(31696002)(166002)(16526019)(53546011)(186003)(956004)(966005)(2616005)(31686004)(52116002)(5660300002)(44832011)(2906002)(26005)(36756003)(66556008)(86362001)(316002)(8676002)(66946007)(6486002)(16576012)(66476007)(478600001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1sbzTe67/thSP3WIM3o2npIrz9KLK4nPZib4AhEoryaDRFtYD1tHlxp9QWA9tQKHyv6EsvQwlppQ/0noDLtiGR0k3fp7bfJ/Lqz3W0TCqNz8sJweehetCV5KiLIjP2p/d+oDQWXCbcgp1BFC5qMUvYUGYbQLbEKi+UVQO6BWuyUVeLyWsqBLZK/Uf3siEt7CKZY4Q95HhW4KNxZ9WhmoCBv795lYssxPvbl80W8LSBIoGHilqHRoBrWqxwYXsVRRd/NQB4Chz/gEDAnv+jWQwZdv75T6mKAwKtlKla1TVyGpw28sRjSX52KGvR0NF7jnfISB38k++2wq9MvKVkb+nK3bsveY6NU9IHlXV2qGzTWFd2xFabmBUWqdhp6+tl6ekhss6SLdpI/qoLUrvXkjDPz3q2raKmxJ27k+7j1DhIZ2ivlD1pk6H8pCtYcAIOn7VfsiYKb3SX1VAQFn7j0SXGPW6iXca4+Qfs0Oip0+OA5Sk1GrLpnj1k0yprwGsoL4
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b471ac16-7f28-4a29-abb5-08d7fe857e5f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 19:22:40.1588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Arlxn2uvrVO5cDKbLfgvusj11oPqGhDG0hyk+QmZ7q3Bu+xs/ByOT1OBLkHazwyTRfNK74i369B35GcnRSzLEnPVtLF/8RdrQ1bn5yiQJDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4004
Content-Type: multipart/alternative;
 boundary="------------4980E88392ED7AEF28F6ED9E"
Content-Language: en-US

--------------4980E88392ED7AEF28F6ED9E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/20 9:40 AM, Leon Anavi wrote:
> Upgrade to release 3.0.3.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pid_2.2.5.bb => python3-pid_3.0.3.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pid_2.2.5.bb => python3-pid_3.0.3.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb b/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
> rename to meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
> index ef1947888..170c99b93 100644
> --- a/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/trbs/pid/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=83d53cbd3105063f20305bc313464e29"
>   
> -SRC_URI[md5sum] = "ad352ee1dc28b9746a15451c0c53e9d7"
> -SRC_URI[sha256sum] = "96eb7dba326b88f5164bc1afdc986c7793e0d32d7f62366256a3903c7b0614ef"
> +SRC_URI[md5sum] = "5c011ebebbdfd529f6e85d2e0396dae8"
> +SRC_URI[sha256sum] = "925b61c35b6f2bc6b43075f493e99792f1473575a0beeb85bcf7de1d6a4a3c7d"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------4980E88392ED7AEF28F6ED9E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/22/20 9:40 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200522134007.10925-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.3.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200522134007.10925-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pid_2.2.5.bb =&gt; python3-pid_3.0.3.bb}     | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pid_2.2.5.bb =&gt; python3-pid_3.0.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb b/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
rename to meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
index ef1947888..170c99b93 100644
--- a/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
@@ -4,8 &#43;4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/trbs/pid/">&quot;https://github.com/trbs/pid/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=83d53cbd3105063f20305bc313464e29">&quot;file://LICENSE;md5=83d53cbd3105063f20305bc313464e29&quot;</a>
 
-SRC_URI[md5sum] = &quot;ad352ee1dc28b9746a15451c0c53e9d7&quot;
-SRC_URI[sha256sum] = &quot;96eb7dba326b88f5164bc1afdc986c7793e0d32d7f62366256a3903c7b0614ef&quot;
&#43;SRC_URI[md5sum] = &quot;5c011ebebbdfd529f6e85d2e0396dae8&quot;
&#43;SRC_URI[sha256sum] = &quot;925b61c35b6f2bc6b43075f493e99792f1473575a0beeb85bcf7de1d6a4a3c7d&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4980E88392ED7AEF28F6ED9E--
