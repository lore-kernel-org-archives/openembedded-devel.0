Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.41])
 by mx.groups.io with SMTP id smtpd.web11.25376.1598552233176775447
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WNjBZGnp;
 spf=pass (domain: windriver.com, ip: 40.107.243.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVCPVuTx1IsFdNmtbmfPmbrblh2RZUk1vmvncXNqDjBIEOAlmgbnPmPT9Yi9T1pkA+dAurbi5Oe+cq1NQrAoy97HWlHgRWEvfffq/XQACPkmGKeAM7nQ08sSY7FuTHo5fS2JVagf9zuOvdaummBqYN7/MJ+lgmjxLNF/c0WWdrlvTrSk4m4gti2xV0+Fz5b/JVaMz7B5mU6clpVtQ49dbEE8sRVE5C9smRmeqQW30kLWFv7RBcyMIg6jmqdb1STXNQcILbcFUVp1M2rqDufQ/dq4Fljfcwg44yvVIYOleMz3iPe+HmwsCAvtvxVSd1vz4NVVgeu96WVInP9BnZllpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhTeYXiMMif4K32GXMa1IiMg94S4bjtUHnx0LbwwLoE=;
 b=eIE+thqDMAa5MCLva/XldRQK5NjbEHIwlvwvLa3Z2G7FBBHGskV7AZXWT53Idmg2q2PaVfjTTAnqMtVmqpoDpeEKTIuk0iPJ3XJ6u0zI8YPQcPwTWQAPdqFPX5W0Qx8a2BBLd0Zd+qbNVt6Vs5/GU7L9wuiCcbig35wO4eHA7XWoPFc+Ax+gA0bzJjW6yBMxJAhDm1WwsC/pv3GO2VmQd8iVjFdpcMpMrR/RcvfRwhdHqnII6FE/L5q91sJEhAofjoUyUT3JzgyHuFha7OqKdfrLxTon3XOx41PWc9ok7fY0sDAE6riAUxwEDm0dqxvVbhmwYmEUpcG7yU0Z52jEEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhTeYXiMMif4K32GXMa1IiMg94S4bjtUHnx0LbwwLoE=;
 b=WNjBZGnpwrfOZCzQX84Z+8RnC/JEbkQrV1j+dA9L374OU47lEJm1WOhAk/ajpxtaZC3KVxmURcWAbJU8P0+HZ7va4w7wjwELqA1+KzC54BA4iaEgkRmAORS/jD3AoxqTsRugNAGFUW8vb/rAqga3vV99m61UL+pOsZsVDJdzMc8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Thu, 27 Aug
 2020 18:17:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:17:10 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-cryptography-vectors: Upgrade 2.9.2 -> 3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200825132633.875-1-leon.anavi@konsulko.com>
 <20200825132633.875-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9b63c11d-bdf5-4607-8938-f14422cd8b40@windriver.com>
Date: Thu, 27 Aug 2020 14:17:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200825132633.875-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 18:17:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7faa5cb7-5f3a-403f-6baf-08d84ab56a51
X-MS-TrafficTypeDiagnostic: BYAPR11MB2726:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2726318500A45B005A4542899F550@BYAPR11MB2726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uWF9WfN31Hw0nEJdAKo1q8FMEfopzMbPE0fLXk3o9lWhHt/7TBeUK7XESYNe5DBCqmXiT/3slQ7J711fF2qcfKpwRTzHdESkiHYtc2+r7jz14CywHcpHMJOE8+/TfG8q2ytNbuezzA/LnzodTYqASS4MNMMtY0bRosjOKWiXXoWsfh38fHjG3lpU3nL4o+wPMl453iRyA3qLXdK/OISFS8JPs5Y4aYObNPXW5Zx6yUFuORAF3D01WhkeqaYPEhi5+NtbznWckkkEh8XyTVT3jZxvv8lTvv2Wan10Rwl5TqJHY+14mof+PBbSPRIeyH75sH9PKHix4evE4YEB4j3kFB0TmskXNbrvXN4abJhZKyTM7A/250f5fk3Ygqpen5tZ3lxiYrGzseSR4Mprs2Xz39X2PRyX0xkKdv/eHZ/eDxOlVZiznqmFrQ8tor3PuIeBJTyKDCtZmMkXmluk17dCrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(5660300002)(66556008)(2616005)(956004)(26005)(31696002)(8936002)(6486002)(83380400001)(33964004)(966005)(66946007)(31686004)(86362001)(2906002)(186003)(66476007)(53546011)(52116002)(166002)(8676002)(36756003)(316002)(478600001)(44832011)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CYs30fMtfddMEFSICsI0bLNax46xxjI4ZEviJw6dtwNQk9iQin1aMND7K+dc9GedTjCkuEo5NV8n1dd7TT3Byzaf50jKGdmfjGEqiHRC6efjEfJpV4A3/GeRMShgtcTeVKvNk9A11q87bZAKvLBNp5QoXb9xotnbIe6akX5enEDqVJ16SZybFPz1nfYlpQ1bu+nsQAso/J07Hmk6lvR0oY5J3DkPpN59azAbL+fScs7H1N2oLVtkWjcDh1WYFloNsMrngg983U5tDPdGNDcmcwqXb/PZzL7A4TbEUFhTKBFPI735M1beI8IoWOQUYh9Lk3FUc6i9cWB2aPd7Y3O1B2ppnZL9RZZhOU5FKLXBheH6ZqV4G/BJpEFoXtvWXSHtzn3tjCYHz+LUIgnWa11RIDCscOrpPUIXyVhyDuWF3SZO/oGZts/67/oSAQbeI3xXdD7tVpKMgGjAcivwZSuSOGjIzzIdxLRWO2mSKeSE22YO2Iymy9CFxps6gOCA4LO8z293wlg24UhcHawCYeNHCk0ptPMjCrXaT4OrUJOe+n326R8B8StbpoM8WcZZkhR8Hf5vKal5u7nqBOnJg8JizNReYHLIBnBbZA7bv4hnJNw3FiA2CfTg/aqW9tJ0jVd3ZK0F5qbRy3Moqb56ktNgww==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7faa5cb7-5f3a-403f-6baf-08d84ab56a51
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:17:10.7781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IewDS2NIKXTJaxjLId6UDl+88FlfWUcAno3kdC7W6vFg9ucaBZ5SHcXQA4mVFhOa4QM2ttlYCIC3K4hitodhGQQC79RuNSEmcai1vc5YQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
Content-Type: multipart/alternative;
 boundary="------------43646D8B59818D0EBAE73813"
Content-Language: en-US

--------------43646D8B59818D0EBAE73813
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/25/20 9:26 AM, Leon Anavi wrote:
> Upgrade to release 3.0:
>
> - Deprecated support for Python 2.
> - Added support for OpenSSH serialization format for ec, ed25519,
>    rsa and dsa private keys
> - Added support for OpenSSH certificates
> - Added support for parsing attributes in certificate signing
>    requests
> - On OpenSSL 1.1.1d and higher cryptography now uses OpenSSL's
>    built-in CSPRNG instead of its own OS random engine because
>    these versions of OpenSSL properly reseed on fork
> - Added initial support for creating PKCS12 files
>
> More details are avaialble at:
> https://github.com/pyca/cryptography/blob/master/CHANGELOG.rst
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...y-vectors_2.9.2.bb => python3-cryptography-vectors_3.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.9.2.bb => python3-cryptography-vectors_3.0.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
> index 60316fc74..26f1a2389 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0 | BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
>   
> -SRC_URI[md5sum] = "657349b8de73959fc49ba15fd7346b58"
> -SRC_URI[sha256sum] = "99ac91c4d89572399b097240809af1b8f67f4bedf43398d290c9b2b3d9f491b4"
> +SRC_URI[md5sum] = "689e44b945870a2ed197c0c35e4a0330"
> +SRC_URI[sha256sum] = "52eff0457b3148ebbdc16dc7ad569bb88ccb2578414936c8b2137a3ddf334239"
>   
>   PYPI_PACKAGE = "cryptography_vectors"
>   
>
> 

--------------43646D8B59818D0EBAE73813
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
    <blockquote type="cite" cite="mid:20200825132633.875-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0:

- Deprecated support for Python 2.
- Added support for OpenSSH serialization format for ec, ed25519,
  rsa and dsa private keys
- Added support for OpenSSH certificates
- Added support for parsing attributes in certificate signing
  requests
- On OpenSSL 1.1.1d and higher cryptography now uses OpenSSL's
  built-in CSPRNG instead of its own OS random engine because
  these versions of OpenSSL properly reseed on fork
- Added initial support for creating PKCS12 files

More details are avaialble at:
<a class="moz-txt-link-freetext" href="https://github.com/pyca/cryptography/blob/master/CHANGELOG.rst">https://github.com/pyca/cryptography/blob/master/CHANGELOG.rst</a>

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200825132633.875-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...y-vectors_2.9.2.bb =&gt; python3-cryptography-vectors_3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.9.2.bb =&gt; python3-cryptography-vectors_3.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
index 60316fc74..26f1a2389 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
@@ -4,8 +4,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0 | BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4">&quot;file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4&quot;</a>
 
-SRC_URI[md5sum] = &quot;657349b8de73959fc49ba15fd7346b58&quot;
-SRC_URI[sha256sum] = &quot;99ac91c4d89572399b097240809af1b8f67f4bedf43398d290c9b2b3d9f491b4&quot;
+SRC_URI[md5sum] = &quot;689e44b945870a2ed197c0c35e4a0330&quot;
+SRC_URI[sha256sum] = &quot;52eff0457b3148ebbdc16dc7ad569bb88ccb2578414936c8b2137a3ddf334239&quot;
 
 PYPI_PACKAGE = &quot;cryptography_vectors&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------43646D8B59818D0EBAE73813--
