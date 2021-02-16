Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.40])
 by mx.groups.io with SMTP id smtpd.web10.7283.1613480340829008540
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 04:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Wh+cuk6G;
 spf=pass (domain: windriver.com, ip: 40.107.93.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLgDe7Q3PjK3TMH8B4hlaYi+y9GMnCPUdil33joQmMtYfA/Q91R8yrV10nogaermrsA7vhTHkMCAR3ttuFRoj7D5UmtrqOmWz6sN0gQvGgcavuz3MbWNc9iaSiC+AebFFo+J/xTLqqM0Ui/PpArqzCulowdy6Zpod2oDGDth2/vwbWJcqhJoi8FM+JzFrp7V8VMEQ83d5utVCMZdoJBZ5zUp9upi8sJvHFtAwTmwuLWhERCRXA1b6p5Kf0Oofa1YIIfHhSW+6L8b+opb/4bWDrdBQN0HvfQPLaNSqMinMFwOfe8L6jgqQWr/x02HLQmcRVEy6i4Uh1R4/rt7eFAbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnBWZlTaZCdUL39VGtwoetO5s6ypaeqfz1dDP35UfBw=;
 b=iG+6XONbnpKfRON1U9O6mATFuetJGlKF1PkTfkvSt5FF7jeetxA1YA+VsCV0wHrHOtyVZEbR0gb2niw9UEk0MUsV6J2fTSFoeyKlWkkKD1fBIzITfJJajxCLdUkmJOqwb/ZR7LjCTLkrwrcq+9inrGPK81qumG4pKGQJYXO9q1Di/3Amf7tJlmemzFvT26BfF/IkbBIm4ylsOYMnN16+oPSguALK52fMjtbtXA/10RGLsQUQKijMPWQ34F1QHHz832E3GjzxRwLjHX/I8XZ9fOEWj0gi1yBMcpfjouUBusFbfSfxv0o+03O12dpjQWetyiP0P6KC5MDlHR4g+AD4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnBWZlTaZCdUL39VGtwoetO5s6ypaeqfz1dDP35UfBw=;
 b=Wh+cuk6GqP0i/u7oYANZCgcly/wgMUdY9poga0GQa9g520rE9Ew9w7kTeumt62nNuNkzaQA9F9Lm12MCInj/NKOK6sXLsWXAlzF+e6wgt7+kwRtMA60LSQxvebMFe/kyrfbw/fXMbJ20b7gL3Sah/exsvhoCXkDfqGOB/oZLjv0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4418.namprd11.prod.outlook.com (2603:10b6:a03:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 12:58:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:58:59 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-watchdog: update to 2.0.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210214011915.446967-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a1b9bb47-a124-5b86-c075-2def88f10fd4@windriver.com>
Date: Tue, 16 Feb 2021 07:58:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210214011915.446967-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN8PR12CA0030.namprd12.prod.outlook.com
 (2603:10b6:408:60::43) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN8PR12CA0030.namprd12.prod.outlook.com (2603:10b6:408:60::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 12:58:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd78e35a-b625-43a3-2631-08d8d27aa098
X-MS-TrafficTypeDiagnostic: BY5PR11MB4418:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB441894C924E970FFD7542B6E9F879@BY5PR11MB4418.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q0eo8827mOWVq+Xy57cHDPuP/VdfjfPf6+b4fqnmGtV5VGetoHjJi/tmtC+Z8th/ol92oCmMBxYKPSAek4XJbY76uwnvjzyKZv0tuNAjm8HwpL6hCHZ4qNTP6wvnn676y3B9lFe1E2eO83loVHuYHRXgco0TQorkCGGT9tfwPybox+4zHbtHRnW4XMkjtA7UTds0Mi1kUYhmmBe7SaQHAYGXI/j2xYmVHuebS2v/rkQAVL4w5CRoSO/LY8WX07MhTA18H6GqGTKRZLX9IYhVL28hZnoWrNfy6WwgrtqhRbbFg2vBh4cuI5iKFD/CXL37oSDV4qVZfjHBj3/K5kVtfDVJxRzCCblFc9NTFY21ZIb3sEfgC1d//trOxGoiOfiBuoItQyLQE/aH2ZyjcIMYhrpUVi/elSix0Tj2kuy6BQjPXxeTq2NW++HiIiiy6QgLVBSonEYsYJriwgAmT2+PBRfF7CPJ3zYLSUxmBf0FGqrbHDZGqXAfPsD24KBBoBMoiKhCHRDIWLgTERlwk/2N8JAV8K7VPZAjMOIZ/7UOP/Bn+tiaDIJ6B0yo5VVH9BNsuQHlBpWqaETitm8ODiQhXBpI9bmX10csuGPhpSbwzDCwtxUl2wwnr9EmhlXY30aJDEKaOPHK84LbwObfcKzDdD0Q3FWlvoW0oy8TMS3Sj5BtvYZIQoNQ/TAdDBNosBP6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(366004)(83380400001)(44832011)(2906002)(2616005)(186003)(478600001)(86362001)(33964004)(53546011)(31696002)(6486002)(52116002)(36756003)(31686004)(16526019)(8676002)(316002)(16576012)(8936002)(66556008)(66476007)(166002)(26005)(66946007)(966005)(5660300002)(956004)(15650500001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZlVNaVVHbWNwUzZHeGN3Nmxxa1k4K0k0UFRlQTVoeXNucitOa0dSTkRtL29T?=
 =?utf-8?B?UTJnMnhhMklUM1EyUVhNSXorVVZWR0hPNFVuUmNkUkpIUmgvWEZBbkdKcGVJ?=
 =?utf-8?B?eFlHNG80SHR4QnFaQlM0ZkZFMm5qaGRMV2ZIQzcvaVJ5RCtmaS9wK2sxc0I2?=
 =?utf-8?B?dmN4OEhpaHJhZUVvYkcySlFjM0QxYWRza09naDZKd1BjeDE0SHFES1VJOCt2?=
 =?utf-8?B?MnkxS0JoZ1lXUTNkVlN2QjRUbTNRU1FPNk0wem8vUHdDUUZwaC9aOTBrVFdr?=
 =?utf-8?B?M0VjTVFlbWpoeVN1ZkVLUW93amtnc1JxZ2NjY1dTM3F0QnZvSGJRcjl4K1Q4?=
 =?utf-8?B?MksweDllMlpGMEdpRklnclpXcWhJUWVqOStjdkJ5Z3hTZmZuQkp4ekJHbVRp?=
 =?utf-8?B?UUc2SHhXVzlOcEpvWXJyczBoTTQrdVZXclA2cWxTa254OS9lVCtZcFFsb2R4?=
 =?utf-8?B?eVpMMHBCaDROY2ttWEF5SU42eFgxRU05ekJnUkwyRUpJTUtZekE3ZzlzVDVI?=
 =?utf-8?B?N1dPQmhIeWd0Z2pkSmdRTEt3azlBZkxJdjAvWEx3ejR1UGhWeU9nVEkvS1V4?=
 =?utf-8?B?K2drRy92ZWpwSVFYeHVLY1ErTmZMcExiQlhuQzlCT01XSmZkbnVTR25yUjFw?=
 =?utf-8?B?S0NPajErRGdDanN3V2Zkbnd1Z01tQU8zZWxpa2FHTUt1Mk4wTmsxZ1YzSkJt?=
 =?utf-8?B?Tzk2LzF2YjNQUGFvNzF1RC8xc0pVeitPQ29qQ1VQSi9DWDZUd0gxMEx2ZTgx?=
 =?utf-8?B?bUduZjZ0enI0Mmg3elZVNlFsWVVNTnlWTHZqcStWUW9zWTFDRjl3M0c3QnF0?=
 =?utf-8?B?RlpvZmdPMVVFUFpBc3VESFBMMmdRZE5CMXF2azVyNFY5aDNmZnRVeHpjMjYw?=
 =?utf-8?B?V1BZeWJOSVFXN21Xd2RCTDNzT0t3T3htamlTNHZHcXRmSUxXcWtXekw0RVhi?=
 =?utf-8?B?bGVraG12alZjaFEvNy8yWWdsRC9hTVpyaFhSUlpjenUrM0ZsV0NiTG1YajdZ?=
 =?utf-8?B?ZElNZmIxQ29nUWJEanBTWXc3U0sxR3JTd0h4YnJqS2tPTDZuRGZLYVJ3ZW55?=
 =?utf-8?B?ZmNCM0tRUkFTVFdGZFp5dVdwM3FoSTRpck95VklXQk1TclpRQW5UcGtMSGgz?=
 =?utf-8?B?Q1Eva0QwTEk1b3k4MGx5VGZ0TFhXYnk2cFBXakFldzBvV3ZidTZIR1VMWnpn?=
 =?utf-8?B?ZGw3UUt4ekg4dCtSdnIyUi9scVVVK1ZHRFhQOGdpRzgvem10SEtsaTVweXQw?=
 =?utf-8?B?T0U5Sm4zd1ZqSHpqQ0tlNkphbjhxM3lBOFFCQTFSMmwvdmpCdml4cURKQTNF?=
 =?utf-8?B?OG5RZ3psZ2dyM1dqMEFtSmJYL1hFRysvcmZobUFGNEZqKzQ5WFVVcWl4UnB6?=
 =?utf-8?B?L0dtYUxzanhLSjcra3RGcGxSWExtUlpyWDM0eGtkMXFrUmpWMFdNNVJuZUJO?=
 =?utf-8?B?Q2VHLzFjeTF6cmEzckVQUTZ6dDE0UWd6Zk9ISjJWUXBicEQ3b2l0bDZYZjhx?=
 =?utf-8?B?SmRDY29ReGFaMVYwWlBmcEs5dzUyM3I4VWhIWDZvVE16WnNvR0RlOTM5aC9w?=
 =?utf-8?B?eDJPcWlPRDZlUm42azZFRkZZbGc3RXZGRVVrVWxiYURGbXoyc3NsdTNyVFNu?=
 =?utf-8?B?Y1ZHM2twbjR6ZVNmTE9QR1oyVm5PR1h4ckFocEtpZXlkcHJoZ3g0OXArSHg2?=
 =?utf-8?B?OHFWWTN6VTFPdlVRZzMxYzFuYUVmdndVUVBRMTJjVXBqVUhIS2YrWElRSTdG?=
 =?utf-8?Q?+CDPsOU33ZnTqYgCIqVpM6Ppb/vJl+QGa5jRRPN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd78e35a-b625-43a3-2631-08d8d27aa098
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 12:58:59.7172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rp7AHceqFT0U1UbDDHzo1PcyqkBUDY5X2g45O9d2uJ3KEAzLY0VxjlIPxWDzeBmRegYTh4X2XVyBcsh9BTZM/a6k3uq19KTR/6G5IFKWJgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4418
Content-Type: multipart/alternative;
 boundary="------------B7722A830C7DC6D39E771495"
Content-Language: en-US

--------------B7722A830C7DC6D39E771495
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-13 8:19 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-watchdog_1.0.2.bb => python3-watchdog_2.0.0.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-watchdog_1.0.2.bb => python3-watchdog_2.0.0.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
> index 698dfe770..3dd1f8182 100644
> --- a/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
> @@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRC_URI[sha256sum] = "376cbc2a35c0392b0fe7ff16fbc1b303fd99d4dd9911ab5581ee9d69adc88982"
> +SRC_URI[sha256sum] = "fd4b56cfbe0d0d9c4fc431aceca75700a7f12d3737dc2e9cb2ec2ba649680425"
>
>   inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> 
>

--------------B7722A830C7DC6D39E771495
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-13 8:19 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210214011915.446967-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210214011915.446967-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-watchdog_1.0.2.bb =&gt; python3-watchdog_2.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_1.0.2.bb =&gt; python3-watchdog_2.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
index 698dfe770..3dd1f8182 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
@@ -4,7 +4,7 @@ DEPENDS = &quot;${PYTHON_PN}-argh&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>

-SRC_URI[sha256sum] = &quot;376cbc2a35c0392b0fe7ff16fbc1b303fd99d4dd9911ab5581ee9d69adc88982&quot;
+SRC_URI[sha256sum] = &quot;fd4b56cfbe0d0d9c4fc431aceca75700a7f12d3737dc2e9cb2ec2ba649680425&quot;

 inherit pypi setuptools3

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

--------------B7722A830C7DC6D39E771495--
