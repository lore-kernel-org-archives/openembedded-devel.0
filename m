Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.73])
 by mx.groups.io with SMTP id smtpd.web11.13473.1616422631165544917
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=deFJUS5x;
 spf=pass (domain: windriver.com, ip: 40.107.243.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqwp2AMTpF7/IM5kBtwaYCbttQcgDwBkjD6wFarYvzXDd200lfeP20Y9V1RQM2GxPMGjaipr71nzfV1j8exJ0sJAnpgSDbEbYP+UqInbpshynhPc/CUa/DtrpodFM40pGMMjBNYEe2WAPeUu08jvx6nZBeoYC4M3Iw9qypsUqA+ejjSmMljZhdDPwvS+LUTrRmVNG5qe563y6KfcrbgEhQ9du3QA/ZVUnRw1TQN1pAKAF4EbAm8/wOxn82fUJB9epOLuuw4OfTm8Ia5L9Y6jhgoDJIp0JdyJzq6ZJeHBOhIhY5kbfsLYfc5NwEPmJtVDENlVr4jI2VlgT7Apm/j/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFa7/X/jOK5pdcWJmFi4UeFZwEW6h/nENdN8Pfy8tvE=;
 b=DGcOxkT87G98ebZX55fuxgySwAOQAh1u6RZ0qWA6N6Fa23auPWcLA8BiNPLtRaXtAwKEwyGkPe4QAQc+zDejgdrGpA3qtJ6DNm9bUPT6vsk7V3mpa245PJlVeCJPwHUal0atnuuyi2lNwmP1cj+w7Or7X4Ulq0kYriihdYNSDYPSJRCzda4Z5GcjG/O2H4IJCRjDz0PnaouPRglURVGvVPQnl/1rdEJ4VdrPW8hCpDBR+Wb1e6l0s/pv1Hvv1WCe6JeKYOk/BSS7Gs1an3/wGeok9SrxVoSmgfzcF9bs4SMuUutrhib9QLDOWi9e5jAKooE7x+3Xpk/1JsnLbyHDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFa7/X/jOK5pdcWJmFi4UeFZwEW6h/nENdN8Pfy8tvE=;
 b=deFJUS5xV/c/4ZZlGRa8Kzb63FytQkWcmvcP5v6Agk93VkVU3V6xJ6ySnJOBZd5y/Tr2EpgnqoXpDsnD6coagFyiz5ABrlBgF5nGkaPZFm3yxZUlxsNLD8WKV23qMcWZcykuEr2BFxwa6o6juTvrmO98WT0bhtJXNtGvtVUyCr4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 14:17:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 14:17:08 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-cassandra-driver: Upgrade 3.24.0 -> 3.25.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210319171304.28090-1-leon.anavi@konsulko.com>
 <20210319171304.28090-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <34b4438d-2a17-0350-d8c3-52f26112db0e@windriver.com>
Date: Mon, 22 Mar 2021 10:17:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210319171304.28090-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0700.namprd03.prod.outlook.com
 (2603:10b6:408:ef::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0700.namprd03.prod.outlook.com (2603:10b6:408:ef::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 14:17:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9f3da6c-3382-479e-8d6f-08d8ed3d2d5b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3256ECB98EA179851F1A30669F659@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/3NHzYQFqw0EiQtue+tyIKNF29d+MEDW7vWIaseWz9XDt9zQsCbq8dJaVEVNQVwk7KbNeVg3cBK57izqKTkvUTdc26+fKt29iusqMUxNGLuZIM8+2yS23PpkgUXQ+DIkoq7mD8ktmHeZNrBxnbcsUXOiIP3tenCnaFj0Kmi/CUKKcBzs/XsgHlekMK2lprC7hugNZA1+F4F/8bNDnHhRq57vTCBMv6OThx2p1Y9PKsiDLh/U4y2F6XRdPwhm+2tbRXWNcV/jBUKpNt9OcARFKfXLblNH8jnGFBegAYOxSvMalLrV4FvfN1t3JirMejVjQrG87QAW+pWp73lCT27HZocELn1Azf6WVeeS9kPkS0LMvu5OfiXc2xQUrMcBHL/gAuL27D3lW0uwXPdHxVDeT7AVO8DFEWcPuJLHD25NaZvMxlaDTzQSpt9jrh8EWuhq+BDBe3KbqjfDasRxRbXXZ0sif1wvgtQ088HnHKtog8WAoLTT9rewgYoNVPehCgcr1LyR6XIT8A17feE8PgMlUEv86hA81ZqNO7TXhnB/RWN/tJ2ypSQ88W/2L3DUEbim6+3dLoG12Q2NRMch/8hUwMsqh7za//w2qcFz9bnfHBM+RHoHHQC4OyowBQXV47Xp3C22NK0keDhtU0Q4dqdp7ur/oVWjaQ9vCvjjcNHmc05h7nRtafp1EevwjtAoA4efmfO1XEx5tFPR0f0Q90vFX8zVP14oiFHyWrNl014in4nwtrJ2YHL+GZZtwjgj2EZutxPXL0RCPd9u+fAAs4GRos1ETidfo1snTxtyh4u1unE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(8936002)(44832011)(53546011)(33964004)(5660300002)(8676002)(166002)(478600001)(6486002)(966005)(2906002)(2616005)(83380400001)(31696002)(956004)(16526019)(186003)(36756003)(38100700001)(66946007)(26005)(16576012)(66556008)(66476007)(86362001)(31686004)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YlYwZ3JEeWN2RzR1emdLcEhhMlhaMVA2OHhQRWkremxvVmQrWDBWZFlBa0tm?=
 =?utf-8?B?YXhNQTVDd3pUSFBmTStsOVhnMG8wNDdZMGdDMzRLMFk4Vjh4ZmN6SnZickgy?=
 =?utf-8?B?YzlhdkNTRjV2blZCZjk1azNMbzRCKyt5TzhyYWIxY25LU1V1UENQSnY4U3ZF?=
 =?utf-8?B?Zi9RYXAycEw0SVIzWWhFc09IT0k5bGViRHU2d0t4YmExV25YNFFBb0t6Rm0r?=
 =?utf-8?B?VUJDdUVhVTFCZnhtelEvcVdXcE5XbGJsYi9XeDJJdDRTWHZsSUo1TzNwVUZq?=
 =?utf-8?B?eHdpTFIxa1YrRmF0RzBSdXpoTG1idXZmZzdpa2Q1T2NTRlk4NGExWFhsTjAy?=
 =?utf-8?B?SzRNaEptZG9kT0k2Z3RldkljenhmUkE3b29VY1JEVkxTaWc4dTRQVjRFa1o4?=
 =?utf-8?B?alVtaFA4aDdSSEpITHkvdzNOOWlYQXU5WGhGS05ycFg3Vk1JVUR4Qm9DV2gv?=
 =?utf-8?B?cUs3WjJwcUYxU0NpSERGcHBXRGJJL3NFVndhNGNkcnlieWsyRXB3N1ZyMzB3?=
 =?utf-8?B?Q2FGeG1Qb1NjQ2VTZTVlOTN5cjFsRHMzVXNFeSt2TUZ6Zlk4cDk3S1NoMGQ2?=
 =?utf-8?B?cVJrWG1vV2Y5RnY4UlFPdXdsc25QZVFJOUtKYVJsVE5uYW83SlhUdy9ZR1Jo?=
 =?utf-8?B?T2o1YUpkR1I5ZFpqdHlIMFJuY05NZ0htdWJvb3FMeXBKVGFuc3ZEK1dMdVp5?=
 =?utf-8?B?S3llaUdmMS9EWjhXOU92TW5FUUpEeC8zdWZnZTI5LzFyNTh4aERDZng2VWxs?=
 =?utf-8?B?VUNPQmc1Y1M5ZEdNaW5Lek5xcFJBelpPN21EM3NJOHlxZ0dEcnQwYnJ0eDZz?=
 =?utf-8?B?ZWdmNHZwenhnZlU2VDU4aG04SXpIQnNkZUlaeTlJdFdZM3NjL1RwZDBpNWdI?=
 =?utf-8?B?YjR5ZnUzRlRvS0VOcG4wSGh1RHJ0MWRNZWZWdy85bitBa25nays4dnAxSnhU?=
 =?utf-8?B?bjE4RnB4dEk2dzR5dzZEa3dLcUZFN2NWVVZ1cDN2Y2VSOEE5clc1QWhVakJ4?=
 =?utf-8?B?T1VFS3VpM2xLQTVtc1hPclY0ejRaSzl6WVhZbkE0Q3IvWk9TNzY1cE82YzBL?=
 =?utf-8?B?MTZYaVBuUFJYS3dFaFJFWDd0UnVrU1RXWVBNN3NseGk4amJLZjBobjBscGky?=
 =?utf-8?B?UE9WcWtwQkxMR2E1NVBNSlVkQWdEcVdNcWl6YkJjVitNTWpST2lYeU5mVGk5?=
 =?utf-8?B?bHBBUWpGRWNrYjZhWEI0dC9hV1Rra0FHVU5tMlNwRUVMVWJDaXJhSVI1U3Jo?=
 =?utf-8?B?QjNsaTZ3d0RFL2tNckVCQmtjUWh6MkZ4enkwbEhqM0YzUTd3LzREVGZSMXNN?=
 =?utf-8?B?eHFWYmFXRzA0bFdxcXRmeTlWYXliMXBGMG4raUtUVytoNFdnTytKOGgyNVJ1?=
 =?utf-8?B?TFpQL0RXWnpIVlVvNXBNbW02aEdVKzAzTHVpZndaY1dDVmI5VERxazRWUmRv?=
 =?utf-8?B?N1R5VTVCVDhQSU9Xdkg5RlNYZFI4ZWErVk9GTVA4VFBlTlRDVXV2bDVBc002?=
 =?utf-8?B?WjcrUkJUd2ZoQ3pKZWl2SEwxcmMvZzIyTFFoOU0rd3NybzB4eFFSN2NjcE1F?=
 =?utf-8?B?NmxrYzVGbTVwMUROTmZKSnZQaHppQnNETGZDME1KUXJLV1pVYTd4UFM5OG5x?=
 =?utf-8?B?aWg3ZFVQY05nSXpjOVZQQUh0OVVwOUcwdXplZ0Vxcm01Y3dJZlNVQkxFOFE5?=
 =?utf-8?B?ZFFyUDFvWXhWZmV3M0JRTVY0WDRjdXdWRTBmaWw5RGRsd0Fjb25Ea2QrQ29t?=
 =?utf-8?Q?EgPolBl2dXIimIX+VFy3HBFS/Za03KXE7/W++kd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f3da6c-3382-479e-8d6f-08d8ed3d2d5b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 14:17:08.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSG4RxaG/NTPF/7SCQuw6cyE6hkE2Ye3q+xK7ubGDzpSUdDHD7uTTjfLk0GIaqQN/yi4GbSBR9LhHAaNaGBttzwIly5aZbEvWciroadNkIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
Content-Type: multipart/alternative;
 boundary="------------6C1EC7C25C987C7861F7498E"
Content-Language: en-US

--------------6C1EC7C25C987C7861F7498E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-19 1:13 p.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.25.0:
>
> - Ensure the driver can connect when invalid peer hosts are in
>    system.peers
> - Implement protocol v5 checksumming
> - Fix the default cqlengine connection mechanism to work with
>    Astra
> - Asyncore race condition cause logging exception on shutdown
> - Update list of reserved keywords
> - Drop Python 3.4 support
> - Update security documentation and examples to use PROTOCOL_TLS
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...dra-driver_3.24.0.bb => python3-cassandra-driver_3.25.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.24.0.bb => python3-cassandra-driver_3.25.0.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
> rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
> index 562829028..a1941bf3c 100644
> --- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
> @@ -8,8 +8,7 @@ LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>   SRCNAME = "cassandra-driver"
>
> -SRC_URI[md5sum] = "c31bc29989d8b0c7524a38b0e38c8bfb"
> -SRC_URI[sha256sum] = "83ec8d9a5827ee44bb1c0601a63696a8a9086beaf0151c8255556299246081bd"
> +SRC_URI[sha256sum] = "8ad7d7c090eb1cac6110b3bfc1fd2d334ac62f415aac09350ebb8d241b7aa7ee"
>
>   DISTUTILS_BUILD_ARGS += " \
>       --no-libev \
> --
> 2.17.1
>
>
> 
>

--------------6C1EC7C25C987C7861F7498E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-19 1:13 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210319171304.28090-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.25.0:

- Ensure the driver can connect when invalid peer hosts are in
  system.peers
- Implement protocol v5 checksumming
- Fix the default cqlengine connection mechanism to work with
  Astra
- Asyncore race condition cause logging exception on shutdown
- Update list of reserved keywords
- Drop Python 3.4 support
- Update security documentation and examples to use PROTOCOL_TLS

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210319171304.28090-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...dra-driver_3.24.0.bb =&gt; python3-cassandra-driver_3.25.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.24.0.bb =&gt; python3-cassandra-driver_3.25.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
index 562829028..a1941bf3c 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
@@ -8,8 +8,7 @@ LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93">&quot;file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93&quot;</a>
 SRCNAME = &quot;cassandra-driver&quot;

-SRC_URI[md5sum] = &quot;c31bc29989d8b0c7524a38b0e38c8bfb&quot;
-SRC_URI[sha256sum] = &quot;83ec8d9a5827ee44bb1c0601a63696a8a9086beaf0151c8255556299246081bd&quot;
+SRC_URI[sha256sum] = &quot;8ad7d7c090eb1cac6110b3bfc1fd2d334ac62f415aac09350ebb8d241b7aa7ee&quot;

 DISTUTILS_BUILD_ARGS += &quot; \
     --no-libev \
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------6C1EC7C25C987C7861F7498E--
