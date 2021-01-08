Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.55])
 by mx.groups.io with SMTP id smtpd.web11.1832.1610121694316935830
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=j6L6qERj;
 spf=pass (domain: windriver.com, ip: 40.107.243.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6TCuYll4jt77G6Z6n3uo4/M3byavwAc13PPMN0JOeuxTIUYC0tx84W6BmwsLKaRJCxwq6bY+HmPcnMsktPl+EhwxAXbigwtp9KP6gbwpA3PyraGLgFGSMaUQYxfbi4JydkzEwl9TMGL4hGcI/iyQIBWXIZj+h2QYMsdAYXERqKTI3sSUaQhefoAge5Mm4fExUc6dlCUfNuyOStQCiJ1ukxjl6JCyhdhQTkzgdx10pMcqTKtmJHB+2cxDkxznbWSslDAv3Cq6BBC4h2sOzkLUKtAu7MS047uXyR5VuFM22Xtsp6+/cdlWMp3IJKIJpk0BTjeRwigViBpaU4hP/BolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9N8wlWtjHRJlI7edzC2Mch7Jv00rKBR9PUtTxrAC/8=;
 b=OpSgLoHZ07n+iTMZLXIXHgtCjxftLXrtYcHsDOpx67BazRcnoPmnGoGHjVxsRYFZytB36myVGMIuGpl+MRmEps22KOpTVl8BUCQYGZ9Xi/ioJqDOju/RzvB1SIKqrbXRpPDLhSac5zLUDWL10VV8yiQAtXiPzhXoZCuVgQXx6roVEZLMv3YCREZod7POQi00xYhbtyjYO1AVlPQ2f+NqdPezNm3iAIjKYH8cqcSW1iU2aZhG2J+OgCU5NFlWJbbzOdMP2e9bJA845psbTMRiDoHX6Vgd0f3q6SOQhLQqskPuTeRPPgxHkJXfz0+noMxYJGsEaASINZA4RyzMzFqXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9N8wlWtjHRJlI7edzC2Mch7Jv00rKBR9PUtTxrAC/8=;
 b=j6L6qERjcxZmJYWFYyYOOr7Fo8DXY/0/UmKKW6s5KV4AQ1V+D3XNTkM4M6dThYkko5NLJdsjFbw9sA7t6+qMYxZ/eSxDUpgOlZrB6fXWvzrc5DPk9YfisK8CU2dzhTCfdMKgo4nQKtfLtE0QnCBwDmACZOL5Sir9itnFjhijIo8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:01:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:01:33 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-soupsieve: Upgrade 2.0.1 -> 2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210104191916.7071-1-leon.anavi@konsulko.com>
 <20210104191916.7071-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <029feddd-c009-c601-775b-b4d6f56a3731@windriver.com>
Date: Fri, 8 Jan 2021 11:01:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210104191916.7071-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:208:236::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0052.namprd05.prod.outlook.com (2603:10b6:208:236::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.3 via Frontend Transport; Fri, 8 Jan 2021 16:01:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51f6483b-c0cc-47c8-3225-08d8b3eeab72
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48968FD0BA9A26F769DC4CCA9FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ldYOtL9Ane2Iu4Fvsgc0HO3J2E8LwL6jz14hAzdSyxl0bxBJ6xdg4ctoDWA1ZW5ita0pszkycIweizg82ra8fNlKcp912gqNFq7t/YNaQkFUiKr0NsYEDPJoRwMEG+ukb/zrWBtgIaVAVTCqzuV7JwMHnI54Ui6djiRKbNoqhjoxoqfFPa89NpSwmvW6yp+aakdSI+WDWsCEXx/VTneyKjyZmZpNnlx/YAalZpO41NaLIdEIssIbXM3B/5gua6Y9vComgr7IxCSd+2eHJ9L/pGM9XUTZbdbHXSGcHwhRSoHwBopxIv3UdBGy1jqQJ4r72cXhRmX3vk4wkKgAIVo96OUF6rJG04RdB01moc13wehIaCXkrPl33Bx6QK2i4RSVS/KDqn9qq5Xl9Fp+Q2y1mv0TbVvIgM5kk87J4x+LQWyTGaO8abYsYrsJrAJWJoNwYc1i/TINZWAOHw0k5E8AW6Iss6tVEQGOcpMIybgQSkjJlugQMfiW+PbQbntazZY8V3goiyL2QSSyGbBRikqW0VgE3CYerPfLXyq2vPAQi/W4hJo96Kt6OKUW6Nic1A70
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QStKNVlKNzhVTTdrZ0NMZlhIemxTRjZDcmM5Vk5oV3hoelJITmlHSmFPcWNi?=
 =?utf-8?B?dDZKTUQxZEdWUERhN1NORUpqb3Q0STJ3VnY0bFI1R05HNHFGRTd5RTd6NWUv?=
 =?utf-8?B?aGdrbVdjNHVpYnBhZVU5UVhBaFExbEZ6T0tDNXhNdHNOT2I5Y2pUZDNTNXRu?=
 =?utf-8?B?dWpwRTJwcmVTaHJmNU9tRVk5RDhVRCsrSVVHcTNrbjI2TXE4amt4a1JvUk15?=
 =?utf-8?B?QWFGVm1NUFdxK1VxMHQvZk03SGZtSzVkT2JzZnJxbm9IcmN3ZXdCdFljWkZ6?=
 =?utf-8?B?ajd5azlVaGpJUENlcUNWamQ4MnM5NzZObWg0SVhsMXRYUVFGbllabmZTUS9U?=
 =?utf-8?B?ODNhNVJBVjhYd0E0aEF5dVJqZE0vaDZDT1p3YUtDRjVyUGthNG1hRDMySVB6?=
 =?utf-8?B?dW5sRzRIb1cxcGRHVCsyWTFPK1pJbGtpcGx0dzd2MXhjcnhxdW5tbmRFNTRh?=
 =?utf-8?B?SnplRHdkY3BNd3BVNXBoTTQwNldqL3A3NXFjdlJDemRvSWFrOEh4M1ZmdEZG?=
 =?utf-8?B?MXcySldFMDNFaGhTRGtQamJTNE5rdldMaW15d3h5SzhlU1lML0dxaCtoc2ZR?=
 =?utf-8?B?MUhiZlNka1YveXBRdk5QeS9RMTNLUDVkaVprVUh0b2ZlUWkyWmkzakF1S00z?=
 =?utf-8?B?WGNYdGZmcCtmdVdRNGttVVFQb0JNQWpJMUQ2bmE2YXdqQS80VWZrUDV4b3hN?=
 =?utf-8?B?aDE4eFFnemRnSWxCd29XcDY4T0pObnJRVjVnZ1B4cmQ4TjQvUStrSnRWMEV3?=
 =?utf-8?B?QjdHN0xqUUIzemxxV2FOVGJ4RERiQ1gvVHdDRUdNSGFza1k3QnYzcm5USEJs?=
 =?utf-8?B?aUcwOWF1QVhMQm4zcWc2T2FyOTh2dEhOaFBJUkRCVGJseFEvNTArOCtuaWFh?=
 =?utf-8?B?Z09oMGNvdXB4RFBmV2k0Mk10VmJ6azRONzNSbER4Nml0Z2NaNkU4d1lGTG1n?=
 =?utf-8?B?K0VlN2p4dkJ5cTFOWXhxVDlKMEJTcmtUWWtrbGNZVnBaTk1FdXh3UVI0YzMx?=
 =?utf-8?B?bWhMNWxGRUpzTEkvUE81YmVJZE8vWmp2SjVWdzY2SEVGVEplYTUvL2l3TGJZ?=
 =?utf-8?B?NG1kS204TTB3L3NzbnZzeExOMnIzWGJDU3djYmN4VjIzcGExVnl2WFZuaEpp?=
 =?utf-8?B?cEUyaDFmajUyb1Eva08xOVJYYTdyMVFBL01XZ09IdU5ZWEtBblZIbktVMTUz?=
 =?utf-8?B?a010VDYzY3NXQklTRlRpYVJVQTdQNFNoak01Unc4Zzc0dXhhcUhkY0ZaQXVO?=
 =?utf-8?B?WE9RclJBZmtQaVRyR3owbnRLY2F1aTJuOVcvLzZUMUtsdGFMSVR1aTE3RXEx?=
 =?utf-8?Q?012n06Td0Ln4T7YbgEsH8X5P04CzU+x8Dy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:01:33.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f6483b-c0cc-47c8-3225-08d8b3eeab72
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10oJXJUyK126Zjp/Ff8LMx36b5A1WXsnOFILXC+pfGt7p2KAKs3YYpzrZbj7xpUGiJLrvE7a+11aMsXq63VOUppJjaJsDR8b5ikgR9VtFf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------C8030709236A368999F00CCE"
Content-Language: en-US

--------------C8030709236A368999F00CCE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-04 2:19 p.m., Leon Anavi wrote:
> - Officially support Python 3.9.
> - Drop official support for Python 3.5.
> - In order to avoid conflicts with future CSS specification
>    changes, non-standard pseudo classes will now start with the
>    :-soup- prefix. As a consequence, :contains() will now be known
>    as :-soup-contains(), though for a time the deprecated form of
>    :contains() will still be allowed with a warning that users
>    should migrate over to :-soup-contains().
> - Added new non-standard pseudo class :-soup-contains-own() which
>    operates similar to :-soup-contains() except that it only looks
>    at text nodes directly associated with the currently scoped
>    element and not its descendants.
> - Import bs4 globally instead of in local functions as it appears
>    there are no adverse affects due to circular imports as bs4 does
>    not immediately reference soupsieve functions and soupsieve does
>    not immediately reference bs4 functions. This should give a
>    performance boost to functions that had previously included bs4
>    locally.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-soupsieve_2.0.1.bb => python3-soupsieve_2.1.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-soupsieve_2.0.1.bb => python3-soupsieve_2.1.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
> index ae242af562..7cb0efbf97 100644
> --- a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
> @@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
>   
> -SRC_URI[md5sum] = "62a7481c7dbf6d8cc21e4e3a79c72034"
> -SRC_URI[sha256sum] = "a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232"
> +SRC_URI[sha256sum] = "6dc52924dc0bc710a5d16794e6b3480b2c7c08b07729505feab2b2c16661ff6e"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 
>

--------------C8030709236A368999F00CCE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-04 2:19 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210104191916.7071-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Officially support Python 3.9.
- Drop official support for Python 3.5.
- In order to avoid conflicts with future CSS specification
  changes, non-standard pseudo classes will now start with the
  :-soup- prefix. As a consequence, :contains() will now be known
  as :-soup-contains(), though for a time the deprecated form of
  :contains() will still be allowed with a warning that users
  should migrate over to :-soup-contains().
- Added new non-standard pseudo class :-soup-contains-own() which
  operates similar to :-soup-contains() except that it only looks
  at text nodes directly associated with the currently scoped
  element and not its descendants.
- Import bs4 globally instead of in local functions as it appears
  there are no adverse affects due to circular imports as bs4 does
  not immediately reference soupsieve functions and soupsieve does
  not immediately reference bs4 functions. This should give a
  performance boost to functions that had previously included bs4
  locally.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210104191916.7071-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-soupsieve_2.0.1.bb =&gt; python3-soupsieve_2.1.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.0.1.bb =&gt; python3-soupsieve_2.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
index ae242af562..7cb0efbf97 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
@@ -4,8 +4,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/facelessuser/soupsieve">&quot;https://github.com/facelessuser/soupsieve&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5">&quot;file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5&quot;</a>
 
-SRC_URI[md5sum] = &quot;62a7481c7dbf6d8cc21e4e3a79c72034&quot;
-SRC_URI[sha256sum] = &quot;a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232&quot;
+SRC_URI[sha256sum] = &quot;6dc52924dc0bc710a5d16794e6b3480b2c7c08b07729505feab2b2c16661ff6e&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C8030709236A368999F00CCE--
