Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.75])
 by mx.groups.io with SMTP id smtpd.web10.10450.1599060695569309519
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ez970plh;
 spf=pass (domain: windriver.com, ip: 40.107.243.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYm/AAwpX0p9Dkqi3+ozl1VXJaK1Wcm4ASIsa5gKOkDpMqMgZnA/fAbswbI7V7muZZ7ebHd8SdmYqYiZG5fupOeJPXK4vggq00xaFxird8Qv/SzKX44VL+t7YdV41DlAkgnxjjl0LkJWaQ80Ps7PSE1ZkIQlM9fb4yIesAOTSkzXMkffyM8CGekQHqdnRgGNANz0ZrqRMVPFNTepg9m/bW9j2NIVUbav8H28YoOc1upeg+1WXpvTdW8RMqE0EI5n8IiRvkYvxaKVpBgal8bGc8zEkEs5d2ygH6AraasqsjYXThTd9qu432RlM34p+CoN0VnpJuDe4xDdbbxbUIHFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIcPSytSfX61jojERsTTqbItL2FNAbWQp7CpMKruaJM=;
 b=EXk4QVgFUPeIa5VF5UoPWlwNd+vBjaxSF06QIXyNW20CatMhfuWRKe9L880HOUwZEaa5ZyJJynQwgzjvMr8DWwiV+RHGu8ojkBS5xoN2ILAGh7V5GrxHDPX6mLZ8iyJRE9wu+baLfJTTxwhE3OtCiMQfGD3aEngY5sLWQge9Hqy+6plzlzamlI19z1VHmKdj17/DBdVsybJ+D2HSEKqbh/plb25jQZUik2KWhE9PWOD1OE9HbnKmDYCR1RPVSCUhuVKyXbcN3KqeV9GmlRWFv5+l5wI89zKFmS9LNwYvNRfzC1Xd0HtGjtias+qk0+ujtrVppgby0rAQ/A8ntzLK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIcPSytSfX61jojERsTTqbItL2FNAbWQp7CpMKruaJM=;
 b=ez970plhTwTpQV8G6E4Tb9FvE4Gr75aRhJhgpgDJpzUFRYQ4h8s7wvhfGcHTjBIzs4i8D/5Xdc0IXb0icP+LRDKc9AJtb3y+2RBkGbZFu7J2YUKklPgzG+0MD1YvtoRzp30O3i6AW4wkmDqsifNUHLmXNUUS2yuj0SuPdouSdQg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3815.namprd11.prod.outlook.com (2603:10b6:a03:fa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 15:31:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:31:34 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-flask-nav: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200901081147.13556-1-leon.anavi@konsulko.com>
 <20200901081147.13556-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <eb9ed83c-0c5b-3d5c-063a-f9b30b7815f5@windriver.com>
Date: Wed, 2 Sep 2020 11:31:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200901081147.13556-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:31:33 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23c9a274-1b2c-47ce-1af2-08d84f55460d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3815:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3815AA0E05CCAA2B326B93179F2F0@BYAPR11MB3815.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ald/zA2L0dqHqi7XnQobwSAE9Pn73zqZ6823V7en0V4gQS4U9g1jIzP//MCQ7/N+jCutwhgekmfnAvhWE0WPYvuv8U8jz9ikSMEvqnb9jwOFvbndqF5ztH5GkLzGll3+HdzLZRkj45Z4Tg2Uf2dB5EvABoYJJm6ggCvk4eyVZtQkBM3n3/e9m58eO8JuhF8HgKmwtNRn4vdV2n6emk2mWEK0MmES47/8mbsemMKAfbQTXZOfCw6vlh1kYLBnpdRqJeFzr8m7s+lX1buyuN55L1PrCS6rI93G5iRKQs7TAfLoRf8ALOATj7/6i2mQ4i+VgG10p7/3R4ROiL/3ldG5DHsb+xa/uSVdVq9AZrSHyimwcgLly8XWoNmEgBoK2EFVhBrN61eaxOAxDGwSpAJ23LsqAVrqcifwjxPv3XMZY9gRa4yMmV2AjO7WNZnprLgPS480o2xL0o2Y1P0JV1yjug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39850400004)(316002)(186003)(33964004)(966005)(83380400001)(6486002)(166002)(8676002)(956004)(44832011)(16576012)(26005)(53546011)(2616005)(52116002)(478600001)(31686004)(8936002)(2906002)(31696002)(66946007)(66476007)(66556008)(36756003)(5660300002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LtZGoRZz1IFUaEtx3b0YKnj1lXnMwIMWqj10RsujjhmvTzroX0hFazk3DA4wOHGK8pY0KZHCkr3KIymP6A4q5NATuQylYA88+U9qxCWdNNlodycWNVA5SliikyA6wKSNU0YcwNqsEYk5cCcx6uNIjclyfjTUhmd8mRwYa68doVgyqQKwQTXVN5ISzISCrrns51TCh4tWdn8Bq3epbi3BWPEHpwqKQMJrUjJqcxrHtG7A+SZIrBT/3lo0g2zYdzMy2jVupUC9In2jxgnSTb8l8Xiy1xTGlwpNk1LG+edk/zPJUdQA4FXKFdxcuKGT7RjXSBGv4jFGIjfyRtTX8/aC8bVYbL98t5FFn7/LCZIUcGYy8fuP+GkDdlKxYJ0GUxFEKCtScXAbGqgH6mu/zJhaE8tGgibctV4kICJzt1Dvxo7kD2CUVU/fFEyIFlYDRMiMsyRQjjUvVPe75HfEh2HpBgE9CP3Yg7eoacAZ9JaurhdSu2HY4Kp49pLXtvAhkhmHpj2KzOiMho9WET4RVlgOjGO5U3kKeOUiK8NMUd1/DKoON+p2JXvVV6iXVIKgMCPOxTXg/GRTQTptKFk3Qj4RvMQQ5R1055W0fctLsqH4ffYrEHqTjwlXAurK8dGlOL8EiO5kLxYikiHbDHyh0f3hZA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c9a274-1b2c-47ce-1af2-08d84f55460d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:31:34.1412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGnUYzTrM822Ckq8ExOQSsgeSArKANSr+ltaVzDKZHvMSrukDnwJ5b9MCqwBZ57JtKthMpWmaz7F9RY+nkQP/Cjyn/1QURHyEHPYaP9y0BI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3815
Content-Type: multipart/alternative;
 boundary="------------74DC6C1F4A42C19E8BF654DC"
Content-Language: en-US

--------------74DC6C1F4A42C19E8BF654DC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/1/20 4:11 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-flask-nav.inc  | 13 -------------
>   .../python/python3-flask-nav_0.6.bb               | 15 ++++++++++++++-
>   2 files changed, 14 insertions(+), 14 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-nav.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-nav.inc b/meta-python/recipes-devtools/python/python-flask-nav.inc
> deleted file mode 100644
> index 932ccdf4a..000000000
> --- a/meta-python/recipes-devtools/python/python-flask-nav.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION = "Easily create navigation for Flask applications."
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416"
> -
> -SRC_URI[md5sum] = "4d51cfd06d58f8d0fe85775a6696c0e5"
> -SRC_URI[sha256sum] = "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4"
> -
> -PYPI_PACKAGE = "flask-nav"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-blinker \
> -    ${PYTHON_PN}-flask \
> -    "
> diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
> index d25115251..77735e325 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
> @@ -1,2 +1,15 @@
> +DESCRIPTION = "Easily create navigation for Flask applications."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416"
> +
> +SRC_URI[md5sum] = "4d51cfd06d58f8d0fe85775a6696c0e5"
> +SRC_URI[sha256sum] = "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4"
> +
> +PYPI_PACKAGE = "flask-nav"
> +
>   inherit pypi setuptools3
> -require python-flask-nav.inc
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-blinker \
> +    ${PYTHON_PN}-flask \
> +    "
>
> 

--------------74DC6C1F4A42C19E8BF654DC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/1/20 4:11 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200901081147.13556-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200901081147.13556-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-flask-nav.inc  | 13 -------------
 .../python/python3-flask-nav_0.6.bb               | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-nav.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-nav.inc b/meta-python/recipes-devtools/python/python-flask-nav.inc
deleted file mode 100644
index 932ccdf4a..000000000
--- a/meta-python/recipes-devtools/python/python-flask-nav.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = &quot;Easily create navigation for Flask applications.&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416">&quot;file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416&quot;</a>
-
-SRC_URI[md5sum] = &quot;4d51cfd06d58f8d0fe85775a6696c0e5&quot;
-SRC_URI[sha256sum] = &quot;44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4&quot;
-
-PYPI_PACKAGE = &quot;flask-nav&quot;
-
-RDEPENDS_${PN} += &quot;\
-    ${PYTHON_PN}-blinker \
-    ${PYTHON_PN}-flask \
-    &quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
index d25115251..77735e325 100644
--- a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
@@ -1,2 +1,15 @@
+DESCRIPTION = &quot;Easily create navigation for Flask applications.&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416">&quot;file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416&quot;</a>
+
+SRC_URI[md5sum] = &quot;4d51cfd06d58f8d0fe85775a6696c0e5&quot;
+SRC_URI[sha256sum] = &quot;44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4&quot;
+
+PYPI_PACKAGE = &quot;flask-nav&quot;
+
 inherit pypi setuptools3
-require python-flask-nav.inc
+
+RDEPENDS_${PN} += &quot;\
+    ${PYTHON_PN}-blinker \
+    ${PYTHON_PN}-flask \
+    &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------74DC6C1F4A42C19E8BF654DC--
