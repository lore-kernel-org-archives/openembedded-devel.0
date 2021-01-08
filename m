Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.45])
 by mx.groups.io with SMTP id smtpd.web12.1876.1610121754681502510
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nylQBC1Z;
 spf=pass (domain: windriver.com, ip: 40.107.243.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9zPZ7AQRjCWtA9ooPwzWc9FC8T+0oANe9dkpDMT4i8suKLUmPhA2jDlDLC/nUKZdmkrLpojj+Un9Pj7CQOq9ePD0fgVyARiBR7AO4WuelNLHg26aIJPhMtBaYNnYTbhgAy7h2epdPqMb88UqHScmUnNAjByK1k0KgemH4w62mnmKcs9XCgiCRQ7CxxQM1iQZ1+cBen6z+Foq06d5kvEjOGfPH0KISUBOtm9y/5YKJWEI/vVHbPkHDvmVJm/ksa/Xf9i2dLuKs//LcvO4+6UVDjbwlcLRt2dHMan4DvC1FjuCxhZi45cyePDS5uSpW8547i6JOXRf0HtAJSd6XHvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXsszlHMtYYCmNn9V9V4+9sgDjSpcRFZYBr/AtylsiI=;
 b=MmJ6GnFillKhNjJFu8b1f8arfnNfOsazmqaHSV4F6U/to7Dr6cplk7vQq7PiTXprIub+d6IqUM9tqRGGHy3+mNz6KsnpM5VBaxx5eBdYalvjh7nGy3Cp/qC4wfe4BPaJWZ3MsMBmZIMHlcjNl5F4mD3Ww2LFz0Al360fjwxSlQ58rsYaSUsWN+RU++sfr5YybhVinJ9QSdJWWNhHoZ6LmlHYknLer2qV7KdCO8w2Iwaln03M2WfmwR0pvjMUeS/qU6fM7WsB4THmzwaS0bEgoRDys6hTBVyktuqDpkqKmYVTrqlm00lwHTj0tpDku4POcX9ZVPXMpKD3x56HWRw/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXsszlHMtYYCmNn9V9V4+9sgDjSpcRFZYBr/AtylsiI=;
 b=nylQBC1ZGPnlqNyNSeh6hWR5KJi57vmujo411J5QDDw4RILvgLp0TgmYVzks8AixP2vZE7aa0nGYjH+uXnYcqFQpOa/Xr7O4Q7uNNfg7rnqNHEELAF2bQ0zFLWMX0JjEvtkGHNozQRqLSCnoultbFQHQfuUJh4roYI/m19LSN0s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:02:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:02:33 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-psutil: Upgrade 5.7.3 -> 5.8.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
 <20210105151638.15700-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d3887e05-a6df-57fe-de5a-9ed143bb16ce@windriver.com>
Date: Fri, 8 Jan 2021 11:02:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210105151638.15700-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR18CA0021.namprd18.prod.outlook.com
 (2603:10b6:208:23c::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR18CA0021.namprd18.prod.outlook.com (2603:10b6:208:23c::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:02:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eca03644-25b6-4f62-3e08-08d8b3eecf79
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB489623D9A31BE46750B8F14A9FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5ZaUB9GFEoy0rwyfu04uOmskrQdKkP6X7z20gSEFhMIu7PbH9JUOWUs68G2atLF8IrLlnM6ytrja3dT64MKqYK7aTGDpTEEtHaL/hFeKREO0XJ0tb/ZfXv7My4vzim9vvUF8EEoJvkFxCjRu/HmGYRQGpmab3ONhECT+A8G3yDYJngQvgXo0ddVrbX7v4qkROIJaINn9Mxs2c+sKy5wkOv1WokDQACbLPRZiW6MCPOTfcyAzsq2I6Vq3HiXihym02nVMspH5sXMFd2bVW3z+4sURJLqshO9jaUBh50eYILzWlwHzZv6z0Re8sYLW2Pji/YSZZwYqcyUj2F1MpgV29wlrKNaEXnUpr5L2J0aM8pQyTnATyZvFgKi5/ptls7lO8tS0kWPNv7bFsXrRQk96PKt/OwAuAuRQQqCv+om95Opc2BeCKfk9Y//VDOFYlUh8EI3B1KbsAXIpFd9JhEjVHwcRtI9McgrFh/YeHyqqNguoHbP9GKjrZn86EuSsZu5/VaurL7uLG63wt3d0dqOIAPwvqhbmE4KH8t+zM//RHzagsgHmAgv8rQ/VYhpVzcLW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QU9hVnZ2TExTdGdaWUYxa1JobDNncDh3R1VzU2RseHRRSnJ2Z1VFNW1qbDdS?=
 =?utf-8?B?MUxFNEZRZGJGQkd6WThHRHJERGxUbFFlOC9QdEwybkxkVUgzL0NlRDhaSmxT?=
 =?utf-8?B?bi9yaWt5a3VBMWFlQkZ5YUhYWjcwcEpFQXVDMWlqektjMW1YajgzaDdHL1pp?=
 =?utf-8?B?WUkySTNkSnJuOUpGMkd6OGZIb3Z3VVV5Mm1TVEs0cmdDMFU1OUpCZFNqdHFl?=
 =?utf-8?B?b0RwM09TM2tKS1J4UlY5ck52ald1Sjc0cnlxWWQ0MXREbzBpRDJFQ3dpV3FG?=
 =?utf-8?B?NENJOHhBSS9rRGtERmozWm42NjcrQnYweXAzQmR0M3NZYitvZ3g0bDlKckJs?=
 =?utf-8?B?bmxBZ3FGb3VnYjVJK2FMRklocS9raTAvb0lYZjRlclJGcUJaWStGODFPY3BS?=
 =?utf-8?B?aFdyZ0tNTTJ2OFBmaGJ4S0JSYzMvcEtpTElvQmZ5R3NrMzZqbThOaVpNZUU4?=
 =?utf-8?B?QlFoWE43clFKeUdXa0piQ0dkYVpDbXY2enEyb0ZiYVpCalBJSmtBQW9od2tX?=
 =?utf-8?B?cDY0NFBJMzlXbzloMXFXYk82VmpMUXNJRXRKcWtOYnZRQVNmYUYzTGtiWmFJ?=
 =?utf-8?B?dHlMYzg3ZEdkdG9VMDJsRTRKSWo0V3hSWVdYQ21VS0NhSmVWWk05bzRqNU1y?=
 =?utf-8?B?N3hPZTlpQXVFUDhiWkRQVDRoQ2xCSUliVmdpTVg2MDE4dFpWMnV2S09pNXJj?=
 =?utf-8?B?eXFlblQzaHUyYzg3Y0FvSURrZ0ZUYUJMV3dCcTFwYUFITTRpOUR0MG4vYTEy?=
 =?utf-8?B?R1ZXY0FNb0ltcHlObjc2RVg5SVI0UUY2R0lIa1lCelE5aUR0Z3RSL3dUcmtW?=
 =?utf-8?B?UXdFaUJKdG1DbjFyNTNIeXVEdGdINnZpS2F0bFM1VWpYbFZIcUZIdWlNWCtt?=
 =?utf-8?B?cFVRK2F1T2VBcnhRRUc5YnIvQ0JwSFArYjhPQnVsdDR1R2NXOGdxWGZ6YTQz?=
 =?utf-8?B?VU80V0VGY3Arc3h2aXhEbDVickttb0g0Yk9yZ1dUZ2xrL1M4YkloQ3JnMUl4?=
 =?utf-8?B?WXhVM0RSZkpJTzFqTVJPYU51SGFqYStxT0p1UzJ2VGNFNjJQeUtRaC9PRjdF?=
 =?utf-8?B?VzBrRnZVNXVaai9DWVpVQzdFUVUvMnRjeGhKYnlQWjFvbDZpbFBUWmlaZkl4?=
 =?utf-8?B?bDF5ZEUwWGhkRlVyaUJYQXVBMWo1RmNLQ0gvdEh6YlBGRmtRZ1FSbngvYy9I?=
 =?utf-8?B?RS80cllHQ0tESXJDNlJqVFFxSldad3M5UmxWVGR0Y0NvNGl5cnBObXdObG5C?=
 =?utf-8?B?d3lnNThZSG1tWEFUc3crQmNwWHVXbGI1OVlwTGtWM0w5YzdTYWpuSGNsUnJ2?=
 =?utf-8?Q?EdIOPnpSd1Zs86JSmyMZu8VwB3XmeNWTk8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:02:33.6513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: eca03644-25b6-4f62-3e08-08d8b3eecf79
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsObJAFGXJJTC1uYwfCaTMCEIoWi0fyBygUl35uIp3iDvdjonY+kZgkEf3yvzH8RQvY6vEgeKqJMGywZF+4JUW0TOGk4h7c5PIM3knRCOiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------CD88C19E4F417684B7E47D15"
Content-Language: en-US

--------------CD88C19E4F417684B7E47D15
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-05 10:16 a.m., Leon Anavi wrote:
> - disk_partitions() exposes 2 extra fields: maxfile and maxpath,
>    which are the maximum file name and path name length.
> - [Windows] added support for PyPy 2.7.
> - provide pre-compiled wheels for Linux and macOS.
> - get rid of Travis and Cirrus CI services (they are no longer
>    free). CI testing is now done by GitHub Actions on Linux, macOS
>    and FreeBSD (yes). AppVeyor is still being used for Windows CI.
> - [Linux] get rid of sensors_temperatures() duplicates.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-psutil_5.7.3.bb => python3-psutil_5.8.0.bb}       | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-psutil_5.7.3.bb => python3-psutil_5.8.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb b/meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
> rename to meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb
> index 2f927d2da2..bd43b414d0 100644
> --- a/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb
> @@ -2,8 +2,7 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
>   
> -SRC_URI[md5sum] = "b07a067e6a930608235f4e5d9b1f90f5"
> -SRC_URI[sha256sum] = "af73f7bcebdc538eda9cc81d19db1db7bf26f103f91081d780bbacfcb620dee2"
> +SRC_URI[sha256sum] = "0c9ccb99ab76025f2f0bbecf341d4656e9c1351db8cc8a03ccd62e318ab4b5c6"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------CD88C19E4F417684B7E47D15
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-05 10:16 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210105151638.15700-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- disk_partitions() exposes 2 extra fields: maxfile and maxpath,
  which are the maximum file name and path name length.
- [Windows] added support for PyPy 2.7.
- provide pre-compiled wheels for Linux and macOS.
- get rid of Travis and Cirrus CI services (they are no longer
  free). CI testing is now done by GitHub Actions on Linux, macOS
  and FreeBSD (yes). AppVeyor is still being used for Windows CI.
- [Linux] get rid of sensors_temperatures() duplicates.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210105151638.15700-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-psutil_5.7.3.bb =&gt; python3-psutil_5.8.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.7.3.bb =&gt; python3-psutil_5.8.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb b/meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb
index 2f927d2da2..bd43b414d0 100644
--- a/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb
@@ -2,8 +2,7 @@ SUMMARY = &quot;A cross-platform process and system utilities module for Python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b">&quot;file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b&quot;</a>
 
-SRC_URI[md5sum] = &quot;b07a067e6a930608235f4e5d9b1f90f5&quot;
-SRC_URI[sha256sum] = &quot;af73f7bcebdc538eda9cc81d19db1db7bf26f103f91081d780bbacfcb620dee2&quot;
+SRC_URI[sha256sum] = &quot;0c9ccb99ab76025f2f0bbecf341d4656e9c1351db8cc8a03ccd62e318ab4b5c6&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CD88C19E4F417684B7E47D15--
