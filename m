Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.60])
 by mx.groups.io with SMTP id smtpd.web10.20557.1593442355004735843
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Fywyx/wA;
 spf=pass (domain: windriver.com, ip: 40.107.92.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euzpaPp07BdHhIP16/XVyrbKWufOMAsH5bWIsOEzuXdphbqdDy3A/bQ7tKskMGsu+SJ4ZS5tF1oJYBTrmnTsERrnRFlb5BwdyemeXpYGkj/K/LRR53gbE8cvHwdaqnrsfqlehMsKAv4ZA7IDfmluxKf5Ts4rBNaZPzdsqgracG1WVobblKl5e/6C+1EyYoqH9RsJCggzi9Zeo8XzPNaAqfXpFuCj0eoTtzZW4o8OIpl8SawCvlvXUbIQe5wAYXWhJzlLynzQ7uQi7MjrtRMgGRYhzjwzU2wLNLEPzJ3KAwKpdPbtJ6samHd1MmwtQJGp8orchj/KKU2MKqlrJLQ6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgEyk1U7Bj6e/AmrgMJlqJY6tRTDMUGTxNPuHgLqd3k=;
 b=O3mZ6kYdM9LlwjIT6MNp1fW213gXKQfEXtsDX5jxUTZyB75Cn/vEO9Co91OHS68IYeIdHvez/Xs8LyCeu65NRs/cGQxoXuCdAAjJ1Fhp0blnRUf80per1T6WBcLcSzNIf+3c0nny2taaMcmiDYR4lolZg6WCchqjciyy5z2Mog0n3cj5YUGLQpw+6Tmc75C/iXPDEQoGBoMiGeN9pTFy9uKoIZ5vDfJs81XvJf901YxD4xfbvRwSgRb7XmlaOXRj+w0mnH2tH53UzOkZN6qg4aiA0i4tB3Dsxbls+Ln8ZW3sXUP4ngqYw6+U2nA4hMN4iMqZ1FEYgxFOEBrhHw7USA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgEyk1U7Bj6e/AmrgMJlqJY6tRTDMUGTxNPuHgLqd3k=;
 b=Fywyx/wAHu2eD9vXszFNYI6MqunzSfQFcP31UFIalE7P/0r0crwEhLeqeVleuFcFKindGGsEeKLmlftfncW9mU1eUzOjM4fKEGxzJBK56+hd6tTxjzQf76LOx4edj6mi8Aq2fvnKtEAfLpbHiFaR2Uj2K+qLoKV97yYD9CsF2rU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:52:33 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:52:33 +0000
Subject: Re: [oe] [meta-python][PATCH 05/12] python3-kiwisolver: Upgrade 1.1.0 -> 1.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fe849a59-d3fa-8207-e13b-4de35a54e544@windriver.com>
Date: Mon, 29 Jun 2020 10:52:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::10) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0101.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Mon, 29 Jun 2020 14:52:33 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b7f5eda-649c-4acb-5876-08d81c3c0e33
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1988677344F744B979CDBACC9F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FvjroiZwCbS7nOoI33f8OAv+7QrYjqx5W11L7fsjtwXK6wahodeSvLlv35iQ2TjpE9yzjtVRCp+sd6aumL9K534hvCtm/A/JJ69h/Jua7Iu/1EHsTTx7sK/oe4cBmtWz9ec7ECF1Ft3kKEoTvFochZIxMJ5D9rDFiLg3OHRwQDt3eNHa8rJ/AZoDcvQiIWZLAgD6N5SJ0XAT+J/wtKgJ3e/GXZUfHa5YbIiFUrK6juaAbSrM/yVNIOJfQ70gZQFUhQO7+GWFUqJrHvUrRMSOSHhI2AZquYiN9Lqu4CTg72FpxygU/quHpuRQWA14nZoT8OUZT6tRnmito9QtU7fv/goGnvHhVzH9UH6wh6EqY3SbrSsW3b0lumMldTXAz8pxXrzCoAbm1VF8tgOTMIaUY5jFDvptseTWZViNOkIN/M2bVikdTrk7XIGm1z6e/jIwhUQZeDU9spxowV9UGzboGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(36756003)(16526019)(966005)(5660300002)(478600001)(2906002)(83380400001)(8936002)(8676002)(86362001)(31686004)(316002)(16576012)(166002)(6486002)(26005)(52116002)(186003)(33964004)(53546011)(66556008)(66946007)(66476007)(956004)(31696002)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	cZXN4u24OM1O/1cFI+ERnrCDCGGyN3/KqGFpARQulE5q88CjvsgR5rI/0FfxmDTEG/NioEdmrACoJ9CswjmuPo4/bbBWcuu4aFGuHFHid5HXuf3DveBZvRcLmCN2gPATB4LrkNoJvHGNijreU7L05AKQgtqICyc0FRRCemyTGVOe9rf557ZnoAH0xA+Mzg+mAjluYXNGRLIXCQWNbYT1ltqIXt6G2A/7xCRqaMsuLVwk4vplSBrSW9PMuuFl54xfKM8ff8qghad7gqVD/o2xjMhNMRSFS2Ed/yXvmdK226Q/RSSmSbO33IRLrMtYPfkDW6aSNP6AH1Daot67YLagf1YOqAXgo4b14tNxF5BeCVZlcanM6OJk7HWU9OKkKwZpsPz3vUrf8KkZGD9RpeTsLQyppaUIXnmUhqcNCRArNTolFjZN6Fd10D3TqBaEQukOiUTNgRE2MUhVsHEWF7wOd2YDmxM7Pb82FKJLEblNF30=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7f5eda-649c-4acb-5876-08d81c3c0e33
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:52:33.7734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeJpx3kv7IhPSWZ3LaBSdHBWRzFODKlkKW71B9SAVB3tn3LJts9RY6PYGE4sk+m6QN9bpPZS7qnQeVZByK3ehPZ0ZK12RQhkQeVIKAWn2Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------EE2C4B4B6C2796BBDC8761FC"
Content-Language: en-US

--------------EE2C4B4B6C2796BBDC8761FC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Upgrade to release 1.2.0:
>
> - make the the c++ part of the code c++11 compliant
> - use cppy for Python/C bindings
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-kiwisolver_1.1.0.bb        | 16 ---------------
>   .../python/python3-kiwisolver_1.2.0.bb        | 20 +++++++++++++++++++
>   2 files changed, 20 insertions(+), 16 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb
> deleted file mode 100644
> index a10830257..000000000
> --- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY = "A fast implementation of the Cassowary constraint solver"
> -HOMEPAGE = "https://github.com/nucleic/kiwi"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=1c177d169db050341d3b890c69fb80e3"
> -
> -SRC_URI[md5sum] = "fc8a614367f7ba0d34a02fd08c535afc"
> -SRC_URI[sha256sum] = "53eaed412477c836e1b9522c19858a8557d6e595077830146182225613b11a75"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS_${PN} += "\
> -    python3-core \
> -    python3-setuptools \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
> new file mode 100644
> index 000000000..94db61142
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "A fast implementation of the Cassowary constraint solver"
> +HOMEPAGE = "https://github.com/nucleic/kiwi"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4"
> +
> +SRC_URI[md5sum] = "9f53fabb361c04d76c5afc688652c814"
> +SRC_URI[sha256sum] = "247800260cd38160c362d211dcaf4ed0f7816afb5efe56544748b21d6ad6d17f"
> +
> +inherit pypi setuptools3
> +
> +DEPENDS += "\
> +    python3-cppy-native \
> +"
> +
> +RDEPENDS_${PN} += "\
> +    python3-core \
> +    python3-setuptools \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------EE2C4B4B6C2796BBDC8761FC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200626112944.25569-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.2.0:

- make the the c&#43;&#43; part of the code c&#43;&#43;11 compliant
- use cppy for Python/C bindings

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200626112944.25569-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-kiwisolver_1.1.0.bb        | 16 ---------------
 .../python/python3-kiwisolver_1.2.0.bb        | 20 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 20 insertions(&#43;), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb
deleted file mode 100644
index a10830257..000000000
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb
&#43;&#43;&#43; /dev/null
@@ -1,16 &#43;0,0 @@
-SUMMARY = &quot;A fast implementation of the Cassowary constraint solver&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/nucleic/kiwi">&quot;https://github.com/nucleic/kiwi&quot;</a>
-LICENSE = &quot;BSD&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://setup.py;endline=7;md5=1c177d169db050341d3b890c69fb80e3">&quot;file://setup.py;endline=7;md5=1c177d169db050341d3b890c69fb80e3&quot;</a>
-
-SRC_URI[md5sum] = &quot;fc8a614367f7ba0d34a02fd08c535afc&quot;
-SRC_URI[sha256sum] = &quot;53eaed412477c836e1b9522c19858a8557d6e595077830146182225613b11a75&quot;
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} &#43;= &quot;\
-    python3-core \
-    python3-setuptools \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
new file mode 100644
index 000000000..94db61142
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
@@ -0,0 &#43;1,20 @@
&#43;SUMMARY = &quot;A fast implementation of the Cassowary constraint solver&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/nucleic/kiwi">&quot;https://github.com/nucleic/kiwi&quot;</a>
&#43;LICENSE = &quot;BSD&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4">&quot;file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;9f53fabb361c04d76c5afc688652c814&quot;
&#43;SRC_URI[sha256sum] = &quot;247800260cd38160c362d211dcaf4ed0f7816afb5efe56544748b21d6ad6d17f&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;DEPENDS &#43;= &quot;\
&#43;    python3-cppy-native \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    python3-core \
&#43;    python3-setuptools \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EE2C4B4B6C2796BBDC8761FC--
