Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.89])
 by mx.groups.io with SMTP id smtpd.web11.20084.1591968579781526749
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 06:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NwjzoMSv;
 spf=pass (domain: windriver.com, ip: 40.107.244.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bX7dzIb/FHjCm5Df6J90IjO+JUSeU6+lycaIUObGB2PpvT+fOhhG3FUjPocARxBC6XS3CD0ffpUpYqib1p705TE9jDSfxfiMoZtkSb8J23vHijOB1WKH3NmYy2tOgXSUQ1J450WGNMUAy4sVQZv9vSf31RUgQu+//zcaaqDl9cdg2tAXvD/kjDXE40Ox8Jd+JR9XrtToslMwExPnOD24j0AXi6+fNWAe4L9fWwwq//lH+ZDbGgzbwDtI9Im/Fg5mdbOnYzuAUofdyXKUq3Nlj3fZ/6+XpUBSGVslgfM25lkWpQ10xr9r++CAfznyLu8alUP9hy/x+tSG9feCrJahHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ob/aiUV2mFDfsZCxkXQN+NMRmhc+sI1txBdvdU9Qyw=;
 b=Eungu54GkqoMM2tvn2dm/285C24URn4eYTQ0RjFTah49sTChgVzSES4ERb39JjdcdtAVbwmr16oX5xxg2R5Gh7x594+RF8WgcO9EAxN22OJJ+564xhntVn25CtV6aZ+wvb4TcvM7c/Hv7EJf73vK88nTvJcNLQW/gLa8yDx2jB+UfXHCDoePnkne+T9LSU4abcgfCGkXDGRWgaZRY+GBDbeXcHx06gaJh8bAYMao7t5xrJ6GOKlOgD/Iioh7RQbSrDsMFSBZyoi+xw7kTPZggzNaB0B4ly0ffdbPMPWfTCZ0/iqLeLj0A3USMqSFjNRyeRDx2oPimwzq+X9nfMlJiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ob/aiUV2mFDfsZCxkXQN+NMRmhc+sI1txBdvdU9Qyw=;
 b=NwjzoMSvmFISlXuJlY3AjhwqH+Rq6knnOKIhNxsbF/I1o+ln4+URqQAbKH9Kg/UdL9skM8yLndoDemANmWwjsJ7EjMFjx/v9ZSu7lVZB+Os7GDKfFfzeYwB+1YHsXG8UWM//72Lcjmq0SP/VeTjSzzwGbj9rTrel71IUvP9anKw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR1101MB2228.namprd11.prod.outlook.com (2603:10b6:405:52::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Fri, 12 Jun
 2020 13:29:38 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 13:29:38 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-scapy: upgrade 0.25 -> 0.26
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1591855171-36461-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <99ab0de4-804c-12fd-50b4-7d93364e5902@windriver.com>
Date: Fri, 12 Jun 2020 09:29:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1591855171-36461-1-git-send-email-wangmy@cn.fujitsu.com>
X-ClientProxiedBy: YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::30) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 13:29:37 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e076a6e7-0901-4733-ec01-08d80ed4a780
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2228:
X-Microsoft-Antispam-PRVS: 
	<BN6PR1101MB2228FA87DEAC1F9D179C67979F810@BN6PR1101MB2228.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hfPetu2SYPV7k5N0xtWmY0L11yaPImL7KUPx6fs40z5eldxmvL6kuemzF/0BWqK2RnseZiIB/MXBZS7sUSp22/5M94ktWi9AiqHmtD4DQL8u5ovTDxH2ZpUDi+jc1A0qIGJzYWrsbaafp4gpFyzcbH5li1s+ouZ9bfLHsCZG8uw3YgQARHpK+mTv3Gui10RaLZmec+g5C3FzDtOFP8hvTMEa10HkC4MU1gqBfbbnSbmB4cOKvBX7LeEEHStrL2wnHAiUrwsHTad6HkCnfAlEJAWzXmivUNi7zwBIcBRDSgC8y72GgyYy+fZMqvKhSeLnn1cWpWyPs37HiWnJD5bGjhO8dBcumDQolMaJEr2gLI8NnPGS5nMihsg4N5NhZukrNmkPcAS4rtbACJnm+zHkBCtSchrdZq0pnOFz+F7W6dlJlMeWUK/zLecPZ+GVtqpC86r6VgiHKEYhE4HSR4uR7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(136003)(346002)(376002)(366004)(2616005)(956004)(8676002)(16576012)(316002)(31696002)(86362001)(8936002)(6486002)(26005)(2906002)(16526019)(186003)(52116002)(31686004)(33964004)(44832011)(5660300002)(36756003)(53546011)(66556008)(66476007)(66946007)(478600001)(83380400001)(966005)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	D/jTbuJ1qSom2iqEfqYHqej9GPGdnETLMFZOeHuDpFtXL87RMBNopitzkal2SaD+tGWmNnFy4tx1lKQYlInT9i4nh9Tv9rP70vK2bRBdGGPdOnOfxRsu4oZ+10omxE//YPvf9XYQocz/vo9DKS83z12eGxCJ0VgvLYQxBuKP1lTtRxQ6XZ4W6Ygm0dAmvKlbIdy4DPrl5oXEMdQarVVC8Kw/UL9XXxLGkO80b1Oyi1gojFstuvoiKgW/CfQaumeWKnEo772fMNBfW7Cm+FUSpaE343x0/XF/CYxeARjDmMas7W9kK1r2MeIIPAaMbq48qH72jAdci753vL6xbqqhvfPeLL/wAs6/M1AcifskgKnsuc/SqDlY6nQ2cfITRBSqW8pcCIvnaYZuEy7nZQDeZRqjTU2H9kCFy7FiGyWbdMDK/pNvduotG+AJNrySICLv0MCqppPJd1PrwNLyJb5Tnumq4FaZoyyxCFIld7kwJ8OUdvoG6rFaTHcpps/1xiOE
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e076a6e7-0901-4733-ec01-08d80ed4a780
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 13:29:38.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Hd24BWfesHmPt3TZa01Mg1qtkJUhMPwtogNxmlF4WLFGv7bePl/W02mT2HbN2eYE5sjUCi6eZBR6nS34WqrwzKG0d/dtIqimaZolD2hevU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2228
Content-Type: multipart/alternative;
 boundary="------------9F512B1C70201C7C42529FE1"
Content-Language: en-US

--------------9F512B1C70201C7C42529FE1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/20 1:59 AM, Wang Mingyu wrote:
> -License-Update: Version updated from 0.25 to 0.26.
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-scapy_0.25.bb => python3-scapy_0.26.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-scapy_0.25.bb => python3-scapy_0.26.bb} (55%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-scapy_0.25.bb b/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
> similarity index 55%
> rename from meta-python/recipes-devtools/python/python3-scapy_0.25.bb
> rename to meta-python/recipes-devtools/python/python3-scapy_0.26.bb
> index f785a2fe8..31c88942d 100644
> --- a/meta-python/recipes-devtools/python/python3-scapy_0.25.bb
> +++ b/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
> @@ -3,11 +3,11 @@ based on scapy with python3 compatibility"
>   SECTION = "devel/python"
>   HOMEPAGE = "https://github.com/phaethon/scapy"
>   LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a4282d4d80227fa599a99e77fdd95e71"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a88f5c4e1c935f295ebeaf51fc8644ef"
>   
>   inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "scapy-python3"
>   
> -SRC_URI[md5sum] = "c9003d39def73c028cb8c71bcbb42629"
> -SRC_URI[sha256sum] = "2ae1b3bd9759844e830a6cc3ba11c3f25b08433a8ee3e7eddc08224905e5ef2b"
> +SRC_URI[md5sum] = "513469447735a4a416d495f63e28aa4b"
> +SRC_URI[sha256sum] = "81e4f5522d38c136fd3f1be4e35ffe4fd1f4c2091db3c021d95f8b9d5978b9eb"
>
> 

--------------9F512B1C70201C7C42529FE1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 1:59 AM, Wang Mingyu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1591855171-36461-1-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">-License-Update: Version updated from 0.25 to 0.26.

Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@cn.fujitsu.com">&lt;wangmy@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:1591855171-36461-1-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-scapy_0.25.bb =&gt; python3-scapy_0.26.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-scapy_0.25.bb =&gt; python3-scapy_0.26.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-scapy_0.25.bb b/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-scapy_0.25.bb
rename to meta-python/recipes-devtools/python/python3-scapy_0.26.bb
index f785a2fe8..31c88942d 100644
--- a/meta-python/recipes-devtools/python/python3-scapy_0.25.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
@@ -3,11 &#43;3,11 @@ based on scapy with python3 compatibility&quot;
 SECTION = &quot;devel/python&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/phaethon/scapy">&quot;https://github.com/phaethon/scapy&quot;</a>
 LICENSE = &quot;GPLv2&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=a4282d4d80227fa599a99e77fdd95e71">&quot;file://PKG-INFO;md5=a4282d4d80227fa599a99e77fdd95e71&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=a88f5c4e1c935f295ebeaf51fc8644ef">&quot;file://PKG-INFO;md5=a88f5c4e1c935f295ebeaf51fc8644ef&quot;</a>
 
 inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;scapy-python3&quot;
 
-SRC_URI[md5sum] = &quot;c9003d39def73c028cb8c71bcbb42629&quot;
-SRC_URI[sha256sum] = &quot;2ae1b3bd9759844e830a6cc3ba11c3f25b08433a8ee3e7eddc08224905e5ef2b&quot;
&#43;SRC_URI[md5sum] = &quot;513469447735a4a416d495f63e28aa4b&quot;
&#43;SRC_URI[sha256sum] = &quot;81e4f5522d38c136fd3f1be4e35ffe4fd1f4c2091db3c021d95f8b9d5978b9eb&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9F512B1C70201C7C42529FE1--
