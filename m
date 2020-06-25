Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.66])
 by mx.groups.io with SMTP id smtpd.web12.9806.1593089921533740451
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 05:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pXJBuoCL;
 spf=pass (domain: windriver.com, ip: 40.107.237.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzY7p2hnsu7FbnzeGcN+1tKjk26ZF/w+en+yFJG9lW08wmMRR8qiwfU2Vxu6sWf4lAXo7b0PuPolTf+SleiThhhiKNzRZYPXp43NkFM5C5DTSaM6Fz+jUWm/ZRDMMHBXYPhugsu3JUtx+RuLF5YYgVRyRSqHlmDRnieojgrpsaBfnrwL3bLlENxX5yrjbBd/iIlOh2UA0UVXwABRS6TyBi76F7v1XODXDq/P9pmU/+kAtuCgaKYlNQscrhtrtZwdxrsxsBiyIw1Vvn3XezOeqF81Gtz+USm4wO6bn4V8z6sIIgXOioHnWRygxqoqo7hP6vMLoW/xbaw5THM8s3CGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ABBAaRw0JbuLgcgoa5c+x3ifz2vUqVrUeHNSc5pkTo=;
 b=JHruSk1AEw+CbOfr31Ol4JmWbT6KbZGPFnk2P5p9JjQRUhUVrijszFtpdjaQ8LsrpxIMca/RVO6cS2xhqXO+bWHP67PuQpqDBUZz8eUzaVT1lRrRfiFFreqI1iU0ujot0Zfd190FtWQsEZR4jnLwL+oZt39xSiNAa69lgwWtCBqDe2DMXzqN3V7ScdWh49THU6OhgNUbI/Mv3pNF5NQoYIMDpP3LdOs7TiBjEwlpEeuIXUE3Zpnp+VBN0cOc2+Bkezb0IrkqVjc3JKJy7Kd1uOSO5rkZlQqF0oYcklZzxFEoWNxBln9sKQO+4dNaY9CquRRpml0cDcchN7InR66XiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ABBAaRw0JbuLgcgoa5c+x3ifz2vUqVrUeHNSc5pkTo=;
 b=pXJBuoCLtWuhzfkNwMzwdq1dpcwu/MXxVgw/SEP1en1WhUPXzZHMz0X++Ze5JccZdgUf9Z90XB2SRF0c24nyro4li0beyzHebWsfg4/2B/hnlZRm3eSqqyker7TKJjrdUszTLtarVkUvp6M0eN7/Mywto+/9+XL+kI6YJhFykKY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 12:58:38 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 12:58:38 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-requests-toolbelt: add recipe for v0.9.1
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624184533.1438-1-sakib.sajal@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <04d04443-f40d-daaf-1e1a-0de8593bac8c@windriver.com>
Date: Thu, 25 Jun 2020 08:58:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624184533.1438-1-sakib.sajal@windriver.com>
X-ClientProxiedBy: YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::16) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 12:58:37 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82d72776-f3f4-40cd-b17e-08d819077a1b
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3954E568C88829A6D099D1649F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	018uhh8uSS3Q9DpebSu8oz+hoy4KHiAZFCluVPt2OWS8eTOBSKuKFqWfWkTFefoB4RMkvojWcoGNoqFxBQAIfOmxe55uG5RFJ5lmvtISNC77HaZcBUFYHRn70Pd/i923q2+MjA+Dca//nOPJawq+PNg+/Qthg9ElpK5wa9w1MsZF7lvNsazGTr7cO+c8b9hLQqiLElXekIJDMQJeTQdQtZFuSNYh6P8anyksOoVOt3xF1UXgnjGIx3fbJnufKTdwFcRbJ5MNNpAHv0kuMTooGirVoS066RTJqcFiCK9qh1LCml3nQhz5zrl4AqrhZ7qR/3dtyNPibgXvCe/m91DSEohsRyFZa1MR6kZrQcXwO3k3nZ4IjZTB/FNwOoCqn56s2ToHhQk5f6J9w+1IhbLThZd6VuGHXUfcLw+FIsuY0OyIMWczixNVmNEabqAONQrwjfxN01OR5oU7yV7A7lhXJA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(66946007)(66476007)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	PiPvZJWdGtfYzkRyHosz3jKdqOiivQmRj6I9Xwhp5QzXi3snSeUAPDfDDOnd+3ZbpVXjJkkq6BKn4QWsMqmjkz1/6p2GPj+YYwIlUKR7gXSKSThFHLNEQGIXbWod0eXqUWminxyuoq29mKnUg4cvMtFGmLnSHwPxXYR2/vuQe2J01NZrXCnLbTNByLm+qXIFKRqKPoX/zDIP+IMdYxg4SQbKS3V1AoHUs/22wo3EtBX/b+sEO1RJdS0AfAmE4RjNuTIuRQ4REs20Gno/R+PcQN0e8RfwGklTnu2xaewz/pERGQEmyl/NJ+TcAmVuB9VIuIWPrqLHicHUPgB4FArstkliLt9wj8911n1/dS/9XUAENFSoLrlrnx0hd/16xA/K0H9PQjICwehhv0qHmcIIMjW4P3z10ziP2XY3cedW1Ewwbrs0G5bs4s56uE2+I4xYs9HDrF4rjaP9jtmofRvkbPp5RRnPKQ/xPvuSuX48VE4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d72776-f3f4-40cd-b17e-08d819077a1b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 12:58:37.9361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIzwwwP6cumKQg1rmeqElf3ZEUyxhJBX/ELgaMacQQr1fpDkZT70ocOokbNp5KePrrYLWKxA20HwZzG7H40nS/XgsxzEwq7Cr4hr2HDDsS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------98A3B537491F8EA59514E3FF"
Content-Language: en-US

--------------98A3B537491F8EA59514E3FF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/20 2:45 PM, Sakib Sajal wrote:
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-requests-toolbelt_0.9.1.bb    | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> new file mode 100644
> index 000000000..3beb39718
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "A utility belt for advanced users of python-requests."
> +HOMEPAGE = "https://toolbelt.readthedocs.org"
> +AUTHOR = "Ian Cordasco, Cory Benfield"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
> +
> +SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
> +SRC_URI[sha256sum] = "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
> +
> +inherit setuptools3
> +inherit pypi
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-requests (>=2.0.1) \
> +"
>
> 

--------------98A3B537491F8EA59514E3FF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 2:45 PM, Sakib Sajal wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624184533.1438-1-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200624184533.1438-1-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-requests-toolbelt_0.9.1.bb    | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 16 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
new file mode 100644
index 000000000..3beb39718
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
@@ -0,0 &#43;1,16 @@
&#43;DESCRIPTION = &quot;A utility belt for advanced users of python-requests.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://toolbelt.readthedocs.org">&quot;https://toolbelt.readthedocs.org&quot;</a>
&#43;AUTHOR = &quot;Ian Cordasco, Cory Benfield&quot;
&#43;
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571">&quot;file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;b1509735c4b4cf95df2619facbc3672e&quot;
&#43;SRC_URI[sha256sum] = &quot;968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0&quot;
&#43;
&#43;inherit setuptools3
&#43;inherit pypi
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-requests (&gt;=2.0.1) \
&#43;&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------98A3B537491F8EA59514E3FF--
