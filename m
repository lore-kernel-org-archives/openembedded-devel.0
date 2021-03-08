Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.83])
 by mx.groups.io with SMTP id smtpd.web12.36178.1615212286827723067
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EGbSBo2C;
 spf=pass (domain: windriver.com, ip: 40.107.223.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQFnVv/fqBgWGFPUnQoFipl1+eTjedsm79l+bmpNB63n0+whUMMYHiRRoJsHSG80pPInuxrniw5le317B2/HqsNxaPav/0hAcM7xrVShfwNzNAsHtj7sSbDf7X8tEfs8MS1bVWmNK0vJ15F1zdvREkWDCAymHFw+0vMQ6/rp2i3dDp/8mvUQV5F1jpdeIXfuDxWwIXZJ1e324SV8MMETAagkH6QewD+uVIExwVpS75PSkvOjsq6AiW8xPExGZUyTdnRAd4huv3cizlVZ14ucuSgrIMm63vuRFkS5EjpyjFn+e55KJe6EdezMJuX1bgSJj9xuXCGaNDSRl+BkTRli6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J54/a78Jh0MLGQHrmce5Uzj65a9bGoDeB4pIZXt3ryk=;
 b=Q6p1HqSptGrjcWWm/ApGYz5431HzfMOelTYz5Y5oaRxKLXccQRDiw8NXcLKkBzn4Pia5bTnvgl46FJVbrUesbAOrL+dDswYzM5Fs0sDBPPF+BlVSLgQWTexMvHPB+LnkX2CorbL3HRLzwexG9NqD/7ln/vNZI3j/wRB05VvSrJAbI5rGo9FpOxfPZb8/l3TgxydRwvPm3PwHU6elMyAjC+pYmCFFXEB7jIIJ4zzNEwp6wCFq/+1ZJ2R7ucRu7QzoxTSxEoILUqK7eHGXVCevp3D4VEU0VFAf69/6panW60hQoTnkTs9g+kdFGWrlbVYHdOCYJrJCkhlKy4GkjwUQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J54/a78Jh0MLGQHrmce5Uzj65a9bGoDeB4pIZXt3ryk=;
 b=EGbSBo2CQ3L2H1btRE0HOKVFH3DCK9Zr1G3sikbHHcU6MQQRlZUiImA39MMgfcw5VXH2bG45k5LQax50K1TnvEPTyVZAqH9Cooy1pedxYmCtKBfq4WYmZUFQVWuPO+VL+GCyn+WgyDzMZCBz+Mj5OMtQvvk93sH9P9J9+Tw76AE=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:04:44 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:04:44 +0000
Subject: Re: [oe] [meta-python][PATCH v3 1/6] python3-ifaddr: Integrate a dependency of pysonos
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
References: <20210305160256.3333334-1-andrei@gherzan.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <184e2e1a-1deb-45f9-8c49-34c484edd6cb@windriver.com>
Date: Mon, 8 Mar 2021 09:04:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210305160256.3333334-1-andrei@gherzan.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0730.namprd03.prod.outlook.com
 (2603:10b6:408:110::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0730.namprd03.prod.outlook.com (2603:10b6:408:110::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:04:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbbcf2f4-11ad-4b28-7ba7-08d8e23b200d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3256B6ED8A89FDCAB1D04E869F939@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GhCgX4T0WQalOTwri8gCY5St0UkmCwJlAMHPvy7PZ9BQl58Qiymp/65cD5bC086T/E8nqA4fZdwi/DA/NbbLD68MtTSp/WF7O4CypKVynNgNIX77+pmJP79EQFH9fuPUl722m5otnqZuHbaT+oKNdoYGRnDuJIrD0Map8nEps8HVB0wetmrtx/oAFeA8ENVK5fY/Ru6bXQPXbUMMKqRxVDw2sYwkNt52etJIsKvfVuigXY3Ed8eaM9Bd7fvr8YKRN6B/qpmew9EqbuxSV44lucudG0KAsNscIYZEU4gwfg4rk/YI6SIiUWWiM34tdd3uQMnOW79yzXMDMDxHKLUkze4DiwBQasQPbmuj1/+347InvLuNpNimDWW2hQOvUECVwxfxzPUFktmSJ+yZDoFD3W9gmQ/NdNUYSYwbAJ7NxmEuypToeD5cOTls1U5Rt1Z9LDxdmnH8qpXEdlhh86LJfFsocMpKDgtW0E4UcCZOELLO9tombVwgtXsWp9LCkaFJlETQ1IoW2lyeSv0NDeswDx0B4SerUE+cjEdGm/PtxYogWCOZ2Ape/XtqA3bd9CzvguwLPNlQSJro1DfbeGdxkqR/YzX/W1KQZO1li9rF8zYf7d8+XOl+gNj30JEdFmMjpQYy6tU5j20hlGogkKKglDa3fUoPPuBMjvqfFqPM+tH5uWzW2w0rHMcrOYuFwfKZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39850400004)(83380400001)(66946007)(2906002)(66476007)(66556008)(966005)(166002)(6486002)(53546011)(16576012)(31686004)(5660300002)(316002)(16526019)(478600001)(186003)(33964004)(36756003)(8936002)(86362001)(8676002)(44832011)(26005)(956004)(2616005)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?emZYWVFEVVNRWmUzR0toS0VqUTZxNXN6NjFjcU9HK1BCUnlzd3B4Y05GNzlY?=
 =?utf-8?B?TXBtYUVmT1JyV0QyT1BZZWFqb1hmL3pSRWNwVEp4dHA3QWNMUmpwbm5UNGMz?=
 =?utf-8?B?T0RYOGFnY1VpOElpeTFiSldKOHA3STB1c1JiOUhyQ051LzA4TjY3MldrSTc2?=
 =?utf-8?B?K0pVaUJScWlmd1pBQTlkNnFyRlgzaDZ4YjlpdU9BMDd2aGsvdm0yaTE2cWRU?=
 =?utf-8?B?Wm8vWUsxSEpXVHNCNWxza1dWc2czdDZKTm5ONnhoWEVqYThKOEo4dEp0VGRV?=
 =?utf-8?B?WE9PMGZKRWNhWkF3RUlvaEhYNlI4MEZ6UFdaNEIxeGl2Tk5FNVJCZmppNnlz?=
 =?utf-8?B?bDJ0MXdkQUhDOW9odVl1SytwWWY2YjRBamt5YVZXampoaTMyelpBQWhQbzJh?=
 =?utf-8?B?cmdxNG85TzNUWEpPY1JJRkIxS0VMRmFCdStKZ0g4N1k0bWZQQ1FNbHFPd01F?=
 =?utf-8?B?bExsSGxzUmZlUHUxcWlIejFBUk1kdlJ4YWN6TEZQQ0NjWWhOcE9XVVgzR1Er?=
 =?utf-8?B?eGVIVWVZTkpIaHJ6N2VUNWlVMVlNcWZ5SEovZTJROGZacEwvU05EdHFrNmFw?=
 =?utf-8?B?SVNxRkhqYStncU9xTWN4N2d2WW44RHQ0R1dTQU9lZ1lYOUNRcTBwL09QcUZD?=
 =?utf-8?B?eTAzV0dzZXBlMU9FQm5kc281bExwb1VpWkdNa0hod09uOVZlZGdiakhwQThu?=
 =?utf-8?B?ajFwcFQ3Z1NVNitvaFBtUkVyT0U2aWRzajRMK3lwSzVkbjdldE0yZVo3Nkd1?=
 =?utf-8?B?ODBCaWtXdTJJcVZBWnBLc2tnUmpFYVY1U2V2ZHF4N3orRHFOYjJ0ME5GWkRw?=
 =?utf-8?B?ajUrVEpEK21KME9NR0R5d29hakVVZFAwOGNWMVYxMERuWVhKZVZlU3BoM1ha?=
 =?utf-8?B?OWh0QjJLYmRJK3RLVzlncEJoN054S3htR2hMKzJPYU1BZVJTYWlwdzYybDBB?=
 =?utf-8?B?WktKM1V0K3pWSkZ3UHk2V3lGSHdUS0hicitpSk9CeWtLNVN4ZFpqc3F4WVU5?=
 =?utf-8?B?WHR3R3VOQmJvWlBJT3lzK3llNnZFRisxaFdtaHpPR0xJYnVpejB0ZDZaUHAr?=
 =?utf-8?B?M3F1S3cyUmFJTU5ENnJ2YWVnWW5hdW1BdUtTOWRzcDFLVXRBM3F1WVJEOWU4?=
 =?utf-8?B?ZWdyTzNJdHhlWGFpdEUxY2hOWlRvRUhWRWFTYWFENUMvdTNBQTlNOFpMdWZr?=
 =?utf-8?B?RmJFLzdlMXpKMVhWTUk0bnRUeHRwSzVwRS84YUhVVHdPaG9WSzlVMmlyTTZ6?=
 =?utf-8?B?RXQzeWY3QmJZd2xZaVRKcVgzdGpIRG9BZkU5ZFZjaVM5aW5tZFhvREtHRFFJ?=
 =?utf-8?B?M3QzSXlWY3lGOFFNdmZWdVp2S2hwb1hVS1BVUGcxeFM2V3NWUmwrVGM3cWUy?=
 =?utf-8?B?WDFqZ2owWU00VHYranlqemlXTGtpbnVJUkNzSGl0NExCajBZak05b0hrUlJo?=
 =?utf-8?B?TmJNTEx5NEFNbENrYmdQWC9VdVJjaHQ5K2QxRmJaVUZQbU9MNkZCZUZNTXRh?=
 =?utf-8?B?RzlxdjV1QkhRUmVybWt3RWdTNWR5MGxrd2o3RFRBZWRCeURXR2lCU3pZL3U2?=
 =?utf-8?B?YW1HVjFXN1poVWtvTDJwdS8wbXlKK0JoeDFhdnY5ZEZoQ05jR3lWN1R2MnM3?=
 =?utf-8?B?V3RjdnVlUnpmOEZvZFkzQ2hYMVlTajVudFUybFcwRGhvbDl1YzFFbkRpVVpt?=
 =?utf-8?B?aGVIemE5bnZkQlorc1c3QytjZFJLeHVUMGVOa29MempoS0RmL3BNQkkvNnpQ?=
 =?utf-8?Q?HSGk+J3vPajTuQdwN+7+dEmyMHKiz/6RspE2G9d?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbcf2f4-11ad-4b28-7ba7-08d8e23b200d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:04:44.4226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B09rHlCDPVrRGEmZ4iaq4tmZSHqyb344E6ODnDGv2P5FSupFRiwp2tBcPNlqUQo114zsF+ErIBkNhnEIpA4W3m1Pj4Po2xO+kKYNkB42TpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
Content-Type: multipart/alternative;
 boundary="------------9A17085A25ADF9AB2D32B28E"
Content-Language: en-US

--------------9A17085A25ADF9AB2D32B28E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-05 11:02 a.m., Andrei Gherzan wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-ifaddr_0.1.7.bb    | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
> new file mode 100644
> index 000000000..cd7cd2803
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Cross-platform network interface and IP address enumeration \
> +library"
> +HOMEPAGE = "https://pypi.org/project/ifaddr/"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926"
> +
> +inherit pypi setuptools3
> --
> 2.30.1
>
>
> 
>

--------------9A17085A25ADF9AB2D32B28E
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
    <blockquote type="cite" cite="mid:20210305160256.3333334-1-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

From: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@huawei.com">&lt;andrei.gherzan@huawei.com&gt;</a>

Signed-off-by: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@huawei.com">&lt;andrei.gherzan@huawei.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210305160256.3333334-1-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-ifaddr_0.1.7.bb    | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
new file mode 100644
index 000000000..cd7cd2803
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = &quot;Cross-platform network interface and IP address enumeration \
+library&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/ifaddr/">&quot;https://pypi.org/project/ifaddr/&quot;</a>
+LICENSE = &quot;MIT&quot;
+
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
+
+SRC_URI[sha256sum] = &quot;d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926&quot;
+
+inherit pypi setuptools3
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

--------------9A17085A25ADF9AB2D32B28E--
