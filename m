Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.61])
 by mx.groups.io with SMTP id smtpd.web11.10250.1599060617004152305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KWMgDl/O;
 spf=pass (domain: windriver.com, ip: 40.107.236.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hG+y589IiLXauEyGOIxb/kXPRPY6P9S2NR+2Xs1ZbIu2SxDoWfHegbTiNXz7jVhjxRyZE/KaqKwxvMOOyjeUqUFCVmZdjzAEsFM68PaE2SFgpTkeiHgMvdCqHTdZDHjXYHuoRKOpzxK1oOI42OHj49wHENRO+Rf6ZF5OFQSs2FB3jNiiDmASKGQh0i7uJYIJUaJmb1qdwRQRvNulFx8UAM63XjxXSZ4X6zcypNTRWaEiqX2IDvwT0m1bJr+9BMT/IKF3ixBQocgmbaO97xHFwu/u7BIHk/DZUN8301WdNA7SyV1URkjA585EpMhb/emKoS2HMZpLbdlplWpulRf20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj+lrgDnrFrueFUSe15V9AJdy9Ohf9GvTSlPEFZufbk=;
 b=M3A2Rej73A7bbtsfcf2qVhYNiOyaJcFhK9ObkV2MBp413oj1yedhP/M82bbnMOf++FAjcaT56i7Eg3dQY3Y/+s++Xi1M/2AMlzR7oQm4qGrCIIX8/MiItpQ8/Bbx9JWFv/ZjEzjRTTs7oS5DeSgtj6hgwg6NrEHspsRI3/CwXMpPhUYSFxwJ4QkFuZ5lBZK8TvqAO61XZC39AvgU9Vqxbzo90bs4vNNrtmmBqCLmrgimLZdjrCZeQRfSSSxdNMACFQGNz0Zq69NZXprafM/QzPZGm/aHvPtH92+PthxtfyYmkyEWtRDY3MogS6OeM8CU30aRik9WYCGDYiUC3nfuvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj+lrgDnrFrueFUSe15V9AJdy9Ohf9GvTSlPEFZufbk=;
 b=KWMgDl/OTty4/dvTvP1Mkw3Eu6BcvLP/3OcR5xrdBtEpuptgtjEitMLrHakLsIPs76ycQmnTa7Hzz2x3TVaWAVuyD/MNXHN5BrrNHGUHW/lZDBtHkvna9+FJzIi89Dn3D+di3VvaTA+2aG1+i1PY1MtIiYBx2/tzuuikYM9qyzg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:30:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:30:15 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-hpack: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
 <20200831070318.6573-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <47dcf169-8121-45c8-b795-34241bca2dcf@windriver.com>
Date: Wed, 2 Sep 2020 11:30:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831070318.6573-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:30:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11801638-e376-469e-2f3c-08d84f551717
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30306E42B63761BC9A5FAE1C9F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qMgrcU6axRQtJc46O9kSKxo+xH6YAtSRLPED3e74i/IY44Ukn3zABSOK1aLgHPEKZonbigemRhLyGzxEgLVZxiPhKLyDrSZIYetbfbuLjispU+kYyhP+AVjUGLqeVsxwNO3YwiYvF9C8N7lHEPQtgH1Sf/hMsW7MhKhhsU95sOCNI9X7+zNh2khxxRG2+N5O3fKoTEGNM4t75NbdkRCRRSVhuWEBDKfxF0UrI4r5E9PEP7PwcT/76Qslcgh3rpfO0+BHPmpdS0NkU5Z0sU5OXmbw7/Sq+Q1uawUxQCQw0ly7Je+akRnzqEDrkIqhlnee5Clyboy3lQuRafW6bX4kryRMWmq0+noOUkiJeBIG/hnlqwWo4ysmaZ82vDN7uSwScM/kMMwrLxIqRXxXLicCpytH9Wdm6GpX6DePcGg2yFIxi9/p6yJto0V03CL/cJdlvX7h0iS8k2vc81G5AJO6Yw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	E2VZ6SG+vrPMnEduWBnqzT9fZWkUElzRSRpq2FP4OWusT0qnNzNF/TEcynSXjiFZMff73ieWwSEIfru7rbKurUo3lbSoD1uLUvNz3hTdhmd5OxRT3KPOujuP5qzPytmwH+QmlDyX09PjUl7CCnZTqcWAwm0O96Gcs/DPlYlDwgRtddqhk57xZbg0zPVlbXkOZZacCirMShkE5gIONr/GT3GS3/usxpPEMgglxMUr2UNamYkoF544awn790LFXVMNz83n8E7PCwUO0voazVgqw10ll6E+BafxUYju4IHgL3sM2gyzyZoEPQN9EPjRaz9yRnFvTZztFP6lQSNEsg3DDWCO6jVGvqh/Ajces1hQau1qSotzuqzUwh+OhpRbhmUVURTXI4j7NiJyKGY6p5YkUnVYVATaN9vx79aSgSDQ/cNWF4yFsF17iuFUzAZFGovRUxYAMdSab+tpeXDnF1Skl6IWsqy0jslH8E/0VkXn1EL0EjX6FVNF7RQf/WfpXHOh0v0Yq6yd9uRtJbnkNU+ulm2ZOTR3gck8Hhf5Ri4+W8zfd8mwj+qKqOpbVjN5oWwu+6rGWJmGray7u8aHRLc+5YkjCt1nvNLEeth8KVT0JvcDBYk7JJ2FZg3VxtRZgklUVx1hs6C90wDOhiaB3AP1KQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11801638-e376-469e-2f3c-08d84f551717
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:30:15.3573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuzIoFKSBgm+wcgZQAtyxAlH7GKdX4EC2d0rljntwLc6mAlThOcPqj6s0rG+eqy2oyK6meJ6AQLvs22/sKR4Plc0hfmjONUDkYF48bm8xVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------F5A4BD225688AD643DC3FFE3"
Content-Language: en-US

--------------F5A4BD225688AD643DC3FFE3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/20 3:03 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-hpack/python-hpack.inc                     | 10 ----------
>   .../python-hpack/python3-hpack_3.0.0.bb               | 11 +++++++++--
>   2 files changed, 9 insertions(+), 12 deletions(-)
>   delete mode 100644 meta-python/recipes-connectivity/python-hpack/python-hpack.inc
>
> diff --git a/meta-python/recipes-connectivity/python-hpack/python-hpack.inc b/meta-python/recipes-connectivity/python-hpack/python-hpack.inc
> deleted file mode 100644
> index eccfa8c56..000000000
> --- a/meta-python/recipes-connectivity/python-hpack/python-hpack.inc
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Pure-Python HPACK header compression"
> -HOMEPAGE = "https://github.com/python-hyper/hpack"
> -LICENSE = "MIT"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
> -
> -SRC_URI[md5sum] = "556b0ae66180f54c2ce8029a0952088b"
> -SRC_URI[sha256sum] = "8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2"
> -
> -inherit pypi
> diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
> index e196c55b3..742f34f2f 100644
> --- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
> +++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
> @@ -1,3 +1,10 @@
> -require python-hpack.inc
> +DESCRIPTION = "Pure-Python HPACK header compression"
> +HOMEPAGE = "https://github.com/python-hyper/hpack"
> +LICENSE = "MIT"
>   
> -inherit setuptools3
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
> +
> +SRC_URI[md5sum] = "556b0ae66180f54c2ce8029a0952088b"
> +SRC_URI[sha256sum] = "8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2"
> +
> +inherit pypi setuptools3
>
> 

--------------F5A4BD225688AD643DC3FFE3
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
    <blockquote type="cite" cite="mid:20200831070318.6573-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200831070318.6573-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-hpack/python-hpack.inc                     | 10 ----------
 .../python-hpack/python3-hpack_3.0.0.bb               | 11 +++++++++--
 2 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-hpack/python-hpack.inc

diff --git a/meta-python/recipes-connectivity/python-hpack/python-hpack.inc b/meta-python/recipes-connectivity/python-hpack/python-hpack.inc
deleted file mode 100644
index eccfa8c56..000000000
--- a/meta-python/recipes-connectivity/python-hpack/python-hpack.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = &quot;Pure-Python HPACK header compression&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/hpack">&quot;https://github.com/python-hyper/hpack&quot;</a>
-LICENSE = &quot;MIT&quot;
-
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393">&quot;file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393&quot;</a>
-
-SRC_URI[md5sum] = &quot;556b0ae66180f54c2ce8029a0952088b&quot;
-SRC_URI[sha256sum] = &quot;8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2&quot;
-
-inherit pypi
diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
index e196c55b3..742f34f2f 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
@@ -1,3 +1,10 @@
-require python-hpack.inc
+DESCRIPTION = &quot;Pure-Python HPACK header compression&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/hpack">&quot;https://github.com/python-hyper/hpack&quot;</a>
+LICENSE = &quot;MIT&quot;
 
-inherit setuptools3
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393">&quot;file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393&quot;</a>
+
+SRC_URI[md5sum] = &quot;556b0ae66180f54c2ce8029a0952088b&quot;
+SRC_URI[sha256sum] = &quot;8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2&quot;
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

--------------F5A4BD225688AD643DC3FFE3--
