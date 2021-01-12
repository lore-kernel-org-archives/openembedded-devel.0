Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.65])
 by mx.groups.io with SMTP id smtpd.web12.11249.1610467772676527794
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C33Zcc4o;
 spf=pass (domain: windriver.com, ip: 40.107.243.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRvKcg59f5oe89OY6I5rqD+Yiz0kyxU+rGMiouNvuE1WbD6rGIn2dX22a5Jb0pwGOHmIFW/ebKvLslCi774dDQP+p95o568ITXMBnHMLNWaB+q3/YicecTJZ0NKWr3UH04ew85dWmNyX4gnED0WlBeZzasPyTUGxQrlNND5eSh+0Ae16bH5c1t9vgbTHrNT1J1sSnyDU/4f9zm8q4UalEsjqZHuCnOX2kB3zo+Qw2cMe9F0QQb+cpdKaoJXjhQyHCoSHKWCRW61Moy4Mjw/iVCTy6PkOLgezBC8sqiM2U3CDoF/Y+CbZO6jFDyypID3jY2VMNVsBOc6A9dfIPy+CHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/q+OGpJE14pJly7VsltQ3uObaZQHdV/Y+lkGAzK760=;
 b=Qtd2L41/LJLfbhiGKhJKXxfZSFdQnHyBabCEnVFfdzUGT7bDCtb2fRTXuiWJoiND86Gmk0Ou1nigBej0ElPTOTCc8mz6xCXdQRUj7uSbvZh4uHly5WGPun8d9lo+udEhO0CjVxpsz4V69ZprZQb9tT96MTMc5LWn+MDxMp6Lo52iIiThCp2BQHGFrFDrPKylTdLwW1OFoigEwsCNHLTz+009x9ix2wzbj4ri5gANewBj4uj3/b9msUGw5EJ+3zl4rywy34Ml2zPJa/06vJatxokFvLOcac9/zVW6ImxU2Gjc9+lijNgz1+4rRS9TtyLIIUqAbriIiOKYL99iYyCfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/q+OGpJE14pJly7VsltQ3uObaZQHdV/Y+lkGAzK760=;
 b=C33Zcc4oH0ewkIerPtz0YBP7eXpfTaEMvNYoxMNWAEVwqf+POnu4PbB+4lx+W0CZAJ3/lqPbpk78jH+wsoTgoAimy10yeExRrLNt+9DNNg22URf7e4SKs3HNSSOf557Oj9RhWxHEdUHgVK1esH2iulkOmcKHCf/A9nttoN1qTd8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 16:09:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:09:24 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-coloredlogs: Upgrade 14.0 -> 15.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210108102814.9560-1-leon.anavi@konsulko.com>
 <20210108102814.9560-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <389893a5-3fcb-5176-b68d-c681eb142901@windriver.com>
Date: Tue, 12 Jan 2021 11:09:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210108102814.9560-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:208:23a::9) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR03CA0004.namprd03.prod.outlook.com (2603:10b6:208:23a::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 16:09:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef8b57bf-5dd1-4a08-7d59-08d8b7146e3c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2807F81D58A88578D9EBCC749FAA0@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y2BlwE+FP7FyZEzw1H0E9qSIYNJQLpjXewjRIcMC5ylRkpkZttmA3h8RAjrqiDGvO/TmQYdNmV4MNzemYmKtuF7846/2XNAfK1UUmRK4+aLCTf8FMzCbVaA7Qqr96rigX2xgLya+RP09TADSOHfMh1fvIMnEUt4gX7VHFH3BSM6v+oWjoIw0RM8VTvTRnHljiuWMNBk145obGOpgaOq3IFTjrgrDx8xHlG6E9Ilnj94BkOOmXLmVtPFhJXlR06Am3Z+e1mMQo4RTprRL69HVSw9H9vfSEylX5tEnvVdxAvvdqW/OgU1waE5qEDsD3RZ0yqUcp1hlnJGCeOQ1nDjFhPiwf6lu7ZV5Y7pXjvAQNc4ZQ38adUjnjNniJBvZNmnyDeegdSVl7Y7m5siaed8TQj49Q4VEkMAmH28iRAaG0oO2hYkAhL/eFMHeiKZxMcZDRp6TTf2rglcktov9XoSu1mDGtNcjUhzU8EL+XDi7Cgq1y5Xz5g6qP4Wlr9aEXzvgeybZ3dUro331kewWt1Pw+CS+nzoaPiVyJnl93m8+kec2mXd9Y7pWELGlwbPGA+rd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39840400004)(396003)(376002)(366004)(86362001)(31696002)(166002)(26005)(31686004)(5660300002)(44832011)(36756003)(53546011)(66476007)(478600001)(33964004)(16526019)(66946007)(83380400001)(6486002)(66556008)(16576012)(316002)(966005)(8676002)(2616005)(8936002)(2906002)(52116002)(956004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bm5NdG5zaEFlVHRQcDY3b25VcUlCNjNLR3dSV1paNmZVeEdVQWw2YkFkTTBW?=
 =?utf-8?B?Wmsya2FwbklmK1hpVWxvOUJEWHZJamNuKzcwdk9QVnpQbFlibWtJb25nRktZ?=
 =?utf-8?B?MFdGYXJHMkZETm5SdVRLWW1jc1R4dnZPRXJibmwrSzQyQ0FnY1BXQWFIUjB6?=
 =?utf-8?B?NVNZVkFPNmMxZnF1ajhRMTJxcHR5NDRpa05icVYyekd1VDNLd04yS29DTm0z?=
 =?utf-8?B?OTg4T0cyd3dIUS9xMXdWSjRZM0pSWk9VRTNjNjdiNnVZYW1TSFc4alhUVjJo?=
 =?utf-8?B?WWkzN0QrUUN0SnhnQXJJcXpseGdiZ0xDcWRaUTZHb2trcmkxdkVuOHpmdnZZ?=
 =?utf-8?B?dHllRG1aek1adzd0dDdaUlZCcVNyeVdMNVhkbHpyRVBxTlRudjJKWXJlRXB5?=
 =?utf-8?B?b1pqK1NUMTFVVVlhNlByRnJJWVF1emkzZGNNd3IxQ0ZGY0cvRU5OcnJ6SlIx?=
 =?utf-8?B?UklKUUo3R1NTYkZsQWtaR3RYTGFmcysrbUgwMGZ0d0VYYXJZUmlYS3N3ZGVu?=
 =?utf-8?B?TUM5Zk5TM0FHa1haaDduUzE1ZlZqejFqL2hDM3hrR1cvd2NTMnJMWHJtb1p3?=
 =?utf-8?B?QU1qY1lGRUx5WlZTSFBKVDBtOHllR3lZMEJKZjVKRll0VDRIWGpMSWJmVVJr?=
 =?utf-8?B?WUJ6MkNYRjZqb1RPbFlwRDA2SDIrckxzaE51eDdHd2VTNmY0RXZpdjg3OTU1?=
 =?utf-8?B?TkdEenVaTXZnbno0cCtPMUJkb1hHNHFOQm04QUk4VHZDYzFGN2dVVXRaa2g1?=
 =?utf-8?B?VTR1VURYaHpvdHRhbEZDZlovTTE3YW1wWnBIbkx6SHJaY1pjSzhqQVpXOVlZ?=
 =?utf-8?B?Q0VqR0p6WEgyeUF2ZnhhSlEzTlp4dWhmMVdzci9FNkxaa24rODBNTHVZVXFD?=
 =?utf-8?B?cmExalV5Z09XYmJCMUJVeDBCbzFDaUE0eVlVZDl5WTAzZnpOcXNTaEZ5TExL?=
 =?utf-8?B?d29vcEdOZ2xXbFFmbGVFSzlxSGVTa0FZUDBuMk5BWDVaR2FlbVZQZ05pdktk?=
 =?utf-8?B?bWpiSnhTcmloZDc3RC9DSVdUSFpjcVAwM2RjYjRHRXAvaWJ6elFxVWxzaU5I?=
 =?utf-8?B?STEvVnpJOWRvZ253Mmt5Yjh6L1RPbTdCV0tQTFUxOGVTeldISzFkcTZSSGJi?=
 =?utf-8?B?TmQxNnVsa2NSVi9wY0dRd2FWY2R0MzhyLzc2SEVnZkRXUTFDTXpRelVFNUxI?=
 =?utf-8?B?SHRTcmp6UXpBaUlvN0VWYVRsRDQzN0gyVCtaZmU0Ukk4SkJJMTJtamNLYmlY?=
 =?utf-8?B?eFRrSXhSbEpPVW9jUVR6WkY4ZnJCVWRHNk51MDR0SnRnL1lzZy83dnc0QXRN?=
 =?utf-8?Q?Gy1P3ck62gl9FrXp02KLPNscXI3r1+R2DT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:09:24.8592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8b57bf-5dd1-4a08-7d59-08d8b7146e3c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v14MlNRZqJ1ebgncyAmnbu1sz71b/E65N/WYJuI9+dLBkx/IRdAjdFwmIMkAtoAswKtgDVtJejwkpBzSFHR1J6mE9QJnv8Oh9eDDCTCSvoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------4B4484EA933355BDB093D2B0"
Content-Language: en-US

--------------4B4484EA933355BDB093D2B0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-01-08 5:28 a.m., Leon Anavi wrote:
> Upgrade to release 15.0:
>
> - Don’t enable system logging on MacOS and Windows anymore.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-coloredlogs_14.0.bb => python3-coloredlogs_15.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-coloredlogs_14.0.bb => python3-coloredlogs_15.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
> rename to meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
> index 64f3008ee..daeda6b2e 100644
> --- a/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
> @@ -4,8 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b"
>   
> -SRC_URI[md5sum] = "34cd8ef3f758b10c6f1482b2614a81f2"
> -SRC_URI[sha256sum] = "a1fab193d2053aa6c0a97608c4342d031f1f93a3d1218432c59322441d31a505"
> +SRC_URI[sha256sum] = "5e78691e2673a8e294499e1832bb13efcfb44a86b92e18109fa18951093218ab"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------4B4484EA933355BDB093D2B0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-08 5:28 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210108102814.9560-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 15.0:

- Don’t enable system logging on MacOS and Windows anymore.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210108102814.9560-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-coloredlogs_14.0.bb =&gt; python3-coloredlogs_15.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coloredlogs_14.0.bb =&gt; python3-coloredlogs_15.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
rename to meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
index 64f3008ee..daeda6b2e 100644
--- a/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
@@ -4,8 +4,7 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b">&quot;file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b&quot;</a>
 
-SRC_URI[md5sum] = &quot;34cd8ef3f758b10c6f1482b2614a81f2&quot;
-SRC_URI[sha256sum] = &quot;a1fab193d2053aa6c0a97608c4342d031f1f93a3d1218432c59322441d31a505&quot;
+SRC_URI[sha256sum] = &quot;5e78691e2673a8e294499e1832bb13efcfb44a86b92e18109fa18951093218ab&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4B4484EA933355BDB093D2B0--
