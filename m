Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.65])
 by mx.groups.io with SMTP id smtpd.web10.280.1610649875931370141
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mHawmHhP;
 spf=pass (domain: windriver.com, ip: 40.107.243.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJiTZyfqEwn7aCPMs4YTbb6wtk7F2aoiApANN/BPfIN+srNc3E0Nqyl3FKZPADBTkrOjmr/C+kFcSAtjzK6DCVZmL49F8EspoqXwjPDVieCJkjA7F+ulkWr1RgDcc6sO3HmWsrpVww3V5AdxDS6Jdg2Q1j+uJFXvNNbwXDmxHVs0Xowejs7ozAeyNWZYsRuh770GjI3eQ9TXkWcGgsU4jF/NmehMMGDCqOIvykH2ZOPjtKJ2N5L/NMCxU8wF+a8NyIpvynz0bUxsTPnCZejZPQTS0pRZmx4iwidLYrUCNWFIiH18eeLUtp8jzPtdUiUOGKkvyRb6aVZ3WmQhlnnmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qU+CHLlFNVMYO59r9Lgi/cgwl3+epA3x6mXmmwOXCnw=;
 b=XWKXWz4XKfNnumLzhwMFTHyf4u1uzPF4UznHBR7XVksx+cawPNttw3/xcmgEvS+GbpvDOS3IOJ3SnxUOaYVdzfoB1dc6EGO0+pzrhuUHt6pUqu6mhH4YzC6+Y0qesMfurR+ARlTkKv4O6hXXkdrd5FcmzT/sjyGODiRs5Kkb7CkDO4X1L82NKemxlPiTpDo9Tg9QwAGq4KDvH8e4+RR8DaKllSOU1fXuDg6XktGUqtp678fc2uAMQFauw1ONdWWAOR5oaObahoTjuJtMNGyDBi34ZjbNlHfA8mfUwh5ROD+1yaPbfEU/qSAY1ZcSVDhzRc2bxIzHo6P7ZMThYAhrNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qU+CHLlFNVMYO59r9Lgi/cgwl3+epA3x6mXmmwOXCnw=;
 b=mHawmHhPN3RjlRsUGBSe13Gl4RgDdQfErQcEFg+q4+fOEtgu78Q/OTSJNCQnOt1DbThaaqYC/HObC4/LmudgrjYX3F2/b1H71tluoPEvt47VtSG7Zk0QNl9597KaU4i2XpS/Aw0UamcMkvQe9gHsNJCygxQif2YpYPUu7G6QRHo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:44:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:44:35 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-ecdsa: Upgrade 0.16.0 -> 0.16.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
 <20210113142626.27599-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e6cc34ab-65fa-ffac-4d5d-4ab86ac37df8@windriver.com>
Date: Thu, 14 Jan 2021 13:44:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210113142626.27599-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0122.namprd13.prod.outlook.com (2603:10b6:208:2bb::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.5 via Frontend Transport; Thu, 14 Jan 2021 18:44:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48744c32-b02a-4bfc-2571-08d8b8bc7050
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4800FF8A439AEE91A8E027229FA80@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tCEYFL5Xf+mfUh6tcs6y5R4/WHtPgERIUfkFTbA6Qk8HC6FX8Q2VOmgbnxid8X17djfh0THzMvnUxhAAmaW0LOKv3pjdOiKp9+vfJUrgLuLTFJ5xEq7UkQwV9waIHU++OCgFoOlsE5RrarX/7hNgZIOJ+HVSGBLaNkNl7e3jxHLyBjGWfPLRl6RSzZwehc9Pz0tVxtqOinNxh8OEJBRk7h441wJ9xvVTYangkGk2DqUJpLdVHcJNgK6n/zedlUI0RqZR2wOOeGJEdiIHkSlTJKiGfM4+u/zGnopExt5XlZsLSzfblQDs4wpQZhQvluM5Au5qk043uimQLI5ungprChyd2fGafZeIdVcNII9milx9Y15d/DNj/ZRRUe7c8mw+4fToSKHeXjLpSA3QH5alU8w1nPTYNLtrYdW573e8TVb+CCx8TC//ZrE+sEhc894/HSA5gzV6WfG/Cnna46npAn04F5/lwfefyWotD1wf5YGeqB9CwhztlM4uh4NdW4zJtMbHs8AIru8iNzciPz1DBMKjxcB1f/CdsyeI8NmrQYXxrj92s73U8F5eETSYVFB8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(86362001)(478600001)(83380400001)(66946007)(2906002)(31696002)(31686004)(166002)(16576012)(316002)(966005)(8936002)(5660300002)(186003)(16526019)(53546011)(6486002)(52116002)(8676002)(66476007)(36756003)(33964004)(26005)(2616005)(956004)(44832011)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dC9LOWFvRHUyeVFWeWJqNlJESXhzL3FTcHlwcjdHU3NrY1pZZDFYb1psRW5V?=
 =?utf-8?B?Umc4citkWUxxT3JQMTJ2N09tRmxkN3JGenhWb2JWMURwY2swMXJtTU9JWHRW?=
 =?utf-8?B?WE0ydnRmcVRFa0tCRDhvWVRTbU54SHdFMndQKzh6clozVHB1cklOT1ZTZFZC?=
 =?utf-8?B?SXV6QVlvZGJJcWFwb2Y4WHIvMHY3SWxQQnVYTFNRRlhINW8vVVZJeDVBSVhr?=
 =?utf-8?B?dmZYbi9tMU1KTGsvV0x2R0ZCK1JhSWlydVlpZXdzVXFWZ1FQZCtWVFVsWlcr?=
 =?utf-8?B?Mm9rd3N0NDB1d3lRYzM3SDRBSU5qT2RjRlhPaHNDa0lVb3Jnek15Q3N2TmR5?=
 =?utf-8?B?WC9rNWtiTGxwODllTllvQldRL2RUY2RNNWZFZ3pncGp1NXE5WjZXN3J4eHE1?=
 =?utf-8?B?VEtXbEVFR2t6M1F1S0FqcmRBUXU4RnNhRUtxVElFbGt1MWc4dW54eGRlUExN?=
 =?utf-8?B?UmRQVlUzNmNyYi8zL2R5SXpXblUzeXZGQmEvdkFGSWVBS1E4bHRkZTJ4N1VF?=
 =?utf-8?B?L2xZODl3OFdZb21scUVhOHZ0ZGFYZVhjdmpDdTdHUEFjbmpVdXVGYjM2Qkcz?=
 =?utf-8?B?RGh1WWt2R3FTdkYyYUxCNDNUZ1J5YXZRcXppTVUwMG82a0RZQ1VUV3V2Smow?=
 =?utf-8?B?Ym1KSU1qNmF3SktHVE9hdHR6MFNxTW9yNTRFbTVnQXdEQUVZN3ZnZHZqNTNk?=
 =?utf-8?B?bnNFS0tIaEt2eXpXQWtJUmRMQU1EZEVtdUdjOFMzODlHL1pkd3RvbkxBeU9P?=
 =?utf-8?B?UG9MWnNDRlZ1RzkrZ05qdENrV0hZQU9xbmR5WHNvKzF0VVZaTVhUYm05aFIv?=
 =?utf-8?B?Y2U1eVphbzExNi9ublEwTUVpeXNWVkNHVzBWZFl2OGZZbVMxMDEvNVJheG8z?=
 =?utf-8?B?OSs3akJrMGlWVm92Q2M2VlVHWmJnbW9UVDBHdlJxQVZ5eXg2UFlHQWVuM0l6?=
 =?utf-8?B?T2YwS0tVVDJETzJWRXk4enJ5T0FqRnBJVkF6dFNRRW1wTVBQWkJsNnJaMFFW?=
 =?utf-8?B?bG1IcVV3S2JndlR0SFM1ZU5xQXlveVpaU3Qwbk9RcTU5M0hMcGNCREJJYUhx?=
 =?utf-8?B?cTlVSDRxMkw4eDZhOXBzYXdyVWo2aGNVN0l1MUhhOVM5RkNRdDRBQWZzY1BT?=
 =?utf-8?B?cU1JS05Xd2FqeWNLK01qMWIwNDYzRkcyS3ZraGIxSjd0RFZPNE1ucUtJNjl4?=
 =?utf-8?B?eU1wL1RqcjhVYnJHUlFnMlN3dUZoSmtSejRDbGV1RHdTWEE3bjM5RG1sVmto?=
 =?utf-8?B?Q0JhT2ZnR3pvR3lHRmh4a25NbmJ0by9wNmdSNnQ5aU4zck9vdGsvS3E0K09R?=
 =?utf-8?Q?Zi2akS9xJicKbvIBq089Vw26+SEnbB957S?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:44:34.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 48744c32-b02a-4bfc-2571-08d8b8bc7050
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLk/ylVCbphWJt4jcE9WR0LhdyogfJZIreTz81M2OtSi0GUF6m/hwDMFENYrgl5vuJlb8d440C5Q0weziUJO5954PxTaupGrrSEHKsIhaUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
Content-Type: multipart/alternative;
 boundary="------------413107282C3920E5518E702B"
Content-Language: en-US

--------------413107282C3920E5518E702B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-13 9:26 a.m., Leon Anavi wrote:
> - VerifyingKey.precompute() supports lazy argument to delay
>    precomputation to the first time the key is used to verify
>    a signature.
> - Documentation for the VerifyingKey.precompute() method.
> - Make created signatures correct when the hash used is bigger
>    than the curve order bit size and the curve order is not a
>    multiple of 8 (this affects only users of custom curves or
>    hashes with output larger than 512 bits when used with NIST
>    P-521 curve).
> - Speed up library load time by calculating the generator point
>    multiplication tables the first time the points are used, not
>    when they are initialised.
> - Include Python 3.9 in CI testing.
> - Test coverage for the VerifyingKey.precompute() method.
> - Small speed-ups for the test suite.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-ecdsa_0.16.0.bb => python3-ecdsa_0.16.1.bb}       | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ecdsa_0.16.0.bb => python3-ecdsa_0.16.1.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
> rename to meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb
> index 36bb246fd..819d41e86 100644
> --- a/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
>   DEPENDS += "python3-pip python3-pbr"
>   
>   PYPI_PACKAGE = "ecdsa"
> -SRC_URI[md5sum] = "d593df1ab57da611dca76f7328c47b21"
> -SRC_URI[sha256sum] = "494c6a853e9ed2e9be33d160b41d47afc50a6629b993d2b9c5ad7bb226add892"
> +SRC_URI[sha256sum] = "cfc046a2ddd425adbd1a78b3c46f0d1325c657811c0f45ecc3a0a6236c1e50ff"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------413107282C3920E5518E702B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-13 9:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210113142626.27599-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- VerifyingKey.precompute() supports lazy argument to delay
  precomputation to the first time the key is used to verify
  a signature.
- Documentation for the VerifyingKey.precompute() method.
- Make created signatures correct when the hash used is bigger
  than the curve order bit size and the curve order is not a
  multiple of 8 (this affects only users of custom curves or
  hashes with output larger than 512 bits when used with NIST
  P-521 curve).
- Speed up library load time by calculating the generator point
  multiplication tables the first time the points are used, not
  when they are initialised.
- Include Python 3.9 in CI testing.
- Test coverage for the VerifyingKey.precompute() method.
- Small speed-ups for the test suite.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210113142626.27599-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-ecdsa_0.16.0.bb =&gt; python3-ecdsa_0.16.1.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.16.0.bb =&gt; python3-ecdsa_0.16.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb
index 36bb246fd..819d41e86 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d">&quot;file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d&quot;</a>
 DEPENDS += &quot;python3-pip python3-pbr&quot;
 
 PYPI_PACKAGE = &quot;ecdsa&quot;
-SRC_URI[md5sum] = &quot;d593df1ab57da611dca76f7328c47b21&quot;
-SRC_URI[sha256sum] = &quot;494c6a853e9ed2e9be33d160b41d47afc50a6629b993d2b9c5ad7bb226add892&quot;
+SRC_URI[sha256sum] = &quot;cfc046a2ddd425adbd1a78b3c46f0d1325c657811c0f45ecc3a0a6236c1e50ff&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------413107282C3920E5518E702B--
