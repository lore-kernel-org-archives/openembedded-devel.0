Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.73])
 by mx.groups.io with SMTP id smtpd.web10.12055.1591799400886760943
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=osvKxOzT;
 spf=pass (domain: windriver.com, ip: 40.107.93.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWLW3IWa1FT3g7C9T4dXDo20yGlUDUVZmrUTGI22X80vYSpcEcSHnPbMHwyh+gQAPc5jXxJhyEAWNAtrMutM5QIoRfYEf1qSXKcZ5qxGvqtDwzF7ew3FR04zN4YmvD98Dg1vfCxNFRpoLjG91eYzHNBm1VediTO4679yoMnIhZR53+F2djO8Pi1yyrvAZHofnW5mhaCLHKZ+CyUMEq2+YOqAURE7AZxkjUmWqMesRcb+GZmodEaeeclsIMoS+0nR0Kvarub1bg+6bTTrDT5iwHPVj1A8zSciAIvLaUxzMmOfAXL0RUh1pE/XCpSK+SYmGD7hJvQMnvbp4p09rZUzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1G1rS+wzTZ8ztWJKRYnqJoq5QzXljUOsh4vhkPzdQk=;
 b=TflUZprD2HbXs3GEVWSix7p+BzJs2i2pHmJfUUqiHhPOHWjoeh0JOxGHfqDP1NW7bFpw5dxduLQC3QeHvDXz0xu8glxmPj5rXfenhuHm+xypbxNbwEqBUfNSkkifP45YpwteD4OfRFgyfgqh6cKz+LsEPeXCNiof07gyfvvzejAL9l1oUJbvpvJKLYeCkwjgVX8Xsakj8aKNf29Q5qkvLslAlu4vr9JV0Th7nup5c6IGDqSBBXJ/HtW0R4r2yWz8v/VRJSoM6l2JRqVjPVLP5NyVPfiKcXXGsfBI+Kq4JTSK50mIQ8cyydap/MWPFlfFer9jISaWYR6TOz9lDFK4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1G1rS+wzTZ8ztWJKRYnqJoq5QzXljUOsh4vhkPzdQk=;
 b=osvKxOzTGQ6Ffw4/cgzpWt90Doo69N3rl/Sg6uqG7CDtjUMqiTSPjQIrmN7v04oJzDLVpFpBi6XfwcHKJ4xaXgW3VurAj5hVch5q8BAAyIIFX+aZdYJtxeGrCZtZ+0DtH/eVMO/yX/z38gmrWXzR16up0tCljKRr1E3r5dNoeSE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3953.namprd11.prod.outlook.com (2603:10b6:405:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Wed, 10 Jun
 2020 14:29:59 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 14:29:59 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-progress: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
 <20200608121410.5814-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <960ed76b-ddb2-48f8-1f65-7a767eedd9e1@windriver.com>
Date: Wed, 10 Jun 2020 10:29:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200608121410.5814-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 14:29:59 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c1deb48-a85f-42b0-5baf-08d80d4ac15a
X-MS-TrafficTypeDiagnostic: BN6PR11MB3953:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3953CEA92EEFA407597ED8169F830@BN6PR11MB3953.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l6gIlbh/805WyrYsVfODXZBRRpbTZ0ht4KpWyxRz+fcyplaxM/JN8lPqeMcT5gh6sTA0JdT+ob7k8dBaOaOMlDj3cAEZ4nGHK/LDX0SLggW3V4OipWtxLOw7ryUdoS5LOOJHse7k2ezcansidqDsTMN97RQea9RbdnJX4zcdP5EqjhaLQcC/44WIwkgkA8PKSjVieToYmbJy33g2mBBIojYAI9uoy/aDBpU+Z9MssjaMuxxLmKv9LwjWGMF8O5jw7prx07S4dSyiu+D1JqqQ+u3hBwSVs4Se94ENIuBHh0JO2tI1WZjjORpSTUpKyT0kGi9VZB6FoiANcSNtu/gBfcQLJ2O0hp35J3P+zPVjT2RGmEL6ISmAIQMA1os0bKf8+ZQ97+Fm6PFyRQgP3q1ykJWhW4Jv0qivh5DX5SZ79JBp4przvIZiaCHEBztBDvkJDXDIpLNOd596p4miqyn+Mg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(346002)(136003)(8676002)(8936002)(66556008)(66946007)(66476007)(5660300002)(31696002)(86362001)(31686004)(966005)(33964004)(36756003)(316002)(6486002)(166002)(478600001)(2906002)(2616005)(186003)(26005)(44832011)(83380400001)(53546011)(956004)(16576012)(16526019)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	U8BQrETrUXwFDILnyOP4eRjgSl45sbr9XdpoXfdk7s+ydU1Nt7HMdrg+y4TLY++/voAX5b53Unz/9t46W62fXWk9DJAfyQGfVyRh7D1gdtoupPgs2ppXjEWKE4Gj6+zcg40zdvoD5veByKGIqenl8UwGXjaX376BY6RyfmV/aOfjnzEiYIVrAgPGWj4G9VTIYKT6kmuYuqBken/jd1A3FJcmJ+5uKiLBu6q5W/YOYmWxzZkITw3khFDzxFliv0ZI2hEj8u5hgd9LApZI0nKMhVLNPKm3H78m7qiLFKh6Lfx/LNLDYtYAx23wAejGNMF146n8fzjM0XJ2PRWpouNwJxPXXMPyr7ehGuRHibE6OB1rbnsjqZ4h5s/9HVc5At49l0qXfkPGEeaZj7bTvrj5tV5QKSDARS6NZab+Rl6ls6e6R3jGVK/0NnkP0920ggGGSzTTZPMlbqcS4Gp8qpjX6YXN/R4jJt2JZS7H3yE0lEg=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1deb48-a85f-42b0-5baf-08d80d4ac15a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 14:29:59.8339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oulNc5f4I3glS9kxsG7wsZXmn6NalXtkgUYDwf2pGiCaaZKdrDKwhCmQuCl0IE/u1tj6s8zsTfUOmnoOz5D30q+7JBvjWER0fS1cbyvNyvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3953
Content-Type: multipart/alternative;
 boundary="------------3550049E090047A5873542A9"
Content-Language: en-US

--------------3550049E090047A5873542A9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/8/20 8:14 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-progress.inc  | 14 --------------
>   .../python/python3-progress_1.5.bb               | 16 +++++++++++++++-
>   2 files changed, 15 insertions(+), 15 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-progress.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-progress.inc b/meta-python/recipes-devtools/python/python-progress.inc
> deleted file mode 100644
> index d59ba2cc5..000000000
> --- a/meta-python/recipes-devtools/python/python-progress.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "Easy progress reporting for Python"
> -HOMEPAGE = "http://github.com/verigak/progress/"
> -LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
> -
> -SRC_URI[md5sum] = "408df0e3db0ad4b74f19f6beec814ae4"
> -SRC_URI[sha256sum] = "69ecedd1d1bbe71bf6313d88d1e6c4d2957b7f1d4f71312c211257f7dae64372"
> -
> -RDEPENDS_${PN}_class-target += " \
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-math \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-progress_1.5.bb b/meta-python/recipes-devtools/python/python3-progress_1.5.bb
> index 45e264213..1f299dbed 100644
> --- a/meta-python/recipes-devtools/python/python3-progress_1.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-progress_1.5.bb
> @@ -1,2 +1,16 @@
> +SUMMARY = "Easy progress reporting for Python"
> +HOMEPAGE = "http://github.com/verigak/progress/"
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
> +
> +SRC_URI[md5sum] = "408df0e3db0ad4b74f19f6beec814ae4"
> +SRC_URI[sha256sum] = "69ecedd1d1bbe71bf6313d88d1e6c4d2957b7f1d4f71312c211257f7dae64372"
> +
>   inherit pypi setuptools3
> -require python-progress.inc
> +
> +RDEPENDS_${PN}_class-target += " \
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-math \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------3550049E090047A5873542A9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/8/20 8:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200608121410.5814-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200608121410.5814-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-progress.inc  | 14 --------------
 .../python/python3-progress_1.5.bb               | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 15 insertions(&#43;), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-progress.inc

diff --git a/meta-python/recipes-devtools/python/python-progress.inc b/meta-python/recipes-devtools/python/python-progress.inc
deleted file mode 100644
index d59ba2cc5..000000000
--- a/meta-python/recipes-devtools/python/python-progress.inc
&#43;&#43;&#43; /dev/null
@@ -1,14 &#43;0,0 @@
-SUMMARY = &quot;Easy progress reporting for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/verigak/progress/">&quot;http://github.com/verigak/progress/&quot;</a>
-LICENSE = &quot;ISC&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=aef5566ac4fede9815eccf124c281317">&quot;file://LICENSE;md5=aef5566ac4fede9815eccf124c281317&quot;</a>
-
-SRC_URI[md5sum] = &quot;408df0e3db0ad4b74f19f6beec814ae4&quot;
-SRC_URI[sha256sum] = &quot;69ecedd1d1bbe71bf6313d88d1e6c4d2957b7f1d4f71312c211257f7dae64372&quot;
-
-RDEPENDS_${PN}_class-target &#43;= &quot; \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-math \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-progress_1.5.bb b/meta-python/recipes-devtools/python/python3-progress_1.5.bb
index 45e264213..1f299dbed 100644
--- a/meta-python/recipes-devtools/python/python3-progress_1.5.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-progress_1.5.bb
@@ -1,2 &#43;1,16 @@
&#43;SUMMARY = &quot;Easy progress reporting for Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/verigak/progress/">&quot;http://github.com/verigak/progress/&quot;</a>
&#43;LICENSE = &quot;ISC&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=aef5566ac4fede9815eccf124c281317">&quot;file://LICENSE;md5=aef5566ac4fede9815eccf124c281317&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;408df0e3db0ad4b74f19f6beec814ae4&quot;
&#43;SRC_URI[sha256sum] = &quot;69ecedd1d1bbe71bf6313d88d1e6c4d2957b7f1d4f71312c211257f7dae64372&quot;
&#43;
 inherit pypi setuptools3
-require python-progress.inc
&#43;
&#43;RDEPENDS_${PN}_class-target &#43;= &quot; \
&#43;    ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-math \
&#43;&quot;
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

--------------3550049E090047A5873542A9--
