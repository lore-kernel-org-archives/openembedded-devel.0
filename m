Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.57])
 by mx.groups.io with SMTP id smtpd.web11.27538.1611149790015972169
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RuCMtbxj;
 spf=pass (domain: windriver.com, ip: 40.107.94.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UegGVvD0qlc/DBf8Ni7ov7Xo3TUQTw4BufWVlmOO7MfJqMrUtp09am2MkGDuLlYTjxgEB6I4FQqpxP1ishpqEP90Tr7x79ejPwmTnMwEzsh1DLToehwiFAJoIMU8a3KTWS02yRnx9MVrYjTyi2GyVoTkgiX74xP+jbdahrbXxsdkmk9b7RkHMGcoe+NP0IooIfRINIi/QrnkLvLb+mYsVXuzMoEWUigEB+ay42qncDXMODuCNa4F+nt9L1fH/1lNzXxJALY4/g02fIh/QuxVi5rHPCWANtq2gs/jMkCbOhMkOevaSh7rccFmpPZ7jHbJrVY/p+Jx08/5l2W/thQ05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w02dUGVQVjMrLzYaWyk1W9+rbZTQdmAev7Qq731g3e0=;
 b=BGSx2682dYy9ZoWy+NIhWty2CdK+tsm7crsGBYbj9GbIFycL/Ua2riTwb4gYdHty+V9arR2L+dj5iw2izsD+8UJZSAiNjbN7MJ0hdqS0nx+7eOZY1hMXpD/7S0nxlU09bX5y69Gr+saWLmG4NkzoOIWy6Ng5dKLBBnLc17CKGGXXJ5ikNEPsoRk4+k+PJs4fJ9oqE7lC8UctGTVF/gGTlh3gLIq1qI6Wdl20OHMWfJk1M8B8//3QdeUc8EyLoPQ9yZ6CJ7JNvU1bmvRmex/L9sQiQ1K+berWE9yPda31DDCiJH87h+LN1/TPitE/FthFYxEJTWFzHWXYUeabWWeUFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w02dUGVQVjMrLzYaWyk1W9+rbZTQdmAev7Qq731g3e0=;
 b=RuCMtbxj93s5kd8bi4pR7su4zBPlIEZ7A+PHhAYBokPuCqGrNzqSVZStMj73tOSPpIipOPAnJE3kz5bWcVkGxpxAak0oVkbiLiH0zqxWXhJGxpl/mw0aN+200GBGuX/4ApCRIpSPkI+2rbJN7t911F5eQiRheViQEv9xa88bNek=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 20 Jan
 2021 13:36:28 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:36:28 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-dbus-next: Upgrade 0.1.4 -> 0.2.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
 <20210119173746.24694-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1d719bd9-2209-9561-4284-63629a304d5d@windriver.com>
Date: Wed, 20 Jan 2021 08:36:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210119173746.24694-9-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN3PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:400:4::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN3PR03CA0111.namprd03.prod.outlook.com (2603:10b6:400:4::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 13:36:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71fd0583-f547-49e3-d966-08d8bd486401
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB355947BCD4788447E2DA1C369FA20@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QcKTQSE/rdGaSKCTXu5e6MtJQLgdfofajQxzeiUSGpI7PoS3sZdl1Mz2p4Qb5NHTqJI5LrBfLJqIT1kOLg3eh87MZHtIUgcs80JyBO3xhV32OZ5KmfhUcsbSGQAEt/RMt2ryOADVx7d2u2XXAiFwe8ahsivkD9Bpn6oPtxFqEyGQV7xTrHpoQJKIPfFPfOgKWn9xpIqQ9F4/OtaNcGW4NvLxf63qE8TOUmBkZOpz6K5w3Kjyyhywko5n91bUnIvZrq48RB6iW3DXR3pMg9SXkFjEW9nqGv2IXDiyPN/DO5SJiPhSjidg9TlbEIaRrKMRIb0JJIkKPwEbTB10vlUOulwGUzoC3KA59GKAk5yGEbMbvqhXN1imKDEL87Uc31WEqLgVNKBPHdZeg8K6myYihcgyXdQx4gs/fRJ6C1Rvg/DhGKHQ4wvo3xVCkg6hViSEp53ioX82AFzmSiiUQ0huXhROKg5qAQounMquwcWzE22Nx/4yGN1GbjYg0jhSelfkmooHTYt4v5OKmQqIOZBMsTNi4U371jdhTyow6Li62C8K98N4O8eWLp71DoGdJdIP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(956004)(26005)(53546011)(44832011)(478600001)(33964004)(16576012)(31696002)(86362001)(966005)(66476007)(66946007)(166002)(83380400001)(66556008)(186003)(16526019)(316002)(2616005)(5660300002)(36756003)(6486002)(8676002)(52116002)(8936002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Z1k4ODk5ZFV1TGZKYUdpbFFjdWVveGN1dm1MblBHeVpPUHJWM3VheFl3b3hX?=
 =?utf-8?B?N2YrQnRvczNHTzg3eFc3TVlkUDNibG0wVE8rekJBQVozc2RyL1kveHVVb1Ux?=
 =?utf-8?B?cXpVck1ieDFyWWYrcHhvS1F4VG1Da3Z5UTlSdTg3NW41S1hOaHNQaXZZRU9G?=
 =?utf-8?B?NnJvVWhQOEVxNjNVeTVyaHNhV1I2MnloaFFlanhuRnBmNU10V0hqdWIvZWIr?=
 =?utf-8?B?cWgzU1c5WjR6Y0JscVZsRGgzOTNKZ25FY1plTm53b1IvQ3l5V09MeEx6cEN0?=
 =?utf-8?B?d29KYnpoSS9UWjBUY3lzRHVRQnNKdkdsNXdoNjdTR3YycUIyd1BtY1NzTE9o?=
 =?utf-8?B?bjhVSjRrUXNhY2F1RElud0RLbG0wU3hTSzRQRTF5aGt6V05aVDI0TnhmNGNv?=
 =?utf-8?B?dDNrSFU1dnFhOVVGZDlodUcyQ1g3UjJMMCswbENSNGkxV3VHS0xjQzZhcC9G?=
 =?utf-8?B?MlZiZSs3U2xET2t4TGIyVGo3REdRWUFOemdtWU5sVHRXNUlGZUErcUVqcjVx?=
 =?utf-8?B?YmY1L2RzWTRpaS9LZUs1aWFwQUtSQnlUek02UWVTYmhDWWxrMXR2Q1RyZGw5?=
 =?utf-8?B?cTZsWmo5L01laGY4S1k4dTNRQTJSMFJ4TDh6WnhTOWFrTXRCdFdSQ0E4MVA0?=
 =?utf-8?B?MGVWOXdzZ21OQVM1b3dKa00xZ0N1YlA4UUR0N2F4Z2hQaGJyZlRMOWxTK1hT?=
 =?utf-8?B?R25hY1MzaXl4bEMzTHpXZ3RoYmw4a3FJbkZsZlBvYVdRd2pnMmF6TkErRE1r?=
 =?utf-8?B?R0ZoelhHRmlwb3hmMHFtWlNXZzJTSWJxL2thR0xhendWbzdJNW0zZzR5N2RR?=
 =?utf-8?B?RDdVV0d0L3BBNkQwSmUrQ2ZTSExsZ09ZWjAwbG5ZL0xib2wrbnkwbjlUU2o1?=
 =?utf-8?B?ZmUzUG5HR0dncWRkaG9SWWM1enpzSFpVNE1VTVp1VWl1dkdwWUNkelROdWNh?=
 =?utf-8?B?UTFOT09xVGMyVkRhaUk1ZEpqRmFQTUhCVzVCUDJpeVVZa0xSM25zb2lod3FE?=
 =?utf-8?B?Zk1JeGtkekprcmNNVWtrcnRQSnRIZ2RRSzhsa2NGaS82eEQxUExEbDdXZE1C?=
 =?utf-8?B?WEhqK2M0RFhHem1GcDM3akNvY2pOcy8zUUZDMUNrK2VDRjJWNjltV00rdXJk?=
 =?utf-8?B?V05KUkZlZHpEQnVmMFYzbHY5bVhiYUc2TzFralVQblh6bVRBUHZrdnFMSXVt?=
 =?utf-8?B?QXcyUXhVMThDdE9ESm9Td2FiNGRLYzJmYi9UM2hxT29VVjR6UmtLbjBXc2lC?=
 =?utf-8?B?K0hZQUJTbUlGM1U4LzFWTW5pUTNxVmJiZkdxNnhidXZUTnppYldHeUsyU1Fq?=
 =?utf-8?Q?xF+LYm90PloPc+WWXBDlqmApWbBkRdZ2Pq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fd0583-f547-49e3-d966-08d8bd486401
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:36:28.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQKyrUnE6Q92c3sOZy9l9dG8+AnCfS5q0mPveFyKh2DwY64+3LRhLwiJzts2lc5aByQrffTeMWVYnQENTBtUiQzM2NI2jJvPyqF7NUvA05M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: multipart/alternative;
 boundary="------------18A07D3DC34B874C37D12754"
Content-Language: en-US

--------------18A07D3DC34B874C37D12754
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 12:37 p.m., Leon Anavi wrote:
> - Add connected instance variable to the MessageBus
> - Better handling of message bus errors on disconnect
> - Ensure futures are not done when settings results and exceptions
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-dbus-next_0.1.4.bb => python3-dbus-next_0.2.2.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-dbus-next_0.1.4.bb => python3-dbus-next_0.2.2.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
> rename to meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb
> index 0a5f19974..1970fdec1 100644
> --- a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/acrisci/python-dbus-next"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94e750c96e56788499b56c81de91431c"
>   
> -SRC_URI[md5sum] = "0d44e12e8689637a0c048ec7bb51d842"
> -SRC_URI[sha256sum] = "1b1942bffcc8c9a5bd6834257df227a55ee28e07dd413ead82ddd23115652363"
> +SRC_URI[sha256sum] = "f656a3d3450b670f228248ffb1c3a703a69c4a8cb10cce63b108f17c8bd6c3de"
>   
>   PYPI_PACKAGE = "dbus_next"
>   
>
> 
>

--------------18A07D3DC34B874C37D12754
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-19 12:37 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210119173746.24694-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add connected instance variable to the MessageBus
- Better handling of message bus errors on disconnect
- Ensure futures are not done when settings results and exceptions

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210119173746.24694-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-dbus-next_0.1.4.bb =&gt; python3-dbus-next_0.2.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-next_0.1.4.bb =&gt; python3-dbus-next_0.2.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
rename to meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb
index 0a5f19974..1970fdec1 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/acrisci/python-dbus-next">&quot;https://github.com/acrisci/python-dbus-next&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94e750c96e56788499b56c81de91431c">&quot;file://LICENSE;md5=94e750c96e56788499b56c81de91431c&quot;</a>
 
-SRC_URI[md5sum] = &quot;0d44e12e8689637a0c048ec7bb51d842&quot;
-SRC_URI[sha256sum] = &quot;1b1942bffcc8c9a5bd6834257df227a55ee28e07dd413ead82ddd23115652363&quot;
+SRC_URI[sha256sum] = &quot;f656a3d3450b670f228248ffb1c3a703a69c4a8cb10cce63b108f17c8bd6c3de&quot;
 
 PYPI_PACKAGE = &quot;dbus_next&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------18A07D3DC34B874C37D12754--
