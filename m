Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.45])
 by mx.groups.io with SMTP id smtpd.web12.8224.1590592391377741700
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 08:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HWSP10HQ;
 spf=pass (domain: windriver.com, ip: 40.107.237.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h62IzdaFf0ZWp8XDFBQuNGoA8tKvC2OWlhDN8xrl5bwmouGj/X2qrEENxTIya8xkGHXXuWpHttfb+EbWrh5BqZ3QyEJa/ccStZeCOLumVz4m3iTRLJ1RDh+xImkfZ3dGWA5SVZv6ZIFCbulKbeUTn7IDQE86MSSHXssjOM4mkC2fXzAjkeJDokqgnucKnqqX8B2fmR0QOUZVXJfm1RzNM3yybNnx7RnG1KYIXCvUwFnlnSsgb1ezp20gXeBJDMcYB+a8YdlZgS8EDzd17SfPuCJd0JC/6h9+v5FpdmnXnwR1c9uXQCnA9NnHky1YJlMSDq1ZHXi7tSB08/B/aw8VHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvQgI4Cc5ltrzZYwTC1ZSPICoCFdcuuTro76eRsN/ms=;
 b=lfUu/lCK+QMEbnYMpw6nVS9KgDuj9F+UX/Tx7NJ3T5m4s57q0aiofN+euRt/L9vHnxQVNG17bNEx07JoSgmwGswamPqZzMYaDd4DwjpNB6xwei2oEBOlJzrc6ZnIuCMDNmxc9dDY+w0yo5Y4DwPQNBtPjKM+Qdku8ypPk6ROSucF8FHQJF0Y46Biu0YeKU3RKwQI/pqPt5xbLFtXHrT/ztdOjCIIutzK0vj6xIXf487Q+jvH6dA+xUg+siWYPZ6qybUQ5fwEDqLcOUxF4ImO47OsqEQ5S1xtofdEZ970hU/hTSTmeK1b1kzeFQ7iFt9u+GNc3B6MGV8eIjitK4cjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvQgI4Cc5ltrzZYwTC1ZSPICoCFdcuuTro76eRsN/ms=;
 b=HWSP10HQgpyUSrc4PC5EPThvv4+i2NEZOt1iVThwIaMh8dMZJM34wHtNVadFC56o6P6+Ta2/9yvtsQPVp2UYJWey3605CB+Ewe/WLJxjneLivKQfSUWLJ65ZV6Qmz2Fkpxqk+W1f6QLG4hkXa018qJHx8nStZ4fc4nsJmrOcD0E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1394.namprd11.prod.outlook.com (2603:10b6:404:49::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 27 May
 2020 15:13:10 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 15:13:10 +0000
Subject: Re: [oe] [meta-oe][PATCH 2/4] python3-pytest-html: Update 1.6 -> 2.1.1
To: Domarys Correa <domarys.correa@ossystems.com.br>,
 openembedded-devel@lists.openembedded.org
References: <20200526192011.17024-1-domarys.correa@ossystems.com.br>
 <20200526192011.17024-2-domarys.correa@ossystems.com.br>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <43961146-b3e5-1202-edf1-3e142f8bbf76@windriver.com>
Date: Wed, 27 May 2020 11:13:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200526192011.17024-2-domarys.correa@ossystems.com.br>
X-ClientProxiedBy: YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::8) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Wed, 27 May 2020 15:13:09 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1e82db9-37e2-4486-a1cc-08d80250776e
X-MS-TrafficTypeDiagnostic: BN6PR11MB1394:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB139458595C8A6C4828E85F1B9FB10@BN6PR11MB1394.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4+nW+eNy3PlFRpsN5U6jSJCqnQ+TjC9hm4XJ0rKk9xidcOZ+f72SajxFRIz5Rg8HZYsY/FbUujDe73IbQxBu0J81sfsf6uMcxbrzD9ar7xlodkRPOZx0WaMNXEdVjS8iybsboQ4Ig3SaIjwXnpFTgj8t2WzqNKcWP4s1GrZTYkbp2YTRFgVJZpz7TaXAj58hqRu1jGDR7p4bC3JCE/4AmquAOy+Ez92rAoQQr2k67XfRK3vsRzlPhlVUx/J69S06/I3J0QdNP4/L4mO2oyX+q550dlmmwETaavNcYpZ5a37kCNg3JbBZrbMVHkW/g10zU6fVrL4+CmTyKBhRFTRDZSirNpkJNwo0IcoXrD+kflYctyLhrUGyQJcHJZkOnBTKs/srQ9h2pyeqyQEJDojwokKl3XRLHcumKVOQaz64gZMO2nBdHoxfAXsRvlrx4vzJhMxGbuVxDNyJ1S53dDGKzA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(376002)(346002)(39850400004)(366004)(316002)(166002)(15650500001)(966005)(8676002)(5660300002)(6486002)(31696002)(86362001)(66946007)(8936002)(83080400001)(83380400001)(66556008)(2906002)(66476007)(2616005)(44832011)(16576012)(186003)(478600001)(956004)(52116002)(53546011)(26005)(33964004)(36756003)(16526019)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	EIS6n6Cv8fc5o0ylIIrCUuVN/CjBx7/pgjeDrxdWScx2NA/Cnxim4HioLjtvkohfSg/YJ7muONKJHEsLW8xOpvKiKTMJkolAYa/6DwmApQIe74L4xUaH6iWC7b1eyMMVEkFxsalcrHLzdOn314i5U11T77+Kx5Bk9DgfQJPEAKlQ87iyHLN5gpm1IJWS4f9KRhCqlE/3CJb6EJhNWB+NptJEbKTCNQgcGDcAA+1cVSD99HyqlbOh/zDcFuOYSUdscvOBDb8cpylnBO8kmqYKrcbRmL+OD4DcuIugJAuIOQT7jSQwPsVcJ/50t8kvTShozYi989iNpMi3VHh8IAUZDZz4OCUGg4UuYQ9UwP0dP5hFFqEZkIDRmhGz5jpHkeaHsoGE+Z7vSyS3nT6ILoIXIUs0unQgQfFQtaSWqF1zQPG7sXH0LQWt6Vn9z7K+5isUcVG+DeIfO7NU2tyHqF8se9G3pokYW8Y7p2mof6+fudFE18o9bmKhXK1bCsYut0Dq
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e82db9-37e2-4486-a1cc-08d80250776e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 15:13:09.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4n4g0mMBXAc/6jD34S7dw30eyU6WeT4tsI4xOXCA8b9I9xZ5ZVcxaiTjBM2jTHCT8XMQinLAlvGw44LgkwBSTvVLfR/P5qpcNDNJNPzHPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1394
Content-Type: multipart/alternative;
 boundary="------------93B94DBDC2A4238EF73A8203"
Content-Language: en-US

--------------93B94DBDC2A4238EF73A8203
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/26/20 3:20 PM, Domarys Correa wrote:
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...html_1.6.bb => python3-pytest-html_2.1.1.bb} | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest-html_1.6.bb => python3-pytest-html_2.1.1.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb b/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb
> rename to meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
> index 8ace29ed1..27b768155 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
> @@ -1,19 +1,24 @@
>   DESCRIPTION = "pytest plugin for generating html reports from test results"
> -HOMEPAGE = "https://github.com/pytest-dev/pytest-html"
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +
>   LICENSE = "MPL-2.0"
>   LIC_FILES_CHKSUM = "file://../pytest-html.LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
>   
>   # Per README.rst the license statement is fetched from
>   # https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE
>   SRC_URI += "https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE;name=license;downloadfilename=pytest-html.LICENSE"
> +SRC_URI[license.md5sum] = "5d425c8f3157dbf212db2ec53d9e5132"
> +SRC_URI[license.sha256sum] = "2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e"
> +
> +SRC_URI[sha256sum] = "6a4ac391e105e391208e3eb9bd294a60dd336447fd8e1acddff3a6de7f4e57c5"
> +
>   
>   PYPI_PACKAGE = "pytest-html"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "ac956864a9b3392203dacd287ae450f0"
> -SRC_URI[sha256sum] = "a359de04273239587bd1a15b29b2266daeaf56b7a13f8224bc4fb3ae0ba72c3f"
> -SRC_URI[license.md5sum] = "5d425c8f3157dbf212db2ec53d9e5132"
> -SRC_URI[license.sha256sum] = "2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e"
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-pytest \
> +"
>   
> -RDEPENDS_${PN} = "${PYTHON_PN}-pytest"
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------93B94DBDC2A4238EF73A8203
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
    <blockquote type="cite" cite="mid:20200526192011.17024-2-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Domarys Correa <a class="moz-txt-link-rfc2396E" href="mailto:domarys.correa@ossystems.com.br">&lt;domarys.correa@ossystems.com.br&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200526192011.17024-2-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">
---
 ...html_1.6.bb =&gt; python3-pytest-html_2.1.1.bb} | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------
 1 file changed, 11 insertions(&#43;), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-html_1.6.bb =&gt; python3-pytest-html_2.1.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb b/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb
rename to meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
index 8ace29ed1..27b768155 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
@@ -1,19 &#43;1,24 @@
 DESCRIPTION = &quot;pytest plugin for generating html reports from test results&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pytest-dev/pytest-html">&quot;https://github.com/pytest-dev/pytest-html&quot;</a>
&#43;DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
&#43;
 LICENSE = &quot;MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://../pytest-html.LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132">&quot;file://../pytest-html.LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132&quot;</a>
 
 # Per README.rst the license statement is fetched from
 # <a class="moz-txt-link-freetext" href="https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE">https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE</a>
 SRC_URI &#43;= <a class="moz-txt-link-rfc2396E" href="https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE;name=license;downloadfilename=pytest-html.LICENSE">&quot;https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE;name=license;downloadfilename=pytest-html.LICENSE&quot;</a>
&#43;SRC_URI[license.md5sum] = &quot;5d425c8f3157dbf212db2ec53d9e5132&quot;
&#43;SRC_URI[license.sha256sum] = &quot;2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e&quot;
&#43;
&#43;SRC_URI[sha256sum] = &quot;6a4ac391e105e391208e3eb9bd294a60dd336447fd8e1acddff3a6de7f4e57c5&quot;
&#43;
 
 PYPI_PACKAGE = &quot;pytest-html&quot;
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;ac956864a9b3392203dacd287ae450f0&quot;
-SRC_URI[sha256sum] = &quot;a359de04273239587bd1a15b29b2266daeaf56b7a13f8224bc4fb3ae0ba72c3f&quot;
-SRC_URI[license.md5sum] = &quot;5d425c8f3157dbf212db2ec53d9e5132&quot;
-SRC_URI[license.sha256sum] = &quot;2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e&quot;
&#43;RDEPENDS_${PN} &#43;= &quot; \
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

--------------93B94DBDC2A4238EF73A8203--
