Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.73])
 by mx.groups.io with SMTP id smtpd.web10.10842.1593784980647072378
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YhvSvN98;
 spf=pass (domain: windriver.com, ip: 40.107.223.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nP5U2Jr64aY+4CROnJRfrjFp+fICNRckdBU/OoCFX7ZaCi1iGrzIqbTm+gcQOAHGbR6DovQPxk+aTgo+CXC9w0/HM+cK0nNT0YdNf4d+EtohO5DMiWLReOXrHSeU5Nh1x7ihbLdJWDhIqOGVmLj3+l1+LExIVy16RAYQJn3fZKyDwW7X5inliCKIq92i91aL9XtVJnrT60RdiJIh3IEs2ZuMdfLSNx0JxR7GS3mgsnssfNKiIDNyetdh7U7D0X1p2yzmhze7DJhZNuCNY/cTK+qP6G8hbGalR2h5C9cPKxbPXBxrIcztkHeC6Z2xc2WOHF4ljt83AhGo3YUkP2f6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBcUkltjq3+haOlJ0cn5e0AYVwkjDOqhVIykeAkBKBw=;
 b=PsHQD1CjuHZGAuoxrY+9mqY5XpEBTICvgmExm1ACV3R4Tt8/6GoUbJnSqHKJGaKZ96upnS/0uCVRbtjmGTK8ggBSonlMNf6rPJ7fhC/3y3eI9fpG2vXUss7QOt4tRK+w6PqiQj1pLrQxYD6OJPd4PXRk+xsGz+Vqhm5AFbatu/1VaxJsY/y8sor7R5btNUX8JRRC1bBgWeryIrf09Ur+SzOYEVG31AhfwptNQmSKgEG+aolBWw45jlAeXVY2kPG6/9bcHZvyfo4QdeCjOEN9lqlkQMubDyz/svDkknLDlef2YR+ZYlCGyhcKuE0frICI2sq0ShakCkwVo6lYyFsuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBcUkltjq3+haOlJ0cn5e0AYVwkjDOqhVIykeAkBKBw=;
 b=YhvSvN98Pur5bl9NaUvNsXxZxN6wBRDk4KBkYWxdJHdjQB3S+DxWX1i5zKH/rLJ16LQ+fS8v486XRA0u8OTZ4DpTlDQefLatkdOQvLixi2OLk0kE8OiBTl3XHljDqUQmWJKpyK1UWJmNsuu+5EK8YLY/8bou75myTrQCi/jargA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Fri, 3 Jul 2020 14:02:58 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:02:58 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-py: Upgrade 1.8.2 -> 1.9.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
 <20200629171853.18608-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <91777526-7c51-d34b-5c06-a7fccdf3df60@windriver.com>
Date: Fri, 3 Jul 2020 10:02:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629171853.18608-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 14:02:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac2f4e6d-7453-4a2c-1da9-08d81f59ca7e
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3628A89B5DB2C6F16785862C9F6A0@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7IyDWRPIkZNjBVgYDkDIQieaEGBXsqaR3WgKekzQqdC35l3FLrQBVV3Hq8AmFBE2C0qGf63QBaSJfmwoD5EMSVIAmOa70wVUtHu4NTBF/aH+Kxnmr5qhuXeb+tgiFJHa3dCggLkaccKGDukdWpq4Q9STE8jgvMnJaNaTPJ/Oidfhbd3EEAdeZMgCgL/Tt1rouYro5iHh07t7+AUvHOULd7aL6DxCKrpPGLscHvcLK7A5d5iRjTPxgAdut4thi2OuCIxb5f1Hw4Hi66EPPrHkijFnjMvEyviShsdGtYBvIljzX34Ty+KuzqWg8BlM1jEJsZhYWBtWSf7iyMo69CgI6s2/ykzdPFCdocx/M5f6r7BaaFEpS5QB1M0Oz7beFPPndJMYL4UGvJWjFOClBuaK3GAO/O4WxN+7vAuh6UiqgZBDZwdv3o+5IcuMES//5vC6Dt5cKvxV+3Ud0PSpqripPA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(366004)(376002)(346002)(186003)(2906002)(966005)(52116002)(86362001)(16526019)(5660300002)(31686004)(316002)(66946007)(2616005)(66556008)(956004)(478600001)(66476007)(36756003)(26005)(8676002)(44832011)(53546011)(6486002)(16576012)(8936002)(31696002)(83380400001)(33964004)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Wq9pDnQ4cSeIrZJWjqZZSqUuKPli+JsL4AbRpDJwfiDmewt/cE7CHwppoIRywL0fdpjHCpIaD+Tu3IYU/FSOjzOdrr1kXtQd3a9dBbabnvT/HWWsvKakiB7WnYQZfKHIDUxG9+wr9/jOlogiQt3vqrGT4Sao204EsMAHwuiz1+EFS93rfMVLenD/qog/Sq1u/wO/S4Y/l5ACSKDBM6Hcvkzw1Ip3AtB6zJM06NyR73JaPlp4rsK7JlZAdQk+rG5GrazsqV9+qeEfpWtaa+He3tQuC/lleqtFyNHxMA6Tlu7Hsd+8IFEbqUfP/7E5ActJ0DL0v2ekMccWVtyX1heCNjF3WLdEOKHtzrzivpw1wy7aZFuhxxXyu/7pgpdrDDVVmzenjNG1ci1GkyJO0zilU6BUtEADzIMZMzmoDp41wIBXZlAyQSUQ01ENvRlfKV6ys7gqo9c2pKYurSn+6km370lwiXk3JfOVubOEHYnMRg0=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2f4e6d-7453-4a2c-1da9-08d81f59ca7e
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:02:58.5087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7U/Tq7VNWtQZ7SCpRPrOPEZTNUnTq99Dsp8Unlj7ICmInYYmOXpoy2IxebsrvUE5/kGkcedyT51RfWOVJmL7kM8oDG6yz66fEFKumjpPXNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
Content-Type: multipart/alternative;
 boundary="------------A4A916FD255A3B27FC9DA717"
Content-Language: en-US

--------------A4A916FD255A3B27FC9DA717
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 1:18 PM, Leon Anavi wrote:
> Upgrade to release 1.9.0:
>
> - Add type annotation stubs for the following modules:
>    py.error
>    py.iniconfig
>    py.path (not including SVN paths)
>    py.io
>    py.xml
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-py_1.8.2.bb => python3-py_1.9.0.bb}       | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-py_1.8.2.bb => python3-py_1.9.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-py_1.8.2.bb b/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-py_1.8.2.bb
> rename to meta-python/recipes-devtools/python/python3-py_1.9.0.bb
> index aea737853..794ec2a87 100644
> --- a/meta-python/recipes-devtools/python/python3-py_1.8.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://py.readthedocs.io/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
>   
> -SRC_URI[md5sum] = "baa54e458875d68031c422abb2e47a5c"
> -SRC_URI[sha256sum] = "f3b3a4c36512a4c4f024041ab51866f11761cc169670204b235f6b20523d4e6b"
> +SRC_URI[md5sum] = "b80db4e61eef724f49feb4d20b649e62"
> +SRC_URI[sha256sum] = "9ca6883ce56b4e8da7e79ac18787889fa5206c79dcc67fb065376cd2fe03f342"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
>
> 

--------------A4A916FD255A3B27FC9DA717
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 1:18 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629171853.18608-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.9.0:

- Add type annotation stubs for the following modules:
  py.error
  py.iniconfig
  py.path (not including SVN paths)
  py.io
  py.xml

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629171853.18608-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-py_1.8.2.bb =&gt; python3-py_1.9.0.bb}       | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-py_1.8.2.bb =&gt; python3-py_1.9.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-py_1.8.2.bb b/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-py_1.8.2.bb
rename to meta-python/recipes-devtools/python/python3-py_1.9.0.bb
index aea737853..794ec2a87 100644
--- a/meta-python/recipes-devtools/python/python3-py_1.8.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://py.readthedocs.io/">&quot;http://py.readthedocs.io/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9">&quot;file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9&quot;</a>
 
-SRC_URI[md5sum] = &quot;baa54e458875d68031c422abb2e47a5c&quot;
-SRC_URI[sha256sum] = &quot;f3b3a4c36512a4c4f024041ab51866f11761cc169670204b235f6b20523d4e6b&quot;
&#43;SRC_URI[md5sum] = &quot;b80db4e61eef724f49feb4d20b649e62&quot;
&#43;SRC_URI[sha256sum] = &quot;9ca6883ce56b4e8da7e79ac18787889fa5206c79dcc67fb065376cd2fe03f342&quot;
 
 DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A4A916FD255A3B27FC9DA717--
