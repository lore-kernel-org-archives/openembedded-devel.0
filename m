Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.78])
 by mx.groups.io with SMTP id smtpd.web12.10559.1612879385761918641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 06:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=L50VmvTx;
 spf=pass (domain: windriver.com, ip: 40.107.236.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mf/mftaeKLhNlxq7KMWJKzwU4XY+0elwLCKF2eqMVfTZnWxil084lHYSoZkHIuZNZqV7hJLe8fozK/6UbzbuHNzBkik/m3gaXRbKmnPuwqruINf4YiicV59QVoVN9UJNM6qCaNZKbVOOBxT0yJt4Bz6+7cfYdNbGK/FuinLWfSFOCPUsAdU+kNuTMzfcoxVQrUWfBOCdw4lCyYps1nB8Bl6domIIEvUhgP5OQ6Ww454KW00DoO8naA1DrmqLiCmCsleVedqRbEOVKazxs3aUO+SQhZV+fQD6inB2DC0ZuCqVDKTSQqKIuOD7PLWQMV/0jWR9Wr1QKzBy6VR0rmAM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ln9N4pDC8vHPmvZXGH66ooBjxo4/UH+1R3Q3J19h7ps=;
 b=bDPnQNb4tiGN1/gIuACfMrrzxS6PFhx164IZ9+eom76FJ+qwlT7jXILM9JEwl/s+SDo8xLhOFm0HPasLYFNL7luk5zSgyG/ogV580sUFZOqFUljuP6Xm/va1Bblt2vLtnXObjCg3xes3YvkbHN8R4RpbFbzWRDZNNyn34S9u6W28jBGyRCG9ZmLJC0JvDPOaBh9NEhunOrkxoQEDEGZ2LpVB7V9aMOGBsz3T9aJLx6pc+5pmBqeYT5xu+rwHRPGWogvj1DvkV8ue8Yv8smhebo1UqTZJPcnePyRoEcSfXEB6Z4l5ZVnwJ6em0fRNtYEKfo+PQUSGE1+b3Hu1BCHQ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ln9N4pDC8vHPmvZXGH66ooBjxo4/UH+1R3Q3J19h7ps=;
 b=L50VmvTxqhvxYyCLg+TsuyVtRkIQ8XN7Rbw46V6f/0++pFBjvQZkkTUy38i1Rx18OE6V+Ylkex/Tha7cQ9qk2iQW5yGt+u4WsByrGyYXVRvMG9vM5TGWs3W6LxhilVD1amFrTI2hJwrQho9QVcwu3OJ7BHZILZ7C/L2IdcZO2dU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 14:03:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 14:03:04 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-greenstalk: update to 2.0.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210206230423.4106648-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <13dbf80b-8c10-c331-5dbd-f9b5290318b1@windriver.com>
Date: Tue, 9 Feb 2021 09:03:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210206230423.4106648-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR16CA0031.namprd16.prod.outlook.com
 (2603:10b6:405:14::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR16CA0031.namprd16.prod.outlook.com (2603:10b6:405:14::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Tue, 9 Feb 2021 14:03:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdd79e12-68f7-4598-1ca2-08d8cd036b2a
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5165F38C67A480E5D7B6F5DC9F8E9@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n08ThCKMUOmS/eyXUT5bXbIkLj8prQQnLGIdIVbCTWItoW7VI17emIEo8/gU2abxwyZhmfpEkk6D7qTCpiBxcjDjeQ412xkgk5bxoG+axGdj1kyPujHH5WhZGvd825DGhWVkYzFfg+hrgbv7Hfv1QSIfLxZNwK85Eerzg+ZGwVOUZuyTA/Ge3mJV10H7VjtnCL4SBIh/9f65kshjslFRrJMrKhw46qssXXWwennu4RtoqutpHzUlhCZiRrD+oYdK1+2VoGqDqMBl3mwh1x2wXXUCRXUrU3+BqamRPUTlzuLYuLgmPKBamNUuYrT9lLhKY8HpKzit0zTHSb7X5ZtKn4Ng/bOzaEMbAFh+O0XWp0kQ6KfR8V+99oyxsff02VVHb7uCPzxSqqNvsxsicO0Wy06lbIWe4jpk4o0xT5mP1sMIjH81Te9GS1ZJLxcLo9XTJsbPswinW4XLcETjlBui1u4F+Ad++0ZYViL+P/GmyNdFAdyR/8qRYpCytdkNxBlHk7tBtKL63E0o/q+q3hZFBPhZf1BrU3LdXMCkb/JpRZF8tTLDYNeLQQvGXXWChcTBpvLq6VVPdsDkLAmL+tYcLEymWS5yzyrGgfvhkvGlJZ2FTDTWTHW5FTpZpdU+TD93ZWoPETXPTvuSiDnCSt3//7PaV59RJEQLkaiFNMVu/QJBY+IZPQMLTzRPGzP43Lu8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(36756003)(186003)(16526019)(31686004)(956004)(44832011)(166002)(86362001)(15650500001)(66556008)(66476007)(66946007)(2906002)(83380400001)(6486002)(316002)(5660300002)(16576012)(26005)(33964004)(966005)(2616005)(52116002)(8676002)(31696002)(478600001)(8936002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SqRlsROb/ORGvXZ2HwnJbUvvdbvMz6C1rHFUadYbXzlpkVjpuYTSJO4aObmbjGfmJ9OOcjCbA53HMxR41UhY2Sd/v+9kUgMq7wVLkndpd5cgIunKp8C4tFxU5ktEV0XrcSyUHzcxF2M5F7243iDcJzrwJ9bZx80enWt6oPdA7HIkdpg+zx14A7nBdcO12oua8DhGK2iNAMSu86h+LiqyEkjYlSB53iLxlv0wL/3zN7nIaZouWmJMt8Q7NXTNbk+7mSEDjsuMJDwSFG3zWQ9oxcX9jm1FESQ5yhh/f3dI2S/scuexa+GC2dZFGo1QOlu82TB6W49uxt+HrKutSSqNgd2kSEvIQctTl5SdvROLS1OI012w/wJgMoq206PIptt0VPjSclq9bnW7oIubG2VqUAHWy/lVE4FjzUSL6CPJP6J9tAJPnj8y8OpotSPOoIyKM4RJWCBBru1cqBwvgpN7U6RYEWFDN11DwbHE71OhKBjZl5pNC2hQiLJ0O2wtZA3X0Yn8v+EHoMEoL7Gt6iUcXDkzhMvs+S3RV1ZITiM6il6Lkc1l4oCbQCnPR0+HfDLwPZqos2q85NlcOFjJLLTxDvoC8gVfCTmJr6w0Isx/I48Ll+N7TwrtFWB2z725qxr0QUDH2lfP0HagwAvEmxT4uS0oMUQp3JVAYiHImzXSTRw7y4Oor457f/dSrktukcbF0OI4uNMu8imuM6ysaUg8n//0f0LnQ+2pFT4XSc8bRm6KQkE+4jJnjb2/qrNYb7Q5
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd79e12-68f7-4598-1ca2-08d8cd036b2a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 14:03:04.3920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHTaCp94vQOTR/uyAV5fL4BK8CHORH9etjI/HGmoyN6ZxI8MLFX5EWCDnC8IjvdaO4JTX4P1HQiTh5UFhIOQ5fyZRYEH+QWBh+ej6/gW7Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
Content-Type: multipart/alternative;
 boundary="------------18261AEDDEC03E2DBC008918"
Content-Language: en-US

--------------18261AEDDEC03E2DBC008918
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-06 6:04 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-greenstalk_1.0.1.bb => python3-greenstalk_2.0.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-greenstalk_1.0.1.bb => python3-greenstalk_2.0.0.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
> index 9447c1836..9af5a0b4e 100644
> --- a/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/mayhewj/greenstalk"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f"
>
> -SRC_URI[md5sum] = "3374649586a8016fecaf0ce5ecf9985d"
> -SRC_URI[sha256sum] = "0c9f2af79ac8ea526891ae8d7e9500341a0f657465a541d6eaedb35ff70f4fe3"
> +SRC_URI[sha256sum] = "0020970abdb6f400586938573cbbec80410e83805d61e46cf76ea3ed71129257"
>
>   RDEPENDS_${PN} += "python3-io python3-core"
>
> --
> 2.25.1
>
>
> 
>

--------------18261AEDDEC03E2DBC008918
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-06 6:04 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210206230423.4106648-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210206230423.4106648-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-greenstalk_1.0.1.bb =&gt; python3-greenstalk_2.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-greenstalk_1.0.1.bb =&gt; python3-greenstalk_2.0.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
index 9447c1836..9af5a0b4e 100644
--- a/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mayhewj/greenstalk">&quot;https://github.com/mayhewj/greenstalk&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f">&quot;file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f&quot;</a>

-SRC_URI[md5sum] = &quot;3374649586a8016fecaf0ce5ecf9985d&quot;
-SRC_URI[sha256sum] = &quot;0c9f2af79ac8ea526891ae8d7e9500341a0f657465a541d6eaedb35ff70f4fe3&quot;
+SRC_URI[sha256sum] = &quot;0020970abdb6f400586938573cbbec80410e83805d61e46cf76ea3ed71129257&quot;

 RDEPENDS_${PN} += &quot;python3-io python3-core&quot;

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

--------------18261AEDDEC03E2DBC008918--
