Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.85])
 by mx.groups.io with SMTP id smtpd.web10.34362.1613999960505541139
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 05:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=k4K3YZj4;
 spf=pass (domain: windriver.com, ip: 40.107.237.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtBmpgnU6k101Ae+F7Aquj8NQRuvZZc+HIX5WnpD2dEbS4+g9mX47uXhgRBJx2hs1V54PNoWsh2cfQ0XZcdtJYoNafp7J0qaZ7V8NIXfgRaFpjhMS30oWZ40mvIq5YwNz/ODR8qyNgywjefVU992pvWsrx9AeOnxCOORfXtqoyPRIfwGCUVQislsseWI8uNnI9FRzqkVfWYaAefSFkG2FWn3dYIynxRULX2Xuon9JMXeV1qyrb1P7l6e2IdbvnopaGkoQJTc0wlfTJOJ+Zz0VP2pdB576DXlaFgwO84iWBaWapRPtVazjWbqnNO95jGP5eLpv8C+9Eo0SWpqJC6H/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P78CdWPYgYxjHjOhR7LF+xViQ2gPnpS945hpicz2l2k=;
 b=atPBLrUCxWhLpPY9vy6YHa2CVgcycjh213FTcjdMhgA0JTnw3zYnFtgmbX/URW9UjchjP+MBCJR2i5S7WwbtPmS0+O/5FGJ5JbKK/c/BHZ22aV7YH7V3JpseQJnpyruljIA3SqrF8XN4hSkJYGZVALN4GsT+Q76YOt3BLfcjxw9HwHOAgNXEouwxHUgVEimilHo9HuniK2pIgfDNJROGmy9HYTFivKCK9uvryvXDqre4TxppRiUCMkvBsmhMVX/YKy8lT8o8GVYOCQRacBjFvq8vBn9CNPsolFvd8Kn2Wkh6JR5zZGhG3XB9h2itkz5hluhEHlDP1LPfJZBySP+L2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P78CdWPYgYxjHjOhR7LF+xViQ2gPnpS945hpicz2l2k=;
 b=k4K3YZj4euLmHP2Ekkm44bbmRnqqsnzTGkPrv/Bvv1qv9k/WK6rcNpk8sGXveqdI69c9tSq2De7IQDKIvVqs23quGA2gdvTg+LHLTHjAxgxKh0jw3UEKR9jzX5ISG9DMHqQnrYydyvtAaA73wORpzEsFY9bjKx3+CM9Zn2IhS0w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Mon, 22 Feb
 2021 13:19:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:19:19 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-cryptography-vectors: update to 3.4.6
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210219215522.2368477-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <af46f2f6-4a66-d8e6-06a2-20bb13ccd8bf@windriver.com>
Date: Mon, 22 Feb 2021 08:19:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210219215522.2368477-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0456.namprd13.prod.outlook.com
 (2603:10b6:208:2c4::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0456.namprd13.prod.outlook.com (2603:10b6:208:2c4::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 13:19:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83c62387-8d7f-419c-95a6-08d8d73475e5
X-MS-TrafficTypeDiagnostic: BY5PR11MB3893:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3893644BCFB789F8DBA2ACEA9F819@BY5PR11MB3893.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iJFZ/MvlaLBv+M9zFnrJuvcNCmvOuRPv/fiytzLAcXk9D/2Q+HVGV+1QMkavwCt6CdThV8WUls7MwfWfZR3qMhAyOMzBLd5MN9NiMMet+wOaRhwvksyGIg0Wrch7myXaQLBvaX0t23xuYbGivEj09atgX6I4I3UEPPE5pB9DOcVkrPJNPoW3jphWKjX28Q9B7n1iLZjNxmqungqVUS8hgZcuWcexRQNpvh4oqLXsHpyEFWkTp1cH/HDySNF6wd4m8QggoXma6JlCUF/JdkB/QvJBZaH6D9O9qkYLwRwY7keYo2TY4kPMvqbIDTLCQhGXzlcvMbzPV43VLcgv6cq5UtAQglbd3EtWQRGWxvBJl3hRIf5GFocMpQwWB0DfS3p5dv1yzpYZCdxazzKe/0qdWHatq46PByOau4tvT/af7+ceQjfPGKWQSvv6M9iMDHAB8BQsDtmiR1bW4lUFT7t5bW84uCCbCpTqmQrkjPMc6Fuh910q7rVsK3osbImGYwU2r5unRS2eS5pTff4COAOYFbIo7seb6J6MoPsFMJligQXH7JWjN6pnIhZ8gHSoKLuBGlJRanlKc6/lrgKWUL8t/NOHAE/yr/u4QJ/p1Q0OII1fRUMNGPaRbqrT7bRpXS5FiAu65NORpmgMb4s/RkI9szlpg1bWNw2D2Qvd3761x8b1i72P1+VCtHiUiVaFa2fI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(478600001)(186003)(36756003)(86362001)(31686004)(956004)(316002)(15650500001)(16526019)(6486002)(66556008)(66946007)(66476007)(16576012)(8936002)(44832011)(53546011)(2906002)(31696002)(8676002)(5660300002)(33964004)(166002)(2616005)(83380400001)(966005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ekxkZ05ka0FtZmorMWFRK1dDSGt3Z2VTbURndVBqallkUXFNeHJ3bkgxcGxq?=
 =?utf-8?B?THE5TE5zWnpZbmRKODJnL053QjdZMTBPM0IrenorT0ttZkdxVmo5VGkvODJ4?=
 =?utf-8?B?VVIvZFlEK01IZ2pCZHkyV2RWTFd5M1ZTRWJzM1pPRmJsNk1TcGE1VWUyR2pk?=
 =?utf-8?B?bmtFN0pNT1dEMUw1ZTR3cEJLeER6a3N0MkxjMlYxaXlTcUlzVHJxb09iOC84?=
 =?utf-8?B?KzdjdWYxUFArR0JjUHQ0YzNpT0xYa2VDWWFlK3NSVnRicjFrbjY5OXVTaVVK?=
 =?utf-8?B?QTNOUm5XMzJSSkR5SEdQdFRTcG92anZucm9EbDJzVHFXWkd1WmQySXRKd093?=
 =?utf-8?B?Mm9QZ1pLV216emV3cUpobStkeXZiUlNIUGFzaTJkS1BHdG9PUWxTcHZrWFJO?=
 =?utf-8?B?cjJQalA5S2o4RzhTNm9tYU9tRm1FWnJ3VDFnSnhtWk9ObXMrc1Z3UlRDTDFa?=
 =?utf-8?B?S29BRjVRRU9HL3NvazFPa1I5WHdUU1FyUzdERGQvZkVRNTRGNEJVRGJHOEpi?=
 =?utf-8?B?dytYWHRYclowOTZmNFJrWW1qYzBuaFMvbFhXMWtWVXRTODlLZ0ZweWVuWGFj?=
 =?utf-8?B?eEFyUzRjcjRhaFo4ODBweEh1TVlrWDZ6d1YxTEcvZzVjY1BQcitKZHd3SHc3?=
 =?utf-8?B?cm82ZzkvdkFKY1MyckVrNlMxUk5LbUFQOXNYbVZiNGVZRDBVakFrWVIrRVR1?=
 =?utf-8?B?SVJya0NGMkRwaG96UWJPbUhucVpodGtqTytxa1ZrQkJLem9zNDBiYkMvUjB3?=
 =?utf-8?B?eldmaHhTRmdpVDBYb001OFVXSHVPZmhDclc0OFM4S09RRXpVVnFsZ2pVK1Np?=
 =?utf-8?B?b3JUQlBtRC9hRnZqelZIdFF4TU9ZeXRCWklWN092blFkS2Npd0srSVlKRkVY?=
 =?utf-8?B?dWRRcGhMcVc2NjVLcDlUN0VzQ2ptR1VaNWpXMWtCcHRUajZqeTFyWGZsRGwy?=
 =?utf-8?B?WFBBV29CVDl3UVRDYklTeFZ0QTF3em9uODlDWDRPVDM1RlNrbG1BNzZiczVq?=
 =?utf-8?B?cVRFSklXMXUza3k1UnZucXZ2bUhGZWVRa1czRThSOW5sT3Q5bWg4Rmo3OWJQ?=
 =?utf-8?B?U1BTK1g1d0tENVQ4c29ING5ua1dYZ2tUWFdUMGFiVGoxeUl1WWRvWEVEZXhU?=
 =?utf-8?B?SjRNMy9RaFJTdXNCbTdtN1NFRThDSWZTZHBPR3pTcjkzRFVKZ0xRZmF3Zm15?=
 =?utf-8?B?ZzhtNXJhbUF4OWZwV1ovMThMUFhsMFE0OWU1TDBRNWE1YUI5dXFIT3JsQ1Bj?=
 =?utf-8?B?V0FaSTVCNGRpWWtqUlBUUFBRNFZRaU5FSTMrb2szYzg0ZkVoY0xGTTZNbUFE?=
 =?utf-8?B?aW9CdmRibEdUTzZWS29XZkF5MzhxYmllY2tDd1BvNDQzU1NhcytwUGROTld1?=
 =?utf-8?B?ckFNdS92WEFwTFdZRWpEaFJpNXdqUzg2UnlSa1dGYzJ6M08xS2pvK3BGVkxR?=
 =?utf-8?B?eEF6amM0S211NElrU2EzQTZMd3cxR2pESnRUb0F0RGQzekU3ZmV2TzZWNlNM?=
 =?utf-8?B?dXJMYW1NL2UxaG5hLzZUd2svNE1JR2JXNkprREVmanl3Qm53T29NTGdOeUFs?=
 =?utf-8?B?TzArZGRKVFQ3emMxWFhtTTVTaDVjMEZENGViaHRZc1YzN3p3QWsyZUNvZmxB?=
 =?utf-8?B?Y1MzZ1JOcTczUFMrNmJWL1R4S2FZWGptR0I1NFdKVUxLaXJTSk03aUNBYmNV?=
 =?utf-8?B?eWVEa2tBMngxVnpGV291cWxzL3RYY2F5MXpzanZaWTVIa1VCNDVsTU1hMEdL?=
 =?utf-8?Q?xyGaxYkO71mGRVCbI3TvPxaFwv3FyE4wlhW57Wy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c62387-8d7f-419c-95a6-08d8d73475e5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:19:19.1125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTnn02n6ErbKdWkwcIeUgHVkwode0dy1a4SYwtESpOUojgITakMS3FycxErN5eqY9ua54OU7zgnCV2L8MoZBKGJb1CVjDmSepWFPoGE2Ots=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3893
Content-Type: multipart/alternative;
 boundary="------------818E4BAA77A29A7A999ADCC0"
Content-Language: en-US

--------------818E4BAA77A29A7A999ADCC0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-19 4:55 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...y-vectors_3.3.1.bb => python3-cryptography-vectors_3.4.6.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.3.1.bb => python3-cryptography-vectors_3.4.6.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb
> index bcdbc6adb..b5f34daef 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0 | BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
>
> -SRC_URI[sha256sum] = "03789c305dda8dccb4b8c9c019963a742469d88365abbc82e8e898ac478f5ca4"
> +SRC_URI[sha256sum] = "e5f88a5fb03d60b4f20eed4920638b6a3ed32a363523a77086528d557a2c2da8"
>
>   PYPI_PACKAGE = "cryptography_vectors"
>
> --
> 2.25.1
>
>
> 
>

--------------818E4BAA77A29A7A999ADCC0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-19 4:55 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210219215522.2368477-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210219215522.2368477-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...y-vectors_3.3.1.bb =&gt; python3-cryptography-vectors_3.4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.3.1.bb =&gt; python3-cryptography-vectors_3.4.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb
index bcdbc6adb..b5f34daef 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb
@@ -4,7 +4,7 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0 | BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4">&quot;file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4&quot;</a>

-SRC_URI[sha256sum] = &quot;03789c305dda8dccb4b8c9c019963a742469d88365abbc82e8e898ac478f5ca4&quot;
+SRC_URI[sha256sum] = &quot;e5f88a5fb03d60b4f20eed4920638b6a3ed32a363523a77086528d557a2c2da8&quot;

 PYPI_PACKAGE = &quot;cryptography_vectors&quot;

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

--------------818E4BAA77A29A7A999ADCC0--
