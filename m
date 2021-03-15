Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.60])
 by mx.groups.io with SMTP id smtpd.web08.8186.1615813250536578019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pAlzNAfp;
 spf=pass (domain: windriver.com, ip: 40.107.243.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHKTMHdOm4piIEWP0KPTwJ1VX9nFWWdn+CToSFXrhDHx2X389g4jTE6EuPo+ZR4D/oQixATR87DOWATW64I8a1jfV0lorYXdjADtaUsY39KjlI5daDb5ytPX3Eax3SklvR3fzwJj+V4ahOmxUoHB+533lpB76kUG7cg0Tcirui4VQBTypt6B7aLOwpIMEZWMaobhLfvtlAI6Va01Pfutas+UKwimSGOYwKQJrWecfrPiRYkpEf0b88A6YAmdASMslGQQDgKSgLR+VVfUTKKXSvuhprRuz8j3n5KmVNnEdGPhxugMzlZq9mIxdq3qe256a6XfEFn2q0iN5T5FjK1R2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c28oXPGES4TOuospvJVNCzfQmFZB39n/D418kbISVic=;
 b=IyXXxTb9wZ5anaHl+RTZ18OjsGnzGkiyAmN9lIi0QVzdBCZthjryu0qNRIjTsKlmUcw95qdN54keU+AzpJYZQwrxM8euA3WyZajODaxdHcso2YXI7xguiUNyInDiuPd4V+A8yrrANQHoc4Y4ldaRVH/vwjoVRUKVM1j6c6udqaihCU4XvkcaXLZyIF8pfKeAzV4SGP/FJkPeVH2DDwjTm+MiszvFiNBh9umRRBkhlNZYopZiTbo3sKNtGKhLRSvFzJcr4S0CUKnp9+4CoQHYcse/kbqs4NnbN2aZaYoZqlSLIJZnin6S3lQKR5u8ySPebQuWFjKWx1P/X9YSuEN0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c28oXPGES4TOuospvJVNCzfQmFZB39n/D418kbISVic=;
 b=pAlzNAfptXh6zt0s4h/s2sJxLLthAd+aOzP6clRY3mA7i8VBvudj+tboXSznmWqPSpoxC2peKMirbGcM3qIC+pdb06MQodjfAwQ0w8MrsEfywmLKXfE1qvUPt72yKxTPN2Ndegqn54d1zJIaYZrGtA+omFVuWs1k8QUGGaDPJY0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:00:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:00:48 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-waitress: Upgrade 1.4.4 -> 2.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210312162600.8335-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8d5ece02-2acf-caf1-d950-f59f1fdefcab@windriver.com>
Date: Mon, 15 Mar 2021 09:00:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210312162600.8335-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0362.namprd03.prod.outlook.com
 (2603:10b6:408:f7::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0362.namprd03.prod.outlook.com (2603:10b6:408:f7::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:00:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbdbcd4a-587a-40fa-9765-08d8e7b25aad
X-MS-TrafficTypeDiagnostic: BYAPR11MB2901:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2901EF10C1BE994CB74CFAEB9F6C9@BYAPR11MB2901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WBOgh2BOI70o4zWCttrBImZOm9Job9TZdiw/DM2Os3jHQxlySfUpNFIMWjEcqslModWCnP1BCjAo6DArUBTh3pcN9iLhmPgvA+kpa5W+9hL/9gdrai4FTGUwWLda2Z7QvWHFxEDHXIH7qbKIe2RSpOVYdPYHq4EfvjME2m3vXH+YDZ2oYLhzN/yQtpyncYvV69eUT9CZLPWRBxKX04gQQEyfvjan/uE+aTnE3p2HYlRXahd/gSO0ISFkd4uMzdHsw5+knZmZJ82kr2B4C8x0B5DsY8Opv6sXMTTFahg8LHN2FvkiTj3y6tIsWW+9vjlUZM+s6/tfiy6hhWOAg4CB7pwpokl/WRvQ5WZLKDVTGKlhZSeJHNH0Vef4z+Rr3be9wG/qFA1BcRnxCSoFBCjtjtuChsHB7q0S6stGWjOeDXfOqHZy/qKsZUD/6awzvB1CBez+naJlJ0JcLDv8Q//gqRmkiIbtWYEi9mdmuC9Z7j6Ht4CHse58ndRs3d00iNwOFH9uvCYXJ2qKUYlxsj4+rcRAPwr7MkhfhY4Eb8AWEtqgFHHUfN2tzcF24Mm1k8dil2ARNrOUBnQd/f3XD9WKcJ4vx9prgabbhrVMSzHUwqWTyz7TAxDeh/Cf8T9dnd/VexZBy5efC/W7OJLF6WLMjtJwYefKWaDOp0munULXjyNOOBZ+PI3HWXL5w3w9ib9x0nFqu/rvlXQ6Z5mtAkAluzVl3J4tMszMCATA7qGpocc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39840400004)(366004)(396003)(26005)(36756003)(2616005)(8676002)(166002)(956004)(16576012)(186003)(966005)(31686004)(16526019)(478600001)(86362001)(83380400001)(66476007)(8936002)(66556008)(53546011)(5660300002)(33964004)(6486002)(2906002)(6666004)(31696002)(44832011)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bk0wQTE0akgybCtlL0s2UUJ5Z3NmbVlIQnM2THNMei9QamRnNmdPRXN3UkJ5?=
 =?utf-8?B?MGRDZkxGSG1hOEloblZWdHdhbHNxbjNDUXdEWW1KTENEbyszd09GeE4wMXJn?=
 =?utf-8?B?b09aUjgwanE1T3lCWE9Qb1Y5Q1Z3bEtGbU9wZWQyRi8wQS83RFpqZ3E5NFR6?=
 =?utf-8?B?UVFza1VLNnVUZXQrN1pmOUw4eDlaMUE3QWxmc1pVQTF6UWF5SklNc3NVOUdn?=
 =?utf-8?B?Yzl0N3E4TDdldktiMERrNXJ2OCtKVGRZcHhjYWNtUWsxOEFiSUJmK2VvYWhm?=
 =?utf-8?B?SWc1WTc2VVFtS3d0WEdFZkFweGswZ2xFWVVYUXB3TU0ydkZkSEx6YXduK2ZM?=
 =?utf-8?B?dm52NU52V2hSOU12cEZFS3hCcW44bm5qczhvKzlNTnM2OXlHOUFKY1M2NW15?=
 =?utf-8?B?WnJCNFB2N1JYYXM1eUZQdGtXSjNQUEJCV1d2aEhLVS9wcGJPNGhMT3YreG9w?=
 =?utf-8?B?RVJzK1c2S3Fxa2k2MW1MNjd2MHllZWp0b3JWeHJBbVMySUMxNGh6QVlhQzhN?=
 =?utf-8?B?ZnpJN2UzV3RXVkVTRmVZc1dqU2dJOXhYTXZmcUFUaXJaVklVS3cwbmduSjFV?=
 =?utf-8?B?Wkxab2pBeWk3NHhyMi9ybGZPUUc1VENKUzlVdGJXWS96b3M4RXUydHJBeWJ3?=
 =?utf-8?B?WU1NQ3RKeTZLZ0hnYVowRWRLZ083Ly9oUVkrQWUrbHd1a2pvemthd0xXdnA3?=
 =?utf-8?B?Q2xrL2hNV0ZmbHlWVVBLS0E1Mk1zV2VJQTU0b2FsWGxKdE1ONStzS1V2NlRD?=
 =?utf-8?B?STRycEdxcS9MR1p5bWN0Y3pDTk50NXU0YitqKzM1ekgrelRwanhQTU5LSEFB?=
 =?utf-8?B?ZmRZdVpMQm1jY3NQcEF5OUFGbzFHZWlabWUrQ0NkUlhuQUNERmVVM1lUUmJp?=
 =?utf-8?B?MEo1WkxIbERCbWpBWVk0OTFXT2NyNk5oaUN6cXY4VWh1MTgzYjBmUCtNRnU3?=
 =?utf-8?B?M2Z2aTN3WXNjZ0ZvbkdGeEEwY0NMVTBmUzlQZE5GanFFVysrZ0MvVUxab0U2?=
 =?utf-8?B?QW1wRDZobW1HQk1MbWxiblpJOXBLQnk0QzJVUTlXY21JeGFrYjZSMUlnWkxs?=
 =?utf-8?B?a2R5c3YyZFA1c0pLSDV3ZndIN2lyTStaTndCN2pjUEsrUEsxbWF1VUpEaVBW?=
 =?utf-8?B?NTh0V01KZ1hUTE9UZXFCNUNLRVYxT2o0Tm1oRHp6Mzc4L1IzcmxuZG1ZcDkv?=
 =?utf-8?B?ZzcydEZudWVZZG9ldmoxeVJqYXVHYTBnOUordjA1c1ByMTdjR2RnS3lsdjBQ?=
 =?utf-8?B?M1VPQU5UM1RTbVhuaEFhaHNHRXNFT290UVhLWW43bGtmRkZ6eDIzMEsyaHAw?=
 =?utf-8?B?TTc5YUc0T2pNdzZ0S0VUeDBsd0NubVIwcnJTVnIyUG1NNlZSbXRMeUNDZnc1?=
 =?utf-8?B?eHQvUVNHNHhIR2Y4eVRCWlQ3dk5yYklMUi9GWm5rV2VWdEM1UTlLZkw5NW5E?=
 =?utf-8?B?eXlUYlFLT2pLWkZlSjcyRy9hNXNvOUJYVkJRZklHdUx6MWp3VDFreGFITDNU?=
 =?utf-8?B?VXEyQktpRGRYai9mbjV3Qzgyd2lZZ0M3ck85dW51ckV5bERXTmxwaGlpU09V?=
 =?utf-8?B?ZUV5Nkpvb3Bpc2FEVXJZQUhUbjB4Tk9sVmhseW9VcC9aZFdHbjI4d0lFWTZ0?=
 =?utf-8?B?S0NjZDF6dm5KcmIzUVlLTTZFelp2QlJPMXp5Ty9VeXZkNkpsSExZckRnMzNB?=
 =?utf-8?B?Q1FydDZBT3ZydzFRVUZkZkNWVXBLRmpSWTFqN3RFVU8rZXNxaUI5cDZZd1F3?=
 =?utf-8?Q?hwKc2sQ8UDHEosG1W3LFYV3Wgz1YGusb0EiQ5e4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdbcd4a-587a-40fa-9765-08d8e7b25aad
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:00:48.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEMbdUobA6SlU87CW5JvQiesE3TmYvyMew3ABWPLnjG4oHSVIwWrL8HLRYSgQAfAP+qMXDGRNuWH68rwgCBwQYAjcPUEN1EuG65ocrdUKI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
Content-Type: multipart/alternative;
 boundary="------------9B6AC762FB1A69107D8005F9"
Content-Language: en-US

--------------9B6AC762FB1A69107D8005F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-12 11:25 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.0.0:
>
> - Fix a crash on startup when listening to multiple interfaces.
> - Waitress no longer attempts to guess at what the server_name
>    should be for a listen socket, instead it always use a new
>    adjustment/argument named server_name.
> - Allow tasks to notice if the client disconnected.
> - Drop Python 2.7 and 3.5 support
> - The server now issues warning output when it there are enough
>    open connections (controlled by "connection_limit"), that it is
>    no longer accepting new connections. This situation was
>    previously difficult to diagnose.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-waitress_1.4.4.bb => python3-waitress_2.0.0.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-waitress_1.4.4.bb => python3-waitress_2.0.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb b/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
> rename to meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
> index 3e207de4f..490dcee6c 100644
> --- a/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
> @@ -6,7 +6,6 @@ SECTION = "devel/python"
>   LICENSE = "ZPL-2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
>
> -SRC_URI[md5sum] = "079c3c4902b1cb5d0a917276ee70f1df"
> -SRC_URI[sha256sum] = "1bb436508a7487ac6cb097ae7a7fe5413aefca610550baf58f0940e51ecfb261"
> +SRC_URI[sha256sum] = "69e1f242c7f80273490d3403c3976f3ac3b26e289856936d1f620ed48f321897"
>
>   inherit setuptools3 pypi
> --
> 2.17.1
>
>
> 
>

--------------9B6AC762FB1A69107D8005F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-12 11:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210312162600.8335-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.0.0:

- Fix a crash on startup when listening to multiple interfaces.
- Waitress no longer attempts to guess at what the server_name
  should be for a listen socket, instead it always use a new
  adjustment/argument named server_name.
- Allow tasks to notice if the client disconnected.
- Drop Python 2.7 and 3.5 support
- The server now issues warning output when it there are enough
  open connections (controlled by &quot;connection_limit&quot;), that it is
  no longer accepting new connections. This situation was
  previously difficult to diagnose.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210312162600.8335-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-waitress_1.4.4.bb =&gt; python3-waitress_2.0.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_1.4.4.bb =&gt; python3-waitress_2.0.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb b/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
index 3e207de4f..490dcee6c 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
@@ -6,7 +6,6 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;ZPL-2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2">&quot;file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2&quot;</a>

-SRC_URI[md5sum] = &quot;079c3c4902b1cb5d0a917276ee70f1df&quot;
-SRC_URI[sha256sum] = &quot;1bb436508a7487ac6cb097ae7a7fe5413aefca610550baf58f0940e51ecfb261&quot;
+SRC_URI[sha256sum] = &quot;69e1f242c7f80273490d3403c3976f3ac3b26e289856936d1f620ed48f321897&quot;

 inherit setuptools3 pypi
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

--------------9B6AC762FB1A69107D8005F9--
