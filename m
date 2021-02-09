Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.79])
 by mx.groups.io with SMTP id smtpd.web08.10427.1612879417494123482
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 06:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GlGkjR3s;
 spf=pass (domain: windriver.com, ip: 40.107.243.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQsriTbTgo6lp4QJuHqxWg1oiMxYk1oyvM8Z/Xo19jWrwEkOLc5H0KKYtYKXbnYraoV4o6DDmAAtYyNpk+My9fUs5kzTUljsQDRvCk1D5JYss6AlC9B79iY37jouARIXdV7C96PmodsC2qjX4p2U5U7lZuukPBNNNOHfzkTlyNN4C46CJNk3kObZQ6Kv7qKU/MAs2wbCj+adYUDEmPvei3XFelM+mHCTHH/A340P20ImiMuGBkGKj/IlaFIBYZZTYev9eG1ApzCUF2M8GgIPb+6Q61nSTO3dgFaeoWPr5vYCqq/yKIuO6svoyVq11sq6ylVQIAIx6DbkJG82cl+bWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdLXC3HPSQczd0D8deEmfftB8v2pWoYkMWRtV28M508=;
 b=FD4utsDSz7dArvx5wpRlWWXlwhEq7UqGPrN/MBYHeyyJzG7yUGqEBMhH9TZ+JMQg1dtjXQ18rptN/6ZDAExDQwWtmxJvaVBQ7ZOAJcFbw5gYs+ma/CAINRyj/GwtvXQYTrbwvgs74M3af/ESBdEIyCosU0DXtyOW4YUGXPrZdVvis2RtSRh4n7j5ApOI0OMDV0CU79FsjF+gpGq8yJC3NYhaJyix1DhqY4+gOauXX26Myf5iIw3JTprN1HOMjzfHUGf0PnW9KOmDI/bCi+hDJjrx850yBjjPSN5HmdoUEsuIapMTbIBqLNkNCQ/R5obDcSanrzno6myxBMqsrhZJTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdLXC3HPSQczd0D8deEmfftB8v2pWoYkMWRtV28M508=;
 b=GlGkjR3s0b6fYQ84M0rHCnKu1N9pw1KcgWg3oJ9n0PtkAijKzvhW9EJ6TricL3aSLYTevDrwFdQCx062a8Mnlfso9olV8qEJhHbpqSMR+53jOCAugG+PuAiuR9/mfHEq3zdNY3mzdjnV+jEWveVUkWSvYRl9la1ZM7pJOoR8PwE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 14:03:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 14:03:36 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-periphery: upgrade 2.1.0 -> 2.2.0
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1612766198-76789-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6bea170f-05b7-0547-58c6-e76904193932@windriver.com>
Date: Tue, 9 Feb 2021 09:03:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <1612766198-76789-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR16CA0040.namprd16.prod.outlook.com
 (2603:10b6:405:14::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR16CA0040.namprd16.prod.outlook.com (2603:10b6:405:14::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Tue, 9 Feb 2021 14:03:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14416774-d253-447a-324e-08d8cd037e81
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5165D30397BF1FC1AD10E5039F8E9@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	83Z7sGcpj0saN8ytqMOy76u/EGaYliUSKndqJamD1oHKqrJjZXcymMWPfRVoCGnzo823JC9XespHRBRN8zrAWiWJqpjrh70zcj7dABarZfAPcJM1CaKMtyAZXX+brTBBAOOSZKzDbKe4AVSU8YbfDfpUaNFP+9QBGcD0ROzbtJdTjCRMTMDVSjLl5dbCcdDNlmGcGswtOXd4eBsbdyo0hIh2EpBgXbkjHMHJ3ujH9xFdphfmtV2U2rGthig0SS6TGfCGDQwlDZd2SqNKcifga92jGgP1gBAgWWRlHBrFhfF9Qw776mSm5qFNE5+kDt3+ir+SxCMGn0Q2o6mGIM32CXv9iliwxaMHHnbwMa5udGwte8lNayxhsY0j/UC0g33XtY6TdtBncXHa1ReCrb3eYPWK8WLWpsQPTIrjc5tzsG20VFN0Kz3n0GFSmAVGUNZOBLRgK36ssiDSPklB3Z2Gc4yqAzdl2dlfqQ6ynPHua1EPBM5MNC/wuCnO5MZsIY3+P7MHQShPrOAJ/IXk6MIdx69oSicVzR2RPYtIWZ3P/PfSiHpOqyMoY7Gak9QodlUeg7kIe2vaV6ruKFtHZ+ObWqog9W64CHYK0UR3bMw6uI4H8XQWEBrfujnqjfweOqHKtbzQYosKR/Jgz8ZXkhORYLSm8z97iF3N6M/ZYy94/8aXNXmQCp9/no+IYIAD8efb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(36756003)(186003)(16526019)(31686004)(956004)(44832011)(166002)(86362001)(66556008)(66476007)(66946007)(2906002)(83380400001)(6486002)(316002)(5660300002)(16576012)(26005)(33964004)(966005)(2616005)(52116002)(8676002)(31696002)(478600001)(8936002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2+XYRph86nMGf3gm8Q0SxqBOzSHH51WZKZZeXWqJSnYfh4VcF6QBFFx277TwU0iCwApBMDxNlNpP/DS5o8ofNQSEhTg8nn02JOH15yVPoJiKBzYTvAyIOj/93OAWgIM/ZPWsTXWZBy0LpuD1gKPv052WTbEmioSQhPpsKV36go0FpNt/WmaP7zyCLfl6m2NsvShp2Z+S8PtfKruTb99aJhuvWDkvo4SHf46OT4bfF5esHtz7W3aImKQmhQgbDVCRBqnqolyMHOXRKzz7N4pBigkHa5l1JQiBw3AbLOLQllmwFNCjWSr6JCg4dd3GeAgPq21YJBMTUlzpUzhnRaRWNhu3qfI3k4w+5UcM5y8rncO+K2pBinv/YOMAK/ndFcOAFBDKNkYAvCPR8iCGdz+drCVEKPWui1+JyhTxzrkVuEiQZ2AMDG5BiNcugP3N8bMVGXwkW75q5yXB3iMPJO+nJU5afJ2tpuIuvBeNu5iedmYUxk26iHWc2Y4Hw8yi4kdX0BoZ6mDPRw26ifcppovvrvpt6kpjI2B57/utBKe9w1WRr6MAGdANNeAkCYcl0hIsqLiHzk1iLJyuNjISfJhbyMr/S4feAIFqf0/4/180EHbyaHAKSVG+aNH8XVte//CRFff7A20OTF9LxeJtk2MHmviqD4MOck3x7iIAw/XhfHmIZRENYkf+O52yS4tz1r/kH/dwS9WYmTC0eD3O3rlU+szWEPeJBGiPjRwAO45jM7yIxpB3rv38GXK8p4P14e3F
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14416774-d253-447a-324e-08d8cd037e81
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 14:03:36.5596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBlwgPQlx6Fp+HEdulc/aET2WevsdlUT8AjElJ/KW+poTHIjIeb1my4eQKnUNL1tqHjaFYMG9bOXsFQG72gb2u1EI2DzP+IzVfNvGMXls8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
Content-Type: multipart/alternative;
 boundary="------------1C489421FA1E2CDCE29FDE6E"
Content-Language: en-US

--------------1C489421FA1E2CDCE29FDE6E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-08 1:36 a.m., zhengruoqin wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-periphery_2.1.0.bb => python3-periphery_2.2.0.bb} | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-periphery_2.1.0.bb => python3-periphery_2.2.0.bb} (58%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb b/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
> similarity index 58%
> rename from meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
> index 3cd9004df..a01071151 100644
> --- a/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
> @@ -4,11 +4,13 @@ LICENSE = "MIT"
>
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b"
>
> -SRC_URI[md5sum] = "27cdd7e026438067a238fb04ed5766a3"
> -SRC_URI[sha256sum] = "57baa82e6bc59b67747317d16ad0cf9626826e8d43233af13bce924660500bd6"
> +SRC_URI[md5sum] = "0a5b866443edab0dab62cea56ed96f1e"
> +SRC_URI[sha256sum] = "391e5bdfe2511aa7369002d4861df795dbb2889426b1b2cc1e6c9d85939da4dd"
>
>   inherit pypi setuptools3
>
>   PYPI_PACKAGE = "python-periphery"
>
> -RDEPENDS_${PN} += "${PYTHON_PN}-mmap"
> +RDEPENDS_${PN} += "${PYTHON_PN}-mmap \
> +               ${PYTHON_PN}-ctypes \
> +               ${PYTHON_PN}-fcntl"
> --
> 2.25.1
>
>
>
>
> 
>

--------------1C489421FA1E2CDCE29FDE6E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-08 1:36 a.m., zhengruoqin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1612766198-76789-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1612766198-76789-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-periphery_2.1.0.bb =&gt; python3-periphery_2.2.0.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-periphery_2.1.0.bb =&gt; python3-periphery_2.2.0.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb b/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
index 3cd9004df..a01071151 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
@@ -4,11 +4,13 @@ LICENSE = &quot;MIT&quot;

 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b">&quot;file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b&quot;</a>

-SRC_URI[md5sum] = &quot;27cdd7e026438067a238fb04ed5766a3&quot;
-SRC_URI[sha256sum] = &quot;57baa82e6bc59b67747317d16ad0cf9626826e8d43233af13bce924660500bd6&quot;
+SRC_URI[md5sum] = &quot;0a5b866443edab0dab62cea56ed96f1e&quot;
+SRC_URI[sha256sum] = &quot;391e5bdfe2511aa7369002d4861df795dbb2889426b1b2cc1e6c9d85939da4dd&quot;

 inherit pypi setuptools3

 PYPI_PACKAGE = &quot;python-periphery&quot;

-RDEPENDS_${PN} += &quot;${PYTHON_PN}-mmap&quot;
+RDEPENDS_${PN} += &quot;${PYTHON_PN}-mmap \
+               ${PYTHON_PN}-ctypes \
+               ${PYTHON_PN}-fcntl&quot;
--
2.25.1



</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1C489421FA1E2CDCE29FDE6E--
