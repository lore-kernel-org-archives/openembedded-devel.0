Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.62])
 by mx.groups.io with SMTP id smtpd.web10.2920.1608571081836011438
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 09:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LrIj7Gcf;
 spf=pass (domain: windriver.com, ip: 40.107.93.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAd77NOuL9LITTui+b8tQra/zgi/JNZ1FpZFLwFZDUdziNHZUeqnylQ9vdN+cY51YGYWiYhIVm6zOPdCp9uZvxz04ss8O5tRnPGuzvc0asiRIbOcI4HIlHNKCd/5Q9aCXL2/7y2K+rWXjjahLGpHHpWzrIzTQMdPFWS2CsSYVYvzfY76/x+vIi6v3FQYIok59yYeuXjQCZBlOTK2IMANP7kVWOuuy023QZYqKg6LyRrfqs7dRfqrUuAjse6RaiPBH+xGoz5SLlm2WjDJwbNI5plQmklN2UeCbDbIeA+zu+E5rfz2r9YmmQPlClBs0DqdEift+5lFmn+WYSUApgSgVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpQsqlIqD618ly86krVGdOZG590NUeL0r1/0kvngggI=;
 b=DJTBoI6yRo4/otX0q1mJshc7QppoyPWL94FKuyaQltlLiJGRwBDZruhach9hq59CcdmUR1vpt0qip9X/8YmTjggJQFWKu6bMllFjOMQa0UdOy/LyuGJGh6SrrYZf4WcYoBVWaYiDna2+0wHds/53sKw35bCZ6H0HAZ/aJv+ijVIEMDwlnI2xdOP9Nx3nr0OyR/ex2chwmG4BbH8Io3TmZ2WPLe5hoRPYgXO/Pfd+4IEpMorRH30vTlTINEVuNwjXTXE6Ey23KSAYK0TyoTfnA8yYOKMbPM0z3YiRWXLafjg7ZHOEBRk6D0oH2U0tVoBw/zXMhhlpTUVW6IvZtAkXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpQsqlIqD618ly86krVGdOZG590NUeL0r1/0kvngggI=;
 b=LrIj7GcfI1qcoC6K5lMVGJk1JtgnUw2if6gWNgssgCz4s3T00uwm8MqPuyVR7DIzYaxZNz5RTu52FQoWkIc4jRyoFKBeqRNK2fMVDhiHuXa7p7EZBg7nv4IywlIFocs/5h+v9O64kZBIi7qkMlwytm1VGB9JS9IeZlcXHgjr/nA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3719.namprd11.prod.outlook.com (2603:10b6:a03:fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 17:17:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3654.033; Mon, 21 Dec 2020
 17:17:59 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-luma-core: Upgrade 2.0.1 -> 2.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201218214748.14563-1-leon.anavi@konsulko.com>
 <20201218214748.14563-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <91e2354b-2927-d488-c1dd-087c53987e35@windriver.com>
Date: Mon, 21 Dec 2020 12:17:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201218214748.14563-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0033.namprd16.prod.outlook.com
 (2603:10b6:208:134::46) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0033.namprd16.prod.outlook.com (2603:10b6:208:134::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 17:17:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18ac9865-8214-4c36-e884-08d8a5d45d84
X-MS-TrafficTypeDiagnostic: BYAPR11MB3719:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB37192A92557B1DDDDE099F839FC00@BYAPR11MB3719.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rqkAxPvV7prjOkfxbHt1LvE/AAroFLwWR7XoW73yugZ4r7SeeQFcKkJZzqechwAso8m3txX98NkAnuu0qi4UO74Bj5Kom6hzVZbweQJBV67Jbw2DIuFnzqy4VFX9W7Ek/pATtWp8e06jIsJW+NPzl77kVsJhwBqKv2D4co8vOdCmqGxUEg5ncozov9ZeH55oI4SQCcXvSUhmEKmwm6f+RDv/K1AL1vHHZeEmotZ/LdYg8CEIiKi2cXH9+PqrW+ziw8MNz9OtUCOHpPtGwTYrjah9I0+So3T2jrBaoK0JdznOC+RQjVbMgoC+4h/mPO2QqE/haKxgfJkIs4KMp2jwB8imtSFp/KKhepS3h/9jWdAZ+PphiYeGR3V22nZoEYVItvPvA8YXZp7czOFTrdv2tx7afNBCQb5fz8fVEReNcF9wGDIh/j31cIk7+DDhy12xU8iINWNvT8SnYXuSMUxqyvSX4SDM6upHPO7rap3KZKUNWk84DUvJk1U0/gXQXCi/ccv8jUCJhctGDzG1dz5B/FCl/YUa3zP6xR8SdFcwRSOMuAP5eijON3QPVcC3OMsj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39850400004)(478600001)(66476007)(166002)(186003)(31696002)(966005)(316002)(2906002)(8676002)(5660300002)(6486002)(83380400001)(36756003)(86362001)(26005)(52116002)(33964004)(8936002)(16526019)(53546011)(2616005)(16576012)(44832011)(66556008)(31686004)(956004)(4001150100001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WFlvQk1wZENMSkk2ZlpjOEdkN3g1TS9FV05IMG1saEJucThibFowZnNOdXVr?=
 =?utf-8?B?bDM5YU1qUW85bzlNQWtDTTZhMDJ4KzFkREVJaGFSbFlJZmRzTGxsSFRJbGQw?=
 =?utf-8?B?WitmUFpHNFU2a2xYRFVwYW9PbE1BRENSZTVPaVJvL3ljNjhHWWQ2bE5TRi95?=
 =?utf-8?B?cjU4SGhjQTFUdG1WQUl4L3FaQWVCQmlLMXdYdnhLQjUrNjNDZ2FubVNCeVFM?=
 =?utf-8?B?MitmcmZ6cDlTZzZZaXJoZHF5YnA5dWVzeVZGT0dhVEowWVpGcnJiaUdjdGty?=
 =?utf-8?B?dHhzWlZSK2NRQkxBVHQzY0xJWk9qNEtuLytCblNGUEJEZ2Q2QktiYmpmU2Jj?=
 =?utf-8?B?eGRYRyt3SlQxYitwR2R1T0padWpJZUdqdVUvYm1GQ3dqbzIrQmRQdURlSXN6?=
 =?utf-8?B?dWxwekt3T25wQXB2ZnpTcFBhWURhbk9GNTN4cWNrYm1lK09FYUhYaWlSOUgx?=
 =?utf-8?B?UWFuQmdQUDZqaHRLdDdyRTBzVDJWS2krV2VJbXlnS0hKNml5VUl3ZjZxNGdV?=
 =?utf-8?B?NXhmeWlpTHA4bTB1OGdmcDlhWlVWc3AyTFNuMGZIK1JGdmRrYzBrVXV1dENo?=
 =?utf-8?B?cUw0T3pOSnpxZjhNeEJ1c2xESFVFNTM4TTZkOEZ0TnNVTXljSEY5TXNvb0pL?=
 =?utf-8?B?U0wveW9RSzFsOERTdHNObzI2SWQ2Sll3TmViZlpzL3NvVktHT3JxL3B2aFFn?=
 =?utf-8?B?OFVTeWxuUXVLejhiR2tCZ1R1UkkvY2pMemwzNXpGT3dPc1NtaldyVnR1RWJR?=
 =?utf-8?B?c1A0ajhIcVpvYXNOSExka29rQjQyOHRWU3RlcWFtM0UveGQ2TzdnSW9iWmkr?=
 =?utf-8?B?Q0RFaG5xNk53K21rNmg5cmdJSU1SRktuRTArcHMyMVNwaFRXenBEVmJQMkJN?=
 =?utf-8?B?R1I1UEVtTTFwUU9aUExNTUlpcjdqRG9MaUpKR29zSTBIN21mTTJmOFU5MkVm?=
 =?utf-8?B?eS9HM2FuM3pxQjc1M1JIbjJHVkl3OW9BbnpzRmY3engwL0JMaHJhTTNzaU1Z?=
 =?utf-8?B?NmZEN0RIZElJWHVjUzZGS1QwM0puZzI3bW9mYndDOEZFMmJPL1VBSXl3N2da?=
 =?utf-8?B?SzhKMW5RQ0h6dWRKWGM3eWVVcDFPUnN5MnBKWWozTSttelJZdlMrK0JpdFRX?=
 =?utf-8?B?eGJNVkpGbHZVZEdGY051SXdUOTExdE1ESGN1TkZEcjB0a1M0TkhuRmd5ak0x?=
 =?utf-8?B?L0dUTXNlcGtRcXNjenNQUzJhSTNTYjZIWUh3OFZIWEpmalQ4R05uYkJ5SHJY?=
 =?utf-8?B?NStwSTJUUHB1SVNBNTJjSjFLR1AzUnRrTFQ2emlHQ2UvWW41ZS9maHAyZHcx?=
 =?utf-8?Q?9LvCgdwFlb2NHlU0WgB+SwJQGbetBOdM9h?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 17:17:59.2067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ac9865-8214-4c36-e884-08d8a5d45d84
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJEQzElCxM7Y/ZyNiiIRw/mGCqZyTds/6ID6RN8CdI+5HXWnJzeXFhoosbKQfY+ktbfUkHqwtvAq3uzd/GDBSaX+j2xf/xDTMFmRgw9TOR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3719
Content-Type: multipart/alternative;
 boundary="------------E6F2D00CFC5C0A53AEE80DAA"
Content-Language: en-US

--------------E6F2D00CFC5C0A53AEE80DAA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-18 4:47 p.m., Leon Anavi wrote:
> - Linux framebuffer: Support BGR, RGBA & BGRA colorspace displays
> - Linux framebuffer pseudo-device uses diff-to-previous algorithm
> - Change order of namepaces cmdline, so SSD1306 is default
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-luma-core_2.0.1.bb => python3-luma-core_2.2.0.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_2.0.1.bb => python3-luma-core_2.2.0.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
> index fad7432132..b181e09861 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[sha256sum] = "a0bc18c03cfb293c9c1b1d8883c2ec7c29d167e4af99f795b5698c8a864332df"
> +SRC_URI[sha256sum] = "62a24518d3aa084d75206a19056eb8aa71b5a3d0c159d2e95b388cb3150a7b1c"
>   
>   CLEANBROKEN = "1"
>   
>
> 
>

--------------E6F2D00CFC5C0A53AEE80DAA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-18 4:47 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201218214748.14563-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Linux framebuffer: Support BGR, RGBA &amp; BGRA colorspace displays
- Linux framebuffer pseudo-device uses diff-to-previous algorithm
- Change order of namepaces cmdline, so SSD1306 is default

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201218214748.14563-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-luma-core_2.0.1.bb =&gt; python3-luma-core_2.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_2.0.1.bb =&gt; python3-luma-core_2.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
index fad7432132..b181e09861 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1">&quot;file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = &quot;a0bc18c03cfb293c9c1b1d8883c2ec7c29d167e4af99f795b5698c8a864332df&quot;
+SRC_URI[sha256sum] = &quot;62a24518d3aa084d75206a19056eb8aa71b5a3d0c159d2e95b388cb3150a7b1c&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E6F2D00CFC5C0A53AEE80DAA--
