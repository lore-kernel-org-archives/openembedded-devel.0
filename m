Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.89])
 by mx.groups.io with SMTP id smtpd.web11.9590.1593183758600964519
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lZfTaVXt;
 spf=pass (domain: windriver.com, ip: 40.107.93.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5u5p4ZS/jAZMuicaYcXAnXycvrpANOeYxsBtvM6hpDrlrCIC59CPr1bL4nkKTGiIYssr2lh0QPhe09kREWTDEk49ku+AlsqcKnpAX6d5XspPmW0x6S5VmmaOar6Gjj+nZ+25VYFSAmy9L2fnKyFsU0R0QonlHWjk92CD955s0KczbQ4ud15ys4dCKKZtqOvfs/ZKf4WhxSKQLFQSRrcA5Ag8JU28l66qIwPaKefgE2E3dySD1ZXTKZ0ts+bJDDnjCjKnV6XvkrBp6po1ACbxCyDMfJNvDT339ccRggujz2rhZyIZm+FKWavIJRVT/olFZO55kwRrn4IfKQO83Yr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv1Wj4IWQD794IdDrbSX8l0eMCo/4SecPwIF/B/Hc+k=;
 b=HPxNDtIFsLeq7p5TTACltxeL2jHtnaxrcruJJ+E9vvbWzdwZLKlOGYocPczYjPKFLmoB7unL7zvUkE5oz/GI9fgHppc9MC6fiKxnheDBDstAw3xaHknUQkFjNtw6Fdvoqyn+izsT7Sk0gFSHxcXvm4piVROsdmYQL4qdveSNRvoW1KaKrOsa3kor1j6IOLtWCN3mi70OX6Esdjg+YYk/r/Cbn3XpFnQxYil3Iov2UDwXkEFfHGnFz00SN2i0cQ+bTACp2JkKDA8jiO7pwYF2w27Nmfv2EuN3HzazKKSVMdjCcNlvhySzpBs827+wsHlVAmasQYsO4e0NBqbgrbd1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv1Wj4IWQD794IdDrbSX8l0eMCo/4SecPwIF/B/Hc+k=;
 b=lZfTaVXtChL/EJ5Zruj1jym450GBIt2rm6VYjCYKjRGNiLEjRU7vpuYK1Lwe3KxBuCtSTvMyOuobHX5hstky0rtlkQ//QGG6n36ooM4z2EsUdIqPguRDpHr7t+wYd9WD8jxMTdQoCTdVi+qy/PTNSSAn8YQvzNUg3ktdyOw1U2k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1604.namprd11.prod.outlook.com (2603:10b6:405:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 15:02:37 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:02:37 +0000
Subject: Re: [oe] [meta-python][PATCH 12/12] python3-astroid: Upgrade 2.3.3 -> 2.4.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
 <20200625090719.16068-12-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <48c05234-18b2-77bb-0545-570a4201cc0f@windriver.com>
Date: Fri, 26 Jun 2020 11:02:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-12-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::7) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:02:36 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b42fde8d-8c3c-4549-ac51-08d819e1f6ce
X-MS-TrafficTypeDiagnostic: BN6PR11MB1604:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1604D30F644CF2C308877CFE9F930@BN6PR11MB1604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1ER7w90n7obiHllG7+cf+3oad7uyTRZaRC6YcL/oMytU7he7PhTpCWLPfvKnOscF+6+SpNKuVPdpV3g2xjofvBLjHg0TGZEkK4JhFh81k0ljSms9jseenaX92Wjgf4H/44niqXCSzXlR7g7Xx48z6Ism3nvE4+6Fzdq4qznbwd0NJJTs3+qXQnbxKiYogPZOihV3DHOlQaf15w+pHJ7Wfse1ohDnUu0voerjPMy7VkMzgVREHR/z+UopM9r5HaI9PfHSh2h/OIGVHejKAhtNdKirbEgzFFOBgTIdUyHNUfto3ukMNR6Gy2wZrLdTSfnlZoFVM4f6JqYrnSM7hi9pjVyQ+vNt4fuuVnUZErnWRmScVK38e2rmh6vv/rrSpHpKHGNdl+qs3E6gww+4VrTBBs9mnnjRv4/y4XTGHrVX3K+1zKzWVvjRHOBT0l1bor96mZFCSEBzzNQon69H68a65w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(396003)(376002)(39850400004)(2616005)(956004)(31686004)(66556008)(66946007)(44832011)(83380400001)(6486002)(86362001)(16576012)(31696002)(166002)(316002)(966005)(66476007)(53546011)(8936002)(8676002)(36756003)(2906002)(186003)(478600001)(5660300002)(33964004)(16526019)(26005)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QWFmMANCCrFvrjkuew/TZFc7GCdSKgdqZanP/R50r8Q4ZqvImBb2b/BzRuKH+1dOJNjAUDls7CjRoh/vAU0AEDB+c5H1j/IaOmCRhjUZM+mEoaFzEsMZ7wn3zaJL+RYurpPucYNCEpJgcO+H5eYOT3ZFdrgZt9bj+rD5nIn9soDFJnsVCrpmiOVm7l7tcIozg+OODxmthj0JrTPFRU+z43cI16YdA9hKp+l/2GITlJC+m4mIVU96F5YiIc/ODPEZT0PSRldJhFKAEfy6MM6SqCIvMHF8O9QfD6L2/sPLnfMAA5qtVudVkSKoh2Bf/4jPNPM6Qlfl1Imzl4OCLVJVhVxXL2dmFwxHbKdLEV5+ohy7PgaRv4emmcI2vXb4XqhGmvLyDf/u9nftGWkNvNIq3sOSANBaF2LY0/J4ZQ8rm9uDzessxtbm4AQNvki9Dx3FSYCzAVgpv5oCjKIrmoBB4IGz7pXKtJ7bskGklOLcIj2GxHECPDflxre3gnqD53YY
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42fde8d-8c3c-4549-ac51-08d819e1f6ce
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:02:37.4449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgQLdUxXhbTXRthC7vOjGnDFMix4ThX0DWgVlw0gBHafxlafjKlt/FML5BPFPARsvcYFRUXekEkl91dx0wCk+Fl6K8PMvSxvPmDZxCNGlLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1604
Content-Type: multipart/alternative;
 boundary="------------53A61F08C3193D31875ED39B"
Content-Language: en-US

--------------53A61F08C3193D31875ED39B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Upgrade to release 2.4.2:
>
> - `FunctionDef.is_generator` properly handles `yield` nodes in
>    `While` tests
> - Properly construct the arguments of infered property descriptors
> - Handle the case where the raw builder fails to retrieve the
>    ``__all__`` attribute
> - Restructure the AST parsing heuristic to always pick the same
>    module
> - Do not crash with SyntaxError when parsing namedtuples with
>    invalid label
> - Expose a ast_from_string method in AstroidManager, which will
>    accept source code as a string and return the corresponding
>    astroid object
> - Prevent a recursion error to happen when inferring the declared
>    metaclass of a class
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-astroid_2.3.3.bb => python3-astroid_2.4.2.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-astroid_2.3.3.bb => python3-astroid_2.4.2.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb b/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb
> rename to meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
> index dc1ce0eb4..677cec7ac 100644
> --- a/meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>   LICENSE = "LGPL-2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>   
> -SRC_URI[md5sum] = "5f3d73d82d1753b59bb49a6bc6046dee"
> -SRC_URI[sha256sum] = "71ea07f44df9568a75d0f354c49143a4575d90645e9fead6dfb52c26a85ed13a"
> +SRC_URI[md5sum] = "b54e1325995d3a9abd84bac91d4d5867"
> +SRC_URI[sha256sum] = "2f4078c2a41bf377eea06d71c9d2ba4eb8f6b1af2135bec27bbbb7d8f12bb703"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------53A61F08C3193D31875ED39B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/20 5:07 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200625090719.16068-12-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.4.2:

- `FunctionDef.is_generator` properly handles `yield` nodes in
  `While` tests
- Properly construct the arguments of infered property descriptors
- Handle the case where the raw builder fails to retrieve the
  ``__all__`` attribute
- Restructure the AST parsing heuristic to always pick the same
  module
- Do not crash with SyntaxError when parsing namedtuples with
  invalid label
- Expose a ast_from_string method in AstroidManager, which will
  accept source code as a string and return the corresponding
  astroid object
- Prevent a recursion error to happen when inferring the declared
  metaclass of a class

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200625090719.16068-12-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-astroid_2.3.3.bb =&gt; python3-astroid_2.4.2.bb}    | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.3.3.bb =&gt; python3-astroid_2.4.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb b/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
index dc1ce0eb4..677cec7ac 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
@@ -4,8 &#43;4,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;LGPL-2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=751419260aa954499f7abaabaa882bbe">&quot;file://COPYING;md5=751419260aa954499f7abaabaa882bbe&quot;</a>
 
-SRC_URI[md5sum] = &quot;5f3d73d82d1753b59bb49a6bc6046dee&quot;
-SRC_URI[sha256sum] = &quot;71ea07f44df9568a75d0f354c49143a4575d90645e9fead6dfb52c26a85ed13a&quot;
&#43;SRC_URI[md5sum] = &quot;b54e1325995d3a9abd84bac91d4d5867&quot;
&#43;SRC_URI[sha256sum] = &quot;2f4078c2a41bf377eea06d71c9d2ba4eb8f6b1af2135bec27bbbb7d8f12bb703&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------53A61F08C3193D31875ED39B--
