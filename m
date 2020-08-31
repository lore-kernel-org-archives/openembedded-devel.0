Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.70])
 by mx.groups.io with SMTP id smtpd.web12.52751.1598879554692514028
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OnVO/AK7;
 spf=pass (domain: windriver.com, ip: 40.107.243.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxA/+uIBSbIfADGwe6YSrux4KBCwbBLd6OQHe+xKpKsepGccwhSj9+ngVMU6VTaGoXAoJIUIhidZTxZv9JtsGke8x11VjDZ4Ti8CZnC043s2PvtpCpGDkzBUKIORRXTSRvgiymCyBbrsJWe2aMKC4Ir1lEuKXsVmPIPhA0pR+xNbHTOxZ9S1L7EDJ6MEmgPtIEZm8e+vFcDopKZ9uFtAfIfT4SL8rRrVkCLFoE1QiZPs5NIn9cOPVkZtmwKOYOcqBa1Ka9PTZwDhplYA2YtO2tGlx/KNAJGzfvnstQg4mbEEdmSSfrfYw/nXtZgSJ7fh3izoZvFChL5V3/L+/KrQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yInm4v7zu1iB+tevPM1Mfy4SWOQc2IvxS9qheRqHFIk=;
 b=EW7LIUESWLf6aqdaon/uAo6wXEzKVNyIT/zlz+yGCLFo3EP7F09gt/xzaKz9Ot1V6mpKKfJRo2fgRMvJjuexPqYXbV4VB6F7lsLwwmtYecscT35u6ZmO6xiz7B9npRWHHI8eppiDqWcgGhi0m+ShafUCmLIqpAopAGhXDnIO4qKsKQ2WVGcT9+yWpo2ol/ZasgRHRQLG0tjI6qWIxmOzAoutUB0mgoNjyzdKxtfqsOYruvQjI56JugpD9YuAVaTbL8wHUqe9uYCjDgUsoSTU4n//VXQH89jocSADPgCmxYUy7DgzJxu80tgdFlDbypg6yB7yqmrmW91gXyy3nIQ58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yInm4v7zu1iB+tevPM1Mfy4SWOQc2IvxS9qheRqHFIk=;
 b=OnVO/AK76y41fJR4Wal0w3BJ887PY5Xd+z13dHMXWAAldmRlTtjPvoPXxamapaf5TmlA4jJcePN33G0i2NKYBqPheTRRRclAoMR7PsvJnzQUoLEYHmkx3EA2iGIpFkUbcIk8ClACIla6pGAK4TNEAgU5dsrYzUgq3Sv+42aEUHU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Mon, 31 Aug
 2020 13:12:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:12:33 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-flask-restful: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200827145504.29147-1-leon.anavi@konsulko.com>
 <20200827145504.29147-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <95411a5d-4514-ce39-38ff-e1940bd08b68@windriver.com>
Date: Mon, 31 Aug 2020 09:12:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200827145504.29147-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 13:12:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7442f764-7b3d-47d5-2466-08d84daf85bb
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB422624D3D3A4A4060879211A9F510@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:224;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	017mBBfxHjxuPGFpZVDsPxmQl6/uGdBHyaeM9eF/5gjZcQvbu273FVBGfjfq4a6mDMSMdTkJMbggO9vtu/Mf3N1gaK471Ldh77rJIKoKmeohrNyKc22vntzFO0oAWWnTUerqufmEpt6xkKEtUTPylbC/qqlIDXyheuX+xYYY3gOoyTDJHx7hwXl3SAGmBlQSfl9gK3IA/uYif8RYwcbWCLYZlKox0/e5eKnpiMEYbzsJsINs7Xkvrmgj2DR1Z7QrA2TWNN7aztlnF6VlQ1IGhzFxbJwxlVDG9iajQ6rmq0/Rmlys+v6WOs6krmPF2eh2IWLY5PAkCU39ngQf2w/K3OoD5bis/l2FkgW4F6UHqzLzPaz3vi6u1e77JWG5H0MF/qWA+GtzCbSMnUXmplUN55yB9kifflBNFc8qgY6PRH/50vKwvvZZvt5PBuU4Pcfu3ukQH3E0Di1yT/dN4Nqz+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(186003)(8936002)(2906002)(966005)(36756003)(478600001)(8676002)(16576012)(66556008)(52116002)(83380400001)(66476007)(5660300002)(26005)(956004)(2616005)(44832011)(316002)(166002)(66946007)(31686004)(6486002)(33964004)(86362001)(31696002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	n4/OqmX9Ek+VXL3ZqYme/cIrPptGlX6FK78tmnBGXby55dNLJH0Vm9D6GUMxi4pBFa6Ll9fD0n0VZgj+DDwnaUK9mItsRgbVO4XDUEK/R8EoMxzCco8z7ERkqQEBNJYjTZsLO7Sp8bEEx+8vlSVmKlePhrNs4/+WHa+HhNo+HzBPvhdVjOHAYC215uRY2OaDZb6TRvxFr74l9vJOG/FJPx54yO8xanqB+nN1QiscvfKAMkh7UtjFP753aXYfLYDcpPxUiJttIHT2ROryVf5FcFtirQDs+6CXmKWqOn9SRMJcXraHFZlcxoVU/StPoj4B5IdYi3lGQFSl+ZXMMv/BIz/p90NBCVQLCrMZ5alCsfl2m7RzPIhr/Ro54a5qn/eL/p6/NU8GJZAT2oSG0anPY7gioK1parKkAYc8lzjfs+Zc3wWu6tBHqj19K5/Rar1WxeCexn0tDzR5o1QBP6+6ZaCHkzdJ02LpZ1WNjJzM5tiOGnzdc9FYx91VCYasDiY/i7ZhaNUGygXUMO5EO1JQyv14L2Jisugxi5cvwi0p9KOLjHdU1dshls9xPVLQoqtwiH3jAfYugvaWtdIkbKH2douQuNuLAO32oW9PhAqsIgZLomDxgJo5LVobCtrbkXu6EWXYGIYxpBT41dktIze9uQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7442f764-7b3d-47d5-2466-08d84daf85bb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:12:33.3963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAY90o+1QG1gHO3BHGh7ObnDEJ/OAwuiuhz8d1zJRGfPvPwbbcdkaXVBXCTXh1yNSmIPlYTpKxoYdgiWdo3MPddQ4utRnADKNx6kwKjI/sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------AD65F74A2F69EEE1110A5864"
Content-Language: en-US

--------------AD65F74A2F69EEE1110A5864
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/27/20 10:55 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-flask-restful.inc            | 16 ----------------
>   .../python/python3-flask-restful_0.3.7.bb      | 18 ++++++++++++++++--
>   2 files changed, 16 insertions(+), 18 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-restful.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-restful.inc b/meta-python/recipes-devtools/python/python-flask-restful.inc
> deleted file mode 100644
> index dcbcd0d76..000000000
> --- a/meta-python/recipes-devtools/python/python-flask-restful.inc
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY = "Simple framework for creating REST APIs"
> -DESCRIPTION = "\
> -Flask-RESTful is an extension for Flask that adds support for quickly building \
> -REST APIs"
> -HOMEPAGE = "https://github.com/flask-restful/flask-restful"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783"
> -
> -SRC_URI[md5sum] = "a7217ef1159be38af5faf61aa09aabef"
> -SRC_URI[sha256sum] = "f8240ec12349afe8df1db168ea7c336c4e5b0271a36982bff7394f93275f2ca9"
> -
> -inherit pypi
> -
> -PYPI_PACKAGE = "Flask-RESTful"
> -
> -RDEPENDS_${PN} = "${PYTHON_PN}-flask"
> diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
> index 6bff59a56..ad2757838 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
> @@ -1,2 +1,16 @@
> -inherit setuptools3
> -require python-flask-restful.inc
> +SUMMARY = "Simple framework for creating REST APIs"
> +DESCRIPTION = "\
> +Flask-RESTful is an extension for Flask that adds support for quickly building \
> +REST APIs"
> +HOMEPAGE = "https://github.com/flask-restful/flask-restful"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783"
> +
> +SRC_URI[md5sum] = "a7217ef1159be38af5faf61aa09aabef"
> +SRC_URI[sha256sum] = "f8240ec12349afe8df1db168ea7c336c4e5b0271a36982bff7394f93275f2ca9"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "Flask-RESTful"
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-flask"
>
> 

--------------AD65F74A2F69EEE1110A5864
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/27/20 10:55 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200827145504.29147-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200827145504.29147-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-flask-restful.inc            | 16 ----------------
 .../python/python3-flask-restful_0.3.7.bb      | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-restful.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-restful.inc b/meta-python/recipes-devtools/python/python-flask-restful.inc
deleted file mode 100644
index dcbcd0d76..000000000
--- a/meta-python/recipes-devtools/python/python-flask-restful.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = &quot;Simple framework for creating REST APIs&quot;
-DESCRIPTION = &quot;\
-Flask-RESTful is an extension for Flask that adds support for quickly building \
-REST APIs&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/flask-restful/flask-restful">&quot;https://github.com/flask-restful/flask-restful&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783">&quot;file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783&quot;</a>
-
-SRC_URI[md5sum] = &quot;a7217ef1159be38af5faf61aa09aabef&quot;
-SRC_URI[sha256sum] = &quot;f8240ec12349afe8df1db168ea7c336c4e5b0271a36982bff7394f93275f2ca9&quot;
-
-inherit pypi
-
-PYPI_PACKAGE = &quot;Flask-RESTful&quot;
-
-RDEPENDS_${PN} = &quot;${PYTHON_PN}-flask<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bbb/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bbindex6bff59a56..ad2757838100644---a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb+++b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb@@-1,2+1,16@@-inheritsetuptools3-requirepython-flask-restful.inc+SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
index 6bff59a56..ad2757838 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
@@ -1,2 +1,16 @@
-inherit setuptools3
-require python-flask-restful.inc
+SUMMARY = &quot;</a>Simple framework for creating REST APIs&quot;
+DESCRIPTION = &quot;\
+Flask-RESTful is an extension for Flask that adds support for quickly building \
+REST APIs&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/flask-restful/flask-restful">&quot;https://github.com/flask-restful/flask-restful&quot;</a>
+LICENSE = &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783">&quot;file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783&quot;</a>
+
+SRC_URI[md5sum] = &quot;a7217ef1159be38af5faf61aa09aabef&quot;
+SRC_URI[sha256sum] = &quot;f8240ec12349afe8df1db168ea7c336c4e5b0271a36982bff7394f93275f2ca9&quot;
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = &quot;Flask-RESTful&quot;
+
+RDEPENDS_${PN} = &quot;${PYTHON_PN}-flask&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AD65F74A2F69EEE1110A5864--
