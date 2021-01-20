Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.83])
 by mx.groups.io with SMTP id smtpd.web11.27516.1611149657004927472
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KRpm5ZIn;
 spf=pass (domain: windriver.com, ip: 40.107.243.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZT3wr2Dghj9TdhVDl0AXeu/dya1tm72VVjsj1iVbnJRyYohRy5P7d0LlARO8Yz2wdwA/igJKv38xTcANiPKyIsKbqS2EZTExFk/BJCe3Ogbuw7EPiuJ9y1cUqO+JnAdLdTCe05CE36iPo/+BNyyYX99C7jJPWDEPN1G6dZuH6FqlqmqbM3qNPA48/GSpqtASTE/94m9DK3kpF8FwTP5dMTPfmaf4cRzMr/BDm/Wrw0XJuV9mjXT1MAvG4RBRfy81xFK+z6GBGHgmgAWWz+iUGsNcwUVIBQyIOKEZ0HhAInF0FhZ7bNA5peLUInOAqnouLz6/gqJb271kFX7O4Wbt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YqGuecYeFCt9FnmH4Z29UKhxYus6mLFGfM3ck+dg3I=;
 b=mnrFQw+2IAU+Gi0CNOYvBQje6MitZAzTMvyFVyUisTZSfuFV7s8LFiJhjb+lPaj6J6YVVTcCisdJmDsVO3ndYM/E9cMIZ/rfxiOhQzqvXKBc8OFB+dpwqOPg8vD0eWeZ5B6/9Z1b0vN+YVktZ/M6Fq8GdNofB5FS/UYop+BqVGSlcNSvbvVwvH0G2h45iZXAjPn6IpjaWFVz5eubK/cUSUSJ+yTxKTe5vinJsjEt/i8IW+Xuf31+bBo4ybV6z3iK9P0KgpYQoJc3/dRJFVMlVoXfgKIA6zn9yCg3/V3fbuaLbC3MshNc0n42AjE4GUqGc78bNVB4cVhpyurgsBamxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YqGuecYeFCt9FnmH4Z29UKhxYus6mLFGfM3ck+dg3I=;
 b=KRpm5ZInbFdcft36D4wjVKeFx9y8pfwwRHKj8muVKgwMZp1F7roC2vUeNw6WDvIZo9I1XxKWHUULrdAkFyriQL0cC23HqjY4/zLTBQwF1wY5TnA9vyWujVbj7mdR1bmgo2AF9OEE+UfMj31w3KXmKgZvKWBR47hpbi/mFUcbxvs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3558.namprd11.prod.outlook.com (2603:10b6:a03:b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 13:34:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:34:15 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-colorlog: Upgrade 4.6.2 -> 4.7.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0224f349-5c76-1fa1-7d19-97ef54b946f3@windriver.com>
Date: Wed, 20 Jan 2021 08:34:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210119173746.24694-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:610:4e::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR02CA0001.namprd02.prod.outlook.com (2603:10b6:610:4e::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 13:34:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08294222-bd93-4ef4-cf28-08d8bd4814a5
X-MS-TrafficTypeDiagnostic: BYAPR11MB3558:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3558CC6A113CB647D2D590F99FA20@BYAPR11MB3558.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kIvocyDP4Pb0R7PJfm8KSBYLw87jiF2490UUVwYmpmvarHHEtzxC3boOEwRrJF4KXBj0ojkdq1N2rNV1aXr3M9aB9+w26a9b88qvIHjNqnJYhG8ZYn5UyUlrRpEaWAVA53nsiQrR2OeXBvXr4k94AYS++5Zee4oQyv/NuloqxatzKTkrm+0XTfW7fmBzprpvxBxygdlRKD3w0lf1jwYkubaD7cHGBRJTfSaXqRllenns/0i57A4q8KG9nkLga/0IeIKkIck8TYg0fA7HGWHWSd5oUnPyMiQpPWi0dXddSfUsfNZhDSr72/w33kclH08KCwSGtJi762dqACDDvbivv8y/4VRp2VGwKFR1/8T5oCbithAYyYjV++Bi5rkP88AADv5i2KZ6H9yov1zz6UbGN190L9CnQrJPvA9r29AY/7GpQiQEuGVqJ2NsbWj2yI+cQ/JbrvXeym47h0RuSagXZkvN3aoqhTUAozWw9UPGEC2EcF9clqWRPRpqx6l2IDtzkL6F0RKj6JVlZQ6pC6RaVZn2FE7WEnXVrG4FKe6e6vXjpWEd9pZ3Q+q+W04e6bwM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(66946007)(31696002)(36756003)(2616005)(44832011)(66476007)(86362001)(6486002)(478600001)(83380400001)(31686004)(966005)(26005)(8936002)(186003)(5660300002)(66556008)(16576012)(16526019)(166002)(33964004)(2906002)(52116002)(53546011)(8676002)(956004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WmhOdGdTd29LVU5jQ2tLdTZpUTFCbjh0UWhiZVovS0I1R2JOWDJuVXJpS25Z?=
 =?utf-8?B?SVV2bFo2T3F1Y3A4WUZYdXhnOTFON1ZhRTdCdC96SFpsTXdCOGRSRWVhVlh4?=
 =?utf-8?B?TTRjK2JaR3hBU1BacW8vV0h6bnRHWDJ0aXFETEljQkpETWpoSUJ2N0w3RWVR?=
 =?utf-8?B?Q1A0SWNJc01nOFdsTzFPbUNGeVRPTWVjaWxtMGtFdFRDNzRBVmk0UXlKbmI0?=
 =?utf-8?B?WFZOdGJpQ2FqbWoxWC9Ya1g2a3AvRHpwS2RBT3Riam5ldnJ1TWp4WTdXODIy?=
 =?utf-8?B?azMwbi9EWk4wNitZeE5NdnN3TXhEUWxjZTJScjRQSkt6cjBKaFNJdDAzVUp4?=
 =?utf-8?B?SXFVaFlKQkVXMWttUXBhTGVIelRCMG1CdGNFbEViT2xRL2ZHRDl3TXUvbksz?=
 =?utf-8?B?aWk4TUZNRTBvRDNCNndGcjFIQUlzVWtoelk4ZmxGMzhaeEM1dm1tYkcwV0I1?=
 =?utf-8?B?OUZBOFAwVDcrRnB1MEJMQk1jNVNUcEx0enZSeG1iUExKLytodFNOQ1BGYzhx?=
 =?utf-8?B?cEZXVXk3NWZrUnVWaTk3UGQ4LzNsVGpUcVNVWXNPQWxPUE9RN2phUVhqcG5D?=
 =?utf-8?B?ZFlpanc1akUrazY3VkpuTDIyMk1OSWFRamlzcTlhd1I1SEE4NGtyMW9Mc0w2?=
 =?utf-8?B?VTU0YW9Eb2FKeWlSTmpUWEhvMUU5MWxoRWFibWpiZ1dSMlJ0Q1VtaExRcHVF?=
 =?utf-8?B?TTFvMFRKWnhsN3RzSjI5WXo5dld5aWlSclpQbCtrRUNrSkpQOHdPcmtDUlM1?=
 =?utf-8?B?cjVPd1VETkhldkU1M3JRV3dLL3hvT0Rna3BPanlpYlRQMFl3di9aTWpIRDk2?=
 =?utf-8?B?NTBrWmJIRmYyK0xBWWw1dWx0TFNsVkdWUlhKYWNTTnpxT2hvY0s5VFVpeDVq?=
 =?utf-8?B?a2s3alkrZE9GQWMvaGp5dnVOTVd3eldxYm53bE1zWEJJQkVKYVpKazBGYWJC?=
 =?utf-8?B?WWhKRW1mOXc2dFY3MDZXbUM2Wmh5RHExaHhxR1Y2QythZVk4SjYraTE2NGU4?=
 =?utf-8?B?RHlRejFiMjQyYnN0eFFYengzc2Q0V01iSXNFT1hFYXRBdTEzUGdCeXhqTnVG?=
 =?utf-8?B?bFZXaHgrUHNaMEIxV2JpUDFlTktQYU5naHZpbTVzSE5Fa3kxVUhZdmhqd2ZN?=
 =?utf-8?B?WGg1dWJzcFdvL25PMzQ0bGVIYVQ2aGlTRGZlTzhaWkNOQXVHdkdmTWlUVmZ1?=
 =?utf-8?B?Vi9yUzA3dFFsc2cyc09ZTXBuT0R2cDdYaDZJZytaZmJSUXkxSHJqT1pmc1A5?=
 =?utf-8?B?eEN0ZG9mNkVhN1dPc2F3ZjI0K0tOQXVzQlVVZFZuaGJVS0oyYTIwVisramhx?=
 =?utf-8?Q?tnpp/0I/nB7FCOrhtkYc3vE7WOhe+TuPoN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08294222-bd93-4ef4-cf28-08d8bd4814a5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:34:15.6449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07z6U1FP39Hfmel3pm++wL0CP1O/Rq1SY2o2FIH4hYVS5qVHWYdC0BdNppUs5E7q6KDE5Ul7EbeyZWXRJYZuaeAynrT/wOOdZxWPHB7X72I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3558
Content-Type: multipart/alternative;
 boundary="------------0B73006EC5D939ECEC9642F1"
Content-Language: en-US

--------------0B73006EC5D939ECEC9642F1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 12:37 p.m., Leon Anavi wrote:
> - Fix linter errors
> - Fix typo
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-colorlog_4.6.2.bb => python3-colorlog_4.7.2.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-colorlog_4.6.2.bb => python3-colorlog_4.7.2.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
> rename to meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb
> index e98d276f0..c9754ed88 100644
> --- a/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb
> @@ -7,5 +7,4 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "colorlog"
>   
> -SRC_URI[md5sum] = "72441753be8ec437af9e5bb89db344e7"
> -SRC_URI[sha256sum] = "54e5f153419c22afc283c130c4201db19a3dbd83221a0f4657d5ee66234a2ea4"
> +SRC_URI[sha256sum] = "18d05b616438a75762d7d214b9ec3b05d274466c9f3ddd92807e755840c88251"
>
> 
>

--------------0B73006EC5D939ECEC9642F1
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
    <blockquote type="cite" cite="mid:20210119173746.24694-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix linter errors
- Fix typo

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210119173746.24694-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-colorlog_4.6.2.bb =&gt; python3-colorlog_4.7.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_4.6.2.bb =&gt; python3-colorlog_4.7.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb
index e98d276f0..c9754ed88 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb
@@ -7,5 +7,4 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;colorlog&quot;
 
-SRC_URI[md5sum] = &quot;72441753be8ec437af9e5bb89db344e7&quot;
-SRC_URI[sha256sum] = &quot;54e5f153419c22afc283c130c4201db19a3dbd83221a0f4657d5ee66234a2ea4&quot;
+SRC_URI[sha256sum] = &quot;18d05b616438a75762d7d214b9ec3b05d274466c9f3ddd92807e755840c88251&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0B73006EC5D939ECEC9642F1--
