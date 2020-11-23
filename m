Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.55])
 by mx.groups.io with SMTP id smtpd.web11.42347.1606165005472079856
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=p335io7v;
 spf=pass (domain: windriver.com, ip: 40.107.237.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxAsCLpNLdFyU8T7zPTDLX5wHKFTDkA3IDDmKThuV+cKi56ujbHtowkwgSFeTEKF1zLki0kSprvuhH5K/0Nqwp4srMuRbgcHNyRCF//XUQ6nVCPzokAruODZEIQjt/unuIR4bxSwwjuE8/LBqTOVMLsm+W2P6YVhjXa/PdpH5SjXZUvwNnSsz3Y6GSlwxMsxrzLcZ7C9qit5gkAlpL2ykSeaJmSDQDMvsO4xS43OZt2876tiUZ8/YIq0C+lKRUoHmycaJI/scazhdvtWf2rhVGI3UQqynU6pG10tjCqUxB93ZBw8U4OJiHDfyqDXxQ6vtzogEBK8C2DXsGIv4wvRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyzB+2VnV4FECMc2HtbrBfCJS7feogn64ihAga6sdjc=;
 b=QGcguOqsnavBR2pwNjntbwAUlQc9tO0ZBKzqBP4zRUVz0n8YhOZ+b66kx/cGSr8H8jd+vw8CFQc2Cgp1NuwaaiggDwB5CQP504l02Bpf5WSUOPEaO3pZj4WBk6woE2VtT8IYsU0UVzW7zxBiGfv26NCUj5xnXkHpgGHVkWeohLTgFelNi+p9z5XYdUlxDMd62s2TceS9TIO6jOsOzNomF5g7hTXQwC8RCHS7BpVypjMH7zIIGHA/FCSvGlhD/FiDwQis2icttjLRjNvZNzJEyAmpr8LRgqxixqYXr4iKYhlH9kdJWpfcu6y7q6jNUcrEXo+bwKI/gGiUEUT6TP8p6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyzB+2VnV4FECMc2HtbrBfCJS7feogn64ihAga6sdjc=;
 b=p335io7viRSS3lEyQqOoClA1l+nhYeHj5vh2RjlGBBOETVUN24mduajkuZz4lVQyiZpOPn0XH0zvszFL1DpEM9at+Yn/Hghk3QlOZOmOpaf2YlBZKvgHsqlQ9rkO9MjMh9FIAK717GDr+XKXmVT/Oa4Pfaf+3IeanYlz8RCLP8Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2678.namprd11.prod.outlook.com (2603:10b6:a02:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Mon, 23 Nov
 2020 20:56:44 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:56:43 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-gmqtt: Upgrade 0.6.7 -> 0.6.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201118140220.29364-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <04b4cdf7-18a0-beea-349b-feab4530e6b7@windriver.com>
Date: Mon, 23 Nov 2020 15:56:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201118140220.29364-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:56:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a22a45f-3614-4b9f-8c09-08d88ff24894
X-MS-TrafficTypeDiagnostic: BYAPR11MB2678:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26785762E98FC2067F311FCA9FFC0@BYAPR11MB2678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OEQI8xrzcemJ9vyDdrCRan4eunU++q5udCBbphjk713GieuRLh9pCTQINTHBt5hyYXVYQMmUJRt1T5U+ZdjDoUDEk6pvbhWedMMBqf7vg2uE8bqNGL9Oiyd+JsWLVv+yKFa4tu8AnsVnwst4s9e3LY2XKV7/3jizafrKMS5WVbAbrSkLZQN9dJc/nV5rhy1jhlnUJPJEMkYdE9trlWa0Tost6021QNIV5AEj92FUhOTjSBQi/Il7ipjm0MOO8oZzNc5jI6pQNufKBvi51beDWx+84rLmgbt1NhNmYlKsCE0Rvg5L9wFPm982KHsWT9V3wDOGtoQwIkAAhvc5d56a8sA/L2axW3MX9FWvFDjP7P62T9ZQe1AC6C6vwGsQ/uQ9X9c2u1UVEhoOlmbuoqpwBILnY8IGw47gAxStg74Dg1iI8rVmVL5rfCnzJtHQxudYvRqh8zFrvyCL/NOSVU8UsQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(2906002)(8676002)(16576012)(8936002)(83380400001)(186003)(86362001)(36756003)(26005)(66946007)(166002)(53546011)(16526019)(316002)(31696002)(6486002)(478600001)(33964004)(31686004)(66556008)(66476007)(44832011)(956004)(2616005)(966005)(5660300002)(4001150100001)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4+Y+wLnQSDx8nVlTr925bq/jvioutU2PNBE/kKSkf90L1XR0o55fROlBG+aAe1H+d1Ut0g56YNdvw9wEX3Don4LxRFmsYyoMBflNYTZtcLGtoYQKc2OC7tbXiQKcuru+DcebHEcLzoF39YuCK04ly24Xejcj6J2dNAWQwjtK+lz1otzG+TejNQMmU2V4zuXf7eaGvygRFLbOIL2j5uq51/2DtvkbgOqgPteaMz2B3FwvpMALqf2VbmM56rtRi22vig+FPVjWUgTb0GnBopjJ09s9BB4+zG2oUfRqnLK/Cry4HuFP3eDbWnNRsNt2HHzHx6l7BkkfmmSB5pavZNa1XzCoBtpsR8VOnQOWfKgeeWA7c1Ir5z+fzfnPKDXSBHNJJ6GVr7ikMPoD0RSyPSFUYsAfoUIZsWXYq/f7QWhB4h09EBwX6gnq6XW4cwdA8ACadngxvgUIPQtvbOfWEcwxqdXiJRYlGxesnUDO7EmYd8QJRyxIDFemTt3QeypdssS0vSgDSVrE3DMLwccP6TsZO/JpLUa3W6ISbQqh4MdQjmGH8nR8p6+Q5WTnkmumTEsayzpqacGLSbiHZNr0V7jUKuYJ6LpSCX+6EjVXBOwQGGxTDT1/XdJkBtsqczIbxj9A21kUeoA4Ax1qVTHUPCok8FeTXoTigzNfbtvjy52Xc3UI+svh3riUWd6G07OlQEaUsdv0F3Syi4pS0ct5nU+yUDdSEDWU+tXF0ZI/4rmXrXBBrRs/WSWbIenS7IcnYpcOwYXf5QdK1r+RFe1ny+7jjJyABa7lxxIj7J+4hvBs4fCF7d7tztUmL1b7MYV/z63E5rT/QMj90UQ/PMZAQ2AuLOzveobSDCRRGLzQ6AZoXj0xy9vPxnEUz4z0+iAYlHR07KSqA9XfqSerz/Eh/Bv3Sg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a22a45f-3614-4b9f-8c09-08d88ff24894
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:56:43.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+rj2Po9DDGtWRKONdAt//+X/8OMrfMpech2VFn/Bbo5gWe5UJkyJdJJa9XvuD179zDDjW/cNh3A0GTwfyuyDhLx2vM1TDOcUEkAUbLLXi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2678
Content-Type: multipart/alternative;
 boundary="------------640CBF720685EB109A5FEAA7"
Content-Language: en-US

--------------640CBF720685EB109A5FEAA7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-18 9:02 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.6.8:
>
> - Fix encode str to bytes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-gmqtt_0.6.7.bb => python3-gmqtt_0.6.8.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.7.bb => python3-gmqtt_0.6.8.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
> index 70527e026c..6219d20093 100644
> --- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
>
> -SRC_URI[md5sum] = "9e26fec7d5b64afab63d6d82faacc208"
> -SRC_URI[sha256sum] = "86b3679de400b8068dfadf871ce063a7040ed5052d30cc323aed69430888b422"
> +SRC_URI[md5sum] = "8745f3b576e5247310276f0ef5c32f65"
> +SRC_URI[sha256sum] = "1285c428a5faf4c6aaac1e2ccb876383b4c7e087ef34ff7edb9f549a78cdebf1"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------640CBF720685EB109A5FEAA7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-18 9:02 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201118140220.29364-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.6.8:

- Fix encode str to bytes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201118140220.29364-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-gmqtt_0.6.7.bb =&gt; python3-gmqtt_0.6.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.7.bb =&gt; python3-gmqtt_0.6.8.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
index 70527e026c..6219d20093 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/wialon/gmqtt">&quot;https://github.com/wialon/gmqtt&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=903f1792621a3b35ee546da75d139177">&quot;file://LICENSE;md5=903f1792621a3b35ee546da75d139177&quot;</a>

-SRC_URI[md5sum] = &quot;9e26fec7d5b64afab63d6d82faacc208&quot;
-SRC_URI[sha256sum] = &quot;86b3679de400b8068dfadf871ce063a7040ed5052d30cc323aed69430888b422&quot;
+SRC_URI[md5sum] = &quot;8745f3b576e5247310276f0ef5c32f65&quot;
+SRC_URI[sha256sum] = &quot;1285c428a5faf4c6aaac1e2ccb876383b4c7e087ef34ff7edb9f549a78cdebf1&quot;

 inherit pypi setuptools3

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------640CBF720685EB109A5FEAA7--
