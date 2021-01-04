Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.51])
 by mx.groups.io with SMTP id smtpd.web08.15089.1609774355059394633
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eh//JrxK;
 spf=pass (domain: windriver.com, ip: 40.107.94.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4mAqtyg6gSVlI2MVPQtwCcXT2cCFVn8XZdSWojr3GjisPgbMBIwcsse9bfToFLIZId+4O/M711lYwVra3xwn7isyiH8WhY53NvVkU29JRDwlFRUKvGnOFWgIO/HYyi1P7YS7InbX9xwU81qi6PsvUNgA4XGQ872M623l0RwHMbd8zP2BbgWOHwKuTOqo3sqaqbpMAU6PnttKEfkbZnOcmz1yiQp80922Oc6WwBYsul7A8OUq/xcxvbapLqFf8EEZduwzhtWeyiG/4wTOFV9ITMTEHlHsaoBcKxE8QBiDMSRRYKjvnoZXOOW2o34qYwv+2KoB+5TcuOgKgDd5Kc2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xazXt+BH9SJ/jqfWS/1X+PmosOfNgmQf2cw3Dd0813s=;
 b=UQreXFEPt1PsD+V1p8p3oV1QyrzVGDudMt3s951YDpCSAjse8ucJbxTE9+hr/pIDuL4zTu1RFub3OPTF/bgep9+LfvjZaZiVgkftKLA3PcsfRNsKpE4V/HTlslI3vvdJ46aSe+eGk9+5V9PbmIU3kFZtu3WREcf+PbDBO23txb8X6UHTPZasgKM74Ci8Xt57VFDDFWeS7GoGLTaHGiuQtPOXimCUyBJ1O+cl8/1Ds582Tv1EueHfVM8PBYW3t4CR+1SDw4BsKTTWIdJupnwuTOWve7tBYwqYgOF6mdsYY6VurQArachItZMyDhH12bLylOiH020MydalTkw97R9S4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xazXt+BH9SJ/jqfWS/1X+PmosOfNgmQf2cw3Dd0813s=;
 b=eh//JrxKMRZMkJadFjNfspmg/Gw/okMCqaoPdv7mN2FOeieUFh+vxaOW0nykoNdXDngY/OqCo63FsbvPawZFojsCUY2+yUTiLF6qxluwit72z8X/91fRfg2pESxFI2KIlEgkKpj8etW27DVWpay1S0XrV7oDMEKfC7MmYjEEZoc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 15:32:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 15:32:34 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-cachetools: upgrade 4.1.1 -> 4.2.0
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1608613371-67021-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ec41d980-e8b9-a47d-c902-2cc39ebad58f@windriver.com>
Date: Mon, 4 Jan 2021 10:32:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1608613371-67021-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0422.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0422.namprd13.prod.outlook.com (2603:10b6:208:2c3::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend Transport; Mon, 4 Jan 2021 15:32:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abbac4e9-afd0-4363-ab60-08d8b0c5f521
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5053759906FDADD5F1296AF59FD20@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bV37A8uzZHWFjjEZZmfFfavp7HFSXYlGRAXzx6JF12b/Ll14VhJXQkU8BS17whuRtlngiH6ionAi9IDm7dwapqAtJien5eYVr4TIDbeP/2+2rnEEyrLMNZm8HIziobr978IbgDYInrKgtG9sQi8ptKUkQkbz5gCWdNWvBslxBvkrrn6V5k9KstTsMRUwREOLyGgwkqKImiXzre18VC54Hf1EMsoV2odomJfULZaClW81/k8TFpKN15tQCpNYIAEctgmbH/TfJWvzos/SWStNBLzwngMbClWngrqV94U/zDjYtmrKnxAu0S4LadijCFpx9R+i1iETg2ZQhisAVwYq/2T9sEpWNsSOfZOg/UTxUhiEtjG9wLCbG5bLOU0/WUa7mY9PaPuljMGkSsG8AiV+ofOS7Pv2kMnMoyZGGj89+q9/3X+7eDELCQMSnkeGDcwDzZLODvxa+xb6E6nUSi063tvMH+sfYFm3NZjA2fkevKuF8dQGaPcZj52W9B0FoXAcCVylAuAvbP2X64SboR8ydCjgkzdPAFplmEYdNBqlCy4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(66556008)(52116002)(2616005)(478600001)(53546011)(166002)(66946007)(36756003)(966005)(66476007)(26005)(31696002)(6486002)(4001150100001)(16526019)(2906002)(956004)(186003)(5660300002)(86362001)(8676002)(33964004)(83380400001)(44832011)(16576012)(8936002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dm5qRVVTWFdrbDJkekdOYUIzdXVaYWppYU5nNk9KRithVDNZMGRTN2Y4TmJT?=
 =?utf-8?B?ZnU1Snp0azFrVUJmODdUcE9YWGNOSm1lKzl2NVVuZ0xzamFzeW5ZOFJmaDBS?=
 =?utf-8?B?akZOeVUzdGR6L1Y0K1JrYlFVVVhLSUc5RitQSjVJeUZ3ZDVWN2FCOW1sWVJ4?=
 =?utf-8?B?VXhLMWxWTjdZV1VCSEtZNyt0ZjFDVU9SMGE4S2x5akNSTS9SL25xc3R1WEgx?=
 =?utf-8?B?R3NDZEQ3U1BEN3FMc0l1VmNLTGRPR1hWRW8vcW1PQ3FCY1lVVzYrTEZyM0ZI?=
 =?utf-8?B?ekRyYWJaV1IyL3Ywc0UvNFZRMjBzbWhpaU1Bb3A3eFpNNXJaWlFldGdOay9v?=
 =?utf-8?B?dlNjdU5GRXhBWmIrQVBLMi9Wa3JTenNPcmpSRTJLZUtqUDlwVjZYUkgzeENp?=
 =?utf-8?B?ZUUxRXFDTi9YcW1tYzJ6ZmZqa2RVT21LL3RCMzJiVE8rcDYwRWhWQllPaXBG?=
 =?utf-8?B?VXlySkI4UVNSOWhhNkE5VDZqMk1hbVIzNHFjeFZGYUpDalB5TGVHRUtTYnhI?=
 =?utf-8?B?T3YvUFFhbzBQcnlKdmhtaUozbE5PZFphQ2V5TGc3MTkwV2dkbXROWDkzTVFY?=
 =?utf-8?B?V01Db3Fhamt0VU14WnowREdocnZ2b1RDanN1VUhIdm9ZYzR5dEkzSU9pOURG?=
 =?utf-8?B?MTgrZmJic0ZpamtWdFRVZVdMc0pOMGV2a1VtYmZza2lUUTNUbTA3NWVUTmJ5?=
 =?utf-8?B?YVB1elpFdC9CMnhXVDQxZzRRRzlDWDBRaVVOeWxTT2FRK2srNnUydEJITktz?=
 =?utf-8?B?S056eHBISWVXandVYmJHdTkzYXNVUHkydGJmSnoxR1ZnSEFoak9TQkpXSVdN?=
 =?utf-8?B?UGdxc0hzbnNJNklqOEpPMXpncFU1QjhNQVBxYmFIUnZjSXpKQVN0Qjl0bWtL?=
 =?utf-8?B?MlN4dW95MTVHclNHWDJWMy9TMHRlSVMwWUxGdTNiZzBUN212cVpwRUluekNT?=
 =?utf-8?B?U2tVRGtyajVmcGxLam1RRTBmOW9yeEY5TDN4K3JybUNjZkpNYnVvdHcvTTkr?=
 =?utf-8?B?bDBjOC94VXRrYUdpT0Q0UHhhSUF6ekNlNDZ0cDdyVWc4VDlBQkdGRWVVNGxP?=
 =?utf-8?B?cEJyMzB6c1N6Y2NuWm9ubWp1YVUzMC9ZUHhtWlBVekJlZUhYN1VRSFBWWUJF?=
 =?utf-8?B?VXhPTzRiSmJQV0JadlhsR0VOMGllMzFHcCtFUlZrSVpWdFEveUhZdDhUL0k1?=
 =?utf-8?B?K2ZlTTVPbEQ0SWF5QW5RYnZjZ1JOZnMrSkVuLy9oQUpTbldrdExZckI0dmNn?=
 =?utf-8?B?YlJWNEZsSmZLREVhR2VRbjM3YjhaVXNHZEVxK0dYR2tISTdOalVxWWhObmxR?=
 =?utf-8?Q?OK6LMBfbw+qOqYpxZN8WxOueuNKe3JCgpf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:32:33.9636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: abbac4e9-afd0-4363-ab60-08d8b0c5f521
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKaSErVWHicyRfdPXJ8J3gJoGs7kbpevsL+4wuhuIIzUzpu1p6WxU8pzcDa7G4ogXN0x+sBuF7853f+uwAi9hACp4Rj0Lv2xrlqmirPpcG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: multipart/alternative;
 boundary="------------F4155B16220A79B6F1EBA35B"
Content-Language: en-US

--------------F4155B16220A79B6F1EBA35B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-22 12:02 a.m., zangrc wrote:
> v4.2.0 (2020-12-10)
> ===================
>
> - Add FIFO cache implementation.
>
> - Add MRU cache implementation.
>
> - Improve behavior of decorators in case of race conditions.
>
> - Improve documentation regarding mutability of caches values and use
>    of key functions with decorators.
>
> - Officially support Python 3.9.
>
> The ptest log is as follows:
> START: ptest-runner
> 2020-12-22T02:58
> BEGIN: /usr/lib/python3-cachetools/ptest
> ============================= test session starts ==============================
> platform linux -- Python 3.9.0, pytest-6.1.2, py-1.9.0, pluggy-0.13.1
> rootdir: /usr/lib/python3-cachetools/ptest
> collected 164 items
> ...
> ============================= 164 passed in 12.95s =============================
> DURATION: 21
> END: /usr/lib/python3-cachetools/ptest
> 2020-12-22T02:58
> STOP: ptest-runner
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-cachetools_4.1.1.bb => python3-cachetools_4.2.0.bb} | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cachetools_4.1.1.bb => python3-cachetools_4.2.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
> index d334070cd..cc697d5a9 100644
> --- a/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
> @@ -14,6 +14,10 @@ SRC_URI += " \
>   	file://run-ptest \
>   "
>   
> +RDEPENDS_${PN} += " \
> +	${PYTHON_PN}-math \
> +"
> +
>   RDEPENDS_${PN}-ptest += " \
>   	${PYTHON_PN}-pytest \
>   "
> @@ -23,7 +27,7 @@ do_install_ptest() {
>   	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>   }
>   
> -SRC_URI[md5sum] = "ae41b69896f49727e1621d279cb72522"
> -SRC_URI[sha256sum] = "bbaa39c3dede00175df2dc2b03d0cf18dd2d32a7de7beb68072d13043c9edb20"
> +SRC_URI[md5sum] = "9d54dacd774e2af7e9a50741386f5455"
> +SRC_URI[sha256sum] = "3796e1de094f0eaca982441c92ce96c68c89cced4cd97721ab297ea4b16db90e"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------F4155B16220A79B6F1EBA35B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-22 12:02 a.m., zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1608613371-67021-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">v4.2.0 (2020-12-10)
===================

- Add FIFO cache implementation.

- Add MRU cache implementation.

- Improve behavior of decorators in case of race conditions.

- Improve documentation regarding mutability of caches values and use
  of key functions with decorators.

- Officially support Python 3.9.

The ptest log is as follows:
START: ptest-runner
2020-12-22T02:58
BEGIN: /usr/lib/python3-cachetools/ptest
============================= test session starts ==============================
platform linux -- Python 3.9.0, pytest-6.1.2, py-1.9.0, pluggy-0.13.1
rootdir: /usr/lib/python3-cachetools/ptest
collected 164 items
...
============================= 164 passed in 12.95s =============================
DURATION: 21
END: /usr/lib/python3-cachetools/ptest
2020-12-22T02:58
STOP: ptest-runner

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1608613371-67021-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-cachetools_4.1.1.bb =&gt; python3-cachetools_4.2.0.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_4.1.1.bb =&gt; python3-cachetools_4.2.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
index d334070cd..cc697d5a9 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
@@ -14,6 +14,10 @@ SRC_URI += &quot; \
 	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
 &quot;
 
+RDEPENDS_${PN} += &quot; \
+	${PYTHON_PN}-math \
+&quot;
+
 RDEPENDS_${PN}-ptest += &quot; \
 	${PYTHON_PN}-pytest \
 &quot;
@@ -23,7 +27,7 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[md5sum] = &quot;ae41b69896f49727e1621d279cb72522&quot;
-SRC_URI[sha256sum] = &quot;bbaa39c3dede00175df2dc2b03d0cf18dd2d32a7de7beb68072d13043c9edb20&quot;
+SRC_URI[md5sum] = &quot;9d54dacd774e2af7e9a50741386f5455&quot;
+SRC_URI[sha256sum] = &quot;3796e1de094f0eaca982441c92ce96c68c89cced4cd97721ab297ea4b16db90e&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F4155B16220A79B6F1EBA35B--
