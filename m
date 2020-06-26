Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.68])
 by mx.groups.io with SMTP id smtpd.web11.9537.1593183650012445725
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gz5FYE9D;
 spf=pass (domain: windriver.com, ip: 40.107.244.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ag4XZQKklnirlZ5wRLQaRmsRKaK6vN0H1HUUjfn7fSyVn5jGQkSct6XZuUpwmNh1T8dnANC1YVgtC8iRxIQ2z3j8j9hzIphbxSkenjh3omIxRb87H6o25ic080RTbkaiDNf2YXOt5rMuG0vhOdDoowfPkBl715kphvxAqPXQQPZO0kXtisghJm6i4NURB85wXlgrWUwdET/EX7dPgLIJeRtluanxOTn04SB3b+wP9Tj1gIcPW8m0XukACreDngkWZyvMC4F5FdWcZDJ3mNIHwMR9CIe6dSsTNnI4gsB8bxTmm1R4c9Afb9fdN/WvW2LIo6zkandIP5ifL01sVnwDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Drc4jRAIXtIjqLDSz4+leeHQe6wrO9Uq8dIPzCZgf9A=;
 b=MBYCuxpVgAYPig2prSLRAkdsLVrgVDNFGOlJsP2oQDmJH20V1D0xoE9LE0yzOFqKJElzbzl+9JkrQLNXd+XIxuGU+fSQbR6mzAgVErPPS+SpTkseJlA/82e/cbJBsinweqjBto76orPT+WjF65mCuKfsh0zVf+hvxyTF06pDdEGiUxj5of5R5iubANMtgh4SIxP3hsg2mZh3gVCob/5W3uR9XJG41waY2YM4nywQseayuzggGExP1owiopD0CNMUgKfzWwBZberVflTz3yCHS1L+ldYo9GoLObVVY3LEQ2iRb56xDVD3G6xuykTfwunyO87zYjz14zaO2BdWBzfnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Drc4jRAIXtIjqLDSz4+leeHQe6wrO9Uq8dIPzCZgf9A=;
 b=gz5FYE9Dss6A26EAPGI50Can53cIRTn8u+YG6lfIjhwKnDA+pJyzTxGnsQMAOxdN7+pniuWaM7DMA9HhIKa5ld/jq9k/glfnK+YpNT/x7ZdDThQa31jWAHqghrqmRQsVFZk3qvLo8Tu18Pj9/BSDpjxiLL/O9gHOE5wxtocEipY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1604.namprd11.prod.outlook.com (2603:10b6:405:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 15:00:48 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:00:48 +0000
Subject: Re: [oe] [meta-python][PATCH 02/12] python3-jsonpatch: Upgrade 1.25 -> 1.26
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
 <20200625090719.16068-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <05455dfe-433e-1c66-0954-54cbe0fb465c@windriver.com>
Date: Fri, 26 Jun 2020 11:00:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:00:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b363ff91-3195-44de-184d-08d819e1b59e
X-MS-TrafficTypeDiagnostic: BN6PR11MB1604:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1604BA9F34AF2AC7C04D8B639F930@BN6PR11MB1604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fgyMbNuve/z7pMzB6qqp7T3LzPL+w1V2fpV8pQpQoORmklt4AWoXcsLOhGQboddW1G46NXZltnNKYhE1EpZDNFe0FicxviYg5/sSrXJpjNgmULP4GHGEipce6GUiK9R4atLzVdSSHW5rnVG8FywUo2m/CHMyDMp1K7mjWX9/tFqd4VGamlcGqMhm6DhgIS0V1G41i5TaEsvFxTi3S+0M4UiE/F0OqPmujqGrTibteDJWg8yEWyY0GZsRX5iVknaZhOMJvAt69jhS5QuZzfwq9Lqu2VZ+n/m631DkJHnd8esBK+WMtkI2DPioCQjA07fUO42ecHEKghfEkVLBoZfWTGkFUCULxWuraXPXPjqsq2KapvZznj6ZplKryVubkC4bXyMrnmH442gRe8qBHn/sEzsaFjp7astYOzGvvRPeqQoPIJHf6xePvgZx9dSkqL5gUYks6OKReFXlJ0kx5RPhEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(396003)(376002)(39850400004)(2616005)(956004)(31686004)(66556008)(66946007)(44832011)(83380400001)(6486002)(86362001)(16576012)(31696002)(166002)(316002)(966005)(66476007)(53546011)(8936002)(8676002)(36756003)(2906002)(186003)(478600001)(5660300002)(33964004)(16526019)(26005)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1GGr5ZuVpzV/cQvjv4zfmLDwZsEOURwFubCX9jzNIHG5V3sCv0XlL15FK0gSm4sDVq9oW+e/MZ7UgP9s/swkwVbRbPXV2CGae7AZzMKAURvCB6gy85D1Jr468JmoH/gr2k7Ar9xF2O6YU2GvhGg3pSDl/wKAg1SJRyZIZYJi4X0G63PF3DiaARz89tsnk9pME8OL3DpxOiFL3LDdJKLfED/mv11qQ17a1AhSWQcKfRVQ5y57NxDIZiMSkt7YOszOMwag5cgzwdQuGKj5iyDs72av+Mg2WRxkRyithtYFQ8ZOyfQabjJrpOQ1rx/bMAi7DCCTixKwS/BQ3B3wkoDIaYonzapb7K9eZz3mFont7IapSruxVJTe07rRb3H7PV6YdjdZKxVOQanb4Gq3V5Dj2xS50C3hmnvxNKowcAhA+bHgR3p5YMtHOzyICTsLjMET9NskVzZ2n50ee6KTyVRJvcQONEF98Xm0q2J7bCrEgbw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b363ff91-3195-44de-184d-08d819e1b59e
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:00:48.0776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3vFDlQ39n9jI67XhgZ2lj6DTd3zpKwKpUeCXlZvSqoy7pawUAeV2RBp3iR3u3r5QpLq/wjZtmbVDj1LAolFba4uTjYRARGy3RBArOwTsQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1604
Content-Type: multipart/alternative;
 boundary="------------0F954B6FF5F780D2292E9F05"
Content-Language: en-US

--------------0F954B6FF5F780D2292E9F05
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Upgrade to release 1.26:
>
> - Optimize exception message
> - Optimize error handling
> - Fixed some typos and wording
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-jsonpatch_1.25.bb => python3-jsonpatch_1.26.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.25.bb => python3-jsonpatch_1.26.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
> rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
> index 8ec21ff11..b1217cfac 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "fcc546892414bef2f7f89f0e2a618a9e"
> -SRC_URI[sha256sum] = "ddc0f7628b8bfdd62e3cbfbc24ca6671b0b6265b50d186c2cf3659dc0f78fd6a"
> +SRC_URI[md5sum] = "3aa7e75ad472c51a6de0123137dbfdf2"
> +SRC_URI[sha256sum] = "e45df18b0ab7df1925f20671bbc3f6bd0b4b556fb4b9c5d97684b0a7eac01744"
>   
>   RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
>
> 

--------------0F954B6FF5F780D2292E9F05
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/20 5:07 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200625090719.16068-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.26:

- Optimize exception message
- Optimize error handling
- Fixed some typos and wording

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200625090719.16068-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-jsonpatch_1.25.bb =&gt; python3-jsonpatch_1.26.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.25.bb =&gt; python3-jsonpatch_1.26.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
index 8ec21ff11..b1217cfac 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
@@ -5,7 &#43;5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3">&quot;file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;fcc546892414bef2f7f89f0e2a618a9e&quot;
-SRC_URI[sha256sum] = &quot;ddc0f7628b8bfdd62e3cbfbc24ca6671b0b6265b50d186c2cf3659dc0f78fd6a&quot;
&#43;SRC_URI[md5sum] = &quot;3aa7e75ad472c51a6de0123137dbfdf2&quot;
&#43;SRC_URI[sha256sum] = &quot;e45df18b0ab7df1925f20671bbc3f6bd0b4b556fb4b9c5d97684b0a7eac01744&quot;
 
 RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0F954B6FF5F780D2292E9F05--
