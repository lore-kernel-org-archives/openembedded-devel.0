Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.71])
 by mx.groups.io with SMTP id smtpd.web10.2291.1594578163950836064
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 11:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VXrrHUdi;
 spf=pass (domain: windriver.com, ip: 40.107.70.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blpbjtFIcmdfcP2DzFtIyF9ylbq2z4YJWAxrg8Ru/r710LpKwtG9Th54eLkJVKsEUmCKY2+Xos5BAW6kLgc56g2v/O/+FabjG2msdlk9WWCSqnHXQ2Db2TSBXgB6vBCt0dzLJPKHy5WbZ0ctHTDO/4QyYlM2H8bGh0kjtIDSHqeLfByInCYfXBBsU2ikqufl5mcLC7tRY1WV2uqSniKJxd8MbdBxBRlNMq0u9DBLhy/bk3Gy9fVbrUsLrYmP27pxd183FK8yUSEfJhR7COo0qTOtymZYeNx+9+jRMs7vMud1a8at0bSMZfQfRVwnquQkoP7SK7gQSqPOBrRHcHnr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGR/Mol5nAcAimSKVnP2VtVGDVdoBDNhej4vtu+6qbg=;
 b=EvnV8RIpufdeUs4roSSfhlcFrsqIxTn6znV3/1JvMqOESgcKkz2bkd+Rf9Pc75EvbqYno7rPOJXgGminybwAbzurimp7aN1zICfkp+j/jyJIwmO1kq3XVYfZnjoKmuFRP8mMAAfOqbwFIisiAEl+fZOTonmQiXV+hRkToz5U0cy/E//Xmr+VfO7BPjW0Jw/sDxF6qGGkA2ui0G6EzpGbC7b4CCrnJjHv8jNBdvoZzMBsmKjHeo6iRjrMKOKJRNkYhVZ30L7/5SObGFSgVujjh+8HwXps38InBa3OiE6La+WXXaPeZ1eh7AbeN14u0uMhWzSh42Bp6aHZOhgVrAtQzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGR/Mol5nAcAimSKVnP2VtVGDVdoBDNhej4vtu+6qbg=;
 b=VXrrHUdiFfpNLhPAS8c656WDpdVwv+d0s2BhWngobfFMHWH2VkH5gkF4BgJgsSc9WkVpYyRR1Q0Nnd1dMguCagFZo6gpkR1kaY3JPAUb16W4YJ3nT/K1JhKcUg9e3KDIuD1LssPWHjvHACanbRHvqi45UROZgafymqsb8rY7F1Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2844.namprd11.prod.outlook.com (2603:10b6:5:c0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Sun, 12 Jul 2020 18:22:43 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 18:22:43 +0000
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-mock: add recipe for v4.0.1
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200710181555.29809-1-sakib.sajal@windriver.com>
 <20200710181555.29809-2-sakib.sajal@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ab4e816b-68c8-a9b8-c9f7-d00f2e7c0082@windriver.com>
Date: Sun, 12 Jul 2020 14:22:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200710181555.29809-2-sakib.sajal@windriver.com>
X-ClientProxiedBy: YT1PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::15)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Sun, 12 Jul 2020 18:22:42 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcdf9eef-6642-4cf2-d4dd-08d82690913c
X-MS-TrafficTypeDiagnostic: DM6PR11MB2844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB284442F34798314E4E148E199F630@DM6PR11MB2844.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nDey5H451xM2JM+BgnB+s7t5WR0HxlcKLkouB5VJ8HLLHd2yWxYuc+Q9UHBABOEdiV97fgiNnUvOTIYo7klpvTH+n0vG1xKtAl8UdyzcAHU6zzurf5/4Wd1/qevd1Te9V+nTVShePSKatD97pYm+dBk0MHlpEEcURyJWmf0ApEGgGyHA7xEHdwRZLpvfG4zzmhesMj4T989KB8iPwnIeluw0QwIuxrnzmS3Uz762dePx5f6GsEnULCmTcfqv0B6W7GHtqd4X+ApFVXaIkfyMfOvMBlBc1eX88lmoPja2QM7kYqs3ZglxS1I1YyYAuPJSZouATsule5JqqVikVVbnQhdIvmJTuJa1HQkoZ0272ap6In4HmyWB7/w1aDIInLbrk2GoO/BpNkxlc7pK4R6cvxfVEwDT+0xBjxRE8mdkEGb07O6wB+jMHr2ZU7xBdBFPddEXG2o8Dq7BkbpWhjbJ7w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(39830400003)(376002)(346002)(396003)(86362001)(31696002)(31686004)(66946007)(52116002)(66476007)(5660300002)(16576012)(316002)(66556008)(26005)(966005)(478600001)(33964004)(53546011)(8676002)(8936002)(6486002)(36756003)(2616005)(44832011)(956004)(83380400001)(16526019)(186003)(2906002)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8pi2sNgi969OKAtyqfyb7BqwVI3h3J7j/Myy4ng6ddp64MNS7E80uoBNNnlSHz+BMnSm8mnxezsmZXNghPta8DrMP0bWCd8znh0GB49nPURpE0CAnnrTh6oHGAVQKsM69Tehb3o/1pNcsYR2DbCEdVcmxOkUTyaKf+HdUuVDM+MNsMYXN7SwOW0221Z2r6sNOUTBCx0Lqjnj4zdjpCrG/r62v/vmT9t7OIkPAB6ZqA4HhRpEgUoS2DMM5A01F2MAeQPcUhwFzc2B+/8I/t2xxp8GSjink0TmflGqN72ZurNH2zFBvAjm0eeBRs9YIX/5oxkZKOKCoRP9NmpkFU25PoR0ymQt3rOjpOrrC5OPwbMo2AytGOT9bKA0rc6KmM894BqZgYV+GRmLYa8duNvZ3FMwzdGwj4rXpUYFsovLGM6RGsVEcVt6EW3Zeo8af9hAS8nc4jcAqZWVXvvoKUGOdUKns2HjtILC6mGAfeGKCX4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdf9eef-6642-4cf2-d4dd-08d82690913c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2020 18:22:42.8835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swS7utZqNl4sIC1ANJ+TqaAhb5HjHL1VoEVscuudRNNsXlyCK1ErlukdUTPLMdrOWPLlJecuddOPpRpXDIkqohd/GSX4R4W1B5KMSBm1w7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2844
Content-Type: multipart/alternative;
 boundary="------------67ADC887CF612C983573CAB3"
Content-Language: en-US

--------------67ADC887CF612C983573CAB3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 2:15 PM, Sakib Sajal wrote:
> Recipe is brought in from meta-cloud-services
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-mock_4.0.1.bb                | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
> new file mode 100644
> index 000000000..eebfcdade
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "A Python Mocking and Patching Library for Testing"
> +HOMEPAGE = "https://pypi.python.org/pypi/mock"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
> +            ${PYTHON_PN}-cmd2 \
> +            ${PYTHON_PN}-pyparsing \
> +            ${PYTHON_PN}-mccabe \
> +            ${PYTHON_PN}-pep8 \
> +            ${PYTHON_PN}-pyflakes"
> +
> +SRC_URI[md5sum] = "8f48ba3fd059e7cfad92f8354064adfd"
> +SRC_URI[sha256sum] = "2a572b715f09dd2f0a583d8aeb5bb67d7ed7a8fd31d193cf1227a99c16a67bc3"
>
> 

--------------67ADC887CF612C983573CAB3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 2:15 PM, Sakib Sajal wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200710181555.29809-2-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">Recipe is brought in from meta-cloud-services

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200710181555.29809-2-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-mock_4.0.1.bb                | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 17 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-mock_4.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
new file mode 100644
index 000000000..eebfcdade
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
@@ -0,0 &#43;1,17 @@
&#43;DESCRIPTION = &quot;A Python Mocking and Patching Library for Testing&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/mock">&quot;https://pypi.python.org/pypi/mock&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e">&quot;file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e&quot;</a>
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-prettytable \
&#43;            ${PYTHON_PN}-cmd2 \
&#43;            ${PYTHON_PN}-pyparsing \
&#43;            ${PYTHON_PN}-mccabe \
&#43;            ${PYTHON_PN}-pep8 \
&#43;            ${PYTHON_PN}-pyflakes&quot;
&#43;
&#43;SRC_URI[md5sum] = &quot;8f48ba3fd059e7cfad92f8354064adfd&quot;
&#43;SRC_URI[sha256sum] = &quot;2a572b715f09dd2f0a583d8aeb5bb67d7ed7a8fd31d193cf1227a99c16a67bc3&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------67ADC887CF612C983573CAB3--
