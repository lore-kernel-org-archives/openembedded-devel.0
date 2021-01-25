Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.49])
 by mx.groups.io with SMTP id smtpd.web10.35975.1611578518962074382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B6VBZzQ2;
 spf=pass (domain: windriver.com, ip: 40.107.92.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVOfqXclA2MzMUARr0bqXOqhB0tHNlzyixxu7bSJWhjt8i/QE8hgi752FPca+XXOOgBSOXCQpY26qbZA3jfCtomiUREitSO7xqmdgolyNx4CqSqiXweb7Kb0VoK4DCSJEiU8yW+OvhjwKR+yADZ3Mb0swEGuXWMDZjeBLDh1P9oPqqt9K500U/hExsAV2sEqzTT4jxqu6CguCPhTmkC3etnTQPLHc7eYIRJDYk4ehrKrxvatZ5YTzzzwoZHGyuVfm5Vh1AmPglsPIxH62FDvMWIYUd32STrRfak/QFfuJ5o72K/fApdvZfiWLE2GmFcdFq4uKJtO1aCOaDGBmIcqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4lAlg44vqqzjcaLQD8qgF0ZyHNJvNOO9D5vvik0Vvg=;
 b=j1ntKPDgu5hFcuY0DWHFOeUHIdKoPzOMV17D1aANu9cPsVAs+4zDa6wNTsg3tUTWgyo8FepRk6jR4If0e91nchz3JzLK5k0EuApFShjSXgJl7MUM2mMorUCt4u33MSXShE8vV7WlI0tSytq2Uq+3EpN1YAmXa1f7cAxdlKy/9YSGemNjDlBvooYuXZSp0j/yoPG191zb7SFzz2nWX36dlPQOB4ZqEVh3iA21lxnMDMNroVPTz/RZE5AbdTTIGOPyKmiIgbqtS9uM0XkY1xU6mOBXhT+ZEMkAhmBVfBBFS3reyINLutiZJrUPIJEeoFBmMDGn+4n9aKkmaXRf4oN2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4lAlg44vqqzjcaLQD8qgF0ZyHNJvNOO9D5vvik0Vvg=;
 b=B6VBZzQ2u8eMSk9Giwlgz4gSl3Gvoc54ZKoecX0eaaeZDG1IctHeEH1JYiB9wTL90FTp9zKEoA17zUSZVXD9z6AhTzD8cTXXSzT0OPq4lYQgD+LDBEWZ3YpzhdzUTxAjnxLhm0Ik6hoYE/rbxH1Iem3AVLo6tky2dRo7QLcofgs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3678.namprd11.prod.outlook.com (2603:10b6:208:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Mon, 25 Jan
 2021 12:41:57 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:41:57 +0000
Subject: Re: [oe] [meta-python][PATCH v2 1/2] meta-python: Add hexdump package
To: Andrew Jeffery <andrew@aj.id.au>,
 openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20210122054538.3675758-1-andrew@aj.id.au>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e2199e7d-d3c6-2e94-19d7-ca1f598b9f1f@windriver.com>
Date: Mon, 25 Jan 2021 07:41:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210122054538.3675758-1-andrew@aj.id.au>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR14CA0013.namprd14.prod.outlook.com
 (2603:10b6:208:23e::18) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR14CA0013.namprd14.prod.outlook.com (2603:10b6:208:23e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 12:41:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 477415df-28bf-4800-5cf3-08d8c12e9a66
X-MS-TrafficTypeDiagnostic: MN2PR11MB3678:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB367841EA1FB75D231722EA9A9FBD9@MN2PR11MB3678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fF6WmijzWmpb38Pmj5J+mioi/ghS4N8ZXEbVgc7sQ+JgPfPPzACWVhJvTmBZ0EqCpCUhHe4XmsP7Z35cdHt9JnSoFntPEMrO7AXNHw33CMrtstmHrL6Pu9q4ZmN02tz8gF9spFX2xB2NBLwbQhaVRc4dh1ErxQS+4izbosuhTOWl06xGXO4uj+GOzTKMsyfWEm6rF/v0qQD0nqtq7nby6tpWZ0DOnfCAWRFj3vlM94Mq2FpURF8ri7jPXhwMTRjo+YYcZyCZNYYbhY+DSIM982easGANSoBxlpuTszWuBJ1BvHhDwRJm/85XpkPfv2+vDNnzUmmxO/hdoD0UuIM51NmeMIeiYbxXW9ubCzRgZVzxxBAwCl4x1xOQrn8xPWQtf8DMBCTE7xKWEVDPhNXEWnUoIbumDVoSWqvMLbJA5nkXdmlZAf+arSHs6yhS+5rShg5GvyOyV+ziSKQ2UJ7ueAuI4JBmDAzxVwQTRcNZJIq0nSsiNTTmPiCbTTw7JZripqVa6m7c3juVU88+L2Fp2wFQ+8DM5RdW6iiqP3MyZms=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39840400004)(346002)(33964004)(2906002)(966005)(478600001)(186003)(316002)(956004)(5660300002)(52116002)(4326008)(166002)(66556008)(53546011)(66476007)(16526019)(8936002)(36756003)(6486002)(66946007)(26005)(31696002)(44832011)(31686004)(8676002)(86362001)(83380400001)(16576012)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZTAvbkJ4MUdYNTVtay9kT3VwUXFvOGRjZW5VZDFlN0dRMWpmcjExWWF2UW9G?=
 =?utf-8?B?MWM2dmxtYStjMHJkL29relB2MW9zYzY2NG1kY1R3TnBrM3NHMDV4YjN5RllP?=
 =?utf-8?B?eS9VaW1SUVJYT3doMENoR1drbkkvVzUrVlVzMmZZQ2MyRzJNMmJCOFBMUDZI?=
 =?utf-8?B?OUJKbGZSZlNlTElEUkRkN050MDY4VTRFdytsdVg4bklrelROeEE1MVBMeDVy?=
 =?utf-8?B?bUc1ZVkyMWozUXpaNGNUd3gzcmlHUzU2YWJBSEFZQ0xIc29NR2JYZTVZSG1E?=
 =?utf-8?B?eXg5cG1nbTRselJzOEIvM0RrNmZzYVNIYzZ3aDVDQkl1NU1Ud2F1NmFtUzl4?=
 =?utf-8?B?S1V3OE1IdG0rejVQWnBvcmw4VTNXem9tWFRPQnFxcnpvcW82T3l0K0ZZVXRP?=
 =?utf-8?B?WmF0OHZPVGo0NzR4K3ZYRkRkbFdIUHJRVzZBcWlsVWhZWSs1blZWcnhwZDBx?=
 =?utf-8?B?RUl3UlMyVFFXZUROTjc4Z1NwS0t5dkxxUG5xU1FPandXWk5FazVJcTAyL1Fh?=
 =?utf-8?B?aDJJb2ZqZXhoTWp3K2lENUlMcXY2dHZIUmNOQ3hsY1RSNHJLclpzZ1dPSnNS?=
 =?utf-8?B?WFZoY0JJQnhmcDM1bkRwclJEbVllMWlqVGEwcXFGb2dwOHVTSUpNZXp4bnpR?=
 =?utf-8?B?b1ZXUG1hc1MzejA2RmZIKzRMOGRDZU43V0xhUXVPYXg2Y2RVVDhRNmVmOEJn?=
 =?utf-8?B?d0Q1OHpZblJGaEdKZlhpdFFIYTQrQ0tqYnk1WlhwOVhOaHdvWWJ2aXY0RzFI?=
 =?utf-8?B?YWp3aHlDeGNBRFA2L0NUY1RJeE1yRHdVTVBtUDBVSzhQS3BCVmNqVUduazYz?=
 =?utf-8?B?bXMraUZjQUVIUVErWFhKT0xMajFoQUowNVZ6Z1V4V1E4UlIyMVlBbTRGWWFv?=
 =?utf-8?B?YXY3R0FtcjgxK2ZGUnZLanFZMDArVHhhSjQvTnMySVY5YWdFdmx0RVkzNXdt?=
 =?utf-8?B?T0R6MGlTSjR6bWJiWU9GSFZoSkllRjdjZ3dML3RkSG5LTFdYNyttbEFUbUVi?=
 =?utf-8?B?aVVwRkRETGpkTEc1VENWRnNPR0dKU3lSTU9DZXZJVVNiVDBZbDlFVjFUTTBC?=
 =?utf-8?B?NHU4Z3h2TWoxVkljVkJBVzhic1dEdmx0N2xXNEpBRDRNT0tyZzNnRlVIMkdv?=
 =?utf-8?B?T3BqOWNPOUJqSDFSTW5DbHQ1WG1nWEFKVjBmV3UxbENjM3hRd2NsNENoNFQ3?=
 =?utf-8?B?UmFMa1VCUHRuZDh2Rk40bytxRGtkOWpJWjUwV0Q5RTU1NUt1TEhTWUJVTWR3?=
 =?utf-8?B?NFZ6elZaWi9oY2JrRWduaTFDL3hxTGdpZWNkWXZDRTJuRWdGSEVwUzBwRXJz?=
 =?utf-8?Q?KLtNgj08gJMkF3Mk0CRIWC1X8VbA9pnJkq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 477415df-28bf-4800-5cf3-08d8c12e9a66
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:41:57.7400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwpFY9Y8qFsQfJtrSIhi7x7hxM+XeW/AKJuVOnXX91v6Z4ErjFLE93arAb8TTWDtWkQsqff1FV8Ow+DeclEIgSeO8tMal2JL5UYifk4cI8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3678
Content-Type: multipart/alternative;
 boundary="------------F878E0C277F5EE2A86D18E6A"
Content-Language: en-US

--------------F878E0C277F5EE2A86D18E6A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-22 12:45 a.m., Andrew Jeffery wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> The hexdump package appears to be abandoned, but it's used as the
> dependency of another project I'm packaging.
>
> Change-Id: Id90d770fb48fa502f3abeb541b7febef42799b21
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb |  1 +
>   .../python/python3-hexdump_3.3.bb             | 27 +++++++++++++++++++
>   2 files changed, 28 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index bf46896f1c9b..41f376b39b55 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -416,6 +416,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-cerberus \
>       python3-cvxopt \
>       python3-jsonpath-rw \
> +    python3-hexdump \
>   "
>
>   RDEPENDS_packagegroup-meta-python3-extended = "\
> diff --git a/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
> new file mode 100644
> index 000000000000..cb04e17dfdfb
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "view/edit your binary with any text editor"
> +
> +# The homepage listed on pypi is [1] but the repository has been removed.
> +# Instead, set the homepage to pypi.
> +#
> +# [1] https://bitbucket.org/techtonik/hexdump/
> +HOMEPAGE = "https://pypi.org/project/hexdump/"
> +
> +LICENSE = "PD"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
> +
> +PYPI_PACKAGE_EXT = "zip"
> +
> +inherit pypi distutils3
> +
> +SRC_URI[sha256sum] = "d781a43b0c16ace3f9366aade73e8ad3a7bd5137d58f0b45ab2d3f54876f20db"
> +
> +S = "${WORKDIR}"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +do_cleanup_hexfile() {
> +    rm ${D}${datadir}/data/hexfile.bin
> +    rmdir ${D}${datadir}/data ${D}${datadir}
> +}
> +
> +addtask cleanup_hexfile before do_package after do_install
> --
> 2.27.0
>
>
> 
>

--------------F878E0C277F5EE2A86D18E6A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-22 12:45 a.m., Andrew
      Jeffery wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210122054538.3675758-1-andrew@aj.id.au">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

The hexdump package appears to be abandoned, but it's used as the
dependency of another project I'm packaging.

Change-Id: Id90d770fb48fa502f3abeb541b7febef42799b21
Signed-off-by: Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au">&lt;andrew@aj.id.au&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210122054538.3675758-1-andrew@aj.id.au">
      <pre class="moz-quote-pre" wrap="">
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-hexdump_3.3.bb             | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-hexdump_3.3.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index bf46896f1c9b..41f376b39b55 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -416,6 +416,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-cerberus \
     python3-cvxopt \
     python3-jsonpath-rw \
+    python3-hexdump \
 &quot;

 RDEPENDS_packagegroup-meta-python3-extended = &quot;\
diff --git a/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
new file mode 100644
index 000000000000..cb04e17dfdfb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
@@ -0,0 +1,27 @@
+SUMMARY = &quot;view/edit your binary with any text editor&quot;
+
+# The homepage listed on pypi is [1] but the repository has been removed.
+# Instead, set the homepage to pypi.
+#
+# [1] <a class="moz-txt-link-freetext" href="https://bitbucket.org/techtonik/hexdump/">https://bitbucket.org/techtonik/hexdump/</a>
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/hexdump/">&quot;https://pypi.org/project/hexdump/&quot;</a>
+
+LICENSE = &quot;PD&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851">&quot;file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851&quot;</a>
+
+PYPI_PACKAGE_EXT = &quot;zip&quot;
+
+inherit pypi distutils3
+
+SRC_URI[sha256sum] = &quot;d781a43b0c16ace3f9366aade73e8ad3a7bd5137d58f0b45ab2d3f54876f20db&quot;
+
+S = &quot;${WORKDIR}&quot;
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
+
+do_cleanup_hexfile() {
+    rm ${D}${datadir}/data/hexfile.bin
+    rmdir ${D}${datadir}/data ${D}${datadir}
+}
+
+addtask cleanup_hexfile before do_package after do_install
--
2.27.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F878E0C277F5EE2A86D18E6A--
