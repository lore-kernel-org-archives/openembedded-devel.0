Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.83])
 by mx.groups.io with SMTP id smtpd.web10.14789.1600180240414382497
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ms/oJqmg;
 spf=pass (domain: windriver.com, ip: 40.107.237.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmR45ue0X+kk+WvDz8l+rDcZqyb9H+IDJDKvxrxhZUTTCirb70J6j2uGjvPPrT0YmSd3FL4yYw0F36J6WPEaUaIs0SnBv8PlwDe0p9uODn5I1RhAre7EXT7c/ihI6l3jzPxFZYBUp+Jepm2AqrmwwfDPuGSpuJynYRWhdNJItkeLCHTThhiJGUJZ1lrxDOHhBB6E5zhgcRVsZBeORG0kIxMN1d1UczjhvPK3aKn5oAyQVDsHmUxsKK4vo/+W1Sn2JCzwLtbK1Fin+I67jhESoRe829ZoGVKeyavWGE3qNDrbXIyqFY11f/AbQVzgm53LmYpf7qxzgt72tfvOKFaMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oPLB3PIR5GCenArZ/zNTPLPEVgms1toFjNERXAItiU=;
 b=LKi4KTmqnoNtgpiKuUFbtwAOm5EO91YSuLqsGhUVzYk2wEnMlT8yzQZVzAD8Mbp8h28o18NmF4nMSLBq4dK9LjtUG0w1imdKyjQj0LhQ+RvWj8dTXiIdMDtOsvJyWM0edcrHu5galaOZIL+/166+NT2P/iT7k3oMADfunYTzv7a2ckjNmCUa2IojQ2HkKFoG07m81G5q/F9SnG1cDDVh9GQ6B6VwkaT/qMq4Rs3FvCra6gffTw9G+yyFHCv7lkq10RpD4XXXEyH+/49FTXqr92xQdyPqbXv3i5cJKs8d0j8zH5xeOBlNyguJu0kwnU0Dxn/i5OmNBIfBXDeVnyRgBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oPLB3PIR5GCenArZ/zNTPLPEVgms1toFjNERXAItiU=;
 b=ms/oJqmgctpVsw7jbwGM9nepkl+PlTmVPO+MlJtBsx6rzopnxNdIjklWIRu3QstWlDHp5tntyh05x1+0NxXzVINaGYy71ry3ZjUQbvQrOkhUQq1atkTma30dI3vSyoQQ0qY/Eg4mUOfSBpgb9zRYDfEJnsl0iG9BhyVf3u6en+Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3767.namprd11.prod.outlook.com (2603:10b6:a03:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 14:30:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:30:38 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-haversine: Upgrade 2.2.0 -> 2.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
 <20200914131536.6072-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <67e584a4-8a44-224c-6648-e5fd98416b49@windriver.com>
Date: Tue, 15 Sep 2020 10:30:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914131536.6072-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.19 via Frontend Transport; Tue, 15 Sep 2020 14:30:38 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5695e77e-57a0-4886-152e-08d85983eaa2
X-MS-TrafficTypeDiagnostic: BYAPR11MB3767:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3767BDE06C8AB1FE0F6CADBA9F200@BYAPR11MB3767.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UQJoYJvVrrMtdAha+0bWOYLk1CiCF4gURB30ngbFhz2N4awt5DWT0NatW3ahyNOo9A6w8Itbd4S93W3QGFVOe3MGexZC5U1FDMn33QUmkxb49g9tYYuriNWA/qucFwNFyC5jJ2Dv7CuHLXMV+5K2wSrj6TKXoJBsjiAxqI6FBTeKGrugKJYnisdMPuMEVDFbHW6SCsU1zVrwrzd+lYotOdWVFr/ffJEOCBQZ/YyqZDjZnWf1JPNM0NneBCfTR5rt3IbCQbtgTk7oEYr77FeXXpjfa9C+9V/ON2yYkJ8sSymZ+Wx7UKW3yWJLSd8y0iZALTztbDgt7iZ6m/9qcTZzW/8NyMxNOgW/M7mu6Lb2SMu1o9Xty1/H9yjdt3Cka4/BWl0OZY+aUwf/h6Xa8UrDTfqkFd+OAC6aT/+2UmGeUEIqhhTq+nubgAS8tRdIRDr33/hfD1jJPYhWWKgnWIsd1A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(2906002)(966005)(66556008)(66476007)(66946007)(478600001)(33964004)(53546011)(26005)(16526019)(186003)(52116002)(44832011)(5660300002)(2616005)(956004)(316002)(16576012)(36756003)(31686004)(83380400001)(166002)(8676002)(8936002)(6486002)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	iZ3nnjPPbSPcmuyE4FmcgRIXvLlp58XEMUZ2eNMCueWBtRst9Vf/dnVv1ArkHlBbgLkCbw1bLHeAICBgHXn7ZCLTS0+joaAnGlqXMEjwZtIhCSBGe17dQHQMODfz2mRhLvrzcXedseqBR53SOto3OwGhNT9vxcrLuWgjHTzp0kAgJWf3LF6gjlAJS0Xw+dJRi80DpF2uASHn2xGVedhKwXoqkmsFnwjkkAMCCvvFSsFxfACypJ5C8ZzESRfYANq3w0RyE5ZZkyMJueHj86PlcmobDeNPQkhmnlns5xQavU2j9UXd6WFr1d8iRdSXfiJaMV6hJNbo00/Zcu4CnZzWUR+Kwl6l76SMUhdB+D71r41zuX8h4ffyK3tGXcMNJucFrLEKlkIkWnXyOUOq85YdfXUiaiAPsuWLT3ZJINEtXqjLobcJyi8KLEnOI3Yy53qutl8lfd2qq/fye16zP6V3DoChk/71uRZJ5CuR82/FR4w197iy7j1Pp9SJ1LcoIsrhOL3LyJgitwTelLwjb0YvDF5cMjUuGGHIZtrjZcvEouvhnhQBmIbbjVTJygPl5+8dMBD6rYo5AnkLTNqE20EHm1wWRhbpED21y+G+qPcjeuUB6xZJLGhAla0CKH+Pb0P5RA9oKpWz//SnZlynjise5Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5695e77e-57a0-4886-152e-08d85983eaa2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:30:38.6922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzkUFV9t3nCRkIFRYRYl0Es+WohHoA93yN0bZBgH5HeidIwzHZry6y778q18BfMUbK970SPWAHJbZM7B+U0d7uWMx/gozN9OgNr1zAYW4eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3767
Content-Type: multipart/alternative;
 boundary="------------26D8A9FB5CDC62D149FD22FE"
Content-Language: en-US

--------------26D8A9FB5CDC62D149FD22FE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 2.3.0:
>
> - Added the comb parameter for haversine_vector
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-haversine_2.2.0.bb => python3-haversine_2.3.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-haversine_2.2.0.bb => python3-haversine_2.3.0.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb b/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
> index fc2cc7d6f..6e02fcf71 100644
> --- a/meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
> @@ -2,8 +2,8 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>   
> -SRC_URI[md5sum] = "6b1badeb63aac6214c978d07a4ecd171"
> -SRC_URI[sha256sum] = "b710aaf32c442a6d04aa89678be55e3f6c11f9752fc01c216e89b13120b36269"
> +SRC_URI[md5sum] = "ff2d43a74195ec00c42ccd5da2a3f3de"
> +SRC_URI[sha256sum] = "72c76855ac25e6ad054c7ed380e95c1a96803185f005dd11f40ccaa9620b551f"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------26D8A9FB5CDC62D149FD22FE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914131536.6072-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.3.0:

- Added the comb parameter for haversine_vector

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914131536.6072-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-haversine_2.2.0.bb =&gt; python3-haversine_2.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-haversine_2.2.0.bb =&gt; python3-haversine_2.3.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb b/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
index fc2cc7d6f..6e02fcf71 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
@@ -2,8 +2,8 @@ SUMMARY = &quot;Calculate the distance between 2 points on Earth&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302">&quot;file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302&quot;</a>
 
-SRC_URI[md5sum] = &quot;6b1badeb63aac6214c978d07a4ecd171&quot;
-SRC_URI[sha256sum] = &quot;b710aaf32c442a6d04aa89678be55e3f6c11f9752fc01c216e89b13120b36269&quot;
+SRC_URI[md5sum] = &quot;ff2d43a74195ec00c42ccd5da2a3f3de&quot;
+SRC_URI[sha256sum] = &quot;72c76855ac25e6ad054c7ed380e95c1a96803185f005dd11f40ccaa9620b551f&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------26D8A9FB5CDC62D149FD22FE--
