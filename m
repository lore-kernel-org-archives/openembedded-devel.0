Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.74])
 by mx.groups.io with SMTP id smtpd.web09.35561.1611578616670519086
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=d9mUMad5;
 spf=pass (domain: windriver.com, ip: 40.107.244.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN1x45P1lu+e4Jz9EMjCQNVNMUqupZFRSnQWg2y6te628oqresGkDP25P2OvnYXUJLwMsojTnZ09WJAGAHVPsa+BUOZAUOsyogZi/AariDd4f/C6+REvMP1NEkUhUvLYj2rTxdoU/Ujl/pp8l0Gx0lTDb/8aXdHAikjnGzfbY6iHAWm7BRMoZ3tPzf9g0212NGXbvUa84DARgtfK4BoHT4DvYgDaVNJfq8BHsvoD9lNuChN7/J4FsZHmuDlomYFvNiCzyB/Bc1WehrILBKr5zGAF2S4/4Lrd1uf4ZYlGuqLHlU7SM3ux+i8hVl0XGVrz6CGrmD/TVdXlDap7OlsTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOWb1QOwvbJW5UmKT6F5chfpqRTcL2xdr/rB6277eR8=;
 b=oJBIgBgDLq45H1JdjEx0X5zWlFkYdOaPQeynVroFutN7B0MHY9317pKZbIOoVcVJcQv27L9p8BKqLDOtiudNqbfj3VmfgxLqzfQ2zoo9ssqIRdFDCPQyCh/JXFJWuCoFC11Yy5NKyr2p9ez7QEijikoMDhJwqEZF98w8sbI3MP+MwMnp7azHxOx0NmZtYOnQkGTWpyDRI2u4JOZDGZqpQtLAxtEyiX1Luupbp9owLDxFWlGPGYNeFT96cnp8ufac4KsPdPsA1ub30NRhoRbd2sxAuUVmg6EgXdLaecgLy3NegPfxkholNiU5bwymYEbeP+eH8l1gaeyIrmq2sR7Fzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOWb1QOwvbJW5UmKT6F5chfpqRTcL2xdr/rB6277eR8=;
 b=d9mUMad5z/S5UM/y4vU37c1CmD4wUyIRUsULxfGhfC04V4g0iG7sNjPZM2yIkhZRkVD8aYbUMTbmO52Awy43Knzv1B4JZ9UdM20IX4whEVUJuVyWwP4Mi6wcu4IjWVhxCH4Xp31gpetvEHreHToOc1JaPXDPVSjDxehT4AzNUA4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3678.namprd11.prod.outlook.com (2603:10b6:208:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Mon, 25 Jan
 2021 12:43:35 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:43:35 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-alembic: Upgrade 1.5.1 -> 1.5.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210122101126.25982-1-leon.anavi@konsulko.com>
 <20210122101126.25982-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0eb8ab7e-8303-a63b-4301-6cae8888af05@windriver.com>
Date: Mon, 25 Jan 2021 07:43:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210122101126.25982-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0441.namprd03.prod.outlook.com
 (2603:10b6:408:113::26) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0441.namprd03.prod.outlook.com (2603:10b6:408:113::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend Transport; Mon, 25 Jan 2021 12:43:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e414d9da-b4fa-40b9-d106-08d8c12ed4da
X-MS-TrafficTypeDiagnostic: MN2PR11MB3678:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB367867F347DD2AC290375DF19FBD9@MN2PR11MB3678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hh6pjLZgiyPWyR4NGeFLpEkRf2LrBITRGw/6P2mqVPVbQTGsUnCvtGtoVV8dRQo1560pybz9mxcGRI9uSxYU6upW8r2YPjEGRU4Ouful11Y1ZX5a+VbMM+ZHz1acQAkQdSBYNYIqwdSiR0/PjY/w8yQ/rqz32GssNG+sjIt96qTWuQoYP0OzhgAOhz2gu3DyTBQtxjfBsZFis3Yc/q+gdYtjYMLGEpiBZavTkMth15h29qqQCKshDgABcuUdyZEkNjH9z1SXGZtEuc+00jiGBvOtw6VhY/zvEP40nS7bkbxCZO1UYQzRbftLZrZ1t8/iK4nj2XytAbaW3GauVcpLuNL1GMuQTNZJBZfwvs9WCZfuhHjY+Lbu6mumdASaTmRB7aNwGesNeuNCxin6exk09bkpNUqi8lOex5H6z/H3pyRodGlO2qgFxu1j1UIek2u45IqXrnojV74lYwYca9BBtQwcFfVO3S1EywYnFp6RToq0c5wQ0bOc7bu/nTVumUXbkcZovSY8kz1c+FMLLq/yyfFIH9qa8qYLPuxdrTlqvCLe4EF8knmbKYAVsd2nSRP+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39840400004)(346002)(33964004)(2906002)(966005)(478600001)(186003)(316002)(956004)(5660300002)(52116002)(166002)(66556008)(53546011)(66476007)(16526019)(8936002)(36756003)(6486002)(66946007)(26005)(31696002)(44832011)(31686004)(8676002)(86362001)(83380400001)(16576012)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YTVWdjNGQWkwNmdKYXlnNFJlMStLb1l1TjJBQzJ5RmVLSW5SYWVsZ1VvbDJo?=
 =?utf-8?B?K2xrZ2lhM3lzdnFyRkErTEduejNMNmlHMFErY2ZOV2U3c0tFRlBlRjNnazln?=
 =?utf-8?B?VUFDQThLNXdmOHdPb0lEZldYY0xOd2NkQzZUZjNHWWVNV2wrdWZoR3JBWXc3?=
 =?utf-8?B?R20wcFpvNGdhY0M2MG9tbkJMTzF4Z0JTWThHeE9vVUFIazRPaHl2RjZMU1Jk?=
 =?utf-8?B?MXRCMkhCeWtXNHJpN2pGM1ZuTHRXdTROUmw4eHpMbHNSN05XNXE0RE1xMHRI?=
 =?utf-8?B?aGdYak1QR0ovYTVGd2luWUlhMU8wUzh2blRjcGFSOHYrRkc5eDFqRnFZbzNM?=
 =?utf-8?B?ZjRWUWlndStGRk92OU9sRXVtV3A0d0JVTlZqMm1vZnNJS3dDRUZwV2tQQWJV?=
 =?utf-8?B?ZVNKWHEydlFLbXNMRU00eHBjeEtBa2VIL0NjVWs5WGxkNWpSYlUrUUwwaEFt?=
 =?utf-8?B?RndMeE1pMytmTjAvU2RZNTNLenlsR2EyM1pYQWJoU3VwanJmTWJ4MlBHNnI4?=
 =?utf-8?B?dGlOQnZTVzZVTEd4d1E1ZmZKcDRNUUQ1cEkvcm9qc0k1SG1jQ3lEY0syeFVS?=
 =?utf-8?B?TzZ6elJ5Ry9aWGloa3VuOHlra3JRdmlrdEVtQVhxWnBWcGl6aWpVOUxCRCt5?=
 =?utf-8?B?dktkNmpabnZaM3Z0SDFPQXh0RTlNQnA2UUZHSkdVQk5vNHg0cVdzNHVoa0pw?=
 =?utf-8?B?ZkovRGRnc0ZLcWt5RkYxKzNEOU1hTHVKOW92NGdmZHF0RVovNGtONzFidi9U?=
 =?utf-8?B?ZmEyS2hsQ3BqU2FMWjdHdWUwMUM0Vy9OcFV1UElwc1AzaGFUdjdlOUlhaExK?=
 =?utf-8?B?OExIdzRieURrT2drY0I2bjBvMk4rbFlYSjI0Y28yUlUxTllpaHJRNWVlTUMr?=
 =?utf-8?B?WHNJVUJKUTMwYUFEUkQ4VVYyazhOZ1k3OE52UDkvaXh3TW1IUWc3S0EvRU5X?=
 =?utf-8?B?WWlOZFJEOXZ5VmJVbDRiQnhhQi9GZmpvcjFuY1pxMFJwUDZ6L2RpOEJXV2Ft?=
 =?utf-8?B?ZXVyTUVFQ2NURnN4OG5oWGlDK09ZNlNQUHdGNDk1cWVmS1dqY3Myb1YrT3pi?=
 =?utf-8?B?SU8zSnpZOFNFS2lkMzhLdlhIK1YvYjhoUExab1JrOVlhdjJRZUx4NGt4Ti9F?=
 =?utf-8?B?R0R3dmhWNTA3MFd6dDFVMnJBQXFvMUR1NUtSUjQzT3V2Q2VyYjNvbXhLcFZ2?=
 =?utf-8?B?T0ZacEJEblpVcFFtZnNCaU52YXZqcGZTWUFDL1R6SGZPVEZ0Sjd5VjNtZUE0?=
 =?utf-8?B?ZzlyNGhEYU10T0lqVld0TEt1WWxaM1ROblFBRUNPUlVkUzhWeEZ1cHlyNkFQ?=
 =?utf-8?Q?IxGzmxsRC1c+y8WdK31iQozUBUhArhSlnX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e414d9da-b4fa-40b9-d106-08d8c12ed4da
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:43:35.8050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKyDXIFnw72x/LLlVzVLtz0pkh8K/bh5HFPySFU6NdRa/Fg401gZuCzMko0qTg5cMgZadioolMVk/h6kHy2yWaWjFdAWaS7DfMxhvO/bxL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3678
Content-Type: multipart/alternative;
 boundary="------------9F1985D423FA5C4393B860FF"
Content-Language: en-US

--------------9F1985D423FA5C4393B860FF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-22 5:11 a.m., Leon Anavi wrote:
> - Fixed regression where new "loop detection" feature produced
>    false positives for revision names that have overlapping
>    substrings between revision number and down revision and/or
>    dependency, if the downrev/dependency were not in sequence form.
> - Fixed regression where Alembic would fail to create a
>    transaction properly if the sqlalchemy.engine.Connection were a
>    so-called "branched" connection, that is, one where the .connect()
>    method had been called to create a "sub" connection.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-alembic_1.5.1.bb => python3-alembic_1.5.2.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-alembic_1.5.1.bb => python3-alembic_1.5.2.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
> index f07be042f..9e30cc131 100644
> --- a/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[sha256sum] = "52d1d48109f17959982779e3c4b5cdeca701e449897bacb75bab173bd6ba984e"
> +SRC_URI[sha256sum] = "a4de8d3525a95a96d59342e14b95cab5956c25b0907dce1549bb4e3e7958f4c2"
>   
>   PYPI_PACKAGE = "alembic"
>   
>
> 
>

--------------9F1985D423FA5C4393B860FF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-22 5:11 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210122101126.25982-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fixed regression where new &quot;loop detection&quot; feature produced
  false positives for revision names that have overlapping
  substrings between revision number and down revision and/or
  dependency, if the downrev/dependency were not in sequence form.
- Fixed regression where Alembic would fail to create a
  transaction properly if the sqlalchemy.engine.Connection were a
  so-called &quot;branched&quot; connection, that is, one where the .connect()
  method had been called to create a &quot;sub&quot; connection.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210122101126.25982-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-alembic_1.5.1.bb =&gt; python3-alembic_1.5.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.5.1.bb =&gt; python3-alembic_1.5.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
index f07be042f..9e30cc131 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb">&quot;file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = &quot;52d1d48109f17959982779e3c4b5cdeca701e449897bacb75bab173bd6ba984e&quot;
+SRC_URI[sha256sum] = &quot;a4de8d3525a95a96d59342e14b95cab5956c25b0907dce1549bb4e3e7958f4c2&quot;
 
 PYPI_PACKAGE = &quot;alembic&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------9F1985D423FA5C4393B860FF--
