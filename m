Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.84])
 by mx.groups.io with SMTP id smtpd.web11.14704.1600180058400153246
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IwRaiY70;
 spf=pass (domain: windriver.com, ip: 40.107.237.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZExZMc76lkTEkTBmzSxq+aGsOfD3IsOjNpsfMsNbRydDC6uIX9aNQTTe6kbt9bG7jBy/lcZqI48j8BrujhcRdbXGpOk3LItyV+meGAjXIFpOJxtjcaDaRDmOcYK4WWx9+w43mEGlonFzmuxila+vhSUZ7bJzK71wABedIDvtecCQ6uzUFPRTsfQJcj5sp0rxnnjB+lgcoGKCp2CFQrDajp9YoSp1/hG2jDtUpStHpRv7GXiA0KIQC+d7kuZoyYBI56HhKFPPj8DVnSGCvaDHjODGa5iuc+yB8YZrzJk8qLNV87vhw2ye+6dQlNaOAsiS5OijW/YMfWxavOVOdDs+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZH2w7Ld+s9z+pGudRVsBYqQdqMXOgzglWGMZd8MJqk=;
 b=Qpgl37FBcWT5kEwkulHed9bXiL9T/fq2VEbKlTm4R2CJGrLR0t2x/DOcegLCNMBHiNU1Q4mLpuj4z61Y8FdFVjmSgldeDp0m50esX5KGqqk6Eu/Jj5IZpHo6wLxSnXUueKTTq1+eTE/iyu1fh6miPw7ibQ7MJrcqmuiQwedqpmXzOq39LYcSx+h5ONRvEXcVr6j1uX42fg3bxNYW9aMN7sEYRK5tw7qcReQLNyPDABNA2XhLZBLLyA/O4Gg8OguPkm/JcfWKDlSGhpcXquuue8Y4gVu6Rse0KGymLvbIZHRDgGKf+NmVDztCrv3jvK7nFkS9ZOZt/2uCCqHFW/JW6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZH2w7Ld+s9z+pGudRVsBYqQdqMXOgzglWGMZd8MJqk=;
 b=IwRaiY70f6hcq1ohsVbbrvgBvcqNbzb7P6RlwpdVj9c1pFgAa6YeRLWF3QfR3iZQ/821TbfuOGImtNDVzd1Jaxmyrfy7ApIGEpEZXs7H+rDkf2Br1u4xpel96Z7tBhkntpTjb7vG7heUrjtO8XUnyTQeLwP4QFMn0zQDPr4AZw0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3767.namprd11.prod.outlook.com (2603:10b6:a03:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 14:27:37 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:27:37 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-isort: Upgrade 5.5.0 -> 5.5.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
 <20200914090419.19171-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <82bd341a-65a7-a9f3-1a23-d8d5c7545b5f@windriver.com>
Date: Tue, 15 Sep 2020 10:27:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914090419.19171-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Tue, 15 Sep 2020 14:27:36 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a30d9f5c-406a-4d18-339d-08d859837e3e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3767:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3767DEC89711909445155DE79F200@BYAPR11MB3767.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qrDFKxRvdSFh4T1aV0FxhtiPNtOnNnfWpdyZ7Cj86khBzYXNJT/v09iwlG2wDv3HoYy9j6Fj/VA78sHtPI2Iyyq7jLVZi7k0fGFo7YC2pWJGvrlcIVnvpNMRULrJwfncxk0OClpcEODgzGn+4sYgdR9rQdqSsOqHITABI1Fmaa8BoxrkzwqX1rwO8wYClPbKphAP3ZdjonD8Z30ipahgXZyvNu3Im1GjD81f5lAQLjcd/5uCaII1ItZSjvuYGpMHZgKIVYO25y3LG6oI/nr+JBFJeolHwCWZi1MDpY+ss6MqrrpLP6g1KdIVnQf88xhxGOwnZGf238fYxjWaJwpqhdIKFK61Mw5kfb6G6hfEiQNFlGpR8YxxPrcHj9R8GgPZvgUrX43uH+xwHnZk5ppv9zEsOTZKTSWiwKu9Ci9tUft4lz2ibUniv8PoxqQEuRo5WRrgn5VIkCcHi//8RON6aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(2906002)(966005)(66556008)(66476007)(66946007)(478600001)(33964004)(53546011)(26005)(16526019)(186003)(52116002)(44832011)(5660300002)(2616005)(956004)(316002)(16576012)(36756003)(31686004)(83380400001)(166002)(8676002)(8936002)(6486002)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8HGrLl3Xd6TyY4Wi0Uw2gOqbjBqcMkBSxyatFG+tzV34U/AKIZ9BzF3oHMbBLR5zhp6ShlzztT6QmZ5pNjkymhjlXDBUaMxQwMC+LcSlLIaRB5Azn1T2lIKFV2AEoiXRVmyZM19PU3nXzX/EfxR02lMPOhEsvalIMIQ2t/zs9X0QjzO1neNoXVvLxKJg9BEm18jOscQhoUX/xdOsNy8foMNT7QiWTTpY1xcmJbK4lTFSsQAj/ERnFp6s1RwLgxTBRXReSL0AZ4rbob9+BHLZFhk/7yzGf0uMEittmsa7RnNGiyy09+dlncLbsPgrV2znvhBM0h0wZls+OOAFWmE+2Xf7eIq6q6lHhWNigLN62gqfvJ1Hf8NzXuWutlKkEDRoIdpXtCXbYalNgRNglQsW5KgaiKkcaMURQvoqJ32cJat6GiGw96AFnxU8d1COVVNXSm3ncvYbzLMNK9VonvahLoQAq5ryDTrciMo3VxOSulNperT6NS2mn9WQ2gKpE0kpmbkhGfS/PmCtm5UrJwYkrjnJTiLAG8vFsuJtq59ugH+Y1UISe1Oy47lYCsuBvjkSdhp10v2MQ9edZNqu1B+TTzQMjSwgS+aM+WA0kRAfEYxU53AeI1GFKf36Yg08isN/TOJp8QzlUD2joaLysGaFQw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30d9f5c-406a-4d18-339d-08d859837e3e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:27:36.9127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfK4njksjAz5UWpdxb924b1YQi+ePmiRZ8PJlLbKmggR1l1fPHyd90CXOWFoEg6pZoXRxWgnmU88RU/0zRZZDXoMVnvRGJAsio7852fKr7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3767
Content-Type: multipart/alternative;
 boundary="------------098C42C4BF8D59FC527FAEED"
Content-Language: en-US

--------------098C42C4BF8D59FC527FAEED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 5:04 AM, Leon Anavi wrote:
> Upgrade to release 5.5.2:
>
> - Fixed: --diff option is ignored when input is from stdin.
> - Fixed: Ensure indented import sections with import heading and
>    a preceding comment don't cause import sorting loops.
> - Fixed: isort error when float to top on almost empty file.
> - Fixed: noqa comment moved to where flake8 cant see it.
> - Fixed: .svn missing from default ignore list.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-isort_5.5.0.bb => python3-isort_5.5.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-isort_5.5.0.bb => python3-isort_5.5.2.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
> index ee13d76e5..0d0415786 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "9560df531409e67ac8796e98ffcb6124"
> -SRC_URI[sha256sum] = "0906e0e7092e060c05de709ad172e1ec1b26aa27fdd4e8093f257890cd881d18"
> +SRC_URI[md5sum] = "844c49ad1bf16a957b490c27b3b9844f"
> +SRC_URI[sha256sum] = "171c5f365791073426b5ed3a156c2081a47f88c329161fd28228ff2da4c97ddb"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------098C42C4BF8D59FC527FAEED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 5:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914090419.19171-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.5.2:

- Fixed: --diff option is ignored when input is from stdin.
- Fixed: Ensure indented import sections with import heading and
  a preceding comment don't cause import sorting loops.
- Fixed: isort error when float to top on almost empty file.
- Fixed: noqa comment moved to where flake8 cant see it.
- Fixed: .svn missing from default ignore list.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914090419.19171-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-isort_5.5.0.bb =&gt; python3-isort_5.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.5.0.bb =&gt; python3-isort_5.5.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
index ee13d76e5..0d0415786 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;9560df531409e67ac8796e98ffcb6124&quot;
-SRC_URI[sha256sum] = &quot;0906e0e7092e060c05de709ad172e1ec1b26aa27fdd4e8093f257890cd881d18&quot;
+SRC_URI[md5sum] = &quot;844c49ad1bf16a957b490c27b3b9844f&quot;
+SRC_URI[sha256sum] = &quot;171c5f365791073426b5ed3a156c2081a47f88c329161fd28228ff2da4c97ddb&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------098C42C4BF8D59FC527FAEED--
