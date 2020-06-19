Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.73])
 by mx.groups.io with SMTP id smtpd.web10.10696.1592583607992476250
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 09:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NnswqPK9;
 spf=pass (domain: windriver.com, ip: 40.107.94.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6WulV+habiBBdbRU80v+N6GAEUK1nryeIfOLsazmfBH1brMJpdB4qoiQ8mc4QZxL0s9Vtw6kHwPmmdBxVsE03VyL1apncR8MLhu6c4nCGAb5GZ1BJQeDwFwXBeN13xzTeZh1e0vTFZfCdo8eLPYoRocMjzzxt2vF3M7QSrVCoxhmFAdMP/dKuYMgDNPSCrUykJ4jYOYPgYMRtXnKYd8C0UpP1Cddgn2DZGvbmj/JQchUQ9K2nhG5XupNbsWu+j95rrPTxwFSv1m0p+MJTLLkYMErxJvLEVt/M3VMzmdtHzNKtTBFhIeb42L3QQXixogkn4TjZX9XZrRL760M8BRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JEt2b6ycRFJhjYiImXcArL1H7b9I9Pxwxrleb7MlFE=;
 b=NWXcJHgJQl/QmQnfLY2X8X1y/WbYebItBWg5WjfnOLz3i383DIgspYqkn54nV/7ntvp6Ex2mm6nY8rXV/pduSs/gjeDzwjx3u4v7WGsbxT0sS49fluPfHaHXLsCpZI2d3T3NsSELeSvJMAt/nzeTXpbrmIpGAa7R/hZRgzmVSQTB3gXyqzhwX874x8WXkQZT+I7YQ54Mppi5dIsx2fy/+KH3salI4yV1COSq2JlHj0pH260wfYPm8vHbmIEgLoQWNUtDnQk5D6fAmP8b4PsYsgYlLaeiTf3wvgFwlakBOy5cYp9TdII2HwU30l+h07CtLQo5cYaQMwcz1nekH8Vdhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JEt2b6ycRFJhjYiImXcArL1H7b9I9Pxwxrleb7MlFE=;
 b=NnswqPK9SDKcgI1BCx7HmxDFIRIojwFNPGWp7JkQpSp2MOLb8qgq6isdQ8BZj4hpNdXC/Zwsofxzmy6rUIdJ5+29EWperhbs4MZk8XFrFzIIWkOHUsWgXGzIFvtrTztaCcfrcdJTIIamvkgzgzlq/OhL0cZfg7YR6WjWN0six/0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Fri, 19 Jun
 2020 16:20:07 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 16:20:07 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-smpplib: add package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200618152805.13075-1-akuster808@gmail.com>
 <20200618152805.13075-7-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a88bbe2f-704d-8ae0-09c7-0d5fef9e5aba@windriver.com>
Date: Fri, 19 Jun 2020 12:20:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200618152805.13075-7-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::25) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0146.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Fri, 19 Jun 2020 16:20:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cf613dc-553b-4138-e328-08d8146ca126
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3954D2503203BB635FDAB5459F980@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6n1oXkpFmKvOhqekL7kfmXHCMwnU2qdFxc2hADixcBRtn0wY027B87vXagvz2ozvs9ey9VRCy3I0odptMAWD/5yGNbUEs0UrIkcSjwSS2ptslFDa2rbGSZCUFBsOgZC4Uh1k/04i5bI7Ay3CN3uzKv+8IEoykE36EslKVnAV14JB/M4yGtsbxmYsDrGpGqqVSDTYyqB1XhpG+7Zb0zAtW5mn2Eam4odVbeyspZ3eFwP/KLDs/wPVrJZyri+nVGc/Q0UMNMsZeq7Y1aghGMIAPePXMRFtZyO8Y4KZ6gnX8hiaaf6GFLd721CfSb7i7Uc5t+7U6y2q8F1qHRnX3HUeeDnE2xoR0nXY98xcdsqdKF7E6eK25NOWUuMOIEaS/NuncS/T129uA8YnDYh4xQvhFZVKF7X0nP2nAAR7Ja12YRthphHfbWGq+Q/4szX4yl33/zUxLuxARuYPjVh550+Rtg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(366004)(39850400004)(396003)(5660300002)(53546011)(6486002)(478600001)(86362001)(83380400001)(8936002)(26005)(956004)(166002)(16526019)(44832011)(52116002)(33964004)(31696002)(31686004)(2616005)(186003)(316002)(2906002)(966005)(36756003)(66476007)(66556008)(66946007)(16576012)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	x/3i0SZu3kALfY9IWvX58E89ZytVhoKVd4BMR1ptRV0sr4DcUk990jpYOYYUupOh3V3+H4CJhaJjy4KjRBI3nzo9EBwMLulJbTgjpq+pA2xfpj+tzhG7BRUuBG5Nab5LoXYilNVNRY3Wp2rwp00gT1MdqeJp6iOsJr2Kc0GwKJYOamvcRTv2uIEt4nJPxWhvEbWLhQgIGYWP5vQMYPYaDRSzIKK98D+Yhkk64AsC+SkXuO2EyMPzkhWko1ZGDQmZjUHz9uOL3lxMSG3pQ3Wms3oZgQwO0si8RzbK2QmWi67lthfMw5DfGHDu9ya+wAbOE5c1UT+5Zx057LLc5VmDCMWGk3NvmV0MsaSAYbfrQ24z1rQcOwf12O3VeuOpG5H7D5eXeGo7UVMPtMXj/fud2KHgZPtFDOG6pS6d9PCWbULxctNs6kUFTpRk96P1xNamu2r3naYyEV/V5joiAnw/zakzyMB2p5r4mJ9E7u1fJL+CvU/tc1FI/qQlvQNCZyHq
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf613dc-553b-4138-e328-08d8146ca126
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 16:20:06.8403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6CgHiAliLsB61RKtI8L+QjWnBVYmkuHfLHnNpkMCO4lsrlFFdfvcvcO2xZfUh4WxFvD3YzllbLeKs8KANLCCb0Q5rJJj3i1BJNSUWLOUk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------A3E158BCB3D920BF6F9152AD"
Content-Language: en-US

--------------A3E158BCB3D920BF6F9152AD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/20 11:28 AM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-smpplib_2.1.0.bb     | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
> new file mode 100644
> index 0000000000..948af58aab
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "SMPP library for python"
> +SECTION = "devel/python"
> +LICENSE = "GPLv3.0"
> +LIC_FILES_CHKSUM = "file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe"
> +
> +PYPI_PACKAGE = "smpplib"
> +SRC_URI[sha256sum] = "df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94e208dc120e0b8a3fd4b"
> +
> +inherit pypi setuptools3
>
> 

--------------A3E158BCB3D920BF6F9152AD
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
    <blockquote type="cite" cite="mid:20200618152805.13075-7-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200618152805.13075-7-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-smpplib_2.1.0.bb     | 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 9 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
new file mode 100644
index 0000000000..948af58aab
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
@@ -0,0 &#43;1,9 @@
&#43;SUMMARY = &quot;SMPP library for python&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;GPLv3.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe">&quot;file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;smpplib&quot;
&#43;SRC_URI[sha256sum] = &quot;df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94e208dc120e0b8a3fd4b&quot;
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

--------------A3E158BCB3D920BF6F9152AD--
