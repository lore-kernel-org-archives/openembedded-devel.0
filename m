Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.82])
 by mx.groups.io with SMTP id smtpd.web08.10281.1605211299762647724
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 12:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GljdVU5U;
 spf=pass (domain: windriver.com, ip: 40.107.223.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mw0Wg4xRKiwvAIm+/zt23q3AnxFJ0deyI3uBo2ZL9KFEmrTMx9sazqFb1QdFzvB8rKBGj0Arnr8LKveeVU8aThf6gEFvXjWNR6/BWT6t0+wLtrQMBy/H+8hM13NXIANVo1A8Ga0e8JGAYOBzA+dqc5d4dhiySVzadUaB37FOh2i+q4zyutAOCZ2+EwyPj0f0UYRuIzBBvdQpdhK9gfgbiixbwbK3w+Lq3oBsjIerVbLT9ltPsI8g32dADtBmsHul8BfxqbMNjHJP2bgSoljNAVqaY4DItZCiPr8zd4edQ+qOcAtAgxW0K3ajTIg8sUNO2rOrwdihTJudPeclJojxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HWJtNu+lO+VzmmuEObLpgziV9iXcQ/oevFcQlP90bk=;
 b=YSSILinxOnr6/S4D9FPK9vVi50sq2cM7jXq/KK5L1Bnx253ku+lbQtK28TZOj45+QOQm/H3dV7bIIBh57pI3MRCiq65o5FZ/tz3slnoKSq+g4BeVCE4a04y9p4l8yvYd5Dc7Uw84aIdf5WddoDd38DoFr92HRUcM60rshsyk5IbFwN5g3YjChCn8a3I3Qn/SR6A8SjNYaSWvN+JqksLqZtKhVUImN1sRCdc1NOZsKVg6PmBT8nm4qLqfCxJoCCvQ1tCxZeaf/5TcDhkIXNPE4QS5OllIiQNTbdpIMX9l+SQGttgMJuu3JPh/aZI0EkI8UzuBN6KYB8CnYENnW9R86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HWJtNu+lO+VzmmuEObLpgziV9iXcQ/oevFcQlP90bk=;
 b=GljdVU5UIebp/+ou3L4cniVSfFTPhmpWxBebQ/HqHu5DCmjfrVrwjBbnp4CAjAXwaL2mWRogEsU78K/4WohcixGo4db+C0z2pobrONrRjv/m0Nw45RNiV+2fQV38RbcEDZuAQuV0cohJ3kuvkDkvvq3VyzYu/gwM/mxEdZxrows=
Authentication-Results: gpanders.com; dkim=none (message not signed)
 header.d=none;gpanders.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3112.namprd11.prod.outlook.com (2603:10b6:a03:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 20:01:37 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 20:01:37 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] Add python3-cerberus
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Gregory Anders <greg@gpanders.com>
References: <20201109192143.3739442-1-raj.khem@gmail.com>
 <20201109192143.3739442-3-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bf0047ca-f4dd-4687-e048-39a191894193@windriver.com>
Date: Thu, 12 Nov 2020 15:01:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201109192143.3739442-3-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 20:01:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29899825-ba30-4982-b2e4-08d88745c31f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3112:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB31126AC957493E7F2C30A5549FE70@BYAPR11MB3112.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jLb8uzD7e5hk+3tJ+q2szUzFS2DFDTJInin+ePs5qYh3Um30xbiItjY6QlO57hcQu1H2N55S89/tYVylS0MUIhBKFmojPSuK8S58/G2uJw+rKX78ziDNwLkRYbNbDF3ind3b1DldlGiGUnG/ofOoVKpnzRUaNvRi3m/jsrAPQZnP8HZP0FEkRlB26lLC+ftC/pTG6uwYCHtlCL5xkEyjHREsX3B7S0b3Eyu9wEh2P8qNfp17geIqWXPkBHcucAy8kcuTVAr/Vs0sfDF9nY+AvSikf7X1gy7wcQIEmFkpZ7RZyDWl0Y9eKAhGcUcEf516IrrH0XRtlso6tU3IAeW0aCSggzGochhvjyKRT7gXFRgkReB5pzRiYs7njwZXJ3PgwNUMI2coPF20FNjisBkGF6kX7hKUa2ZfiOk1Fk2K88eoEKjmK6ykYPD3vFIhT8Y9qe3e2JjGhkBJ3NEX89UMpA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39850400004)(966005)(2906002)(316002)(2616005)(186003)(31686004)(26005)(53546011)(166002)(16576012)(16526019)(956004)(36756003)(52116002)(66556008)(33964004)(86362001)(478600001)(31696002)(66946007)(8676002)(4326008)(8936002)(6486002)(83380400001)(5660300002)(44832011)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	A0qVI76aY+6Y63xLNOuGY1kye01pX8l285II4jkHnLxz/Ut3y8+BwR69AiH6a0TySyRDea4mdwLXMyxeQfM0U48ktVEydcyZ7Q5rnkNloqwyo3Kk0jtg07lTXzN9fiQvFKbp7jkT8Lzm4Xb3VwGAVUT+wh7JQidojxabNzH2BDml/Y9OWjc/49V5meTk/P06P/Ku4jfWhPJJX6xtrKsDaa3NdMkW593Yg6hhBcz/iUQ4hoL4ZqC6E1UDnUO/mkr7qMrF8QmFncOXfXbPmqfzSW2cw7MQiscFv4/043lHs08CNOMJ/ivDGQEezmxR3WhsIol972iPJl9kdJ3I1Nj02JmLDwLKtbuwG5TepT81YdzraCB7DBlBU7AwDP7viDJOoKGofDjTxFEotvRL9ZK4totUpTQnxmGeUsWHto/AVKqKLxeIUCHYqzJg+2/jxw9QuJgVyp7MwLAZ6ngvs9cy46N8IKkPKF2f4MF/D/9ViYbJyOT5M7qQ+hhwbjPMyMtkriNxVbgKf+zz1heSPZaAhd27WI9yJx5l+lb9Lq/Tiig1uu/g8IvnOZHsTMyvb5NVC2euAYgTTOYRdOkyfSf6znMAYd1ie7yNUyb43O3S6uCex71d/sTDjDOK9gjUUKBQlTtE76p6Na2plyWpp+wmBw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29899825-ba30-4982-b2e4-08d88745c31f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 20:01:37.0921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/5CaWE41hQmzN4FmEJqPTdpLmhAIs14hk4d1u9vlwYxqzRCqBu6ajDLNNVCkMM50BWZxmenZ3d5DGk44/IN+n/JTyX4BCWItvc+Va1HsIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3112
Content-Type: multipart/alternative;
 boundary="------------6AC6EEF4C12483FD3EF4A4CF"
Content-Language: en-US

--------------6AC6EEF4C12483FD3EF4A4CF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/9/20 2:21 PM, Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Gregory Anders <greg@gpanders.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb         |  1 +
>   .../recipes-devtools/python/python3-cerberus_1.3.2.bb | 11 +++++++++++
>   2 files changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 2476e34deb..b8265fcc56 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -427,6 +427,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-jsonref \
>       python3-transitions \
>       python3-dill \
> +    python3-cerberus \
>   "
>
>   RDEPENDS_packagegroup-meta-python3-extended = "\
> diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb
> new file mode 100644
> index 0000000000..61a76f5f63
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb
> @@ -0,0 +1,11 @@
> +# The PyPI package uses a capital letter so we have to specify this explicitly
> +PYPI_PACKAGE = "Cerberus"
> +
> +inherit pypi setuptools3
> +
> +SUMMARY = "Lightweight, extensible schema and data validation tool for Python dictionaries."
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb"
> +
> +SRC_URI[md5sum] = "6e648b38b468617a06745d1e8a96c848"
> +SRC_URI[sha256sum] = "302e6694f206dd85cb63f13fd5025b31ab6d38c99c50c6d769f8fa0b0f299589"
> --
> 2.29.2
>
>
> 
>

--------------6AC6EEF4C12483FD3EF4A4CF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/9/20 2:21 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201109192143.3739442-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Gregory Anders <a class="moz-txt-link-rfc2396E" href="mailto:greg@gpanders.com">&lt;greg@gpanders.com&gt;</a>

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201109192143.3739442-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../packagegroups/packagegroup-meta-python.bb         |  1 +
 .../recipes-devtools/python/python3-cerberus_1.3.2.bb | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 2476e34deb..b8265fcc56 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -427,6 +427,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-jsonref \
     python3-transitions \
     python3-dill \
+    python3-cerberus \
 &quot;

 RDEPENDS_packagegroup-meta-python3-extended = &quot;\
diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb
new file mode 100644
index 0000000000..61a76f5f63
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb
@@ -0,0 +1,11 @@
+# The PyPI package uses a capital letter so we have to specify this explicitly
+PYPI_PACKAGE = &quot;Cerberus&quot;
+
+inherit pypi setuptools3
+
+SUMMARY = &quot;Lightweight, extensible schema and data validation tool for Python dictionaries.&quot;
+LICENSE = &quot;ISC&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb">&quot;file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb&quot;</a>
+
+SRC_URI[md5sum] = &quot;6e648b38b468617a06745d1e8a96c848&quot;
+SRC_URI[sha256sum] = &quot;302e6694f206dd85cb63f13fd5025b31ab6d38c99c50c6d769f8fa0b0f299589&quot;
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------6AC6EEF4C12483FD3EF4A4CF--
