Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.48])
 by mx.groups.io with SMTP id smtpd.web12.33687.1612185856737929723
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kslnD0y4;
 spf=pass (domain: windriver.com, ip: 40.107.102.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSIB+J/Cgb0BU2RhAhCsvMaa7XVxXzp+JwOipmBx3QbEgWLcPjFVD7YVFLnnRb3H9FwSXQedqRIPvG/lzyKWWD372jHplNAkxSDi/Hx4YagsVVUvrZegY4V2ErxOFqRbe18rcgOyikWsBLyoVc8P/1p/JmldfKEJ3AN+fr12Gocee0q9OMeqClP+UoIjT5F2M/S6Jp7wSobQZROtUOL2fZOuXUrhEyOOO8h3Il/2bRGwwlus3wtDYXB7KylxZTOkcjSUUE+X+04M5aj2vEcdSqunCkKrcQxXe0amOuEjosNAwSUAfF5F/8I8kydSegYi8uIBMhIDHwJPso1zfmkExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9snZqF5fF/jqOEXaaiQ6jzrwxV0jbQzGXyEWvCkcv8=;
 b=nkT5ASbXiFTbbysT2k/7MHfnLmyRPsntQcFJ2WIJA+lPFmaDnsT9p835eUGlO5bVPtMFcj+x3VrWiEtRFFsmNcACbTfG65LBHSkQCAseuazxb3hac87fZskiSKWQ7wdlnNUW4umXPmab2dYJr8O0qiZy0Wb7/FHA/bralo8Z31KzUmzAosHMzh5o9xj+s5vE4E8A/gAPB2EogHUGwtAqXQE9FbzPXgaanvexWZmxHskl1DEJ943NLSFZHNR0FAe/QeYamQr+h6wDOQMEWu6oyKhmgxGHoYpOiiZg0GdYzuG+/K0Bhvq/LUgvpf3OhME5Z1/pOUz+UWH70rNfeucD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9snZqF5fF/jqOEXaaiQ6jzrwxV0jbQzGXyEWvCkcv8=;
 b=kslnD0y4Y7+458UhdEPsEb/Qr4/UJ/3mD2aHiRZ9ub5dKdml7tvcUAw65Xcf/ihzrcBIphAKzlzWY/NmZUs8/u8FeC4Epg12hYNYBoUql888iqmk6D7UyCLxHQW+WHhhNqZB/lJMRXy1g86j+vdOymhoJgjHuFs0Be4WVJ5Zkhc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:24:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:24:15 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-xlrd: Upgrade 1.2.0 -> 2.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210128102903.11760-1-leon.anavi@konsulko.com>
 <20210128102903.11760-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b3d87db0-de41-6c8d-a652-242dcaaa4484@windriver.com>
Date: Mon, 1 Feb 2021 08:24:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210128102903.11760-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:408:ee::10) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR04CA0005.namprd04.prod.outlook.com (2603:10b6:408:ee::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Mon, 1 Feb 2021 13:24:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39542a81-890b-4d49-1e39-08d8c6b4abeb
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5165D6EF3D574397BFA600019FB69@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5jlPJqCZA58Oz35K8Ga6+/7ZJ4O7zA1pOIfNZ48bAb6RMXZVmkuY0Seci83IDzs8435l7MxWjrzJvd/OcrYP92/B+V09QdQz/JI06cj9Qg5FD306DEigJxVUPMNem/FsVZ4W2lZOq1GCwAtBdBCuLLiKaCHn0/hwgFNZ493/UQQ017391gSJW2quSO9CFaLF6zYK89J3Db9rRisLdjGS8qtvotQEu3u+owGuL0grK12g9LQD+ALWVnubDJRrs0/5PIUL5bRaHGrYli25lHc7KsBUw+H/WL8jL17guaHQcRppf0HoVXikw1HdXxsS0AIq3SW9w8U1vacBCexZoGNrdOT/BtdAiGQHejaGDLqRH2TDUJPnieKZIlUz0Mta0gR7fPafN5DZ1u/jeaErUXvXja4c9GTewnt9YyrxbFocAT7oKXtWY3UiowIPFqFApFh9K82m7hX2soazjvd3miVjuMPN51TOkvp0xRBRBJaHek/X+vl4xQBYnYYDBqcDbhA8eCAkZCdQLbRz6GysqHkz9xuTdLq4797jxXyJOB1yyXpODQfCOiNjxMI2vdy1eeO37EGBjqGA1OBJv37vp3TMqwbLGMzRzP0AcS/ycGdq2tq5+J/n5eeubN1RN53ph8/rOEXNYNn92pJJ+1DCNCiRngTY0uJE/9q3SFZX6AKzAxMIprQZgdmX0hzJ8eQowlpC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(5660300002)(66476007)(33964004)(66946007)(16526019)(2616005)(2906002)(36756003)(186003)(66556008)(86362001)(52116002)(31686004)(6486002)(8676002)(966005)(956004)(53546011)(44832011)(83380400001)(26005)(478600001)(316002)(16576012)(8936002)(31696002)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WnZGeGFBbUdZK3kyNkRFRk95L09xVWZndURPbFpRUlAwUjcrQ1VyMEtzck1h?=
 =?utf-8?B?ekJjaDV2eVBEYjdVeDFrS1g4TExIazk4SnBuSGZlYmJZK3VIRGk0RDBOakhX?=
 =?utf-8?B?UkVtRU5raXJEaXRUSmVLWWwzc1JzQ0tUYS9ydnUrZzRMUVUvSU5PaTM2aWhn?=
 =?utf-8?B?UlUvd0lSbUFhZCtQd25MWk82d2ZYSGR5SnFKL0NIRFdSNzBQbE5OdlNZcTVL?=
 =?utf-8?B?MnI3b0N0OEN3Wk4zTVB1OGpRL2IybVN5cXFHYVloRGU4cDE1NmtnaFZKTktR?=
 =?utf-8?B?eTRmbU96R2pTWU1JWW4vbzR1VmppZWo4STRJWitKcC9qWldySGFwZ2tVN1VR?=
 =?utf-8?B?WExTM3ZiL3gzUnpxUDh2UHhTT2IwaVpVOU5Qdk40M3FyeWdldHhVZWJ3dHFE?=
 =?utf-8?B?RFpQRkhzRnYwYm00WmtCOGpOMVNUVm1HS1ZNMS9ySEtSdTFUQ1UvT1hxenJN?=
 =?utf-8?B?emhBbklVY0ZTYVpQcjdJTFM5cTBidjZRV1lwTVRIMm1qc3pPdjF4ZzNwODE3?=
 =?utf-8?B?UGlmcEJDanFubVdUMFgrY3VqZU1NMlNvTlYvTnNsOUF1TkIvalJmVTRlcVhS?=
 =?utf-8?B?Y3BiNUJrSTREVTZMU2xBeWxTQkU1SjduaEgrT2xWNG1WUjhGQ01rK0M1Sjh2?=
 =?utf-8?B?MERIOFl1QkxabEJWSytGQi9keXFWc2FUZzZYZGpIWEVNYjM1eFJkMkhQMmVx?=
 =?utf-8?B?a1h3dVFoRDUrRjZYUTRXV1ZwMUM1TUJKS0NLMHJXMXg3ME1QRTVEazhhaDFh?=
 =?utf-8?B?TVRydFJiRVZaQ3lySEFLSU1BNmNaa2Q0OFI0L1JIampMdklUTFgvRzFTRXQ5?=
 =?utf-8?B?dU1aVVh0alNnWWt0RUsxeDhnTjE3elVYU0xuR1VNeXNMSFBHazQwWVdOV0RG?=
 =?utf-8?B?TjBrQy9iSnM0b1pOVVFTRFdOQ1ZiTEN0ekZoamVDZkVuUVp1K2xYQ0pVVDQz?=
 =?utf-8?B?OGtpYVgzcFV4VitWQVErSnJCbmlzZWpFWkFKaGRodzdHREZUUFdmYVY2cGN3?=
 =?utf-8?B?d2VtSXBvK0pYZjFWSFQ4N3ZSTy9vQ3BUM3VwSXk4bmU0R2VRbndERjZNbFcz?=
 =?utf-8?B?TkhaRExNcUVKbHRlMlUrNExicTBLNHpKUjN1YVUvTUFWcmRUZDBFMENVV2Zn?=
 =?utf-8?B?dGhFUklLdDBISlJPcjJXUW96NUY1RFQ1cjc3TTh6d2VSS3RKNmpmVkR5WENr?=
 =?utf-8?B?ajlYclhOdWxhRlVvRWs1K2RyMm0wSHhITDJ3S3orL1VGVnNud2dxclllTXV6?=
 =?utf-8?B?RktBbU5VZCtDdm9GVFFVQVZLQ2d5UTFFTjl0d25aak5pRjM5MDl0YzNvd0NQ?=
 =?utf-8?B?UTFDVmFna3Z3ODFYVEZ2OHFITUtzNURLM0tzd2FQT0dBaU1VMndtTTNJc3lj?=
 =?utf-8?B?a3FvaUdaNCtIQjA5U2djdkoySDYrMzZjYU9KWndOaTBTVXIyTXRuUHc2MlR1?=
 =?utf-8?Q?K5KgJFwE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39542a81-890b-4d49-1e39-08d8c6b4abeb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:24:15.5739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SpkpLoGWTv+8WHiKaLXNEXb9k1cu35E4ifWqkHd7GHRbd52O4a+pZ5mjdbhyMop6PUUNUwx/VwAAGdkAediFkFSfeUHfZ40AnhQb1zV4Tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
Content-Type: multipart/alternative;
 boundary="------------4B788E559AF6FC68A0952415"
Content-Language: en-US

--------------4B788E559AF6FC68A0952415
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-28 5:29 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.0.1:
>
> - Use the README as the long description on PyPI.
> - Remove support for anything other than .xls files.
> - Remove support for psyco.
> - Change the default encoding used when no CODEPAGE record can be
>    found from ascii to iso-8859-1.
> - Add support for iterating over :class:`~xlrd.book.Book` objects.
> - Add support for item access from :class:`~xlrd.book.Book`
>    objects, where integer indices and string sheet names are
>    supported.
> - Non-unicode spaces are now stripped from the "last author"
>    information.
> - Workbook corruption errors can now be ignored using the
>    ignore_workbook_corruption option to :class:`~xlrd.open_workbook`.
> - Handle WRITEACCESS records with invalid trailing characters.
> - Officially support Python 3.8 and 3.9.
>
> Get the source code from the git repository rather than from PyPI
> to obtain the tests.
>
> License-Update: Use file LICENSE.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-xlrd_1.2.0.bb => python3-xlrd_2.0.1.bb} | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-xlrd_1.2.0.bb => python3-xlrd_2.0.1.bb} (63%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
> index 571dba6fa..8587ea8f3 100644
> --- a/meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
> @@ -4,16 +4,19 @@ DESCRIPTION = "Extract data from Excel spreadsheets (.xls and .xlsx,\
>   Strong support for Excel dates. Unicode-aware."
>   HOMEPAGE = "http://www.python-excel.org/"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5f4244d51fcc1e7cc2d43e96891b2f80"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=00ea1e843a43c20d9b63a8112239b0d1"
>
> -SRC_URI[md5sum] = "e5d5b96924d791b22898b622eb3e918e"
> -SRC_URI[sha256sum] = "546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a1b29b2"
> +SRC_URI[sha256sum] = "f72f148f54442c6b056bf931dbc34f986fd0c3b0b6b5a58d013c9aef274d0c88"
>
> -SRC_URI += " \
> -    file://run-ptest \
> +
> +SRC_URI = "git://github.com/python-excel/xlrd.git \
> +           file://run-ptest \
>   "
> +SRCREV = "b8d573e11ec149da695d695c81a156232b89a949"
> +
> +S = "${WORKDIR}/git"
>
> -inherit ptest pypi setuptools3
> +inherit ptest setuptools3
>
>   RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
>
> @@ -24,8 +27,6 @@ RDEPENDS_${PN}-ptest += " \
>   do_install_ptest() {
>       install -d ${D}${PTEST_PATH}/tests
>       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -    install -d ${D}${PTEST_PATH}/examples
> -    cp -rf ${S}/examples/* ${D}${PTEST_PATH}/examples/
>   }
>
>   BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>

--------------4B788E559AF6FC68A0952415
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-28 5:29 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210128102903.11760-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.0.1:

- Use the README as the long description on PyPI.
- Remove support for anything other than .xls files.
- Remove support for psyco.
- Change the default encoding used when no CODEPAGE record can be
  found from ascii to iso-8859-1.
- Add support for iterating over :class:`~xlrd.book.Book` objects.
- Add support for item access from :class:`~xlrd.book.Book`
  objects, where integer indices and string sheet names are
  supported.
- Non-unicode spaces are now stripped from the &quot;last author&quot;
  information.
- Workbook corruption errors can now be ignored using the
  ignore_workbook_corruption option to :class:`~xlrd.open_workbook`.
- Handle WRITEACCESS records with invalid trailing characters.
- Officially support Python 3.8 and 3.9.

Get the source code from the git repository rather than from PyPI
to obtain the tests.

License-Update: Use file LICENSE.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210128102903.11760-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-xlrd_1.2.0.bb =&gt; python3-xlrd_2.0.1.bb} | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlrd_1.2.0.bb =&gt; python3-xlrd_2.0.1.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
index 571dba6fa..8587ea8f3 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
@@ -4,16 +4,19 @@ DESCRIPTION = &quot;Extract data from Excel spreadsheets (.xls and .xlsx,\
 Strong support for Excel dates. Unicode-aware.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.python-excel.org/">&quot;http://www.python-excel.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=5f4244d51fcc1e7cc2d43e96891b2f80">&quot;file://PKG-INFO;md5=5f4244d51fcc1e7cc2d43e96891b2f80&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=00ea1e843a43c20d9b63a8112239b0d1">&quot;file://LICENSE;md5=00ea1e843a43c20d9b63a8112239b0d1&quot;</a>

-SRC_URI[md5sum] = &quot;e5d5b96924d791b22898b622eb3e918e&quot;
-SRC_URI[sha256sum] = &quot;546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a1b29b2&quot;
+SRC_URI[sha256sum] = &quot;f72f148f54442c6b056bf931dbc34f986fd0c3b0b6b5a58d013c9aef274d0c88&quot;

-SRC_URI += &quot; \
-    <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
+
+SRC_URI = &quot;git://github.com/python-excel/xlrd.git \
+           <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
 &quot;
+SRCREV = &quot;b8d573e11ec149da695d695c81a156232b89a949&quot;
+
+S = &quot;${WORKDIR}/git&quot;

-inherit ptest pypi setuptools3
+inherit ptest setuptools3

 RDEPENDS_${PN} += &quot;${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell&quot;

@@ -24,8 +27,6 @@ RDEPENDS_${PN}-ptest += &quot; \
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    install -d ${D}${PTEST_PATH}/examples
-    cp -rf ${S}/examples/* ${D}${PTEST_PATH}/examples/
 }

 BBCLASSEXTEND = &quot;native nativesdk&quot;
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

--------------4B788E559AF6FC68A0952415--
