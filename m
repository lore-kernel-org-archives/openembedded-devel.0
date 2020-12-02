Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.79])
 by mx.groups.io with SMTP id smtpd.web12.5306.1606918345355618991
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=i3jnKlWQ;
 spf=pass (domain: windriver.com, ip: 40.107.69.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eF3APz3/xlq4Icm5pG0RcyproIF+6QTd5qgXtWalFiFZZgGKqvImz2cAWZh8FXAm9bZR8ejNf+essbI2z/eR3d2yYZw5P3B6iNBdZoPgL5VMYJEFOwfCtUdcOFT9MmCk+3Mikz7OMLFt5hDLbk5W9qW9E+3deUqAcVw/+tqL3RoGlJSewNuxhPMRm1dOm8ET5AGhY+LLAV6JrFF39G8AxWn0+C4zkihIKq22Bxn+/E5z/iZxFqfCSahxubTUI+idZjgh19IguHYHxDKArL55GsL/RV01hrcqJUg9bl0BDrbar25qtZHfq8KbUMDqDo+K7N0E6Rfcc4681mSbyJ5+Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2U7P3InRZUlkxhMIbOzK8AzvNxGoqnR5twUsINSgCAs=;
 b=JT1S7krDmiICIqYV+FF2eJaJOwxWk2CkB8YP4Ba+jF6ZK5EftS0QDo1HxFdjDMvJM4k5t1BomAs3pjCisYphmd3ydWQ13VGTH5lERyGSheX5O52/UN2a6E3so35s3O/GSDP8jfvdJZ/h4Lk/KeasLEURvGl35OZDf/qPolzciOmCk8ZS7v73oIO13mwbb5lq26kp8wImRpGqnN4v83exPcKhbGBZX1j2mN+Liw3ELcEdgp5b5F3OcyGSRy41jLxHXu++VMR0slj50lncPftr8cuMQ/5heCMKNhCau9a1LNCdJUSZBA/Xws6VGpPwdymTRvLKLSaILXNa878EKmq3lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2U7P3InRZUlkxhMIbOzK8AzvNxGoqnR5twUsINSgCAs=;
 b=i3jnKlWQhD2OOPCyJM0sViRx/1uYfFJTp7hxiVg19zYrhUzEIxBtDAr6QQzWfu8jWXPiuYgNuvHiPqdPlSJ+O88dw0jL8nZ7mCUFQqS41N1PzDC/iUZL53JpzAc7PXMZ4SMGQo7SmgmzZsIyX42tFDPvE4NYrA/3xcQ4MXwYfqY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:12:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:12:24 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-matplotlib: Disable LTO for clang/riscv
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201130022755.3534198-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4c4f709e-cce5-91c9-3ce0-e17d1a974410@windriver.com>
Date: Wed, 2 Dec 2020 09:12:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201130022755.3534198-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:12:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47f214bd-72ed-491d-e915-08d896cc4a9d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4864005EFE53D6EEE20896CD9FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ot9apnXcuSpNxKNbRrSGp+oXLeKbNNtn7hHpqZlcfrQNAxzvTNuWMo32V9u8eJEd6xJUKVsDtbJtyIyELNzN1GAVP368KhCLwm1vo66NGmFsczSLj35rFJoaovhhyiLau0zVhLXQ4IK6lSmOlIXSx/bXKKkVO0lIxnj8OA3v3oW73coTwWz9XZAuheQ/dn96kDLa6wM9AIYk78dRZDg4rLQw/2vjGoOtS5WEJYAQ+Idz1Azs36UGJ0a72ZJJBWznlxJaWZcX21xDKTufzwp65fupC1xzn35BHG8Tm6AzEet8GF+Zw7KUbKXfexhADjiMOQakPoQ/qH1nlyS7VT+YXPD204ec05o2QNNlg+Q9ghI5nQSBejQpc5wzL2D8QFaE2SgQWhhLGcE03sdN9UlA2wCQzaOaHnmkSBSkG1UY7Eh4YWYl87gWxgiJl05PAM4+lBvdq0m/r66ZZ6W0odXJ6lG0AOoFHLmViXjANLXdZb4e8hBM4vZ0NU6r7JKi2F2B
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WkZ2cUJUU0s3QkZaclo0N1ZPTzBpZnN4VWpVQnZhaEhYNFYzd0poSndwTGpj?=
 =?utf-8?B?WlkzUjhUQSt1U04wdk1wZGRoeVVhbjhlczd6K0s5NU5DYUdCcHFTQzVnYjBK?=
 =?utf-8?B?U3Q5bGRnL2ZKNm1idENjRnoyVlFSVkJhVUp5cVhGeDNOdEx0YzgxV214ekw5?=
 =?utf-8?B?ZmdNUE0wM3N2UTlMU2xudWEyLy8wTnlxUjVaMXczdEtwZ1o5cGlNMnRTZVpX?=
 =?utf-8?B?LzdhUS8vRDRGQkMyOUtkSTQ3eUxZSnZiM0FXdExxNTA1Nk1pSjVxcW5mTWF3?=
 =?utf-8?B?MVFncThPd1FPR3RyZ0hLaDJOTTNpWXhYS0RtVVdydDVUV0FzMnhaVFV2TmRv?=
 =?utf-8?B?bFpRc1d5enJJQW9DZFJtbTRpdkVCNnYrQzN0T3NacHVKREt1RjhhUVlCakZr?=
 =?utf-8?B?ZklJcUJUTEZueVYvN2ZjajlBbTlvdnluUW95SlJ0bVJnYStrU3ZkN0dzelp0?=
 =?utf-8?B?L09TOWh1NXJwbXQrWnBNdUZwUFBEUVZtZWRXQUIwaTZxQkdVTVFZOVBzUFpq?=
 =?utf-8?B?NjlPaVpmMGFjV2ZmZDJXN2N6bWVkd3I3cnh1K0VmMlhpa2FYMHdEa3NZYytt?=
 =?utf-8?B?RU51OXA3ZWphRnUxdVhpU3hVdGYwU3Z6QW5nQnZwWEZqNXdIK3RrSkJxbEFY?=
 =?utf-8?B?MTBnZ2NhSW5ySk1JU3IwaitXOExTcHJnZTI5OEV1bEtQVTJBc1JhR20xWkY4?=
 =?utf-8?B?R2FiTUhoZW51TVdpRWE5R3U2U3h6a1orSjFqYldRTUxjaDJpWU5ZSHF2aEVx?=
 =?utf-8?B?NDVoeURzaVI2a1NQV1RnTWE5L1hHQkcydUdmaTJBWlRIVmxSeWEwSFVJYUV2?=
 =?utf-8?B?b1pDbGtxUlJWZXNwcXpWcTZmVzhkY2ZZWVV3TzB4ajZEeUZrWmxKczlSVUJl?=
 =?utf-8?B?Qm1jR2xSZGFicU9RTkpzbGZDUVk1QmFsS0h6MTJicHkvWDU2eVBWNStBT0c2?=
 =?utf-8?B?RW9QWG9scFdlUFBuMFBYTGlyV2pOaHlSWlhHaWIwWkVvRml2M05WUTZpSmpj?=
 =?utf-8?B?aU1WSEpGUUphOHVkTGxiVFFCSEgzSGVzN202dzFMdWtTODdUUk4wZjdidEhp?=
 =?utf-8?B?U2F1S1EyVDY0M1RNTGttQ0hZOC9JODRxejhmeGV4UHJ4cUxZY0JmMkF0K2Fi?=
 =?utf-8?B?a2VucXdKQWRCVHZxU21mYXdETTN5Q3VYK3YxNVJhZE1WL3VGM3dzWlJsSmdx?=
 =?utf-8?B?MjQvVnI0TzNKNnF6aUlhWEthSDNEMzZsUnd0VWZkNDB0UHNENEsrMUhab0ZF?=
 =?utf-8?B?QnBnaTFGZ2tsQldDb3phQnAvb00xRURwSjNXYWV6bER6YmMvRHduYkMvOEgw?=
 =?utf-8?Q?INZ61vaCAZrKoYAQni+FGyZ+mycTb0mNXm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f214bd-72ed-491d-e915-08d896cc4a9d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:12:24.4401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jo78LIJX1zXRPx6jKQK3u7FWi0YmsMeZvpfvQM8Bn0S/MCfroJSQNTW1uCKTPqn2IX3o2qCGcnq/hKgd9YafspsnLBpI5yOi6ZIoPT/aw8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------9CE5F2397E115D1BC678EF1D"
Content-Language: en-US

--------------9CE5F2397E115D1BC678EF1D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-29 9:27 p.m., Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> LTO fails to link on RV32/RV64
>
> | Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (
> ignoring target-abi)
> | riscv64-yoe-linux-ld.lld: error: lto.tmp: cannot link object files with different floating-point ABI
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-matplotlib_3.3.2.bb        | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
> index a2e7074d78..3cfa3f31f4 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
> @@ -38,9 +38,12 @@ RDEPENDS_${PN} = "\
>       python3-pytz \
>   "
>
> +ENABLELTO_toolchain-clang_riscv64 = "echo enable_lto = False >> ${S}/setup.cfg"
> +ENABLELTO_toolchain-clang_riscv32 = "echo enable_lto = False >> ${S}/setup.cfg"
>   do_compile_prepend() {
>       echo [libs] > ${S}/setup.cfg
>       echo system_freetype = true >> ${S}/setup.cfg
> +    ${ENABLELTO}
>   }
>
>   BBCLASSEXTEND = "native"
> --
> 2.29.2
>
>
> 
>

--------------9CE5F2397E115D1BC678EF1D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-29 9:27 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201130022755.3534198-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

LTO fails to link on RV32/RV64

| Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (
ignoring target-abi)
| riscv64-yoe-linux-ld.lld: error: lto.tmp: cannot link object files with different floating-point ABI

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201130022755.3534198-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-matplotlib_3.3.2.bb        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
index a2e7074d78..3cfa3f31f4 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
@@ -38,9 +38,12 @@ RDEPENDS_${PN} = &quot;\
     python3-pytz \
 &quot;

+ENABLELTO_toolchain-clang_riscv64 = &quot;echo enable_lto = False &gt;&gt; ${S}/setup.cfg&quot;
+ENABLELTO_toolchain-clang_riscv32 = &quot;echo enable_lto = False &gt;&gt; ${S}/setup.cfg&quot;
 do_compile_prepend() {
     echo [libs] &gt; ${S}/setup.cfg
     echo system_freetype = true &gt;&gt; ${S}/setup.cfg
+    ${ENABLELTO}
 }

 BBCLASSEXTEND = &quot;native&quot;
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------9CE5F2397E115D1BC678EF1D--
