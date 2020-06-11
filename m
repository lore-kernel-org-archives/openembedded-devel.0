Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.89])
 by mx.groups.io with SMTP id smtpd.web11.8772.1591916671779554218
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 16:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bwkqJgbx;
 spf=pass (domain: windriver.com, ip: 40.107.243.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/nVmenaSzj7mdOVS4mlw79WM5Qi7E7bfbqZ1l3vtut+c/IT2+xajJHzqYzqwtPxYzarv70B7XomFBHbWoNhUw1AbPjEp5IXK/KfpZdEKujnMYt3Y0Rt++i6C0KB6zpQD2bs5WASfEh32rLEOyyu9fFLCpGbjen5vTY5s1MWwjESuL0pJ1Ne/xdToP/GcJ80x4/ssnt+1YxT3VXWptYL/kKC+Wb1qIl+KOqGQ5RNDYY9pFgxxM7IL0g5d7k1hjtJd75CTJgowHzRn7XINNkV1aIl+lCCBaNbspB1ubsJlyqs3JkafoCpGq5vm3DFRvmaWGYfkkVMbb/sPsTBIYmvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0Aj1NScarK5IWGGDZGMKmkMgjKZUrxsuZ4x79FMFIk=;
 b=QlRGf9sFeleEPTxmGxm2A/K9DwN3cagTKKGDWBoNBNsDRiNs8yDkD8gBY0RRqLWAk+x+n+TO/qPMn5EuQks/a2KchYO85/0xT05KeeSBvF0i9EEbOwR5f938RVKHPjLLU7Vvd1U0OHWcDqCxx5TlwwOlRKubiskOHdl3s4Mlm3ptckKNlpRxO/8AgUcFiV1mbgQ8TOWgW2/nUrENOBXvqnltpEwjMQb3SD0qRv0lp2zk5TXPoMjmxowFgdr222+NDkbKh2mcXhtEyFaXNVVt7aaTr7gUc8VsosmvX7lLy9VVhDpBHyRloHWSQ7tip4/VB/jQ/AJDMAtvO/tsMCgs0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0Aj1NScarK5IWGGDZGMKmkMgjKZUrxsuZ4x79FMFIk=;
 b=bwkqJgbxIr9YLtibcN1PXm7lL5qgOT5im4mLBsHjS71XSJ5dkqCfeOSggMZgoPQ9HE6nxqctEBlKWXTiI8p74riogkrPe4lqFw/eIwDfeZPEkJlWGA3HBdtLsQalayZAripAtRgqgY7mqKvPkl1Q4SYXo5AmDgEh8ALGhENUrRo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3955.namprd11.prod.outlook.com (2603:10b6:405:82::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 11 Jun
 2020 23:04:30 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 23:04:30 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-pocketsphinx: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
 <20200611090904.29772-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <235eece0-15d1-39bf-dc1a-8776dfebf834@windriver.com>
Date: Thu, 11 Jun 2020 19:04:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200611090904.29772-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::26) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Thu, 11 Jun 2020 23:04:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da647870-82e2-4205-a613-08d80e5bcc30
X-MS-TrafficTypeDiagnostic: BN6PR11MB3955:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39550E247650A1413F73A9D99F800@BN6PR11MB3955.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	77vuEeqsma2BS1EdQAxHvZteK3MNjKn7iVWuSK9Lq1OGE9jYtew/5LlvjuQ3ifaj78cl0ZZ1B8i9MEHs5kkRyfPyeaDXcfZBvnw0qCOKjPjsslk9QsAVw8pFfLtYwvgAeHVsB/gs2RTiN8p21Olgu9f+tR5whQJXHrQ9HjQfAHDl5XhmRbaJBH/kxkKNxIymDw82tuscVd60JsFtEVoFH0j/3FWzsyGwpv2jbxwi09o3JbvgFfXpdV/TN4YYI/Om7mb69dkimYJ26p1AEe3UFx5Pc3uU557QqlXnEYyYuU+qtMTWnEneVdha2p6+AxFQBCZy5E9mSozFXV9gpgB7zWkhW7gMsDm86yIczIoa/PEIwu9mzZaYMOb996pcsV8mghp2KyLvPh8dLqTNQaNnQl4UycwUiQn+XjU3nTG/r/dC09o1JQ94Lx1Rzjr2owzvNB5/dkjLuHWsWlV5xiIlug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(39850400004)(376002)(346002)(366004)(66946007)(2616005)(36756003)(66556008)(66476007)(44832011)(956004)(316002)(83380400001)(31696002)(166002)(16526019)(5660300002)(26005)(52116002)(2906002)(16576012)(33964004)(186003)(53546011)(86362001)(966005)(8676002)(8936002)(31686004)(6486002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	uEt9s6rNQMTLa9xf2cAsTmzFv7cW6GSDO1+bUv8jffPFgck6qpiKThJGp7swjmwlcKmLqvDPqRqWT+610Rj0un8RltRtj1Den7pYZTauKdZuBN5sFhha05BXuOMngNnEpibi0xk+0psR7pUy+V7M/zTk0IUwX4pJjzG1y1C50it6rKZuU/DW9AARUiFZhVKmoKxCmWk8yO/sFwBcOgA9rKq/DK3sujM42NzCAYL7NUK/Q950+2OG6kUpI9kFrsY6Ha8uIS11GG8DRTdeoCbH6EUhITE2RSLzizl2FOxuPpC+zLEJ9fLIrsD/QInlD4Gy49wdOAMqJ/2KHrQD1/tQt3sNnUdX1xzqrETSAHTGYO0rUSQm/d3er12q2vE0iKDPtJp4/T/NR7f8NVWoRoxCIgaxR5wRDSJZzdgRuvuqsNQLiVIfTBkqzkfkgOXmTbyJN7V4RRKIMIA8OrwPkrK2qiFP4zVd3XyoNT9YhAumY+4fJl+Is+OP2//A8SGgs3CM
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da647870-82e2-4205-a613-08d80e5bcc30
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 23:04:30.4877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+CwDfx02EnC/h69cswIQJH1F8gZFVP4iM7ymUV7mt/g0zcORZn0olttea6pdeVUB4SBM82t8iSZ5+6W+24qWqHYm9g8c8BZmzKMrva6xyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3955
Content-Type: multipart/alternative;
 boundary="------------E4B1B775EE0056FB31F0BC37"
Content-Language: en-US

--------------E4B1B775EE0056FB31F0BC37
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/20 5:09 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
> Add a homepage and a description.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-pocketsphinx.inc |  9 ---------
>   .../python/python3-pocketsphinx_0.1.0.bb            | 13 ++++++++++++-
>   2 files changed, 12 insertions(+), 10 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pocketsphinx.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pocketsphinx.inc b/meta-python/recipes-devtools/python/python-pocketsphinx.inc
> deleted file mode 100644
> index 1f8f66a18..000000000
> --- a/meta-python/recipes-devtools/python/python-pocketsphinx.inc
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
> -SECTION = "devel/python"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
> -
> -SRC_URI[md5sum] = "c0f2bfd54bc4c438c3bb64825f57d575"
> -SRC_URI[sha256sum] = "2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f"
> -
> -DEPENDS += "swig-native"
> diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
> index 2275d1b50..cb22040df 100644
> --- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
> @@ -1,2 +1,13 @@
> -require python-pocketsphinx.inc
> +SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
> +DESCRIPTION = "Python interface to CMU Sphinxbase and Pocketsphinx libraries"
> +HOMEPAGE = "https://github.com/bambocher/pocketsphinx-python"
> +SECTION = "devel/python"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
> +
> +SRC_URI[md5sum] = "c0f2bfd54bc4c438c3bb64825f57d575"
> +SRC_URI[sha256sum] = "2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f"
> +
>   inherit pypi setuptools3
> +
> +DEPENDS += "swig-native"
>
> 

--------------E4B1B775EE0056FB31F0BC37
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 5:09 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200611090904.29772-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.
Add a homepage and a description.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200611090904.29772-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-pocketsphinx.inc |  9 ---------
 .../python/python3-pocketsphinx_0.1.0.bb            | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 12 insertions(&#43;), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pocketsphinx.inc

diff --git a/meta-python/recipes-devtools/python/python-pocketsphinx.inc b/meta-python/recipes-devtools/python/python-pocketsphinx.inc
deleted file mode 100644
index 1f8f66a18..000000000
--- a/meta-python/recipes-devtools/python/python-pocketsphinx.inc
&#43;&#43;&#43; /dev/null
@@ -1,9 &#43;0,0 @@
-SUMMARY = &quot;This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools.&quot;
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;BSD-2-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72">&quot;file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72&quot;</a>
-
-SRC_URI[md5sum] = &quot;c0f2bfd54bc4c438c3bb64825f57d575&quot;
-SRC_URI[sha256sum] = &quot;2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f&quot;
-
-DEPENDS &#43;= &quot;swig-native<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bbb/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bbindex2275d1b50..cb22040df100644---a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb@@-1,2&#43;1,13@@-requirepython-pocketsphinx.inc&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
index 2275d1b50..cb22040df 100644
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
@@ -1,2 &#43;1,13 @@
-require python-pocketsphinx.inc
&#43;SUMMARY = &quot;</a>This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools.&quot;
&#43;DESCRIPTION = &quot;Python interface to CMU Sphinxbase and Pocketsphinx libraries&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/bambocher/pocketsphinx-python">&quot;https://github.com/bambocher/pocketsphinx-python&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;BSD-2-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72">&quot;file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;c0f2bfd54bc4c438c3bb64825f57d575&quot;
&#43;SRC_URI[sha256sum] = &quot;2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f&quot;
&#43;
 inherit pypi setuptools3
&#43;
&#43;DEPENDS &#43;= &quot;swig-native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E4B1B775EE0056FB31F0BC37--
