Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.87])
 by mx.groups.io with SMTP id smtpd.web11.2986.1613078846688142982
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 13:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=g/vHRG9c;
 spf=pass (domain: windriver.com, ip: 40.107.243.87, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWC06HInZQBQKMdNQxnNjDuxQ4/8gV8sk36HZOi18RPItIFs2PVJiJG/IYpnYJpxHJhCUOtVG/3062pOdlR5pqsksyzJioiYeP6dhkgNWgga3Wk6AOmIIbx5zDrahooWI2QVA14VEBnL68OCsHbu6UsChUHrE3H+soGH8hdtM2AJ90eIHWy9wNs8Y+7nmElxY18P34ZCMzIBOmlkZfNrYbRg2R+O59rQORgO4/BVgyI4C9Aaz9F98wXtkR8IWwoIBu2PvAXhpLPufIvR1JAKXoMH3Z0DraBRfYQnl88JNhJS53gAwWShl0qTZex0EHx90jp5QyGFODhzq16s/fN4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnRBg2efgf7z45hYGdxWk3TNBBHMXcMU55A6aCUXAT8=;
 b=b/KrNr+Vb1w14FsD/jZ+sKhYp0WyAmjDGIRsU1ocZFPoEU/3tjZq+UEb6cZH5XO9EO8Q/io3dMRo+OUi8DFoOWnm6McX9p5t1EV4gzg0dZvfXsa6omBGe6m08tlLGgyQk1XOmHOmyw1Q5CyaqP9voWOaTOTnyCDXQZY0/JfKRrbgFEx0pPQF7nrnWfKN3Aao0lK3Ro13vwnFF99tr3jgd0wUsCwLmAetvgEXO5W1l930XW7gjUbm0itgXV90zUiPHk2yr1gK+m+KQio++IFeWhZp4GbvQS8rDvlBWhGYdj0CinADxcyrfPvMRnoIiCkhH6QgqsJRfq1kDxXJaerVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnRBg2efgf7z45hYGdxWk3TNBBHMXcMU55A6aCUXAT8=;
 b=g/vHRG9cYwMNNX9WPHEh0fW7RTjcHjigPfM39h0kLREeQcrzRhYafOjYVSX79S9+moUgBy0GzxmPlNtorVLk2lvBvprW3BADDDB/0emjUClSGhW5wYcT82u9HwxYM3tOrftrIOmgzInC7E9LkTf6KIW6aaKcI8y04We66V0Wr/U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB4988.namprd11.prod.outlook.com (2603:10b6:806:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 11 Feb
 2021 21:27:24 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%8]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 21:27:24 +0000
Subject: Re: [oe] [meta-OE][PATCH] rsyslog: upgrade 8.2006.0->8.2012.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210210204201.8468-1-yifan.yu@windriver.com>
 <CAMKF1srEG-AjncSrtS1jUsnFgtbXA11jDEi5oM8cpr5wxEHzLw@mail.gmail.com>
From: "Yi Fan Yu" <yifan.yu@windriver.com>
Message-ID: <d4098c3a-e180-82d1-d4ca-ca5ad8af6fef@windriver.com>
Date: Thu, 11 Feb 2021 16:27:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1srEG-AjncSrtS1jUsnFgtbXA11jDEi5oM8cpr5wxEHzLw@mail.gmail.com>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: BL1PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::12) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by BL1PR13CA0067.namprd13.prod.outlook.com (2603:10b6:208:2b8::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12 via Frontend Transport; Thu, 11 Feb 2021 21:27:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51bb1b57-d84c-4120-de3b-08d8ced3d2d0
X-MS-TrafficTypeDiagnostic: SA2PR11MB4988:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB4988E9782BFE3B45D0C62A5F808C9@SA2PR11MB4988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3LMvI2w7Y4pt35kpklSjPB7p4KxN3KXxT0WJLSSLXWeOiJXYIfGMv9lIHnLKAJacfkpOVZL1F8d2rBwPPa+LS9p6wUF9a/+A1ErujxHhe/fZTOPG5AUtyPdoKYgBYLAEH0jassLgoQOE6aGc7Xi4jWiIkc2ocbbmM8/5pk9PlLMjIzsmE752r1LX2WAEfnU2pPYgHh0coLdKAsqqJ1jhj1pw20ZFjLpj/U4O8hpIwxWuAoP5mL/7fyrjzdyhzgSvkycfpQF/colgeMB02d+0KZhvu8sobI7oxaophm9eA7qnmp6sBLFOQmRSNxDj65HdUO0wK9nwN2jeluAzYqNH3h4vbnhiRmCE/IktXnh/zLd6SIZGQ+SjuC8N+pBZq65avUmCoZYBhwiWj6+BZZAC7NbWpZVNkWY1mSa1M8BnB5VfimH4HbneyZ5QxBUdYIMX+hHsENpv8D/2YOcMhHgQznTGEvTwp98OZu4Kioxovas2s3dwgKA7zS5eysWEUYVp+V4Qe0RlWB3AnuFw2n2qP0GwYY814FBC2lDhfu8i8OgDwlhrNnugvfwt/WU/AOrzmkqC5Dic8G8FlXnP04faOJzr6CMShyTDhCVZPqWEBOXYiYnBDrz4qZ7ZzNO7pEb8+6ALNfKqiVc5jyZKnoS9bFONYGRVJ02e6xFqztEY7aZhEPqV0ohSqDM3Dxu28GZL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(86362001)(52116002)(66476007)(66556008)(5660300002)(966005)(66946007)(36756003)(4326008)(478600001)(8676002)(8936002)(316002)(16576012)(33964004)(31696002)(6916009)(83380400001)(16526019)(31686004)(26005)(186003)(53546011)(6486002)(166002)(2616005)(2906002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?S2xrN2wxVjhLUUhWR205Rzc2ZXFMSEhVZitZK1grYmpMam1QcGo0SjE3OXVS?=
 =?utf-8?B?ZHlkSHFSUndWSVBIWjk3OFk1Y1RlQkI4c0JVd0VsLzlISnBXck5SMXVwb0pJ?=
 =?utf-8?B?L050dHRFUHdJNndoZHFRRGMzOFJyYUR1blU5elFGNFlEZG5nWkJYZTREd0M3?=
 =?utf-8?B?L3dzZjVEQ1E3SmdrU1lzVG9wR1M2NFNGVVdtcEJzWFVjb09SdDFZWTl5OG1U?=
 =?utf-8?B?VmdURm5MRDFObzlVeHd1RlR5cDJkNHBER0F3eEJtLzk3RGdPV1Q2Q1I4cnU2?=
 =?utf-8?B?K0FzQzVZOUZwWnBjNXA2U2YzK0FFZlVPQWJNZDd2U2gxUGk2Q21zZmkxeXF4?=
 =?utf-8?B?eWcybVdjeW9XSVJ6aEtJdHNqYnlzWUxuWFRkOGxHY0JHT1FtUFVCTnFjRC9M?=
 =?utf-8?B?c0xmQWkweHhaQjY4MmNLVnJ5ZGtWcVBSZlNLMmdJVjRqZEh5UktjUVJZTUxL?=
 =?utf-8?B?dU5ubGxjOHRFbTY3RHFCNmwzTk1KbHMrMDYyd3l4K2hPeC9JV2svQXlxdW16?=
 =?utf-8?B?b0FxbzBLWTM2bGFHM0VicG9kYWl2VFpTTk52QXFHTTNFY2Q4YUtpbHlVcWtZ?=
 =?utf-8?B?SURkTkh6L2Z6Y0g4TWY5bEhtdnpnSEpiTXhZakpXZ2RRL1oxcnhCdDVYcTdF?=
 =?utf-8?B?YWNZcFc2Y0JYSTZSY2NSMTRxb25DcTNwVFNIS0ZPaEorNWZWcWQ1L3QzdE1q?=
 =?utf-8?B?bDFLamtJRjFCZHJBSi94Ymhad3dKZXp3T1Q5UXRiZFhsNlFKUXNpNWF4Mllo?=
 =?utf-8?B?S291QTNsSDZoSGpoYzc5OU9FVG9EZzRNdWpWQ2dzdUxqSDFqbDhaSjNObW51?=
 =?utf-8?B?YXRPOVNJdTRmSGI2ZzlIRitZRXluN1dsV01nOXNZeG5SWTlTNVdmUklXWTRO?=
 =?utf-8?B?Zm1FYys3WUJRMlo5U0E0cFpxUjltVERxWnhFOTVxc1lSS1hhVTVnOE9DSUUv?=
 =?utf-8?B?dUlhSXA0dHdGdjF0emwwTWdEVGh2cndsRVN3a0NXOGJRazNGdVFXRkdaOHFv?=
 =?utf-8?B?UW1NTWdGU2gvU1ZwUWN4N3hsZEI3UVZLd3pmZFU5anR5eFNuVmtWUWpHWm45?=
 =?utf-8?B?d2g3Yy9ibnN2UTUwNldEZGNtS3ErQmxWd1pXN01GaTNmajRaU2kyMmZobkMr?=
 =?utf-8?B?QmFwK1NhWklVaHVYZytOZTlCMStiQUgrSHB1NCtHUW9KZmFZRHVvdDhpczdx?=
 =?utf-8?B?dDVVNlRXdUJmYndYUk8wZEE2S05RejZyb1BURjdmNjJUclhiRnRUd1V6TEh3?=
 =?utf-8?B?TVNQbnV0UnF6bnpXQ1RuVyt0elFUdnpRdG5EWDJKbGRGSURsWHZ6S3FlWlVl?=
 =?utf-8?B?OUpQRFRYTEFzb3U4YzRrbWR6VENFdmxwK1Z0eHYyOTlySXZuRG1LSE5Tc25a?=
 =?utf-8?B?M1g3MTFleHA3YmNmZEFrY3pHdVMvemxReWZWTHlYWnRNOXR4Nmt2bERQaEFq?=
 =?utf-8?B?cllZV2dGZzkvNkIzZ1Q1RjVaekZGZStkTXA0bzBhRDRsNnpRbjl3b2t4Qnpj?=
 =?utf-8?B?QmlPMXVFN0E4cG5jUmJ6M0FQOFpFZG1KY29pM3hpQmlSVDZQNGZNVEw5Rm1M?=
 =?utf-8?B?eFI2RVBmVTNkNjlzTkVORHd3c3N2bVF1Qkd5VVNkdjFkMDJpb1FkZGtsU2Za?=
 =?utf-8?B?VGVvUmhWcnBmUXhCaXhLeTNQQWRLdWk2VG9TSFlJc2pVRHpzM3ZlUHRhenlU?=
 =?utf-8?B?MHVuRTZ6YlU5YUU1QUEwdlhQUWhxU0RkNFh1ZzdJZERGQ3Y2QWZhWHlJTVRk?=
 =?utf-8?Q?iSYHLZ4ftJhEXSA3u3Qoo+aFW0CRjTYQLH3I3un?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bb1b57-d84c-4120-de3b-08d8ced3d2d0
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 21:27:24.5052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqHyp+HJyQczsky87egPw4fjFDu9ziYYKESOorVoAOtHEpu5dEIkEzgBrqZnBPjHdSHBttWWt418vTGTyw7hmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4988
Content-Type: multipart/alternative;
 boundary="------------8DCF1931C3F8A9A9FBB9FB5D"
Content-Language: en-US

--------------8DCF1931C3F8A9A9FBB9FB5D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

has to do with rsyslog and systemd, was able to reproduce locally

looking into it...

On 2/11/21 12:28 PM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> fails in install
>
> https://errors.yoctoproject.org/Errors/Details/570348/
>
> On Wed, Feb 10, 2021 at 12:42 PM Yi Fan Yu <yifan.yu@windriver.com> wrote:
>> Ptest Results: (Timeout 800) (qemux86-64)
>>         2006 2012
>> ================
>> TOTAL: 411  424
>> PASS:  361  372
>> SKIP:  39   41
>> XFAIL: 0    0
>> FAIL:  11   11
>> XPASS: 0    0
>> ERROR: 0    0
>>
>> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>> ---
>>   .../rsyslog/{rsyslog_8.2006.0.bb => rsyslog_8.2012.0.bb}      | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2006.0.bb => rsyslog_8.2012.0.bb} (98%)
>>
>> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
>> similarity index 98%
>> rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
>> rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
>> index b6c2a991f..5c6af5dd2 100644
>> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
>> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
>> @@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
>>       file://0001-Include-sys-time-h.patch \
>>   "
>>
>> -SRC_URI[md5sum] = "33de768941953ceeca9d1a437b47891b"
>> -SRC_URI[sha256sum] = "d9589e64866f2fdc5636af4cae9d60ebf1e3257bb84b81ee953ede6a05878e97"
>> +SRC_URI[md5sum] = "2a64947e3d157c0198609aabd37be42f"
>> +SRC_URI[sha256sum] = "d74cf571e6bcdf8a4c19974afd5e78a05356191390c2f80605a9004d1c587a0e"
>>
>>   UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
>>   UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>> --
>> 2.29.2
>>
>>
>> 
>>

--------------8DCF1931C3F8A9A9FBB9FB5D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font size="+1">has to do with rsyslog and systemd, was able to
        reproduce locally</font></p>
    <p><font size="+1">looking into it...<br>
      </font></p>
    <div class="moz-cite-prefix">On 2/11/21 12:28 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMKF1srEG-AjncSrtS1jUsnFgtbXA11jDEi5oM8cpr5wxEHzLw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

fails in install

<a class="moz-txt-link-freetext" href="https://errors.yoctoproject.org/Errors/Details/570348/">https://errors.yoctoproject.org/Errors/Details/570348/</a>

On Wed, Feb 10, 2021 at 12:42 PM Yi Fan Yu <a class="moz-txt-link-rfc2396E" href="mailto:yifan.yu@windriver.com">&lt;yifan.yu@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Ptest Results: (Timeout 800) (qemux86-64)
       2006 2012
================
TOTAL: 411  424
PASS:  361  372
SKIP:  39   41
XFAIL: 0    0
FAIL:  11   11
XPASS: 0    0
ERROR: 0    0

Signed-off-by: Yi Fan Yu <a class="moz-txt-link-rfc2396E" href="mailto:yifan.yu@windriver.com">&lt;yifan.yu@windriver.com&gt;</a>
---
 .../rsyslog/{rsyslog_8.2006.0.bb =&gt; rsyslog_8.2012.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2006.0.bb =&gt; rsyslog_8.2012.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
index b6c2a991f..5c6af5dd2 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
@@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = &quot; \
     <a class="moz-txt-link-freetext" href="file://0001-Include-sys-time-h.patch">file://0001-Include-sys-time-h.patch</a> \
 &quot;

-SRC_URI[md5sum] = &quot;33de768941953ceeca9d1a437b47891b&quot;
-SRC_URI[sha256sum] = &quot;d9589e64866f2fdc5636af4cae9d60ebf1e3257bb84b81ee953ede6a05878e97&quot;
+SRC_URI[md5sum] = &quot;2a64947e3d157c0198609aabd37be42f&quot;
+SRC_URI[sha256sum] = &quot;d74cf571e6bcdf8a4c19974afd5e78a05356191390c2f80605a9004d1c587a0e&quot;

 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/rsyslog/rsyslog/releases">&quot;https://github.com/rsyslog/rsyslog/releases&quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot;
--
2.29.2




</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------8DCF1931C3F8A9A9FBB9FB5D--
