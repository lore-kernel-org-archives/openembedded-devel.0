Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.68])
 by mx.groups.io with SMTP id smtpd.web11.1084.1614621097304408420
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=au6Kooky;
 spf=pass (domain: windriver.com, ip: 40.107.223.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8VyhJgzxCQCx3zOjfbiNz5bp61HrfeotgqQHMcSvwBdb5JfcSj1jggT1WCTSOFhYrHrVWB8n8CeQmND2BFQbHmH6QDpzjSjUd/E+CtHeMNf7AVZ3BSRpKJVsPqbESkTMHqBYC34J0Hv1b6Jk2vmS5LsBdbxnoTW5g+s4GPe1J19m8vdFAYIC64Fxn46v1xEEt0FUpEdlAn8Nk7YgYiWG3MwiDv/EKX/iInWWz38mMTk+grnqwqatBGOjXU3yiiueue+wxUIjWZ4/YjAt//MxpNnCqNLGO9D4iVmSFL5UEd93k5oyUK+TnT3vZhQkdf2K7aYwZssQRddjZgSKNWDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aL1A53bK6R3E0gSaGzRzI0ohVTl3vNOwbHFhPeYLI8=;
 b=OnLRRpDNST1blbaQOIqRkoKHAgZKPnauJn4v5hfDtTY9GCvDWz6TcY9vwtE1frmYO2V5WYYZ7AU3C/6YNussKKyXCFKUWFoGB8WCGbaBXNtU/piZtd04hc6ejJ3Py03hMZl03CH5C9nID6kkY+40D8j0VuJr0PXYccem3aTkTrdGKfEVKeq7551QRkmllUKJ2pJzSFh36RviaFdj8P/M0tyQsKoVG9e6fdmya9voFynbsYzfy0HWiimzviF5yfwdvNMQProWJ/ZwP8yEwYamjcSEQMWXK+gyD2KuUb22aOivujJh0FTw7Pr+PUlS/yMz7yg0Z17J6atwOHFZHdlSqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aL1A53bK6R3E0gSaGzRzI0ohVTl3vNOwbHFhPeYLI8=;
 b=au6Kooky+J+1/eIsKiObQvPVoGTvlvm9YGELkiGyKfk1OEdQejWuqFcrwR8P1SWhfNNGJLGRp7/ybBb0uSBpOZfd/Eb1UVNdurTUeHD2sFIVwiWkR6Cn1OPULpY/w6xBgf5EApnD6iqV9msIuBRvqThr1rZxPtHSwFHhL6NSOJ4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4005.namprd11.prod.outlook.com (2603:10b6:a03:18c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 1 Mar
 2021 17:51:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:51:34 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-semantic-version: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210226145555.11205-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e9ab2d2c-959e-3d01-7a8c-87e1a131fb08@windriver.com>
Date: Mon, 1 Mar 2021 12:51:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210226145555.11205-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR04CA0181.namprd04.prod.outlook.com
 (2603:10b6:408:e9::6) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR04CA0181.namprd04.prod.outlook.com (2603:10b6:408:e9::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 17:51:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6882c2c-9a68-4c57-82a5-08d8dcdaa784
X-MS-TrafficTypeDiagnostic: BY5PR11MB4005:
X-MS-Exchange-MinimumUrlDomainAge: semver.org#4095
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB40051D692045D79412933B979F9A9@BY5PR11MB4005.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LwQhi1oIBimII/SD0B9p/XH7ZDWZmX1orbfNJhey0KkPRWHXt3mjXdgcAdjVxfRIHaEbbWOf4cWGTSmcvtmEM7DFLRughVhrSdLxkRgp3IWJ6K706SGE8FmH1JGrO2ITicKMG7RJUtzRg4nF7Jv+n3FJvdRaYqRD1PT/sCjd+r2hWZNhXbVNJKlqgpBKcshGML4rqdyYAGcKo6kw9BCaay8mRbhJfwd6zHIFZHm669pKtWys3HGmMSRo1G3k8DTufTAg5o2iVcoH8iXMR4jwI+pA3Tpiiao7pp4Of+DLbLzIjSa9Fcg8jMdcScavZqsWDhGJA32egD8h5YJnM2HV4EMAh6CzsdX9NYvnHPeV6LNXETXXmPffB5S147TVVPVEdyXQNUbEbU06qaW/v6MT5uuJgZhdEsGL2Xq85UcGTv2iAxGVCk01R3+z31Yxyk1mtX4JYN/hyv+2Utiz6/ikUSEH5eeQNiFtmUymyn85kw6H2JXNB3G5iOe4aKTAk0UjvKeWWRpSguxa/wwN8TOZKDXS+edT3NzFQPZIbWzjj5TZkkbPLOBHeDu4umEBhjGGhRrYDR59IHGsZw3u+OsZbEJojS9DSy5Ed0c23NSnfHLqY5bTnsz2TQZ2Cb8obcSX9Mivp2yFRvTvmVub+Xa0KUnyyPRZNrPK8tYUDZiTJVuNN1O61taBkkDrOwvmu7ST
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39850400004)(366004)(26005)(186003)(316002)(66476007)(66556008)(66946007)(478600001)(2906002)(2616005)(16576012)(966005)(44832011)(956004)(8676002)(33964004)(16526019)(166002)(83380400001)(36756003)(86362001)(5660300002)(6486002)(8936002)(31686004)(31696002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UDVPOTArMGVlNSsyOFJwTmJGVDRWZTRvb0NmZm9vWWR3MCsvYVY0QjRjNHRM?=
 =?utf-8?B?UStZSXd1Uy9lS21oWXNBN21SSy84MU9HSkFQaTFsWGovSWJ1ZFg1M3dMb0RM?=
 =?utf-8?B?RXFDOW5QNUZsR2ZBN3VRWkRqMEc4aHJXODY3MHNFRkFzU0xJVnBuOVF4RUFB?=
 =?utf-8?B?bklPYXJiSFVzVE5ycnVKWkVWUjF0ZC95VnNmNkRSWktXSXJJTTlpZ2JUaDJO?=
 =?utf-8?B?SDdJSDdpWUNaZlBHWHBDQTBZemU1MmZVUXBwVlB0azlaSVRscHI5Uk8rYmhP?=
 =?utf-8?B?SnBjRTYrTUNQdVA5VnpRRWxrbkhWdTcreVVDaHY5TGdlYUMyazc5NjY0T0kr?=
 =?utf-8?B?QlBKK3RiZDdzeHlRM2NleWFSc2taTUVwbHBUTE1UeUtMV1AxVVk5SXJvNmxU?=
 =?utf-8?B?R2o1MTJoOW5LZEhaTmpmTExMbjhXa1cxejVOMFk1K0FmSUpNWHcrcThmSlhT?=
 =?utf-8?B?YmEyZmZTc2U4SnJJMkVWRWZkVm81RHREd0RudkQ2disxL1VRSDNVcXJkRnRB?=
 =?utf-8?B?OC9RZU93MnVpSDUrL2ZZTXdja1hZbDd6N2VOOXRJaXlyTVVBdkhhTEhaZ2tZ?=
 =?utf-8?B?d1lNSFZtOFF4RkdZU2RNRTVBVmcveHlscmRSQ2pOZDV4b2pzTWlRZ3lZSVRy?=
 =?utf-8?B?ZjRKTk96NVIwaHA5UllteG9DYzRrTHRXZUJ5MXZ3b2NXQnBha1V6bmd4YUhl?=
 =?utf-8?B?Wlo2L2JhL0VJMXRLZm1tR0FwU013QzlLdjJBL1V4UnZxOXVtcllyM05VNkFD?=
 =?utf-8?B?ZGF5WU9RalhZWk1ON2RkK0hqUmExTWtLTTBLSUxRRERaUy9GSUk5RTJCQXdw?=
 =?utf-8?B?azd6TktLekI3U21yK3dRVkxSeW43MnNyTFUwM0hvWTlMOVYvM3JOeHQwekJi?=
 =?utf-8?B?cW8xVjhqbWE5eVNkWlgvZVN2ajZOZ3MwNTcrdFY1QkF3TkJzRzdvdjNpNGs2?=
 =?utf-8?B?UHY1RUJmTXROeFhtbzNzSXN4ZFRlamZEdS9lVGp1YVdjNkozUit2SXZycm50?=
 =?utf-8?B?Um43RVBjOFdONnlDVTNTeS9rVzRkem5rUXdzTFRzcXQ4TWloOFRiNVkvMktL?=
 =?utf-8?B?SEVpNEtLWnlUbnZkNjN0dzZHLzBReHV3OU41bXRMWlFlSFEwV2dscm9pN1Y3?=
 =?utf-8?B?ekxEWXAzOVFLeE1jaFVsUjE2alFDVmh2RDhTRTFmMTR6cDJtWG9MTndjUkF3?=
 =?utf-8?B?ekpOWjlwdXpEL1NKNmQ1VFhQb3lrUFUrWWlTRXVaQ1Fsc2tQRWZBMzVjc2xK?=
 =?utf-8?B?d2VzZGg1ckxqc2EwY1J6U3k5ejBoV0NoaVh4RWcxRjVkTFQzU0wxeVJsYWd5?=
 =?utf-8?B?dTZuaXBEVmZLdFU5WTFNcURLWms2M3o1M0c1YmFlOU01TGh5elR6SzNBMFcv?=
 =?utf-8?B?VDdEdzg0cjdjdXZQcVN0K1diRytodGFrVWgzNEtDem1udUtVV3RFU0xDdmRz?=
 =?utf-8?B?bDl0bXQzY1F4YlJDbHZYYkhSM2k0M3dEN29ld05IMnNnUndOQVBvNnJzY3A2?=
 =?utf-8?B?T0JFWlZub3RFTnQ2dWxtQTBpZTZRanN2WkV3bDlRZk5Jb2w4Vm9FWFdPcUl0?=
 =?utf-8?B?TlE0U2lzbTlKUjZ4YzJlYmFzazFnK3dENnJKZVpobTZRRTZsV1lXTmFMNStk?=
 =?utf-8?B?WElkUWRFRWJsdTdqVjMvOVZUK3BCeVFHc2M2dE4wSEFOYmQ0d1JBM0RPWHFl?=
 =?utf-8?B?aXVCV3hwQmowREtlMk1DYklvM210dXo5RlR2STExSEZacEhISFBEZmVRQXF1?=
 =?utf-8?Q?pSWV1Axm66v+en3g8pN3eU227DDtg9rKGJPlLap?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6882c2c-9a68-4c57-82a5-08d8dcdaa784
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:51:34.8423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+IiGE6s5It6+n6f4mr6CYpBul37FfAR7twF4/kbenphieHrqgxSGAnF4rWwuWJ/WueTAhrzvudRn83hF6CvYX6nYh9pnQWkd7FIdAhdeRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4005
Content-Type: multipart/alternative;
 boundary="------------9AFB9B49AB78087576DB6F1D"
Content-Language: en-US

--------------9AFB9B49AB78087576DB6F1D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-26 9:55 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Add semantic_version - a library implementing the 'SemVer' scheme.
> Version 2.8.5 brings:
>
> - Properly handle wildcards in SimpleSpec (e.g. ==1.2.*)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-semantic-version_2.8.5.bb         | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb b/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
> new file mode 100644
> index 0000000000..b8541ff570
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
> @@ -0,0 +1,12 @@
> +SUMMARY  = "A library implementing the 'SemVer' scheme."
> +DESCRIPTION = "Semantic version comparison for Python (see http://semver.org/)"
> +HOMEPAGE = "https://github.com/rbarrois/python-semanticversion"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2"
> +
> +SRC_URI[sha256sum] = "d2cb2de0558762934679b9a104e82eca7af448c9f4974d1f3eeccff651df8a54"
> +
> +PYPI_PACKAGE = "semantic_version"
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>

--------------9AFB9B49AB78087576DB6F1D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-26 9:55 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210226145555.11205-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Add semantic_version - a library implementing the 'SemVer' scheme.
Version 2.8.5 brings:

- Properly handle wildcards in SimpleSpec (e.g. ==1.2.*)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210226145555.11205-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-semantic-version_2.8.5.bb         | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb b/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
new file mode 100644
index 0000000000..b8541ff570
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
@@ -0,0 +1,12 @@
+SUMMARY  = &quot;A library implementing the 'SemVer' scheme.&quot;
+DESCRIPTION = &quot;Semantic version comparison for Python (see <a class="moz-txt-link-freetext" href="http://semver.org/">http://semver.org/</a>)&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/rbarrois/python-semanticversion">&quot;https://github.com/rbarrois/python-semanticversion&quot;</a>
+LICENSE = &quot;BSD-2-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2">&quot;file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2&quot;</a>
+
+SRC_URI[sha256sum] = &quot;d2cb2de0558762934679b9a104e82eca7af448c9f4974d1f3eeccff651df8a54&quot;
+
+PYPI_PACKAGE = &quot;semantic_version&quot;
+inherit pypi setuptools3
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
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

--------------9AFB9B49AB78087576DB6F1D--
