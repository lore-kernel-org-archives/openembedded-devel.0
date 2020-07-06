Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.69])
 by mx.groups.io with SMTP id smtpd.web10.60708.1594050572613194156
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=f5FqDcYK;
 spf=pass (domain: windriver.com, ip: 40.107.69.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIa0zShWtnxcIvvjeYaluGyzSUekBoe1wMNDd7Hul7/ZFivWdHcz5nsRqtaUEV2SlXH6TR3S+JnyvO2lsiUY56ycDbvf4VNMLQCO5aU0CYngCZ+PSAtbCvB7Tkp4o2ImaS6DKW/oIjY4Sqv/6Sv5lxE+NY94jF5l610BxQ3g59H6vYMP4pAdrCLef+WCYXLt8RmU3QpZqkrOzClSq2IHB8DJg2HaJFHuAogPFBcVF8G/Kxj0ifQiwr+ar159YLkgQB07E2NJqS0EcEZPd5hJqSvYZPWd1TZVcz+7lg5Z+/OXad5qz9qN9BpNeCfswKdYF/QLKPK4dyCd9lvlq18M4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMqLj9Blv/8fcxB67mDiTxa4n9QsiB9X1/ErA4ZedCE=;
 b=V+dvF9Axy7g2ZAcIp3K4S9Y6rI6ambl5F3plN7Asw1j3uMgaSKGL1l/nSyl9ENa/Z3S6Hn5oZxZe+f0l5oM7BFLy/D+T0Ec5wjkZPXdB0yxStmT+p4Que5ppJ5kSZVV30Eo9TP+H2fM3hz76W/VYwj2EMAKcQmz1cvrDiNNn8ICQbRnXTts5NcyHBqD7YCdfFq9fvgj5NPS1tnF+/rnvJr99j8ovk3xtVaOenR6JCLTYPmRMQ/fGHqBV4GpNRGnbVEMe9f0dPwoFl/4w6OWF13ahc2ZeRvKjV7bHtGlcM/mV3a31f5wsnTnQ2DWRm+BceDolME7FN+/j+QrUZEJKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMqLj9Blv/8fcxB67mDiTxa4n9QsiB9X1/ErA4ZedCE=;
 b=f5FqDcYKTVlRe5LEz8fpvygzWnxm0o5nrm8gUHd9X/BsNkchJU6ySzBLaer9DV1eIO9GQ5kA3sQVbDbnGmscLNoya1aXXH+W0lYvccPdd02AKo5JxRBJXSdWZ9oiC7z25gSyLDnzL17MLerCsWKOlzyc/Y61ZI4vhqpGapXn5aQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.27; Mon, 6 Jul 2020 15:49:31 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:49:31 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-pychromecast: Upgrade 7.0.1 -> 7.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
 <20200703093020.3514-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <704c510f-cdc6-766b-bb52-c8b993f986af@windriver.com>
Date: Mon, 6 Jul 2020 11:49:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200703093020.3514-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Mon, 6 Jul 2020 15:49:31 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4175619e-1fe1-4e91-9270-08d821c42c6e
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1899661667EA4205887275CC9F690@DM5PR11MB1899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7C6xIVFupuJ7YoKiEvcoCtdw7Al3hWV6fmWZJPBHW4Q8drl3fAWLzx3xpiGIDfHZjMeMuxzFxLuzTxinHkDujUxtnv375D0p7X7jNXOWGmH6joqCKiHbv6Zo68P4q9jtQgROQOjdST/J0LTkN//VEUD2CsyQK0OGDFly7lC6gM0MsMfENvS3Sn6mnJ+blxTqTvwcbEnEiwXVROvgHBFzwnc/VQeiKxwhbgKcXqL7NVRGNfCe94Lz86tRFvE+mWXxLvGvIhTMVZxcsYU55z2p3G/JSdmP6TuFMvH2i4LkRY7Z0Ac1DUWwT/ft16J3ynQ4SuVB2wJ72Kywu/VdKgxJLHItFUdg4YoFf6i04MSqJDOHROQ1wjpxaj2t6RWAftUGngVXXx9I22BfkXkGQLVPxOJBcj71Kv9bOYBV7E7voS3YZD89MsXzuEO8mUvmLd9TivhFXvJi0DSpmeATC0ZzpQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(366004)(39850400004)(136003)(16576012)(5660300002)(31686004)(478600001)(86362001)(83380400001)(31696002)(6486002)(6666004)(966005)(36756003)(316002)(956004)(2616005)(186003)(16526019)(33964004)(44832011)(166002)(52116002)(8936002)(8676002)(66946007)(66476007)(66556008)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	PJt5xyZjBozqcdYAiwNn27qbGil8jv1EUXuj9/FGAPbB9YN1vADKZawa9bpKlj0zPpDsWnXSHR8QvOt4D4FWtlX7uxo34AKXue2phTDDAL+2ypWuxaafzQewuCfdc0iv2NkWiznukj5+6LoXw0C/Wtab1ZvjIlV+Q1JHiKwgdYclCxbHz6iiO89dgOTmrjKstxJ7WwSnMC46Qw3uSUZzq3GKcRNSJnDf5Rq8cp05FzpfQOLsYfO3V9w8sr/Y3o70tkppCELiZZUo6Db9QajXcu7ZC6kDZco7N5+ErFdjJvqtbEvmS0VzQVGdBo65D6K69VMYc0Khq+EXh5xhboCnYFT8b304as5xcaJvLAqdRkv+Bq7fSAQiSsY6uquzKiEPb8GTpgjhBOXznsAxAnwO/JPkqc0sSW9B8Vf2rBzFwMcpOC29NOfuhOcXFm3PbkpdbcNGuO5cnqMULRjCt8tXCJsp52ImUenRwRm3weuYHGV332tOIxEDGh7+QaFmdDEV
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4175619e-1fe1-4e91-9270-08d821c42c6e
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:49:31.6675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0gt3hwqnGy1RBG/YPO8mBNYh9U2jf3ISFYrLbDB5yh6FgMH686F297PBRXQRzp71TgDO/Pl1k1P1d9AO0tBYUxnaQHdlykvah2zEGOB3hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1899
Content-Type: multipart/alternative;
 boundary="------------ED56E5B5DE1115E60CB28D6E"
Content-Language: en-US

--------------ED56E5B5DE1115E60CB28D6E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/20 5:30 AM, Leon Anavi wrote:
> Upgrade to release 7.1.0:
>
> - Report host+port for discovered casts
> - Fix plex controller
> - Update list_chromecasts example
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-pychromecast_7.0.1.bb => python3-pychromecast_7.1.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.0.1.bb => python3-pychromecast_7.1.0.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
> index d21bb5f3ac..12076adcd4 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[md5sum] = "519d928bf3bdc8adb4dff1ad0e9de6ff"
> -SRC_URI[sha256sum] = "85112a0f39727636e35a0e1b633cc55a90a17bfc06be0a9a9bea5e46ac603cf1"
> +SRC_URI[md5sum] = "10483fca4ffa0381c0c49f3647827179"
> +SRC_URI[sha256sum] = "30e18e7d79b6ce2097e630d3cab6e6503f759808ae1ae592bec0a8a7591534f3"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 

--------------ED56E5B5DE1115E60CB28D6E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/20 5:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200703093020.3514-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.1.0:

- Report host&#43;port for discovered casts
- Fix plex controller
- Update list_chromecasts example

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200703093020.3514-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-pychromecast_7.0.1.bb =&gt; python3-pychromecast_7.1.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.0.1.bb =&gt; python3-pychromecast_7.1.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
index d21bb5f3ac..12076adcd4 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>
 
-SRC_URI[md5sum] = &quot;519d928bf3bdc8adb4dff1ad0e9de6ff&quot;
-SRC_URI[sha256sum] = &quot;85112a0f39727636e35a0e1b633cc55a90a17bfc06be0a9a9bea5e46ac603cf1&quot;
&#43;SRC_URI[md5sum] = &quot;10483fca4ffa0381c0c49f3647827179&quot;
&#43;SRC_URI[sha256sum] = &quot;30e18e7d79b6ce2097e630d3cab6e6503f759808ae1ae592bec0a8a7591534f3&quot;
 
 PYPI_PACKAGE = &quot;PyChromecast&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------ED56E5B5DE1115E60CB28D6E--
