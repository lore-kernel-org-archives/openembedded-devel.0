Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.82])
 by mx.groups.io with SMTP id smtpd.web11.9179.1591887075761505856
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 07:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FAtwwbwk;
 spf=pass (domain: windriver.com, ip: 40.107.244.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNhZqPcPZtkEESPMvkmAfsvklG3vQI0OJdKBpAnuYBvDVzrO+1y1bE0W5K4xgHi9rPgLuDqnsdHhA39AddPrCJ9ixmd2OxkJsIZH8ZVrMdtEx48uPS7lE0CynU9WS6eyHm/cR3Zwpok1X7jWMYUvBY7BvylEx5ehzPRxq5g4792t3akcKk23By2NaC8ZP1+oD91vI1OJ8vYWUMUJF74m5InsiS3DH34s4tttXFqtntF6MmQc3NeLauwQSgShmxFIquuP/U6K2oo8Zbfpv9ganI1CElqKq7+xH0tMLqEm0/6RfNgXpZ9H/WDFO8YGZuOD2FA8aVtvp4LK1e6yfCRIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W47m1ZayHkhMS4/utVRt8QCyrlcKQOc4jd6hiIys8ug=;
 b=WuoG7LYoG+/E/M1LOwipQqyemiJDSS22ctzf32FpL4+cxv3ociOjGMxhOn7knDopCyqRP3eVLuVFaMoBiemRGSDye93Uz7HiDF7VRqJ3Mqejd2f5lhSadKDSS5bDJEkhoEC4LUvM0SSBSGwGV11ary1VH0FDKTzOS3d7TGTn2gYPmbTR+BPs2/fK6psM+ohT7JnOpARt3TINPtoKFpBn4j77oibfZ2nDE5HanJDYW4ltbzB5FB+jNiI8OYOQLrtPkNRMKiUQew1/GL34HHNi5q2dUcmAX/n8YAYSSQYG5Ra+AI5OBlYKc/ZnrYS9varQZLtjIYtAV5rDMYESK0tZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W47m1ZayHkhMS4/utVRt8QCyrlcKQOc4jd6hiIys8ug=;
 b=FAtwwbwklmM1eFJvXKoN3pDoeQJPWKCYmq9UEzv4x6VoPuCT+QOrB2cEvzqaLzDpiVF9wo5QqyqYBtoaoZVn4Tq42haNDt8DF20Bn7RMKbHxG1fU4bdbVDq9yCCHhuzFNEiLRVIPHSp7xJ7xO4DPitZSkaH9VcXMWTfoLWRfZJ8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 11 Jun
 2020 14:51:12 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 14:51:12 +0000
Subject: Re: [oe][meta-python][PATCH V2] python-django: set CVE_PRODUCT to be django
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20200611060741.24132-1-Qi.Chen@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <03f30e5e-4ae4-7bdd-1c42-74e695d39de7@windriver.com>
Date: Thu, 11 Jun 2020 10:51:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200611060741.24132-1-Qi.Chen@windriver.com>
X-ClientProxiedBy: BY3PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:a03:255::8) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by BY3PR10CA0003.namprd10.prod.outlook.com (2603:10b6:a03:255::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 14:51:11 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c656d40-4694-4784-b1a7-08d80e16e23e
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3954E4B5BFBDC412AD50294F9F800@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZCkRzrEF00V4HuFsnp0/z+uVRbAU5nTFsGmxMI9+iZODmEYoPaU4Td8KNzSqtoYhbh+M1kopzB2AkTZ0g1VVr0PlCBvQTlrtKpYX9G6z3cGw4/CYdvjxvp0ysZ1isih7LXRSUxW9slRUS6RIIYYLRAbwfy2d0IX9TsjEeGyzKRIQFElxuCfLf8CUCzWFh6Yv+uWYvMQuCjlKP9vTnylde3+p9o24VRc86leeazbndWqKOFrVFyd10zxAkigmVwGRES4Gbccg3MgZ4LXdtPJZLqeZqeM5GOR5JhL/YXGitwaO46iRDXGu2GbnvzXVuBUxSj5/QTEXVFQOC+Nt256jzXrLeOTuMsqNzvMZJ8DGDs9D2VhkBYwoFFkDWmQfWpirGs2kPObL+9FfqjZvQBiEPqrsyK16bQMYBi+9Q2HY8k+KXbP6dqoXK8IgL/T0FFSloj+Fw6Ky/4yMdUkMGu18Jg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(956004)(2616005)(186003)(16576012)(5660300002)(16526019)(316002)(2906002)(36756003)(33964004)(52116002)(6486002)(44832011)(8676002)(6666004)(53546011)(26005)(8936002)(166002)(66946007)(478600001)(966005)(31686004)(31696002)(83380400001)(86362001)(66556008)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	euKDG+CyMmHQwosxYuZw1IKEtn5KIHXBBlRjb1ehkxBL1JzlFYndUFp9ABIMpmMtiCkiVXBadoPZ7fqzJlUeououwydOCgnWGOdovG/OAL/IGe353FKvV+jP5WeyAK1rGguMetY7g6tIJTAqVfEoRB6XMqJjzi3QXXHnyib6rCiVK93Jxx4AyJEis8H2MQyjqiClprU7lmUFP0qSZf4h3Dso2R4/B3395ASf3JCM6xMA1JxNsrXFCUkStHLz/iqbVasqYS419774vf2rghsOKeiQ13uAgRJtwkovIG9fx9ZNXNQqLfVOXrQeH2WRA3ATsZrbCn3stfDkOdUvxXGnFrATsnw7pHBNt29kohEaNJZgQ7a8o4Dk7Q6D8MzRyYUBMrd2/6BXgFDwXRO2/l6sWc64y0pxBH5ott+EGSOWg0/xXalU3hVFGOVozKKk8SjCagyxjtPea0Jy0fDQa+vstwwV8k26oZ85ujB7Lw8l9sbmWnE6//x0H2veiHXriSlt
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c656d40-4694-4784-b1a7-08d80e16e23e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 14:51:12.2223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJJBlXJG9fF5lROf5gi9q5UBU9D661MFJVfPt2mdL4879T1IU3N5vMQXgpHC1Z0bNm25jZzTqfrM3vsqMxu7hhVKg4WllRV34d95PLXg7jI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------E79D17F25307055FACFAD9DA"
Content-Language: en-US

--------------E79D17F25307055FACFAD9DA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/20 2:07 AM, Chen Qi wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python-django.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
> index 73b7ac99f..c02b3fa52 100644
> --- a/meta-python/recipes-devtools/python/python-django.inc
> +++ b/meta-python/recipes-devtools/python/python-django.inc
> @@ -30,3 +30,5 @@ RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-xml \
>       ${PYTHON_PN}-distutils \
>   "
> +
> +CVE_PRODUCT = "django"
This still looks off - it won't apply for me. I don't see distutils in 
the RDEPENDS list in my version of the .inc file. Can you double-check?
>
> 

--------------E79D17F25307055FACFAD9DA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 2:07 AM, Chen Qi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200611060741.24132-1-Qi.Chen@windriver.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
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
    This still looks off - it won't apply for me. I don't see distutils
    in the RDEPENDS list in my version of the .inc file. Can you
    double-check?<br>
    <blockquote type="cite" cite="mid:20200611060741.24132-1-Qi.Chen@windriver.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E79D17F25307055FACFAD9DA--
