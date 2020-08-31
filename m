Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.42])
 by mx.groups.io with SMTP id smtpd.web10.53099.1598879573180087141
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dn+cCaKt;
 spf=pass (domain: windriver.com, ip: 40.107.243.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkPo2xz8R8hmmc+DiGnWcKjPAvOLxmUXDXnDuHS3l+TJooKPagEwW1lm6D0M83J711JZJ5/VPgGY0W+KZYF+KCqGoEql3W/T9zp9/PpS/cnunzJAY5gn+ymCWlwvwdphZkQc+4Fsv9LXeCtQi7tWBLkkzdBvfKiJ/gsN/milACx29rdeC7ev/KnBZD0y+MBW7oAQHj5kP7tQl7P8ZX0RHIET9W7gYn/fSRyaWIDMxjb0o35kxGdUp6UrO0lRngAd7r29pjBfXeDH6wiRfDsLJtbLIsdtcXctd6VTWq0xQX68KvBLErSZuG2rKdb8fnBf5PpJbj2ddhW0molUrTVkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLBE8oiOAFe727iBXpI/UOdbghAQByi1N8Vlm6/k6DU=;
 b=kiCTZ48gLnR3bGPjNNZoHGmxxMTXN88w25jLshuQUbYrn9DrEKwzxVBFU2QWPoJMdPsskEwLt+0IprcmAvJ9Mxj8Ebtizs3BzSnz2JBPMcBnDCyaO3sL4KoA2UwK6p+DlAOEItZgW8bKIWGRdayB8Xkzx/4VgR8XJC+R0/yJa1+G6gZOPKjLcket6t2M165zdpB1tylMzMaoigbeLQvUkIs/GheDFkWRObrj6fObdg38CM/darjBv2vFur6mL81IrCBBd7rgqxYp0YtuGM/khpTOwMf72h+3RGbEyyZnCf6wTHwEuYLqbt4NSicYBDlsSgP7aUyH3tYWDR1uCA4ilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLBE8oiOAFe727iBXpI/UOdbghAQByi1N8Vlm6/k6DU=;
 b=dn+cCaKt8mUYgrhLd4/IiVeKzbCgOpbDrM18pWnNAdvBXz9EzoKQzYNiLtOa2aG6V4wvgjcjABaL3KNn5a2AFF+uZ+yFOGlT6ExIuAiayIdXoHwIYGryUPWJts5RKOfBgJM6523rw3w0bwCnricm2w4dtTSWU1aEFzA/O0iReTg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Mon, 31 Aug
 2020 13:12:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:12:51 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-flask-restful: Upgrade 0.3.7 -> 0.3.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200827145504.29147-1-leon.anavi@konsulko.com>
 <20200827145504.29147-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <73185dff-75aa-48c4-49e1-df681e9f63af@windriver.com>
Date: Mon, 31 Aug 2020 09:12:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200827145504.29147-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::36) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend Transport; Mon, 31 Aug 2020 13:12:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6d4fc69-af30-4c01-156b-08d84daf908c
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB422656674D94CF8B0DECD3B19F510@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FLh+qrm+c/t0XVSoxa6cgICEfV+D2n1oukpfMQ56VbhXhsVFlR01BNO+7MDCS1UIc5G2aS4tSG7FFbVpWPDg9UoPYhyUusZWuN58sb4U+Vt7ik6R3M9Qam4AQOiq08foLOqa1YQbvw+Ft6A0ntKYE01uQInIEYG2ypF5fhSwG4/HG3VHiSHYRKEGiTpexQgVxmMR39PiyriCTDjPf2KLlqi6/t1fy0G8x/1W22ID0wSoIPHO7T+PqixF2jO4VfT/ZhJcA8iWrln6hmKLJdK2Smb1P8rR+ELzwM4dsGEcOnn6hWSyGkU0hXpeEMrgjEPdEVpMmKSEa+fyRzld4fUhUpEPgePrzJUKXEpAOvOyQUnau3XPkqTgmq/pfFI7vZZSq3jhAbizs1nEa0z3xTxHAJzAOiKgwGOKzjNlV/Q0vN0jnL8MY2uSWuAfonZkxkIFEKbnpCA601whMqqPVNVVqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(186003)(8936002)(2906002)(966005)(36756003)(478600001)(8676002)(16576012)(66556008)(52116002)(83380400001)(66476007)(5660300002)(26005)(956004)(2616005)(44832011)(316002)(166002)(66946007)(31686004)(6486002)(33964004)(86362001)(31696002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	230HRnJ42oMELXs36UVnmYVuLwBJ67F2HhCVvaMBbFfz2CCj4UP3qxc1BxHo21l4a4MrTa0Hz/govaLPFSKsvvSAmKMbKAo46wzg9RTKqrxocXg3ZN9yuo47SMRakAB9dT5OjT/B+96SDLo1T03GeGw15s3wGGnXHcZ6EmQgPccTUVTEGIRW5QZD0OXAV6ss8l3a5k6pO0m480oKJFn2fGGU+D19oQAa+M6Ks26EfXihw1U1TCAOBaV4hKfpPd9com7biDHaMlTRoEaiAQry5E5+PCeCXSQRt6dS9c6bVCqkMEDdGPlpPo4zUzaq6W9vHde9fZdVs1aWU1l506eABgUhIXwmca5ykZKj7KppnpVoxrwItN1PE3CwmDLl/tM+kEompVvPteZWSyLT8WAhjk9Gw9L+nius1MwxO4WoaL+7ju9I2cb1OLT1nnGvIREsjQg2LkOqm3IbDcAXXNhP94jyXUpASGO/DTmo3XzQJraVjI+51bRci8GrnF7vMPxwdc5rQJ9S6nJkOs3cWJaOctu/xHvIt5nrm+4+24DTV1lhyULB7ZptdB16EHh4Apiugwgs/SrRBFd8im9qUaQ22Uk2mFp1eD4CbTBqXsw/uMizUytMHqdljW56jjOs1dtcH58GMwTtbwwt6bVQVgXytg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d4fc69-af30-4c01-156b-08d84daf908c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:12:51.6088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEOHjYuqercUYjWko2dnXoGnG6PWpjS7e17j2RnCogQBr+1B8kwwhWrjW2A1JbszVGmlSGM2Zfn33UuIS5Q2AoA2D/P+Qkik4Hp4c8edWZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------9B05505EC794EE1DCDAC1D0D"
Content-Language: en-US

--------------9B05505EC794EE1DCDAC1D0D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/27/20 10:55 AM, Leon Anavi wrote:
> Upgrade to release 0.3.8:
>
> - Add Python 3.8 support
> - Fix wrongly parsed Decimal fields
> - Fix overridden response when calling abort with Response
> - Various small fixes and updates to documentation
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-flask-restful_0.3.7.bb => python3-flask-restful_0.3.8.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-flask-restful_0.3.7.bb => python3-flask-restful_0.3.8.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
> rename to meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb
> index ad2757838..3de916afd 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/flask-restful/flask-restful"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783"
>   
> -SRC_URI[md5sum] = "a7217ef1159be38af5faf61aa09aabef"
> -SRC_URI[sha256sum] = "f8240ec12349afe8df1db168ea7c336c4e5b0271a36982bff7394f93275f2ca9"
> +SRC_URI[md5sum] = "e8051ff104ab4b3b867ba18d28953fae"
> +SRC_URI[sha256sum] = "5ea9a5991abf2cb69b4aac19793faac6c032300505b325687d7c305ffaa76915"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------9B05505EC794EE1DCDAC1D0D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/27/20 10:55 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200827145504.29147-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.3.8:

- Add Python 3.8 support
- Fix wrongly parsed Decimal fields
- Fix overridden response when calling abort with Response
- Various small fixes and updates to documentation

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200827145504.29147-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-flask-restful_0.3.7.bb =&gt; python3-flask-restful_0.3.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-restful_0.3.7.bb =&gt; python3-flask-restful_0.3.8.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
rename to meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb
index ad2757838..3de916afd 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb
@@ -6,8 +6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/flask-restful/flask-restful">&quot;https://github.com/flask-restful/flask-restful&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783">&quot;file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783&quot;</a>
 
-SRC_URI[md5sum] = &quot;a7217ef1159be38af5faf61aa09aabef&quot;
-SRC_URI[sha256sum] = &quot;f8240ec12349afe8df1db168ea7c336c4e5b0271a36982bff7394f93275f2ca9&quot;
+SRC_URI[md5sum] = &quot;e8051ff104ab4b3b867ba18d28953fae&quot;
+SRC_URI[sha256sum] = &quot;5ea9a5991abf2cb69b4aac19793faac6c032300505b325687d7c305ffaa76915&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9B05505EC794EE1DCDAC1D0D--
