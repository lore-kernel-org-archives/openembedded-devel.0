Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.81])
 by mx.groups.io with SMTP id smtpd.web11.8393.1612533666051082368
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Gg62eHeB;
 spf=pass (domain: windriver.com, ip: 40.107.93.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI59LhZ2pj9nDeOXUA+bnXvEFvlqPwPlipg5+v80uwJ+1oCcbVA9ZIg1cNwDsVyb8yLXBDrgAxqYlfP3sRyI23GXTEUEVVvhoRpTOIFRd3s60PHwjp0NlaRljR8wD8l3H7MWfk2fiOvjPU1l2a6Txw7a+nyAcEE4lsKA0YnC8UR1JXeXt2Gz2r/eM63J2h46ewWrCzanD89/Y6/84LK9tIxzIl/xi74Em9Fp1tSxIJMjOXg09la/NXrfD+QVOMR5crxD9N1IUvw2MK7Qn1I7iPwuPtyVXiUCtZ2hj5ObfyLtjO2ixUtbKUPVj2dL762Pfr6r2hIxF7IJt+lZNnFYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJR40DpVBt37P9HBPq93uckJh0DxodMbDmm6+3vfQP8=;
 b=Vri1d/Sz1SPskJcy5XoYVeqO1BTrUeNC2pGD6BM/17B9goo5+EPnhABzQL0/t8z0GA14UrYDxhLR8IqIySnaqcHMBzKQCjGe3EtPCY7J/u4LPwgWdvpeuLaebJ/gAw7jhM7hxfACtk874w2v7qu4Ip8ypdRcMTYPHr/ES0wO9a0e+mVPpiEOGm8dqDgO9ql454HKJNAZ434vCXI8x+mDvs5gLicoQsGm/MAYyG+cVfyhBqxfrIEShauuotCyrNlGY9KH9bGjC03UkuHc+W0kWoP5Sfw6m7jiWFiRya1NTJ0Z6J4xWNjOg/wq90cP7tyXh1sdr/mB0wx4ERTH865yow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJR40DpVBt37P9HBPq93uckJh0DxodMbDmm6+3vfQP8=;
 b=Gg62eHeBtNmjPh3+ODsw/xktRgkEHEZk1fbY89BL97aAE8jyZbmJuOnBAbw4R5vZQkcUUXhC4h4zv9oLjtFrStfKGARF7fRUZAUyKDdIxyne4EwTAjujBfkb93ZCY8NJz4KlKyvqlLJPRI7AP6SSpW5G9LApAZez9SyXrDhKh5w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 14:01:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:01:04 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-ipython: Upgrade 7.19.0 -> 7.20.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210202112636.30651-1-leon.anavi@konsulko.com>
 <20210202112636.30651-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <349671e0-7cb0-6e36-fa0a-d32136ceb5b1@windriver.com>
Date: Fri, 5 Feb 2021 09:01:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202112636.30651-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:404:4b::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR11CA0047.namprd11.prod.outlook.com (2603:10b6:404:4b::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 14:01:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d97a076-0933-478e-6837-08d8c9de7a58
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3894540C8622203B8DF671039FB29@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dgIAg13Dqcd05J65OwmPrPeXY+g20vl2OT63dnyEnyTAmon8j47NL/24hKG8LzKNqLGGOSqcr+7jTO/t4H40+o2J0N/T591I3Gpoklibul74FX96mJPG56bD8zUQZIOd2Y4NLPVdA6QhYGZlOmDMkeGXLxh5w8QzyGryO22nGG8ydfHYkr0pL959UI8sTlJnEd+1p1TDkZSTwDq5olh8QRPtTfiW5CRG6YVBjKUDgTgr/yOhraAzsiQlmubhpTm+sJKkJdkVac+SrHJjPFo0BN9jp4i4kf5dAs0eJjW9yXIGycdj0TMk+3xPJyP4BK0nMMbvZMinMz0+AOL4uPbbe+OFbYZqxqEm0I3z4PRZbDcTTzgt0mVJ1xwVBIjytrsqg7e4KGFNtPpaspbhlAn4obfJSOr/Y953qJXdxffVlOmyz2oJRykZOAHWhYEZHqKKzj3p5xlSMAuUa9Dsqj0yR8cZwo7nVYlDAcSAewP9DMPeKoVa35yHnXf4ntLEZe2RJk99mCobHke1Vhcv1qJaXCTZwiasz7UzKDJxRd4R5k73XOvj6YJZR7g24PrAOZuyq1YkvqQ1J41vMZUvQpVQWThIIxSbm/tQdjn28BXwrUolfuqdY6qeZneK0soVWUCLqZOlesgcK+wEEPHcV5VuGZvNYdDbqRD+Tnh0AU3ZH1C/OkWrJnM3fB4s3PAUbdXV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(166002)(31686004)(8936002)(66556008)(478600001)(66476007)(5660300002)(83380400001)(966005)(66946007)(6486002)(31696002)(26005)(186003)(316002)(16526019)(33964004)(16576012)(8676002)(44832011)(2616005)(956004)(52116002)(86362001)(36756003)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Sis4TUJNU1ZVWnE5OXd3OXRyRkNYYmEvZnVYYzgzM3gwNmgxU0dveTNMWExt?=
 =?utf-8?B?aXJreitCUWF2Vnh1WUNuV3MzMHEyYWhJVWtxb3dHN3ErMGY2VU1uSU9XWVlk?=
 =?utf-8?B?elhhejNPNW9PTXdnUGtQYnd4VkE1YjlVb3YyaVJlMGdWVkNqa0M1UEVHZDJO?=
 =?utf-8?B?K0xvd3ZjUGhBT3c2bnlUdkh1Q2U1cENldC9yZ0pOc2FWOXF6Q3JjS3FMbnd1?=
 =?utf-8?B?dGlMZlVaWWZiSE9CL0lUclBuZnhtQzhWYUpORFUyT042ZlBFZU1pVUpZamNT?=
 =?utf-8?B?ZVpIdFNSMW84RUxHaUl0UEt4djZMYjVuNW5TL2RzTGZ0L0wzUm1MbDlZVWlv?=
 =?utf-8?B?MitkSGZZa3JTTFRjeDZEeEdQcTJ0NGVTRy9ZdEFSTzkxdERNK1A0d2xGd2VB?=
 =?utf-8?B?dSs3b25kcFhEeDRPalNFTVNta0JyenJoYjhqQ3FuMVRjK2Z0cGc5OGV4eDNS?=
 =?utf-8?B?bElaeUFjOFgwckVzSmlVNXF5OGRMRkNjSkRmM0VQa0Qvekt6dXB5OWFXQzl2?=
 =?utf-8?B?VFRzc0s1a1U5Qjd4bTl2QVc5OVJvK1ZML1hyY2YwakJaQTZkazFOa0N3RDNm?=
 =?utf-8?B?dDlNZHRHVE5RdFBkdDIzdUw3SlRGOEpyV0xwRmlDRGlHaWtiWUtiWUEzb2hV?=
 =?utf-8?B?bmhrNFZ5ZGVNWUlqUXlHSUNHZXA4cUtSRjFvSTFLZ2dDU2F5ajg4MS9PR20z?=
 =?utf-8?B?QkNsUTdqazA5aGw4UWk4SVRXb1AwMDRMOVVxN09LVmdJblN5UTV6S1E3TlpZ?=
 =?utf-8?B?NTd6S2hiSk9HcnRWa3g1ZlBUdW84NVlYMFpRcWU4YWVtemtqb0M5OFpkOXFB?=
 =?utf-8?B?Y2ptdTVWQzNxZFFCa2RkMk1ISE9ZbHZPYTZvdzQrdWpiWDgrNXQzTElMaEJo?=
 =?utf-8?B?T25EVXRnZUlVc1dnSHhiLzBOU0pxSUFRcFUvSS9TQU55SUJ3T3B4aEZxVzhI?=
 =?utf-8?B?NFM1NW9QOEl2S3ZJTjB2NzlRTENsZ0hZeE1JMzAycEtINTZXdU9jUWRWd0Yz?=
 =?utf-8?B?Q1V3ZXYrTlJad0ZIQ2VGVmp2L1FmT2Jrb3BYeXZ4MHFabDFxbzdpbnhnUEw1?=
 =?utf-8?B?RzJ6YzdtZnBmQlFsWFhSR0RaU3V4cGxzTGh6YVBuM1VXSVNoVzJHMXMwZEFJ?=
 =?utf-8?B?bUJpc05DTkg4eXBjMnZJc2FXMzE1UEgyYWNSSXhNOTNDb2cwbjhndFdzVmkw?=
 =?utf-8?B?SlRXMXFOOXNtK2dsSUtuZXJaalJnZS8renczK3Z6ZEtSdWJLUVc5ZS9QWkdX?=
 =?utf-8?B?TnVrUUVRNmR5cnNObWpMZ2gzWHptMWJ0ZnNpdzJwRStlTlJjb3pOdDZMWjZw?=
 =?utf-8?B?OEpueTFoMS9wL21qUUVRZVJ2LzZ6cUtuYWtROHlaNE5wZDNXT3NmeGMrME1m?=
 =?utf-8?B?ZDFaTENIaXNSS0dhSkdDTnh6VllnalhoQnRCRDQrODBNQTJMWG1JcVBhV3Zp?=
 =?utf-8?B?bHpzTzJ3TStCV29aKzF4K2dzL1N3VjFBcU9nalJUWXhMb2wranN6anMyWlhm?=
 =?utf-8?B?OFNVWUJ6OVJSVzltYTI1Z29qTi9NdXRpQlRSdVV1enJ2RjdJckZ4ZTdmdmNq?=
 =?utf-8?B?dEV4Y3Z1ckl0Z21kbGF3dUgwSDRyQXViTzY4SVZVWnAvVzRKSWtuN2k4VURr?=
 =?utf-8?B?WGpxdWM3aUJLYVdBQ2pibUpqalNIWEpSUGI3Qmtxb1hzL1lENlZqMHRMcFIr?=
 =?utf-8?B?ZXBPNFgwK1pjVVMvUU9HWjJNd1BZdlJPbTlOaSsyZldqY3AvN0g3WWZIUW43?=
 =?utf-8?Q?D7pa47tI24QRwr9qcbeiGNpSwu6hU76HqQbw+BY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d97a076-0933-478e-6837-08d8c9de7a58
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:01:04.6741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YChJ6aGShAr/3dNfwoefUTUC4SlFN+mwVtsT6OUNIu08PpdIj2GvCh20GBiFN0Sutp+gJxTe4nSA22BGOjl92ANRhqVzHV4UhUYtAbQXruE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Type: multipart/alternative;
 boundary="------------74274DA213AC83FE612B3F0C"
Content-Language: en-US

--------------74274DA213AC83FE612B3F0C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-02 6:26 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 7.20.0:
>
> - Support for PyQt5 >= 5.11
> - %reset remove imports more agressively
> - fix the %conda magic
> - compatibility with Jedi 0.18, and bump minimum Jedi version
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-ipython_7.19.0.bb => python3-ipython_7.20.0.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ipython_7.19.0.bb => python3-ipython_7.20.0.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
> rename to meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
> index d3ce9f5ff..42795b9bf 100644
> --- a/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
>
>   PYPI_PACKAGE = "ipython"
>
> -SRC_URI[md5sum] = "33bdc8287c827aae23699751b0ed3f7a"
> -SRC_URI[sha256sum] = "cbb2ef3d5961d44e6a963b9817d4ea4e1fa2eb589c371a470fed14d8d40cbd6a"
> +SRC_URI[sha256sum] = "1923af00820a8cf58e91d56b89efc59780a6e81363b94464a0f17c039dffff9e"
>
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-setuptools \
> --
> 2.17.1
>
>
> 
>

--------------74274DA213AC83FE612B3F0C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-02 6:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210202112636.30651-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 7.20.0:

- Support for PyQt5 &gt;= 5.11
- %reset remove imports more agressively
- fix the %conda magic
- compatibility with Jedi 0.18, and bump minimum Jedi version

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210202112636.30651-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-ipython_7.19.0.bb =&gt; python3-ipython_7.20.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.19.0.bb =&gt; python3-ipython_7.20.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
index d3ce9f5ff..42795b9bf 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f">&quot;file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f&quot;</a>

 PYPI_PACKAGE = &quot;ipython&quot;

-SRC_URI[md5sum] = &quot;33bdc8287c827aae23699751b0ed3f7a&quot;
-SRC_URI[sha256sum] = &quot;cbb2ef3d5961d44e6a963b9817d4ea4e1fa2eb589c371a470fed14d8d40cbd6a&quot;
+SRC_URI[sha256sum] = &quot;1923af00820a8cf58e91d56b89efc59780a6e81363b94464a0f17c039dffff9e&quot;

 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-setuptools \
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

--------------74274DA213AC83FE612B3F0C--
