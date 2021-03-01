Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.43])
 by mx.groups.io with SMTP id smtpd.web09.1038.1614620996655655946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AvQY55EM;
 spf=pass (domain: windriver.com, ip: 40.107.236.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq+NtJPrS61+KdmyFjeHRewnzAFXCiag+lyR/3J45pEV9OtMt+j6ARjICCoF7TBGD/xO5J9FNK1S027vq3G27BmS91QopGbjKjljLaUl7kQFIH8rkaAyPVXXwfLv3U1Wq5SEZLaLs9uIfTw+n0j2dHF3Z6+xs2p12nqkCz6DV0pnNlEyX5z3lOWJAvExdndUC3fCciXPKbExCxx4iuU3jeEw/h//mcBrvRePXyz9bXGxGt4htIwmWiWB6/wvbWBjgtPIa8w2Oqu/B81nzDMhsohMpqqXfNB8pOWCDPymU6OgymHvTLRXpH4iAqHyW+oYtr3hNh777YRFwtd0TAfAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dOnEdqDTPYQoKLkA5Ty0aCt7BFn+ALUmMf87/K5mAQ=;
 b=dqCo6YDJzXcC9814vRfDUQS5N33r8ooj1JbjQTlXJzkB/Kr9H3qHWibhT/BwK80yXGt1Jt8Ql1egTCXAfYbcXdALA9C5Z1aV+pNcNKKSu4D0TlUbzixLZx7Y4eOqhAeHTqTFqm9+3z8bX5HvG9ZYqt9L625Qf6ekMNucinSgz+SRd74Q3pBuZzQP/at5AfWFtos/aqKVWdchMXDutdvB/O8l5SO6L7tqW7l7FLVUNtP9XkhepV2iJd74e5a6amEVNjcO/jSRdrMQZ7Yvs9zMYGxYvh8BLjr9GhoXNkMyugMmq6HziLq8CONTU2MTkSmgYDmYV+L3xMu3qr4gmEx/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dOnEdqDTPYQoKLkA5Ty0aCt7BFn+ALUmMf87/K5mAQ=;
 b=AvQY55EMJ/R02FBmkGZ1BSAC9eIQ9XOE3Bq6DXpp3hZo71WD4ag/VevAOL4d/Ii51uhxiiUVp+X+wUeKo4oNxW4M8BN510rIfjmsLOIKs0hpUiLbx3oJIIYrn3Eg6y1mDHSyNp2emm7DREk18F6blkhfByjp0W+nOmlGyVyI5Es=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3303.namprd11.prod.outlook.com (2603:10b6:a03:18::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 17:49:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:49:55 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pulsectl: Upgrade 20.5.1 -> 21.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210225160544.8994-1-leon.anavi@konsulko.com>
 <20210225160544.8994-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c172db66-2f93-e786-453e-89fe2cfa51fc@windriver.com>
Date: Mon, 1 Mar 2021 12:49:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210225160544.8994-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR19CA0086.namprd19.prod.outlook.com
 (2603:10b6:404:133::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR19CA0086.namprd19.prod.outlook.com (2603:10b6:404:133::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23 via Frontend Transport; Mon, 1 Mar 2021 17:49:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2eb89d51-ece6-4811-7324-08d8dcda6c1d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3303:
X-MS-Exchange-MinimumUrlDomainAge: github.com#4892
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB330399F952DC06825FD206369F9A9@BYAPR11MB3303.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	auYMZacI1RwTgJj9q85GM8rHT2oaXkwm484dPFpzGt0dIcQ1R7HCW+QOn/tOf89whkfxtubP4FPOS2aXtfvFe4hKgS6gfiNmsAU+UPD5hrx2wBcI2jXf9rVwbVVAyINRZiDhWxPinq3Ubf4JbSizY+I58K8JmboMU/MZOTc4Wy3mVE8KT5ceVJE+s4Y2hdBexAs+VtoasiNaXKpeovvnaxysy5NXYossE1NYk4c0HNX5p+vRD+AuVABozSaOtMUyW31FuMR9lN7wUq1iNgQbLGU8bjNTZNMluriho4jAuUekIh2fPzsr/DzByOnMZ47ZyExlnE6KzoI4dDuZ4gnzXkxgGgpo5e54cUy76npd+BcynmavhtlHhXzbPHXmYyZVj7h+Gzz+z4VsVsa1PBzOlYP7kKG80RD3acBNG+Sti3TpFrDsQVXJcNDG546T7YMTj5lsPekGFQ8+nQT8zT/9mRWfVkGFqVW7ZKXt6nyyWo4aWJgDeJ1Ao/aBdmP6Lcd7R/faczSidWFfLV1zYvExI1MssiVElb0LjATw82c4uwTUmFi1PaSH9is1KGCa3ntsrOdUhjXwffK75gmzPIVBtwkaTITucTe97A9B5IaTWNIo6aFjZlwjmIKk9uLrRN6MmqFc/CTIKf5eQa56eTCFWfxcqvniG+CQO9JLxHLls3uS9PtC4Ohc+jb4JTho6/my
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(31686004)(66946007)(8936002)(26005)(8676002)(2906002)(6486002)(16576012)(66476007)(316002)(66556008)(86362001)(478600001)(5660300002)(33964004)(83380400001)(186003)(956004)(36756003)(44832011)(16526019)(2616005)(31696002)(53546011)(966005)(166002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aHMyS1NmVXBzZVYxRzUrYzdRWVB5d2ZOUEVOaUI3TXpGd1NhWFpHZ0w1SHBa?=
 =?utf-8?B?MnRyZEVaUzgrdDBOSUh0UGFOZ1cxd3pNTCtkMklqeUpGYkIwS2Fqb3dZSkJw?=
 =?utf-8?B?RGQ1M016eUVQSmh3T3dMVjZwV2RmUWNiL1IxY2V2cTNSWGJoTUZqeGRoVnlY?=
 =?utf-8?B?UUxnK0hIRTNDZGpleGY3MmtQQTVKNUVZTytpMWtkTTUxeW9FWEQ0WnFObysz?=
 =?utf-8?B?SlpaV0ExVWlibTRzMkczKzA4RS9KQ3poam9RWWFVK0U0NmdtODBlY0o1RUR4?=
 =?utf-8?B?am5kOC91bGJSSDFHY1RUSTFZK0RJTGc3eCtHcUJ5d0Q2MnFRTFQxc1YzOGxB?=
 =?utf-8?B?T3hDWi9RVFc5VHBqK3hRTXJRRFpDRlAxeHJwSHJIU01QSEhldGc5L1BCME1M?=
 =?utf-8?B?Q0dWNGV5ZTIrZEV4ZHFKMm15VHFKUXV5RzBYNmZJUUpBVEt3YnZJWWJFTElX?=
 =?utf-8?B?aTlJamYyYVF6SHZNWTFiRnBJcE11U3JNT3VqUHczQ2x4OStONHF6RkhCREd2?=
 =?utf-8?B?K2NDZElDTWtpTnNGc1Z0UlFrNnhXcXpUMlhqd0JzRFlsaWFFaDB5NEpiTmlt?=
 =?utf-8?B?MEdpYUJWazVHaHlubTNDMUlzSzF4elFSdUxVb3RWYkk2ems3S3R6RTZ5QmpG?=
 =?utf-8?B?MW43SEhncmk2cW5TQkQraEtsVjU4NlRDcmJObFlMRU1adTF2WTdqNDB4T3B6?=
 =?utf-8?B?dHBZUkloM2RSaGwvSEJXZVNzZU9kRU1MWE5zMmVmNzgzWmw4K1BrZmFmRDNl?=
 =?utf-8?B?aWRFTGluOEpacG04ZjJucmhtbkkyNG13b0xUeDRSZWJnWG4zR2RHUUIrRzVD?=
 =?utf-8?B?R3ZWZHNZY01IN0ZVWUE5b1p5TlFadVZnVTRMTEhPck4xTTZhNWpzTTRjckI2?=
 =?utf-8?B?bll1Tm5SejVNaWp6dCtzakR3K0cralphNWtCcjJ3d1hya0hVSDYxdmUraG9P?=
 =?utf-8?B?WW5ZdE9TcVF0RnluWHNuTENkdXdOVUtHMkxuclNPV08rN21USFNnUENGMEFV?=
 =?utf-8?B?R2dEdUNSY1YzcE5XZUpISExDQU1OeFFFa3ZhWXZWc0xSWjZHZk1oTGlDa3FS?=
 =?utf-8?B?dUkwK2ZhZDI2UWZpNkRmd0ljeGRkRGVQUVlKVHM1cnIwZ05ZZk5IVEMwd0Mv?=
 =?utf-8?B?UkRyVDQzT1dvdlRKakh3cmpNRWthazJTTm8rUUc0dlJnd0JDd3BDZTFjWGM3?=
 =?utf-8?B?N2RGSzNXUzBDYWYxcVlNWXdPTHlTbVFQR1NyRnFZakludjNJWk9ic2xkK1hs?=
 =?utf-8?B?eFBCUFg5dHpMdWphdzlMVWlxZjh5N2xweWdGQUgydHNKOVd6ZExVekFMRHNF?=
 =?utf-8?B?aEYzTG5xVmlQYmI4Y1ErdjQydVZUdXpNVy9rZFlxOWxjTmVaTFNURGtoZmdQ?=
 =?utf-8?B?VlZWVHMrVUdFRVhqTlpuVHZiVkhtKzVMWUl4SWJkZnl5Q3pxVW9ERTNHcTVv?=
 =?utf-8?B?TEowei9OeEUrbWIyQ1lTc1lKZklWR3p3aDlXSUpNb2VYNkhCZlJHUXBPWExB?=
 =?utf-8?B?cUJxMkhhdllHS1EwcGE0dVV0bStyOTFmUWlZeEJKcDFNeldId2pDY2pZWTFB?=
 =?utf-8?B?K0k3bG8xVkpjcW1WZSs1M3VTWmZub2xqM2p5N0dGQXlDcmpKaWczdmxQWEVM?=
 =?utf-8?B?aU1mVkc4eW5VM0VRTkU1cjhMR0tialM5Zk1yRTMyYVdFUC8rb0dLaElZQ3Qx?=
 =?utf-8?B?ZGdORExtUG9hZU85YWRHSWdLY3ZLdEpGT1dYeWt2bmFMelNDSFlMTlVYTXlX?=
 =?utf-8?Q?lj2ra3gNjDsSLzyifJ1T5gY9rh9mTXO7qlkuXJy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb89d51-ece6-4811-7324-08d8dcda6c1d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:49:54.9904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5TcjNiFlvU8P2nEL3VplCltEWSplE6NXpzXrr9Q5BI+gPZCCIeLO6MRK9ybHX24iMcsvHjr6YvBm41x+dyOcMtTVNod8MwoNY2bPS9z6Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3303
Content-Type: multipart/alternative;
 boundary="------------8BCB893615A31E727675A56F"
Content-Language: en-US

--------------8BCB893615A31E727675A56F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-25 11:05 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 21.2.0:
>
> - Link pulsectl-asyncio as an alternative for async code
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pulsectl_20.5.1.bb => python3-pulsectl_21.2.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pulsectl_20.5.1.bb => python3-pulsectl_21.2.0.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
> index df0c8e578b..c99a5507ff 100644
> --- a/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
>
> -SRC_URI[md5sum] = "8de84a0f4005ecad96d2c55a6d7c3a10"
> -SRC_URI[sha256sum] = "39b0a0e7974a7d6468d826a838822f78b00ac9c3803f0d7bfa9b1cad08ee22db"
> +SRC_URI[sha256sum] = "282be9ad1a9add961f0bbafa8e19723ac397a2eec5e14fb8cd6c51ff29962715"
>
>   RDEPENDS_${PN} += "pulseaudio"
>
> --
> 2.17.1
>
>
> 
>

--------------8BCB893615A31E727675A56F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-25 11:05 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210225160544.8994-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 21.2.0:

- Link pulsectl-asyncio as an alternative for async code

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210225160544.8994-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pulsectl_20.5.1.bb =&gt; python3-pulsectl_21.2.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_20.5.1.bb =&gt; python3-pulsectl_21.2.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
index df0c8e578b..c99a5507ff 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mk-fg/python-pulse-control">&quot;https://github.com/mk-fg/python-pulse-control&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=f1d10048469ff90123263eb5e214061d">&quot;file://COPYING;md5=f1d10048469ff90123263eb5e214061d&quot;</a>

-SRC_URI[md5sum] = &quot;8de84a0f4005ecad96d2c55a6d7c3a10&quot;
-SRC_URI[sha256sum] = &quot;39b0a0e7974a7d6468d826a838822f78b00ac9c3803f0d7bfa9b1cad08ee22db&quot;
+SRC_URI[sha256sum] = &quot;282be9ad1a9add961f0bbafa8e19723ac397a2eec5e14fb8cd6c51ff29962715&quot;

 RDEPENDS_${PN} += &quot;pulseaudio&quot;

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

--------------8BCB893615A31E727675A56F--
