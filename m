Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.54])
 by mx.groups.io with SMTP id smtpd.web12.11930.1603110713455326032
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 05:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hXuGpwRf;
 spf=pass (domain: windriver.com, ip: 40.107.243.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmwvFNYkFYlE9p9RtA+JCHi9GX7Juv0uZhGPPTJw6vo7DuVJwT0ddqVCvedjfG09Fsz5FHTBoU21kMdEzdIAPvE6Ly6R635S/jNRJJ44YdqrRUPBD4eZX7DXLpthXQUirFNOK+YJFV+41Fvro8dcv0sN5jRY6Pl60T95C66DUGyx/YVkGEQKSdR3BcYOitY6a1ov45NpH4PJZmgO8wydYWIk/xIuKUPPcblt7G5oUrCubweOk80or+zZfHIn4Pt3elhEgr3I54iztCtQhIHcQSo+5wRq5FVFgnB7rn3swFVTIkqcK+T5Ro3LN/qrmyKHNNsJoLmdK7KKhg1nO4Qfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg5W/45z1xE1cw/InAJC705jQ1M7+I7JeOF4CWIc5iM=;
 b=dK8YyV2w6Mv3fZmFRf9cyydQUPFAEGMrQyYZwy1LFGfjWGkfOV9MpExl+cdwoBgT2U4V2kvO3gMXsXzsBlMq0NpT1GTugblLrTcb47bxfG0RQIBvYiXwKbgt+5Mp9dne4PcjLPZWUNXmnBFFPdtJnVnl4xAWdnDmmYIh1WWPjD46oGIRjWOEIyj5WQkSC5zlEkKZznwoPmTw/I2TUIha2M17KaAfmP6qa9402WhB4UPW71aJIooxBhUog1Np3Do0Wu8H/O3HYcRJdV89MIjRZHqy1SKZMO7grl5L0iWpcXViYB9fUYZHtCTopVUWMymcajdOSSYL2YFFbCerebyjdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg5W/45z1xE1cw/InAJC705jQ1M7+I7JeOF4CWIc5iM=;
 b=hXuGpwRfsWRNwPLOLOx7On6IeKBdBMJm/LP+Xj/baYVz+4P0Vp92oGm02Tak0nPMsZKyZIOzSBadmpr2sPJ4NoJ77Sr2QodhidcX24/3Z0e8v/DSPT6K50AIYzbg0qkUsdnsZ56WHk7QN0ENoZMuqA+PkLBgxgxdthCFK2veAtg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4323.namprd11.prod.outlook.com (2603:10b6:a03:1c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Mon, 19 Oct
 2020 12:31:52 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 12:31:52 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-yappi: Upgrade 1.2.5 -> 1.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201015072201.13634-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3e4ee180-388f-d7d5-7d08-35e85e3c91a2@windriver.com>
Date: Mon, 19 Oct 2020 08:31:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201015072201.13634-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR08CA0005.namprd08.prod.outlook.com
 (2603:10b6:a03:100::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR08CA0005.namprd08.prod.outlook.com (2603:10b6:a03:100::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 12:31:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7501689-14a5-4ffb-33b5-08d8742af4e7
X-MS-TrafficTypeDiagnostic: BY5PR11MB4323:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4323B893914EF913EC11F3669F1E0@BY5PR11MB4323.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:270;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IiO3zCFF77cJHUKI7jm0SyXS2PeGP+6QbJK7sREas8A1695E6fYWrfTlHzNDVRUCUdvK6TpEZnvWvtIEe6rXFlL3KkrWLIS8ZYgNS6hKv+W7BE+MCBGnyjbab/fvFNd+Hp738TMxIwPpmsK4/QiHiGaeSPlOs0vbQkvf8vM+Rpn/DHBG/GNPssLdoKMTed0FpdyoqklmV4cYkxEGujxylAnAg0nZy/6P3ndNEDYYa/sjdRJNEjLkUVeXg4tpLA+aO8Qy5DQ/S7T5+4pGD6cL1SkEbdyRmhM2jKqobflJs3Hbf95bntJ39J/l0s4yRAImrwkWWMuJwPBPfLLxilYyvx9SLH2sdnu44cHsvVQqVxyCVS3qT0Mpwejtsnm2QVDHGtySM/fWUKcUIPkWrncPQqxc3rLP0YEaEVGwJMEJCTZF2DZrEAA5Td6wx6FtL8au8x5Hdoo1JXd9AVi8gVuxJA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(33964004)(6486002)(316002)(66556008)(66476007)(2616005)(66946007)(86362001)(956004)(52116002)(8936002)(166002)(36756003)(2906002)(16576012)(53546011)(83380400001)(478600001)(186003)(6666004)(31686004)(16526019)(966005)(44832011)(8676002)(31696002)(26005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	agZwtOIrbmiedRsqETPe8M5/vp/BWVKxy6dQOQhKnovN0K1KtHmTB42bVQcY28E3BgOy2FDjQx2Zr5A/TEkmeT63LHzDikIorn/u2Qm5re5WGoPmvYrC6ubNTUb58pUwNECiJO8wixEIUp66pvCZLCic/xROe8GRTxTGAuIf6ddKnWvaE/656frKRBAKokSbXMv8XHXScSh5rtdLCgk+gNQjxxK2PRw21pXmYR4+mKgXOztzyHkQEqHXFMdcPlyKfq8GbqKZdNQgJ/KDNq8nb4+ku6zRfGnXk4jarpPzKjja2GzHHzNv7ygqYrkFfNDfJSfz7/Lk4VSGMf+V8uQwBWavUYUPX/O/WOt6OrBDTaJ7zTjpKE+eKdYuP5gLDbd8ynhr9XJAqQqhEHV8HanTYwJjbQUM4PU/tvawn24LhDX+pgxN1r2HoMrITIYu/HiKr1Tun1tRsYQqr04vaykhajIMd8BWsPqcOYylWvO1ULujXQEebY4a9aAIAyhEbqw5yYho0DtG1AGfR8sVrZxLgVzlL6LhnM1eI2OKpYVXSCL2fP6IoXVsraUyJMYK2Oe4C+5U3BsdwO3WR4v5Kwucb05e85gTr78+rW0LgEV6b//ueY3EIGpaXNc0gzJ4P68mF7jMMAqaGWm1frbBe7Yl9A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7501689-14a5-4ffb-33b5-08d8742af4e7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 12:31:52.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4lfISk+/tANyEgdNXFBGTMHvxhnJP3B5+ayhoPD/Bw1WN1SjFeCwt8UFZANBX+rnM+4XcML9B9qrMLqtUpVoeo6bL2xFr7SMExyILCIT7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4323
Content-Type: multipart/alternative;
 boundary="------------45D5CC676E4FDE2021712F3E"
Content-Language: en-US

--------------45D5CC676E4FDE2021712F3E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/15/20 3:22 AM, Leon Anavi wrote:
> - Add support for profiling gevent applications
> - A new API has been defined: `set_context_backend` which accepts
>    `greenlet` as a backend.
> - Fix various issues
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-yappi_1.2.5.bb => python3-yappi_1.3.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-yappi_1.2.5.bb => python3-yappi_1.3.0.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
> rename to meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
> index 366dec3dc1..f87c3fb63a 100644
> --- a/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/sumerc/yappi"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
>   
> -SRC_URI[md5sum] = "83237494e7d22df2a31935a1e6650fa6"
> -SRC_URI[sha256sum] = "ad5fa4caf2859e480ffc4ec3e85615a6f7dea852c8f035f2db723f824ed4ba11"
> +SRC_URI[md5sum] = "6dde41b116566cbe1575e41a1e376f74"
> +SRC_URI[sha256sum] = "a443240f4a776fa1be04430bf423dbf09615c05eba34f4a2a6af344a7ce8ff61"
>   
>   SRC_URI += " \
>       file://run-ptest \
>
> 
>

--------------45D5CC676E4FDE2021712F3E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/15/20 3:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201015072201.13634-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add support for profiling gevent applications
- A new API has been defined: `set_context_backend` which accepts
  `greenlet` as a backend.
- Fix various issues

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201015072201.13634-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-yappi_1.2.5.bb =&gt; python3-yappi_1.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yappi_1.2.5.bb =&gt; python3-yappi_1.3.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
index 366dec3dc1..f87c3fb63a 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/sumerc/yappi">&quot;https://github.com/sumerc/yappi&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee">&quot;file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee&quot;</a>
 
-SRC_URI[md5sum] = &quot;83237494e7d22df2a31935a1e6650fa6&quot;
-SRC_URI[sha256sum] = &quot;ad5fa4caf2859e480ffc4ec3e85615a6f7dea852c8f035f2db723f824ed4ba11&quot;
+SRC_URI[md5sum] = &quot;6dde41b116566cbe1575e41a1e376f74&quot;
+SRC_URI[sha256sum] = &quot;a443240f4a776fa1be04430bf423dbf09615c05eba34f4a2a6af344a7ce8ff61&quot;
 
 SRC_URI += &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------45D5CC676E4FDE2021712F3E--
