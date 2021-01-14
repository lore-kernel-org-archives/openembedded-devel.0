Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.75])
 by mx.groups.io with SMTP id smtpd.web11.289.1610649948493873903
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:45:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JWvJUPq3;
 spf=pass (domain: windriver.com, ip: 40.107.93.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvlWLXce3ERd9TXASR5N1z5HN6vLZnwrXNJ2uQWXICp+R+UkMnW6YCWxgjJRuDuD/rTYVb76F80afwPzlj2IsSAjQBEHwuI/Gt5qfoMaIo4V52KeoU3z+y8E8ZKDOEi5DJ/o5+N29x09uHBzkAP31BMm+bUN5YvfDIDPdaPA0hwcletGRXxpHwEeOIPDmR7VDivP2SfSjqTRyN5VFcP5o2W2nATAPjBhUubzJqypQxXeFBLP/DzUPBgBM4rxzNW/027r5lWBcwRuf6XSViTa4XdyzTirgYLqeNyi6x33i7MkbPAER4OGKK2e+rsdW8XfndUoLvpqr0ZwPcGaWtrMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbB0/DhLw5rRquE2aQ0WmSlxGACkW9WvlM+Gf61t9NQ=;
 b=DbGSPcAEzXhSmRTvoCnFftKv6+3EGFa5xXFMaLYXf806dWI6RFuquXvYx27O9NO6bMFlQlsy/OkR32FKphJkfkXxjEl5zX192Y4G7JDjyBFVPzGaoY/hplZaLWzGdX2FnMdZpV8QoNLfIZWZtTVDSI6SSO4nTGfqNFj8V2X07b3HG42qNn6cbzMOSGHuFN6pggyrb6zE+yD66eMD9XJmTDBCkEKmWkRM7KtRmdqWtRCgmnuXVxhB9xYr+F/HtgyG63R4ezGXnKiqbLoGJE44E2TmetxUnDlxTl8O/yjtRIEu3gV5ILHEiCzbLiqKRhVpPFUagLwhr50epRlxkA873w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbB0/DhLw5rRquE2aQ0WmSlxGACkW9WvlM+Gf61t9NQ=;
 b=JWvJUPq3KmoVQtV8UEy73Z9dzwhFRXYOrbVJ27dDlD0WwoMYXlJ3r11Mh6+ACkLgaXYU2M7gUtBBto9X6r7TddgpDpjeaQ4CP4aDz4Y9JywgXi57IIkFUg5Aj9e3HlIca9wgnURy/ukc9MOtX/fzvBlOtE2z6E/RFbinH+vylLc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3479.namprd11.prod.outlook.com (2603:10b6:a03:1e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:45:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:45:47 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-pyzmq: Upgrade 19.0.2 -> 20.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
 <20210113142626.27599-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <57f84625-afb7-e6e0-96a8-005ed7736014@windriver.com>
Date: Thu, 14 Jan 2021 13:45:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210113142626.27599-10-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BLAPR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:208:329::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BLAPR03CA0075.namprd03.prod.outlook.com (2603:10b6:208:329::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11 via Frontend Transport; Thu, 14 Jan 2021 18:45:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e784de7-dcbf-4aea-9204-08d8b8bc9b7c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3479:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34792B6DE7365679552CB6A59FA80@BYAPR11MB3479.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BlGYVy332QsW7TWXbis7F9NQoCh1lyUoHqlVYkQhaGHEElG7/2xTTRV9UZvBZFIJlIFV1dCrTr4Gu83R6oEjxxTe1L5ApiSbhNGLq7YEYWYExPPZNpr5+0PbMrKOSZ+Mkz28sL4P6W9gIEcxAagaQJJJ5e9HIf1p6oV0ar4BKY0XJTmpfUzZNnZIcAK/pLOMR8YmSoP+DpwNFya9gY5eV2ZCrWnj4NhJSNIHihBtgwHj40CEbfyGRb9c0pp4pL+iY1zXTl4v79s2789df3w5b81v4EEp94AC+/3+f+p65WCREn0Jr3awf+2YjgLpnNszwpwx3AKtuFebzdff/qRushEat1DO4iVVLNjxfVojny71ZpnQeK+Gasems9+5dalfBUGR4PcnhOzXBuPHqy95qK2Mo8lYGoAflK5VN+uJDEu+xjTGrNXRxJ6cpKi2vCAu88KTj7+XIM241hdjYtDg9FXsUktK2oDCVnnZagwXg3WQ/Uc4xjhOSOINn4tWORKjcsoL/XdZanW50/MuBYzl9ceeRZ/D0RpZAgSgBTwWe5nwtRuV66aC8oA5SeHAJK6d
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(316002)(6486002)(186003)(44832011)(83380400001)(36756003)(478600001)(966005)(33964004)(16526019)(956004)(52116002)(26005)(31686004)(5660300002)(2616005)(8676002)(66476007)(2906002)(86362001)(166002)(31696002)(66556008)(53546011)(66946007)(16576012)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dDlNbWVTY3MramNpYjBFNHlmMXRZQ0xnUHdSU3B2MzFjdUUwMFVVbXpWbzNX?=
 =?utf-8?B?ODZjRk1VdnpGUElsL0Q0WExiVEN4ZFJMQThGbWdtaVlBUTJVMzZteXNnWCsv?=
 =?utf-8?B?RDRCazdZNjltclJDbWo2U1lIZkNMOFpud3RqWlFoV3ZTUXhiUmFQRC8xcktV?=
 =?utf-8?B?WDNYNDhBZzJqeHNXYjdmVXlmRTdtUFB3WExxQnJTSC9FcCs4M3piZ3NOZ0F4?=
 =?utf-8?B?VVkrUmJjUFBYOEFvWTNocStZNFplaW5Gb0RPNHNuNmZBQ3IzQUFMWWxDUmJp?=
 =?utf-8?B?K3pHSFRmbHY4RFNobGZVVnJKRXAyZy9lbWR0N0xiOFd4dHNha0JrdzI1ZGUw?=
 =?utf-8?B?a2ljTXN5U0U5dm9IWGxjUzBFa2dabkRzeE5JemV0RDFqY3RpSmlhUkZabzZm?=
 =?utf-8?B?Q0paR3BIbnRUcUlWNUtWRzdRUkdqTEpZUEczdFVlY1ZiZjJqNVg4WmxlcThw?=
 =?utf-8?B?KzVIc2psVzRoVmN6ZWtaY0d3YmRqMnljQ3VTVHFiMmFsRDRvOTEzZW9GNE5R?=
 =?utf-8?B?ZCs3a3p3ZU83QXRTemplYWMzbDI2N0RCU0lPajNSeFdqK3ZCeEtUTVRMZUpy?=
 =?utf-8?B?MmkxWUhXSGQrVnY4WkdZVllTRFNIb0kvVzhqOStZMENRSzl3dkhrY09qUXpN?=
 =?utf-8?B?MU9GVHhjY1dWYmE1dy8yclVEUk1HRUFsY0p0Q0NWZm5vUURMMnNDbHBmVWtB?=
 =?utf-8?B?RTk1WEN1TElLNHQxL2R2bnJueDgwcWFQV0VsUmhicGh5a1VBT2JObFdPOTNC?=
 =?utf-8?B?MTkzQ1lWaXNQU2xzd1hRNXBXQW5helVvYVZyNHFCTDhHREliUjlJN1hLdGtk?=
 =?utf-8?B?dTh5WUUwbnVzWGg4QmM4SGNJVTlhemRnTC9wN1hGWGJPY1BRbGsxUnNMSU1H?=
 =?utf-8?B?OWFPNXYyMXhxNGtwUm13VnpyZ3cxQVNKN3h4em0xVWxJcnJjNGxPMlg0Mm9U?=
 =?utf-8?B?RTBCL216Q1luTHdTQm1QYU1mK2lIenRFMXpOQ0pWWStydjhveTZCYjRhNk90?=
 =?utf-8?B?NHR3Z3Q1aUhqdEdBVTNnVEtqSkhWM2VEWEFCcURIVWVkdUQ5N0wxZllka2s4?=
 =?utf-8?B?RjlpdnM4eEJnQ3B5TVpwbUJOdzVGMm5tVVVrQitwa3FubVEyeEtaVCtqQnhL?=
 =?utf-8?B?U2pKK1l0cCs0TmZvaklIRXcwNVEzMDdYb1NCQ082WXlFQUNDMDhmU2YyMzk3?=
 =?utf-8?B?MGpvVVFOOXVtbmFaS3ZsSTl1ZElLakR1Um5pcHJ0bmlzUUc3eTVKdDdNTkdC?=
 =?utf-8?B?TFE2N3Rnd3lDZEtPT3hpS2hUd2l5VXg5aEY2WlhJbXM4VENiRUVTdUN3RjZ1?=
 =?utf-8?Q?BEet01IBU719NNaj/5AKgAL3W4al7PdfQG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:45:47.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e784de7-dcbf-4aea-9204-08d8b8bc9b7c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u15jve3FPjny5gN8q79BpugFMVwjRtN+D8urLE2XFa9qwWUcWS7lrkYtkvxZWQCl2mcw5V4kiH5khhCOeIH4mUNYt6BRUtJ7NRjpUISwUZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3479
Content-Type: multipart/alternative;
 boundary="------------683BD6444E841F7C621A70FD"
Content-Language: en-US

--------------683BD6444E841F7C621A70FD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-13 9:26 a.m., Leon Anavi wrote:
> - Update bundled libzmq to 4.3.3
> - Socket.bind() and Socket.connect() can now be used as context
>    managers
> - Better error when libzmq is bundled and fails to be loaded
> - Hold GIL while calling zmq_curve_ functions, which may fix
>    apparent threadsafety issues
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyzmq_19.0.2.bb => python3-pyzmq_20.0.0.bb}       | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyzmq_19.0.2.bb => python3-pyzmq_20.0.0.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
> index 3c4e32b5e..a668eb11e 100644
> --- a/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
> @@ -8,8 +8,7 @@ DEPENDS = "zeromq"
>   FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
>   
>   SRC_URI += "file://club-rpath-out.patch"
> -SRC_URI[md5sum] = "200abc1a75bdcfff7adf61304f46f55e"
> -SRC_URI[sha256sum] = "296540a065c8c21b26d63e3cea2d1d57902373b16e4256afe46422691903a438"
> +SRC_URI[sha256sum] = "824ad5888331aadeac772bce27e1c2fbcab82fade92edbd234542c4e12f0dca9"
>   
>   inherit pypi pkgconfig setuptools3
>   
>
> 
>

--------------683BD6444E841F7C621A70FD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-13 9:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210113142626.27599-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Update bundled libzmq to 4.3.3
- Socket.bind() and Socket.connect() can now be used as context
  managers
- Better error when libzmq is bundled and fails to be loaded
- Hold GIL while calling zmq_curve_ functions, which may fix
  apparent threadsafety issues

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210113142626.27599-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyzmq_19.0.2.bb =&gt; python3-pyzmq_20.0.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_19.0.2.bb =&gt; python3-pyzmq_20.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
index 3c4e32b5e..a668eb11e 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
@@ -8,8 +8,7 @@ DEPENDS = &quot;zeromq&quot;
 FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-pyzmq:&quot;
 
 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://club-rpath-out.patch">&quot;file://club-rpath-out.patch&quot;</a>
-SRC_URI[md5sum] = &quot;200abc1a75bdcfff7adf61304f46f55e&quot;
-SRC_URI[sha256sum] = &quot;296540a065c8c21b26d63e3cea2d1d57902373b16e4256afe46422691903a438&quot;
+SRC_URI[sha256sum] = &quot;824ad5888331aadeac772bce27e1c2fbcab82fade92edbd234542c4e12f0dca9&quot;
 
 inherit pypi pkgconfig setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------683BD6444E841F7C621A70FD--
