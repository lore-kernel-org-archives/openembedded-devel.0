Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.53])
 by mx.groups.io with SMTP id smtpd.web10.2307.1595522960708983109
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gqXyFFSI;
 spf=pass (domain: windriver.com, ip: 40.107.236.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZDELhgbUkWzP5U6yP1mX6w8RDFIT5OLRtzDLAUxnkdVFlTmB6s2d0yh6Sp9f4/9IEv6MOJnMuXyoVTbziFoE9HxusujEjZ8DkpxHAki4MTRWWnKc66nNojbHn13X9o3xgdEeC2yydhBxUPAG9VdiPMffiMzNOffn/iIlHPox1BIKbfGOnQ/7rdbv9DXcjK7m99WLLm/GHdutyGwQgpeuiulTdDeKYllcuWD2Ay8D8anTcoNqAw8C9XsXkwucFNCMIoON75luB2zfqIOy0nXa7/3zI5ih36mIoOJVXqPLFhI4uJ4ydZuWCF6FW7cE8pDC+D4EFVbfP7UIbf3WhyMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/c2DxY4aHnRr1QWHZ0fAVPsG538no8ywTeVBtnmaJ4=;
 b=ECfaVPFvS9Ux/UgeE0ozJj6FhE/3KnYVHLSiJV9SW5oO7IBhdsRjp8JYU8fWGvkdzONwcziNztAoUQii82G0qIe7pjxKmMsRv7NIjv4S2uBXWvZMXcVsDlr81oG3nMgfh/Vfqd/ag7Cmc9k8tuZ6YPzkMy4eJHrqdePvE1dPyR8HEvp+Ga6XWVlCqOSV8P3+hnNstwdUah/0Z4F32gq8HEI0RU3zgP5JzRzA9w5K5y04j0M0Tov4UOBZJAkkjPGQUbTI1Kje+8v1HaVQPGnjHaWDH+8nojGs/ejC9iM+KxGQ2HKkIfSLt3v4IMjq0ac0bmLULEHZ7wKNCfsu1vvJtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/c2DxY4aHnRr1QWHZ0fAVPsG538no8ywTeVBtnmaJ4=;
 b=gqXyFFSIgWDJ4oMr8sz9Z+ba1tzmU4BE+HxVQS5FJhtUOJBd0fDT4M2d7ZFjXp8WVlUDoVDrS1rfeC95bgL9ObwpPqwYSPCTkvI5/IYUF1PIs32XXVkLA6FaOhvDK5UQJ5eMHKGBeUamxVJGpQhA1Ok44LCui89Pe6m4jeay090=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1601.namprd11.prod.outlook.com (2603:10b6:405:f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 16:49:19 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Thu, 23 Jul 2020
 16:49:19 +0000
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-bitstruct: Added recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
References: <20200722225608.3968953-1-raj.khem@gmail.com>
 <20200722225608.3968953-4-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <77973853-fd5d-f1ba-93d7-6cde0a22d7a3@windriver.com>
Date: Thu, 23 Jul 2020 12:49:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200722225608.3968953-4-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::17) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend Transport; Thu, 23 Jul 2020 16:49:18 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dfbcc07-8f79-4592-a703-08d82f2857d5
X-MS-TrafficTypeDiagnostic: BN6PR11MB1601:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB16010047AF250B1FBA27BA7D9F760@BN6PR11MB1601.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WmFyBUG0ve+MBcOUgWLaaqqssCqqNdNaYGjVr2Uugsa2t5z42ur1gMqJzPrvn6MJzEOFlJ07yvnl2ILJ7Z2TEmlp3xLr+bjuaIxiFRKKUmKpsVlcqZFaDfIy5GyK746leArDh2B+9lPKwZE0ufFvURq/cnpusJC7I0AD5jnzxN7I14KwiLriSvQfKXHXvApsdS2wjtzDJmxlAQ9CHx77C5i3eSsIotqG49v/FkT1nPR3x/eno7oNXs5kSZ0iCe6iqAx8hqVzp9R1ROmjzT/fKPlmauSaK1joesiMTXjQBOuCgYwVl7YuYHHvO6lmm0ZoVhjAgrBX0pzheibD5L8zbqcLgrk8ObICKG3k54tyGjQeSuBFbTtmDGWiLzdL47xiEHADVlIkiJn9fzWc/sXfuVKfC/rmWjrIQdWwdXzZJ9JJMHQlni38FNdwFOwHzaTOhe6C8WRE6okN56jIQMhA9A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(136003)(376002)(396003)(39850400004)(2616005)(52116002)(26005)(33964004)(53546011)(478600001)(44832011)(956004)(16526019)(31686004)(6486002)(186003)(16576012)(83380400001)(66476007)(66556008)(166002)(966005)(8936002)(31696002)(4326008)(316002)(86362001)(36756003)(5660300002)(66946007)(8676002)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lcAfhk5C80L5dubYshHKgLDHnyheTXML8ngp+d3ADPXKXpgsSIf5gA+xyF+cCnh8pAnzbOO71A9O/C+VfTZn4yT4IVMMJBGJ0fpEpM9C9NtoIaCjjjwMplWexufnBQowKDAylkfHquk7nlPaBFSfVcG84q0Kbamin0kod9IuTJYMCq4O++kMIblQp6RX5oL89bg3tp/h1uVFCi0QUoshm2kDfs4twZo+1wIyYxDYOdj5ovfY9muYVvz2H9kkmMaKyCk7p5CeEOnCpoSUS2IvJK5EyoWXljQHmBxzKSWuyiVffWwNO8E5qlL6cIhacfTiXiu4tMCXLAIXtVMynxrm1RUzIcVVE7JO5eZ/SuiuD5CWfooYsb/SiMSaILwncl4jHJTsxdBoYnxE6xwWKCswJykomm72egISf9PNWYoI+sYLoeSJXCer1eO1CoxMvTHGk8TCd90aLpLAKY6T/aIkxiSSh2+BApjXPkTCa2ervCrBaG20lBrxbytC8yQ68shp
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfbcc07-8f79-4592-a703-08d82f2857d5
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 16:49:19.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vZTCOHPEZDEg8+1Yzvi6YwpIN0TtRPsGmKSX/TG+pmBJMp3UAqqDINqdi5R5FTOGTWmye2CiMWa0TO2eDOZ4dOFHyHKMNukOLmdJOvKWf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1601
Content-Type: multipart/alternative;
 boundary="------------E77E002664F67D4C53207044"
Content-Language: en-US

--------------E77E002664F67D4C53207044
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/20 6:56 PM, Khem Raj wrote:
> From: Colin McAllister <colinmca242@gmail.com>
>
> Created python3 recipe for bitstruct.
>
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-bitstruct_8.11.0.bb             | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
> new file mode 100644
> index 0000000000..a25380418c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "This module performs conversions between Python values and C bit field structs represented as Python byte strings."
> +HOMEPAGE = "https://github.com/eerimoq/bitstruct"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
> +
> +SRC_URI[md5sum] = "8eaf853c95e10ca4b6bca2fe5ff307c6"
> +SRC_URI[sha256sum] = "2b13f2c3e76b49e8cd854f7a1da590bb73ecbc6cbfacc2d479eacf2b88282d5d"
> +
> +PYPI_PACKAGE = "bitstruct"
> +
> +inherit pypi setuptools3
> +
> +CLEANBROKEN = "1"
> +
>
> 

--------------E77E002664F67D4C53207044
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/22/20 6:56 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200722225608.3968953-4-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>

Created python3 recipe for bitstruct.

Signed-off-by: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200722225608.3968953-4-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-bitstruct_8.11.0.bb             | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 14 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
new file mode 100644
index 0000000000..a25380418c
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
@@ -0,0 &#43;1,14 @@
&#43;DESCRIPTION = &quot;This module performs conversions between Python values and C bit field structs represented as Python byte strings.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/eerimoq/bitstruct">&quot;https://github.com/eerimoq/bitstruct&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd">&quot;file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;8eaf853c95e10ca4b6bca2fe5ff307c6&quot;
&#43;SRC_URI[sha256sum] = &quot;2b13f2c3e76b49e8cd854f7a1da590bb73ecbc6cbfacc2d479eacf2b88282d5d&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;bitstruct&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;CLEANBROKEN = &quot;1&quot;
&#43;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E77E002664F67D4C53207044--
