Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.50])
 by mx.groups.io with SMTP id smtpd.web11.15221.1593523441053272480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 06:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cPj1L37K;
 spf=pass (domain: windriver.com, ip: 40.107.68.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEwTTzdku/9LXCRBEhptI0JCUwhihqk/Ht2zb2PxxOSLkbqiYg3ua28DDIzozxUCekW+2C3ippytbwSwg8ag6kqNDrKPDLqH0qPoN+BdqVSEkXRepMb71poWv2mS1ErU0zaqqBa+7sSbcV2X0UDQlWZL1OY1RRe5WX9Y2XRsZjGcf7IX2Cr4KzIrVuNNwOjWMgkmmp6RZevSzxhYtSM8lwgdeAGBZ7vmmuAlfM5POnuko8DVw3c5Ml0gyblpFdHb4uoMwl2He8agvrvalhKAnaCAADWn6vMkDFOQrF7tagULR8mHpuqegGBpEKW40B8N8IPHltago2yQo9Vr5NYovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbjFEJKABw4pNNf8bj4ihQgxM3tLqnm02kWY7sHcV7g=;
 b=B13V6E/Ke9Ow+4dEWBk5wurGGDmpTV75RwLr257qOokp/iJbU/AnTt1+njn4nb9iLXE8EMSm6IaxkuKgPsj8alrGnFlMYNGAPajKdDA8bTrAlL6mBDqZWufSIBibfHb1JBrXRdJbUHtsnUxSNcVyy3CmYwUDa/QW9jd9y4crocSuzbeRwCta2eq/PzvQpLumfKVIz2/4dnOmhB6NJqKKqbOzIvaZpSO618Np8R+HFxErHPFgT1GslfKcHCpmCsFvyJEB5pegudKrWsyhqGhoGzpBqgV4A4oKdDWlfYnASqs2Z+nuyVPZo0Pd2LKxEHrPj01jog4gNx2gbtTHVeJhJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbjFEJKABw4pNNf8bj4ihQgxM3tLqnm02kWY7sHcV7g=;
 b=cPj1L37KoKXjx4+fJydtaAOdgrfF8CxRQ/KJCPuQ6Xk6H8TphCwMCuXDCn5Uj0uPlQL+NE2GuPsFHSlDnV2nkyVRlqDY70m/Q8KwO1uzLvISCvfHNej+XlUXyjlIgWT11vH3ftuAam22Xy7t5b7/0eABVtMAyCZ/+E68mY48atM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1286.namprd11.prod.outlook.com (2603:10b6:903:2e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Tue, 30 Jun
 2020 13:23:59 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 13:23:59 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-pyparted: Upgrade 3.11.3 -> 3.11.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
 <20200629121233.27026-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b4eb01b2-41f9-b9c8-e13f-6c3d92e155ad@windriver.com>
Date: Tue, 30 Jun 2020 09:23:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629121233.27026-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::34) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 13:23:59 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd2568ff-a060-440c-0e58-08d81cf8d942
X-MS-TrafficTypeDiagnostic: CY4PR11MB1286:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1286780DB680B51B2725F0849F6F0@CY4PR11MB1286.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/O1w22UDtt7XMyFfVmWdvnmGMA428PXrag96Pl4dYqqxVZTCcen+P0YMzhMyIrU2PVfe1sXMu1ukadNUnaXZXVxyPwA4Wo7gpI7uiWC2Vq4BrPr5MFiAMPtny+JXr56zs4qdQUMOUpC7CjJao9+zMSnOVtQABZe8OLlrsKcK2CmxRuqERK6uhStKc9TdplO1UxKNhMzVnm4X3pbmF5VOo/DXWTTsBBkbrIIxBOmeUN1MwRsJYzxoIkUNAqXcXfEZsHe0EMhgV7+AaUzf9vkw8ieHP1Enlkdh+M0KJznBiLaX+BqlF1sscWEKkVx+8YyRgnUyUCUlUQ4hxObG1eg5WX76pLmx2JxERZ4pvUNvNuPU690Orug4ywjPuW9+NXIkR+KqUAZ0/cwdYBCjlH2ro4MiXk/WJiUoL0ZcrWVXZT7Kdof6FA8X36hE0QK8zC9sTSvn7UBUQz1Wt00dSdi8yg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(136003)(39850400004)(396003)(478600001)(31696002)(86362001)(31686004)(166002)(2906002)(6666004)(966005)(5660300002)(83380400001)(26005)(33964004)(53546011)(186003)(52116002)(66476007)(16526019)(66946007)(66556008)(316002)(16576012)(956004)(2616005)(6486002)(8676002)(36756003)(8936002)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4RVHzQd0OgSnYZAtRmc9hLtD3xc6jDn0wO9y1xwPhmUnMXKP9vL/pPjOqr7ZTXGfAi+WBwGDoqIqTkrk2k/DbY+xt83AIUFPGnkRK5gb4ea7WOkIXatzo7uhgL2mLwnHQqqbCuTqWQrVpPWyzpGbae5k0Cz2N7lxKSKbWWKtIYowlxV0aDhNS0SELEtRucMhWCLyfztaYQ72IzwebMrJfhZFAjdfqLED5y0JVy1qViJQMfqNGhD1baCjcaDPmQubdVnMRQxtUTLbPUzfi8aJN3n6e5DQWbkPZ5Js0rSVNXroUTYou6/VZS+L7+3eoTGWe4zI/5Bf9gYsfoiDOJVr/1k5NdtC6Kl2zx13KQmwgc5SCiZFB5abvPa6laUVfgV+mKlsOdof2I/UsWF0S4tzWQ8osFNmV9k4wnLuHlS+oCxqSNGJm6dru4NB/FdFTNF/Z4SAroVzo2xMjm59g5RLt1V8su/IvN+kz47q5p6GRmuUcCYw3ctxkmWDJ2JI2fJ5
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2568ff-a060-440c-0e58-08d81cf8d942
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 13:23:59.7006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XSMvYDygkbAwCyKdFEU4m0su2Gt1SZWW1ciET1TfWn+h/stak6xYNrHw3dXiP6KyC0xceFUA/XjSR0dA+wZKMe/hgNdjl1BWAfI4TtL3Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1286
Content-Type: multipart/alternative;
 boundary="------------C420D3FF5971575F65B80AAA"
Content-Language: en-US

--------------C420D3FF5971575F65B80AAA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 8:12 AM, Leon Anavi wrote:
> Inherit pypi. Upgrade to release 3.11.6:
>
> - Use preprocessor for the _ped module and what constants to
>    include
> - Reduce libparted requirement to 3.2
> - Update the pypi target in the Makefile
> - Reduce minimum Python required to 3.5
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...3-pyparted_3.11.3.bb => python3-pyparted_3.11.6.bb} | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>   rename meta-python/recipes-extended/python-pyparted/{python3-pyparted_3.11.3.bb => python3-pyparted_3.11.6.bb} (73%)
>
> diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
> similarity index 73%
> rename from meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
> rename to meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
> index a801920c0..63f493366 100644
> --- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
> +++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
> @@ -8,15 +8,13 @@ LIC_FILES_CHKSUM = "\
>       file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
>       file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
>   "
> -DEPENDS += "parted"
>   
> -# upstream only publishes releases in github archives which are discouraged
> -SRCREV = "481510c10866851844b19f3d2ffcdaa37efc0cf8"
> -SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https"
> +SRC_URI[md5sum] = "b85dcaecc3106eb6e9a117270b09615e"
> +SRC_URI[sha256sum] = "727ccdf308c194069aa9797f7a6a973bc95b2e407cdf5d58d6c8bc4c9dec92dc"
>   
> -inherit distutils3
> +inherit pypi distutils3
>   
> -S = "${WORKDIR}/git"
> +DEPENDS += "parted"
>   
>   RDEPENDS_${PN}_class-target += " \
>       parted (>= 2.3) \
>
> 

--------------C420D3FF5971575F65B80AAA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629121233.27026-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Inherit pypi. Upgrade to release 3.11.6:

- Use preprocessor for the _ped module and what constants to
  include
- Reduce libparted requirement to 3.2
- Update the pypi target in the Makefile
- Reduce minimum Python required to 3.5

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629121233.27026-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...3-pyparted_3.11.3.bb =&gt; python3-pyparted_3.11.6.bb} | 10 &#43;&#43;&#43;&#43;------
 1 file changed, 4 insertions(&#43;), 6 deletions(-)
 rename meta-python/recipes-extended/python-pyparted/{python3-pyparted_3.11.3.bb =&gt; python3-pyparted_3.11.6.bb} (73%)

diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
similarity index 73%
rename from meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
rename to meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
index a801920c0..63f493366 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
&#43;&#43;&#43; b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
@@ -8,15 &#43;8,13 @@ LIC_FILES_CHKSUM = &quot;\
     <a class="moz-txt-link-freetext" href="file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b">file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b</a> \
     <a class="moz-txt-link-freetext" href="file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2">file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2</a> \
 &quot;
-DEPENDS &#43;= &quot;parted&quot;
 
-# upstream only publishes releases in github archives which are discouraged
-SRCREV = &quot;481510c10866851844b19f3d2ffcdaa37efc0cf8&quot;
-SRC_URI = &quot;git://github.com/rhinstaller/pyparted.git;protocol=https&quot;
&#43;SRC_URI[md5sum] = &quot;b85dcaecc3106eb6e9a117270b09615e&quot;
&#43;SRC_URI[sha256sum] = &quot;727ccdf308c194069aa9797f7a6a973bc95b2e407cdf5d58d6c8bc4c9dec92dc&quot;
 
-inherit distutils3
&#43;inherit pypi distutils3
 
-S = &quot;${WORKDIR}/git&quot;
&#43;DEPENDS &#43;= &quot;parted&quot;
 
 RDEPENDS_${PN}_class-target &#43;= &quot; \
     parted (&gt;= 2.3) \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C420D3FF5971575F65B80AAA--
