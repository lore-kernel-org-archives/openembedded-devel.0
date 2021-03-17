Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.52])
 by mx.groups.io with SMTP id smtpd.web10.71.1615992759393768677
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 07:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MWPqyRoz;
 spf=pass (domain: windriver.com, ip: 40.107.243.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwxQtiDO/0K4CL7m3df+jGlcrKEpRM9DCsls+y8kaTkIfZjT+ENFMFXQfz2Jn/j5hMXH1PAzGJLFPs/QEE17CKSzcZaWEm4WI8igbMccsxKrpnD0+qB8T4nkGSYy/M0xnRgWhoNcciXbEC3bvNMXTEFLgZW6dtrKdbZ8RzBzN/Z73KP3d6UFKzL+dxKuhYv/g9LIYcL8YY0bU+RutehS++cX4I6GToDfXKnvgCeXjfHhakY5UPp/wEm7BT36YSdWutFhUvFcIrWpSEi/CZdHN0lfm/77cEHQVHaJk2MCVBMALqCMWCpicw59LK73OBJ1howCk3MhbkazzCPguXUTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPztCbdpZKE1cPQYqpYiGb7Ha25jiG3a18Wp+7S601I=;
 b=D0Hp66fPAu9UbY/Z4OA3vlUsQ6VvrbXqbVq7CdNUA9tH75cryJTTF8MRpWlOs8fPAtTEJvZru/UiYgosVg3f7c2Zcqn/m0sPxkKPMj/+lUrFa7jgl9TZOJjziXvAcOv0oSKsJCPM1h/DgBe42emJP1VtKz4dn+IVT1AAcv5iF1vWnCnxuCQIAl/UMN5jYtJwhhUf12+/c+4mtEImfHJsk/JLAqBs7m3j60XTuwNHmERC3iCXEkaPue44a1cPxUm0HW58aJzaJpg2kho6rcohUcIysxwz4zy/n2sWN6Fh1I+alC3iozlg0sXZA99T0UrAVzlToSE37nSPStKSOCawZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPztCbdpZKE1cPQYqpYiGb7Ha25jiG3a18Wp+7S601I=;
 b=MWPqyRozOorKjAmgcSsu/juhc8rikPbOe5DvECSB1aZsnttbhGH7xg9E+htGgE49b68O0UAyra9NnrUO/WfxzdE9VN0NOO953iBkLiHl7sN298WOgYFdUw+3BkgSgyR3fftLTiR8Bptq8a7g7VdWqRJXrIyeGz6IMFFR69jO8LM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2840.namprd11.prod.outlook.com (2603:10b6:a02:c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:52:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:52:38 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-jsonpointer: Upgrade 2.0 -> 2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
 <20210315084727.26812-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f3ce82c1-31e0-26d5-1e05-d7df0c909cb4@windriver.com>
Date: Wed, 17 Mar 2021 10:52:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210315084727.26812-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:404:11::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR13CA0059.namprd13.prod.outlook.com (2603:10b6:404:11::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend Transport; Wed, 17 Mar 2021 14:52:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 448c972d-f54e-4a86-ad21-08d8e9544e81
X-MS-TrafficTypeDiagnostic: BYAPR11MB2840:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB28402201D7F5A5DA8CF7869C9F6A9@BYAPR11MB2840.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	asijXksWPEYErkuAxUAiyudT9/PfPP36rvvbXuLdY45Fb9zs4wXOy0MweMmoN13jqbMISEjDd16LtpDI0eMei1DTlw/TI/pKMhMCPBsiQP1rQVs8tOjjkC5l6dYNM+RWj3ZAmdudr0hM8vRwoSEK4Vb0Kl51ijfSKUd20upTOD7x8l3EwcVRyIBqRqCSy3cK9C5O/s/xX0yNn8BxbdnIGW9pvbNKdfcmDD6YpjUqLWHVeN5Y/Q8nVrbKCCPk6OECFJjhnrR10XczUVsv570swH6DoKR92JQNbJWI6xs6OCLKgGYK5i9+LbtA9Qa3IUCLhq6oXNmrQrfHNbVIMn7i6IpC0Ohba6/xDnZZOeREAgOQ/yoJLtyOnhH/kbvHnq426tBpNKCAv0AyskvRSiaHGU9hqKwHyMvZLRzusVvGQ4O0swAq7nxPsbyuJIt3aSL3I9pJfSfeFXRc1S2GLymqAAAvu2Fj192OBTwnsz5jtomqDNYM4Kddk1vjiQF9J9Ag6dHVbKpiSdrJ6mBoXC+oxcEFzCAp2gzgIzSU+vsxzak9k4jFA2vzPKTtCLKR8dnOuXcp6aq2Xuj1B2g3DkTU8oMIC7KwNySAGK3UYH2SZ9oPIYhYrXNqRic684sjEsz0kC70qFlaIXDK9LBFyUBidNclgGh5qIaiywmxPixmCP3bizopycMH63BFITRyPBkCUVUwH7hAgI3MwGivTHfpdJIxXhHhe/YEODhUVJGScJI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(366004)(16576012)(36756003)(956004)(53546011)(186003)(83380400001)(33964004)(5660300002)(8676002)(31686004)(66946007)(2616005)(478600001)(2906002)(66476007)(44832011)(8936002)(316002)(166002)(26005)(6486002)(16526019)(66556008)(86362001)(31696002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eEUxRXMzN3laVFczTXlKVUZYM2ZOL1YydXhHODBhdHpTQ3Byb2cvKy9peFlL?=
 =?utf-8?B?Y1Q0Rm50NXhSZEVpTVloUldvdEt3Rk9EUldWZllCdWdOajZ6eDZFOENRR1ky?=
 =?utf-8?B?cGtBVzZpU2hZQjNSUUloei9iV2lXOEdhbGhvNzlHOFRKNXpzMGhQdUNpcERL?=
 =?utf-8?B?RytmaFpMNGR0L01OT2QxaTdONmFYQkRMNEVLZGlMd1NUSG5Ma1VoZzgzbXhY?=
 =?utf-8?B?Y3ZIeVlYNkFqSWJIWnNFNENMWVYzS3pKODEzK3hsN0h6V1NwVG91UlZXVFNB?=
 =?utf-8?B?ZHNHeHZLN2l2dXJ5ZXByQU5rMWJ4Wk9lQzVpSERSdXFxc1dQZ05sMlVWRUJV?=
 =?utf-8?B?L1lsN2E3R2c4UzNkWGRhc29JVnJiUnRMNVhGZGJ0dWs2VGg5QXcvNnY2TDNq?=
 =?utf-8?B?QXdaZEs5bmV1ZjVSSktMVWF2Z3RXY2gyekFpMEhXWU9qT250Z3RXenVZbnJE?=
 =?utf-8?B?VlloL3hPTXQvYVV4MkJleTF0WGVkTFRqMlhEMlN5dDYrQ0gwODJhOWtqOExO?=
 =?utf-8?B?TkxpdmNsRWZZS0p3dzNyNEVIS01GdEp5YitnbXdWclB5a1NsTUJiOE90OG1L?=
 =?utf-8?B?VzNTSllUajhJZDAwUElQbzNnUVgzVTg4b3RYKzBhL1lQSEFRMkxhUnhwT0tP?=
 =?utf-8?B?NVhLVlp3VUVZNUVhbWtzVlN0OXBSS2FLMmt6dE92WGhhcCtWZDlUd0hHYy9j?=
 =?utf-8?B?RDI1V2VWUzFGRndPdWR0T0NZUXBnN2hadzhZNzlzK1hzT25ncXNwb0JlRTFK?=
 =?utf-8?B?bnZ0T1ZobnNQZTlvS2pqUnhtTndhYm45TzQyNmllTVFjbmJPQzlKS0I4emda?=
 =?utf-8?B?V2xaZ0htTnNFQU92SUorK1hSS0xFTXZTQkxPQzExZW82M3lRb1VBZUtRVW9j?=
 =?utf-8?B?T05zV1N1UXpRbzNvdjhkN0dLYzlHMXdqK1p6RllCaU1SMDlRL3ZZdXF4bkVF?=
 =?utf-8?B?TUh2THRiTUFtb09FRzZjaG9iNjZ3NVFsN04rOXdPdlhGWjI3aDhmaVZla3NJ?=
 =?utf-8?B?N1g0SDVyYnlMNlVQWWZQMGdIUXRZYThLVnJpOExZRXlLL25KMyttOTMvelhx?=
 =?utf-8?B?Z1dJdmNGczhtTzZ2d1pKb2hrYm9MTWdUSkQ0VFdvL1hPa1N5aTB5eVJzN2NU?=
 =?utf-8?B?d0tScXN4eGZlKzNHQmpwZ3hmNmhNYXY4aEJCYlQvMHE4VDg5N2pQU2pNcjNP?=
 =?utf-8?B?ODg5SEZIK04xS3pFSUlnVmtscitVZXRJNU5CWG5GOTZnNFA3RlpZMEdmYU5G?=
 =?utf-8?B?aVRxTlkxL21ZdUE1alNnNmx0SmJzNkIzWGRwK0M3OEowUlR5MkdYVUVOQTRu?=
 =?utf-8?B?amFjWG05cGw2YjRJbDFFUkJHakluOUs4MnpmWDRac2UyR0tjOSthc1dCWXNa?=
 =?utf-8?B?NUFTZ0ZvUjgyUEtrcXNYMUFBUlVYR3hDcVluSzFrTzE5dmMzNE51ZGFKZ0Ir?=
 =?utf-8?B?aDJZYkx3M1MvRUMya1ZVa1hBN3lYVkFQaWxja0w2eWdEb2t3NmduelFGWWdD?=
 =?utf-8?B?bGl2WjBublRwYUpHRzc4QU4xb24yQ3cwZHpRUzkrdHYrbDFCTW10akJZc0Z4?=
 =?utf-8?B?OTFRZy9YS2RFWWtkT3RGNnRYVUNra01tbi9tL0ZCN0pyLzdOVENFTkhic21y?=
 =?utf-8?B?bm8xLzhTUGhSc3d0enJIeXYyYnJSUk5MNGhmRWdPQlNJUEtzTmlaRXlPRHlE?=
 =?utf-8?B?UVNucFpZZFcxOWVBWUxqd2hMbmNzTEVHRjRzd3dxYk1Za3Y0MEFEUEs3TEZR?=
 =?utf-8?Q?m6YTrXsiluFwW/B4bDq1n2lu4FAADrGZet10km5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 448c972d-f54e-4a86-ad21-08d8e9544e81
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:52:37.8520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyBgHqWZzeerky+O8fOxITQvAasUW5Ac/TdW/DFIRYgrpo2vC9XpGS98F1qOWXmvjFycYK2oEUbNPNISIw/J1S+98SW5blZ2eF6YV5Yh22o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2840
Content-Type: multipart/alternative;
 boundary="------------6A67815D6A874F33673750F4"
Content-Language: en-US

--------------6A67815D6A874F33673750F4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-15 4:47 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.1:
>
> - Support Python 3.8 and 3.9
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-jsonpointer_2.0.bb => python3-jsonpointer_2.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-jsonpointer_2.0.bb => python3-jsonpointer_2.1.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb b/meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
> rename to meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb
> index 68bfe9716..a4cc05c94 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
>
>   inherit pypi ptest setuptools3
>
> -SRC_URI[md5sum] = "741b98d0e693b08b5e44e0a9da5a7bb7"
> -SRC_URI[sha256sum] = "c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362"
> +SRC_URI[sha256sum] = "5a34b698db1eb79ceac454159d3f7c12a451a91f6334a4f638454327b7a89962"
>
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-json \
> --
> 2.17.1
>
>
> 
>

--------------6A67815D6A874F33673750F4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-15 4:47 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210315084727.26812-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.1:

- Support Python 3.8 and 3.9

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210315084727.26812-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-jsonpointer_2.0.bb =&gt; python3-jsonpointer_2.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpointer_2.0.bb =&gt; python3-jsonpointer_2.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb b/meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
rename to meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb
index 68bfe9716..a4cc05c94 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3">&quot;file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3&quot;</a>

 inherit pypi ptest setuptools3

-SRC_URI[md5sum] = &quot;741b98d0e693b08b5e44e0a9da5a7bb7&quot;
-SRC_URI[sha256sum] = &quot;c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362&quot;
+SRC_URI[sha256sum] = &quot;5a34b698db1eb79ceac454159d3f7c12a451a91f6334a4f638454327b7a89962&quot;

 RDEPENDS_${PN} += &quot; \
     ${PYTHON_PN}-json \
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

--------------6A67815D6A874F33673750F4--
