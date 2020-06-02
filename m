Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.83])
 by mx.groups.io with SMTP id smtpd.web10.2143.1591114418695274273
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 09:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UuHBSg/g;
 spf=pass (domain: windriver.com, ip: 40.107.223.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVDrzudyRmTBZE523knpt4bu4A0pbFNwYQtbq2Bg4xfLcopfeE6cxzu0iswwioDacnVFx7wsP49nbvN+yzHtMSDwk0RahPcfKwfBGvz5BCoSG0PFOmKkyUzbW4MoqxakiMbNq36o2ZzM69+AkyRfTDh3LuKFT4tgXbbkKdYACHcMdGBXE9mFFC6565VEAPihB/ICONvTG06N8cY5pvZvtJBrvsaF7Lrfk9qxxjoTysr+KpAkyfll4Wnhk9DwHLVZHo1ofiPHbO9BEOPOG7atss3glAS0Mf2aO6+mCRU7rnijPc7lzQpPCR693zr7ZfvVt0NUX8aRrw8YRKKUhlKa1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nisA3bavyB7T9zhmKdmHNQ8pCOgOC8+wmvOLKKLL5s=;
 b=d9jm8ihtVnWkZxOVX5jL8WIxEc72BJNxKpQNoiKEvKwDlIHH3j2ccAW93ET+LTOJiS0RxQI1D6TF3xOFKuNh+x8/okOHovP512l8g0p0qrnKxIxHSi5zot96ByjnOz836M7ZWKWJHvqUNEqAKiYMF6S7J+iwCGcVh4Yg4DuR2seZEAuDilTUnH3UcQ0vSQSJVRnh97CvsHQf0iZgEoPh4ZnQNabb+S7E3cZX4EKYBTp53j3OB0Cx43QHx87yHBXLSpz329JLIvd+5Z5Tc/N14/MdqWVgxVDr4+5QnedIbLLOSJt//Av8yEIts9KyGD8Pd8wPhcehkhOMRqHyC9J2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nisA3bavyB7T9zhmKdmHNQ8pCOgOC8+wmvOLKKLL5s=;
 b=UuHBSg/gcwAt4mtNaefvnPE6TB3a+G/Vg7VHfBNwg5UDdw0ET0oSw8z4+61Dpj7iKVfdTySQT2Jy+GnDxxeXam67t8/h1F035AjaT6U0Omy2cnIW7PimMvVfmq/PsbZVvfdYcos+0xENvW995fRQRcpmcbJ71tN+t8G5rzGtotE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1729.namprd11.prod.outlook.com (2603:10b6:404:101::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Tue, 2 Jun
 2020 16:13:34 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 16:13:34 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-langtable: Upgrade 0.0.38 -> 0.0.51
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200601130531.27509-1-leon.anavi@konsulko.com>
 <20200601130531.27509-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <533c76c9-6dd2-50b5-646b-fc06b873391f@windriver.com>
Date: Tue, 2 Jun 2020 12:13:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200601130531.27509-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21 via Frontend Transport; Tue, 2 Jun 2020 16:13:33 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b95d234d-1b3e-4619-41b1-08d8070fe60c
X-MS-TrafficTypeDiagnostic: BN6PR11MB1729:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB172988E4114B71E94E526C229F8B0@BN6PR11MB1729.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rCBHALdG7z4TNCV8KxIIXItBiQWhEIZmxub9e7Vm6Qg88UaStv79/E89As6/pRnX0B7eolyn22EeXZF4W+DAnACZZnm4IfidikRM0IS0vsy0jZK7cDxcYafbqD1qLaPLI/fK9tDE51wXIsSFc8Z28JyrEl/gcLerjrCst7wX45vYBMJQfCOtU9BVp+Lz/SIr9bOaAvGi5/8F85nIA74VRYhcZisSuQ1/uUTR4z7iTs9GlnkH4X0hXiLnVFNETfsHX4vgKmMITUm6PqnSs1uwi5EhghT97Zrb6ewGAvtSRT1EfcUuN4igH3qfsPCsIidC7C9AgNFuW3VdY/V09J0bMlZPeziC5qVLkz2+EUTtYUf+0pLlHdSVWK2qhd59XwplX23H8ijPGwevvI0Zgll9Z7iIwQSdXCKne4CfrKHey7GBm3zfJmAeVh+/aPq9dXwNJLqPuwbcgV+m+OHg55KNJg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(136003)(346002)(396003)(39850400004)(2906002)(6486002)(52116002)(31696002)(966005)(316002)(16576012)(478600001)(31686004)(53546011)(2616005)(956004)(33964004)(83380400001)(26005)(166002)(16526019)(186003)(8676002)(44832011)(8936002)(86362001)(36756003)(66476007)(66556008)(5660300002)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fAZcESbbKEiUbTuryddBo2zjw+DbXJejm8Z5exN+fJUAAvUv860dVc9OBkfyO49IKGTMfXGpII9uzcPFduhE5bWKNY5nUBz4cSlKzCPYf4N7w+45Reh2lOzN2+pHXoeNQ5IFJkNnxy3YtHOEqSfhoDAcioNMyY72kei+tDScEu98H/th13szETW/D/o/ZPpOLVpaasdcU1nWaI7GkTC04RJV2SFRQP7nVQBakXPPVdSvt+4f0oatEv/PEOG0zoLIOfHGaHb5FaZW85gOy2hgL8xqP94ase+RP7tXNeYT/a7gKIlh2mb8IgKZqWtQVQkudHzwvmZGZhfiAzOih5Q3oYDq9dOLh9Ew3BJYtOjdwRvwycvACOyi/2Sz7uCCy5wGywqm16meg3PWA7awcXv9r4DuC7oFJtvqErEj5LsWwmZq/fhOL/OJRTbCjs2ZihzcdB97+ZcF1BjdVy6eroSg91sG+eHZmOu/H3+dfqxji7U=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95d234d-1b3e-4619-41b1-08d8070fe60c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 16:13:34.2673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtQngvdioT8rxeqVcoYC5jxh4ahSUbINK21D4LQjC663Mz2gdb0t2aQLscMydjnaLcswSp/7e3lgskemZZ0c3VUbWErSQr8BMKqKLGGwdgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1729
Content-Type: multipart/alternative;
 boundary="------------D475344116A0C07DC7BD4233"
Content-Language: en-US

--------------D475344116A0C07DC7BD4233
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/1/20 9:05 AM, Leon Anavi wrote:
> Upgrade to release 0.0.51.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...angtable_0.0.38.bb => python3-langtable_0.0.51.bb} | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-langtable_0.0.38.bb => python3-langtable_0.0.51.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
> rename to meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
> index eb42fe978..8340382d1 100644
> --- a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
> +++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
> @@ -6,15 +6,10 @@ SECTION = "devel/python"
>   
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   
> -S = "${WORKDIR}/git"
> -B = "${S}"
> +SRC_URI[md5sum] = "5d28198fa933dac5c037108d8f5cf3bb"
> +SRC_URI[sha256sum] = "8d4615cc0bb0fa49faa05b55ff49b1f41122b8092ca18a5d10f1e1699d6d7b3c"
>   
> -SRCREV = "35687ca957b746f153a6872139462b1443f8cad1"
> -PV = "0.0.38+git${SRCPV}"
> -SRC_URI = "git://github.com/mike-fabian/langtable.git;branch=master \
> -"
> -
> -inherit setuptools3 python3native
> +inherit pypi setuptools3 python3native
>   
>   DISTUTILS_INSTALL_ARGS += " \
>       --install-data=${datadir}/langtable"
>
> 

--------------D475344116A0C07DC7BD4233
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/1/20 9:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200601130531.27509-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.0.51.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200601130531.27509-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...angtable_0.0.38.bb =&gt; python3-langtable_0.0.51.bb} | 11 &#43;&#43;&#43;--------
 1 file changed, 3 insertions(&#43;), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.38.bb =&gt; python3-langtable_0.0.51.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
index eb42fe978..8340382d1 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
@@ -6,15 &#43;6,10 @@ SECTION = &quot;devel/python&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504&quot;</a>
 
-S = &quot;${WORKDIR}/git&quot;
-B = &quot;${S}&quot;
&#43;SRC_URI[md5sum] = &quot;5d28198fa933dac5c037108d8f5cf3bb&quot;
&#43;SRC_URI[sha256sum] = &quot;8d4615cc0bb0fa49faa05b55ff49b1f41122b8092ca18a5d10f1e1699d6d7b3c&quot;
 
-SRCREV = &quot;35687ca957b746f153a6872139462b1443f8cad1&quot;
-PV = &quot;0.0.38&#43;git${SRCPV}&quot;
-SRC_URI = &quot;git://github.com/mike-fabian/langtable.git;branch=master \
-&quot;
-
-inherit setuptools3 python3native
&#43;inherit pypi setuptools3 python3native
 
 DISTUTILS_INSTALL_ARGS &#43;= &quot; \
     --install-data=${datadir}/langtable&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D475344116A0C07DC7BD4233--
