Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.87])
 by mx.groups.io with SMTP id smtpd.web12.36187.1615212302671242993
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gVgTHPo2;
 spf=pass (domain: windriver.com, ip: 40.107.236.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1mLGHAOA47+kMCEbm+3O1PvqyS/q04C1eyN19QhCufISirsmGTaBqtgyTIhKc3YVF8PvLVzZEiLACafZShHj8t5e/FlkXgbQLg1oTB7j0Qc5+2KxdZxSe5SsKNzyMBoIKeyTepyDsl4vvSJxnKBThwZfcaVAviATIh7NH+uh2JeusiQZWjJKfwIicEeu9VlTRJPn4qqUvpffn2SafwyIX3g7xAg0EqX/T7c7qHhehrkpaz3tdQj3M/VUurotXngpxwnwL20FH+Gy8gwYQZ7WBB9NI5No1KQ0J+0iauvNCA4vId19kng0tt3bLdTXCc/XorRe4pPJ2nbjRHul/zJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkD/HIzbxBa6BoX5JcTNYkCw5DYWeUmVo/ph9W/l1j0=;
 b=MkPq86/XUd9yYT+m5iCk60NDxEQ5Aahc9FuXIRpALG3kpR+xDgB1ZGwPevoI/EKJMXCuKRkQFJrTernursWc+28yKuto3JYby+7LTx0bFqDiXAsLvrLXv5uRQI1GG11bEB8K3kAzVkL19RYInucA2kDfnyLh3GUZKwMVgvYE88GikPX+bd2OvwzJm5I7cnimuUq/sVO269F+RS7XoOZT0xDTL0WavhEm0AbbxdVcNBm19Ps8lpLSQ9b6xZyAtX+G+pdp0O8mfu5pW9swaVyNyke/rkV8HFmM5aHjc1yU/vscNAYcGYqHpR+YI28PmKTs0x1Jd3bJpBRj+raW4oiCOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkD/HIzbxBa6BoX5JcTNYkCw5DYWeUmVo/ph9W/l1j0=;
 b=gVgTHPo2SVnahN16t5edb+HOkDa62t9BeIBFFeDEV5+P1DlTsw2thyxDCloNjjSY2J6+Gz+o5vXOHwcn0szk1uoCzfozm9TElSy92CgBLu8XHm8Du2eT975GnMsBpJG3/mibR40c8dEaZPDuuH3MbVyQo37V8MOgqkSNkNoGhiU=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:04:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:04:55 +0000
Subject: Re: [oe] [meta-python][PATCH v3 2/6] python3-pysonos: Integrate the SONOS control HomeAssistant module
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
References: <20210305160256.3333334-1-andrei@gherzan.com>
 <20210305160256.3333334-2-andrei@gherzan.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <75fbadf0-38ad-ea87-4381-b731caa3c6aa@windriver.com>
Date: Mon, 8 Mar 2021 09:04:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210305160256.3333334-2-andrei@gherzan.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0721.namprd03.prod.outlook.com
 (2603:10b6:408:110::6) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0721.namprd03.prod.outlook.com (2603:10b6:408:110::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:04:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf5e1282-642f-4cb6-da4a-08d8e23b26d3
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3256D3C8E2F189D10CA7B20A9F939@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WavOscKmYxYjp0Vx0kUOncRUQUmUxmV83ya9+6BZmry0AyZExa0gk7WI7DHEy4kSWM0KqdHWtd7echmYZgseCZkn3y1nZmxvoC4yqEF6TlzieyNGi2sytdSPavNIWo5WArzBejhnYDNiudyxrzTYqHJem+cKK0ZTwDuHDbCOnPpug+RVTmP590uxbaceRng7VX4sCZTCJTdRdV1r0SH2v8EY0GtqmmPfkm6R8L67DAlHbVkxwTJtptDe+X1ECBdkliGt16xEhPTdtIblMbdAvUJUK1OAkQdVj8NDvMAG2p5JX8ZcqSUlVnycmTGnkXfnshxyjPokEKCpka6Otzx7ggQSrpkEUUTZAqilQaBgrFIzx7ZSonptwzsL1w0YDs56yGMMDNB9n9GGIqhkIWIex51y1Ud2oP1+hoODbT6iBL5KD0gRJ8mSCXGDblEehG30jARvEhYfa5H2jlBJ0W+zD3Eeg76HJuh8KEBsaiOvYexVphDAwzqWX1wOJhwndW8CUWRCahZRkXDS96wmakZCJGZao7A118Jtt6Skh07BEblZJqbMThFKUQ1OGH1QqBDjuu1om8OZofQ2q91VdRIx8QbDN1qS4W1BKdSIcpwsfbbdM1PrZol/qRe6lOy5hl3/POjg4VQcNraOr0FRo0JE61tvr0FzNFV9SfVgmcDFI6IgJ6YtwvJtcOvxG3rMNWUV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39850400004)(83380400001)(66946007)(2906002)(66476007)(66556008)(966005)(166002)(6486002)(53546011)(16576012)(31686004)(5660300002)(316002)(16526019)(478600001)(186003)(33964004)(36756003)(8936002)(86362001)(8676002)(44832011)(26005)(956004)(2616005)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MWprZ2YweUNlZnhvSzZWWVFJUlNCWk9panBpa0c0YmRFbG03eWQrQUFkdS9v?=
 =?utf-8?B?K3hLTGEvbkFzejJPMVJhNTZOUC84OVZIYS9lYnFwNmhEaGRxNFVqa2swbXBt?=
 =?utf-8?B?eWxwWTRlNm5IQks2Vkl4Q0VDSFh5Wlh5VjB4enpWbFRXNmo3Y1BtUThPSlFp?=
 =?utf-8?B?bjFiYjhob2xFd1dpZi94OXgyVldKc2wxNSs3bkMxMWJoTHI5aC9zL2FhMDRT?=
 =?utf-8?B?RGc4U1lYTVZhaXhnRzRQNEJrTGE1UWxNOWxSMDJNNGw5Rm1uR052TUNQQTdq?=
 =?utf-8?B?aW4yeG8wb0gvNnM1cE1KT1QzZ1JqTmlPc0s0YkplZXV4Ym5pZFN0c1ZsYkFR?=
 =?utf-8?B?bmJyRnY3UE9lblcyQjB2THJxV1ZhWEVvSU0xQzh3THRnTk1ROGtpWW9BdlNP?=
 =?utf-8?B?K3JmUjhHREhXcyt2UFNndTlXb0RZYTJiL0xtK3l4Wk9wNG5IdkZoMVJOQStN?=
 =?utf-8?B?YVNEeDVqMTFXSXc0Ni9LUDBpY0RsTDJWVGNGVFBrWG10dllIV2N4eGRPb0ZC?=
 =?utf-8?B?cmJ1YWtFUTRyZEQ1YXZjRFZ0dW9nUGZQUXBEcDg1MDNteDFaZjdzR2ZNeHBV?=
 =?utf-8?B?OXR4V3UybEw5K3Jnb3pRQWl3NXZnSFhXMGtrWXBiV2JKeG13YmJJUXZ6a2JK?=
 =?utf-8?B?c2dHOTZXOXhiRy9XZ1d1TnJ3K1o0ak43WU1kV3IvSXE2Qmh6T01xQ1VvM2Rp?=
 =?utf-8?B?MW9XK2FNQlRFK1dVSFlnVnlWZlZzeTRQU2QrTUVUckt2b3FsbHVtZk1Ja3JI?=
 =?utf-8?B?U2t1SzRGMU5FbHB4Uk8xOTZUd25oYVpVN0s4d1h4UHVZZEM5R0NJRG5tVGsy?=
 =?utf-8?B?d0VPc0pmdFpsckVzQ0RWZTJzckxwL2hhRWR3RHJiZ0hmY0FHQ044WU11Qyt4?=
 =?utf-8?B?MlpPVURjbGZlMjBrTmdhMmZ2SXBTelc4U1ZXQWFTeWlIYVlVZ0xqanZQSC9n?=
 =?utf-8?B?WUFWRUYxNmQ1Z2FsUFY5eFQ0UzU4bmRhNkFUd1R5b1doUGR2TURXMmt0KzhW?=
 =?utf-8?B?UXorT0lSOC9VVUc1WC9RMXBla1J2T3B1b3JEN1o1UjBTaDExR3ZQT3J4d3hh?=
 =?utf-8?B?NVhuQUp6ZkIzdktpWW9wcmZpUWJxMWZzQ0hsS1IyRVZwUGQ0dmUrcW5nbVUy?=
 =?utf-8?B?RU9pL08yYUdRejU4TmJ2UnBqMkJvbnFOSHFPa0RlS1JMOWhwR2VERU1Qb0Rj?=
 =?utf-8?B?M3pyQXF1aEM1TmxFYnNSaVNuMldwYktRZGhZK09TYUNzVTlkQ1UwaHVCZnc3?=
 =?utf-8?B?ZWMvek1tbzlsaFpocmNGWUVUSkV2Vlo2VWxGMFhNTUR2TFUveGlDaVppMC9j?=
 =?utf-8?B?cFpKZzZQeC9OeDZMVEdXMGtNa2prbyt3RkkwSGtIVDltUHRSWGl3YTdVTGlB?=
 =?utf-8?B?NmNxMTFseHBucEU2d2VUNndpZktEbWczbXpnSHlTZklva3JyMmlVTG8wanhD?=
 =?utf-8?B?elgzYlVxZ0EyZHQ1NG9zaHJmUDgwRU0ySGZlSjRVTmtWcGY5dkh6UURMeWV6?=
 =?utf-8?B?U3FVYXN1S1pkVlpnYStuUU5qb2tIR2lPejRrV0d4UWRjTFQrUHBWSkYvNTgv?=
 =?utf-8?B?TDQxdEJFVTlKYWsrK2lsSWtMMEhTMzFxZ1JJVXpmUEkyQXJlQlJIeW1jRmtV?=
 =?utf-8?B?VUhaZHM1cGNvdFZnUmp2U281Z01TL21GQnFKSVFNQUhxbW9HR25aaC8wRlNB?=
 =?utf-8?B?SjJwVGE4Y202aCt0S2tyRDJNb3JHVFJsNDJtU0xZZjQ2OXFLUXpuYmZBSGlU?=
 =?utf-8?Q?cqcGErMSOe8ylDnofxgakZ4BVk1ZO9ATjEP/e2Y?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5e1282-642f-4cb6-da4a-08d8e23b26d3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:04:55.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LR1PDmothlENGAfwbvHkmCI01+QP4XY1EseXhZfAkTw21OuGFJF/PBKDiwN8tR89spI7NbmhNhabfWRypYgmXZJiwpghjKeEF6+5LYar3Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
Content-Type: multipart/alternative;
 boundary="------------AA869C06B66737D9DDC7AF42"
Content-Language: en-US

--------------AA869C06B66737D9DDC7AF42
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-05 11:02 a.m., Andrei Gherzan wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pysonos_0.0.40.bb              | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
> new file mode 100644
> index 000000000..dbfa0dff5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "A SoCo fork with fixes for Home Assistant "
> +HOMEPAGE = "https://pypi.org/project/pysonos/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea"
> +
> +SRC_URI[sha256sum] = "3fed94dffbca5807d39d000d1415fe8d7dfc1032ba92a33d0b577eb2e98a81f3"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "\
> +       ${PYTHON_PN}-ifaddr \
> +       ${PYTHON_PN}-requests \
> +       ${PYTHON_PN}-xmltodict \
> +       "
> --
> 2.30.1
>
>
> 
>

--------------AA869C06B66737D9DDC7AF42
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-05 11:02 a.m., Andrei
      Gherzan wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210305160256.3333334-2-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

From: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@huawei.com">&lt;andrei.gherzan@huawei.com&gt;</a>

Signed-off-by: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@huawei.com">&lt;andrei.gherzan@huawei.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210305160256.3333334-2-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pysonos_0.0.40.bb              | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb

diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
new file mode 100644
index 000000000..dbfa0dff5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = &quot;A SoCo fork with fixes for Home Assistant &quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/pysonos/">&quot;https://pypi.org/project/pysonos/&quot;</a>
+SECTION = &quot;devel/python&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea">&quot;file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea&quot;</a>
+
+SRC_URI[sha256sum] = &quot;3fed94dffbca5807d39d000d1415fe8d7dfc1032ba92a33d0b577eb2e98a81f3&quot;
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += &quot;\
+       ${PYTHON_PN}-ifaddr \
+       ${PYTHON_PN}-requests \
+       ${PYTHON_PN}-xmltodict \
+       &quot;
--
2.30.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------AA869C06B66737D9DDC7AF42--
