Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.68])
 by mx.groups.io with SMTP id smtpd.web11.27504.1611149607599936264
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oTAtGsTB;
 spf=pass (domain: windriver.com, ip: 40.107.93.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEZMLyYCfXcvyE1ZYUHIOyI/LrLyFcUbWQc9EJSly+Mi55FXmM5bsed3cLYE08JjeSmGw5eV5Kj6dfTuhg67/3UT0KR+phol8UUyjhXjxNiXHaXJ/NymyZ14iggxsVgUmhx5BbscTsN1ukBIWhMSh/A2EA8DJdgK0Q98TkFnHL52CZPBLi8oPNlGQt5oBX0+ls8cFBv0Gj7zMO5C96Dnd97lfTsOs9u2dWtwArI1lynRYxq7g4N+XXvJwHY2ltBn2+yEMt6EhhR6Iyl82zR/PXunwAgetJr8e3PfL9e/SBfzHf8rzVBORg3G0ask3ydBPx50rVKVsrpIQZKlPL7eKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEz+GGh6I5Rnra9KFkbvB/aBfPPi54uKh0XVrfd+6c4=;
 b=GPXRT/NRBXfVpVNrrcdgkopRSPh3qqUQaG68jrCNToixPMAUIJCSszfT2ASnyNfEPS5QhDnaJP6i9HJv8k7y5xja0xbTYptwZL8IjnDssMjD0WTEgZfmm9x7kyyPWYsDly9AXchH+jlvYVYE0J8FeKQBPIG3kUaiLL/F3weQVO4P+v15To1yJDH5C2YITRs2ozxACB5nXj4W5stEtNgmNTsmHe09Edj1IK14lyoHmDT50bsnhj3TtQ5b7n1gzTjs5nMvqxYuqp0h+bLX1WmV92cB689Aj8cNoKTtf+XNmhA87qLSASo2l0xw/VsRoobauNihCByQqjlJoTajpqU5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEz+GGh6I5Rnra9KFkbvB/aBfPPi54uKh0XVrfd+6c4=;
 b=oTAtGsTBX4S0fMnYRzrGzdAKHOy9AXIeA3FHzXoWrccMzqnU3WZ8qxn2r918b0wPBTPoSG/wFigRDTU5UMxSMsDIdjDFjxz/kBIeoDwrGuNC7f05MylYAmd916mlIFoGNohz75zkFaXhDsfDWpBcG62Q+u56xOvaVhjil8R4hBI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3190.namprd11.prod.outlook.com (2603:10b6:a03:7b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 13:33:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:33:25 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-parse: Upgrade 1.18.0 -> 1.19.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210118173007.20996-1-leon.anavi@konsulko.com>
 <20210118173007.20996-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8101c070-2f68-aaf2-deee-a8aafd9c563c@windriver.com>
Date: Wed, 20 Jan 2021 08:33:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210118173007.20996-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:610:4e::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR02CA0015.namprd02.prod.outlook.com (2603:10b6:610:4e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 13:33:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae5d983a-7f37-40ae-7933-08d8bd47f6d7
X-MS-TrafficTypeDiagnostic: BYAPR11MB3190:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB31900D9D143E9173462929CA9FA20@BYAPR11MB3190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Agc9IQQDzNESF8ama4AKqT8im1uUK5MoKCTg0VPd26gFybaBsyeTzYUhIGKwxUol34z84Wy0QDOqPbYIpHweEY+ebxw0xabTmahQ2AIDiAge+HwqLM5pA+kLpSEe+egJFKSTGHI41wjWb63F7sIv110Qa5IS3sELQ9j8bFjBVRwwG+MmAiKQuLlhJDxiXcHyKdGu28N0epnztPHFq2xVDvPoRcgq9IffdcwGIvDMxBTJMYQUZYY0r2aleC+TndWYeeok4UGfAkoU91+qBrxBnixUAfev25lewWiNW0giFJNItufKyKmRAkJ5VZB5cDAn/XQA3O05i7xj4PU8uQhzRPGDqHk3iJ8gVbraY6iRWShDlyjCUtgKDJguu8AT93b+PiFYakEG73C6V2UDut+XwuE/eQdbOmJWlxzSOWjDm9Ibzx5GlhcGCdRrZFpBb62EHHpztYyIdDXQHMAhMncWlcxOFMREnvhNDBD4PEGxM8tWpLPjf/wLrn29HXVCqCzKYe0H+Uuvg7P8NDRE7cg+KUykZRjV0ADZ2Nkx3DLIYX4zZODMQl3s8WRYNLfeWWLA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39850400004)(83380400001)(6486002)(26005)(31686004)(166002)(16526019)(52116002)(44832011)(478600001)(186003)(316002)(31696002)(16576012)(2616005)(66946007)(2906002)(33964004)(36756003)(53546011)(8676002)(966005)(5660300002)(66556008)(86362001)(8936002)(66476007)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?N0dKSDNodW1WM0tvNVVzODdHS2l0cVdNSW5wSXZWVGZzQTNhMGE5M055Si9B?=
 =?utf-8?B?UW9nNW8xbkhwVlVsK3JVRnNmK21CUEVwdGo2WEwrT2pjdEdqMkowb20vNkNJ?=
 =?utf-8?B?bWxPSWpZbFZxbHVRSWNsNGFwSXJQRVZpNUtLVDhYUGdYT0JmcVFaczlyU0hJ?=
 =?utf-8?B?SDJzQlYvZ2hYZzM1eCt1Vm55MWpLRU8xSm1sNnM0YWcvdlZrSGQzdFgxMUNl?=
 =?utf-8?B?YnJaSDZnUVdwdzFlMVNJMXZPd0RGdndoeHZETU1EM2IvS0lyTndsczNzL2tj?=
 =?utf-8?B?SkcxUWcyNHZCcFJvVEhNT2puNlF3c3JDN293a3Q1R1k3WWZFaWFKbGNkSG9z?=
 =?utf-8?B?RzdVYzVQejMvaHdySlJXV01MSHVUT0hNTEkyYVBDSGovZ012TlhEVUZoMzJE?=
 =?utf-8?B?RUVBQ2x4SzFqaHFIaVJ6SUVGbVllNENoV0g3Z2wzSzR0VFV0VVViT3BMZzVn?=
 =?utf-8?B?aXRGeDVKVGR3NktqTk9Nek9Wc2hDbzZXZENrSEZGYmlxb0tjR1YvYXBZV0h5?=
 =?utf-8?B?UHJEdlQ1bDVtNjFZdko3QjJjZmJZSERSUTQvT1RJZndQcE83aThrSjVrNnRi?=
 =?utf-8?B?Y1NkUmYxcXV4Rm5MNUVLTXlSaUFUcHJTdDcwakllZDlLczBpWVJLRUFnUGxV?=
 =?utf-8?B?K0JoWFFzSXFkMkpJS0ZDc1RKY0gyaHlFcVdOa1YzTzZ5dXk0UHZKOXNRWGpm?=
 =?utf-8?B?c1BQMSsrV3FoaTIvQy8rNGxOaktuNEVNRzhWUG9hTmpQaldBSnFhYlloMzZU?=
 =?utf-8?B?STdhVEVoZnpCTjhQUThPSTVRS2RRZGdjOVhnTDllRDJUL0V0ZndxUVNsMzhS?=
 =?utf-8?B?bTlqckd4YlJ3MTdvZ3pxSVBGSnNySnRYYWV6U3BjOFQ1VDFLWVlLVjE4bW4y?=
 =?utf-8?B?eEZkSk5KbzlNQ3B5cm1ucC9NT1gxUUxpcXhyVnMraUhCUkRmVUhudDZlS1Rw?=
 =?utf-8?B?ZE8vdy9kUEdtemFVMDlQZVNrcm1vb2tHem5XQ05vamEyRUJQM2VsYlY0R3Er?=
 =?utf-8?B?WnlRVEt4MjNwWFBKTFhWNmZpOU1nU3MwQXZodFJLd1dBWVgrcVUrS2RycGtG?=
 =?utf-8?B?TG1hN1kwaytwVU50QTFVOXdsMUlNU0ZLOEJyc2kvejNrRy9acDZHYnR2eWEw?=
 =?utf-8?B?YVJ3SVMwRTlxTTRNRVVxVklEQndsL3pNYnNhdUdmTE9xaU9BNnpZZTI0OXlt?=
 =?utf-8?B?VWtmNGp5TmpjMFFOMEZEbkU5Z1l0WFY2KzVtUGJMR1lRTmM0WEhmV1hRcEpY?=
 =?utf-8?B?U1dPSUNRTEpGMk1OWXlxZy9xSG5EdWpMVnBTVkI3WXEyNzBIL05ITlVCakU1?=
 =?utf-8?Q?f8OvlPwBNS5psUoIjqlTuxfrC/BDiphsuP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5d983a-7f37-40ae-7933-08d8bd47f6d7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:33:25.6658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2r+x5MyPhXFxOHM56Hie+nRjLMrByoCp8M5PKob7daDSF9qGrJXDfYRzFYSjF/P2ExMrjcXy/M4K5gWnb9X4ubUJdUyu2j1CMZ0CRwh5MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3190
Content-Type: multipart/alternative;
 boundary="------------EC9987C4F07B4433EBDF3F1F"
Content-Language: en-US

--------------EC9987C4F07B4433EBDF3F1F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-18 12:30 p.m., Leon Anavi wrote:
> - Fix using digit field numbering and types
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-parse_1.18.0.bb => python3-parse_1.19.0.bb}       | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-parse_1.18.0.bb => python3-parse_1.19.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
> rename to meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
> index ed9204e3b..b5e076954 100644
> --- a/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
>   
> -SRC_URI[md5sum] = "42ea0002cf36bfd2bd74f3c05bf25f60"
> -SRC_URI[sha256sum] = "91666032d6723dc5905248417ef0dc9e4c51df9526aaeef271eacad6491f06a4"
> +SRC_URI[sha256sum] = "9ff82852bcb65d139813e2a5197627a94966245c897796760a3a2a8eb66f020b"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 
>

--------------EC9987C4F07B4433EBDF3F1F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-18 12:30 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210118173007.20996-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix using digit field numbering and types

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210118173007.20996-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-parse_1.18.0.bb =&gt; python3-parse_1.19.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.18.0.bb =&gt; python3-parse_1.19.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
index ed9204e3b..b5e076954 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/r1chardj0n3s/parse">&quot;https://github.com/r1chardj0n3s/parse&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05">&quot;file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05&quot;</a>
 
-SRC_URI[md5sum] = &quot;42ea0002cf36bfd2bd74f3c05bf25f60&quot;
-SRC_URI[sha256sum] = &quot;91666032d6723dc5905248417ef0dc9e4c51df9526aaeef271eacad6491f06a4&quot;
+SRC_URI[sha256sum] = &quot;9ff82852bcb65d139813e2a5197627a94966245c897796760a3a2a8eb66f020b&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------EC9987C4F07B4433EBDF3F1F--
