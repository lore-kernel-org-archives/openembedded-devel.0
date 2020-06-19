Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.74])
 by mx.groups.io with SMTP id smtpd.web10.10701.1592583619403802370
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 09:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GZWcANgf;
 spf=pass (domain: windriver.com, ip: 40.107.69.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dL5ZK31CBBKIWxt8JH6/l8hLdlyGlEvUtie1/8FMVcoHgRZu8qdka+K9ZLRlpq4LpQnIcryrSmS3gIlI44ZBkufUwEz4eDURs0XLfutEePwjUTYFKyi3az9fiVXXt93SEbFCN/5AXArgnrqSz6pHDUr/IIBbqsbJoLRFcUVK6JqHs2IIIir+6LONoeto9gwDP7pKRTk+l9lY4K1RQTmMDDrFdmOSiRO981eQYFepclTxpdrOHX1TvM08RwzadWxI/tT3Mvuib+VTdyxnyP6wdYC8vIQzb3iET3+/zSn7DYblnLlORA2fAiR2ajyuhH1JYf2X6oZtK5LYY2FRs/8g9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TddRrhTYkQuHuLx0XD3AJ5F1fwNJRmzGi8yFaRK5yI=;
 b=JlvoG2zFb7OZRYDH3REKvdIUQhf/yekwoT6M8h9Bsn0gnr4+Af/eKFcHiXdhCX2XA/hYiWgQ+Zm0XLZ81WXe6uC9uBT2G10KrYUxAiqu5Ohz56XAN6DHbTgaum94wWIxX29cNJ/kV85e3rRpuIU8rjif//x8iPbmVUM+n+0+sk8hYagdpdxsRWVN2LKQrSAauUbpLYPEmHZvL+Wzz+YqtNk7CKVNKwjwsxyZ/NZ/4RczIu+4Lma5SnNKL4HYlE5nlzN0TVc0R84vYj3EjnnrOOgKoYZxtDxt9s12mhhAdHmaoigP7OMHUsaylAUroF4gytKKmUvs08i5TEch9iZ8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TddRrhTYkQuHuLx0XD3AJ5F1fwNJRmzGi8yFaRK5yI=;
 b=GZWcANgf8lGsIp6Lv8iEMij3EAz7HGQECnM9bcstMHeWrd8k2VexDMtwyxCBQYE4jtZ/rI+vppfHbgmP77mJGGlbsYzvtzJnAVbrxiysS7mTakj5GPzOPaP3MM/hIyK7+k6eBTgAiTczcxNT/MXhxt+s8vol0oGDBOFvmsLmKoI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB0001.namprd11.prod.outlook.com (2603:10b6:405:69::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 16:20:18 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 16:20:18 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-pyrad: add package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200618152805.13075-1-akuster808@gmail.com>
 <20200618152805.13075-8-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <279a3789-c03a-b210-4ab5-066cedd9cfcc@windriver.com>
Date: Fri, 19 Jun 2020 12:20:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200618152805.13075-8-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::26) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 16:20:16 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96f96bd8-8a10-47dc-832d-08d8146ca7f2
X-MS-TrafficTypeDiagnostic: BN6PR11MB0001:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB000121E190F205C8AB4393539F980@BN6PR11MB0001.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SS5+H2le/u3NI+mz3nd3rwjrRUJ7uGExaXupk3ToezfqQQFX34dzxLg8zIPlgrKc9ThkvOQ4ABDQyQkKNVof4I8W/mpzzTxizwjwqM/xI4ATcIRxKxhKXhL1h6ik9CYqCUkqiSZV9QEIG007zUysUcZTHD+VrMM4l0xCkDqSru2wmAfSt4k+UwgXXQLHr7cpdrfhgmho8es3mPO5tAlHcsFYekJbUdYFlDmXl9rJXXhJykQuVt9WB/4h3G1ohm06xeC1x2C2Vc5QWKFKHwvE0q+CPwore4cLOVHDgR7PAlU/mkq1Vhd5g6O3OVfhEZRMNww89QSMdKB2/khcKbOl3nGDsGFUXMoeqKHfq2yVFPVgbsI0XcAwaEsWoCNoUNTSLMl7mn/jVPbr9BiNZjc5NAeuGz5U/BytRIGASVuPcybUfxrFL+4iMHWGQzTWrpFAv58jUHFgiVSDPcFUnSgqJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39850400004)(366004)(396003)(376002)(346002)(5660300002)(31696002)(16576012)(316002)(478600001)(8676002)(8936002)(83380400001)(966005)(6486002)(16526019)(2906002)(166002)(36756003)(66946007)(66476007)(66556008)(31686004)(86362001)(2616005)(52116002)(53546011)(956004)(33964004)(186003)(44832011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ots1dt96bvqo14caySnXPuTCJpbflz2ftS3GrLR1BhpnToOk3FRBo6Jm+LV+7tDvpDLOSmX+UgVaFHNRZ4ZWKLslAf9T/0EntcvqB7lkhPO5St85wXgumvvbJUq7GAEyZ29xit1cKFiqd8nfDmc9afHkdNLh/2RnOKmCklutyOSrO+zh1M4NoI8I1M8gP01RpXIAcEKC89tZ5ta0alIHmzNk4HlvKVT6JJ0PdcWaT194tslTLCdX16Jgc5BRy/rl/zLdUFTosKyC9T3Xjpv0hcKtXkoTnho2o0cGASWia4bYjcRYdLf+S3HVdvzSnsgVn7FKIk3nsbYEhDVb9fnNvAqJp1JVb0ArenIYiD6Z9TK0H6xgeyN3gNgugUY8XGFaPq3x7rBKZfjK8Bmx+k6ntSizbmFPEfSvWGeXvGH2BvDWYqhl25iagiJ751w++L8s8yD9h0ODAVP2JZ340HZH3PvpZP2d8azZvZ9R2RpK4JZQWSK8ifNDLJHDva4YWEag
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f96bd8-8a10-47dc-832d-08d8146ca7f2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 16:20:18.2247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caFLcWDNwoN/y4sZ2RNqZFDFLZWUXwOjnFS5loONWaWimwtFTXGXcxV2FU1ER/Q+gJfOA5DdHXXwDB4mVcEDBDyEnP5m4yCp9Daw6fUMby4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0001
Content-Type: multipart/alternative;
 boundary="------------7FBFB0B1F4EC7BC5A1577E7A"
Content-Language: en-US

--------------7FBFB0B1F4EC7BC5A1577E7A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/20 11:28 AM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pyrad_2.3.bb | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
> new file mode 100644
> index 0000000000..3b38fb3a4b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "RADIUS tools"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=debd8dc49cd9a7d58c7fffc771efed4f"
> +
> +PYPI_PACKAGE = "pyrad"
> +SRC_URI[sha256sum] = "89c4d9b2cab1746c48dc0d93898d278e34a40acedf6f511aeaa748bcd4490295"
> +
> +inherit pypi setuptools3
>
> 

--------------7FBFB0B1F4EC7BC5A1577E7A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/20 11:28 AM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200618152805.13075-8-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200618152805.13075-8-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb | 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 9 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
new file mode 100644
index 0000000000..3b38fb3a4b
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
@@ -0,0 &#43;1,9 @@
&#43;SUMMARY = &quot;RADIUS tools&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=debd8dc49cd9a7d58c7fffc771efed4f">&quot;file://LICENSE.txt;md5=debd8dc49cd9a7d58c7fffc771efed4f&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;pyrad&quot;
&#43;SRC_URI[sha256sum] = &quot;89c4d9b2cab1746c48dc0d93898d278e34a40acedf6f511aeaa748bcd4490295&quot;
&#43;
&#43;inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7FBFB0B1F4EC7BC5A1577E7A--
