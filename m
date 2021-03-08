Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.61])
 by mx.groups.io with SMTP id smtpd.web09.36100.1615212356382465397
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TxNl2H/F;
 spf=pass (domain: windriver.com, ip: 40.107.68.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hR1iFzb6jwD+lkMEGzIBS4FgJ70THMH0HSHRA6yXH6m62OjbUYeVxm9m19O7slPRiLQMeZTvpr4JzpxDCz35f+lfCHZM9Lq+a9uT2UTcjhzFD69WWVCcdj0Yze6wzMdrof7SJ1s96PH9nk38UFOwxxlyE2IPRJloyyuOPTsdry7ZFsdext1GbZBwQCTyeIFjLZ17WeAfRLy2T2MFJZzJlM7NuE9GJ8MgAd+ew9I6Ebco5hXLfpZSruyHf5gri02z4DKGLyV88aJ2glOaPGjuTxDlv2fu4lOvvFXQy9dDGe+9ZeZHwGU2dn2iBBsJGakI8VA6z2oJ+RV2ii5rhfKtZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWLzVVShjCMuVeSG42Ugs9B1WdLDOqlqZ0yNndeBRFc=;
 b=mGaaXmNgqHWaZW8+kiFsV3/HouDtGg+cGx/8LfWTBSVBx0Hq/j6fp824mcXxW+qFhqUnsKaK4eIRmNjXsmIDUjNNhPo701JlWGxciWGyDuEWbsjAnmeh9N6ZDVEczzN45ruEWPdzrKe7LTzEiIkJXZ973Pl/8bBwDgURO5DgHexym6WQyL9qbRdLleHjaf3ZJyfZFxoYu2DMTvdTAbaN1kzDEhEbSHew0lKpWuQHXK4Si8bGtWAwEYETj7I4siqmzGfie75ExtfvcN88238085/p/ivEP7ILJu4GwhZD5LBeFHHsClfxWgTDUcMpUOB9f2Sp+YqvLI5DRX9Z0+9GJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWLzVVShjCMuVeSG42Ugs9B1WdLDOqlqZ0yNndeBRFc=;
 b=TxNl2H/FgqlcMLxNTW2wPTMAp+zNe3ROJBW4FSOP65+7t1jGf5KX5hau7Uyua6d0wa/xslolusmxJDHBVSBKvrcL6aelzVBkTBo1KgM+7JldTM479GU/B0e59RBQI9oeMPlNigu+EbxYZ3VzlUzWZx/0yelcV5WexTjY/J09juY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 14:05:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:05:54 +0000
Subject: Re: [oe] [meta-python][PATCH v3 6/6] python3-mccabe: Fix HOMEPAGE
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20210305160256.3333334-1-andrei@gherzan.com>
 <20210305160256.3333334-6-andrei@gherzan.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f0ce1d54-aa81-3119-2b37-1b257e172495@windriver.com>
Date: Mon, 8 Mar 2021 09:05:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210305160256.3333334-6-andrei@gherzan.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR22CA0062.namprd22.prod.outlook.com
 (2603:10b6:404:ca::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR22CA0062.namprd22.prod.outlook.com (2603:10b6:404:ca::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:05:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1493c5ea-e95c-4b05-e7fc-08d8e23b49b3
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB303089E0B715F36EC97369F19F939@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rgxuzQYWrr/wRj0JS0iAOAjJ8uJ2X1yU2hM02PfIEkSdPxu5yTU57jvQFufP0Atqk3pZ22wJLi+oNuBkTL4a1FnMjuZv+fRbVPvTYJWZjOr++aisIeFS3CV8fr1LR0mdQYu9cV8e3jfodLUbYJI8k+ksy1zQe3RYwyqy7r41jMJJe3EG2JbxdZOOyqfr1jz20Qa2OzbzLwa0R6hlFBrEOLxNSgBlpcd7Rfe47X1qGQjNLvNKiMW/zNqWuHQP+5WeNJ0MI1SGybNX5k95JN++i/0yyyola+9urkSDxQ9k52APW1OzvDdhncO91PWuWuJP6MoTGkqTCVoaL1Rd2W+r4p9KdvB7gol5COsAqX7j2kmXPI/dLogdJwAB35lcFxgyL2c0pPw6K3dQAQRQpegl9P3+yFzqg5S9FtrlGe4qGU/YibxM10o6jxF6zyR6jOBLUr6bKFxKpPiNIRxdp2P+s6cvhv2wV5JI7UqgLE9Qn/Al5h8rn3rpeNNAbj3/OyYf84TtjrNRF2jDZAMgA5rfTzMev43ydhGMHOxJ2TCE8b/GmXNdZQv63UAeYNTSXsA5Vgh0DRMPPsZoOAdpAiDnra5VzsS1TGCTGZhO82zt6fKg0fc/WeD3PMJMnU47BjQWr6qo+6Yzi4zOlJjyzPrXMm1Hqw1cftMP4Dbx5nPcffbHPT0X2T39980UR4bqOMkV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(44832011)(8936002)(956004)(2616005)(316002)(26005)(83380400001)(16576012)(4326008)(66476007)(478600001)(66946007)(66556008)(31696002)(8676002)(33964004)(31686004)(53546011)(6486002)(86362001)(166002)(36756003)(186003)(16526019)(2906002)(966005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SFJJY043VjhEV3dIRXVUcjljVVEwSzdJWVNHcWorUnJRM0ttT3Q0OW1QYVZH?=
 =?utf-8?B?ZWlvc2RBbFZ6QnJVZHJXZ3dFcmdYZ2FmSGFucGp1S2MrUWlzM3JRaDhXRUgx?=
 =?utf-8?B?dHFCYWV0TjBpODdYRDc2clF2eVV2TzNpNWFicmNIeDd0SEM5RlQ4M2xFaWt4?=
 =?utf-8?B?VE1PWG1aWWFSZERndHh0dmpLRncweUgwUUx0a0NVMmJtV3FyMXI2REFVWTYx?=
 =?utf-8?B?a0FwSG5SNisveks2WGlpK3VwZU02aW9NTVdNS0lyOE1VTWU0bkZCTktRWWVG?=
 =?utf-8?B?N1JOKzBwU3oxb0VHamU1MzJaL2lhbThpeHRkNFV6WnJOMW1YZUxOcWdJQ2Qx?=
 =?utf-8?B?RWJyTzhNL0hNayt2NlFIQXdobnVaNWRwZzRLMUlVcEliQm5vSFFDdklKWDFV?=
 =?utf-8?B?Z1RDWFpPVFBuOXJkSTZhdWlyV2ZldnRCaEVaQTkyaHl4b1R2VDBQeC9iMXZB?=
 =?utf-8?B?MmR6T0toUmlGTjBOMWtIUkJFTG1BQnkwbmh0SisxbitXdzVoTnQxRmFjamly?=
 =?utf-8?B?YUVucWNCTFBtdDB4TCttM3hMNnpQbWEyaFpITFpNNm5NZlJlblVMS3IrVHVj?=
 =?utf-8?B?ZENJUmVRRm5qNERwcEI4VHdINTUvTVNwbHNPd2w1VCtzRUNPdVhHd1RqZDZB?=
 =?utf-8?B?aEZEanFXQVFVVTU4eHNNaEJIVjk5TVZjZVhFRnArVWVYeTZEMWxKcFlLRkhk?=
 =?utf-8?B?SFZQcEpsRkpTRWdjNzUrWWJWcWlhRE4xTW1lcXh2K0c0bFFzTkhrNWNGenZh?=
 =?utf-8?B?VXRLY1lIUjhaak54enFSUW9IQytZUDFnTHdzeFg0Z0hyckh3aVJLK2VxTktM?=
 =?utf-8?B?aEJXN05PNWJsMXlFcVViTEVzVmNTaDdXMDBUL2lCbjdwK0RsMzNkTFJwUS8w?=
 =?utf-8?B?aXR6eTRiTmQwMEg3ZTNoSWR6T1N6c0V3Y3h1OWpsTXNQYVc1cjA2YXQzYnFV?=
 =?utf-8?B?ajB0eUZCUnhwdGxhS3VUd0dXNWpjVUN5YUZXYnB3VHRXQTBvMVdaNmN3WGg3?=
 =?utf-8?B?OVYzamczZmpVRWV2dlJvYVB4ZVF4dE1ya2NtRWJUTXBYeVI4d0E2M2dWTE1D?=
 =?utf-8?B?YzRvS3pHS01NUEVuWm9SOElLT3U2Z3ZmYmxuUDltMUZ6WWsvN0wyNHhsMXBq?=
 =?utf-8?B?aEs2SC9tMXp4bUREdGk1bG5nOWloTlluZ0hkek16Zno2eHZuQTNCVUFxYlgy?=
 =?utf-8?B?eTRPQVdUZVlkM2Nha3dINWJBb1YyV05MemlkTG44alhTOEd1WTdWTzdkUXhY?=
 =?utf-8?B?bFZOY2o2MmQyckJaTlROdzhweVpEZHR1TXhqaGJlczErWXVjeUVEeUJNeXhW?=
 =?utf-8?B?YVB2d2IxQ3JXU09QL25OUkhMSW9wQWp5bkZMSGxMcVRJL1dRbjdlVVEvSFFS?=
 =?utf-8?B?VGZ3ZVhQRndUQ0ZRN24xcmZvWDFBcW9nNHFudldUUjdZNS8xZVRWWHh1RjB3?=
 =?utf-8?B?a3Exb0U0RHRWc2dhTll0UExnVXY0cEpoYTFCUk9jV2JEdng4Rkp5aGVrVVAx?=
 =?utf-8?B?ZEs4Vmk2SVdlODVWd1ZjbDJROHVBYTJMZ25NYmxZVmJ3bkxvdmxheEJYejZP?=
 =?utf-8?B?TXZCaXQ2M1BoMmxCSjFzaW40cDR0Z293bzNiS1cvcEUwUkIvMys3S2tlcHZo?=
 =?utf-8?B?TjVRUU56cnNxYjgzbDZSM2RxMmR1UlplYkxxbEdCVjVLdUExU1RPNEFLb00z?=
 =?utf-8?B?THpsaDhQREdCY1BPdWNYd3FmMHAyZEpJVnc1VjU0Mzhkd1JYU2cvMmpZb00w?=
 =?utf-8?Q?XDviwwMBLMC45a6xHl3A9b1CyPnUPYi0Cm+vRhx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1493c5ea-e95c-4b05-e7fc-08d8e23b49b3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:05:54.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6AnTnMTDDRATsCJ1PG2+M/l+SMk3A5XMP8SsuBd0TWOXuJXbI8OpwDddSYeJWnURanfHU56RAfE+O2o0y6U1W3/HWvs0C8BAyFxLM69+MQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------A6D9401E2E9042F96D5F84AC"
Content-Language: en-US

--------------A6D9401E2E9042F96D5F84AC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-05 11:02 a.m., Andrei Gherzan wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
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

--------------A6D9401E2E9042F96D5F84AC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-05 11:02 a.m., Andrei
      Gherzan wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210305160256.3333334-6-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei@gherzan.com">&lt;andrei@gherzan.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210305160256.3333334-6-andrei@gherzan.com">
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

--------------A6D9401E2E9042F96D5F84AC--
