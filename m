Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.50])
 by mx.groups.io with SMTP id smtpd.web09.1059.1614621060209409913
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=F5f4WV11;
 spf=pass (domain: windriver.com, ip: 40.107.243.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4HfGXrHpzdlTws3hDEZw1jeasIs6IprZhPOntjemv00iKcyN7rqUqH9bgn+l8UHoTjUMZ10g3Nt7R2ey81AQiVSHQ/xdf4sbz+nsSe3F1nRNoioFljrMUJtAlWAFbwAayqtq1d/3lvoV4K8wAk0pCQqlXN5TXOshKX0XifBmgdghBCY7gHV0qUrz3zVo8Fr1Q1ndjpXfEFjXQ4dcQ1sJPN1bsWWndiSerg/XqKzJg0m5QgHvdk4V/SYa+6OEAeW6jucoGCIvDKTF5kQdGX1Q0aQ2ZwYxXciO45IeU92cG3heWxyChdUlGM8hApz5qWvWfeHgagWUf68TXHUnu67Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDYnYcoDxAbBa9ZmwhIkMWKJsaSQo1bH7zzPQZYklDo=;
 b=NAmir6pKu5So1cteGwq/JTBHIdOH2kjdct5DFD72f+Ddrb50YAqX4Hlw6LMU5IK3U+vb7EIZEbJ0498NYxIo+3DfBOfmFdsxZTZW8p0vyo3ZrEtzQ2jPtKENIms1FbLANJPVZzQ7TJukyGGtMIgpVcyK5fe+mevqGMJN4QEB7iLrajuXx+lXB1azsAegArdMYa05EbQfMqxcQTWxKGUGQPSNg6lRTpSrS5YaVVsh0HjgxMQZGpJyRp3/vlKu2uGWwi7+LSwr/5HEzACZaCo0LQ1BIXZKLcEOE0hZ0KLhJ5aoNbTH4PEOtzTgaQIJDCRDaXKnfsfg8fxKn/1clYzCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDYnYcoDxAbBa9ZmwhIkMWKJsaSQo1bH7zzPQZYklDo=;
 b=F5f4WV11HfkCLlAweFJ/EdzRhR9RSILMD3QNyTPTc7t6m1xUwKGv9JoOGoEW2L+sePR+sY8VuswBQ+Ty8Uu90ykUiZyeds5YF6zuR6QM9ojbqQqAjEgz2nkCTegMISLy4RT/TsNjG8O1vuRl0VdxcO4JFpQSrCkckkrZJHU9lGE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3557.namprd11.prod.outlook.com (2603:10b6:a03:b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 17:50:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:50:58 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-tqdm: Upgrade 4.57.0 -> 4.58.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210226110931.6287-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <322cf4f7-add9-b107-6304-6bc2c60d8980@windriver.com>
Date: Mon, 1 Mar 2021 12:50:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210226110931.6287-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR19CA0074.namprd19.prod.outlook.com
 (2603:10b6:404:133::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR19CA0074.namprd19.prod.outlook.com (2603:10b6:404:133::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23 via Frontend Transport; Mon, 1 Mar 2021 17:50:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f0bc234-8b6c-4433-5599-08d8dcda9227
X-MS-TrafficTypeDiagnostic: BYAPR11MB3557:
X-MS-Exchange-MinimumUrlDomainAge: openembedded.org#6614
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3557D62BFBDC5532BA27FBC49F9A9@BYAPR11MB3557.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tD+9IMPhOVfOmNzNWBfnBBCRNaUCdy7WaUZorRBtcjd0g7ytrs10A5u9zcsqwrwf0BiM6j5Vy5R8ASuvxdLG8Kyt4+FEmiE4rk/ekstNGgK0+VhKsX5Kxs+H0GfM9jvCA6oD4xzkXdnjBkhlN2czbtyzt6LyCKLl7ogHWpLsq5AT0/RRrLM/+jh2RKCu9Ul8f9fMoSE3ZFCq/ahU0C9XsonnaCo1QfR0UxonGdr4HaZTbrqSQ4DxbNcQfE2O23anOezs0pjwxfbpRDQolpVfLTUw/NTTKhHZUxpH0ucDCF8L2ZwF2Yn93zh26JEacoWrLvyLYxoU/eVgYbGLc3TaiphFNCN+Q86F/G790bbkg8N8iHlEIWqgryZEKoPGXSgP3u6Ns1Wbl0FayYARzPX3cIAVkSYixIMPukcu2ZvzBDYu3OBP0r0JuOIr24tCKozlZmezPIdMWT8wl+g8SmIhKgypzjVIAbDFUyxw5ml23g9mjMxHxKG5hI/eQ43wwnaF9L3oycGH8sOHjqo2xMmSrtQOisVr8xyVnQ+2FPZLOQLsheHdlMFTzFWx5930/Y52GRUrQ7j85Y4vYImGBW6UTIbUI0EQALeF4c1GRSScQIN87ds6OdLdrSnm1BFY1xILNdzm71BF64X1R/Vqp4QlJ6fDGFSXraTppIBnblM96/14Kggf8t0/SWlzA1HWN+Hy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39850400004)(44832011)(478600001)(8676002)(166002)(26005)(33964004)(53546011)(8936002)(16526019)(186003)(83380400001)(966005)(6486002)(66556008)(66946007)(956004)(31686004)(2616005)(16576012)(36756003)(31696002)(86362001)(316002)(5660300002)(2906002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bEpocGtVdzY4VElnUlI5d1ZVaTNVSU5rQnhPUXdpZHM2YkdUc2xNdENJaXdD?=
 =?utf-8?B?dlkvOUVBQUJVYlBjQ3lNSHBPTkN2Ujc4czNncVRKU1UwZVM2T01ydTdSVEVp?=
 =?utf-8?B?N3NDMU9uTUtOQ1p3ZlZTTURiUXBwRzZ2b3FaUlMzVjdJWWV5cFRpTEhHU0ww?=
 =?utf-8?B?UUxEeDVTakRiT29KNHBqVy9HbVA2VlFVSGZOT2NIUkRyVExUa2JmL2tnTW9G?=
 =?utf-8?B?R1JhS1JXK2RYRkhvN0J5Y0kwZVJUMjdVSTg4MWxHZjU4VjVTZjRFdFNKUzBu?=
 =?utf-8?B?Nk5kamVFUWJSNzdHYWM0bmlpYTU3c0RrR2MzYkd0YmJtSnllMVh4ZzBoNWpz?=
 =?utf-8?B?ZWNURUZQbW9uMW1JK0VSODE0cDFPMzVtL2N5OVNWY094aGhKN2NHSjI2SnNN?=
 =?utf-8?B?WmcwdGYrNUxXcjI2a2JGUjRMcHlXTmZGN0VzQUVTWXRFckdURmNBY1liTExZ?=
 =?utf-8?B?dXlkdStLSkRwVDk3cnp2RDlwa2d3aEh6eDJzYWpIallrYVNSZ3JQR296eit0?=
 =?utf-8?B?WlI4OHZiSjlkNkE1U2duK2gxNmxZUXBpMWpPUUNibGFyUzh0a04wMHRxRGdB?=
 =?utf-8?B?MlYyQzc5UkJUQ1ErNHZWelZGVlN5ZUQ1NmJTa1l5RU41VUdzb0RIY0FDWmxk?=
 =?utf-8?B?VlEyd2tXZzVHN3pNYk9HZlJLSUhZcXN0bmdZM1J6cmNoZGVDVzFtaUI5VzFw?=
 =?utf-8?B?MzYxZkVPSXNVRFlpVUdQS3p1dWZDVkxLdGFRZ25NT2dCV2FqaXNuMUVKSldV?=
 =?utf-8?B?Z3ZvdEppa2RjOHlRclZzT2Vrend0eThEU3cxeXkvc0l2L1E0cERLdVRVT1Zo?=
 =?utf-8?B?NVlPMXpZc2RhdkV5ejhUL3QyZXgyekRSc05kRlREMHlnUXJtendROEZYNE1R?=
 =?utf-8?B?QVBVU1I1Q3hmdzF5NEgzcVdBSzNtUFRIcVI0aXMxR2hNQ1hicmY1cENtY0p5?=
 =?utf-8?B?Y1Iwb3dpendhb05uTjRETExwZUQ5TENKV3R1eGdZaUNaNnVIZkxhWStrOHBu?=
 =?utf-8?B?bXdWZHJrRjY0Sm5xbzZvL2prR3NFM0Q2WUI0UjZkWXFLN3QzM0hvM1IyTmlu?=
 =?utf-8?B?YVR0NEFXcUNGekdBZDFIUENIUmdWVFJpeHZqUFJNQWJZb2NYUUIwVEw3TFdr?=
 =?utf-8?B?WFJVNUYvckpocG1NT0E3OEwyeTd5RFU0TllpMy9LOFNZbHpJVi9waGJFVGJi?=
 =?utf-8?B?Y3U5cjkrczR0Z25xcWhadUtNZ3ZJTmEwbUJCTlloZXVWUWRITDFoMWQzRlJH?=
 =?utf-8?B?VGVEdFpWQkdGbFVFY1pkMjEySGJVc3dwRjlzdmpEWTE1dTlvMkpBeGo0bzNO?=
 =?utf-8?B?eDdxR1M0VUsrV1FzVVBnemF4cFJJNVV6enZmQjl3L0JNemRUMDBKTThKcERn?=
 =?utf-8?B?anBlZ0c3MXptblluTWY3aHN4T1lKVGRDcU5lc2MwN3VvVHI2aEhKTjhRWnFq?=
 =?utf-8?B?QWhVTVA1b1ZKR2g1NEtlTGdZejBBZXhxY1YyNFNuUzZHVnAvVTA3RjFEMGxo?=
 =?utf-8?B?VDQyZFV4b1FFWHRPRHR6Z1NEbmZBZHVReUlDTGtLeDYvaUNPSFpOMWhTNExT?=
 =?utf-8?B?SDY5SzFIQ2N6TGExdUN0b2J5N0d0OXg1L1ZIbS9LQXJselNjcTdEOUY3czJz?=
 =?utf-8?B?Q0ZCUmdQeDJ0bTl0VmpkcTBEb2VWNWdNVjNwMlFSN241eHdNeTN6b1NEaDRp?=
 =?utf-8?B?dTVLZUR3M2s5MHBUQXUwWjBXV0pnWWhhRkdOaUtYNVlzYzVNTkp3VWdkcjl5?=
 =?utf-8?Q?JWVSjuZGVRFWGxwvmSYxvDCn44rOCW0RsZ73qBd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0bc234-8b6c-4433-5599-08d8dcda9227
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:50:58.7456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ahy0/jR9QEnCTI7EBoWytxxibC/iy37tfcWMUIkte3sQ//VNu/1Tr8o/qf+RdN41ZnvmBkYy3QMh0Fvd/8zg4wSq4ScCt0WUd80W9VUlMQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3557
Content-Type: multipart/alternative;
 boundary="------------8D1082AE020D9D4E504151F2"
Content-Language: en-US

--------------8D1082AE020D9D4E504151F2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-26 6:09 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 4.58.0:
>
> - add start delay in seconds
> - add tests
> - misc code tidy
> - misc documentation updates
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-tqdm_4.57.0.bb => python3-tqdm_4.58.0.bb}   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-tqdm_4.57.0.bb => python3-tqdm_4.58.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
> rename to meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
> index 50133bdadf..771016962d 100644
> --- a/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
> @@ -5,7 +5,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT & MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
>
> -SRC_URI[sha256sum] = "65185676e9fdf20d154cffd1c5de8e39ef9696ff7e59fe0156b1b08e468736af"
> +SRC_URI[sha256sum] = "c23ac707e8e8aabb825e4d91f8e17247f9cc14b0d64dd9e97be0781e9e525bba"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------8D1082AE020D9D4E504151F2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-26 6:09 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210226110931.6287-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 4.58.0:

- add start delay in seconds
- add tests
- misc code tidy
- misc documentation updates

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210226110931.6287-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-tqdm_4.57.0.bb =&gt; python3-tqdm_4.58.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.57.0.bb =&gt; python3-tqdm_4.58.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
index 50133bdadf..771016962d 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
@@ -5,7 +5,7 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT &amp; MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=59e4271a933d33edfe60237db377a14b">&quot;file://LICENCE;md5=59e4271a933d33edfe60237db377a14b&quot;</a>

-SRC_URI[sha256sum] = &quot;65185676e9fdf20d154cffd1c5de8e39ef9696ff7e59fe0156b1b08e468736af&quot;
+SRC_URI[sha256sum] = &quot;c23ac707e8e8aabb825e4d91f8e17247f9cc14b0d64dd9e97be0781e9e525bba&quot;

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

--------------8D1082AE020D9D4E504151F2--
