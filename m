Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.80])
 by mx.groups.io with SMTP id smtpd.web12.9796.1594384615652655755
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 05:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=W1sHePtr;
 spf=pass (domain: windriver.com, ip: 40.107.243.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiMtSR0Qm6rRAAVzVEFjZgDezimvDheKiAXI6fvqSFMPKYLvhG9ncfE2HwZCQ9B/TsKEPjg0MYbJIxZRfc0G3CRxtFDNnkJqiPd6S9lFuDgo/1IDdM24M+WNxtuIZQyuegTggYu1+IBVWYVAN6JiCiPwzVf3tn2RNL102YVzRjqvuElMQNgqHXF38eVgsHqOfT5gb1v9jnR4USeE3UurFKdzQVy3vxF2wTdXAsSk1i+9tclTDZBHYGV8BzBStheogvG7nHMD6m1L24G0vgAphL/zzCizkMayEFwXHdm63gLjZtNn++r6JhTCPuBjc6Nq9z/8VqzF7ld6a63kNf6nGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxEgicAzfua0iPvOW6LWwK7tyIWxKpg2Qmh2Z1BapPA=;
 b=je+7VC5CbwvhEppPKfAtGCtI3k7OmL3V0aG2HXS8DPnZDuUGQGw1Ui7YJDQ1Pmb9fpUbjk849s33/UIORr+adNjS5mAHbpRVJt3ZEijhcxE4vOcv16f5QBUoRvz8AgTwh19lrIUSlCDj6OiCYIwJ1pC2Mw0zoT4D+CxMDFqXWX8nLfnX9WSU90WaADRd7quNIHKK7TnIpwUIg9QaeYY1y4xoRWW1Mzx67V86S9zlCDf12qhRjZWSeikF4miWdbE7wNMiujV72Obp77/4RCGzo8zeUy/trffWlQ8gOaU99IMARnpiav69oKGe1o0S2jySMDKdXKRTLzu8y6u1VernTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxEgicAzfua0iPvOW6LWwK7tyIWxKpg2Qmh2Z1BapPA=;
 b=W1sHePtrGRRGU09BiKPtSYb6x0OFRB+ehv3Hfrs2TzuFrDTNfmGkIEC0+eSrpI2MgpGqEjJ9xg8RERuujQkDT5kvpsVAFl9HJynyOoFuQ+Gcn07Gjwey1C0TDcR5OhAGqZMZt2xQjLppwb+9GmbnVbh2ogFFp2vgl5UkaZcZST4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20; Fri, 10 Jul 2020 12:36:54 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.031; Fri, 10 Jul 2020
 12:36:54 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-pychromecast: Upgrade 7.1.0 -> 7.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a6c4718e-3a73-7ffe-2de3-1d1c14659104@windriver.com>
Date: Fri, 10 Jul 2020 08:36:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200708094659.27331-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Fri, 10 Jul 2020 12:36:53 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a54bd35-4d59-4f80-9f61-08d824cded1b
X-MS-TrafficTypeDiagnostic: DM6PR11MB4516:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB45167F78C2275FB4BDD3F8159F650@DM6PR11MB4516.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fgb8cr66opU1rbZqpSD3osXXokcfJKRzKmApBHwibEeduFJlspuXt8kqGjcbOiApj5hCuqsq4X0K7QIfNntZHDGVL5kZYriP57wjxbV+/yewwWTjrBJaE0RAYEo8Mn+4s55aW7smfJ11qB4sGrfeI+xihkzvzfkfbG6tT6ocvrnhDS7pbt/XvnKpm1Frowu0JJFo3ARGtscxmXJxqBuBm1RbXUgaZFGK3tPfeQWzUVoInEhpGwZFPHGmQmjC16yEBBM39yzO2AuCnSJaiU6zpJw4w+ZfyftmHhHHXZCz5QxyQchqdU/JFAINm6PNMHDkwAsyIdUFoyH4bdwo87pz1aeUiCNJ+hk1IqvTSAe833uJGwh49wwkhPkQ4dANIPeOzzbm1lyq8aM7Qf8yDSC8AOahxVSQ9q1TIl541gVPmqylHb8vPoxRFgFzpZ91T6keZ0oYRIFoa/ykjrLXdHmWAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(376002)(346002)(136003)(16526019)(16576012)(44832011)(166002)(53546011)(66556008)(66946007)(26005)(66476007)(2906002)(966005)(316002)(478600001)(8676002)(31686004)(31696002)(8936002)(6486002)(86362001)(2616005)(956004)(36756003)(186003)(52116002)(5660300002)(83380400001)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TR2LpVa1wtduj3RcQarI8YyCnRn5061nUNTHdNQqmuAkXxf3OaXxfp3IsjrufaekL0GPWPvrSJutf8BMC+Te/3/z2gEG1WRmAwHEWkPmKE7EeSu2g+tK7RKxVdOWV34wUYxRiLIsiPlqcCtNw3h/HqMHnAtH0i80Sb8YPtDtgiCGW1aAyzNlz4jAh5Im7VhKzqkdyYifZvq34FMIgTCTswwtHCSCApMyUWmL12gH19HKBJdpGCTEhVLoEsu+60Lvji/hHcnAep3e9Vry5+bPH4AlHdyJnyuCzyDbzJ7En0dxS8aZ/HSDkYvD+RlvYWz3wDFmixph8GVJ4ZA+TYav45EghkdvOmyCByO68bNP8PcvUftoI18tYQ6jdGEs2NBIefngsMAE/bFwipxUaPZ9xs6D5X2Y/ESu/v7Owb9AIVgmO8rtu2ZgRyeOFRWn/MmENR9LD0vGoA3fIPuQHO1OOr843u67wifgoe5D/HRYIRE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a54bd35-4d59-4f80-9f61-08d824cded1b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 12:36:53.9710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqMw18KWDy14vJ50WJfPr9d/0CaXY4ODUVSpJpEpVTL1AwmRktBbiA2sqHMTn+G51EUF+FzYy1Ag3O0UQX3R+jhaujYy/ye9uOsmzmdGy5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
Content-Type: multipart/alternative;
 boundary="------------159B8FB0696BD9F19DA9A371"
Content-Language: en-US

--------------159B8FB0696BD9F19DA9A371
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/20 5:46 AM, Leon Anavi wrote:
> Upgrade to release 7.1.1:
>
> - Add debug prints
> - Bump flake8 from 3.7.9 to 3.8.3
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-pychromecast_7.1.0.bb => python3-pychromecast_7.1.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.1.0.bb => python3-pychromecast_7.1.1.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
> index 12076adcd..3da979c0f 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[md5sum] = "10483fca4ffa0381c0c49f3647827179"
> -SRC_URI[sha256sum] = "30e18e7d79b6ce2097e630d3cab6e6503f759808ae1ae592bec0a8a7591534f3"
> +SRC_URI[md5sum] = "897e7acd6ac2c01f3df2e2d6b2e13c11"
> +SRC_URI[sha256sum] = "87fa9ad42425edd21e02a9240669e5763e52d975ee259a948a6fe07e6ab977b9"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 

--------------159B8FB0696BD9F19DA9A371
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/8/20 5:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200708094659.27331-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.1.1:

- Add debug prints
- Bump flake8 from 3.7.9 to 3.8.3

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200708094659.27331-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-pychromecast_7.1.0.bb =&gt; python3-pychromecast_7.1.1.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.1.0.bb =&gt; python3-pychromecast_7.1.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
index 12076adcd..3da979c0f 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>
 
-SRC_URI[md5sum] = &quot;10483fca4ffa0381c0c49f3647827179&quot;
-SRC_URI[sha256sum] = &quot;30e18e7d79b6ce2097e630d3cab6e6503f759808ae1ae592bec0a8a7591534f3&quot;
&#43;SRC_URI[md5sum] = &quot;897e7acd6ac2c01f3df2e2d6b2e13c11&quot;
&#43;SRC_URI[sha256sum] = &quot;87fa9ad42425edd21e02a9240669e5763e52d975ee259a948a6fe07e6ab977b9&quot;
 
 PYPI_PACKAGE = &quot;PyChromecast&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------159B8FB0696BD9F19DA9A371--
