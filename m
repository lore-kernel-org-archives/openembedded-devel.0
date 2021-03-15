Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.62])
 by mx.groups.io with SMTP id smtpd.web09.8308.1615813415179047210
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SyjsZtrK;
 spf=pass (domain: windriver.com, ip: 40.107.244.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Inw+rmqQgQC35t1txjAN5XkJh11n3k/MHN8Mub1Gc9afF5Wz2ZIB7CzR97USxB4OEPmYj79sMk7YN7CGnQoi1QHx98LMqEVEsrWhXD5mOAHgkjekqQ9q4g6IFsb3yiJNEUTcPWmtk2E9w1506eQoDf+zwdFjEaZbE60AymeEqvuUAr22x9mPKurllPX++Nyrd0E8ZrVRDhmIIm5Xq82dayOCSoghcefIo5q25fCEGH0f+XYfHf6kl1gNqzJ8Q+PGakiURRslaKgvVNcqM7yzrHpnwY113nwCKW2zFlVIEZjpSqEGohqYVGqoMJUK28JfsG/BXosIDQDVBDW//DFhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqyoneqWA6KUf1xk9vA/fuuhF6cSADyT4HYdRNe/Lmo=;
 b=ZPaZ3jbYczPzDBPYIAvvQhNVlTFL17wNFYnOS7q/1yVEsFNCsaVda+iDzK8tQ7Wdo/KS/NXztXCkyuEVcHpi7SHM/1Y322+TZcMS0v8DYIpgJ2wKK9OHKVIynH3qqMvnCLOSpfZiv3JDO97tuUhv00EykrPPMaiNnDJbvQchc+J0oQEQMf+lx9ABNSVsYdaXM2uizzF18+EQiSel1kIShUWf7mID0Jm2vGf593/oE7lY4DxO4BoSIOKgeTva3itQfGJPSlNtgpeVgFEqAm1hJZfXmA8fvtzuHgmVfrJ30dbm6XMpsU3B6wxPr3sicHyvLCqMC3s9lXHvKRIuNwyifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqyoneqWA6KUf1xk9vA/fuuhF6cSADyT4HYdRNe/Lmo=;
 b=SyjsZtrKzE5lSdl0dASTOiR1KIsKUX08A1N2A2d78vWRHT1wesgZ1O9mg26flzloHcy3COBzlj9vUUDgLtLWOwvS1GzoRACIVqVB8slCVA/HU30IkG72tvoa1Ws2hWbTxlDVCOntpIQjpwWL8beiSbTeenSl2QIeA7xrhZtAzQs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:03:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:03:29 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-robotframework: update to 4.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210312170952.567998-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6ed01523-b4ea-9ed8-2b07-244d4014c280@windriver.com>
Date: Mon, 15 Mar 2021 09:03:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210312170952.567998-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:408:e4::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:408:e4::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:03:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2e30db2-ee6b-43ed-1471-08d8e7b2ba35
X-MS-TrafficTypeDiagnostic: BYAPR11MB2901:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29011E4EE65D2D931E7420799F6C9@BYAPR11MB2901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jGwZI94dtefM3uPCkJpJr0dxkUA1pBQWPD48qMOhmFzHS43NYadTjZAW1QcOCr3UdcCeBqXUj2lQPGH75sK883Dy508Z/dMGfoGyS5P9MZIl55of3l3SHFYD+pNCfLkk1SiaabdNJ4veVt2RdlJ7BrlMdUH6dqbFv1EKNDt95HVY/YHPZIciaYltnpQFa448Y2LnKn+FOaByzqVfAoxCoAbjTI64ZQfyNghL+gJiIO98a+v9opKrYYB2G423tb9GYqsXpKlScNqjdtiXw5lqeFgu+giWJQDZIe11hs25anDTfYBj2Ak72o+TIhnYAbuHN0Ot/DhEwgbSMVyDels148q4yzqqllvRXmukPJ9iHM9n54D4E5MQ31Gyi+pAqzKBU3kc054oBiz57nz46TZezKStREBsS63a1ZJrvErO7YZA1N70DSLqTd5RPRd7vF8l5pJr9JgOP6xMM2hOfIB43SR3cb90TENmHPGOegdz/c3L5NoCEvG49XrNEMcJ65jeH34E+opoDBEvRRgxFnBpBpG7EKwmzGpPOTjS2QsiHKZXWrSucrrwwaQSMSflY3NFVemwE374qsR4W08IfsrOD+/ERU4ceOyouI36tuHnDdYsELFxMu+cXcT829AASPVgT9dKKlEBTdkLPYEP7YH3yQF1216C47gW4AeBbGQBlwarlBjGBM863wMXhD2CdUiP8PEVBOHP+oPSQYPAiUceDdYL38B9oiBllIqEVZZBjVk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(366004)(396003)(26005)(36756003)(2616005)(8676002)(166002)(956004)(16576012)(186003)(15650500001)(966005)(31686004)(16526019)(478600001)(86362001)(83380400001)(66476007)(8936002)(66556008)(53546011)(5660300002)(33964004)(6486002)(2906002)(31696002)(44832011)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bHZ6K1EzRzY2a0U4b2tLSWZNTVFPK245enlmQ2NKYURHK2FCaTF0UjVEY2xo?=
 =?utf-8?B?ZWxsVVAxbkJBZ1l2QlkwTHRFMVRFN25wSGxqelBEWFg1RnFxOHUwZUFFaWRV?=
 =?utf-8?B?Z2VJcWM1MkdoUTRzSW5GdFNrVDZualpVVFM5aVd4ZFZ2NHNGTEFwNXZ1ZWJi?=
 =?utf-8?B?NlhvRTRldzFKVW04cWxlVXYwMFJ2ajhCRW95UDlCdXVCMm1Fd3dydmlKOEx2?=
 =?utf-8?B?bGN4VXdsbU05Y040OU5zakRUTUcwbTlJRGdFS0NvblVtMUt3RGlvYyszTWJW?=
 =?utf-8?B?c1FyUnF2WEFwRTdMVzlRQ2ZMSDUxYkR4RUpMSkwwQVlQOHNtN2ZtemZVWHhp?=
 =?utf-8?B?TjM2QjJ6Z1Y2dWEzaEVLTGM4Nmd6SmFDVEVKQzVnYW9TeHlnNWs5YUszaE9x?=
 =?utf-8?B?K3NsZHhEaVlyWHJFRkx0d2o5VXNCM0ZWNU45ek1qSDJ5b3ZrOWNNeGtQZ2U0?=
 =?utf-8?B?VEkxbzJETHdEYUZvR0lGZTZCVWVyMllsWFNFOE9FUXZqZDBCREFHc2d6cDlr?=
 =?utf-8?B?QkZMWHRGdnlRQnlKZmxEbklZQW9IbEVrNFNEazFrSW5WUnFrankrZFR4eWNk?=
 =?utf-8?B?cUo0S3BtazkxeUg5T1Z2WWliYldrb1lrejdFWk9USVF4d2V0dDVlWm94OHQ5?=
 =?utf-8?B?M0NFVlFIRlFmczQ2Z0lGdnpJMzliU2lmbnJIck9TbktHZE5EWG1qYi9CU0l6?=
 =?utf-8?B?d2xENUU5YWE5WG1KK1dWeHdMTU1yZ05qd2E1b1pUaWo0MEk0R0lTTWZYSzhH?=
 =?utf-8?B?U0hLMkVQaHRIWWdQMnZEYlJ2QjQ3WVlHKzJzTHl3a1pLTWdERTUzMTV3MGVt?=
 =?utf-8?B?cHVwYUxQOWZSVE9nYVc0cTlqSnFaZ1RIK0tjZ25tNHZCalc4QWxJWDJXK2lM?=
 =?utf-8?B?TE1KQnVhMnBhTGk0V21SMitLZ0lOc3l5VFYxVjZZOWlpdDQ5aklETHRkaDhu?=
 =?utf-8?B?UTgva2lhc2VNSUtIWXVxVjRKTFdZNnZwNjRvSVNMTGkvdVRsdjNBbUhabWx3?=
 =?utf-8?B?UGxUaWExSUIycWpueDBtR2w2bllhcytibVh4REFBaU5QTXFUZlhVK0RUUCty?=
 =?utf-8?B?ZndOeGlsWVFwU3h4dzZJbkQ3ajR1ZC9scDhqTmZ1MzlKZGg2RmpydFNabW5s?=
 =?utf-8?B?VzI4V0FSQkdQNFJQUFJmNWRrWHRGN21UaGxlN3M2ODBnMUxRd0lJM3ErOTFL?=
 =?utf-8?B?eHNmZUx0Vzhqd1RlV1h4cGJGUExEeFd0UHFIcU4vQVhXM3NVNzdBQkpBNmYx?=
 =?utf-8?B?WkJ4SDBNR2R1dDNZZFJxNFkrU1crdGpRcDBpdUVLZHVjSE05UnM1VGR3Z3ZV?=
 =?utf-8?B?eC9weEF6MWY1eE9GTmFZNEN0RmU5aytZTWtkTFY3dGFhRWRHaVpIa09HSW8v?=
 =?utf-8?B?NHJxdDc1YVp1Uk5xSm9IdkxLMVN5L2luUzZBazlvR2doall6elluaUZPYjNN?=
 =?utf-8?B?YU1McW9CZVpFWWtXZElTcytPUzg3Sk5IMzFtZXF1a3E4OWJCMUN1d01EdFlH?=
 =?utf-8?B?U1lja0MrRFJKZ3doYnQwMklSVi82YjZaeDMyVGZTWTE2bHlyRWhMTWNvaVlY?=
 =?utf-8?B?VnkveDExMkV0MEVLcmsxbENxU3R2ZFRDZVV5T0IzcmRiZUFoRDg2VXIveGlV?=
 =?utf-8?B?T3plQ2R4cXh3MFl4c1J4QUVJQVYyQnJkdTlYekxQOEVkQllvTWl3d2VPNGZM?=
 =?utf-8?B?LzhjbmhPN1V0MGlsUzNXU09rNVhTY1owQ1VFTUp3TEFhTGlNQTh4NFQ1NUgx?=
 =?utf-8?Q?iaW57HMPGPDmWRopl650aTYELjENwbMLFImXXL7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e30db2-ee6b-43ed-1471-08d8e7b2ba35
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:03:28.9479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qru3PqPCuLaFUhPWwzd+wlmQ2agsq5AFv0YeolgWhf5yUTgy2ramd3mkITuSnLiZSbOhYM5Bjhby5T1MnuohR1qMpLFKJz2/UvhLGZgFRdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
Content-Type: multipart/alternative;
 boundary="------------6786F40C78A221FBF694559A"
Content-Language: en-US

--------------6786F40C78A221FBF694559A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-12 12:09 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-robotframework_3.2.2.bb => python3-robotframework_4.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-robotframework_3.2.2.bb => python3-robotframework_4.0.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
> index 10f031c7b..6cb8643bd 100644
> --- a/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
> @@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   inherit pypi setuptools3
>
>   PYPI_PACKAGE_EXT = "zip"
> -SRC_URI[md5sum] = "ac6b77c223821856e8ac077acf5a7c1d"
> -SRC_URI[sha256sum] = "a0786a916d0572bd9d6afe26e95c6021e3df5dcafa0ece6b302e36366e58c24e"
> +
> +SRC_URI[sha256sum] = "a02a6f4af3b0830e4396058694c333cb63eb47f50acf6723be34f0f7a4d73ad7"
>
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-shell \
> --
> 2.25.1
>
>
> 
>

--------------6786F40C78A221FBF694559A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-12 12:09 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210312170952.567998-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210312170952.567998-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-robotframework_3.2.2.bb =&gt; python3-robotframework_4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_3.2.2.bb =&gt; python3-robotframework_4.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
index 10f031c7b..6cb8643bd 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 inherit pypi setuptools3

 PYPI_PACKAGE_EXT = &quot;zip&quot;
-SRC_URI[md5sum] = &quot;ac6b77c223821856e8ac077acf5a7c1d&quot;
-SRC_URI[sha256sum] = &quot;a0786a916d0572bd9d6afe26e95c6021e3df5dcafa0ece6b302e36366e58c24e&quot;
+
+SRC_URI[sha256sum] = &quot;a02a6f4af3b0830e4396058694c333cb63eb47f50acf6723be34f0f7a4d73ad7&quot;

 RDEPENDS_${PN} += &quot; \
     ${PYTHON_PN}-shell \
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------6786F40C78A221FBF694559A--
