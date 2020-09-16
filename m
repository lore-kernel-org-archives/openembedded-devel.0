Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.59])
 by mx.groups.io with SMTP id smtpd.web12.22673.1600263442021094859
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XgyzM+xF;
 spf=pass (domain: windriver.com, ip: 40.107.243.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMKKeKgIP3Sbd7y6mJwfdR0R9JAUBoWGQ+Vb9vzIVtP1D5WAd+vFWn7t7gMlYKoloN2PQ+bPLlQeLD8eQGyqI+iResuffwmCjoKToSmvHTXrn+LBafb2O+PSXVfhZdqjAFznMfvfpW4OnMmwHOAhUa06inrQjeWLQWwyAEhaUEc5BrzhmBiw/hkrdp3aBGtHz1EOGfDYMB9OAZAoJ9iLTzU5VeknjSiUy0ro6rbY0d/kHGTrrH1KacWcnGE+wkNk4bUTBQWWbnrmc2ga6zYtnwJ2u/SB2MadGhdPAVslOg6A6uKDsvKveX5zWd7MED/E+mr+jRujxyNY1gd6K8WZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5G7L2sgtHD2DxpMYKxb0aERlOhnnMo7QuTaW8NjCbQ=;
 b=EN0pKM4TxW98cpWFLsM+CT6t8Y6Gp82DEwFbsqvjouU9Ik1RSMRF8YuH5ECg7FI6ZzbwjHbkF/UG7JafM2JCNXKPSmqmVYYYG79dG+FBu5Oo8amwR8II83QIrZbp+M7K7ohY1LIAKXDxc8uFjeEcGrGy50KJGEWdVryxlSpOvkFxWGL/5vGtcTvfZ3HjIFKSuGGZWj/DNXs8lbWz0VNj35w/5Ug5qRPnBVK/xL6/Bwh4IUsM3Wm8sFGBYx/KVHyvrPHz93u0hZel8/3QP5aDZ5WfkX9E5l+JsffLsXRt2pQlPHkABv8gtBLwQFzbxaziF2CZrZK9aKgbIut4bjsHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5G7L2sgtHD2DxpMYKxb0aERlOhnnMo7QuTaW8NjCbQ=;
 b=XgyzM+xFtn5DSrXSxAlF65Bharj/+UEAZYyxHmfC0jslxX8eKB9Vfe8wSUkLkGwfwHxee5/yzaq1f6ZC+FutGvvkhlFDRf3ZMAf+pW276EUFP8oDSwB22dUXmRF5krFXyHursPeDWqdf1/lP7xklsD0DVHaTfDMPFLBojEHvdzg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Wed, 16 Sep
 2020 13:37:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:37:20 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-stevedore: Upgrade 3.2.1 -> 3.2.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
 <20200915090303.14367-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7f2d0a51-16c4-8c85-33d8-1c01cae538bd@windriver.com>
Date: Wed, 16 Sep 2020 09:37:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915090303.14367-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Wed, 16 Sep 2020 13:37:19 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad64e163-5612-454b-cb2d-08d85a45a2a2
X-MS-TrafficTypeDiagnostic: BY5PR11MB4306:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430668E6ECCAEA09106FE6059F210@BY5PR11MB4306.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z4+pzddbG2fwX5L6g+0gndU8FwVJx8kmmCYWb6zqxyv7lR6nUTnolqkr8RcJToPEaYJsI0cjpsvdpVAS+IB/hCS5Sph9ZJ2KgEtaq1Qrz+Eta0NoS0gKItbcRyPD2uVkjIQQDKP0G+1AJwOL0C9YbGuQJ1ENddzvWFdvlSwFU+wW60pAUN2iAWbqxbkMyPXjTMf+mqeZobVrgxhl+mfrMHRvJh7W3qbe7ZlRmmfrZrncdigrEbLeIosRhPN1N7w6slntr07T7xnfjCV6PeRgOw82JD5OUaokXCjnQv5mM0zBm14QyTg4w/I9YjYuJX7DlENbRkZC5PDRS/uXGz48QJjCYWv8CCIW9RYB02NLcal/IDcxMF7ZYGFzeKNK+Zmdcc1jy86Nwacxx4C/BQpkFuJBlwa92VZcCYbbbumsyyEKS/z44XYqmrOr3YLKsaGY5D8cXyituHfEZbg+pfTttw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(956004)(8676002)(5660300002)(2616005)(966005)(53546011)(6666004)(26005)(44832011)(166002)(498600001)(8936002)(31686004)(6486002)(86362001)(31696002)(16526019)(66476007)(186003)(52116002)(33964004)(2906002)(66556008)(66946007)(16576012)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AXM80VbTfr4wfZQbCXbtFOyie70c7qhdjndQlMemIib8qQgmKxN1mQnvavXr1uWki2PUg5NU2t4ie9tnp1/j0MhFt0q4werRjeR8cbv3hrSDt1nbMCNg03tJCkSoUjQhnIL0t9jwjbMXStjd9rQ68xRdIiFOcBPQhJQaNnW1T8h6WoOGWn2TX0n61PffPCe9bQz1DfE/LCu4w1JlMDKuFtQH5KHJ1/RTHlTnef7CrT1Bok8H60wTZX+ZjB/3CgiKbVBCzu94L4FASqSzTC0ZnJFEcC63zdbgMdC0nDscaTDJohPtaveMYFKJCw1Byd7smJsmAVD0T9JTNqRkr+6nOrUeFOmorPGhJY1PJOUVU2+IepRgIai0tkMIguGA1p9cA4BU0hXIDmwxEvTWny7WrxXtUkeKqop1GPaWfk96qL3RVP2tSfd+Px+R803K4caoXg3d0w4OKNGZ+VX1ivBx/G/mpXofG+2WcCI84DXP6cmJmERKFttqp0GVEoa8jef0oe0K8S7RYqdNscf3ydv9CXSJyGnYASqCRHLXNbXEHuOw1ZM2DpwKH6GLHiQKLgSaKqVjSzYQ+0ZjWju1AY4ZdrYAnHoBCqdvYOy9sHxsyYnjtfNXrfwABXTQZynryn89XnDXpjPRkeYtNGh8Fi92pA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad64e163-5612-454b-cb2d-08d85a45a2a2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:37:20.3754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMr5QG6pKAd34GPkFbbr19tvGBB8Z8VPhQpl1Tw8TgjLIJCq1KRHHKn0CrTszZiroXXVuTbN6VQQPc26zCZpPjaBeh/3Va0BxE43l7TU7zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4306
Content-Type: multipart/alternative;
 boundary="------------26E03C2664C9B48BF620B54E"
Content-Language: en-US

--------------26E03C2664C9B48BF620B54E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 5:03 AM, Leon Anavi wrote:
> Upgrade to release 3.2.2:
>
> - fix supported python versions in documentation
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-stevedore_3.2.1.bb => python3-stevedore_3.2.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-stevedore_3.2.1.bb => python3-stevedore_3.2.2.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
> index c3c368c34..18eae3532 100644
> --- a/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI[md5sum] = "5f5660cebaefebbde4607e44e050a3b2"
> -SRC_URI[sha256sum] = "a34086819e2c7a7f86d5635363632829dab8014e5fd7be2454c7cba84ac7514e"
> +SRC_URI[md5sum] = "c78357a02888490ef27a0d898eb97172"
> +SRC_URI[sha256sum] = "f845868b3a3a77a2489d226568abe7328b5c2d4f6a011cc759dfa99144a521f0"
>   
>   DEPENDS += "${PYTHON_PN}-pbr-native"
>   
>
> 

--------------26E03C2664C9B48BF620B54E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 5:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915090303.14367-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.2.2:

- fix supported python versions in documentation

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200915090303.14367-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-stevedore_3.2.1.bb =&gt; python3-stevedore_3.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_3.2.1.bb =&gt; python3-stevedore_3.2.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
index c3c368c34..18eae3532 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://docs.openstack.org/stevedore/latest/">&quot;https://docs.openstack.org/stevedore/latest/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
-SRC_URI[md5sum] = &quot;5f5660cebaefebbde4607e44e050a3b2&quot;
-SRC_URI[sha256sum] = &quot;a34086819e2c7a7f86d5635363632829dab8014e5fd7be2454c7cba84ac7514e&quot;
+SRC_URI[md5sum] = &quot;c78357a02888490ef27a0d898eb97172&quot;
+SRC_URI[sha256sum] = &quot;f845868b3a3a77a2489d226568abe7328b5c2d4f6a011cc759dfa99144a521f0&quot;
 
 DEPENDS += &quot;${PYTHON_PN}-pbr-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------26E03C2664C9B48BF620B54E--
