Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.71])
 by mx.groups.io with SMTP id smtpd.web11.44678.1600701761749992129
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 08:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=c6g67mPf;
 spf=pass (domain: windriver.com, ip: 40.107.94.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0yLji9cz1L3Mc0fZV+3ISYn2+7Y6lAi7MSJE/RYoEiBNlRvImLAa1vWwLx8vexbILVyfwGEx0mjreicrhohajALP+G0oqH6DoMmaEibSoCnLSOxuvV9iAUJlCLFWBKYp5p3RnELiyX9IAo+rqdnJn13j4umROBSVfLCh6WuR/nAr+bM1p/+fWc86jty7wI/xivXJadhdy3FbP8GkUmv/PfRFIwGsMOWLOSvU7T7HcoHdMRECg+hzvzlD6HlHMuwMqOLoe25nnLfGbV020vTLsU9UWLgf2nQcF3QPi7KH01nZ9rxBTG12QNNeuAl5/O/e3jdBPHarBPCF+XYWRTOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D54yNitXxUsItv7fbnIAmcjVte77nBluqyx83AzZDvE=;
 b=Kwfb2j+XPd2BqhfHx0Spg8AFz05gBOa4Cn8sE2vWC6HahkWKoh94V6ngPy1XjVNu6bqDQP9X8H1fq5JcDcF56Iz/heMNtxb9KLIJAdSr4ZpW/mIncpRqExVienNpjZJ0geoiZ81AgyiEKkw0bKIZBef6Ovjd24Dzgy0dJh1luoelDvHBlF/ZDTMNgIqwOAGOT8ppC+MuyNfqR/Mpe0kQzE/CnmvYP8NgfAq94zNxvTTd+2hkqlRJuDpByPdF2UC3oP7DL8xfBA6c6N04dIJ2ciR1E3DSnrJcUmgDcKfvCpe400x4uxYHZnr5GlIZgHFuuBvQQpg0ViJABX/of15tuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D54yNitXxUsItv7fbnIAmcjVte77nBluqyx83AzZDvE=;
 b=c6g67mPfa4h/ZsIdxg+iWWSyptBzYz7Qv/CKDCNd5kY/luybrd43WwdK0fNkKt8lqqZU8lvuBByOk0a7R3rmND4OGIGYrbbwrx1OuMqtc1pbDwgw1dR6UlaNGFBnT8IeEfnkR9/odwANCL+hQWfEpsofjF6/8BB3or4w8GpcR5E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2680.namprd11.prod.outlook.com (2603:10b6:a02:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Mon, 21 Sep
 2020 15:22:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Mon, 21 Sep 2020
 15:22:40 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-rfc3339-validator: Upgrade 0.1.1 -> 0.1.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200918115835.4742-1-leon.anavi@konsulko.com>
 <20200918115835.4742-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <228f252b-3459-7703-4119-7804128294cd@windriver.com>
Date: Mon, 21 Sep 2020 11:22:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200918115835.4742-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0103.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Mon, 21 Sep 2020 15:22:39 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 247b6b83-af50-401c-0ec1-08d85e422d87
X-MS-TrafficTypeDiagnostic: BYAPR11MB2680:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB268059191C39E22182BA9DFB9F3A0@BYAPR11MB2680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ezegu4xkbE4MbME1WIjwH3jVbMXVXOMKnPwqcNJgpRTiotqGGJS27WH/b+exMat+wj1vRw6EkPmwu+wGt4++yT0ozr4YLunmDSNMBs9r40eC5YxepemAOlClF47T/VPendGBoElO/0XcfGSYgHOMNwBrkj0j1RakmKTYLQ0oNrH+PIblyziWhdQqQJnRBAAOMiHYJBOYA0CkLY2Qh5Gp2mtnXsxmmynEUnHSvT1QbWPX5bX1lbpMAFf5iEug8yK80+1l4fu2YnYGjCoZQ1RJ8TH7YFwvtF6+fhu9BaiV9RaNsuWf7qHaydY6vI2GMUpmt1CbolMbOMYyVDfO4s3KD7kLiCjOYa2qxmZfTZ7XAN4uoTiDrqnNM9FDfBOvzDq0UyuBsFC2/xjkShF2GQGqHGmJDj8e+WEXdCrIp3E9iB9Aqwd3vUS8jO15Ge1/h3yOYBjm3d0BaVJuhS3AnChp8Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(2906002)(31686004)(53546011)(36756003)(31696002)(8936002)(2616005)(83380400001)(33964004)(956004)(52116002)(16576012)(316002)(16526019)(26005)(478600001)(166002)(186003)(44832011)(86362001)(6486002)(8676002)(66476007)(66946007)(5660300002)(66556008)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ry7Dk4FUB0M3nzPwulklYTtXvk3MzzY1kQX6xpFNzGdPL33+Wj9nirYpEybdMLS6e8LiJSEY3jauUzQS4fY5efIqf7buUWnp9TH09FuI2gdZD+MKoZ8IZmNYhJlYoWlIn5crMtyhUr0Z0WxuJ8XwnJBWFPGPEFKc8rVs/KRjLWz+QtIEkE/15+6hfbUtffbjgDa+NurDwUHgNbhOwgjKOO4uSfx3Q5EVMFe/PwqPK5jY/kfy1OERro9BqTGNLlc65k1+fNtE27/PuHe0F3qEeyGQQH0mkRN955uY7nC1dKstUhlceXUPWLbV9Z+tv7LHgygwM6QjQzpHCU2KsOW61jw4sv8KekRSWMtezEYfXT4LWdQQp/+C4Cjsc8A3dz/ZNcKBAVGrFRzPGY3EuS/GUyKJAZeyQpd5RYw8Z0cTVpAwlSlRr/Sib1/2EOFf59j1Z5LYwxNzW6a2Rs31xdZkvQjwHBHxtz41G1Twgkw3VtvnBL06IAbpWNB7V2fYmULgIS9RJQMZn8Uw0mMICap0n/x5+iQ8PT96BLcXBPETaOu1XqfNJKvY3D1csPjLFMAvFIWAQM8d2Y68BleTBIJl4qDTIt1pmB7QyntyuzeeRce/nwHxWiLD5OCQY4FwAebBrWnYcsP1xwfkt5+YA2v3Tw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247b6b83-af50-401c-0ec1-08d85e422d87
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 15:22:40.0741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlBPH2T6x4PP56BPtK/xbpFEezI/YDbNW3YRaVo14KXyYWAfPFxvXFlhWHpt33LFgcrnyEyQFMr71FPfViG42mQpahiMj4jclhPuOxCvyL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2680
Content-Type: multipart/alternative;
 boundary="------------2EA55318C108433FCDE15889"
Content-Language: en-US

--------------2EA55318C108433FCDE15889
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/18/20 7:58 AM, Leon Anavi wrote:
> Upgrade to release 0.1.2:
>
> - setup.py: move pytest-runner to test_requirements
>
> Patch has been removed from the recipe because it has been already
> upstreamed in the new release.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...e-pytest-runner-to-test_requirements.patch | 32 -------------------
>   ....bb => python3-rfc3339-validator_0.1.2.bb} |  8 ++---
>   2 files changed, 2 insertions(+), 38 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
>   rename meta-python/recipes-devtools/python/{python3-rfc3339-validator_0.1.1.bb => python3-rfc3339-validator_0.1.2.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch b/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
> deleted file mode 100644
> index ce8ca0bc8c..0000000000
> --- a/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 2de281fdca88f223ace1eb6428a77b9903c69264 Mon Sep 17 00:00:00 2001
> -From: Nicola Lunghi <nicola.lunghi@jci.com>
> -Date: Thu, 14 Nov 2019 11:58:28 +0000
> -Subject: [PATCH] setup.py: move pytest-runner to test_requirements
> -
> -This fixes an issue with yocto build.
> -pytest-runner is only needed when running tests.
> -
> -Upstream-Status: Pending
> ----
> - setup.py | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/setup.py b/setup.py
> -index 9a50767..e3b1c6e 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -12,9 +12,9 @@ requirements = [
> -     'six',
> - ]
> -
> --setup_requirements = ['pytest-runner', ]
> -+setup_requirements = []
> -
> --test_requirements = ['pytest>=3', ]
> -+test_requirements = ['pytest>=3', 'pytest-runner']
> -
> - setup(
> -     author="Nicolas Aimetti",
> ---
> -2.20.1
> -
> diff --git a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb
> index 1f5d91d3b2..e226e11b75 100644
> --- a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb
> @@ -5,17 +5,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
>   
>   FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3339-validator:"
>   
> -SRC_URI[md5sum] = "9d8899041d83f98180bddd8b62ee7e99"
> -SRC_URI[sha256sum] = "20a600d01fbb1f793cbb6f4ec4ebb2104f4c9e80d74d5f78350b63ecc6cccd08"
> +SRC_URI[md5sum] = "2c233007189d5ef21046cb2afac51a96"
> +SRC_URI[sha256sum] = "c9659c3183488a1875c4d327c9873d9e92c54cdcd69dfbfae7546ad8b27baf9a"
>   
>   PYPI_PACKAGE = "rfc3339_validator"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI_append = " \
> -    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
> -"
> -
>   RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-core \
>       ${PYTHON_PN}-datetime \
>
> 
>

--------------2EA55318C108433FCDE15889
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/18/20 7:58 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200918115835.4742-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.1.2:

- setup.py: move pytest-runner to test_requirements

Patch has been removed from the recipe because it has been already
upstreamed in the new release.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200918115835.4742-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...e-pytest-runner-to-test_requirements.patch | 32 -------------------
 ....bb =&gt; python3-rfc3339-validator_0.1.2.bb} |  8 ++---
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
 rename meta-python/recipes-devtools/python/{python3-rfc3339-validator_0.1.1.bb =&gt; python3-rfc3339-validator_0.1.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch b/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
deleted file mode 100644
index ce8ca0bc8c..0000000000
--- a/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2de281fdca88f223ace1eb6428a77b9903c69264 Mon Sep 17 00:00:00 2001
-From: Nicola Lunghi <a class="moz-txt-link-rfc2396E" href="mailto:nicola.lunghi@jci.com">&lt;nicola.lunghi@jci.com&gt;</a>
-Date: Thu, 14 Nov 2019 11:58:28 +0000
-Subject: [PATCH] setup.py: move pytest-runner to test_requirements
-
-This fixes an issue with yocto build.
-pytest-runner is only needed when running tests.
-
-Upstream-Status: Pending
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 9a50767..e3b1c6e 100644
---- a/setup.py
-+++ b/setup.py
-@@ -12,9 +12,9 @@ requirements = [
-     'six',
- ]
- 
--setup_requirements = ['pytest-runner', ]
-+setup_requirements = []
- 
--test_requirements = ['pytest&gt;=3', ]
-+test_requirements = ['pytest&gt;=3', 'pytest-runner']
- 
- setup(
-     author=&quot;Nicolas Aimetti&quot;,
--- 
-2.20.1
-
diff --git a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb
rename to meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb
index 1f5d91d3b2..e226e11b75 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb
@@ -5,17 +5,13 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6">&quot;file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6&quot;</a>
 
 FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-rfc3339-validator:&quot;
 
-SRC_URI[md5sum] = &quot;9d8899041d83f98180bddd8b62ee7e99&quot;
-SRC_URI[sha256sum] = &quot;20a600d01fbb1f793cbb6f4ec4ebb2104f4c9e80d74d5f78350b63ecc6cccd08&quot;
+SRC_URI[md5sum] = &quot;2c233007189d5ef21046cb2afac51a96&quot;
+SRC_URI[sha256sum] = &quot;c9659c3183488a1875c4d327c9873d9e92c54cdcd69dfbfae7546ad8b27baf9a&quot;
 
 PYPI_PACKAGE = &quot;rfc3339_validator&quot;
 
 inherit pypi setuptools3
 
-SRC_URI_append = &quot; \
-    <a class="moz-txt-link-freetext" href="file://0001-setup.py-move-pytest-runner-to-test_requirements.patch">file://0001-setup.py-move-pytest-runner-to-test_requirements.patch</a> \
-&quot;
-
 RDEPENDS_${PN} += &quot;\
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-datetime \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------2EA55318C108433FCDE15889--
