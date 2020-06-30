Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.43])
 by mx.groups.io with SMTP id smtpd.web12.15042.1593523469036942432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 06:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PDALJ1YO;
 spf=pass (domain: windriver.com, ip: 40.107.244.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxsgTVWZgKPeZrtBdpK65EEtUt/sOQ/Ev9W0ojOMqVSj+cxw4/Fz2pnQKFgp4LLZTpwI7XV8a3deDouEAKk3Adu3IaBmafPK+L8BNrlggG2BYG0b52bq/D7A43Lvxl/+POv/+mVUDWGMTuWkJkt/iS+KbeOBo9QHbpFP6l2RUG3rvrUNfYHkJLXZmDoPAX5ClnOsehGHtvnOjLlCIng5AkHOOqMBW58N4vcqXIJQLUzRM6CVRfeL1vjT4HDy5Yq8goNXMPFPQggPm3+Fg5Y8wTntgQNtrgyIPPbpchxcg1jRhmXlctGDrxEBdJjhO1s1y/buf/SgFCOpQURrdY694A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DU3TWWZkmna5slB1xwdEHTOocPNICa7hUzJv6VfHEVA=;
 b=k2WOeruE+wJ2/R5nvNPiPlUXyUw+huyYLAVuo9Xfq2HhYS7i2V5Ie0lpVlHWSn4rNyRViNALe4efkGHLj7OPtT45wYDf6zg2y9HUeQHfKC69GSYZz360UKWQ+oIpkgcsmwSsVuqOu5kizZEPWvjhQRzuVHd3Rwkt+MagPb2LB5uOrMXZoDO6SddT+PPT4RjG/de19IUYFUi0kblr1zccUo+Wg1Cv6bkXOuIQfmWZo81OEWbi085SFUzBFJwyx9C4TGuS3quUoJotydK3lpaNA6te2BXvWlvGcOGI4zTJA47ECApkLR7rG5C3rTHftMA2mYMnnaIcnHu7A7AEpdYNew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DU3TWWZkmna5slB1xwdEHTOocPNICa7hUzJv6VfHEVA=;
 b=PDALJ1YO+DgMrUPAXSwmjrk98yo0glEMIfHKw8NatjA4POei6Fcc+NmyMJ2VIattPERo4v4L2ReH/64eNwjI5aCMj1IK57MpEefjcC9jTBnILz6/37ug7hTeV8eOIRLuW9A5xacfq9vEjy9OZXLXBu4x9SAHka+BShUntC/V5Do=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1686.namprd11.prod.outlook.com (2603:10b6:903:30::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 13:24:28 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 13:24:28 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-jsonrpcserver: Upgrade 4.1.2 -> 4.1.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
 <20200629121233.27026-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4ce7f3f7-27ba-f2ca-1cf0-e1b372a61bd7@windriver.com>
Date: Tue, 30 Jun 2020 09:24:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629121233.27026-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::22) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Tue, 30 Jun 2020 13:24:27 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed4dcfef-be62-49ff-88ef-08d81cf8ea23
X-MS-TrafficTypeDiagnostic: CY4PR11MB1686:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1686AA9613160C5433BECB989F6F0@CY4PR11MB1686.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PMFw25vxNPreBE/RSaScWgr8LXcG4xIL8xp0//c9onufY1BInGQhbDlghAb9+buOwrMHY3eknYsH25UZFx8H5o7LxWE9E4Dl3jEm0u9wCq6prK5tPjzbAT4mmH23AwMhK88ikAKZSyT4mZ9JzAgU2ed9abUus1+eMyIxHAdtAzPngJXCBMhNBtupwEhml5+WgOog1FszE/hGMnxHV4QsSNVuu6LWuPZJMw1BNzxC5yKzZzPxxOBnEUABtv04R5Hh2ZAzhiKEs9YrOpxr1CDkgEmLhYoKxkQw7njBCVbmkSi49aYTD/1sDw/Luti1eLuAuzb4XtGj6rlpodU1M62aUBUmrAv0V3pazcgCc8/10rXMVYaw8BNwmjwtMKwjD1ER4o7dF+K9sgPFSLBmmvammPNyhiyhqoxs57H3tXaKTihhzyObLYdOKbjWiwIXAO8XXihYbTW/9DYh9Wyba8LnEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39850400004)(346002)(136003)(376002)(53546011)(31686004)(8936002)(2906002)(8676002)(966005)(44832011)(16526019)(36756003)(83380400001)(2616005)(956004)(86362001)(26005)(31696002)(33964004)(186003)(478600001)(316002)(5660300002)(52116002)(6486002)(66946007)(16576012)(66556008)(66476007)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	e4ITnxoUxN8p5S1w+5rWCReR6NYbQuDNi4Iz0OfwdwGmzy0odLVRNwFnsfUdRqA0DrLbUJkmPbxeP6YmuO4qB/eospHPiuYqlpFujUfiy4eytla9BDqg2bKboyMLFKHNMYc+se0VgRQA1FrHNdbTwFW1G1THIiiebZnKriQOo4H09FiDHHfm2MGGbJxRBHf8cu/ENq71MbrDXCSyIvACpoLxsVJIAUEWcawRolzRGa/fxmh2e5NLR9TgbdlkOXitcw98GOMtaGwyhBb8CfcrB19l1tYmUj06xDR4EHYSR+TEmVWleq2H9IE1pEdd0dI+SLAj47lp/hm+GvkeLqhZkeuBbmvq5qsTGHyCzC52T4nTQFabAYNO+5ZGRMnEX2jlBwgvcjKixI7dOuWE4GzZe2HDlWGgPDJz3SxxE6s//b9iQjdurKLLVPdRqr3mLZHTz+OKdO5EWLI91ZQ7zwIUsM1EbDHl00JULWj8hGp1Miv/aMC8QG8uhJaSoblv9kZk
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4dcfef-be62-49ff-88ef-08d81cf8ea23
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 13:24:27.9788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mKUxMSZb2lyyEdMZog3yhJTcGbjyLo+79FPk6Kq07WGTDSGx61lUied/aKceo2b/pnkDLiT94S8Vds2IQR++ilKd+dADwrrkSGfZuN+e6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1686
Content-Type: multipart/alternative;
 boundary="------------882B98D1CDD8D6E3DB2A9BBF"
Content-Language: en-US

--------------882B98D1CDD8D6E3DB2A9BBF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 8:12 AM, Leon Anavi wrote:
> Upgrade to release 4.1.3:
>
> - In the case of a method returning a non-serializable value,
>    return a JSON-RPC error response. It was previously erroring
>    server-side without responding to the client.
> - Fix for Python 3.8 - ensures the same exceptions will be raised
>    in 3.8 and pre-3.8.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-jsonrpcserver_4.1.2.bb => python3-jsonrpcserver_4.1.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_4.1.2.bb => python3-jsonrpcserver_4.1.3.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb
> rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
> index e23720c3e..98db23039 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
>   
> -SRC_URI[md5sum] = "fd4091bc19eb18579c15b97af70714eb"
> -SRC_URI[sha256sum] = "73db55d1cf245ebdfb96ca05c4cce01c51b61be845a2a981f539ea1e6a4e0c4a"
> +SRC_URI[md5sum] = "e73b0bd90e99115d3f9e0ac42882c5b7"
> +SRC_URI[sha256sum] = "649680c293facb6ae7c3f5c8028e4623c55195db5216847e9f25f85cba2d443a"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------882B98D1CDD8D6E3DB2A9BBF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629121233.27026-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.1.3:

- In the case of a method returning a non-serializable value,
  return a JSON-RPC error response. It was previously erroring
  server-side without responding to the client.
- Fix for Python 3.8 - ensures the same exceptions will be raised
  in 3.8 and pre-3.8.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629121233.27026-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-jsonrpcserver_4.1.2.bb =&gt; python3-jsonrpcserver_4.1.3.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_4.1.2.bb =&gt; python3-jsonrpcserver_4.1.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
index e23720c3e..98db23039 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/bcb/jsonrpcserver">&quot;https://github.com/bcb/jsonrpcserver&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15">&quot;file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15&quot;</a>
 
-SRC_URI[md5sum] = &quot;fd4091bc19eb18579c15b97af70714eb&quot;
-SRC_URI[sha256sum] = &quot;73db55d1cf245ebdfb96ca05c4cce01c51b61be845a2a981f539ea1e6a4e0c4a&quot;
&#43;SRC_URI[md5sum] = &quot;e73b0bd90e99115d3f9e0ac42882c5b7&quot;
&#43;SRC_URI[sha256sum] = &quot;649680c293facb6ae7c3f5c8028e4623c55195db5216847e9f25f85cba2d443a&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------882B98D1CDD8D6E3DB2A9BBF--
