Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.58])
 by mx.groups.io with SMTP id smtpd.web10.66993.1597759616994190915
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Qg0vONM4;
 spf=pass (domain: windriver.com, ip: 40.107.243.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oY2j425WeOn9MC8QlDCD44o1j0OEqLc3e9rdotsMY7m36vf5uUmbZ6/kRtU2wf/Xn78dy317tU6BSsPAddj/cmXtOBkSfmAKfurmIBnYzLhTIJLxhdJ9uzJSYl8r2qqM8DTMrtB5GaNpBWPuaU4cUqde0ynOqiRKlCGtgnMoR1y62eF8D6s2P6CVaipipTtC14okx/xsEzf3BFJSLJMoDsgsMH9+bRzcm24KSTfPSy0Viup0J7YU4ihVQgupLYwpjrPlA5zp62iwGimtp8xRLaDnYa1Vss2Td4H8NoX8ZilPe2eO1sSIIFjIgk+Iryib5uLyZlYdBkqKA33j62o8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViXqaDdI5ORlq1oBBdgQoIaPScM++zKW020dRjZvmLM=;
 b=YxASiUyh/KEXVheVIvHTRZ2eDNditdzrL+9F4gvb4PKoIwcuY21l5XhUEGu/ZF0AfgamI6/qpKx5gXmKParrvgvSdb1qX1hPlG4OqMk1eJ3r0mxOw0AeWnuuL0dpa3t+3XZyKg8siVPZaRjUdeQaTuo9qVezfUXEaGW1I08UDr3tNbhP5xx3g4Om59rbC1SvmXkCdzCfYfOzcH1dc/ifuXmXQcK2zxeFLOXzUB4VPHZ2mu5fLwyCfdsn1pBH6MiTafy0yQvJsgjDZQmo5DBdSKjcK0j+4LoF4zmjGMTqXEdLLMYrAaUQ5O5e9G5Lw0vbu9ASepPLUmBWPGZltBPDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViXqaDdI5ORlq1oBBdgQoIaPScM++zKW020dRjZvmLM=;
 b=Qg0vONM4n6Yf8fJ0yPvcgCth60ZbLEcH02eS6EGx3Gn9UTA9D9RrQRB3rh5878HIDHiHeJetIBGg0J2lo2mI42/G0OpkLfLqkmFx1AQXJkrwBhkbn5TEYHISM5yf01JMbmtfIYnp/GeA3XlcFKoE3dIIlJolNSSam88AucIZe6c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 14:06:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:06:55 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-cffi: Upgrade 1.14.1 -> 1.14.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
 <20200817112901.28914-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5ceab317-1753-5735-be5f-f3ddf7676ca5@windriver.com>
Date: Tue, 18 Aug 2020 10:06:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200817112901.28914-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Tue, 18 Aug 2020 14:06:54 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 911dffc4-a442-46e1-5588-08d8437ff6b7
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3398091F6AA3618DD7DA82409F5C0@BYAPR11MB3398.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h7hBmKxGIFE3pI8hahjsih2R/bzQqTQOPS66RraYG1C4UpYfor+rZxdulYgHNbCNCcXm/I06gAD3O8A+a8Zt31fUOUVYSj9QZRwio54tiosfk0JgRvb8RyMODO4KuKCvNDqDs8bAgZUQa9SOOddYYg0kVjTTCnsvMj/LBNv1f7+HyK3Zmg4ZkzGR6ePh/WQbIs/17jDzTlPH/quyCnZtqxQxFvDhu6TF3nVYHgBlx2eNJHczzTxROePed8OB/FDHrxX5rrtZp/wX19RsLPVyJwJoAgMlO2sBHW/3iK8WdvALI7LLF2QilXO3b35S8wtShfGuiMAHDTPRqWEwaUX7DmphDzpVRu5lWsebTQnWPz+Ol3wghpZjB13bqL10uVorNXz4R+l7WjtaaQMF4RXhGY4yv0rGfmVmG3ujKHCb6H8mIylafN1l/U/B8Xgpvk+2zgf+ux8Ohly5YP+3cIqCxQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(39850400004)(346002)(136003)(166002)(966005)(36756003)(31686004)(478600001)(956004)(2616005)(16576012)(6486002)(2906002)(66946007)(66556008)(44832011)(66476007)(316002)(5660300002)(53546011)(26005)(52116002)(31696002)(16526019)(86362001)(6666004)(8676002)(8936002)(83380400001)(33964004)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	3OAZTaASkkLp3PFj+uBOQVQ+LmEYG9BuCv0VNsPiEz1qAXGo1/ed8mdd0h8yUjZuqooDJt94TLu16wMIfND/f4wDVL5BVtAf4Xp0jePquGtoj/MN1IfptDuGzD0eWa9gMYaSj4T003vEFJwIc5V2gx4+fiOO9bI6CIBASl+Ke5MsPNWqCbVcuxNXMVaoWOQYrUdlMxD+2ZeJcIViHQn28+GtDuctLaJKl6cZ6BVIYRBZFxhMXTChIaSUzjVKxcICqoEnqtvQmk1PEqUVvIlcfSu87hPXnonnPmPRWR9tjx2OtbqVKJNo8EoT/RaiUGwJQMC628NrC7Wm20G399GvlVYG8ulVBJBSzyPkAN7zfePqJF8aYJVUlQU7pfjbX5Jk0i9VeXf3FxYEMPgTBvocxDqzUN4LnXy5Hn6kCyPL2ZfOSJkMjBhlY9mCwfAV4hYcqYO4ilMRjuhwZhdGCuz6qtNbNUNtypSsW9lVxAaDCIhDHRpGG1ydRNYOebsMx9D6WnpHlfVUxIU5gJXw0kw5qnmMMKha1QHmaYcLVhOVYg5kgiwAfzkMUyanqtBT5KM1AYqEEZxdKYoYNUR/nwadG4Ptzkj7QS3XVoZgmvXcQINkd0HneEaXpvSh3JFnJvwzQPozprJ/Tsv4vTAlltm80A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 911dffc4-a442-46e1-5588-08d8437ff6b7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:06:55.8169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xf3NNJAPfXiVGQP4zbIjDNaJunD8eCP59KqjseLSbiEmIX97NE+Py1HPUgP/Bvax/+7yqLotNwNF/TGNd9oFjpPVhkeS2bV+3np9VfXl7Po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3398
Content-Type: multipart/alternative;
 boundary="------------6C6B750FB4AFED0165921F38"
Content-Language: en-US

--------------6C6B750FB4AFED0165921F38
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/17/20 7:28 AM, Leon Anavi wrote:
> Upgrade to release 1.14.2:
>
> - CPython 3 on Windows: we again try to compile with
>    Py_LIMITED_API by default. This flag is not added if you run the
>    compilation with CPython 3.4, as it only works with CPython >=
>    3.5, but by now this version of Python is quite old (and we no
>    longer distribute cffi wheels for it).
> - You can manually disable Py_LIMITED_API by calling
>    ffi.set_source(..., py_limited_api=False).
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cffi_1.14.1.bb => python3-cffi_1.14.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cffi_1.14.1.bb => python3-cffi_1.14.2.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
> rename to meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
> index 59b99dd71..57c28954a 100644
> --- a/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
>   DEPENDS += "libffi ${PYTHON_PN}-pycparser"
>   
> -SRC_URI[md5sum] = "1dac3d20d5602829dfaa7026658b7795"
> -SRC_URI[sha256sum] = "b2a2b0d276a136146e012154baefaea2758ef1f56ae9f4e01c612b0831e0bd2f"
> +SRC_URI[md5sum] = "3cc2f1daf62dd66eda79b4d6281cebfc"
> +SRC_URI[sha256sum] = "ae8f34d50af2c2154035984b8b5fc5d9ed63f32fe615646ab435b05b132ca91b"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------6C6B750FB4AFED0165921F38
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/17/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200817112901.28914-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.14.2:

- CPython 3 on Windows: we again try to compile with
  Py_LIMITED_API by default. This flag is not added if you run the
  compilation with CPython 3.4, as it only works with CPython &gt;=
  3.5, but by now this version of Python is quite old (and we no
  longer distribute cffi wheels for it).
- You can manually disable Py_LIMITED_API by calling
  ffi.set_source(..., py_limited_api=False).

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200817112901.28914-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cffi_1.14.1.bb =&gt; python3-cffi_1.14.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.1.bb =&gt; python3-cffi_1.14.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
index 59b99dd71..57c28954a 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf">&quot;file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf&quot;</a>
 DEPENDS += &quot;libffi ${PYTHON_PN}-pycparser&quot;
 
-SRC_URI[md5sum] = &quot;1dac3d20d5602829dfaa7026658b7795&quot;
-SRC_URI[sha256sum] = &quot;b2a2b0d276a136146e012154baefaea2758ef1f56ae9f4e01c612b0831e0bd2f&quot;
+SRC_URI[md5sum] = &quot;3cc2f1daf62dd66eda79b4d6281cebfc&quot;
+SRC_URI[sha256sum] = &quot;ae8f34d50af2c2154035984b8b5fc5d9ed63f32fe615646ab435b05b132ca91b&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6C6B750FB4AFED0165921F38--
