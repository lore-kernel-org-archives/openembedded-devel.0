Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.73])
 by mx.groups.io with SMTP id smtpd.web11.94122.1597860425527579991
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 11:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=j/BAMB4G;
 spf=pass (domain: windriver.com, ip: 40.107.92.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWAhPjSsUy7Kg/CH5YiMyb6jAaRlQWTlCuVYcaMGEQPgMljmSVPQIZEfVoVll2R6FB+HQ0SYb3+ShyQ99mUGkUTb8DT7jRr/7yM3gNmWv7/Wcj4+2GrfyETbX9PRRtLtg3VWoxOJaUj0KiVz/T2ssbWVBZDEIFLKO05e7QwF8yvc39V9xtE7/RttVWHzXA5i0w3sVeKk+EhbH2BX7SfYlNu1yMwvBbAp0b1rXI0XHiXqHTfxulzQoXCHumEQD6yYc9ykKGyWCu2mOXiWhOeyYJZYJQiIObo0WCPMd3ckXu1Yz1qbNr31zSSwIn62qKpZN+jNbG2ptxZA8g0/1QbNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcjRM3cmBT9a1HtvPop43alx5R7AiZpnT6nnYpPQTBY=;
 b=jkDMXOU9+3Yfegb7UtGnoyc/yt/lUZUWoaRn2/IMvCQyVfVbbRN+QbfSRrpfyxA4XGSZepM/29DtbBEow0J81mY6bSaQA8CiryfQQkZQHJ8iQNFy/By/jtUqe/aJRJ+U8X9OlJ24JHHprdwOCmoTJNxatV8+eWlKL4PofuhkXzV7Nb3c660jNwNCW7qkO38u3+N6Zz05O/F1iLcOn+LgXRthmPnBQO7j+V8wTvle36TnCNfcM57qpR8sNr5ZLKEVdjogxw8+QMltobkqJqTNR14UY30lOhCOJZevDiru0l5jqE5l0KOVMv4m5u8Iy2bfrYYoU3CtjrbgY6n7p8rNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcjRM3cmBT9a1HtvPop43alx5R7AiZpnT6nnYpPQTBY=;
 b=j/BAMB4GWMoPMV7XKzHSW1G7xSFA60UBA4hI4ZTg1CbTXA9nhnsBXZZ4m4SIJGWQJ7ajcNOtlpB06ZQByedXMWcqNqYVNI1icLjk2dPknoH1+dsLCcIPC/heAOOmgR21OJU5rOqM+vERRdtkhRuEL6qPCO153cgpURsM/V+MJ3A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by DM5PR11MB0073.namprd11.prod.outlook.com (2603:10b6:4:67::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.28; Wed, 19 Aug
 2020 18:07:04 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f%4]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 18:07:04 +0000
Subject: Re: [oe] [meta-python][PATCH 5/6] python3-djangorestframework: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200818153444.15728-1-leon.anavi@konsulko.com>
 <20200818153444.15728-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c8b3d034-ec77-29c0-49e3-be1a2ec3fa9f@windriver.com>
Date: Wed, 19 Aug 2020 14:07:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200818153444.15728-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29)
 To DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Wed, 19 Aug 2020 18:07:03 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab001de6-972b-499a-0fe1-08d8446aad5e
X-MS-TrafficTypeDiagnostic: DM5PR11MB0073:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB0073418E8CA9B6A17E021D0D9F5D0@DM5PR11MB0073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:205;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ucjyylbl+JoseySc3cLRztRkRkoW03ef6u6I6C5kYy6PO+IYrmkxJAa7JekoNNr2H2z5eIlXAyPcrwdNiJwf9Niz6JZ1CZMWCmZokjsbmJo8ANr1mxdwCBSaGixI/+Ja2gorvuqZexrVy+aVWZj8yTfHlCMg5Fkas+dUO93DlnA8dfSCMYmUM5MNupZbtv86EKqKVAhzXjnAFzpTBimkvwZyuXYb4U+Tp7UkE69huHVguEZOQvg7A4hh/L+f6cFhPmwVtIGMrvaLoZPcoIFIio9JqlozsAQAQ2nwaILwZJ4PIBvg6uldizmlwCcEC1TSoI3YSuMNlmolVnzw97li13fP+TUOdh4QVY/pgdqe1a2CUD9s64jx6M5F5W7fswFmUXYOExfm4LLJIGKLtjE5RBq3fN3j7j0wwMk1wlx7niMGx8mY3szpa0tRLhgM7qe/mOD50uuPjNOzZ9sq4wD+ndFmQOsw/Wk6A0eCwh5UwmFfaJOO3/nV1h5B9gryx/Fn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(366004)(39850400004)(396003)(44832011)(36756003)(966005)(33964004)(6486002)(16576012)(186003)(5660300002)(110011004)(31696002)(478600001)(53546011)(2616005)(83380400001)(956004)(66476007)(26005)(66946007)(86362001)(8676002)(8936002)(316002)(66556008)(166002)(2906002)(31686004)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bqoI0ichQ7SkjzxTNL55RwBLPyZgU69P8cKbFnUnKYnRM0MDXGH0EE2wa9EvSWlXFssX6lHy4pjgO8dp5o+jBCKA/3Kapp1rCeqwKtemnUsACDDWwlt5Ue+x8FLtkD9FJus5alu1m8obVLyt4mlQB5+oNFGvqKqLJpfDrOLw4O/W6QFLnH3eivTBkDFxDjgvRliX1nJtPWHjRphWhkDq3QXNuH9GSxSa+nUisHGUCqkPwwBEhpxAWlbMRb85lLemI+yI52uEmc0pFq886e1YLMKNXXSY3wx1L4GzhFmyuNXOKcA+47E6xZVkZLUT5Oc5cF2ybaBA2jvV/e40wzicvXHy26K48/9f5ED5evDuqdoZacf94EM3JaUR0Rb0PJWJNmsUXDc/rgqvkG/mwItshTkF9ZbbU2wUr/KgxASjdJR0Qa2IoQ4SHIRGTyYrnkiiK4+9nBTK7ySKaO/ViQAU6mHm0b+TwEoYHcgepqIwwxgODFrIC+k2cjBxfA900j5Sedfm5xnx3x6CDthp9hNFx3yX+3vU+8NV+I7VB+tugFo+luYf52C8OO3Ot7h8ib9O+jW8Z+JQLPi7CRLcaiuv+CX8E0XDCcx6zSo5bGaR/45JgMWbPxwkBAWXlyfdaXcTgxDsNzfewHowNZ44S4g3Kw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab001de6-972b-499a-0fe1-08d8446aad5e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 18:07:04.0868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bB0ocukEvT7jMv0EX3+1v/2EMnD2z7L3pU+3pFGLbbmysYtvceiRkikxzjUbz/i7LWAAhn+kjQKOBtbPx4kpMym3HqY2mc1kN39VdA+4PWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0073
Content-Type: multipart/alternative;
 boundary="------------7A676BE8BFF13B01C05F0695"
Content-Language: en-US

--------------7A676BE8BFF13B01C05F0695
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/18/20 11:34 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-djangorestframework.inc      | 16 ----------------
>   .../python3-djangorestframework_3.9.0.bb       | 18 ++++++++++++++++--
>   2 files changed, 16 insertions(+), 18 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-djangorestframework.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-djangorestframework.inc b/meta-python/recipes-devtools/python/python-djangorestframework.inc
> deleted file mode 100644
> index 8551a8341..000000000
> --- a/meta-python/recipes-devtools/python/python-djangorestframework.inc
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY =  "djangorestframework"
> -DESCRIPTION = "pip3 install djangorestframework"
> -HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
> -
> -SRC_URI[md5sum] = "0d481bf8dbb87bb927b46798edc1a9bd"
> -SRC_URI[sha256sum] = "607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136"
> -PYPI_PACKAGE = "djangorestframework"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-django \
> -"
> \ No newline at end of file
> diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
> index 9ed6d1726..438a5e19a 100644
> --- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
> @@ -1,2 +1,16 @@
> -require python-djangorestframework.inc
> -inherit setuptools3
> \ No newline at end of file
> +SUMMARY =  "djangorestframework"
> +DESCRIPTION = "pip3 install djangorestframework"
> +HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
> +
> +SRC_URI[md5sum] = "0d481bf8dbb87bb927b46798edc1a9bd"
> +SRC_URI[sha256sum] = "607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136"
> +PYPI_PACKAGE = "djangorestframework"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-django \
> +"
>
> 

--------------7A676BE8BFF13B01C05F0695
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/18/20 11:34 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200818153444.15728-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200818153444.15728-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-djangorestframework.inc      | 16 ----------------
 .../python3-djangorestframework_3.9.0.bb       | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-djangorestframework.inc

diff --git a/meta-python/recipes-devtools/python/python-djangorestframework.inc b/meta-python/recipes-devtools/python/python-djangorestframework.inc
deleted file mode 100644
index 8551a8341..000000000
--- a/meta-python/recipes-devtools/python/python-djangorestframework.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY =  &quot;djangorestframework&quot;
-DESCRIPTION = &quot;pip3 install djangorestframework&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/djangorestframework">&quot;https://pypi.python.org/pypi/djangorestframework&quot;</a>
-
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1">&quot;file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1&quot;</a>
-
-SRC_URI[md5sum] = &quot;0d481bf8dbb87bb927b46798edc1a9bd&quot;
-SRC_URI[sha256sum] = &quot;607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136&quot;
-PYPI_PACKAGE = &quot;djangorestframework&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} += &quot;\
-    ${PYTHON_PN}-django \
-&quot;
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
index 9ed6d1726..438a5e19a 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
@@ -1,2 +1,16 @@
-require python-djangorestframework.inc
-inherit setuptools3
\ No newline at end of file
+SUMMARY =  &quot;djangorestframework&quot;
+DESCRIPTION = &quot;pip3 install djangorestframework&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/djangorestframework">&quot;https://pypi.python.org/pypi/djangorestframework&quot;</a>
+
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1">&quot;file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1&quot;</a>
+
+SRC_URI[md5sum] = &quot;0d481bf8dbb87bb927b46798edc1a9bd&quot;
+SRC_URI[sha256sum] = &quot;607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136&quot;
+PYPI_PACKAGE = &quot;djangorestframework&quot;
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += &quot;\
+    ${PYTHON_PN}-django \
+&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7A676BE8BFF13B01C05F0695--
