Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.71])
 by mx.groups.io with SMTP id smtpd.web11.167.1591377967081999809
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fajBiIKh;
 spf=pass (domain: windriver.com, ip: 40.107.244.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djxP0Khg0KKWTjb1IVxQ1B8mhjpnyCgrMNCOqSs34FNj/pPltHJ4x9Vk1V8DwAhHdAf56D8e4gx4pjDokKwZ/i4/J+IyuaI5d1/p07I3WPG1wPaNiOPWE6BE180ywp44yOiJluLntpuzu+HtISddcZ+5XZmejvDicGg+bYBI/GLEaMXN7qrARUCmma7n34TbJuuWaycQJV2YM6qhwrz3RNTX31xPvBiiIPwmkxg+yC3kAhZgvCtGDxg59ucuBwH4dDp44puR3zl6o+Rp+s27/ZVRzscsN1S19MxurKiCkPC/stfzXpFYm+dNOPf09OnX66OcjIyNxxOZOzgET/kHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJtm8lxsioLiQXBcz78aifnIVCfrjYadiPylAcwjdLc=;
 b=XGnMvKqNeNz8pYGNXbwyY1ami3UcbovaYmiBmwQlyNuxrh1XbnNr6yYH678weQTeLd4dsS0MyA5iaDQWiQMUqx4zWEdYFcuO5yBg6osKiGbXW7wGcKa4eCz1e/JLEume5hGNewboJnxNHv2mdqCF1MHVcgtH7EqQhfpKzrZY1+bLshxHiTJiGjpe5ErsPM3z+N3XSIEIjD2JwbXefS3znwdJGriNKDp78eXVUr0BBX2Qcojul9KgqGOWCnOF5PxcZ6Pwm+Emt4eScsp7XAndbs0O0ZUkGFkgz+4laJkLjkrDE7+8QwWYT+ugFtScv/1U+ZIgXKCUYz9jPtS4vX4hcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJtm8lxsioLiQXBcz78aifnIVCfrjYadiPylAcwjdLc=;
 b=fajBiIKhKdU5sM8UWoEWvVnUBCzCd7nNmRHviGfyiCInsNvdbvSlxvbf5MmFDYuBQbL3aGG68B1bjdvJnXcRb8vkU0F8m6uTWDFFAvy8K/YQaLKijPUdV/QWT4gajiPOAK704Lc4oMMSkG1s5jgIBwr2PUGFjUV8KJVfnUybU+w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1874.namprd11.prod.outlook.com (2603:10b6:404:107::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Fri, 5 Jun
 2020 17:26:05 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 17:26:05 +0000
Subject: Re: [oe] [meta-python][PATCH 2/6] python3-dnspython: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200604121223.3818-1-leon.anavi@konsulko.com>
 <20200604121223.3818-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <301848e4-0601-e5e7-9904-9ef5940f43dd@windriver.com>
Date: Fri, 5 Jun 2020 13:26:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200604121223.3818-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 17:26:05 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf8210eb-e449-4c6f-c294-08d80975871b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1874:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1874D90D9A3FF2FAA156A44F9F860@BN6PR11MB1874.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ByhQhC36/Xvv/b1RwKjsluIHyXuCoRgPkS0/wZsZAKPx/2u6jumqlb4ecBhAmZFoU5s2C1B7GFuJxHF0e24fOdj3o7ot4FF3Xg1CSYfc9C53SuxiGuKvu4PMEMsE77NbzWFzhfPKNI2YJiUy/fZmwlJQZWoUIbTHLgiiVWs1YjKn1NnNfFFkNTjhgrdQQhtLzjaoM9tlyLNyoO7DFurAfA+eCa0/Y6j3xgrIZswotoLC/l3NHIQB8nX4TctsNi0jJVyXMXoGN8A84MjMN76xH7MHLqzarqkI+sD7jv+XXnG5mikLGV39NLuQX5ESXYFa6/3lYnBj5NrXCYx6jimuxHFwLFM9Pirp4MWXxn1+4SZ6z8S3spfeSrsFB3DAF5+fpBZRr9ExyYBaJEkjBYg7HZRjzRyzq/Bhg5sX/Kmf1oqZdXPEPDqWGsth7VU4mo09OI27/R2fk0ZqOnok0i4GQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(396003)(39850400004)(2616005)(66476007)(186003)(66946007)(86362001)(16526019)(316002)(16576012)(8936002)(26005)(52116002)(44832011)(6486002)(53546011)(33964004)(956004)(31686004)(8676002)(31696002)(36756003)(2906002)(66556008)(966005)(166002)(83380400001)(5660300002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AUBaO4GSfv/bGOgNhEkBXKaxTFgHc+oHQEdY3bQm99/G7sxNpwN0A7WKiXMDdHVOHtG6Vfdc/59ZskmKIl2YR+B1HxwOIestYyM6Wb8TeSbNYOPo1H3q0j8oI5JagLlZSy3g4dwA2JaumgEQl7UoXjEUoLpOaQvbAA7NhkJj+Sj2zKi1fIqQ5Ekxx8ESjYGqKPSt5PdxrtP/DJWHNFkmOMe2fcOZRTu98DqV2Yw+V/eQibaW7CrKRDQQ+t8nQiiGd+gD4fcFgkUvHloLLQpco2ZhLQ8gGBIhDM2zC8xZ2uMwqCflaoyokayCTo6Gge/Euup58blgXq1rZ521xxGaqqmMykneVggCkJY2QxwNCKac8m0Nh9VXG3AxL4GxAGdkq8fKjdx/0N+r1wBP1ZW5SFuWGanJVigOlT5tLuDldzt1zLnwgw0R/DVYO65NBburL9vb9sq3G5bKhkKmY3qR1HIaZgcqRpV/AUXgkalXqqc=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8210eb-e449-4c6f-c294-08d80975871b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 17:26:05.8140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imSjefXuIZKOIiyI5/KW3tiu2FAfnwxbowmkWQZMRSlXraA/WmcmCzQG/iJXLFP63kQ3704tYh+OpbpV8aHOVlHgSf7eeEsdFpgZNk6proc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1874
Content-Type: multipart/alternative;
 boundary="------------9A004DD735CB38012DC16B05"
Content-Language: en-US

--------------9A004DD735CB38012DC16B05
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/20 8:12 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-dnspython.inc               | 20 -----------------
>   .../python/python3-dnspython_1.16.0.bb        | 22 +++++++++++++++++--
>   2 files changed, 20 insertions(+), 22 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-dnspython.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-dnspython.inc b/meta-python/recipes-devtools/python/python-dnspython.inc
> deleted file mode 100644
> index 84502affe..000000000
> --- a/meta-python/recipes-devtools/python/python-dnspython.inc
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION = "DNS toolkit for Python"
> -HOMEPAGE = "http://www.dnspython.org/"
> -LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
> -
> -SRC_URI[md5sum] = "bc9ca3b3a82164667d5730ec6d5248a2"
> -SRC_URI[sha256sum] = "36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01"
> -
> -PYPI_PACKAGE_EXT = "zip"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-crypt \
> -    ${PYTHON_PN}-io \
> -    ${PYTHON_PN}-math \
> -    ${PYTHON_PN}-netclient \
> -    ${PYTHON_PN}-numbers \
> -    ${PYTHON_PN}-threading \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
> index ce4dfdc74..cb255442f 100644
> --- a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
> @@ -1,2 +1,20 @@
> -inherit setuptools3
> -require python-dnspython.inc
> +DESCRIPTION = "DNS toolkit for Python"
> +HOMEPAGE = "http://www.dnspython.org/"
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
> +
> +SRC_URI[md5sum] = "bc9ca3b3a82164667d5730ec6d5248a2"
> +SRC_URI[sha256sum] = "36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01"
> +
> +PYPI_PACKAGE_EXT = "zip"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-crypt \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-math \
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-numbers \
> +    ${PYTHON_PN}-threading \
> +"
>
> 

--------------9A004DD735CB38012DC16B05
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
    <blockquote type="cite" cite="mid:20200604121223.3818-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200604121223.3818-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-dnspython.inc               | 20 -----------------
 .../python/python3-dnspython_1.16.0.bb        | 22 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 20 insertions(&#43;), 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-dnspython.inc

diff --git a/meta-python/recipes-devtools/python/python-dnspython.inc b/meta-python/recipes-devtools/python/python-dnspython.inc
deleted file mode 100644
index 84502affe..000000000
--- a/meta-python/recipes-devtools/python/python-dnspython.inc
&#43;&#43;&#43; /dev/null
@@ -1,20 &#43;0,0 @@
-DESCRIPTION = &quot;DNS toolkit for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.dnspython.org/">&quot;http://www.dnspython.org/&quot;</a>
-LICENSE = &quot;ISC&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5af50906b5929837f667dfe31052bd34">&quot;file://LICENSE;md5=5af50906b5929837f667dfe31052bd34&quot;</a>
-
-SRC_URI[md5sum] = &quot;bc9ca3b3a82164667d5730ec6d5248a2&quot;
-SRC_URI[sha256sum] = &quot;36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01&quot;
-
-PYPI_PACKAGE_EXT = &quot;zip&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
-<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bbb/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bbindexce4dfdc74..cb255442f100644---a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb@@-1,2&#43;1,20@@-inheritsetuptools3-requirepython-dnspython.inc&#43;DESCRIPTION=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
index ce4dfdc74..cb255442f 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
@@ -1,2 &#43;1,20 @@
-inherit setuptools3
-require python-dnspython.inc
&#43;DESCRIPTION = &quot;</a>DNS toolkit for Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.dnspython.org/">&quot;http://www.dnspython.org/&quot;</a>
&#43;LICENSE = &quot;ISC&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5af50906b5929837f667dfe31052bd34">&quot;file://LICENSE;md5=5af50906b5929837f667dfe31052bd34&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;bc9ca3b3a82164667d5730ec6d5248a2&quot;
&#43;SRC_URI[sha256sum] = &quot;36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01&quot;
&#43;
&#43;PYPI_PACKAGE_EXT = &quot;zip&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-crypt \
&#43;    ${PYTHON_PN}-io \
&#43;    ${PYTHON_PN}-math \
&#43;    ${PYTHON_PN}-netclient \
&#43;    ${PYTHON_PN}-numbers \
&#43;    ${PYTHON_PN}-threading \
&#43;&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9A004DD735CB38012DC16B05--
