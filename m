Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.84])
 by mx.groups.io with SMTP id smtpd.web12.10184.1599060529921133086
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y2ESfsai;
 spf=pass (domain: windriver.com, ip: 40.107.236.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzcJZk9a/XjvdiwIimb/XEotZLIpQU61SltSMvBYXQH5jYzGuisBulXnFICxq43ktnYY2neblEBG87rutu3+WYLlowHAp4f0gkR/9ZPTzUP868eA7lMEVw226BAFQRUQnsNz152KB4/n3fKfFrBBtQSFGwa+M1T3tdGqi8abrej+AWZ75yMFnb18IlagBGAcaNrPI8z5XyvQ95nFlKqA+74UEi8cq8usenWpQtpKWsNZG1rEDAcPW+uTY8Gw/92kTzER48MyZE5yMrW1Lkaq86OqAH5oQent8kyl59Plvv/Ccu+4A/CswA6VeYSgsmBo3ATJbSrTGaz02TTqqKw8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl799qTkR8wskQ0oIT6uz0FU37glKJcoQ7+hIJJU4qk=;
 b=kJcj6srFPa+VV5pMbYf5ESZRknQ4EeJ8vaZPsIauFWjGOBTHc3Xo/nHVqjEucwn0Fz7HhVRz/M8i+z2UhWzNEoI/alrN4lwBAXBFUG4K/fqf2+Zh/5eb5cwWFRwHZZOiAti5ROp2Y0kipWyWzduosTar0Vlye/Fgnn17MJyk2qYBxVbQSEE87Z4ooV4SUTJ80lbgXWee0bZLzUI8XB2g2QI+c8O3tmva+razmCxG+mpMHizyHxIumiYOKu77f3EJbII2iAZ7ISw5xTaujOHwwO6rWoGnqPQ5VWZqy1beYCoiCZrYpNzBNETLnNBhmydxY2ftq9pS/BgUkGAbZnXO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl799qTkR8wskQ0oIT6uz0FU37glKJcoQ7+hIJJU4qk=;
 b=Y2ESfsaiDczomPHt70iVSFAhG4SHyjNAD6tVcJp/psaZf0Qj1dbooU1T7CI7WQlMCTI8OE3MANf8Hq+HYcvJLBPJGxeD2fDKFzS8fs8ffp5z5X3RhsvV8EBaClwwViKwq/u3e88TRC1aMpJrxC6cGpaQNRPFTQyqcKlHpx+OhZ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:28:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:28:48 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-cmd2: Upgrade 1.3.5 -> 1.3.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d4219d30-6bec-79cb-b8d7-5412c93a13cb@windriver.com>
Date: Wed, 2 Sep 2020 11:28:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831070318.6573-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:28:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98c1d732-28e9-4ae8-cd5b-08d84f54e347
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3030D05939F5F3E3F6E5EB189F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XHWOlD4hhNW0mnIp8EXZb5jFRxVBwkbNmz7ufpCycdejUvGZDh9Cr9+WK5xG9yWeP/n17ot2G61tUGC8Y5swWliK05t3apVZxIWQQjqhYViC0D45sO4IAC4H1ci7Z3KX3v3k7hMEWeqPRyrU/nPQIF+lIrTSHmsKez/4X3t/vlyyrl/3vxqEXXFXZyJPTtOhH83MuN4oUIH/QzXJixxCRZvPfCe/lTqf/Ku4lPOi1bt89Jown2ddEdw5EWQVQXQKImNNzE8c7TMBzCiAOdwdM/GRwCpAzc6G7AS+6m63Wh0nnC6/vsPGE67puyYtc7TneIXCXh6OU/mVb2xNJMujTw5GFJSYe2OBM3e/uYcsSA3aRQ9y+ALa/doblpDBYQxMvMcF6Ps65Mvbg7iO5ZRgyeE7b79n1fwtIYgioMRCDaCJg2lwGuf4EmHLoATt7yMlg8GHv/fhpalRSbBgASbX4Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	N3GTdOTRwSZMcOnVmhv61wqjrOtNh5/yWxZ21TRUHUpmOerwc8XhxqYJmyBCVhHwzKUbzbC/MTxpTz7Gf3OzeJCaG9U8f7zwr8VkrBf1INnnReMyMfy2zqc7rC06qNtR10lL1yNpPddNTwUlmELg+2ViQ2OL6/UJsWbvhCFfMYaMJWskslM0ICApVtzL0Tn9XtJksiuYcfa/mDVNYJ+iZdtHBI36NtoYYSIB0YaGKjxdiIR+0mhbrT7OeyswmrFKOZIbFx40kw3VxxcpUu34unB71f2pjLcTApAP7lMwZB53q1/3FMGtbXjrJ/6g3mhngHm7CLQG7TvCUjfO1ud0YtztJP3V6LES1GT7rSQqNAqxGGdcNIf3MZ3OtsNN8mklbPKSykFMdpBiEWXgC4ezRjqqPye5NFuNNYavcs3HzbRtyfKHIkFF9q6XEcDG8urAVDc43tBJhcxHumy26ESJ/2jwDH9F7I5V7kWUWufohah7hV+lTF7GQccs2L39cVsDY8IWoaDpiimIASqZaDfcN2jsKDHbUyjzV3FzN2zZKTh2FFZhY1TgQcABfqeWUGoMgbsv/W4ICSzJiOlAxlQahu2vFMZ+w6Fpb7Ifjtm8JV0X2SShfhpCZqUd13p3wrOb/jE/iTx4nz1PaR860GHzGw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c1d732-28e9-4ae8-cd5b-08d84f54e347
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:28:48.4824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/n2YWL5sUjQHlp7v4n30urdl71FMc1es5sxco8qbPVbmAgyhVGwwXuyT2eR3vzPLyx8LwUILCUInizBAdtM94EF6o740xvBUgvwcmA6uzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------0F8CE0DF055A04A46FBEA51E"
Content-Language: en-US

--------------0F8CE0DF055A04A46FBEA51E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/20 3:03 AM, Leon Anavi wrote:
> Upgrade to release 1.3.8:
>
> - Fixed issue where subcommand added with
>    @as_subcommand_to decorator did not display help when called
>    with -h/--help.
> - add_help=False no longer has to be passed to parsers used in
>    @as_subcommand_to decorator. Only pass this if your subcommand
>    should not have the -h/--help help option (as stated in argparse
>    documentation).
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.3.5.bb => python3-cmd2_1.3.8.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.5.bb => python3-cmd2_1.3.8.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
> index c0daec42a..9fc7b95e2 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "a4a35ebe43179bf071430e2e8c7963e7"
> -SRC_URI[sha256sum] = "d9ef1d657e98b1c6898bca75019fd661db410f81febe6e1aedded9667f39f37e"
> +SRC_URI[md5sum] = "255ba85d8aaa9f00d84917be38b11a86"
> +SRC_URI[sha256sum] = "b6f6254def8ba479088702f97bca1b999c12e0c38ac5d82dc50a44db93c7108c"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------0F8CE0DF055A04A46FBEA51E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/31/20 3:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200831070318.6573-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.8:

- Fixed issue where subcommand added with
  @as_subcommand_to decorator did not display help when called
  with -h/--help.
- add_help=False no longer has to be passed to parsers used in
  @as_subcommand_to decorator. Only pass this if your subcommand
  should not have the -h/--help help option (as stated in argparse
  documentation).

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200831070318.6573-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.3.5.bb =&gt; python3-cmd2_1.3.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.5.bb =&gt; python3-cmd2_1.3.8.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
index c0daec42a..9fc7b95e2 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;a4a35ebe43179bf071430e2e8c7963e7&quot;
-SRC_URI[sha256sum] = &quot;d9ef1d657e98b1c6898bca75019fd661db410f81febe6e1aedded9667f39f37e&quot;
+SRC_URI[md5sum] = &quot;255ba85d8aaa9f00d84917be38b11a86&quot;
+SRC_URI[sha256sum] = &quot;b6f6254def8ba479088702f97bca1b999c12e0c38ac5d82dc50a44db93c7108c&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0F8CE0DF055A04A46FBEA51E--
