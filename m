Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.87])
 by mx.groups.io with SMTP id smtpd.web10.9189.1591887212279718092
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 07:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C/O8+whu;
 spf=pass (domain: windriver.com, ip: 40.107.244.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRbE+lSUTWReIw5OudHJbj+Os++wgLMxwkr6wggUfI/YO/+aqMxheo5Hi/zr/M30vLUAVAcP9NfXowdRskbz/0nhwKs+4IxqQi5oOQMPzV3bKg6SDokgqk+qp3qPD1KD3E1j5xepFmdTuya/Q4NkPrBVmxE46VcAFdUQThzyOMCt4SgppG5VYdHU1TKG8a+bUFiMxc3yIpYPYTwi9d4NJiqa+6/1kd0gERwGH9J6OY/8L2tmdpdyXv7B642I6f9UbHkvMaflKXXQg31uml90Zt3XVjQSNQezL9T+pOOIJcYD8GR168fRcpwzEQUOL/YmzcOpShpZXI/WGw9Yi9dOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfCoLu1lqUhkEvXB1fNjELMFJSTDyVDtzwEbKFsGPlk=;
 b=VnmFlYQyA6u02mtwD8oN77WWuZYmDKbpFoaFnWn9Jg5jjMCBlqu0TUU2CgVvHa+BfnDy08v7A3gZ5DHEAaI6JwLwRZvpcGLb6XQU+CqcHgOjWdy/AVmxeRU/3EFi409cvdogwes4dhaAuadLjQLUAnRitnSBTN2ncwoUjIigVZX1lxjOPg/KFum8o4F6JGUQgBymALtYjxoNR9eTR18qmkejlM7STKJYsT5ieUqxkk/sU4YmVhrjPdO3yU9kCWolBJRYRboYcY849SbWn5tl9fyN8rC0L3srFLVvqvdPN1NCU8mHQnwCWFqmpJ3JnWz0f1vOE6lmzljL/hxAwB1hfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfCoLu1lqUhkEvXB1fNjELMFJSTDyVDtzwEbKFsGPlk=;
 b=C/O8+whuTuFpNLn8dcQ9SYuV1QryHvXHgJpsqQVwWWk31jBrBL83eSTx/FpQ/jhe/kWdHMuLxbKFmTzFklbrVo7zIZvrQOCey3jXZEacG/lPZWWhBrKGp36leAWoXBhwfnycF7dHTid5YSDvBzBlcYYkrG+z6Q3PFR4DZoDQk1w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 11 Jun
 2020 14:53:31 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 14:53:31 +0000
Subject: Re: [oe][meta-python][PATCH V2] python-django: set CVE_PRODUCT to be django
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20200611060741.24132-1-Qi.Chen@windriver.com>
 <161784DC9FF68DAF.3794@lists.openembedded.org>
Message-ID: <1df86a15-d48e-790d-351e-802abf10cdf9@windriver.com>
Date: Thu, 11 Jun 2020 10:53:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <161784DC9FF68DAF.3794@lists.openembedded.org>
X-ClientProxiedBy: BYAPR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:74::47) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by BYAPR05CA0070.namprd05.prod.outlook.com (2603:10b6:a03:74::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.9 via Frontend Transport; Thu, 11 Jun 2020 14:53:29 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d3b5515-92b7-45f9-207b-08d80e1734c2
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3954805BF8FC8FCC381F14319F800@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cdLBgQVn/25XoewUYQomkvueN7642tceDuYa5mBopSVhy18cztqPfOHzqPLZzNZQcIge9ZKJyvBSf5bfqOSVdiuoY7UZpAtAaRUTuG3vXkSjp02i4143DCCuI2r26UrlgaK1W8PnzRII0xKfVmTX6RbieH5iIlNQVXmgTilwxGLrbLQNhToFQH2FTjxNgydLoYo1jsrOFNoeqy7POQjpA3r+Dy/GjmXnNTlxvo2eoAKRu5w4/azMxW4nB32QU+vxCEk12SKRszvt75+INss/x9du/fQY39ImCCYsEmwYoQIHBjRQxfxvxsef9sKysNWwVlIFEAHNDi3kjb6Pg/aT965NPt0aNb8uS591FgDhqWGHtk78S8c1vY+jNK0Xd/8KV+g8pIx/Gr0WbklsH7YyZpnuYC2nzFvHwb6gW89gW7PiKIVatB/Ayic+mYlu3h4pWrdaOLx6Cb1j8UJZ5AfMqg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(956004)(2616005)(186003)(16576012)(5660300002)(16526019)(316002)(2906002)(36756003)(33964004)(52116002)(6486002)(44832011)(8676002)(6666004)(53546011)(26005)(8936002)(166002)(66946007)(478600001)(966005)(31686004)(31696002)(83380400001)(86362001)(66556008)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jBd108u8ojPPFOj5cox+iJBfOQjVhUkMrbfISDxAvnuJuNyJ2eqSM5ZWvWpcL8K2NpAJHojNwgs93AvRm/XZJF+ur5TwTefGhs6vi/bpYAL6YYWLckqptJsTSiUpPr730cbr37eiaymGAXIPm8h1jjAAPI5LwZZXvdFUHDw59tcStkt04tTuBz7q+LyhSs9hMWbAkf/eOdGf8Rz+34+ZAHrHmykrGDe8Gm7ozgz/2r686UFFtbfSRPKWJWZ5ZbLf62fNl1aWnZvH2Imd6+mdirhPaM4/J+lXE7s8BzjtVKnDHQFPP4qKEW4Ifc5b4VNSZdSveEDI/xR3I9Q63dCzAo5cXULAVE8fKxh2gTPAER+0puESBgnjCkJ474Fw70mCKeIhEUlzbfW7nQcB+joU9t/x6OoWygZZuMMQMhQbteh1lWrmEHtYSamfGa8/7SqYSz+2IWywUopafjss0RnF/S3Jm3A+JvbxkQE7lEPX0WBjKcmy+GqxwEP4+cAV6PzZ
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3b5515-92b7-45f9-207b-08d80e1734c2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 14:53:30.8947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdp76d+F95HpdVHJayJhcAarAHvhCUNYeTBARs0fnsoHuA3pGbBBf9rWOYlbA+Dx5zdWsQa7T026NnIc09dkjiIgvB8apYgKmyZzRNcBcM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------5168DF8B60B6D6E3A0071F7D"
Content-Language: en-US

--------------5168DF8B60B6D6E3A0071F7D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/20 10:51 AM, Trevor Gamblin wrote:
>
>
> On 6/11/20 2:07 AM, Chen Qi wrote:
>> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
>> ---
>>   meta-python/recipes-devtools/python/python-django.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
>> index 73b7ac99f..c02b3fa52 100644
>> --- a/meta-python/recipes-devtools/python/python-django.inc
>> +++ b/meta-python/recipes-devtools/python/python-django.inc
>> @@ -30,3 +30,5 @@ RDEPENDS_${PN} += "\
>>       ${PYTHON_PN}-xml \
>>       ${PYTHON_PN}-distutils \
>>   "
>> +
>> +CVE_PRODUCT = "django"
> This still looks off - it won't apply for me. I don't see distutils in 
> the RDEPENDS list in my version of the .inc file. Can you double-check?
My mistake. It's on my queue now.
>>
>
> 

--------------5168DF8B60B6D6E3A0071F7D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 10:51 AM, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:161784DC9FF68DAF.3794@lists.openembedded.org">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 6/11/20 2:07 AM, Chen Qi wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20200611060741.24132-1-Qi.Chen@windriver.com">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com" moz-do-not-send="true">&lt;Qi.Chen@windriver.com&gt;</a>
---
 meta-python/recipes-devtools/python/python-django.inc | 2 &#43;&#43;
 1 file changed, 2 insertions(&#43;)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 73b7ac99f..c02b3fa52 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python-django.inc
@@ -30,3 &#43;30,5 @@ RDEPENDS_${PN} &#43;= &quot;\
     ${PYTHON_PN}-xml \
     ${PYTHON_PN}-distutils \
 &quot;
&#43;
&#43;CVE_PRODUCT = &quot;django&quot;</pre>
      </blockquote>
      This still looks off - it won't apply for me. I don't see
      distutils in the RDEPENDS list in my version of the .inc file. Can
      you double-check?<br>
    </blockquote>
    My mistake. It's on my queue now.<br>
    <blockquote type="cite" cite="mid:161784DC9FF68DAF.3794@lists.openembedded.org">
      <blockquote type="cite" cite="mid:20200611060741.24132-1-Qi.Chen@windriver.com"> <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5168DF8B60B6D6E3A0071F7D--
