Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.70])
 by mx.groups.io with SMTP id smtpd.web08.1979.1610121915595853125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JndetK3N;
 spf=pass (domain: windriver.com, ip: 40.107.243.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fej8Rhji5cbfQrZJ7avv4TJ1o1+ez4tu/Qm4sq9xWyhcjtDYCILdgj1+v+fSnr8FScudTc/xOd0kAUYxpi/xWxwgweFfMbeirQ5SUx2YKn9JYmTA0WA80SgN42BDAWY17U2EJnbXptu7b1rXLZQ4rBhx5OfNypyffUmW0pGHOKHd46D8ztPlPgOHimoi0S8i5aJjNrOa3jt76GthVCPW6hKT0O/zEx0quWPHJxXxmhA7r4forXc5xw5c5AH1rfSSrHwbfcUE+bRVS+A150VH9XtTS/BcNBMW4GdsApyTayVuODaJMFyWttfh3rYAkc+cvdBpi1SO7ok/wqtyNvHFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOA2d2fNxgqGhjPIZQRK8Amt6vD3lnIxtNocjSvAX80=;
 b=N3CfcU8GdNBq2i1sRSS4RhLXC2wFaa7mnEs7GWbC4cHqKGzZ0SNFZDo15ZG8qH6wSWr78wgfJ98GcQW6o7hmn8ipomPCpCKUzSHZnw77Clerz022WE/rJPBVevGZvzMOh4yd/5WC3JQ73glzY1MO23WCQ1+VuUzh0bNI1EAEaleE9sYnSqV2tXoflMmMlMqELQ66/KCkxjnwwHVCcgl/yZB7rdJjG/a/6972iQA2DENAjnZbktbTVMlBIYKxP/ndxPo9GWxCtRuYCM8LZ7q3NqpNmt4uAHuxKvAYosUfi8VFaD9rsVnb2xbHYV6bJYPqnkFMxtP0gI3ouHHnfWoBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOA2d2fNxgqGhjPIZQRK8Amt6vD3lnIxtNocjSvAX80=;
 b=JndetK3Ne9OX8fzwN5L6TQs4imLkpCrFcncCexyQvlqfDRcSfch62inXRWNQ3MUiaLODSJcOWPEayroyONO/VfLx3mpu2oUGjNqz+3Akas8S3CCyPzwCyOwl2BAnT69YHewi82qYJzL/dVjxUmx+JfYzohnCPgaTh+dx7muYFn0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:05:14 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:05:14 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-sympy: Upgrade 1.6.2 -> 1.7.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2a366dc7-8b06-3f74-2952-58985c04a08b@windriver.com>
Date: Fri, 8 Jan 2021 11:05:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210106220702.10483-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0012.prod.exchangelabs.com
 (2603:10b6:207:18::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0012.prod.exchangelabs.com (2603:10b6:207:18::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:05:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1185b5d-8224-4a9c-7243-08d8b3ef2f61
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896FF98F9B1F8EAEB4C45059FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E+zNRmrWgVefStm8+UkIjYrBSsHjCaU8aMtkdjBjS5wAacAhJoxtaiNr/nE7HMrCFNECFiG9DmapiYZBNCI8T74aQUVVby3Lo5+BSPiWWCv2IYAD0Mskhf4JKHZwkMW7wfFgDa1GmgifEXNgQ2fiPxU3jtoOd7/E0O9TyavMr0poWiEw3nXyqVr7WZQxecpXHpNwCC5eamyXmYUfQqRneg6reKIy44KUzmdnzEsOgwwXDLOdA3sc0KNKhSUQ5bPmvOiW9MJiCDE9U8Tt15tcl0J9F9nKI6rJ5ci8/BdUGJlqukYlo+Ndl71w2xIGDsy1sQJ6HVeUCmQa5SLr0P5xrbsJJa3yakGtATRqaRnKh7oWuQ9lvQT8Spu8DdxmMm5PRIkGH84G1AllDhLhj8i5CbwjPqD1f/w7Oq7WjW6UxRfKvxmrlh4r0lD9RcDT64ZnFaw6B+Rcqilwc7TBTd7+az7ODfWM3q8QTBbuk3HDn0g9JbwGP+q+6lLBhyt71B2RelIfTerMHNK11fHzNx59BA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TnZRcitkeEZqaW9LNUorV3l1MEdtN203eURSVmlwbTZIRkF5NGRNZWFVdHhh?=
 =?utf-8?B?MEtjbjRhcXpuc2FaUmRtZ01jeUpsUURVa2t2SFZKMEVzdmZyZGVtYmVJKzdU?=
 =?utf-8?B?R0tyWGxhRERMbGlYYWxtbUxpYWNBS0VGbFNkWkdESjR0OEh4K3NPSlk0dUNy?=
 =?utf-8?B?SThxalRmYkdvMk9MRUtLTmUvUm0vVnIrdlV2Ym1PY0JaVi92WklqM3k3TU81?=
 =?utf-8?B?Z0NUdHUxWGtxRUF4S1RsN0Rtc2FzMlU2VFloeno4aGNFVGhoVDV5OE80ZDJG?=
 =?utf-8?B?TlArc0RwK0lJNzFlNzBLaEUzMm4vV2lqNEd4NWJITWI1Z2QxQjVOWC90L2M2?=
 =?utf-8?B?QVg2VmFXc1ZBK2VwRm5FREpRMFVOUU50NTczT1JOaHlLc3Z6cGFiME1Yc0JH?=
 =?utf-8?B?YjExMzllWkJncDZ3VjhtUzRiSEd1WTBPQW55aC9XSXF4S3pyaERudm8xai9D?=
 =?utf-8?B?Q0hIaHo5SURIQUlJSlVvN2t1dGxsS3lyWVJJc2hIRzgrbE5vcGp1YlhqV3JE?=
 =?utf-8?B?SnpMb2NjMGh1eEZxMGQvUEpzdmJMRndnZjdpMUF3UmxaeGwvR0pqd29odDlL?=
 =?utf-8?B?REJCWDJvSUl2dzMrc3ZMakJDUk1YWmdEaDc5OTZ4MFJaMmxTclVaZkdzeXVP?=
 =?utf-8?B?ODUreTNUOEhUZ284a01pdW5kWmR3N2ZKcVh1REVDa1lxVXJYbGdyNitMR1hH?=
 =?utf-8?B?UE1uVVJyUVdaTXRxVXE0WnZuS0RScGIrd254ZXBKbFhNWnB0NDhuT0p3dSs0?=
 =?utf-8?B?U3ZVdFZBTFllUjcxd3pIa2RFY2ZSR2Z0WXcwcVFVVi9LSDB2Zk1Ec1Nuc25p?=
 =?utf-8?B?bzhrcFJFSDYxSlJOZjNUbzV2cnU3YUN0anVPOU9jOGhaU0x5K21xOUxIOE1j?=
 =?utf-8?B?MHI0MGlpMTdtSURnMExzMGNwbms0WFdIODArelZEQzM1dHZMUEtBSE9USWJW?=
 =?utf-8?B?L2VVUGY4NEQ5NzRJNEUzUWJZcE0rRUhKc2RxM28rMzdRNnd0Uk5XUXdHZWJV?=
 =?utf-8?B?bHU1VEFVSmpWbXdQMFVMZjJwUTBMaU8wdUh1ME9RbDhGU3U4L240b20xRFpW?=
 =?utf-8?B?SXFnekxXYVRwSzBhSndWdnRqdC9xSmpWSXFKalhUV21Xd2MwZ1ZrSXBla1pa?=
 =?utf-8?B?VFZSOVhwOTBjRFc1Rm1NWFFaTkVBNzRqU2U5bjZPWTlKLzErMHJHSW5oM3Yw?=
 =?utf-8?B?TTkrNkhDL1RBMjdBaFdxckZDak9HSFM5Zm5KU3dnU1BxMHd4c3U4KzUxc21j?=
 =?utf-8?B?RE13a2tlMWpKSHFEVHNXc1M4TG9rbXoxUDkwSDFYZ1NYMlhTcW5JZHprS1Vl?=
 =?utf-8?Q?EBjJIIx1QL6GxyLM5AqWAnupFixapS4xb5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:05:14.5546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: b1185b5d-8224-4a9c-7243-08d8b3ef2f61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccP4ZfscYzM4k8Qd3Ud6o45pOTtZv1JPWlg9NaowhOAqpt7quIF5dobHdi5qwatSygkLmtcXMBvC93vqEWq/LyGrBo5/Jmb4KNqNALHqHw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------6223324E7948AA31D502AE18"
Content-Language: en-US

--------------6223324E7948AA31D502AE18
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-06 5:06 p.m., Leon Anavi wrote:
> - There was a regression in 1.7 that meant that __slots__ would
>    not work correctly for Basic instances and they would end up
>    having __dict__. This also made it possible to set arbitrary
>    attributes on Basic instances such as symbols which breaks
>    immutability. This was fixed in 1.7.1 to ensure that Basic
>    instances do not have __dict__ and it is not possible to set
>    attributes on them.
> - Fixed lazy iteration of series with expr.series(x, n=None)
>    which was broken in the 1.7 release.
> - Updated documentation for sympy.stats.sample for seed argument.
> - sympy.stats.sample now has an optional seed argument.
> - Random failures with sympy.stats.sample have now been fixed.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-sympy_1.6.2.bb => python3-sympy_1.7.1.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sympy_1.6.2.bb => python3-sympy_1.7.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb b/meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
> rename to meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
> index 428b40c3b7..d4508689f6 100644
> --- a/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
> @@ -6,8 +6,7 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4"
>   
> -SRC_URI[md5sum] = "50d6b69b1de36b757484b9ff833a9e0a"
> -SRC_URI[sha256sum] = "1cfadcc80506e4b793f5b088558ca1fcbeaec24cd6fc86f1fdccaa3ee1d48708"
> +SRC_URI[sha256sum] = "a3de9261e97535b83bb8607b0da2c7d03126650fafea2b2789657b229c246b2e"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------6223324E7948AA31D502AE18
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
    <blockquote type="cite" cite="mid:20210106220702.10483-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- There was a regression in 1.7 that meant that __slots__ would
  not work correctly for Basic instances and they would end up
  having __dict__. This also made it possible to set arbitrary
  attributes on Basic instances such as symbols which breaks
  immutability. This was fixed in 1.7.1 to ensure that Basic
  instances do not have __dict__ and it is not possible to set
  attributes on them.
- Fixed lazy iteration of series with expr.series(x, n=None)
  which was broken in the 1.7 release.
- Updated documentation for sympy.stats.sample for seed argument.
- sympy.stats.sample now has an optional seed argument.
- Random failures with sympy.stats.sample have now been fixed.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210106220702.10483-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-sympy_1.6.2.bb =&gt; python3-sympy_1.7.1.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.6.2.bb =&gt; python3-sympy_1.7.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb b/meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
index 428b40c3b7..d4508689f6 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
@@ -6,8 +6,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/sympy/">&quot;https://pypi.org/project/sympy/&quot;</a>
 LICENSE = &quot;BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4">&quot;file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4&quot;</a>
 
-SRC_URI[md5sum] = &quot;50d6b69b1de36b757484b9ff833a9e0a&quot;
-SRC_URI[sha256sum] = &quot;1cfadcc80506e4b793f5b088558ca1fcbeaec24cd6fc86f1fdccaa3ee1d48708&quot;
+SRC_URI[sha256sum] = &quot;a3de9261e97535b83bb8607b0da2c7d03126650fafea2b2789657b229c246b2e&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------6223324E7948AA31D502AE18--
