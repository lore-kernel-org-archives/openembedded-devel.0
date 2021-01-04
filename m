Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.75])
 by mx.groups.io with SMTP id smtpd.web09.14912.1609774287970526521
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Vmd3L6O3;
 spf=pass (domain: windriver.com, ip: 40.107.77.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItNIKGwI8Pkv++SJjxuMMw6vdEGMIEqGPxD4HDePYYk31wiH2Bbr7RZY900aRj2Emf8O3zsIRM1nGol1VxHepioY+XD+X4wKNt339faVkPeEatlF7w6JtowfvmGBzTqonYOnUu8k8I7iw4yxhlah9kLs8ULs7hiraJZ40WBHJvG1PEOX98HFZrwDIWMST3hy2KJbs3PpP+AtgQYEfvIhFV8+BAQiQ8PFWubOt+eaBAJHVSp0Wp6DmpdS+2OWwDhlzrkfPfTerZMCJmCb1lTW+IV6wfxkX18m9+7cingI+qxsS3w6KzvFMFhDO69o9KNiY5PV2p4ttu2NzjYpHEri4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiNB61E7rZSLTbe/QdCmRw1QDTq0p7cvhumHg1eqf6I=;
 b=fRy27ZODGwQWXZIOmnzE2aBjHuKJ3kHm2AedwhAb91B7E1V/rOuuDnZhyqt368aA99J+mljD1fO56RT0/HmurqpbSeR/0D+0D9q0Likf8P8p46Xpyb9kTkud5uoCiWjBq9SxTQ+Js/8aSOvUOwSvwWYcrlCCJTpwKms0kAx+rEjCzXBp823YCz0e0Gc4dAkz7gfVTBwVEWVGw+ErLqeSE9IPgPdgZa0vL8bKXW+VNVPFgpFEbXm9Ul69OEaMgkIRBStJzzgB/RpBVaOh++kEGEPhc/pwU4llRAfLgLIQWRa0mDQ4302xNgwS62k3LokKKS5oxNncja3oucSD1Q2DTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiNB61E7rZSLTbe/QdCmRw1QDTq0p7cvhumHg1eqf6I=;
 b=Vmd3L6O3JU/2Z5od8b/hx6IuYMOmEJUzc11CJXB5X/RE5co3xUwZH4hkRCLNP+z2ys14mHp+xLWg+DFi33S9qqp+cKBN3LzrflsKLkF4vU/JpTPEpCr0G6pgfsJgy6HwGwO17I67cgxMfHDCuTHPd4zr4z3bqWucH8D3dZmNdXU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3222.namprd11.prod.outlook.com (2603:10b6:a03:79::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Mon, 4 Jan
 2021 15:31:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 15:31:26 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-watchdog: Upgrade 0.10.3 -> 1.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201222011459.14452-1-leon.anavi@konsulko.com>
 <20201222011459.14452-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <61c1a78c-1c76-944e-8d26-16bb941a5e0b@windriver.com>
Date: Mon, 4 Jan 2021 10:31:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201222011459.14452-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0448.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0448.namprd13.prod.outlook.com (2603:10b6:208:2c3::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend Transport; Mon, 4 Jan 2021 15:31:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0645de9c-cf19-488b-efde-08d8b0c5cd0d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3222:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB322250A6E01CC08D37AD1E9E9FD20@BYAPR11MB3222.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	96RQT46rPejl+BcGQZzlup5lZj/JV3XmD4n93R80UD2e2X7TZALqbyYOl3k4CCreTHkLDpuZXGX7CNuGQn55f6Z/SJb8oIK/uW1Ox0Tx4vkjdbqibzVP+KMQLXmXSvh6+rHo6+XRbMOsv8gukNGqVL9FBDD1FMkWSrjVsRHa0a0FX+25W52BouCaIXuZ3z/iRt+C++D9oG8GxkjmKaWWMw0O+s6IPTsBEOyW5ov9uuaGpIHp89wJZuOKcMQoJdqzowCXYiCzVU9arQOY3K0ZErCeHSVfNwV2VuzUJrz++noBT2OebBElKey8TC+VX11P5fSfK60AgYT/cd33pbg1JJb/ZSrEw4TLj+3LdiA6P2v9upMqo0k1hRLa3FSuDyw0u45nqvN3clMDvIygh/Rti8k7wshdwcFJ3s9aELZDU7kBkx4WCO6c/CvlJRVIol5onkfCPsLbdhhSmytZFCJJrLnv5TkvG2ixOFq0Lqw82emQC5bnoeNYBJkWxuCjaA65eiqTV1VGuuQiLIbfpXBsf6kI9vprJvSJblNIgQjyhXQUvA6DosbZikxnr0+FA9eR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(26005)(36756003)(8676002)(66946007)(66556008)(66476007)(316002)(16576012)(6666004)(4001150100001)(44832011)(2906002)(31686004)(16526019)(52116002)(31696002)(186003)(6486002)(2616005)(83380400001)(956004)(33964004)(966005)(53546011)(478600001)(8936002)(86362001)(5660300002)(166002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aDJ1VURqWHhudVNjUmx6cTN6QlU5ZFNGdS96VExiTVhJUnhDVm1xeVRJQVhK?=
 =?utf-8?B?aTMxNFFVSC9oRGduVmJOa0JpYmRCRnpOYzM3MFBBWXlFOVVNcGJxL1o4c29C?=
 =?utf-8?B?YnZ4bjd5eGRrbHRUZlVqd1NtbEFLanp6NmZjZ1p5QzY3bk15R1l1QjB6RXZl?=
 =?utf-8?B?OENCY2IvTmQweUprampYSGM3K3VLbGNMcDNJb2FheS9DdEtWSk41NDBZN0tp?=
 =?utf-8?B?dTFqclUxWHZDVVJHVG9nVXZxOE44NTNuMm15SHFnQ2cyWGF6Vk4rMVlUMWRV?=
 =?utf-8?B?ampEYVRxTGtMUVpWUVBvYWUwbGtBRGZUN2o2MXc4Ti9wck9remZXaXNGYnps?=
 =?utf-8?B?ODA3NTFnSFEzS1ZFbWFrMmcyMTJ3RFUxc3h4a1Y0cmMycXAyaXRSUktUZUFp?=
 =?utf-8?B?UlRLL01RUmx0NE9zUk10U2JQWXRjeHhnS0Y2V21uL0JJdFVEM3RSejZCTysy?=
 =?utf-8?B?SVVhUFpLSFN3bFJWL25VaDMyRml5UE8xNlo0dUNRNEZtZGZyVVFVR2hRTTVS?=
 =?utf-8?B?SE5uOTI3ajAwZnNJWHNaY2lxZ3VhWS9GQThvcFVRUTdTZUt1TnAyMUNRcjBK?=
 =?utf-8?B?bkVmcjhXY1dVSWcvUXcxVStEbklmc0RYVGVrNFZ5aHZQQVN2ZmJhaW51dElp?=
 =?utf-8?B?VnpLemtrWC9qRXVWWXYvMU1semxCaGtZTnl6UGM2NFE1Z2lyY29sdDZtMUVl?=
 =?utf-8?B?RitodVk4K3JmSFZZTURwQmpJRmd3K3RDOTNoN0VBZjBmaWlpYzhmNC9ERWxy?=
 =?utf-8?B?NGd0NlZmakNYTXNIdE1tTGFzWkFwQ0lUUGRwZjJ1RTQ1UFoxcGYwWFZQcEZt?=
 =?utf-8?B?aFFxZXB3SFZJWkJMZGYwQnZQV2N2WGJTN3VXbXNNNyswQTVsMmpzYkY1bW5Q?=
 =?utf-8?B?aVRuNVBsUVJTYVN0M2tnZVVvY3N6dlZKL1VCNHN5Sk0yeXBqT1B2blNOaFJT?=
 =?utf-8?B?M2hIZlN1OEpIRDJlbzVGaXpnQmRnUDRvdWtmVnZtVEd2UGpBem9ybGZnNTh5?=
 =?utf-8?B?aUNad1g3K29lMHJ4WDhyeHlKY3pwaUNjRFBKOHdxNGRjRGVaNlpCY1QzQXNS?=
 =?utf-8?B?SldnZUl6NXBId0JBR2FaOThxa1FEWUlpRndUT2lvc1NSbnlGcGpDY0tvNnpw?=
 =?utf-8?B?WnlYUHU1WVJNWEs5aHE0MDB1N1J1ZDR4ZUJWeFdMV3E2N3RPSG96SVRXMEN4?=
 =?utf-8?B?TU1lbHlWYll4a3ltQm9odlVhSVJOWDFtdW9oV0FQK3I4bUkxQ1hvN1JLSDAx?=
 =?utf-8?B?L0J5Smt1MjFoMjFLU2JEaHB3QStBNXhzME5sMkZLN2VBcllIYTFaUUwxMjVX?=
 =?utf-8?Q?kyrA5pY0T7qvJWTj0Hm0QWcxC+v7rE6gtw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:31:26.7274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 0645de9c-cf19-488b-efde-08d8b0c5cd0d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ge2QMX5RRia2YvmUOJaxdTqX3h6tuqrcpbkADAMteYMLuaZZ/TUpeLksTGGHvdPClUgFV+74vBb/dRDekNcfL+3gaBW+iXQ22leo8O3xos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3222
Content-Type: multipart/alternative;
 boundary="------------DA4F7629C0EE270499CCC9C7"
Content-Language: en-US

--------------DA4F7629C0EE270499CCC9C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-21 8:14 p.m., Leon Anavi wrote:
> - Versioning is now following the semver
> - Drop support for Python 2.7, 3.4 and 3.5
> - Use pathlib from the standard library, instead of pathtools
> - Allow file paths on Unix that don't follow the file system
>    encoding
> - Removed the long-time deprecated events.LoggingFileSystemEventHandler
>    class, use LoggingEventHandler instead
> - Wheels are published for GNU/Linux, macOS and Windows
> - Uniformize event for deletion of watched dir
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-watchdog_0.10.3.bb => python3-watchdog_1.0.2.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-watchdog_0.10.3.bb => python3-watchdog_1.0.2.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb b/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
> rename to meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
> index 2108cbb93b..698dfe7704 100644
> --- a/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
> @@ -4,8 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI[md5sum] = "9a5c9134e943b534b9f8b51d78338cf8"
> -SRC_URI[sha256sum] = "4214e1379d128b0588021880ccaf40317ee156d4603ac388b9adcf29165e0c04"
> +SRC_URI[sha256sum] = "376cbc2a35c0392b0fe7ff16fbc1b303fd99d4dd9911ab5581ee9d69adc88982"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------DA4F7629C0EE270499CCC9C7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-21 8:14 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201222011459.14452-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Versioning is now following the semver
- Drop support for Python 2.7, 3.4 and 3.5
- Use pathlib from the standard library, instead of pathtools
- Allow file paths on Unix that don't follow the file system
  encoding
- Removed the long-time deprecated events.LoggingFileSystemEventHandler
  class, use LoggingEventHandler instead
- Wheels are published for GNU/Linux, macOS and Windows
- Uniformize event for deletion of watched dir

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201222011459.14452-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-watchdog_0.10.3.bb =&gt; python3-watchdog_1.0.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_0.10.3.bb =&gt; python3-watchdog_1.0.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb b/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
index 2108cbb93b..698dfe7704 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
@@ -4,8 +4,7 @@ DEPENDS = &quot;${PYTHON_PN}-argh&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
-SRC_URI[md5sum] = &quot;9a5c9134e943b534b9f8b51d78338cf8&quot;
-SRC_URI[sha256sum] = &quot;4214e1379d128b0588021880ccaf40317ee156d4603ac388b9adcf29165e0c04&quot;
+SRC_URI[sha256sum] = &quot;376cbc2a35c0392b0fe7ff16fbc1b303fd99d4dd9911ab5581ee9d69adc88982&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------DA4F7629C0EE270499CCC9C7--
