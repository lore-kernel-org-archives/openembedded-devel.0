Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.76])
 by mx.groups.io with SMTP id smtpd.web10.36005.1611578718300212238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Qg2uKV3I;
 spf=pass (domain: windriver.com, ip: 40.107.243.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVB/nqlgfKt7Ef7O+LWLCj61dlUBSxLXIeSt1n8YYY9CeQ/DpfvvzT8wpGHNFJy8Dn08FEHYH4f9zReOxM61iI9zXE5yamGAwp/N/f2TZuxi/1w+3P+G0a70mwbwdztS0imik/GNL7FtDpVMNwfTHfoiEv16Zd8vVn0wGmG3UBkPWwPkhuSmPrf9zdQFW6qGawANm4hLlK2eeyzsUiTbAa0gWmz4sPqsCirZYgX9Qum/iK0wEizRTMIuweJl3C3UsQupjBxzJbHOxKD0zeE8hs5HXS/H55hb96jkNDrMt76y3ARnLg083TobMBcvQkzQf6TmAhlaQTbAFJ9T4Gie+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcl0ip9As/b6mWSUuirLEPLorvPgi4WPyfwHyk8ssbk=;
 b=cQju8Xf2IYWfZ5OsTD9H+/7snVM7aJSpFHaK7se3N6KaK3RuzYnd56z5V5yufcybKnCOLBZXK+/52heD2S2uD1B6yZrcRBePjGNJcSTkIUea1Uv4eFW31uSM5EsQ/cOUP6GVX6hFcSihUIjMiX5hWL2pvxPNqhX737RLkQORoFEhXA58Aig+UmRnvp1MQxcSZHowiyfXXNyPRwBsQLTGILThNEB31xBlTZYeuqH1+t2CPhmsVYbqBohNeW/u4RTbJZ5ZlHCoTbQ1XKFN+gFik0AjKVFhJMCCPsYV42FW884j3XFD4UrYH+Pq3DtuQqhIhR213slzfBWPBkmnpTnHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcl0ip9As/b6mWSUuirLEPLorvPgi4WPyfwHyk8ssbk=;
 b=Qg2uKV3IJuxMeoVyxLZUAAR/e/eCxhB6mFfWGznUpb4pjQBTI1kScOUnuThs2LtQggkj5fkvsv2eMdvC8j2w0yqXEDzRPLg9xTILhlNHK1G9o9KJE1v1VAf8qfImTdFkjVldMY5kxheWgUi8YL5eFCETIp6Du/kSQT7IYmyE7x8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3647.namprd11.prod.outlook.com (2603:10b6:208:ec::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Mon, 25 Jan
 2021 12:45:16 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:45:16 +0000
Subject: Re: [oe] [meta-networking] [PATCH] python3-networkmanager: upgrade 2.1 -> 2.2
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1611348464-4528-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <276e4089-7d9a-85ee-11b3-73feaf310289@windriver.com>
Date: Mon, 25 Jan 2021 07:45:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <1611348464-4528-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0395.namprd03.prod.outlook.com
 (2603:10b6:408:111::10) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0395.namprd03.prod.outlook.com (2603:10b6:408:111::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend Transport; Mon, 25 Jan 2021 12:45:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d154fc3-fa88-496e-a5c4-08d8c12f10e2
X-MS-TrafficTypeDiagnostic: MN2PR11MB3647:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB364773BF2CD2A8458CFB18E89FBD9@MN2PR11MB3647.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	20SRKKzb3pKRO3UOcXu2fNwEotGNYVFHCsvAKy6WXByX5+l2gnr3aEHFmLDFOr9EUWTRYFL+IUl9NBPBKpLMxjnuBn+pl5LgCw6MFPDvV/6OSbDjbkTYxHpMbmf1CNT4VDOAIacgkWBE8BL2fe1BcCK3HwalDnn3JUJIMj580DktTe8N+Nb6bP7r8mxwyUCwbZkvOhKmC/VSKzevDveBS+IufebipdXExj74aqvYbtheNX0wPCpXK8vlxbXvDoIF5hMcKudljo1RjhE9dAXWw9cfTWrNH7lR/TyQEiEfmTzr+J+NIE5lOsPlFxnIdepP3KBbqz+3s8pid+BH1k21/M52CT7lg/xtxBk0Y8cuSvkNhdpuhca8zOFILtHbkl1e4Y7Rf3D+ZeN7hp0lPCJjuxm639CNpPFPdrWtANBYN6l4yv8yGVGnDH9RYUC1Q+lgw0Zyv6/m1zTK0PH7vAgS2S0cybWliCPFsBscONghOJLHi+uQEXIWJv8eBlPdUDSJoi0q42ZdwJe7+QiP7EjElWoSg6o9yBoEbirWBm9aBQ7U015CovvtgohLyaBrzTiS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(366004)(66946007)(8936002)(5660300002)(44832011)(86362001)(31686004)(956004)(166002)(186003)(966005)(66476007)(66556008)(36756003)(478600001)(26005)(52116002)(16526019)(16576012)(2906002)(316002)(83380400001)(2616005)(31696002)(53546011)(33964004)(6486002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZTBIdEE0NTFLM1Y5dUhNVm5iaUhaMkVSenVHL2p4bHVYVVh3WlJjc21hWG9r?=
 =?utf-8?B?Y3RlQ0V4SUpKRTZjQzB0aWw0MjkxZlhDWjc3eHNLT1NOdjB1eDkzbHRBUDZx?=
 =?utf-8?B?U0dpNVBrcU15OVZERDBOMUtnYTg0cTh2QW5xV2N2Q3lHNUhlRXdOUlBZWlRl?=
 =?utf-8?B?cXBiUEt5b1hpeW82OElVQkk4ZFVKNWQ0UWd3aTZiNE9WaDFZL3JSQ0NZeDBJ?=
 =?utf-8?B?Nld1cStVVm1nSVdGYkdmQW5ObXlZTXUyelZhQU9tVnlUay9KVTExZzZpWmVW?=
 =?utf-8?B?UW1kYm5MYy9XeVpCd0lGeUpYNW4yUVNvbHA4TVJRaml3VDJWSW9wTzdPbTZj?=
 =?utf-8?B?VkljUlpkeFNZdWtSS25OVUdKSHZrN082dGk2dFVRYXBwRVlpQklrTmJMYkwr?=
 =?utf-8?B?VDNVNWw1eUt4MjY3QUZ4WlA2STFGQWRqNnZaRnF1RjRHWVYrSmdiYkxMYTJX?=
 =?utf-8?B?TnZIV2VKcGZsVUdRWnBlbmEwOTI1NVdQRW9QMHozQmRFaGNqTzg5SHJrM2d1?=
 =?utf-8?B?bDRxRlV4Z0JSQ1FaclozbjlMdFRMbDh4Z1k4dGpXTWtUQU5HMC93bVRLTERy?=
 =?utf-8?B?cDlSMmhTaStVdjhqYTNkZE1KNWV1cklRMWFZVnNrVjlFWjJXQWNhWHNJL0pS?=
 =?utf-8?B?WnlFV21uUnJXbFVsbURBTXFTd3l2WWw3ZXJiTUtOcXNVVFhsbWZFSnlmT1Bt?=
 =?utf-8?B?SzBmS2RFUFdsOGRSbXhqbFpIVEVRMHFMVlVsYzZUYUVkR1RWa0plN0pHeHUy?=
 =?utf-8?B?cVN5aXY5bHhuMFdFTys1N05RMFlEQWNESWZzWFgvV0NtR3JQTmJCczJEUVY2?=
 =?utf-8?B?d1NtSUY3M2l3bzRTLzIwSW1LRE94R2s5Umdxc3JReWQ4eG5IbmpyckJKVmlW?=
 =?utf-8?B?NHRHalJKS3hyVUJ1dC9pYzFuRzNxRS9YWUEzVXREaWdzMk0yTGpsNmNEWS9O?=
 =?utf-8?B?TElGMzlKNldMT0JnZk92dHQ0R1RKSWEybzZ6NndhS1psRmtjdlhobFNZc1hj?=
 =?utf-8?B?OHY2NGpEeE9UYnRzVDdOQmtPc1ZXWXVNYkpRT3k0cEc2dlA3REdFN01ma3dw?=
 =?utf-8?B?Nlk1R0g1VGF3bWFjSUVJcFVDb3k4ODAzdVEyek8zOCtjUnQweFh0M1J3ZkE0?=
 =?utf-8?B?eDNGUDVBSjE1RXdWbnJubmVZR001VTBkdzZBaXJNekxGUGxidk14M050ZlpV?=
 =?utf-8?B?bDdNTEFUbm4yYVFyVHpiaVI2R0VnblNkTUdML1phOU9ZZVU1SERQZ2cvcnFL?=
 =?utf-8?B?UWgrMU01U3pZOFlPVXJIZ2c1c213OXFtVGpGb1oyOUNrc3ZVd1ZzdGZraldz?=
 =?utf-8?Q?EDOrbc37t7IPuxpWkMkmNnXed2n3AuJBrh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d154fc3-fa88-496e-a5c4-08d8c12f10e2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:45:16.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWLCt8AYUsq+nn3Lb80dFWpv/n3Mg04TNepBa4QLOtLCdHK6rGnr7vx2m43tOVeAiz/H7GyDCe3nCCW2SS88TP55FdFfV3btWEhWwSBaVj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3647
Content-Type: multipart/alternative;
 boundary="------------2F94F9FF7CC88D4C74EB73C3"
Content-Language: en-US

--------------2F94F9FF7CC88D4C74EB73C3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-22 3:47 p.m., zangrc wrote:
> -License-Update: Copyright year updated to 2021.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-networkmanager_2.1.bb => python3-networkmanager_2.2.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-networking/recipes-connectivity/python-networkmanager/{python3-networkmanager_2.1.bb => python3-networkmanager_2.2.bb} (55%)
>
> diff --git a/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.1.bb b/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.2.bb
> similarity index 55%
> rename from meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.1.bb
> rename to meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.2.bb
> index 91a6edd241..d447231fc5 100644
> --- a/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.1.bb
> +++ b/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.2.bb
> @@ -2,10 +2,10 @@ SUMMARY = "Easy communication with NetworkManager from Python"
>   HOMEPAGE = "https://github.com/seveas/python-networkmanager"
>   LICENSE = "Zlib"
>   
> -LIC_FILES_CHKSUM = "file://COPYING;md5=8d8bac174bf8422b151200e6cc78ebe4"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=9f8a5b5844f027357ab19ef3e3c6a956"
>   
> -SRC_URI[md5sum] = "f638d854a3639fb37c0e06d1092a771e"
> -SRC_URI[sha256sum] = "aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc"
> +SRC_URI[md5sum] = "7e05d3ca40a4fa50222ba93cda3d0d02"
> +SRC_URI[sha256sum] = "de6eb921d94aba7549f428ed2b3aa482a5d543ecb6965cbaa0fbb555ab31b9d5"
>   
>   PYPI_PACKAGE = "python-networkmanager"
>   inherit pypi setuptools3
>
> 
>

--------------2F94F9FF7CC88D4C74EB73C3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-22 3:47 p.m., zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1611348464-4528-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">-License-Update: Copyright year updated to 2021.

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1611348464-4528-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-networkmanager_2.1.bb =&gt; python3-networkmanager_2.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/python-networkmanager/{python3-networkmanager_2.1.bb =&gt; python3-networkmanager_2.2.bb} (55%)

diff --git a/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.1.bb b/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.2.bb
similarity index 55%
rename from meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.1.bb
rename to meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.2.bb
index 91a6edd241..d447231fc5 100644
--- a/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.1.bb
+++ b/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.2.bb
@@ -2,10 +2,10 @@ SUMMARY = &quot;Easy communication with NetworkManager from Python&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/seveas/python-networkmanager">&quot;https://github.com/seveas/python-networkmanager&quot;</a>
 LICENSE = &quot;Zlib&quot;
 
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=8d8bac174bf8422b151200e6cc78ebe4">&quot;file://COPYING;md5=8d8bac174bf8422b151200e6cc78ebe4&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=9f8a5b5844f027357ab19ef3e3c6a956">&quot;file://COPYING;md5=9f8a5b5844f027357ab19ef3e3c6a956&quot;</a>
 
-SRC_URI[md5sum] = &quot;f638d854a3639fb37c0e06d1092a771e&quot;
-SRC_URI[sha256sum] = &quot;aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc&quot;
+SRC_URI[md5sum] = &quot;7e05d3ca40a4fa50222ba93cda3d0d02&quot;
+SRC_URI[sha256sum] = &quot;de6eb921d94aba7549f428ed2b3aa482a5d543ecb6965cbaa0fbb555ab31b9d5&quot;
 
 PYPI_PACKAGE = &quot;python-networkmanager&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------2F94F9FF7CC88D4C74EB73C3--
