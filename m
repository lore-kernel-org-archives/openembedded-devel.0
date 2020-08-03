Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.67])
 by mx.groups.io with SMTP id smtpd.web11.6671.1596490917579028712
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XhSWmGtU;
 spf=pass (domain: windriver.com, ip: 40.107.223.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6ngUHuUNKxYEA2DCJd54KdsZ8FzCHsC+lCeEXEPTk2topDgpT4d2D4MEPzRH1NLSHUnde29HXLCgELN4awAjH/St1FKBHgJ725leraOoODk8Wu3rNPA7DU74/ot7I7/XUF3YSUoKv9ngL1cQsfylDHw3sRxuJ8SL6XnjniKdntXNFrergMt4rY0m+TtomwJZRTA5dO/lUmOjKRuK7F4VixjorVLfwx3hSoYXdgn3oX8VWuO+OYfVoj2fxYzH3tO1stx6cnU5MMFCb5jBS6UEr6CTYkyne6xr1jFhWv5SsOmXDjCgT4jPFW8WuuxQ9G/s0e7JwUQ9BmtfYt8oKIjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZujaAR4uECLoUoU9uvzTRN6yeCqqeceFF8lXAbRZAgE=;
 b=GcN+/qM3nCTZvtc8AfR3lGPCLd3nMydMJO4n4M7YfUE2YBAfWJErgOy3yd3a9HT6+k4yJzsQ9MQAUkyHH9EVATpSVNwRy9d9HjAFKK0ovprvtprNsFsl1I0xmvezTBCEHo8OaF4imHcdOy65a0nnPLakfHEg4XzPMJ7Dmx8kOxwrf6m0FVLUFilbHI7ueVixUFxL+/i+KwdPRfrz2UIgR1V17wHUW5Wm7OpeQ1I0TqRP4KkH0dlK/o2rdt/8EbY9SqZ+7Bbh9rBtjMK1W0gXZ7Vv62CHE7dARO1ikeAmIj3Kt2/5V+uVpFAWiliPl0bzyG6PrFo1oNyT8t7vc0vCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZujaAR4uECLoUoU9uvzTRN6yeCqqeceFF8lXAbRZAgE=;
 b=XhSWmGtUljkSdmPBtwvfbAc1tAHmui6dOuSGFOSIDCvKp9IP8uhbQQ50HdmJM/zKYs0MgX9RYtvAg6ER7KNQShradZu7bEath+KV54iuvqHKLrYdRz8tTWPXTjk7sy3Kn8t+rSHZb2DXRht0sELIFkncYrFmwy2Tjqstx5FMFdY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4101.namprd11.prod.outlook.com (2603:10b6:a03:18e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 21:41:53 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:41:53 +0000
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-lorem: Added recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
References: <20200731201848.484776-1-raj.khem@gmail.com>
 <20200731201848.484776-4-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <569b2f9e-16cc-f51e-861d-fa6b2e3b6dc9@windriver.com>
Date: Mon, 3 Aug 2020 17:41:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731201848.484776-4-raj.khem@gmail.com>
X-ClientProxiedBy: YTXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::39) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend Transport; Mon, 3 Aug 2020 21:41:52 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33e6ea84-1f48-4eda-7bb6-08d837f6098a
X-MS-TrafficTypeDiagnostic: BY5PR11MB4101:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4101BB4DB581DF8997B50A4D9F4D0@BY5PR11MB4101.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MCuqFehU//9H+CgjTAZy4o25cD3Rl1ZXsNOHCNktNAxCEjY6cTei4/M78AZkP9jzDi4+tekOrtZn4BTT0lv85kxNYBQfHDKku+1J6rNshWisyEK77TOsgAHvqy+ZetbcxXxSIZxOc2X/a0CcRueKSfW0rMcZ95N1HSlz1uBZK092V2bM9cL+fEby9POn3g3Xp2Nle2Uaxy0SP7/07mHkNugwIxIk6+C3+Hj7yYQRoGyNH5wevebZi2UYt+cTL8gdajO6xqmDBEDlqTFY/4VK7oSMsD/Xqpblf/ve0dt01k/uCIMMhPRB32h+NnQs8xLwZZN+/q/BDRpccHjqMc3B9B2RGnOLpLCCsW2/hbEEcc1e+feOj0yzJ56cbAxO8vqu0aDN3tX5sR85mkS1BYT2kBI5Pipy+VH9SA0ROFj3X8svAHVXvHhvC0t8kA0XugsrPTgBs+xw9xcMtkP61WAQjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(4326008)(66556008)(166002)(8676002)(478600001)(6486002)(31696002)(44832011)(2906002)(66476007)(66946007)(52116002)(31686004)(16526019)(26005)(16576012)(956004)(86362001)(83380400001)(316002)(186003)(53546011)(966005)(33964004)(2616005)(36756003)(5660300002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4wSa0uf6NgSIhfiLPRZu/raiTfWtUFtY7GrF9I9ntLswPc5J6zJ7ujgXDXgj3JsrGxQmVYoNiT6Nc5vet+CMY4PgAlsQFIDLZg8ZmvBMTcTfecQIdXlO0C0piIhAY6/NzRJbVdAiCHzWWZmJx/Y/pHjXYsgtSirXMs4ZYvfwEWkLufzzxgjFC2pBuLb2Lp4DGZpXmq342AU8l9LKy+EhkVskby5+artGG/Kjufnu83+JwMk0c+TD7ir9u0t/p+66FYV02800VJGM5hNEIM16ZHJMjdJV2lvghqayutxh/xlD1n5psVy+YgfhcqcO+E0lGigDbUMthXykppSstHfRM2Vek3DTIP8CsrBMQ0G7mL1e9j27YDUUZN0SXWBR6bXrKS7QIhVgvC7G/fO6Zfdmtw6eF8vw9eHjOL+N1/s2dl50VUqm+uLLtEXHkOOjX6F27OEos5Q981Ci9gr+YjaM+9ITk7600sE3It/zNgcuDUV8PKC3+PynSQ2j0Bzu7LnYEWBle4w9aK4TIBH1MEve9z0DOsYEotRD19QuaOjVHGBlP3Otz41XNd2LMQfmrC9krrEKwiRHZNCs7a1Q7AapkvU1m9QBJKvXhgXSdn3/IohpIJZWzr45YFSnNu999AgFNSlBJJxb124QdT2Y4LmJ+A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e6ea84-1f48-4eda-7bb6-08d837f6098a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:41:53.6377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYKlH0PYhPkMP9qQqUesHWzq4Qfr6lFfrC6MqF9GMj31inwDN7EAJfLflrh81uSDrMPw59ToswzdkOPHaF+yJp6NTQwxyT4b5JSEQDZsi+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4101
Content-Type: multipart/alternative;
 boundary="------------7B23FD0870424AB09E20740C"
Content-Language: en-US

--------------7B23FD0870424AB09E20740C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 4:18 PM, Khem Raj wrote:
> From: Colin McAllister <colinmca242@gmail.com>
>
> Created Python3 recipe for python3-lorem.
>
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-lorem_0.1.1.bb                | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb b/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
> new file mode 100644
> index 0000000000..fc75e43485
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Generator for random text that looks like Latin"
> +HOMEPAGE = "https://github.com/sfischer13/python-lorem"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5301c01b2bcdeedba23645f94db2f179"
> +SRC_URI[md5sum] = "e3f0064a94c13e19780eb724affdb426"
> +SRC_URI[sha256sum] = "785f4109a241fc2891e59705e85d065f6e6d3ed6ad91750a8cb54d4f3e59d934"
> +
> +PYPI_PACKAGE = "lorem"
> +
> +inherit pypi setuptools3
> +
> +CLEANBROKEN = "1"
> +
> +RDEPENDS_${PN} += " \
> +        python3 \
> +"
>
> 

--------------7B23FD0870424AB09E20740C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 4:18 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731201848.484776-4-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>

Created Python3 recipe for python3-lorem.

Signed-off-by: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731201848.484776-4-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-lorem_0.1.1.bb                | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb b/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
new file mode 100644
index 0000000000..fc75e43485
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = &quot;Generator for random text that looks like Latin&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/sfischer13/python-lorem">&quot;https://github.com/sfischer13/python-lorem&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5301c01b2bcdeedba23645f94db2f179">&quot;file://LICENSE;md5=5301c01b2bcdeedba23645f94db2f179&quot;</a>
+SRC_URI[md5sum] = &quot;e3f0064a94c13e19780eb724affdb426&quot;
+SRC_URI[sha256sum] = &quot;785f4109a241fc2891e59705e85d065f6e6d3ed6ad91750a8cb54d4f3e59d934&quot;
+
+PYPI_PACKAGE = &quot;lorem&quot;
+
+inherit pypi setuptools3
+
+CLEANBROKEN = &quot;1&quot;
+
+RDEPENDS_${PN} += &quot; \
+        python3 \
+&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7B23FD0870424AB09E20740C--
