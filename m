Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.85])
 by mx.groups.io with SMTP id smtpd.web09.36126.1615212469777996148
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LsCj/UNJ;
 spf=pass (domain: windriver.com, ip: 40.107.236.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mg8zPOuYX7bgpv9hTLwNuOv+kjqtbWhgWNl56iUTc1UZr2aWutR79+Py15yg0LiLMAHpqIDf1trRVNxuNa2hp5fqWokH+4Vz+PEo2HhuxeFMPdLrTbrUKVfdvXnraF/LfLYoD+DBqxkXeHWWJzZ+lGaohLLdSnA0kB0PFuBv7jOctyla4rkHBq4k926K2IYuqxMpTNfRySCy7+g/yGYuTLXfYQiFYVhdrwpu9/0doc+Dw52R+yi5DyjBB3ZMMPUp3sBYvQLJ9yrhimQ0puZNf1zlt3jg4wP4YRpyWknxj14sq6hKbz1FuHmaCanYL8GjLS3gYEswt/ppJ6pAF56jmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7xKMFggOPiR5xOE/fc7g08zEPYPlyfUYjD6ITjDCxQ=;
 b=hvivoc1QmrdhKPaPLWF1LvYZiHsN/dlqJG32O84UniWm/UYBRAABx1kwMEqGtP+L3ggCuessYTh0ZMDrogc7sH1D4mmJrLVg4olT5IRWKLaCAIyW24uuJ+KVn/cehQIJu+K+tyfS+gxsY+Y9dH2fWrCXY9/SZ05kGzo4FlCGlhpJI/w1YWdnZbcUlHp5dQWHPO48N6kA7YRr1w6+IcqIlHAHbT8gbvymlVyOhHvX0VeoZsB/1WeklsEqYUcy5Gx39dj8qTTwL8kt27Q2TzCD9Qe6JCiR5U1phTbYRiR8wULr76oWtyRV/eUFytXbNoSzvPQQKApS5GXIYp4bnRFfHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7xKMFggOPiR5xOE/fc7g08zEPYPlyfUYjD6ITjDCxQ=;
 b=LsCj/UNJDL+ccf4aTtjxulreNbm+hKMBoZWAForZEUvxjFT5Tqzu2jjYNxSEoa2Kr0CQ5q0CD84nBV8GO/jVpDZ53/97Ew2tvmTmVjdzOXtSuEKZwsjyMfOltzY1uY/Oh1qpPxe6Wa1HbLO6a+ic9ORjQXRQ3h/5RB3fqL4lGW4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3446.namprd11.prod.outlook.com (2603:10b6:a03:1a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 14:07:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:07:48 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-jsonpatch: update to 1.31
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210307164356.981140-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9a40d830-a98b-9c8b-9293-5f852dc784d2@windriver.com>
Date: Mon, 8 Mar 2021 09:07:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210307164356.981140-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR02CA0118.namprd02.prod.outlook.com
 (2603:10b6:208:35::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR02CA0118.namprd02.prod.outlook.com (2603:10b6:208:35::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:07:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbf9cfd1-1d46-4f12-182e-08d8e23b8d8f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3446:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34460D8506DD4E4AD8755F6A9F939@BYAPR11MB3446.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	68Fs/oVfJMDU0ouIqOuFB43Aejc0y8DtUTgh7phZ6VQw1Dmph2HKSOfWyPVn0lzb2ME9pK8Pcn0ypwflQd2U5LctrLu6YGHbTEcor5zuX+ufTO7MOsj5xIgdiT/mZeY5q90fA5272//0ShMfe/RS+/lH8fzMHronPhyiLVtsCz3kgDtHFKlbeINz0wl1fNn3eBebT8jILg9EQS3pf54/mHMEBuAZQBczxpMktw02xoxNeeWKZVoVygVIeAEEeCIGGJDcbQkBehwxLCIypcIDeOAVa8M2Kk+gybYR6rAjukez6hgDiRjdqhpxP0fB08L2xRQ3l8ub1i6wUf3wdZjWBzaxUnFe4e+RHDgrBLHvnzXuMnAaiFjA607noYIq893h24o2pcBkc6flfQOyhRktoESwwKponK9o9jbW1utyvnqtsaOpoPJqDV4dGmshjzgBAMLDoBGLTbv1gqPG8VxkylxTxG5z3fUG9RrIBXSG5WtnWlm9fYJcWQxYn75JLwPEW/vvfVwUM/+9M5DpILPhRZ54CXBPRLPN+CxZCIma8IzixRJ077LxJ4MDEBYTVCn1MpQ7mcJBym12OtO7haeSfk1Ic4dMxWmPvlAUULWV/8knSKGsGw7WdQDzS0TwOtjerRQKXoU46s0rN9RTFDr51DGW5P0W3sPijB6hrx6/GqCEaiXD/awIrLA53T1jrfnt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(53546011)(478600001)(26005)(6486002)(15650500001)(31686004)(31696002)(166002)(2906002)(66476007)(966005)(5660300002)(316002)(66946007)(86362001)(8936002)(44832011)(83380400001)(16576012)(8676002)(956004)(186003)(2616005)(33964004)(36756003)(66556008)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?emQxeVlvYlBkaVpqSFNhVFNPY3c1WmZDVWhhUzh2MXNRem56bUkxTkJySU8w?=
 =?utf-8?B?TG40bzA5MVhzTGhnN2hOZHNsZkRFZERMSE5uZEpHT1B0RGdGR0E5blRqRk94?=
 =?utf-8?B?R1JJSld0aTNlMEF3bGpRSENkbENjcjJxVHVjc3Vob1R2QXc2cExjakZ0cUll?=
 =?utf-8?B?ckRPZnIwcGVLNUVvM29ibDVGWGNXVmM5MGoxRHp1d1p3QkkrWkZGTSs0NkpM?=
 =?utf-8?B?SHk3TTZpSGVnR3NRVUdWUmFTRkNaS2JjN0F1RmNXL0QzQldkQzQ3NnhDT0ph?=
 =?utf-8?B?M1RQTEkrelNjd1BOM0M1d0ovZHdMZWMvdm1qSGtWN1NWRGwwWURyUE8vNXFY?=
 =?utf-8?B?dnFJYjF0dUUrOVYwTVdhaUIxMEJxRFgyL2d6TkZMU3VMVWc4NnV6RE90aFhX?=
 =?utf-8?B?TFUyQWxMcFVmOEYrNDVjK09XdXY3UmVJTlhEaHVOcWE1eXEzQkp4WlE5RXFn?=
 =?utf-8?B?Q2R4dzdTNVZUMEp1SWdCVktyU1NMV0swclhEN0d0eDdweVFEOEtYN1V1RlFM?=
 =?utf-8?B?bkRTbjJwblFhc24ySFVQcDRVVFVZR0pycWEwSzZ1cDU4WkxsTld3N25SdjZx?=
 =?utf-8?B?UFVhZlpkQ3JaemhmVjd6TGVkamptQzhqNXpEWmpUbW9YSjlVRmhZdjRjTHMv?=
 =?utf-8?B?U3RzZGRYb3dkZXZaTGhtYzRobXExRE9PaFNZUHlraWE0QWFTSDQwMGd2TEVV?=
 =?utf-8?B?OHQvUFVka1FTNitvcG9wNUI5MnBhbkNqbzlCeU1ubmhEdWx0a2hqYUEwL0p0?=
 =?utf-8?B?YS9kdzREU0t2azNTTDcrRmpEb2NDRSsvTDBUb1lqRFpmU1hBNFFUaWN0RWpi?=
 =?utf-8?B?QVdFYzRRSmxxYTFvMXNoelAxZ3ZRbmRNdzJ2dnhHemRXR09OOTFqM2l3L1lO?=
 =?utf-8?B?VnpsekhpbWN5RGxSZ0E2VFhYdXJxYjN2UHdmZlpFUm5wNm1ReVlzS2Y3eVdw?=
 =?utf-8?B?TGJJY2VLQ1grUHpCVlhIYm8yQS9MUzU3OFNVeHBiNXlyWFRteTdERlJ4ZGVs?=
 =?utf-8?B?RllwV25hZFVxN0d0SGdRWTRjemhsUEx2aDF3eXdETHNXd1NLanV1Q05vMTlj?=
 =?utf-8?B?OWxUSEdaeEpzV1ZIdzVBMFZ3dzlVMmltWitWNjFadkdNWFBiWFhPNHRzRXRV?=
 =?utf-8?B?eDNlTmJxek05SlRTcm9EWlZVaDhONUVoRjZSbENqd1ZJalBLOXNFODNtY042?=
 =?utf-8?B?VDZmSklXVVFKK1ZnY2FZMU9tVnFwM2k5WXExbDdsRHU1Ujd0RGljeXoxQ0Y5?=
 =?utf-8?B?akl6Slg1b3VJeSs2THhzbWZWNGhUZnBFT3E2eEpiV0VaOGxWRUdwMTROblZF?=
 =?utf-8?B?L2lPd2xwbHR5RUU0Z04zTHF0T1pReXdia3RNa25hTmZreHgrU2NNVFFLWGZv?=
 =?utf-8?B?eFBuWFJLZEhEYVBvWExkNDNpQ09WUUFsZHdjdFkyRkxjNXJYTDI4M2lNanA1?=
 =?utf-8?B?NG9iTGVYaHdMVmIyekk5MW1hd3hscThZVlBQOVk2SmFXS1YrNjJRa2dLSjlJ?=
 =?utf-8?B?ZVFqalVnZ09UZEpjWm5IUnNISk1mQUNjSG1tNjdVQWZVc1lBZUEyR0dOcW1P?=
 =?utf-8?B?ZFR0aXZXNTFyLzgzakNLaGgvdUJIU2xsL3RnS0kxRmxnaGFyOHU4UmFEZ0k4?=
 =?utf-8?B?SVM4WmtuclgxNzhPWFpIRlA4d3hRS2lpVHkxVURDd1hxTTV2SGNIN0dRNEs4?=
 =?utf-8?B?cmV0QXFZSDF0a3BtRWhhei9RR05SYUUrOExYekVpYU1Mdk1oaGJvRlhtNW8z?=
 =?utf-8?Q?DgQXHXxQA4BybbSxGZOybNusRARYMIaIp0Ficbj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf9cfd1-1d46-4f12-182e-08d8e23b8d8f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:07:48.0637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/RSL9K2EDq523Z9uQ6/620mQfP0LkMAdoiCi0mM6iJ2zddk/ARozrwfzYrKO/pXb+Ih0F4NaTv0G6I4yE3F7cbypwpD3VDAyWN7DXdV9CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3446
Content-Type: multipart/alternative;
 boundary="------------0707BFC31DA5CCC961C5F88A"
Content-Language: en-US

--------------0707BFC31DA5CCC961C5F88A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-07 11:43 a.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-jsonpatch_1.28.bb => python3-jsonpatch_1.31.bb} | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.28.bb => python3-jsonpatch_1.31.bb} (52%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
> similarity index 52%
> rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
> rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
> index cef20495b..aa3dc8360 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
> @@ -5,6 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
>
>   inherit pypi setuptools3
>
> -SRC_URI[sha256sum] = "e930adc932e4d36087dbbf0f22e1ded32185dfb20662f2e3dd848677a5295a14"
> +SRC_URI[sha256sum] = "ae6f3686fc71b53a278a9fdeb91afdc0e523e2f8f8a82cb2f04af90413a8eacb"
>
> -RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-jsonpointer \
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-stringold \
> +"
> --
> 2.25.1
>
>
> 
>

--------------0707BFC31DA5CCC961C5F88A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-07 11:43 a.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210307164356.981140-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210307164356.981140-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-jsonpatch_1.28.bb =&gt; python3-jsonpatch_1.31.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.28.bb =&gt; python3-jsonpatch_1.31.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
index cef20495b..aa3dc8360 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
@@ -5,6 +5,11 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3">&quot;file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3&quot;</a>

 inherit pypi setuptools3

-SRC_URI[sha256sum] = &quot;e930adc932e4d36087dbbf0f22e1ded32185dfb20662f2e3dd848677a5295a14&quot;
+SRC_URI[sha256sum] = &quot;ae6f3686fc71b53a278a9fdeb91afdc0e523e2f8f8a82cb2f04af90413a8eacb&quot;

-RDEPENDS_${PN} += &quot;${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold&quot;
+RDEPENDS_${PN} += &quot; \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-jsonpointer \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-stringold \
+&quot;
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

--------------0707BFC31DA5CCC961C5F88A--
