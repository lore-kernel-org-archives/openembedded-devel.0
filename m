Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.81])
 by mx.groups.io with SMTP id smtpd.web09.34906.1613999889035002552
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 05:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iHbhfnBJ;
 spf=pass (domain: windriver.com, ip: 40.107.68.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXncJ2QuvbJ41bGBzbOEoO4cfcNOejYm5zBri+JVSUAepidevHqclZs2sd83pc3asVp1bmFCtxmIBfm5JMd+JbhqETmo6g0whUi/9JnEFNQgoXOAtad1Ss7nkqS1BNAgHgppp1imqtPQThcrQrS80iKLfA6urJ04bJEn7MRr/PIdPcpFm7bP08qVUQbBtbGjs+EH64/A9mmQMQ6Oi7PgsV5cLWsbH6TXHymWDR2n3QS78bX9sJxMvP42cOtG7+8n+8Zre5r0v+f+/sJJCZWNFRi5P+QCNiA1Tz5Hz45IcjB6cl7mTW4nf+cn04zGzjRsjiaKKJS30a/E441S2N7h9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rw2aI89KDOzRFDFhwkc6e0+iq4Nz+NnS1omDV7a/p0I=;
 b=SCoov74ru8A05EgXI9+8MAv4PZ3ycqanf2U/KZbcjiR/eZrZdHZgcV8fbaDcbtVGRRLE3QzuigkdTIMGCvIYMFBBEcLPoG5Plbm2VA6Ks2OZaCDPBA3AmkvDC3lI+L+gk8XulLB+lhip+amKySMpPQ7W5IkpNbiKvg10R1i508+xnQnFEvWo2n8GfxeJhtGn2bddsNs7tW7dY/Wl5hF5X//HsVjdvWWkPrIlQgfPEaAVCwBBY1otkwtijp6AjTCMdI7AzyWmrXKVrpOsHpxknSfm2u8QFcsdM9c089clQd94sNPBvxyRHR0Py4kccoEBmR++R8Rfn2lym40UfCxEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rw2aI89KDOzRFDFhwkc6e0+iq4Nz+NnS1omDV7a/p0I=;
 b=iHbhfnBJ6suErqAvKzZvUNbngJkSSlXNMki6LkOjtlXNbgex/WX8KYiJdlI6Q5xrRpGkN0JVM3fG5FPK7qIcIkKsZe2htJAGan8TCjfy6JFsgQ6W0LHtaKwZgbGXV46kUjKnrn9zzqa53xmJXKe3dEItoUhp9lkUWZpTweY5Fkw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3975.namprd11.prod.outlook.com (2603:10b6:a03:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Mon, 22 Feb
 2021 13:18:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:18:05 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-typeguard: update to 2.11.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210219215346.2367571-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0057df9a-af41-441d-6c28-9b29547e418a@windriver.com>
Date: Mon, 22 Feb 2021 08:18:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210219215346.2367571-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0028.namprd16.prod.outlook.com
 (2603:10b6:208:134::41) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:208:134::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 13:18:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a392fdc-3619-4682-3094-08d8d73449b8
X-MS-TrafficTypeDiagnostic: BY5PR11MB3975:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB397541CE9660C02AEAD54AD39F819@BY5PR11MB3975.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zjXaBqncN2uIsmJ+cqQPYFal796fEcDVqon2DBi1v//7GzEblr4/3IEEUAI/LKxnpACRxeKTmxDoL435WSj6nnOvVZEBez1p+37S9BUDUjnGQDa4E8989AKlT0TrMNx23oO+70NCgd3kxAQSVSwM2VsSubI6IYMIStz6QBU6hILuWG+xg0t+Af4YNLGOhfBf2eW+hVKVgXx/wL1PJqF7V/bV/hFVApjZbljTqjcaQGubIhrhphuQYe9xoKlqLER5Sbhoi6efj4+e6geiRYM89sw3dWCDOAL5Tc1q/PJnlo5ImqEFBLeKL2qlv4LyVJ29sK7715wyHVgGl5Ld8c4r6KSFlsPj5cTkc3ZnRAS7y4L/Rskiw387x9jlQt6xwXdrzGfxFlHlR5m31PmeY8vqMgKyiyIS4HlKdxQa5IaMI3hsYnjUOqWiyf6+KZuZNevVvTZhInYJqyykPlFWQis/qE9/oJ9H0QR3URYTMjzWTIwHDIzq4b1ZKIpfe56/7DJGm/wHxZ7h9U+51ZFl0MCqM/cve8+9GMUgxBbK6beLerhw6lw1AD6y58Po39ySzdbxC55vhSCTeyh4BNzh3H2M1r3Ba+7g+nupJ/Y8Lmow9vJUFygC6hrP1rir+MvOhruIxngd+ZpMOo5UPnQZF+6D7MR7ofJE71wN0/NTGXgcAAlYr8Ga0RT24mPZYzbTI1uw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(376002)(136003)(396003)(2906002)(83380400001)(478600001)(53546011)(15650500001)(16526019)(956004)(66946007)(26005)(966005)(31686004)(66476007)(66556008)(186003)(33964004)(31696002)(6666004)(166002)(8676002)(44832011)(36756003)(2616005)(5660300002)(316002)(16576012)(86362001)(6486002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Nm55L1p1ODR3UGYyYkxHRXBiVFFZTGJFVW9UWlV0YVNTZVIzbCs1RVI4eHdy?=
 =?utf-8?B?azFTdW4xWEdrSXZTbkJ6SllyamVDK2toWjlDRzZhZEIvNmlmZ3lwdVdoaytj?=
 =?utf-8?B?YVR3cVE1Ty85cXcvVkxHV20zQmxHSEQrUGxKK2ZOWklUNzdYOEsrSjQ4V2VD?=
 =?utf-8?B?S2VBTFRibzBXUnhXQmxBaG5veTFkdmIzbXZLQWlDR2hYdWZmcG50eG04bUFh?=
 =?utf-8?B?OGVjVysxVUpibjJuZ0U2ZWdrME01TjFlZXdxaUcvazZJMFdnQjlCVSt4MVR3?=
 =?utf-8?B?OWMwbEtybnQ2QUw5dmhJUlRDT0dwdXhFM2hxWHhpdGhleC9ib2FHdEVYTEdR?=
 =?utf-8?B?b243ZjZBTWdZVnZsWUFoTk14a0tGZzFLK0xwejBzaDNUNVVEbUsvN2ZxRW1h?=
 =?utf-8?B?RjJuWGtmZ0JMT2x2cHg0ZXRFZlA1cnVUQUxMYXJtcGY3cXJ0QlEvV0pQd3Ew?=
 =?utf-8?B?eW9NaWlkT2ZJaTlsM2swVmtJaXdCTXlGdG9OSFgwa0hqS0xLbFp3bDZQeC96?=
 =?utf-8?B?MkY2Vk4vVU1GSWprY2Y2eU5zTEUzMXNnUW80SWo1R01lbjV5dzJHaUFGa04x?=
 =?utf-8?B?bEpTY0F5MXpMVGU2VFptTncrUVBhc3hFLzAzQ202NE92UTdnbzhtaWp1b1BW?=
 =?utf-8?B?by95MjBKUjRzQlpIZlFXMjJhbjViWWJZUXJzN3NzSVZGYmhRek1NTk1vSmhO?=
 =?utf-8?B?QzgwVk54Nk4zRzV4cnhZWjFZWU5OLzZOazdNbi9rU1k0WUtuWllHQ2huQUlt?=
 =?utf-8?B?N3dtODEwa1Q3TmpaeUN6d1hlbnNxbFlIZGZpb3hSOUdXVmxrRGtRMHljY1pv?=
 =?utf-8?B?dHE1Uzk3QTZET05wSVhHOWV2YUVodmFwSVhKbnoyTzNjYUw5RWVNbC9kQmVV?=
 =?utf-8?B?Q1FXU0RRamRUMFNGMWx3eld5UU9KOHgrUjFodWpmQk5jcnA4dG9RcG5ZMXJO?=
 =?utf-8?B?WHlRU0FjM3BZcjlZQ0xoZGJZNXE3dVg5cDlmZHpyRS9iU1pONmNDdDRqS3dS?=
 =?utf-8?B?Skg5aXIxSCtkamN1WU8wbC95UkF1QnFWWi9qZkQ3UHdYY21SV2pjUldPZ1B6?=
 =?utf-8?B?c2RQY3lna283dlhIUVFydmZiUTcxQTdsMWlEZHdEaTVJdWh5YWY2d0FVbkZy?=
 =?utf-8?B?eTkxMVBFRUxickFOb1dySmhvUUVyd0t6aDluN3k3VDRmaEcyc0FEYTdHR1dw?=
 =?utf-8?B?WmtIbHJ2d280ckEwN0FQTVo5aDZ2OGVISU1DVEdncjUxUk82ZG9KcGttQU5t?=
 =?utf-8?B?WGNqRGI3aXNlUGRqT3NmU1djcGNrYXlTRjRxVnVIR1dSTGpNQ3dXU203RzdP?=
 =?utf-8?B?ZzkrM0dmKzJzZ0thYUpna2RvV09KQkpCMVA5ZC8wQWNiSDc0T2J6QWFJdERj?=
 =?utf-8?B?T2VwNGRvYUJoTUZ0djhyY2JIYnUwZ3BZUTV6MEdoVndWSFhkMnBDV0JHRFRU?=
 =?utf-8?B?SEFXM1pmZHJzNlhmckV0WUlPQVFPV1JhZ0hOMm40NHJOQ3Y4ZXJFOVl6N3lo?=
 =?utf-8?B?YVdPOUxUQktJZVpRRUxiRDltTW1HRzNXL0g4UG8xMnd0MUxKZ1RtdWp2a0Fz?=
 =?utf-8?B?TUczKzFOTmRDblRyZVg0TkYzTDVpSDkzNG1RSEtXOXRhV2NlaW5ZNTU3YUNr?=
 =?utf-8?B?SnRxaVBLMG9YOW9ubVpFVlV6RDB1Q1lnbVlpOERKdVhiRTNXcFNZS1lDSFZy?=
 =?utf-8?B?MWtwV2RyWWV3RDcyZE9FNHpDODFVME94WWE1dDlIUGc3ZHA5WXVKT21OejlQ?=
 =?utf-8?Q?j1CsWSSjX0lW61pawSBsepPxM7Lwth9e0UuxPVA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a392fdc-3619-4682-3094-08d8d73449b8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:18:05.0053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqnODxnhLWrQozdhBWLFUriHM2mPLy/yfdzajQYUdJDtMCav9nQAwmoGMQHtqSXY+Le2DTf0FxOO+HtzW7f9MbbNQCiPFXUYXPbc0CBYj+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3975
Content-Type: multipart/alternative;
 boundary="------------0FD1E64148D392D5CFC5C856"
Content-Language: en-US

--------------0FD1E64148D392D5CFC5C856
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-19 4:53 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-typeguard_2.10.0.bb => python3-typeguard_2.11.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-typeguard_2.10.0.bb => python3-typeguard_2.11.0.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
> rename to meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
> index cb5c37235..3c9cac86b 100644
> --- a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
>
> -SRC_URI[md5sum] = "cc43e0eb1dea7e409a74c7f1effc4544"
> -SRC_URI[sha256sum] = "d830132dcd544d3f8a2a842ea739eaa0d7c099fcebb9dcdf3802f4c9929d8191"
> +SRC_URI[sha256sum] = "cc3b9c3466823e70b47af7bc43e481ef59ad37112ae71c448f0d3fe773db7567"
>
>   inherit pypi setuptools3 ptest
>
> --
> 2.25.1
>
>
> 
>

--------------0FD1E64148D392D5CFC5C856
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-19 4:53 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210219215346.2367571-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210219215346.2367571-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-typeguard_2.10.0.bb =&gt; python3-typeguard_2.11.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.10.0.bb =&gt; python3-typeguard_2.11.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
index cb5c37235..3c9cac86b 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/typeguard/">&quot;https://pypi.org/project/typeguard/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53">&quot;file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53&quot;</a>

-SRC_URI[md5sum] = &quot;cc43e0eb1dea7e409a74c7f1effc4544&quot;
-SRC_URI[sha256sum] = &quot;d830132dcd544d3f8a2a842ea739eaa0d7c099fcebb9dcdf3802f4c9929d8191&quot;
+SRC_URI[sha256sum] = &quot;cc3b9c3466823e70b47af7bc43e481ef59ad37112ae71c448f0d3fe773db7567&quot;

 inherit pypi setuptools3 ptest

--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0FD1E64148D392D5CFC5C856--
