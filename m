Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.56])
 by mx.groups.io with SMTP id smtpd.web12.5278.1606918234417469772
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JYqVepX+;
 spf=pass (domain: windriver.com, ip: 40.107.69.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyOjGgGOAWkvhbvu8b0ryMB1YBu7AB4VzJtu3IzqT11EfMxUadp7W0VBerTbToRAJi6WaZuz/xxP+Xss7HcAP0jbC1dmEOJ04p/be72SKoYyATJ+Y0tNsfqKocXiyMvBbg3JzdJaYBIiBo9VUWeLw0hLgCPRfeZ/PhI/DqtAY0xVcnm+cFZ8OmCM/ZyjDMrQnmq3q9Ll/T8BBnmSqbtvN6OdGsJVBeOHCmjWxGg0w9vO33tcwLT9atAqfDCIAdB023U+UkEqbnPZyfyO5nph5z2O5ujbCADA7fFh+yekgVl0FoP9A2kH+NPta4IpIMCiAyEvx5N+ueC4QMyBMwR3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SS3UDocNtIu4pJSCLIeTZ3maggc7mXKGaKV/cRYNyLc=;
 b=Ctr4Kx5iqZXMIQ9wjNwMG/XkFrkKLpbEB9dBe35CkoTCR6UgMc4Yv2xu0ImiateW0KcFgHdcKxZiXfTkzPTZlInT641kjJ6Lo4hc7Y8JmjEA8wRWgThpWfZnpejxa0TnmLXY41PygOS6676YhC9nKCCsz6dTB2QCetONJwJ9MZ9cd03aCGzHRJvMuEcZOQ5j8Iu1stYhAElQO2yg6yzq/0L2yfggAGjUeWlYU/liHnVWK5NuyFruO4PsfJysGPJddZOAh8kx52ei2sSY1suikg/otMuySPb41uGzdOkAZ/0+9ZYsV9NSoq88E6bHYvI8cE7PiS+hfi0afYPgyu1GYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SS3UDocNtIu4pJSCLIeTZ3maggc7mXKGaKV/cRYNyLc=;
 b=JYqVepX+YpzmSVQoPyyMWSXt6TZJZp6bk0lLWHvZxzZIpa6+A07KoNRPnZVwc5vHOxcIB92lJEBYpfuwcKn/AEpH8V1jSH2mGSuUvBGVCLYoUDx5ehCSq1Sy3pMtUIjGrP0MrxKtLP8du29tolK7NXhfb+7PfXwYefGI6+/1NzA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:10:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:10:33 +0000
Subject: Re: [oe] [meta-python][PATCH 09/16] python3-packaging: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <391136f8c90ac16b0d40936f8264427d9def84d7.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4de38569-1315-e441-18dd-cda43c7d1b6f@windriver.com>
Date: Wed, 2 Dec 2020 09:10:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <391136f8c90ac16b0d40936f8264427d9def84d7.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:10:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07b03bde-5e6a-4272-d5a8-08d896cc0859
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48647A78652572EAC59D665F9FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KTPC8ChzIjwL3urvIKdZVCDKslMoaMP1GNd3n6vD4dasKpK+HWGeRJYlzkJ62KJK7RbOPqSX+raL9bpCmC8nIw8LTHlVMdFQGn70uczKQIp+fZvlrOFHN8U23km2avgscAbGgx5XT5AQDe4STi27a15W5XkphMF0prZvq8fvDFtFeKllrhsjaSbISF40lMdDbfScsprKpgwZ3+7ZYtQCxnfNVZtO9OStU9/VHtJRGXYu9jDz2FSfoJ2ndZ62VA6dPqDVLUNo81kk0h9yc9JRJguQqlNUEhkB6ANZJ/gjebuetdjiqm1weMTR+qzPp4YK/aK8+MOV6huRW3Mgu5uH/iYd5gi54Et20auiONzSFqRfy4PB/SF9wQk8siDjHfN2XuZhR425Ob2P2VLqExiCPn98sVOPpQ9425+P0rGM0SmvkXuQNh8X1N6L1hZj4jTKdrog0bEJazbu/C4sWYOAariD81EnA0fkWMFzBBTi/jM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MWV3SEVBcE1GYkZQbTFVeko2cnZaUlFjTnJJRW1IZVkwV1QrTjIzMjJuVFJB?=
 =?utf-8?B?T0Vqa05tQjdkRTdzbXVHcW82YTVZTzhIY042bHN3R3pDbWM0dUIwYk1mNWgz?=
 =?utf-8?B?a1doSkI3aUJTWCtYVy9mRjZTRTBGMGlFZVIvQ1hzMVFjaHJrbENuWUZCZGZV?=
 =?utf-8?B?bGFmdk9jZ1NkN08vdW94N1lGNmlReGdQbEJwVUM2djA4YXErVUYyczg2YzY0?=
 =?utf-8?B?OUhIeTV6OUVBMDRaLy81N0lvelFXb1BTUzJOMHkyVFBmb3BRVGRsREFaTUpS?=
 =?utf-8?B?YkF3OE9jTE12N2RwUHdyT21icHh6dnU0Q09BNUVRaENGMUdkYlkvajlVdjB5?=
 =?utf-8?B?T3JJMkZiQ01Xa3kzV0lnRnkwZlZKVEhzMlQwOHJhRUZ0V0duMXJEN0pWS1Ns?=
 =?utf-8?B?WmlPLzRjTEluUDlHczRjUGVmWndINE85ZGxwYnAxTVNYaWs1Z0JnNjRHRU5E?=
 =?utf-8?B?SHp3VDRlNG1BMHhMZHUwTlQ3LzN3Y092MmRsektVQXFXdnFxcERVMzlMYXhK?=
 =?utf-8?B?Sk9mdG1hdzgyaC9IbDVQSjBLZ1dpajVNKytBbEJ3bFEzR2U5V3B0aEdaODJZ?=
 =?utf-8?B?ZEtDcXVLZ1BuSnZnSHlRSUQ4Q0NLSCtSWGU5cHZTVTdSU0orVmVRSXo2cDlO?=
 =?utf-8?B?aHJqTXQ3Q1pET3R1TUgrL2ovcFFwaFJRYkdyUytucGdmQWZTZHRHVWtNMjgw?=
 =?utf-8?B?STROYWxhODlaRWpyem05WWR1ZkRnUC9FQ2ZVSlVuSEl3TDhVMUNxaG9vMERh?=
 =?utf-8?B?QjBtTy9UOTMvc0toTDFxenpOZGVJS2hDMFQ0NmkzOER0T0VhRXAyVHVVV1hs?=
 =?utf-8?B?b05JcjRsMm5qNnc5Tyt1UDJkaUE2ZFZNVjV2c0tyN0QvU2EwNGwzZUtuV0JK?=
 =?utf-8?B?NExkNmVKN3NKSjV5V1V6SzRLVkhlNWNweU8zUDl1OWNyVmdjRTR4YjRyQzNR?=
 =?utf-8?B?Ulc4SWZTVDlSalFzTmEza3RBQzMzQko0KzNPQmxmeWYwei9XMnVVdjU2MmZG?=
 =?utf-8?B?Y2V6Q25sQ085Q2Zmdkh2RFVLSzNzdjQrc0RpbURDVXJUNmFSUktJd0RHN2ho?=
 =?utf-8?B?a1JxQzAxZkNUQ3N1c1MxcGZuVTN2aFlycGJWMk84ck55WUViRno3N2wraHlO?=
 =?utf-8?B?bzBCODJGeFFSZVJWYzVNc3JDNVJFYTJXTlJ3WVVzVEF3c3dRbStXY2hZTExW?=
 =?utf-8?B?SFUzdG9pNThVbFJjbG5JUG44ZHZWOVhHVWh0QnVWMUhPR0V4RzRxVGxCdHBZ?=
 =?utf-8?B?bnQ0SERqQkhESlhUUmk5QXN0LzlSOFA3aUp5S0QxRUNiQ081V3Z0bFN2MW9w?=
 =?utf-8?Q?dvbS/IQPo3DfxgvgOw6Aj57lRDRlGZ+NfE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b03bde-5e6a-4272-d5a8-08d896cc0859
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:10:33.3783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rACHB5sEKDV6wRAc9iqTnXAhbn15dflTGpTUkShXAXWu/D4jZJYCRyStQawLfcTLCSIiXtiiiSsqspH55VKn8mRyyn9ozTacDoG9YPym1xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------AE5B945DFB28913B989D82BE"
Content-Language: en-US

--------------AE5B945DFB28913B989D82BE
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
>   .../python/python3-packaging_20.4.bb               | 14 --------------
>   1 file changed, 14 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-packaging_20.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
> deleted file mode 100644
> index c75707e69c..0000000000
> --- a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION = "Core utilities for Python packages"
> -HOMEPAGE = "https://github.com/pypa/packaging"
> -LICENSE = "Apache-2.0 & BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
> -
> -SRC_URI[md5sum] = "3208229da731c5d8e29d4d8941e75005"
> -SRC_URI[sha256sum] = "4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND = "native"
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> -RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
> --
> 2.25.0
>
>
> 
>

--------------AE5B945DFB28913B989D82BE
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
    <blockquote type="cite" cite="mid:391136f8c90ac16b0d40936f8264427d9def84d7.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:391136f8c90ac16b0d40936f8264427d9def84d7.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-packaging_20.4.bb               | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-packaging_20.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
deleted file mode 100644
index c75707e69c..0000000000
--- a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = &quot;Core utilities for Python packages&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pypa/packaging">&quot;https://github.com/pypa/packaging&quot;</a>
-LICENSE = &quot;Apache-2.0 &amp; BSD&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=faadaedca9251a90b205c9167578ce91">&quot;file://LICENSE;md5=faadaedca9251a90b205c9167578ce91&quot;</a>
-
-SRC_URI[md5sum] = &quot;3208229da731c5d8e29d4d8941e75005&quot;
-SRC_URI[sha256sum] = &quot;4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8&quot;
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = &quot;native&quot;
-
-DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
-RDEPENDS_${PN} += &quot;${PYTHON_PN}-six ${PYTHON_PN}-pyparsing&quot;
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

--------------AE5B945DFB28913B989D82BE--
