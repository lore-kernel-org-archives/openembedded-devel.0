Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.81])
 by mx.groups.io with SMTP id smtpd.web11.10187.1599060496727126412
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JM9uff3C;
 spf=pass (domain: windriver.com, ip: 40.107.92.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zc9bQFSzgLcpDXgvy7OJD7AhBYsCq0qIN4AIjm3ZC2D/zWsgBbaN25tl3NqR0jV87JFyR+DoWsABLwgcnAn4zdSmX6n/BAhwTTc+kcyUHupOZUyWNmaZovwEG92mcmP9Qje7pl7MGF/9ujtVP1NqqHWgJvEJSv0LviI5GLcKFYPANU5g3uTWd+WCMGMuwM7+bDJeWDLtYY5jgJUnbp/OCHnkHg+8W5jC0+XPpchM4/9vTDMoMd6S5NqJCdtRsTnix3hH3WULBQIZBW1DZfXIdsGf4udnDF7oARyKtmYUPkAF8BJewofIfq9H4GAyW0XNfF7U0uOn3qXNrqNAK8yPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H4Ihah2bWSUA64GWet63gJznrNacVl5DTePif+enW8=;
 b=oVq1ZfcfEUeQsqkn5oEDgSPqik6fyI1QYF68u0ChNlP8rijbEKqFmhSZ2gGsXQ+wRI5Xfx42ARqj/jAhLyjpbCfylbsJv1w6STjJLaByLmcYZt4V5zWia4jS45VkkLNVGG9VHOoU/usjNYcz05Pe3NY7rm4MwsVzAC5UG4w2s42pekSSt6z+ShFCbSdMkZVDMC3Wq1JsMexj/B0xC6mI7BvS35IQyDk+E/DSJzayb9kGpsYNMG0fBouq2lBNbliDRLkb3Sg0blDc2V8tWnDd+iXzLBxSPU83vhXVg6TbQR9S7izcXK9gV7l6xWd7yVOcUGeuQiq8gtBBLWg9lzVTMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H4Ihah2bWSUA64GWet63gJznrNacVl5DTePif+enW8=;
 b=JM9uff3C/N2PCPQ9FTCo9aMZmwrmUiHNOXEjt5Xkz5TIYy2Fjv+wrfo9uNlaf07wGYoAnkZF2+eBPHIvG3xwJOK8Wkih8kueS9htcV1Cq9QrxfyHRTMqhKWxy4u97hTl8jTP1JttF0lh3K+74pMjnOyov6Z0TY+n6n8OA+n6LwQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 2 Sep
 2020 15:28:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:28:15 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-flask-user: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200828135131.26321-1-leon.anavi@konsulko.com>
 <20200828135131.26321-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8995f16f-032e-a025-de0e-b0b499de4ae5@windriver.com>
Date: Wed, 2 Sep 2020 11:28:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200828135131.26321-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:28:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96afaf8f-798e-4590-b907-08d84f54cf78
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3352049A48B503BB52AC5C0E9F2F0@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uU+UTh4ZddFT/FJyv7eRkpnXuLZIgBpM9Dcpm5YKb3VNwpWc4y+Sxf7lz6USNeQZe6eQlpLZbASfsywnePVe4XLtC2uP74jaKM9N9Do/26G4ROL2CcjXcyzN/j5bNugeDILDwYbzl6Sq6v8MtCa1qruPr9aWATi+E6ipoQOQ0dL3laVd1FslRorU2o3kvF1NBSAL8mM7Ki3L1Zhvnwlu3P74poodWyO8D7fuaeoUObUwoDtYhIJST7gBcrU4BjDY9ymgIcQG82p2e7i7WO7nr341+Q8H/mgBpC6kh9w9lZIah69wlAZpFwlZkBlrhg/9uzZ9xuWnqFPgPAeGNCjyMxIUTMXjeUnZ8BVHQyrAIhnHNDQyYX6ZwE55ayNtbFFoQvroROB5qJ++rik/1YiiUOoBGr/ohiaH+jm6wt+bDTVQPK6bvPQ3hZa98kn06ICswAg97ATUySLHawuR4yAYiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(396003)(376002)(136003)(66556008)(53546011)(966005)(52116002)(31696002)(83380400001)(26005)(8936002)(2906002)(16576012)(36756003)(5660300002)(31686004)(33964004)(2616005)(66476007)(44832011)(66946007)(956004)(316002)(478600001)(6486002)(166002)(8676002)(86362001)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	9WoCxCqAxlazy4iU6GRfXsRmjxvAT+dxsm4S3/3fJW1F63hAIboO7zX/IILSrBH4hX/uWsLmLmHigH3GE+x+1Py4dV/HqNd4W+JEedJqLbllSdpAfR/b5oLBh09y0b6ZViLBHiLpMaLVvqXih8bUuA8c8G2iAUJGG1v5nW7RKr59BwI6OSK7mAXe2/8/9oWGdxIFYNTAPm/2eyvhHqrm4eaf3zO9vdVMBm5xnwX1MNhtC+gv/I+nq8xngcrpVjryTrhGs5LFwHBZzH062jFEiV5hABv7jkzl0dMXmk72KHRLZWIyhg3zVMQ4HY5ZLtiyUbGFgfB4P1uxoJfWCtBCaoZh3vlmtJZ+bY3CureM4DBqzCQKmTC+Pu/6TyXBNbl4M16WzM6jzDQX+XkioDHMj46OnTkWraCgBVKohnAMZqXCSvC6gcSYW/TnV7TnKmlsCsBuQxYFavg9w6GLIbGFmq9jNBGUExzD6eEM6FvUQ1TmsKe7yHE8CK1wKVISVAelRsgZyBvkcYgv7jDS+sIdTaJt9Ma08xP6kWi6fyxkpf3tgUcTKUZ34YzOjv5cXm1e123tgOO5l+4EfMCGFbAq59BjZIuZ7DSRDTrTtaAowoYbR2MdnsfN/2cPBhOQ/GfGl82IZ7roDQvlc6yI5A3JJA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96afaf8f-798e-4590-b907-08d84f54cf78
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:28:15.2855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MC5oTP1R8gVd7GxDAWolkJa2UWQuEOkvKisNeY84Lj7ytk5asDbJVg30kqPbjfCm1Jweyh6HSgVb2UDsAXcXzndL/yZWiMt2lSpcW3/MyME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------53C9B3EE438BF94E7D186261"
Content-Language: en-US

--------------53C9B3EE438BF94E7D186261
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/28/20 9:51 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-flask-user.inc              | 17 -----------------
>   .../python/python3-flask-user_0.6.19.bb       | 19 ++++++++++++++++++-
>   2 files changed, 18 insertions(+), 18 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-user.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-user.inc b/meta-python/recipes-devtools/python/python-flask-user.inc
> deleted file mode 100644
> index adef32cc8..000000000
> --- a/meta-python/recipes-devtools/python/python-flask-user.inc
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY = "Customizable user account management for Flask"
> -DESCRIPTION = "Customizable User Account Management for Flask; Register \
> -Confirm email, Login, Change username, Change password, Forgot Password \
> -and more."
> -HOMEPAGE = " https://github.com/lingthio/Flask-User"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
> -
> -SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
> -SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
> -
> -PYPI_PACKAGE = "Flask-User"
> -
> -RDEPENDS_${PN} = "${PYTHON_PN}-flask \
> -    ${PYTHON_PN}-flask-login \
> -    ${PYTHON_PN}-flask-mail \
> -    ${PYTHON_PN}-babel"
> diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
> index 251017f81..a59019af8 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
> @@ -1,2 +1,19 @@
> +SUMMARY = "Customizable user account management for Flask"
> +DESCRIPTION = "Customizable User Account Management for Flask; Register \
> +Confirm email, Login, Change username, Change password, Forgot Password \
> +and more."
> +HOMEPAGE = " https://github.com/lingthio/Flask-User"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
> +
> +SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
> +SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
> +
> +PYPI_PACKAGE = "Flask-User"
> +
>   inherit pypi setuptools3
> -require python-flask-user.inc
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-flask \
> +    ${PYTHON_PN}-flask-login \
> +    ${PYTHON_PN}-flask-mail \
> +    ${PYTHON_PN}-babel"
>
> 

--------------53C9B3EE438BF94E7D186261
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/28/20 9:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200828135131.26321-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200828135131.26321-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-flask-user.inc              | 17 -----------------
 .../python/python3-flask-user_0.6.19.bb       | 19 ++++++++++++++++++-
 2 files changed, 18 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-user.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-user.inc b/meta-python/recipes-devtools/python/python-flask-user.inc
deleted file mode 100644
index adef32cc8..000000000
--- a/meta-python/recipes-devtools/python/python-flask-user.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = &quot;Customizable user account management for Flask&quot;
-DESCRIPTION = &quot;Customizable User Account Management for Flask; Register \
-Confirm email, Login, Change username, Change password, Forgot Password \
-and more.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/lingthio/Flask-User">&quot; https://github.com/lingthio/Flask-User&quot;</a>
-LICENSE = &quot;BSD-2-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a">&quot;file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a&quot;</a>
-
-SRC_URI[md5sum] = &quot;f7965e66ca139c8436896da07e66c21f&quot;
-SRC_URI[sha256sum] = &quot;601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302&quot;
-
-PYPI_PACKAGE = &quot;Flask-User&quot;
-
-RDEPENDS_${PN} = &quot;${PYTHON_PN}-flask \
-    ${PYTHON_PN}-flask-login \
-    ${PYTHON_PN}-flask-mail \
-    ${PYTHON_PN}-babel&quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index 251017f81..a59019af8 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -1,2 +1,19 @@
+SUMMARY = &quot;Customizable user account management for Flask&quot;
+DESCRIPTION = &quot;Customizable User Account Management for Flask; Register \
+Confirm email, Login, Change username, Change password, Forgot Password \
+and more.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/lingthio/Flask-User">&quot; https://github.com/lingthio/Flask-User&quot;</a>
+LICENSE = &quot;BSD-2-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a">&quot;file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a&quot;</a>
+
+SRC_URI[md5sum] = &quot;f7965e66ca139c8436896da07e66c21f&quot;
+SRC_URI[sha256sum] = &quot;601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302&quot;
+
+PYPI_PACKAGE = &quot;Flask-User&quot;
+
 inherit pypi setuptools3
-require python-flask-user.inc
+
+RDEPENDS_${PN} = &quot;${PYTHON_PN}-flask \
+    ${PYTHON_PN}-flask-login \
+    ${PYTHON_PN}-flask-mail \
+    ${PYTHON_PN}-babel&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------53C9B3EE438BF94E7D186261--
