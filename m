Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.50])
 by mx.groups.io with SMTP id smtpd.web12.5629.1599332545547789788
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Kks+lA6+;
 spf=pass (domain: windriver.com, ip: 40.107.223.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWRXygyOPuIf6kb/Ul+satMJHtHpc4PIDxfDnSx4izMc4Ti+IvpHy2x31++WJveZzODrgS733JmsS77UrIUfD7oQZ/SKnzj9N5l2Ubx/Fua6OTZlnCKOOiqvrHysCCptl1ig3jf8rmZhUHC2Pk9ijbmheKK8s7BKoDVLyOpFdnc46kaTpwwD4vd8NSTJV4uZzNhelF1VUK8WImTud58s5P2ce/Q5i/TqJ7cNrE0R9M4mKQbUG6bNU7uz9PaQ5uBwJmfCZHpVJfFkh6cjtdaEZekP0dOcnKJszbljrqrKi0UljfpHxbA9sfGRjrku1TrWIvYlGSLnnSGvKaEVi7b1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1f/u+pc0NdQMW8I9KyYqOrKfVeF5Z4jK8vQ2vh+eNI=;
 b=MH6z16wZ3fU9FMkYeHce5g2A54Y0TeJYILdVykguaSq65+2fWHQz7HCMjmPlEzy8ekKm781hqYKCJtSY/2MU5NDRf0kep2Nhm7vKpiuNxYbrHB+zqn2lbBGMhgPpehCGXyCNMVuNWjEE9oHa8L7w9d0F0welJFSY4EXi8O2ykfOlc0R/Vhmeui+wwnV6t+W05faQ08jUfIfwM5hA773gd5ENDJWijDg/LggLWA+jJxHQWPk7+OUjDT838EaZHonrAyQ9H6LvAQ9Kv3KMm2pzYkejYpVydmedcrbaf8uibzVarJe9ZEcCIXNKFeofkujIqjuVq3XP0qJ9yoJiIk9uPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1f/u+pc0NdQMW8I9KyYqOrKfVeF5Z4jK8vQ2vh+eNI=;
 b=Kks+lA6+0BIzFxsXimrvCIy4JgHt9fv4nZxIiaN9zfq1cQwRoompQg7v57EnSeyMKhUvqbjt81FxuMDmQqLWynso3by5HRAtDG5QCCFQVM8IQgP98lw3i1pTsh/9RB0wDIqoHiEhgjR85cE3Ssmp4MNeAwnIzztdKaHBpAUFTj4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 5 Sep
 2020 19:02:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:02:24 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-mccabe: Upgrade 0.2.1 -> 0.6.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
 <20200902112808.18547-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1c494a25-4d1b-4313-8c18-573c9a089b43@windriver.com>
Date: Sat, 5 Sep 2020 15:02:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902112808.18547-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 19:02:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54705e03-cccb-431d-67c9-08d851ce3957
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29525A290A21DF9F9377495E9F2A0@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JyRGy9DInBP06i+rLbLRRj3oRUPZmZH6hzcri5+kyD7t425s6omJmgypvN8QhJ1JueDfpuYBCPRUKmyWoj7BgJG7IpMjSutIbnOnAKaqOAqdufXQ2dmnrzB8YyJs6Ur5fwUwXj0FYzlw6gGE2lZsk0CGD/YbzuTcIUht1Q56dLRFgLV8oX/Bb51kZ8S634BqIHxP5hKPPk9m/nLFWjuZPvk0DiIVxQlPLfzXnQQNGI4fOTO7KX5nMn86nbe3GBBfsIwqM/St673FUIyu/Hftf13fUyCNlWDMA5/AGbzuiJgIapJ2KFjnxg3a+qWOk7BeqYBfxMfr5jk1QK2kC611S/i2Vf4Mg0Xs8QYy/QzeqmiP/l2hK+jDoO87EBQbBAjsz2FL8f0q9TfvNbG7CqC0qHdpyK6xt93d10jEOIBhLkPe90Y3hQ1c93UR+sTH8ggDvSIiJ6Y7RUiJW7xdMTq4oA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(53546011)(66556008)(66946007)(8936002)(16526019)(26005)(186003)(166002)(8676002)(16576012)(83380400001)(316002)(31686004)(36756003)(86362001)(33964004)(31696002)(2616005)(5660300002)(2906002)(966005)(66476007)(44832011)(52116002)(478600001)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lopA0o6qiPbAgPKwbBZagd705NQyi2j3f5hdsafo8iL/dhvuJKqHPiCo0JAKw7B6axFI2IA/3LpnfKS7xCi+rAmjQL46/oPT0ublJDSQwDRlv0Lv4MTlG+3aWsjDuHPhY0L8ypTWzJ7YAUQlxklqEd7uZzoT5hElzrhzLbMH2Q5CFOsaBFUaGcjA03enpjY/abAlQInWxvP+2s3KpShqoSedNy3Mre2yuFL177P7DOS+BJBRURWjrtbIQG8nQB5PmR4QzZAoRy2MCeFukDkiCY+j7HjQ7l9HgOGQ97Phc/7treDbjwt2m2HExOTz9RS8E10BYwxUZGC6TZ6cjWVSuTltBLWAJzpIPKrDSGhBR5DiLdsDLu5d/M1dFPlL428qof2qAODxsxx9RFmnD5doCxiDzvxSVXTzb/xaanG8MX3TL6khhKBuOS4hjOo40Rji4CedUIH250mD95WnWXye9GV68ixiba/9h5KCi+2bjWEyrB0E6Evm5y8rZ4iI+i2SpCj3BNnplPSxgqOaUq8UwS93qpRS+hJsM/5JzesT+NNv89/okW31EO1kplwB29AfaeK2aDykRVUtyPu5VlOHGfEzrSyXIcuuHIuwULxg9nxEN1Z7lfeeYST16ExDA4Un5RdYB9TtYB3p9bySCp06BQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54705e03-cccb-431d-67c9-08d851ce3957
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:02:24.2166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEpnPy5t1GckSvQ04DXr8q30b2n54ODMDtlwqlLOJPPlWEoKkEwpDvlV1WhvWpvW7/sP+DXPg0telC9L2h3ATBwAs49abxmex2/9KTluWTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------BB15BDC395460343E731AA12"
Content-Language: en-US

--------------BB15BDC395460343E731AA12
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 7:28 AM, Leon Anavi wrote:
> Upgrade to release 0.6.1:
>
> - Add support for Python 3.6
> - Fix handling for missing statement types
> - Fix signature for PathGraphingAstVisitor.default to match the
>    signature for ASTVisitor
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-mccabe_0.2.1.bb => python3-mccabe_0.6.1.bb}  | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-mccabe_0.2.1.bb => python3-mccabe_0.6.1.bb} (53%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
> similarity index 53%
> rename from meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
> index d3a9971e4..63a9e35ac 100644
> --- a/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
> @@ -2,13 +2,15 @@ DESCRIPTION = "McCabe checker, plugin for flake8"
>   HOMEPAGE = "https://github.com/dreamhost/cliff"
>   SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a489dc62bacbdad3335c0f160a974f0f"
>   
> -SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
> -SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
> +SRC_URI[md5sum] = "723df2f7b1737b8887475bac4c763e1e"
> +SRC_URI[sha256sum] = "dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"
>   
>   inherit pypi setuptools3
>   
> +DEPENDS += "${PYTHON_PN}-pytest-runner-native"
> +
>   RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
>               ${PYTHON_PN}-cmd2 \
>               ${PYTHON_PN}-pyparsing \
>
> 

--------------BB15BDC395460343E731AA12
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902112808.18547-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.6.1:

- Add support for Python 3.6
- Fix handling for missing statement types
- Fix signature for PathGraphingAstVisitor.default to match the
  signature for ASTVisitor

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902112808.18547-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-mccabe_0.2.1.bb =&gt; python3-mccabe_0.6.1.bb}  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mccabe_0.2.1.bb =&gt; python3-mccabe_0.6.1.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
rename to meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
index d3a9971e4..63a9e35ac 100644
--- a/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
@@ -2,13 +2,15 @@ DESCRIPTION = &quot;McCabe checker, plugin for flake8&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/dreamhost/cliff">&quot;https://github.com/dreamhost/cliff&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4">&quot;file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a489dc62bacbdad3335c0f160a974f0f">&quot;file://LICENSE;md5=a489dc62bacbdad3335c0f160a974f0f&quot;</a>
 
-SRC_URI[md5sum] = &quot;5a3f3fa6a4bad126c88aaaa7dab682f5&quot;
-SRC_URI[sha256sum] = &quot;5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a&quot;
+SRC_URI[md5sum] = &quot;723df2f7b1737b8887475bac4c763e1e&quot;
+SRC_URI[sha256sum] = &quot;dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f&quot;
 
 inherit pypi setuptools3
 
+DEPENDS += &quot;${PYTHON_PN}-pytest-runner-native&quot;
+
 RDEPENDS_${PN} += &quot;${PYTHON_PN}-prettytable \
             ${PYTHON_PN}-cmd2 \
             ${PYTHON_PN}-pyparsing \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------BB15BDC395460343E731AA12--
