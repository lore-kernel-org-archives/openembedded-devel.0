Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.77])
 by mx.groups.io with SMTP id smtpd.web10.35712.1615212141219155962
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kOXpZIu0;
 spf=pass (domain: windriver.com, ip: 40.107.237.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fne0aRpJEXi5DFpOx/qzD0q49XQhFk20qWfNCZBi9K5BMnumxgPBDR93Z1yyq4pFp5uhPQ96FOr0AHkDcZXTiUIL7xZp+iMIXmu1Os2LsaZk1vdZpDXEOkm1sr7EPArAFvmOtiEKNW1mz64X1cllllM5Sax6z2zSfGCzEM48PjkjBp6z/baICx6bqZnAI9flzRnlgy0nZwLFVmIlex+kfSJM0QcQiHmTkO3fsmlKAP2Moav8bQaifHp4/GH59I0Ypbiy5ShQYt+ut7uD/KOUdQ5B/gNMeWdNvDhYJBXUR80U/Myh+JL6kqxdP3qChYoeZKPm2aplj2OXePonLdNKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIuZXbBw9gfwx2dL/e803PGPqouZ7fUrJMc21uFxa1M=;
 b=TqnideSDtRqXqhsPIjCRm9S4vN0JxTwn7BMekKs3yFGG9DdFMJNF1Xrh9h+SjoHTw1ZrhMJMV4odi/JOuon9qeDHkS/SSCg+uM2B/Dau66/1YIVznF5Rs/uBU0W2hHKGqxskN49ThPeKmPl3erL81ys3bMKNm5Q7ZTo2Z5xj28M7Wbo88HqVbQIZRtZTsp0cLw12ZX4FC3ssqEAsndSwYiPpIjg/WGIyrwmpHnteZ9v1Tqje2u6u/XuKte8i1JvEKm6+MnuxJGGyqSfqgjvwFXPy1nWtwx0PXBu4Tmo6cXrqFWg+IZr8LqegLhPLCE4Sqcgj+KKi5a1jgPlkknitrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIuZXbBw9gfwx2dL/e803PGPqouZ7fUrJMc21uFxa1M=;
 b=kOXpZIu0NXppkNg4U8TmmeNpkB6ptUtho01ufY3dR/kO82W5mFTI3RVs5PE/LH63LJEnOF2q8vOp730FTNrdffVL2fS/i69nnQJks9Aa8toi6DsaAOB/JzHwVr/r5/5/fuVLys3orddM69qnwabNgS/1kOMv1igZhBoWI2FwxKo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:02:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:02:17 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-mccabe: Fix HOMEPAGE
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-devel@lists.openembedded.org
References: <20210302132111.1644601-1-andrei@gherzan.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5c0186c9-4c6f-6098-fa79-175f7d2aabb7@windriver.com>
Date: Mon, 8 Mar 2021 09:02:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210302132111.1644601-1-andrei@gherzan.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:408:e5::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR02CA0044.namprd02.prod.outlook.com (2603:10b6:408:e5::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:02:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d1d2b33-2495-4653-f99a-08d8e23ac861
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB410351D66C1D3548BD2521909F939@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t3bG1H7r/u0vdSwvhIzSVqgknjDUX5LTPCJ72pC+TI6N9CSZSt7ejeqb6LMcXYI4cqsIF5Cm8nmXQoRLqOB3byEUhQngTvj8MncVPKmQaUdsLVzkvHuZBQuR0tJiRw5r1C7ztfVOpIRDbNddtX3/dESMF62yYewLxhAF7p+UUkNpu64eZ6bFa+rG7O1jimJlfTF7bOWzTj7IaQMDsuipCQI7zU4g5hAGeMSfGLgbCP6Lf0c4o0Lq3MDMfbiRO16Zg6+Yovm4e+Fb/jLFpEwavWbM9UTxdn23+7kc7ApChjboI/kJhNj9vzfQmfYepBsuVMgkv6UKAZinuTvrDpYnjwpciqtvp0GNzk6/oC2C87ABj+v6q0d1MKPCy7GvTC9NSSyNMsPwm2Xxt6JJvta8Sg3fMDSg9zmWyDWComCGI+JL8wlLcIUr4+Oqtem6cqdoupf1+pFG24Uw02hiybz65g91UDoE5gmKrRfmbk/dPEcvb6+W6H4WVAg+zVOh9D9KlVX+4KncxyY/D5jLLrn8oulJZffO18bDVfweZLGAKGJ3lONfSmu2DiNg+HKh4ztPdwZ+PhAEMinUzhBuglbvzY6Qcigc7ghMu9zGLe5aObmgke4oRYAbgapowNaUiqMQDGQomG3tl8SNW9rCSfB9iQB9EVa7rQWukaBje5up1GZtpNRQldBIJ8i0ORwQB4a4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(44832011)(66476007)(2906002)(83380400001)(16526019)(26005)(66556008)(36756003)(31686004)(86362001)(31696002)(16576012)(8676002)(6486002)(8936002)(956004)(478600001)(53546011)(316002)(2616005)(33964004)(166002)(66946007)(186003)(966005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dWx3b0ZWNmNPeW9aSHBDbXhKWWpydVNQN0Y5S0JJTnQ0ODh6SzY5Y1MzMnFy?=
 =?utf-8?B?R01tUytmeWljdjQ1NGpGN2tsN0ZHeXlNeUNCMkR0UG1HbnpxUmFZOStLd1pB?=
 =?utf-8?B?KzRZT2F3ZTQvMm96QmFWbm85VEZ0WFNOc2VQaWpFbStpSmxnZmE1NytjNDZo?=
 =?utf-8?B?dmlwSlR4a2QzNEtFRGI3aG5CN29WdkxKemhOWTlNQXl1NVA0cE1mZDM3aitF?=
 =?utf-8?B?bnhDblY1M2VadGRvcXp0N0JYbWFWWWtzeGVtNi81Tk1xRmd4UGN3WE5xSGFW?=
 =?utf-8?B?b0NMVXcxWjJibHFmcGowOEE4cHFVNU05c2FqamlJVXdNQ3ZYazlrQ3IxaXR5?=
 =?utf-8?B?T1g3bEl1M2VBYjM1alEwektmQjFoME1VVHR1c2E4L0lDb1NKaEx3N2t3Uy9i?=
 =?utf-8?B?SlI5aklHM2NmVk9DN0NuM1BLU1E1MlROeHZHWjZNS1ZtalpmWlp2alRSSWty?=
 =?utf-8?B?ajNVL2JPcEpPUnltS2l5Y2NBamozYWdCS01WZ0NkMm85Z1RlWWt0ZWViOWlj?=
 =?utf-8?B?aW14OG0zMCtHMVhSbHhoK2hCU3ZVQ3RXRDNVMEFMZk52R2VwWXNXbGlCNGpE?=
 =?utf-8?B?ejhYYTRNM0ZrOUNUb3liZWZJa2JMbHVNSUN4VGVZbHZYWFNsK1N5VktQTUVR?=
 =?utf-8?B?UEFLZzI3ZXYydmlpZGFnY3R2Q1AzVStBSDZOUlltVEJHbGFJU2JyM1Q0aVB0?=
 =?utf-8?B?Y0JkWjhYNjVxSnlMWUxnMW9TaGM2Vlc3RnlicDQ5Qk5KbUc1eUxIS2NrVFpH?=
 =?utf-8?B?OWE2cXp2R0xDNEtSRE5oL210VkhYQm5GbjErT1ltcmlEd1ZIeTBZdTcvM3Y4?=
 =?utf-8?B?SnZxMmRuWDdPUWtpSzdDL2JnaitEVFhDQjZOR21LY05FdWhSbXVZVGNndnRF?=
 =?utf-8?B?WDBoMXRCU2FtWVcvZ2FjOWEzVnYxRmFqa1kxM3RMWTZ0ajBFeHZkS2h2TGJN?=
 =?utf-8?B?ckdRN00vclNqbVZaNXdzS05SREsvUko2b2ZqMGFnT3p6YUtjT0JtWDE1UWhk?=
 =?utf-8?B?ZkJ3aTVoeHF0aGdMWTlqWkNST0tvWnFwcDNWaDcrQlRYNXZiWFkvR3dFTHBQ?=
 =?utf-8?B?SDJieDR4NWFhV1BlaW02WDQxdHhQcDlUakdXUG1MNEdlNTlsUm4vZkUyYjEz?=
 =?utf-8?B?eWNCMlI3VXZ2L0tOZ3pXdFp4RnFWMng4K0NmcGRiV2JDVnF1VHJncHhWamNG?=
 =?utf-8?B?UDNQRzVUckZhN1JMTXFJUDlzYjQ2OCtzUDcyNjV3WnF3MENETkFyT2M3Skhw?=
 =?utf-8?B?WTV2c2ZBQ1YzZ3p1bTA0emduYWNhTGN3TkNHOVhENWVYRGZkN1o0ZmIrd2c3?=
 =?utf-8?B?RVYwTXpYeWoxSER6dXpPanYrcjd3a2xRL05ERXVVbDNOTzhSMGw5ZU15RUJw?=
 =?utf-8?B?ZjltNGJubmdralRrNyttb0xMV1pQbmlucFcwQkxUcjY1ZGtSRitQV1FIM3BN?=
 =?utf-8?B?MTM3OU5YUDVURmtMMXk4bkdYdFNOTHV2eWw1ck9mQVRUVmZuZmFWU1VLV2M0?=
 =?utf-8?B?emN6VWNVUzJpMHJNd09KT1E4TTVaUXlrL1JzLzVNMW94WFlCdmFKQng2cDBT?=
 =?utf-8?B?ZFV3VGRzMmdBenpld2x6WXkxc3piZ0ZYRjI2SWR4WmcxWDdYaDBFb1pYMG5l?=
 =?utf-8?B?L0gycUllMW4yMVJOeEZEUzJMaWNLcWNVVElPNDFtUDIydldSaW9RUUJvSHlH?=
 =?utf-8?B?U0trV3NOZFFuN3VlbmdFbENLOTJYM3A2d2VYT2UxbVpGVXBUejhTOW8ra1Ux?=
 =?utf-8?Q?pdG+7xsHlePT7OWHlYqYN6JOwxge/8eOcnx5Y9g?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1d2b33-2495-4653-f99a-08d8e23ac861
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:02:17.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqQbz7pO2uQUTtRl/tLmWo7K6jHa+6/ZxpGs9DW2Pa8u8flSC8XQHgyudzu1JQqSE3F44EZszm4xgQpanhNh87Kg7f0ldC3RYKw15gMuMYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------B7B38164945530804DDEEBAD"
Content-Language: en-US

--------------B7B38164945530804DDEEBAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-02 8:21 a.m., Andrei Gherzan wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
> index 63a9e35ac..b366f0430 100644
> --- a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "McCabe checker, plugin for flake8"
> -HOMEPAGE = "https://github.com/dreamhost/cliff"
> +HOMEPAGE = "https://github.com/PyCQA/mccabe"
>   SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a489dc62bacbdad3335c0f160a974f0f"
> --
> 2.30.1
>
>
> 
>

--------------B7B38164945530804DDEEBAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-02 8:21 a.m., Andrei Gherzan
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210302132111.1644601-1-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei@gherzan.com">&lt;andrei@gherzan.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210302132111.1644601-1-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
index 63a9e35ac..b366f0430 100644
--- a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = &quot;McCabe checker, plugin for flake8&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/dreamhost/cliff">&quot;https://github.com/dreamhost/cliff&quot;</a>
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/PyCQA/mccabe">&quot;https://github.com/PyCQA/mccabe&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a489dc62bacbdad3335c0f160a974f0f">&quot;file://LICENSE;md5=a489dc62bacbdad3335c0f160a974f0f&quot;</a>
--
2.30.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B7B38164945530804DDEEBAD--
