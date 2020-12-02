Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.43])
 by mx.groups.io with SMTP id smtpd.web08.5236.1606918160093485837
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lKV6G7E2;
 spf=pass (domain: windriver.com, ip: 40.107.102.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4eiHozjLMLKkbXaLHve+DSkLM8t0v2IuSY47B+JOejaMJvrdywQn25C1gokC+HwwepklTegHYBXcP9W2uzDGM/ftpCcaoN8Tj15Dekcms1EXZPO6l8CvLYoded77kIgj1WZt4uILkrtdEU8Bruq8AJreYEfIC7ZeL70dNS9oZeqwhZuzj4UfhwEf6d2pRS1JWD7JIxcsqi7oRm6fZhFlItCb/ABO0GZjBIf7kHaqU+k7mEOYsRfdmoSd20ZOrNuobNTGybZiRl7lFIbd0ThCtXWH90vrWFiBMjJkNhhLOuHvpLPbjWQYIPDKLGwMQiGani35h37qU3mrzY0lx+6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU9ESCua0CmtLtTpcb+tG2Fq3XKc8pKFXFmQFVlQsNA=;
 b=WFZ5BAd6XhuxyuXJSekwHvCImPe3tIo3uRkQ7VeCE6xcWrV9kB2/m/yVKJRMlB1f00UPt5PD4G1vDjbVyWUrPgnCMdzNJneONfJGT7WMgM2XMaZlCDRjwCzwzl+CsbeIh88kgxlupzSFbik2MYW0wRldCkmUpUba74BEeXSH7rQIwewC/22On0cnuJgPKd1Yyu00Fy0St5QCtyPlY8kdDz//3ZZMCF1jZPJTvBCiukQa/TYCqcKL5YkHIu4WlO3RIKGqC+U3WcGhRQiDpwbCTeIpJvs/YaQsgE2wcE5pWvNVBF3n+NCuo0CV5jMCmjxrzZzoGHfZyEZse2f5Am8qeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU9ESCua0CmtLtTpcb+tG2Fq3XKc8pKFXFmQFVlQsNA=;
 b=lKV6G7E2lzesKuli1Y8rT41H6EoTQHOiL84tOVaXyf2OqQGRUC0StU276xzrYu/t6H6TQ8rlO/JWVrJsip9sQQP20H0l+QhOO59lSZH0U9z6buLeCBDlLDi+UcJ4KB/hlMhWLRfQxd8qV+GgdqVkcafQjTJ3mKM48nygpJ149H4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:09:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:09:18 +0000
Subject: Re: [oe] [meta-python][PATCH 02/16] python3-attrs: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <59b5a3ab900d3864ab071bc6826b2abb26e87612.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1573f839-419c-d658-43bf-ca70622804d6@windriver.com>
Date: Wed, 2 Dec 2020 09:09:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <59b5a3ab900d3864ab071bc6826b2abb26e87612.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:09:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c1d147f-23a5-4e1b-1882-08d896cbdbaf
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB486471B9FCFA771B2F4CDE5D9FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EFWlF+4HQLEKe1MUFWvzCGUxaSc/GxiCGU9gAZrY28lhPz1MZN5HgI1caiasn4oSpR9cGtT+44/CmHWJh7Ob9UVNynVLZVUWs0pjs5z1DqWOXSrGa1iQx7h0OAis+MBUgFrS4unl5YizUnj9ipfRceffkwmvkIspUWBhasK49f9t3hkqLCSxT2+OSaDIQw16Pq4G2JqfnL3VEa42ZBtMLLjybW6GQKdlxrov9aOgiACV106DAfmP77dqhXZwrRhW21JMg7DYgyoMCGQevF4LO52TCa6/niYjg9obLombkjHWpagoUyT0Xy3HEBC1jkvuBHLw+8UuUpkxHhC2zQO+oPKMiIMjQ4r5w+W+WIJbvF70TZXUBkykPTIa8woy60BksF/Sd75mM7tKJ6bVk+laeaSKChP3ChDKyhWFVYVLtJdZuHk+HoFAc4+6SFW+sFxpxbQay0EwZVeRIe/fvc/aSBddb/RVYC89M02F+Acnfr3uoMbOajRB8LdEeG8v7hX5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39850400004)(2906002)(2616005)(26005)(83380400001)(31696002)(16526019)(66556008)(966005)(478600001)(66946007)(31686004)(66476007)(186003)(5660300002)(8936002)(33964004)(4001150100001)(52116002)(956004)(8676002)(53546011)(16576012)(316002)(166002)(36756003)(86362001)(6486002)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?d0haV3ZzRkVDTndIWmZhOWFWMVFDQnhoOXpEaWZOMEZ0bGs3NWRVYnZORWV5?=
 =?utf-8?B?Y2pQNWZldi9wRmdhTE1kZkQ3UVQ1dG1rbklWZ2pWN2d0eVhpL3Vtbmo1T1U2?=
 =?utf-8?B?cXpLQWRzSkx2bkRaaHVTYXc4U1lBbzdzNnc3bzRBNUZ0RGJKMTFvMnd2YlhR?=
 =?utf-8?B?a091SUEvUHAralFnbFZoR1ExOEYwOENZTU54enRNdXo0bGNjcnIzS08va2RM?=
 =?utf-8?B?RkJxYmxjZzVJbkF2MzgxRnlLNWk2c1dQbWZ4WU9NN3dNWnUrdHlkK1Y2bUxQ?=
 =?utf-8?B?dzRMeTVhdExPOUNsNHdzTVZhL0hFWXJOWlowaTM2OWZ6Qm0rTzMySitEZ09X?=
 =?utf-8?B?d0k1YkczWHp4MDlSbDR5Vys2YTZGUGdDb3M3UmZrbHZzdXc1Ukh6QVZYVm11?=
 =?utf-8?B?L21pNjJHZzA2dlJ2MHREcFg3cFpZc3dxZjVVeUcrZzZBMmpGemJvY2d0R002?=
 =?utf-8?B?UWYyNUpmK3pXQUZUMmgzQXFwU3F6SkJ3RXpvbm53eGZWSzBkS1pCeVY3ZEhQ?=
 =?utf-8?B?S3ByTEZQTGlaL3c5enFxbjRVT3B5TkttcTBlSE1rNGlMOHBob1FEN2N0eGdJ?=
 =?utf-8?B?UkdyZ0NiQkY2cFdCMzQ2MmFBeGh5Nm54cTNPTjE1YVcrcUI0aHlzS3BuVXZx?=
 =?utf-8?B?NkYxUUdFSVhaSnpETUF4cThjcFRpSlJaaFBvSVRBM201S3FrY3lSOXp4dWdD?=
 =?utf-8?B?SmtRY1dmeXFZQ3ZGYVlvRXFVaDk5QXFRTnpqQUdvQ2NOQUJtVjlHM25MRGg5?=
 =?utf-8?B?UlR4U2V2eFVFOC8vSXhUOWFTYml6RlZ4bGxsVDFBUW44ZEVhV0JYcEdxUm1p?=
 =?utf-8?B?ZitPa0F6WjlieHdqZ1ZDUWZQazE2S0FRbHdwNGUwa2ZlbTJ2R2xnMU9XTkVG?=
 =?utf-8?B?Q3hYMDdQcys3VW5LT3NaNkJ1cW51T2tucnRQbE9xTHNRZnVKbFZXL3FtdEZt?=
 =?utf-8?B?QnF3M3pUeFgwU0NtUlFaeGgydlZ0U0FjOVBydDFOUjNXS1RKNzcvc3lOaDha?=
 =?utf-8?B?aHo3b2EzQW54bDUyOVBZT0tWdjNGV0Nna0FvTEZkUXI0RllHUjNtZVlFRFdK?=
 =?utf-8?B?cVVZZ0tEUVpLZXVsNVNWSURkbFVUK1IyWEE4RjlML25RMmNMRVBaR0EwOUhV?=
 =?utf-8?B?WVNOck5BM0NrLzRObEdtZTlxYldSeWVMVFEydWhWR25RNHFITithK3lBcTNU?=
 =?utf-8?B?QTZ5S3BjV3Z4ZzRDY1pSc3ZLYkoxYjBZL3hTd0NBejBIblFSTnYyUnBpTE41?=
 =?utf-8?B?ZzYvUjhYY2Z0UVFJUVBWdjRNeGNNMnpTVElhWXl1UGZuamIvRTNSWnpNSksx?=
 =?utf-8?Q?2u68CKuE8l/rgLrNO744Op/CnB4l4ruDuP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1d147f-23a5-4e1b-1882-08d896cbdbaf
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:09:18.8623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkNjZGFYsLVJfaEd4dVfKl4M19JpLjD6GWGCuPUCXOZXXs/cDtvjPIFIDElbzTrKW3N25yyOrmZ9U1JTGwe9Nzqk7CgKctqIkPOa1RpDong=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------945805862CE9F0E817FC9353"
Content-Language: en-US

--------------945805862CE9F0E817FC9353
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-attrs_20.3.0.bb            | 20 -------------------
>   1 file changed, 20 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
> deleted file mode 100644
> index 55cfda7180..0000000000
> --- a/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION = "Classes Without Boilerplate"
> -HOMEPAGE = "http://www.attrs.org/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
> -
> -SRC_URI[sha256sum] = "832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700"
> -SRC_URI[md5sum] = "4fe38f89297b2b446d83190fce189f29"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS_${PN}_class-target += " \
> -    ${PYTHON_PN}-crypt \
> -    ${PYTHON_PN}-ctypes \
> -"
> -RDEPENDS_${PN}_class-nativesdk += " \
> -    ${PYTHON_PN}-crypt \
> -    ${PYTHON_PN}-ctypes \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.0
>
>
> 
>

--------------945805862CE9F0E817FC9353
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:59b5a3ab900d3864ab071bc6826b2abb26e87612.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:59b5a3ab900d3864ab071bc6826b2abb26e87612.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-attrs_20.3.0.bb            | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
deleted file mode 100644
index 55cfda7180..0000000000
--- a/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = &quot;Classes Without Boilerplate&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.attrs.org/">&quot;http://www.attrs.org/&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff">&quot;file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff&quot;</a>
-
-SRC_URI[sha256sum] = &quot;832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700&quot;
-SRC_URI[md5sum] = &quot;4fe38f89297b2b446d83190fce189f29&quot;
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN}_class-target += &quot; \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-ctypes \
-&quot;
-RDEPENDS_${PN}_class-nativesdk += &quot; \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-ctypes \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------945805862CE9F0E817FC9353--
