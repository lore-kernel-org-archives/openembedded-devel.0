Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.60])
 by mx.groups.io with SMTP id smtpd.web12.44215.1597065093686184227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 06:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EoEWvWp9;
 spf=pass (domain: windriver.com, ip: 40.107.237.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsVA2sXoU2IQ66bMe4Zh7SCt58vDRNjMBa+PZE0N784Fva/Co52+SwJ42CCOrCuAP08kwbTxSDWDa+NGkhmw4WIuIpfn/o6NN2npgsocXEpa4IThyZtxYzQNIFA5udfRQBG8mqGKKLzPNUmORm/w12FBMVq21btguOJn2RWXQzzVVzahSK7Qo3VUwUcyT3NrTtbhOKCnHuZLApZIaPRZi2Smfm50e0qeOKVH5RHYvswSOBATXAnDhv18/JKWEPM9QepmpV3O2DooxL00b+1bBoqKEPlLBEaKVebtqvXSyu2rgmy6oYoXIV/eCfSYY6o+vPcgNd5nlFnnNliqU4eT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjqFt/9q9Bh4lR8B794brMZ+Ft/VpfpqgFC17dGqWuI=;
 b=AYny5m08msqO1qTFgdBFDJ53UBxNx5KdbXsvEWPeLdr1KnQOUWTaNkipoBKjQ8Arc2G9Jw9ZP0Xyt7VYls7sECtOwdXNjxS71tb/W9uFYHkginF01Gjx0rs68S6TOcsCqP1PiDdLxpLTevjxqUAycgKEL/mQIK6qD8iWx8msNv+OlrfgDqb5yS3E7/SAfUnvl/u/1vaLksGqNr9kz7FysHEucpF2MTCqLPzuXXGtwo5yXG4V8mQP1nzkBeU5YqB1vpMnc7Bga4vUnFrrjGOqSEnmxdpHqQDrLiWOyZpQCmI3JKQ5HxugOXSY6yjEruLmlFnp0s/hqpkWdRAcxdxjdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjqFt/9q9Bh4lR8B794brMZ+Ft/VpfpqgFC17dGqWuI=;
 b=EoEWvWp9OPzyH6g63v1EFWYLQ+WV92U+6JuEyddLz1DbW2SnwNmr5DHc9+BEq2dbi42+h4tYLhG7Q8fZrbEux9M2vKDTIZHzAkzictdBpXIuO9K5WhsZEeQakICob30TuqM5HexCbf4v8W62yD1dDo+8dngwYjfvghaAi7pjOOI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 13:11:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 13:11:31 +0000
Subject: Re: [oe] [meta-python][ 3/9] python3-traitlets: add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
 <20200808170407.2326879-3-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <76662157-3e88-efcc-0851-7d1fc08dbf93@windriver.com>
Date: Mon, 10 Aug 2020 09:11:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200808170407.2326879-3-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 13:11:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 806c8d6a-3cd8-4a49-fbff-08d83d2ee63d
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB422697F229EFB89C8058C23D9F440@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3KvboozvRu11xH9lL2Ab9v1SzlZzCsL7kLLKpkLW9JwpLsw15KMO4aKiUS6nVuCILUuimVLCbQGvwnhjybXrAeo+mvs6DKFh/zgNlxduRqYs6tBjZwh21ZCYwFVQuVgqHZXDrAJrDP56Pt6MthI4iDMo2pFbrotSs634e3qKYvuVKdgPoXY5MIMc20G5g0iNcfNoWHCsl3gLq9i6hi3mNdl7JdcN07laejha+fuQVSCeH7cSZF2CP8pR8UnUDrmv8pt8vN5DC837XCM/2RZ9RAAOuFIHeWmjoQi/NEw/MJNQPqli5Igm2GRH4GNdRJaIreuFKHaXwiyEScvbMuRLW94Ehz0fiP+NC4MUXkjRuyPO6gh38lSe6qzdzF1ydPWTYWlN/LJfxZS8IeEbq3Tnk3gY2sfzvmv0cYTYP/N4GRSMVm9gyKwHOX+r+qFIWUTOXdShFRbUHxqWlXd7UVX+yA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(366004)(376002)(39850400004)(26005)(186003)(16576012)(5660300002)(16526019)(316002)(86362001)(66476007)(966005)(8936002)(31696002)(52116002)(6486002)(33964004)(36756003)(8676002)(2906002)(53546011)(31686004)(66946007)(83380400001)(956004)(478600001)(4326008)(166002)(66556008)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Gdu4L70cit15NMtswJFd0lWwqZwKL0SucaJ+UQkDpqaZb6D8TjJmXDdrJyoLXHR6HHT2KkriMlSpWGJonzg9PiIIlcqmzlZN2vdo/CpnUuWVhbm5+YTDq1H2cCE6NV75uAqys92IFyJbib0igDDCr/SnILRWfOSIzX8uwJAfvSkE3aRCKZNQdCAAqFpNKCapUwYgjrioRPIOlegZejj3Bu8BVXBt4fS7Fq9V+HI6JxNTzjk8R7ofV67yb4xyBFH8ZAZw3RMro/1YVMApiJRw0s8wNEaYPJAr047OkD8Xyv41gxpDJ0QX+8LBJkBdt4eo4AK2RPhGtsVqGpJq67Kyl1SpyJgL1584oKWq6gEbUVzqM9bYZzj2H4j7wBwNh2qNcVwA7WNUBepNDuM/s820Xpbf6V498kljPH4eGRc0ZGNZI7IsIgd1WtwPARMJt032cVE0W74BM6Pb+LJZKBAbfABTUUDw/EXPjwtHG7vH7YECgJbBcF6FqjexPy/u//KbSaVS1IvnSuvl676WjWbCA6z/bOV2IR6jPlfBDYYBWqMsJDEE5MvsUCkT+P/CH5y4LwAquqH0bXcuUVg20zIBwN2Fei7Mt039IpSK/EuQdMMGr6cctopolq2LzxrdOVc9pXnjJ9cm6IALLaFc0jZsgA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806c8d6a-3cd8-4a49-fbff-08d83d2ee63d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 13:11:31.6935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CdTBvQBaGdLlW+rx9pTS+eHbbWS0VkJ4hoGa8as/oUa/FhMnaeRKIwvc41Po6K5qlpRTgJF7UV8fcEco3LD6pIOsJitbd5b4/oZ+WGp5JA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------F3E7B8DEF52F3B59907C9031"
Content-Language: en-US

--------------F3E7B8DEF52F3B59907C9031
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/8/20 1:04 PM, Khem Raj wrote:
> From: Shlomi Vaknin <shlomi.39sd@gmail.com>
>
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-traitlets_4.3.3.bb          | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb b/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
> new file mode 100644
> index 0000000000..edfb3abfaf
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Traitlets Python config system"
> +HOMEPAGE = "http://ipython.org"
> +AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
> +
> +PYPI_PACKAGE = "traitlets"
> +
> +SRC_URI[md5sum] = "3a4f263af65d3d79f1c279f0247077ef"
> +SRC_URI[sha256sum] = "d023ee369ddd2763310e4c3eae1ff649689440d4ae59d7485eb4cfbbe3e359f7"
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-ipython-genutils \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-decorator \
> +"
> +
> +inherit setuptools3 pypi
>
> 

--------------F3E7B8DEF52F3B59907C9031
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/8/20 1:04 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200808170407.2326879-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>

Signed-off-by: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200808170407.2326879-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-traitlets_4.3.3.bb          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb b/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
new file mode 100644
index 0000000000..edfb3abfaf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = &quot;Traitlets Python config system&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://ipython.org">&quot;http://ipython.org&quot;</a>
+AUTHOR = &quot;IPython Development Team <a class="moz-txt-link-rfc2396E" href="mailto:ipython-dev@scipy.org">&lt;ipython-dev@scipy.org&gt;</a>&quot;
+LICENSE = &quot;BSD&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46">&quot;file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46&quot;</a>
+
+PYPI_PACKAGE = &quot;traitlets&quot;
+
+SRC_URI[md5sum] = &quot;3a4f263af65d3d79f1c279f0247077ef&quot;
+SRC_URI[sha256sum] = &quot;d023ee369ddd2763310e4c3eae1ff649689440d4ae59d7485eb4cfbbe3e359f7&quot;
+
+RDEPENDS_${PN} = &quot;\
+    ${PYTHON_PN}-ipython-genutils \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-decorator \
+&quot;
+
+inherit setuptools3 pypi
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F3E7B8DEF52F3B59907C9031--
