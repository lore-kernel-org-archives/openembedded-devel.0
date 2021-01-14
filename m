Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.46])
 by mx.groups.io with SMTP id smtpd.web12.240.1610649863265284060
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pETA9wSs;
 spf=pass (domain: windriver.com, ip: 40.107.223.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKwIYQn+LH/zEumVwiySwxhuCIHZJITmVhdxQhD81CDjIISmwpRHODmC+IXYnySxFCT2RQi8iWNqBbjPt3p3RQGP3suLZ6r1bFoAsDnWwakrnD+wEDKidfhoUbvmMCZKg0sLBSeqRhoZ71HodnIzMY+OWiG4fy7320hBOiSttXq4jMzHNg/Fv95h6ZRgylgvZP4iqXXpN+zit7x3XDU95PH//sVQEHYZ7ILt59Fs12bn+pixgJrtLi1W2oiaumzxlxBgLEbY++8okGXHtbn42GxIM4wZieOGw8RUK0JecqGsSUYPmfdHAlMcwPsZrj0QECJiKDJb5H5EXsm31sqh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoGOuXIJTycsTanlOzvF41iJ2qDmOqclsWt/smK4lfA=;
 b=HYmvLlijd47jBDSAqTHqWEMh9tePHw9nczcHDib4n1pFsdvr+6ZpGcVjXU/G6tmFx4rWZTYvaoVBAEx4jzVSG0k6a2W7knWTKZa9uRwLhZ6a3othnRib8atWnuCafURq3Yqfs0tDASgYfQBpz9Lmy7Zvzg7jSYnXDZX139X5Qf4+qDlg2PJRXI8X9jkZFcG5/Ii/3vlvQsyU95+ge8Dgo9Wy+d28wOlsbaUnljNVcTmQpdTkZ4D9OoMXS/VA8CRNs6W5kWmO0X84Bvag9j4gFhHv7lF42NCAF4NAS3bXNy75Sm1Ce6vojVQ9cLateY78JatQI0RawjKXvT7wrE7wwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoGOuXIJTycsTanlOzvF41iJ2qDmOqclsWt/smK4lfA=;
 b=pETA9wSsUBPmq/GgI2tQI2SospqvB68RqHKIvcYh9M/Y/f6j5zHiv/ERR6tAMoxkjig/xJQIvbT1M+XZRVO9ly25h2XQc7m2D43T1+V1p+cjqSuKLUVnh2h64borOFYG+oiGnINZZmAdq0IKRRpAUguVMfcCmQ0mIdgPgeD+R3A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:44:22 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:44:22 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-pyopenssl: Upgrade 19.1.0 -> 20.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
 <20210113142626.27599-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e7268d95-bdaa-d9f8-b6cd-3610b121a4ca@windriver.com>
Date: Thu, 14 Jan 2021 13:44:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210113142626.27599-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0141.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0141.namprd13.prod.outlook.com (2603:10b6:208:2bb::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend Transport; Thu, 14 Jan 2021 18:44:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90f936b5-d7bd-42e8-823e-08d8b8bc68a1
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48007056CBA3D60C50ADC87A9FA80@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2dnFMSPYZBMZ95xO8ELWy1QV5GZaJQLcOlR8o3JV6dIXkHpylHG4593TZGk3GnBJyM6F67mTC+tN74Je/Xo1BMjoaMxw0JaQXLt+APLSqS6tH7/OGXUM1LjabQWg0cylclv2qQqSRP3g0FzAarxvdfQrTds7nkauvZwQ6jF5X5ynPFDRBorjL+g3F6WG3lSR+jZcBQDuIgi2NQj9kLvlSlGKWlBldyTg/mH3l1Dj6G/zfm8JmvFSTnaiUSYWVPH0xFAofhrsm2fNLng4/Uoh+QdW/RLCfgW8EHUZw7W+pQaUU69m5mqDTkMdeDXmUdtgn1tbhyL4M5GRSGCM3mRceS91XXtWhOt5RXwJYdXTbU2cN7zdxP7kg1w1+Y8SY4X03QKF6mzC6VyErgcCT+8G+aDnjQXTl9+rE+IKjVQTYspUeR+Uc0EEZ0ZabxrwhlmLEx5XlYlLCNnn0Ky+MgoUpC0ApHKd+GF2IWfaRJSNpi1ZLx3Tsaag607oOderhpLsTiRkkL33ThsV+ezzG5FNKEUJvRalpKj+yxznXFo3xu6yVf29QzP5s6oMM8e6Ocmz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(86362001)(478600001)(83380400001)(66946007)(2906002)(31696002)(31686004)(166002)(16576012)(19627235002)(316002)(966005)(8936002)(5660300002)(186003)(16526019)(53546011)(6486002)(52116002)(8676002)(66476007)(36756003)(33964004)(26005)(2616005)(956004)(44832011)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YjlvMjRHYW92TEhqbXZHMUd0OFVMM3BMb3YybC92dGhlTGFLWk9ZamRJZ2gv?=
 =?utf-8?B?c1pNcWQxdGtoOFZDOEI3RHdNVUEvS3FMVVR2MTI0YzE1OWRjSFpXRzBpS2do?=
 =?utf-8?B?ZEl4UmdrRDUrNEdGT21nOFlkbEFvdXRDYzhzdUVJSkxOYWtGZEJYd3ladHVn?=
 =?utf-8?B?bDlxYkZVK01SNDhOVDdQUkJ3aXJmNEp4bWZuU05zNXVidjNleEdDRzhxaVVk?=
 =?utf-8?B?NE1KYlZLa1hWSVJoUHprdXJaai8xMkY4cVk1ajFYeWlnQndFdHdlRWswMnlm?=
 =?utf-8?B?WUdwQ3Jya3FrS1cvemZUaGVZUytHNnBkOEwyaEdHaHFtM1JjWFMybE9ZcEZK?=
 =?utf-8?B?VnROd1NVemtZdFEzMXNTNy9nOWo3Z3Q0RnFhYVdnUThiNGlOWDhaU0x1NVd2?=
 =?utf-8?B?QzZoWVJiT2NsTm9iYkFwYWxmb3d5V0psZVVaTFZlVCtkQUw1N1JVbWhoR0Ri?=
 =?utf-8?B?TlpxdFZtdE5CakgyT3EyNURqTlpBS0NSMmZ1d0dtMGlyLzdkaFZWU0NVQ3Ni?=
 =?utf-8?B?bFdHaHB6Y2NSSEpGNnQ5aXpNQjc1R3kreEhZWDdNNkFxc3ZBWUdKQnV0YUpT?=
 =?utf-8?B?Q1JZbWh0WlpDTmg4a2xGOHdVSmJFMDM2YkdQeDVtWEgrTUh6dnRMUFY5czlB?=
 =?utf-8?B?OXJqei94UEdkdExoZmJoR1hvZ1hQeVRJenlXaDRlN2dCWkNsanZGWkpOK05n?=
 =?utf-8?B?TWFSUFc1clh1TC84VWNDcGRvSnR2SnZPbTFMWlpYRjZ3dzlqaS94QXVMTXV1?=
 =?utf-8?B?Z2VYSnhKREtGaTdIakVORkJ5Sm1mZGZ3NWZMNWtaR1AzL00rYkVQRFNJUkoy?=
 =?utf-8?B?Nnl3U1FFSkZGUjhPcmtnd3gxcHpnb3hPOU1jWUdhcDRGNFVseERZMVpPbmU5?=
 =?utf-8?B?aDVjQlBITk1jaXhkQzU5ak85Y2toV1pEbnJtN01OZlduZEdzYWh6N3hJTVUy?=
 =?utf-8?B?dThWazhBZWFka2NnSUEwbUVlejF5QTd4ZEtycW9KRVRramw2OHRsRGozT0c4?=
 =?utf-8?B?K24yK1RQcFlOQ1NkOG9mbFBKcndzak93d245bjI3cUxEL1lnazZVU1pkdEVj?=
 =?utf-8?B?bFdiNDI1a3V0bytyaGUvb29naUpkdC9vK21uSWpPR2laRkhkbnYrMm5JK0J0?=
 =?utf-8?B?ZzlNVm41eHBIWjBXV0V2aEtkUWg0OWk1K1Rpc1FDWkhDZW9BYmhDTnhtWVhk?=
 =?utf-8?B?eEZ2a1N4S09mL2Z0MEJMWnR5aG9Nd2FmRnkvOVd6UGtCWmVrNUpFWWpVMnpi?=
 =?utf-8?B?U28wRkVCdXo1S0dVOUdJbkVVSmpianlsbDY1d0pyQ1RSZTVseHFsRGYxZUpu?=
 =?utf-8?Q?XekvPv1zANBgr2tY/+vnnepTmpTREpZO/R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:44:22.0893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f936b5-d7bd-42e8-823e-08d8b8bc68a1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIAMlpME6upuXpEfPbBgQF9JpzlzhgVn1iCDY5AFf71I3jh5H2+GM4pL/u2YbLGhm06iKLQRFOjLIRr9R71kXGRGxQKivK4RUOBKHsoAj8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
Content-Type: multipart/alternative;
 boundary="------------32A61A4799EF8CD90EEF6C27"
Content-Language: en-US

--------------32A61A4799EF8CD90EEF6C27
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-01-13 9:26 a.m., Leon Anavi wrote:
> Upgrade to release 20.0.1:
>
> - Fixed compatibility with OpenSSL 1.1.0
> - Added a new optional chain parameter to
>    OpenSSL.crypto.X509StoreContext() where additional untrusted
>    certificates can be specified to help chain building.
> - Added OpenSSL.crypto.X509Store.load_locations to set trusted
>    certificate file bundles and/or directories for verification.
> - Added Context.set_keylog_callback to log key material.
> - Added OpenSSL.SSL.Connection.get_verified_chain to retrieve
>    the verified certificate chain of the peer.
> - Make verification callback optional in Context.set_verify. If
>    omitted, OpenSSL’s default verification is used.
> - Fixed a bug that could truncate or cause a zero-length key
>    error due to a null byte in private key passphrase in
>    OpenSSL.crypto.load_privatekey and OpenSSL.crypto.dump_privatekey.
> - Deprecated OpenSSL.crypto.loads_pkcs7 and
>    OpenSSL.crypto.loads_pkcs12.
> - The minimum cryptography version is now 3.2.
> - Remove deprecated OpenSSL.tsafe module.
> - Removed deprecated OpenSSL.SSL.Context.set_npn_advertise_callback,
>    OpenSSL.SSL.Context.set_npn_select_callback, and
>    OpenSSL.SSL.Connection.get_next_proto_negotiated.
> - Drop support for Python 3.4
> - Drop support for OpenSSL 1.0.1 and 1.0.2
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-pyopenssl_19.1.0.bb => python3-pyopenssl_20.0.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyopenssl_19.1.0.bb => python3-pyopenssl_20.0.1.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb
> index da783ea29..e121ef844 100644
> --- a/meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
>   DEPENDS += "openssl ${PYTHON_PN}-cryptography"
>   
> -SRC_URI[md5sum] = "d9804fedbd1eb0c7d9243397b1fbf972"
> -SRC_URI[sha256sum] = "9a24494b2602aaf402be5c9e30a0b82d4a5c67528fe8fb475e3f3bc00dd69507"
> +SRC_URI[sha256sum] = "4c231c759543ba02560fcd2480c48dcec4dae34c9da7d3747c508227e0624b51"
>   
>   PYPI_PACKAGE = "pyOpenSSL"
>   inherit pypi setuptools3
>
> 
>

--------------32A61A4799EF8CD90EEF6C27
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-13 9:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210113142626.27599-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.0.1:

- Fixed compatibility with OpenSSL 1.1.0
- Added a new optional chain parameter to
  OpenSSL.crypto.X509StoreContext() where additional untrusted
  certificates can be specified to help chain building.
- Added OpenSSL.crypto.X509Store.load_locations to set trusted
  certificate file bundles and/or directories for verification.
- Added Context.set_keylog_callback to log key material.
- Added OpenSSL.SSL.Connection.get_verified_chain to retrieve
  the verified certificate chain of the peer.
- Make verification callback optional in Context.set_verify. If
  omitted, OpenSSL’s default verification is used.
- Fixed a bug that could truncate or cause a zero-length key
  error due to a null byte in private key passphrase in
  OpenSSL.crypto.load_privatekey and OpenSSL.crypto.dump_privatekey.
- Deprecated OpenSSL.crypto.loads_pkcs7 and
  OpenSSL.crypto.loads_pkcs12.
- The minimum cryptography version is now 3.2.
- Remove deprecated OpenSSL.tsafe module.
- Removed deprecated OpenSSL.SSL.Context.set_npn_advertise_callback,
  OpenSSL.SSL.Context.set_npn_select_callback, and
  OpenSSL.SSL.Connection.get_next_proto_negotiated.
- Drop support for Python 3.4
- Drop support for OpenSSL 1.0.1 and 1.0.2

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210113142626.27599-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-pyopenssl_19.1.0.bb =&gt; python3-pyopenssl_20.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyopenssl_19.1.0.bb =&gt; python3-pyopenssl_20.0.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb
index da783ea29..e121ef844 100644
--- a/meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
 DEPENDS += &quot;openssl ${PYTHON_PN}-cryptography&quot;
 
-SRC_URI[md5sum] = &quot;d9804fedbd1eb0c7d9243397b1fbf972&quot;
-SRC_URI[sha256sum] = &quot;9a24494b2602aaf402be5c9e30a0b82d4a5c67528fe8fb475e3f3bc00dd69507&quot;
+SRC_URI[sha256sum] = &quot;4c231c759543ba02560fcd2480c48dcec4dae34c9da7d3747c508227e0624b51&quot;
 
 PYPI_PACKAGE = &quot;pyOpenSSL&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------32A61A4799EF8CD90EEF6C27--
