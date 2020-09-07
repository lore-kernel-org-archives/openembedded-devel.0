Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.50])
 by mx.groups.io with SMTP id smtpd.web12.521.1599494983235611254
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=d0c5hbWE;
 spf=pass (domain: windriver.com, ip: 40.107.76.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h42m/HWgEuMfNhvk1oTSvL1mT6dQnOEVx7K7L0BSun7RuIPfps6zi4DePZcabN8Z2FlXaY2h0rbl37K7891iV63wr3hS63o64S35k2GyCzsN0bIu7wnbMJcH2MXjyVBLEXA0Z5l2JLwhi/kEeyA7fHpyd/0pNnD2TGnCV1fHKG8gnwSgqjsbLZkWoLdruFzBjCsu8B+JmL/DGwQT2Ss+NZtMK1F09kVyNZRjtiKNaBZucuv4+GxiRctJdoxDjza2I6e/AOORSFHzrZ/cGaUsMGue3A1ZknqjXESmwj7MCgzRHCHNVnN+SOzcsOwKMg2mamnUbwqSXD800uqBWM+ytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4h2TqHr2feNms/FvtYHkrBiZXAFduE+/NJj54ZnfYM=;
 b=XuD97Yvj80t6hAEbvAtIpI6O8snyRC7uFKqwtNGuPfgd9M+r4qY25if3JZpsGBtnwKjFiyFelT7fDiyDb/5bS/1aEhop28Iqrqq9L1l2a8d8ocl9AAcJrVV34I3gbkdkDRKZtDAGNlKPRoOdVWcLvQF7oYaRTlIE/X0HH/iiO0bqxFd0/YLKyjAK+nuc9rISvLuJReMBqrhSLgPnSXDqXknXHg2UBLTlcCYqXf/21AIbm4XpIq7RTTgQRbICb1maPqs1quvk0q95Wz59jkasrFhijpD417xRlKvw70jtv2pseaIdFkuT5ynVZFwNS5d8gCUBv3gM137bYLKXtcLL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4h2TqHr2feNms/FvtYHkrBiZXAFduE+/NJj54ZnfYM=;
 b=d0c5hbWEOi6saKvyoPNkRGNeCfKRlCQ1pPuqiDvEuL4utC2fJ+obsosQqreaaw3TGuuBDI3qaiyD0w5GjBARWS6pZe8WP94magN0U/faRPeFwS0ExZBQmM1gFFA184fmVfiVMYgEeuZ+wS82mTK0ZEHplyHiI86Y7VFCbSmeoNw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 7 Sep
 2020 16:09:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 16:09:41 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-ruamel-yaml: Upgrade 0.16.10 -> 0.16.11
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e7a20775-9855-a587-7fb8-afada8288aab@windriver.com>
Date: Mon, 7 Sep 2020 12:09:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200904134713.13164-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Mon, 7 Sep 2020 16:09:40 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45b86641-405e-45a8-3e06-08d853486d32
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3671C8E4C75752EC99D770FC9F280@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WJSV/RGG5tdBClpl70DP3c5ciXAGT9OtqKwXzQEAAK31Fl24SEnovo5SRIRfA1ttJqBaPXbOaPatfD5GCvl27Q7FOEyg96ZiE5z9AvO/1qg8wuEl2OUD6pxxkphlnpU5ZH+RzgFqDztZh8qZzeYO0pdJeWIq8mzyHL+ktVuGDmVbtLj/bfiEZshll6mKPV+O9PyOxkr6rE3heDfB/hfa8kG02wEuDewoNhx3p1cH0tQ5gZNok9wwT2Cgq+v6UlhMU+zvdEhI5nEmZSA9bNuyPFHQQJlN45kNmU6COLXhqHb+XlU7H5uByipL1bdd0RivVAGhaPqvGJJFjouIDS12BTm2GV9Wfb6sjBe7W3PP/KViEF3xN/WmwTV0hu/UUxAbDwrpYUhj01NPfvuyURULnMk557EPBTC02EGAPMGEeGj2EqHZuaNAms1Ul1qxz1B8htH7NW5BhjH/AvvKnxaAzQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(478600001)(66476007)(2906002)(186003)(8936002)(66946007)(44832011)(16526019)(86362001)(31686004)(66556008)(966005)(6486002)(53546011)(33964004)(31696002)(52116002)(26005)(5660300002)(16576012)(316002)(2616005)(8676002)(83380400001)(36756003)(166002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	aEgGwpB0CiquvICkkfmNLbM1Q/YDDTSRwc1jMJptPmsNbLgUI0vjB8FR+NRiLdearD/HPf175NJRxjXFHIoCHx9sA+KSo2NPL55xLPb5vIn6Xwuu/q2M7nt667luq7CBFv7D1v3NTO2U+ymZ2RVMWIJ0jbWqc//VFu88Da/IfPXqCsdTX3Is1qX/vaR2v017PpWMmIg9nrA7q/9xeZ2bOzPP5c8/IpjN6MxngzqeXLJa6AsKU1JyhO5QVZF/htaxiC6PRdZCASmvDfiZ1J9L3AFuNjmIajkLgR5SVeSIP7gdUWkl1s1YAhxwcyyfmEKNDwHvlDTSyfr4G6deqW8egpib69HOhfiCKPyTZcO/LpKhR8jybFWvZ5Pv/cKNi1vG3b2Fl1+2HHIlOQyPxlAHUC5qV/S0sAmSwzn8c+dVg/X4oz3ze+Id39HbsgHsLg79mqVDffiQTgn3mGwgsa4OOa71L6JjrvZKVqpAl525ITMXNLlrAkbEdS6e8S1O9mE/7WslZQHcAFboxFHkf7mbgzKpEIBHayCgGEKs7sB1emaSW8pjXLQYdDhunV8gVJEs3/Gwej6HqhBqPB7zbfsIeePfPvojMnxivh7EDvGF7ou2idAA+hP0aLII4curm+oMdg984S3F/NYPsuD0ApLkhA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b86641-405e-45a8-3e06-08d853486d32
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 16:09:40.9853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVyGmNXU5SNcGFXrRssLFPx24eCSrZcPG6ewko1WsUiX5UHST2TMKmEfaXYdRfc26mt61SZEIykuwATnamt8SY1wjWDgURs5atvBSUgidtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: multipart/alternative;
 boundary="------------01C98FD38D6F1B5B0C896996"
Content-Language: en-US

--------------01C98FD38D6F1B5B0C896996
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/20 9:47 AM, Leon Anavi wrote:
> Upgrade to release 0.16.11:
>
> - workaround issue with setuptools 0.50 and importing pip
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-ruamel-yaml_0.16.10.bb => python3-ruamel-yaml_0.16.11.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.10.bb => python3-ruamel-yaml_0.16.11.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
> rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
> index 076721a09..9b3a2e1d9 100644
> --- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
> +++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
> @@ -8,8 +8,8 @@ PYPI_PACKAGE = "ruamel.yaml"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "02774e7ed3273b3d8eee6c08326b91c4"
> -SRC_URI[sha256sum] = "099c644a778bf72ffa00524f78dd0b6476bca94a1da344130f4bf3381ce5b954"
> +SRC_URI[md5sum] = "020a0140d06b2e32f53944d4335f9877"
> +SRC_URI[sha256sum] = "43bf19037937f78845775d84582dd6f3ac966bc1b7748de898fad35638c74771"
>   
>   do_install_prepend() {
>       export RUAMEL_NO_PIP_INSTALL_CHECK=1
>
> 

--------------01C98FD38D6F1B5B0C896996
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/4/20 9:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200904134713.13164-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.16.11:

- workaround issue with setuptools 0.50 and importing pip

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200904134713.13164-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-ruamel-yaml_0.16.10.bb =&gt; python3-ruamel-yaml_0.16.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.10.bb =&gt; python3-ruamel-yaml_0.16.11.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
index 076721a09..9b3a2e1d9 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
@@ -8,8 +8,8 @@ PYPI_PACKAGE = &quot;ruamel.yaml&quot;
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;02774e7ed3273b3d8eee6c08326b91c4&quot;
-SRC_URI[sha256sum] = &quot;099c644a778bf72ffa00524f78dd0b6476bca94a1da344130f4bf3381ce5b954&quot;
+SRC_URI[md5sum] = &quot;020a0140d06b2e32f53944d4335f9877&quot;
+SRC_URI[sha256sum] = &quot;43bf19037937f78845775d84582dd6f3ac966bc1b7748de898fad35638c74771&quot;
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------01C98FD38D6F1B5B0C896996--
