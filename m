Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.70])
 by mx.groups.io with SMTP id smtpd.web10.546.1599495006078785471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EjyVi4tQ;
 spf=pass (domain: windriver.com, ip: 40.107.76.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdPNExy03TJAJ9YmIvcRbL1Spjt68dXt56gEnAYtOBYsLkI8kMTlU8blePwav/RlyFV6+S5AWJNIhxnleyqTOGG4xRrPV1cFFWciZictJCUvaE+AKw4pHWxyxEWMs3I+BGBMmSyFROowskFxiPDBQmKenXWAOCbhATI+gdERG8DzbOyJS5pxckeC1ZE9jcgglSjPYYTs18X1u9XBsVHQC1A6t48bL0AOoaKrRMJrkNw0DlO1UYk27cu78tiX4tgt++qn8kuJ+y9wDy6BN2NQJYNg4XOgQ/INlX+dKEmavgFUnt9MdcilJHcki6TlBcbP1kt665hcmkc1JjFU6qVESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5asc1LW+TP0JDCQp9DUKm5qgn9CS2lCs0v24w55Wns=;
 b=CkjRo5REfXD7HCos92SLSokJ4Q5HEd9OrXxRwzIDH9eMBmb6Rq2/LC5fQGhkk7yx0Xd5IGbg+Fr0sahaLUhi4v0wKcEudZ/Fmj0vDZRhdaQIq0lTdaLLxgBfmd2sX/kDgQnDPSEMUHqP0qujKQRUUIPNHOdk3dm2ypzyL5wdlamIcC+MMyKICBF9mnBpsH48lfAnaHO7CdQ/3iQbJ5i/kQEOxg9Sb8BXPZ8cuGZX46C75D/OYMtjhTkHT/QRV6XQH4MRD7QO6jrbOYWGwENem2cU/AKilstXJqwFFt9xcoDRJEWjIyIWjVSfOWYlATP8oNT3QU/hoflvs3u6WxvhCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5asc1LW+TP0JDCQp9DUKm5qgn9CS2lCs0v24w55Wns=;
 b=EjyVi4tQvEIOQoDv7iSKqlV+nIuvGSshuM/9pteVNMmEd3ERnv/EqkCJGnmGWOGYfo7kc/l+kghuBqErc8h01rgUown/E128MKUsCep5PtvCuhE5VdrxozrA8C/vmMMF1SBySKv7t6CROJGo9pLguUloX/JgL4U6iIuzVLZjTSc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 7 Sep
 2020 16:10:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 16:10:04 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-traitlets: Upgrade 5.0.2 -> 5.0.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
 <20200904134713.13164-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <58104e70-f1c6-43be-666b-89f57f69ab37@windriver.com>
Date: Mon, 7 Sep 2020 12:10:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200904134713.13164-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::36) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 7 Sep 2020 16:10:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4df58d2f-54ac-4da3-a53e-08d853487b69
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36716F5BC2971764223440B69F280@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pQf11swPKUG8FjxPYv+DeU50Mz2u2VY3VAK+HOh/3AdGgSWqipX/czaZjXA6bW7ysluidzes5D3vTVx2wB+FsKhMNAECDKkfnmKNKAuPMwqZjY54MUJPKkBAKhgNL0y3A2NccEPuXZduHgutzBDF5Ojj0MZXL1Gy6WnPQ7ci/k0xvDRYdFu2WtqqjnTtcGsUXscYh+BkzfJahAV0vrScpJeFoWVyfZRSdL/JyOsdaZ9zQ1gDjjGcOV/znTheoTK5eVhFtW+8MaACr/YnHTMkAK4VWFVfjGkX91d3oLBkGYP5aFqKIMTZK2PuQ49t/R/yYrIpYnbXYaEERQMlzoX2+IajCL4tlbEj86gnBQc4pYFyuP+Oh7tm2DQT7agFdcWW8ZCd41Sh7bvtZaAoYTwb1074gXqMtAUW4brFYx8ELp9/MSVpd803c/pha0QnD2NQjloRRIKi89q0cjxU1ZeTUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(478600001)(66476007)(2906002)(186003)(8936002)(66946007)(44832011)(16526019)(86362001)(31686004)(66556008)(966005)(6486002)(53546011)(33964004)(31696002)(52116002)(26005)(5660300002)(16576012)(316002)(2616005)(8676002)(83380400001)(36756003)(166002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	t6JbqfM6pUPkLk2RlilP+vref/hiHa+yDCCB8YDXkTjJGO9/3SwtcB8BEhqYJdv26z7uq8lljABREAuY2H14FWlXmWgY7FF6W1ugTBaAMfND7R194d6n9BLgJQzYQm3NP80g0Q0O/46/HWaf/P7GquFA703XjCxWzPuF/MiK1hWVHUDcGlEsFNx8VAgj9tlfvQZIoycwvpRnZxc0By+sL6qeerOrnoDpf2feSbERjZgFNztN7nQ+1JWxdPsNyedBSnyBRf9uCuvHvgoFn0jUE1mxz1N8QhrgwXCOvq+Eg/qWKcNHCLB3s7g2yvnHFbHUGhKzr0uJRv12VfObPc7/u4F1LKQboLHfR/oxe8vwS/7oYwovSxrw/Sknd1CFiUyzi0xNEYJon1kRT7ruPzfEHC0frEZrruVoOTw/T3blJ7pLilc3iZK3OqZgn30FtuVboWBD3k8gnHlyCWJW3ltyEtJW5zyWBk68N/jEKMmwyQ28NoaJwf4F53AobLMPIbSZowbHqSQdMkBDWGn+CqtY+z4TyzEYkMG0JzdReeJ53rUAkBIEGuOvqNtjsx8pkvEPYpmd8/bEKbvGUi/bZ+fLPShKLokm24e2UtZYmGFmVji6JpnJWvX8m9ImuL+rxnU9BiEOIQ237InVi1sRf8Yc3w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df58d2f-54ac-4da3-a53e-08d853487b69
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 16:10:04.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KwWv4ehxhpXjGumc+z6VBH8RIpsOIJoToAlkU8raeKZyX755B6v1GMQBIqDzrnIjLrgGLRdbIVYaTKGfo+i3LuzT18i8WyUwCDNhcrYH7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: multipart/alternative;
 boundary="------------654DC093938FF863BDB82D4D"
Content-Language: en-US

--------------654DC093938FF863BDB82D4D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/20 9:47 AM, Leon Anavi wrote:
> Upgrade to release 5.0.3:
>
> - handle allow_none in from_string
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-traitlets_5.0.2.bb => python3-traitlets_5.0.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.2.bb => python3-traitlets_5.0.3.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
> index 49255fcf5..02908dea9 100644
> --- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
>   
>   PYPI_PACKAGE = "traitlets"
>   
> -SRC_URI[md5sum] = "7dc642d19d1268a8268f46f33ff871c6"
> -SRC_URI[sha256sum] = "4c9a7212db9642056ea4fcd4ba9e18d302eb617daf679f45fd8cb5d19687b640"
> +SRC_URI[md5sum] = "66b76cfffd590c39861bc11c247725a5"
> +SRC_URI[sha256sum] = "a2e91709a0330b6c5d497ed470b2feb1ed8da5c9dd807c6daab41f727b9391c9"
>   
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-ipython-genutils \
>
> 

--------------654DC093938FF863BDB82D4D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/4/20 9:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200904134713.13164-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.0.3:

- handle allow_none in from_string

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200904134713.13164-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-traitlets_5.0.2.bb =&gt; python3-traitlets_5.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.2.bb =&gt; python3-traitlets_5.0.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
index 49255fcf5..02908dea9 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46">&quot;file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46&quot;</a>
 
 PYPI_PACKAGE = &quot;traitlets&quot;
 
-SRC_URI[md5sum] = &quot;7dc642d19d1268a8268f46f33ff871c6&quot;
-SRC_URI[sha256sum] = &quot;4c9a7212db9642056ea4fcd4ba9e18d302eb617daf679f45fd8cb5d19687b640&quot;
+SRC_URI[md5sum] = &quot;66b76cfffd590c39861bc11c247725a5&quot;
+SRC_URI[sha256sum] = &quot;a2e91709a0330b6c5d497ed470b2feb1ed8da5c9dd807c6daab41f727b9391c9&quot;
 
 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-ipython-genutils \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------654DC093938FF863BDB82D4D--
