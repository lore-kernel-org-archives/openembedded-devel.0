Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.80])
 by mx.groups.io with SMTP id smtpd.web11.25381.1598552250385544708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=U7rddZqN;
 spf=pass (domain: windriver.com, ip: 40.107.93.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7na46/h7sqrlpkfEHO6HeQiA6TK6W6Obmd9fAt2lIr+4lMt0Vl8MmM5iAqugR5nXY+fp+9REJ4U7oGfkNFUAHQFRf3Ewmt9Uxy7jIYb2DQCW7RnnB84T4t5u7C3yRzH/E8U32tcibiKbmqWO/PuDEcEfsU3MxPJCjv0ohbNwENU51sgIuJiAigUozQ2zCE9r0ibFn5Xjob1hSpWbZG+mp/KHTpuR92y/Z+HsxRINLa3jRDt7xNcmmFrXvfG7HvG55hbFsxtEUFGSLYfPyrPGZKC8COfRKLFZuKZ/f8Oes9wc90RfOAOXbs2gouNXqKg/vYGbXyh/qeIuZ96Kswjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfYVJYnlKhHFbhd/z7wJThnNA3R0Bpr7gLYw3dhYC6Q=;
 b=a/HsXU/6dec+hhhra/GHZrABLu9aFHDOgk9XTUAmJpAd5ob7TfGfws4MtHFuyhu6WC8BJz2bODCCJVevDvfaXXqGFIap20Noc5/54hffwGcig+TN+Jw64yP/SHc+vh0ATcqeAkjArq4+qGH8D13jiDyak+dG3uKc22gQmAJ0sq0mWLQIadfZ/skVNGftrVN5MnXi0cDPwRxj5MiCYuN+eh5WBd25o4W96p6a4nnfGePFpcSa79T/kMfBWlfoJy498WW2BFYAc+O2XFsM0ctx+aO1Km9ysHDuWi1gSgjb9xdrX15rBn4QlptCtHTaQXF9aDzwv4HEnMLyKWB95G9JNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfYVJYnlKhHFbhd/z7wJThnNA3R0Bpr7gLYw3dhYC6Q=;
 b=U7rddZqNTTEJKxuIXqtqngptigkbZxNiT7fl18ZXdsVy2lpFPp2ZsBbNQajbChOrm0h4VPgMZj09w1BIHyPDm3g/rpwe/opPIEgkPrbupVgfDD1WauRdNJEL3H3zpFydVOtwFuQEJ+l6A1tFsfKSUyP0j6PaxnKDscu8BanD53U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 27 Aug
 2020 18:17:28 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:17:28 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-openpyxl: Upgrade 3.0.4 -> 3.0.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200825132633.875-1-leon.anavi@konsulko.com>
 <20200825132633.875-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5afbefed-f52d-3886-76bd-8d18b75092bf@windriver.com>
Date: Thu, 27 Aug 2020 14:17:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200825132633.875-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 18:17:27 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d5a4391-d68f-436c-3acb-08d84ab574da
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB295245F46D9D2188CA39CA029F550@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IBTnLTLZ20gfyhrpWdyTTURcoSFV0QSsFUAjyyC8qKlwJAoFGbbAzqUcfK6kdHDxmz7zXMzL7C2415x4lGsLxb2bccvG8dmhm3VZEEkbpuVoAxbrShXKrmL5tDaHcVXL+qiDOMsm34CK/7zIqTDVJlZ2id2xsCzP3Ymxr0K3zv9G3Q0ds8j5K9jDfoLVtQX4ZCN7k+7mchtNjsV1HD5Wnue+IgQX5AS19KLHA4p3z8EK6Mkz+0Zf0fyWoSwUCcJr5S8MklQqhUb9pjsf4Cew0kiJCCMkTraizRlkqUS7YAjpyee5sGwpq6FXZPXZ64nQPRWtm0yn8Zf+SVVMAjUOaOw0J2sR2KDEpbtjlhP/nsIIsCIZYHU9ycho2GjT5vlQ+CYv1bg+ST4e3hT6cg6lzlqzVWtehrX4v4pYzkFkMIRt+Dw/X/rUhGFo8qXlMLuSTCyT5fWGm5620r9ScCesBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39850400004)(53546011)(26005)(316002)(52116002)(66556008)(86362001)(66946007)(16576012)(166002)(66476007)(33964004)(8936002)(8676002)(966005)(31686004)(31696002)(956004)(478600001)(44832011)(36756003)(5660300002)(6486002)(186003)(2616005)(2906002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mrYDbnaZbm1sg+3QvwDZx8ngyj985kb/3MWezRxZsCTUrzAvE21ZqlUJrCmVY6UQHukFeZaqswACFyOF/oM4FWS4kSpNqCeO9eR/vGKYdgtrMPmDo0Ju0ei86QazNnzJaHBvZS7tQ4bJb0I8RATg157NdZmBb+Is28gaA7EpJJ0xU/pSypAo497g/hgFrzYbcMurqxI3ColLueuaMoha9zxVcSPpfmEq9qtzrRu7obJdiPj1kdSiDiXMiQ0BnqnuuRH2KfDdqzcBdY/lbfMrYvi6sbU5oPkrGjaqadBx63SwrTTvJz4j5OJV5enXDZENF7I7fWL7q1lLLyRPkb4hRWiOVzJxmfKtYUseHLsjE1OUTVtv2De2mUQZ+QWJCdEhJGCFFbxa0ev56R+mcw2nfA3YsJMUAQWrBhn88+JlyJa6nu8MbFczIppHRcMwD3IYilJ3glLiN06ZKYPTA7F1PhVidyfxe7q9daNJQ7IyANwiDoxVbMoWGSjNYbMDxeJhQTurjTGdvMCeJyOQqDw6EVA/WZEoOXS1BF2JGQ52YQKPlNiRfOmr8ECSJJDjS7xeA2PNNeHmWKXNJsHp5vmw11ELI7YSQffdcSsGzX1z6Cuar4bMeXuZAJCUiXOCkzAmC99Xw2Pq9zmqWQeyiRMAJw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5a4391-d68f-436c-3acb-08d84ab574da
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:17:28.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSeMTh/7NoNZGP/X0odmhu1XDJRBWaO9wWzGrJehPIPuliu25QmRUg6FX+K8u7IlDUT18PAZ/adwEQEdQrXwCUsKANEde83N/6/kMj0cADE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------D3BB62572462D172DFBC3891"
Content-Language: en-US

--------------D3BB62572462D172DFBC3891
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/25/20 9:26 AM, Leon Anavi wrote:
> Upgrade to release 3.0.5 with the following bugfixes:
>
> - Incorrectly consider currency format as datetime
> - Cannot copy worksheets with merged cells
> - Empty worksheets do not return generators when looping
> - Hyperlinks duplicated on multiple saves
> - Incorrectly literal format as datetime
> - Links set to range of cells not preserved
> - Exception when opening workbook with chartsheets and tables
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-openpyxl_3.0.4.bb => python3-openpyxl_3.0.5.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.4.bb => python3-openpyxl_3.0.5.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
> rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
> index d0946e49a..0aa9fb020 100644
> --- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "8491219f6bd83ca6ad8334bf77435cf5"
> -SRC_URI[sha256sum] = "d88dd1480668019684c66cfff3e52a5de4ed41e9df5dd52e008cbf27af0dbf87"
> +SRC_URI[md5sum] = "526b7149538575d58e55df1bd37807c1"
> +SRC_URI[sha256sum] = "18e11f9a650128a12580a58e3daba14e00a11d9e907c554a17ea016bf1a2c71b"
>   
>   RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
>
> 

--------------D3BB62572462D172DFBC3891
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/25/20 9:26 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200825132633.875-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.5 with the following bugfixes:

- Incorrectly consider currency format as datetime
- Cannot copy worksheets with merged cells
- Empty worksheets do not return generators when looping
- Hyperlinks duplicated on multiple saves
- Incorrectly literal format as datetime
- Links set to range of cells not preserved
- Exception when opening workbook with chartsheets and tables

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200825132633.875-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-openpyxl_3.0.4.bb =&gt; python3-openpyxl_3.0.5.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.4.bb =&gt; python3-openpyxl_3.0.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
index d0946e49a..0aa9fb020 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148inheritpypisetuptools3-SRC_URI[md5sum]=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;</a>8491219f6bd83ca6ad8334bf77435cf5&quot;
-SRC_URI[sha256sum] = &quot;d88dd1480668019684c66cfff3e52a5de4ed41e9df5dd52e008cbf27af0dbf87&quot;
+SRC_URI[md5sum] = &quot;526b7149538575d58e55df1bd37807c1&quot;
+SRC_URI[sha256sum] = &quot;18e11f9a650128a12580a58e3daba14e00a11d9e907c554a17ea016bf1a2c71b&quot;
 
 RDEPENDS_${PN} += &quot;${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D3BB62572462D172DFBC3891--
