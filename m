Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.65])
 by mx.groups.io with SMTP id smtpd.web12.60615.1594050092978315576
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EmJHVl5u;
 spf=pass (domain: windriver.com, ip: 40.107.69.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tw7gPdok4XhvcRO8XIJmr4i3U8zs5V9d4Ojjq/Scmw0KgXUL2eYLcfQEXt4w1UgId/Md0TMhSrMX+tRyMr3oplZlknSAKiA68GDBk29eSQPZYpVG9afqthtgQCN21RUc648uqiHMb/pKSscXnC83nz1AaiB/SewvB76OBjz56u2L5I7EX0jap2LXHfqMT+TCbipNN9CFb5uUNBuNeaqkgSDxcB30egLb84pZQhnLn6AZWMEFBqWquT0hLanyxbIk5sTGL3PAg7FZvhr9xDZAF+jwCBXFU67fy6UJbnhzNGyxU0PERN4XQPKilGrBVXMVlEC/sPnLt4Qp0ErAE3/hDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utpBe2zWz0ylsQLdTj/xgxg11D7a0jOuj6yOYLJMSDg=;
 b=B3w1hxmuI4eRaws24o2/dXc3ifF85A+f8FxeWqiNIrze5qFhCEjwJS3YRj/uCQGXWYMmCKVVaYBRdYFfusdw+zqL5x2sQhDbzcn0zzhilhbTXv4oOO/0FrsQRqCdaUaNd3b1hI/08AXN+iB+lD/GYTemJTn9UKO8dkEOtQ1a1ELCMImV+rEMR/dKKSVMhZaYkJGyGHsFuRgAqVDxW/bqzcqhB8ovNCPU1YH1kBAmkUhbZCrLdTNWt3FvhCAyKZNHH0qs1Kgk4gc1T+c/5OKuEw3x8US4+ejkrAkYYQ36WvjYvUVJ8cbHQkY3LXsGVd9oaOSlWa9bzBJLaJEyz46ZFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utpBe2zWz0ylsQLdTj/xgxg11D7a0jOuj6yOYLJMSDg=;
 b=EmJHVl5u4vxFZh78SPxSygQaA4+DUIndzUjmlH8BgIobOUL/ywMcHTHwVTZjOM3mMiKvft3IPldZrXcJghrmBnQvkAPoo7bbPw4Cxou+yrQCCiwRQNw7M9rdnK1v/SN6F9r5+D/RcBwK/XdCfAr3UWWLolXdpDUAEWn61UBSgSc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3273.namprd11.prod.outlook.com (2603:10b6:5:56::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24; Mon, 6 Jul 2020 15:41:31 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:41:31 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-libconf: add recipe version 2.0.1
To: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>,
 openembedded-devel@lists.openembedded.org
References: <20200702101515.465529-1-jacopo.dallaglio@kynetics.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0fa25418-f86f-9b00-8f0b-25fde18392ac@windriver.com>
Date: Mon, 6 Jul 2020 11:41:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200702101515.465529-1-jacopo.dallaglio@kynetics.com>
X-ClientProxiedBy: YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::17) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Mon, 6 Jul 2020 15:41:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3c65bff-feb4-4da8-1ee4-08d821c30e0f
X-MS-TrafficTypeDiagnostic: DM6PR11MB3273:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3273AA4AB3B609A7E3FBE2079F690@DM6PR11MB3273.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F9SqNlUF1Kf1mpsx+1WYYrRrgz6BruapOMi2RWtSsjOBphs9jDPcLRqJz/+skNBEjmC/1i/IomGuKcZqsE8l3+Vb0m3733klybNIwS3JgrmwANTFKBugf1vPpaNBamMS+++wowa6mGMc2ggyLgzRCrtsRtCgYYetssRhXQUKYO1pw2pjjzXbulI0eJ2TVUIe7cLczGDGUmG1TdGDCnH/NceFH2rOLlacSjocOeu77WEufrpDZWA4kDvdcnqNRd/j9gnUtLZdPhilVGPJJb8McT0+M69bFIYZxynEzrexwzJDHpNPX7ZYSG+2QfywLEH1gu7BtxTG7uLYJbL0Y1yzNLS27FPWExDirOHaPDSTD14wbnJiSaEZlibPTJiUQs1/akQV259Aft4mzdpPeownG88mXdPT/qn4tFoHgmZn3EOpIXlWoT4SX0+tx4UWnLLVd089Xs7xXsplLBQ1J6yWmw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(376002)(39850400004)(346002)(366004)(26005)(6666004)(86362001)(5660300002)(966005)(6486002)(31696002)(186003)(166002)(8936002)(956004)(16526019)(2906002)(2616005)(31686004)(316002)(16576012)(8676002)(66946007)(83380400001)(53546011)(44832011)(33964004)(478600001)(66476007)(66556008)(52116002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	clgS+wGL889PBxO1znKLVVdoKe4Gpi+s6TVAHZihfVRBON/VfcMK9ICXs748bsNXv+Vcnb6u/nYAVtEWOy12A2StbmFTDNjfFU0YqkelEDIO2lInPU996uh2lPg22TVl/klSlSXnLrdNlB0FnTcF97xG+k787trmM5z5hdEfS/CjOzkRTYni7jpBfksYhraxZA8IU8dQdIxRvYuRBX2nzNGQeqH0bNfqoB+jTTGY/xmUJWQ61HJ35D6FCZoGMrvu7RenfbVdngkWPrRCBR5i0mgRHCWB1YQYxTGN+NSL0P9D3bHExwIdUEQCwT5otk7/FBERJKWb4dgbsoOGsy/kL/siRo5jVOlhaeQuf0vFJDDggPM3O8zea42LvphKmZ8lj/Yqg4XuZonGOeEi+/ezYi1c9uhriqrvXX7B7Xrrh/omOIEN208eIFuyB8MpoQdB9jJc/zU7sxpMygp2Mc2x8h8tnHENGSb49bHSd17AXjKswtYhO8HqKCBCh0cmiEtX
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c65bff-feb4-4da8-1ee4-08d821c30e0f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:41:31.2255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKI0x85NXerLUItNOVx8XbLD3DMtc7UXOkeJCTsLJRuyF9O963GjsmmrOur8w+kpHKFp+tjFOLUzW0xRQwBwOMGWTfuuUSPEMhPi6xKl+d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3273
Content-Type: multipart/alternative;
 boundary="------------BD6680112911BF92C5B626D9"
Content-Language: en-US

--------------BD6680112911BF92C5B626D9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/20 6:15 AM, Jacopo Dall'Aglio wrote:
> Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-libconf_2.0.1.bb                 | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb b/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
> new file mode 100644
> index 000000000..80bc59d97
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "A pure-Python libconfig reader/writer with permissive license"
> +SECTION = "devel/python"
> +HOMEPAGE = "https://github.com/Grk0/python-libconf"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=05f696c084eaaf5d75bc150f70975758"
> +
> +SRC_URI[md5sum] = "e212611cbf6a696e05742a983b3a0c57"
> +SRC_URI[sha256sum] = "2f907258953ba60a95a82d5633726b47c81f2d5cf8d8801b092579016d757f4a"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------BD6680112911BF92C5B626D9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/2/20 6:15 AM, Jacopo Dall'Aglio
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200702101515.465529-1-jacopo.dallaglio@kynetics.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Jacopo Dall'Aglio <a class="moz-txt-link-rfc2396E" href="mailto:jacopo.dallaglio@kynetics.com">&lt;jacopo.dallaglio@kynetics.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200702101515.465529-1-jacopo.dallaglio@kynetics.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-libconf_2.0.1.bb                 | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 13 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb b/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
new file mode 100644
index 000000000..80bc59d97
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
@@ -0,0 &#43;1,13 @@
&#43;SUMMARY = &quot;A pure-Python libconfig reader/writer with permissive license&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/Grk0/python-libconf">&quot;https://github.com/Grk0/python-libconf&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=05f696c084eaaf5d75bc150f70975758">&quot;file://LICENSE;md5=05f696c084eaaf5d75bc150f70975758&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;e212611cbf6a696e05742a983b3a0c57&quot;
&#43;SRC_URI[sha256sum] = &quot;2f907258953ba60a95a82d5633726b47c81f2d5cf8d8801b092579016d757f4a&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------BD6680112911BF92C5B626D9--
