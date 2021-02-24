Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.48])
 by mx.groups.io with SMTP id smtpd.web09.7892.1614178062341879427
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=l3w6NDB7;
 spf=pass (domain: windriver.com, ip: 40.107.75.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVg4YrA/HlBiMssDXvbMlky+FBkF1JbMLiI4H9vbwPLWuaTSgYgeEoz9sv6TlgONy675A58G4nxHMKpfUHE548jpFzysFDllmdd7wxglfjP48GNweZiQ/OA2AcoMjTeDxxs5gPAAM2vebxwRdDpL0/bv0n9CwcUYwrnGZ0aPK/08teBc6tRck60lcoiLiecY1ge8tJKLDf4WMFJm9Xg/n3WPYhgJ+GagTM0WX+Ayb5GTebCzmtzK63q1Gq0WnpgZPX6T1+ma8YDLLGHt0SYmbI3OkLdiqNWeOlXnlty6//mHuAQ0rvnoozRqvyQ69NaXJElzOTl9y1nyLOma1pWMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RziSk5U2eDWixUPFnzNhcxmV3dXxxMpKqLcNB/F9gcg=;
 b=FgnMeDqcgLfDviMfddbSFR93u+TPTg7Kcmqyt9G1/quU8bisE37uwA3gS2ea/pl4bTYhH9St5L261XaJCbslEZnGldYym970AMSDuW/hKhXdgzKrOF7oFaUuDA1J+EYA1z50grga5SopvUF1GPmVeW6ZGKPDDwRiGcR9WoXm+C7Al/M6sAPyT4PAGpN+sII/mPPQEfYPOHVoIupFTeysPvdXZR5rUyyflXGFARDy+SKOB13azf3NHoYxXN0KRhKTCGjtNGl1URFVl1hZAANBFScvpgdpP/MbhxnXUOSevyVBK4yCw/pYq6b9YstJCeOMl6VxCZXeAFLYYeOBE8flWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RziSk5U2eDWixUPFnzNhcxmV3dXxxMpKqLcNB/F9gcg=;
 b=l3w6NDB7/Te5IFVeL7hJNqkIhfkg1q7qXahnfWZL+dG5ZW++1CraqCZfp7BmSSY8CEW0asb+be2oF3jU9k7rGZ8IZSBkF3qVhdvkguU9jq+mvK3NVbjkPGYQ5xzgb1xCV3+V4Qkv+4yA2QZ3Aq0YkpmnHoUj0kHOzKai3CD7sQg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2904.namprd11.prod.outlook.com (2603:10b6:a03:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Wed, 24 Feb
 2021 14:47:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:47:40 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-watchdog: Upgrade 2.0.0 -> 2.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
 <20210223152219.32129-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5106f51c-ce5d-37d1-835c-f2916fb83651@windriver.com>
Date: Wed, 24 Feb 2021 09:47:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210223152219.32129-10-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0288.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0288.namprd13.prod.outlook.com (2603:10b6:208:2bc::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Wed, 24 Feb 2021 14:47:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3f1e522-2ba9-4e5f-0197-08d8d8d322b5
X-MS-TrafficTypeDiagnostic: BYAPR11MB2904:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2904CEBC693D21200E3F61AF9F9F9@BYAPR11MB2904.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UW9L7HWTRMZq1eYu8pFHiInRcLY2GgLIQSQ6wpmB6diJ8TyD80P4pSvD4bP/qadXqz2ARoXRykJKv5Jt9SrpNpamrNfxcDcH3OPFFTbnfgeX9zRvZOAqmLhHDf17XOe6HJTTw2evjY1zD7pFH1NZC149jJZfzb6gs+QZOkfAiRz+jLRUTyw1S5rBfT7zzzip5NCq6yUnD/Iy0Cl5QpPtLA5FpRZAHCO8NIqakwQYpq4EqVz8dGd90WM4LClQwHXhH/p98QPoO02Ui3s7ZMzxyqFv49BgyShiBe3NAfDLt1wlxWdgythLarCcvvcLf7RKZHWHcHfWyi+VJW7bIdi3mFtVK2Qf1pIYRhSTb+NruJ/4q60H4iWPdGwubwLEYvc6E4mZdGZUZv3zVu/7mWW0SdqTlRkdftqufxUvZBuIR2TRCMIAZLCQqQxCL8tzKehsoZSP8MCBPqH0hBTTWWspoWL67OfSUROK+SgrADCLnj5mKNPS3EVNFy06GljnLGZuUsJCRF4EHS9quopCWqJLcIicUY2kF3wT5Ka4b0fUpSM52d7ovnN/bmArmtz4plvNtO7ovOZXL79uVuNJe0DxhwpOr9HxX72uqLSJ0tsXmPf7WfMA8n+rz2GS8CWHrMM+87XwlakIgwbNfNlokCM4fxkBZ8+f+RKtEHMGLlIDpNz1eFqUSWn5vlSGdt5vUjcS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39830400003)(366004)(396003)(44832011)(33964004)(36756003)(2906002)(53546011)(83380400001)(8936002)(956004)(8676002)(166002)(86362001)(6486002)(2616005)(186003)(966005)(26005)(16526019)(5660300002)(66946007)(31686004)(66556008)(316002)(478600001)(16576012)(31696002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b2FjYmkyaGY5U2Zlam5HTzVVV1ZFclgyNzcvbG85Qkt1OGJBM0VudEszdW1i?=
 =?utf-8?B?bjI2N1hlSzJoMGZKZjRmeGVrQTZpMUR6MXo4b0NVN244UEYyYU5wNVViZWl5?=
 =?utf-8?B?L1g1ZEF3cFlDRXhxMXhyaEpJRk5aL01MVkE0dHJUaHdqdWFaQUkxeVNuaHRj?=
 =?utf-8?B?ZGh1N3hzV0ExMGRQRW5LeG9JVmJiY1dxdWJsQ2RBQWZyQ2R4MXcwVHhsak5x?=
 =?utf-8?B?WkVJNitjMGFvQm9FSmZQdGVYazNMcDduU1FnNWN3QmFwaHMzNkJ6aHFYN3Ji?=
 =?utf-8?B?aFhSbStyNmRaS2RjSkZ6SkUrbVdMZWxRS2MvYVdBeWtlVU1Cd1JTZkdkVDVk?=
 =?utf-8?B?UE5Kck91UENBU2cyYzZwYlIvbHVWU0RLRGQyaGxTY082NWJvNllFUnVFdmVM?=
 =?utf-8?B?akNyZ2kxblVlK1NKZmVRZ1NQVEpHK3BPdTk3NUs2TGlFMk1nemNtVzE4elRq?=
 =?utf-8?B?M0dkZFdhSjBpSURJbnpNL1ZxQzZQckJGd2grQ3UvMEhjd042V0UxRmtmWXlW?=
 =?utf-8?B?dVRaVVpDTkhZeVFjQ3ZNcjdLWjNBdVJzNDdPQWdyR3pQTmFhMW5JM0YyckVY?=
 =?utf-8?B?VU9KcUdnb1hHVG5ZSnZ0OTBUVzBqSmYyamVRcE5BVlI3S2l3c2xwT1FhWVRu?=
 =?utf-8?B?Q29hUk5DSkJwYnRpVHhMcDNORmJqMkFySHJUVjcyczZBWnJTSVZ3ejZveW9L?=
 =?utf-8?B?OWlLSEQrMWdCeC9iMTA1ZkNEaEZ1bGVSWlRlUmt5eEpNaXJvK3RzQ0V3VUF5?=
 =?utf-8?B?bmUrWCsvajdocEdLWWsvM2dTSDZjVUpYU2cwMFh6Qi9GZE5pZzltZ0RpZ2pi?=
 =?utf-8?B?VTlzVFoyQnY2dUUySk1nMFQycWlVc0RsQS85U0hZU2FhMDRWSXR3L00wYjFX?=
 =?utf-8?B?MFQxNUpLUi93dGdCNmoyVDVKOTdJUi9rQm4wQmhxUmVHK0FmWm1XQnJ1ekow?=
 =?utf-8?B?TUtEZm5ZSHlNZWpqZ0dYZ3lBOEh2aXZQbzFuMENUdW5KbnN1aXZHYm80VzlV?=
 =?utf-8?B?TkV5Smw2TlJhUEhEN3Nsbms3T2s1TXRydXBrV2xHQXBTZGtTdXBiQU53bU5M?=
 =?utf-8?B?SFhqZUE3ellFS1VOazBTQ3V6ZHA5S0tCUlkxNXRVUHI3TTdTNU5WV0I2VW1J?=
 =?utf-8?B?UUJRV0xiLzVHeWdCNjAyQ2phZUFjQ0w0YVBWbjN5U1plN0t3MDIxM1JRVVM1?=
 =?utf-8?B?YmJ2KzdoU3pDRW15dW81TU52RDNObFRhbEtka2R6emtsQU9SYmIreWorektZ?=
 =?utf-8?B?YVVqeGo1R1I5VEgrZTVTVnJMSEdnWEhGdmdKMW5WL010aVU5N1Fva1J1M0lI?=
 =?utf-8?B?K1k5MFhhbmpGSmlvbjc4UThRcnErZzFuZ2lSSElONi9TV2pZaXJTeXlPbXlP?=
 =?utf-8?B?ejJiS1hTcHU4ditSYkp3SzlVZkpueFdpZXBySisyZCtYYm5aRHpPNjRMWVdD?=
 =?utf-8?B?TCtYQnA1Zk0vRTl6ZTBrTWxhSk90b2oybW5ORUtrZlpIaHRVVUhzc2dnL3pQ?=
 =?utf-8?B?SHhHeTBnNTZVK09WYy9mblRoQ3Q5MmJNeEV0c05kaGJYL1RIMG1pZUZkT3dT?=
 =?utf-8?B?czQyRVdFZE96TVpnYjJRQkl3TkhSRDNzVU1aMHBtL0JjdVArN09NTHdjcCt0?=
 =?utf-8?B?ZVV2ZVp6VXh5Tmh0aU1weEpjc3JQclFZSWUvUjVKc0oxK3hjT3d0MnJlRVg0?=
 =?utf-8?B?R3ZMcUh5MCtrKzA2ajQ4aGlsOVUzL3NndDc2eUsrOEtpeTlWU3BrMDNsOFZz?=
 =?utf-8?Q?h8l2SdhMNxpAfzPCcPAAZVcthbVfortRzbg9LiT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f1e522-2ba9-4e5f-0197-08d8d8d322b5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:47:40.5961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzExSzs/34wfulHdGqVA8ngNpsYnak7x6kuqlhGlYCnVjbGtMNZIywOn70mbyE77qm+trhdpuiZAR/AZW0XybSSDYTxwWbC6W4delnTHcT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2904
Content-Type: multipart/alternative;
 boundary="------------00B5C5618D458E6602A99003"
Content-Language: en-US

--------------00B5C5618D458E6602A99003
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-23 10:22 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.0.2:
>
> - [mac] Add missing exception objects
> - Thanks to contributors
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-watchdog_2.0.0.bb => python3-watchdog_2.0.2.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-watchdog_2.0.0.bb => python3-watchdog_2.0.2.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb
> index 3dd1f8182f..c5387dc356 100644
> --- a/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb
> @@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRC_URI[sha256sum] = "fd4b56cfbe0d0d9c4fc431aceca75700a7f12d3737dc2e9cb2ec2ba649680425"
> +SRC_URI[sha256sum] = "532fedd993e75554671faa36cd04c580ced3fae084254a779afbbd8aaf00566b"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------00B5C5618D458E6602A99003
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
    <blockquote type="cite" cite="mid:20210223152219.32129-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.0.2:

- [mac] Add missing exception objects
- Thanks to contributors

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210223152219.32129-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-watchdog_2.0.0.bb =&gt; python3-watchdog_2.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.0.0.bb =&gt; python3-watchdog_2.0.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb
index 3dd1f8182f..c5387dc356 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb
@@ -4,7 +4,7 @@ DEPENDS = &quot;${PYTHON_PN}-argh&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>

-SRC_URI[sha256sum] = &quot;fd4b56cfbe0d0d9c4fc431aceca75700a7f12d3737dc2e9cb2ec2ba649680425&quot;
+SRC_URI[sha256sum] = &quot;532fedd993e75554671faa36cd04c580ced3fae084254a779afbbd8aaf00566b&quot;

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

--------------00B5C5618D458E6602A99003--
