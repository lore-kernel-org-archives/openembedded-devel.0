Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.46])
 by mx.groups.io with SMTP id smtpd.web09.11320.1610467785171869187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:09:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YenPDNqr;
 spf=pass (domain: windriver.com, ip: 40.107.243.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFINP5Y5T1WrQ6o5KocfFDsJbKeWI86+vniKWN0q+2MuUcKreM5Sx1C6BzKJ9WxWVDApQWFkp0FfQiJ+kM6zVvlFv1h5HgOKJkpcUsd0f8YhUCytbR+uQXVI/+w0UnyyLbQ/02xM40zNe8Lqbwfa6/OlLJ2N+/uWm4sWcpzbjNbRzXUW9B1bL20GLDvh7d4wGaMOG3xugpxNXeiUoEnF6gVUO/r8d210g+IRBphKo7ytuzFNEVh2Nx8N+g/eNmlZjy0xBG0DhiN0FukJ88iMcXbrsas8jKfwLN8bVCpzGK7S7quSIUXBvYpxdX0WbMlYbASEFp1/rLMK/n43piE2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hafMtaALrbJNdCCbWNhi3uwi0cdQebujAcUrA3HvEYw=;
 b=K3Q7y56tTrWFYwi/SeY8dTcXA+OfEu3BfrBveRz+JlM7ia46GVyqCZt295FACChvG2TvorjI37VmS9m3UeX5zc6Atzq7IH8uw4RMrqJ5ZrGus9zEb3dQnrW0QXRlPNVVa8cWPS70YVdFPXbyMpRJWpdYaZdYjkH+GlP1taHDOUd4lpNTNgOKqR/4xEuL2ylJGxp63d84BLn+i+zCeXaFVKf/c1R3JjUjOXfrpdlTtm6GCUZXB1TtfpHAXp3r5Wj9gI3ifzQVgFpWpKG1cLtfuDO3tBPpj4P3IrKdx45ElyCln++G5UjrOmiFRcB9MzAZgz+ke2WscQCXGJYuV/axrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hafMtaALrbJNdCCbWNhi3uwi0cdQebujAcUrA3HvEYw=;
 b=YenPDNqrSxUgN1rgWADBqgemWOiD1caLhPLQxymKzR3K0os+vH8ohFmY+Zv2n39InSH9bnV4znJ9VgMLM8PbBr3DDEeRw8MSZcqQdaodEjeiJC6inQhe2SozhPuWLd9n/BoaySLQ4ZS93/TMxqPzbwDIpjHraNv3gJz6ng95lbs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 16:09:44 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:09:44 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pymisp: Upgrade 2.4.133 -> 2.4.135.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210108102814.9560-1-leon.anavi@konsulko.com>
 <20210108102814.9560-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4b2b5283-7b8e-e29a-6586-03f08478a03d@windriver.com>
Date: Tue, 12 Jan 2021 11:09:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210108102814.9560-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:208:23a::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR03CA0012.namprd03.prod.outlook.com (2603:10b6:208:23a::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 16:09:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa3a1873-e0e2-49a6-b9d7-08d8b71479a2
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2807A854373C65F10636BBF69FAA0@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vOELHfoouNIyQwmT4ZMdV3pdgcaMqb2xmtjFk3ghERNUJuBfHDtv5fKGWra3sRhrzKNEK0StMwShEq4g3hRurqXkkexc80hsUKBwfCH2znzoN//Y4FbEk49YHPRYO7W0g+pcGVUlN6BZE/iBHcMXdCpqcJqG/I6CzoM6FJMrbtN0pPM0DjaRrdPIfmDhTV2vdWLQG8o/KnTNqY+Saoo3BY/jArlzEiGbYDtOfEQk2bExk415Vj8AFzIobJCUZPGv3K8MTse46zJeR9Ff+SFZuEpSSGNQsc3jb0il2WFWsYTo4kYmJf39o1QNOVYTh+eJkuxKV2X6/W6h3JYybiV7OIGP31Uq+s7Moy5E+ZrmP2nQaVw3MZdcSEfcJDcy5LwDIOijupE3ckx+GKGhkm67piVjOlZ9P7RX4Zsp+gKVJn4XfA+TOVUJIdbYXin+6T3FtSGqcs51EVt963ILgYxAmKVpTuyvQ60winiogpAqpE1KA5u7gWlvoC1OHgXHhw7B6MPigPkIUT9WTitst4Rw80wH100hgJHtg63K5FJBZ3mBq5937LGlmkuw6nu254iV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39840400004)(396003)(376002)(366004)(86362001)(31696002)(166002)(26005)(31686004)(5660300002)(44832011)(36756003)(53546011)(66476007)(478600001)(33964004)(16526019)(66946007)(83380400001)(6486002)(66556008)(16576012)(316002)(966005)(8676002)(2616005)(8936002)(2906002)(52116002)(956004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NDJzbXlKeUFBekszMWY4V01ON1l3NTlyMmVGMGNPOHo1dFNkZndyRkFxcWNh?=
 =?utf-8?B?dWpwWXNlc1g5WVFHTmtFaEZSb3krd2U4Y0VtaVJpYy9FR2FaSnQ0U29yTUlR?=
 =?utf-8?B?dGc5bkFndmt4QkJzTzZzcno2Z3llczFXQnNGQ2RPVCtzSnRDYnptZU5OWnNR?=
 =?utf-8?B?emZSU3VaWnAzSDMwUVFnZ1llUjVkTUMyckpueGJkbDB5b2UySEZ5YmdCT0o1?=
 =?utf-8?B?T3k5b0U0aVNLZ2VxYUsvTkJhZEJPMytFZmkrM2h2cWpXMDhML1JKUlUvSmRi?=
 =?utf-8?B?VkZuVnB6NXJzWURCeW55NjE0MEIrV290QUluVHdRcFVFZXZTL1RzMUtkc0hE?=
 =?utf-8?B?Z0NZNXgwUHJibW1ZQTZMQURJbXh0LzVlRVlHeG5uM25kZHFYRkhSTklMYkp6?=
 =?utf-8?B?RDMzbU1FeHFvdE5lWUErbWEvY2gxTFlMWC9hQ2NhSVdNQkNqYTJITnNFM2Vi?=
 =?utf-8?B?TitkV2tIcXdua001ZDlOclh1Q1R5LzhTQnZNL0VFeEI3amswWDZYTmUyb25O?=
 =?utf-8?B?VzVpM3plVDJzdTkzbHllOTBEK3dFVzdBeDRPeU9hcVVIOE5xTTNhaFFnRmgw?=
 =?utf-8?B?dHdyK2pRWVVaYkhVYjgzTVdHaW9OTGtxUFNFeCs4alI1ZW9RaVIvVnJhUUtW?=
 =?utf-8?B?RHkvZlBrTkYzQWNUUDUwb2lzaDFWempGeWM1VlhjSzBMQ1pwZ3ZqQ3l2eVBl?=
 =?utf-8?B?R2tBenlodXFtOGY4RGFiNXVvRisrM2FVNE0wMDlod09FengxOHduUEdtcm9n?=
 =?utf-8?B?Y2Y1UnhVMTFZL3Vnc3dFUGxwUjJSRVdwdEJ2dWhIMm9PWWxBRzRiSzJMdHRn?=
 =?utf-8?B?T3c4TXFqMmxKUnB3akJJaHhCd0IvQWJWcDRrWlFVY3M0NGYwVEp4STZDcEdH?=
 =?utf-8?B?SVE5MVFYZGtGczZMamZPaWdRZE1JUUNJZnVOb2xSaTl1TFVSWVN4bEZqTFJm?=
 =?utf-8?B?QlZVeUlTYnpDR0ZSN3dGMFVHY2lYTi80WWpPNFEzVUZ1bnFmbzluUFA5RTBK?=
 =?utf-8?B?KzhtemdZMkI1Tm13b2JlVWtCby9LMFpmQ0ZtMUkzV2hVMk11WDIyaWw2VEtM?=
 =?utf-8?B?REFyeHhXeG1HSkFDVTVZMlhTUk8xcHpuem1yTlRwS00wdDdIZUJBemcxZEJF?=
 =?utf-8?B?Z0x6b3EyTTVrVFFyYjlHZFhQUlV4a3d3ZE43V2NtZ2N6VjZrcGpyVEk0bVJE?=
 =?utf-8?B?OElQWmsvU2wyZko5dTVkWDlNZ1NQNUhPVitRUjZVVmpkc1hlWG5mRDRpYXV4?=
 =?utf-8?B?UlZmM2pReVYraGFRSzRBeUVDOE1OWmlzZDJlUmQxZjFjK0g4d1I4ZC9obVhF?=
 =?utf-8?Q?5LJmXjXzhea1Z8E4zyRXvVWTtPcMQebn4F?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:09:43.9702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3a1873-e0e2-49a6-b9d7-08d8b71479a2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lj/JvdvE4mMBToH8NIqJASoK/+JOtMepQ5zRQs/x35984wkjnyUAiv4JCljGG76oulAMLHPjNbvlpWBxhlaRei8rTNigMLxdjbgTFqWKkRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------2E3C5E95523773B5D9851A37"
Content-Language: en-US

--------------2E3C5E95523773B5D9851A37
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-08 5:28 a.m., Leon Anavi wrote:
> - Bump version.
> - Improve typing.
> - Improve add_attribute with a list.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymisp_2.4.133.bb => python3-pymisp_2.4.135.3.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.133.bb => python3-pymisp_2.4.135.3.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
> rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
> index 28a24fed5..bbfc0459d 100644
> --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
>   
> -SRC_URI[md5sum] = "00e258da18f59845687f58389a2e8e12"
> -SRC_URI[sha256sum] = "4a2a8a4da78c6321550522d5cf1575c095773d0867c0a4f5157a658f6e1994d5"
> +SRC_URI[sha256sum] = "f0bbdd77358223ba75c9cc40f192c7a2a7a5838bdd08b28381f71d220151ea8a"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------2E3C5E95523773B5D9851A37
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-08 5:28 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210108102814.9560-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Bump version.
- Improve typing.
- Improve add_attribute with a list.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210108102814.9560-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymisp_2.4.133.bb =&gt; python3-pymisp_2.4.135.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.133.bb =&gt; python3-pymisp_2.4.135.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
index 28a24fed5..bbfc0459d 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MISP/PyMISP">&quot;https://github.com/MISP/PyMISP&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20">&quot;file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20&quot;</a>
 
-SRC_URI[md5sum] = &quot;00e258da18f59845687f58389a2e8e12&quot;
-SRC_URI[sha256sum] = &quot;4a2a8a4da78c6321550522d5cf1575c095773d0867c0a4f5157a658f6e1994d5&quot;
+SRC_URI[sha256sum] = &quot;f0bbdd77358223ba75c9cc40f192c7a2a7a5838bdd08b28381f71d220151ea8a&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------2E3C5E95523773B5D9851A37--
