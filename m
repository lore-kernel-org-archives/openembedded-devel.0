Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.65])
 by mx.groups.io with SMTP id smtpd.web12.1942.1610121948115914226
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:05:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PvPg4isc;
 spf=pass (domain: windriver.com, ip: 40.107.243.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ineLNTUODxEcK6DSTfU1T3X4nk0TctlgN/I2SAGy0EV1zsjtsGmo4SKovmOj2gy+Dl2z6ZKZyW576j3S08mRh/Ko0RX/1uVQrH/MGam/bLeH956wbmMwK430gr+plGRuM+7vJQdILvf/LCB+QTRUXdTGhkWmTEYiCS8H5nNRynN1hSt+HN+ZFn8eqqWModw+miSxKLBirp8mAFJ7pDZMmOE7H0VVvlLBr4YaEQNljMoEh+9iLCuhEAwHyi4YCpihO9gM7NR2QR2fW30GJbawGM6Rk4FV2HIf3XMK1MANlgKHyl+VPXYAAtr69lUuP7lDLUtW1XHXQQ1gHinnBhiLQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI3DRSzoe5m2+bHvi0xVe4Z3s3MszH8kgHi5/6C/eo8=;
 b=FisBi9EVel18kmOXmFhcDP+qfYvsHOE8r6DQKnPp7IRGdE+8ucdJIdgBITFHyEMY5DIWgR3xbZ67KF/9Q/s4OvI78fBy8IXnITet4xXIPoYsW6qJ8fqXQs61mt0zXzFFT6YwkoYI7eCWlH1qBHxyulPCWEF2K1uSJey+oA5y2G2X1+YjI0aGjVEE8LQB/G7GAmJX6Nv7q5IRXas5tgCZEpgrN6S1O2GIr8FVZGE+a2M1Y/pS97wgPYu6yRBbnWDWcVvhjoykQFZHpj0rv4YSuVUXCf/cI0EQJpnbxkHX+zzadT6yZzCCQKiLgmI29NvhvhaOx0jjwILrHoyXkfre+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI3DRSzoe5m2+bHvi0xVe4Z3s3MszH8kgHi5/6C/eo8=;
 b=PvPg4iscyQYL/z2sbhB1xDKX2rLvqYd+Fcne2LoVypCLijy6LC+hg3YRV6iuyni4veBvPl0hdUwCgL45RAjXBwLTToyts4PTZeYiQv08Rj2GSy5H2FW4isVgkbuzfauk/W+9CswT+jJVJ6AU9X6CR2z3CgeMW50DED4BBh5z2Wk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:05:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:05:47 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-humanfriendly: Upgrade 8.2 -> 9.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
 <20210106220702.10483-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <80405cdd-8929-11ab-dc0c-8fe8971399f6@windriver.com>
Date: Fri, 8 Jan 2021 11:05:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210106220702.10483-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:208:160::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0007.namprd13.prod.outlook.com (2603:10b6:208:160::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Fri, 8 Jan 2021 16:05:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bd40dd2-ea90-40de-4134-08d8b3ef42cd
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48963D88BEEF9EC4E6EB815B9FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pbfTJRjGmeIHycW0FzgUcfKRPILvIF7avlbRDiXjtbKkDcFA1aUJxuJgzCFN6F6wvWJWD41OjllFyv0Z1twquIyOZFYZY5TwTNyMunMjerj5URjjg+Di4wqNhs8bxAER6pEcnUCpImLbUgL1rOCIodDcjf7qD/l8JT9cryciEhirIMCfE1PclDwjbyPCzy3NiPf+/mi3YyY9VKsxmZOoBEFxpZ5KgjaXnRXVEVSwjqtWcJ+xNvesXv3SNkXVFLC4lldlhBEQbW+0YKazJlARxW78nTQbR2T0yHQ4Dg6poytQVJ9VK0G+04WnfBiWRV8LR2szxNR2kmz5wsIcRBFQX62vQPvBLEEcd6vgunpp9pkahbnx7JI1JiiU3b5RkXF2zdLEZ1jw4XYImsLKjFktCFaGDrAiIZwbFRA3O7hdAGb2EkNFPtJ9xxU6EO4soWxs7zwqMKHhius4OVV8b5h72Iyvm3viA2yIjqBjDT9WUwtZIMRTKxCwuYD2qE0PwU8xx47ADMPN5cLE3DLMGN170elrLlxBE9E0sWom9NQyRVxfYeIu5tPnDBDTrk+NCpyuFNdpttcr1LHgjWEtzEQMhQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(46800400005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UHlvT1ZPVTdYWGpUSEFUclhhYjA3dkhOWFk5eUlEYng5T1d3MFdORVBUTFNZ?=
 =?utf-8?B?UUgyaTh2Ty8wRzVzZlRnVU5Vejk1cHZBZ29ENDRqdkFjZ2t0UWR3a0VISGZP?=
 =?utf-8?B?dDM4VXBITENQYzVoMjg0SGZxL3dNQ2FsdlVkVVJ6T1lBQ0gvdmgvYXlNTjNx?=
 =?utf-8?B?dDVGcFdRb240MytTNHRWVGZSS2VVRXFRM0IvMkZsNmg0aVYvSWpWSEJ3NUNs?=
 =?utf-8?B?eUcrdjlaVUV0TVlOb1Npa2hnY0VjZVdTdTBEbXI0Z2pvdnczQmhaRnZ4Sm5C?=
 =?utf-8?B?aXZUQUJwZHk2Ny9Fd2tCckdINVI3OHZNdUVkRitzakhzN3JJRzFRSjh5WEht?=
 =?utf-8?B?cGh2c0pScXZBSFBpTUZjRGUweXBXT2VEZFZGY2pCUC9HMEE4cUNRUTZTQkpq?=
 =?utf-8?B?bXZuZC96ZzZ6NmpiWGVodFcwSjA0Vis0R3JxQ0xoeGFlR2JMblYxblJmNXp2?=
 =?utf-8?B?U3hiRklRMUlrZWhFbUxMYi9ieFNpMmJXUVlZOHdTajNRaktIbjdDa2E2c2JY?=
 =?utf-8?B?UFM2RXIybFdWQnNha0wxYWU4R050cWdPa0QxZDRuaThldFJMSWtsM1d3UVIw?=
 =?utf-8?B?ZHluZm14RmJDSUhwVGh2UjV3VE1waWR3c0g2emU3S3VQZDdtc2x2cGh6eVZC?=
 =?utf-8?B?YmEyZHkvT21ycDhhWW1CWjBiTXA5MDhxUXExaUh6TWV3M3FLcHNXaDJONllT?=
 =?utf-8?B?RCtxV0RVaDF5UnVxbzhuK1FLSVUyUkNDNldMK3N2KzhGVTh2WjhrcG9tNWoy?=
 =?utf-8?B?QWJQOHlBaGFobXg3MWR0NHllR042TjRUSGZIemVoVjFYRUlhZllJZ1RSYmVl?=
 =?utf-8?B?dUJ4RFd1aklONGo5WC9uYjEyQldNRU55cFUydENHUmNaWkZNWGVHVGRYd3dY?=
 =?utf-8?B?TnJHWGs5S09aVEZnMm9qK1ljSmxPZklpb2Nnc1VZUWsyYW16MjFaZWVIZ2lG?=
 =?utf-8?B?ZDBXT1I5SXI2L293UFlDWkxoKzBLM2VwQmNzNlRrblFvelZvNnRITHNJT2dl?=
 =?utf-8?B?WXMxRmxERVc4MlZ4eXo1cUN1TTl6MTZvNHRxR3hhbFNuVklibndUZ2x0UVBp?=
 =?utf-8?B?REFLbUJBd2R3Y1F2UmR5WnJiQVNmeHZuUEpnU3B6b2diR3dYVlpBZU5KM2tG?=
 =?utf-8?B?Z1B5QVp4c3RYMDBNUGVEM21zZGEvNEhMaEp4ZENabWFJblBSc0JYNVRua3hh?=
 =?utf-8?B?SzN2NVROOWJMcVBob01iZWVIQXMwYVkxdktCSDNtK0VHTGxTTE1oUTN0elpw?=
 =?utf-8?B?UllwUU1Qd3NObFhwSm9nWitVM0EzOTB4SzloVkNIV21rS3pmVUdZclpkempE?=
 =?utf-8?Q?gF4Ql99d+EcBpHP3/jSMrGCDPq9w//SG6O?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:05:47.1269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd40dd2-ea90-40de-4134-08d8b3ef42cd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6xe2JrZFWUo6bDzgScGkyyZ3/+i4sAop31S9Hn15ZhezMYFNI8dAB5sMKSoUCYp8piRpE3SjsnGgO9fOaPF+zcG9JfygVtFBD/HRxgZroY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------CA21FED7D45A8EFA5ABE96F0"
Content-Language: en-US

--------------CA21FED7D45A8EFA5ABE96F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-01-06 5:06 p.m., Leon Anavi wrote:
> Upgrade to release 9.1:
>
> - Added on_macos() function to detect Apple MacOS
> - Changed format_number() to properly support negative numbers
> - Changed pluralize() to generate “1.5 seconds” instead of
>    "1.5 second"
> - Enhanced concatenate() to support conjunction and serial_comma
>    keyword arguments
> - Added pluralize_raw() to select singular or plural form without
>    prefixing the count to the text that is returned
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-humanfriendly_8.2.bb => python3-humanfriendly_9.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-humanfriendly_8.2.bb => python3-humanfriendly_9.1.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
> rename to meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
> index 61c969d760..fb6a7e3b6d 100644
> --- a/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b"
>   
>   PYPI_PACKAGE = "humanfriendly"
>   
> -SRC_URI[md5sum] = "e6064a6fe099c4231c3e969ca5fea335"
> -SRC_URI[sha256sum] = "bf52ec91244819c780341a3438d5d7b09f431d3f113a475147ac9b7b167a3d12"
> +SRC_URI[sha256sum] = "066562956639ab21ff2676d1fda0b5987e985c534fc76700a19bd54bcb81121d"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------CA21FED7D45A8EFA5ABE96F0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-06 5:06 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210106220702.10483-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 9.1:

- Added on_macos() function to detect Apple MacOS
- Changed format_number() to properly support negative numbers
- Changed pluralize() to generate “1.5 seconds” instead of
  &quot;1.5 second&quot;
- Enhanced concatenate() to support conjunction and serial_comma
  keyword arguments
- Added pluralize_raw() to select singular or plural form without
  prefixing the count to the text that is returned

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210106220702.10483-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-humanfriendly_8.2.bb =&gt; python3-humanfriendly_9.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanfriendly_8.2.bb =&gt; python3-humanfriendly_9.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
rename to meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
index 61c969d760..fb6a7e3b6d 100644
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b">&quot;file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b&quot;</a>
 
 PYPI_PACKAGE = &quot;humanfriendly&quot;
 
-SRC_URI[md5sum] = &quot;e6064a6fe099c4231c3e969ca5fea335&quot;
-SRC_URI[sha256sum] = &quot;bf52ec91244819c780341a3438d5d7b09f431d3f113a475147ac9b7b167a3d12&quot;
+SRC_URI[sha256sum] = &quot;066562956639ab21ff2676d1fda0b5987e985c534fc76700a19bd54bcb81121d&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CA21FED7D45A8EFA5ABE96F0--
