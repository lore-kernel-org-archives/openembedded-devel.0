Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.50])
 by mx.groups.io with SMTP id smtpd.web12.9846.1593090019575599374
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ajn7Pq7O;
 spf=pass (domain: windriver.com, ip: 40.107.223.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoFQMW6ljD+hZXdx61czRotd2p4bHiASsqX6lJP9HcNEzHK63JZPsnL5C9CThFt9MRltdwLRwbAinqcn3ZBZTu7OHHuPM0+A9Lorsf7B8cVVf0tcuo4Huwoo+jkub9I8QjYe76LZhpYMIQ7XyGzlJct7nt4IwC1TNjwfJmhDEb93QP+jGbQvbotojRZT8RuZ/gFqTWzygzy6Q7JToLwY+ljYehqpm8pgSGu2r3HzpGOFOuFHlj6rWuooT5TWPxQ1nTTt4mK/FevvZwtqvwhNWpU6XUVV7RQMm6lNvjmK9xBAjl7R55WDeJpM0WqC/bjZCKaJoZz6cUzDRQ19QQ0hnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3V1EboVbGaJ+LJv4aytNWtynCAvlyNcP8FphLgVjqM=;
 b=h4jb2atVxigDblECEMuQVLxJSrndqcvThL+lPMoPxteDSDujynLZJvcj2AdhBFD/2q4i4umVcGQnRhsl9akXiqoHaG0d69XEQQxONxDJSGMryGeCnh/zEPLypxtGC7D3aLf3Kq5DTSkSsb2l0NMyraHefJ984QvR6KpSxowNq0f4bCGFHVgGhXlcKqfk7CHvV1h9AZk32J9DlxqfIhpWlf4R3uMJfcEupTlxvM3mCaEyD+dUi+hNgR6H6LoOyI18HqVc8XJh/RqxxRCEs0jMIqje4mCenTfNUr2Zz1dzbZ33W0ELOU+GGFSsMTC4whyhkjH+Owpfg+uNVshIN7aeUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3V1EboVbGaJ+LJv4aytNWtynCAvlyNcP8FphLgVjqM=;
 b=Ajn7Pq7OJzwJM6kSfWZTST6wTb/0LL0dgefxCoFLjXIdhaQ0yo6YgTA+cAlCmtt+uF4WtXkwdHDKBu6nw2nlTqN9DMHKWIe/tJ2YjxpyMNt9vCaBH0SMF+y7EBx4Q9MoDsTUgHmABg6a1vX9k/kDQ6Iztyga5qAeQMbJ7aCwRAY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 13:00:18 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:00:18 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-networkx: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624151628.547-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <02cbf488-76fc-3e43-b665-2330d49483e3@windriver.com>
Date: Thu, 25 Jun 2020 09:00:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624151628.547-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::43) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 13:00:17 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 772446aa-7875-4a5b-a4c9-08d81907b5ed
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39546FC4584632796F700FC19F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IGJVUR4KZR50wel7b1ARzqvW/Tp0ySQvgpm6QhynSl6oCqPBi6lEzq9TPaVajVbdebzmkEYy2grO/kR2Igycq7g1ToeQKUgoY5CbyayZE7u35H69VzN1/4IEM2iRMLBsBcEVuSE1eiZwrPo0p+yipFHb05fB07iyt6NV9kM1IKNO99CfdZ+nFNlhMPkXINB8i3p3BlTJDfzw86bjMeV2OgXXAGhbCr0CUufWJ51cqkavX25ZdrD6wh6KLL2hzFTQ9LyqyKNuALjGUGBM+NHnHUK0NoAjhElZap7+cEVnl7KuFXTE8c958q5WRnY6AXtCufhRKVngpD8os9TmvAowNNP3oEN1cxF8v/UJB/eGowM82F82tx8RRGs4COppDpwjZ4Kfw+GT8eqDVtKs3fESyUJIDx9Rp/pMGwiGk8q75GG1prD/BUqy6P1HHdhrc8l2JLDXD0YDBY29eutk8vsSIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(83080400001)(66946007)(66476007)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4mtLt2nio85UO8XGiVazYmFa/uaaO/ZYU5jczX0xa+MRUJ65p6yj6TWlQ57mQQqcviZMj26LwCXSYTlvAxOlZzr9Ip4VuDf3XvNjiPDAvMYosfCbV0MeUkjE8QteHkijsQ4AZFK65TOMrN3JySMBg9pD/kU/uWbxxu7fe/JNWu9sOuk1KqRZgvDQNeS/HvkgeI4ptFawu99r4sZ6U8CzesuIK19bS4Irjhf+vf4bdhGZxemfE8FIplssyAxvPSkBOzlmzE5m3wS5+rt59DYMmvO68PD9JjlfE9K2OcXn8h+yN9lkTW0ulS3vkOcp6XA/CXU1WNc8IXy2+jr74jBlA60oLeXUvQH1iJDds1OKF6mwSiEW59PBixKGvwgOTu4gibi4Alg5seSZ2rp77Qzo1G5q+yhLG9mniF4q9IjCd6pKvT2+EbRNYwnQK45D8d7Q5HrZSOr8xTHsZK95j7W2uwog1NGhL/nzQQpmmBeaMUuIzrx/eSetA4IX2CWPLD+E
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772446aa-7875-4a5b-a4c9-08d81907b5ed
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:00:18.3365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uk7wqEDW3PXS9dr4lMYKL0lJDqLWiBO8hEAJqfJF/e39YAFjTyhU3kWLwga/ej+cZV0Y5uNmMZj4nJu+fZMcazbvt78NSfiB3uLC23A+ieA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------9C01C58D78DB90722523CEEF"
Content-Language: en-US

--------------9C01C58D78DB90722523CEEF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/20 11:16 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file. Add
> a HOMEPAGE.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-networkx.inc       |  8 --------
>   .../recipes-devtools/python/python3-networkx_2.4.bb   | 11 ++++++++---
>   2 files changed, 8 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-networkx.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-networkx.inc b/meta-python/recipes-devtools/python/python-networkx.inc
> deleted file mode 100644
> index 4bca636dc..000000000
> --- a/meta-python/recipes-devtools/python/python-networkx.inc
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -DESCRIPTION = "Python package for creating and manipulating graphs and networks"
> -LICENSE = "BSD-3-Clause"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += "\
> -                   ${PYTHON_PN}-decorator \
> -                   "
> diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb b/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
> index efa82e21c..5708e35b5 100644
> --- a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
> @@ -1,8 +1,13 @@
> -require python-networkx.inc
> -
> +DESCRIPTION = "Python package for creating and manipulating graphs and networks"
> +HOMEPAGE = "http://networkx.github.io/"
> +LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd"
>   
>   SRC_URI[md5sum] = "63e3fdc9d3a46bcabc776acc5ea5fe48"
>   SRC_URI[sha256sum] = "f8f4ff0b6f96e4f9b16af6b84622597b5334bf9cae8cf9b2e42e7985d5c95c64"
>   
> -inherit setuptools3
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "\
> +                   ${PYTHON_PN}-decorator \
> +                   "
>
> 

--------------9C01C58D78DB90722523CEEF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 11:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624151628.547-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file. Add
a HOMEPAGE.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200624151628.547-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-networkx.inc       |  8 --------
 .../recipes-devtools/python/python3-networkx_2.4.bb   | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---
 2 files changed, 8 insertions(&#43;), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-networkx.inc

diff --git a/meta-python/recipes-devtools/python/python-networkx.inc b/meta-python/recipes-devtools/python/python-networkx.inc
deleted file mode 100644
index 4bca636dc..000000000
--- a/meta-python/recipes-devtools/python/python-networkx.inc
&#43;&#43;&#43; /dev/null
@@ -1,8 &#43;0,0 @@
-DESCRIPTION = &quot;Python package for creating and manipulating graphs and networks&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} &#43;= &quot;\
-                   ${PYTHON_PN}-decorator \
-                   <a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-networkx_2.4.bbb/meta-python/recipes-devtools/python/python3-networkx_2.4.bbindexefa82e21c..5708e35b5100644---a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-networkx_2.4.bb@@-1,8&#43;1,13@@-requirepython-networkx.inc-&#43;DESCRIPTION=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb b/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
index efa82e21c..5708e35b5 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
@@ -1,8 &#43;1,13 @@
-require python-networkx.inc
-
&#43;DESCRIPTION = &quot;</a>Python package for creating and manipulating graphs and networks&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://networkx.github.io/">&quot;http://networkx.github.io/&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd">&quot;file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd&quot;</a>
 
 SRC_URI[md5sum] = &quot;63e3fdc9d3a46bcabc776acc5ea5fe48&quot;
 SRC_URI[sha256sum] = &quot;f8f4ff0b6f96e4f9b16af6b84622597b5334bf9cae8cf9b2e42e7985d5c95c64&quot;
 
-inherit setuptools3
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;                   ${PYTHON_PN}-decorator \
&#43;                   &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9C01C58D78DB90722523CEEF--
