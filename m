Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.64])
 by mx.groups.io with SMTP id smtpd.web12.219.1615993210663168305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 08:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M2UGH5aN;
 spf=pass (domain: windriver.com, ip: 40.107.94.64, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n82+rHcalMc2IJNV+1Krl3sVj9kFLG3XUIJ/AqBJNuPRya89t3ftSrgReVeivDdrLvVTwDiO/A37QcAXmgxBSzlTNJAd/iqXFWjKHLs8m9KzDEvMMmwx+8/spZvrZ3yajtZBECHzMnRTqKu+gwv8QcrDZXdUpNdq5GId/iuzo/5yMmJkBVvaETDHy27nC7SRhcdU4v6cqZKElEAkDmlTwIQE6k9+5w/svrJnYk/J/5cgi2/plytSmDIGY9NU7HiwnRt2wp7/s9UlgGZ+LMoWMKS4qX/ob+fXn5jRDErGBXRrwoQkE7R7Bc1IofM9MFNeslGQ0dhzVxyopwPngRz9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02aSC0N4bal36O/lx693qCNaU6LHYomoyXhGoEqNR3E=;
 b=Xbpd+ciLBk6jaYCNK48PC3SVedzjNQXrbR0fsupi7YyqzBCSPDJmDw2QtBhNL0ry8IfCS2wK1uKz72A3sVj9Eg2nPClubF26y0fyC4QfkG2lBmGvzqXB6AXDaig4Dw4gGcQLx+D0P9SrgQKOazHU/yBQSJQKTlR8WlOK4890hG4RYNXVoydQ+yp55e4gu8+ePLEdrjN9X6JZfBg2mKkmfuEXn4bV69SL2bmE8bT1LpFTevbNS27i9F1iKX65HJhs86Nc3ovnhzjVl65cKr/H0TpN4LLz3RImIPl8jx3RFOHFb3aTXiATs1MVD3FvM6jwUk6WunkxJ1Ev2bSkTLJbPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02aSC0N4bal36O/lx693qCNaU6LHYomoyXhGoEqNR3E=;
 b=M2UGH5aN2ZiB2C5EOcuPwN/LuIiRFqaNaFDOcKBGetCSq0iocH1htA6c6J7lZll/0CCvNi4WAZOdUc1BwLjntij7QoY/J3OUQXEtKlMF3anM6Ua0cv3NQMOlTmIE7EXFRewMYBN0F+bf5nywTDI3Im3WLqsPbRNhzOR5ultTbhs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5005.namprd11.prod.outlook.com (2603:10b6:a03:2d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 15:00:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 15:00:09 +0000
Subject: Re: [oe] [meta-python][PATCH 2/6] python3-configparser: Upgrade 5.0.1 -> 5.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210316083744.17558-1-leon.anavi@konsulko.com>
 <20210316083744.17558-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ab414001-e89a-fa2c-3129-d6d4ed7ea860@windriver.com>
Date: Wed, 17 Mar 2021 11:00:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210316083744.17558-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN1PR14CA0007.namprd14.prod.outlook.com
 (2603:10b6:408:e3::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN1PR14CA0007.namprd14.prod.outlook.com (2603:10b6:408:e3::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 15:00:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2829ad5-3bf3-487c-2350-08d8e9555bbe
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5005:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50059A17144CBAEF15F3A0669F6A9@SJ0PR11MB5005.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EnBcKVeVdqqWdfBQ4berDYFSsjZ9AKw1vP2TpWr1kBKs1BUxbjb9Fh+3r5k+XJOTEk6zo2SJlUqSSXgAUhDXLGWoXFZqabQMhUoMhIY1ccPKRk/Ich/kWFKqUSjXhFkGpw/eOhh69X+3EnR4LPcjYJbdMpTqfZa7L8ROli1yfaEFX4mKnaSdO4D3J9zwC3iOgb4CJwVuzLSzlWlmINiY3UtTSksPR0/wFC5xuoiNG5h/wE6YSMaRAzgewdNAyud4V1btsS0OSlP0klpt5EGdhDMYfkxlu7FdLlzqevyey+dKSlXL1x6B98qGTsbj6dbMphGPdIWDo67or3h6QzDUDY0ocrmXVtwPAtcWFhld2WhKUIf9HJtni4aHTTDCwTUz/wBkX+FMIFjBbRTVo5LUR5QzI8frDmdDP1RsIkTKp+KSTyFm2S7+dxYPC+NC6l42v7Q8d6YHTM/MqyMRXQzzTQGbJPNjOfqmjaCIIV/suwiBRAGn9LMIltM3HWFgH2OrXLot1mWoQ12RHCoMTWGkrAf4FfBQfDvlwq2uMCv2LemNKWdHrrM5YaV454GCDvpAHu5OYxjRpfTrI5vV8aL6JC1tQB9Jat+Y0kyWLkpo24SjgremGxPIWMJI2uz/Ha9JbkWyf4BNy5K2CtsaxGSu1or/1VNtbDkOGuU1wVddUofBiVKaTwgVTPzoCcwkc320yc2E/xIV90lWTNX/0o8AHoR0PNonUYxHKe2mcwaJxpzkDdE6RHXdKblwhfG3vfKt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(136003)(376002)(396003)(346002)(66556008)(2616005)(36756003)(66476007)(66946007)(31686004)(33964004)(6486002)(8936002)(186003)(26005)(83380400001)(316002)(16526019)(2906002)(8676002)(166002)(5660300002)(31696002)(956004)(86362001)(478600001)(966005)(44832011)(53546011)(16576012)(45980500001)(43740500002)(148694004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cXM5UDgvQldEOHpLV0R0ZkdlMWhwV0UrV2hRSmVUeHlRWFkvaFgwcXhIU2ps?=
 =?utf-8?B?dTRvYjk3VlVBODVOSzZnbW0yY0VSeXBGTzNPdElLMDlLSDBwWU5QcExPNSsz?=
 =?utf-8?B?WHpIVExwRlpHaVdGUFVkczFacFl1NU5DOFpsVisyV2tHWmtpNEE0cnZEOGd1?=
 =?utf-8?B?YzRVcy96YlZNQnBTU1o2WmhQZFdwNjF6R0ozQWtRbjdSdDRvclgzMzYycmdm?=
 =?utf-8?B?c25OMXd3a1JoQzBhVDl5aEN4MXc4aEVybk5Fb2dITDJvU0NDMGRTK1NKUkVa?=
 =?utf-8?B?MTVUKzExL2NXWWhIV1htUXFLWWpsYVRPTk4vTEtXelk0LzgzaVMvRjl2c0Rs?=
 =?utf-8?B?bmpNL1psS24wc3piL0JTT2YwVWFhSzFLVmNsdFpOMG9jUGM1bldmaVFTZjMv?=
 =?utf-8?B?MFdSayt1TW9NWkt6YzVITlNZY09WZW9qQnU0SlM0WFVVRzhJRkY0MlFaZGM3?=
 =?utf-8?B?NzVqVm9pbmZXbFJPU0loZzFvblhseDRCQXE1Mk5CRWpUK2dtMHdMK3RxQU9h?=
 =?utf-8?B?Yng2L2EyYVR2d2dXMCtVZWxGc1NpaXEvMWdDbE5hRG9BdnRVOGNxaFdGWWJ5?=
 =?utf-8?B?b1VFVC9vZFEyMDl3NC9wOGNVL0piMU1tdEZEQUx6ZldKSUZMbDNLQ0JSLzZp?=
 =?utf-8?B?bzljZThRSG4xTzlFSThycGRFYmRNNVNKTUQ0NS9zM1ZNVENmT2ZyMlpCSFZ2?=
 =?utf-8?B?OUVRY0JVWHFTT1JpWm9kVFlzekhNZWhWOTErMUdkOHR2YytvL2FwamtWeDBs?=
 =?utf-8?B?NUl3UTk0U3hKK2ZkeUpjWmh1d3ZSVzN1TzhNMVNEZDlWbmgyUUROZ05MRkxt?=
 =?utf-8?B?R25TME1XZjRLWS94RDdNMlVtcjZ6cGxIZy9lZElHK280VGlyVUNqMjRrMHlp?=
 =?utf-8?B?TzVsYWl0dk9LamphSFpsd3VSc0g3WWNQN01PREw4SlNtc2htdWpIVWhLdURu?=
 =?utf-8?B?TWZXcVE3OVViU001Y2JRU213MXpUUXE0ZlNaOTZJeU01MHY3RjBUV21BUldw?=
 =?utf-8?B?M2w0eDVtbC9KVE5jaHkvejdGYi8xdEptYkU4cEZMcW1YMGc4Z25vMklWdCtR?=
 =?utf-8?B?SXlvQjhWSDZXVUJ4UGtCWW9aa0hKcnRQOEF6Z3pYMmZnRVZZQmYvVm0xbk1I?=
 =?utf-8?B?QjVqcENLQjFoTndFV0J1OUxuNDRTQmR1U3R5bERnU2d5SkU3ZHQrMGJKc0pz?=
 =?utf-8?B?V3JaK1E0L3RuRG4xdXlzLzZmUjNCYUtaWjBmQnRocWF1NXYrWVYyUml0eTdo?=
 =?utf-8?B?WFVtNW5VeDh6alVod1FSbDJ2T3N2UzZGS1o0TTJXVk96Z0dTbmZiT3BDaHhH?=
 =?utf-8?B?K2dYemg0dzU2UzJQb0ZQRTByMnVvaGNFVnphY0pjN3QzMmVqREJwbVRLc1h4?=
 =?utf-8?B?TWVsOElsMlhUZ0o2Sk9wZDd0MzEzWjhjaGQxS2hIaGlNUUNzdHZxSy9nclA3?=
 =?utf-8?B?ZCsxcS96UFVlajh3ZndvZFFDbWNUYmlKRU5hMmdMdGdvUDNseDloMThBaTln?=
 =?utf-8?B?YnJCU1dhak1PWEVtSlhUUmRyQlJLVndTdmtkZ0dEcWJRR01xTjR6SXJSTFhX?=
 =?utf-8?B?dUpHTDF4UUpRTVFwOU9GNnQ4M0p5ZDhYNmdJbjlNYlVubysxckdjWlp4YmpQ?=
 =?utf-8?B?bUQxNWFvSUVFcFkxbkNMcVJHdDV4K3dDY3Vza2NTOGxndm5MTGpVZ2R6aXF5?=
 =?utf-8?B?LzZhUldtMTlLY2ZLV3JBMWlkQ0d5OGJwMk9VOVdaYTN6aERhUnpSVXd0VnM5?=
 =?utf-8?Q?gdi7mODn2fwVCoEERgMmmsIvM5c6rGTdMjwnLQ/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2829ad5-3bf3-487c-2350-08d8e9555bbe
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 15:00:09.4943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBaLSnLPPSlkYpH2cISkjWwr5tQjPwX85s/7HTEXjbRZxuojjzi7C+BHW8wbOvBkE6KCDUGJmQX56Xj+uBWfBWY+zkbe70U0HTN02/8vNiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5005
Content-Type: multipart/alternative;
 boundary="------------8DFA9BECF670752119DB8DD9"
Content-Language: en-US

--------------8DFA9BECF670752119DB8DD9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-16 4:37 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 5.0.2:
>
> - Packaging refresh
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...on3-configparser_5.0.1.bb => python3-configparser_5.0.2.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-configparser_5.0.1.bb => python3-configparser_5.0.2.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb b/meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb
> index b78de5844..87cdd09f7 100644
> --- a/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb
> @@ -5,8 +5,7 @@ LICENSE = "MIT"
>
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
>
> -SRC_URI[md5sum] = "5faf185693cd21d83f6a3bc01b5733fa"
> -SRC_URI[sha256sum] = "005c3b102c96f4be9b8f40dafbd4997db003d07d1caa19f37808be8031475f2a"
> +SRC_URI[sha256sum] = "85d5de102cfe6d14a5172676f09d19c465ce63d6019cf0a4ef13385fc535e828"
>
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
>   inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>

--------------8DFA9BECF670752119DB8DD9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-16 4:37 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210316083744.17558-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 5.0.2:

- Packaging refresh

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210316083744.17558-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...on3-configparser_5.0.1.bb =&gt; python3-configparser_5.0.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configparser_5.0.1.bb =&gt; python3-configparser_5.0.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb b/meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb
index b78de5844..87cdd09f7 100644
--- a/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb
@@ -5,8 +5,7 @@ LICENSE = &quot;MIT&quot;

 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa">&quot;file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa&quot;</a>

-SRC_URI[md5sum] = &quot;5faf185693cd21d83f6a3bc01b5733fa&quot;
-SRC_URI[sha256sum] = &quot;005c3b102c96f4be9b8f40dafbd4997db003d07d1caa19f37808be8031475f2a&quot;
+SRC_URI[sha256sum] = &quot;85d5de102cfe6d14a5172676f09d19c465ce63d6019cf0a4ef13385fc535e828&quot;

 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native&quot;
 inherit pypi setuptools3
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8DFA9BECF670752119DB8DD9--
