Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.85])
 by mx.groups.io with SMTP id smtpd.web10.15067.1609774402212242020
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iIIVy31r;
 spf=pass (domain: windriver.com, ip: 40.107.94.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdLwcbAYCkpydfPM6QNADnA5KFjDLQAZ6scJ0eAb0sQ/uM9knwSyDS7aFeZzXUinzthMX9AUTzw0ND8N/1U6EcqbHDtHxLxaSuGy28MmnGbuWs9bChSIT7gjFkoPIkMVUFgrT+fukaUB5BfO20EIq+zEmxB35JLOLq4WsSDGHRD+Hy8D1yECkHGpHHYMJPa3DJ98+9v+E0+Kw5/zEEuE0qyHhA6x2FRvk8FTfLbJb9lryUoTAo+XUJP9ePKC+uMXDMr8xSC7m4sEo8QRYm/LyPmxG/bDSvb7ecuG95eIpKltY0qb3owpo+8kZTW6SC9aoNg8gR5La5S2Vobm362zoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KaRxU3PjcrQR/+Bd39LOR5APQtTIdcIL02graXs47k=;
 b=RqqKzdbTpqow97aiY/5beKsACzaAqH5UMAfIffhBT4V3UQPUmjaD8r8USX3ULMk4HJA0Y8wNFoYks69Mz48uykSPj8jGwpdZE2Wt+ofRL1gSce7dDJiFaxysQTkXs7myu8hs491nHddKP8i145RTtLFExX8ne+ebBwLtotkvHi3RIiwIK71VKMAXNocHuOPLelDEndU3OxenVgrGnIabcw8PXBZijbwndi/tOLENWBtDg07oSaolTgevpryDIiOiS9qx1Va96dn59TeFl9MOkMZdxlS4tnwZ7FRg6mgbY2iR2R70KkoSUu7lpUIss4L567nIthv85eeHyTrQ2YZ42w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KaRxU3PjcrQR/+Bd39LOR5APQtTIdcIL02graXs47k=;
 b=iIIVy31r1GIDDyyWLgCwt/Mm/10llLDqbHySXJ8TULIjQsox1Zv1eMHB1HHDl4pXVHzeK12GBqzOnc28U2oTY6YZDW8i7cKuQdP+EwHi4PfLXEgojj7v5jIu+csXBA/7I/uN6pu7iUF/chVuq3219Q+zOoaoT9LP2iDto94Eq94=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 15:33:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 15:33:21 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-pymongo: Upgrade 3.11.0 -> 3.11.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201222215727.25166-1-leon.anavi@konsulko.com>
 <20201222215727.25166-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9969f80e-5b16-12c9-06ee-cd3e3579af1f@windriver.com>
Date: Mon, 4 Jan 2021 10:33:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201222215727.25166-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0341.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0341.namprd13.prod.outlook.com (2603:10b6:208:2c6::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend Transport; Mon, 4 Jan 2021 15:33:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b41855c2-d031-4113-8002-08d8b0c61163
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50534AE13318E91DEEC077729FD20@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wt4o0vZQh06Rr2HOYIdnR2m8tZqrwI2GgUVGi6hZAEnb84pBmJEYqm2iD0T3xdEMBB5smfD34iftuZgWXJmtmEGm2IZ221eo/Y5WH56RgoRqJJWQgNtTip+XjsAuZ8PusNn7uKhU5yEiwKF9PmIhUlQ4uZuQ2T6gubgzmQ5KeEqAzDCcvz+bxzuLYXh4ugG81fe42f+cz2ARjftxbbK3wu6ik1cZ2JlEXL0rcG7Zm3BjAzDi6SphlZEPZ4wlPRsT06/szKBb1wIWiuN88Qo0Q99mZTeVlZRidr7H6qbqflCp9NdaQOpWJhXULI4NH4peNv4lQxEZvWLXU1JKVCUA8ZIrQ4iKt7jiGBo132S/Z2av/pSkqAEVUM6A0SY6XrOuXgTdFAUB9T0e+tkk9wFJNVzsNjWDmpvnj4VQgUhb47BvSNLAfD8qk05OC9VMU0l2/oaO1f1Bnn2iqUQLxiT7FCyDsRFCCO71CNz1ci2g6UMcMZk7Z0GreUu0VQFkqV+z/x1iW6JysIC4dLOlbOVCiirgVJMhu7Hy7hhpGrO9SeiZmGRCINieAuXlSKI85aJF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(66556008)(52116002)(2616005)(478600001)(53546011)(166002)(66946007)(36756003)(966005)(66476007)(26005)(31696002)(6486002)(4001150100001)(16526019)(2906002)(956004)(186003)(5660300002)(86362001)(8676002)(33964004)(83380400001)(44832011)(16576012)(8936002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YlhsWUh4dzg3QXNXQ1VWOFRONlVpMlRMOVc3VU90SzZkNjlZSktBNEFDcTVq?=
 =?utf-8?B?ek1tYjNEcWo2UmNhcXR3dmUyOUl5SmNrUi9xRk1ueHJwUWp5YmlMd0UySERi?=
 =?utf-8?B?Qm0xWHY2aG1CUFF5YmIvbCt2aTEvdzZqUnAwcXpoWXpmbmg0WjFHdUdPcE1M?=
 =?utf-8?B?T3RBbUlmdzJ3VVpGeDRSaGI2QitQM012blN5VlZTV1RXd3pCNHM0MHBtUFdw?=
 =?utf-8?B?NE1ndmdRa0lxaGdKeVY1WVBBT2RZaUVWUkRZSFdvSVl4MnRqREJOdTVIaEk5?=
 =?utf-8?B?ZEFjTVhuR2lKK2VjYVNpdFFmNkR4Qk1mNEtXSFZwcW4xaXZsR0dQaGgxbFM5?=
 =?utf-8?B?SG1IRDFWNVJnOG92aWJEWFZPV3FOU3l0YnJNTm9DOTZ6YzlPM1M4aEx2UHFw?=
 =?utf-8?B?VktrRFgwRVVaZkJFR3M0bCtabHgrbzJjQW53WllOYzJoa0RpSVpOaDZsZm9L?=
 =?utf-8?B?L0ZqL1BlRGxncjBBWTlUeUJmMUlHMk9KZCt3M3o2Z2RNMkIrNEtjOEUrRGZy?=
 =?utf-8?B?aklxakR1MFR5cG85QlF1ajgrQS9OdEZrUHh3Z2I1N3lna1VmK0lWNHQ5Ylpx?=
 =?utf-8?B?L1hEWWxrL0xGZSt3bldweU52c1o5VjBkd1ozWUcreTk1SWJMVkJha2Z0aUlm?=
 =?utf-8?B?ZTRCWlVpNnpsM01jNTJwd1Q4MS8zTGFqZ1FYdmR3U1IvaE91cUFNNjlQYTBO?=
 =?utf-8?B?TVVzWGxGM0VaeElMRXlzdUxLVVA2ZFlSOXplaGUzaUQ3ZW53YkVvOGhGNjdY?=
 =?utf-8?B?NmhtRDhJcURhOVZuQXh4SUNRa2Z4dldYZkNxcUJTQ0VlNS81NnNCTFV2Y3N1?=
 =?utf-8?B?OGFPdFp2UDMvQ2dsbzNyYnFNbGtMUzdPZmNvaWg2ZENYRlRRWFpWMGUrcEFP?=
 =?utf-8?B?K2lGNzdrTC9wTndiWWhnTnVTVWl2eFpNMmhXU0hCYUJZTy95YnllbkNPSGc2?=
 =?utf-8?B?U2hZT0RSajRIRlFwbG5scys0bWU4cmlIUVRpckFoRFhIME1sNGFVQlRzMFVL?=
 =?utf-8?B?SUdndmdMRTY0aXhVT2VYd2Y0U3BJTGRDSUNzY3pxTENJak1kM0I1Z05vSUpJ?=
 =?utf-8?B?NkI3elhqWmwyQ2wwZytaL1BUZjdFYm1GQnpYclhKcFp1S1hrb0N4clptZXgy?=
 =?utf-8?B?OHd1N2FJMmF6VnYxWlU3OHBmYVI4dmN2YmMxNVBJNkRNeGwvaitLSE1RZExq?=
 =?utf-8?B?TVo0UkwzcVYveFA0MjVEVWxzSjhhNXJFNUk2czlKZzJRL25HRlh2Sk9jQU50?=
 =?utf-8?B?WGEzK292Y0JWRVc2dVZWbi8yRURWbXJVTGh0QitsYjdwU2s2c1p1UUw2NWpW?=
 =?utf-8?Q?6PNVJq1F0DR7p0+kQkuU/uYS8zP8/G0i2v?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:33:21.3842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: b41855c2-d031-4113-8002-08d8b0c61163
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymeWvPYNIT8bEcFxFnMpuZ3M9JNdmmbbpq77sW60bDLrQX2+7PdOcOTeHHIviFXSzBbxzX2BxHKXQh2WJbvytXoudnt+xj0qrP1GgcnJg58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: multipart/alternative;
 boundary="------------2730FEFC0246B456F5786B9E"
Content-Language: en-US

--------------2730FEFC0246B456F5786B9E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-22 4:57 p.m., Leon Anavi wrote:
> - Fixed a memory leak caused by failing SDAM monitor checks on
>    Python 3 (PYTHON-2433).
> - Fixed a regression that changed the string representation of
>    BulkWriteError (PYTHON-2438).
> - Fixed a bug that made it impossible to use
>    bson.codec_options.CodecOptions.with_options() and
>    with_options() on some early versions of Python 3.4 and
>    Python 3.5 due to a bug in the standard library implementation
>    of collections.namedtuple._asdict() (PYTHON-2440).
> - Fixed a bug that resulted in a TypeError exception when a
>    PyOpenSSL socket was configured with a timeout of None
>    (PYTHON-2443).
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymongo_3.11.0.bb => python3-pymongo_3.11.2.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.0.bb => python3-pymongo_3.11.2.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
> rename to meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
> index 635de22d20..5372ac0ff1 100644
> --- a/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
> @@ -8,8 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>   
> -SRC_URI[md5sum] = "5d166c8f9500c83314deadebb95b6fd5"
> -SRC_URI[sha256sum] = "076a7f2f7c251635cf6116ac8e45eefac77758ee5a77ab7bd2f63999e957613b"
> +SRC_URI[sha256sum] = "c2b67881392a9e85aa108e75f62cdbe372d5a3f17ea5f8d3436dcf4662052f14"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------2730FEFC0246B456F5786B9E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-22 4:57 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201222215727.25166-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fixed a memory leak caused by failing SDAM monitor checks on
  Python 3 (PYTHON-2433).
- Fixed a regression that changed the string representation of
  BulkWriteError (PYTHON-2438).
- Fixed a bug that made it impossible to use
  bson.codec_options.CodecOptions.with_options() and
  with_options() on some early versions of Python 3.4 and
  Python 3.5 due to a bug in the standard library implementation
  of collections.namedtuple._asdict() (PYTHON-2440).
- Fixed a bug that resulted in a TypeError exception when a
  PyOpenSSL socket was configured with a timeout of None
  (PYTHON-2443).

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201222215727.25166-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymongo_3.11.0.bb =&gt; python3-pymongo_3.11.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.0.bb =&gt; python3-pymongo_3.11.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
index 635de22d20..5372ac0ff1 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
@@ -8,8 +8,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/mongodb/mongo-python-driver">&quot;http://github.com/mongodb/mongo-python-driver&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327">&quot;file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327&quot;</a>
 
-SRC_URI[md5sum] = &quot;5d166c8f9500c83314deadebb95b6fd5&quot;
-SRC_URI[sha256sum] = &quot;076a7f2f7c251635cf6116ac8e45eefac77758ee5a77ab7bd2f63999e957613b&quot;
+SRC_URI[sha256sum] = &quot;c2b67881392a9e85aa108e75f62cdbe372d5a3f17ea5f8d3436dcf4662052f14&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------2730FEFC0246B456F5786B9E--
