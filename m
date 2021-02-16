Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.88])
 by mx.groups.io with SMTP id smtpd.web09.7293.1613480221383664390
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 04:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jqPIV8be;
 spf=pass (domain: windriver.com, ip: 40.107.70.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJj3LSczNPm8UwbNZCeWKr4Mio4O1IMyowXdnb7NOTUO6Q0SsI2aiDZD41+UcWxG9K7WtGBIneeOxukMY2kJI1PR718nl1GKpZz/4z3rqXTUp9ghhM5bK9uESprdVyx7ZVQjba3up7kXPe6PepB40LOMOGNYlFVnsM8JIeMxPf/9P6QOk3IS2xT9xmZV1sXLdSE9vgKHFLqASKlJJPQJgCt/m2oelD35F6y6VBkD475gGeYRguGastv2okv7vozQhAjoZKmOrdRDGrMhgsiuC1WlgDlJ+vWMshDht+9FYeiTk+/IH0e7RJU0scMRQbcT2mMmTwvdzlbarsETPFgqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmRQMqnEx3W/Tqa/NOzdlphP6Zh6TFbTC0ZfnZQuu/o=;
 b=Ml7jfhTMluCMygNuFkzw+ygh8njsdbAELYHZkeGuocEXH0QRIz/4dQwENmXmi/KUsFS/DQ3n5pupd81IgMy+mPWSlH97v0rwLuZ2nH1Wy2M+b9GU7d3WG24E1RmsRH0lT4NUApLap2bcYT+kT22pME69RlJimdoa3NYTklZCAdBTjCfMsiX0e1jpA0sUiMXTNFRw7QXRgm/w6/kr9qDvsdYR2zRtf/sc8f8kWLhgzCX8+c49E0PH3PmQtVKK+ilmvR8VJ8Uka/xbo0Poe368M+/4H37ParbrGY2TPYHHtqqkNSpDzZfPVVXM2wI8GY0Kfwi8lTk8uIsrs5SVvnF1wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmRQMqnEx3W/Tqa/NOzdlphP6Zh6TFbTC0ZfnZQuu/o=;
 b=jqPIV8beRIRJ5XFUWvzNaO9t/HG4qR7rX4j+LZHMJj02YclzqARq+PmbqGlCDXDmJZ/+1EOnOKRuE1jA3hHQH5Q7UlBUoyJTn3VqHsWVDBndvros07pZduhopBMxMzSOOJnCtmNF0CBiJXb4JjvT0g0YgucxZ8eCAxaxg+iurpw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4418.namprd11.prod.outlook.com (2603:10b6:a03:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 12:57:00 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:57:00 +0000
Subject: Re: [oe] [meta-python[PATCH] python3-pykickstart: update to 3.32
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210211000524.1922826-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <39b20d8d-ba6d-425e-6e2a-77991ab7bc8a@windriver.com>
Date: Tue, 16 Feb 2021 07:56:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210211000524.1922826-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:91::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:91::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12 via Frontend Transport; Tue, 16 Feb 2021 12:56:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6fd9215-268c-4f7d-15b5-08d8d27a592a
X-MS-TrafficTypeDiagnostic: BY5PR11MB4418:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB441819C8BB5B6D181CC04EAD9F879@BY5PR11MB4418.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gn+Q+pgZcgX+DKPoz/ECami8j7L+EojjxtQgiNh9Zl/7MlhhmevvcQMCty/Dgc//uUDZubQfnCb28/hpMpjdtqYduGKH4iVk3Xqt5wJ47hjgMApi7Ff2fZ56h/4aSr8gUiMHMXB5QDu+rj3YbsueQuCW0UhIeCAN3WeF2hHUuVPLY6Rc1ZAwbvNO8bFawUiXS+d486+FZjjMGdyr2sr+4gkce4C9tYRzTWybh9OujpFacl75TTCECz2jDa5rLf3WrA4iU0jkZpnNd+NrJjNTtAERHdE2gO8hgxcN8vcZq70wHcQYd88zG1gYw9+zfTmnu5Vn97VnCFnIRQLui54S+sPmj89Mqw8dhxd5nglqntysQPjAa1DbNiR2WZT+3oRH5EW6QYZX+VaX0awhVuZS9JV6EsdYwHLlk/sKLFBtsFhT4PSuE2YlwBDHSEierNsV6CnGRKnw+jIMUERrv3AvPZxpRclX6so7TTPGNNAtab9gpFo8MxGfMCQvZXenZjLll8OQY0NKWteLWJg8Mrc7ABaS2gEu9OZkJao2ptLPW+8mWuFEHeNhmCvAHDS1EVraBaifvObpvVbYM4y2jHOlQtEs2JKZ2egW/FhVKRRtpT8vWy2/7VWuSpjGB7c6lPCKMQdaJqSXgMIw9BVbvgWy0ukiqPjRXeW2Hm8YUzM4D3DbkLehVDXDb9DumVcCgUoy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(366004)(83380400001)(44832011)(2906002)(2616005)(186003)(478600001)(86362001)(33964004)(53546011)(31696002)(6486002)(52116002)(36756003)(31686004)(16526019)(8676002)(316002)(16576012)(8936002)(66556008)(66476007)(166002)(26005)(66946007)(966005)(5660300002)(956004)(15650500001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VjJTVUZpb2ZGd0FNbkFlcjI0OUI1c0RnUHE3SkdoMG1zVWI1Rnc2UVhSbk5M?=
 =?utf-8?B?WkFtVk9JaUEwRkJTcGpBMEQ3RFV4UVl4dEgwemlCM3ViNHlpd0tYZy9wMWYy?=
 =?utf-8?B?bVJ6bEk5cTFNdmZjaFlrcHJRZmk0bXRTNk1PdGsxaGU3RVlHYUdXZ1RVMWFX?=
 =?utf-8?B?WlYxdHV0Uk0wcG1YSVZDbGFiZnhITVN4N3JnN0haUmtlY21UZjNLNlBwVm51?=
 =?utf-8?B?SnRZMzhoaDZnQnFxbGhlcU1jYzhzY0pxYUExN3RiR290cmFscEFtc3ZjRGs0?=
 =?utf-8?B?WDFNUWkvNk4zQ0NVaTlTcHo2ZU5DYlNrR212SGs4ZnF2Vm81TWRKWjlxVk5a?=
 =?utf-8?B?RnRlczNSaXpkd2VUOVB0bnVXdSs0NTljcEFuRzE4UWUwQWZQbkZzQWdJQnp3?=
 =?utf-8?B?aWpKWjFaUCt4N3hPVEpRbXQ4aEExdnBUZk9UMXdZWUk5dHlEWGZnekkvelhH?=
 =?utf-8?B?cy9VWXQ2L2VKVytBVElVWTh4RGxycFh5MHU5VGZHMGJJM1UwcnhrdDQ1WmlK?=
 =?utf-8?B?MWYzaDdGc29Gb0cray8vM01VNDRWVEtuVjJIUy8xUUl2OEVJdkU4NzgvUkc0?=
 =?utf-8?B?Q1JvZ0g3eWZjakp0aG5lSTNTczdtUHNPajRsOW1lek8vcGlhQUI5dnBZclNx?=
 =?utf-8?B?UjR3dU16OXI4SUNwQnhBSGdnbTBkSUlWcytmNEJzZlhYbjIzczIxNnNtZ1hn?=
 =?utf-8?B?WVV2TzYrV1lwa3N4bGdQYVlNOEYwNzg5M2pqNHJBbmR6Umhic3RmLzFBbTNh?=
 =?utf-8?B?bkpHbkRqeG9maC9VQXlRdmYyRzBLZmJMVDZyL0hTQklLS2FvMmlUcmF0TCtI?=
 =?utf-8?B?eDI2OStuQzRhZkZWYXFWdjFUMDM1UFB3ejlZVVRvV0gyUXlKWHJ0bUQ3RDFj?=
 =?utf-8?B?Yk15VGdzU0xiSjZqa2RpSzMvcTE0K3lxTTZBT2FsdVo3NFpPS3d0YTFVd0Y4?=
 =?utf-8?B?cmdNUFEzRVVIOVBUbWwvbUJWd3Q3MzJaT0VEK0VFVmtOZVhnZkNmdlNYRk5C?=
 =?utf-8?B?SzFXeXU4LytsZU5lYlBONURZa1N4dDNwSFkyLzdsYzhpdE1ScXZwdDFKM2Vl?=
 =?utf-8?B?bVhreVhMUFl0YWE1VXZpTkZZbm8rdGs5dDV2bCtod3RuRzVJKzRSTFVaWnBz?=
 =?utf-8?B?UlozS3dPYUlYK3F2bkQ2NExydm00U3J1eUxnSnV2OFdkR2hTMnFKdlR0eG1w?=
 =?utf-8?B?akdWTytDdCtJUlB4a2FBcUpwWmkyRVpNYUJiOE9MRWpaZGNlQkhmZVBBMnZx?=
 =?utf-8?B?RDRyejJXWEhqVDVpRlcxRlZialVnVGVQc1NRWndxR0RsTGZ0L0tUb25yZUpq?=
 =?utf-8?B?WFhqejVzZFJETmx2akx5bGl3OVFhQjlVaDJDOGs4Yk0wbFZaUGw3dzh6ZXBF?=
 =?utf-8?B?Yyt4RHZ5YkdzaTlJNHBteVg4UnBLN3JtdGdSOXo2dnN0ZW9aWEpDejd3MzNW?=
 =?utf-8?B?ajVsUHh4RDRQd2c0Q1FZVHM1cGhoSDBQRUtaMi8xMUNyZGZQaXBaOHVqTDBC?=
 =?utf-8?B?dDErblZycHp5clpsRVp0SGlzT3g2UWI0REF5Tml2MUxIVlptMmJiQUtsRHlF?=
 =?utf-8?B?VXN2NkhLTmhyWFBJdGt3V28yWVB1VU9xZUN6b0tDdEtxK3pUM2xrQWpuREhv?=
 =?utf-8?B?TmNGNHdxMm9od3lIY1JISkdPVEFHbi9HMVRQU0FSOE82aXhGWVI3MzFGd01P?=
 =?utf-8?B?aVpudXZvUGIvRHdjQ0U0U2xzRFhSdnd4YVZuVkZ5Y2Y0NXdoSHUxL1JLeWhh?=
 =?utf-8?Q?8fT40fixw+7lXd58wyDsG3iJ9fvsoWUklgF+DJU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fd9215-268c-4f7d-15b5-08d8d27a592a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 12:56:59.8887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1Q9sDfKJNxO03Iyc6Pp/O33V9cq6zYhB0YT7PJFLiT/jFA693mckPHQ0w/f02IQcmaFe7MVA55fHckvvWz486WYXDqFLefPADbePbScty4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4418
Content-Type: multipart/alternative;
 boundary="------------FF4A3A929DAA5286233742D8"
Content-Language: en-US

--------------FF4A3A929DAA5286233742D8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-10 7:05 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pykickstart_3.26.bb => python3-pykickstart_3.32.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.26.bb => python3-pykickstart_3.32.bb} (94%)
>
> diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
> similarity index 94%
> rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
> rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
> index 7aeb5d6c9..62d2729dc 100644
> --- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
> +++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
> @@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
>              file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
>              file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
>              "
> -SRCREV = "4c93e84c8798da511da1c05f1912d2f908f8f85f"
> +SRCREV = "c56a5fbdd4079b187b21787f072ccc83dc09c28c"
>
>   UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
>
> --
> 2.25.1
>
>
> 
>

--------------FF4A3A929DAA5286233742D8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-10 7:05 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210211000524.1922826-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210211000524.1922826-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pykickstart_3.26.bb =&gt; python3-pykickstart_3.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.26.bb =&gt; python3-pykickstart_3.32.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
index 7aeb5d6c9..62d2729dc 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
@@ -18,7 +18,7 @@ SRC_URI = &quot;git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            <a class="moz-txt-link-freetext" href="file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch">file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0004-load.py-retry-to-invoke-request-with-timeout.patch">file://0004-load.py-retry-to-invoke-request-with-timeout.patch</a> \
            &quot;
-SRCREV = &quot;4c93e84c8798da511da1c05f1912d2f908f8f85f&quot;
+SRCREV = &quot;c56a5fbdd4079b187b21787f072ccc83dc09c28c&quot;

 UPSTREAM_CHECK_GITTAGREGEX = &quot;r(?P&lt;pver&gt;\d+(\.\d+)+(-\d+)*)&quot;

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

--------------FF4A3A929DAA5286233742D8--
