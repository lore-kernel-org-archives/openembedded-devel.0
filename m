Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.88])
 by mx.groups.io with SMTP id smtpd.web11.60716.1594050113244074888
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WHXLXotx;
 spf=pass (domain: windriver.com, ip: 40.107.69.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BplY8FUhRndzvR0FQLFLFF1d6zJ1epAUV2+tztUAaF4cVbgd+QNkLi7Dusp3pJ55JKPnyaCCcnpV9tWJcieFXGPEOh8/B13oqp+5oMDmgI1iaShEjr/3wkjOp//MuH654VEukFjFWoxqJS9LbAHBqJuhSzhRHZYbpcfc+xcfRMvyvusz9HtN7UCAu/hb/JkhwgazOo6CDLnPCeABS8MW1ha7L3q9aAzRJzXdcbFrl8C5H/i3xOsHIbTFftwGFB8ZKChPxXfNXHTFCntY81XdIew41hIDoH1TZNJf+i19WuWgYovGmPuSYkRkph/9lpKcJwThc5gpJHvGdM8wOy5kqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RELptmhKNf6UXk604KQr9LoAfcbJNUJtL1aEr6xwvtw=;
 b=P6g/mWhLWOIx9RkNBjQslMYPDONsszX98D6DN0VZkbRXr5HpOzDzC/gfaTHIHn8FqnlAUqNkzH37R7KCYF+jHN19NaHpp0KS87LCOD5HGY+lDmv0FQCf89TKKhiWW/GQV8GErncMpSZxhZtg47dd4frksGUqUE+XanWEPVXfFShhn19+/VX36zYd0d2cWzcCzETyXw2Iehju/yvltcUASEwdQDKaXFNj1ZrE2CjHHJ7uiisRpL5G1EWDmq2HuAQrADJM71+IeFJM2HUzACrsv1Bh1FEdLqc2PaTUQo6uQeQPTv3bgBvNl/jb1fM/foziS7cWnfC3WMRj/NMzrvVHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RELptmhKNf6UXk604KQr9LoAfcbJNUJtL1aEr6xwvtw=;
 b=WHXLXotx7wCp57fmYaJxjUIBOkvP9ni8SfZY/8igWpWV1vINshEwlVztDYkxwzTn8xYS9EMHBqtf/Io47R/Wir4s0NthCqNcQf36RHrAJnbM5A1NrZ+JXRWcQWqvMCzjrqta11ZlTLP0xMdRpebnBXG0Do49uz0Qw5boG6jS8sE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3273.namprd11.prod.outlook.com (2603:10b6:5:56::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24; Mon, 6 Jul 2020 15:41:50 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:41:50 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-pint: Upgrade 0.13 -> 0.14
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200702104819.14256-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <38405622-f6cd-f678-75dc-e0d80da00c00@windriver.com>
Date: Mon, 6 Jul 2020 11:41:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200702104819.14256-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::33) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0154.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:41:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39186427-4f35-472a-74e4-08d821c319b8
X-MS-TrafficTypeDiagnostic: DM6PR11MB3273:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3273C2412D1F2EAA944058759F690@DM6PR11MB3273.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cVGV5HIsxSHySr4xP0xDNMlSCj18Axa03U86CVC5mIryGNICuvDhbHUPmnbrR4EIheah49pVjyafXPVLc7JEKy4lTFwyp17pF9ZC0lH8WT4NUX6Hu6vFfNmDYRAWloAwZ1QPA5q38g4U6ygnBRmhaFQmLA4FTEyoi8zXyqSiMZjlSVexrgglVLJJgvdplqyzD14ySvrOfSzBY8ETa4374ulvsoVJER0HGapeTJAYWUGGhhgLagntW+TMChiwz9We8gQ+UCyFJWxWdgx5O0P4OoBc9t/mANBrm4n3B12HdK7tIjeWWjudUc6Ch5QTT9cnBz/Hl8A6LDP9ewXnoTz876oXXBzij2nqEoUDMdvOu1n7RetSc9wZRfaRINvK6lFyjxSElS2EAAKb22vFyQwX4I/H/9MNkEg9gdH63yFzwVySci8h8BzXObv+Ojcv/AXvrwUTNiNQtGKEqbsfzbgyMg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(376002)(39850400004)(346002)(366004)(26005)(86362001)(5660300002)(966005)(6486002)(31696002)(186003)(166002)(8936002)(956004)(16526019)(2906002)(2616005)(31686004)(316002)(16576012)(8676002)(66946007)(83380400001)(53546011)(44832011)(33964004)(478600001)(66476007)(66556008)(52116002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Sa/Jkt1w0sT+OpJcnXTsTYty5Fx6dcHlKGfV3iF5BCQHzCSJ6VbnBzaV7e2nEDMmWglbOGYkgzSPQkmmxqMlmZJeTkyo+eCac/jkPIzrMo5nawtdVVyCtjZ5lgKFnGudNm7Fy/2UMQnbsJ9GauSF+48Jas/HBVJgzvxcKkG1z8hAK6cbtj4xN2qY4lTLNbOgnJqi4Jtl91uKFB/fMjYnEfmdXc1i/uZr2G+NhK+ZW2SaGXDFl/ve5DoyAvos/dtGvPtv6Uz6LAt4cm6QlStKsDg4I8HeqGU9ranzNmMv7xnW0yMhVolRmvXtAQzd3KLOpsfL0AdloQM3n2PbaU45sCi0LRH49lg16ABxzz6vcL/e2nAEFkFxfBl/ti5COj8EBCq9Kk96hPracUQNpCQ2p5b10V2F6yL+GaiGvx4g7/Tw11iXHoJ321nFOWArTbc1i2ASsI/IOy/W3lkWfvfIa1xvUeqBHccUAdeitvEp/J+jfIjxhGTrFicQrJfDaAQU
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39186427-4f35-472a-74e4-08d821c319b8
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:41:50.7972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5Py9iq58KJZ1O/dI78YpQTI/JHzB+LIotdTBYpKurgQCRd/C4MZuOKCKzgQDsqmbPrkjL2O3DkkCCCH1GUcUHcDTvJzMcTGI+S86cB2eTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3273
Content-Type: multipart/alternative;
 boundary="------------67552F471DD9DA62CED488CF"
Content-Language: en-US

--------------67552F471DD9DA62CED488CF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/20 6:48 AM, Leon Anavi wrote:
> Upgrade to release 0.14:
>
> - Changes required to support Pint-Pandas 0.1
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pint_0.13.bb => python3-pint_0.14.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pint_0.13.bb => python3-pint_0.14.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.13.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-pint_0.13.bb
> rename to meta-python/recipes-devtools/python/python3-pint_0.14.bb
> index 9a081baba..8e1630476 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.13.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> @@ -10,8 +10,8 @@ PYPI_PACKAGE := "Pint"
>   
>   inherit pypi ptest setuptools3
>   
> -SRC_URI[md5sum] = "6e60d42736f8175a57119aecc383fe4b"
> -SRC_URI[sha256sum] = "13fa35ffa3ddf53161b4304917085687950e0de461bcdd4d65cdee11a43d7fb2"
> +SRC_URI[md5sum] = "e5e409806bc82f518230117b30ae23ed"
> +SRC_URI[sha256sum] = "9aa450ebb9d722ed03fa9a450104cfd16c479b49f862d547c6f77320de597f72"
>   
>   DEPENDS += "python3-setuptools-scm-native"
>   
>
> 

--------------67552F471DD9DA62CED488CF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/2/20 6:48 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200702104819.14256-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.14:

- Changes required to support Pint-Pandas 0.1

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200702104819.14256-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pint_0.13.bb =&gt; python3-pint_0.14.bb}     | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.13.bb =&gt; python3-pint_0.14.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.13.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pint_0.13.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.14.bb
index 9a081baba..8e1630476 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.13.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
@@ -10,8 &#43;10,8 @@ PYPI_PACKAGE := &quot;Pint&quot;
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = &quot;6e60d42736f8175a57119aecc383fe4b&quot;
-SRC_URI[sha256sum] = &quot;13fa35ffa3ddf53161b4304917085687950e0de461bcdd4d65cdee11a43d7fb2&quot;
&#43;SRC_URI[md5sum] = &quot;e5e409806bc82f518230117b30ae23ed&quot;
&#43;SRC_URI[sha256sum] = &quot;9aa450ebb9d722ed03fa9a450104cfd16c479b49f862d547c6f77320de597f72&quot;
 
 DEPENDS &#43;= &quot;python3-setuptools-scm-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------67552F471DD9DA62CED488CF--
