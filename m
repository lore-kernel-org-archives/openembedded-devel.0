Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.57])
 by mx.groups.io with SMTP id smtpd.web10.5589.1599332556947942293
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Qs9rjUB7;
 spf=pass (domain: windriver.com, ip: 40.107.223.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ryspm26k+j/rUuVuwoTFE0lVD/Q90CygGT5Fp/B/rnd8N9MDovKmVi6wten9klbBUe1fgd+7oOIzscu1Xpw924A3PF4MEZ6atzzQsWnJQ31zlerLpQkrxvPQpZviv1R+0Rk1hMBzue1sgjyrtSW22eaoMdb3xsXkoyW9DWZxh9sQM4jVF3YTtfsGcvABvaoDWLlROw5C4oGuqTHr0dPrkUsMZ5ZKiXOlg6NmJG1fIto2jeoxMNdqrKqEdHiDYoDojFQnIfMAxMm0Lux4DUBpVUTIc4gKMeS+ekKH3z75jI4b7LZ4k8Lnhr4BD10XK4e6ir4+ywmt4brU0MlKNgdesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5F4FimcjSYP9egl6R77BNGheZpxCFuUr7OHnqFhdDyE=;
 b=druq7h/sRCbZW/6Z423x9fqpbW/HJ1EPm1UYv+0ul93XQfwMj2vbthM5QjqSutYk1Eqdal+qDs8kglUJyVYI8BZoiwtM9cmrYlLoqffeKGVRV0eqfX7skZIwbibb0VzRSh43HzlfB/i/Bd6z84097jWf+Y1/zrhH/NAHmv/FAr2I0tClUVZ8IzvmhyeU7uDluPcGPL5yKhE/4bi+8OVR256jLlqaRkJBVBZOu/wHN+kUvpeXvsw59Mzey5ShaguC6ULMAQBsT/tIm0JFBoS2bfZmkGikxwaZCDS+f9x279X27FnhVu9WzgDEthn8y1puJ5Ze9eUp1S/ck6awsz5guQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5F4FimcjSYP9egl6R77BNGheZpxCFuUr7OHnqFhdDyE=;
 b=Qs9rjUB7kOGv1ZrIxj7W/YiZRPoGLe2fuETmxnwli62vCIBWNgprwLtD74iMVjp70nCi6V8g8zJW2aqzMvGosnIneMJWe7t4vtGAfPXuk+qJW5v+SwQZJ1ULgEq7roPiXDyh92CXDmY9zG2aYFrwh1DHyuUqfOrNVyYQZkAwFeI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 5 Sep
 2020 19:02:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:02:35 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-nmap: Upgrade 1.4.7 -> 1.4.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
 <20200902112808.18547-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6e7f0a13-b523-a0bc-0195-a91c872717ce@windriver.com>
Date: Sat, 5 Sep 2020 15:02:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902112808.18547-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTBPR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 19:02:35 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f3ae3b4-1f14-4ce8-cb5b-08d851ce403f
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29520C8D4435078E30CA8E999F2A0@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:285;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3i5drIpSIreafRu86Uw5XN4uygoG8BlYsJeMB/PBzlM1LdNEPNpuohI0Mk320rTCuqfJ2fzBcqzOGeBTOzYTaaAxaTGX5jwpxTtAo0xe/golcrqBOKTByxBuv5sPLZw1hk1De2NNyjAsor9hgRvhfAkj/jTRh8pBKCH7kgBODZrFiVnG8K2fZW00HEHfWllMnIvHHmpSUweg43oxJnAqnSlp/fkw5KBNeMhIB31mrsUvSqQFsUrJkkfkY64Z982CEny7A3ajZw+531pAfjmxLRvOuK9pYvqBVowcE2QlRXjKKI2X2HJFHYP82Yu0Ziy0jDEJSSszErAs0U/FMr1xoYmH3rGuSSCGEFvCI5x60TbH+L6p+gt8IrCqU8s/yjX6D7cGOg7COl9hiLOm/ZxeKzMSVvEpyhgwDttIyP757d7dTYweo6ZzdLjDDGRo1ETfC1BCJuWwXJHI4UdrNQMv/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(53546011)(66556008)(66946007)(8936002)(16526019)(26005)(186003)(166002)(8676002)(16576012)(83380400001)(316002)(31686004)(36756003)(86362001)(33964004)(31696002)(2616005)(5660300002)(2906002)(966005)(66476007)(44832011)(52116002)(478600001)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vAt1S5eYu7TAbcrsA5H7BCM6gU12RBuaa4gt0Do9F7a5UB7RWYAwpmbef7xGKmd44CIfea36aPGWN7E3d1MJgyYWHnmVYRKps5etLDDidimIDgZeDXs5EB8YTiX7QA6eu3veI45zte81eaZsVMH/ldL92in2LBnE1JwGoabyvSaWPrMBLiL+OwpxB24QyrRSdd/Uo9z8wGd9v4/B5HiQOLH/fCHyHxvuqsYBrKBaS872/Jsem6FHax3NuujeEDIqpTqE6Zw/PFj7le6lK+8zysN+w7iE0Ymnp1C9ZdWK1XRG6mblmZhhQ35anyY4DaL1iujyaYkz/DTrInR4P2V/XuU8mK9gCtPzXgfkxhAPjTih0/ymcnlinxCGlMlfOOEIezmQqcZeldXbYdwvhYdKX/Ax/rZZbupFQPF9PJYRhZRS/kijcm72Dq0UDxRbAOusDt9VOdpcu2Tr3cFbN3G7kvPt3c8fvs+pYrlAHC9XFyQDXXmVpMe2FHi9LJB8iVNJT9kmupYZ/qajaqydFZ+foLGTwbd5WEpghRK9MOaOh/orC2mWU46WXhKxAJhpAgW8Ah358GIFWW6pp3hBfVpcC9xRIw5J41cTdzia6k4xEV5g4+fcTdb1KA74nWXp/mNv8UcUGJrFVnpInUA2RRCQKQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3ae3b4-1f14-4ce8-cb5b-08d851ce403f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:02:35.8319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcSnu2Mtu2gC8ZCgaJrKQgEC1gOCddF7oCbbla/Sx0RAtGIay3mRFqxPCnEt/2FeQAiB8jTJKxxg8gARB9e7JfyT49q1E8RDXI3obf/OeqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------04759FD58DB8C005CFD57A36"
Content-Language: en-US

--------------04759FD58DB8C005CFD57A36
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 7:28 AM, Leon Anavi wrote:
> Upgrade to release 1.4.8:
>
> - Using of -Pn -sZ options for basic stealth scan
> - Refactoring nmap3.py to avoid repetitive code
> - Support for nmap stealth scans
> - Fix handling of xml.etree.ElementTree.Element with no sub
>    elements
> - Support for gettings nmap raw outout
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-nmap_1.4.7.bb => python3-nmap_1.4.8.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-nmap_1.4.7.bb => python3-nmap_1.4.8.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb b/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
> rename to meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
> index 5ebd75711..2037d496a 100644
> --- a/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
> @@ -8,8 +8,8 @@ DEPENDS += "${PYTHON_PN}-wheel-native"
>   
>   PYPI_PACKAGE = "python3-nmap"
>   
> -SRC_URI[md5sum] = "4dce15e7889b1e9bfa8e1e2e0904795c"
> -SRC_URI[sha256sum] = "127b7ad604a3fd34578a6ad848a603ccf1608c607577eb3bba097a1e2fc8f48a"
> +SRC_URI[md5sum] = "e7904b39b64a8a44f275388862659a0d"
> +SRC_URI[sha256sum] = "8d7da78142bee665289a243f71c5f48407d8ab7e5a02ee672ded05f339044759"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------04759FD58DB8C005CFD57A36
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902112808.18547-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.4.8:

- Using of -Pn -sZ options for basic stealth scan
- Refactoring nmap3.py to avoid repetitive code
- Support for nmap stealth scans
- Fix handling of xml.etree.ElementTree.Element with no sub
  elements
- Support for gettings nmap raw outout

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902112808.18547-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-nmap_1.4.7.bb =&gt; python3-nmap_1.4.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.4.7.bb =&gt; python3-nmap_1.4.8.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb b/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
rename to meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
index 5ebd75711..2037d496a 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
@@ -8,8 +8,8 @@ DEPENDS += &quot;${PYTHON_PN}-wheel-native&quot;
 
 PYPI_PACKAGE = &quot;python3-nmap&quot;
 
-SRC_URI[md5sum] = &quot;4dce15e7889b1e9bfa8e1e2e0904795c&quot;
-SRC_URI[sha256sum] = &quot;127b7ad604a3fd34578a6ad848a603ccf1608c607577eb3bba097a1e2fc8f48a&quot;
+SRC_URI[md5sum] = &quot;e7904b39b64a8a44f275388862659a0d&quot;
+SRC_URI[sha256sum] = &quot;8d7da78142bee665289a243f71c5f48407d8ab7e5a02ee672ded05f339044759&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------04759FD58DB8C005CFD57A36--
