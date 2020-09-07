Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.78])
 by mx.groups.io with SMTP id smtpd.web11.576.1599495051387393945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gMKMRiti;
 spf=pass (domain: windriver.com, ip: 40.107.76.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=by/7TpZtiyWfJqGIoN83LAZ8wanWMiiB0UwN+r4Br/H6qER6+p3VdeP3RK73+vWAKENntNcc5zrmrqYIX51WoZZqpk9SukwPdiYeX6XSv1UJDFaBRzUst3sRpSfhiFxqqWgB2vScRncOliZ4YV/a+FGYrE+rOLiMgq9usdjC46XGaFcjAZo3hsMbIdZI2V0vTLqISgTe3vnqBDdDL++qbvsUC/0I+3xhOYt4QWWmB37roJxfaIJfc9hv48p3GTv38047tqbFYAClzv5aoMFkahhXgpTG5kLbFPaz7HbwpZebOetxLvGlb10Y0tOw8dwYFx9pDpD08dC0BJa+fKfyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MG4hfaCukmqhf1zJ/y/Vj2+slSfZ7dhdLJsgG3NiCo4=;
 b=Zn4mXT8bQ8ja/Ab+K9qxCAbrlA9irkmyJ2JC7vH+DsLzIILVl/7i5KjTbGOVaMF9IBkGP/YlboFZPN4WQUvX90XtoHqZQon0KdKQOOmCrFGnDY75ME/BsaAvaew5/V8bs2JmGuLt2cUeNKXEYdxRGGaTxljJ6/mSdo8hrLmQOzdTcNvqngvIhznlzc94CQics7oAl1l5DJBNK9hEtREtd09ucLKHAdG6nLggubbQsQY62znObkzFK0X9Tk4PQdSFHEw6JZP/bvC7hJcdFed5h9p+Z1FzVQp5szjJY8FMUXl2yFYtCsdlz8WGuFMMSlG5DLNKPBDZzv66kNuQT/bBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MG4hfaCukmqhf1zJ/y/Vj2+slSfZ7dhdLJsgG3NiCo4=;
 b=gMKMRitiZe83s2buN+mTYmuoPIPNJjwlVI+m32O28a/UqPXJEEYpxRbyylp2ycqOF1H0n+hR0ScMb2WQ7CjGbor6oXk9ITIlUQSKI0Ebtm6//ebzsZTU+9oHju/l0AWRDyolRQGV/kRgOiUEgnSQMU29mtSi+R6jKp46nzrYctE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 7 Sep
 2020 16:10:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 16:10:50 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-gsocketpool: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
 <20200904134713.13164-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <07157563-4bbf-6aef-aaed-08389173c2f9@windriver.com>
Date: Mon, 7 Sep 2020 12:10:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200904134713.13164-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 7 Sep 2020 16:10:49 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad209181-ef42-4b11-2ae2-08d853489668
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36712174B0B668434D1A89E59F280@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PKvOWlFhLv3cXzrYeGKdIP+q2mfa8TYkGKM91LsYD0heuL8q0VTQDS2q4PSjTelb25NPaUFUcZ0cbMX3BboF3nxcGQDHFs8La8QU4A43xqhNqXePPC2eEmaYO6v3nDCLnOgtMQoW78pnVYTVwiF/Ctwt9brV21p7Sz7uynhOOkuosIp3+F7j1rhopAsf1qxGN9C7BJRivB3T9J+8RxIkXJ7ER3RoSIyrJuxgyeuo8QSPLWOKgfwiT/0+GN8uJeksDVe6kZplBVNtw0aX4PSh3pB1g+OGK/qgxzH/j+lerQl+zJsps13H4M5PEFtyoDFOMOd21LUgsYf+QPms6jXHRqBpVav9USWSsuK6OAiR4Cn2AWLw1iok0gtxXhXU3UQTBYUTPy0hOxAVV2VuIj53bzswAvbxEstfQePO/Pqw1NCQH6f1U4LZbZyjBW88Eu3AxHmNx6vVjVXoDfmuH5Q7EA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(478600001)(66476007)(2906002)(186003)(8936002)(66946007)(44832011)(16526019)(86362001)(31686004)(66556008)(966005)(6486002)(53546011)(33964004)(31696002)(52116002)(26005)(5660300002)(16576012)(316002)(2616005)(8676002)(83380400001)(36756003)(166002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	DsL4vYRDLesFm4HHSS8E0A+BLEvzijI0hSXo05Q9Rzz/18z7E+I8fAUmH3YDIX/wqnNC9Lj0VGol7BMASyyEWwqiv+XtkQlrHHUm8xiTBwY7raWU/xU/3YC0Qwmsih+JLwJzqsqIip0oUSyI/tCrX11Ep4x0IpuCFvcniVrqpns3r8cmZduNwIHutywI+ronzRMePsv+IPBjpu0V0ElbP3vUTy2wppoj9WF7msFSFLj4H+vcCRH+v39oElhISJ0YvfQnsU2G8NqBOYRZkrBxCXX37iArQhSS3T3pbkx1W9pg9d/vDL8vwl0NItPnX8hlSyKi8NgcI1RzlQXawHQ2eNkXtOhxU/yrwb1M8KgxzmRUkHdzGSHw5Mq9tYFXr20w4TwaDI5hBj2JYw1cK3YGyy8EiWs9swz1wilhW0kNuELESI6lwoZwRS4VtD3/bNcioLbYSyMdE90AM01cuCRd9OTt+fEUAyzyZUEDh0Rn2CHtPuF9FcIgklftMq8Fkqt4DusKe70hIVuIoO4bOBCHRw+JDFVZZ9u3ICq1UCsO4rEDi4xeKCl/tgrFLQ1yv3pw8l2sYqsi6PWG5GWNHqTmx/i+tHM9L4CAyviBx0oNgKGSLdzjDocmweq+nvAAjtHdCENP4woCU0CaAjWCfdbM/Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad209181-ef42-4b11-2ae2-08d853489668
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 16:10:50.1553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYn4LisfkSYpc21tlZBqXrBx0eKQswrXowHvBGmxD6V9iLuuqPR85K8x0Q+XRr7B4zk7TEXD2UieQs0VxtRsz2H9Jp4iV3Lj+D0ethTljQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: multipart/alternative;
 boundary="------------D4241E368069740E6AAAEFC9"
Content-Language: en-US

--------------D4241E368069740E6AAAEFC9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/20 9:47 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-gsocketpool/python-gsocketpool.inc      | 12 ------------
>   .../python3-gsocketpool_0.1.6.bb                   | 14 ++++++++++++--
>   2 files changed, 12 insertions(+), 14 deletions(-)
>   delete mode 100644 meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
>
> diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
> deleted file mode 100644
> index 11971dc4a..000000000
> --- a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY = "A simple connection pool for gevent"
> -DESCRIPTION = "creates a pool of connections that can be used with gevent"
> -HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
> -DEPENDS += "${PYTHON_PN}-gevent"
> -RDEPENDS_${PN} += "${PYTHON_PN}-gevent"
> -
> -SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
> -SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
> -
> -inherit pypi
> diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
> index 883621e21..d3e7d48da 100644
> --- a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
> +++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
> @@ -1,2 +1,12 @@
> -require python-gsocketpool.inc
> -inherit setuptools3
> +SUMMARY = "A simple connection pool for gevent"
> +DESCRIPTION = "creates a pool of connections that can be used with gevent"
> +HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
> +DEPENDS += "${PYTHON_PN}-gevent"
> +RDEPENDS_${PN} += "${PYTHON_PN}-gevent"
> +
> +SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
> +SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
> +
> +inherit pypi setuptools3
>
> 

--------------D4241E368069740E6AAAEFC9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/4/20 9:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200904134713.13164-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200904134713.13164-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-gsocketpool/python-gsocketpool.inc      | 12 ------------
 .../python3-gsocketpool_0.1.6.bb                   | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
deleted file mode 100644
index 11971dc4a..000000000
--- a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = &quot;A simple connection pool for gevent&quot;
-DESCRIPTION = &quot;creates a pool of connections that can be used with gevent&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/studio-ousia/gsocketpool">&quot;https://github.com/studio-ousia/gsocketpool&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4ba825394aec026b5f94edca44426859">&quot;file://LICENSE;md5=4ba825394aec026b5f94edca44426859&quot;</a>
-DEPENDS += &quot;${PYTHON_PN}-gevent&quot;
-RDEPENDS_${PN} += &quot;${PYTHON_PN}-gevent&quot;
-
-SRC_URI[md5sum] = &quot;49f5f292ef1b60944ae92ca426a5e550&quot;
-SRC_URI[sha256sum] = &quot;f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14&quot;
-
-inherit pypi
diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
index 883621e21..d3e7d48da 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
@@ -1,2 +1,12 @@
-require python-gsocketpool.inc
-inherit setuptools3
+SUMMARY = &quot;A simple connection pool for gevent&quot;
+DESCRIPTION = &quot;creates a pool of connections that can be used with gevent&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/studio-ousia/gsocketpool">&quot;https://github.com/studio-ousia/gsocketpool&quot;</a>
+LICENSE = &quot;Apache-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4ba825394aec026b5f94edca44426859">&quot;file://LICENSE;md5=4ba825394aec026b5f94edca44426859&quot;</a>
+DEPENDS += &quot;${PYTHON_PN}-gevent&quot;
+RDEPENDS_${PN} += &quot;${PYTHON_PN}-gevent&quot;
+
+SRC_URI[md5sum] = &quot;49f5f292ef1b60944ae92ca426a5e550&quot;
+SRC_URI[sha256sum] = &quot;f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D4241E368069740E6AAAEFC9--
