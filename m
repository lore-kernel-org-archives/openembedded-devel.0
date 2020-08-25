Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.71])
 by mx.groups.io with SMTP id smtpd.web11.12573.1598359264374884240
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=R8SnmAj3;
 spf=pass (domain: windriver.com, ip: 40.107.237.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPxe7FJA9mT/ergndJdFinlzc2lmMfvOLvK+SouIRdUoYhNi/ELtm3pnGnq499qnPvZSiHFatFekxaUVL04RoHKpMsWrVtCbIf9VaGe5qe5H67jyc2AJSs6ILLof9E7b07YRjXgdDz0BjEEoH0gdMw4cs3pSCXbsGLyWVCXqp35NB/1Nilht9mzFoAPdgE4K/jinxC6sIH0fFgg76Xa4T+TVDVjXqcM1K6rcWkT09iwACmV95guQxdA7IlCnzKNJA1UJrOf1QN47RtRalOuUvdcJVuosu4bwl2mwRcgIBA4DhGIz7zydQJl2oVvzfNeLKQXQxNH/u6bf66bmuayahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdwfZRNzYy8czggac8R5g4rBxbrkUEAlaKsTZ4aTasQ=;
 b=EV8A6ypbckOF9INF9u5L+HerTZ0KKWMt0SqA2GQAF8w/8N7U/lb1D1VYDDsj/acmf44Rgz2kPutzwlW9s6nheR/EiEaX9w9U9Hy2euWw93a0OYUC45E1Ai8SklmWsmMM+/Vg2u+L251kTDznUz7os5wtK8UXlH2lCXRrkaEIP8/zaiWnBO2zGlUAMAivzfhPLBO9yt3FJEw+dtcYsbR/a3rGBIzFW5wATS5wQbBYf7D6U6iqABfxp6Oshd36Gj7aPvgQo2uzINjIRGE8+0wVHJA0SdCwm1wpfdC2sH7OGrKiBO0ybxTu+PNlTgwENpI45h1bqXecVxLJudSGu/qwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdwfZRNzYy8czggac8R5g4rBxbrkUEAlaKsTZ4aTasQ=;
 b=R8SnmAj37MFUcVyGxwxG1exdsXBFfm52lBv6116OXnzhRmIJjfLhYgtG2udhxvGpUneQdT69O2XJ0ZoMSO06hW5WixH2afdFSUqWERe+cCzhdJeYXQmNTNsuhQ9TCNJKweA6wp3rHwiW33y7U+3Gu/qkuJh97GGZeURZ0IW9D7I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 12:41:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:41:03 +0000
Subject: Re: [oe] [meta-python][PATCH 03/11] python3-yamlloader: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821234504.719-1-leon.anavi@konsulko.com>
 <20200821234504.719-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ab4b2b8a-1960-bf88-172b-1edb1ec67171@windriver.com>
Date: Tue, 25 Aug 2020 08:41:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200821234504.719-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 25 Aug 2020 12:41:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9f9e303-19b1-43ff-197f-08d848f42082
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3766F15A3D3AE5BA6555EAD29F570@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e1cFq1eSA+mVFv30XoL3eUlUT0nZup7uAxP/WXMGG+GfbmPgL70seERNRRdiiw3ik+Uebr9fRywTTft4mPgQ+BZZh43gZw/YFuJ9D44Z+Hbyo+GSJHvPTUqtpVoDThI4Mv+7KweK0ax6+y8pTQ9JYDDkqrS9QwqLOTSxRl8Z87VzJRd+6/u/ZAnnG/OOZAQOfFTsHvTjKmzd8R8KyaQqRLWohyE3w0N3GTpJPtfSg998S2e/jJHz7Z4pY2XtiMWppFV+FFkwGXAd7uANGMTA7rsSiLJTLlOC1QmVqMgtMoxLfGjpZCzLWx8UgsK463WdPE/ECQ0yfX1KqhcLLnbJ9CPXHbSncPvIOfwbglF/Az9BqrNBbsjr8i8GmJwZxxy7st3lJd3Tv+Y4nJQbzFU6LQQIE84qOWxQ5z3etC5tq5/nYVRpN5Xu7uqxWI6QMPRNM5W3Pcg3NAlk731/CPuv2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(2616005)(8676002)(5660300002)(26005)(956004)(44832011)(86362001)(53546011)(316002)(33964004)(186003)(6486002)(52116002)(16576012)(31686004)(478600001)(966005)(83380400001)(166002)(31696002)(36756003)(8936002)(66946007)(2906002)(66556008)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	IDlSLyp08kuLaZnTe8M1nLmoYO9hJEp3/CI43PJJl27Y9u4TX5L7G6y3GLpBGNDqhal3jSvBvTp11LUJBpbHOBtvFZneiCOKGL5EmQX1X+20FEAb1RSuUnnWsgTfLKNlYW/pSWIgtn7Y2io3BXCYZhlTnPNcqpJNFoIDy5MJTtB2ccreVis7mT0osFAf7O6t5oMHwPjnxXu1FdmpWbfXyjco9Zyu7r1jYoTLFLT2PcQBvA12Bu4SeMf7bLjJi5SxYhOMjKjYocmD1Rh9+YRw3ORBsWmZpgMraaJOYk23qzDJb5zQO7xqQ3xzXmVj7QatFz6z7pn51oEmT2x08JxWuiSlFLJ2NN5ItOwr0qZvUpYuHDrFoF0ffMHaP2PS8DzWTwAQZ5NOw6fAqRjj85s1blzlRKjGOthCyjLG2b8thV6fdPQJvGL7Ck+gmitfIj9uSdpmsDBqnPkT0SmdggOU62o3uIv3K2qhQyxRykMu/jDpSO7jfQEB5tmkeil/HXGNAulxd+kAspx0QhT6dH/HZdGHx0pN2C0EeA3O/zbLnyfjFxsJyJXXTR8kMcin43buSCRyvrE1HhEo4hPAXnb9FwwyAD3oMgvFvVnWzrSDouZDAwWs6LkVZN/3lGcThG0c0GBZA19eAas2c0OUcNeYbg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f9e303-19b1-43ff-197f-08d848f42082
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:41:02.9741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsfprId2fym1tWH6te4oUoo0wlL3Pij/yUnusSfE/B1/lkMPHmjtF8YDc/3+ujalL452ypQXUSD+dY6vuiDvUZi1w9c5Q2p9+C+MAlEp/+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
Content-Type: multipart/alternative;
 boundary="------------DE064B5217CB1257DEAC0E52"
Content-Language: en-US

--------------DE064B5217CB1257DEAC0E52
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/20 7:44 PM, Leon Anavi wrote:
> Add recipe for yamlloader, an ordered YAML loader and dumper
> for PyYAML. Changelog for 0.5.5:
>
> - As of Python version 3.7, the insertion order in dict is
>    preserved by design. This is accounted for by allowing to dump
>    and load to/from ordinary dictionaries in the same way as you
>    do for OrderedDicts
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-yamlloader_0.5.5.bb              | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb b/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
> new file mode 100644
> index 000000000..dbf84d413
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "Ordered YAML loader and dumper for PyYAML."
> +HOMEPAGE = "https://github.com/Phynix/yamlloader"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
> +
> +SRC_URI[md5sum] = "2e0750ace81235f750c072833d79c4c3"
> +SRC_URI[sha256sum] = "dcab5f16b39bb03d10dda4cd4f30c943675ec4c7771807fc67e7f1bb319bf4c8"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN}_class-target += "\
> +    ${PYTHON_PN}-pyyaml \
> +"
>
> 

--------------DE064B5217CB1257DEAC0E52
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 7:44 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200821234504.719-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add recipe for yamlloader, an ordered YAML loader and dumper
for PyYAML. Changelog for 0.5.5:

- As of Python version 3.7, the insertion order in dict is
  preserved by design. This is accounted for by allowing to dump
  and load to/from ordinary dictionaries in the same way as you
  do for OrderedDicts

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200821234504.719-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-yamlloader_0.5.5.bb              | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb b/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
new file mode 100644
index 000000000..dbf84d413
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
@@ -0,0 +1,13 @@
+SUMMARY = &quot;Ordered YAML loader and dumper for PyYAML.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/Phynix/yamlloader">&quot;https://github.com/Phynix/yamlloader&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e">&quot;file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e&quot;</a>
+
+SRC_URI[md5sum] = &quot;2e0750ace81235f750c072833d79c4c3&quot;
+SRC_URI[sha256sum] = &quot;dcab5f16b39bb03d10dda4cd4f30c943675ec4c7771807fc67e7f1bb319bf4c8&quot;
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN}_class-target += &quot;\
+    ${PYTHON_PN}-pyyaml \
+&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DE064B5217CB1257DEAC0E52--
