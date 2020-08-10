Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.75])
 by mx.groups.io with SMTP id smtpd.web11.44482.1597065163045965794
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 06:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cQQTXHTQ;
 spf=pass (domain: windriver.com, ip: 40.107.237.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nugl18E14qedRLuovLDe9aE0B1+ceyyOmdQ+i1INHEJ9oAxEy75K7kFkyYbOmhWmzNJ5td+dFdGThLP64J8NY1+U6YgjshEIagucCqPP/xZ/5Asptzl0FgMnmygGBvTgztMsoJ8e95NZleIkWXgKPqpcjYvPuXPCmY2le/xoOjrJoR47CxkmlXwn2RyeFkTfLEdtCwVi4gIl6OfRO6Bq5qRkAWZ6fNUu6W/0C85IQr/eRQQ/AmdcvJWx5Q5VZhOCUzxEzZLw8vBtWKErV74e7n0KSNM/nLaFiZFVMkDtB+JcIjiiTTfQq+/UHCyn/pHiUqrA7DoOTKPtrdnvDcFGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JEcQO+QChM8iAATXjdCy2XA2R37uOqiJFIt4ADRd8c=;
 b=cdIAgXCRh7LnujbmNndWu0rVQgxQE3jq3EbIZbUtK5HUlsPPQFy/6PiDedDrLhGPuCXpq2eckKVkle4X/fyaJy2jOJ5yMe1wLF0fovvKfcrbRrRIwfELPMoVheOf0Reet39tYG1VDPP9aCUeP2kO69aNU+hopE1CR5Pz/bV3PsM8oPaI7mRJbO7w2D938DsqwaAJbUGvTynCXTuQQoKZDcBW1MAElYnX2hXK+4E5Br/7Yk7+zXmJ0P9RrWCKurs3/8iIB7BnEriGl97VV5MVCGAEKZgwAgaip5PBwyB5iPd7vSJIXaCfI73DoCgNoP5sz8Wmuy6yU0dhLAks05cWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JEcQO+QChM8iAATXjdCy2XA2R37uOqiJFIt4ADRd8c=;
 b=cQQTXHTQKbRXwYDu0JS/vnf51t3nUOV2djQ8VfBK39YMBkMCXjzwmCsDKrZgMRqFB/OT+ShxwV3VZLBj9irZIH0u2VAkx89pL3ZI/Jkk/+xbIl/eN8EC9wFp/rKmA3F40m4ejeBU5vf9oC4lYal+WiR1H4iHN8Yd0B6jPAHV2qs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 13:12:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 13:12:41 +0000
Subject: Re: [oe] [meta-python][ 9/9] prompt-toolkit: fix recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
 <20200808170407.2326879-9-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6274c2ef-cc28-22f7-c017-cb2b7420afb4@windriver.com>
Date: Mon, 10 Aug 2020 09:12:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200808170407.2326879-9-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Mon, 10 Aug 2020 13:12:40 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1cabe32-c6e8-4fa0-f99e-08d83d2f0ff9
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226449F7345119DE4A8127E9F440@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1xBw/CspRE23LpOrDXTcnNetlv2eEw0GFII21hbK24DvWrrZC/i4IM1LPxxLZkZnx+ZG5yLbyZ6oYY7RdJEHpZtPfIiodUINnjPSZPohZHsvxxJr49WGUimQVDx+UgaXq+emTYlGpN3kau2PXlR1fkR3OvQlxHvg0/Xar+TC7GYb7SmWF8n/IRcWbMsU3lBrq8QqMtpJ6ySojdrZSEUZdB8ltEa9u/8wfctXgDuS0ca/5hv227g1HqgEEP2YKvT8doJgahUgeRAEmhEb19w07j82ux0HNSbo4fTlRhO400Uwow1MRxo+cTec4kYlvlfKkX2mMnaOy8gpQeJ2ruoAJuyB84t2enbt5tsJ2aNqT7v5xgFIWKb8JapVG0DdqFnRlqlVCgNLc5/Hbe2NBWtifYkxgMHwXGsqimlodR6DhHCx1ThGoy/HZzTrwNM0D4B2aM8573A6IrwY0GlMJ5xbYQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(366004)(376002)(39850400004)(26005)(186003)(16576012)(5660300002)(16526019)(316002)(86362001)(66476007)(966005)(8936002)(31696002)(52116002)(6486002)(33964004)(36756003)(8676002)(2906002)(53546011)(31686004)(66946007)(83380400001)(956004)(478600001)(4326008)(166002)(66556008)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	o8stKqIAbjQ70le6JwDmUvtI5QwSBlQi3Jeet8UkQHT1ed67QS9mYkUFzGRla/O7rz0qx+L8dpN5AGacf4TqQ20Awb2Lz709Sc+0MkEVlh4NOmt5y8kK3WgNEct/NGW6A5jST3AHe9dAvXsfWvq1R05Gh6cLJzJ4hEEu0xgyc4DnjMc9Ni1cih2jJcF2O4CTRn58T6oNNHmW4yEseuzDJ+WXySRaCmPPCV8Av+Zp/YTwF+QHaqw2PNIGu1gr9Cj6s4/AHHfcOQ/LSFdIZ8BN947/NhNuXcQxkMiD+FRH6veP7ZJjPhcDW/L360jd+zBorGruikCcn0JuBwf/b1Hmb8S9pOvgMrEF9zwmFfBEme+gycTz5X9wdZguItVAri7sK9UvSyNgYY2SvU0pp3uR3zWuI9vo26Gqomd9nuqNS9Bk352E3X5WRL433RJbgi2k56Re4bE/xHyjbPqGaTeqQ2UJgFviNfF5HPzCK9+DISl8jjT+vLjqS+gMfV7oJtWVvPkCUYtvDMEPq34SjRjRKRYfKyE/JtGg55e5ZodrnXY6ZlVW6g1PsMqWuUc14aFaSY3fBJWLdat/8cQCGeGbXdjGEaF319ohlum875GTAGEJqriv5RgeszhbYMR7mQC0ON9TGO/heOAgl6EdGMWXLQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cabe32-c6e8-4fa0-f99e-08d83d2f0ff9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 13:12:41.6741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTrMShSxCUTTSbVHlQgRZR9WXilDsMnqRk+7UIWosKaDD637wRnuLk1+sdn5aKOmCYWni0L1imi5gKyIOLJNYVuMvch/uG4uE0QA1PPD5/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------4E75867547F76F01D719725B"
Content-Language: en-US

--------------4E75867547F76F01D719725B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/8/20 1:04 PM, Khem Raj wrote:
> From: Shlomi Vaknin <shlomi.39sd@gmail.com>
>
> Add python3-image to rdepends since it import colorsys
>
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb      | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
> index b4d20c2cd7..78fdbca4f2 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
> @@ -18,6 +18,7 @@ RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-wcwidth \
>       ${PYTHON_PN}-datetime \
>       ${PYTHON_PN}-shell \
> +    ${PYTHON_PN}-image \
>   "
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------4E75867547F76F01D719725B
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
    <blockquote type="cite" cite="mid:20200808170407.2326879-9-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>

Add python3-image to rdepends since it import colorsys

Signed-off-by: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200808170407.2326879-9-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
index b4d20c2cd7..78fdbca4f2 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
@@ -18,6 +18,7 @@ RDEPENDS_${PN} += &quot; \
     ${PYTHON_PN}-wcwidth \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-image \
 &quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4E75867547F76F01D719725B--
