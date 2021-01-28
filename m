Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.40])
 by mx.groups.io with SMTP id smtpd.web11.24027.1611839331389387708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YIfDUC4b;
 spf=pass (domain: windriver.com, ip: 40.107.223.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJPkzOIRBPYMFFXhvbo2/WvDpb06+kUzwNqoLZQtPdxMw484p6Doc8WEknZ7Dmw4OIwhsyZWHakM/OeUFev3n+fqHDvF6yeYAmA8zPBI2rg80FqMjVBg3F2vRZOvQdx3oYKljFJWbA7YdPTnxKL3AyprTyN89mOODJ1CAGOtmqLctQs33i7Ras/mk0pTO7ULuNkCSJJfV21+GAOs2LUsWy4BXD0xksvhE9yrUbZbfMEOSP8NAm/pHfEzOC27Xfctnx2kcddzNHpmKfpkd/iNVRbGuvgSr12loRRVyd4WBlKEE8dCCUjKKIsBp52zAN8wXfDq9Zzj2q0bpRkNkPOJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpZwPcgAotM366lZDVaiyWEpQKJ5zfmOTZ/kbFFFZmo=;
 b=M8qvKdCULitZeyoBI/lE3w5zBaJiuCkI7ZqGU9SDbT9zQEJtcY+xFQTTSApI2GWE8pSLoTDGXi4gr5km8JP6RVQLIKswA0TV7M6CKuys5iCwqaWxRlD813DyBkiXtAtXxQop+PqCp/AsGUnoFaFkN1qNcg0D9UR7iFL6FoUtx5/zAEaW8RAGrMabYVZwYDF263J4O1Wp0tFTkrnLAPyehhCoVqOZPyewe/ANKbL0/E9aL4/oM0zK/YG3j9OPSqlPwm5n4sr10kpm7PFJ5P1IiE0r7kojjs7zKe8/EtOJqCf2K10Gb6/fVi7j8KXoaaQWkN1tHbhnFtuvDg5FzBhl8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpZwPcgAotM366lZDVaiyWEpQKJ5zfmOTZ/kbFFFZmo=;
 b=YIfDUC4b7QADzeKbOYC+8qycQT0+bI/VJwK0rpkoL/0Ve4a7CWJAP8VZbszNopYfemLJ5Ea/xu6S3715hpRNXl2F72bsg3F+IqgCWSqoB+soIy5nYkeOUUtyaJkHiva8QJmjQWrd+UT7/KDsixqkTmrq/F/MZvx5XMTqpSulzJ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:08:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:08:50 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-nmap: upgrade 1.4.8 -> 1.5.0
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1611682877-4449-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e7655a44-0b9c-f454-a1f9-b88ed2079508@windriver.com>
Date: Thu, 28 Jan 2021 08:08:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <1611682877-4449-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR14CA0029.namprd14.prod.outlook.com
 (2603:10b6:208:23e::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR14CA0029.namprd14.prod.outlook.com (2603:10b6:208:23e::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 13:08:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5578e75-46af-461e-631c-08d8c38ddab5
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951D9E627920CA0B50E7D049FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u2G++HJz691v//29OFIiBm446mscgpQyFXUKJ3XQCTc9yKKHkyXRaX1xF0CZJo/6QPcCICYDuYooxrBayouaJOght+TOLbksIN8DiHCiCb7YmRZutpqN4HBdCj0u0p30ieNWiMf0CjUQEtVkbyO1b+S790JQOLCk32/heFTRdoqgAglienmRQJCQ4VWBGPZxyAKAAN7mUh1IyJzQSCwuWWFPsP+DEIne6WGQ7YHZlEvayfqimzd4wrkIRxjpwtIGfOXAOyKkVdF8A2pN/O2qPqZ8LQjwHz+UAZtkf/j340HVuNZrvXxc9DMCcCfioSyCSN05IefW5LFBcgpZvrKiEaS7zvWWVQw2irSNQ1m8g5rY/KhmdTDtLvYYP08ZPx/4rWBA4IaOAZ2Yu6MNZUv+kC+2G8ccPv4zMqcQm75sac/Dqbf+CME5j+kEO6dvAfJGNrf2OHZVflKdWpAfiM0kQ6237VMpxsF41atUUvR+iDRwLPQONWx5PULmPT7LqyDp3X08cRiIxeet9HFqOvJ6BYjQ3CiA5XpI6KK3h3aGnBGFynEb7a5rhEarH5UUxcDAvXQrUDdDVoa0JmWYq8Zd21sPKGoliE/CdxYN9XGIHhXgtuYQGWvHuPOEFHGF2w4/d3MKYlDoutpdqGkezuMstVf3yE5w6CA8ptvC1aHOPulqti805kx1GfdWa23Q4i3k
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Z3g0WkNjRE9KSTNyRzlYc3MyOUhubStjM2xIUmZ1b0oyclZMMGpXZlJ5T3JY?=
 =?utf-8?B?M2xmMUh6cGovcS8yaUV5a1M4eklDMzVadUdMc2F2QS9tUXl6R0wxcWtvVVds?=
 =?utf-8?B?NFpWUWl1RE5TbDhES3lHNWU0UW9KTHJEcnBJM1ZuOUFTVng0RzUyVnhxVk9m?=
 =?utf-8?B?RmxORUJJTlFFeEZMVC9wN3kzaDI1bENqMnBsL1p3MUEzbHZrYlJTeDN5TUZx?=
 =?utf-8?B?NjIwYkdKcHNCSHRBaGtQZmtHWENRc0pzb3RGcUZkMnAzOE5UOTZIck8xc3FE?=
 =?utf-8?B?Q0ZleWxTUi9aVEVwNCtySEwxaXFiWkFCVzhsZmtZL3RJekQrSm9sL3oxSG9z?=
 =?utf-8?B?S0NaN2IxSExKeURDWnN2MGlCc0Y4OGdKQW5pQmtiWnR6eUFqSC92Z2ZWNFZV?=
 =?utf-8?B?RU1FTDYxQmZ4Z1VLQkZjWW1sa1M0SFl3UjBlVTN6MEhjNDJPbzJ1UVdqSGJv?=
 =?utf-8?B?QXh0V3kyQ2ZZSEk3YXBMU2lyQzFtYlRncTZSNnQvbjJxbHZLMUFVVXQ2NWRH?=
 =?utf-8?B?MXg1alJ1cGNEOWJQSXpHMjBnN2dMSEg3UVVYRHFoOVU3NG5wcTdQS3dUVFhP?=
 =?utf-8?B?ZnV1aHk1ZEZ5UG9QakVtZUd6NnkyVEVWUW8vNW1Pd1JSMkxkeG9YQ1kvT0pN?=
 =?utf-8?B?SWZseFcyM0xyWUNTc0YvNSs2a0tSV3NsMEhJcW5XNzBuUUs4VzlONHNHaEts?=
 =?utf-8?B?WUI2QTUzU2oyY3lLQW41WWF6WExzZUZoRXh1RzFabW9xOHd1b2QxN25vUmlC?=
 =?utf-8?B?M2t0NUROd1JtbkpBVlBja2h0TUdPRmRabER3NDRpVjY4aXM2WjV4aWRMU0tn?=
 =?utf-8?B?ZUI4K2RxaWNyRjVNMEF3V0RCRjJMV0tnYUFNNmNRY0VvbHlzckpWTHVaSWIz?=
 =?utf-8?B?aWxGc010WkkwVVY2MkpEQTl4MlJjQ1c3S042UHcvakp1LzdZUUd3RDBSbWFF?=
 =?utf-8?B?Lzkzb2E3UEUwanIxek1KVm9SMDNzZVFQaW9UN1pQUjIyeUZxWTZ4OU9jWXBB?=
 =?utf-8?B?dU5CbHlvQ3BhYUw2Zk51MWM1aVZHbmFBd05WTlRRVU5kSXMveG55VzQvdHdn?=
 =?utf-8?B?UzdoY05mdC9BSVoveU45NDhPbmpBZXJFQWU5QWEreXdmOXB6RkZmWG1jakE3?=
 =?utf-8?B?UjEza2RhVkpHZHh2NjJtTjBXMk8rdHZ3MCtrZTVJVzdaM3hRUzQyQncweW9p?=
 =?utf-8?B?ckFVTlBvdVVZVTFHejlKWEZhUHVoNmFwZWlXZFRwL3YvYStQeHVEcU9mSGhO?=
 =?utf-8?B?Vk5XU3hmWnN2Mk9sUWZrQ0c3aHJ2Z2l5Mnc5NW9xQy9yUFl2WFJObVFmaVFM?=
 =?utf-8?B?UU9JeE1LSnpwbXU0cW4wT2p4ZlN6clhaazI1SS9QbjZ0bW9YUmYwd1kzNnY3?=
 =?utf-8?B?Y3V1Y1JLNGgxU3o3dnRhVE9qa1FwSlc5T2xxL2tSQjUxTm5yVVZRSzJPRG5p?=
 =?utf-8?Q?V2wzp8Lc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5578e75-46af-461e-631c-08d8c38ddab5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:08:50.1909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGRjW/ielB8iQkgpd9FEwGFk83fuNcN6rPIuQhQ1F5JXWBSga19GdlE8CYzNGDuBHuESnfFio/p5Bf2oeA87ylflI9lHkvYxi2E6lByTlg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------3A59C3D168BC417D4695C123"
Content-Language: en-US

--------------3A59C3D168BC417D4695C123
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-26 12:41 p.m., zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-nmap_1.4.8.bb => python3-nmap_1.5.0.bb}     | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-nmap_1.4.8.bb => python3-nmap_1.5.0.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb b/meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
> rename to meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb
> index 2037d496a..e6f093360 100644
> --- a/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb
> @@ -8,9 +8,12 @@ DEPENDS += "${PYTHON_PN}-wheel-native"
>   
>   PYPI_PACKAGE = "python3-nmap"
>   
> -SRC_URI[md5sum] = "e7904b39b64a8a44f275388862659a0d"
> -SRC_URI[sha256sum] = "8d7da78142bee665289a243f71c5f48407d8ab7e5a02ee672ded05f339044759"
> +SRC_URI[md5sum] = "3a43dd0f56ade8c76c7c6f994604212d"
> +SRC_URI[sha256sum] = "b52744e0c9944c567733b8deb60d6363e17233ee40466edfb1b09a5780576f9a"
>   
>   inherit pypi setuptools3
>   
> -RDEPENDS_${PN} += "nmap ${PYTHON_PN}-requests"
> +RDEPENDS_${PN} += "nmap \
> +	${PYTHON_PN}-requests \
> +	${PYTHON_PN}-simplejson \
> +"
>
> 
>

--------------3A59C3D168BC417D4695C123
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-26 12:41 p.m., zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1611682877-4449-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1611682877-4449-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-nmap_1.4.8.bb =&gt; python3-nmap_1.5.0.bb}     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.4.8.bb =&gt; python3-nmap_1.5.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb b/meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
rename to meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb
index 2037d496a..e6f093360 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb
@@ -8,9 +8,12 @@ DEPENDS += &quot;${PYTHON_PN}-wheel-native&quot;
 
 PYPI_PACKAGE = &quot;python3-nmap&quot;
 
-SRC_URI[md5sum] = &quot;e7904b39b64a8a44f275388862659a0d&quot;
-SRC_URI[sha256sum] = &quot;8d7da78142bee665289a243f71c5f48407d8ab7e5a02ee672ded05f339044759&quot;
+SRC_URI[md5sum] = &quot;3a43dd0f56ade8c76c7c6f994604212d&quot;
+SRC_URI[sha256sum] = &quot;b52744e0c9944c567733b8deb60d6363e17233ee40466edfb1b09a5780576f9a&quot;
 
 inherit pypi setuptools3
 
-RDEPENDS_${PN} += &quot;nmap ${PYTHON_PN}-requests&quot;
+RDEPENDS_${PN} += &quot;nmap \
+	${PYTHON_PN}-requests \
+	${PYTHON_PN}-simplejson \
+&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3A59C3D168BC417D4695C123--
