Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.72])
 by mx.groups.io with SMTP id smtpd.web10.2966.1591818640096021590
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WVJk4/IA;
 spf=pass (domain: windriver.com, ip: 40.107.93.72, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqqcoEU1N6i7EFyxpYFn67vMQSVhzrFLXVTFYYcE+gVQTVeL9iiaCpyJ6msI811BvWiZHhsZlm9aLWVOufLup8ZW+JsuqeVcbZvK52DoZrb5Am1N5jvYXWLRss7KN94WnzihbAdcirkhdGoMBMxqQKET4Koyk/MDPzkQt1QYYkf8QfmeGfcASWJMo/HjChoqQJlCQ+j5wt5z4MR8GT4RY39zoyNeNIf4C+Rzn6ofyq5QexhOYPTw02DCrizrex1i7OziYisI8nIApSNsutGeO9ruu2AFiXY7WsYZkFTHirP17tDn63bNwctVzyknSsNLYbwuXq1EheEqFFFN3bFloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDRnTL9/4MqNpoDQn5Ya8nta30/LMJe4JwJpgtDREwQ=;
 b=KcsBKylfdSXT9Zp/OJzCmoD2sAxjOxA2kMdlA6VtPPE9wyQ5n4pjfxovtoEnet7CXRSgOszSr3cI9ihdoxurH+1879aC3S6JH4dy7RHUDPnEtVqCruycr9Y3ceN8ADPFdVTKF0AJ9u+9fARww9aXAOXlo2PL33rwCGGvCaFUH3sVD7q/+imk6B3eM0yvG/7r9iVHatnNFHuUSx48VZ5ZDyEtQNDlQwJz4+gGudBC9kycACVgx8JrgmemsZ2an4nLz/H4uPVBt+ueEQeA4GNCf+udoM1yZMOep/KoORRyWQQjs3BTpZqHBLt50lS6qEar/g+FYCKseNlf6y9UlVgchw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDRnTL9/4MqNpoDQn5Ya8nta30/LMJe4JwJpgtDREwQ=;
 b=WVJk4/IAUnun6+Kmu+TLHeDL04ZAyJl7K7PuT5e21R5vyxr/DJjiI0TybPDckXiGFsLqWwq3hsN/rEswoqzYakDCWa1PnwSvU/68ysLRZbust3vhBwNeyaGu/G0jSW9v7fgoF/iuS4Dav5kVtQ0bWXJryZtOkgvWIQ0KAm/Y6OM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3924.namprd11.prod.outlook.com (2603:10b6:405:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 19:50:38 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:50:36 +0000
Subject: Re: [oe] [PATCH 1/2] python-django: add RDEPENDS
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609061806.310291-1-changqing.li@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0eadb331-f181-9d48-aae6-a0cac6d1eb79@windriver.com>
Date: Wed, 10 Jun 2020 15:50:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609061806.310291-1-changqing.li@windriver.com>
X-ClientProxiedBy: YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::40) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 19:50:34 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5587981d-6ae4-4e37-b463-08d80d778a65
X-MS-TrafficTypeDiagnostic: BN6PR11MB3924:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3924578116F29A6C6E2DA27A9F830@BN6PR11MB3924.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mltMQp0toEhswZaCcVXWhA/2cdUuWBKVUlMRGR8f//bodvzKyGzTl0ZH2YjBoYr+B0NXNVCFoYYl5Ck4+9FxcsK05DC4WloCXxsWCPJbE5bQBzJ448xiGqAgLS5ezfkVPjlDn4MBZX8CxOCyAE3wVgA/mC1wPGWg6DB58vb4Z4ba8Ma7J97wru+brrERCjeKAuIShnnebtljSq5b/TLfZEvzA9chBRD+UoVdFxf8d7IPOuNPQRKRJaW8Dxzxd+hmrpbB8nekJcWqeFJdz69RPewy5ixho1qqFbhSs4uGxNS+qnD4jV3hopywNrX0bu3gQCDEOmA2giYa1sUOvfTu+I+7mhZKXEPARLh2rvrJkaKDZW3zMmccvEvnGQJgj45ng2h7UU2fQ7k00Ey4BsX0P90/nuZZEuHJQKZUPkJwuLzWYX1QA1+zOFwtcfniWgSUigAy+JG5B1EUBbUvgKX29A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(39850400004)(136003)(366004)(376002)(316002)(6486002)(8936002)(16576012)(166002)(2616005)(956004)(31696002)(86362001)(31686004)(44832011)(83380400001)(966005)(66946007)(66556008)(5660300002)(53546011)(8676002)(16526019)(66476007)(36756003)(2906002)(478600001)(33964004)(186003)(52116002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	H/CxL22rH9LBU0YcxGBMUJQz5/z899CqC8sJYqmQt8+AUrbkv7t6tPBNh/559Op7nUakM0TgkTHgnwzvlCLIdcQViZPQU3FsKO/IVmjZp6xNhiSS7dy+sUafeedQnH+ZfljKy/m5PeB/r6cYDJJqr9/WXB7oS4dcO6SVWu/mdzW6aAMq6bxiVK9FpNeOEJFUw9XT4N/oMurHTxyArKFc6+8X9ExyEvnr8Qt29B9mVPCFZGTSa7+i3IKso4rWvR7tVXoOezpjDdfghJkbg9WMoahCwDPSo9ZvsgxniGtDr2yit7KffvZoWovdFH9C1BLiVnoJ5a8B5F5Iy48E82ttBU2dHiuQL9yzSdhgLbqqimm5MOzy6F3EVa7ft7H0Vv+0PGi744BURhQHT6u85dEBn2hbPRR16SLDTruLak4jBBJ8nRYZbZNakoIUtO4paEXFHDQDODkz/2dkpJzqdcsaT0dkPuuhrOLYNFnw6ZeZFCDvJIiR82eDtjGTcC3o3aaB
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5587981d-6ae4-4e37-b463-08d80d778a65
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:50:35.7059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CjoShCMAaOX96gNBYKl5Hap/X4Nn0RMq+Rs4AG6Ru9WikO8f/WlBPIa7BYlTcp678OXhDaCkg+qrSH1G9oA6YkQ/Fn+dGR8WdjW4oVzVFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3924
Content-Type: multipart/alternative;
 boundary="------------574B33FF742606E3FBF7B026"
Content-Language: en-US

--------------574B33FF742606E3FBF7B026
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 2:18 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> fix error:
> ModuleNotFoundError: No module named 'distutils'
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python-django.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
> index 54c77c827..73b7ac99f 100644
> --- a/meta-python/recipes-devtools/python/python-django.inc
> +++ b/meta-python/recipes-devtools/python/python-django.inc
> @@ -28,4 +28,5 @@ RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-threading \
>       ${PYTHON_PN}-unixadmin \
>       ${PYTHON_PN}-xml \
> +    ${PYTHON_PN}-distutils \
>   "
>
> 

--------------574B33FF742606E3FBF7B026
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 2:18 AM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609061806.310291-1-changqing.li@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200609061806.310291-1-changqing.li@windriver.com">
      <pre class="moz-quote-pre" wrap="">

fix error:
ModuleNotFoundError: No module named 'distutils'

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-python/recipes-devtools/python/python-django.inc | 1 &#43;
 1 file changed, 1 insertion(&#43;)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 54c77c827..73b7ac99f 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python-django.inc
@@ -28,4 &#43;28,5 @@ RDEPENDS_${PN} &#43;= &quot;\
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
     ${PYTHON_PN}-xml \
&#43;    ${PYTHON_PN}-distutils \
 &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------574B33FF742606E3FBF7B026--
