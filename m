Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.62])
 by mx.groups.io with SMTP id smtpd.web12.1589.1602078551204146233
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=A3GKGu3a;
 spf=pass (domain: windriver.com, ip: 40.107.236.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkSxgpi2uKbZEiTsZMF8xlW5Vm/sRqL1uf1M5YkPMnL0WtQHm14NUdLGOomr+LeX7JgP2Zek3+Th9MXDabuckZKqheCu8RA6FueyXG5j5HXgv2KyJLDUTLTAJptDWnWHYcAedb8GT1quH2Bzh4hdYafnYtwsVr56kQv6jj3sEwBT2RHnU9Zu3MeOX8jc3nF4vQn0KaUBPkrlg8F49r/Vk3usHI8ZTd1PRPNW5OnyA4L6BQZWqvPaKBnZ4zhLe5VPshJp3YE2kS7OVEKdvd6h6QnOULNYsqZbE48/ifHwkud2nsqFQs1g9pjmpUDuFEw3JngZAxCKdt5oSsq/pZ8Hhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqJM98kJclY4LPbNOKGSzeQFyWTyEUm+/WpH6Him9Vo=;
 b=gPmnpH1hDqrkO+3ni/HAmz/OPaUqmKtkd7a1MHUg3CpCk/3H0rceGDAJO0WeLF7dyY6+6W8Ot9nU/T04iiuHYOeOyLiMXH8znbNqVtmg3dI0eG1ZWa+nr76SY4czDbwTh2SGOFI531RBGQeIDv0KPg02Redjx6RZF4z23KSrMd/Re8JDTQmfCfTz6crqHpk3t4hcFddMq6ZIOVPtC1p/rnCkVHH8ySQPxw3MCCKt/iDYSUpfRZNqaFKnQK/uHLveoIEr1X6ajn8PTGGUVi4WoTyYzFI9ZKwZDSgWJ8sVjr+W3/kDscqehtES+5K7OwpLxhZNFNuio89+m/BsNfP5CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqJM98kJclY4LPbNOKGSzeQFyWTyEUm+/WpH6Him9Vo=;
 b=A3GKGu3aCIP8nmY/5TUM1zEXWBntTNHH2BCI/J9pb9StS8vVeOK4E0tOGBx33JAUjaZYFBveaqxVpdqslJqWOtyLLlZGCKQBvQ+0YNFfLPKMDyWA8NF01QligcrY43bQm1j0wZt1ima5hbtOWDI3VL16Ln0VjYnAmXIUdqKERPk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2536.namprd11.prod.outlook.com (2603:10b6:a02:c4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 13:49:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 13:49:09 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-prettytable: Upgrade 0.7.2 -> 1.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201006090526.24310-1-leon.anavi@konsulko.com>
 <20201006090526.24310-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <42e62fb0-9130-b657-8c33-3c8156d737b6@windriver.com>
Date: Wed, 7 Oct 2020 09:49:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201006090526.24310-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Wed, 7 Oct 2020 13:49:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d24f19e-91d4-4d63-8ba5-08d86ac7c41e
X-MS-TrafficTypeDiagnostic: BYAPR11MB2536:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB25364B13AC18176E1B25D8E09F0A0@BYAPR11MB2536.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fuP85g9QcFlYiyQBs0pHeuS68BxDr61gCn/tV2PCHctTjRWJ55uMeehu6IYCvqzoMbjdHngmlfE4V+EV2B38COedS7tWbFCzC8hwIa1eLR5Z4mZx7IVXlY5OMeLK9EtfuqWM3falfg67v/BHV2Im/3QleJFPR10uImtot52JiTsMyu3AeVFoE8B6m0MdvlEebMMMXPCx+4/Cat5NwprPqKHE8pkrPIXO1JOeVHbThZYq8rAvTYTPUUX8UESc4pfLIHUL4fA3CM9VHvr5vqqjW72uyZzVAyYq8E6A956vYxNN6I7z/nUIY+gkT1kD4nvaHg1LFV5Efeaod9YqMhlL6mVGikh/Yfqqc6xK76k33qx+c7HWj9+ONs7ZmL1VtS4esYqQGqdiN7HtKXy0fy/865OzfKDtOSYsCdbtJlncqznEkiMx8Ycz9WeTM849/74AWwPjk8ayWNP54lRqsdbCNFWjnCnd0P0m/08YuYn/FrU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(346002)(376002)(366004)(396003)(86362001)(16526019)(26005)(186003)(166002)(66556008)(66476007)(66946007)(83380400001)(2616005)(956004)(316002)(52116002)(16576012)(8936002)(8676002)(31696002)(6486002)(33964004)(5660300002)(83080400001)(53546011)(478600001)(19273905006)(36756003)(966005)(44832011)(2906002)(31686004)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YkLugv11oCNA6n8pE7nfpMD9E2ei40y5ak9+v0BwRtc3wjWTTDEn0J/t+8cHgWmOn+Z9PIgmIiGINw9HqJWm1D7OFsRWbuUjhvNkCYRGEhqHJW9rf2+aJIF0JzSOGzTsWVI3FLHqW8W2QGcD+VhussBiAc7Dy0Rhuobr4mwCYLmy3b31D3l/2H2aTiyc8EdnmgiRwTQA/4YBU9d5WnPrkKxS1rXhEW0lM8KV5dwX34yaw8EYvEwEhW5mcPjrEf53EeuKFT+wRo+EMN2nNF+Ftw+3xJ9Fm0gTbrELejSJkbO+k+mW1hy28MVLnundqya6X4BQ4G4zSdXBf1nnAhOcyp+uB2QPnhgZ74nCc4fb7VIE5O589YlcooM7bGbPHKhkCv2UiEa5wEe0r9/RC3DPpHqj1PXs8P325w9+PK08044cmKynYnr1YFiTcJQHLY+dwKCYuuHzWcvWIc/OB0Pcmq8xcta9kCZdaXjYdUAZs7btc7QzsVXvuJrg3mGsGLrC+1OAJ6nfTuiNfRTMKAKw1G0fo2DRx2e9H9TaQYxlDKCi94cl1AGsUhRb3lYw3CJHcMGC9Oxk2T12D0aDjl7k92kfl8Q+2V2AEPdY1E7FfioTnkQlKhCN87XmSyMf7uMVSz78ZYERrciH4jdpbGxcRA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d24f19e-91d4-4d63-8ba5-08d86ac7c41e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:49:09.7315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCQNK+rjbfryTRttPXsssuTdUWW/P8tfBNpPXoqz8mw0936AfNrOT5B5PemmE4GBMDLf4+yPUFMFkDMVqZ23hVFPtWNQ9CQxQMQTEsXbEtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2536
Content-Type: multipart/alternative;
 boundary="------------77AF5FC4DE20A56F414180D5"
Content-Language: en-US

--------------77AF5FC4DE20A56F414180D5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/20 5:05 AM, Leon Anavi wrote:
> - Dropped support for EOL Python 2.4-2.6 and 3.0-3.4.
> - Added support for Python 3.5-3.9.
> - Added del_column(field_name).
> - Added get_csv_string with delimiter option (comma or tab) and
>    optional header.
> - Use wcwidth for better wide char support.
> - New paginate method can be used to produce strings suitable for
>    piping to lp/lpr.
> - from_html now handles HTML tables with colspan, rather than
>    choking on them.
> - Added min_width, min_table_width and max_table_width
>    attribute/options for better control of table sizing.
> - Added "title" attribute/option for table titles.
> - When slice syntax is used to create a new sub-table out of an
>    existing table, the rows are sorted before, not after, the
>    slicing. The old behaviour (slice then sort) can be achieved
>    by setting oldsortslice=True.
> - The from_csv table factory now accepts CSV format parameters as
>    keyword arguments (e.g. delimiter, doublequote, escapechar, etc.)
> - Added 0x000f to the list of special characters with width 0, to
>    fix problems with coloured strings produced by the Blessings
>    library.
> - Fixed constructor argument float_format to work as intended.
> - Removed print_html() from README.
> - Added from_json and get_json_string to PrettyTable.
> - Fixed PLAIN_COLUMN to PLAIN_COLUMNS in README.
> - Added Markdown and Org mode styles.
>
> License-Update: Use wcwidth for better wide char support
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-prettytable_0.7.2.bb => python3-prettytable_1.0.0.bb} | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-prettytable_0.7.2.bb => python3-prettytable_1.0.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
> rename to meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
> index 18f3390619..e5688a3866 100644
> --- a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
> @@ -1,10 +1,10 @@
>   SUMMARY = "Python library for displaying tabular data in a ASCII table format"
>   HOMEPAGE = "http://code.google.com/p/prettytable"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
>   
> -SRC_URI[md5sum] = "a6b80afeef286ce66733d54a0296b13b"
> -SRC_URI[sha256sum] = "2d5460dc9db74a32bcc8f9f67de68b2c4f4d2f01fa3bd518764c69156d9cacd9"
> +SRC_URI[md5sum] = "fb31d4c94fef42f2caf9784c44d8ea82"
> +SRC_URI[sha256sum] = "98a3b74b1980e6a9392498e3a2a5406f6bd836f412843c2be23d9c88671747ac"
>   
>   do_install_append() {
>       perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
> @@ -23,6 +23,8 @@ SRC_URI += " \
>   	file://run-ptest \
>   "
>   
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +
>   RDEPENDS_${PN} += " \
>   	${PYTHON_PN}-math \
>   	${PYTHON_PN}-html \
>
> 
>

--------------77AF5FC4DE20A56F414180D5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/6/20 5:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201006090526.24310-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Dropped support for EOL Python 2.4-2.6 and 3.0-3.4.
- Added support for Python 3.5-3.9.
- Added del_column(field_name).
- Added get_csv_string with delimiter option (comma or tab) and
  optional header.
- Use wcwidth for better wide char support.
- New paginate method can be used to produce strings suitable for
  piping to lp/lpr.
- from_html now handles HTML tables with colspan, rather than
  choking on them.
- Added min_width, min_table_width and max_table_width
  attribute/options for better control of table sizing.
- Added &quot;title&quot; attribute/option for table titles.
- When slice syntax is used to create a new sub-table out of an
  existing table, the rows are sorted before, not after, the
  slicing. The old behaviour (slice then sort) can be achieved
  by setting oldsortslice=True.
- The from_csv table factory now accepts CSV format parameters as
  keyword arguments (e.g. delimiter, doublequote, escapechar, etc.)
- Added 0x000f to the list of special characters with width 0, to
  fix problems with coloured strings produced by the Blessings
  library.
- Fixed constructor argument float_format to work as intended.
- Removed print_html() from README.
- Added from_json and get_json_string to PrettyTable.
- Fixed PLAIN_COLUMN to PLAIN_COLUMNS in README.
- Added Markdown and Org mode styles.

License-Update: Use wcwidth for better wide char support

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201006090526.24310-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-prettytable_0.7.2.bb =&gt; python3-prettytable_1.0.0.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_0.7.2.bb =&gt; python3-prettytable_1.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
index 18f3390619..e5688a3866 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = &quot;Python library for displaying tabular data in a ASCII table format&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://code.google.com/p/prettytable">&quot;http://code.google.com/p/prettytable&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=3e73500ffa52de5071cff65990055282">&quot;file://COPYING;md5=3e73500ffa52de5071cff65990055282&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=c9a6829fcd174d9535b46211917c7671">&quot;file://COPYING;md5=c9a6829fcd174d9535b46211917c7671&quot;</a>
 
-SRC_URI[md5sum] = &quot;a6b80afeef286ce66733d54a0296b13b&quot;
-SRC_URI[sha256sum] = &quot;2d5460dc9db74a32bcc8f9f67de68b2c4f4d2f01fa3bd518764c69156d9cacd9&quot;
+SRC_URI[md5sum] = &quot;fb31d4c94fef42f2caf9784c44d8ea82&quot;
+SRC_URI[sha256sum] = &quot;98a3b74b1980e6a9392498e3a2a5406f6bd836f412843c2be23d9c88671747ac&quot;
 
 do_install_append() {
     perm_files=`find &quot;${D}${PYTHON_SITEPACKAGES_DIR}/&quot; -name &quot;*.txt&quot; -o -name &quot;PKG-INFO&quot;`
@@ -23,6 +23,8 @@ SRC_URI += &quot; \
 	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
 &quot;
 
+DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
+
 RDEPENDS_${PN} += &quot; \
 	${PYTHON_PN}-math \
 	${PYTHON_PN}-html \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------77AF5FC4DE20A56F414180D5--
