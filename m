Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.44])
 by mx.groups.io with SMTP id smtpd.web11.4935.1613142555921574580
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Feb 2021 07:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IQ7IZHyv;
 spf=pass (domain: windriver.com, ip: 40.107.75.44, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcgorFBo+nZa2LL1cdFrq4OsZIsBSdAYl2GLVwBlIOjb2800EshiTqmpu9aJPSLq9oztVNaP4IOnp9FMcku3zgP4IsWaiyMBKRg+/TMFQct5J7nPw7BU+4usqDFBgXp2wvp1MiGYy987jlyXFJmOLBpzv22sKfTL5WA0CVfUOofM9h1V1Otg9PpaCrSNwQowVuUpKr5qb+0Rujdqe9QxYwVx0XIjLrgqm0xu//XOdRw3rQnL0M4Wxfg4h2322INb3511LU5sTtnZt7N5dDhvijN1lT5tmK4nbIVI3l6rnYL0p2XeYNQj1KoDqcajnkYe4GkoirrMfdfDy4VzgkRi3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iql3lCccJyCMqM9MHaloZHA44tMGZqgp1babkfQB4GQ=;
 b=gcJw9hZyUWnAb/iPMCrbVOoAudq0AOsyXxBIw5pPt37Z98tNg80xf4l6AtZSoetyBieCmaHXYeKmPNNeTOK8OSU/HlaSjBMkCuTkA3OISLeApVIAr1UqaLYQUgdR2eVp6YxlCrx+kfZgJpxT+46sVpTYmFkOm7g/Oy8B1U3DpNWFb9ynthprYmiKGtr3MxMH8ZfYLJAKxtcjQZrFk9N+KJSLtYEy3K3aQ71OBHFRLEvs4Ey31iw2B6KJ+TJBJF0jvy5MI1cX5PMaRbXAKJiAoAVdWzF6oPcGJHZSdntYsQYnySbDLatewF/fHKQXxc2NlhzSOOj6DX/lFf6g03nRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iql3lCccJyCMqM9MHaloZHA44tMGZqgp1babkfQB4GQ=;
 b=IQ7IZHyv/U6K6rtwL5toixlF4DW99cSIJpQhhRcGyOTmcz+B6uWu6dlx7TGp+55Dz/Jp/pMSbTKlF6csSIhtI6Y4na2GtMyJrjCasCsvLVHCbwGLWEUPbsWucAzmx0XuNCrefjzSLO2F56jGFTxm/Af4K9IL+LzMKADGNqS08Jg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4703.namprd11.prod.outlook.com (2603:10b6:806:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Fri, 12 Feb
 2021 15:09:14 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%8]) with mapi id 15.20.3846.034; Fri, 12 Feb 2021
 15:09:14 +0000
Subject: Re: [oe] [meta-OE][PATCH] rsyslog: upgrade 8.2006.0->8.2012.0
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210210204201.8468-1-yifan.yu@windriver.com>
 <CAMKF1srEG-AjncSrtS1jUsnFgtbXA11jDEi5oM8cpr5wxEHzLw@mail.gmail.com>
 <1662CEAA3FA1A259.16572@lists.openembedded.org>
Message-ID: <1806926a-9eab-978a-1316-0beee27c6bf0@windriver.com>
Date: Fri, 12 Feb 2021 10:09:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1662CEAA3FA1A259.16572@lists.openembedded.org>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: BL0PR02CA0110.namprd02.prod.outlook.com
 (2603:10b6:208:35::15) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by BL0PR02CA0110.namprd02.prod.outlook.com (2603:10b6:208:35::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Fri, 12 Feb 2021 15:09:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeef77a6-8845-400e-5b7b-08d8cf682884
X-MS-TrafficTypeDiagnostic: SA0PR11MB4703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB47037C1CB7363E96A2787BB4808B9@SA0PR11MB4703.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8dJGQfD8MMbpXYZUl2APNsXVrMJhG/wMn1288jllERJGRL4dlkWqJPEXlB0SkqZn2dTRABfjdamwZQISF6Q1Khz6YlHJ9GJnJ5yRaqD3FXjkKYRrldxljenaL4cKou3sQkSznceElh1JCAmV2Dn2p7BdDqnvhPI+anLU6Y6KR6pN6ajLAotvfpZ6E3A+fQTwdYT7rgBVSk1QFeF1whvFoJ1B2AO5qyuJiz9PW+Fpl5qBaKrjIU6fF4iRLiB7cj/lwpEgUdTsV2CXz0opHqeeoSszpIpigJ/PaDS/6wHaTeBOL8yvrRP/TsZz1B59xVzXt82t3Y/W5wp2046Db09SAPVKpYn5ZA9H8EyfG1CRqLVqbbPuP1s33m1M0vEXMtO62z0C6SWsacKIiEueRIKUqIbDNjSrLNuu9xJT2KcQbDeWkMaw1tFrA4sjvblsWGNQMaiHgMpZedMn3crHMRyBDUgWGePMfjKD7AbcP9/YaIL/Joa4IyyhFOpPcCXTZ3STzT0fQE55xqJzMz5d8jfjexFryTHxHb945ZupxyGjIJc/v+SokSmVMHWgHrSkkSQqRWbREp4LgLjK7+dMmfQomgncGnzM279PG2woXgVXQNlrw02MvwOtGT+sp7nwGEL+9bcuq0Kabb6DPvGG7ICtJq2VVbXs4YqaezqVk0PXYK69uyygyVQHG42f4gMt4dc9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(6636002)(16526019)(66476007)(2906002)(26005)(186003)(6862004)(316002)(478600001)(6486002)(31696002)(4326008)(966005)(36756003)(66556008)(53546011)(5660300002)(8676002)(83380400001)(8936002)(166002)(31686004)(2616005)(16576012)(86362001)(66946007)(54906003)(37006003)(33964004)(956004)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Rk1GSWNlU2FJVnAvUlpYOHBRMFMvMVlKWUNGSmxWR3c2a3JEb0xOSys2VDNV?=
 =?utf-8?B?Yjc4TVRWcFIwWXQ1R3J5dlRLWW1WYUhMeXJVWFVFTnZQRXFiSzlhcGpOMzhZ?=
 =?utf-8?B?d1VyeW1QaFFTUmlWd1FBMkplajF5dmtUUWVwelcxNFdic3FYalUrWjdMcXFu?=
 =?utf-8?B?all2bHZKSlFTTnhxWWhXaUx5czcrK1JVUUJnZU1mb2dESE9PdjZSVjJMTGR1?=
 =?utf-8?B?b0tmZkpscGpKUU11L3VseG5LVWwvaTBNSWx4YVVzMUlrblk2ZEJZcFIzeDJ6?=
 =?utf-8?B?OGJwTERicjlTMVFTOEdodDNpL28vSWxnTk51YUNzV1Rqb3g0SXhMdkJnajQ1?=
 =?utf-8?B?WlFrNmh5NzFtVlFNZ1paVFMwbmg5SHVJMnl0WlQ3VHMzRFdoY25SOTZHTXNk?=
 =?utf-8?B?VE5QSDFnZkVYUFlwWG9ncjNyWkRRMVMxcGRaTk9rWlFqMG1xM0VUK25UYnlG?=
 =?utf-8?B?Z01MV09MbkMwNmJrZlk4ejVhYnpyNzBrMjlCV0RrbExZRWdCZlpZY1VwQ1lr?=
 =?utf-8?B?Ylo3b2NnYU9xSENzcWdPTzhGclAvRHlIRXNqbzJkcmQvM3FwazZHQVgweTJm?=
 =?utf-8?B?OHBXREVXV0dUNE9MTmVMM1F0WkJQdFR0N0hDKzFMdHVZTlhiSGM5YnpIL29Q?=
 =?utf-8?B?WVczN003VHhGREVNSzlRNTVaK1dVVHNkTmVuL1pWMDF0UC9aUlU2OG43b2th?=
 =?utf-8?B?MWZPNUF4RStZV082bzlmYVo1Z0ZrNlhmUzUwMVZTdEk0ODZhaHcyUW9qdEI3?=
 =?utf-8?B?RklISXZQZU5WVFFCZzZiek14ellQc0ltZTNzekdkTGYyRjNXS1hWeHdwUXBS?=
 =?utf-8?B?QVZCYTNnRHJxTGg4eThQaE1WdTRRcTBxRG9yb1V4NndTbnFrTmxHczhPUm1W?=
 =?utf-8?B?QzdwQnBMMTgybjMxemc1TnNRVVNRQnBNdjRWV0M5SlZ2dDYxNUJkajFBeWpR?=
 =?utf-8?B?WldUeDMxbXl0b3VDRjlKWWpyU0ZDNTA2aURaRWpEbnErQVQxREM0dVIxUVZP?=
 =?utf-8?B?dkppaUlIdGtuV2dKY2pudkVqUnB6a3RLWExxOWtvUEZtdnpNT09qQXJ2aVNL?=
 =?utf-8?B?aTZlWnhpTmZ4MEdQNjcyajU1cE43ZzI1S2hpcXcvazhqaHhkRHR3U1VvVW4x?=
 =?utf-8?B?ZVlaMW5rVFAyOEF2dE5SZ0s0UHc2OWtybG53NER1ODJKUnpsdnZsMXZOU1V3?=
 =?utf-8?B?WmgyVEt5YitSeHFmQnFBT2dBYVFGTVIwNWNWMWR1TnREem4xQmM5aWxSKzVH?=
 =?utf-8?B?ZVMrTEorZUhPL2d6aHVWLzhZRnZQOE9nK3R2Mkdjbk5uRkhwbkg1YWlFbE9P?=
 =?utf-8?B?NlZoTHBWL0N0a29KK3JJYWFhbERTYVVBWHFiN2Evc0Y5OXdwdXNWTW5OdTdX?=
 =?utf-8?B?aHJDR1VUdWVCMXBRUVNseWo5Qk0yREROTHQ4Y0ZZQ2dKNEF2dnF6cDd6dkNZ?=
 =?utf-8?B?NE43aHJMN2xIVGJyWStDeFBjc0FUeWZoTVJDWk9KM1lSaWhmeWpKczFBVDgv?=
 =?utf-8?B?Qk12TTVPaHlsWHpJWWJJR3NvNU93K1BYNnpaN3cwQmdFVXZkL3BwdGR0MkZ5?=
 =?utf-8?B?RmFDT1JsVlMyeERWbXRMVFZEajNHSjZlemZ4TW9DUjVweGE2V2drZXA4R3FI?=
 =?utf-8?B?eDVmWldoTVIrQ1crNnlRcG1LN1lWbFlkRHM4emhONFR2cHozRStRaHFUc0Yy?=
 =?utf-8?B?V3llVmQyTGpOSkl6WTYyQzJLV3BpaEZORERWbE0yWit1dU82SkxodlVGbmlK?=
 =?utf-8?Q?tw80gofnRN68zgdeUTaBvn834acCzEcKN41r3Hc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeef77a6-8845-400e-5b7b-08d8cf682884
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 15:09:13.9830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/lhEVb1EKfRH02xRIJHHiXUa2LEfLC0+nZ/Bonx5gdxSmIZCwxC8nXe1kzrq4ZC5Y3w8UAjWxknvTbOT9cxrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4703
Content-Type: multipart/alternative;
 boundary="------------D6DC55DBDD02D9E7F480847D"
Content-Language: en-US

--------------D6DC55DBDD02D9E7F480847D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

commit cfd07503ba055100a84d75d1a78a5c6cceb9fdab
Author: Rainer Gerhards <rgerhards@adiscon.com>
Date:   Fri Jun 26 12:39:13 2020 +0200

     remove rsyslog.service[.in] sample file


They have dropped giving a generic rsyslog.service to everyone and 
instead we need to provide our own

(they do still provide a sample file)

On 2/11/21 4:27 PM, Yi Fan Yu wrote:
>
> has to do with rsyslog and systemd, was able to reproduce locally
>
> looking into it...
>
> On 2/11/21 12:28 PM, Khem Raj wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> fails in install
>>
>> https://errors.yoctoproject.org/Errors/Details/570348/
>>
>> On Wed, Feb 10, 2021 at 12:42 PM Yi Fan Yu<yifan.yu@windriver.com>  wrote:
>>> Ptest Results: (Timeout 800) (qemux86-64)
>>>         2006 2012
>>> ================
>>> TOTAL: 411  424
>>> PASS:  361  372
>>> SKIP:  39   41
>>> XFAIL: 0    0
>>> FAIL:  11   11
>>> XPASS: 0    0
>>> ERROR: 0    0
>>>
>>> Signed-off-by: Yi Fan Yu<yifan.yu@windriver.com>
>>> ---
>>>   .../rsyslog/{rsyslog_8.2006.0.bb => rsyslog_8.2012.0.bb}      | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>   rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2006.0.bb => rsyslog_8.2012.0.bb} (98%)
>>>
>>> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
>>> similarity index 98%
>>> rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
>>> rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
>>> index b6c2a991f..5c6af5dd2 100644
>>> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
>>> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
>>> @@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
>>>       file://0001-Include-sys-time-h.patch  \
>>>   "
>>>
>>> -SRC_URI[md5sum] = "33de768941953ceeca9d1a437b47891b"
>>> -SRC_URI[sha256sum] = "d9589e64866f2fdc5636af4cae9d60ebf1e3257bb84b81ee953ede6a05878e97"
>>> +SRC_URI[md5sum] = "2a64947e3d157c0198609aabd37be42f"
>>> +SRC_URI[sha256sum] = "d74cf571e6bcdf8a4c19974afd5e78a05356191390c2f80605a9004d1c587a0e"
>>>
>>>   UPSTREAM_CHECK_URI ="https://github.com/rsyslog/rsyslog/releases"
>>>   UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>>> --
>>> 2.29.2
>>>
>>>
>>>
>>>
>
> 
>

--------------D6DC55DBDD02D9E7F480847D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font size="+1">commit cfd07503ba055100a84d75d1a78a5c6cceb9fdab<br>
        Author: Rainer Gerhards <a class="moz-txt-link-rfc2396E" href="mailto:rgerhards@adiscon.com">&lt;rgerhards@adiscon.com&gt;</a><br>
        Date:&nbsp;&nbsp; Fri Jun 26 12:39:13 2020 +0200<br>
        <br>
        &nbsp;&nbsp;&nbsp; remove rsyslog.service[.in] sample file<br>
      </font></p>
    <p><br>
    </p>
    <p>They have dropped giving a generic rsyslog.service to everyone
      and instead we need to provide our own</p>
    <p>(they do still provide a sample file)<br>
    </p>
    <div class="moz-cite-prefix">On 2/11/21 4:27 PM, Yi Fan Yu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1662CEAA3FA1A259.16572@lists.openembedded.org">
      
      <p><font size="+1">has to do with rsyslog and systemd, was able to
          reproduce locally</font></p>
      <p><font size="+1">looking into it...<br>
        </font></p>
      <div class="moz-cite-prefix">On 2/11/21 12:28 PM, Khem Raj wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:CAMKF1srEG-AjncSrtS1jUsnFgtbXA11jDEi5oM8cpr5wxEHzLw@mail.gmail.com">
        <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

fails in install

<a class="moz-txt-link-freetext" href="https://errors.yoctoproject.org/Errors/Details/570348/" moz-do-not-send="true">https://errors.yoctoproject.org/Errors/Details/570348/</a>

On Wed, Feb 10, 2021 at 12:42 PM Yi Fan Yu <a class="moz-txt-link-rfc2396E" href="mailto:yifan.yu@windriver.com" moz-do-not-send="true">&lt;yifan.yu@windriver.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Ptest Results: (Timeout 800) (qemux86-64)
       2006 2012
================
TOTAL: 411  424
PASS:  361  372
SKIP:  39   41
XFAIL: 0    0
FAIL:  11   11
XPASS: 0    0
ERROR: 0    0

Signed-off-by: Yi Fan Yu <a class="moz-txt-link-rfc2396E" href="mailto:yifan.yu@windriver.com" moz-do-not-send="true">&lt;yifan.yu@windriver.com&gt;</a>
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
     <a class="moz-txt-link-freetext" href="file://0001-Include-sys-time-h.patch" moz-do-not-send="true">file://0001-Include-sys-time-h.patch</a> \
 &quot;

-SRC_URI[md5sum] = &quot;33de768941953ceeca9d1a437b47891b&quot;
-SRC_URI[sha256sum] = &quot;d9589e64866f2fdc5636af4cae9d60ebf1e3257bb84b81ee953ede6a05878e97&quot;
+SRC_URI[md5sum] = &quot;2a64947e3d157c0198609aabd37be42f&quot;
+SRC_URI[sha256sum] = &quot;d74cf571e6bcdf8a4c19974afd5e78a05356191390c2f80605a9004d1c587a0e&quot;

 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/rsyslog/rsyslog/releases" moz-do-not-send="true">&quot;https://github.com/rsyslog/rsyslog/releases&quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot;
--
2.29.2




</pre>
        </blockquote>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D6DC55DBDD02D9E7F480847D--
