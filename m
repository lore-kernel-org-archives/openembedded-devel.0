Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.41])
 by mx.groups.io with SMTP id smtpd.web08.1985.1610121929853252106
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:05:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WlSspWRt;
 spf=pass (domain: windriver.com, ip: 40.107.243.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEH4Mpd1ry0YC5b/rI71p4zn/4IWsRZUxK2pmtahR/IaBkBAf6dWqD6CDlkprqccFww0xeDsUuNPjrsNMzkdsbMq+7EaLv6zlSsz5guQfthCK/CitO+cFwxIxxElEMR5pX3ThUbH3t+Xeep0CSo+Up0dm3NnCMkGafQDSFvAMCoY993X/bRfekXXLBOKAV3IEWVeqr26SfjvGpFNkuFIjTx8SAx5eBhHpIbVT25WR89XLxLnHRvCCvNTeHySIKJXxfu140bRvEVJjTqA4Zzrpd88uh0smtMfcQ3hMCjXDtIFWvgMrgluC38dblNVYY+8gQ60H58xfuRTP8ECkf0VjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Hv41X1uScgIOafgEwgOZ0l1Jd8a4XdHEygAy8ASMPE=;
 b=GEIrYbHw0r8sAh4/slnn8MFkd/jLPvOCeYixiPJMbnKij6BqwbtLKQ1EVdr8kfGDJ9yvlwEkeGX63BjfjCmMeH9nx4S6PhuIlVOynLy05BhuwLrq7b1xpyPP9rOEtVEPx+vtREJqEOsSD9eLTb/na3O163UCk1Gk/7qaviaoPww+zSCWq2fJ+GUUuLS9WmKo39NYHhU8YKqqlz+btGNixVU0JDpfj9rIGRA39AmmHACYYqegzsTJoe6uhEYvnawLog9Jqzy2FLtWtjDeIbyXI+/7Ew6pUJ5j0mpNO4z5etJHRq+gbchex0vz5dSqlnlOJOIo1o8vutJbUMgQcvEgLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Hv41X1uScgIOafgEwgOZ0l1Jd8a4XdHEygAy8ASMPE=;
 b=WlSspWRt6+J3OoFeFcmpmeM9CzJKCK2b79MlXIYwHvRaSKsV45Wfh8MF7sGCN6+XS8t3X60svVKuDM4AzGEx9drbrdF9efBopc5qu/DScsX76vwXbh4DrsPGcZxjwtIqdlx42MMSVglzCiRIXEd5qeYWTMaWgSj7zANgDEYV9as=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:05:28 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:05:28 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-twine: Upgrade 3.2.0 -> 3.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
 <20210106220702.10483-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ff243cf6-6a32-700c-7928-d52aeaf2d546@windriver.com>
Date: Fri, 8 Jan 2021 11:05:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210106220702.10483-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:208:160::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0005.namprd13.prod.outlook.com (2603:10b6:208:160::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Fri, 8 Jan 2021 16:05:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8032cdbf-1440-4083-1e25-08d8b3ef37d5
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896CFDA75D2CC58FB635E839FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7ocdvr3+XZnnRGm15gQUXZ/LQnbwtgp5gAxOuIscLNHgB7kF1EHn7M22rJiQRe/bFNe5d/a3YRTwMCGnPnoStjkwzX8yiHNLJypM5GAdUINDbafcijYTtETzLGRkb4jV2dsF+AJrsD2SSk78vmZDI2mVTBokcNPv7xqE+E5NC6b56LN2jtZqfx7FuvH7Xu1YMAGahEpl1Ka5pMkcHIAZCktui7vISg/jX0GcLqXZVpw+X7hWQBk33CCEn8UCexoRj4POwHOYi79VvXLE9RAc4r1X1nsWlEl8tjQ9GK6/zhYs2R4F1AcXm89icikmVV8wdJnJTU7D6QK7ZLil23ViU5OnUiKHDdKp5cLAFTK4+/+fBiY7iRFqDh1Ra5kL1BFIUkuE2EhPB++S7+2RDcjfQKqRr4PV5+QbUuwRzOupR6TnB3N0i/Rf1J8bVvhir8apFbKMHhvZa10otRU83BGOrZC1nKH2+zDFiGFWQ+COV9Xpb3e/d29+D6hFWPb2s/3eaDBFxd5P1sO+KojOa6FphlGmVvknLTXUsFf/SiKwKGAgPNwE0pKFJhSFqPSMDboC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QzRMUXJZRjZ4TkFZWDlOeDNrSmlOTkRMSkVrMVVuZ0Z5NngvcEh0T245NDB5?=
 =?utf-8?B?Z0ppRTVCdkxSenp5YTFxZVlTanF3U0xxU1Ftd1luT1pHU3MyQkNIV3FLQjdo?=
 =?utf-8?B?OTVMQ2NYcXpoTTRwNVdsLzJVTUxDckhFcGFJNWlOcHVYZUtWOGdvamNJTUN5?=
 =?utf-8?B?VTRIOHBrZWRHZzdkMis4QjU5YjV2TU00VCtsc1hweVpjdGIyRnkzOGhDc21W?=
 =?utf-8?B?VkdPWitGelJpM053R1Y5TUdVSDJCYnFsZWZuN3dQYmx4Rm9oSEpLUFJtOVYx?=
 =?utf-8?B?SEdOZW9BUjFVYUp3TTZZTVJhNkNaUHVMMitkc21kelVWUUNjMWJzYXhhMFM0?=
 =?utf-8?B?d0dBT3dQK3BDZld2WlNQTlNGUTZrbE51Y2d4anV1WGloZGo2aWlUc1dZeWNW?=
 =?utf-8?B?ZHVnTndMNjBRZS9MK2ZiUzk4MEJDWERES3ZZTXo3cy9nMk5NV2F2WS9hdUJS?=
 =?utf-8?B?bU0vcHJaYy9FcDNjdXNlTzNkK0VTU0JHY3NGMno0alQ2TEZ1T3E2T05JSlBR?=
 =?utf-8?B?VFdBaEt0eDlMaXkxeEhNblNjMm9IcUJLek9YWWlNcHFTVm5CeUdNcVFja0Zr?=
 =?utf-8?B?dGpFZWFjbkFoVGk1SVJlY1pjMC9xV2JkZnVUN0RIeVE5cFpkYlhxN1A4Mmhp?=
 =?utf-8?B?K3BCN0hlQzRKQ21wVkVmQ0hCS3VEWTZzeTFzbDFMZmZic3BBdVpHUExWQzQv?=
 =?utf-8?B?Q2J5Y0hNTE02OEFZOVhxaGRHR2JtZlB6T2Ryakw3Z20wd3FQSW13c3VIZmk3?=
 =?utf-8?B?TjhRUE4vS0tIZTVoSm1FMFNyd2NSNG11dzFGTkNxVTJZb0M5dk9RdlhyenQ5?=
 =?utf-8?B?SmdQcEIvc2thNzgvNVRmb0RWTG16a1RPL2xVOStxQXY2Y1NDWlR5dEFlMCtO?=
 =?utf-8?B?a0VobDdwODY1TVdDYzNLbk1HSzZmOEVheUJyVHFuQWhiRnJSMXl0L3gxUDd5?=
 =?utf-8?B?MjNhWUFBWkJIaXpLV3NIclFMSEoxajFMWWRwMHp1SjI4bTZnN1hETkFXL3NV?=
 =?utf-8?B?ZDhldzljbjYrYkNEQy93K1ljS2Z1N0psaUpxMmJ5OGZFbFVQeEFWM0E4UXg5?=
 =?utf-8?B?N3VLKzQ2ODhpQmZhQlY1WlJwZmY1dnZlWGVVNVBRR05UNVpCWWloQ0pxcW1Y?=
 =?utf-8?B?WnBacDZQaldnLyttamJOdVhIT3NuQXlwczhHRDdlOGt5VUx3TFRZTDhiT1BG?=
 =?utf-8?B?VVRITDRZUVZnUFMrVkcwUE5vdURuZHNBRWd1V0xGZnA1a3R0QzJvbDBFcmJo?=
 =?utf-8?B?WGQ4TFhnbksyOXcwS0R4N0pqaFFQT1hWL3hUTmRIU0U4V2t0Z0JHcFF0eloz?=
 =?utf-8?Q?VXwAyEzG4l/5LTxeAL7HWSrntclRlLjqCz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:05:28.7045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 8032cdbf-1440-4083-1e25-08d8b3ef37d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ey+1iGXTp9jaT4EObIlCKjw9v23xW0rSCHsHVtXzedhrNfdzCpBNJx2p3OGyUBkiKIpv1qWXPxtNI6LjMsqZJ3fbi8WRqJi8Hvmzypuuj7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------7155BBD8A71555F252AA0C0A"
Content-Language: en-US

--------------7155BBD8A71555F252AA0C0A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-06 5:06 p.m., Leon Anavi wrote:
> - Print files to be uploaded using upload --verbose
> - Print configuration file location when using upload --verbose
> - Print source and values of credentials when using upload
>    --verbose
> - Add support for Python 3.9
> - Turn warnings into errors when using check --strict
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-twine_3.2.0.bb => python3-twine_3.3.0.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-twine_3.2.0.bb => python3-twine_3.3.0.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb b/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
> index 34309585f8..0bc1999923 100644
> --- a/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
>   
> -SRC_URI[md5sum] = "41ce5c8aad253ef4b43b19c76997e2f2"
> -SRC_URI[sha256sum] = "34352fd52ec3b9d29837e6072d5a2a7c6fe4290e97bba46bb8d478b5c598f7ab"
> +SRC_URI[sha256sum] = "fcffa8fc37e8083a5be0728371f299598870ee1eccc94e9a25cef7b1dcfa8297"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------7155BBD8A71555F252AA0C0A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-06 5:06 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210106220702.10483-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Print files to be uploaded using upload --verbose
- Print configuration file location when using upload --verbose
- Print source and values of credentials when using upload
  --verbose
- Add support for Python 3.9
- Turn warnings into errors when using check --strict

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210106220702.10483-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-twine_3.2.0.bb =&gt; python3-twine_3.3.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twine_3.2.0.bb =&gt; python3-twine_3.3.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb b/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
index 34309585f8..0bc1999923 100644
--- a/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://twine.readthedocs.io/">&quot;https://twine.readthedocs.io/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c">&quot;file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c&quot;</a>
 
-SRC_URI[md5sum] = &quot;41ce5c8aad253ef4b43b19c76997e2f2&quot;
-SRC_URI[sha256sum] = &quot;34352fd52ec3b9d29837e6072d5a2a7c6fe4290e97bba46bb8d478b5c598f7ab&quot;
+SRC_URI[sha256sum] = &quot;fcffa8fc37e8083a5be0728371f299598870ee1eccc94e9a25cef7b1dcfa8297&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------7155BBD8A71555F252AA0C0A--
