Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.45])
 by mx.groups.io with SMTP id smtpd.web12.221.1591378006532183600
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FICB6kAu;
 spf=pass (domain: windriver.com, ip: 40.107.220.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoaaPiEsNre6Et+Nb0dkGShTln3Bvhqud/lS+Lko7prqY0SRDYBRDCZoqOAiBDTKJPGQABT+YZxRA1ZFwmoc5zWd3Hbn3+Yq1P1uaITJhApUS0+tgsEn190yICu+AcA5GJWewc/SP8MAj/4qnH5pxp+D5mb3fTxVnPAaM+qrPLv/RiZV4ji7orG+FYdzR9cs6KXa2eBDOKukfl/fWDIi4S93HLlae9Koky1N2PIdVtYoXwNgu8f0MAjD2WSgQWdl0jLZnGVpC3bSijurxcLjXdp0i+eU44eJn4wxw/G6SaxVQF9vEm0W5E1UtYexoG96gyRat4voDeKEJQnhQnsXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEMnV3/fSuuFd6MAasObkeEyqvYVHyNV9tWBWB1PI/A=;
 b=PIdEklfHHan7C3IQSSIzpZNw6fsYbu1i76KzUypjmbAwFCiP0yVZ0MUu11czrtG5wOyW+ndKF3xFCF/dcbjhuzWj54U0lLnjFHGJrucTWcIsGGBczJFopSF/Q0Yk4aSKOcFN9EtJxRGEBjQ/+p8kr22zJArenBEVETl232ybJ/h/dEsIIv3/35EexSO11mD6epTcsU1k1BBjKCvp1ySe8JWbfHJ207a9H00JDslOzgCFkf2FyOvwCbja5ac5NybZlqUJYxh9pe1ilKuH9XznRcHa8IS3RmKMMgH1JKEysdJtTwzHwNxhJ0cSF1pUXBKbR2+jHqxwz35V5NfQ7ff1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEMnV3/fSuuFd6MAasObkeEyqvYVHyNV9tWBWB1PI/A=;
 b=FICB6kAu1OfAE1DGij7k09WVaNobXhgn4zBQ6l7ceOyyfoqyrbucWyVHrBVrg280CgqPhpYV91tAvk2mVnpp9WuOFtFdXN9nWx9TCzYWDnKgEI/Pd7/ty66js+D5DNUauxWpx8nVhyadmFPkrchquTuE8HeRpNvCTMnyliofbyY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1874.namprd11.prod.outlook.com (2603:10b6:404:107::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Fri, 5 Jun
 2020 17:26:45 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 17:26:45 +0000
Subject: Re: [oe] [meta-python][PATCH 5/6] python3-greenlet: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200604121223.3818-1-leon.anavi@konsulko.com>
 <20200604121223.3818-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3d17ff99-4b84-c277-fa3e-a6f31109f27f@windriver.com>
Date: Fri, 5 Jun 2020 13:26:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200604121223.3818-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::45)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 17:26:44 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e951f6f6-9882-4d85-fe20-08d809759eae
X-MS-TrafficTypeDiagnostic: BN6PR11MB1874:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB18747BE3CF39B6B89376FAFF9F860@BN6PR11MB1874.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E9Ytahtod/BAcml4kUpUC0CYXwT7AKmvoqdOIDtKHGpAHDUsUQp+11mu0bIIvg0VKveRp2ff/DwuBSVYb+PRaLt57rKnvHlK2UAmdMgW0YqbBUusFT7MosgHslAc72BlbffZ3PRIuG6iV02RlyQjsMfDlfD5UERxNhcUGvFJYEjrRbnaue20ohA1s3qCZRcozM2S3mVvT7Rr7ZvHZhDp1RxiUt9WHdXAGkplIHsATOjaFMPsXWumfgKekKq4DP10flP8oK1SvBIN1HJAzdnPPuECtr6qjFn7jrCane/cLL0qDhEWGqDRmO86ZSapNxRKSuUJJHNmmqmqt9/sWTlDr0oU0gdlcF+03GpYNgozoMS5FSDpQdLF3UKeLrDeAFNec9XO3ZLlfx2gXhJunYBRpgi/9GQQdSd75vtqyVBceQKdeQaJdqtG6T6YbIxZZYTVH5WRf1VilWF5YS+qVsfmkw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(396003)(39850400004)(2616005)(66476007)(186003)(66946007)(86362001)(16526019)(316002)(16576012)(8936002)(26005)(52116002)(44832011)(6486002)(53546011)(33964004)(956004)(31686004)(8676002)(31696002)(36756003)(2906002)(66556008)(966005)(166002)(83380400001)(5660300002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kjkMBB+gwLWqBXKUiIDPLyiSleGschJZT+0rCdSt6Z+ywP5PYtuohtalzzcMbHPaiGhRYHLnzHt2IPkomv1l7eidQsfWyK7qPySgodulb8tHubWyHWF1cCGgx+I+4i9Z1kSu/74NcYE+qYYv21TqlaMEfVjUDzW7NO/Un7gUAfg5fWp5iwqneDge2LhuseTMKRTXcCCJYsSQrUhVII3nOP0r4N0UErqsW1COv19lpCHnmUndQD4Xn7gXXHkUZmOb0FpvN0LYfDx2c/pC44pd3DKKTJrVQ3bmbShfWA4Hx5LGJVxZKweeSRuYnz9UqZnVzRyFWaGB58fW3gWCqqNoPGmGLYB2u725d5sWUdgkHBRm3fBV5L+s6dbaBI8W9NzzIcbbSbrx7mg6Td90zasTPGUOEgn28m8DITpAQWfRV/B/TE88XLkubv1xnQh7T4bcvg6P9FT0f4lANMFeNLpdd3UDhZFa4tDj0GPU8Hlimw1iTbgoWe232bel1CxD/aOG
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e951f6f6-9882-4d85-fe20-08d809759eae
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 17:26:45.3695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pCs3pgNbNHNbNSt9zWDSOPF1n29AMX8SssAIoHGgGIGCIQ9HDxQNElaZsjRy9McLnUag+b3cZi4gB0IqsaLnDdTfLiOEs07kHG1cr/eJgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1874
Content-Type: multipart/alternative;
 boundary="------------333C0973DE42820A8B150443"
Content-Language: en-US

--------------333C0973DE42820A8B150443
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/20 8:12 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-greenlet.inc       |  9 ---------
>   .../python/python3-greenlet_0.4.15.bb                 | 11 +++++++++--
>   2 files changed, 9 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-greenlet.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
> deleted file mode 100644
> index c7c656c84..000000000
> --- a/meta-python/recipes-devtools/python/python-greenlet.inc
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "Python lightweight in-process concurrent programming"
> -LICENSE = "MIT & PSF"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
> -                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
> -
> -SRC_URI[md5sum] = "10fa304f673fc18b28fa6d8c6658cb80"
> -SRC_URI[sha256sum] = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc"
> -
> -inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
> index 1aedf7fa8..f9c862118 100644
> --- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
> @@ -1,2 +1,9 @@
> -inherit distutils3
> -require python-greenlet.inc
> +SUMMARY = "Python lightweight in-process concurrent programming"
> +LICENSE = "MIT & PSF"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
> +                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
> +
> +SRC_URI[md5sum] = "10fa304f673fc18b28fa6d8c6658cb80"
> +SRC_URI[sha256sum] = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc"
> +
> +inherit pypi distutils3
>
> 

--------------333C0973DE42820A8B150443
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/4/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200604121223.3818-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200604121223.3818-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-greenlet.inc       |  9 ---------
 .../python/python3-greenlet_0.4.15.bb                 | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 9 insertions(&#43;), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-greenlet.inc

diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
deleted file mode 100644
index c7c656c84..000000000
--- a/meta-python/recipes-devtools/python/python-greenlet.inc
&#43;&#43;&#43; /dev/null
@@ -1,9 &#43;0,0 @@
-SUMMARY = &quot;Python lightweight in-process concurrent programming&quot;
-LICENSE = &quot;MIT &amp; PSF&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36\-file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a">&quot;file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
-                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a&quot;</a>
-
-SRC_URI[md5sum] = &quot;10fa304f673fc18b28fa6d8c6658cb80&quot;
-SRC_URI[sha256sum] = &quot;9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc&quot;
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
index 1aedf7fa8..f9c862118 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
@@ -1,2 &#43;1,9 @@
-inherit distutils3
-require python-greenlet.inc
&#43;SUMMARY = &quot;Python lightweight in-process concurrent programming&quot;
&#43;LICENSE = &quot;MIT &amp; PSF&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36\&#43;file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a">&quot;file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
&#43;                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;10fa304f673fc18b28fa6d8c6658cb80&quot;
&#43;SRC_URI[sha256sum] = &quot;9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc&quot;
&#43;
&#43;inherit pypi distutils3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------333C0973DE42820A8B150443--
