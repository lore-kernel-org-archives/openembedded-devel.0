Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.67])
 by mx.groups.io with SMTP id smtpd.web11.2825.1591818649723782171
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=c8OE1KCR;
 spf=pass (domain: windriver.com, ip: 40.107.92.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4n6hjT1+fkdo+mwaUyoznJNH40YJTr4g7zbc6NaeWf/n4cBZP2gzRxWDM5ENVmCOWEFTYHR0yBbB+GV1KDwZgOq+2DW5ySDNaUIYSVVOwEXt+aLFlRzqKw/5YM8NW0vUIoDVA8uz/HFsrUBcAykc1q2jbfFjl7NJk+ugtZrIA+o32fGcXuMdPjv04fK1cSIsrE/i8BVWMBn1fscrTioBmM0hgbPN8xSEh1Yj6xdjOb2t28tNk5csyxbYsXNdO4CyP4mJRUlBN7W5e9f1QeTz058md+GVhiCqRgWw4qy2/18dC/NZsU2L+33ch+cskFNTWSWEI3X5MYgbLsfsFzN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLuGtjbWBzTbNwiS5f5JlnPf1kmF+CpwK9Pvwsa1ZAo=;
 b=g/wP0Pa3U6YuB2/I9qTW1aSWehce4QxpP1l4J/ABLVXtZrEhATicXPyPANtaQe75rhaFiP3NS9/dn2nI8Ndb6ZNxayOAj5WZit1f3ISw7AGCHNxfmo2H5RvRrAFd+Avlo1V/aS/v/oxf+BUaheaJhM5w712qMzRXiXk8ptu2xJulQzIHsemM73UZu2LxHCeMy436NPZcDWuXBZs9S9sMmUFI38eR6LmHa43/LabXlx2JDhC0TN+dabKQZ0TlS5j9ZpTMaHiOkChyMX+BGN657GIqbqZlZ1KFUvblemuWAZ6dyUG8k5hDZLPaSAZt/TNpBc6Jj8ExQxKtc1QYuSJu7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLuGtjbWBzTbNwiS5f5JlnPf1kmF+CpwK9Pvwsa1ZAo=;
 b=c8OE1KCRc9/VBHWQ7v750fxtwaOdSN9pV/X+il5/fsa72ixnKcyMIiAEKLuLtF52eCjIEYIUNKPkxAgWmNb+x2/8twpzOb9TP9MlOLJqCZNzxqy7xaowM2vqOMMcbQenzH9td8KLWuh2CK0So+Ij1ziM1d2+NKdnLO1yl3SwoNo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3924.namprd11.prod.outlook.com (2603:10b6:405:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 19:50:48 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:50:48 +0000
Subject: Re: [oe] [PATCH 2/2] python-m2crypto: Add RDEPENDS
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609061806.310291-1-changqing.li@windriver.com>
 <20200609061806.310291-2-changqing.li@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c9b8c46b-bdbd-26aa-5ed7-32e0a53bff49@windriver.com>
Date: Wed, 10 Jun 2020 15:50:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609061806.310291-2-changqing.li@windriver.com>
X-ClientProxiedBy: YTBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::49) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 19:50:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d051803-1333-4a3d-ec19-08d80d779270
X-MS-TrafficTypeDiagnostic: BN6PR11MB3924:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3924B07F68158A096F6C1CE89F830@BN6PR11MB3924.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:146;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MMkO6kuB4NG/aF3+H6OvuOkmbfvWGjBTJ12oaWMKmHBW7Hmq6WkhcUu4XlOMiv8DhGxm4pDu0jjGvUORf8bTwGwAJ2iB6mipkqbWSat0iLgrD4n0fJpK0v3TsTzYjrFkqSdIB10RXBG/Qv5l1vkWQLiqAQp5VYO/SIsfihOcinIpptiWvblBx5mjawwOZt1F8nBLVCk9npH2FI0giIp6ry21uNti5o3f5GJow7zQpJBp9kXNCWLf/39yDXeWwQQ7+o7u5XNtGZKRVmr8y2LX3Ft+gO8+41sw/DlAdJOXtWvRXGjORin4ohqwQAYMp7FsQcQMp9TkGBH4TspmZHDEBhhvn3fRlBo0wNGCbDQx0rDsfebWFCnyL89zLgjS0NMtNCVhLgnxK/Cu1MWy3pMSSK/Ybp/H1a5t0pLVFTBKa8notVPO5GZCVGqhWjiRXU709HYsv09+Ysae1BvMHDllgw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(39850400004)(136003)(366004)(376002)(316002)(6486002)(8936002)(16576012)(166002)(2616005)(956004)(31696002)(86362001)(31686004)(44832011)(83380400001)(966005)(66946007)(66556008)(5660300002)(53546011)(8676002)(16526019)(66476007)(36756003)(2906002)(478600001)(33964004)(186003)(52116002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ROxLItTLFkLGPAVjgIOmRCIj0DENBKDLqzDQrc3EOnemrH6dvFyj2nlq5VHfo38dPd0+a35iKWdlE7VgioLKr2EGDGt1CzAbDxCMOfqVl+v7mDUXZAD8pIyQDqWesgs5WghG++x1mlH7zCfymHbRQu/EfFid3D/137QL+j+q49Ey0GmHf3+dUGVEyz4mrOyBnNnhtkL6rbD0bL0qLq14xGH1/zIaQcec87rBEPnxCwIqEUjvm03iVqcG+OIdWXT1CoFCnz9XGtH6wzNNLOhc7Ny71bvwo1YxfvwjkRiYrMzE+6bXxHSJclmye31JArbJAD7i1sb4neS/fEJdEvpfv3o3onhnGHkwtt+FRXIPcC+Io5+BkkFCaAglfEI63ritYP9/HY0JYVxcdFEGY41yUGQxe9b48AbHgUQRCeAsf3LT53v8MfVG86oD5m9F5uepjOxqAOu7qDf8lPwbyV06U4l01C+km8f8LHNkR61XP7w=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d051803-1333-4a3d-ec19-08d80d779270
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:50:48.3767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVHG+g10cIU1GO3vnBxDZ5muA6/TK8v5gToyhpix7Nur/yJsGMa6872x5hzBkx0Fr1Td/jtgzCnKtIWt27SCqYxBnIr1NajI9es7k/7IktU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3924
Content-Type: multipart/alternative;
 boundary="------------21A3EA3D0F0B97D61ECF961B"
Content-Language: en-US

--------------21A3EA3D0F0B97D61ECF961B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 2:18 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> fix errors:
> ModuleNotFoundError: No module named 'distutils'
> ModuleNotFoundError: No module named 'asyncore'
> ModuleNotFoundError: No module named 'xmlrpc'
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python-m2crypto.inc | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
> index 76dd58ce0..881fdf1cc 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto.inc
> +++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
> @@ -17,7 +17,11 @@ PYPI_PACKAGE = "M2Crypto"
>   inherit pypi siteinfo
>   
>   DEPENDS += "openssl swig-native"
> -RDEPENDS_${PN} += "${PYTHON_PN}-typing"
> +RDEPENDS_${PN} += "${PYTHON_PN}-typing \
> +                   ${PYTHON_PN}-distutils \
> +                   ${PYTHON_PN}-smtpd \
> +                   ${PYTHON_PN}-xmlrpc \
> +"
>   
>   DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
>   DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
>
> 

--------------21A3EA3D0F0B97D61ECF961B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 2:18 AM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609061806.310291-2-changqing.li@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609061806.310291-2-changqing.li@windriver.com">
      <pre class="moz-quote-pre" wrap="">

fix errors:
ModuleNotFoundError: No module named 'distutils'
ModuleNotFoundError: No module named 'asyncore'
ModuleNotFoundError: No module named 'xmlrpc'

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-python/recipes-devtools/python/python-m2crypto.inc | 6 &#43;&#43;&#43;&#43;&#43;-
 1 file changed, 5 insertions(&#43;), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
index 76dd58ce0..881fdf1cc 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -17,7 &#43;17,11 @@ PYPI_PACKAGE = &quot;M2Crypto&quot;
 inherit pypi siteinfo
 
 DEPENDS &#43;= &quot;openssl swig-native&quot;
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-typing&quot;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-typing \
&#43;                   ${PYTHON_PN}-distutils \
&#43;                   ${PYTHON_PN}-smtpd \
&#43;                   ${PYTHON_PN}-xmlrpc \
&#43;&quot;
 
 DISTUTILS_BUILD_ARGS &#43;= &quot;build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}&quot;
 DISTUTILS_INSTALL_ARGS &#43;= &quot;build_ext --openssl=${STAGING_EXECPREFIXDIR}&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------21A3EA3D0F0B97D61ECF961B--
