Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.50])
 by mx.groups.io with SMTP id smtpd.web12.11361.1610468145996467717
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:15:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dk95BwNR;
 spf=pass (domain: windriver.com, ip: 40.107.77.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLUkxA6rquam9kazkKY1sJSntmPBoLsNYa0wioUxVPe/mSDHMQypm4l8xLP2JmA0uEx2FSJtP4wABckRwrnuemurAuP/bnwLZ4LUXjTCS0HaeRxn2MlOBueWj3XkxFmcHn83eIUsGj9EN8ZioXAz0Nv6kA85b8WtfGi4yeXesIPy0Q9sYSlzywvjHYQoyKvvdsFrdOB3sLVLlf4YpX9MR0ojV4706MBCX6qMAxT2uO/NUzLim/AskWDHmsX9kltrh5cJQ8rv1gCA5j5YS1mh3p73O4hiswTPllENM3aHuiB7KOQQIerYy9VH1trrPchtRGyF5gFoh7rqpyILvudDSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgpY00auB3AGopqUlBUBRnSq0mjso2GNzO2GDYhoY3w=;
 b=Sbk1Oeg35zWJMwxZ7bLMQtLKqZTGEkOfgc2+ormkU635tCGwzp1+HO+KPaVurNvAyNrVZ2hPc36iRRhOFbOYb882XLNg8iIKUCT4guOJKc3INNOibv9V/qYMsQCyxnwhRGEG3b0BLRaG6qqfG5p8g0vlFRv7Sr7y4jah5WwVGI0auRjIS8WRL6RefTfM5n2Abxv7FyOWuotqOvww8nAbvaUC173fXlhfSvrr53ALZBW02DlUL/iV4JDKXgznen7IbHBBIFbLagQiOpclx2mEbjdwvKbvxPaeitAbMiPYLUFWiwDKNo4HaZQjvc3R2NL91ag3zaiaDjNkF7FfgfaRhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgpY00auB3AGopqUlBUBRnSq0mjso2GNzO2GDYhoY3w=;
 b=dk95BwNRcWEJW4l4TU3lcDf2SlSXbMw4eaFtPzOH1hBYhhAf1Trg7BGa6W20WfdWvpxZYhwkK/82xbKzxwLwHl2aHYzcRqieWACP8CwhxrXMy9w/a/2ASMmuJjijMdRyu/ahaRelrwAOLKt7C9CZktFjJQlDl9kxd59tVIly0xI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4370.namprd11.prod.outlook.com (2603:10b6:a03:1c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Tue, 12 Jan
 2021 16:15:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:15:45 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-certifi: Upgrade 2020.11.8 -> 2020.12.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
 <20210111152512.23506-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4a847954-e47d-89c4-ac8a-22c10237c11a@windriver.com>
Date: Tue, 12 Jan 2021 11:15:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210111152512.23506-8-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:c0::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:c0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Tue, 12 Jan 2021 16:15:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef8c8d84-dc43-4bc2-150f-08d8b71550c9
X-MS-TrafficTypeDiagnostic: BY5PR11MB4370:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43703163E8976DBB316D36559FAA0@BY5PR11MB4370.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SD6Oh2nAA8gU4uRNqJpEXLmTlkigDJg3+d3WAmAXvnhbj8DWoyB0nGpXYpsxKfM2qvGjMvvJCLLc9sUF1PpFdGPfx8dTejfE7tYe7dDmIPvL9BMhBLT0gP4Gu6EHlXMHIP8kuRUcKHxczyFSCjVoQSy2xqEljuErzkInTr9ehCeep6OgeD3tklFAeObQhWvxPHozPHkHw1b4H+Zrk5UjRxBpQ7Mvqjo+eapVIzVwoQWDTduXcOvsIP+5QhCRvZFnFoCulQmkKa5SKaUzL9TMJSQz8RJ9oMGi4q5+rOwewFo70NYvCqx79P4huVNSLtm+4bGfhL3R9Z1IBwMFjcsfknkdbakf57DtPxj1xzQH3OKY5RGahgS6AqQYruDhHYNjxj245WDwhH1co4rmZ4vCbaUFDChLI1UuJpM0gHxyz34Q/Tq8peXkhW4PeyXhXGecVw1d715/r7c1DbgkL+m5vGUL0bd5pwU7phEF0KN88ARZpOKP1HUEM7CDw+M6USfXrPioSlZxKvGOLt6Hh/0Hqg2Mc0zILS4Rv38beFcqJu8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(376002)(346002)(396003)(136003)(53546011)(956004)(2616005)(6486002)(26005)(186003)(52116002)(8676002)(166002)(5660300002)(16526019)(44832011)(8936002)(83380400001)(33964004)(2906002)(66556008)(478600001)(316002)(16576012)(66946007)(36756003)(31696002)(31686004)(86362001)(966005)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VlFZNVpSVXI2eE5YNlNLblk3SVdaMzF5Z09EYnB2Tk1PbDVzbEpVUFBXUUZI?=
 =?utf-8?B?dHZIVno3a3FnL3JoYzZxUjVOOE5wTmZITGowbFY2R2F0NHhudzdXcWFZTGdm?=
 =?utf-8?B?SGNXRVAxWTNnU2VzT0VJUDRVTVR5NHRpOTAyejV5aFpkbEVuaXBCOWxxQXZQ?=
 =?utf-8?B?QU1FczNKTTV3Tm5iRm9LTm55ckZSZS9WZzZoaHEzenBuYUMvb0t4cmJidkFM?=
 =?utf-8?B?cUhCb1hxVnZWRlZORFFCZVM1Mm44Ny9nUFNsMjFJcS93TTJLQ3R0VGdUek4x?=
 =?utf-8?B?ajdJODVxNFpFUUlmVHBEZmRzN2lWSmxPVTN6eG1Md0Z1UWYyOTV1ZDNJTHc5?=
 =?utf-8?B?Uzk2SVpBOXo3bVlFbzhlTWdzVWw5WHhoOGIrWGVlUWI4UzliWWFhOE15WEdn?=
 =?utf-8?B?eWk5MHJuZ2R0ODRXRzAwdmtVQ0UveXZLdmp4a2FicXR0QUdmdlBnRjA5N0ZM?=
 =?utf-8?B?R0dGSVJsRTZtR0JSalpIQTRXaG9XNEI0bXRvOVE2WStSZ3EzR0lWdGlvNWNG?=
 =?utf-8?B?YkxqMTBweG9lS3lORmtnL3ZZSDlSZkdROXpvdy9xNS9aUWJaRlpmY3FjRm9i?=
 =?utf-8?B?QnlIQjVBeGttNXAzZVpDWTdtL1krRU05OFowMkRSZWhWb01Cd3AwUTVtNEcv?=
 =?utf-8?B?c0xhSHNwU1NWYnV5QWZOWlVKWjZBQlVCM1gxd2NaUk1xRkZ5b1U4Unl3SGtV?=
 =?utf-8?B?ZDMzcWt5OGU5MnhUTFFZUmNpWDNwUjd5S1c4bUxodWpxdHh5REVSaDg4Titk?=
 =?utf-8?B?SE5pQ0lqWmdNVm1WbURPWUpmNE56WlVIbzB4dXVyVEt3R2RtWGg1b0RWaldY?=
 =?utf-8?B?VHJGdHdoVWhkazVWQksycnpiLy9vK3J6ZEdobVVZcnRCdVlRU1RBZndudnJT?=
 =?utf-8?B?YnlXLzRQTllQWUF3NVl0aDVoSnBSc0JDdHlsOFNoVmkwbkpkNUg1cTVrSTJG?=
 =?utf-8?B?cExVTUFXc05jaGUwRU1GOXpjclBkK1hFdnJINlo5MmlQdThtRHptUEtmdVNB?=
 =?utf-8?B?QkVNNllldDdidTVaeUluTTl5V0lGTjhFVEw0T2NSU1lXWXBpamx1UG1Ka000?=
 =?utf-8?B?Um44c1Y5aW5iUDM1OGhLTVc0dGduMm5TbjJYRVZ1UWdCbzJEOFNGZEhGNUNK?=
 =?utf-8?B?Y3FxelVJSDViWWtjeU03MDE1eldOWEZPS0tzOVYwTjlIcVYreXd0UFF5TWVB?=
 =?utf-8?B?TVhIN2FBbmRYNkV4a1RFV0lsb3dsRnAva0luYmxFQWEzN251UEZnT2Q5UHhv?=
 =?utf-8?B?NkdUY3gwQ3Z2OFdaaFBGSmFJMS85d0FUT1ZQcEMzTFlPaTNrKzEwaHY0Z1Z1?=
 =?utf-8?Q?NI1QyhCSfbMZGTLoT3h9I/BfKw2esy8A+h?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:15:44.8847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8c8d84-dc43-4bc2-150f-08d8b71550c9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHGzuMnGeV++M/2XQWHuLB3WJc8E32NgeyzJCahHAI9aQUzsgHQ1F90aJ/LhUuguYdh0AyGiWF8IA5CUmpza3/I/koDPllF2l/ziewn+59Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4370
Content-Type: multipart/alternative;
 boundary="------------302475FAE66313643DF29A4D"
Content-Language: en-US

--------------302475FAE66313643DF29A4D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-11 10:25 a.m., Leon Anavi wrote:
> - Add 2 basic unit tests
> - Add Github workflow for pytest run
> - Various cleanups
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-certifi_2020.11.8.bb => python3-certifi_2020.12.5.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-certifi_2020.11.8.bb => python3-certifi_2020.12.5.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb b/meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
> rename to meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb
> index b680fade6..dd2f6a2f6 100644
> --- a/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb
> @@ -7,8 +7,7 @@ HOMEPAGE = " http://certifi.io/"
>   LICENSE = "ISC"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
>   
> -SRC_URI[md5sum] = "b25267355218d11652c707e46accd059"
> -SRC_URI[sha256sum] = "f05def092c44fbf25834a51509ef6e631dc19765ab8a57b4e7ab85531f0a9cf4"
> +SRC_URI[sha256sum] = "1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------302475FAE66313643DF29A4D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-11 10:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210111152512.23506-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add 2 basic unit tests
- Add Github workflow for pytest run
- Various cleanups

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210111152512.23506-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-certifi_2020.11.8.bb =&gt; python3-certifi_2020.12.5.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-certifi_2020.11.8.bb =&gt; python3-certifi_2020.12.5.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb b/meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb
index b680fade6..dd2f6a2f6 100644
--- a/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
+++ b/meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb
@@ -7,8 +7,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://certifi.io/">&quot; http://certifi.io/&quot;</a>
 LICENSE = &quot;ISC&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1">&quot;file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1&quot;</a>
 
-SRC_URI[md5sum] = &quot;b25267355218d11652c707e46accd059&quot;
-SRC_URI[sha256sum] = &quot;f05def092c44fbf25834a51509ef6e631dc19765ab8a57b4e7ab85531f0a9cf4&quot;
+SRC_URI[sha256sum] = &quot;1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------302475FAE66313643DF29A4D--
