Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.50])
 by mx.groups.io with SMTP id smtpd.web09.7798.1614177715772035736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EK2cM3bK;
 spf=pass (domain: windriver.com, ip: 40.107.236.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jtnrza9hed5OiwA6J/lCHSgPaeg+gTvPJCtiSOpnx65W+JByRcJfUhRmLxUCKvZ4HUPOaj0DA8xDaqzmyTwC4fHclFW5HGArShSWKg7N1D3XWgb1RO0Il0w4jzQ3EqdRuuH8GJsqNTUdO/kC6y9txkdalmUbFQMHZG/Z9up/vMzKi+tsZCdWMiDVhjPVX//wiCvCyYepFaQ6SZh/N+HGBixjifN5ck3PZJVnC8l66a1pRRiEXpJPSKcC4ZXpmgjqvXyaTWKDCzRQ7vcYjxG5k6eMOq0lGsS62+i5UGvbpDedWJGyI3Qu7WfOeGfLoU9sZSWkgI7XfCajOWTFI+LB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/FChP3yhUBXONZRdGz7W/o6VOF7VfKWOXCEOrzm9hs=;
 b=gNUVEkWth9FFP1gOtfbYTlvtWq7Q5dC43VVr0ItDkPJ4sSfJ4/n/oD9qLDKBsb/6O8+TSuWZnF5hB4CQBllZZYMevnIwT4oo2EAUf1QII3/K8kS/ao0EAnUy+KZDEft1JEhfR5ngkqVD5Hz3kLybcxWfsN38SEhuegwpQYyv3nA30fDWEmva/FNPSsAfPE3vrESOUHsSpyTRi2clfa+A8XsfNSXz7oNYNI6S3L6YwavFpTltLT72GeoX4BtUgnZ3ycLqd2cvuW4R2EDFKstl8hdfkJI5WW0Leuz5OnEWb6b5BDRlILwXQKBxNBTsKByGcergttCzZXgW8rCakDrsTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/FChP3yhUBXONZRdGz7W/o6VOF7VfKWOXCEOrzm9hs=;
 b=EK2cM3bKaxw4s33xsEmglPx7rSvx64xdGYBKw5Q4GE5lB62fi8GKxQO+3IpE/osAwDM9dJqNYGCMH4coMm9KVmmK5Gddf7oVOv1FLZRp592Yi9/DT8XR50q9atKxioEuyuG31wfHuZIW1J5wAyVePewV3h6JnLJk165GKHZC6i0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 24 Feb
 2021 14:41:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:41:54 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-pkgconfig: Upgrade 1.5.1 -> 1.5.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
 <20210223152219.32129-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <781d1d08-aa74-0bd1-aa90-5ad6c016beb3@windriver.com>
Date: Wed, 24 Feb 2021 09:41:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210223152219.32129-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:208:23b::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR11CA0025.namprd11.prod.outlook.com (2603:10b6:208:23b::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 14:41:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e09e4d3e-4a03-4837-0b13-08d8d8d2546d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4829:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB482940EC9284181FCA80FD779F9F9@SJ0PR11MB4829.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mq9IRhJXGxO29CRU5aUGGgQeoG9JqGCnjBKhM7+kEj+xvxjaw83MfFv+5R9/jwAKo/IUPC2eR1aAyVuplQhJ8yzu0tG+sA35XYVi+YQC7Z6xMDitw/Cwq+28xzYv/HRg/yjc8XL2BJ82AY+5nLQCCImD9jsDQFCnrL3L3SXm376mfyOwnz1TfZCR3toElDUvv66HSqL2KLn8lc1R7wGj4a60FLTDDfLTG+qL9CX847WvuAT+8gCvZMlVoyapfniUEWlVwYWdvZkhZHKrP3DvNoMgyzAQN8gJEfKOaTOM4p02n/Ln7z3l9vvpTQn9fz9buomBwtX6pXzZTEVic3t/lmDxqdiQVSMruXu18kobIc2i88rvHsb3evBnaeFHflrD3aO/lbDmyuWyjgNbluuIwwLpbCzpdYNJ8ltFbk+TPyffsCmG69SQsrfzCfNErWD4rDERJv/t7h/sRGGHhOBHGIhw2c+NjKCyH8ULIEw4YcV/oET8emubGq78tZbj+S8h4Pce/TCZu3OMR+dGM9UksHdbc+naCZjk9CxLG9lX3xNxsBh5fyeU17gmZRNavq5TcDHo2kHljfDPBYUQCPNj+pquuNKVmAV10WGXizvnvgB5tZcYXJQJFAjPfj/ls3b8hTytrtFyeVjdZOH/Yi4LgT7piZc8MTLLnJVkKBaPN6wfjojb+0qMnJAl7NMvgIRE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39830400003)(6486002)(86362001)(478600001)(186003)(44832011)(31696002)(16526019)(316002)(16576012)(66556008)(966005)(83380400001)(66946007)(2906002)(8676002)(66476007)(2616005)(26005)(31686004)(166002)(53546011)(5660300002)(33964004)(956004)(8936002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZURDaG5WbUx4V1ZVbmF3K0hCa3FwV0lzRVd2U3lPY3o1WVp4NncwcTBQN0JG?=
 =?utf-8?B?TERMVDk3UERONy95aUg4NmNOWkp1Q01oU0xJMHB0RTJWUitvOStkUjhFVTh4?=
 =?utf-8?B?ZG5taW0vQVJMUURYSE43SndxcXJST09QWjc4djdCSHg3RjQraldmbnFSRE9q?=
 =?utf-8?B?THBxa3RiNnBVQ3dqNGliWlh2Rmt2ekdTY0tFaGozTGJXRFBubWdmdU1GRlcz?=
 =?utf-8?B?Z2dzdXZsTkpRdld0NHpVN3RNU2hIc3AyV2tsb3psOWMxWFY0RXd4bHZTdWNP?=
 =?utf-8?B?OUxSZlpzUER3TXg3SVZNaHpKR0dvWUl6ME5ldmZwMnNMeDM4bmhpbFViaXE5?=
 =?utf-8?B?bUdhbTMwajVEVzhVeVlPdndEZlY1cVZnNVppdnIrMTlsRXNLKzBqVWNEZW9C?=
 =?utf-8?B?eUZzeGRsNFFGTUYwUXFJYlFYdHhsUVhVOXlNakNQZG51ZjRsdFdwWlljSWht?=
 =?utf-8?B?MEdyZ2x0TkxiQkExUjNCeWRsSVBhRkovRUFnSzFCdlN1VkFneG5QeW9FTDMr?=
 =?utf-8?B?eHVsVWJNUFIwU0UyL013K3B6cG8zdm1lRncvQUlQejZhbzhWdGV1THJzVTRW?=
 =?utf-8?B?d1loK3N0T0pzV1hjcTBpaEZycUx3QzQzOS9kQTE2Ukg2V2x1a3RIclV2Q2FS?=
 =?utf-8?B?eHk3QzE5R2dlWGlBbVl1bzk1SWVMc0tOalhURklYMnZIdS81b0RxRC84ai9O?=
 =?utf-8?B?RmZUZHM4OFZPcnVDSWU2cE5IekhrVVE4ay9hOTF2SXpMV1NkZVFIaDQ4ZUp5?=
 =?utf-8?B?Z0JMWlEvLzBNRHhzRjRtV0JweW5oTU41WStOejR0T24vUFFFTGQycXhPTWFw?=
 =?utf-8?B?VWVGTHd3b1d0L2VTaU1rcFcwbm9rckREMmhNQzJUd0JBZFpaYk52U0pheDRG?=
 =?utf-8?B?OUxBdFVGZTFObWFYeU52TVF6aVJLVGdMS2hpbWFGNjFpb2ozakhHNFJhQWRm?=
 =?utf-8?B?cDV3a2RrK2k1Vm9XNUgvNkJKZFBSamRqaEFOR0xmem01MERPeSszVU1hM1Nu?=
 =?utf-8?B?SENxRStoaHJ4VzdtcjVGa3EzbTVrRmpkSU9QeStwZ0J1bnp5MGJ0MlB2d25l?=
 =?utf-8?B?NjBZMm5BeDQ1SERTTDQ3MjVSRUZNZFBQekJZTWN1eklkM0RSNkNaYXlQV056?=
 =?utf-8?B?S3p2Vk5iMGYzM1o4Z1FUM0xUOWZpMVphU0xBTnFvT1psZEY1R29pbTUxVnNK?=
 =?utf-8?B?YVNndGxlbXJTTVgxRk1IaVltZEpKVEQ2Qm9IeXZ0RUVEdVFWbkRVOHB1NmlI?=
 =?utf-8?B?QVhpTHBzTFlYUCs0WWw3RW1KSnVhT3FsMU9WYXJNWjJaTDdyQ3M3ME50Zmxj?=
 =?utf-8?B?eHI3cloyMVB6bEliQm92cXg1K0NsQTNFUDVvU3o4RlN5UUZCaVNuaThuWVZL?=
 =?utf-8?B?a1BpemxTWTk4MkV6azFLb3VUVUxCa3lIcCtVVVBrS1MwdWZKNmhOSzNSL0VY?=
 =?utf-8?B?NmhBNjVyMmFKT1k0bGhYeWpBcnozWEVsOHJkTGFreVpZQmlyaWRBd0NBcFAr?=
 =?utf-8?B?RittOXpWSENra1RNNkRGQ2xTZkJ0aitiWEdPeFZ4Ukl0Y0ErVUc5Q2FsY05I?=
 =?utf-8?B?L0lXYWdGQU9Nc1ZXUkJLZDFxVlI2MWRmUithSjRFdi9iY052SlgzeGtTc3VW?=
 =?utf-8?B?cWtWYlBZUVB6V0xBWVhjZ3J6aXl2NFJTOWhnRC9PY2EzdnB5Q3RtQk1YUkZU?=
 =?utf-8?B?TW1yOS8wa0c4V0s3LzdDUHZOeWZROTErMitRa3JQZFM3VllDNWpncUVuL1VF?=
 =?utf-8?Q?72V9cjcavSnnyeKZp54uPEOFfAcMp59jvlrFez6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09e4d3e-4a03-4837-0b13-08d8d8d2546d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:41:54.5228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76qsJbbLeaDiIyLvrRnh1ee7WWI8WU1gp6p9m8ws74HSQJbEH03xwB13L0jqTKEM6wMnGYRt9Dp3Vtf7etLOH5cmZvuOWFuyvYrvtUn9oVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
Content-Type: multipart/alternative;
 boundary="------------3D09C200013381DD093F3841"
Content-Language: en-US

--------------3D09C200013381DD093F3841
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-23 10:22 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.5.2:
>
> - Added Support for Linux On Power
> - Use poetry_core as build backend
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pkgconfig_1.5.1.bb => python3-pkgconfig_1.5.2.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pkgconfig_1.5.1.bb => python3-pkgconfig_1.5.2.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.2.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-pkgconfig_1.5.2.bb
> index 05ca3beecd..7a98ef2884 100644
> --- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.2.bb
> @@ -4,8 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc"
>
> -SRC_URI[md5sum] = "9f9cdb224ec0a1e59efcc7cac4b91972"
> -SRC_URI[sha256sum] = "97bfe3d981bab675d5ea3ef259045d7919c93897db7d3b59d4e8593cba8d354f"
> +SRC_URI[sha256sum] = "38d612488f0633755a2e7a8acab6c01d20d63dbc31af75e2a9ac98a6f638ca94"
>
>   RDEPENDS_${PN} = "pkgconfig \
>                    ${PYTHON_PN}-shell \
> --
> 2.17.1
>
>
> 
>

--------------3D09C200013381DD093F3841
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-23 10:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210223152219.32129-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.5.2:

- Added Support for Linux On Power
- Use poetry_core as build backend

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210223152219.32129-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pkgconfig_1.5.1.bb =&gt; python3-pkgconfig_1.5.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pkgconfig_1.5.1.bb =&gt; python3-pkgconfig_1.5.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pkgconfig_1.5.2.bb
index 05ca3beecd..7a98ef2884 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.2.bb
@@ -4,8 +4,7 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc">&quot;file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc&quot;</a>

-SRC_URI[md5sum] = &quot;9f9cdb224ec0a1e59efcc7cac4b91972&quot;
-SRC_URI[sha256sum] = &quot;97bfe3d981bab675d5ea3ef259045d7919c93897db7d3b59d4e8593cba8d354f&quot;
+SRC_URI[sha256sum] = &quot;38d612488f0633755a2e7a8acab6c01d20d63dbc31af75e2a9ac98a6f638ca94&quot;

 RDEPENDS_${PN} = &quot;pkgconfig \
                  ${PYTHON_PN}-shell \
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

--------------3D09C200013381DD093F3841--
