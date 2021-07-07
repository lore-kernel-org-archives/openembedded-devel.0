Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.22064.1625669066780713053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jul 2021 07:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mu3F0k7z;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=28220adab4=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 167EiQ4X013458
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Jul 2021 14:44:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39n13wrfkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jul 2021 14:44:25 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 167EiPKt013447
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Jul 2021 14:44:25 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com with ESMTP id 39n13wrfkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jul 2021 14:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnJGIWN9Xw2vJ1KyPCjPpgmmJ4S1EBwrXLzZG6YFGusaLFReUfVvkdjfn+iSUlffodYn0w+RPlEkwnDv2vfjV0wXiFSAJm3ESDZti6Dm+vtbnkqC6XeFsJ4xm7vcrTbNixgdC/qoa7zT+HrapfNk0SMcVBxBv0E8QLyWpzvqJPACH2OOgK7e3JPGsWi/fYEpckAi5IrPcqBELyelj2Je7X8wTY+lazuLl+MG8RROMv7pJpjsk06mg827lX+zhSYAw6B5wISXI68QbQtxgMeWQgjwxmVSsc+J1QhBqc+lrMXpRL527jhhbaCQGNU1cW1RqB11uxlZrt8xlynJzDRLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44Y2CCCWxQKP60dWeGHq64jjInZ6rzsVjuUlox4RpZo=;
 b=Fxzg7faevXk5mhyOMqTn8dE42LlEeoJN92OxI+TQM1y/kLGJmMrkTMGV5T40YpmTgC6/glLQ1JLFrLMv7m1uBBsInt7H9rWpAmu7ZAqOkW5oScBUwuQsCR0RQQImLqhtRRDhuhtsAPnV9AGIkmt8Dzd5IdQus0gZEVvON1EheyMMna3KTDao/EbSCu1c8zlGaSzlH1hRogzeAndVkptwRocj61T7HgQTfJeRiZtnXSwK4/Cj/hBulZhWuKtAz5SmmR5mvsIwmeqYhkv/imcPMQDSpdbfwkRQvoJOUxroO/nO/BQk7twpIsqexTF+Pm47dEtfPhlsIhp4fhLEdE2v9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44Y2CCCWxQKP60dWeGHq64jjInZ6rzsVjuUlox4RpZo=;
 b=mu3F0k7zWrO35NhgMx/UO4Hs+PuqMFSOPWrebXZKtx9/s6L+X9vU5tl8O/rU3nSysjt0t6LZpLGK+H+ooMjVs6Ue19ssR+oUSeGfx//ZBGpRBVV7I4L7n1x2h0Va+aNDaFZXhFKS1vOgL800tsXS9JNkaaw5chxCfvvYQQsJT6k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4183.namprd11.prod.outlook.com (2603:10b6:a03:18e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Wed, 7 Jul
 2021 14:44:22 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e%4]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 14:44:22 +0000
Subject: Re: [oe] [meta-oe][PATCH] suitesparse: Update to 5.10.1
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210701144959.14642-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9aa4ac73-9e13-e798-8dfc-5880ed1c4a04@windriver.com>
Date: Wed, 7 Jul 2021 10:44:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701144959.14642-1-raj.khem@gmail.com>
X-ClientProxiedBy: YT2PR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::6e79] (2607:fea8:c29d:d7c0::6e79) by YT2PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend Transport; Wed, 7 Jul 2021 14:44:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 764934f2-3886-4c39-0ecb-08d94155b517
X-MS-TrafficTypeDiagnostic: BY5PR11MB4183:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41832E6B68494D40F47D029C9F1A9@BY5PR11MB4183.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6ds8A1syAOolX/dSNtcZ9eBNjajv+Xl74jk13oOpyStY8m9tqR4GKzlontI6snjqhmi8QAOa9XMp5ULCYPoDlNxHdFn2DWU3bIGl/zlbBz2rASLaIbLr0KZdU0G91Fd6JXIp3ryANu9P35Ra+2h5Z+pjhuY/yun+M6EmUwJbmLorGNTy3Nqv4Ff3er0eqFmfZlRV9mewqBoL34RDez2/E5QbOHajjhddwTKd+G5Besm10vsJEnaqcLKSZhm3GbGEWsw3ZLxOyWrr1iUWnQjnguKbATlRg8Zdz2luZfCX96XXaVXTet3UdX00rIuc1KWwqvourbCRUQjJIc+y/4aMwdJljr3uhmSe3r65MBdBnU477rqLo2FHdceAhqkjaUiohMqHcSX+7jx6CIadRBVp4sxULAVzrLi1rhk4KNgiX9HZaG/Yb3e4+jwNa0xyRA3iJAABSkGs7Y4NASFPdhlOYelP7aTzo4hjO+Dy2iy089hHRaQWwjXbN5hGi1nCaIg/248W+3YNWUfXVdRcqAvIAe0QCHBC8cQFsKqZ4kS5fnD5YMWlUWhzzzq8O+qTzTspeaoH+YzER8UJZeBGkGXEo+tMHmFXwxauJSCnB/cJjrYMtZpmUTuMb10T249gCyvDPRZTWGkgHGT1LyddvTZZfmEDWiiSRQl1Cv2Ml095BNn48lgijteVR9x1GW3BDm3WsfjyxsNevM1+no/4MMNygfZWsPonrIESd9go/MzCQEHtrgq5KqnoJc6X6WsUkAA4AHcqAnfNGQAitDi4Qi++bAkHBSJku01mV87iSpbybfYNmA8/o8wIdXZAELYzySukHkxLU1DAyhWPbgC4rpOR4XIdjJZCQfR+iEFq4ZxylUo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(376002)(346002)(396003)(31696002)(44832011)(31686004)(478600001)(2616005)(8936002)(66476007)(66946007)(186003)(15650500001)(966005)(166002)(38100700002)(53546011)(316002)(36756003)(5660300002)(33964004)(2906002)(66556008)(8676002)(83380400001)(86362001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U0x4bFp5d2E5b1d0dFhMZjlwUWJvVjluZ3JDMkErdmJpMHg2UjRoQjRvVGZ1?=
 =?utf-8?B?bWp6OEU0MjNKcW5tZDkvS3pOTTJwWG14SVdZNEw3QlI1WEh4aFdZdmR4SFlK?=
 =?utf-8?B?YmkwZkVvUXpRWStRb3BNYUdsQ3EycklpMWhOWlFPQnBVZmh2NVRVRm4vUlBP?=
 =?utf-8?B?aFl3cHhVSnRkVGpsSjF6c2dqdmlmMXUrSlhZc3B1a1VEUktZQ2JNVjgrV3l4?=
 =?utf-8?B?QjNTa1ZPMnVtV1BzOTJZQ0k1YjV2d1hQcmVuMmdlVlh0S3lVY05qWG1Ia2hj?=
 =?utf-8?B?L3FkV3dnWldaZUxOeUtsRzhjNmZDSDU3bk5Qa0QvYXdFeU1lTnliT3J4Z1gw?=
 =?utf-8?B?RGY4Y1RXdDNDc1JwM1l5aDJ4ZFphdlVTUWRnTU12VkN1cEpPbUo0aVdoUUxZ?=
 =?utf-8?B?ZFZnRUkrSWkvWXdncUN3UEx5emJUTWtJNkZjd3hSRHNhYzdyMkdWVXhLWGRy?=
 =?utf-8?B?M1plRE1PeEpBNWVZVzJuSTQwSXYvOUFteWdtR1FqM2swYTJXSmFKb0ZjY1Mx?=
 =?utf-8?B?ZDVlUUxUSndpbnpIS3BSUllzR0dYTjMzQXBVeW9tUHRpaC9XQ0N5NkFhQWFS?=
 =?utf-8?B?Rmk0YnRpem9NSWJBcTZ2cWs5QTJ0QlZZaG90VFI1VUdtMlduRVpOVFRvaVBK?=
 =?utf-8?B?bUhDR2hxRzJlalI3Y1RqK3VHNlhXZTBkdkVjekwycmsyYld0eG1Vem8xSXRU?=
 =?utf-8?B?UU9YTTVybEloMnhrSmJCRlhiOHVPb1FyK1FOOU5Pa21mMG1XUWNEU0I0dms2?=
 =?utf-8?B?S1FYQkpNUm5zaTdJMTJnaFRUMzFsUW5oTFlKRmF4KzZmM2svdWVXWU5RbnhZ?=
 =?utf-8?B?ZDI4SzNDY3VoelFPc1QzZ3Z2Y3BiTUEvN2tOeDVNOHRqRk9mdm9FTUMxaTZ4?=
 =?utf-8?B?TFBzTkFLQk5uRksrWUhEZXgremFQanVLUFoxUGlWT3JWOUpYdXhDM09IR1JR?=
 =?utf-8?B?WWlTbGdRVFhENis3R0dNMkxzbC9LVGxKYUtQQmJrUVNZSDRmc1NhcktuSTBt?=
 =?utf-8?B?YzdlcWRiRkVWNU00V20wKzJIRlBHZi9aeVlvVVNxVE1XOHV0Zm1jY0xIT3Nh?=
 =?utf-8?B?V0ZPNkhPZDRxcTNqRnYzdlRZWWpENldiWkxhTmV0bE0yOFcwMGZIdm5zN2RZ?=
 =?utf-8?B?UVcySEl1NXgveDlabGNKTmhjakxMSFcvWjZtTTZlQU5hckl0cEF4WHRXT1NX?=
 =?utf-8?B?dnRyTXV2RU5xTXlCc25ydWdCUEUvWjhzbzFjM0pWem04RTdBMlVFQWZiK3FL?=
 =?utf-8?B?SVZRcmhhOXY5MDRLTkJRRWhlckN4Vm94Q2swVlFhNWFzaTIxWXFNNndiRTZh?=
 =?utf-8?B?S1FTWUQ1WEVoUFpyOENjWVVpc0pQQnBaV0dvVlNpOWdiR2pramNKOUNtV2NK?=
 =?utf-8?B?QzdFRnhEQ1N4KzZDTEZlQW9PZmxMUTBsV2VobU9hQ3p6N0NHY1RLWW8yaXFy?=
 =?utf-8?B?bUxsY3BScWNGM0xGNE1TbW9LWkp0NmZFcDVteVNlWU54a0pmUTFUakVnWjJW?=
 =?utf-8?B?WVF3amFXZU5EdGJNL0dnNFIwQjRrY3FHOG96TmtEQ1B3OUp6bE5nTkRETmR3?=
 =?utf-8?B?ZnlxNWwyM25mVkFTeHBvUm52STdYNEpkY0pLUS8xYUcvUTBqOFd5V0Z6YU9C?=
 =?utf-8?B?eWZDNkJMRGRldFdkRE9XdlR2b2t2dlBXNXhpRHg5aDFjTXZ0QVJwTnZrVFk1?=
 =?utf-8?B?aGZwZ1ZJUzVVV1dpbnBFK2dWNm9mcWhsQlN6eWJrdnhTZTdZL3pRbXdySEdp?=
 =?utf-8?B?UmpONGpkQW1TS2xCTStDZXhCaGtKNFhRbHZYWDk1L1BCT3NBY242OWQwUm1Z?=
 =?utf-8?B?V2h4VTJZOVhOWE1sOUZ2UT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764934f2-3886-4c39-0ecb-08d94155b517
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 14:44:21.8247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcY+8rZ1Zj4YJcAlE4ZP2KzCsWRyPKEnK5lzskQ4jo91UT/f4mm5EwjHeAcJwprR7RN+1iZDFdOF1tunKO7dnpzyRocni7AphNxE3s/PChc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4183
X-Proofpoint-GUID: QjTAg3jLoJxmBZFxTO-qL91SV2vSBJ4q
X-Proofpoint-ORIG-GUID: 6dYTdASe_TAE1iov2cGye0dfymrX14Zh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-07_08:2021-07-06,2021-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070087
Content-Type: multipart/alternative;
 boundary="------------56F8320C5A38817DF304DDDF"
Content-Language: en-US

--------------56F8320C5A38817DF304DDDF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-07-01 10:49 a.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Switch to hardcoded SHA in SRCREV instead of tag
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I am seeing a failure at the do_populate_lic step for suitesparse with 
this uprev. Can you confirm?

- Trevor

> ---
>   .../{suitesparse_5.8.1.bb => suitesparse_5.10.1.bb}         | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>   rename meta-oe/recipes-devtools/suitesparse/{suitesparse_5.8.1.bb => suitesparse_5.10.1.bb} (93%)
>
> diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
> rename to meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> index 9ccf2d0bff..1e165039b1 100644
> --- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
> +++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> @@ -5,11 +5,7 @@ SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https \
>              file://0002-Preserve-links-when-installing-libmetis.patch \
>              file://0003-Add-version-information-to-libmetis.patch \
>              "
> -
> -SRC_URI[md5sum] = "c414679bbc9432a3def01b31ad921140"
> -SRC_URI[sha256sum] = "06726e471fbaa55f792578f9b4ab282ea9d008cf39ddcc3b42b73400acddef40"
> -
> -SRCREV = "v${PV}"
> +SRCREV = "538273cfd53720a10e34a3d80d3779b607e1ac26"
>
>   S = "${WORKDIR}/git"
>
> --
> 2.32.0
>
>
> 
>

--------------56F8320C5A38817DF304DDDF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-07-01 10:49 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210701144959.14642-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Switch to hardcoded SHA in SRCREV instead of tag

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    <p>I am seeing a failure at the do_populate_lic step for suitesparse
      with this uprev. Can you confirm?</p>
    <p>- Trevor<br>
    </p>
    <blockquote type="cite" cite="mid:20210701144959.14642-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{suitesparse_5.8.1.bb =&gt; suitesparse_5.10.1.bb}         | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/suitesparse/{suitesparse_5.8.1.bb =&gt; suitesparse_5.10.1.bb} (93%)

diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
similarity index 93%
rename from meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
rename to meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 9ccf2d0bff..1e165039b1 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -5,11 +5,7 @@ SRC_URI = &quot;git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https \
            <a class="moz-txt-link-freetext" href="file://0002-Preserve-links-when-installing-libmetis.patch">file://0002-Preserve-links-when-installing-libmetis.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0003-Add-version-information-to-libmetis.patch">file://0003-Add-version-information-to-libmetis.patch</a> \
            &quot;
-
-SRC_URI[md5sum] = &quot;c414679bbc9432a3def01b31ad921140&quot;
-SRC_URI[sha256sum] = &quot;06726e471fbaa55f792578f9b4ab282ea9d008cf39ddcc3b42b73400acddef40&quot;
-
-SRCREV = &quot;v${PV}&quot;
+SRCREV = &quot;538273cfd53720a10e34a3d80d3779b607e1ac26&quot;

 S = &quot;${WORKDIR}/git&quot;

--
2.32.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------56F8320C5A38817DF304DDDF--
