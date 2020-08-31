Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.51])
 by mx.groups.io with SMTP id smtpd.web10.53020.1598879373783618555
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CtO7EHZe;
 spf=pass (domain: windriver.com, ip: 40.107.243.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVyaf8j5B6Taa++bnggard1ZQnqQGd0frUyIhJ1KggDYZL3x+3TsM9DK3tQM4+p8zBjSrWh5LV7FgbcTp+/nNAPJkwDtTbhXIPZ0dGCkLZ+3yP2sXR3IdXSoLY0Xfrm8y8+KQdN+aeTp7OOFef4ECgyCLn86d5JjNJS8CKF05DGYSkGwRAsyOk+eor3vWoasq9YVe8k5+0iSI+vPl/Rzcm84J1zaVSDkpKfOIQ7ktD8ghAfiuIu62UXQPKynJtdF6HXrmRrAu44odEoqTiTxViF+ZErKPSHjZ1eQSoXBxcjQHsrLyaildhRKppE+GsCoD59TmJGif3/1hUPH2mdhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfQ7EtTlpbTWBUyVku4Uk0Uoej+modZFwCBUiuwv3CE=;
 b=BpCtJo3AqsvQhPr6UzxU1iVTr3/CNaPDkPYyRHwehHg7ZPiQmTohQpy7ui8bdY25e0PPT5hvOFd5o6NZPGAPZB+MkUYsJE4Kbyy5fcw4xwfJov6Uru7GO4AC/3NUzy34B3o8R4Gn2A307R2LZuQPB13np1OO4/Kcm1Ru4/KnOQZOg6BY8MnMlL759AQ7lXg7rq40QNohnS0APImrL2mRo1dsPlULNtoZQxrlP2xFt0YkQZS1DRhXc9j+WLKBlJwcMTYnRAXNHlB3GjWLRpV2W0am8dzyDy6qGq/iMGwVTmehxGRH3/2WMQh0z8zUgUsynOorBpfWI+aIzOoBom1YMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfQ7EtTlpbTWBUyVku4Uk0Uoej+modZFwCBUiuwv3CE=;
 b=CtO7EHZeOywzZpaglRSB/xORYvk2g3cGrJfJiuP35wfKUeY3fivR0z8/+1Z0RHizccBcxcUbA4FdHyzLj+iPmYpu9utlF2xfxL2K1yBKgPCp6lhGVxSvrv78fIGN/RgOJ8UOxngbqN7aO5x9Ep6n4gwFYxdi4a9bc1heEv4UXKY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Mon, 31 Aug
 2020 13:09:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:09:31 +0000
Subject: Re: [oe] [meta-python][PATCH 6/6] python3-flask-socketio: Upgrade 4.2.1 -> 4.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200826154020.29208-1-leon.anavi@konsulko.com>
 <20200826154020.29208-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d403f6fe-54ab-c3c5-f104-81cbc82cc83d@windriver.com>
Date: Mon, 31 Aug 2020 09:09:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200826154020.29208-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 13:09:29 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 673d20c2-1609-45a7-0c5c-08d84daf18d0
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB28076262EFFCAE60203D43C49F510@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2qlc90R+r2TOsU8GWgPnKYKIB1gh2AmOSgUZ4FybO/KC6tLO3Qm+0M2TrZ6EpEWkOk4h5k1JwOT5nHIMgruD/QJ+MVHcqZI7xnQ7weocL9BgUEcXxu0lHmyAtLhCzSDd7lEH9cuaUR+UVtqA2wTCNPRNRGCvM8HhfsZWlO3tfUsYjO5+QBP4d9zGwlYxP8rRY5fqatqMwjc1Lp/llss2UN0pIBLG8wl1WNWhOe0+KvsiVZ1nsVjzZ5mQwxSHIsxvuMAMcJvkWzWSF96bYJckqf44+NDM+eAKN5+hiwCsaXvdLNGfMVSbbyFjRTDlXTAA9bPd/3WSe6EmCV76DuppNIvQ+xSowa8CaSQzXK8H9iwEot44sVPLTd9CDHjtmdQORC1/3kj78RvdaT+zg+Im2Wgm94wIDfdcx0RJA2iu58aPJU3fkm+a+cbX/Du2Tf9jLzerLRFuuUu5FB4BjEX7TA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(366004)(136003)(86362001)(66946007)(5660300002)(2616005)(66476007)(8936002)(83380400001)(8676002)(31696002)(31686004)(966005)(44832011)(16576012)(52116002)(166002)(478600001)(66556008)(33964004)(6666004)(26005)(2906002)(316002)(53546011)(36756003)(956004)(6486002)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xLWc/8vJALf33BS1tkiMtk2DDFcrc4kb6BuKDcpNNkgTnr7/kw0UclRkMdyelloylSHTr5yytPHMK9Mt2WP5Jr1DXqsJ0uYqwriYFUUxk4e0n+Pp11nqt15BBBl9OrIJf5C6VkQbe+pk3Xze0J2nWbBSY3CCCDSF7pewpRPAUj/HAq55J1Y/JUjGZXKaST8uMLxDi8N5i1AKXC+YFDjD78Oa/i554UUmJkeOvqJhYwFflJFZ8T6M2mmJmOwsgRcR1dT3PRtOc7GPJM+ZDTBqtFmv+yIhK6s7MwcphsxPjqTNf5QLKiPtexZkdQGgI3nSKEuOhkn/oN9jrHY7D9VLXo8NZZg5V0Fl1WI9mL0BDR8l3lH/X7/qlT78WyJc0YQ1Zcx3k6812mjLTrTkHKRxCI0veam7Y+e3eUyze4636LVSaial0VzO9FiutJzz2M5UOweFImnkQi6mC4TsxutXBCJWy0DB8F94pMTtYXPZSg2CkTOXk2sThQv4TcEIwBJc1mMLTBF6RClo/Edf+xs5lfIY7l1CfO4ocQERPi7jZuCN6WOs+O7nXzGYBQ5fVyvGnwliPoiKqxc+SUAqi6ulpMuvVSN/bFvGktLz1/aW2/IwNlBkZJLg3p+IzZyxN8qXdlLzu7T7A9zhaOlhRAl7pg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673d20c2-1609-45a7-0c5c-08d84daf18d0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:09:30.8635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/8KreNllhxEbIKdKKBs/zIkHJyVjVKuaHIAsihQLwwQlTZsq7hpyDXyOfqQqmfmkNfFhnAqdL/Bjo8NTQKjma0mHen+G+8RZR7+8BqEOZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------2AAC7D1C6907C7BE1C4BA369"
Content-Language: en-US

--------------2AAC7D1C6907C7BE1C4BA369
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/26/20 11:40 AM, Leon Anavi wrote:
> Upgrade to release 4.3.1:
>
> - Fix is_connected in test client
> - Handle callbacks for emits outside of request context
> - Improve test client unit test to use two concurrent clients
> - Accept skip_sid argument in emit
> - Fix is_connected() method in test client
> - Log warning when gevent is used but WebSocket is missing
> - More accurate logging documentation
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...lask-socketio_4.2.1.bb => python3-flask-socketio_4.3.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-flask-socketio_4.2.1.bb => python3-flask-socketio_4.3.1.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
> index e5fc54136..b8631bf50 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
> @@ -9,8 +9,8 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "Flask-SocketIO"
>   
> -SRC_URI[md5sum] = "b23222fb7dd2f0676d78bbe24153fd80"
> -SRC_URI[sha256sum] = "2172dff1e42415ba480cee02c30c2fc833671ff326f1598ee3d69aa02cf768ec"
> +SRC_URI[md5sum] = "d7992b0b4aaf473b7eff21fc14e8d1b2"
> +SRC_URI[sha256sum] = "36c1d5765010d1f4e4f05b4cc9c20c289d9dc70698c88d1addd0afcfedc5b062"
>   
>   RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-flask \
>
> 

--------------2AAC7D1C6907C7BE1C4BA369
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/26/20 11:40 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200826154020.29208-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.3.1:

- Fix is_connected in test client
- Handle callbacks for emits outside of request context
- Improve test client unit test to use two concurrent clients
- Accept skip_sid argument in emit
- Fix is_connected() method in test client
- Log warning when gevent is used but WebSocket is missing
- More accurate logging documentation

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200826154020.29208-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...lask-socketio_4.2.1.bb =&gt; python3-flask-socketio_4.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_4.2.1.bb =&gt; python3-flask-socketio_4.3.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
index e5fc54136..b8631bf50 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
@@ -9,8 +9,8 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;Flask-SocketIO&quot;
 
-SRC_URI[md5sum] = &quot;b23222fb7dd2f0676d78bbe24153fd80&quot;
-SRC_URI[sha256sum] = &quot;2172dff1e42415ba480cee02c30c2fc833671ff326f1598ee3d69aa02cf768ec&quot;
+SRC_URI[md5sum] = &quot;d7992b0b4aaf473b7eff21fc14e8d1b2&quot;
+SRC_URI[sha256sum] = &quot;36c1d5765010d1f4e4f05b4cc9c20c289d9dc70698c88d1addd0afcfedc5b062&quot;
 
 RDEPENDS_${PN} += &quot;\
     ${PYTHON_PN}-flask \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2AAC7D1C6907C7BE1C4BA369--
