Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.70])
 by mx.groups.io with SMTP id smtpd.web11.570.1599495027759942045
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N1J0t6LB;
 spf=pass (domain: windriver.com, ip: 40.107.76.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+mD29h+iXATILCiFqRo9dMZ8e0kLyv4Zqt/Bp/wiYnsiUBRyGHvloR92GKE7WYlI7wLL3x/2aacHB/1zqWOXeYQrnFTFynrhpjTdPMyYGCKNs+h1q0+uUC4hLcu3LyR+m1QsqGjuRJPVEjjIr4mP4jPUL5aJvv87dZ+hPqgSI/xXwAvAhDAkeSVkX5IGqI6oXU72YQJwZxQdcJfzdUINvkNSaLlFiYVMHuEksdR3K4ZSS7IvofJl/58pZ1vME3QMkpZGOXZ1CLf3Yu8KkgaockJNVYtI2n5RFjRr4D5V+UHZlh43zahNraCxaFRrW4S+caJPI5LApaXVUMDiVPJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PY1LK+4XAbGU34Ns8hhyAk0A1C3LFaF/X8ia34gpbGc=;
 b=a64g2w+cVVCFxj25lonBexgzNJRYpUb2ljTQGCwVEjsU0LYKrZ5F+aOuvfdmhlRRAFXGu+CjjVEj+VzSPvDR6/WYUJ2DQMUhrcAup6kicfXzrcjEMmA8vOWOU7zXLmMG2ovCa2sqzc643vljOenSlQr/JeF882Dk+lidO/zVYJAcRNKXeQjY5E11w/wkuROATnt4rCmBTyI+rCCnMLSPtDOi4BQRpaXgK3ofsthUMzIVRTGkbdDQW6qOpTR5PoXyAt7o51h8yOhRgRKm+kpf2AP6oD8cj7s8oNLiE88AuGRHVXg2s/S7697gYjyh7rCJDIa8fvooQX8dFoWt78NWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PY1LK+4XAbGU34Ns8hhyAk0A1C3LFaF/X8ia34gpbGc=;
 b=N1J0t6LBDqZO/1xycnkk8huAk+mn/pzhOTdfy5PPvfLnUzmqgNBBleE793J+slVr0eq3z9UWxqBPp1FVSE6I2Ft1/3maNkyliOo75y2Yv+J2ftHScMnPVyYHb8Mpbjou73z4BgPWWGakq9Annb8X0Sl9QbD2CsNY41igodNbDFM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 7 Sep
 2020 16:10:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 16:10:26 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-hyperframe: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
 <20200904134713.13164-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6666297e-9801-7cf0-8e64-d3d02ddedefe@windriver.com>
Date: Mon, 7 Sep 2020 12:10:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200904134713.13164-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Mon, 7 Sep 2020 16:10:26 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f99a714d-6b77-4ccd-333d-08d853488879
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3671D52410454E213739A8D09F280@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O02hyU4Q7zs8TbA/NnmhRoxyxiZbiwtVNgv6I5UjVCySWJcxi9MZJJaRurUJTBUK/Aqm0l3cYCTOCfwCSgyJJ3Zg2l15T8ol61XezVgLXWzhzi25LoUv3G7YWd+Eqox00oxe73DCMWIdzAuJ2c5P321qV83e+lngj+q4zqk3Htk1Su+SHhQtzuyz4glb2QJEgdRPaJ+ayeIbAsWR6yik+8vwD+pnB57gPzr/KS1q68ZjevOAL0b/UAp7kdrA+Y0jtAv726QEm9O0zJx8q6FOVAwPJetzxRMzRhb9xdDmBK8CtWGjiBpIbDZZ0bFf5F2VEbiAfFXVwcgXyywvpy3i4o8NP3K3I3sObvPY1q8V3CR5/QNkZnCZU8A3LeRbl0hz1UvwHudlm1sULaLnRqIF9EbB+LlIhcHHq5JBmwUp3k0qvYODUxm7jB040hkPhktAlxREZDHMa/62S9Q/xjewzw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(478600001)(66476007)(2906002)(186003)(8936002)(66946007)(44832011)(16526019)(86362001)(31686004)(66556008)(966005)(6486002)(53546011)(33964004)(31696002)(52116002)(26005)(5660300002)(16576012)(316002)(2616005)(8676002)(83380400001)(36756003)(166002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	q5JljLJRbJWMZxryBt9oug4OqR/qERqHxocx0A300H8FP20FPtKGFHtXCjaxaFBdYGIqQzcI0x9BZ0StehDeloXIedsQ2CJGTs5yikVcUdB/yBIv0BrRp/lp/QAeD6CTmfmM630IqaW3GdBiS9XqMQ9akGvsBPNh7pFvZzG9Ojl2qNa8WqD+PpsUluOLMrCAsCk8xe3i/EqF+UNrl1YEnvqF0k9dLv0VnhrVWlmiuQrL935MF4ZD/bDDJaV+SsQK36YSRj1lR6h6MKg/45OceuTsFGXG1TM9vznEWBMAgY90ma8577htvxf/gNKP20KDFDr5pkBKlGIbY0jlEIhF1B4xhzIWvtKRQffWxv6T56KBxgiZgMCr2oWX8mE9LSiwqaTv59u2plr3DZKUQBWcxEOQPVKh8zGPTDFwgRXhkGN1ODocRRUDntyY5nL+6uuG95dMiaeHivf060JXUDhU98qhDOaoCF/mu8TovJdWFRfVFf0vO44lUbeLzlsSkSf/1yJTZTR3taaHeqRa89Gil99pL2GoFhk9vI9sPoruU0tjw05uXCQjeUXmVbul4RG3Sen91Ezx1GdQ3ufzMnNOHvcBOKm9ToIDXvGFdAz0CqOUcqZ8opPr83fP3k7FjoDMlYluF5JWBKTFAsqVKpzhvQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99a714d-6b77-4ccd-333d-08d853488879
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 16:10:26.7119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rCDESEgsKKRJwJOWU6RhQsGYSACsreJqF5wKLvE/TUY2BYnn61FfZgudqmRR8x7GjdmIQhqc1lFkfho5RrSlKuzIexCzy31tC8+pIxEQFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: multipart/alternative;
 boundary="------------CED2A563A640147739E4E735"
Content-Language: en-US

--------------CED2A563A640147739E4E735
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/20 9:47 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-hyperframe/python-hyperframe.inc           | 10 ----------
>   .../python-hyperframe/python3-hyperframe_5.2.0.bb     | 11 +++++++++--
>   2 files changed, 9 insertions(+), 12 deletions(-)
>   delete mode 100644 meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc
>
> diff --git a/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc b/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc
> deleted file mode 100644
> index 0066bf8e6..000000000
> --- a/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "HTTP/2 framing layer for Python"
> -HOMEPAGE = "https://github.com/python-hyper/hyperframe"
> -LICENSE = "MIT"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
> -
> -SRC_URI[md5sum] = "6919183242feb26d8bce3b4cba81defd"
> -SRC_URI[sha256sum] = "a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f"
> -
> -inherit pypi
> diff --git a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
> index f10fb6df1..e5ef1ff38 100644
> --- a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
> +++ b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
> @@ -1,3 +1,10 @@
> -require python-hyperframe.inc
> +DESCRIPTION = "HTTP/2 framing layer for Python"
> +HOMEPAGE = "https://github.com/python-hyper/hyperframe"
> +LICENSE = "MIT"
>   
> -inherit setuptools3
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
> +
> +SRC_URI[md5sum] = "6919183242feb26d8bce3b4cba81defd"
> +SRC_URI[sha256sum] = "a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f"
> +
> +inherit pypi setuptools3
>
> 

--------------CED2A563A640147739E4E735
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/4/20 9:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200904134713.13164-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200904134713.13164-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-hyperframe/python-hyperframe.inc           | 10 ----------
 .../python-hyperframe/python3-hyperframe_5.2.0.bb     | 11 +++++++++--
 2 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc

diff --git a/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc b/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc
deleted file mode 100644
index 0066bf8e6..000000000
--- a/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = &quot;HTTP/2 framing layer for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/hyperframe">&quot;https://github.com/python-hyper/hyperframe&quot;</a>
-LICENSE = &quot;MIT&quot;
-
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393">&quot;file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393&quot;</a>
-
-SRC_URI[md5sum] = &quot;6919183242feb26d8bce3b4cba81defd&quot;
-SRC_URI[sha256sum] = &quot;a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f&quot;
-
-inherit pypi
diff --git a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
index f10fb6df1..e5ef1ff38 100644
--- a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
+++ b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
@@ -1,3 +1,10 @@
-require python-hyperframe.inc
+DESCRIPTION = &quot;HTTP/2 framing layer for Python&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/hyperframe">&quot;https://github.com/python-hyper/hyperframe&quot;</a>
+LICENSE = &quot;MIT&quot;
 
-inherit setuptools3
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393">&quot;file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393&quot;</a>
+
+SRC_URI[md5sum] = &quot;6919183242feb26d8bce3b4cba81defd&quot;
+SRC_URI[sha256sum] = &quot;a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CED2A563A640147739E4E735--
