Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.53])
 by mx.groups.io with SMTP id smtpd.web12.12491.1598359276809465928
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aGqoi3in;
 spf=pass (domain: windriver.com, ip: 40.107.223.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiGU1s6psRoojKDZG/H30D7XA5xJ2Fla7G12lwNy+0dH+2/Izw+lEiF3mL5tEM77UEbYBu0bko3P/ulVhloVq7carLA3/VBFPEZSzR1m4o92q6FFh36EUq2rw1AuZzizjLXLpzOTQs/Y/zQx2MnG6+J3g4TiGbNwb8OjMMth3zAgyTApw9phOCUjq0YuiKwRTUc7iqYhwbmUsphP0RfKMvv44TXErhgFlfBjRUAIzc4uphL7V4IbOOsqQb5V2RLB08Em5lEpjTNGBVYLo5PGUqTXxLWiX2bxdZdwYbEoMUkTNs/7688shoG34sbvBoF7Sk/lqTpeNCQST8wPsGmzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsH3JLKxCnR02Gm7e6OiNd8boCLOiaGKKMo4crJMVKw=;
 b=EieOIX+ea+THEv29l92T7XenQB8GcCNo2Sl37eve6kZIMQxQpU3PpTrVKVZ/hH+NOm/IcHL7isxiWyKVLh/J/j55fg9oKHk7N7C3dV4Nx7cDJx4UgYgWl8ZIJRowXaAmOKGPO5C+0T64kEBKCB9eM7wzlgSGXXNVoCqy0l1hbf6Zj+xxhh0x4IFg+7bSP8y7W8dEdF8ESFFsYe0JxpHHvKGvnY9qH5SJZE8GpbAVbPy68rEMVRWtUFO8kUejytTEusRX4W9KhyDDo2r3cXqYa/6VGQw79RHpATlV6afxEbv3/ai/hNQguY+MXCOWMtg5bolUec/EP1uyynw/jCZVLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsH3JLKxCnR02Gm7e6OiNd8boCLOiaGKKMo4crJMVKw=;
 b=aGqoi3inlzMjrs/YjNC3wxZv/JsS05QTXDhaRqdsRH3P337eMbAle4e55LkW9bCUPPw3q/HcNALk5NCQFCvBiH1bjjJklVH8CCmNKHuU165NW8PNZqUSILhDFuVwRn64zPuF8m/f3Bs5SPTC2xnbBUNQum+cFdQ8F6NnZynbCJ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:41:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:41:15 +0000
Subject: Re: [oe] [meta-python][PATCH 04/11] python3-tabulate: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821234504.719-1-leon.anavi@konsulko.com>
 <20200821234504.719-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <833f6188-d074-ecc3-55e1-431291bb4aa6@windriver.com>
Date: Tue, 25 Aug 2020 08:41:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200821234504.719-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::41)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Tue, 25 Aug 2020 12:41:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b36dac39-90ab-4ce8-ee6e-08d848f4282c
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4260C52D4BC22714CAFB60FE9F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1EbLnmaeeKId8q9pAWFalZdXIGQIWvH2u9nCnlMfzB4qaN8mun+KBiVgrVzqA1G/lGKgyomMFsRZS9pOXVL+3pYjc3/oGTm+xLUKYrHsGSD1dF89lrn3LrWrsTeIowx1KbVoIQzt4NuLFnzpgrcMBqzws3W6KtsjfVHjvT5X4VfkwGrFFKjvf3bucS73lt6mtrtEBBy8xWVJ3ppjnYj6+bBZd1tAdI1toZEQChoXl92/cGyQ+8V186l5GBfu7Dsnrmt2fa3TXDrJRGgb+1X3vU0LBHwEcrF8Ty6KLvF6CCQB9g3/yGBKziWYhJ4wwaQf/XPNiiQYbuW62TW4Lf3ksIBgTCA0TJqp59MTsISl5Jo/EF5J+Y8HntovUe9R162FWVh//EbeFkT7ISWWHXZtoFvD9jLJ+wCRu4qtySL16zZty4Rd+tMgtX8bPfQYfpN4mAPB9zpw0LLOv9L0YH4uIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(186003)(66556008)(66476007)(52116002)(66946007)(6486002)(966005)(8676002)(36756003)(33964004)(316002)(5660300002)(16576012)(31686004)(31696002)(26005)(6666004)(86362001)(53546011)(2616005)(956004)(44832011)(166002)(478600001)(83380400001)(2906002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LIbXowvGPlMjpHNopGTocOBs2/B2F55rRQYpbeLU/hak3UCF+u9MMRAm6KtO5uyXyN8TgJlEFTtTI+ahLcQQhNeWCUBMRDIpt05iXlK66xvbi8Gpis5G0CwmrcO4YE5uAX3cFdLXE94fcn77eqk7BpeZPu+Q66rx/WL7rImyGwBNJjvw2VxInKEY0Sjpscjxdr3I5qWUJsOdR3hztvjzKSs076YwJObktv3Bp5/5JJKjHzwTsagJXPAuFAST7VDY/ijXUa9pxsbmddggC/PjmJDPKMeYqSSQTKhKpF9yTNZBrNdp07FhIfokmLeKC++0zoFtfMtvp0ps24eOVkHDRdW4fSzN4hIAg07z2ZxD3DGMmV82puTZmZjDaZfUiCU4K+SNXsmfqIOwA3iWlxMLVdw7HH2J65t+WvrGzsecI9Cv5aPQPZtxsCtGSpb43SlW7PK6li6+Ujvv5dE6kVLch0jIHz6MtVnqYg1+R7/U7Oa9rrMhSfh1PPcckovRG77eTL+pQuXXzSR5UykpqOCCizrJELfmzwNCaPIk86zBRuiDjGjUuiZx7MSQgIhCXDzXep2vrj919Xrdm1R1TjgdnPe1FoT8ZLtzWXsqnQJy+hCEfDSsovGM6TMmbzXbv5Jn5vShvIV/v2RoHUOob+MNbw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b36dac39-90ab-4ce8-ee6e-08d848f4282c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:41:15.7987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ng4+Uxd9WL9PvuBcjNNN96n33LdHPnFLOsO0+beYeaZ+rmkkXyVTXHARE2ZBZqz7ayNKS8v/UrRx/bEpkJxJ1LXrxixhK+RcT9EEqCCuG20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------1291FEF250038820C1D112B1"
Content-Language: en-US

--------------1291FEF250038820C1D112B1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/20 7:44 PM, Leon Anavi wrote:
> Add recipe for tabulate, a pretty-print tabular data. Changelog
> for release 0.8.7:
>
> - Bug fixes. New format: `pretty`. HTML escaping.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-tabulate_0.8.7.bb    | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
> new file mode 100644
> index 000000000..def35ff44
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Pretty-print tabular data"
> +HOMEPAGE = "https://github.com/astanin/python-tabulate"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fad5a39bdfe452b13775adda41023ba7"
> +
> +SRC_URI[md5sum] = "a766c6eecfe3765821909c4ddf082b3b"
> +SRC_URI[sha256sum] = "db2723a20d04bcda8522165c73eea7c300eda74e0ce852d9022e0159d7895007"
> +
> +inherit pypi setuptools3
>
> 

--------------1291FEF250038820C1D112B1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 7:44 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200821234504.719-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add recipe for tabulate, a pretty-print tabular data. Changelog
for release 0.8.7:

- Bug fixes. New format: `pretty`. HTML escaping.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200821234504.719-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-tabulate_0.8.7.bb    | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
new file mode 100644
index 000000000..def35ff44
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
@@ -0,0 +1,9 @@
+SUMMARY = &quot;Pretty-print tabular data&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/astanin/python-tabulate">&quot;https://github.com/astanin/python-tabulate&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fad5a39bdfe452b13775adda41023ba7">&quot;file://LICENSE;md5=fad5a39bdfe452b13775adda41023ba7&quot;</a>
+
+SRC_URI[md5sum] = &quot;a766c6eecfe3765821909c4ddf082b3b&quot;
+SRC_URI[sha256sum] = &quot;db2723a20d04bcda8522165c73eea7c300eda74e0ce852d9022e0159d7895007&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1291FEF250038820C1D112B1--
