Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.51])
 by mx.groups.io with SMTP id smtpd.web12.14235.1590158213289499480
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 07:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dxeLfCLH;
 spf=pass (domain: windriver.com, ip: 40.107.92.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEBwEI30xeRd0Q6+C/6ixDMaIsa6Nkhx4Kf3lFgt5WVszrtYLqpOJ5mwhSzToQ/w57DCXRRkzIWxpUNFa209qTHnFwFXnFIUbqW/LQldQKMeCjwD7wCNUFZ83CDxWuCh9n2M3WGFZJndLgdFxc3iS2wOQRHweZYdSRoVMnmq1pdlks/8HWxPkvH4CwtyhZLzfreQCjWQy6GRvj3uNR9UiLrCNxwLihffwGqkIEebLm5y5WvB1fVHO0Z4l7iGPXiFYkfJPFaL0WCSQs0oS6f9jL7J5bt1DHL6lr2J3siEyoVLRQsghp5Jd714Ec4zE0pS3iVF+1NgTgrjWGKjks1/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPFE/v1JdEBuEL+3eODAuvzx2lyl/DSI2Q+rW4pQfJI=;
 b=ny6580XyZH8hcn4xwpKnZENcntxQAWsVF/vM+XbBL6HlKup09gL5S5SoYXlgEU0CFH7yAKxx05QOiOKOwPUj3JaUAN954Rm7K0Xto15yVlpabygS5hmmfLRLPgG77L/V1SwoPAY2pdCgYDFQ80izhsD1/GbliAPw1eBYV9KNHkkR1Ht3QxSMbQ4qZ2BJ23d2I00rleWoAGlQRM5R2HqRAMKNVaOPXOCkSLEK8ZOCfDTiuubYDTW8a5bEJP6hW+cBe/n9Ck2DSadk/7p3OGvNQnbn5zbAyUEspzfx3KPVbL48NCqnUBPZiCcwdixJ17Rb0Mu1Pv96l24lVeXMbHdeWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPFE/v1JdEBuEL+3eODAuvzx2lyl/DSI2Q+rW4pQfJI=;
 b=dxeLfCLHLJG/jnSaShYRxneLKiXCQlntKkNK2QRFemC4rXnPHUQSuYdro2LDWYB5XF2Of/EsFUsDbT2OPaLtG4kIyOn+L9eGGLoiXquHfOyrRws7qJ3YR4+/yJMX0bpDJ5BX0h6fsL72ylBRfPFCD8AO7YUhiN+xQbKh1KYs72s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3876.namprd11.prod.outlook.com (2603:10b6:405:77::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 14:36:52 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 14:36:52 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-openpyxl: Upgrade 2.6.3 -> 3.0.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200521231325.685-1-leon.anavi@konsulko.com>
 <20200521231325.685-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ef1022b5-cd3d-28d2-d0b5-39261b2dc7a4@windriver.com>
Date: Fri, 22 May 2020 10:36:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200521231325.685-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::20) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 14:36:51 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2dfaf55-98af-4c42-8719-08d7fe5d9150
X-MS-TrafficTypeDiagnostic: BN6PR11MB3876:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB38760586BF079265F23543689FB40@BN6PR11MB3876.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dReMhc/SiD66C2HCbHpEglAKmxpHh/LS94DbB9zbfND2WAdSu2Nz2GYKjGLi08oYN68XOKSy5XCrKGdiBo9VwjekD4jrJEQmlQWXU4jGYJN7ixNUn6zcb8nRqZH568jKhEfR989OFNNq7WR5dYeQpqV/pRuJxAKnIKUsuj5Q/F6Oj5frn8EOf7HHpsDipai5JhX1rI4HCKuAyqMvEaxjVZfmONjFpJ9mmQ3N6vkrKs2RURvjyxnFZZ2mxoaxb1lYKGqRzj1XrtRlLcCc2eqxCBJDx8Lsvt8axvbgiuYQbJ5nOP30v6p9ZXo0niBev2i8eDqJ4q36x3EnvmQe7ncBpSuFKBX1ztmdBIPSQKV+wVUnN20RwJvhjXFby/lE+wyrKJUP8D8Cu0ic6SMKnS+fYa3QgmwmlWbum1alUlL3rmKxZmZPuDVgDi5SPyvictvnBRs3Kce/dmOHiMs/QC8UBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(396003)(136003)(39850400004)(31696002)(966005)(86362001)(66476007)(66556008)(66946007)(5660300002)(36756003)(33964004)(16576012)(52116002)(2906002)(31686004)(316002)(44832011)(2616005)(956004)(16526019)(53546011)(478600001)(8676002)(166002)(186003)(26005)(6486002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	JiIJo9rbeFB5ownaxu7vg9WWecfVrIIgCVESaNcr6ohH3w1j0mPZpv1uuS7cS1+oiH05M6s3DYvJdEvZr/c+epI8IHGIz/5hvpjB9DdnDSwphLj4oUHfT2quZSe8eFUru0bwQSHlFt0jbF8TbnFYlLZ/aXLQjpChJ4dk3iwPHZDDKZCsCuUPl7QzKTuxFZtTjddGiBWqELxDT6DbCwR9phw2RmYWvImJX2c8e3DDZSIEllbWFFDiAtC6fQA3v2cOqc+SYL0/NOD7ewcmDZ3aVejnzJsldUZi5FbuvIQs3RxOUEtGNsATvX5y2/MO2H/13ljVALfgVSIxI/I+dd+Qj7rtiudBtj+n+GrImd+GYaSRHsmyQqCA7drVSQ38eHd5URzTfavh/5+qN6TpOiKcF5sPCtZp0XXXGX54GTFxwzW1xOIG6WjlVfFMzVdqTg+nBaw0nm3IVlFrsMunTmap2N642KZs32AlIA9pk+SsYSjg8NpFbGFyjbiUL10upjH3
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dfaf55-98af-4c42-8719-08d7fe5d9150
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 14:36:52.0441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFQk0nXyqDF6BFMQClXyxRJ0HttRXi+E3QprpMkksni9dikC8x8jNmX+p06zbsL550nmyXjke4zB5JT2bKvDYxj9lTrW0B4QjpQqNvgStzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3876
Content-Type: multipart/alternative;
 boundary="------------5FB55DCB3B6AE31B12373DAA"
Content-Language: en-US

--------------5FB55DCB3B6AE31B12373DAA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/21/20 7:13 PM, Leon Anavi wrote:
> Upgrade to release 3.0.3.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-openpyxl_2.6.3.bb => python3-openpyxl_3.0.3.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-openpyxl_2.6.3.bb => python3-openpyxl_3.0.3.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb
> rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
> index 87cb46ea9..018c4abe2 100644
> --- a/meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
> @@ -5,11 +5,11 @@ was initially based on PHPExcel."
>   
>   HOMEPAGE = "http://www.python-excel.org/"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3baf26d8abf08632beaf913ea973cb8a"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a6e506457afab4a25ecbaeb4bc3ed623"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "b067750e51f17a1a9cc6bacfdd668218"
> -SRC_URI[sha256sum] = "72d1ed243972cad0b3c236230083cac00d9c72804e64a2ae93d7901aec1a8f1c"
> +SRC_URI[md5sum] = "9583cea56b9d4441d96eb63a8a5c92a4"
> +SRC_URI[sha256sum] = "547a9fc6aafcf44abe358b89ed4438d077e9d92e4f182c87e2dc294186dc4b64"
>   
>   RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
>
> 

--------------5FB55DCB3B6AE31B12373DAA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/21/20 7:13 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200521231325.685-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.3.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200521231325.685-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-openpyxl_2.6.3.bb =&gt; python3-openpyxl_3.0.3.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_2.6.3.bb =&gt; python3-openpyxl_3.0.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
index 87cb46ea9..018c4abe2 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
@@ -5,11 &#43;5,11 @@ was initially based on PHPExcel.&quot;
 
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.python-excel.org/">&quot;http://www.python-excel.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=3baf26d8abf08632beaf913ea973cb8a">&quot;file://PKG-INFO;md5=3baf26d8abf08632beaf913ea973cb8a&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=a6e506457afab4a25ecbaeb4bc3ed623">&quot;file://PKG-INFO;md5=a6e506457afab4a25ecbaeb4bc3ed623&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;b067750e51f17a1a9cc6bacfdd668218&quot;
-SRC_URI[sha256sum] = &quot;72d1ed243972cad0b3c236230083cac00d9c72804e64a2ae93d7901aec1a8f1c&quot;
&#43;SRC_URI[md5sum] = &quot;9583cea56b9d4441d96eb63a8a5c92a4&quot;
&#43;SRC_URI[sha256sum] = &quot;547a9fc6aafcf44abe358b89ed4438d077e9d92e4f182c87e2dc294186dc4b64&quot;
 
 RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5FB55DCB3B6AE31B12373DAA--
