Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.69])
 by mx.groups.io with SMTP id smtpd.web12.36102.1615212052352279064
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:00:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ERLFS1en;
 spf=pass (domain: windriver.com, ip: 40.107.220.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPujcNpqR5YgBR0t6Y8ebNYg6/+VfoYDNvmbaOrBgLEKR7GwB636DvSVURZ+g4xMCmF0y87luqNgYvJdp9CKaMMYtDkh9pLWW5YoXcYnn2Dl/8pYkSUFhTt2BBcEghwU3A33cP8WDkc0IkWZRuXD94TVcvsxHfQZ518fk0Vs7cX41YBF2jlmvemGRHtDBNYU1YE5Al0oCUQ/eMXy4yLDKlukd3o+h7fBVi7UMfh9yTcnrRellEIvBv++1IW2LrrSktGXYhyMsmKSR1tUej+GJRlnYhVC9t72A52nogPWAMH9nCLHPqBKaOyDsKxzS/u5P2g11kev7M07SvL0mMkc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL2eRk3EOZiQXLr8lPAWb0wvpzyFmGle4A9X7Nvpomg=;
 b=ePfnkgwWTvgJKse3kmGLSskYvcbYrMTUFI4mKn5Q6eLDl+HHDb+DZhWftXEzs88xrcqkUGSdZHxN/D7JuRZzXTPFh0rZOMU4QtRBeGH6QcDunC4vQTBFAZ6sD+Dx9Rk/VRxQ1p1S8z+IMW+PFBp7oAfdxUR6T6T45Djyf22oB2ldC/EdyDWj3pDnHlkVc+ery3ATEHTRmoD+SOdNXNdlO9Ql58SvkX9IHGQyxY/F216EBbfG67Ml98kardo4MHAIrLzXD4ZA4fp9G3ay4wlH8lxtpNG5rW9fgScN3OgWKiweYL36fBRfSvhWxgu5MgRm1goXT6ZicgeE9pGZvMpE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL2eRk3EOZiQXLr8lPAWb0wvpzyFmGle4A9X7Nvpomg=;
 b=ERLFS1en2RnMGe5v7joT+8/KkxN2RDdEtmhkhOWgfjTd97NthBUhvxQPz+Roa6eAU6FMD0zT960WiUyG0DdZFP7Orow32+59B9rVdKbcncGqLfHuy9xCDejfG6Fa8sVTkuiGnHaASHVnDL4f57u2nEt1xhSl3JnsbHV26lTqs0U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 8 Mar
 2021 14:00:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:00:50 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-elementpath: Upgrade 2.1.4 -> 2.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210302111640.18581-1-leon.anavi@konsulko.com>
 <20210302111640.18581-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c993939a-9557-60f8-3399-a2473f6cfa0a@windriver.com>
Date: Mon, 8 Mar 2021 09:00:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210302111640.18581-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR02CA0032.namprd02.prod.outlook.com
 (2603:10b6:408:e5::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR02CA0032.namprd02.prod.outlook.com (2603:10b6:408:e5::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:00:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ddde0c5-ed33-461e-ba51-08d8e23a94bc
X-MS-TrafficTypeDiagnostic: BY5PR11MB3895:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB389548A51CEBD75D4A2872559F939@BY5PR11MB3895.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jjjqZcoYM8meaF4QNEx+QMe/eCUmigeqHVFf22rfIvXpVZBchjiYYoVm/zbVyzL6gU7yENdNQfLD3dLmDlGv173vq90vh/Wnop1mx+f1CgwdTKuL1t1LkXvt1yR57yu4VI4nViGyn5XePJgk9EONOPOuRpCJxUTc65lTviq0KHBGNVnTYs9NSA+WoSJkfZCNV47n/80XqyIPzzZAKWwUTltdM72UyuX2uGbuywba3xgQ4wnXHx0vL4XRs2GY+5Br/3RsffqHTqk+OwyVWQhJJNFCALKafOVg5WnHvi95N4aPDr+y5/njH/mSIvDADJLnrY1etGMqvb6Af8ntu1h2jnMSnH7OKaLBWi475qztOkCYBzWYH8/HdoGQNrarkbo1DU8MlWmXwSezXJ/BgWVU0+N3Ruwj/42K/p2i0KhBGOxTqfUI1V6JpL7zai4Rbz2IgcE8yNb6IFgGzItiUia5c+/clY02BN8BDRK9fAneWawJJpcTzzqNNWhf9y3mCOaKk5tJ+G1NV2wFR3PkC/6RTEuZdJkCFekqCuPvEUqJS5hYasHfat/sTsQiGophkjXprsSPE6CmrvhKU0GtKCnKyIEhXZQuBROr4jHK7n1FdfoCEK2nkuSTHtgbYEcljnrHAI91aPszO8pII+rTFbyGxAO9/KoSJEprJWHNSNB9R8w9CvjonlLbI4B6+NhV0AIX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39850400004)(86362001)(33964004)(2906002)(16526019)(26005)(44832011)(53546011)(8676002)(6486002)(956004)(316002)(31696002)(8936002)(186003)(16576012)(2616005)(31686004)(166002)(478600001)(36756003)(66476007)(5660300002)(966005)(66946007)(83380400001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?T0RZNEJQc2o4R3krMUwvZUJlVzNCK1h2WldkVkRZTHluTGRmRGd6U1Uvck1u?=
 =?utf-8?B?L3dCRS8zNUhOVFAxOG9nRnUzZkwvWGUrM1lIZzg0cVFjMGo3T0xzQUdpT3l1?=
 =?utf-8?B?SHA4dlVJa2VQUTMzSnJ5a0d6Y09qdkp3N0l4NzFNTU4yb0xSaG83WGNoZzJC?=
 =?utf-8?B?V09NYitXTXZmTjEyTXFVZ2FTUG5OV1VIbUFQRmFuR08yNkgxQWRhaWpsVnlt?=
 =?utf-8?B?Q2RsNkt0eFZCTE93UTV1SGJzbDRBaHJ1VlJnaHpNMzUxWFB0VjNmbFA2OHVQ?=
 =?utf-8?B?RVRIRFlPWUFqQmFWK01QLytCdXVvTEhwekNja05qdXN5UWpmeXkwYUdxTTZE?=
 =?utf-8?B?VTN6cmNwL0pSaGIvdWs5eTdUam9mTnBUaGl4Umw0QXN1NU5qR2FLSFF6ZUt1?=
 =?utf-8?B?RCtlVWlqN2IwUFo0ZlFad3d4eVcwcjBlWXZtdllOV0orbGp5OUNOVmJaaitN?=
 =?utf-8?B?blRteGY3R3JZQkxyci94ME8xSHhIZjh1ZEtvQ0xLbFhPSXdjdGdIWmZKdmtz?=
 =?utf-8?B?TlZuTWl3UVorLzl5U2VldENiRGN4bThBcitkR3llWTFVMVFodFNwa0lQQnRk?=
 =?utf-8?B?ejNURUk5bm1mMWQ5dmZOWWh0QVl3ZUVXOFV6MFZybXNxa0F3ZDIwQUVFelpo?=
 =?utf-8?B?bURXdnRIZ3lsdTVpTGRXYnQ2TVhtV2E3dkZnTFRHaU5SUEdpSytNcjFTenhV?=
 =?utf-8?B?eStBaGcrSmllNXgxQk1aK282dmREQy9BWE5pZTVadzlObW5KRWlYdWNoenZ2?=
 =?utf-8?B?S2ovbUxvZEFPdHRDYWM0WVE0WnRmRE1yd2pUUFFEMWVZeEhhajBtNzlpUW5S?=
 =?utf-8?B?Vno3eThjcEtGUlFrYXk4eHpWeGhhTnpiNWRwR2wzTEwrZ1MrWTZkZGZLK3ZT?=
 =?utf-8?B?OW1YVDFaZlNOYzZBN3Nua0U5VVhqY09tblBHRkIyQzI0TVFNV0E4akJpQVMy?=
 =?utf-8?B?QXQ5cTlhcWRmd1FjcFFCa3d1QVZXN1pPR09aNmUxWHVQa0tZcFQyWVFxQ3Vy?=
 =?utf-8?B?Tk0xWkNVbHVjaDVuUGdQZ1FodllJbEVRWlJYZnlzUmtGM3hLa1NlSTF0bTlu?=
 =?utf-8?B?SjZzaytJK1lHLzRMMmVmQzdqRFJwa2E4VlFpRzUzbElFWTYzMFQzbHJQMXdK?=
 =?utf-8?B?Wkt0Sm45dmk2aEVFWEdtZWZrSzdDVi9uVWx5dDVkTDZPNkExdGZ2QVI5TFhT?=
 =?utf-8?B?Rk8rNWpJM3JLc2ZWL1pLU2pRL1Yvdi9yaVlwTC9JUi90SmhkMW9JSUJYRkRE?=
 =?utf-8?B?dElvaGtxbHM1dWJXbmNnV0FvQjJHcnI3cE1Vb1FmSm81UCtLNy9Yd2VaMXdk?=
 =?utf-8?B?MHViVW9KVlZWZnRieDFleXdrVW1OM29OUFRUdnkyNjNBcDFObDJpRFcrb2lj?=
 =?utf-8?B?VmZRekcreGc2Ry9sMnRIRWIyUllVdlZZZVN5eUNzeGR0QnhNUC9kcmRXOGU1?=
 =?utf-8?B?WUFRMEtsSjF3Ny8rcTFHUk5objZxaHhldTBmTlg1cFFOQjkxMHNLKy9mckpR?=
 =?utf-8?B?bVpnd3A5NEhiZUpJU08xL2cyb1ozcXZ5TExtSnlpTFRZQ0owc3hxeFYveDFm?=
 =?utf-8?B?bEJ3UEpqZkdXdlIxNWx5Q3A3VE9taTZrV1ROMTE3MWpxaWw2ZlR1UVFMU0t0?=
 =?utf-8?B?Q2FYQVI0MVZVaU5Rb0JUanhIYlZqZCtWN1QrOHhKZzFWZVVUcXZsVWllLzRL?=
 =?utf-8?B?ZmZoTm01VzRBTHVGSDl2a09KNUdwWTVuZXRWaTdpbnBXYUZ4ZG8wZ0JQdlg4?=
 =?utf-8?Q?ni20ZCF/O3fytcK2QtVrUcT/+B7DrEu3jwuornl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddde0c5-ed33-461e-ba51-08d8e23a94bc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:00:50.6720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNdpchZLI5FBJElcWq9/PPcNV5CrXmNVEOCILKqkXbnoh1ZO+Mu18v/OvbtS9oKJgyQXs6wjlkZH6Pgd97gMLcFUeGOu3O3f2CmIQttO0Go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3895
Content-Type: multipart/alternative;
 boundary="------------8C2585CA4F13B96A3583D1B6"
Content-Language: en-US

--------------8C2585CA4F13B96A3583D1B6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-02 6:16 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.2.0:
>
> - Optimize TDOP parser's tokenizer
> - Resolve ambiguities with operators and statements that are also
>    names
> - Merge with XPath 3.0/3.1 develop (to be completed)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-elementpath_2.1.4.bb => python3-elementpath_2.2.0.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-elementpath_2.1.4.bb => python3-elementpath_2.2.0.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.2.0.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
> rename to meta-python/recipes-devtools/python/python3-elementpath_2.2.0.bb
> index 10aa17d381..d1383c049c 100644
> --- a/meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-elementpath_2.2.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
>
> -SRC_URI[sha256sum] = "326643aca7beff0864d022cd591736b8550a70fccafd67a89198166baed1c2c4"
> +SRC_URI[sha256sum] = "3bbd0e9dcaf9ab7b2080fd4b457d67f166f7c4d1ece7348425195729059b427c"
>
>   PYPI_PACKAGE = "elementpath"
>   inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>

--------------8C2585CA4F13B96A3583D1B6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-02 6:16 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210302111640.18581-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.2.0:

- Optimize TDOP parser's tokenizer
- Resolve ambiguities with operators and statements that are also
  names
- Merge with XPath 3.0/3.1 develop (to be completed)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210302111640.18581-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-elementpath_2.1.4.bb =&gt; python3-elementpath_2.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.1.4.bb =&gt; python3-elementpath_2.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.2.0.bb
index 10aa17d381..d1383c049c 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/sissaschool/elementpath">&quot;https://github.com/sissaschool/elementpath&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf">&quot;file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf&quot;</a>

-SRC_URI[sha256sum] = &quot;326643aca7beff0864d022cd591736b8550a70fccafd67a89198166baed1c2c4&quot;
+SRC_URI[sha256sum] = &quot;3bbd0e9dcaf9ab7b2080fd4b457d67f166f7c4d1ece7348425195729059b427c&quot;

 PYPI_PACKAGE = &quot;elementpath&quot;
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

--------------8C2585CA4F13B96A3583D1B6--
