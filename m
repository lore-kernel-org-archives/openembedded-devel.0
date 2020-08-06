Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.45])
 by mx.groups.io with SMTP id smtpd.web11.5942.1596718925069387509
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Blf59ZIn;
 spf=pass (domain: windriver.com, ip: 40.107.223.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQS2gPx1AxkVljj1cM8HeDsQunPXV28RSMWRM1eJHk0SvQuRJL6gvbTo+IDs6CNWcdQTajAr9G3IF0nhha1RszY2vdzq4fMtIT+ZnOagsDzIzK/1lBwUqsrrJl304VOJeaycXmWcsGs4YTBVhFA+KazWGGPyNrDgcxrWNV1aSHoZ1Ot3vEC0GiX2SLqXGRHzXoSIB/tmOdLCTQEhzLyj4PuvcdlIlPXFzg1tzZbCTFIwvvvXONSM1o+MuO1NfgeS7RwvOGGIGFMwz/0jjszM+5M0qJq4huNxIzjtehp75FW/pmWbbrusVqf4uGqZC6etLKDfz8vviCOKjKd15lfBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8YnDxHJz5J8bVr9H2riHZmGQVCMzjCxCh3Y8plsyRE=;
 b=Y8YJ237hWZg8Fkc6sm0ZuAiHLFqQZDKfnmvXVwUFiORlDVm8z/Z21uXQ3msT/EqOCVEsUjplRmShtmImSfT9ZzQwGjsFfv5+mC1cAAy8Inn8OezdXWN+5E45QXM42sohT9JicRLdQO1uKPCcx66PYt9E8U/snLR2AqSA93lqMOcxDY5/dUKcFi9u3hJ8btYBgeG+4RZWxW22G1iC2Cq7Xbrl4dDw+34B4rvz3jlPiTZUpQNihXOO0gLaP3dy/XjIO39PUnrmAakSyhKeBH9MUcInDucMbAPnO1icgAZgELhwho9ogiLQcxAp0W/XXr/Ef6MrhKRf5dAlveuASWNbqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8YnDxHJz5J8bVr9H2riHZmGQVCMzjCxCh3Y8plsyRE=;
 b=Blf59ZIn5iet3STPZ8wDFFo4JDyJSs8sWp28VFQOOkeYkOiAzVsjCqj7t53P5pccwUwDOBoar08kPoRB0MJMG+VU4Nnmu7P5CZF1xjqPkobQDNW3RHhQzsXOYYBjdDDBquQUg8m9Qw7AU/Iwbb1v3tWKsQIeZ+M2sHRUqtCAFyw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:02:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:02:04 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-cryptography: Upgrade 2.8 -> 3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
 <20200803140520.23250-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2d168f35-d182-2cb8-ad70-785d8bf38b29@windriver.com>
Date: Thu, 6 Aug 2020 09:02:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803140520.23250-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Thu, 6 Aug 2020 13:02:03 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 738915fd-7ed5-4cef-ddbc-08d83a08ea34
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4305737CBA11489E1CFF3FFA9F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JBbqMnZhu4mgYJd+eii/mUvxuTgvqvlU6H3EURmIhQF/bOUBauSNr9CtSaZESaxtLARIA0fb+Cazp4XlVQdzOrbYtm1frhOVVMWEYTJ4ZMVja5+VweNu0qOBXj/zjOel3/IWbEjsRVgbCLLjt+13q2s+MxEO3m2FwgqhSBafo4pcLY6KHeInJ22qJlALJmleilibFyG86gnwNP7WfhTNE4JoT1+6jXhOZ4ut/6I6AKB/QorfdR3a7rX/mAalfDOHLlWOt5z6AHYdWA6p0aROI75umZHirSzsduMea+6rj9edSi3bHII6Yab982zJw9hyHMVfv5DauyaXFvao/H9941qSQX8qHhHS2PPWyj+Rk2iYr2lsCSMZuDVg42V9SeXVE8thlme8SR/k4yrOhTCUvHyvTIft8YsfRF442Bo6olmk7dUEx26Z9KV6jkrT7TgScwJBdrnO9/s64V3EH0Hx5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5P228s2dFTbFC8JUqrW8M5q8K9u23EL7/Jrm0EAaseDOOadfbfIKowDM1iGcm4bOdMcp6Qkag4scv1PLKou3nizEmbjW/dFhRzs64rrJh9J8Qgn5j/hJ+TFJZtMm94dmzdRnnwF5/5HeSHjvIrxOVUNUhX5BGmJgmBikZRy3lMjnyQ5Dc8OyxUJBRGKKe7GA6kefqsJhrp57Nav9i7kxfMb2YskOQWpyyX4y24D3mqBKyYGilkeymfRhF0km0P3j65GS/p0jJU04skJNVFukycmRxKiOSS7gPzWa54yTvxT3RP12zP9TOfOyMGIPopQmTpcda0J270TfY2+J1ZhFdKUcv725V7u3xflirTjEJzVGMIobH1Kpu19vUVEW/arPTbkDDXWnPDj9jgWqwhhN481S6uHxlZihcFl2jsEXgkSs1yUhzzkCh/vxZlU+8Xicwdpjejt4ppAxbIc+DUa/wovIjgvtTE5hMIrp+fcrvg9EtJwh4caTZ8m48NDV9lgbr3Nf3YLO1SgOD2mhywR/+2iZNuXJye9EpxdAIt0wF4HufsT5R1mQCzpla4RAP1CJpLRLRhu7v1OlbF8nPfs6/XzZ8AlVONtz8QE3HgH4NgefckUmaU1NKyx66N/5dExkq+joNkP6Gzwr5bPvTdMxWw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738915fd-7ed5-4cef-ddbc-08d83a08ea34
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:02:03.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NF13jea6HjMVl49RC3zLLthn2of9xsoJOHlQKBRzWVluLF1vqCkgZIGfEtxpiqS6o8ziyxsOWtZmgwC5AqQk+l+mLdEVSSnAV6ZkNljsKgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------136C5454B55D264239B2D463"
Content-Language: en-US

--------------136C5454B55D264239B2D463
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/3/20 10:05 AM, Leon Anavi wrote:
> Upgrade to release 3.0:
>
> - Deprecated support for Python 2. At the time there is no time
>    table for actually dropping support, however we strongly
>    encourage all users to upgrade their Python, as Python 2 no
>    longer receives support from the Python core team.
> - Added support for OpenSSH serialization format for ec, ed25519,
>    rsa and dsa private keys.
> - Added support for OpenSSH certificates.
> - Added :meth:`~cryptography.fernet.Fernet.encrypt_at_time` and
>    :meth:`~cryptography.fernet.Fernet.decrypt_at_time` to
>    :class:`~cryptography.fernet.Fernet`.
> - Added support for the :class:`~cryptography.x509.SubjectInformationAccess`
>    X.509 extension.
> - Added support for parsing :class:`~cryptography.x509.SignedCertificateTimestamps`
>    in OCSP responses.
> - Added support for parsing attributes in certificate signing
>    requests.
> - Added support for encoding attributes in certificate signing
>    requests.
> - On OpenSSL 1.1.1d and higher cryptography now uses OpenSSL's
>    built-in CSPRNG instead of its own OS random engine because
>    ithese versions of OpenSSL properly reseed on fork.
>
> BACKWARDS INCOMPATIBLE:
>
> - Support for LibreSSL 2.7.x, 2.8.x, and 2.9.0 has been removed
>    (2.9.1+ is still supported).
> - Dropped support for macOS 10.9, macOS users must upgrade to
>    10.10 or newer.
> - RSA :meth:`~cryptography.hazmat.primitives.asymmetric.rsa.generate_private_key`
>    no longer accepts public_exponent values except 65537 and 3
>    (the latter for legacy purposes).
> - X.509 certificate parsing now enforces that the version field
>    contains a valid value, rather than deferring this check until
>    :attr:`~cryptography.x509.Certificate.version` is accessed.
> - Added initial support for creating PKCS12 files with
>    :func:`~cryptography.hazmat.primitives.serialization.pkcs12.serialize_key_and_certificates`.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-cryptography_2.8.bb => python3-cryptography_3.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography_2.8.bb => python3-cryptography_3.0.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
> index 95e903b29..05a2350e3 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
>   
>   LDSHARED += "-pthread"
>   
> -SRC_URI[md5sum] = "77730058b556c6d9838679a94c6229ce"
> -SRC_URI[sha256sum] = "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02871651"
> +SRC_URI[md5sum] = "163608a7cb838c6b39360e1e64377d54"
> +SRC_URI[sha256sum] = "8e924dbc025206e97756e8903039662aa58aa9ba357d8e1d8fc29e3092322053"
>   
>   SRC_URI += " \
>       file://run-ptest \
>
> 

--------------136C5454B55D264239B2D463
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 10:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803140520.23250-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0:

- Deprecated support for Python 2. At the time there is no time
  table for actually dropping support, however we strongly
  encourage all users to upgrade their Python, as Python 2 no
  longer receives support from the Python core team.
- Added support for OpenSSH serialization format for ec, ed25519,
  rsa and dsa private keys.
- Added support for OpenSSH certificates.
- Added :meth:`~cryptography.fernet.Fernet.encrypt_at_time` and
  :meth:`~cryptography.fernet.Fernet.decrypt_at_time` to
  :class:`~cryptography.fernet.Fernet`.
- Added support for the :class:`~cryptography.x509.SubjectInformationAccess`
  X.509 extension.
- Added support for parsing :class:`~cryptography.x509.SignedCertificateTimestamps`
  in OCSP responses.
- Added support for parsing attributes in certificate signing
  requests.
- Added support for encoding attributes in certificate signing
  requests.
- On OpenSSL 1.1.1d and higher cryptography now uses OpenSSL's
  built-in CSPRNG instead of its own OS random engine because
  ithese versions of OpenSSL properly reseed on fork.

BACKWARDS INCOMPATIBLE:

- Support for LibreSSL 2.7.x, 2.8.x, and 2.9.0 has been removed
  (2.9.1+ is still supported).
- Dropped support for macOS 10.9, macOS users must upgrade to
  10.10 or newer.
- RSA :meth:`~cryptography.hazmat.primitives.asymmetric.rsa.generate_private_key`
  no longer accepts public_exponent values except 65537 and 3
  (the latter for legacy purposes).
- X.509 certificate parsing now enforces that the version field
  contains a valid value, rather than deferring this check until
  :attr:`~cryptography.x509.Certificate.version` is accessed.
- Added initial support for creating PKCS12 files with
  :func:`~cryptography.hazmat.primitives.serialization.pkcs12.serialize_key_and_certificates`.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803140520.23250-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-cryptography_2.8.bb =&gt; python3-cryptography_3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_2.8.bb =&gt; python3-cryptography_3.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
index 95e903b29..05a2350e3 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=097f805837700cfac572ac274cd38124">&quot;file://LICENSE;md5=097f805837700cfac572ac274cd38124&quot;</a>
 
 LDSHARED += &quot;-pthread&quot;
 
-SRC_URI[md5sum] = &quot;77730058b556c6d9838679a94c6229ce&quot;
-SRC_URI[sha256sum] = &quot;3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02871651&quot;
+SRC_URI[md5sum] = &quot;163608a7cb838c6b39360e1e64377d54&quot;
+SRC_URI[sha256sum] = &quot;8e924dbc025206e97756e8903039662aa58aa9ba357d8e1d8fc29e3092322053&quot;
 
 SRC_URI += &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------136C5454B55D264239B2D463--
