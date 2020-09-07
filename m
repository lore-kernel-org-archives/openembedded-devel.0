Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.82])
 by mx.groups.io with SMTP id smtpd.web11.590.1599495078605153873
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YOqliarO;
 spf=pass (domain: windriver.com, ip: 40.107.220.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIlfqCynHVp3022dZIfRYi5ev+Iia5xxWX01WLdOUwm9gZvdsDZs8joNMsoGjwHoPaVuRYHWRRwch2swiG293cHc7jWN/OvgQtQULYODZSHdlkXLQ7EI5JV4cwgAboW5Qikbs+4EfFF4YzKC8cROS3DRgE2uNcUEvIZbiUUuGoCWocDsHi4dPx0PpKl8ZI7oYq6U9tv/k3ATpVE16OfRRyPbQI4LR+Xx6KSCCGGqWxFZsT7Vy4BfVadPgFmwWwtZlf+hlkf+7CMDFrkegpSMu6XbVv5MwExGVseaLmRkQuzHUTgo7JT5WvRW+tRkaRqmhCLopeKCtW8ZDUWSuttFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ccl1FckPbWSm2FwJ6Hvu+fsJOmKI5ZaRdd5+/41z0Q=;
 b=EDX4n1/8s0UZC4CmIm1Q2hRREgWWH9qjRgB/WmBpoHPRWt7ZnjctW3nx8XfmYPuv4KhSA4ZjLYxNe+8s6pM0OvxrWIYSUuq1c2ItOXbmoigzhbcsuR481Z2r8Mrc9q3EELcL+gKYbhu0+NgL4X8T7H1kX6A1PdMaf92ldQP6k5S1LPzY3J7clzAqt/DWSAkxkwkABPgr7yXpsNIgCloKuEXLmfBtE2kju3a0W+8vrovGzHrr2OYP+sAJjSGyinLth4XBhh4nB++aON5t7M/rXcbvVnNMSgkUb7buy45SmImqZJrGkhj9LUreFzL9ksiRYl0500izcfWppB0B0EjuMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ccl1FckPbWSm2FwJ6Hvu+fsJOmKI5ZaRdd5+/41z0Q=;
 b=YOqliarOwinROr82eOXJR3D3BJQDc+eoxvlYxBLTiz+u2/RO5mgBd8Rp4qfc98XT9PyerefG8Qw7/a1GL9AkhcI26F0U5zqM0obnpyQVjSJQL/3BMjFvric5hJXmMRiqAhjJqCA2nevBWF0tc2hx2qdlf7Wiv1NuLavTz/8OdhM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 7 Sep
 2020 16:11:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 16:11:17 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] gyp: Upgrade to latest version
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
 <20200904134713.13164-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1b43ea4b-e6e3-5616-b202-0ae18fc794b7@windriver.com>
Date: Mon, 7 Sep 2020 12:11:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200904134713.13164-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Mon, 7 Sep 2020 16:11:16 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c709f91-b7d0-4260-2e8a-08d85348a688
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB367145C93095BD5F52CABBF39F280@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tsX+1duoEIO4mYQQ2CuKv2sbKz3Fu26cS0wk23MBpiaiW9hqGv9u17mwNia4SrnUzAqAmmKYjmL/KhY4c4xU/rFhYl1GPjSMgNQ/1O0yYrK0LTnzl0VCDaY3C2drlCJLBxRtVq/+EIqsbJElW3rESjyTCJzKP3PtLldqQdc13ufyMm71gR3hgx2aNx3a8BL80hID+HgZWMA5ZW4tX9H7HeQ+QLMDExQLfFxO01VYNTMdoUdmS65rohhzxzrQNysu4aNg77W5X0FzMEeNJ0uyqPWDBWkDDJby5NkXnPL66VB7isOXLyYYOdYEQ55JE5Yjtcv460mWQMabJaIRZg8z6l2w0Ws8elT/TNCEL8y6jTfGKBTnXiCuOBgwzivGtRtWfNCq57ZEN0R988hEylVPmj4OP8asT1NoUvUlXjgJaC0FIQA6n/38+IVdHS9pLuHffqHT3gCZRNdf4AzMDMuwaw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(478600001)(66476007)(2906002)(186003)(8936002)(66946007)(44832011)(16526019)(86362001)(31686004)(66556008)(966005)(6486002)(53546011)(33964004)(31696002)(52116002)(26005)(5660300002)(16576012)(316002)(2616005)(8676002)(83380400001)(36756003)(166002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YYplkUBhz48KvCA05Psy1JftLJ290OKzxqlCKy4x1rHpoa24v4aHYbfRSdZE/t1yEzavrhZnFs35LzS5GzK1vyxOU0pI0xf7fpKVVOwUkme7NvAncARv4pIl8d4chKpZlbw0FoeCkSRn4snO49XxiAsVB5g5PAfUrdby0IddzP9KwOSvOmGUwYRP28Vws71fvlvPMzLKMhqqG83YOCzQD6HY5UPuXx6OycOvjaGXxGzBmiqdohg8GultCYKlcwpq9zNP0vC1VT6tdt0db+jutquj9j7MPY9WR5Xfr1S/u0/tIA18J82Xjs0ZMxHJUT8Nd6D2efXNFvX9zOn0RrFHWJ7gZO3p0EKrDAPoCozZzBldO/+kNC3ztKK80X6yVx9eW/sHYX37lOspdDExvnCkLQJzLQAi1EWxki86mfCG518UNAHyTVllHZwipn3kGyLyXZMqQ3rnyYB/ZqLnTXlq1NPuBPSW2+5TIZCNyOF0Kb8C3m+MKdlpC8ikg5n+99u2j/MRtxdoWh5qMLmEgwZ+v93Bk/U6nXHcrZPFx7WvSq7D9Ev+2+YqbAV04WrTJU9GcpuJZzRP/XJ0UOK0rtC/1qZM2TMpWdQNmQv3svr4emeJkZnA2lEJon21EUtohXJ5eZtkmMutxexp/3CAE6131w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c709f91-b7d0-4260-2e8a-08d85348a688
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 16:11:17.1907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH5g66ydQ66tkSBfcm1GohIx5ypjV5UNk79PGIDNkjfGnir7gDn1J+kNUKOKI19sr3PG9vzPmHJvDi7f3V0s5Blz4OeLSTfjUUFNrA2QzAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: multipart/alternative;
 boundary="------------1E2C0244D53EFC4EDE02FF37"
Content-Language: en-US

--------------1E2C0244D53EFC4EDE02FF37
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/20 9:47 AM, Leon Anavi wrote:
> Upgrade to latest version for the git repository:
>
> - Add support for CLANG_ENABLE_OBJC_WEAK
> - Prevent propogation to configurations of nested
>    'dependent-settings' directives
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/gyp/gyp_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
> index 61f3c8637..d668d1ca1 100644
> --- a/meta-python/recipes-devtools/gyp/gyp_git.bb
> +++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd"
>   SECTION = "devel"
>   
>   SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https"
> -SRCREV = "fcd686f1880fa52a1ee78d3e98af1b88cb334528"
> +SRCREV = "caa60026e223fc501e8b337fd5086ece4028b1c6"
>   
>   S = "${WORKDIR}/git"
>   PV = "0.1+git${SRCPV}"
>
> 

--------------1E2C0244D53EFC4EDE02FF37
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
    <blockquote type="cite" cite="mid:20200904134713.13164-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to latest version for the git repository:

- Add support for CLANG_ENABLE_OBJC_WEAK
- Prevent propogation to configurations of nested
  'dependent-settings' directives

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200904134713.13164-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/gyp/gyp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
index 61f3c8637..d668d1ca1 100644
--- a/meta-python/recipes-devtools/gyp/gyp_git.bb
+++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd">&quot;file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd&quot;</a>
 SECTION = &quot;devel&quot;
 
 SRC_URI = &quot;git://chromium.googlesource.com/external/gyp;protocol=https&quot;
-SRCREV = &quot;fcd686f1880fa52a1ee78d3e98af1b88cb334528&quot;
+SRCREV = &quot;caa60026e223fc501e8b337fd5086ece4028b1c6&quot;
 
 S = &quot;${WORKDIR}/git&quot;
 PV = &quot;0.1+git${SRCPV}&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1E2C0244D53EFC4EDE02FF37--
