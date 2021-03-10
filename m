Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.85])
 by mx.groups.io with SMTP id smtpd.web08.11868.1615394805624771411
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 08:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RwvX2Y4W;
 spf=pass (domain: windriver.com, ip: 40.107.236.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVneLw49upa7bHkgrulSCbghd2GTtRcI5cN7ekyb1efH1lxXVoCPtM5xTV+cg1hFlO6gVJYCnlK1uG5WtIpuJpXlYe6Re1Rra9BDIZ3Qe7kWxlwOKPjAx4RwaTb5U5b7ATCwcoyGo0OGaqnuL8FyXpv06uZq+1WmcbOuYjyaizV6XPdIMylot8iXnkX132IdpP0bzU6EBFzxGsJO67ss6g2bJpHmqfoNwnIwI9tlVqVthXVD/OJh3Bxllv4v4fCBRzXxGswqSYaaoXZrzOf5IJM88eg+4PhqiZhxmus3mJhCJYWG5BecOqzQsKdtSrqxFRGMVPFD1ma4CuNac/e92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOsDPgyZf0l+2J29O0QuzgQVu2YYgj67FD8rMFn1fq4=;
 b=acGGfaRDGtA6mNvlbFTL0pSQjRjJ/e/72HU3J5GjPoolyBg1bopHrNBaTDYygj7wWiC6I1ljwwUuEHbkfrmqAN60oNfHtUHazkkLakviqnBYOj62JP+w7y4TOEolOBly3rvuCn8pVTDRCPURONsrz1fYh/ov64UowBzGAzhgg1V3CHxnjxB4UMf3O/Bo2VY2fVbKXsnUmdclhVSASvxmgm2nemsRWeAD9URM6UUuha2pGOw0GXOflkRbxR9nCJym9/y4swclxvDxVk/W6UujXHflyfiqbKTUhuDhyNxny6xAlD/LOP9JGB89EpQ6BiRjjwewZs0mEJzDj4+LhUgltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOsDPgyZf0l+2J29O0QuzgQVu2YYgj67FD8rMFn1fq4=;
 b=RwvX2Y4WtbYSsduPg2Jiv6LhlykC4w39kq+AO5uaAox4m1+xfWQJr9tQx7UdTaYB7hBEUmSPr8c2QcDpwFVZTBk0eWolZW3eGUyktwSsz+megasr0GntbrM59/Otcm4Hj8n0orh/sx9LzW2dwTQajPmIWFbTV2T0bnrUtPX5gxg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2680.namprd11.prod.outlook.com (2603:10b6:a02:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Wed, 10 Mar
 2021 16:46:42 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3912.029; Wed, 10 Mar 2021
 16:46:42 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-huey: Upgrade 2.3.0 -> 2.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210308161810.21582-1-leon.anavi@konsulko.com>
 <20210308161810.21582-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <767ae03b-ab4f-3c4f-f8b7-ff2f5d539bed@windriver.com>
Date: Wed, 10 Mar 2021 11:46:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210308161810.21582-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1701CA0008.namprd17.prod.outlook.com
 (2603:10b6:405:15::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1701CA0008.namprd17.prod.outlook.com (2603:10b6:405:15::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 16:46:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86cc0438-5b4f-45bf-0fd2-08d8e3e4153d
X-MS-TrafficTypeDiagnostic: BYAPR11MB2680:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26806E987A33150EAB90FF369F919@BYAPR11MB2680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xd+UxSBNbMMd2sH8XhjVl6oWE75KmARkP64TWN8sLNUJTwLRwHGcPI7eJRdx8d7vxX86LHWsnEsmcMXVQTfZiHbvddVTXTHjOV90/UIHqduYDaKeg55NN7WHi4ji9Z8PPFCvbbma91xwsqGBjry8nYMJTxqVKicqWpaPc0o97w3gToTJ2WxODbqexplODWKNbDr8HPK11ZDxlsHSC7KMrcbek04YbGX8eBFYwQrdq9vzIXMOmF+9NOlcbaSf7BnREWhaFLgtRFhpmYdX4/s0Odi+jZazoYweACSJ2mB5DZNi0CoBdYEzlrSjYDs1S6B2+VzTUESeUXc9WBHMDt7rhT+AfPnBYbV/N42PJPd9azsxfOGCn/0PkkFrotEHzUKVS+UEz3yp9kSTPI7euNZf4zxtodD7r5RSEH93geXWz11soJqK+5dMe5SYyOYEjysmFbMWxsD+dDh7Jb1VjrV8lLkxDPIX3v8HCGHrMBXbXVCdYjkwUk3Iz9AlISRWJFEaxJ0hGiR4TeMUNfzb8GxHEaDJjoEtxKIeD6xclR5sCVpe8qu+J6573UYlnA1CnWHhWM5jscXo8uijFfTqsclCKcN4LIhiYHA59Iv66aojRonMBUfm9+X2Mi1iQdyWN3u4pIW/Kfol5hUfNMBQKdd8zxeX31dyG6H9IZQJp6fCYF/NgeV6RFzLoeUAmvHUzbfI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39850400004)(136003)(66556008)(66476007)(966005)(186003)(5660300002)(2906002)(8676002)(166002)(6486002)(8936002)(66946007)(53546011)(33964004)(316002)(16576012)(86362001)(31696002)(16526019)(31686004)(478600001)(83380400001)(956004)(2616005)(36756003)(26005)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bldwNkVRazFqQkMxeUlyVXRHSUpiTEswRFF6c2xWYXZyRFVHbXVCcmxBNE5u?=
 =?utf-8?B?N2lML0UzZzZjaFE0RXJDQmF1WHdvaThucVQrRTQ1Y2NML0hsTXBvcTcwejlm?=
 =?utf-8?B?K0lqZlI0VjZuMElMaUVZcmdoa1FxQjFKR25UNHBBNjVNQzNjNm5rcmEvdEtK?=
 =?utf-8?B?bS9WcG54S2JrdWpaQ01yaERZb2RUWHJGTlVkemJ1YXFXK1doWnRXdWdGQ2Y2?=
 =?utf-8?B?a2FrSWNjYkk4b2owTDhiTWhzK0NqMXM1My9ZbmZVQ1ptOUUxZ2svSHcrVUlS?=
 =?utf-8?B?VzFFZzNQT2NMTldSclZwbnJWMGtDQkVRRGN1VU1XaFhYVjBXVFBkbjZvdU5Z?=
 =?utf-8?B?Y25oVDR4c0c1UE5wb0huTkxZbUVQS2JNcGt5WlZQZVNsb3k2Y20zSkxsYThp?=
 =?utf-8?B?Q3JieDY2TDcvTUdFc3ZVVHdmZ0FjU05HczRsNnB0QWh5ZUNna3V3MnJSQWRn?=
 =?utf-8?B?U245Y255aEptZ0FjNjhjVVdtSnFkY3dZZXM5UTkrY1ZzcGtzcldhN0E4NC9D?=
 =?utf-8?B?NUwwL2VZOGpURUVGbWs3cVIrOFdPM1ZjVmN0bHpFblNSZDM2SzlQb2pacEJZ?=
 =?utf-8?B?NnJIN25ibFFqUjdKKzBnemNXd1E5c2JJN2hoa2d5STNVRG9RQUNYKzBZYndp?=
 =?utf-8?B?RXB1VWNrcFJoQjhuSTdWS2VsV2dUU3RORWx2dmc0M2FHQS9haWdFaDVoK2pU?=
 =?utf-8?B?QVduc2JJTE9KSkprYVNXTzR5K0RMa2hXOFdiV3l4OVdTOHpmZUdzNHE4Yll6?=
 =?utf-8?B?Y2szNlhabVl6ZlgrRzlNWFV5ck5jL2tjRWRwV1V2Zmp2U3pSQXg2RWVZeUFx?=
 =?utf-8?B?bUQxN2JsOE8xSEwrV3g0VnNzUEMrb2tta1I1ZlM1VHhzNjh1Y0ZDYmk0ZXZ3?=
 =?utf-8?B?UzIvM1lMMnV0SE9lODR1aWRJeHhMVDZDSjgwbVFZa3p2dlgvYVExWld2bktt?=
 =?utf-8?B?WmVyTStESDRTVlJXSXZEYURtUWNFSm9IRUM1ZlZJTytrMy9WS1cveUtuNEFp?=
 =?utf-8?B?blVUcnhQMkdsSWVrQm1iZjhDeW1ZY3lyYkd3aHZDZUpiR05xU05SSWt5eHNS?=
 =?utf-8?B?dGN3RGpZeGlESld4dGxldGlSRW5BRjVPUCtYV0IwblA5aXhsUWNJcEtFUGxM?=
 =?utf-8?B?NldIVUhCVUMvdjdWL0cxY1NFeFBUamh5WmpEVEVtUFFCbllBVmFWZnNpZzE3?=
 =?utf-8?B?MWZNTEI2aitLZzI0TlBYMkNKUnRMbGJWbk1zZ1NjMzR0T2t3Z2JzV1FCN3FG?=
 =?utf-8?B?dlpRT2d6bkVKMkU0ZUszenhJVHJ4SFNJY3N1aHZuc2wzNTc5OE1mRnFySmVr?=
 =?utf-8?B?aUxHYnhyOGx2cDdnUWhheW4vVldZdUwrZW93SlMwTW11NFJ4QTdRQlFvbTdq?=
 =?utf-8?B?SnphcXdUaEtYemVta3Vyc1plYkc3bVpMRTdJdFZMQWh3TVFxZFd0UDBUT2Z3?=
 =?utf-8?B?TWpzdUliWXc0UmpWN0trdXRlVW5ZZzZKWVZwc09OeVJkRGpUQmkzeU02eFNE?=
 =?utf-8?B?VXg1UUdWeC9NYVh4Z2RxZzYwL0JGblRzUzR1ZWQ2MUdTMDJpejdacGQ0TVdB?=
 =?utf-8?B?NHdjZnh6ZXVrVW02WE93NVhpZHNOTzFrSU1kTEVFbGpjMGtnK3I5QjRxdVY1?=
 =?utf-8?B?MG13dHpndUdzRDJIbU5zbFNEVFp4cXBDRkRETWg1SWZFbnhWT1oxK0svRFQ4?=
 =?utf-8?B?bW52eVVmSTFRaldRWXNCOHZLeklxNWpZSlc4UVRlSkxnYVZ1amJOM3JURzN6?=
 =?utf-8?Q?r9IHPMRxJBnvA9VjQBQbns2N55YQ1HsnEmeANcw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cc0438-5b4f-45bf-0fd2-08d8e3e4153d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 16:46:42.3725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ryI6RIQZamWzpLCrV90UQt+CG+8jYi9jDHD8hqCc/6Uu1hoTecXDSCo5OihvOp/wRGA2+OTRzrL08DITj6YllH9ZM6qXHOKgHGUlP+80Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2680
Content-Type: multipart/alternative;
 boundary="------------80F1C252B74496D6E6E4035F"
Content-Language: en-US

--------------80F1C252B74496D6E6E4035F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-08 11:18 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.3.1:
>
> - Add SIGNAL_INTERRUPTED to signal when a task is interrupted when
>    a consumer exits abruptly.
> - Use the Huey.create_consumer() API within the Django management
>    command, to allow Django users to customize the creation of the
>    Consumer instance.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-huey_2.3.0.bb => python3-huey_2.3.1.bb}    | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-huey_2.3.0.bb => python3-huey_2.3.1.bb} (59%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb b/meta-python/recipes-devtools/python/python3-huey_2.3.1.bb
> similarity index 59%
> rename from meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-huey_2.3.1.bb
> index f70a349fd..d8141c8e8 100644
> --- a/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-huey_2.3.1.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
>
>   PYPI_PACKAGE = "huey"
>
> -SRC_URI[md5sum] = "aa9f2a8f54cb68c62690c5e28589f49c"
> -SRC_URI[sha256sum] = "76978840a875607cd77c283c4ebf3ea5071b2ec06a1ac428d63be0d88f1e7070"
> +SRC_URI[sha256sum] = "de9b6d0fd59794378fe05813d302be68038044ef3b68274b84ca8d285e20f803"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------80F1C252B74496D6E6E4035F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-08 11:18 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210308161810.21582-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.3.1:

- Add SIGNAL_INTERRUPTED to signal when a task is interrupted when
  a consumer exits abruptly.
- Use the Huey.create_consumer() API within the Django management
  command, to allow Django users to customize the creation of the
  Consumer instance.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210308161810.21582-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-huey_2.3.0.bb =&gt; python3-huey_2.3.1.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.3.0.bb =&gt; python3-huey_2.3.1.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb b/meta-python/recipes-devtools/python/python3-huey_2.3.1.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.3.1.bb
index f70a349fd..d8141c8e8 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.3.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4">&quot;file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4&quot;</a>

 PYPI_PACKAGE = &quot;huey&quot;

-SRC_URI[md5sum] = &quot;aa9f2a8f54cb68c62690c5e28589f49c&quot;
-SRC_URI[sha256sum] = &quot;76978840a875607cd77c283c4ebf3ea5071b2ec06a1ac428d63be0d88f1e7070&quot;
+SRC_URI[sha256sum] = &quot;de9b6d0fd59794378fe05813d302be68038044ef3b68274b84ca8d285e20f803&quot;

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

--------------80F1C252B74496D6E6E4035F--
