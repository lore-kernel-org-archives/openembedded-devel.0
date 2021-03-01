Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.73])
 by mx.groups.io with SMTP id smtpd.web12.1048.1614620957581500375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:49:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=qPfR3Le4;
 spf=pass (domain: windriver.com, ip: 40.107.244.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVRAoPDDGVdHffW+oP1SXzMD/xb9b8N0B/uFLEYVy75fn9dEHOa3qLv786OqCnNnXxvofEyZV6RUil5TG2oN5Y26DLGuiQRBwzi3/Bv4+sRl/Y5Tows48Zda2rqLbpkqfd7mwgwfdo14CwB/7xe3v5btGTMWoi9wSlAI5U0sE2BJIfact3xNj8Jid/qbm5UxxZ8i7X2cVBv3fRPAsUezL69JUzwd0Moc62d/UoiTWLsITH0VPELN6k2UyMlRRAng1xgoN/lMbtuNeW79wYCM1D9UYppktCq8m1cu9sQN2cZJMBlr7n3Ixz23VRy7HAtCXMoaiRtGTcQxvDnTC5UIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bs6+Vg/sBb9SNySeHjMi8aSEsSRDLCocb0eyrJ1jtw8=;
 b=iaoss99Z0xAEYRgL/xp3dtxJl1o1Zsxgd1CVz6/1VkBO1ChkPbQOCtUj52CeK3KrpqUNkeQtaUwuRX37MNUeqQzutE9TLu+mzccHDROswX9i37uFloqXqLNf2QvyVnLK+r3lWOrHufxMowzM2Uj9hWnr6e+wxn/GXh0AvG7zjzyE5xktQqBXEOm16Gddfn9SyUZWQB7RJ6WoU3eN6EiHvhPE2dyeSIMT2a/9NuwTTRiTH9/TIkoDKRhs2nICtrv3emw1wuVkOHkpFHkd/q9lheectgYOWCki31iHNtE+0s2m5mtswLpveFOMEbfGP51jl95uoIOf3wKpO5uCCTeM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bs6+Vg/sBb9SNySeHjMi8aSEsSRDLCocb0eyrJ1jtw8=;
 b=qPfR3Le4ow5OCl7ydhrMRP2XIo7VH74AhuQuFj0T9WmUb+Gdc5uhmzXrWHVUxdNzfOIkUeaaLP8XCObauXfsstXhRRDwyhdqorRoE9VUpNmxykt8OcOq8/VXmf1HAwQO7RE0OJHw6xCkFy5APAUcC308bNS97d9iZhf51ipY1R8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 17:49:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:49:16 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-pytest-runner: Upgrade 5.2 -> 5.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210224112512.31406-1-leon.anavi@konsulko.com>
 <20210224112512.31406-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <29373c6c-572b-7023-a1ba-5d6a97525dd6@windriver.com>
Date: Mon, 1 Mar 2021 12:49:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210224112512.31406-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR15CA0049.namprd15.prod.outlook.com
 (2603:10b6:208:237::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR15CA0049.namprd15.prod.outlook.com (2603:10b6:208:237::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 17:49:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06a2538d-f57c-42e0-4fad-08d8dcda5526
X-MS-TrafficTypeDiagnostic: BYAPR11MB3765:
X-MS-Exchange-MinimumUrlDomainAge: openembedded.org#6614
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB376558CD614E5DF81BBCC80A9F9A9@BYAPR11MB3765.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4NQmrpJ1vVNH3mbU2EndoYQVxcSrqIwpAhEF+Pia9Wze19KtizA+ojml+biahqUuUDai+2J3VhmDY0uDyV5Qgq4oxU1EHLFzA3NW0ldBAMNzW9njictGw5Zl2KcNb9l9zD1G2DjLj0NurwgfjggNCmYlcSdE+A1xni8IBkU2TtYqX2psTp4thNGMshocvpw0orBgTd/Gw6XlUO4jS2Hv4xFNAnMs6u05VcjRLKRZi8o78YmYJU9a3ecBVHnckTw/p4sRKoqhGkSVv+1urlANJklrgc1z44kvlxt50ODLdRF4IPL1SmrTUVWUFhilj30Ul8FJ5f+LrITd9RYJVOLOZQDTzji6l8+eKAD32bUKirrxYEonY6T8sBUdbxHzZ8IM4N7G9YLLErwRUTWj3kvupYGGAEBT8b1554BAJ9EW4aLlt04rkin8IYnMokqX4/45NLUXXLbY4raJdbZesqfIMhAWGzrlQ8uUoNgozIDVa3P5YTh8nsBwAdNIc2VQC5/0k/rN7dAtuaHJ0VlVdHRFT3ueQR3HtmKYcff3I7WCz31sKUJtEQQg/DjVvNO7TPrBcSATSl/CEZXhs9fIPtn4YfGnh8KPfNL236a+eiAbOqAbGY9t2w+/pJEDxv+cyypIqseev7Zd4Zo/vBocPi02rzPa47ezHpkoj8KtuBCl18p3NgHb1t2Vz6y4Geyg7mk2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(956004)(31686004)(26005)(186003)(66946007)(44832011)(36756003)(2616005)(86362001)(6486002)(2906002)(16526019)(478600001)(966005)(31696002)(66556008)(16576012)(5660300002)(316002)(83380400001)(66476007)(53546011)(8676002)(166002)(33964004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b1hDN0lzeGlKZ05sbkJtL0k4ZUk4ZXZCQXVRVUFSeTlEalU0QjVBN1dLdDlo?=
 =?utf-8?B?WFdYUXR4Y1N1VEZ5WWUyaW1hMG9ackJBUkw2UmhiQVRlK1h3VXY1eGZ0b2p0?=
 =?utf-8?B?WkFzQWpkWUloZ1BqbnMyRUYwK1FHWUdnTHZoa0ZxdTJwTFhsUndEWTdqNlRT?=
 =?utf-8?B?d3Jhc2hlcjNoSWRkK0psc05lcTE4VE9kZ1J3RE1oblYrb2h0Q3lBNmVuVFFF?=
 =?utf-8?B?dERES3Z2dTQrRW9EeHZFZDB5Sjg4cm9SVFhLSTBtZ2xsWkZXMm1JTEFwS0gx?=
 =?utf-8?B?YkNWOEN0TUljcXIzYUNVU3JSc0Q4SkVlSGdJRGQ2eDM5eC9PSXcyVzlkTHNz?=
 =?utf-8?B?clpMTDI5b29OSURxU01NWTMrLzNGVHpPNFp4amQ3Zk1sRWZHUDRrOFJjZHJo?=
 =?utf-8?B?S3NmWmJ4NFhjekR3L1YzTkRGWE51Y0Y2NG12VDU4NUNRK0c5Zlg4cjAvNDBa?=
 =?utf-8?B?V2wrQ1BERVRYMW9QeW9xNnRBOGVkNG9aUFV2aEtndk0xUW1VeWdERWRXUi83?=
 =?utf-8?B?Qk9UTU5UZjZ4ajc1K3plUFViQzk3OUF0ZGdEc0Z2MVAxc21UL3h6REV6NU1S?=
 =?utf-8?B?RytBdlNVUThrZHFoNG9yejZUTTZ3MHNWbjNqOUU4dTZWbld4SzdBMWErMks1?=
 =?utf-8?B?UGFRZzFKTTg0MkQvU1QwNXJxN2FjanR1YW9ncFZpdlZSTHRjYjNsUDZwU3RY?=
 =?utf-8?B?c0FkNUEwVkRmZU1uajVOdldiK1lST1NaS2JaaUJ0YUZQR0hpT1JHeHZncTFy?=
 =?utf-8?B?bXF4aTNwU0lENVkyTjVkMjA0bjUwN2sySHY3WjZRVkh1bW9URmJyOFZwWURB?=
 =?utf-8?B?cm95U3p0c3k5c2NMajNWVkp3WkdtMUsrYTJUMjRxR3JPWEkwWEI4clVSN3Ux?=
 =?utf-8?B?YzNXRWNUMkZiS3R1MGNicWxwS2s3eHlCb3A1MDZCcmVMR3lIMThWb3RYVGxl?=
 =?utf-8?B?MDNxL2RTd0Y4TEx0RmloWms5Y1gyQ1oxanZUcmc1TWFiUzdHMW9nQ2ZRUGNB?=
 =?utf-8?B?M096VEx0cHA3U2IrVHdmNU5lZk5neXBUeE5veEE2UE5wVXk1TWlFMzNlN24r?=
 =?utf-8?B?RXdzbkFnekIrVklyd3FIcTViNzFIdjJxVVdGbStjdmdJTmNlZDBDQUdSajAx?=
 =?utf-8?B?eUVXZUdUVkVZS0EyS1VDSDFETXJiM0F2N1ZWbUh0dm1nMm1IeDBtWFdHU2Yz?=
 =?utf-8?B?bWk5NHljdXlHZEFLLzVDc0ZGdklIK3FvSnpMSDJsTlI5U0htR0RKUFRUcmZC?=
 =?utf-8?B?MDdEUmV4NXVOcTlEM1QxTmpuZG9tZ3BKa0ZCUk9PK2NXcXJBU2tUVWp0UFBx?=
 =?utf-8?B?V2xRRFRlMXIrSDRVWUw3L1BKZ09qZG1LcVBnR0IwVUw3VTJOSzZRbm1HVS9u?=
 =?utf-8?B?ZTAreXFvUTIzam5wYUF3cUZRVWFOR3pHalR4djFabzlmTWxsMUYxQUJsRjdT?=
 =?utf-8?B?akg4Z3ltWmVKSVFrMzFzaU42cms1Mml4ci9FYW5yOEU4Y0dkVkY3YVFRaExQ?=
 =?utf-8?B?ZnJiZTc3bnBJeTRkdysxVDAxN1lQc1padnJlTVNCaTJIbW91ZVowWm5ycDBk?=
 =?utf-8?B?WGNjS1ZLRitNdW9uc2ZwcEdXb2xrRks1RnJsMXZhaytnYXc5QVo3WnV1RXlB?=
 =?utf-8?B?cFNGa2gwbHNGMzFMM2dTZTJkcmdadWV0a21SZkVzQ0E4ZlVndC91eEx6YTEz?=
 =?utf-8?B?dkFZckhGUkoxKzdYVHZFYTBtZWxVUW9vSGM0ZVpUamJxWlpoelZqbjlVbzNa?=
 =?utf-8?Q?sA9R3p01O7Rvrv/iyQ9hetPWkOhz/+N9N8uDu4j?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a2538d-f57c-42e0-4fad-08d8dcda5526
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:49:16.4529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2sfplfQYftCU+/6MZODJwe7hNmjJms2FrNa04d9kGgxfFR4kDmSdfEOP6AEAQM0Bj1hAkioyJ+gfM9JhCIDV2nvwzPMLRL+yx+Puk2+Nsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
Content-Type: multipart/alternative;
 boundary="------------DC61818B2BADC957AB0E688A"
Content-Language: en-US

--------------DC61818B2BADC957AB0E688A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-24 6:25 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 5.3.0:
>
> - Require Python 3.6 or later
> - Refreshed package metadata
>
> License-Update: License remains MIT
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...3-pytest-runner_5.2.bb => python3-pytest-runner_5.3.0.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest-runner_5.2.bb => python3-pytest-runner_5.3.0.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb
> rename to meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb
> index d00cd48739..35f6c6c0a0 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb
> @@ -1,9 +1,8 @@
>   SUMMARY = "Invoke py.test as distutils command with dependency resolution"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
>
> -SRC_URI[md5sum] = "e5f66b8e8e87f62c59631c35c919d321"
> -SRC_URI[sha256sum] = "96c7e73ead7b93e388c5d614770d2bae6526efd997757d3543fe17b557a0942b"
> +SRC_URI[sha256sum] = "ca3f58ff4957e8be6c54c55d575b235725cbbcf4dc0d5091c29c6444cfc8a5fe"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------DC61818B2BADC957AB0E688A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-24 6:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210224112512.31406-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 5.3.0:

- Require Python 3.6 or later
- Refreshed package metadata

License-Update: License remains MIT

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210224112512.31406-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...3-pytest-runner_5.2.bb =&gt; python3-pytest-runner_5.3.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-runner_5.2.bb =&gt; python3-pytest-runner_5.3.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb
index d00cd48739..35f6c6c0a0 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb
@@ -1,9 +1,8 @@
 SUMMARY = &quot;Invoke py.test as distutils command with dependency resolution&quot;
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e">&quot;file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6">&quot;file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6&quot;</a>

-SRC_URI[md5sum] = &quot;e5f66b8e8e87f62c59631c35c919d321&quot;
-SRC_URI[sha256sum] = &quot;96c7e73ead7b93e388c5d614770d2bae6526efd997757d3543fe17b557a0942b&quot;
+SRC_URI[sha256sum] = &quot;ca3f58ff4957e8be6c54c55d575b235725cbbcf4dc0d5091c29c6444cfc8a5fe&quot;

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

--------------DC61818B2BADC957AB0E688A--
