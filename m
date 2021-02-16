Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.55])
 by mx.groups.io with SMTP id smtpd.web10.7253.1613480198956440758
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 04:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jzFEcFOB;
 spf=pass (domain: windriver.com, ip: 40.107.94.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epj6CJ5EdsIqY+O/jv2MfysIHC1C4S5jAXJdsC/S+SdgvJN7LtfOHQsbkYIkJ2Zs/W3VYHdvPgDxVZwcwmPQWANE0sUSVKkX9T6c74iv+xY8nFiIKpaHBIjEP/1Qzo6A1De6UkpMmBbHxa4Bb0Q+m0ryeFmd3tUB8VLKhHqF4N7xILFLbnNnTA3Pl8LzQ1gIFJOc106zNXvksXywJF3PEDoZed9UWblJsXh8GgiT/RBjPadLakUhM66woYR5aijDrbaFRDHSALkn8yGJ/R40TJuW/lrNbcHD7INx7TdkH/QgkmR2uHkeU6njlldvRvqRiuZlZGA2qDAJKbK6O/U6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dc8om2lXPzyFMnTcvb7x/7j+0zwY7w6gA6qYJeROhVE=;
 b=GTcI1OWPRGwAnVc4vUpzWo9iqiifSBU2HYfsIlDjugzpRQApYtOu0RRtAhJH7EXKcn/yxt72CW9l+rRtN6M43PhK8OGs+5UgJy5xU7MTUfzjxraV9puOzLNZ4+5aeMvcouqiXQvbwe/x4IaiOBPHkM8t4bA1JwrO0GmoSd1OGWWauY4Mu90UP27KIi1QEvUFwnYXbwXUTIf6M/9VkMWsWop30rb7DTLvbfNEf2LRYxQ23ATQmZIyNKmpgb07JgPCvnjCSmcqPyEA6EZEm6UyJqOPDWRXK0h8A4hwAckF5aj5K9B9p/NbgGMuliyVc1s6Q6/uwISD8Az7yok9DDCUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dc8om2lXPzyFMnTcvb7x/7j+0zwY7w6gA6qYJeROhVE=;
 b=jzFEcFOBKBQu7JwGwQ9nrWndt46eEr3ufG+tzRJORRbjB4uNSrEshDEcqDzb6kmju57UF1trhx0f1vC0GbRKZh46AUjJ1qjmKbZ0aM9fYJFQuihdzXTe/K/SCVovKv3JnHKg5LcJohDgx4uzGJRAQylEzqDdIlBE1rHutvxTOhs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3061.namprd11.prod.outlook.com (2603:10b6:a03:83::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 12:56:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:56:38 +0000
Subject: Re: [oe] [meta-python[PATCH] python3-pychromecast: update to 8.1.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210211000512.1922554-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2ee295b2-2d38-a17e-ef68-9ac14bc32491@windriver.com>
Date: Tue, 16 Feb 2021 07:56:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210211000512.1922554-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:208:91::37) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:91::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12 via Frontend Transport; Tue, 16 Feb 2021 12:56:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9940f71d-aa28-4446-5f77-08d8d27a4c11
X-MS-TrafficTypeDiagnostic: BYAPR11MB3061:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3061A65882F26FA08BE4E6059F879@BYAPR11MB3061.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qaSj4/ZpoWizjkikWdNlrgstiik7Sv2GKkFICcA+Pm/Z4s4cTsSTWLMAiq8rN9dOHoZ+USEr1U55DqkyYz3yz/7HVY3E7j1k1owfQCd6TBQKdXB97+jzpCC4RzmNOjp4gPf1QlPLlOFWQLgWDiMEKzy37Xg1RN7aUTDDec8pGr4GrG/HMWmrpTkJ2VSVB0tYabgmfFF2aDo2qHMhe6kJNf6PttFMq8iGQvaxGB4qDzeZHjemix3L2ZGeWa1h08mpmI8lDae88eRIRQvjAfEslxACcKdr1AOXwOXnlrCYcGj89CCmaTYYIHOHFRNYwDeOjPjAZVTarKpGwaH0/QQilpjb38Ah8QJBlZCbtHjPcb5Jui+rmhyKb2ot9u0TFO4OI5Hmxlk5lZ2Bi02sVuhuO17PBVC+lW5V5669OdMq5M+o1RqFhuha7eZvm+zJD36FDA8VfTnC+eK8U3AJT0mPQFJhQiYmfjb8//mVzUFfBfccWh/aUBxiXuYeDhc/nSOd7RfvcgxUBqGBNOl49v6szKuPyLvGbVMDBkQe4yXz3bgs1DIh38BllTXMeNrsMf0/adjJtVIlqy3tEAhKJS9RnNx4bnwhUwSkVUIO5hy2ZI+kzLh/FC8P/RQQZ63jHERhv4yYr3VzjqqiKhhrGHAvEKkksz45iETZgJHV3sFYmXyFX0oVW8A6MlpIPpJEjrLa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39850400004)(2616005)(956004)(8676002)(8936002)(166002)(86362001)(44832011)(478600001)(33964004)(16526019)(53546011)(316002)(966005)(26005)(186003)(83380400001)(16576012)(31696002)(36756003)(52116002)(31686004)(2906002)(66946007)(66476007)(6486002)(66556008)(5660300002)(15650500001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?R0ZUK013eThNYkxMUW9zMnJGWXVUaTVqMXJib0QycDNkUWFLVzgrMG1rR2VY?=
 =?utf-8?B?dzJ5NVdjbGhvMCt3MCtOL25JbW1McVlWZGk5WkE0UnRXd2p3azNsbDBqMXBr?=
 =?utf-8?B?aWpyUUNhYVVDUERRRmZuT0pDak9jZFEvSWliYnlOY2gyc2pCSnZWSVZhM1BT?=
 =?utf-8?B?dHFTTm03RE43aG9FYTE2UW01RlE0endFemZ3N1Nid0RsUkhEYjViNFJnZTZ6?=
 =?utf-8?B?UWVhQVRWc293QW5uaUJzaUp6eHd2dHprdnByeEFJR0czVjRBV1dLN0oraXln?=
 =?utf-8?B?RlhWaTRuN0wwRlRadGRZYkFmajlCZXk4RlhobmprczFvSDZYM2E1TmprbCsv?=
 =?utf-8?B?TjMydVZZSnd0aVZBUjBjcHBhL3NFL250TlJKS0loRkQ4Mm5HWk9mVnNPclVX?=
 =?utf-8?B?M1VERExqR2tNbzd6ekFaWnNqMmoybmJuOHVlN01ObjFzSGJDUHlWWEUzQkhy?=
 =?utf-8?B?bytZU2h5TlhMazAxamVFUTNOZmNaMkNuaFJvWUM1ZW91aUZIbERLZDA2eUpa?=
 =?utf-8?B?OVBvQkcrczBKNGtwWk90SVd4dUlQVG4waHJ1QUNka3VCRStla1VzVnoyVG1M?=
 =?utf-8?B?LzZHL1NBakNWS1Z1TDFVMzhqWU5RSDh0MTBVbjcyWlAxeGtXTjdDSWNONVg3?=
 =?utf-8?B?c3VHYW54ZmQzQnBIOGIzRGZOa1JOSXZYMlFYMGk4aEZKa2l1bDlJbmtkcGw3?=
 =?utf-8?B?dnlkc01sWm5yMUIvaUYyRjlyMlY4dm5UMEFiNnNuN1pOUGdCUXFTT3U3L09T?=
 =?utf-8?B?QVd1T01ETWZYOC9DRVNTZkVSQ08xeW15dERhL0FnbHZFK25DQ1JiTTRrTUtt?=
 =?utf-8?B?WmFKcGlIVnN4amhhUG40U3haeGJTQklBRDNNWkdtZjArYWMyQ2lJNXFEWVJv?=
 =?utf-8?B?UEVKelZCanZXUHBaVE9PSmN6WmEzOUJzaGRCdXpzLzVXbGYzLzRXb21XejMw?=
 =?utf-8?B?d29TRDd6bEJ6U1c0Y0t2MmhlT2o4K2lpQXo4YVFueW5xQm83WnBFZHV1bzRF?=
 =?utf-8?B?M1owWmVTb1R4WEZTeSs0cDFlZDR6MTlPU2pPVFQ0UUlHOWFjNE9ENkMvSTRP?=
 =?utf-8?B?LzFFNXNnMDBXYTNndXBWemlJZEJyMU5pQ1FMQXhhajU4c2J5MGZuOTF5WUps?=
 =?utf-8?B?c2hMeDFMRHVPRHhXNFJRRVFlM2tGbjhVSkZJZ3hEcnU3VE40c0Mwc0Z3aEl4?=
 =?utf-8?B?U0FMTllrZUphNHR5RkRDOUY3bDlLNnIyaG4xcWNRRFVvREx6RmI1MkZKUlZa?=
 =?utf-8?B?WERnSVVyUVRlbldDMnMzZXB3YTMyNU5FSU9Cd0U4NWYxQmVCSTFDMHZTK2Er?=
 =?utf-8?B?Y3dVMEtGODllNjRMWnpyVmJvS25ELzlVREY0MWJkeVlla0FXT3d0VGQycHZQ?=
 =?utf-8?B?MldYRXNnbXdJc1VtL1V0QUxPVlhwZGx1QVczMm5sWi9QdGtMMmxvbUVmdlUz?=
 =?utf-8?B?K0ZlM3lwMVhycUxHSTVWaGRrSHBlTU9sZ1RiTldkN2UwTEtBdHEwdThicldi?=
 =?utf-8?B?dzQ3cFBTYURRTkxNZ0d3cloyMW1IM1VQM1VwUlFTVDZNZldqbS9wNkRkbFhm?=
 =?utf-8?B?TldGcTRucmtndjUvNXRwUkhmZUpIMjFKNHNkdmZVeWZJYnU4aDVKVFpxdW1Z?=
 =?utf-8?B?Yk5IWkhyKy8xL0kxb2hoM2VqWEJKRks1MlBGK3pwRUJjeWNheHlzSnFkNjVX?=
 =?utf-8?B?NFlVRkZZWXdrKzNxUjloS3FvWGd3eXlsOC8yRTMrQlg4UHRETHNYMWZhbzFh?=
 =?utf-8?Q?LV86+3CsCoAtCKUIYr5JXUAXFf/5Z53a5UzzY2m?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9940f71d-aa28-4446-5f77-08d8d27a4c11
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 12:56:37.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3vT04LqYXKqzsoEDnew3cGvoMEDbn2kAU9mJsyxJrAbHVzK9asDBHdsBa0R8GuPBY74m/BnGI3CNo0adjY6G/AZZvIP8REsMbXxCmT+QZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3061
Content-Type: multipart/alternative;
 boundary="------------BF705D52BE1E88B7AA9B4B82"
Content-Language: en-US

--------------BF705D52BE1E88B7AA9B4B82
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-10 7:05 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pychromecast_8.0.0.bb => python3-pychromecast_8.1.0.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_8.0.0.bb => python3-pychromecast_8.1.0.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
> index 939db5768..7b2b5142e 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>
> -SRC_URI[sha256sum] = "21e9295b2e8088a7f19f82b22c7abcc07ab329914d647cc5dcac08790a7c9d36"
> +SRC_URI[sha256sum] = "df0295f653cee752de38cf8ef09f13ad9782c53924dfbaa191ca62bd5e1dce14"
>
>   PYPI_PACKAGE = "PyChromecast"
>
> --
> 2.25.1
>
>
> 
>

--------------BF705D52BE1E88B7AA9B4B82
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-10 7:05 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210211000512.1922554-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210211000512.1922554-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pychromecast_8.0.0.bb =&gt; python3-pychromecast_8.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_8.0.0.bb =&gt; python3-pychromecast_8.1.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
index 939db5768..7b2b5142e 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>

-SRC_URI[sha256sum] = &quot;21e9295b2e8088a7f19f82b22c7abcc07ab329914d647cc5dcac08790a7c9d36&quot;
+SRC_URI[sha256sum] = &quot;df0295f653cee752de38cf8ef09f13ad9782c53924dfbaa191ca62bd5e1dce14&quot;

 PYPI_PACKAGE = &quot;PyChromecast&quot;

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

--------------BF705D52BE1E88B7AA9B4B82--
