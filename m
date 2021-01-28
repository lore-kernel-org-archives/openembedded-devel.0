Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.40])
 by mx.groups.io with SMTP id smtpd.web12.23959.1611839188719058282
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=S89oQk9v;
 spf=pass (domain: windriver.com, ip: 40.107.244.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UACTJhZt5aL0mSgi4jvEX4bIBkLjqWbdl8fYR+14JQg2AJlcl6qFQPVnlqRmyXaB/Spsr/rbdvF2tDEONer8XT1seP+i5jPGgRmzu7Y2h9I5Q3x7S7hs0AhcqcXO+W/JaMlufgfDZ7XAVb2nc9+kScpI+4EOA5zO1cAMRtIoEFxttzx6qV2DlQbHm+S05uBTteQ3Suf2gwNOiFXKh7pdQjpyVJzaL2cJvpnto52p6fukGPZkhagyI5c2P4GujQqW8n8VFeDtTzQw31T0ZhV6XqibQs7oCh3qvW8LtxzKvRPnQsci7/fV/rOvy2glCx7uThHOmUotOad2PkSECQYxBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miumiSlcKXuo2OhKjuvKuyWZpqjjm6nbRCgm2aZtWik=;
 b=nojK2CHDyYogi74+r3EbHocfLzK+cp04j5F59Px39i2cdtM0mTJdZ1uT2Xpe31wFeI8sZLAkSACmzdMx+BpVD8Ihx7oJ1g0E2Gp5W1DQRKiwC6NyIStx0Py0G8N5uwCdpT5yD9z2hDP1Kzw8lkZEV/B4OOYOR/eMpyCkepTLE8JqLodq8oLTP49+W8ehbUQHgxPAY7vMNugxX9xyvSgyiWRGYnExUPyAelms0SENYpjEMCCTKRvOJefTglovPTZV4wtJsKfbrPfHkol/iYdCR8feAtSMs525/rpsmSYSG8xyrsiQ4eE5Oybpjzleqx+cKHv9w69jmZvBAd5U8QaO7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miumiSlcKXuo2OhKjuvKuyWZpqjjm6nbRCgm2aZtWik=;
 b=S89oQk9vsBDzSDO7v+7c1s6+njn1zCPNe1XabWBMCe+SOlXo4XDk1T9T7HHfd9qRSl2idrP1uG9xnoF/1N6pb2XKMuGHNzsuhez8CjiTaYT3GfnICpbUH47fpEN/4UWPLf/WzfTVcQW14Dv2nq9apGu5jDwURXRJ9YPCJ7tzsvY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:06:27 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:06:27 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-lazy-object-proxy: Upgrade 1.5.1 -> 1.5.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210125152337.20937-1-leon.anavi@konsulko.com>
 <20210125152337.20937-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1b52d07c-3b94-3154-c42f-4d2020c85cc9@windriver.com>
Date: Thu, 28 Jan 2021 08:06:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210125152337.20937-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0043.prod.exchangelabs.com
 (2603:10b6:208:25::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0043.prod.exchangelabs.com (2603:10b6:208:25::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 13:06:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c103266-28d6-4b9c-4dcd-08d8c38d85db
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951AAD0F9E3F35EDCF270D59FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	09zYWXglkePotcCBna9lLTHheIB7Io1Wbzrv3marGD5kaj5Bx9EmQc4pCW7yHqGTu9mefmp0teQ05GePUPWk7zBYQ7Cw9lftOZMOp1+s5VNGUqUFrveUYOfOuuPvxCByeU54uDDwhAl+D+v1eKj9ypLWezLljcVKYK1D9CCRk88eFr10B9JfSwn4ay7ClOGpCwNG4Wu4k4QMHFtoCVC2NGp35FQXOBHbvvEn4taEdqjTTVA2s5E248A6kabAif4eGkD56IpZ7ru1YkjYKiIwHxTgUfoagK23QK2lmWpuvaiSgEA78RQ1obGIgjBqEApPs/CO2sNFvpBS9pKYCYMU94GahD0CS2QwMGdCWPzLOcUt8wXv0TBhqi9N3VGWDbhhYTApnpkPx0Y6kAS7+dlXCRoR/KJr3pFBpVmzuhrEfY5dy+FN21yUdeCZ32/amKgXX3e5n8KS5iT7xzIPdLnTcycoSP1j+d0+A9tuEOfZgYJ1Tyy1O2uZRUnQvfW78iZ+sYwszHROc+ViGCposk1QO8K3S/bSqMMDP/vu706YY5UOpPyBiDi5EmG7uCUCEFplBotk5XCPX1tkKzJONnYgCMu75MuCOfscydMzAo6b14g9Jfr20Vy9BENX6ci9V/p7PMZ6K3VKu/5lHmcw0BVUC8LmxIKyiGeauUc+byJj6M4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cjd6Qk81Q1RzN0ZRRmYzWlcrSlpkRGlIR1BEZEtqUkU0TjZQWThZRXYzNFFI?=
 =?utf-8?B?Q0Z1OUNxOXFodlNhQTZ0azZ1YkxaWUV6YU1zVmNRSzVCMGFBZEd6S1lMT2g4?=
 =?utf-8?B?ZnkrSkczUVh3ZjlyU1VCZFpBUnkyZjhuMWhzdGJkWEFHMktoc3lDNHNpdDlM?=
 =?utf-8?B?TVdMRW9nS3B3SVA1d25XcEg4elNWdGkrTGM1SDJiV2N1RTVydmdMRlI0RlNJ?=
 =?utf-8?B?cVpBMmdNSWErb1hIUEpERXRDMjI1NnBuSXFVOC9ZcmMxWE4vYWZjdllKakNj?=
 =?utf-8?B?SWxpZ0xmK1NIVmsvQ2RaYkVUNmtPbjA4SE9pdTU5bTJHRFd3UTFPTlU3d2VM?=
 =?utf-8?B?K2dKNnZhQUJXKzVKWkpxOEt3TkgzNXJlUzczMEVuUWdnVlJtRUpNZDZKUTU3?=
 =?utf-8?B?Z1Q0L3o2QnFGZkM2bzNOWXZxVFF5SmUwK0F2Q00rTVhvcUx5TnFsbmdRUDJG?=
 =?utf-8?B?TkN3dGRZbTh2NjkxT1ZPM0JRSkhHVlE0WERsendRa3NKRkt4cHFUMjkxRlNn?=
 =?utf-8?B?OW9nUHFFMHEyc0RRcGlQS1Fvb1RJNzhWK0pxNXBoNmhUZFdGczdnRDNQZzBK?=
 =?utf-8?B?Q3RCUnNBRXpya1h3Sml6L0tYUW9zanVoK0hSdHF3dStabkdQenVicUhQU2pF?=
 =?utf-8?B?bnNaZ2hKOGNSYlVDbi9YT0IxZDcvZXcxeWJUTWhlVldRcDYzN1hkd1VaZGxE?=
 =?utf-8?B?N0EwRWhUWFVqNnptMjVhZ2JjZU5BU21DRGo2Vnd1R3hGVHZsblhPU3RNdVJO?=
 =?utf-8?B?R05nTzRUQlpteDcwVkpoWUtpVUxTWERIaFFmRy9TSjY4KzI0MS9LdFg4YmIy?=
 =?utf-8?B?TjJtcC9uRnFZQ1pKeE9jYUFxUEFBTTBERUZhenZab0xTbnpJTDBFUU5GYmFW?=
 =?utf-8?B?LzVoc0VuRkZudkJoaVcxZ1c0R3pZM1FqNm94T1RmcWYzVHVmaXRFak0ybmI0?=
 =?utf-8?B?Z1NQQWFYbmE4ckkvUUllTWxIMXArRm9CazJUelllNXR6d1VNTW0zRm9uK2tJ?=
 =?utf-8?B?dm1DcE5Gend4dW4vaU9rMTEvZkl6RWNTWkZpZmtEdGw5NzFZQXJ0aUJrWm93?=
 =?utf-8?B?c1V3RGRkbW0reEtwV295S1Fxbk94VGNHZ2pjaEdvVEpLYWg1WEVqY1ppaEJ2?=
 =?utf-8?B?eFBnTGZkQXRIZ0Q4eW80dEVhNzZMajcrc3ZDUXhVVWsxSE9WMlVrQ1RoOHhV?=
 =?utf-8?B?aEdJdnZDd0YwaXFNR1JaL3o2aFlpR2ZwbDR4NHJWb3RQMWlERDlVejgwZUYr?=
 =?utf-8?B?T1BGckJmcmZZMW1xMHhmRm8zaHVCTXpEK2h1SEtJcnF1Nmh4Y3ZFcWdJTVFn?=
 =?utf-8?B?WElSRnJjeWgwK3VEcHJFS3RQelE2REdRN0VQVmZHcXRPenFCSFlHZlQveTRX?=
 =?utf-8?B?Q21KOFVFWkk0Z0F1b1lUTmMrd0NMTC9odVNoNFh0WGQwaUFuVzJuK3JXd2Mv?=
 =?utf-8?Q?R24I6LGh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c103266-28d6-4b9c-4dcd-08d8c38d85db
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:06:27.7961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yq38ikLH4l9YoI7LZV+XMyOX8hbhLspjhBmWp0m6sSW18afpTO3zi9DlMQxAGEtlYw7/BGL8zMeJYJgQ63f/6pZuuQ3t5FDdB5Ngop7D+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------C24DF5FCF4AC0782B1040094"
Content-Language: en-US

--------------C24DF5FCF4AC0782B1040094
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-25 10:23 a.m., Leon Anavi wrote:
> - Added Python 3.9 wheels.
> - Removed Python 2.7 Windows wheels (not supported on newest
>    image with Python 3.9).
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...bject-proxy_1.5.1.bb => python3-lazy-object-proxy_1.5.2.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.5.1.bb => python3-lazy-object-proxy_1.5.2.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb
> index 4ba947923..3ff7a126e 100644
> --- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "c168cec73acdec25a49f6f467f5b1eaa"
> -SRC_URI[sha256sum] = "9723364577b79ad9958a68851fe2acb94da6fd25170c595516a8289e6a129043"
> +SRC_URI[sha256sum] = "5944a9b95e97de1980c65f03b79b356f30a43de48682b8bdd90aa5089f0ec1f4"
>   
>   inherit pypi setuptools3
>
> 
>

--------------C24DF5FCF4AC0782B1040094
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-25 10:23 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210125152337.20937-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Added Python 3.9 wheels.
- Removed Python 2.7 Windows wheels (not supported on newest
  image with Python 3.9).

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210125152337.20937-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...bject-proxy_1.5.1.bb =&gt; python3-lazy-object-proxy_1.5.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.5.1.bb =&gt; python3-lazy-object-proxy_1.5.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb
index 4ba947923..3ff7a126e 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf">&quot;file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;c168cec73acdec25a49f6f467f5b1eaa&quot;
-SRC_URI[sha256sum] = &quot;9723364577b79ad9958a68851fe2acb94da6fd25170c595516a8289e6a129043&quot;
+SRC_URI[sha256sum] = &quot;5944a9b95e97de1980c65f03b79b356f30a43de48682b8bdd90aa5089f0ec1f4&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C24DF5FCF4AC0782B1040094--
