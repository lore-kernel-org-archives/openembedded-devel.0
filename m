Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.41])
 by mx.groups.io with SMTP id smtpd.web11.21799.1591972879666700529
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 07:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PBNc6/6Z;
 spf=pass (domain: windriver.com, ip: 40.107.92.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRB6cUrle7Vf6grGsDkjbcFMvxS+LxE7HXF0ZABbVOMhyecNfUIMi2Ktlu0wG76TLiZpbpl+kI5I5KGH08AE42GxAzkDOZaE6s/ZxH8fyK1JFo0s1LQda9hngJBIfuzv1LGApvbEeD9OAT5sKwhw5Jh8N6TLAzUxUKBwTPHGVYPTvvziGPO0Vu7yDavSzJH3Axq1CPz61wHcpoe4q1B7luQevLcVYFHG8olTBzAIpxvKH5Mp8KiLcwjVm8TetyfHw+pcOdQ7M/0SOXuYclBG+5vciAvHCFrfmHiMsgGFZ2GsHFUQsTr4DMVXuan6Bkn3rmKii0RMeBNDjECv/F8fmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEtg9S8oJHYRigmUvAj5BrFyRLs8XfDbIVqJxpGIlgQ=;
 b=g5O74YR7l2w/YnvcXjTzBynu6LRw4T2Y8MX+4pKUrElxWkWOOelyAwCdkq1I0fl2pAMy13C4bb875SXtdWIG6LXvN/ugzqTPIOkxMOlqNHgHbDpaWVb1Ot3DsMkVbzPl1mljiuN/LOKsxo3IqtCPniyaL8iUe0DoWU+2S+Vn8nJlAcWGc/4XMUV9RzyUpamclmFR1TX10623A62mXG/bIQWFME40nqiE2xJGOfip7yBunrs+0yhIANgDJMFMZFt9b0Hqy46mT28ssWzd6Hes7A260vpu/Tki7MQb1Xeh8PAqvY4wgsynTXKWbQ2p0IVaHjE2my/jNSqtFo8geuLbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEtg9S8oJHYRigmUvAj5BrFyRLs8XfDbIVqJxpGIlgQ=;
 b=PBNc6/6Zlzjgu8WrDFgu/bcVi5WH8m2pA5bAuS5YtWNdaBpuJxTBKhHTWaUeUw0xM/Ro+fsABcb9RH/znHCrKSGh4cd4zJuYBiiBc3SNri6f0wDTaB+M73atSxDtEp9zWxaMuxYS2m5tbaGfAq6GYCGClzTTdQedBSvdGsPKRJo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN7PR11MB2546.namprd11.prod.outlook.com (2603:10b6:406:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 14:41:18 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 14:41:18 +0000
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-parse-type: Upgrade 0.4.2 -> 0.5.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200612094757.22146-1-leon.anavi@konsulko.com>
 <20200612094757.22146-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e2ce1106-4519-6270-c314-ef63a7899e21@windriver.com>
Date: Fri, 12 Jun 2020 10:41:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200612094757.22146-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::24) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0145.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24 via Frontend Transport; Fri, 12 Jun 2020 14:41:17 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e7375d0-cc9c-48ae-5c91-08d80edeaa99
X-MS-TrafficTypeDiagnostic: BN7PR11MB2546:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB25462A585A04CB39AA46B10B9F810@BN7PR11MB2546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	19mUzo9n6Z74Hq2TqsC+7JYx48ih78gec2sIDXe0uo+ypFZepFidKYEeF48Z/OLADWBOcWm6JmAmC/WZh6sPjdm9xqtwPFgUHHQL5TVM1Z5Z8lnfD1Qh0oeB/PP0KnH7Y0SiUEbVoNR3iGxVyIFFcfw1T7bYBvvEx5BSly7qaxcVNGbIx5+EI5Okzi0ECQaGkgB+ZDhcnNbk92Yzh3AAm3XSz/Pwcb9FcOQ7f2tiFW+a+JkkmAELlpc4WfQuEfp08lx9KjHJWJpRRSJ5D9e7YWf8LvObl0C/aGg3fOFY74ImduwvH0aLAjq3bi8cL3KNnuJF2TUrew9fgzKoxhjOsPQ23ATEkw4tFFtOjSwQ2sDsrk+O0VCS9aUPkAyoyysZGW6ReLfak+Kw45vyyW2TeejyVH7EBIOyyKro+0LUlO8ihBDbD+rwPL4S+ubmmMp404kq/Sp28xJvzObmYzgElA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(66556008)(83380400001)(166002)(2906002)(26005)(52116002)(16526019)(53546011)(33964004)(5660300002)(186003)(966005)(2616005)(956004)(44832011)(478600001)(66476007)(16576012)(8936002)(316002)(6486002)(31686004)(31696002)(8676002)(36756003)(86362001)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	DAevXjqMJ4/Vup5B1aGhngPm+3B3RJ5vD20Rpf9e9LoEwY9MN5uxf4EHF4tt+3z9Rq98Wjv+V8gkwP5LZ26mzeOhPfR+EhT2I0Rtq+QS+eWDnwwVMw6kkaV+zkMKpmNX6X7El2/Fi1KHAwkM9S6GLXKsNA0jIWlmPxfjHJEHEyjt7r5YgcF6uzUeURliKWxh9QA5onoX83pGfYRfpfbhk7Tl+YlWD7wm+lZSleX3J9z1MQS6j3aezdHF6arY+2seUKTlh2Lp+M5YhVyF488oatlUZXrB7Qtoq0Hu70SptbsEKmcxNASK8MX7PZCDVng/aspe9IOYfd6+p+13cO6xmFaNcFHzz20FBki6ZsWi9vXnmzYEIZ5O9Wv8ytUnFtWog0ZN7I7mu+l2lRNe9nfKJHJc0IFoeochrosxzyCe1CsjiJTonDqQB+ymAV2W/VmAgk9hZpcZIULIYqXYB4epXZPsbV2REiU1+rXY0LiXOVDFoc6n40ap2co7RP8cTPjn
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7375d0-cc9c-48ae-5c91-08d80edeaa99
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 14:41:18.2250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kOxheDwz2CUiZyPmT/T4kqmWFCSYsK4OXLm5zV5kYGAR29QQIVngo8ySsGamcxSQo4e8RFQRx5XK0ubKvi95914JO4KFdx5jW+L22hA6do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2546
Content-Type: multipart/alternative;
 boundary="------------DBCEDEF2E6037A5CA9FD7D28"
Content-Language: en-US

--------------DBCEDEF2E6037A5CA9FD7D28
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/12/20 5:47 AM, Leon Anavi wrote:
> Upgrade to release 0.5.2. The year in file LICENCE has been
> changed therefore the checksum has been changed but it still
> remains a BSD License. Add python3-six as a run-time dependency.
> The new release brings:
>
> - Update to parse-1.12.0
> - Code cleanups
> - Bug fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-parse-type_0.4.2.bb => python3-parse-type_0.5.2.bb} | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-parse-type_0.4.2.bb => python3-parse-type_0.5.2.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
> index a9e7a53ee..f61c480bd 100644
> --- a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
> @@ -1,15 +1,15 @@
>   SUMMARY = "Simplifies building parse types based on the parse module"
>   HOMEPAGE = "https://github.com/jenisys/parse_type"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=16374dbaeaca1890153edb3f41371222"
>   
> -SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
> -SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
> +SRC_URI[md5sum] = "b954062f14ab723a91fe1e2be15e859d"
> +SRC_URI[sha256sum] = "7f690b18d35048c15438d6d0571f9045cffbec5907e0b1ccf006f889e3a38c0b"
>   
>   PYPI_PACKAGE = "parse_type"
>   inherit pypi ptest setuptools3
>   
> -RDEPENDS_${PN} += "${PYTHON_PN}-parse"
> +RDEPENDS_${PN} += "${PYTHON_PN}-parse ${PYTHON_PN}-six"
>   
>   SRC_URI += " \
>   	file://run-ptest \
>
> 

--------------DBCEDEF2E6037A5CA9FD7D28
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/12/20 5:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200612094757.22146-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.5.2. The year in file LICENCE has been
changed therefore the checksum has been changed but it still
remains a BSD License. Add python3-six as a run-time dependency.
The new release brings:

- Update to parse-1.12.0
- Code cleanups
- Bug fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200612094757.22146-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-parse-type_0.4.2.bb =&gt; python3-parse-type_0.5.2.bb} | 8 &#43;&#43;&#43;&#43;----
 1 file changed, 4 insertions(&#43;), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse-type_0.4.2.bb =&gt; python3-parse-type_0.5.2.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
rename to meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
index a9e7a53ee..f61c480bd 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
@@ -1,15 &#43;1,15 @@
 SUMMARY = &quot;Simplifies building parse types based on the parse module&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/jenisys/parse_type">&quot;https://github.com/jenisys/parse_type&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95">&quot;file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=16374dbaeaca1890153edb3f41371222">&quot;file://LICENSE;md5=16374dbaeaca1890153edb3f41371222&quot;</a>
 
-SRC_URI[md5sum] = &quot;b5fa59e45965d1b2896023742df2e707&quot;
-SRC_URI[sha256sum] = &quot;f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c&quot;
&#43;SRC_URI[md5sum] = &quot;b954062f14ab723a91fe1e2be15e859d&quot;
&#43;SRC_URI[sha256sum] = &quot;7f690b18d35048c15438d6d0571f9045cffbec5907e0b1ccf006f889e3a38c0b&quot;
 
 PYPI_PACKAGE = &quot;parse_type&quot;
 inherit pypi ptest setuptools3
 
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-parse&quot;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-parse ${PYTHON_PN}-six&quot;
 
 SRC_URI &#43;= &quot; \
 	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DBCEDEF2E6037A5CA9FD7D28--
