Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.50])
 by mx.groups.io with SMTP id smtpd.web09.27885.1611149765411443159
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eHbc1B45;
 spf=pass (domain: windriver.com, ip: 40.107.75.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8JBXn7ImTWAhNbNNUD2D9ZcmbXk4mZSzHy8W8ZgJrtJg3/IVqnxIih5Bl3k+YUPaTGwQxCXdLxb9d9/Q5WvG0vfVbneFsNx98LpozyqZamKHf5TAeaj3O2goJ48/n9AuQxvAkmhIqUM046uLwQzN7aaW8D60H+zPOvAxZaM4iK5C9UKIw9elHRpoQg09+zaiekFaBP2Q8W6zEIqyIVrbFMr0ef9i31MEgmnSskoszg2yUYVktMaeKjxOPNvkZH7LxbCTT/+ul3akoOqf0zROb+gcAA+bhEHMuwXt/NrjZFjTrrpDKJwukVq0zg1VZ2S4IhnLTMZUKC8BIZDCkDJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSoE/nHl9rJ++3L5sWudDQj2Si5sAoGA98Bw07ZHFEs=;
 b=LvrcsKHiXHzMOyMJsc9wnj/CbW/N/FLZ69GWnnG/0KKlJ3+rA4zkNEf6OZcN1qnTpMbi6qZbn60jLE9dt8QEgmOaS5rTs5qaHGceSoj03rLmcUlkaPzwWf02U1ogKPricq0sMxSVEzB0HjCPkKNHe/XRuv1r3ikxyrKHLUQnvB2rD2DfoQ76BXhZp3QTzf7miEjC0nqnkvarrcVa9ZXbdPTPkSOpVG3d0SpsY/gur2sf8m7R78AkG6BcG8D7O6F24r4WCo9QEeQO4fXwVbiDDYmu6sj5ZJf79k4LCsAxXQ8Dr644JmqZwTVN9CCQYScrQ3fa+5qhdTsicZKXAnBHIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSoE/nHl9rJ++3L5sWudDQj2Si5sAoGA98Bw07ZHFEs=;
 b=eHbc1B45H2jcZa7tTa4+J10FwyRYpgezU6Alew7NKM0jpa6FRqLRNjxN9sTHPFmLJm/Ohni9l2iVOYyNcGwoo4WT3glAGvQbJf05ot0wKlwI/wUDhudkV51dYU5PKQmB60jOY7xZkfJPpOhzuJ5Ak/itDewRlPP2RqMeT0pLNpE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 20 Jan
 2021 13:36:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:36:04 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-openpyxl: Upgrade 3.0.5 -> 3.0.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
 <20210119173746.24694-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a7fb7909-4317-5dfa-c95b-0a3b902452bf@windriver.com>
Date: Wed, 20 Jan 2021 08:36:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210119173746.24694-7-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN3PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:400:4::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN3PR03CA0105.namprd03.prod.outlook.com (2603:10b6:400:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 13:36:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 709eba9a-deb5-45d1-2812-08d8bd48553c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB35598D162DE991B982D132189FA20@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w2xp+gh5w5QiQynPSQuYGTByTe9k+U6C1qqLpqxad+FYWg4gv/Zt/5rZeISWPXZZ9nwCkZ8Gv1mJzPZojee4li4hv9oEx9FEMZjR5mS5FiPuwGHZmL77uDGHzP2mDXUGrUbRnDpXa1PeCDcgtKgR30QRHHNyzrmgth1BMqVLzCBSukZhdJmKkGERBPOR0p5kK/ZgyCNbbvRBpavKG8iyQ2HJJ4zg0gaHn0KozCGu7us9taiwlvHh26KIIbBjpyLrdNyKPYzjgs0uyDciKPldhd4VRGfu2XIT7jijo/JNlgbxH9yHbHesIgMXeq59snE3OTD1T1EIcpaAmBI+TZoDAe5P0oFP8H7z0UD1DOkYVb9w/3FOFBeVx4qY6+I9jt/+zxCrSVYNPTkrPZinL0iq2Z/n5qvj8Bizj6rIftVEUvk9KHuZDqzoPKdRlR4fRyu6ai6WDyHTczNkc1G4iM0e++mOOoFmBOAd7VuPxbAIQFAkZX94W7zmZ9i4xF44nK7BmPyUevocBvBfccgm+vp5znG5aU6Kjt3RTcVy+oUnobrfAB5f0GZCdF3uABUyxtqu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(956004)(26005)(53546011)(44832011)(478600001)(33964004)(16576012)(31696002)(86362001)(966005)(66476007)(66946007)(166002)(83380400001)(66556008)(186003)(16526019)(316002)(2616005)(5660300002)(36756003)(6486002)(8676002)(52116002)(8936002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ajZUWE85V0RnMUVKNzBuV3BxYzlETGRXZWdWU09RRWh0TGtoMlNab3FDZW5C?=
 =?utf-8?B?RktaNW1ZdWNHbEk1eURFY3ZZNzBiVHpSbjZYZ2QzRVN3TWF6R2hrSGZJSnFT?=
 =?utf-8?B?ZW84dEMzNVFUOElIMEhoZjkzMHJXK0M1ZE9GcDlSN0tPSHZ1WWo0d0dVYTdN?=
 =?utf-8?B?Ky83dnExWlBxekJVWkt2QWRybE5DT0RtMUc5ZlBmdU1wTVpQdldSa0l3TVR4?=
 =?utf-8?B?ZkZtK3VtNWpKQ0YzTWVueFdHU010Yzk5cVlqUlRtTXVsaUVaYUFYckw2T1Qw?=
 =?utf-8?B?SFpkTksxVkZPVG80WDVpNVhmTXplTk1rdUZxSEp0Tyt6U2ZSa0g4N2VUbVNT?=
 =?utf-8?B?YXcrSTJPbWVwMERNdWc1TDVVWkhhaHEyZlA2RFhiMHozYnNacDRNMEFib1dT?=
 =?utf-8?B?OEFSUEdWWHJ1Zko5cStDbzdPVFNRamhZWm45dHVLTTBuZGtHTHBRblRVTTNs?=
 =?utf-8?B?OHlaSmwxTHpzRDNaNkdvTEgvakpwT3JIdnpZVXZUemViSnR4VXdvcEdRZ0FY?=
 =?utf-8?B?OTdXQ3dYdVhOQ1I1WHdJQnJib3FFTkdBRVFhak85cVBma2gwTGJQVzlLejNN?=
 =?utf-8?B?RFpxdS9URWNWUCtrN0lsMExZdjY3Wk1ncHY2ZHU1Mlc0NzlKU1AvRVFSaTR2?=
 =?utf-8?B?bDIzN0lhWGtXM3BwR2svTVZacURpSTMwamQwM1ErTlBpM3BrWHVhSyt5bDB5?=
 =?utf-8?B?NDNMb0RVQkZxYlJRYXNGREhGVzFNb2o2cVhWb2Y4Vk9xR2h6Sk4yK1lpTmgr?=
 =?utf-8?B?b0Rqdjd6aFgvVk1DNFJDdXJZSXJuMWgwNDl4UVl0UjVTQld0T1h0MEtCMFBW?=
 =?utf-8?B?cXVEN3ZxV29LZUtZV1NJRzBtN3BOZDYzWVRuTVdNeDRzLzdpOUJOTExMQmt0?=
 =?utf-8?B?N05nL1psT3ZRK2dzYmhKTXhTTXB1MFIwR1czZmszYzlxTTV5WUxvSUcydHBD?=
 =?utf-8?B?QlViV1dZcTB6bldjdExjdUJ4b2dTVW42TDliWGJFQ1JlWkFlcWNuenplQXl6?=
 =?utf-8?B?RnNJelN2QzdIMGJYNERsMVNvUWtRZ0hOekdtRXpVNG8xWHJLN2YvbmQzdnlT?=
 =?utf-8?B?S2R1blRSSHdoQ0RkZktMbmUzNVY3WEZhdHVOaXV2R2IvMG5wcmppbzNOWGpO?=
 =?utf-8?B?UkZtUnBQaStISzIzaTIyeCtQVEFtN1hpQnR4WlNwOWpKak1MVDBuQU9xMVhp?=
 =?utf-8?B?S3VQMVFQMi9ROVdjUm5ObGNoeWJxa0V0dzZmUVFDMElOZmliNTB4d3Y2YlZh?=
 =?utf-8?B?QzRlbTVVakVvMUt0enJ0Y29NRkJBSWx3KytSRkRCT1BBYUFZOENjeEl4Ukp5?=
 =?utf-8?Q?BrGlLlx2nANuHHDQVdxQ4iAeUJhFNQziia?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709eba9a-deb5-45d1-2812-08d8bd48553c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:36:04.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fH4w7yrmH4mGIMmwO7C07pGk6a1+8aOW+XvzXxQjEIEoWdLjN2AEdVpFH2gxWTFIdlIRTwj4D1K7qI0cB10nRpa1CGqWhUYZY5tZz0aHwSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: multipart/alternative;
 boundary="------------005F970A16A74C4DBEC5B3D5"
Content-Language: en-US

--------------005F970A16A74C4DBEC5B3D5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 12:37 p.m., Leon Anavi wrote:
> - Borders in differential styles are incorrect
> - Error when opening some pivot tables
> - Resave breaks the border format in conditional formatting rules
> - Read-only workbook not closed properly if generator interrupted
> - Pandas.Multiindex.labels deprecated
> - Pandas.Multiinex not expanded correctly
> - Cannot read rows with exponents
> - numpy.float is deprecated
> - Cells without coordinate attributes not always correctly handled
> - Improved handling of borders for differential styles
> - Support subclasses of datetime objects
> - Improved handling of cells without coordinates
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-openpyxl_3.0.5.bb => python3-openpyxl_3.0.6.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.5.bb => python3-openpyxl_3.0.6.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
> rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb
> index 0aa9fb020..d4781eeff 100644
> --- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "526b7149538575d58e55df1bd37807c1"
> -SRC_URI[sha256sum] = "18e11f9a650128a12580a58e3daba14e00a11d9e907c554a17ea016bf1a2c71b"
> +SRC_URI[sha256sum] = "b229112b46e158b910a5d1b270b212c42773d39cab24e8db527f775b82afc041"
>   
>   RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
>
> 
>

--------------005F970A16A74C4DBEC5B3D5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-19 12:37 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210119173746.24694-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Borders in differential styles are incorrect
- Error when opening some pivot tables
- Resave breaks the border format in conditional formatting rules
- Read-only workbook not closed properly if generator interrupted
- Pandas.Multiindex.labels deprecated
- Pandas.Multiinex not expanded correctly
- Cannot read rows with exponents
- numpy.float is deprecated
- Cells without coordinate attributes not always correctly handled
- Improved handling of borders for differential styles
- Support subclasses of datetime objects
- Improved handling of cells without coordinates

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210119173746.24694-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-openpyxl_3.0.5.bb =&gt; python3-openpyxl_3.0.6.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.5.bb =&gt; python3-openpyxl_3.0.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb
index 0aa9fb020..d4781eeff 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148inheritpypisetuptools3-SRC_URI[md5sum]=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;</a>526b7149538575d58e55df1bd37807c1&quot;
-SRC_URI[sha256sum] = &quot;18e11f9a650128a12580a58e3daba14e00a11d9e907c554a17ea016bf1a2c71b&quot;
+SRC_URI[sha256sum] = &quot;b229112b46e158b910a5d1b270b212c42773d39cab24e8db527f775b82afc041&quot;
 
 RDEPENDS_${PN} += &quot;${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------005F970A16A74C4DBEC5B3D5--
