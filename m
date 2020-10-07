Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.83])
 by mx.groups.io with SMTP id smtpd.web11.1511.1602078512460163398
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ud6l6gTS;
 spf=pass (domain: windriver.com, ip: 40.107.236.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNUzvdoN8BNGoDTgcl9qmufR900vk4+arN/sFTHKLuF8iFfcDFA2aXYILTsw7TZyKVgXZRreHrN8dVAwQ6CGF4qzGsPKkipBe35++FQdKHxG0k9gI1VjNNGePM5z7Z03dLFZUQk0FM1iSAVgtQplSiu10F4vDnLTkG31gu7NBp4wTgZ4cXavEKb2CsAbY/dcQ6DrJh0z/X420XrSZ7eN6oxtTFROpiRQ98NuizzLJmLuK54D4W9KfrsI5e9GOwHgMDN//qGWbMtoo7qBmAgAwUkZ2qmGOrXZJe4ydH8J6lUjagHiKk3gM2y72w+2LGpYXFKXsDzX500+gAIlyFGCFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rc8oDVW2o1dcGTrnkhtF0ZPzZLiOgTni9J3SBKGQMm4=;
 b=d5ASehJLHCGWv/gMaN//O2nSg4DTAFZPmWX1JBIgYu/5wh7nX/ckstTp7m5MEwjI/VqlMuWLNBbesecbzrk7TWGv3febn6af4qYGQ+TodcRxdjSJgqHnOV7p3EpCymBlcTXkcFSurgfVCdbxTTCfCeh8V7AhlyYNSV6tn8csYdIXZ3O8fKbu2Aq70APxLilTkiJCn5dGkE509Zo3Xb7Wnfu3YMacGcYSUnLb0uwo85An8DDqBYllFy+19LAkftwVWR6ofm9acABydwNg6II3HFE/It0S6xZtg6vDaGxtrDzc9CadoRi5lFIFlzg5ljcXYgpnixYf73rS937hCDXGlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rc8oDVW2o1dcGTrnkhtF0ZPzZLiOgTni9J3SBKGQMm4=;
 b=Ud6l6gTSSoHcs6kQFxW5meXJi7rBWqhGXIOd8pWC4JGwvJMQOumzDWSraYBrNDscfQxz4TMQarNTKzTiu+r/fP6YFNU+/8bltxI7FcQSG3HTr2WPQzvi29na54pRhRSv7goMQGWcB+yp03BFRSzkgGsOnoq8cTibZHb3k3h77Ms=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2536.namprd11.prod.outlook.com (2603:10b6:a02:c4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 13:48:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 13:48:31 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-zipp: Upgrade 3.2.0 -> 3.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201005115507.11563-1-leon.anavi@konsulko.com>
 <20201005115507.11563-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a6e717f8-c68c-6421-3c54-807bbd3b0d74@windriver.com>
Date: Wed, 7 Oct 2020 09:48:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201005115507.11563-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Wed, 7 Oct 2020 13:48:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 150c5372-ccc1-43aa-01a7-08d86ac7acfd
X-MS-TrafficTypeDiagnostic: BYAPR11MB2536:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2536A8918DB8A3EB2EE92F5D9F0A0@BYAPR11MB2536.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tQ3A1ewy5e3F5kymMxiWul8JdTlXPiDnST6zFZKV9058UErijkRCsCeNpY5GOdSl7lCwwgBB0iqXXEerHoXfYdCcfswEzDnguGXWqUbBhQADrmO0yb7iLlIpeR4/Y67ZO/13Dd4eTjscIscqE6TS0eBAXMqM78G0KJJVSr8xg9yGlKH+bhOtACf5oGXkw/V08TxVSZNOoGVXSgp/8Aqd6/97i6UdkWJHRhlWc7lauWe0mRctDLcpPp8GzMNwpmw8c521PEmx0EJZPXQIMmYdSzEKnL73+JTWusf3FP+qXQWLnkDfFbGs59PCJCGWVhaBFCQy9FSxSvkQ4k1R2KguKRI6gwJSUyBMJnXLRoO6GjFZAVvvYHODIjIZoL0UEAYmtC5AZko4Ajm7z12JceiQcGiWWd4UjxKuhvCqJX6deC5zooqIJk95n0+jL5WBXDLoExKhfUu0momapH8v+rrfag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(346002)(376002)(366004)(396003)(86362001)(16526019)(26005)(186003)(166002)(66556008)(66476007)(66946007)(83380400001)(2616005)(956004)(316002)(52116002)(16576012)(8936002)(8676002)(31696002)(6486002)(33964004)(5660300002)(83080400001)(53546011)(478600001)(36756003)(966005)(44832011)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	JNZAPWAPjhKeACT6pVkj//TbMbcwHLvh0zVMWwELW90f3hL07ZYfqzQCpUCcffDNhWcLstWNOIj7VyT1ZVN7sAR7otqotA8QfbvCRAw0p0uBvhUqFq1YSmGgaI4QNCPU1woY324RU55+RvfVI4gDcR07hNEQrSCT4b8jpB70UUfT6VRtQ6Mr4QaxCNdncTLC/JLV4WWD5jqtxMU1gYpF78Md9lUD84pZ1hHAYP5pBr11OTD+No0CkbgqqcsjZfBybidVvevTqjUyi5zbCXiQGDo8a77qcxY+PjV1f11KXHuUGOlnyWYWy+r8rN2Cva98TaLUviyAZHiV0qpz22drp81r+xDEyGzEIO8yAvb2N5pYzs2YOuOXje35lzl/F6dE9lycMV61zZE2/a7NmktaFZDSPkzHgHjFS3JwUgRCxSlcBE1gz2LwtEMHK/Aw2ooPdSD8P/ihefpKBVQM03S6EZoEjbVPcXVcFABgNiRqOUrWbd3sp+H0snO4GbRUrozKrgN+NxCD77TZbERDysXZtozlyvFRF3S7c5vTgCDAT57CDUPMaaydYt0gE5+pxE3OoA07a22WcxjGZb02i5DSQI0yvGe4KY9yD78/za1dXOiifcJNl/x19d71GV0J+YoNWXCdx3N6uX6aKWXj/82Hig==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150c5372-ccc1-43aa-01a7-08d86ac7acfd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:48:30.9231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RI671R+i2ZfLazsO68MdzwNeJtw+m8PJ5Nk5X4qospQvM6dWAuqD3HPL4LZw9JrCNzWHqIbpf9V9SWi58wouQ6BBAjb5T/2Bzqpo0w1Y9vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2536
Content-Type: multipart/alternative;
 boundary="------------C084C28C554CAAC0CFB234B1"
Content-Language: en-US

--------------C084C28C554CAAC0CFB234B1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/5/20 7:55 AM, Leon Anavi wrote:
> - Path objects now expose a .filename attribute and rely on that
>    to resolve .name and .parent when the Path object is at the
>    root of the zipfile.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-zipp_3.2.0.bb => python3-zipp_3.3.0.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-zipp_3.2.0.bb => python3-zipp_3.3.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
> index 59d71500d5..746f9cea52 100644
> --- a/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
>   
> -SRC_URI[md5sum] = "321a0dfa1080d58e5de0800a26565452"
> -SRC_URI[sha256sum] = "b52f22895f4cfce194bc8172f3819ee8de7540aa6d873535a8668b730b8b411f"
> +SRC_URI[md5sum] = "87a53f0bf48671f6bf6d3e9938218509"
> +SRC_URI[sha256sum] = "64ad89efee774d1897a58607895d80789c59778ea02185dd846ac38394a8642b"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
>
> 
>

--------------C084C28C554CAAC0CFB234B1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/5/20 7:55 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201005115507.11563-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Path objects now expose a .filename attribute and rely on that
  to resolve .name and .parent when the Path object is at the
  root of the zipfile.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201005115507.11563-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-zipp_3.2.0.bb =&gt; python3-zipp_3.3.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zipp_3.2.0.bb =&gt; python3-zipp_3.3.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
index 59d71500d5..746f9cea52 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/jaraco/zipp">&quot;https://github.com/jaraco/zipp&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6">&quot;file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6&quot;</a>
 
-SRC_URI[md5sum] = &quot;321a0dfa1080d58e5de0800a26565452&quot;
-SRC_URI[sha256sum] = &quot;b52f22895f4cfce194bc8172f3819ee8de7540aa6d873535a8668b730b8b411f&quot;
+SRC_URI[md5sum] = &quot;87a53f0bf48671f6bf6d3e9938218509&quot;
+SRC_URI[sha256sum] = &quot;64ad89efee774d1897a58607895d80789c59778ea02185dd846ac38394a8642b&quot;
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C084C28C554CAAC0CFB234B1--
