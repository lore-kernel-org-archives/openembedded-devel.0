Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.54])
 by mx.groups.io with SMTP id smtpd.web08.18899.1606484894899737776
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 05:48:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jRZR1rD0;
 spf=pass (domain: windriver.com, ip: 40.107.92.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOxafxLSJieKdQug33j4LQF9OI9K37M5T95RpzIwela//tmXysZ5pgoRAaUkKDgAfJub88l4R0Z9tsTiH+L6wuParxnTqoRu2g6vP4WWCLOBe2XF7yNT4wGTQftOMc/YJsdgNcx0u7AtYJjRnl+ukpIOtC42si02KNpldUZ4P4BD+HzE4F55FizOCdPuDWmivVZ6R2jOmegkoJIOyti23otc1nuhtT4FijavDqQYg8iARpHYuAlayfmiTenEFN/H0qghr0EHnie0WoIt9iBi6Z64vijRQVDbur9D6SRW+mifF8JLzMuXYkqsBifig+I7c3jgubDI9R57VPs5OLzIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsSeGajmq601mZBEtXxuKspmzLhQNcjFzpC+2U3MRqE=;
 b=G4Fw6X4IUppU3Z6kDy56EFJBT3QE37ASoMvVpPPrl/9GGnk+N/GXlHkwQQrXxN64D48ltP1ZNodqKlzV8kLE0EdrngybY4OXsdo7i4cmFeIW796rABIM1xTffTcLJRIWQVYr6yJ8szw6dCy+RzShvWLY/r1qJFYQiHMT1t7vZZIH8wma3N5ssCX57FDkTf4TzP/iozB0dMahDpMVhcShmfYjAl1MgRYk59JSYDzTUrAcL2yoLoRc48TgSYnv6r/3N9g9m5IJ+DKC52bIewnyx57+LWPqEzQMIbffCydp82i4DKdIk1XgSGevDZTd53MMkQFhq5dkYZ4MiiTXojWapg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsSeGajmq601mZBEtXxuKspmzLhQNcjFzpC+2U3MRqE=;
 b=jRZR1rD0crPNkfrpKU2QpOvXdmwzSG8Hps2H3Gb0khPyqm5Xy94x708TdWMLZSTb+VkIZB6URDOkP+TwMxs7PQvQjROrVb+YhjiZvyeUCXZeO8q5hhx6nRajgUKJkM/kit6can659KG+B33mUXxG1tioncOP/K6B8xj01E8y+fc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 13:48:13 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 13:48:13 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-prettytable: Upgrade 1.0.1 -> 2.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
 <20201126112215.11451-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0b3abbb0-6eec-225e-3f85-572e03070c68@windriver.com>
Date: Fri, 27 Nov 2020 08:48:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201126112215.11451-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 13:48:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 720c816b-e1f1-4567-bcd5-08d892db15b3
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB25981AB1312E60D86F30CD009FF80@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ve6gx69WkapBAHzcIKujUFspRP7vwYaZTpAsjA+mdoJKhuWJ/n+kDSj1fmnRXnmnZAAtork0PepsKwsO0HBG9beT4UF4CKJQg9xjq5qgeMiMX7HbG66GsekQcTxSFnCTd+eP/Yd7+SqSNtLF1d/6H6waW9I7G5nyN9KR6DwgInLLdf6TvnO0e145+aq79KbVGX3sM+wpKM45huyRbn0lQQoKx0vQfz6AvGefEMsA5JAYZesVSTbiVHzp7IjYRf1BWSG7inw5843yVRgCiQzFfRovOq37b/MGe5wFrfkir88lp5xgb8jl4qxPSd5zfb48UP699xmcZzOdHDcoa6+b2l5nZQRLpAdP2kNfuJ1btn2a23rQksshWNX+JUSu9vdsQCXOeK57PmpPpLFHyDHlfP28hWeCaglqBN3oeJax/gasd2bJXv7tfK21zPwiFpSNI1oW1lMIKB2gWarCsSvedgavU3o+i/zpyQzUYGRMtKCfId1d7ZzAsgIyXxM5ZC5YU8GGUlUGC0Wjb6vePZ7BPA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(366004)(346002)(396003)(186003)(2906002)(26005)(16526019)(52116002)(6486002)(8936002)(83380400001)(53546011)(478600001)(66946007)(33964004)(86362001)(966005)(5660300002)(2616005)(956004)(166002)(8676002)(316002)(31696002)(16576012)(4001150100001)(19273905006)(36756003)(66556008)(66476007)(31686004)(44832011)(43740500002)(148694004)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MWpLMGZSZk9uTXpTZEo3MjkwRzBkaVc3ei8vRE1ibkFyU2xBRXF4VUhLdE5P?=
 =?utf-8?B?enB1RllrWlpwd3k4dXhac04vaDVWQ0JVSEx3SzUya1B5S09TM1E1d0RUSi9J?=
 =?utf-8?B?MHpCQythdHZGbmtEU2F4V00wdGduV1M0L3dDYmM5cjVDSGlnVStBc3g2K3VR?=
 =?utf-8?B?WDZ5RngwdlZBK1h3ZUEvSVIza0c5TkRoLzMwSUJBRFpQdmZiTTAwY0dlL2VK?=
 =?utf-8?B?c2I5OTVUTUwveGwwK2lpajJxbnlyMDAyVlNWZ1QwT1Q4SUw5WVk4eVpvb1lu?=
 =?utf-8?B?K0V1Q1JVMTRVQWM0ZW0wQ1lkaThqUnZtUjhRNFdIOGhnTnIyZ3EwVDQ1cEtJ?=
 =?utf-8?B?RThPZHl4TFZubkNDTGs1aGpPWHRyV3NPS0xuclRRTENDVml5OG96c2RVbXNN?=
 =?utf-8?B?RUNsZ2VRSEY1MHM4cUhDM3ZJY0pOZGV6WE9nVG05bmpLeS9haUlIdEpjUW5U?=
 =?utf-8?B?cE15U3hmUFA3MmZFZkkrd1AwS3EyUDhSa0RMQVhqYk9xeXh1eG5qUWYydk5R?=
 =?utf-8?B?dG9Ga01ldmthWkhqbndJTWxJUXJhc0xsMmJDU3drUVFtRHlBdlVUWVIweDVD?=
 =?utf-8?B?SGRib2dmSXlkTmh0NVRNMlZDL0FWVUh6Z2VKQnJ4QmozT3NFVUVPYjBxVFlS?=
 =?utf-8?B?OGVDZEdJL3ZFNnptRTVNVDcvUzZ1MHhQNjlYc2xtbStHNFZVUXdzMy83Q2lj?=
 =?utf-8?B?WjF6dExtaHd1MVVyZHZLQS8xRk1iajVUWnNpRU1DWUpJYUQ5d3d0Z2ZUVFpj?=
 =?utf-8?B?bkdvekNxVnAxNGFQS3RWUCtiY21QUDJxSWtCdjlyMmZRbzZaQlJ0dkJ3ZkJp?=
 =?utf-8?B?YW9LVzh6bWp6TjdmTE5NR1RXRnRXMGdIYUxBSlNKQkZsYWVjL2htQktHTkN6?=
 =?utf-8?B?SmhiaUtnL3d2WWJiS0JKd3YwZ0lOTkQ5c2M1RUtza25CRm51eVk5MGQ4bnVF?=
 =?utf-8?B?eWVUbkpOTFZmTDVERExaa3V0UmQ4aXBkeFRQa2lMZ09wN29FTVJlZlA0SCs0?=
 =?utf-8?B?NldkRUtjMFhmTUg3VjBvMUo4R1RoN25KelZ0aFFOOTVTN1ZJYW8wVlB5UXFK?=
 =?utf-8?B?ZHZUU1BnQWRTdVFHT1R6ZjhxMkUydk0zUEMzUTZrckk3UDloSTczVFZHeGMv?=
 =?utf-8?B?Tk1FcjZyai9IdFFIUVZCQTRyQ0JaaDVqaEozUDZPbEpVd0ZVMEJHUk5kUVBx?=
 =?utf-8?B?YVRqdzV4NGpjOWc2Zy96c0dSdUFCelBoMHg3VFlwMGlOL2NMaVBXdmlPR011?=
 =?utf-8?B?WThReHZnalZGNWo0d0doOFBGMjQ2bnFuMjdOOGFjNUZ4b0o1Y1RJdU5vZ0Fu?=
 =?utf-8?Q?tj09jbZgMjMiGDS2nxQz9a7eLeeF6yu+O7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720c816b-e1f1-4567-bcd5-08d892db15b3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 13:48:13.4248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vt2jdeTFk74OhjgVvlh0ZHIApEHQwbczwHzqB5bMK/08h5tsJCsD4K1Hzh3Bi+O3wvUQElJirH947KiQPZw+B0ex6IYnrGc44JLHHZmhFm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------B7AEB41ECBE1CCFCE9C5B59A"
Content-Language: en-US

--------------B7AEB41ECBE1CCFCE9C5B59A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-26 6:22 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.0.0:
>
> - Add tbody and thead tags
> - Add add_rows to add several rows at once
> - Add Python 3.10-dev to CI Tests
> - Stop testing on Travis CI due to new open-source limitations
> - Move to src/ and tests/ layout
> - Drop support for EOL Python 2.7 and 3.5
> - Fix padding_width = 0
> - Don't create universal wheel for Python 2 (and 3)
> - Fix docs to match code: from_cursor -> from_db_cursor
> - readme: update function name in example
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...on3-prettytable_1.0.1.bb => python3-prettytable_2.0.0.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-prettytable_1.0.1.bb => python3-prettytable_2.0.0.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb b/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
> index 79341b9d29..3563bfa113 100644
> --- a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
>
> -SRC_URI[md5sum] = "b5bd0acec56ae7ccf5ac22d3f671c3a7"
> -SRC_URI[sha256sum] = "6bb7f539903cb031fecb855b615cbcac8cd245ebc6fa51c6e23ab3386db89771"
> +SRC_URI[sha256sum] = "e37acd91976fe6119172771520e58d1742c8479703489321dc1d9c85e7259922"
>
>   do_install_append() {
>       perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
> @@ -36,5 +35,5 @@ RDEPENDS_${PN}-ptest += " \
>   "
>
>   do_install_ptest() {
> -       cp -f ${S}/prettytable_test.py ${D}${PTEST_PATH}/
> +       cp -f ${S}/tests/test_prettytable.py ${D}${PTEST_PATH}/
>   }
> --
> 2.17.1
>
>
> 
>

--------------B7AEB41ECBE1CCFCE9C5B59A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-26 6:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201126112215.11451-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.0.0:

- Add tbody and thead tags
- Add add_rows to add several rows at once
- Add Python 3.10-dev to CI Tests
- Stop testing on Travis CI due to new open-source limitations
- Move to src/ and tests/ layout
- Drop support for EOL Python 2.7 and 3.5
- Fix padding_width = 0
- Don't create universal wheel for Python 2 (and 3)
- Fix docs to match code: from_cursor -&gt; from_db_cursor
- readme: update function name in example

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201126112215.11451-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...on3-prettytable_1.0.1.bb =&gt; python3-prettytable_2.0.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_1.0.1.bb =&gt; python3-prettytable_2.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb b/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
index 79341b9d29..3563bfa113 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://code.google.com/p/prettytable">&quot;http://code.google.com/p/prettytable&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=c9a6829fcd174d9535b46211917c7671">&quot;file://COPYING;md5=c9a6829fcd174d9535b46211917c7671&quot;</a>

-SRC_URI[md5sum] = &quot;b5bd0acec56ae7ccf5ac22d3f671c3a7&quot;
-SRC_URI[sha256sum] = &quot;6bb7f539903cb031fecb855b615cbcac8cd245ebc6fa51c6e23ab3386db89771&quot;
+SRC_URI[sha256sum] = &quot;e37acd91976fe6119172771520e58d1742c8479703489321dc1d9c85e7259922&quot;

 do_install_append() {
     perm_files=`find &quot;${D}${PYTHON_SITEPACKAGES_DIR}/&quot; -name &quot;*.txt&quot; -o -name &quot;PKG-INFO&quot;`
@@ -36,5 +35,5 @@ RDEPENDS_${PN}-ptest += &quot; \
 &quot;

 do_install_ptest() {
-       cp -f ${S}/prettytable_test.py ${D}${PTEST_PATH}/
+       cp -f ${S}/tests/test_prettytable.py ${D}${PTEST_PATH}/
 }
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

--------------B7AEB41ECBE1CCFCE9C5B59A--
