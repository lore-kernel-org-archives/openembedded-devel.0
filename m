Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.51])
 by mx.groups.io with SMTP id smtpd.web11.15259.1593523511288367548
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 06:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oZ7O2yXR;
 spf=pass (domain: windriver.com, ip: 40.107.92.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8zWFjXFeqypJfcEm2gScs/XKW8m+O4vVg/VKU6tDgI5uLur5xiGAKLf+hLD+HwObn7D9COP0CASn12zksoYBOXohZMUopnbyQDgzv+FR7YjkTDkSjngLXRjFY/sdOe3aZtlU9QuuCiUtRGBou/lDHmMjUMeqGD5qp40yCLzapiv27sydch3XVVBaP1UfM4vIhTeV5tpZmrJYiVAg1A4fc41OXpDxSzacJt2CjYngv3d7gny7/+XXmDLJ+8d/hulZIjXfXmQjwQCpUFn1uhot8WkH2ALqFKp1jYMpaB3xTrXvoIb6oIaYUqXR+bM6y7lqHAVQZSbO57JtiNRgOo1SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xg2BT3LNbnLAvzXbS8Xvs+LP0cy9Bt3rAEbbpdbGSek=;
 b=QNOg9ibvnbGhnoh9Qub1IRZTCDPzFQudcPh3f/vLS0YVORd2e7yazBXJiuCoTo2R+RYu8rggPNOcoBN3db1Hm4Nx4XZF/hv5awy2PkmrFkjOdhf2tZGbghycIZ/TNtTVHw3VQHu9v5qstm1pLwhmTEjEBGAgTl315UqP4rlXuFGCFX1dQEn9ztA241AIKKfoH+XB8CA8wcrXp2EoM4q2aMgNXsS0W/vyqjy821RuWW3qIrPqSU/6as0AlrRbIdAsaqOIse7fGAogaL212vNV8WT+czTfCJQByZzj+RPBOL3zV+i8ATsxiu/e3cu5lvK7GpPGV+KY2n9gF5zvBwjRcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xg2BT3LNbnLAvzXbS8Xvs+LP0cy9Bt3rAEbbpdbGSek=;
 b=oZ7O2yXR/FZoMK7D2Idq4Isx4hLWiUBmvKAQJ5cxylNqa99PR6ANStzXtA7/apasSw2gO2j8mIY14/P1uzLN9H0b9AJBEjkemMosewrCAnxcwVR1jUWX0Tu5RaLJNRXuMhIFUenEecUm6BCaCYVkQqZY0eMxL66+rtPq6jl1pZQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1367.namprd11.prod.outlook.com (2603:10b6:903:2d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 13:25:10 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 13:25:10 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-sympy: Upgrade 1.5.1 -> 1.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
 <20200629121233.27026-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <783dce1c-cd48-5818-1524-ccc7bf3f7ceb@windriver.com>
Date: Tue, 30 Jun 2020 09:25:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629121233.27026-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 13:25:09 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a4a3591-276d-4f6a-1bef-08d81cf9031a
X-MS-TrafficTypeDiagnostic: CY4PR11MB1367:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB13671573B1E51AEB268127E99F6F0@CY4PR11MB1367.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sIneHIn4mOvXepgUcq378jcU4xIAR2lktvYcY1u4DWTas+0rw4NBzj6z0cBTM7RuWAyKMeV6eTRNJC7AuZZ/fe3sOHI1lP7GMt0h1WayuzdHKJ7kEzUPkI3vPIQdrrxc6uokhdWQNeTa8vKHmSSwWuxg8l8wpPN0C1qOo82R659+eEdohadwaX4hMW9l+jHJrO8GhMT+jN94ukLkysyWw7ZhZO1ZbojmqGvKm3tx5lkCM9Rgnsw7VUYix/0IJ2UCUNvCZhXl+39GmZ7D4iYMolvg9uPgP7FQAm4PDcCK51k7WqnyBbx+gRhAcODECVb2bJjaaO3BhZETQ64D2kDtDTunHminAvIRugKs+wowQab2IucjQt0Qu/wfyC/rfR/WHPTXu588m2+7m5zH1FvB+H+sBiTROcdbTGggfuawKV3J7lcMaQ+g6J1qijkU+1Y5XkBFxXT0q+PHcPKjCvwrEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(376002)(136003)(346002)(956004)(2616005)(44832011)(36756003)(66946007)(8936002)(66556008)(66476007)(5660300002)(31696002)(166002)(8676002)(6486002)(26005)(52116002)(186003)(83380400001)(16526019)(16576012)(33964004)(316002)(2906002)(966005)(478600001)(31686004)(53546011)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lJ44NDjQmvNKU9Yh6B95HNCeiHual3kWeYUtjqQIpJJLNKbIpvKoLeuUBDjAO6Fk+YdpFXg/oBSgoTdhtV34ApnaFBgcRNEZY288Q4oKd2r3dje94w+suwk0DE78mEqS5vXV4UwbMT4bl1IVfMHeH/6Pe1lqwsSrSf9lcRVs8Cm2K9z/c1v07+Wqc1s/nc4BU+NroOzyf5l6gJQmoTOB9WwwK1aPZLG4GyDlIEr76JGZvhBEfB7mxD0IXDyHIi5Y1nBj/zT8KZFsjp+kzLc+C2+cwLw7Ea2QUlsQ8VRVdfxw/v0Bt8+HKuLK04nac14hKbsxsgOm/Q0aLAahGEDliKeemDASxUTaMgIe65dugiAHhDa5eHuxKO+pclscU6yEax6rBQB4pnV+zhO9kluoBuN7QvwBBifKE1aCjxOZ/ANPml+0GBnuz2hOfS/xeEIlXZbvxkSodd5sx8FLUqmmX6Jmzj1VXAI7Bus1dMCR/xuPGJwyh9HPemz7yuYDk5yG
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4a3591-276d-4f6a-1bef-08d81cf9031a
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 13:25:09.9221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cj6pvBLKqq4cR9ZTYghUWZ45SmkBXThveI76STa85SURSCsxyG0+IX73Sixkn1jnu4+1112SpDU/u0Y2Rs6ljQM0FnxEvetSXtph/iCdBxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1367
Content-Type: multipart/alternative;
 boundary="------------D98B6B0786AB86A4767656A6"
Content-Language: en-US

--------------D98B6B0786AB86A4767656A6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 8:12 AM, Leon Anavi wrote:
> Upgrade to release 1.6 with changes in core, combinatorics,
> calculus, assumptions, functions, geometry, holonomic, integrals,
> logic, matrices, ntheory, parsing, etc. For more details:
> https://github.com/sympy/sympy/wiki/release-notes-for-1.6
>
> The year in file LICENSE was updated and the checksum changed.
> The license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-sympy_1.5.1.bb => python3-sympy_1.6.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sympy_1.5.1.bb => python3-sympy_1.6.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.5.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.6.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-sympy_1.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-sympy_1.6.bb
> index c0c382a51..feb9e10e5 100644
> --- a/meta-python/recipes-devtools/python/python3-sympy_1.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-sympy_1.6.bb
> @@ -4,10 +4,10 @@
>   SUMMARY = "Computer algebra system (CAS) in Python"
>   HOMEPAGE = "https://pypi.org/project/sympy/"
>   LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=611b41534dbf5aa01d7c827bf667ef66"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4"
>   
> -SRC_URI[md5sum] = "b11b310c3e1642bf66e51038cb3c0021"
> -SRC_URI[sha256sum] = "d77901d748287d15281f5ffe5b0fef62dd38f357c2b827c44ff07f35695f4e7e"
> +SRC_URI[md5sum] = "dbb7b21d2972c41f37d48f744b6189a3"
> +SRC_URI[sha256sum] = "9769e3d2952e211b1245f1d0dfdbfbdde1f7779a3953832b7dd2b88a21ca6cc6"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------D98B6B0786AB86A4767656A6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629121233.27026-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.6 with changes in core, combinatorics,
calculus, assumptions, functions, geometry, holonomic, integrals,
logic, matrices, ntheory, parsing, etc. For more details:
<a class="moz-txt-link-freetext" href="https://github.com/sympy/sympy/wiki/release-notes-for-1.6">https://github.com/sympy/sympy/wiki/release-notes-for-1.6</a>

The year in file LICENSE was updated and the checksum changed.
The license remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629121233.27026-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-sympy_1.5.1.bb =&gt; python3-sympy_1.6.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.5.1.bb =&gt; python3-sympy_1.6.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.5.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.6.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-sympy_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.6.bb
index c0c382a51..feb9e10e5 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.5.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-sympy_1.6.bb
@@ -4,10 &#43;4,10 @@
 SUMMARY = &quot;Computer algebra system (CAS) in Python&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/sympy/">&quot;https://pypi.org/project/sympy/&quot;</a>
 LICENSE = &quot;BSD&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=611b41534dbf5aa01d7c827bf667ef66">&quot;file://LICENSE;md5=611b41534dbf5aa01d7c827bf667ef66&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4">&quot;file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4&quot;</a>
 
-SRC_URI[md5sum] = &quot;b11b310c3e1642bf66e51038cb3c0021&quot;
-SRC_URI[sha256sum] = &quot;d77901d748287d15281f5ffe5b0fef62dd38f357c2b827c44ff07f35695f4e7e&quot;
&#43;SRC_URI[md5sum] = &quot;dbb7b21d2972c41f37d48f744b6189a3&quot;
&#43;SRC_URI[sha256sum] = &quot;9769e3d2952e211b1245f1d0dfdbfbdde1f7779a3953832b7dd2b88a21ca6cc6&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D98B6B0786AB86A4767656A6--
