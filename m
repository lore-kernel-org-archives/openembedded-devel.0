Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.70])
 by mx.groups.io with SMTP id smtpd.web12.2406.1595522949640571170
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=inlwha0h;
 spf=pass (domain: windriver.com, ip: 40.107.236.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9m/VOLRkfpcguCovO6fAw7qTQBtJTyS08Ieuj7Wb3WWy5UQzT6QFK0LRdFxP+Vs+co2OVP1NGZRVGkqeFAcMzUJePinzSMU16tV6BbNV49LaGG9Lz9pKocePtf3TiPXxsg2FeAxi2+vDtNe/20YSkAoqIyI1a765RGDFX5r3p2JZd+UBwp36KoJJQGDnrrKChszzkpJDKwlyytkSUtMve6SXZlmBkyGuH+6zRFD9G7gAbd08tILXI47AUYoiv/dsLIGvyC7y7b0xUFom7PG4iy54WtYUPAM+dBvALdvmduu/waT9086vj8yRAbPX0ZvOdM6XB09fog1evg/OJuYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+lQ29OE87XbBg64vKtq2Ldlh9YgdWz9IC4oH0lS7gw=;
 b=VhV0nWKXn+8QQJM0+4QY3tYf5iMBc21ykHQX8FmIjcGcIgKXqydAwfXojFwxzTSKRfQWfNnxGL27oopgje+hEZcSMvHWAawWRLX17o8PMzT2IiBF+C+VibvJzAhEsSFi4zn8ahOF/DXdAgpDNEredJ+5wGXBiYfhhUArYqm5ouAI2Z9FYZuN23Zc/QB4jo19xFij9JD5TVQUb2ulTzYV2f5pAmZPC2e3jBydxc3spywhMqvK6uw1IXI2CUFmJBP/ftLQRDQA0GDD/fJ9eZjJEC5O8fF+GawiW5lSXFoV8YbzjAgRj4UPQ24p965dROb22xsDwXY+PYyYa89u47eVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+lQ29OE87XbBg64vKtq2Ldlh9YgdWz9IC4oH0lS7gw=;
 b=inlwha0h+QgSHSe7xE86UJqgEZfWqtVz5PrLDfXltN7B+WH0o/FDRP/Cpb9dZECSlJoxp0FtfR3wXKYx54k9nZ9nnYJPtosTJceArLpsTGshp2mHsMZkBcbcs+70QszUBdyRCBk6TGIHwl5b6FAxaXhCteG1cW3SBchhHR8Ku1I=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1601.namprd11.prod.outlook.com (2603:10b6:405:f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 16:49:08 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Thu, 23 Jul 2020
 16:49:08 +0000
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-diskcache: Added recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
References: <20200722225608.3968953-1-raj.khem@gmail.com>
 <20200722225608.3968953-3-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d8ee8144-d87b-36f2-cce9-e488ee237975@windriver.com>
Date: Thu, 23 Jul 2020 12:49:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200722225608.3968953-3-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0133.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::12) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0133.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend Transport; Thu, 23 Jul 2020 16:49:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e44b5ec-d045-4deb-6428-08d82f28511c
X-MS-TrafficTypeDiagnostic: BN6PR11MB1601:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1601280E5A0B0F385F1D09679F760@BN6PR11MB1601.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OS821Z5EuZ/bh1bo4RJd4MAltfNLdyiudE/wgFOZRtJywRF8BjGodKF+zySMoDuNlOvQFLBakpAu/6rOTRm4TqjUa8xUH67X/QVlmrESpIGSJ9tr0f6OBB73tqfn+0nIMd+8KPOT1u37VxaMw4Pt5wKvCkRx6Qv73+BLEgGqLKgXS5eDXf9kWa4ME5FYRac0o7SjAjzcVBr+NQJPPztfb3Xv6tqySq9SYifkq5j/dtQS4pw45/d78GTATL2j4EBTGMomgQ/RULBAKjr54ynCL+sDAcAO6uPVPTeG8mJrgeIZM3aKyoOK4h1ncGRvYs4ZlDo1kaaXFNPteq0gWmHyevxLxIvBInCWXyRQYrc60eUG9BFunx9T6wnmaNdVZnEqqHwWuPFaq0rcXApF9K7Yj4AqH6HSY1BGgY1kG3kbwPPWWDFxPJxjxmwW+ZevG9E5oEsOvjhtD4wf1OvWvLNZsw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(136003)(376002)(396003)(39850400004)(2616005)(52116002)(26005)(33964004)(53546011)(478600001)(44832011)(956004)(16526019)(31686004)(6486002)(186003)(16576012)(83380400001)(66476007)(66556008)(166002)(966005)(8936002)(31696002)(4326008)(316002)(86362001)(36756003)(5660300002)(66946007)(8676002)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ep7qfW8cDZ3HJNX9BMMGc0ceoLv11rySwCW31daErsOjFeWPBioHP7B/SB6mY9Dox4tsoRA6vc9FpnVkFQTEbIdxsvJ6TG+jAKl12lSNGfGbqkkc7Foztcp3gFfHt0TpYYB5CeGz0KVA7MRJ3j5dbGIHIPNdtMJ9KbcrQHFLLDrjrbsKDNr5pKuDsgdZlTkqasETFoFeDduB9i9DqHBUaXAMmmYK/lpH22nBrw7U8sGFjC8MMzyWMHhEBcgdQW5RjGEyGxwGkiC+Gic4C9m1aLJ0ygPNnV5oXdVd3rAQPPQ2hxhwiUSNP2QhuKf7tE2VrRbo4z6Y9mHADGCA6Osj8dSaIZG2Xfo+uhbeB+GO2wFEp3KznkMgHB6aNwBhudYommRklAzumCSXHOoxA6gxyMBWvFZAbmUyf1Zjn14Jyix/f7EFWQaMvtfhODcYuqlR7yAfJCSHjPqJ5JZN8Ztrui9++4f27aKe4NLyuRO+BFAIiQxvAeJNIYeiNzdsoTXD
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e44b5ec-d045-4deb-6428-08d82f28511c
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 16:49:08.1466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiZJjWD3rtGQPH3cO6+FqstymtOM1KCPhaa8K1z0gAQjMzhG0M03gslGOjbTUfVl8QXrZ/ZsuHS5xHKRNmU4IHZvqGCmZBcgN1R6iPLUisY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1601
Content-Type: multipart/alternative;
 boundary="------------C81276ADA9B12FCBB9814B11"
Content-Language: en-US

--------------C81276ADA9B12FCBB9814B11
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/20 6:56 PM, Khem Raj wrote:
> From: Colin McAllister <colinmca242@gmail.com>
>
> Created python3 recipe for diskcache.
>
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-diskcache_4.1.0.bb              | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
> new file mode 100644
> index 0000000000..91cff0cd15
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Disk Cache -- Disk and file backed persistent cache."
> +HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9e046ce8fae71087134866418f646ec3"
> +
> +SRC_URI[md5sum] = "21c9945e7707799e1c64956f8a54d4c3"
> +SRC_URI[sha256sum] = "bcee5a59f9c264e2809e58d01be6569a3bbb1e36a1e0fb83f7ef9b2075f95ce0"
> +
> +PYPI_PACKAGE = "diskcache"
> +
> +inherit pypi setuptools3
> +
> +CLEANBROKEN = "1"
> +
>
> 

--------------C81276ADA9B12FCBB9814B11
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
    <blockquote type="cite" cite="mid:20200722225608.3968953-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>

Created python3 recipe for diskcache.

Signed-off-by: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200722225608.3968953-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-diskcache_4.1.0.bb              | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 14 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
new file mode 100644
index 0000000000..91cff0cd15
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
@@ -0,0 &#43;1,14 @@
&#43;DESCRIPTION = &quot;Disk Cache -- Disk and file backed persistent cache.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.grantjenks.com/docs/diskcache/">&quot;http://www.grantjenks.com/docs/diskcache/&quot;</a>
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9e046ce8fae71087134866418f646ec3">&quot;file://LICENSE;md5=9e046ce8fae71087134866418f646ec3&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;21c9945e7707799e1c64956f8a54d4c3&quot;
&#43;SRC_URI[sha256sum] = &quot;bcee5a59f9c264e2809e58d01be6569a3bbb1e36a1e0fb83f7ef9b2075f95ce0&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;diskcache&quot;
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

--------------C81276ADA9B12FCBB9814B11--
