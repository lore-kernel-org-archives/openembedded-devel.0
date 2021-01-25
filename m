Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.61])
 by mx.groups.io with SMTP id smtpd.web08.35700.1611578308165973271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=f7cWK0/R;
 spf=pass (domain: windriver.com, ip: 40.107.220.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btma6KioEQjX1jwUyejbRI91rbZ+6m2pQZMItbC+jw9lcUGvS1kEByA6VRYXjim+rYjd90eH3J+sYICoMlC0FMcNe6Qw3hyx6qCUnHRV43VfkF56KsH0ymCz+9FL7mHn0IqchPwJRumsyp+v/chqCdWyotiYn5UvbTVQBGgG/XYUxoCD9ffhmsysLbcTGhFwOz4XXBi4leTOVRvt2q4QUH46l7JvDMWdJydT56Jc+mgsJ3RWRMIM/SwPsU0voVIiqSVM0pRW0RurmMfvulbJz7qzFV7Si5kERSX0iNJw23un0aOWHSKyiyde2hCVgLTuCEzmnELhfBCvfhcAf31v/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8qPselqnx3NrdIkGroZaRYTYXN+xkDPFctMRqbX7tY=;
 b=Y7rxoCZZndbl1s7oudw+lqU29llrBhs+g0V71M/apaNDR7DgCkIKKhuBO2aGBtNgwjTEjK54cXE1oPKTMrV2Jqlsn1pxB9ISNFakJvduSF4bSV2DYZaQoGOv+ogebmXwXnBLXP58pMJCBLr51owZB6eyNA1Lu8IKQUTCpjyOh8+kGCNxlpe2HHTjf8EZ7MsC7bk/3EiyEa0m/GVXXacManb0/SOHSUanO84dcVe5JFuX2YvGUeVs6g+ApZlXEoPz+XRw9MyC4Vno2PP0gRrxxqQUQRyjkayeOCSnPLrLL9ZlaRMesg7QGJQKmXzrzwjHwLm7RdSOmeyHo75ACrxi1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8qPselqnx3NrdIkGroZaRYTYXN+xkDPFctMRqbX7tY=;
 b=f7cWK0/RTdqjUacI3RzABENZHMZCVZkpKIz6UbRp7M73FsA5YQJUSUsX224gm/7ffOBngpyge6ynmM3LLE3WHgCvZXgJoMyAeOZofMcPGMsO3iPe+GlsEw8el41UqYKBCarmnDSpxQ3RzD9TdqcJWwcKIAYz/agd4qhRtdxeMiY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:38:27 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:38:27 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pyusb: Upgrade 1.1.0 -> 1.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
 <20210120111027.12947-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <34b9dde7-2632-5786-6f6e-3aa2f4bead95@windriver.com>
Date: Mon, 25 Jan 2021 07:38:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210120111027.12947-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:610:b1::11) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH0PR13CA0006.namprd13.prod.outlook.com (2603:10b6:610:b1::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend Transport; Mon, 25 Jan 2021 12:38:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9e38676-2f2c-4de1-b8b0-08d8c12e1ccc
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3984667830E11FFF660BADD99FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VyPWG/OQu+Nb/yc1T5Exsk1dmpO005bJLvQVF1ScNe4T1/Wh+rhNYdK9+Rth6rclgqURez/6EpsZptxBvz6Mqta7d+F9sa2Q0JHfiwVS71dp7N7B7SbHubvR4Ob4R/ojuyWN+MNU5lKLPqyeMOxEsb7ZfzVxtGlTVArVW44xhJewIXqqAEjKelBxh6iptiPlYdGx8bSGZwyCOJ1Q1S+3MJOrzJYS7rDp6UovV7UFjUnIgzYHIUHhiXMaGY6aR9v73VVI0ZmDW/keAwYXVbXtq1AbWc/6d3GB1brS+WZJoa/kQ0Z7DkgDF0UWNh8+ty9r0mhL2CDY6Nf8qiAkkSw7nxhBV1uCFuQ4kFHCTenAF1XiJFMo4VK4UtM3tIjxTZn21AIfMyLDfH8LvwoD3kdC8+cKYqtGUXwCbSG3WgPJZdkaFftaQ40YYPj7Jus0RuaItdKr58MW8bKU6zNW+p6DFze5dCcbPAhzmJqolUJRAxnylmLGEspnhPcr13twLBzSqYgptn0JTSiFgQcbq7b/oX4LKdcieeTouOAEMPlsQzLQ5xURa1HESXLYzfPObNSY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39840400004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(478600001)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(36756003)(8676002)(52116002)(2906002)(316002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TmNOWks5b1d3VlhpQTc5LzFPSTRQbmRuTG14aFdTMjV0TTNaYnhaRkJGSHJP?=
 =?utf-8?B?SEpqaU1zditiNEdPcVNGdVZGV09wS0pwTDIyZ2ZSVWJxUlFaUitNVVA5YVAw?=
 =?utf-8?B?ZWhOaFhJMk1qYUdRelErUURlc1lOdWtOeFNZUkIrU3M3NzB3SWFJVWJQRCtE?=
 =?utf-8?B?aEc3YjdDOXd0NTh0VWdPSElmUUduMXpORkQvT01qaEVwdllJYkpEYUhYY3Rm?=
 =?utf-8?B?SzlkRStwWXBLYXFnOHlQUzJtNFN4Sjd0MW1Fc0Rua0RVNHBZYjJyM3JFbWx4?=
 =?utf-8?B?TVc5NEladVFUTEJhN2RFc0VuSjZ5a2l0YnB4VnpCMitIL0wvdXptY3BSdW9y?=
 =?utf-8?B?V0VOVjVxcEtGOTJtWTVIOTNYOUN5Ty9NTHJ5cUxEZ29RMkNSTWgxSGkyeWt4?=
 =?utf-8?B?elRRNURkTW04d2QrZ1lXcHd2OFBPdi9zTVo2ZTBlM3JJWHQwS0NuckdCdU82?=
 =?utf-8?B?b0o0ZHpubGlYMnpNa25KYTZkL1pDSk5ucG0rTzByR0dpL2dxWWYzbmI3RWZ3?=
 =?utf-8?B?N0VmV2pkRFl1NGY0MmwzcTBqdERwL2wvY2xsUFdWL0t4ZlMvR0VkNTRBRHor?=
 =?utf-8?B?MVgyZ3F4dENiUkNPYm1CQXcvYXR5ejdqUnNza0p3c0w5OXg4S2ZHN1g3eFZD?=
 =?utf-8?B?UnVVSXI3ZnpyaWdXbktoNGZWeXNsSEphVVp0QWVZeDF3cDlsMStRY3BzTGhN?=
 =?utf-8?B?VmQ0Zjl1c2dPM1daOFdqZERGYjJXVkFnSUZlbStid3k1RHJBQm1WVG9jd1Mw?=
 =?utf-8?B?SVJ2VFJzUHh2V0RXaTQ0eFhWN05renVPZG52cmpOSWpvdUt0R0dKSllIMDdH?=
 =?utf-8?B?ZDFaZ215RlJWaEYwVE9NeU55K2YxSHEwZ1kzcjF2K0xwb21JZWIzTmlTZjhG?=
 =?utf-8?B?REdCSzhyZHFaN2c4UWNxemczQU5tekZ4cnpEVEZ5YjdYRi9hcmtBdTdacmpC?=
 =?utf-8?B?U2pROFptT21pRmJzTTc5VFE3U3BBeGlLSWtSL0p5QzBZZU1TaUxuYWQ4NVIr?=
 =?utf-8?B?aHN0WjFOT0dCRHlERzZzZ0lvb0dBS1E5UkFxL0poN2k0by9xaDJLRmJsYXZl?=
 =?utf-8?B?R21lN05wOGVzVDY1SDVvREU5alhHU1JLY1IrVTdYZ1JuYjRJZTNWTXdwbEdh?=
 =?utf-8?B?TVBveVBSUTVtaVJjdjBGeVR2NkM4WVdHbXoyUGl3WVRPYjVNVWxnai9MbUQ3?=
 =?utf-8?B?UDV1SllBRWg2bHJkWEFqNzNNcWRmWGJDbmNPaVQxY3IwRXM4RVR0SjUyTlUw?=
 =?utf-8?B?cnJEamY2KzZQN29oNG9NZzRYQWJVTS96SmErMTZYRENkQnBKUGJWSHZLNi91?=
 =?utf-8?Q?y2G4DP6C0Q8gChLXz1+4nhZyWu13LuCvMg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e38676-2f2c-4de1-b8b0-08d8c12e1ccc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:38:27.0169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrpOhKgGjIIBj4R1Uma4u501QHm+YXNybgZtwlemu9fWKNRhkYAqVm7+8tmNRumkwNlU9jLDeOTU0uCi6r5SQSPRD9d2TdNe9BSPOWct4p4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------972B01D4C6835FE1CA937431"
Content-Language: en-US

--------------972B01D4C6835FE1CA937431
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-20 6:10 a.m., Leon Anavi wrote:
> - Patch release that fixes a couple of bugs. Most notably it fixes
>    compatibility with Python 3.9.
> - As of PyUSB 1.1.1 changes that break under Python 2.7 and 3.5
>    (both of which have reached end of life) are no longer considered
>    regressions.
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyusb_1.1.0.bb => python3-pyusb_1.1.1.bb}      | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyusb_1.1.0.bb => python3-pyusb_1.1.1.bb} (53%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
> similarity index 53%
> rename from meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
> index 6b48d6a25..a8c7031b6 100644
> --- a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
> @@ -1,11 +1,11 @@
>   SUMMARY = "PyUSB provides USB access on the Python language"
>   HOMEPAGE = "http://pyusb.sourceforge.net/"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c52a96fd9a0cadcb9270904c8eb5416c"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e64a29fcd3c3dd356a24e235dfcb3905"
> +
>   DEPENDS += "libusb1 ${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "3b2e38e9f697d2f90d86376bd10a9505"
> -SRC_URI[sha256sum] = "d69ed64bff0e2102da11b3f49567256867853b861178689671a163d30865c298"
> +SRC_URI[sha256sum] = "7d449ad916ce58aff60b89aae0b65ac130f289c24d6a5b7b317742eccffafc38"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------972B01D4C6835FE1CA937431
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-20 6:10 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210120111027.12947-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Patch release that fixes a couple of bugs. Most notably it fixes
  compatibility with Python 3.9.
- As of PyUSB 1.1.1 changes that break under Python 2.7 and 3.5
  (both of which have reached end of life) are no longer considered
  regressions.

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210120111027.12947-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyusb_1.1.0.bb =&gt; python3-pyusb_1.1.1.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyusb_1.1.0.bb =&gt; python3-pyusb_1.1.1.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
index 6b48d6a25..a8c7031b6 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = &quot;PyUSB provides USB access on the Python language&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pyusb.sourceforge.net/">&quot;http://pyusb.sourceforge.net/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c52a96fd9a0cadcb9270904c8eb5416c">&quot;file://LICENSE;md5=c52a96fd9a0cadcb9270904c8eb5416c&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e64a29fcd3c3dd356a24e235dfcb3905">&quot;file://LICENSE;md5=e64a29fcd3c3dd356a24e235dfcb3905&quot;</a>
+
 DEPENDS += &quot;libusb1 ${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;3b2e38e9f697d2f90d86376bd10a9505&quot;
-SRC_URI[sha256sum] = &quot;d69ed64bff0e2102da11b3f49567256867853b861178689671a163d30865c298&quot;
+SRC_URI[sha256sum] = &quot;7d449ad916ce58aff60b89aae0b65ac130f289c24d6a5b7b317742eccffafc38&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------972B01D4C6835FE1CA937431--
