Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.63])
 by mx.groups.io with SMTP id smtpd.web09.42323.1606164993442973748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:56:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AxtBralN;
 spf=pass (domain: windriver.com, ip: 40.107.223.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SY1mkqMVDoh9sMPWgfYzu39uR0mj1CzKfdAXTl4+Zpf7NP92UJeRPDU733NhfNqBHceBNh7FqEmQsFB/tSm/clNc8Mv2iTFcZrX7/qBJmVU+LZapfKUfHJ7YidRLKnXeLWUPTqpu7xRzWhAD2B7sY4ClNUQs3GhbEH+JHYTFUWWFch4t0hff2/zHHf1QdMoCFX2Si8Xeok1I5ay6ochbnZiY3KiQMi9z1UG7oV8DYNslyBgsvUJr2k/iXlFMPIfqPGGBDZ60xCwlPzo666C5n+YxMBq0dTZc8wR8YnIxPGXf2tvR0+SCl6y1BZFXnY9gFILfPuc/7MgOcRYsbOEjbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2Cjz1lG4oio8wYy8giGDcw3liRCIdWKnXFeQ1oCEj4=;
 b=NHQDlPIiiNhE8+2fREpgK4Pzn5LTxBXB45poAg7rLDYseU2v1LKj2qqPBuAmZE/4EHq122vNhra38nxzcVypkIA7ycLIzCu9a4nx42Iz43p0mWNVwUVOV74PphILNhB4cVsv4WxfZrGIbczEI7Lq02GBc2C9J2R6eEwHImzOQ1gDVvzx4fxo64H+xtG29X1I1Vo8vL8bJnqlYHe9JL2tKEsqDE2cM+V9IaXNqjainDn5zAq4HaS/qVa9v5nIbyRkIGWIP/EmOgdEPINHmVBZhPCJ9d541iP4oaVUZy8lNTKagKh2qy6cjHJXXrtlBl9PPketxqViNHG2leSMpswpaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2Cjz1lG4oio8wYy8giGDcw3liRCIdWKnXFeQ1oCEj4=;
 b=AxtBralNlQ48B+A1IhhqAL+vysTi3KEUThQB2gjFFQl/YexT0nUT4tEnHHC/2pnm8ydzms6snB7CSTO7gTPPhpzBsD+nrd/+fU9G72FeJPvo1cwP2MpKU6CtPAJAXaMAXoPH5GHwkMLX2LPvK0AONeDKlQ6wxTGWn6CjWx2niXo=
Authentication-Results: bosphorusiss.com; dkim=none (message not signed)
 header.d=none;bosphorusiss.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2678.namprd11.prod.outlook.com (2603:10b6:a02:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Mon, 23 Nov
 2020 20:56:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:56:31 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-jsonpath-rw: Add recipe for v1.4.0
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: "hasan.men" <hasan.men@bosphorusiss.com>
References: <20201117230404.880724-1-raj.khem@gmail.com>
 <20201117230404.880724-5-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <78f98823-3f2a-99ea-6b92-a287c149759c@windriver.com>
Date: Mon, 23 Nov 2020 15:56:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201117230404.880724-5-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:56:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc216be3-3b74-453b-2cd8-08d88ff24130
X-MS-TrafficTypeDiagnostic: BYAPR11MB2678:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2678DA337C1BF1C649F9FB999FFC0@BYAPR11MB2678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rlo9CJT6nkbgvDPxDqwCV+tXpT9S3NU1/lqLbgieet4SRKYqgAtZVXz9PnWFiEWA8tS1pU7YXX3iA7QLHxwUrbrPEM4jQW9omg+BHLBVueq6tmwWy2gkhKfDXixp4CNaPO+6ujYUpMO9HAK5RFJgvwC3cs57ow7jweakb1z+WJxLtxZB4xASwl6RWzfeKdvyit9OYWbQRSAOsEh1xIKIvYrOzu03hSC4EylpavWruE+hulLxodPEYgfpgpLRW3BAdg1sdwxFkbemld1pgIAZH9adjE9OPERvqiIij4rH+HliGje1jqdzEAy70Ko+7+ExPr7+E7l+8KjXnZXOeJOFHWUwph+rvh8Gn7mMwgg6ZC8W5kGZ6sHauVJNdyQap5Gx+XSp62NcIrXLw2zG7PRiRiUgUZrzHZy7rwuHcoIwvu3+y2ExhY1KbmJDu/mvKH82I52iMXVosIE6zAYfTcD18Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(2906002)(8676002)(16576012)(8936002)(83380400001)(186003)(86362001)(36756003)(26005)(66946007)(166002)(53546011)(16526019)(316002)(4326008)(31696002)(6486002)(478600001)(33964004)(31686004)(66556008)(66476007)(44832011)(956004)(2616005)(966005)(5660300002)(4001150100001)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2D3PunftSgsBnXhM9tVw49JHBXFhpPGAeLJLvIimfeTZC2F2Bmso/cwEPdDQYwCuSBZ/XNSnNmQlLFNgYsM3TKUrcXWcrgiP5iySfK+l7f9nCLJ0qWetzfHQCC+IUkjdoC0BFHk+N8lXwmpU4Ss9EwxApivxC6D9Xo2Ei/eNQrwrgU1rdy7pZ/IdiOvclL7xXolUAEjPSkm2dd/SlURybvUb4ZqRS9t1rf1jyLUSfpIQSRNixbAy539J3Vqn55UwS5y/4iz4au9J4V/ZOH3sk087dSTDpYc2jwN15XRxPaTduWYZDe6cGXN+6ah49kZDtuu7UzC2TZIrWrPwVxGewyS+RE0jOayIKiU3VluhItmtFGppsHd+R5xtlg+xJFrw/wqsqEoAsEIope1bcvJKNCqOLzqoXcdIxSqtOOba8zmXOfdqlIbRD7dcytTEVR39CT7zhRLXOq0l/Db/tp3wyvDt1wdQ+Rzaqf4o4YCbuJVF2kVkZpu/hrMJPK1spAQLQ8mcOtmcwyW4adH3DSGBkzPDc38GZmwB+jAvNhdAIMWOaTN3Tho5zO/viG1abkXfhBi6LiYGf768XJCFKb0IrEfXejat4rKxYxA5nFjzsPM4/bE6HWXIycrRt+el8dbB4znF+VtR8E6H5qljBBfjGao1ozklOfo4tjjMuiNj6s/RSwLr2XdkM62AkhzL7wFMbXW8K3zD+wCGNgnd+jkk2t3ofxwM/2JJr2k0UeRTVDRYVZqRcP4vInznDbn+CeyFidkXWf6McZvsc3x/7TJFZ37yCE/QkOZC/V2D/5BeH3vovUCg5Xj9XXIZkbsAmldINchvDODQy8I86MwoYpT4BZRdvsV8usFeiMzTwX5fvb4o5lszOubezVL3nWQUkjDeHjZsOcqbtuAiOGvtaKc5ow==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc216be3-3b74-453b-2cd8-08d88ff24130
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:56:31.3757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04KVowKLLhFKwQ61uSqLhZYPBa1Y89suY0nH9VoRfikbl/sBSvAQaO5ZRfStRT6Va1+MkLUHXpYLms5oFZUyQTig++1HaZvy9SI8Ezr1ClA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2678
Content-Type: multipart/alternative;
 boundary="------------07F9494A6164033B37A0A73F"
Content-Language: en-US

--------------07F9494A6164033B37A0A73F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-17 6:04 p.m., Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: "hasan.men" <hasan.men@bosphorusiss.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-jsonpath-rw_1.4.0.bb              | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
> new file mode 100644
> index 0000000000..54e1b646d5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "A robust and significantly extended implementation of JSONPath for Python"
> +HOMEPAGE = "https://github.com/kennknowles/python-jsonpath-rw"
> +SECTION = "devel/python"
> +LICENSE = "BSD+"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=02384665f821c394981e0dd1faec9a7d"
> +
> +SRC_URI[md5sum] = "3a807e05c2c12158fc6bb0a402fd5778"
> +SRC_URI[sha256sum] = "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fac4fbec"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += " python3-decorator"
> --
> 2.29.2
>
>
> 
>

--------------07F9494A6164033B37A0A73F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-17 6:04 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201117230404.880724-5-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: &quot;hasan.men&quot; <a class="moz-txt-link-rfc2396E" href="mailto:hasan.men@bosphorusiss.com">&lt;hasan.men@bosphorusiss.com&gt;</a>

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201117230404.880724-5-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-jsonpath-rw_1.4.0.bb              | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
new file mode 100644
index 0000000000..54e1b646d5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = &quot;A robust and significantly extended implementation of JSONPath for Python&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/kennknowles/python-jsonpath-rw">&quot;https://github.com/kennknowles/python-jsonpath-rw&quot;</a>
+SECTION = &quot;devel/python&quot;
+LICENSE = &quot;BSD+&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.rst;md5=02384665f821c394981e0dd1faec9a7d">&quot;file://README.rst;md5=02384665f821c394981e0dd1faec9a7d&quot;</a>
+
+SRC_URI[md5sum] = &quot;3a807e05c2c12158fc6bb0a402fd5778&quot;
+SRC_URI[sha256sum] = &quot;05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fac4fbec&quot;
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += &quot; python3-decorator&quot;
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------07F9494A6164033B37A0A73F--
