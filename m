Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.84])
 by mx.groups.io with SMTP id smtpd.web10.7162.1592399356221264495
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=c0oII2bA;
 spf=pass (domain: windriver.com, ip: 40.107.77.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYg+4rh0x/4Cy0hkZUK+9YvUhhXPEKvpTYDv6SpREhcDGBd2XSD+etH41UFbiIjHzVu+LRymKgD2NPecJ0wHBheVBmZhXeY8yBSI/nCDSM8xP+FjsAvpTLH/phYe0GtC10yoiPfoUgUpL0sxHnL9x2k3800l9vAZwYfiqoQo4RA3uOD+xu0mSdeTwfJdi762MUStcUGA2E/yUtNPojY/vqm46OdbskMq0tVml+Q8Cw9lY/dulj9loQvQyBFys55vwnHZqmQxV2bpkiqWmM2yqlhNpXz76/zRFy/+7mtWatQ3o6v4e06ugIpirwkDmiKjXsdD5280421yFW0fVnxRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6Mhpls4tQFKSMivOjgjddk4DNAdE9yRybhHBKq3JJg=;
 b=U8APBj/W8nFBgfF2wPnUHHY4/tWxWk4I1WFgJpXmniCMvxYxusyqde8tLRJuUXpnhrwkhuRisFYuZTJmOBtuVk0st+GxkhgoBJezQMT6T3JRUar5ypNlOPYFbqv28SIuJd2pEjWwRIRxicZhCcrSh3roTwgWr2118lOHTrt7ojFsqIHE+wyqokm619wvdywgPp618DhcPibSCTYG2+CVUS5tNq0tKEwVxisSMR8wQnkpVdD8cNV2pKnET6KgKHL3dOJc2BntRKGqx1jcU7iy47CUErFc8wvPML3n/+VaSr5VvUZwArC+vjn5SLh0CWgcWqDApWxhkRhKPDnD29QNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6Mhpls4tQFKSMivOjgjddk4DNAdE9yRybhHBKq3JJg=;
 b=c0oII2bAhYDj6yl+NNtC8oRYTJ2NjrYBOtifW9nBwOHRfYrr83FwgDCi0CsRlvwLtYSimPagLELIkM5KweQmxnK6p/hYOK0/u7NlcLoSsGBypl1o14tLn3YgO5BimhCh+9nLCmEsLJRF7/CYjkqxBlfgDWT7q2XkQUpcjSnkFsY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3588.namprd11.prod.outlook.com (2603:10b6:408:83::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Wed, 17 Jun
 2020 13:09:15 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:09:15 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-psutil: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615123848.31016-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a55e74ef-4aba-1a72-06ac-6e4c46e174ed@windriver.com>
Date: Wed, 17 Jun 2020 09:09:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615123848.31016-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 13:09:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69eb4636-4166-4afc-7e31-08d812bfa278
X-MS-TrafficTypeDiagnostic: BN8PR11MB3588:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB358846D99F18D9683AC63CFF9F9A0@BN8PR11MB3588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c1B8u0UFwMDZAtu3xMBD0tjilyThFfPoOIAqWmVIIg5U/LBKIvWMiCn6XfBKcRh5ANTzG31rJo1H8S12Z4z5TMNDUQOQl8997Dd8bceaa84PBHWMAfziXNkjdPCxroCvpZPjskks5n8pqyJKM2bwpt6OmcNhxgzfW3GFdzPqbGa045E8iGwjeNtLDrvotgmDTDgsUGKnFMPr/43jkPMSmuw4iOvDYMJUJDI2dYumrRXRNtidW9NOqQtzkrxvNfRH2fEJrgsBMsZ90UFWZ3ZU+ACiIcBunlcs3mebtTGf++k3UV8ZjP3sgpvqTy7hPuPzSETPThtr/0Cf5shUCWhH+dmAmZvMJeIRBdK3CKt+X2LQZ9A6QWLOblcIODk21xNTKc8sYgMmIFaOSoqphQsLAbQbMaYr3LAz/LVMeTtbPcNvXS+nIjdSWKLTCqnWp3YAOEJ7dsYK+7Y37hecCRbzkQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(366004)(346002)(39840400004)(136003)(66556008)(26005)(53546011)(6486002)(166002)(31686004)(8676002)(2906002)(966005)(66946007)(316002)(8936002)(16576012)(66476007)(44832011)(186003)(86362001)(33964004)(52116002)(478600001)(16526019)(36756003)(5660300002)(83380400001)(31696002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	6W4AOLFpYVHPl/AYXoSiCE0BSKd5njqbII3/K3xh5QhLu/YmQVsMBBGIGTu5WDzaSFiBAthQoW/HcmMGmKHq5j38Xvgsr2C4LyYoFTy+z+4UBA2P8Rx8gifqmi4if51MrQgsIoSBY+Qee1ln5wDfXrXN1GmJoHZPcvnv1svmoLWiuLycfZgtTsD5i0rhiBdFjW0UseRyBEFRdBdz+wLFncxK0fTcrzG6gOHUljQdKNK0xbk71d2/z0ZDZBzVndgsYpSGiAD1SA4NXcW46P176zXEIuaKXQsfeCBkrE73q34Duz/s/ifsCg7wxrRb/9AiS07lH062ZktztMnCcfSc8FoQC5x1T5PrgvQO0qBU3+fvXSOtap7Km4B6pDapAQBDP/tZRV5I5oeB6FQOmwKaGpDZxeX+/iIgITp4JSWvkyp4g5fqV2vu4xDv8I3/9XNTygcEzDbs6+m6/ygD6rh9UXcKfsd40/6ZlsIbx+/RORY=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69eb4636-4166-4afc-7e31-08d812bfa278
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:09:14.9549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZpAa/FBffKLvrtAg6Ks9iTTHEu3UbjBnbq3IOUX1rqna6VlYskS8p6/wfsJEd/tXOZZjrzx2H7NOugJf9VZAGafJz4OaYIN1gvlyXVFGmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3588
Content-Type: multipart/alternative;
 boundary="------------BFE9F51A79F4351CAE220470"
Content-Language: en-US

--------------BFE9F51A79F4351CAE220470
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 8:38 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-psutil.inc | 22 ----------------
>   .../python/python3-psutil_5.7.0.bb            | 25 +++++++++++++++++--
>   2 files changed, 23 insertions(+), 24 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-psutil.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
> deleted file mode 100644
> index dfb33e8dc..000000000
> --- a/meta-python/recipes-devtools/python/python-psutil.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -SUMMARY = "A cross-platform process and system utilities module for Python"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
> -
> -SRC_URI[md5sum] = "ed7b0f11ed214bcabbe76b7cf52f3ae3"
> -SRC_URI[sha256sum] = "685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e"
> -
> -PACKAGES =+ "${PN}-tests"
> -
> -FILES_${PN}-tests += " \
> -    ${PYTHON_SITEPACKAGES_DIR}/psutil/test* \
> -    ${PYTHON_SITEPACKAGES_DIR}/psutil/__pycache__/test* \
> -"
> -
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-shell \
> -    ${PYTHON_PN}-threading \
> -    ${PYTHON_PN}-xml \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
> index c1969ea65..170819d59 100644
> --- a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
> @@ -1,4 +1,25 @@
> +SUMMARY = "A cross-platform process and system utilities module for Python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
> +
> +SRC_URI[md5sum] = "ed7b0f11ed214bcabbe76b7cf52f3ae3"
> +SRC_URI[sha256sum] = "685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e"
> +
>   inherit pypi setuptools3
> -require python-psutil.inc
>   
> -RDEPENDS_${PN} += "${PYTHON_PN}-netclient"
> +PACKAGES =+ "${PN}-tests"
> +
> +FILES_${PN}-tests += " \
> +    ${PYTHON_SITEPACKAGES_DIR}/psutil/test* \
> +    ${PYTHON_SITEPACKAGES_DIR}/psutil/__pycache__/test* \
> +"
> +
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-shell \
> +    ${PYTHON_PN}-threading \
> +    ${PYTHON_PN}-xml \
> +    ${PYTHON_PN}-netclient \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------BFE9F51A79F4351CAE220470
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 8:38 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200615123848.31016-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200615123848.31016-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-psutil.inc | 22 ----------------
 .../python/python3-psutil_5.7.0.bb            | 25 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 23 insertions(&#43;), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-psutil.inc

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
deleted file mode 100644
index dfb33e8dc..000000000
--- a/meta-python/recipes-devtools/python/python-psutil.inc
&#43;&#43;&#43; /dev/null
@@ -1,22 &#43;0,0 @@
-SUMMARY = &quot;A cross-platform process and system utilities module for Python&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b">&quot;file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b&quot;</a>
-
-SRC_URI[md5sum] = &quot;ed7b0f11ed214bcabbe76b7cf52f3ae3&quot;
-SRC_URI[sha256sum] = &quot;685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e&quot;
-
-PACKAGES =&#43; &quot;${PN}-tests&quot;
-
-FILES_${PN}-tests &#43;= &quot; \
-    ${PYTHON_SITEPACKAGES_DIR}/psutil/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/psutil/__pycache__/test* \
-&quot;
-
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-xml \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
index c1969ea65..170819d59 100644
--- a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
@@ -1,4 &#43;1,25 @@
&#43;SUMMARY = &quot;A cross-platform process and system utilities module for Python&quot;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b">&quot;file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;ed7b0f11ed214bcabbe76b7cf52f3ae3&quot;
&#43;SRC_URI[sha256sum] = &quot;685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e&quot;
&#43;
 inherit pypi setuptools3
-require python-psutil.inc
 
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-netclient&quot;
&#43;PACKAGES =&#43; &quot;${PN}-tests&quot;
&#43;
&#43;FILES_${PN}-tests &#43;= &quot; \
&#43;    ${PYTHON_SITEPACKAGES_DIR}/psutil/test* \
&#43;    ${PYTHON_SITEPACKAGES_DIR}/psutil/__pycache__/test* \
&#43;&quot;
&#43;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-shell \
&#43;    ${PYTHON_PN}-threading \
&#43;    ${PYTHON_PN}-xml \
&#43;    ${PYTHON_PN}-netclient \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------BFE9F51A79F4351CAE220470--
