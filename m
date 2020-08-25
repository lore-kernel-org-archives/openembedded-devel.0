Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.54])
 by mx.groups.io with SMTP id smtpd.web11.12670.1598359538731297286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=o77th4sJ;
 spf=pass (domain: windriver.com, ip: 40.107.237.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmfa1mmWqC8v3QbY5NSc0GU2LH6j6LO/1TDV+LqWGDj6XRRbNmkqYhawIocv3g0rFobQxSkbQvUU1ejLQQpdXCA70D5QkWP/zqrSXX0BaQMmS7G+nqHmz8rlBPBkxlzkEXhm+SLEHkYOiWVBeg7OdRd3WuReMytIqyJMGt/mIlVrKFk/O1SC4umthiC/3q3Gi/C1sNREI4eE06sdvW4A7vxolQ1aetAnwt6khJ6jfBArwV9ZoioWFBPHELzun5ddYf193S010loHU5TEW7hJkHmzhgRlm2jlpqDivRCmawfStfN5UtUhnJuTw7J51/uIcNeqZODhPPigaWjcggxgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxzXo9VNNos6u/k/QNqtBQpntHaSm1ofPtAaoIZ31mY=;
 b=SHIHycYehL8WfxOTp/I/47losjmu//UDnzso7nlsI/6suDDjk4s5IS/ZllJnBCXdSokJKFL08ih4NRSsfIPB8T0UnDnvHA5m+DYyCDdy233tmt/fnJpO07iW6kSCXWb9Q+76XJ4hEiMYRSC3FjpiUC8CCMXy1LnfiU2GdXu3RQzs9HCAJgPLg6t1dLFEqb5ziO/ChyPqLYN1lU+ORMZs+xhGQ/Gl0H1FTlKJbelQxzyvoNbAtPBMJ8OsYr2g7CO1gaVFzl6Lqa/W7SITQzCEE4qoCH3dmjwgFrga9X3JLVdiYew7k3RbtStLVtPn+tHe2ZRYprfiNMquw4WkX82yTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxzXo9VNNos6u/k/QNqtBQpntHaSm1ofPtAaoIZ31mY=;
 b=o77th4sJ9ctz3hjCn2iuMYJ5AqlKMYCAo6McNPWRqlNjW9H5blCzqo+q3FiB/dLNDBFYLKpYVPJ+r7rkcIsYtN7G9Cd8VxQ91UmI9IVhelk5eBj84eOvyQFprnG8f0eSO8FR2m98arPkh++VLtXixEWDWlZsbtbNbRDw3n1gI7I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 12:45:37 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:45:37 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-pymisp: Upgrade 2.4.128 -> 2.4.130
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
 <20200824145004.12568-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c10f96a5-e4de-3d22-470a-f890307a813f@windriver.com>
Date: Tue, 25 Aug 2020 08:45:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824145004.12568-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0079.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0079.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:45:36 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb83365f-c4f2-4774-59d7-08d848f4c415
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB376646B06F492C70A7FED3BD9F570@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:308;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BkmeT6B9k5v7xo5Z87Dov+i9rRZ9DpTMEogRUmVKNcMy5un/aDGv0qu6kTtNJA8jk+I/X1bA8Zy1oNYHjE2miya0soAwUX2SO/y3Z1aUiGtVToq5p2USUSmF1Z/b4InfOyei/yKl1cKz5DwsRQW86T92wPvhcjNwW5ynJoZYix3AL4lL6FFLEZ06Pw59Z30QJxT/gSKXKqCxvaWQw9/jZc5IHCToF5j+3uG6hNQO4xQZx7zXTkpA/IvbcV7rzudtdrv4RrQZo5lnoMSz4ma0GxH6ZHPMeD/dOZI/U7w8YA47yN+XwJO454SodYRXzASWC6dyU/9JzxtaLThysG70YKydQ3qI9ROFM/lVZMgj9Od4VH9RLkFTIQGUUFqSu/lbhk9tp/m4dmksbMUofn6OxAAmtNzJuit10SSErh2fSdB+I8/gQ/2WjCgUdFHezfeMauyQBifRPkXL/hJa6PItmA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(2616005)(8676002)(5660300002)(26005)(956004)(44832011)(86362001)(53546011)(316002)(33964004)(186003)(6486002)(52116002)(16576012)(31686004)(478600001)(966005)(83380400001)(166002)(31696002)(36756003)(8936002)(66946007)(2906002)(66556008)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	eLbi5+bjKvLed7YSPX8PBEy+l1RZy73yfoAkVX96PalKn7BT0iSzKT0DCySifCtL4y75xHc01HBS9dzz1oGcw5UraGq9f+2EBAHNFU6MxDEMhyVjvgCddPQIL1KOraYpS3qxLn+YkzdOe72hXb3ke/IUmxvxtYXYdIgkv8JDMtHr+776GBv2+BP4d42dC/pfeR90fXcp4Bm/qbs9Z66BgBt4fiOBBWhkKvaZOUGps10F17gC0sJac6Q0rvrgQJWw7uMtZUZzMnlqhoryyWI67F9p/QtugtS5YY1JMsnwvK6TYiE7Qaw6Y93S+3wydj5cVfSWMQZFkHISh21DRqk5G1/ZHnU4WoOHgnpEmdtjyBOqAJSuVuMUYSsxWT0zIX7CFu7hXiSkD4IWQetghmvitvVN/Bv5XqYaIR3l85DmkSfMr1JicOMT1KBssvOv7hsih8gIuVEIVhZJ/IEKPXI8pIOhf0SiVA8G3+sv3kQtiuUj3oVX5cqxQKDGBGD50eX2tmTkpqNTC4IrqwMxUotiXKB9yE8fOah9zHRrsZKysd7dJIfg1J1xoX4xWA0HrRM9U4JC0CG1c8TiPmLdzT3LlS0jSPQMoBLc8jCMSbmMWQemdTh/kNcDrRxFv+WakOPpBB5fH+t5WBgYTgKVSe5H/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb83365f-c4f2-4774-59d7-08d848f4c415
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:45:37.3497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Vf1QnYHdl6vRnYWwoldfm++tcywoGe3KJm7s/gdqpyBYN0asxknmRfjHjvN8BL8ZaG09ufK1Y0aKNTyAJ15mcwB9eUQIW+ti/Tv5dzIYKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
Content-Type: multipart/alternative;
 boundary="------------A8F23D89A91A30ADC6CA096B"
Content-Language: en-US

--------------A8F23D89A91A30ADC6CA096B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 10:50 AM, Leon Anavi wrote:
> Upgrade to release 2.4.130:
>
> - Blacklist methods.
> - Add list of missing calls.
> - Add test_obj_references_export.
> - Add MISPObject.standalone property.
>    Setting MISPObject.standalone updates MISPObject._standalone and
>    add/removes "ObjectReference" from AbstractMISP.__not_jsonable
>    using update_not_jsonable/_remove_from_not_jsonable.
> - Add AbstractMISP._remove_from_not_jsonable.
> - Bump version, dependencies, objects and types.
> - [testlive_comprehensive] Updated generic tagging method to match
>    changes in MISP.
> - Cleanup blocklist methods.
> - Remove outdated example.
> - Bug fixes.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymisp_2.4.128.bb => python3-pymisp_2.4.130.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.128.bb => python3-pymisp_2.4.130.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
> rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
> index e27bf9900..2e9259466 100644
> --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
>   
> -SRC_URI[md5sum] = "a90a25def591c6a265bc904f801646f1"
> -SRC_URI[sha256sum] = "714b8b5c8debb4b5e0e602a5fe8a599206e89c1313244ed0e69d9e0bc816f1f7"
> +SRC_URI[md5sum] = "be91a479c689857617fbfc7ce919e291"
> +SRC_URI[sha256sum] = "2610bfb5cb942e882c247b468769a6f68817b5a413358c381f73ba91d01edaf6"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------A8F23D89A91A30ADC6CA096B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 10:50 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824145004.12568-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.4.130:

- Blacklist methods.
- Add list of missing calls.
- Add test_obj_references_export.
- Add MISPObject.standalone property.
  Setting MISPObject.standalone updates MISPObject._standalone and
  add/removes &quot;ObjectReference&quot; from AbstractMISP.__not_jsonable
  using update_not_jsonable/_remove_from_not_jsonable.
- Add AbstractMISP._remove_from_not_jsonable.
- Bump version, dependencies, objects and types.
- [testlive_comprehensive] Updated generic tagging method to match
  changes in MISP.
- Cleanup blocklist methods.
- Remove outdated example.
- Bug fixes.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824145004.12568-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymisp_2.4.128.bb =&gt; python3-pymisp_2.4.130.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.128.bb =&gt; python3-pymisp_2.4.130.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
index e27bf9900..2e9259466 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MISP/PyMISP">&quot;https://github.com/MISP/PyMISP&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20">&quot;file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20&quot;</a>
 
-SRC_URI[md5sum] = &quot;a90a25def591c6a265bc904f801646f1&quot;
-SRC_URI[sha256sum] = &quot;714b8b5c8debb4b5e0e602a5fe8a599206e89c1313244ed0e69d9e0bc816f1f7&quot;
+SRC_URI[md5sum] = &quot;be91a479c689857617fbfc7ce919e291&quot;
+SRC_URI[sha256sum] = &quot;2610bfb5cb942e882c247b468769a6f68817b5a413358c381f73ba91d01edaf6&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A8F23D89A91A30ADC6CA096B--
