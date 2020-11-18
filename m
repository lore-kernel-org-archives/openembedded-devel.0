Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.43])
 by mx.groups.io with SMTP id smtpd.web10.26378.1605714719231642751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gC5JFGdg;
 spf=pass (domain: windriver.com, ip: 40.107.236.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjVHBaVsXSibUpWG58LKfm/06iONq2ed+tmtz+VFkKnIV5Uqz2OEOWHto58hPkij9kSwNQEsz2nx/7zIi+kpnUPsZevRTnkP7tG+Uy1AHn1oMMVNRYeYqRwAWpYRQ7PmCYmf1KqvGTPEorAEqWlZSa7zUPX0tkfqur78zHxQyiqZ8RnTLC8R6kvu0C2QilkXJFI8q+wwVcJqoVR7qgpWxCUOWI0ZJ3aLpXYzFJnzUiRziHPTLAoPkQyAcCcPBH4MeGehEI/Djaz4wGXSh3Vcx/4TkLo9mteEidz52cYbHbwCyuA/6MS+OhkIsUMsGH/mXSMu/sf8dPKieTF2XDTnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NIgLNgR1ijFSLpX/5hhu/vWIuR54goSiVg6jjZpj8g=;
 b=UVjBi9rBReEKybvGT9q7yXgFlUUJlrxR2aXz8TBZNfVGrzlrt/zc3QYr7G8ntiZENvasefWHl4c7IOjbhAXe6NmOotLIm3D0bZCNKsxNPrh3c0b6N1QkTaDjxZjZ4DIPPAS4GICUQbcPDKohfS/eM6PwbeTAeet7eeKXS0akGjS1hFEhoYlX74of3aLvvY4ewGPJAxBh01XC2fn8SphKF1fapwQ8VmUScDL2TXkvtO9oHXamuxOkV93noTQUmynVt40KWPzKxbuyW8MYKqf/5ELAM9ZJKF1txZ10gfYyrvHA9eKWtYELbiIubHzKugcgUhR2Bnegjy83py+km0j8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NIgLNgR1ijFSLpX/5hhu/vWIuR54goSiVg6jjZpj8g=;
 b=gC5JFGdgJPAIvvglLvnNwXyLjr+4zCSnkInigC4MDBNWZychQMnFJGReOmrHNPkkKaCUOYJt8U4R2pVy/GmTklAe7oqoOS3vOELPAJVRssrAw+oPdTrjPrSnno/zkoq+Gc5553d1D6m0+nODa8ycbZM6Xv3I0G8khnJvL+SFEic=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 15:51:56 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.029; Wed, 18 Nov 2020
 15:51:56 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-cmd2: Upgrade 1.3.11 -> 1.4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201112105618.23773-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5b3f6f4d-16fc-2032-cb4b-62a31f1c9b3d@windriver.com>
Date: Wed, 18 Nov 2020 10:51:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201112105618.23773-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 15:51:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 164eea23-635b-4fad-80ea-08d88bd9e059
X-MS-TrafficTypeDiagnostic: BYAPR11MB2632:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26322743A4B9B90281F2DB949FE10@BYAPR11MB2632.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mxT0QxBhwOFBXI+FVWagn/Fznj/3KuON/Jn9dLBjEOVZsnmPTNEp+BZHsnbOIhW9alcEvH/QhZDMrINtjvEvmFUF9epKer+fLTsXwffbkicjbRS5eUAlDnpwSt6WwbUbruAEp67JV6j1YHXrjepMiSZz66lpCmjKF+y7LtbkwBkYv4G8kq/eEuJpHt6CdQpEaZs1bxffbVU7IaLbVIuw0TQ0enNv75I2z+Tv0tEcMm3q7Rqsy0u+5Ny0es8X+JhnZD8W7oklA7iHoY4S/FiXsAesTggHImXczKYcw2Kx+XvAOJ/yBgpmyWxqDqQrYIgZ6mKUto9LwzyIla7JZYYWnbFtfJCPFNLV0ynMiUPZXDwVP/5sqZgZdgzGnlkenUk37r3rvBpCHVAvzHbXdySDODWc2htFMlzkaxuTlUga5Cl5NbGh0jDm8e/8DGPXQYIgDyXZQG6ZU2ghRbJp2V+dBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(136003)(39850400004)(346002)(53546011)(44832011)(86362001)(478600001)(966005)(33964004)(16576012)(31686004)(52116002)(316002)(83380400001)(2906002)(36756003)(16526019)(186003)(66946007)(4001150100001)(66556008)(66476007)(166002)(26005)(2616005)(6486002)(8676002)(956004)(31696002)(8936002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1C2tuacu0pAz7U9Y9vKfWv0U9V8jVPXzAx8GndDSul28VI27fgEFzH24pXfUKo0f1Yuotoc2zQ5GF1s/21mT/z80e5st/ckiQQsmnhJ0h8mJYzBh6MUsLImip65ZcrHKr4VF9ZjzcpgOnuvTpLV1wLAqdzuiarWH/Yn/wJSfHykKM6AzOTsYl3BF6njFfBIsfs8iSF+2TUMaq7DkZMShSWt/uiEiIe9a6XhvCr2Uts3SWQGXhDa91ZT5sCTt2EpHJYWTaaAjG47XKMy2LkWmWQGsPclcsjpBOvAoCqniGxEcOgaiiLn+tEPHPuDc4iDzfnSOxfcCpFzPLW0ZvMYsZqWQi6uwoN7fPZVsOte2a0BhBooh+h/ucdE1ccfpPJsfoNMPYkhWNYj4LemJdt7mUyphQRS7hOY348tDqAhOlg35pEVI88+JmIgs2+tToSGxhS9BcgQuBukn0QI0YVK04GqU1naUBkYA9St3zNy/nL3So0vANGX1ZBc6OCs7IOfFJe7v377zrhnyw2i9ps+Zh9lLRs2uEH8/QQuM+xRZtEBATyO2EXbDR6UjwFZs5Y5bCPr0bMVGCpdXMDbu4BnB6OgmkKHERcHUspv52HODWPNKf11Y2f3tc7xPE/WdZuBoFZcI6S018rRioz00y6pSIA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 164eea23-635b-4fad-80ea-08d88bd9e059
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 15:51:56.4559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbTLvmA6oldRHX6H8rT+X0VCNqqDiGRgT23Eu0Moq6yp1KVDmAkaGJ0anT85gsFOMkrBTeuwVfHpEQyyiXse9PuUkQV74jV0nyUZPjWraKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2632
Content-Type: multipart/alternative;
 boundary="------------EB3C3377E0BEF96A644D6823"
Content-Language: en-US

--------------EB3C3377E0BEF96A644D6823
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-12 5:56 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.4.0:
>
> - Fixed tab completion crash on Windows
> - Changed how multiline doc string help is formatted to match
>    style of other help messages
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.3.11.bb => python3-cmd2_1.4.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.11.bb => python3-cmd2_1.4.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
> index 3b2aa5b744..dfe493bd2a 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>
> -SRC_URI[md5sum] = "7e3dbe0aefa331e80f515d3c41cc3b8c"
> -SRC_URI[sha256sum] = "826a288ee6d9c4ec1184e64e9566c09d3b73be8f4283c1898fa4332f1daf8dbf"
> +SRC_URI[md5sum] = "520afccc1d46f833d117a23fab76ed8f"
> +SRC_URI[sha256sum] = "e59fa932418603af4e046a96c8985812b05af8a73bfd9d7a386cd1b02c6ab687"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------EB3C3377E0BEF96A644D6823
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-12 5:56 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201112105618.23773-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.4.0:

- Fixed tab completion crash on Windows
- Changed how multiline doc string help is formatted to match
  style of other help messages

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201112105618.23773-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.3.11.bb =&gt; python3-cmd2_1.4.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.11.bb =&gt; python3-cmd2_1.4.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
index 3b2aa5b744..dfe493bd2a 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>

 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;

-SRC_URI[md5sum] = &quot;7e3dbe0aefa331e80f515d3c41cc3b8c&quot;
-SRC_URI[sha256sum] = &quot;826a288ee6d9c4ec1184e64e9566c09d3b73be8f4283c1898fa4332f1daf8dbf&quot;
+SRC_URI[md5sum] = &quot;520afccc1d46f833d117a23fab76ed8f&quot;
+SRC_URI[sha256sum] = &quot;e59fa932418603af4e046a96c8985812b05af8a73bfd9d7a386cd1b02c6ab687&quot;

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

--------------EB3C3377E0BEF96A644D6823--
