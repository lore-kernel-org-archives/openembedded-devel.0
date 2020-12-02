Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.77])
 by mx.groups.io with SMTP id smtpd.web12.5265.1606918190183936068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:09:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=G2UVdiEd;
 spf=pass (domain: windriver.com, ip: 40.107.69.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgmqpF6MILKsGqlFUEC93ZSbNzd65hry2gypEcereBxvkmg6le6gUv5Bbel13GI88msl6RbwnXmRhyg92qV9nrmDDPcuBHY72GUb7y5lwf22kF6VQHDTzm3Y6kMLHcTIVeg4jIvCnZQBy+era7u5i6fg7C+eDDuJ19XHrFn+Y6InD44yMjQYlSRnHatTwVd8JXlQHEy0GsMB6JX3GAf86NXD9+nUolLXfYZaZ0SJxvCEcRV5dmAazfgNKgYb/w0FZV8wf5a3YqmNT2iXDhWTmZ4b7JZlB1S0WuxYLTC1wn6iIlpAl78M945X1mmSMUwFnbBkSEV91rBH4JcMQJOjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klIuuwITQIWjM542fLZ51JONiqcaaV/6oJ3lNenn/SE=;
 b=DSD8ht7PZIkNeGTEu72y04JyspVXCHHDtEaa2cgamGZA16/BqZDxg6gd6kFF8scrhSTT9a8l0GCniHh74u8IQeOQ/9pG0mpeasz6irN0tBqqQMzNGWQMsSQpE+1W8QMiexJWAxfNvfaypMLd69BTXS2K4tVjPBjFHRlo+RG6CgINjHYF5Flpk11hiqGAji4LOv98mBM/2x934aRAncVMOPqIkQ70CJEtQZq6kkEAM+rSIkeWyegdVXjHAjUlY9s5zfxSACo90Ii3rxkOWRGiuvRl7X7yvZ/OdzgbZEwiLSC72e6IO5BJNSF2wbodPn1WXUgZCaBPNdJoSmuHwCKsSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klIuuwITQIWjM542fLZ51JONiqcaaV/6oJ3lNenn/SE=;
 b=G2UVdiEdt2s0Xr0WuKTsA3Mg0PIEJ5yldwC2A0J0tozjxOTYYyvxDcGlDXN5QBiYAFpFfRW2EwFDKz84Q/csyCoxm1FKhE2r27UgzYw6jieFBrwh/2wrKEZ+WguS5ANqZyxmBla6Z0Wuu1/RNnRR/i+nQAXo2ixO0q5qHdqzl3E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:09:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:09:49 +0000
Subject: Re: [oe] [meta-python][PATCH 05/16] python3-pathlib2: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <351382ac620a64ffe7b72110ca8f5cd65d158f8a.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7a69ea54-9bf5-f7c1-4c94-29b489e6c8ea@windriver.com>
Date: Wed, 2 Dec 2020 09:09:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <351382ac620a64ffe7b72110ca8f5cd65d158f8a.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::47) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:09:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 809382e3-22d6-4a9d-4a07-08d896cbee14
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48641A874763C438459E8BC49FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rB3PT+ma6HOYNLneUSJRgxygo+2BF1nsl6WcT+8GOFVCe1Xrvhx0IRJSc4iRseu7hPLlW9uSvuU8u0QEA2Fb6mvBS5/s3jy+prG4arfXkQ7ocsP2Mf0yRE1TwBxIGx5jTXUa6+G7gSwvz44ByuDUtIraBtbrAzPYRON+Ad/C48z5BwSVUD78ur6/jIggrgd3QxgrwCfv5iOIMZ1Cml0gqiUpqRsOM+ZTXgGZt0R8nmqgS2U4pXoqSJBO5nLIy+qpjj5SnuhHh0AETfUZrpExlWNZlBtpkCWbKDgY+eTBizEnlaYfKw7kCmAe+8a0PUW7HXkNJBudLu1l5O3Dl0Mkc4hdUPQpw8I0Ezb3dt26sS1wWGGjRNLRlX8uvTfJsv4tdHbC0zWURSO885LcplAeNFiwCirWsUoTTY6BhQ++w/Rkk86p/AcGoPqv2Wfld+6tE8/VbaVAzbgLjmuYp9lHdsNQFJO55YGQEw3ylxSp7RU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SDNyQTNwZURmL1l2SDA0dXUrSzVDWmZBcmhpT1RoYjNmeXUxejNiVXRjd21Z?=
 =?utf-8?B?aGcwdDNqWk1wTUw3TzBJRkcrVWFhdW1aTk5rV2xkVTFWRXJpbHo0L1RxZmFD?=
 =?utf-8?B?UVVteWdQWUllUjA2L1U5eWJJdEY2dVdxSitjSm8yclBkOEhpdDQ3NDlNZ3Jv?=
 =?utf-8?B?c1NrcE4wWHNWeURJWDdqUm41dXJIZzlLMEFFdVlabTZYZHpkc295b0RIRVA3?=
 =?utf-8?B?VnJkZUNVdElNVUM1Slc3MTRJNlRsNERMWWh5ZkVGODhMaTM4cEdZWEs4L0Jo?=
 =?utf-8?B?RlduSnNTVkNZZTRjdTQ4ZjBoNlU3UXVrR2RVeEs3bHp1ZWpZcE50WEdkUDJZ?=
 =?utf-8?B?S0h3NWNlTmZiY2RyUFRxSFJpaGltZ2xzcXd3U0VQZ1RDNDhjUXNBWFl3bm1p?=
 =?utf-8?B?cmpUS2dQLzZOWnoyMC9INklkdUo5YTJsczRoOHlONk9DT3VFM2VxTHVzb0F2?=
 =?utf-8?B?aXVYM0hROE05dGVLbE9LUHM0K0ZmVlBySWpYUFZaVFRQdlVpb1RGMWkrcG5X?=
 =?utf-8?B?SlNXUzkzeDNWcFM4czJmTCtqQWtkbjZnZXVmbGxTdUl4MnBvQk1xcjJBK0E5?=
 =?utf-8?B?N282NktydGRqUXliR2lSbVlqdko0M2xsbUo0T2lmMVJ0Mll2akV3L2xpV2c4?=
 =?utf-8?B?VGNqWk80dDB6RkkrcVp1QkIySDlpZDhCUXhNbWVMWkhub2R6cElmSTFreWQ0?=
 =?utf-8?B?bFk2d0I0ZDVLT1FFczlWZEliRy92QlJELytLWnBiREZnV2NpcCtoVUZ0bVFh?=
 =?utf-8?B?TW1Td0Q5dnptK0hqZFZQdU5JYVFZekU0UkZQdHd4bFRBaUc1U291U2MxUXNT?=
 =?utf-8?B?aUlaMEVDR0xFYlE5UHdvaWl2bzhweU9uUnNrbXlWd2g4RDRDS1o2NWF0OTkv?=
 =?utf-8?B?MXhLVnljTnpNSTdGK0loUUFYLzFNVVFYVXdSZStvL0hxTEN5WEtCOXJwTmhC?=
 =?utf-8?B?N0xiSzlpN0p0bXd5TmJEZGpIaE04MVdkSGdqUUVWOEpia2lpRUFlNjkrbDdo?=
 =?utf-8?B?N1FEcktndXIrOThWSmdPbXVoVnVDdDZLWlhHbFVsdFdlUndRWlpBR0VzQkxB?=
 =?utf-8?B?U2M2MW9Ic2FzT01MTE1wY1dseHBOZkxqSm95WWN4cXhoc1pHS1Z4SDJ3UmJC?=
 =?utf-8?B?Q2JHbUFkWS9jNmJEejd4cTRmZW80dW41dnIyVmJKemxITG5CczNqSnBNanNL?=
 =?utf-8?B?OG1CaHNwSHFGL0E0aUg5UG9GcThhV2tUZUZIeVJueklaQmpqYVBjREt5b3Uz?=
 =?utf-8?B?K0lZMnNsbytqV2NQVElUc1YvU0N2S1BETWpna1c0Q3VURlJlK1k3a3dON2M0?=
 =?utf-8?Q?vd03r+WR86Mu2DSpB9tZKh/OiCvy5o3ovU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809382e3-22d6-4a9d-4a07-08d896cbee14
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:09:49.1698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEFoldl1tclnHKSCSAt0Ag0Y6YgKtFFz/pc5IhXE99hqUnOqGTJMb9crDRI6pjSfJVJNpFurwj4Wu4syde1XTgCQdcxQDednbcGVVfA2pbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------29F5284206821BFC584C04A3"
Content-Language: en-US

--------------29F5284206821BFC584C04A3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pathlib2_2.3.5.bb                | 13 -------------
>   1 file changed, 13 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
> deleted file mode 100644
> index a022701ad0..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION = "Object-oriented filesystem paths"
> -HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
> -
> -SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
> -SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-ctypes"
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.0
>
>
> 
>

--------------29F5284206821BFC584C04A3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:351382ac620a64ffe7b72110ca8f5cd65d158f8a.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:351382ac620a64ffe7b72110ca8f5cd65d158f8a.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pathlib2_2.3.5.bb                | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
deleted file mode 100644
index a022701ad0..0000000000
--- a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = &quot;Object-oriented filesystem paths&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mcmtroffaes/pathlib2">&quot;https://github.com/mcmtroffaes/pathlib2&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a">&quot;file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a&quot;</a>
-
-SRC_URI[md5sum] = &quot;f2bd0a363eb0f8fa0556f35c1d9e66fb&quot;
-SRC_URI[sha256sum] = &quot;6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868&quot;
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += &quot;${PYTHON_PN}-six ${PYTHON_PN}-ctypes&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------29F5284206821BFC584C04A3--
