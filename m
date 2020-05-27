Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.53])
 by mx.groups.io with SMTP id smtpd.web11.8707.1590594288017167967
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 08:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pVqh6W9D;
 spf=pass (domain: windriver.com, ip: 40.107.93.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCkiQqju5LXvH7b2iMTMJextjfaFH0gZEUyCeOqaXmQxhETgepo1AfvVIn8BJyC3J0D1FauPx1pC8breDsOXv8d8Q4uX3EwZihe/D4OciyJmY7uXViN6ShFMNQ3G23j0OgVpGqSED+oLo9T0BzDeAKrzUxT7/ZRPwOe+XjSt49QGLY4PVutO8JNvxLtIjm0D175X2u/V5z2KphSnobDpmAVS3jkyIQeJwiZyA77wwfGP7L/AhMQbpXUE3RJTIO5Lx8Rx/5rBNJA6PeGJdA7yrAmPOt9VS2nhAQa7YP+9r2x/PYYJ0BEX7e5gM6aILRk+cCJ6PzdwmWr7L7Q4j4ovmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xriJrzegHb74IKKk9IlgKtID5ISyOJKmKmLrvzlch4=;
 b=k1UJv0YWoDiT52LC/qVa6RG/JsU78XiCt29/pwyM3M2AgUhPzsofogb0Q0hQ7cce+V8ad+wgZfS1T4vAdtp4n7t2wxPVvGRxf+wVqXTYpr9FNbOTyzuFyb9Jm23q1ip0aO3LCPeNxzuvnSjKvDVXSogDGrUFeqygu9ZRiMBbWfFBFCb2Nmaze5zo2Vr79+QS0p3Aui5qqU0TCqSkOfdxXP7AFz0eusKN/Vah8NQAWrj+jw/SBmHK/tRwRBh7Ogn3vEV+Pvj7i/wvdbpCSFTb2b+SYWki7ZJ3h8tHBksgS+SDzTvHiMfbZknNEvxReyp3zTbvoqV4Zlhs++0BbP2mcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xriJrzegHb74IKKk9IlgKtID5ISyOJKmKmLrvzlch4=;
 b=pVqh6W9DmpDZTGswbFOzDF/pGOSSz1uq8tuevnVd2n26+lQcfBqS62YybJb8xTJ40w56SIqyp0ZlOh5d3fLwoNUbU7OwjElTEc+BgEakAc3ZkeeMFMmhoqVYkPm0JrceGk7pjGuKs+7nF6mU9aRbPHnpkSlobB1oMzls94Vfsmw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1523.namprd11.prod.outlook.com (2603:10b6:405:10::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Wed, 27 May
 2020 15:44:45 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 15:44:45 +0000
Subject: Re: [oe] [meta-oe][PATCH 3/4] python3-pytest-metadata: Update 1.8.0 -> 1.9.0
To: Domarys Correa <domarys.correa@ossystems.com.br>,
 openembedded-devel@lists.openembedded.org
References: <20200526192011.17024-1-domarys.correa@ossystems.com.br>
 <20200526192011.17024-3-domarys.correa@ossystems.com.br>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <890a4c9b-fd58-003b-8fc3-6dda2f57c5bc@windriver.com>
Date: Wed, 27 May 2020 11:44:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200526192011.17024-3-domarys.correa@ossystems.com.br>
X-ClientProxiedBy: YT1PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::15)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Wed, 27 May 2020 15:44:44 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5ae7304-dc3c-4ada-0137-08d80254e114
X-MS-TrafficTypeDiagnostic: BN6PR11MB1523:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB152370534FFBC56598DD20099FB10@BN6PR11MB1523.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	21SgdSE731a/P9wLc3wNKqJFmhMtMNwfBNC70FnBypvHopiq0XKdNaNr5m+Q6IsVYpt1TGi9clcllxMEHQLGMtnPfH3F+ACy1ZWm4iXd2HHR54q7s9OiExeBC0yGloiMlSVqbEtdOVy+Xz4OWLHKQIXQ6wGbeLzHwgydxIkIWnktf4lvGbBEfU9RHgOdQqlVDf9WBm2rdnYWC2kre8Au85fpQ4IVObOvNe6wSvtZe3cCPFupNS/Fh9mwMbmwofU+nvQo4v4ifYswAzfEq9oTnyZMrf/RrTzEre8L7Ps0F/iBtRmrwUCiN+9TCEsaEWwzcmMOP9Qmk+CE2ziSLyMo1VtlAEfqy/ZTftvJ9CSZAg8FbJOOx2vg7q5+w++fMEJDxpcCET9QzW+sklhDF78ZcDQ1fs5E7kmGFiRq9zZsQmKvEpnCskRwdizo6NiZf3DVYVKvY9w1t7ftYW4/13qGhA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(39850400004)(366004)(346002)(136003)(36756003)(166002)(44832011)(956004)(16526019)(83380400001)(6486002)(31696002)(53546011)(15650500001)(31686004)(2616005)(8936002)(33964004)(86362001)(186003)(2906002)(26005)(8676002)(966005)(66556008)(66946007)(16576012)(66476007)(316002)(478600001)(5660300002)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ZJzfc+n24ifZmn8NHNvAnMp5eOxEPHCwWhIFoRdsaUhwOUE7N7s/17GB0fympMxS6DJG+EiR+dEpE8enK3YI6lMJUjjSXTSiB6/R+tWh3KjSDR61ZH8IGsoNSmQkpPs4YJ40o+CH2yXSUiCyOKoh+6wjvbohE+US/PhXk4T1plzdMV0vhzxwh+q0lpeRwlt6D5uV8VYNXvtUOGlohOaC7/fVlfSPeUDCfXfUZaDt3Lkb0Fxnj++EfioE1D8rxRBY1Mj5YthEPCEdAPfBOoAFmT36yvNkvW1hJ38neOfeJ7hbdb/Ltj2vEIeXK3JtIKtKS95ZsMmm1/jcF94NwzW6shzoCqADQGVCshBoR+cPkePGduphRKNfW/EvkF6mqykK7+nDYneNegzOhyaWEt1FmtLf9awGkLM+grTrx+exF4z+u8dOBa6Y1JYtrpwohrJFStFXU2PEXIhKvwYJ94r/8pUQORQ6ztfjogBAzu+N+hiY+V8OUUT/SEmEugDcpioP
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ae7304-dc3c-4ada-0137-08d80254e114
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 15:44:45.0516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQDCd7irOqegq3N7U8n5yZrFWDGgD8xw1qZCp7sNsW2Z6FJZNbEeS2KUbDbHCNYVSAcNPiekQ2jfvZ6eiszx2oIRgsc7VfOKaikOgk56j2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1523
Content-Type: multipart/alternative;
 boundary="------------D0415335029B7B38F6377272"
Content-Language: en-US

--------------D0415335029B7B38F6377272
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/26/20 3:20 PM, Domarys Correa wrote:
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...a_1.8.0.bb => python3-pytest-metadata_1.9.0.bb} | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.8.0.bb => python3-pytest-metadata_1.9.0.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb
> rename to meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
> index 807b0cedb..4a77af3cf 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
> @@ -1,15 +1,17 @@
>   DESCRIPTION = "pytest-metadata is a plugin that allowed for accessing pytest metadata"
> -HOMEPAGE = "https://github.com/pytest-dev/pytest-metadata"
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +
>   LICENSE = "MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
>   
> +SRC_URI[sha256sum] = "168d203abba8cabb65cf1b5fa675b0ba60dccbf1825d147960876a7e6f7c219c"
> +
>   PYPI_PACKAGE = "pytest-metadata"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "95674c2390b58e0138cabac5101d1908"
> -SRC_URI[sha256sum] = "2071a59285de40d7541fde1eb9f1ddea1c9db165882df82781367471238b66ba"
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +RDEPENDS_${PN} = " \
> +    ${PYTHON_PN}-pytest \
> +"
>   
> -RDEPENDS_${PN} = "${PYTHON_PN}-pytest"
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------D0415335029B7B38F6377272
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/26/20 3:20 PM, Domarys Correa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200526192011.17024-3-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Domarys Correa <a class="moz-txt-link-rfc2396E" href="mailto:domarys.correa@ossystems.com.br">&lt;domarys.correa@ossystems.com.br&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200526192011.17024-3-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">
---
 ...a_1.8.0.bb =&gt; python3-pytest-metadata_1.9.0.bb} | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------
 1 file changed, 8 insertions(&#43;), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.8.0.bb =&gt; python3-pytest-metadata_1.9.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
index 807b0cedb..4a77af3cf 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
@@ -1,15 &#43;1,17 @@
 DESCRIPTION = &quot;pytest-metadata is a plugin that allowed for accessing pytest metadata&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pytest-dev/pytest-metadata">&quot;https://github.com/pytest-dev/pytest-metadata&quot;</a>
&#43;DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
&#43;
 LICENSE = &quot;MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132">&quot;file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132&quot;</a>
 
&#43;SRC_URI[sha256sum] = &quot;168d203abba8cabb65cf1b5fa675b0ba60dccbf1825d147960876a7e6f7c219c&quot;
&#43;
 PYPI_PACKAGE = &quot;pytest-metadata&quot;
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;95674c2390b58e0138cabac5101d1908&quot;
-SRC_URI[sha256sum] = &quot;2071a59285de40d7541fde1eb9f1ddea1c9db165882df82781367471238b66ba&quot;
-
-DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
&#43;RDEPENDS_${PN} = &quot; \
&#43;    ${PYTHON_PN}-pytest \
&#43;&quot;
 
-RDEPENDS_${PN} = &quot;${PYTHON_PN}-pytest&quot;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D0415335029B7B38F6377272--
