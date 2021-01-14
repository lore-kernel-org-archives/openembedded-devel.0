Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.88])
 by mx.groups.io with SMTP id smtpd.web10.251.1610649786447223718
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:43:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oE4umuZ6;
 spf=pass (domain: windriver.com, ip: 40.107.93.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeauzCmbymaqcpM8CHkYdLVJEEX7N18wErYgmNAkWGuV3V38qcDGlZUmjad7m6+IXP3V1J0yqrAAZVtWpVs9dBoDcF9aauuwwMJ4whFqvV8cZfiCMYs5IiNTVnmczSxPEyil0D6HjoWqO2DUmCGzAxiA2M1ig5jdRWz0nohHJ3SF+BhMy204LUpdgDonUxp1nz3WNwNDXXQOH5iwP6+PWTR36DiWkt038op5VIlhfQ8K7NznHsUrOqeg0sy/z9T/FWKjzkOAcJrfuuW+20l+RCsW/f/Jru5EQYpR23l7hP1nVUs6awUfSwN3xvrqO/ZDKSfbrboudGUcv1UNqTvT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xBDa+sRSyzgZ0HfYV31tU3mY7k9g0CBaKdHbkuBaVg=;
 b=dBYW40S3KBjw2iCB6LqPidbRaArHcW0gRKT1vObgGAeuJX525lrMKvt/LIseorW1zwL6Wi8SRNLRV04ByNlQ1PY2axRNihRPUwXorpGYeNd8ddcCa5fUGEd5YisSMbL1SbAZChIljyeZOc+GQ1i9K93rt13Lqc5xhalYN8LBZG4S0G5X9UCUdE+7YgojsLgUftOI6KEvuvJfnfWPFkEEjtZJkncah6jKgn11mHDDvNECep2WzxdBYDi9WNspA+eCgPSECnDczRUsZTYHQPQThOoHkWhLwDVxaxezns6Pyp0Zdf9uYrIblG6+yC88BcPUnZ9Mn1BYmiYufIlJtuYwtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xBDa+sRSyzgZ0HfYV31tU3mY7k9g0CBaKdHbkuBaVg=;
 b=oE4umuZ6MxMES6spMms8BcLXYYLdzVvG+RW1hEA6Ty5fAI4EEqN4PBQ0D9GuoUJl4Nb9LnGV5CXw037YtPOBV/w4Ha+wds6tt8yOB3JQRhpZCJIl0kItJhj+KvXUsSJzlQF1705XUl1NzP+1DNOMOxzLCO8ANBLQSME7QI85XYg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 18:43:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:43:04 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-cffi: Upgrade 1.14.3 -> 1.14.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210112175641.5003-1-leon.anavi@konsulko.com>
 <20210112175641.5003-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <eca226cc-ee7a-988d-0c8c-e89d325f6968@windriver.com>
Date: Thu, 14 Jan 2021 13:43:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210112175641.5003-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR22CA0022.namprd22.prod.outlook.com
 (2603:10b6:208:238::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR22CA0022.namprd22.prod.outlook.com (2603:10b6:208:238::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 18:43:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bb4b35b-278e-43bc-6261-08d8b8bc3a3a
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3606B839EB52E99ABB913DF19FA80@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e7mrLARdajaG/sdedk8Ro3Qekdp0qfvn7i/Dwa9mCycmvMGLrgknLxRgq/niAkA4yzrXona/DRbnzBzwFvQmVSAjdDmu+FSQhmTDBZLYb5kN13rQ+4ElXto0Wx6ZDzd+ZJCCNlR7TlecjupCZ1e6LL8i2IiP9gCAr8Q8GJ6qSVagt9DENmLLn3AMaS8r12cXh07xxMfzQxOw7aTOxZEVG1MAWBwKDQFU1wPg1xMnKLgUWyzMpCFRbTfliZOp5J++x857RfclWROXnSmEQgHrlxeu2RxRo83+7aGFzRE7qsAmWnl+QsjL7Znje4LX7zPE4Vn9L/uxp1t74o42HBXtI6dphvw3Z7Gizh1DuxIC3TDBBanjiSJ3ZrhqQR6U0ANCpxMqQtPeGu3Xp6Lc3E72B7Ztp7X+cFgTF/bN+CR+iQf5HQRAXFCk0TtxJPBCmnWsn6nBrEHWhNT22e6cL3bzFP4QdAIHkwkvZMjKFYzTaoz5LnSfgLiK4TjBirkwU8KXyvOKw1chWLPBOO9aPSNI2TQabHzAJWOgiHIAgAbaQg1ur4PGSg44aJiMk2UiQb2I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39850400004)(136003)(376002)(36756003)(16576012)(316002)(8676002)(166002)(44832011)(66476007)(66556008)(31686004)(6486002)(5660300002)(52116002)(2616005)(2906002)(956004)(16526019)(83380400001)(966005)(186003)(33964004)(8936002)(478600001)(26005)(53546011)(66946007)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dmpxN2d0U0MycDNLUXdyZjVLUEJQU2hRVG9RRGd2eVZ0Zmd5L3dkc2FSL0hJ?=
 =?utf-8?B?a3JydDZIbE8xVzQwYjVrWUFkaGZjUnVqR1lpMGN4Z1dsVTg0TzZQeFZGemZZ?=
 =?utf-8?B?a1Joa1VjcXlhZmhZN3J6VXB2NWpOTDc5YmVSVkNjQUxYRWl5ZDcxOUZhOTdu?=
 =?utf-8?B?cDFnUXp5dFA4b0lsZlJVUndXYmpoTUc4VXVRYUpiNHZLN2dJMnpjWlhhckxD?=
 =?utf-8?B?QmpuS1g1RkVnVExvMlVNeDdZWjVxVzJLcGJBMTg4b2ltSEZNZXJjK3FiRlNL?=
 =?utf-8?B?T1dhVVBrVUxTczRKeElHeUdmMG4zUmpSSlRtcUlzdERGMUkrWGtHbExiWElz?=
 =?utf-8?B?WWZVZnhxbEVrVnNXQWJPaGhoRmZzSUdEdy9RTnU5TjZyUld2TlVGQ3dqVEg0?=
 =?utf-8?B?QkVBNGdTdU8rRmdjbHB3MVhvbmNHSDA4V0c2WXpZeS9rZldZUGJCTDZqMlJS?=
 =?utf-8?B?LzhLczdsMVB0NWJINDdQS2JrZE9mcm5aeFpoVGFROHVtWHpSM3p1bXVQS0FP?=
 =?utf-8?B?V1pjUEYyOVVPN0RRMWhLSDRYWHBTVzlvOTFDaGNkUjF6a2ZiWUE5bStJcC84?=
 =?utf-8?B?cUVYMitEdFU3QXhldEpjRnVxUG5qWlZMb25iQkQxQnRFYTNkcWNhRFRFRXhh?=
 =?utf-8?B?elY3VlZQQlJMY2ZKRkxYZlM1Z0UwTzdjaXJlR1RyaEVqT2lwRmxCc0tHR0ZN?=
 =?utf-8?B?UHdHL1o2R1N6TDB6YnU0d1NRU0xjTUJGOEptaWY5WEJyUE0yZ20zQUhOcVFw?=
 =?utf-8?B?TFZzbm90R1d4OE80K0I3cGlhVFdKSVpsdjg2NVVPZ1hLcFVyd1YreXJYTkFR?=
 =?utf-8?B?cjgydjBjRDlNM05jcDR4aWV0dDN4YVpVUm9EbTFMc291bVpzb0RIeG12bkl6?=
 =?utf-8?B?OGhZWldQTHlSU2RtYkpLUU5CeUZzRCs3NG5yNE1Eei91RSs4UGpsemlUSjhZ?=
 =?utf-8?B?ZTE4MHloYlZxeFZMb3cxNVZ5U3ROeDJQTkRZTktIVExuMlBxSGpYb1AwZm5M?=
 =?utf-8?B?ZC9RNHhCd3djakt5VEMrMm9NYVZGME5EVktWYkNSbzJrTmpjeFFVU2RWOVRo?=
 =?utf-8?B?WXU4NGNvNjhXcHNWMDYzbCtidW1yNUVyempxMmRzQUVWQzZGNnBkQ1FpQjhV?=
 =?utf-8?B?ZFdlU2dRTUZRSlAxNEF0ZDk1V2dzclM5R2VMQ2RUTXFjZ2lmWGROdk5FdmFa?=
 =?utf-8?B?Z2pjcnVRRnFWZ0phZW5ac3Y1NUd6YXBwVmJOSGtWV0RpS3dWN3FtK1U1Qll5?=
 =?utf-8?B?SWRzR3dsZVFWRi85WjlHMTBuSDdNMk5Cd3prT2JuZ3VXMHRMY3ovL3pabjIz?=
 =?utf-8?Q?5AWPnmxB71jgV7k6rC5l+05QPXIW9sVvlA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:43:04.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb4b35b-278e-43bc-6261-08d8b8bc3a3a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpgAukhwVMJHNuqF8C0tEWpRgbUkBbCgrF96WMeUjaABuSXV0ukv2NdtBs/yJ/1GYhgLk97koBt7nQUPtu3fl7q8IXd3VdRo4xgtLmyBOuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------D8740A8C22210EADAAD62A46"
Content-Language: en-US

--------------D8740A8C22210EADAAD62A46
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-12 12:56 p.m., Leon Anavi wrote:
> - Release done for pip reasons.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cffi_1.14.3.bb => python3-cffi_1.14.4.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cffi_1.14.3.bb => python3-cffi_1.14.4.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
> rename to meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
> index dbdd16f66..45962c6ce 100644
> --- a/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
> @@ -4,8 +4,7 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
>   DEPENDS += "libffi ${PYTHON_PN}-pycparser"
>   
> -SRC_URI[md5sum] = "c2a47ffd5d183b193ac8ed3414dcfd07"
> -SRC_URI[sha256sum] = "f92f789e4f9241cd262ad7a555ca2c648a98178a953af117ef7fad46aa1d5591"
> +SRC_URI[sha256sum] = "1a465cbe98a7fd391d47dce4b8f7e5b921e6cd805ef421d04f5f66ba8f06086c"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------D8740A8C22210EADAAD62A46
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-12 12:56 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210112175641.5003-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Release done for pip reasons.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210112175641.5003-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cffi_1.14.3.bb =&gt; python3-cffi_1.14.4.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.3.bb =&gt; python3-cffi_1.14.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
index dbdd16f66..45962c6ce 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
@@ -4,8 +4,7 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf">&quot;file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf&quot;</a>
 DEPENDS += &quot;libffi ${PYTHON_PN}-pycparser&quot;
 
-SRC_URI[md5sum] = &quot;c2a47ffd5d183b193ac8ed3414dcfd07&quot;
-SRC_URI[sha256sum] = &quot;f92f789e4f9241cd262ad7a555ca2c648a98178a953af117ef7fad46aa1d5591&quot;
+SRC_URI[sha256sum] = &quot;1a465cbe98a7fd391d47dce4b8f7e5b921e6cd805ef421d04f5f66ba8f06086c&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D8740A8C22210EADAAD62A46--
