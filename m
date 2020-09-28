Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.44])
 by mx.groups.io with SMTP id smtpd.web10.35819.1601297810044049074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 05:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mNIEdHVX;
 spf=pass (domain: windriver.com, ip: 40.107.92.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BH5e2j3GfBHA7CVeLjBcNY9dZNMCnCH2d5KP71dJXvDN8eQzC1tlVm7g+QU0SZjz33Nn1vwrJ2EP/qxSj1ib38yoD0ISETBcEk87efTfTxCPzW8Lw0FXh1sDGN6emYlZt+mAD1Waq69hIy8APE6uKbaBBTGsqPN0iaYiGBGcLBvEunrkmqRsQzmDgu3357FnQjzMa11NHD8ojP3SUYdExSIdaOg22edXQTajyYEZhui+RxqSc0HjDMfhqwkAYJLXwsPfM5Lw/Qz9mrf+Z5wnPPb30ueMdmKEiXZp6FO9g/0+BrDlnn1mEMOF23KgkXpC51SV8Tr2XI0HKFnt5ylLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPIFQf4SHSv+f7TKcK1wfGWIr5ExQcPAMEE2+ST8e3U=;
 b=FPws4zxtkNdGD8/QoIdORNUazsNnay0gvq5nYKgzo1/VNo63viIEI+8dsi6QM6qSfURM0yP6tlNO3pzQVncdW3NpcgT39AQ/JIr18M11PTax6KXWtvxtoV+4BSJX4xV/OPP2EJTyPk1ykqlwDP5O8fkPnEj5I93wYmmzQFfCZA4MbYkyguIzvY4juGG50bt1lMA58cy8VteuanJlCuvBDl5DJE2rehZlnTiHMOc1R9nYUrB2wUUrDQ/gbxriv2VzmwFwyYxjkFiILCsBtwKTV8XAv56ztCVJrb3B43Yt0zRKn+3tYqbBjpfCeXx2GSHtN4gPNZG5DKI546lXc4ZJMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPIFQf4SHSv+f7TKcK1wfGWIr5ExQcPAMEE2+ST8e3U=;
 b=mNIEdHVX2MnbQLDKJSGJB2DBegwujyK+TwnTLga6VgYaAvcbVX2FOtX3yJHPYmYjqUz3vysXv3duS+jWnpRTw3QQn9FoZNhlUPvRPFi+JsFpC4ctNwRn64Mgs/DSiNKL9MHOjHzw/8PWxCeHY3pIQg0U0Uuuka+qI2dYyT+fMcE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4435.namprd11.prod.outlook.com (2603:10b6:a03:1ce::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Mon, 28 Sep
 2020 12:56:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3412.028; Mon, 28 Sep 2020
 12:56:48 +0000
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-cryptography-vectors: Upgrade 3.1 -> 3.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200925112321.3195-1-leon.anavi@konsulko.com>
 <20200925112321.3195-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <78f73b1f-e10d-2ee6-523c-69f6ec3de663@windriver.com>
Date: Mon, 28 Sep 2020 08:56:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200925112321.3195-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Mon, 28 Sep 2020 12:56:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 832e7334-19c4-4dfc-0294-08d863adf63a
X-MS-TrafficTypeDiagnostic: BY5PR11MB4435:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4435CD8A8D517757436FAAF09F350@BY5PR11MB4435.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pkjG6wxF42U13Ow9b4BszoGbgDumHBu2vWzonW3q+W097eKx34w5mC4KWpxd08H23FALhAIfFkrPlv27/SFA8M5n1lNRrXE4Z458yjdMGx/5qlGSVk+i6ga+chktfZvS0SjrhoLo5HnByTOkzE4Oc7EhGfQ1vt8wouPMqxDodouEQhWbZFq4RB+sR73cT4HgkfIHYV7DLzzhP+ykaSrA2ddMIJJaxhRs6gxXxLsphOfZcP/do3srw6WDYeKbOUWOUpHSsmu9Q0m8AFOaN0vC9gR1Z7Ra5pmFjp0bCGQ88ajP2d4PAfNyeL2Z5oPU4FSz/3TaRlg2RP6qDQXxGuFWcpI0o9MWxbzDwIDpQa8o9Of2p1Gn/Miz/GLd0stzQCe7eC7qOqrU73KBE4S6JooUmj02XmOwdovK2g0EDkcNbtlYIoN4sXlA/Wd8BsPOdZ1VXtv2Z1cpGLSkiV9TCsHL2jndKFxuMdyKGF6k2DRMi3oh3EWCYFZWb5DY++2xE5Q+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(166002)(86362001)(36756003)(31686004)(956004)(83380400001)(2616005)(16526019)(186003)(6486002)(8936002)(33964004)(8676002)(66476007)(66556008)(66946007)(316002)(16576012)(31696002)(53546011)(26005)(44832011)(2906002)(478600001)(966005)(52116002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2VWAydWqUIZ7+KeBHHLXb/ykOSCZx5+NslHlptNQklOVh5qEekeL86v+fZgyxqPSsvwQig+vBAo9EQavvGYVo7JEbn260fBHQxMtpE1v1Xe1ZWHkdC4iFckX7aNt5lHgQk6yAtWEnWY+8kb7JvMRWgRnG96bYAI8wV/u1rgVs+od08XNIciAChCrqNnMd2dEBJKgxnzDq/tHmtolFfM3ZsD02S5wNn2+tIk+FSQU+K0A/SLHTzGeXpDZoU3/whcilwCD7D+/lRf5sfDUom7eJGmaH3lN/jWciy3kcGp525B1OCH5mw8C0fnH750D3/eUylk1oLLajOuplT0S00ngevkYklLaqGwgD3pObOwUcEsG+QjY9o01JXqCiAlny4IXSbR7ig2qO39OQa+KZjtlrIo+SwgvOFGUGkmQf0nZC24Cr42kj37wE1/pNuD8+6Jq8Os2D6M/AG39WTIKqTeH/hRV9mjXyH/MGrHQvvcQbDivv2YAM87Fw7mxdie2x8SuQOFpnkAnZBEWiZz3pDmEfGF36EyKOgg0O0XFxaUD4vFOB3CQySNugseDj5xFWmIojD5bxAG8N99J55aJhHRWXdOvavT7Y7ljaLx+75sLAH7EU5px9V/8k42p8GNFrjFP8niyZ+zHDIGSQXU8cYs6Lw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 832e7334-19c4-4dfc-0294-08d863adf63a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 12:56:48.6223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqZKtXNcGQMK22I7fiiRwDcqfjgz9IhHwoqRm3p+GQUFtuOoIqiulSE2oYCeq9KE2vPHpMqIV4zR5BBtHgPkTzq9fGnW++1XS282WlgAJ08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4435
Content-Type: multipart/alternative;
 boundary="------------3E609F8107221C11D6EFC6C9"
Content-Language: en-US

--------------3E609F8107221C11D6EFC6C9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/25/20 7:23 AM, Leon Anavi wrote:
> Upgrade to release 3.1.1:
>
> - Updated Windows, macOS, and manylinux wheels to be compiled with
>    OpenSSL 1.1.1h.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...y-vectors_3.1.bb => python3-cryptography-vectors_3.1.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.1.bb => python3-cryptography-vectors_3.1.1.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
> index 59347c94e5..9486fe2350 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0 | BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
>   
> -SRC_URI[md5sum] = "1ba5b0743e2876e909f7cfc28b744f27"
> -SRC_URI[sha256sum] = "2660bc3a720d3955341803195ae5352a236c5f26e01a178c44fc5ee1f0ef1182"
> +SRC_URI[md5sum] = "fbc43f8b155b52f9ed163d3555ea5e83"
> +SRC_URI[sha256sum] = "5529c516194122fec7db1682812e2314ddff4221fdf993169118f9c0d291e2f6"
>   
>   PYPI_PACKAGE = "cryptography_vectors"
>   
>
> 
>

--------------3E609F8107221C11D6EFC6C9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/25/20 7:23 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200925112321.3195-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.1.1:

- Updated Windows, macOS, and manylinux wheels to be compiled with
  OpenSSL 1.1.1h.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200925112321.3195-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...y-vectors_3.1.bb =&gt; python3-cryptography-vectors_3.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.1.bb =&gt; python3-cryptography-vectors_3.1.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
index 59347c94e5..9486fe2350 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
@@ -4,8 +4,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0 | BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4">&quot;file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4&quot;</a>
 
-SRC_URI[md5sum] = &quot;1ba5b0743e2876e909f7cfc28b744f27&quot;
-SRC_URI[sha256sum] = &quot;2660bc3a720d3955341803195ae5352a236c5f26e01a178c44fc5ee1f0ef1182&quot;
+SRC_URI[md5sum] = &quot;fbc43f8b155b52f9ed163d3555ea5e83&quot;
+SRC_URI[sha256sum] = &quot;5529c516194122fec7db1682812e2314ddff4221fdf993169118f9c0d291e2f6&quot;
 
 PYPI_PACKAGE = &quot;cryptography_vectors&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3E609F8107221C11D6EFC6C9--
