Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.48])
 by mx.groups.io with SMTP id smtpd.web09.12018.1615394829565579207
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 08:47:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ozYguH8l;
 spf=pass (domain: windriver.com, ip: 40.107.236.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goTGhrwq93ETVbz6Dzsct2wDBVJrcRlc8q6ikmudCTX4u9PNUmyuWNbsHFRJJ3RVNV3zsSoAF+w2o1z3C/hgz26+DFxdVJkfhe+TF+H7B1focLlCUtMCxToBDlU47jbC1tu0cWO2a0irk5ImeYWym3bwnSSH3ohDMYQyaYz0iGHNOA+8ckTnZaX70coeinqdpMoPhf6L8czdBdX6+n4EwDUOdtkJj+DlBgILF7qqKaIYXg90gtLKFY3767wprJyCn+uwdN+E0sfkaoaKnW67/mXaUEk3n4LlzRqd3P1hjftYcZ24mJ9N32fpgOJCKc3NtKcJM1xMuyPW03tvoAb7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOzcHVUnPJIPIH4NINBzHX2U+SHqf/cvpex9/jESowU=;
 b=AFpJgndSNDx7Zgx3IlAxCR3kX266rbm/TTdtdLM2bPFJPV2P3nIC42HYycXwK0Tp/Utfd+Wwg+YT3OGeFmxLPA3L8BMDP2CZuswXEnNtiD+/2jLxQK87b3mTZWEtnxdLwsTo4vWV2H36QFq8wdLLnS0yh03a2jPNYMNWzX+7rznVplHxasQALniGRdGEY/bLqXDH24Y1fNolCcZ52sxGY1cTlVOLdznTNDTOznWhzeZgrCZRtog/UYrjucD3VvmKhbtWj+lDvDg4A6xn3LDl2KrRDJ/ev/OI6HD5K6ZwnnuXM5+QukpVuz4CMA/FjKCjMmjcksQI7GATjXO5KYPujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOzcHVUnPJIPIH4NINBzHX2U+SHqf/cvpex9/jESowU=;
 b=ozYguH8lWlpjPZGeA+I/Km0dil3++CRwq7ijeeMYb7hZKz7x53aa9PIyYrqh/AsR6FQCUw7vwDsaixuShEQJy3Fj4ExcETHrcGyqGMPFDPWoHGEBolDJkn8w3CkJUdSTT3wB7PJPYA2tk/2AfS264z/Id9miFPCsFr8WvfshNlk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2680.namprd11.prod.outlook.com (2603:10b6:a02:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Wed, 10 Mar
 2021 16:47:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3912.029; Wed, 10 Mar 2021
 16:47:07 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-incremental: Upgrade 17.5.0 -> 21.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210308161810.21582-1-leon.anavi@konsulko.com>
 <20210308161810.21582-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3fc9ecd5-5095-c1f9-97b7-0c1a56a956a2@windriver.com>
Date: Wed, 10 Mar 2021 11:47:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210308161810.21582-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1701CA0019.namprd17.prod.outlook.com
 (2603:10b6:405:15::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1701CA0019.namprd17.prod.outlook.com (2603:10b6:405:15::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 16:47:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67e95069-9055-468d-071c-08d8e3e4246c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2680:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2680A06F65E7170C9AC942A49F919@BYAPR11MB2680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3Nr+lPRqNWwlaIOwZj50sfK0n+8p5qSW0Pj5yjwGeOfC/57vQ7iux8PUq+ZpVC0KchCgjp+uNfLGQgRueJYlQM/kUV75oCnhz4T5NO+ZeDoEtrchywP1ZxKGFwLP9M6kVpKwDK54fUrh5JwTGgpdBISokVVTJF/7WO/1M5uwsvnnSy7DST7ZDJR7iyu7MnU8rNH5SWOz7N6sg/92pqpfGChZUIXNL1nc1VjVE6m/O7rUJt/28IRsQ2vJ0Xj9GvVmkYJzYEjCzMxHuE8nQAQ2L4JkZIoF1uAE4OAgeoq4WOn3MLgauyz99CXQj8EJNT4wv+eJsQyH7cVdefEITFdPU6gsp5OXr9LMHplfaAPEnpFkQ5aU1HLfQX9+qUERIonCVBy5erQOaLinYqnZQSxblmvkxc6goQBzPKQN0ypsMgRyblcFMzCFA9FFPC7AFSUekAZh2qf/WLAnMYTUK6lSPjU+kWrkgQK4Z+Qs4r0OHwwDcsiLdyvZlCLUhRKsZ8Dm2HRwjxsJwWV6BJ2GUWU1DpTixw3MBlepek7EbhoswqctfCnmsarshHkkUzIjeNFqLBuIYm4mUrPwl3LxGaoNiaVnHlHqkUiHmQwNl6KPhe6VnSmYUCtl/lH/+TwF5VBYmoQoxaxpyoxjT94UJ1zBVuP3VW0BOBHJkcPGa0L3GsAUm6rWPHOkmEn8x+6TKTqhMvJbfwyvVSX1vtrU37T1Cg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39850400004)(136003)(66556008)(66476007)(966005)(186003)(5660300002)(2906002)(8676002)(166002)(6486002)(8936002)(66946007)(53546011)(33964004)(316002)(16576012)(86362001)(31696002)(16526019)(31686004)(478600001)(83380400001)(956004)(2616005)(36756003)(26005)(44832011)(43740500002)(45980500001)(148694004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RE9sVkM3cVpzcUNBWEJqc0svcTRrdU9hdkt5RmZKamc3V09JQ2JCVm9qejJh?=
 =?utf-8?B?dFdiVUduM1V2T2p1RVVQUk5ENGVHZU1NazJEUDNleEVVN3g3QUk3Uzl0dXRn?=
 =?utf-8?B?YVNIOGNJcFlGM2pOK1RuZUgvR1pjeVFHQm9iTFhqR1R5bGNvbldHSDF6dk5S?=
 =?utf-8?B?UEdQUkI1NzJyMW02M0lBbDFLK2lha0t3QVFra2ZCMUlNcDdIVDlaTEtwcXA1?=
 =?utf-8?B?RVV3L05sclJ5VlIyTHFFdy82VkRrVVhRN0lGaU5qTnV4RUlMZGFlK09pYm1V?=
 =?utf-8?B?ZEZiMzJmRHVhU0dzdVFCN1RsVHloL0p2UnpGYno2MEl2c2I4ck9PM0l2d1ZE?=
 =?utf-8?B?R3cvL2Jqc2JZb2M1TmxPY2NKazZVdlZZcDFFMnoyM1AzZmt2cnpRa2NuN3JB?=
 =?utf-8?B?RTdwaEhrUitZMkthQlJhYkVpZGNSdWVWVnNlcWZoSDh0aTR4MkdJOC9BWGcv?=
 =?utf-8?B?Y1Y4dEJycGZTMXQrMURSVUloYXNTRDIyMk5hYWd4RDE3RDdVMUhVdDIvTXpv?=
 =?utf-8?B?NXhZVE5MSmk3OTRpdWVmS09WWTJ1SytEV0Z1S25PNEZ1NmJCQ0tkbGR0L1Jy?=
 =?utf-8?B?OGllN0Y5YmJHTno0MDkvSTM3UVh3N2FFQnNmV3ZOcENSdm04K3psR2FCbktO?=
 =?utf-8?B?OUM0Qi9KcTd0YzN3MW5ZajlWTUxTMEY4SGM3aVN6bmdRdFMzaGJTZ1N6Ty9D?=
 =?utf-8?B?UWNDcFBNYXRtOFo3bktCR1dyWFNBSUpoQnVVNVd2UFBORFNzRmNRL0Z0R3Zq?=
 =?utf-8?B?SVlSSlZrYkhlOG1PVG1zNHlMd2JVS1VzNjVZWUxTMUhDMThFbXYxeDZVTDAw?=
 =?utf-8?B?VFFDRm5iZ3krWi9abXE3NWs3bXdWanBkQjRJbEViYjRwZ0RoQU9uM3AwMUdi?=
 =?utf-8?B?T2I4cENBbC9WQzJVa2xCQzJ0VDA1VFcxWWZ4a01Hc2RJT0RHVER1UnZseUJs?=
 =?utf-8?B?WUJxaDdQNlMxVTZ4SWVkVktjcWdiajFuRUMxUFhRb2ExVHZtbFM2Zlo4NUQ2?=
 =?utf-8?B?SHpCK3NqcHVFb09uc0N0TmhZWXlVM2NmdWpjZC9aSTNZVlBjVm1BelVEc2lm?=
 =?utf-8?B?U1dnVGZDbnhqcnpFUzJuNmFGV3hJVGh3b1pvVU9sTlhvV1NkdGx1RTdoRjBS?=
 =?utf-8?B?Q2xtTzhHdzVuYVJVbzZqMnFDWVdSUzFHVlFqcEhrdjd3dU1CNm9abU1vc1Av?=
 =?utf-8?B?MGlZQjVKY2toQW9aS1BJcXFmUC9lLytpL09YcGlCVk11NFpDNExhS1NkUTJH?=
 =?utf-8?B?RDAxcnM5Q1ZpK3FxUGxKUkNsY0NXRGpmUnJXVHNyc21yaDNPclZDZm8rNW5z?=
 =?utf-8?B?WHA2QThaMS80TTBTMmIyWitzK0NsTVVrYmd0cUFvK0JSak5oRTdBSi9Keito?=
 =?utf-8?B?Wmk2aFRmMU1EdUtGenJKZ081MEhuMm5MUHozekpPU0xLT2RKSU1QQ3ptMmF3?=
 =?utf-8?B?ZEcrbm4zNm1ORUJtTm5sbFhWWXBpTG05UDBKa2wrR1NEeDJCcHZWSnhMTHFt?=
 =?utf-8?B?Z1dWS2hvcmozbFNSSDU5dEJHaDdrdFBLei90bXg0Q0pHeVBjb0dzSU50ZWl1?=
 =?utf-8?B?YmFIbnc3dVZJL28rYnF0LzZrZ1FtSjliNlAydThJeGNRYkwxRjRzK0ZKNjNP?=
 =?utf-8?B?azlkZC9qVU83b09SRkZkS1B3MVRuc01PamZSK2FRYWE2UHNkQ29rUForZ29B?=
 =?utf-8?B?NGw2NmdBRSs3c2VpRzkwdWNNcmpheXhPeTlQOWNEZ3NsR0t4MTlzbkxZc0xR?=
 =?utf-8?Q?sI4xSbuvYzbObH4It1ouOxaNuBAdyX5Mre4o2I6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e95069-9055-468d-071c-08d8e3e4246c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 16:47:07.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzgvOOJzkOVwWZCc44QZ4Z4k41YW3elNlnTMorN0RUiyBFY5BpQ1YhmAoH2PWxQi6D+qw0ys8MYdOmd6nYp/GKicBYg170qWj1V20FKEnwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2680
Content-Type: multipart/alternative;
 boundary="------------0A858CFCFBCEB081A0BC8CB8"
Content-Language: en-US

--------------0A858CFCFBCEB081A0BC8CB8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-08 11:18 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 21.3.0:
>
> - The output of incremental is now compatible with Black
> - Incremental now properly supports PEP 440-compliant dev, rc,
>    post suffixes
> - Incremental now properly supports PEP 440-compliant post
>    releases
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...on3-incremental_17.5.0.bb => python3-incremental_21.3.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-incremental_17.5.0.bb => python3-incremental_21.3.0.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb b/meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb
> index 568ba1989..ff8fab31f 100644
> --- a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/twisted/incremental"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15"
>
> -SRC_URI[md5sum] = "602746e0d438e075a5a9e0678140bba2"
> -SRC_URI[sha256sum] = "7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3"
> +SRC_URI[sha256sum] = "02f5de5aff48f6b9f665d99d48bfc7ec03b6e3943210de7cfc88856d755d6f57"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------0A858CFCFBCEB081A0BC8CB8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-08 11:18 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210308161810.21582-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 21.3.0:

- The output of incremental is now compatible with Black
- Incremental now properly supports PEP 440-compliant dev, rc,
  post suffixes
- Incremental now properly supports PEP 440-compliant post
  releases

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210308161810.21582-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...on3-incremental_17.5.0.bb =&gt; python3-incremental_21.3.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-incremental_17.5.0.bb =&gt; python3-incremental_21.3.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb b/meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
rename to meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb
index 568ba1989..ff8fab31f 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/twisted/incremental">&quot;https://github.com/twisted/incremental&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15">&quot;file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15&quot;</a>

-SRC_URI[md5sum] = &quot;602746e0d438e075a5a9e0678140bba2&quot;
-SRC_URI[sha256sum] = &quot;7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3&quot;
+SRC_URI[sha256sum] = &quot;02f5de5aff48f6b9f665d99d48bfc7ec03b6e3943210de7cfc88856d755d6f57&quot;

 inherit pypi setuptools3

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

--------------0A858CFCFBCEB081A0BC8CB8--
