Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.76])
 by mx.groups.io with SMTP id smtpd.web10.10690.1592583596431857035
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 09:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lDmJJHW3;
 spf=pass (domain: windriver.com, ip: 40.107.94.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cClVKSbTIMdSbOO4vBAS/NhmciTDerVwrs/JABRr8D++qn1iCqnRJURaq/5xSL6cwEeaU8YzTDGOP1n5Z/5WZiTO++pWGz+ba4mRckg6jYSzetm/AenAV61CE2WEfkBnZlx5Um/EoeOQ97m+dEghRzH5gt1xyorIbRuI2ZrumzOjzAatAWhRt/wbJs6ZU3v5NsTU4AbrpL3XDUuppVkaz8B7/F2qMDMYGAG/dfuAhz/QqhfIkODan45t1MULhChjsxhWaUAlkvSo5vnGnvdgK3GmT2bbq8NnwmOFzewc2jTZ/g+R47orSIP7ZYY9SBtdZ+Wnh5IMMhHc6H6RrRpPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OTogTatYRcueetEWenZPk6dxkVPU+4wiZpJPOv0DUQ=;
 b=VpiBgo2RZpNjCGcLp4ZusA2tIJLL/wKf+5VIZX6r7h2j/xCHVd557IM6WotWOZKdoPI4lZZDicvpkOnsf2zLQG9TTlOzZMcbX637JuXG1CeWP5/XDtsWtYr+1JJI6+IR4Ug85ccQmipGPFjdj7dm7mhn7uai1JUx2i8o7o4X4HGgAj6dsiFSGXRRsieJ3kuJ59V6lNmu5DAhFEB4pp97/AW+afkOvdv0lzU0k1uvekkajK1LvelX2hSkap3mY4LqN2q9jAMpFJXNbF7eTXjOtJSMDe6K0XV3JOfaGy12gJLb4RQhdtzZNRYUJNMbOyymMBOqCMzqB02KvHsHclKxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OTogTatYRcueetEWenZPk6dxkVPU+4wiZpJPOv0DUQ=;
 b=lDmJJHW3idz+AYUMcX37kf811kpGYUQseh0wU0XcURh6aZWSRhQzv3ntbk9BXUmZfOd+6Uu+KfwDf8Z/FwAfFj4doL2h43Wmk7SQt9hdKFeeTnWVXIFjlQVk03+5g6tiDU+TXkfPwdGc/Cr2Dby3du+9ceUxiogsBDPNoJb4rnk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Fri, 19 Jun
 2020 16:19:55 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 16:19:55 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-sqlsoup: add package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200618152805.13075-1-akuster808@gmail.com>
 <20200618152805.13075-6-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7b0306f3-11ac-9f8e-b022-6335bc803ed5@windriver.com>
Date: Fri, 19 Jun 2020 12:19:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200618152805.13075-6-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 16:19:54 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2526c0a6-ff03-4de0-2869-08d8146c9a47
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39542FE53A7506C670A2E2109F980@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bQLVxWtOLnShpeYSK48vWlZrdlswRjyhMyo7MLduVTuFIgTWxh42Z+XFH0MoWCU8886pSoMkn0GJebP4yWnxoDq6GO96qTYy00Q5ZPRXdJt78i0T4pZRexNcUxX0ru2gKvv7aiJdUpp+tpYSxLaDA/5Cjof/ZdPLSJNiJoSxDBCyNM5qdBmWaF76ORwiuQOjM6dvKzfLkAXkzYH+QZJipIRPy/OwOJKPKaOHi60+c5QwcRdsDk/2eCjlTcmBnYr2APlAnj7+QjWhi5FuauPK+UqhGoWDdme+JJDaeE9sqQbGULAgFi46NQEs08oM5f+YnPW2/CpJJjGSeUPVCH+IIbU8Snu26g2ORn1iYHJWS+CtY6yl9MLAr+HHOmuiy5rb5t9a3LbIfoCZAIai/w0VQQ4WqWxTIw4+4Z+F1QMiepbtLK8N/8HQPsr+ZrfQjNN0e++2wbaBNxskK3943pazBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(366004)(39850400004)(396003)(5660300002)(53546011)(6486002)(478600001)(86362001)(83380400001)(8936002)(26005)(956004)(166002)(16526019)(44832011)(52116002)(33964004)(31696002)(31686004)(2616005)(186003)(316002)(2906002)(966005)(36756003)(66476007)(66556008)(66946007)(16576012)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fkbncVyfSHdkTQlJMXN3SQYvJmiI0eQH3chFtomxkk4E26E9dpFh9AcbnYEELaQpvWEn0WwNiORPXvhzuXvUq1nOyhQM+HMEegB0k4KVSmM7kBJc4hW4cerIovFM7AcxTnfB/BMheKMEVUfX/PlO3B9uurz8z+washJwuPQIF1XvBGEcmv2bw//Elmndr4zjibh7OYQP5KTLr124T8gJDiUCta06h3NLpYwJ1e0QKGymguIK/dS/DYEAkoXAvVpZfP8PIbYHt75JesEQiLilqGShaJF8IQ/IsEVtv33qxt+rbRVy9DR+pQD/Pl4ZGUkq32lotVvhEOg1zHzZWWvxuKLxkGkN6HzXilmtiwwLdkIdHdSyIxbq/vZTcpA9ij+t6weDHkwcs2AQ/Rtx3wTY8rbZjnJsrOqLMBIKiMRsu6tcz28Fpa8QmCslBsH2vXrPJoQOEM6nacVh5Sg1JBX9Olc7C5V5Z9daHQZ6UTzt5KXS2wc7zNSjqzOM0+3EFORG
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2526c0a6-ff03-4de0-2869-08d8146c9a47
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 16:19:55.2743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAogTMPs9dhQuHlhvyXrG45DD1C3tE1bDHE/QOi2XPN+pOubG7RFYVM77AkxEtCpIxngBXgD8e7WtzcFFxXunfWvAO04cRb0mi+2QdVUxho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------303208B5152CF29688F66D23"
Content-Language: en-US

--------------303208B5152CF29688F66D23
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/20 11:28 AM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-sqlsoup_0.9.1.bb     | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb b/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
> new file mode 100644
> index 0000000000..592ba72043
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "A one step database access tool, built on the SQLAlchemy ORM."
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4382f3a1adb96f258dbd80f5b400f0d5"
> +
> +PYPI_PACKAGE = "sqlsoup"
> +SRC_URI[sha256sum] = "2fafb7732a663dcd59b37e64d1c94d5fb20d4fad32cd8ee260aa1cd9a10340d6"
> +
> +inherit pypi setuptools3
>
> 

--------------303208B5152CF29688F66D23
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/20 11:28 AM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200618152805.13075-6-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200618152805.13075-6-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-sqlsoup_0.9.1.bb     | 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 9 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb b/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
new file mode 100644
index 0000000000..592ba72043
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
@@ -0,0 &#43;1,9 @@
&#43;SUMMARY = &quot;A one step database access tool, built on the SQLAlchemy ORM.&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4382f3a1adb96f258dbd80f5b400f0d5">&quot;file://LICENSE;md5=4382f3a1adb96f258dbd80f5b400f0d5&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;sqlsoup&quot;
&#43;SRC_URI[sha256sum] = &quot;2fafb7732a663dcd59b37e64d1c94d5fb20d4fad32cd8ee260aa1cd9a10340d6&quot;
&#43;
&#43;inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------303208B5152CF29688F66D23--
