Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.65])
 by mx.groups.io with SMTP id smtpd.web11.356.1595351871408007927
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2020 10:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=m3ood0w2;
 spf=pass (domain: windriver.com, ip: 40.107.220.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RW72O02307Ksr+SLQrmsDoTmhhblEyKM6qSDZ9baBdNvgpr9Ajr7s7RFJRBlKiATMAGwjzOZB5fD4kjFMyVmawygMNmFlV7AYV+qyXNikhhSIA8ZbX/VLr1FLtCZ5DaYxoBPYtTUl9MV4p1ZfMTWCHsQnyBNG+seZF4VzXoXp77KkLiyJDwrrKUP2KjWGvv+9vgbgNyDd/NN930zbAYApp22XwFAaUx3AAfs1EBym91e8yU/UDreaKSaB695smTmGg7tnCgiHbhz0DZLQST2yTBSbxJCcC2hNxgnBUbDD1+hlW3taWDMuD2RTlQKw981W5ru3NmvCB4BTABUYltMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUuySAzYis+z3NMa8OsjbtAhY9FdglrgUwFb2Zhmcmg=;
 b=danyAI4wrfyKnnB90vP12DxbxabDXsQOfyp/Dz2cMBgSNC/gSZUdCo5ecgv77uhG45VSPsg9sDSP33Ot7B4t/mHOwA69yNH5ihHYfyhUeq5YmJmE3MPSWi/3iv46JgwR0DffCnE1mzr+tmWmzszDtSQt4/S45JRerg+du1cpwHXGpMIb8vqi2xG8YVLIBTizkNdkqVPIeoLbmmviZr7P/VryxILrI+T3a9AJg0DKgtkU3urTBJeAa7YMWvM12Co10eeMjhpemh8bPqo6S57DtNtqehUoiRSWjDqmZz3UOH1G0HIRfWDZAIxI3Ki4ArXnHK6nIVTKGPPj8k2D+oNKxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUuySAzYis+z3NMa8OsjbtAhY9FdglrgUwFb2Zhmcmg=;
 b=m3ood0w2Bz0vtEqn1ABpJK43CN7FvQQnjNohz1FHoLVWJ2HKtE4pe4nkooAbB9Fbhi5ngrmO5EVu9jwYhPi9LGUYaf2oNIxPfkcPdHEseKLvVnI/wgqzYKkun8hBPVj54dIfTIQHVk0LPdRlQC/29i7+D7qMpfhr+wCTa1KMnWI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1606.namprd11.prod.outlook.com (2603:10b6:910:d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 17:17:50 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 17:17:50 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pint: add setuptools and packaging to RDEPENDS
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <1623D10330AA12F9.4121@lists.openembedded.org>
Message-ID: <751a6520-f129-7dbc-74b2-c12769ec127f@windriver.com>
Date: Tue, 21 Jul 2020 13:17:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1623D10330AA12F9.4121@lists.openembedded.org>
X-ClientProxiedBy: YT1PR01CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::26) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0117.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend Transport; Tue, 21 Jul 2020 17:17:49 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d85b0c4-e49b-4255-36eb-08d82d99fec2
X-MS-TrafficTypeDiagnostic: CY4PR11MB1606:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB16066CAFE1ABA63EF7D1C9C69F780@CY4PR11MB1606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	81DazfsXdDejUt8/XM7F8TTrUslGW//ENQQWkpFsE7j5g52x5CrZnmW2ZuW8WGIoL4zNWj9hDlX2A22Ul52UFmx8muzGKrOg/DVmvwu86gUwkOxHW/ckSSU8fHJdNFvldWtWzEv8LERy4M/MPcDlGc29eG4bHASiUK+KPSATAKklu+Nesdts0dMAjZSfV0h8s/IRoFkaa40X5SGTLvld9BQ1M2KdYZJ/HX9VtrLALSPdeSo6/OLmJ55E6NpEWOXmR3aX6zCTfZwg7+F2FUUXdwxIza2DIgVzM6Cc7KbTB+hu3V/cwUX222Cv8cbvXzr3NTbTVSC+MKqSB3pneYRoa3yJPnv7PkuD7f7KTrPBZYTKO5eTb6Tx+vjGEzmcUlv3BVjJNoAXErhXwGQ1KB9BDOfhGEu49Y8QI35fuacjprjx3/zaJtEVL1ikhACrlN4ZzINW1k+OxOeYG81T5jN7Ww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(346002)(366004)(376002)(136003)(33964004)(2906002)(52116002)(166002)(83380400001)(8676002)(316002)(5660300002)(478600001)(16576012)(6916009)(53546011)(966005)(86362001)(6486002)(31686004)(31696002)(66556008)(2616005)(956004)(44832011)(26005)(8936002)(16526019)(36756003)(186003)(66476007)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qWhTah4Ofu60B8q5lK2XeA3PnJVFPY5aSwgg/h8R1LhzKNwOCQ6uQOOlpD6xkzqfVWwKxLRLmQmwZZfoQx9l0Aj+jm/5eQ+j6KQAB8ELU3bNRMTcTZUTadoJmY/meT1g59bnosV8OTXiyxia5NTv86DtMgEXKsNDwk2RQy3KE6dT+nAVx9dU22tJ8T1XVshuWdNxv1EGJuGu0IbNsbE20IE3LrBH/knrtmQ0Dbv0SB/pVZ6fM8zpfnB7by0yK8q5PR2JyG5kEcnuwZy7lPP+QQd+lspB2CPSkm4qcjBUtUyvI2E35bUNtON3HiUnxxgJ2mFHdiwzsXuod9ml38goU/SQnC6fSLbnxp97gJyrkVCy1th8m6GPFwn8p2+TV/VqtZBBk9gyyx5AUY62Tg3ZhpK8W6auhNUwc8d6SlSyRQQ4HQL8HcAGgnUhjHsd6ixFAtKuPC+idr5GQo6obnu1uXBwUvkrTp0Mx2iJUSF7lTidb1OMInt9bju7ye49Vd4X
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d85b0c4-e49b-4255-36eb-08d82d99fec2
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 17:17:50.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvhCHHbVo031XWU94I8blyLjt0MxKyczdPcOOGWN/hpJyJpgLidqIb1VOgVVieX7XJskcCnmHgt/hjPmYk3UJFc4ZMEwDzsYLeYulrPK15c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1606
Content-Type: multipart/alternative;
 boundary="------------092F980CB2CD8B5A99F4D1DB"
Content-Language: en-US

--------------092F980CB2CD8B5A99F4D1DB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/21/20 12:21 PM, Trevor Gamblin wrote:
> pint needs setuptools and packaging to be imported correctly:
>
>>>> import pint
> Traceback (most recent call last):
>    File "<stdin>", line 1, in <module>
>    File "/usr/lib/python3.8/site-packages/pint/__init__.py", line 28, in <module>
>      from .registry import LazyRegistry, UnitRegistry
>    File "/usr/lib/python3.8/site-packages/pint/registry.py", line 49, in <module>
>      import pkg_resources
> ModuleNotFoundError: No module named 'pkg_resources'
>
> Add them to RDEPENDS to fix this.
This is a mistake - already acked Ryan's patch to add python3-packaging. 
Will resend.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pint_0.14.bb | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> index 8e1630476..333b015a9 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> @@ -21,6 +21,11 @@ SRC_URI += " \
>   	file://run-ptest \
>   "
>   
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-setuptools \
> +    ${PYTHON_PN}-packaging \
> +"
> +
>   RDEPENDS_${PN}-ptest += " \
>   	${PYTHON_PN}-pytest \
>   "
>
> 

--------------092F980CB2CD8B5A99F4D1DB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/21/20 12:21 PM, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1623D10330AA12F9.4121@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">pint needs setuptools and packaging to be imported correctly:

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">import pint
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Traceback (most recent call last):
  File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;
  File &quot;/usr/lib/python3.8/site-packages/pint/__init__.py&quot;, line 28, in &lt;module&gt;
    from .registry import LazyRegistry, UnitRegistry
  File &quot;/usr/lib/python3.8/site-packages/pint/registry.py&quot;, line 49, in &lt;module&gt;
    import pkg_resources
ModuleNotFoundError: No module named 'pkg_resources'

Add them to RDEPENDS to fix this.</pre>
    </blockquote>
    This is a mistake - already acked Ryan's patch to add
    python3-packaging. Will resend.<br>
    <blockquote type="cite" cite="mid:1623D10330AA12F9.4121@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
---
 meta-python/recipes-devtools/python/python3-pint_0.14.bb | 5 &#43;&#43;&#43;&#43;&#43;
 1 file changed, 5 insertions(&#43;)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
index 8e1630476..333b015a9 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
@@ -21,6 &#43;21,11 @@ SRC_URI &#43;= &quot; \
 	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
 &quot;
 
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-setuptools \
&#43;    ${PYTHON_PN}-packaging \
&#43;&quot;
&#43;
 RDEPENDS_${PN}-ptest &#43;= &quot; \
 	${PYTHON_PN}-pytest \
 &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------092F980CB2CD8B5A99F4D1DB--
