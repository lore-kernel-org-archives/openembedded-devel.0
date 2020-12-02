Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.62])
 by mx.groups.io with SMTP id smtpd.web11.5480.1606918324858167728
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AAcc/1kF;
 spf=pass (domain: windriver.com, ip: 40.107.100.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmIbhc2qX/vKZ1lGI2R2UR9Riv8rayDvmzim7vtv0yjj1zLf7vKku8lutJ9etjQEuD1VR8MBuPCd6vP/pI0WfMJiq5HB0EU3v6lMoWUqCNWIVCPyfy8ecByVBpR149jxGsHEGboSMvSls8ulUgiuGn4gDjPIB6wTUvjMoQBLOVlTDQCG3zkEPTbr6ZUpvvSBZ5CmtCw0LFZ3SoR5Vjt+mmz6dPNY5LQRngZU0egNtzj9sM8212+nmLwDhgr70uZhQsgFL7S+Nd+AkFto5p+0bkAnUmLP2PmrpsDpzzc9IPLUSz4X2AQi46cTuN5r1QvUiyna2v+z8zahyguVH6JOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OU8GpOEZ1ovhe+RKbsznjA8YCpkJ9gzsBe1yWalphDs=;
 b=JXFEU3PAI6/vR1AJMka958ZPJUiM+4EQ5XJncBtRmLxgsunTfLk9367Z6nSP728YsLiQZitkqSV7uFf7X7kEq0Sbve6gc3VLY971ypmu0iqS6VNq2pIt8ikIRUEhucXNMrucL9LOJMQbGwo2LjkYPt1Xp8rYBPzQ2/Xsb185DD3b25TtDPP+cBCEwcagJzdB+8Uqqb5CZsrFyLTT2Bu7KoG08QZicxtNnoMllAYPHGB1mNf4cCaGIJ1REy7ImaDF8JPqf70RBoZPcZ8vrkQ0Qa83ZPO4YD4sE+GNziw4vnp1h6i3Qz/1KXdyiuilJOYZr+6otngOQnH23N9s0nJdxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OU8GpOEZ1ovhe+RKbsznjA8YCpkJ9gzsBe1yWalphDs=;
 b=AAcc/1kFX8uvR1WTCmzGMDSHoJC4lwrMpZueJPl2G14x++03x5uw7VMus18g6iv9EcYfRZOvTFQtHjI8FargCNjPkbJtNyKOrRKLL7VP545eg88DhDT37YKQUJelnDqxQFnja1F1j+SB1dQjqSNEMLlm3gL7JCmIT3Hh3Y2BH6s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:12:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:12:03 +0000
Subject: Re: [oe] [meta-python][PATCH 16/16] python3-sortedcontainers: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <d6a9e42efa1ec22b79290794d1f6bd44185a0dd1.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5c187816-fc87-6870-a32e-0fa1584601fb@windriver.com>
Date: Wed, 2 Dec 2020 09:12:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <d6a9e42efa1ec22b79290794d1f6bd44185a0dd1.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::39) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:12:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 109f7c16-cc99-4c7d-7339-08d896cc3e17
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48643DE50C9E01E25495F0FA9FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0u2j/UHcqtAtXkI1gSbNgrDAVX83dQPWw3lQM6qxXLiw/8Vr6UuKWuTZzC00+JGKIjpNYS41KYw7CTyBSVsuN+RPk80AE27F8nuKa4dQvEoYX34XtKCsjmVh48IpojoAdwzp2uFc5LBXvjg7j4RYRxplU884M5J00ZYHbL2QYusrwZFPLeZ2EJUbkSvgT0ZQWT1oF7Q8ynXULDa+mCzr2IRkYZSt4HP8JBh2qPNMVsvuQq1W3ukybda6qoYGLcOtqfBawZOz4NYnUo02dPYgOKyfcqTlTRA9yKD4koSsnOPBPB1+4FvQViqm1NhonlIPRNny6MB5dlmd+CPIsubknBR3cMroX+nQdGJ24eYZoGy3/hsWKUYBXENlYhGb89KNrmJBIx//N1rYKT+zmn5yC81apRUn7ejsj1znZgVpLIIj+w5Z8f51TILsNc/ng31JhlTDu2XD5+DHFJ/qdnFyZMYuchdAphQ2Vz4qYmrQpaHZrY0cQFwjiiAhFngBE5M9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VXZJUThqZ1NwRXh1WXpoQVN6VEhNWW5VMmZ3UlpQbnBTWWZ5eUpFZFVLSGo4?=
 =?utf-8?B?akdQTWxWdUxKSzAyenVYdFpmRndFT1dtcFQwaHduMEljYWkrSk9LQmc0bXdt?=
 =?utf-8?B?cThOKzFkcGFwb2FZc3BpeTE2V05ZZVZRbkF1cDQyZVVIbWFnQitmSWhyRzZH?=
 =?utf-8?B?YzErNnFJY2ZGMVhocVR5UzBCZXFyM3FNMDlXSjVZSlpZVFVwbE1HaG5NUFp2?=
 =?utf-8?B?enNUNlFYbTl0amM3cHlqeFZRMVBrYjZXNHVjNmFBZ2NmYjlHU3ZwekdQejhs?=
 =?utf-8?B?SnFvRVpsRVZUS1pVaWg4Q1dyVVFsN1phZkNYTVlHRGpwNkZuc0JJU3Nad000?=
 =?utf-8?B?NXpDam9CYWVRSzRzY2lDZFNWcTlRcm5QWHFnL3Yrc1k1TzVzb1NTZVN5eGk0?=
 =?utf-8?B?SnpqTHArMkFPTVBzaENaZHMyeUxJL0Vrd0g1aloyUHFNVitrS3h6T2xRUnNJ?=
 =?utf-8?B?RWhlamR2a2xwUVVzYjI4UnRzOTdRS2NVMm9qQ0RMdGRrMmQ1cDZmUWY3dmF5?=
 =?utf-8?B?cW4vUDBUZHhxQmQxL2F3NXJwS2ZsUUpRQ2lGVHBLbWhCUWlnN3pPWUx1NW1S?=
 =?utf-8?B?a1R2SkZFczRmeWpQMlh2OW55bE5VUGw3QmNzbU1aL0hHOU45YzRzajBHcGlp?=
 =?utf-8?B?MklkdjhuUWdMOEdDM01jaGphNTVCMnJaNm1NeHB4eURNb0ZIelZ5aGtUTytW?=
 =?utf-8?B?azV5ZFJKTWgwOExBaGNlN2UwRkxNYW14RVhoSWVlcWllS0JGVEM1a2gvKzlw?=
 =?utf-8?B?MW84QWxZeHFpSVVuYzZQODBCSHFmOHhJcXFIR1I5dWpJR0FHYlo4bThqa2tX?=
 =?utf-8?B?TVQzc3BjQmM5MzRKWWtUK1FmUzd5UklrK0hmT29kQXRLTWtqTG1OMUNVTnpV?=
 =?utf-8?B?aTRhN3J5OWwxWSt1YWlmcFFFWWFaM3Y3M0dVOEJsbkZLRC9nNEFjL08wR1A0?=
 =?utf-8?B?bzEyU1FUZ2QrS3R1d2pmVWNycC9BTmlzV3U1ZngxRG41YkNwTXlzb3B4Qm5S?=
 =?utf-8?B?MkVINzlTRHZvamV2dUMyY2lQRm00dU5hMGxWbTUrbmZRVlFZZmY0S2FYWDY2?=
 =?utf-8?B?WFJ3OWdJMTlzbUxmYUFNRXZBOVFGRUdacCtpV1lnUUEyOU9lb1ZGWkRvaGI2?=
 =?utf-8?B?M3IrelNXbWdDVTlnZzViY1hhZk5hYWE2MTl3SVBUaUFoSm53VmtVbzh2Mksx?=
 =?utf-8?B?Rnd5citQV3JpNWM2M1ZjZmlUMUpoWFZWODl1djh0TlVGaHhZWlMvVmRrSHZv?=
 =?utf-8?B?aEN6OHJvNlFNbEd6SmFhR25NVVZNdi9vb2FIeEFJZ3h4d0VaMVU1YzZTQ3Z1?=
 =?utf-8?Q?9d3L9h09V7Y+jAppnWWD1RSRAmKV6w8SIL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109f7c16-cc99-4c7d-7339-08d896cc3e17
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:12:03.5012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eWvt6KiA8lK3QZjhjcE1ma8LCt+VaU++NufxtNRZ2Uq07MK2A0JD9wg9sib3jOuqS2279kw8CZQP6rhu2k7jO/irWTCihWl0WsLIsZ6Gfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------AC781072887A5BCE2B5CBB9A"
Content-Language: en-US

--------------AC781072887A5BCE2B5CBB9A
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
>   .../python/python3-sortedcontainers_2.3.0.bb             | 9 ---------
>   1 file changed, 9 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb b/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
> deleted file mode 100644
> index 6060c03723..0000000000
> --- a/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "Sorted Containers is an Apache2 licensed sorted collections library, written in pure-Python, and fast as C-extensions."
> -HOMEPAGE = "http://www.grantjenks.com/docs/sortedcontainers/"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae"
> -
> -inherit pypi setuptools3
> -SRC_URI[sha256sum] = "59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.0
>
>
> 
>

--------------AC781072887A5BCE2B5CBB9A
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
    <blockquote type="cite" cite="mid:d6a9e42efa1ec22b79290794d1f6bd44185a0dd1.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:d6a9e42efa1ec22b79290794d1f6bd44185a0dd1.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-sortedcontainers_2.3.0.bb             | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb b/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
deleted file mode 100644
index 6060c03723..0000000000
--- a/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = &quot;Sorted Containers is an Apache2 licensed sorted collections library, written in pure-Python, and fast as C-extensions.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.grantjenks.com/docs/sortedcontainers/">&quot;http://www.grantjenks.com/docs/sortedcontainers/&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae">&quot;file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae&quot;</a>
-
-inherit pypi setuptools3
-SRC_URI[sha256sum] = &quot;59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1&quot;
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

--------------AC781072887A5BCE2B5CBB9A--
