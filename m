Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.67])
 by mx.groups.io with SMTP id smtpd.web10.1839.1610121744590279427
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OmLr5gTd;
 spf=pass (domain: windriver.com, ip: 40.107.243.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9rKVAvmBa3F9yxMMmzB79bJfQyhl8asEw96yCRJ12ubefaoqGFoWwbFUDv078tujV8tX0/BXKQhE0Jn9c6zAQ4Xa2hrDjpn6v8TNBzvgt0Zu0jjlbra8uHTXcLzbGw2F6F5ImaT3j33kP42+V3+2UgHnuvDdFF5ZW0v2bzlVuxI7y+ZgT2yJ11wGvTCKmjxM9sQ/jYC8sExeAdvPjxHP8VwF1EDhTSyuMEwwlREyydjj+D/kvC1cGLdvN08Bxx3N+Zhc1bAPu5XVH1Lj2if2sP6rgxz6HE0z9K0hHisofTtnWL/T6h3LDbLNHCApT1cfyZvRrMPyAxWYey8MsrtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4f3uvek2+ADz9eve6DzZenJwXrftFbxajS4p4lj4WvY=;
 b=Sk/rQp5zi0WKjrNuNnW5xdl2wcWE/RWzDXrsuag2cx1NLgKiZtmYNczOOw0x+iKOMFG3rg7ONRRaSNirS36F8TmCE1vtaS8td6JCvXxBqD/xl+lEuFlavCYOnM+9E214OREtsUlWf3W9omoe0Qk4RvtZvktSNU3A8S4v71p6KZ5ab2ZgMplmqLnw3/p8Phrr5GQK6PrcOWcWMDhjFrrROvKAK1+0hLp57xD4LmRLnuJC7cMOmYSIodgt+MYdqaoTJkATc/gfznOCJ26g/nCOEZKm3s36hOiK9ot35kX8rRvOaA6n7gYaTIKDtOsRAehKqYkNDNsVA9UzBm7Ebp8s5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4f3uvek2+ADz9eve6DzZenJwXrftFbxajS4p4lj4WvY=;
 b=OmLr5gTdrE2DE9zLLnyl6qGqZ+CTcfefNY3GKXUA0FxTlVXK8X0mtSmlzfEIM/gtNS7SjGmssMIWmucIEBjBcESMxTKB31x80K94ZbyUvH39YMESg+0gLql3WyHP3MiCH9TY54PX2Rgm0sCo63aTFbA0/QZvcfOWZKNRIcGWwzU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:02:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:02:23 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-jsonpatch: Upgrade 1.26 -> 1.28
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ac54e6be-b230-827f-299e-a45e71ae1e69@windriver.com>
Date: Fri, 8 Jan 2021 11:02:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210105151638.15700-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:208:236::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0050.namprd05.prod.outlook.com (2603:10b6:208:236::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Fri, 8 Jan 2021 16:02:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 766473f8-3f74-4a7e-898d-08d8b3eec96b
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48968C4B4CFC2FD781C2DC789FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y4VNlOlQKpkZXIEseQkGtqAX4zNPl2G3mvUUfhooBMdJA22i7RWabZOuXlua7zclxjJeR6+l/FECFXnb8vrkizR5yB2CELLFiDX0acLDx1KTKCyvutteIt7CFZzj4rrTrbUfqEdlD9BKfQQIbZ5pKRARZZj+HltDXp9lr3H7alF7kTaShkOUxC5mzADQFmrovh3btGIvtIuTqBCDQDhOC0pi2pajiTW7T4I3QRULNHMzFemRnOfxlSV4szSRg0fnPQSbfXRuHuaFc1CXo5YN8VhtsC8yRdBvSzwJ2rN/6pEWhypyCv3J/03V2T3FfEFhnkHYWggHGJt/qhXiMKTxDleG5WmpLtJx+1dOdPI8qyy6IXkWU12yDE5aMjG7gjAT/9xB1PDTYhSu7rzYshlB7lNGmK8lKFDLMu0Dp+b7U7ILRgDdo9H1XTI0huUTaPYWnmx8/aiWA6Df+8KgT3hWI4vNoat4IgbyuNvZ1ZAxzktJ0d+HFUV0/b0587fznn6X7Wx7aZYKDZaysQ4x8YkxmlIUEc5qF1gWNDmIVaCs0Zz0Arf3sP8d3PaJ/o2yDHFu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?alBTTWl1cHhSWkw4TUdGYmdtZk0rOHFRU3N3WjFUUVhURlpyZDFRS25tcm9r?=
 =?utf-8?B?T21qNzNQM2VWSkJJeEY4MGF6ekVQZFh3djU3dVNsY2h0VzQ2eDRZZFFlL2pJ?=
 =?utf-8?B?NFBJMXhuNFhZeEsrdC9vTGRFWkd4ZnJ5b1J4YjJzekFoV0xQTWRRbXdyQTdK?=
 =?utf-8?B?T2hmZzNzcDFtT1dMd1RKaXU4MjNWT0k5dHp2Ni9VejNuUS9kNmlJK2JXYzZ6?=
 =?utf-8?B?Y1Y5cWtFdUJqckJXV2hHOEM1cVZlQ0FIVWpTcmtCd1lHbXdwb2RjV1dSZ1BW?=
 =?utf-8?B?YytvazJCcjhJRXFyWHRUWC9aeFhEeXczcERWRUVNelZ2QXBrWktGYmttM2tu?=
 =?utf-8?B?Q3h0V29QRjJxQnd4QkZHZU9VcDV1OWlTUldnNWc1S2orUFErTUJtenZmbVF0?=
 =?utf-8?B?K01YQS9JK0s1WHZpVHVOOXV4Y04wRlJOV1NTMklnc0NvR05ZWUc0R0ZzUWM0?=
 =?utf-8?B?b2ZzdlJOcWYySU9oT1NjTUIrYXE1V2dxSis4ck5SNnduLzNVM0JHWnFtTUFD?=
 =?utf-8?B?ZDRiUnJBWTIva2MvZDEzcW1GRWtEOVlHeThIbzJFK1dVczV3dS8vSFlvN25T?=
 =?utf-8?B?aFF5MFVZYW1abjQwK1JBSEFLUk5GTVFmcWp4bkJxemV3T1MzKzNUbVNwVWZN?=
 =?utf-8?B?dVRCV2NzMEROVGt5dVFvM3FMd0Z0WEpMemdHRXRiaElUUU9Rd2p2VEhYeUNy?=
 =?utf-8?B?ZlVicFE0b1ZMMWptY2FPd0VUczY4OVA4MTFSQk8wWXYwZUhWdWhhZ1EwRTJQ?=
 =?utf-8?B?cUhLNTc5TWF6TUt2MnJwK0dtVFd2cXB5TFNQQ2h6bkVRb2k4cmZuSjltanQ1?=
 =?utf-8?B?Mkw2YUV2YjZnZFdaQU5XMkdWdHdmR3hWWnVKbTdtMTJxY2szbmFHUlRPK1Zi?=
 =?utf-8?B?WGdoVHkzKzZKQkFhS1BVYzlUaXBQSnd6ZWR4UEg1K2ZIdmRrT3I5a2ZLblpQ?=
 =?utf-8?B?Sm1ESW9oekN5WUkrUnZDa05jWGs3Qk9OWm9GdHJacnppRnloRW9zUVVjbElp?=
 =?utf-8?B?Um5aOXd6anhnMTZHMGg2MzNXRDA3WjBtcXhYUlE0K292ZWFlRmZHSngxWm8r?=
 =?utf-8?B?WllxODJZSXAyMmNacFNLZDFyWWNMQW9mMkMwd2JOdmRXKzBNWGJsYXFJSUVT?=
 =?utf-8?B?czFzUW5PZ0dHSnN5cnpoSlo3ZHNrUHBwcTFMS2tTWGVCcHdjNFc4enZDa0lR?=
 =?utf-8?B?QnB4NndXU1lIZSt6TDdPb3VKOVZrUHdMaU9lMG9LMmNtcHNtOUlpVFRPQ1Bw?=
 =?utf-8?B?RkhtRFRKTEF3QXJKWW1qcHNpeDk5MlR3SXBUUWxHRlhyd3A2ajl0WERBY3J3?=
 =?utf-8?Q?uq+1rNAjCRkzDeHRY2ftlZks0NAAJZRLqk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:02:23.4752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 766473f8-3f74-4a7e-898d-08d8b3eec96b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jC1o6u+sgWyZxqHAYEkK2s9XczxQDQhcJ/k4IhCpGpgsiga146RrIeAeTu4xjqakjFGxujnDbeLWrigqdjcgWq510Z0cebuAUOLIQ20UeJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------1F9853A6CD65283BE4C8C248"
Content-Language: en-US

--------------1F9853A6CD65283BE4C8C248
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-05 10:16 a.m., Leon Anavi wrote:
> - Declare json-patch operations as a class-based attribute
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-jsonpatch_1.26.bb => python3-jsonpatch_1.28.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.26.bb => python3-jsonpatch_1.28.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
> rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
> index b1217cfac1..cef20495b6 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "3aa7e75ad472c51a6de0123137dbfdf2"
> -SRC_URI[sha256sum] = "e45df18b0ab7df1925f20671bbc3f6bd0b4b556fb4b9c5d97684b0a7eac01744"
> +SRC_URI[sha256sum] = "e930adc932e4d36087dbbf0f22e1ded32185dfb20662f2e3dd848677a5295a14"
>   
>   RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
>
> 
>

--------------1F9853A6CD65283BE4C8C248
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-05 10:16 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210105151638.15700-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Declare json-patch operations as a class-based attribute

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210105151638.15700-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-jsonpatch_1.26.bb =&gt; python3-jsonpatch_1.28.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.26.bb =&gt; python3-jsonpatch_1.28.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
index b1217cfac1..cef20495b6 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3">&quot;file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;3aa7e75ad472c51a6de0123137dbfdf2&quot;
-SRC_URI[sha256sum] = &quot;e45df18b0ab7df1925f20671bbc3f6bd0b4b556fb4b9c5d97684b0a7eac01744&quot;
+SRC_URI[sha256sum] = &quot;e930adc932e4d36087dbbf0f22e1ded32185dfb20662f2e3dd848677a5295a14&quot;
 
 RDEPENDS_${PN} += &quot;${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1F9853A6CD65283BE4C8C248--
