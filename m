Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.53])
 by mx.groups.io with SMTP id smtpd.web12.8302.1612533888635231743
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:04:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=c+OWWpub;
 spf=pass (domain: windriver.com, ip: 40.107.75.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdIoKPBugsl6l86jc6kQVoWDFtkMAxWZl551K0eDLlqCmzlgLc1Ko3ndEUwb9Ux7P/vo9H2nUuPCotVeoRR4Ei2VE7VXBRcWGI7Mwob1QsbpoJxRB7CJrnMZ/oUAVWJ063jaOT6vpoyOiZ7+DbGyIvrSZhM9g6uPD0Fw/WhRLoc79GV5UNUUjPaFPtmyGLEH2DRuU8VrWJht467PoE97BuhGi2Dx4QAToNd5JaRIpR0cD/SyV1meqxhf+9qRXQjX5to0jakB1j3CwRr78JKq3kL2sd4dFdVRSMZpx9DQKjZ6qtSL391BpkHt+Qk23Mc50jf3zn7cScPQzdnCea7h5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLUh8xpbonxypOgJ8J8mahdVUIh7m2t4bwEp5EdWB2c=;
 b=A01RsZtdYVInMI3PmZ84ZnnixV6JSpya/2RGJNLwLR6xpNPUhgfDkJ1QEz15JrBq/C0DE2RuoB2Qf5dV5z2HNK0u9qspGBHCatdMYHYXgAMo+qqpJnzWJC983veakdbfgIZbZcROTJ9ZCRN6NVkiyeAhfq7vKQM+hnwXvnBq7cfRFaxpwokU99jZLDoeVkSIT9E2MvyVZkSdN0t/mcmUtVYOcyXCjrNFCpTD4M+vocTtzppyyaWjf9Stk9vEjQXJegBD4gQYqfCo+Tn/1ZKblsQs0QLNQSs4W9xxCWjBcBZGaxMj8vLcQAj4XpXMllOEGcuYu6Kk0bFd1qY23Rgj8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLUh8xpbonxypOgJ8J8mahdVUIh7m2t4bwEp5EdWB2c=;
 b=c+OWWpub6JQAtTMJEZ9upVNlDnvkkX1vhB7cDxQgr0cDmNJoeeG0CQja1MAjfy9YT7rIkSEZyvl0mtJ3AzbfxHAsM+G/FAv/SBTKbA5vCyKS7HyoIgzWgF4TWuMD9Q7brMCzLotsHO4+mAq167PUmd2MtQl8ljk0K6DwYz165Rs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (10.255.163.77) by
 SJ0PR11MB4830.namprd11.prod.outlook.com (20.182.113.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17; Fri, 5 Feb 2021 14:04:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:04:47 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-pymisp: Upgrade 2.4.137.1 -> 2.4.137.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210204131940.22585-1-leon.anavi@konsulko.com>
 <20210204131940.22585-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b6530a8e-21f0-8ef7-2100-7c844f229e43@windriver.com>
Date: Fri, 5 Feb 2021 09:04:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210204131940.22585-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0462.namprd13.prod.outlook.com
 (2603:10b6:208:2c4::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0462.namprd13.prod.outlook.com (2603:10b6:208:2c4::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 14:04:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad74c876-8995-436a-2f8b-08d8c9deff1b
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4830:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4830AB5381FCC9967E2309499FB29@SJ0PR11MB4830.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Oc6w+npqrHqBC15KBisTA8xlk/5jQrtkLK/1Fj2CXXGrqXzbRod3OGwcux2QNYkfEVtNpNSSsUUJwXjkLUSPT+65UqCsaf+EAb02zkeITOxrX3gl4UmAssYY9ki0V9xg8VyYxllTY2xO+kDp1iU713QNzk+7w/659vASuvzjmd3Qld4Z09K5qKc1nv1T6siR6ta1evhD4OIzy4vxrKzp1BcMAwkq2Tn1ZM+8AL+U7Qx4L4zLaAU+j19JjIkPmrPP1yyY+bA0qhhayO1epCOjOmNwUfObQnXVcaRaU98dWAlc3Bbv0CZpD8YEvETeUBBwSCUu1UhsWGSB7DGpkCCxYCsVLlG7F9ysxgVSGmG93j/KjY4iSyiaOFNrShtIL4suOtfhKjZWE0G+lDXFLev9rqJChrfuzwuAodoQbZtnTWOlZVWNO40ZPri8EpnH9Auh7w9GqGPHCx2asYGFwhqAZYbMyBWuz675Jjm6CpbSf6fRqwghOiozelA4J4plMf8C/OFyaLKKK9J1Rf04bd+qs9snHNL/mZuzbBlPQPRN6cxnhR1kHyw0Qhy4GL7yWp7A9H+wlepvmjglf8cjUqIU/naR7Dni00ZAsKdp/WN3MCNg5IP0qIKaFp8CnC54iQGdWpr754enrIcftPjkQhjOHyz4UMUG0I9BBT31rseNJG5I9WPxCOQmFW2BCcC7BnPT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(86362001)(6486002)(83380400001)(44832011)(8676002)(16576012)(316002)(36756003)(66946007)(53546011)(5660300002)(8936002)(478600001)(31696002)(2906002)(66476007)(166002)(66556008)(26005)(31686004)(186003)(52116002)(2616005)(33964004)(16526019)(966005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?K0RoeVl4YVRIS0Jmbm13SkF1dnhzMGZpU015OW42QlZSaXlSdEVXOW1WNDk1?=
 =?utf-8?B?eThwMDdtU3ZVMGF6T3ZUQTlmSGJMdFJac3Z2eEVkaXJMZkNJK1QycmRXRm9R?=
 =?utf-8?B?R2FWSUI0MkxuakY5NXhZelcwbjZxS0RWU1dDbHFCZjAwcmREbE9nV0VnSGNR?=
 =?utf-8?B?RWZ5QlRKaVYzRmpPNGE0UEowd0o1K0x0QU1oWDlRdVBuV2ZUTWZ2bkNwWXIw?=
 =?utf-8?B?YWNJUVlnNFFnWkhIdkIyeG5ncnhrYS9BRTB0MjNia2pZYVRQcnhBdk9PalA0?=
 =?utf-8?B?ck96NkQ4REs1K29ieW13ZkZhaWpxQmJJK3JpOUZ4bHNtMXB4SVF4WHdId3c4?=
 =?utf-8?B?TGZjdXFtR2tZWjVnaGJPeTFOcEZpWHJnVVBaY2w1TXJ4WUFBdVZMbllzRDE2?=
 =?utf-8?B?allRRUcwV2RHS2s0U2MreFd5NklONUtIUEVYNFpYazFvNVUxNWpxcVdXNmxK?=
 =?utf-8?B?bXFRUEhTdW5aNitrNXVVUmdIdWNURysrbjJGK1JDNnNGS3FsSVB6UEY5Zzcy?=
 =?utf-8?B?bllWTmd1dzF3Mis4MW5ZOXdZRnZQWEtTeGFoYitRcS92Mmxlcy9kcmFUbi9a?=
 =?utf-8?B?aUdXcWxTOFBiZWZkbzNEbVBHWkpxZk84ZGZ4T3V0WlY3bEhWV0xDeWx6Vk5G?=
 =?utf-8?B?QjVHemhXR1ZWdFlZOEYwbVNHQlRMNUJjUWtiMmRWMlIzb25YVVMxSitTRzRm?=
 =?utf-8?B?eFJhVFV0T1VKcWNRUloyNVBUcnFkVDJHZFdQdW1aTldxTWtDQ05Hb3FuQlM0?=
 =?utf-8?B?S2VSem90T0p6WFlTUTdlQUllUFZHWU1TUmZZNUY0ZDdYZjdQRzlRM3A5Yjk0?=
 =?utf-8?B?cno5cFNQdFNHSkt1NHNpZEhyUHhsVTV4ODJMalFUZjBGdmtPeWhLeklHSjVQ?=
 =?utf-8?B?amtZTGM0c0hHRTM0ZkRDc2NDbXNmZTFtZlJkbmcxeFo2cUNDSVYrQm4rYkRP?=
 =?utf-8?B?UkMrdHlMdFV5NEkvL2k3and0SlAzeHdCc0VEWlN5VUtrbGpnak0ySEo3Q044?=
 =?utf-8?B?cTN3a0tQOS9xYTZ1OHVMdEtrU2orcTU4ME04MERlcUJZNmU1OGlpRTlnc203?=
 =?utf-8?B?aWdSL0pLUE9NNDFCcGRDc2pVaVQzNnd3VUFKVFF3WkRveUE2ODEzcDNFbThx?=
 =?utf-8?B?SnFVRDJ0U0NkUXdPOXEyRkZYRjhVWldUUmJjZW5Uc08vSUFFUzZaY0wxVTBm?=
 =?utf-8?B?Y3JkaGErZFBVSGZVMmNBdnpTQnZTdm1ZK2ljbTV3UDVqV1FpT252OGNDcTBw?=
 =?utf-8?B?Wjg0eXZXSDhabU9jQnBBektid3QzSG15TjJhb3NseEhIb0xNMW9kalhSYnNC?=
 =?utf-8?B?S2NUYTZVTlNpbmJJRzEzejRIWlpVRW5ka1JiU1JZR2xXYjlkRkRtMExYNml5?=
 =?utf-8?B?TkZlTTNBemZFYVRGMzlGUjNEQnRtanI1Wnl4RWt5WlhPWnRlSU44bzRxWkli?=
 =?utf-8?B?YldKTmFZOVV5VEJXNk5ZNy82OWxCeGJHQlVsRkFYazN0ZEhuelc2a0RrZGV5?=
 =?utf-8?B?SFBRZlk5ZDRoSFVpSUV0dFRUOGtnYThSR042NXBuUmVlaFhwTGJncUZxZVlh?=
 =?utf-8?B?SUh1VnpQNlRlMEJEck54dUdYQy9TTmg0cWNWUFdZVUhPd21wOHJiVVZaMmM0?=
 =?utf-8?B?UUtacUZpQUpmSVlwa0orakxwOXY0QXh2M2ozcFA3QlVJT20wODlWNm9pSUxN?=
 =?utf-8?B?RXhKbk1BVlAzWVZwT3RnY3R5WU1hN3BYcmlQYStWQXhjVXJiTEdxWk5TR2N1?=
 =?utf-8?Q?+lrBE85x6j41yX2g0xPtrqlVVLZHoP7cx88gx+T?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad74c876-8995-436a-2f8b-08d8c9deff1b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:04:47.4158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mlPVrCA7ojffQLYZrgC3K3vAYM2ej0x3/5UroHHY6oh/CqSCdCgK7liTTD0b9+ZTqbDRGjokf7MvPiCElGcfvXSwPMkqORFGcz1cEGRp7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
Content-Type: multipart/alternative;
 boundary="------------DF78A38E667E36F50AD99FFC"
Content-Language: en-US

--------------DF78A38E667E36F50AD99FFC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-04 8:19 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.4.137.3:
>
> - Bump objects
> - Fix and improve optional dependencies
> - Make brotli optional
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pymisp_2.4.137.1.bb => python3-pymisp_2.4.137.3.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.137.1.bb => python3-pymisp_2.4.137.3.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
> rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
> index 9b2efa2cd..e363729fd 100644
> --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
> @@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
>
>   SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
> -SRCREV = "7b64c1c9a4fec8ed37c1522b31ab56f30b83f0e1"
> +SRCREV = "f675e2096182532bb5870e4f773476b2d8065986"
>   S = "${WORKDIR}/git"
>
>   inherit setuptools3
> --
> 2.17.1
>
>
> 
>

--------------DF78A38E667E36F50AD99FFC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-04 8:19 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210204131940.22585-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.4.137.3:

- Bump objects
- Fix and improve optional dependencies
- Make brotli optional

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210204131940.22585-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pymisp_2.4.137.1.bb =&gt; python3-pymisp_2.4.137.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.137.1.bb =&gt; python3-pymisp_2.4.137.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
index 9b2efa2cd..e363729fd 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
@@ -4,7 +4,7 @@ LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20">&quot;file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20&quot;</a>

 SRC_URI = &quot;git://github.com/MISP/PyMISP.git;protocol=https;branch=main&quot;
-SRCREV = &quot;7b64c1c9a4fec8ed37c1522b31ab56f30b83f0e1&quot;
+SRCREV = &quot;f675e2096182532bb5870e4f773476b2d8065986&quot;
 S = &quot;${WORKDIR}/git&quot;

 inherit setuptools3
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

--------------DF78A38E667E36F50AD99FFC--
