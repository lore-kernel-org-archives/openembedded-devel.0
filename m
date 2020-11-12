Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.65])
 by mx.groups.io with SMTP id smtpd.web10.10181.1605211288618014242
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 12:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lbTsghFv;
 spf=pass (domain: windriver.com, ip: 40.107.236.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etacH3UBNEo0MgG9KaYWNzbmQFvbYAqWc1rgDngJ6fd9pOhW4lVIWzn9AaIEQ9YJcI3dyplaTIeVFafCZCUWkjKBKoBcd64Ms/OxKPCiJVl36DRVfoDW9KPLRpWTiSIKTsFvWLKiz79gllDpXKcZe4VB6fLh5gYFNYJU0wvHby9MfTw8QIegV53q4KYD22Dawt42CayMVKi4i3RJzmtbotshnITAmBaMZ1AqYXQa9P2X2t0O/bREe2vWIRdXc9GXdmwwh3o1t5vgsnuHbL5pkqXyqzPO3EYsmlAnmwxgZKeRJjfxKAhps8c5ohtMXW/7QV+D6esk6gfDQdZiVJDoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6f0CalijpQz0XzR0Whj1P+VrO1x98n56st1cfQ/vb0s=;
 b=CsiPQ7ps7pyFOnzZZUtEmtoYDjBYvl2WstFIPTILk3khzTlot5dBS1LasgipJDchnZVm6xZZXoYMfgyoWNJoZ0jNuplhu8MXgg65Q3AOEU4GKSPzNMJfV4i3RFJvRrxgZGoa/V6ZoyHrl096Lw5TQdNp3xFz4zDnkePMM3nl9gBXb5w5QezsNQbk4TNY8cbG1NnpPKUY+79R9LNr9ALme2QRtf/iejkT+JdAtLLQG/r53zuSM/6+NluAvpgk8ZufEkW4Croic2Qj8hiZwmsRT4wBCkLDufS+gHdwd1vIuKAiY3W8axQWPcNx7q42JTOGYAajQb6jYdlDrbJDNNaG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6f0CalijpQz0XzR0Whj1P+VrO1x98n56st1cfQ/vb0s=;
 b=lbTsghFvxuGZ/a9YOzUPAQfwFB5PM6t6Z1B5jrx7MsrbopscX6uYd1wkWWfN/tpFG6Ili7qu+IcbW62vzd2FLZwsRPpo3rfqh8dBNa0YrdWcEn6/G2f/zUcm/SNUNYgdMcdIJonprRyJP0ogDtTN4dGeuyGjaCrYyp/msx9FSSI=
Authentication-Results: gpanders.com; dkim=none (message not signed)
 header.d=none;gpanders.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 20:01:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 20:01:26 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] Add python3-dill
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Gregory Anders <greg@gpanders.com>
References: <20201109192143.3739442-1-raj.khem@gmail.com>
 <20201109192143.3739442-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1c9b2f71-2fd2-327c-0713-b8c8bf49e272@windriver.com>
Date: Thu, 12 Nov 2020 15:01:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201109192143.3739442-2-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 20:01:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7296a1bb-8275-470f-86f8-08d88745bcc4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4960:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4960371597CA3605303E74329FE70@SJ0PR11MB4960.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0ICoJ57yUmWLwPJPI7cpwUS+wiE05EVQ8/JkHGun/Zp6oPQkiUWIFz3V+a0+VnIQP0TCIKG58740t3jx3Fb0gtbQo6dLKqtwBY5cPVwZ+j3578jWPsLDOC7al2+dxnKM7CsegVR0xWRRBGhmX0zHf0xu+hd3FSenNV/Be/wk6hgkFmQXR6o9EB4SvU+0to+4pd6ZyC4jsIWAmQGpxsKa9aSwmBkFaThJZWFYNbd1Amlm0i8Z94F41x+YLjTRfKWAhcyL6jt8QczR3g0RtoILGXUEhASQejtTBwUUjctPKUSzqrPxLKphhfKZnwToeZu+tJshvwwzaolJxTrIJNJwKjPceC+IHcv7ENDKmO4auBUMW7APpjg/oCwi3urFo2Ojrd+W7uOsSHxpPzH1/3N9/ynkpWm8s+yEDtgs1d2O7Cbtdbyan65fQfe6Gf9f9llfniZ25BDjGDKil+sA5BDi9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(346002)(136003)(376002)(31686004)(316002)(8936002)(36756003)(83380400001)(33964004)(5660300002)(66476007)(956004)(52116002)(66556008)(478600001)(2616005)(53546011)(86362001)(16576012)(4326008)(31696002)(166002)(44832011)(16526019)(186003)(26005)(6486002)(8676002)(966005)(66946007)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hph6tiH8e8jfvMmYGlCq01YjBjilFtcgq5rYcxJCObrFEpleu12RQ53TcjqbLLacWHWonS4533mR/HCUonrD4lHvHCLi7mr4tQZHIAXAXNjDKkdsIIjQuTAxLEszp8zOuiEE0K0pl9wX2QB5XPopxRXUPGZlExbOQKy/zU/LMnZMm/ZPvYBWa47Ha75ViN4IF9z1aJZxKkabsAG2huVCV1i17YHxbajSVFee1xgF9mZS4jJRU4m0ffeVTYCMEotd3XKdG6OfJZiUdmcB1CM2QFsnh2yH4m/NBBhjd6N4kTu0XonmTLuKsNEuj5xRcA+MPRwHc6+rXQvBYWNKCiRHeQAApVgYqqhOYjIwsv4EERbwPFn0gn651NK0qidhfJX0t0VbFHDcyWILqTqGVUO/SWYwB8znjcH5fvrtdrs0q+WYAuOcuNGKC/V9OHbr2P5K6G13goXXfum23j7g5jNOcg4dJykihgr9mulbiBzxCu1XfhboeibLI+qXPVVtOhzlm2Co2oH/FpQakG2Zrmc8fhVGPoowb+01qjmA60LJoC2Cevm1RwC4g8Ih17wbU6Qq4ZqZpTYPioWMjxLIky7hkZjutuNBgIIB7T70TNDXA5mM0e5WoaxSftPeHyX3SLJynOrB5ZnptlyNmG4HpGL8Xw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7296a1bb-8275-470f-86f8-08d88745bcc4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 20:01:26.4283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZl+Xx186p41BxcGdLmjBP8LR/MXSTkp5jXf0aXmSwHL2jeOVWqEw5KW0VjdxU4cmnudTSzLV4fQEVzps698Ra4BjpxrNBAVhR2bT21NKbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
Content-Type: multipart/alternative;
 boundary="------------AD10CC4986B54D88EF538906"
Content-Language: en-US

--------------AD10CC4986B54D88EF538906
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/9/20 2:21 PM, Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Gregory Anders <greg@gpanders.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb            | 1 +
>   .../recipes-devtools/python/python3-dill_0.3.2.bb        | 9 +++++++++
>   2 files changed, 10 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 248abaff7b..2476e34deb 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -426,6 +426,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       gyp \
>       python3-jsonref \
>       python3-transitions \
> +    python3-dill \
>   "
>
>   RDEPENDS_packagegroup-meta-python3-extended = "\
> diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
> new file mode 100644
> index 0000000000..b03e032669
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
> @@ -0,0 +1,9 @@
> +inherit pypi setuptools3
> +
> +SUMMARY = "Serialize all of python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de"
> +
> +SRC_URI = "https://files.pythonhosted.org/packages/e2/96/518a8ea959a734b70d2e95fef98bcbfdc7adad1c1e5f5dd9148c835205a5/dill-${PV}.zip"
> +SRC_URI[md5sum] = "543607e0a419f154dca65265e87e4812"
> +SRC_URI[sha256sum] = "6e12da0d8e49c220e8d6e97ee8882002e624f1160289ce85ec2cc0a5246b3a2e"
> --
> 2.29.2
>
>
> 
>

--------------AD10CC4986B54D88EF538906
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/9/20 2:21 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201109192143.3739442-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Gregory Anders <a class="moz-txt-link-rfc2396E" href="mailto:greg@gpanders.com">&lt;greg@gpanders.com&gt;</a>

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201109192143.3739442-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../packagegroups/packagegroup-meta-python.bb            | 1 +
 .../recipes-devtools/python/python3-dill_0.3.2.bb        | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 248abaff7b..2476e34deb 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -426,6 +426,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     gyp \
     python3-jsonref \
     python3-transitions \
+    python3-dill \
 &quot;

 RDEPENDS_packagegroup-meta-python3-extended = &quot;\
diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
new file mode 100644
index 0000000000..b03e032669
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
@@ -0,0 +1,9 @@
+inherit pypi setuptools3
+
+SUMMARY = &quot;Serialize all of python&quot;
+LICENSE = &quot;BSD&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de">&quot;file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de&quot;</a>
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/e2/96/518a8ea959a734b70d2e95fef98bcbfdc7adad1c1e5f5dd9148c835205a5/dill-${PV}.zip">&quot;https://files.pythonhosted.org/packages/e2/96/518a8ea959a734b70d2e95fef98bcbfdc7adad1c1e5f5dd9148c835205a5/dill-${PV}.zip&quot;</a>
+SRC_URI[md5sum] = &quot;543607e0a419f154dca65265e87e4812&quot;
+SRC_URI[sha256sum] = &quot;6e12da0d8e49c220e8d6e97ee8882002e624f1160289ce85ec2cc0a5246b3a2e&quot;
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------AD10CC4986B54D88EF538906--
