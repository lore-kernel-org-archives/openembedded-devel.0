Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.82])
 by mx.groups.io with SMTP id smtpd.web08.1279.1603410270792773810
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=heGKLoto;
 spf=pass (domain: windriver.com, ip: 40.107.77.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hj1pBDg4wQMD6v8/ldqtG8sXhi5f1Bo9qZqLBvEJqIsqL9DtMgUNJz0vxEuPj86pa1zumXaiA88bBTGmbT6dNLCGy7yopi2jlNeXOKFIsTqKW5ZXKWH1sK0RXyzpnCbNmgjT49HAyAcNzTzNi7S/grmOcBvobhMyWEFac4cRTqtDlZCfg0julukaJdPbF5YJQWXx4Wqe16LSy5E1M40qcKRIzG6WR9Ps7hLDaMOA7ZHItH4/Q49XZf8P5OZefp35rcd/JnRp8eL9ZGyg22JXneK5l3+VtXkZLOx4VNaaknJSckxOBnP1qdagWJWGej1SXIrPywBfmCVV37+GN6nJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WeMV5VAPJwGbjX21SZP1Z+PZYl13jf8BthqI8CfCp4=;
 b=REfkTF6dCDryOCQ3lv8PGgwdN9EvlwgseaeJeEOF0m7OEw1act3mXDFOcrl0GhQjtE/7ZXF2WF/DM0AQc0Y05vofdsSAi8ePl7QttlHobqW2DVgPo9SxsUuo5pmNZiBuennnGv6XOZzhtimq6i28eCAD+KFNU3/9mdYuchICbWobHBmG8Ck7oI5TRw30GUx+evJV/kkli+VDwJaGXBRob9uVMYESWFmmK5tB6Vav+4R8gLR0CmIjclie8CK3H+ARzxx+sALld5zKK4hGxVVxjXMwfc8g2aOndQn+qYq4kRO2GkDES3HjkiVBAQq6zq39MUWQPGqx/ucQVl6uhTcUBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WeMV5VAPJwGbjX21SZP1Z+PZYl13jf8BthqI8CfCp4=;
 b=heGKLotokIQ3dPPQWOiz2LHERZJStVC0r/3Flx7HZiPLFheh31+lDm4sgnU09gQsNFxKyMfoo3DCDWgK0emlNwh8Rf0ObbnUXzXYlHNaDLjmLpXpEGPL5UmH76rCv4The+vVsD1ke/9Q8aw9inkCNUWav+OcmNX2GW2jSn7z1RE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:44:30 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:44:30 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-dominate: Upgrade 2.5.2 -> 2.6.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
 <20201021111609.28237-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <33cc665e-233f-1668-57ca-e6499f8e6648@windriver.com>
Date: Thu, 22 Oct 2020 19:44:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201021111609.28237-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:a03:40::45) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR04CA0032.namprd04.prod.outlook.com (2603:10b6:a03:40::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 23:44:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17d45b88-5bc3-4be9-53fb-08d876e46b1d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB489611BC7C3DC12FC231874C9F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8ACc5SFFrmN4HcqqvNxk6PB2GIzEVq6PivTGTD7bvFTGdLKeGJwaW4/0/0ld07xO1P8EXM7GxOpEmkMNT9/6qCritYbhXJC78T+2UOooRVEqwFOkjN64ZgpRfoIg0iV7PaErisL7/9rNc+rYwz0yDyUReCA9hv5GH1XYqA7+dIfXDzmfz7/zPhrTYEIi9Ka7QOf80SlkX8npdIrCREQA4hiKUKQPqtDvY092volF4eEL67xgymWnbYhYmmCvVkq+xCc7ZRjQHNl7h+bFJBozt14DRUb7JGsbnahTv5vWDmSlHf5FbU/Jx+te53pHeO7s3sVzsCJAwWQsSjYeJES4NxTBflBLsGcLn0ejBCMYu42E9ID9Z49jPLTRrbEyKhyQIL9KrsoTguWBOkvkTcKobg0FszGV0n7wKX44pWbDih4NYVzhgdqweTuKJo0lfVjy04OrG6j2bvYk5X2tq1MDGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GD/tBY23CcaOD4fof0GeOnQWhkdFylLydsR1mdrLGWhn5mO0SVbwwALyq1h+Q30XEkXxJbD0P9zhRUpXy/j8ZGhTBQaLZqitnu79c4nLvbxLRYP4B6lCtn+N3kASP87LpwNIe5LJpAcXPK/Ul9kzt9Fl80fI9oYXz8EqFHLekiA0ba26ulF4dF110ybPB10azKe2IwBKVv7vNXfesAKvpHhCzhod/FKFCYFjAOZRw7CvzMIb2pmY/T0gFZLgM+IZS3ehL3DVF/XVtb6bZXubeLGb7+dq99+PtscIu2AmHjxoaSbXeR0VOCBvhASHi94PX1vQJuRkoEnN/SXdYpNlWUDhgJawPF7pAj9egeIdN9Dzc3i9ICqkI4ewCaC6Si9eLp0Zh73h4tZ4rAWTZmA5R+JDd8Ssr3PB5Er3YLnI/6Pirp3byd/wYLpakG3do4xhnMxCgNhRQLLqyphPg7A32NttO1LBpW8ejU5oQ4ErvzU9CukVMoQYQNyTBJsMHwG1em2/WVH7txSdrSX1e8ouNbRz0C6AZ4RCGIAK03Y48UdCWCGjsFikoPyxhlYvtkSAHmHuGIePxqnSNWaf236bl6BirNiUbhrlvuiemhZdK9akjbSU8hFoxE1UU1g1BkTh4jDjEa4csOjCku0g9eFgNg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d45b88-5bc3-4be9-53fb-08d876e46b1d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:44:29.8647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XY/bab58enPVKDmvXz9hf5aP/4xScdIYBHkzbPZz23U+2c35YIZcACfRirq7x4V2qTQ7aw+6ex/srzR8LCLLEY0n1eyNnmSO70M8zMc2lmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------EF69C3547FAF47D31B72DEB2"
Content-Language: en-US

--------------EF69C3547FAF47D31B72DEB2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/20 7:16 AM, Leon Anavi wrote:
> - Add get_current() to return the current active element in a with
>    context
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-dominate_2.5.2.bb => python3-dominate_2.6.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-dominate_2.5.2.bb => python3-dominate_2.6.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb b/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
> rename to meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
> index 2044338942..b7c738d656 100644
> --- a/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
> @@ -2,8 +2,8 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
>   LICENSE = "LGPLv3"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
>   
> -SRC_URI[md5sum] = "4a249c71cb009815923e9a47fa03ca08"
> -SRC_URI[sha256sum] = "456facce7a7ccfd9363948109cf1e978d48c58e46a46b01c71b4c0adc73b1928"
> +SRC_URI[md5sum] = "9f714324ca99eee98bb3c3cdbe838de6"
> +SRC_URI[sha256sum] = "76ec2cde23700a6fc4fee098168b9dee43b99c2f1dd0ca6a711f683e8eb7e1e4"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 
>

--------------EF69C3547FAF47D31B72DEB2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/21/20 7:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201021111609.28237-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add get_current() to return the current active element in a with
  context

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201021111609.28237-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-dominate_2.5.2.bb =&gt; python3-dominate_2.6.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dominate_2.5.2.bb =&gt; python3-dominate_2.6.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb b/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
rename to meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
index 2044338942..b7c738d656 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
@@ -2,8 +2,8 @@ SUMMARY = &quot;Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = &quot;LGPLv3&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24">&quot;file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24&quot;</a>
 
-SRC_URI[md5sum] = &quot;4a249c71cb009815923e9a47fa03ca08&quot;
-SRC_URI[sha256sum] = &quot;456facce7a7ccfd9363948109cf1e978d48c58e46a46b01c71b4c0adc73b1928&quot;
+SRC_URI[md5sum] = &quot;9f714324ca99eee98bb3c3cdbe838de6&quot;
+SRC_URI[sha256sum] = &quot;76ec2cde23700a6fc4fee098168b9dee43b99c2f1dd0ca6a711f683e8eb7e1e4&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------EF69C3547FAF47D31B72DEB2--
