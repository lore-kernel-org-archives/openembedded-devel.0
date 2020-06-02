Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.59])
 by mx.groups.io with SMTP id smtpd.web10.2121.1591114363205087550
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 09:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jFF+OB6b;
 spf=pass (domain: windriver.com, ip: 40.107.93.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQk89uYBnH7Fxzy/ShZcVB7orH7jmX+M96QlQAbOSoI5H3j1nqeIUpmdr3ifj6TtOvRkazTjXjJmu+l6S9nCGDjpYd2lQXVO4xc+Tt3kQE98QyCAmCVjrrSr2SJwgAHmk4Q88hl0LRpF7e6umK8JLFY6tUK6aG7tfe16dhTIBPe/lxdITak8WIuxVzBOLvTHzhF39FnJ6d9wDDwIwIk1IS+Bb2ctEy1++myySqD4F18SCg2ZkCbvx5RLsEMa1t5IXtEpC0zGEWvuGL5mJpaAntflzfVqclXsWqTXk2IZPBaFaVdHbg4ptziZRmMmc5VWmG3iEKyQELLm4Y6TczEquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKQXkWnhrTTLK2tS3GI+QVUI/yr2FYRtClmxEXFLlps=;
 b=nKjI5wHStPFIVuEbhtDvLJk9fCh12DTPvaYI27+TQtjziCr4IJQb42FrpmwwyAwzsaeXE1w78ltn7I8HrGoNsvU9sWNxPZYp4dsum1yKd99WnJ+Pc6MjYzFTKHzUakMrCglvG/N2aMf0+M/L7b+l52ZmKmfPcFo5/OCEqgdOmYHt8brc1VcEH9qxvBY5HP2J0/+h+xGa7G2E9B2ObX99TOp/YCnoiznFoqlf6mc0ueHUDZ59Ftpxp3hFx6tUJFPDmnsDBCrzHOJDD3RLiD/7UQdjDuWvK/pfUQcKC6xYaQ0WxQ4KRoX2vsvoHYV8dF2ley7hSJmK3ZV8f+ftfGmFgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKQXkWnhrTTLK2tS3GI+QVUI/yr2FYRtClmxEXFLlps=;
 b=jFF+OB6bPlbODP/Yy+5Zsc2yQuRF7iL2T0klAvP2BHtXU3LCpfG40pLz3py6BrNRXvAp9F9OErolW6idmS52vHkuSPGhEHhBgbiKbKLp1VZF7o9wBTkJIGqfpGov0NOLaBBaeprTaC5X+qGtyZO0sSon9jnDnNtJpTc+GjTkWoI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1491.namprd11.prod.outlook.com (2603:10b6:405:8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 2 Jun
 2020 16:12:40 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 16:12:40 +0000
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-unidiff: Upgrade 0.5.5 -> 0.6.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200601120419.13396-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <118d871e-993b-e27f-625e-965046281c81@windriver.com>
Date: Tue, 2 Jun 2020 12:12:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200601120419.13396-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::34) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Tue, 2 Jun 2020 16:12:39 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e78ba999-5dfa-4c31-2d0b-08d8070fc5bd
X-MS-TrafficTypeDiagnostic: BN6PR11MB1491:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1491DBD866547B38807106DB9F8B0@BN6PR11MB1491.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ZOWtwBG6866qpqH+VhmxDySNlEOjrjevUpnDTKtuMd3Xr07n99qT0TkfMRVd7baKWBt+6OVjPNF3nDFXljtRzRNz4hsMgqMn4LwB7FO0WSkW4dDIfv2ODN4VIkXozV7J5j1jJdX19WLt0Mo8XJZo/0oY5ei38AsZPIGa9EUNY+moJLpJgQHL8RSyk95bGCS1wQjFw2gWqwBCeRhoqkoqrRgCspj6iPfhs2D6W+IBhPAR9pumAD1qfL2fN9ZNjGQT0Q3ei8cfpnMUok9Xo/uobFjFPBQ11ZM4DjfZbvDwhCYHs5SIRW91piUlTTHhgdw46wQJ6rpsoJsx5p7XpjA/7fvjo7bySoMOE9n1TK+3llYRcXJgga5F64QOaw0a+j0qRXBobD/93LfpOPiPfXmOiTmRcPRmM9GOcfeTOFRjiU7QDYP/cwOYxupYVEXpHGEns2HDRQCCabFF3ssCssALg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(396003)(39850400004)(136003)(366004)(186003)(16526019)(53546011)(33964004)(6486002)(966005)(52116002)(36756003)(66556008)(86362001)(26005)(31696002)(66476007)(2616005)(956004)(66946007)(8936002)(44832011)(5660300002)(478600001)(316002)(31686004)(8676002)(83380400001)(2906002)(16576012)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TpNtP3QguyRIH99gJJEZ3u5t8/givrM4lhH1IoypMw+kvQg33pa9aBhMN5ebaVgdhlr+i1TyKYIaC/SoxwZ7buQCD5yM9l9fNeAzKUYwK7/u0NEOX/kyhDDZNXgWSa857mYib15+BC0q74PwiYhoLiDcKqXL3WtL4OhA+D7tSoQT3NbGtGjYSWhpFGU6alWfDhhWuLWPPXoe0p8Hy9gUDgfiwuT49/uheUvsHbJRQpyz2MSdCPCxIxXLrPgDtmTDD3xC8Qd6h71r2XEIjB73EL3eC3phWDv0Qs+Fb5Thrf2IEdUbdMsxXXWuRI6j4n9HeFNnH5bNNH3TkvQk7up7VeRjdRoOYOOrSzMZm38AltTkfDYta4U/mcTYUMlwLxcf9ldEIy99GqBCvtE6SDZW2/iCY6meAUUJsJ5f1OaH9MgE4jcRAmPbVW65wxp8y8pN5xC/zhgH6Q3dhflx6XlLvglnxOCT27MNecUiWpUx+Fs=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e78ba999-5dfa-4c31-2d0b-08d8070fc5bd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 16:12:39.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4aLuAkHwiriEKeYqvmz0HMyAoxt+xy6BaqBPeGV4FFQz6aa/KCi+eWHOYi8gglpaY3atK62e4rW79SA8qIA6vM0BcUGhQjftBVVy5EMhOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1491
Content-Type: multipart/alternative;
 boundary="------------DBDA71D3BAF8899BAFCB6200"
Content-Language: en-US

--------------DBDA71D3BAF8899BAFCB6200
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/1/20 8:04 AM, Leon Anavi wrote:
> Upgrade to release 0.6.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-unidiff_0.5.5.bb => python3-unidiff_0.6.0.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-unidiff_0.5.5.bb => python3-unidiff_0.6.0.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb
> rename to meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
> index ded66f06f..75aa1bf79 100644
> --- a/meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/matiasb/python-unidiff"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
>   
> -SRC_URI[md5sum] = "47f669d7273541fec45e4cc0fba8d8e9"
> -SRC_URI[sha256sum] = "9c9ab5fb96b6988b4cd5def6b275492442c04a570900d33aa6373105780025bc"
> +SRC_URI[md5sum] = "ae9524079753df7b1239f0378ed326b7"
> +SRC_URI[sha256sum] = "90c5214e9a357ff4b2fee19d91e77706638e3e00592a732d9405ea4e93da981f"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------DBDA71D3BAF8899BAFCB6200
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/1/20 8:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200601120419.13396-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.6.0.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200601120419.13396-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-unidiff_0.5.5.bb =&gt; python3-unidiff_0.6.0.bb}    | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-unidiff_0.5.5.bb =&gt; python3-unidiff_0.6.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb
rename to meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
index ded66f06f..75aa1bf79 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/matiasb/python-unidiff">&quot;http://github.com/matiasb/python-unidiff&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3">&quot;file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3&quot;</a>
 
-SRC_URI[md5sum] = &quot;47f669d7273541fec45e4cc0fba8d8e9&quot;
-SRC_URI[sha256sum] = &quot;9c9ab5fb96b6988b4cd5def6b275492442c04a570900d33aa6373105780025bc&quot;
&#43;SRC_URI[md5sum] = &quot;ae9524079753df7b1239f0378ed326b7&quot;
&#43;SRC_URI[sha256sum] = &quot;90c5214e9a357ff4b2fee19d91e77706638e3e00592a732d9405ea4e93da981f&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DBDA71D3BAF8899BAFCB6200--
