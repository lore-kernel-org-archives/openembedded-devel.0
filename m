Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.60])
 by mx.groups.io with SMTP id smtpd.web10.12698.1598359219735356986
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Xsfaw1Bb;
 spf=pass (domain: windriver.com, ip: 40.107.223.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwtG02VEl/h2qY93LVduL9F/cjfuvmzBLLFI2zoy6rHzpAXw2pMnBZuok+8r5xqPbagJYCqWSkTW2VzG9avIE41nWaQuO/Ns+49xPnV6M5twTBB1D30i/tIrbZ11ECyR36fAxAp34RAQuG0dskamppcD8mIwgq4vflJeNT/uun1TctSAw7VJqrx4Ba31ngWj1izjm/yINANbWnJQnhTxyAo6AxuWoEkOpnLC1TvWo6YG/UnJ+0vfHJ+Czrf7le+7DrUVLy+vaEtNS87xSH2h8hBLlvi87WgIDY9OVDiXpi69gvk4j9Z+K+KTozD/ExwuZrapERFCVipRQPu3R31Qbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bsWkgtzGh2UgEkWQRw1KOrLEWuNWD+Rpt9GP1ZfsSc=;
 b=RkPXNGVkegKRWGphR3gi01691b1XntdJvV705/+ztdCwXy07a2QfA6WpciBixJUuRihl1dtDttzdECxv3e5CICodpHcD+5l+4lJFlr1GhzTbjs3QRuuaGHHT/WWCwXmzYgyL1U4ZqYZdByFcRo0+DwXHK5u3CBD4oGLpP1AkbDXYxUIai2MDdewHbSICfe5VdV0fZbz0UUf94uIrpDsjzj92ssz+rL776ytec/yCYSEdR1wKiIRICBc048LORC2rn5XX9Qy9AWLJBCAZty+zq+YNNVBYB9qZbl7bKJDiPTAEKYBGoFNIUxjNOlO52FJuccKSC1v8O02L+YlBBs/Qqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bsWkgtzGh2UgEkWQRw1KOrLEWuNWD+Rpt9GP1ZfsSc=;
 b=Xsfaw1BbaKqHsFvoJAJYMyqDxnBdImgu+fxhKakKYzEsbfgBvPYQ9clmgtWujdkru7vIzpfIeiictM1rgRxUlx/zPRuxbP4XAxJONVmJyD3dH4+XW1rUQelmq5hQ3xPetJtwvueJj6eDiMDwBio7m20Af3+i/Ivc448pdkNpZLU=
Authentication-Results: digi.com; dkim=none (message not signed)
 header.d=none;digi.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:40:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:40:18 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-greenstalk: add recipe for greenstalk python package.
To: Michael Fitz-Payne <mfitz.payne@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Michael Fitz-Payne <michael.fitz-payne@digi.com>
References: <20200820225649.200821-1-michael.fitz-payne@digi.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6aa4ee90-5c01-f1a9-38d7-037695f3e8e3@windriver.com>
Date: Tue, 25 Aug 2020 08:40:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200820225649.200821-1-michael.fitz-payne@digi.com>
X-ClientProxiedBy: YT1PR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::25)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 25 Aug 2020 12:40:17 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7473d718-0ee1-4031-0540-08d848f405c8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB426017DD8322B1B617073E029F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	32ReJAbYVJZK4ERYYXPKgARotLjPe7o+6xiLqP4OGYl8N89TjLcEesLzAKGmmWoauKc/DVmQE6uVXGz7pW2ta53nah8lhJGJqiINQq0lJkqLBtXKP0NWJz0Wsg8LN7V2bJnBrVH1wLbyyQ96s6Y7nBlWhBE3gmt7ItDP+n8pt14nEULSSz7KsiarNduTjS0AzmnyBS3rR2kLt1IUN1RXRSk2eCrZmb85X7cdwd1oynN08oZyWo7qDgUDyv92oqMfN6pEf7L/gCuN6avJ9QentzZgrFNi8PAJAK4PUhf7V7lw0qg5eZ9OIsGCGwsd7xmZsD5obOMC7VGf6Ysm6CYufC09fOSQ8FGv4Aq9oUDtoWx3qOi6Qgi4g5Yp2sVWvQEdUPbh83ahO89NmS2Zp+qHKXmbl8frw5i+X9vH6TkwdPEdGaseiEwvTVUpoBVyL0eWQyZtr24hiIlCvxXMXeORAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(186003)(66556008)(66476007)(52116002)(66946007)(4326008)(6486002)(966005)(8676002)(36756003)(33964004)(316002)(5660300002)(16576012)(31686004)(31696002)(26005)(6666004)(86362001)(53546011)(2616005)(956004)(44832011)(166002)(478600001)(83380400001)(2906002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fZOzCHgYfxPiF72eEYreW93vZuaK4VbPZ9p8dZJyLiFz201mlE39YtpNBUyCHVW7E+O8Om20PfhX97WZgu5wqhqpRwi5eENRuJTMPbvCTz/HKcEruowDMslZ/zIPRqcr+Vr4hU0QQeCd6De6MvtNiZJXaQTroEXmn1vwgpkkuz6GJW8HsCvjrPsHZwLTEDm5RcxEKy4QspjZCHMmsTHY7nWFCVwMgC3lB0DCechGKSfCkO+1UdjOT6msPyChWRMNquiugIf+1404Y4FJIoHPR31I8T3TvST7IbmAy/4Xb4CP/oXzLKhBVqtTX5BMBFVFYM1D4Y4OLXvETgjLOgHrGJzLpSLjz7ySDEOHy/bXtpcq/urhmQ/DNIQJl8f+0sst/4Tk6JJk1nAe+T6nZR9xhfBanftNgIkCC/B7Wiuos+shaQtYmbh0xxVEMBDuhMmPQ5Ovzu6VTTpzu2DtTHbrxvox1/hONsrBLj3tdmyo25exHV5c+4hdFqdRIfy38jbLLeInktTjpgl7Skh40WCE1uJfoPr8MhJelsyDVt0x8kulCftZp1YxSiHm4ZoDlLoBYeYrXuN4irqmcBFLRQcOJZHNJgPxgjwTqnPmrbONh7T5kM/5QzMezct6cRiHCJ8fAJIVNhK3nvswmJ6x7uohsg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7473d718-0ee1-4031-0540-08d848f405c8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:40:18.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/IqTMZbdoPOZckudwGDQdAzgCQxBJYf/YZb6K74kdQSFtiaultQ/mf2IZAJsxcJsqRhJILnZqIOtYqLWM0U2FqhW+l9Eqo4IO9ejWOdVVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------61B331D70ADCE9D21B51C992"
Content-Language: en-US

--------------61B331D70ADCE9D21B51C992
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/20/20 6:56 PM, Michael Fitz-Payne wrote:
> Greenstalk is a small and unopinionated Python client library for
> communicating with the beanstalkd work queue. The API provided mostly
> maps one-to-one with commands in the protocol.
>
> Signed-off-by: Michael Fitz-Payne <michael.fitz-payne@digi.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-greenstalk_1.0.1.bb               | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb b/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
> new file mode 100644
> index 000000000..9447c1836
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "A Python 3 client for the beanstalkd work queue"
> +HOMEPAGE = "https://github.com/mayhewj/greenstalk"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f"
> +
> +SRC_URI[md5sum] = "3374649586a8016fecaf0ce5ecf9985d"
> +SRC_URI[sha256sum] = "0c9f2af79ac8ea526891ae8d7e9500341a0f657465a541d6eaedb35ff70f4fe3"
> +
> +RDEPENDS_${PN} += "python3-io python3-core"
> +
> +inherit pypi
> +inherit setuptools3
>
> 

--------------61B331D70ADCE9D21B51C992
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/20/20 6:56 PM, Michael Fitz-Payne
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200820225649.200821-1-michael.fitz-payne@digi.com">
      <pre class="moz-quote-pre" wrap="">Greenstalk is a small and unopinionated Python client library for
communicating with the beanstalkd work queue. The API provided mostly
maps one-to-one with commands in the protocol.

Signed-off-by: Michael Fitz-Payne <a class="moz-txt-link-rfc2396E" href="mailto:michael.fitz-payne@digi.com">&lt;michael.fitz-payne@digi.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200820225649.200821-1-michael.fitz-payne@digi.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-greenstalk_1.0.1.bb               | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb b/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
new file mode 100644
index 000000000..9447c1836
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = &quot;A Python 3 client for the beanstalkd work queue&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mayhewj/greenstalk">&quot;https://github.com/mayhewj/greenstalk&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f">&quot;file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f&quot;</a>
+
+SRC_URI[md5sum] = &quot;3374649586a8016fecaf0ce5ecf9985d&quot;
+SRC_URI[sha256sum] = &quot;0c9f2af79ac8ea526891ae8d7e9500341a0f657465a541d6eaedb35ff70f4fe3&quot;
+
+RDEPENDS_${PN} += &quot;python3-io python3-core&quot;
+
+inherit pypi
+inherit setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------61B331D70ADCE9D21B51C992--
