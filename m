Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.89])
 by mx.groups.io with SMTP id smtpd.web12.11355.1610468136606998920
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B7j1BM1J;
 spf=pass (domain: windriver.com, ip: 40.107.243.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTQkutWVr6F9EnO0aiEIC4ModRHaLIsiTcLIqwbZ4dIwlaDYKabRUUfTJ+/0LjhueBZXOGBu4f3xe2v5+vf/rxtAKD6YFqF74mtgk5t84VDuWxagPY4VV4RMiwVb142hX0ro/WJs2WsXPXuzEjvq3ksJFTr6i2kKaJsT+ei+AEhK3RUYSyvVDKPwhnTCNklhm18Xkp+d7SppaIIVPpRN3ecdgwKMwWVqgJeWcChjLB+SjlkoOKqo80/fnOCUsZC9SHjgqiOZM1Mj82Pc4y8CbuRW/vWNvZUkjvASSjufSgOxUjxwwvi6Kdfip9Mt+l1fI5uAz3w7tzVLHJhcHJMl8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJErRs8utwOoAF8/J+BoJD3E/A5EpWuqK50qpyO+9GI=;
 b=WrSwfwxnhSGZfWEzwSiKwikxVJcx/dvjgswVvB9w33kAsKzqFrs+zbKqlM2rlujObr/a9/jDk6CQosijCisBzF6gJkAYcNV901EJ1O8ixdBUpZ6mUPLstirkOe720mqKBGf3hU/f1EsRr8749k0O/ZDUa899aJk5B6T25jp7EOT6w+34WQqWGrg7s53BsklpDChAb76tUsZ3jf/PcH6x3OaB7It7mJ2T/iNLHM6gHhpC41x5Gw1BzJK0JpEowVOPZGDoJi/DXwCaXwadfBUdtjS1DfiIXflvHzh0FH1/AsdvWev1QxRTaoP7VWL+W512cvycelaVjqJ8Mgt609fAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJErRs8utwOoAF8/J+BoJD3E/A5EpWuqK50qpyO+9GI=;
 b=B7j1BM1JjO2lNmV/ij+SMnufKcvKiwcHb8EVyUY5ppf6zzUiZJfMDUWmi46BAjaoeI5qXcoaABMnIUInzQEBh3o5lvTOmEtVjdeoysg3p9RN+l4RCowSEewTe4Gl31zZgR6eYCnnA8qZongiQR0p2iNrUogZKG4Qcpd/tfCFcUg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4370.namprd11.prod.outlook.com (2603:10b6:a03:1c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Tue, 12 Jan
 2021 16:15:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:15:35 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-ptyprocess: Upgrade 0.6.0 -> 0.7.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
 <20210111152512.23506-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <93e6aa6f-857c-bc69-7796-2503c69ec8ad@windriver.com>
Date: Tue, 12 Jan 2021 11:15:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210111152512.23506-7-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:c0::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:c0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Tue, 12 Jan 2021 16:15:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ffada8a-00a0-4cda-cb45-08d8b7154b17
X-MS-TrafficTypeDiagnostic: BY5PR11MB4370:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4370F4ABE969C0A6CB4707D59FAA0@BY5PR11MB4370.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XdaPuibSS7YI7+okYqkoG/AP76RK4CpYfI4Rbtz3B7tkn7k2ATn8nxrcj0Bu/gXFHFetcvM77yzToxjQ415rZiQ5BAZe0QFmsQICQzKRBUQrMdOQen3NsUaW790K8RvlriGn4Vi935NHjTQQiUbRrwAFLLCi0NpqdVPHRcDxq3CzsZnyGQIAmYKVHYUJUY+rRZQvTvR494F/x5XEybPUF1pAG2owO31/UhlY28u7x56JYowy3AWjj/9kgcTH//w8p0z/qa4SgXbsrLvGQET7dKAl1zukaRQs+e9RmOVmHVDtDWZgfyv6vTKqBNMbCrEsoSUQYWUoGKQozfaSEby3YNDL+vlely39bPqfgwjLASx0CwByUjIpAO/sCjuH8K8PbbnZIYi4+7FUk1AL68jxVRrRRYWWfMGgDXW6H+ipSIx8mpUc5tuOWg+5MwLKn81bOA16Sm3Tg1GLCx0S5yMmhlIDZyk73mZ9t4Od9+054aQA6B46Un41mTxRSXiCjiOHvylqVRM/As+w6FEBGA0IcBXVErm9hBiagJHOD44TLqm12nr5U41SoH1uk8vOcdnW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(376002)(346002)(396003)(136003)(53546011)(956004)(2616005)(6486002)(26005)(186003)(52116002)(8676002)(166002)(5660300002)(16526019)(44832011)(8936002)(83380400001)(33964004)(2906002)(66556008)(478600001)(316002)(16576012)(66946007)(36756003)(31696002)(31686004)(86362001)(966005)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NDJhRmZJK2xNV2h0QmQyT2RROWIvcENrSlBpUU9td1VyVnBqekFHajNjc3FE?=
 =?utf-8?B?eW54bTN6WUhDeDVtb3JuYVdlYy9mU2dQN2dxR2NNcW5TRWUwOFhuQ3BTaUNH?=
 =?utf-8?B?YjJzQVorTWE2S25NdHRHeDRQcWZ4RW10aW1KZnFiZVJBa01NUFAyV2I0eUYx?=
 =?utf-8?B?OHNsNUlaempGOTVGWG13alMyYUlLa1NVVi94NTA5MGdDSWE5cmhzZ2ZRTXVH?=
 =?utf-8?B?WE1jMWs3eDBoOXFTeTZBRmlpWjd4QVR3M0lZcFdlekVpSWUwamRXMlArQ1Qr?=
 =?utf-8?B?L2ZHMW9MS1FYcnZqWG9sVzRPajRnQzJQMVpDam5GWVhHOEIvd0czTUNFd3hk?=
 =?utf-8?B?eGRvcGNlUWpCUTVXODVOMkRtWU40a1FkcDB2cjU2VEIwby9QbVE0TVkxS0V6?=
 =?utf-8?B?cnFrSjNhTHh1ZzVoekp4MFkwTHdxb09pMk1YNGkrakJ0bTZ0dDcwQ04yTTFV?=
 =?utf-8?B?NStKY01CK0N1cWJhWU5iMHNyWXhCWFhwOVQ2UVBpNUZKL2daN0ZUQVBnY3VU?=
 =?utf-8?B?aE5Wc1F5Y09xZ3FmY3BZWDlFM1JsTFh6LzJvOEluRW4wR2FsYnhpb1N1WUVR?=
 =?utf-8?B?dVBJOTFNeUZ3S1NlTEF3aHVVUHZPOU9CN2R4TFF5QXIvWlFsS0Z4Sk01NDJZ?=
 =?utf-8?B?MEN6RnQ1MmlSZnVTR1BoSTZJN09RakNxTDZOcll3cW8vZ20ydXdUMlQyOFJy?=
 =?utf-8?B?emIzRFkrbHpqSDRoMXZMNnkwbGtsK3FMSWNmb2RORGx2QUdBbnU4MGZSOVls?=
 =?utf-8?B?aTVRajRPMjdnYndPb2F3SGV5dkh1dSs1L08zVmU1NGpzWGwrUEtyQXplaFY0?=
 =?utf-8?B?L0VsUlQ2KzZVQ0FyUXdBUDYrZkxGMG02TFhjNHlINFpUZGxEWXFLZ3dOOElm?=
 =?utf-8?B?VDBGdXp3WEhTcndXSWYxY1hGYjh5b3VQQWFKR0dRVGJhSkpLRVlNSEQ5aWt6?=
 =?utf-8?B?UkhjRDc3ODdNT3BEMkxobUZZamRxckkwdnljQ3FlL0JtMGJKNkZoSXloTTNY?=
 =?utf-8?B?a0dlcHo4emRnVjFoMlpCanhOOVFIMENNUjRvRHJZVHBnNUVPbDFnVmNXR1c1?=
 =?utf-8?B?ZDVMaUQvTzFXWEkzQm5Oa1l3RjhoazBaeElvWXUxcm9QaDdRMUlPOTgzejM4?=
 =?utf-8?B?QThORnQzYkZlTVQ2NVpvQUhKRjRkVTJWYlA2dzVsU3B1NG9KMnovakdUN0t3?=
 =?utf-8?B?aERjS3R3NkRYWlplTmVIY2t5M1dWSWFoWk9jTkZZTGpqOFh0VlJsbjhLQ21D?=
 =?utf-8?B?NFlPS1g5Wi9PYkU1Nk55aU42N1RCK09mbGprcHAwblpJRzEyVkRaWFduQWRu?=
 =?utf-8?Q?RQROYqvN/K+lnYAzNYFWTotJfHFTpml57z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:15:35.3422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffada8a-00a0-4cda-cb45-08d8b7154b17
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mx70QP9qooANKsUi1OSrOPn3zgm1kEb2ypN4/aftP7bMwvSvXVd3WjD6vMeGuSnSZ89yYOewapiVCw2caEb7kq5FkIsGVzVapDVEDfVvMbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4370
Content-Type: multipart/alternative;
 boundary="------------1C1FD849941DE5C5444F1B3E"
Content-Language: en-US

--------------1C1FD849941DE5C5444F1B3E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-11 10:25 a.m., Leon Anavi wrote:
> - Add pass_fds parameters
> - Switch to Github actions for CI
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-ptyprocess_0.6.0.bb => python3-ptyprocess_0.7.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ptyprocess_0.6.0.bb => python3-ptyprocess_0.7.0.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
> index 87911e02e..607c71946 100644
> --- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
>   
>   SRCNAME = "ptyprocess"
>   
> -SRC_URI[md5sum] = "37402d69f3b50913d4d483587bffad8f"
> -SRC_URI[sha256sum] = "923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0"
> +SRC_URI[sha256sum] = "5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347423220"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------1C1FD849941DE5C5444F1B3E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-11 10:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210111152512.23506-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add pass_fds parameters
- Switch to Github actions for CI

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210111152512.23506-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-ptyprocess_0.6.0.bb =&gt; python3-ptyprocess_0.7.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ptyprocess_0.6.0.bb =&gt; python3-ptyprocess_0.7.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
index 87911e02e..607c71946 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490">&quot;file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490&quot;</a>
 
 SRCNAME = &quot;ptyprocess&quot;
 
-SRC_URI[md5sum] = &quot;37402d69f3b50913d4d483587bffad8f&quot;
-SRC_URI[sha256sum] = &quot;923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0&quot;
+SRC_URI[sha256sum] = &quot;5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347423220&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1C1FD849941DE5C5444F1B3E--
