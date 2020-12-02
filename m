Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.82])
 by mx.groups.io with SMTP id smtpd.web12.5274.1606918212458115919
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=f0jnxmIP;
 spf=pass (domain: windriver.com, ip: 40.107.102.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSKYE8f5Yo3nUQdmtuq3D1tGEu6edKh+z2uejjjr2D3WVjppvDIAOdwUtIfMof0gTK7UjwukQKru1lS8b1crg85dxD/RKMb8exb7MRjE43xkWtDuxcf7NamqqXjhSgTMKsq6izkJt6Qu7rkNF1vLEt0QswCqXztEWOWyHVFPPSVcV/AbmgcgR8vvnnFw8Yhwl5t6hheS2BLERDXo84mvAWBfoEx7wEQFlZ8BaZH0KwjHsG5eRbS2+Qd7KJWbvTPykJ0kLIJnhAse4JVxzSI3mOZe7Xianc1E86kjCeNQ/6rSgymnAD0qcBLmLa1PuDdEOxL0nNdYUqbQYhGJLFwY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5v/JYnMU3swHorUkpG/ZLyUHA911tFi5VWl5X+0u76o=;
 b=IAwWIUEkK1qB1sfujRE82Ef4sXPLSqtvRaifAEaW6IrXcFWczyInxikk/ItWPVaqpT/9aQB48ostCCzxgbAhX4zH7sBfeNyM+SvqV0v37LXCynlKQUUSE2KjVS9lYo26VW+cDZ7F6qbtWyFdoc9KGTfuNcax5dnqaHoMJw/fz862VtVEsIGSvYY/osADkMlgFXgJgqbI/sK8gSimfRsI5II/CR7A3gn6o5rdjL1V1kzuQDYKMZLRtrbE2sXSOtfNnKnI+i2pdXDlez6QTm8Ung1nvss01ibisSbQKP4bpQxEjm9z1q6L7e3xkkltTAAA9uGTmTA4izxaNWDCtpUPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5v/JYnMU3swHorUkpG/ZLyUHA911tFi5VWl5X+0u76o=;
 b=f0jnxmIPyQrDjBGKstPGtW7fBAtFyLWDQjIdP3hQ66SYDZmUt+vkBCBiX+LMVm6BbJveEfrDA3HUSdEudeEKV4AN8NIjeQDGwkz3W9zVjV0IXsQgG0YkOKzPCkZGnxVBKYX3x0a8AWgXagpg4dOcW2JMKsUoHT2HAIT3yP1pjpE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:10:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:10:11 +0000
Subject: Re: [oe] [meta-python][PATCH 07/16] python3-py: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <553e11713313ab89d8533562ceaefe613119baf3.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <87584629-1d39-ba1d-f369-a4f93fc07831@windriver.com>
Date: Wed, 2 Dec 2020 09:10:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <553e11713313ab89d8533562ceaefe613119baf3.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:10:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70cdae76-8277-4c4a-f4f1-08d896cbfb42
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4864B66CCC5F3F3B102B32CA9FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FqGEQ4y9rEeWUSLNLhU0nRN9ms3p9S3DQ/ADMEa2+FbHthY9SxY6xIozHO/acnM0l89Mk5nnIpCXCnvweQ8y/Iz3gx6v9uOL7C/zRuMWlvPrv3uQyzHi/Z+g8vd0txaRl46JpAlbiUgja/dXajXB7XxzHHdLpCt5EkPtaVzR51NuDPONmM6hMyAVpBMxrcYR++A08mWuJtA7g8gDD1v5PWyXkajPhk85eQrqGz5AHcQsdviaY0xq6v4z5DwHKbL6x/BObBsqOuI3KXFVBZYNY/K1mz1KIbEe3SIggTTDFA0a0Ba7umDPp8HAofvNdYnvOq1xnBMmBCR68PDa0Jb1HDQlqnS6fw0OAxFbeWtIo3O9scL3CiqONI2TN7oPKG5xyOhpdubCWVaOuxwHyro6WPd1BbnSg3+Xj8zpSY+pfy+ofhS8iSsBrvw1y66Q/X4a+SpibzbpIYRWpClznyuOKMhH/Z+nfBW2tvOPF1PbcDk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MnhVT3Fjd2xoNnJEWUU0RlhVZko0WVdSUWRrU1V4a21ST044ZXZDbXhQMmtP?=
 =?utf-8?B?bGRYSHppMzY3bUtEQU1uL1JRdUhPMmJTc1A2dDNwRG1UNTZxUWM0Z2NtMkpQ?=
 =?utf-8?B?NUFreVhaOUdySHpjcTlubmYrdXpndDJIVFh6ZFlpRTZubndpTTQ5OE9wN0Nx?=
 =?utf-8?B?dVRLNTdaQksveFhkVUhPMXlUdXFxUXVFQzdVQzlwSTAwbWNpWWg0NEkwNjRO?=
 =?utf-8?B?QjJkWWFvQ0JhaXgrTjh3bFhVb2pCUS90blZndlpzWnl0MVNFcmdCU1gzSnJj?=
 =?utf-8?B?eUM2S0dVREdlTnNQYmk2MU5KWDkvcmFXaFUxS25XcTlMcTNNL0hWUmpMOURr?=
 =?utf-8?B?WUVKWHFEYTRreUdrQzJ1RVJtSGdyWTgwRUhOOVNpNkdrSCtpNVlubWYxWWlk?=
 =?utf-8?B?OXd1bmVCT1BORE0wYXdiTUJST1YySGNWMXJGbzg2R2c5aXdiZEdxUDJCR0ow?=
 =?utf-8?B?dnJ5QUtNRHNDU1hhWWRQVFZKdmhOcjhlcGUzZ1Z1U0RMOTlia3U0cDdtb3VL?=
 =?utf-8?B?bG9XUE80RkdwTG9OM295YUNrWlRGYlJiWUFJSnZ1eUlNcXh3TXRrWmRHeXRs?=
 =?utf-8?B?aUFZT1g0bUhyNTZVblJDS1FxaE5nR0NLZnMxaFBOZlQ1V3JvNDRVNDJ2c3M1?=
 =?utf-8?B?anhFR2NhQXJiRERpam5oVVVJa25ybE5BR3dUOGc5dE1Da0FuWGtnTDViSDBy?=
 =?utf-8?B?eUhWeTVFMFNTRVpVYkU0WkFQQUI2T0MvY0RwQ3NGV2FseDFLUjBlc2FMWW9B?=
 =?utf-8?B?OFlqWFdoNzJHQTF3Y09OK3l5dTg4MUdNbDRXV1dhWmd4cmVlREMzUVRlcndE?=
 =?utf-8?B?ZWk4MXJ1b29ReHI4eENPYkVHR2xFZlYwN29Wby94Nmk0YnVmVlNOcjBIaDd2?=
 =?utf-8?B?QnhIb1hxM2YyanBwWDBjVmVsbUdzV3JRVEF2ZGtyb2l5MVdINHQycThSc09p?=
 =?utf-8?B?MEVDdHIrMXFyeFpGYmlERTViRk5RTG95LzJMS2tGeGp3YU1Tei9UUkZ2ak5y?=
 =?utf-8?B?azNhN3NhWlRhelRrdFVVS2tqS3RnbnU3TTBoVUtvVDJSRkxranRuSFNrSWMx?=
 =?utf-8?B?SEJ3WG92UmEvdGNINGc4a2V5b3Q3S2t4YXdoNm1veWlVYy95OEl4U2lydmlK?=
 =?utf-8?B?eWxhSkdEWUZXbmtoRU1EcVRoWHdVY2w2TUtTTFlHdUNDc1pIanhIMWhEOXFX?=
 =?utf-8?B?ZXVVNk5BQU9RckJWMGN3NWdnalJ2cDZ6bW1XS2Mxek9PRzZHQ2lpWHd2ZFpJ?=
 =?utf-8?B?OEpMWEYvUExieVFrYVJwOTFma2ZKT0dobXgwdFdYRnUwVVlrOEExTWdpVis0?=
 =?utf-8?Q?LxYV7H+o7Apca9yhvV/1U3ezmPHeglCs89?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70cdae76-8277-4c4a-f4f1-08d896cbfb42
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:10:11.3390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr+hKk5IJ1FjOlnGmi8s/Ei2lnkuL8gzwUmC7GXehZdzmdbvMpbg2hQuuGmQb4eUzDYezLqVF8uVAD9eye1Xq8IBoXNG2sPVgnVfgkzPubY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------237C8C2CC45D56B0E0A46B9E"
Content-Language: en-US

--------------237C8C2CC45D56B0E0A46B9E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-py_1.9.0.bb   | 15 ---------------
>   1 file changed, 15 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-py_1.9.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-py_1.9.0.bb b/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
> deleted file mode 100644
> index 794ec2a87e..0000000000
> --- a/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities"
> -HOMEPAGE = "http://py.readthedocs.io/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
> -
> -SRC_URI[md5sum] = "b80db4e61eef724f49feb4d20b649e62"
> -SRC_URI[sha256sum] = "9ca6883ce56b4e8da7e79ac18787889fa5206c79dcc67fb065376cd2fe03f342"
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-netclient"
> --
> 2.25.0
>
>
> 
>

--------------237C8C2CC45D56B0E0A46B9E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:553e11713313ab89d8533562ceaefe613119baf3.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:553e11713313ab89d8533562ceaefe613119baf3.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-py_1.9.0.bb   | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-py_1.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-py_1.9.0.bb b/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
deleted file mode 100644
index 794ec2a87e..0000000000
--- a/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = &quot;Library with cross-python path, ini-parsing, io, code, log facilities&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://py.readthedocs.io/">&quot;http://py.readthedocs.io/&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9">&quot;file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9&quot;</a>
-
-SRC_URI[md5sum] = &quot;b80db4e61eef724f49feb4d20b649e62&quot;
-SRC_URI[sha256sum] = &quot;9ca6883ce56b4e8da7e79ac18787889fa5206c79dcc67fb065376cd2fe03f342&quot;
-
-DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
-
-RDEPENDS_${PN} += &quot;${PYTHON_PN}-netclient&quot;
--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------237C8C2CC45D56B0E0A46B9E--
