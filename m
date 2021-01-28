Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.71])
 by mx.groups.io with SMTP id smtpd.web12.23994.1611839352573156068
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=j68+JmPT;
 spf=pass (domain: windriver.com, ip: 40.107.244.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwZ/lify3Cep4kom/C28zSBW72gwbHVnJ7xm6dJOtFFnhJRDavAwm9x8g+bVXxFCZtXQA58T8A31U4knpMu1Oi2jWk67cpCfyOcdAYqNc2xCDBj9PslZHx8mT0eurJ3qnfb7SRNVcnl9qxQnRAViRD3jQTUjas0kyBbqdUCLVYalHJkxvV2W6LuWzJmDZ+sdZR9BL5h7ylzLDQSf754LunFMwkg3vOtFLV6tJRuyRCmEbQUgELtmma5cjmH+4ET7KJPf0PL0DplG8vaJ0XOZqT7JHIggJXT+GULd81ZrBjKwi/Vq2GwwqU3SfXT7ur6LjKXYAa5KRnup7OAcDh94Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWdJkSr8k9bN3QgnawDG9v+guYVSrCrx0f2w1fWfAMY=;
 b=D2R+4nOUnhqEupnCZYkFDJ9IEpUIhOlC4gSIC6XSjUW41Q4Wsl/4M8keISblqlQ+Pfy3Fge+9LKlyaD3wMp7jJOrXS1V3F4Cly3yCaX10WMK6KRGBlsr7ogjb9fadxQjwSEzRGuhLAeJTLX9qPG1u2IQbRVZy5aH0DeA/DsQbd0wAtYksDdSx46zCKY5iJrH/9TN/50N53waTJbqcW0Qb9+JzB6cZT6XuQqXG2OlrMHYj9QG072cAwc1v1OCyfdM1BLd+hrsrbPu1f93H/CsJCuIt2ZW7LYOx7bkuyMDvnw4sVFYVOVtO/T6I1kFI8ycsJZfWubqiPuJ7qmqZEsBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWdJkSr8k9bN3QgnawDG9v+guYVSrCrx0f2w1fWfAMY=;
 b=j68+JmPTK1cLwgg9NefkO1YclhXl31BFhOXHeu3SdTXxlBnnOPRdtqpTLoVZGiHjR7f0kJ3ziSb6adD2UPjIQM5QLfzbeRqTc9n2Qsqn0FlkskAPzUtWHbPRseDYhmrJPA/ek3BYFDOx19KbJoTJkYwpfmb+wcJIxo7xbXBQOtc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:09:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:09:11 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-intervals: Upgrade 1.10.0 -> 1.10.0.post1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210127155538.12229-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <62b7aab1-6538-6352-18ce-9d5006d3c6dc@windriver.com>
Date: Thu, 28 Jan 2021 08:09:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210127155538.12229-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR14CA0024.namprd14.prod.outlook.com
 (2603:10b6:208:23e::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR14CA0024.namprd14.prod.outlook.com (2603:10b6:208:23e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 13:09:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d798d554-4c24-44a2-3f66-08d8c38de75d
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB295172D919EE1F4855FA33589FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bLhQZK4j2xb4PVPzKgMEWX3mhZHdR/zBqzA8ZXARJ2nrpUIwJPkjmv0AHkf/kejjdzyOiBUxDzCaxDme/d0t/8maMn6uW2sYt4vgb6iyz4CxYm8DHYnrXJ8BZY8oBw/KUVGxqcb2S5hVsTNJPGEqbAfREUhW5ryRkVSezpgjx+lKG68iy1XcslGdVK4bhWgYaa+DZf9nTGtoGzg+S2UDPKyL3+v9lZq9QjDgxOTaY0t67/LNrN1j/bjFivVpm+K5dS6uQhg7ZMkjg5B5VuhJOgHxfq5MBdCU1GdI2jrolcwr5mL/+UxLjh+7aEzj2gccxHWGRLOeou4phVZX9FSFvH7EAxLGZMbfk6KNgpOqh2k3N5RMi8zdjE8ufAvGRVhAjDMpWYqt3+ZrrZvGeS7NwUUPZXA19Ee2kC0CCqvjR1wIvqWFNYQYsHDC2Cm7yF7Py3boT0hhEYeCjpDXKKxKUPbjwtPmetyVbqQOfNyUnPhItwF9vgGQW4fBZ6JkphxnjTetACrrobCOAOHUKa360/sedVXiFPL1+AJl0WxZmlGWF7GA+IlCVeZtwOgFPRodl5rCQyFeFkBgyGOv+pdAZkMLJq5tfyTd0VmVGWB2hqOzQvh6Ja9cU357Hj4QaR5SPWPpgE2LaaJlx0wGjCKaJk8V4EJehsmKoLPjANFl/Q9WWy7w6l8vgf+xD0RepnQp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WVpET0NnSXdGYldiWnd5ZGczVXZrVnFhRld4cUpQUnZ4MTZhYUc3eUI1c3ZW?=
 =?utf-8?B?MllXQjUxMFF1bEFlZVBUMTRkZnJwSDRGcmNkaTlTK3M0elpJQ1piRVJBN0FU?=
 =?utf-8?B?UnBpV1RFeFNKOE5CN1F3dnZ2THJzWElza1BLWXVVN1BxbnZEWDZYeDBWK2NJ?=
 =?utf-8?B?bVRHQURGdC9HVldSRUY1RHZmQ1RKSVhaQjY2cnNjZzNNN3c5MDByVzVvVG4y?=
 =?utf-8?B?UmFPM2FPc1hkUTI3TUw0aUE0OGNkNldkaEQydDNNL0pWYy9RODJQQ3BHWmVP?=
 =?utf-8?B?YVgzTExwTDlPaUpGT1J0ZmlVT1g3OXFjWEpNVmYyTStzU3hobnc0Q09Ma0xa?=
 =?utf-8?B?VTg1UjNaUThGdGtjVUJxR1pGWXF0SXVpa3BDVDdmS2cxZEI4Vm13b25DTmlU?=
 =?utf-8?B?SnR0UkdGTTNJZFdoOEVRYXBMV1RqYUlYa2p4ZlVRcDdCRXppcnFvRXlQVW1N?=
 =?utf-8?B?MXEzcFNmSUtITlVGcXJzWm95azBGSGs1RXVrWWRScFp2ckxnNG50SDYvMHda?=
 =?utf-8?B?RXNiZHJ1bmxnSTI3WVViQitaRFZYUDl5YjdPNmF1KzJpYjI0MGs2M1p2SkRu?=
 =?utf-8?B?d2g1RHJycUFscERsMU5DSkdQYnNZYndYdzZlREVueEdacnU4YXcydkpnYmFn?=
 =?utf-8?B?aDA0d2I3OU5QbWtGYXFRQXEyVTAxYitTY2J6UjMwLzdKUlZDdFRaVitiUExB?=
 =?utf-8?B?bG80K2MvU1VUUmVrVUlWSVMzRHhsRHhOK2NIakQ0b0RtdzZtN3dJbkN1c1Nt?=
 =?utf-8?B?TEd2RmJtenExRzdjT0JBNjc3Q2J5amdwb2JmMU1uN3NEdmRMRXROekc3ZWRL?=
 =?utf-8?B?RTBHTGNFNXEyYVVUQnMxbUE0U20ybnZKNU9VRENGbnRCMWgyTnNZa3ZFdzN5?=
 =?utf-8?B?UGtZR2FvdjEvakJMT05ES0Y5NytwSnJlUFdUWUpHdk5td3V2Y2QvbXZ4S09k?=
 =?utf-8?B?ajgydnU1YXQvL0pQQWYzS0VmeXk5VWc1cXVYRG5SL3ZsdkZmS0hFeEpmQW1T?=
 =?utf-8?B?VnRWUUFpQTF1bXhjcHpqbUQ1TVZwazJJejY0K21Nb1hnbmlmNEJ5SmpOVWJZ?=
 =?utf-8?B?SWJZUyszalFPaDZxSnlTVEtueFNGWVZWRlE1RkhLNjVIdENFZG1uUlVmYnln?=
 =?utf-8?B?MTBzNDhlOW9JY2Q0NFlWeVJPblc2aUFZOFZRYWxRVUU1NnNWc2pZVTIrSkVM?=
 =?utf-8?B?TmxMelc3Nk1Fd3dZUGhob290S1M3QXhzbnpRa080ejJRVzlkMjhnMk5yQ2VE?=
 =?utf-8?B?MFc4cjRCelM5dGFmSVNjaFpDVFhMeUhXVThhVHhoYUFxVmxEbXRkNUUrUjhz?=
 =?utf-8?B?WnVUWlljbXJ6dW5jOWNYeForaTBvWEJxS2pwUXFBQU5ycGI1bnVtTy9NM3hk?=
 =?utf-8?B?b3h3eEpKaldELzlZKytRUDVZNlpPaHNSdWw4bFNxUWJyZWMzNUdDZFhzb0RU?=
 =?utf-8?Q?HcBm3ShQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d798d554-4c24-44a2-3f66-08d8c38de75d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:09:11.4157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcxr5MYFZAWaSiOpWt3w+IUK/aDkvKhaLKbAcsBPkEx0A8+AUnfUFL9bCyRnWtMMVbI2hk5s0QLnJ6k+dQQBMZTaHAy1FVrUVDKDaqf0Gv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------E6FC6B0E61D5AF74F81AD4F5"
Content-Language: en-US

--------------E6FC6B0E61D5AF74F81AD4F5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-27 10:55 a.m., Leon Anavi wrote:
> - IntervalDict has a .combine method to merge its keys and values
>    with another IntervalDict.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...3-intervals_1.10.0.bb => python3-intervals_1.10.0.post1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-intervals_1.10.0.bb => python3-intervals_1.10.0.post1.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
> rename to meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
> index 2e8276ec7..14bc9ad25 100644
> --- a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
> @@ -22,7 +22,6 @@ do_install_ptest() {
>   	cp -f ${S}/README.md ${D}${PTEST_PATH}
>   }
>   
> -SRC_URI[md5sum] = "8955317ff4e42590c90ba6247b1caaed"
> -SRC_URI[sha256sum] = "0d26746eaed0be78a61dd289bb7a10721b08770bb3e807614835f490d514f2a5"
> +SRC_URI[sha256sum] = "68a772dc2de6b2b2e83b457329ffa8f9286710994b8070db54348a05762515d2"
>   
>   BBCLASSEXTEND = "native"
>
> 
>

--------------E6FC6B0E61D5AF74F81AD4F5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-27 10:55 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210127155538.12229-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- IntervalDict has a .combine method to merge its keys and values
  with another IntervalDict.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210127155538.12229-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...3-intervals_1.10.0.bb =&gt; python3-intervals_1.10.0.post1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-intervals_1.10.0.bb =&gt; python3-intervals_1.10.0.post1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
index 2e8276ec7..14bc9ad25 100644
--- a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
@@ -22,7 +22,6 @@ do_install_ptest() {
 	cp -f ${S}/README.md ${D}${PTEST_PATH}
 }
 
-SRC_URI[md5sum] = &quot;8955317ff4e42590c90ba6247b1caaed&quot;
-SRC_URI[sha256sum] = &quot;0d26746eaed0be78a61dd289bb7a10721b08770bb3e807614835f490d514f2a5&quot;
+SRC_URI[sha256sum] = &quot;68a772dc2de6b2b2e83b457329ffa8f9286710994b8070db54348a05762515d2&quot;
 
 BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E6FC6B0E61D5AF74F81AD4F5--
