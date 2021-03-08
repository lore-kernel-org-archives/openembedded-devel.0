Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.54])
 by mx.groups.io with SMTP id smtpd.web11.36309.1615212227501347774
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:03:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BU822P5r;
 spf=pass (domain: windriver.com, ip: 40.107.237.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeSpTsUBkO/18WWXO/cc72vUsaOCBkYl1GJnuwwcU+Nrr0YLH1imZ5UbgN1h0C9BdAt8sSSWydzgEikYU+5Ko/34S/Ngwmr/mmx63rMQctvSvIuKNOBMIvONUANd2XkmrZvAOOl1Zz/CiO6e4Lf4exb24/6VerW0YUEbmddUvmrqyCBD5LpD9RBnN7tn3d2V1n9jv4v7kJIe4Vom9KK86aSzSsWK9gQGBSAwYDb3zwYtExKsfIFra7FpBGVll1XGry4i8atepHM6rcvcrnFlGNtbb4vf0QPO0Q0vwQWJaMHsoBTZob92yOmxxB1b90aXws4Y2bRo/nplYDsMWMNTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kP/4cJ2p74a6gLT+LqaqyMEpWZPuelIB1Q5g4q2Fus=;
 b=bujgzc3KNiut4Yhy83sozG4QaeHo0QGrAse5gfWjp0huN1TzL2ZajnCmE+idLd5/QgSAN+97n5h1T9tOVa4CBAGs9Jc1JJ1auRt8gSiUj8JR1ph0BWhrlmv7Hg94Baj6HlFsCpN1TibhSGE/E0kMn7s6HlBppNExlGQ4iD0yXu63M7oZC77v63D/qGZH1+u3YehxvmGnvKf8E1GFD9vGBXQIQwJVjpn0CYG4f+gKipP74YINy1dLKIeqS+2pQbl11Wok95hjokrh6SIn6Us7eZAMpBe6GFWyDCqfZBGWSzrKs0lralJDN9opkUlFeF7lBYmkfQRXG9bhAxGahyJyqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kP/4cJ2p74a6gLT+LqaqyMEpWZPuelIB1Q5g4q2Fus=;
 b=BU822P5rftx3IKcaHXHIkT1tcdYf4JcQZnz7F2QM2ClYeDoKkcC7yXvCHS6FQ+kas7O76X0WhmdkF19Jc14LoNyuFaVVAgDK1J7iLhnop2ZfVUuS+QJNgdUSvYZQT+Ih4E5yTJKmFeOu1YpBFUGbXpxYIuMQMj5h8UsxZztI1Co=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:03:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:03:45 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-yamlloader: Upgrade 0.5.5 -> 1.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210304130554.32308-1-leon.anavi@konsulko.com>
 <20210304130554.32308-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <636d58cf-49d1-10ed-80c4-f865b33f93d5@windriver.com>
Date: Mon, 8 Mar 2021 09:03:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210304130554.32308-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0723.namprd03.prod.outlook.com
 (2603:10b6:408:110::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0723.namprd03.prod.outlook.com (2603:10b6:408:110::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:03:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b50d038-9c49-4579-84a1-08d8e23afd1c
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41035B5354C174ED240C32F29F939@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ObCTYzHazGGOK15Fnli1I+Cd0XFLJEfzW+vgHGSDdWIlxvlOE9CFYc47V8xaMAoZK4atSt1eCAFGeR0F4KKjRTeZJQN5u0QiDnarx2KOPVc/T4BT2gE+aQgj/aEPO0uhKkmNVOQ5OIszXZa5tXLP0EcLX0xzqU8PG5VH5kygP1gM+DHn1AYRovU7H3Y62s9yDi8LE8ayGCSzRj54Y4ByrSu21jOBN7NIqBTE0ZUzYsZU5NxOjWD65/2QhlUxUJIVq29mo6pFLsGBwtaHJbZPdR0oHw8LCHth3vAdvVJyYYQghDtB3zCNH6xo+HZ0ponJf0cMuR7CrBZMkQpizUSoqfLqrfWyuW9jc0JaWDm8etPmbwFWt9GKftYdyIEgpCkEvGN2+PYlY/N/F4txFAYT9WRbD/ji5KU/zJaZJ8XgtTBMN+qlkk5PO028lFnnVB52js+HhaTH2xsyinoaFJ+TG68WZiVQcKgUe/Wfr1HWJSoH/S+GFp/AE+S0ertUw8KJYpaPxtNa7xCuZapxOuE4vx7hq2XDLKrSYCVXy3Yt7spQOROZWOpfVXOEOj3fb1R+0gvNUDByicQxVlDhRfnD4fuRobC9rH1K6MpZbH4ZSlJvry9NWFYXfOg7znHzo0yqElesbluAze01SUFiU/GSv8KMbDEGm+VrRwQqf1c97DbBYsJf0qonLolQqvptnDFK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(44832011)(66476007)(2906002)(83380400001)(16526019)(26005)(66556008)(36756003)(31686004)(86362001)(31696002)(16576012)(8676002)(6486002)(8936002)(956004)(478600001)(53546011)(316002)(2616005)(33964004)(166002)(66946007)(186003)(966005)(6666004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VndJOVVzYmVLZmh4VEh2RG5pUUpGV2tsR3VxOTFoYnFjL1BLNml4MGg1SXo4?=
 =?utf-8?B?emRVb1RvbWVZK1dMSXhyVExDWkdxWDhySitjektlYnFzNXpwa2hHOEkzeWNC?=
 =?utf-8?B?Vk1Mb3dWUkQ0YWxjWXVVb0hIZUgxTGdXOVAzMCtmZnU2b2hrL04vcWlKdG14?=
 =?utf-8?B?dnBkaG1waExqZUk5ZWlpT3BMNnVCRHZVWWxHS05odW5Ib21aWXcxMkphaDhS?=
 =?utf-8?B?NlQzYURGRzRLOG9XR1JCUllwTXBpa2J3dkFNTG9JdFdtZk1CZk4ycm10VnRi?=
 =?utf-8?B?QXBnbG1SVnlad1V6eEozb2hpaC9pY1duek04MVF1dVE0K1VIRzg2bjIxWHc4?=
 =?utf-8?B?cnRaNGNFRyt3ZTdzWmRpQXdjeFdzbFJDeDh2VjR3dnA1VXR6VGJ2cmhtNXZu?=
 =?utf-8?B?ODdEQWJKZDZiSWNmYkFWN0s1STVFSEM5Z1I2RWp6ZXFoNnBlTWU4UEJVNzBr?=
 =?utf-8?B?V3dISzhXNGtkYUxldHhqZk5NcHZoQmw5NnhJVzlVMXE2RDdPQ00vM3Bkdzds?=
 =?utf-8?B?NWRpc1ZaMFBBNCtqNjBPSzV3SnRVWlFNZkJWMG0wTjlQNDM1aGw1c3NEVC9V?=
 =?utf-8?B?dmpzMW1xbmFvZk05aEVML3pHbUNkb25hcGJ0cU8wdjdSTmdUNHBTMDVPYnFs?=
 =?utf-8?B?LzlScWJUK0xMcERoZTY1Z3M5UHZSTWJkRkk0YmtWZ1lUNGg1aWpMRnl1aEpF?=
 =?utf-8?B?d2pHVXlBSFYwZDZyU1ZUcy84TmU3UzN5eEQwaDJneWhPL2ltbGdlczl6Y0pj?=
 =?utf-8?B?VDVNRURmNVpnRlpKcmJENUtBZXVUM3JSV0JLOUdMZ1RhT29LelJ5b1NZMTNG?=
 =?utf-8?B?NktYTVdYUHZwSG4zTGR3Y2JZK0c1WTkwTGczdWZRQXdDWnVFc2FQa0djalJJ?=
 =?utf-8?B?Yy9pVmhLSDREdm8zNmpJY29SNzMyS09sc2h1cjdpVmorSytVcTdoa3Q4Z1Fv?=
 =?utf-8?B?c2pIWHpMT0hVdENYM2VLSzFlL01ocVNXWkI4RlZqcXExSFZuQURWczRmcDBL?=
 =?utf-8?B?c0xPSWU0U0twaENzRUZLZ1RHYkk0OGRTSUkyUFoycndMNWtHdVByQUt5QnVK?=
 =?utf-8?B?WGhDNERMYVkrWEtYaWJLNmNhM1NJMUUyMUw0WjZMNm8xQjBvdlpVRXdNakMx?=
 =?utf-8?B?VjZzWkczcHBRTlRRdTRtTlNNZHlrd2h3OHpmRTUvckhyck5COWpSSjVncGJl?=
 =?utf-8?B?N2xyaXBnamtWTk5xai96TjhnamY0bmpNQ1FPWTJQaWh0WmxEQlVibFRPNWU0?=
 =?utf-8?B?T2l3RUlVT0k4K0psaW52bHNaT21qektPMEtZRWQ3ZzRTc0xBcHNXYUl5Mmkv?=
 =?utf-8?B?RWE5NE1YYi9kQllWRDRvYUU5NTF3NklTSlZBY21oVHJSVlJid2lYOXBFdk9Z?=
 =?utf-8?B?WEg3MmxTNjZ1YzRXcW5Tdi92Q0NraEl6VjVnb1U4WlBKcVVwZ205T1JEeTBw?=
 =?utf-8?B?d0hLZmhrVHU2K1J5OGFyVVJYREMybjhLdjFjZm9kclJScFdlaFpPZk1aOFJh?=
 =?utf-8?B?OURxZ0t2cFJzbHdTbGd3ZDkrampBV0V3aTlJOFVzeFBaWXZsSVQ0VTJRck5i?=
 =?utf-8?B?STlxbngvaFBCVXFQVnRvKzQyNWN2Z1NrWDQxRTIza0dYUHFvaFc0MlhEUlhM?=
 =?utf-8?B?dDBqTzV2amNiVTBZRnlHK0cxMlZGUXpDbXN2cG5FSUtKTnBuRVlsVE1ZLzVm?=
 =?utf-8?B?b3pvdElXZlZtWXplbnc5NXBKUytZUEhRWGtleHRLaWtZR2pWSzVSK09XQ3Mr?=
 =?utf-8?Q?lqXGO8IGrxo+Z8v9e9DCKriWjGJQGQN9w+WheMr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b50d038-9c49-4579-84a1-08d8e23afd1c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:03:45.7599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/fOX32bOvlTsDMT0Q4R63N1GyBgnY8j84Mv5iJOJUkLDHAXlGxJ7ay5YdjjbiXauPOi3OAhJW4OBWAQXo8EpblBXheE+Mt7cke6pYQV+FM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------24075B478F6D2E5E122229A7"
Content-Language: en-US

--------------24075B478F6D2E5E122229A7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-04 8:05 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to the first stable release 1.0.0:
>
> - Main change is that it returns always an OrderedDict, even for
>    Python >= 3.7 for consistency
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-yamlloader_0.5.5.bb => python3-yamlloader_1.0.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-yamlloader_0.5.5.bb => python3-yamlloader_1.0.0.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
> rename to meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
> index dbf84d4132..a2483a6f46 100644
> --- a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
>
> -SRC_URI[md5sum] = "2e0750ace81235f750c072833d79c4c3"
> -SRC_URI[sha256sum] = "dcab5f16b39bb03d10dda4cd4f30c943675ec4c7771807fc67e7f1bb319bf4c8"
> +SRC_URI[sha256sum] = "e96dc3dc6895d814c330c054c966d993fc81ef1dbf5a30a4bdafeb256359e058"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------24075B478F6D2E5E122229A7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-04 8:05 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210304130554.32308-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to the first stable release 1.0.0:

- Main change is that it returns always an OrderedDict, even for
  Python &gt;= 3.7 for consistency

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210304130554.32308-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-yamlloader_0.5.5.bb =&gt; python3-yamlloader_1.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_0.5.5.bb =&gt; python3-yamlloader_1.0.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
index dbf84d4132..a2483a6f46 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/Phynix/yamlloader">&quot;https://github.com/Phynix/yamlloader&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e">&quot;file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e&quot;</a>

-SRC_URI[md5sum] = &quot;2e0750ace81235f750c072833d79c4c3&quot;
-SRC_URI[sha256sum] = &quot;dcab5f16b39bb03d10dda4cd4f30c943675ec4c7771807fc67e7f1bb319bf4c8&quot;
+SRC_URI[sha256sum] = &quot;e96dc3dc6895d814c330c054c966d993fc81ef1dbf5a30a4bdafeb256359e058&quot;

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

--------------24075B478F6D2E5E122229A7--
