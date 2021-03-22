Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.53])
 by mx.groups.io with SMTP id smtpd.web08.13501.1616422641305443067
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OoQctio/;
 spf=pass (domain: windriver.com, ip: 40.107.244.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgrqjxCoQsFoVvvXYFEiHxLrGYYZzuKDf8qN0ZZh+sTbXDDUDrpJBn2n7PAHqhB6KZr14PjyX0Uns2pb7UlzG0/8PcI5vuMq+UyW0q2n0w8ylAHfhMJUCMV5yZJeyF97TOM/Xuccgk3Xk+KKBcmE4fBlJyLsJ1Hl75VqXN/r9/l9tq+aMjRtHqRwAyDHt9e81BMU6812PIuQF8sA6iKDBpCYVNmpvqyBwje7MHOWmj9SW6lojSDJ9e601StslDIG3s1pptiwpZUazK87XDussamxpW34eX2EJsBd83ng6KcnNKN0N/2kdZib8BqIyQxpbU8Z5mACZ4fDWyNdhT5psA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfha87a59Qknd12NjFMY6NkSchw7MaBotoPjv10Jy+o=;
 b=ZxC6PhVatPszHR3UyRaL7FJXZbT7BmMXneOxyd9wQYdb2EBaMNvy/cqpnGR/Cs2/hDmoELX6/TZSiKi04oylCfJsw6DT0jeFYWPMxh7+r3zywufEvYAiDJqxk9DtddOK5s7NscVr9XmTA1oD7wmSAFNFrGNLDL1tzQ+GPu2ArJDTa5WzYJrwuSocEambWf5lOueeRlX7ZHuAu36kr5PKlZFWEfg5cYkfqL7sBx0t8VujXEfg5nX6IbnS+TBTUGd23bw0oTP7UpGqvESMvwjRQ3DdQ4xZh93fS+Ycaqo2/ncHye3bCzScsz/PKHTkMvLix2uFu8XkvC7+4yYHAVjxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfha87a59Qknd12NjFMY6NkSchw7MaBotoPjv10Jy+o=;
 b=OoQctio/RtvrY/bRYUCp0hY6BymKGPN4DK85Gg8A1qcAqcoIxRIGmEW9WkggZJ4z9E7lNUMEchs6K5zcbluiWglcXa3yEDCdrhLcdQgwIbeK79pM5YIdTTED1CniC0fIrs8t1RGsZybbg/3/uDJiz5awcTKdYTUy+eTcAq/3s68=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2679.namprd11.prod.outlook.com (2603:10b6:a02:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 14:17:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 14:17:19 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-urllib3: Upgrade 1.26.3 -> 1.26.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210319171304.28090-1-leon.anavi@konsulko.com>
 <20210319171304.28090-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <93750394-5c7f-53e3-83da-e29b58c15495@windriver.com>
Date: Mon, 22 Mar 2021 10:17:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210319171304.28090-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:404:8e::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR21CA0013.namprd21.prod.outlook.com (2603:10b6:404:8e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.1 via Frontend Transport; Mon, 22 Mar 2021 14:17:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1612843-3b87-4973-a638-08d8ed3d3393
X-MS-TrafficTypeDiagnostic: BYAPR11MB2679:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26791B77FCF1C709F5F35BA09F659@BYAPR11MB2679.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CzZE0JFRLxwBKwMj55nCf3+tDWfhdMeRGALpgYfuv34yVUWvQluGAul6D6gWVZxJghxV88nW9K+MN9dy9h3npQv5NZOwXoJLkCf3ikYgrP+SLyS7oMZF6V57rSQTCR/GGFVf34EBctx6DxPqzGUjlz01I6tZ7OF4wTzzDBvqmK2uyrLJ/GWVsEm3U5Syfoluo6td5qNEbEYlZS2w4JPaNm9SNpczjUNVH/lV4UKvmICnaYL8s3CfwhKTZBGu3mwdwEwHTcOCh8LgjMktUGqcnfwV3F6+KF0MuMztzWQN1pbD90X/Wq0x9Y3JZA7EIYC7MAA5MBv89XyMF2sWhy48sqNfc5twP9a4TdK9G2uTA7qHF23Rqjk3rzu/7dgCzbuKQZK7s68PjdpAdY6Rb7/b1MbfoV503ndaFqKDPlLFsQVdel505xiANhAnXCPSr8aS8uatfSsGKvKD7fRL2fZFuQ3SOpGPLdo47fyp3x3O+cWsS8bkk4QN+y1iiaXA8DYhJX2cOGwHd6BlC8MHS2CZfsKkjfVeDTT657WYmk+LF26IYJsMMcMLS86SWYhNA+sDVPBtXnHbGZ/4hhGL7XslxWWCdxWyHL49ybpncfgjOpxH0gk8fKD+G3FIMETVBg2+kb+rTqZeWdB3s30mfv8DiLSN8n47B7zt7TzoEKGuXVd5KUGGJxcxaof6UxNvdCPswT6WzMuo9Tb7yXuFCIfaRbAzt+6D8x075QMG7Gl8k7bKKeizd9hCJ91+KYct9X+DUecqTkedwyubaW/6MeYrVy/P7d6fQ/MuUzrkx3gsF2o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(8936002)(66946007)(316002)(33964004)(16576012)(8676002)(66556008)(66476007)(86362001)(53546011)(16526019)(478600001)(31686004)(186003)(956004)(38100700001)(36756003)(2616005)(31696002)(26005)(44832011)(2906002)(5660300002)(966005)(6486002)(166002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SXE4NHBpcXE0S0g0NDdiNVhHcGcyNDFRZXZmRGI4ZTFOTmZJdnF2RkRmaEdF?=
 =?utf-8?B?NVVtdTVEbHBlSW9sUHdiMlo1M2xoMTZiQ1VYamlKMGlaVXZwTzVmVjBGRitV?=
 =?utf-8?B?eCtsRW9mbjVSZXI4Y2lOQ2FlL3FUNVZTM0dla1ltTGxTaGNtTFB2THAxbE5t?=
 =?utf-8?B?Q2JMV3p6TWFXMlptQWRLM0VsVHVBTEUyZXc1Qi90YXB2cEdpbDVnQ1J6aldt?=
 =?utf-8?B?OEpRcFdPelVGUzREWHQ1ZHlVT040dkhEV1djbkFzbWI2ZU1hbXdMZTBNOGQr?=
 =?utf-8?B?N0hOOWwxSXhhKy90MndxZXF1QllidVp1aDJtUlI1N3dKV0lZV2NCT3lIdVhI?=
 =?utf-8?B?R0tmamljK0FCNTlaRVR3d3pFNm1TMkczU3QrVnZmSmZlV3VDZ0VFcVlQZnJZ?=
 =?utf-8?B?NVZOMlc0R0pLMWNFSXMvODZoU3hkcFF0NEdaM3NHWEJlZzhEdlF6bFcxdG12?=
 =?utf-8?B?ek1weUg0TUE2TnNESzhndnVqWHZVNU12WDdYUHNYaFlVSXR3WGs5MW1Vb0I1?=
 =?utf-8?B?MmZDMG1udytKcW9NcGp6cDlNcDJiV1NjeEFSR21JSE1NUkxzUTFmZjBQaTVJ?=
 =?utf-8?B?c3RVN3E2SlQ3b3RxQzN0M2t6OXRPRWN6cjl6aFpjeGttTzA4djNnSVNJbTFw?=
 =?utf-8?B?aStXZVYzT3dONWVsTTdSY1gzNzJLVFdFRzVNZTZKSXJHSjNEbnFETmtvTmht?=
 =?utf-8?B?dGdNS2JxNG1XcFNIcDNXRktOc0U5bGtwV2RhVCtHYzlXOHpOdVh0TlVaRTBn?=
 =?utf-8?B?TkhQa3R3c242ejBLelgvZlVHT3VzbCtuS0lJckF3MlVOaGhMZ3NVeG5pMlcz?=
 =?utf-8?B?VmdhclNiSUVMQWxlRngxQ1dkSjdvM2NQQkxKaTFVMS9UdWw0bHdHaU9BQnVh?=
 =?utf-8?B?YVdjc3R6ZW1ON2svYU9XelJoZDRLMXRzdFpXNFpTblVSa1N2eXJuZDQwTDJC?=
 =?utf-8?B?eE04dTVPOE9PRng5MzZrRDVic1grU1BJa2pqSHJwZW9SbmpXTHJrTGlWNmNk?=
 =?utf-8?B?NXk0bTlaTFBBZWVHalk0ZDY2OExobVhIeXRhUWk1OVpBaU5wdzgwWllObjlJ?=
 =?utf-8?B?aUUvcURscHhwWURFakNxVGZHTk5JUU9DS3lscGE4R0F4d09tdkRZMWVkY3Ns?=
 =?utf-8?B?RkxBYlNIRVJtL2tnUFdXNHFnWSttbWhTSEU2ZWVOL2trdURhUU5iTlZNZStC?=
 =?utf-8?B?VGEzeUZ0bituL3phYlVBNUtXWHRJd0JCblQ4MXVyUi85MU8xVXIxRlB6aVUy?=
 =?utf-8?B?TUsrY1NtWHFILzk3L3pjS1hLVUlvaER2ZHdMK2dCS054YjA3M21TSmpwMmFQ?=
 =?utf-8?B?MjNkUndDS2xHbjluaHZ1Nm02d0VwUmgzYTBuS2ljT05wbEFTNVZvZXJZaVA1?=
 =?utf-8?B?SmR0VnJlaStIaWpMQlBBU29BUkFnNDdNbXlPVFZSclpoV1NwcENnZG14bGFn?=
 =?utf-8?B?VElWQkpMMzdGV0FCYy84Q0dxQmJQUmkwandhVm1nSWRqRFBuMFpKRjdXK2Jz?=
 =?utf-8?B?dUdsL0dkQk9XamwwTWpmb2s3KzgyZVp0SFZacmM2Y0pIOXBEQlQrbnEvQWs5?=
 =?utf-8?B?b0FhWkJ2SmFIdGg1NFhEaUdOcys3aTV5VzFrdTdDQVc2d3pvbFo1RGlTVTZZ?=
 =?utf-8?B?UUZncnQ2MTZiciswdkZIM3pndkpKZzVXaGd1L2NqdzRoTUlzbFFHNmE4OWlO?=
 =?utf-8?B?M081Wm1ZdzVDa3cwVWFFQTY0cHY4SHlabk1tUHI0NlFkNml0dUlQc0xRekRo?=
 =?utf-8?Q?FJiAUho1rJYIFDC5jbk9+BEwgZAkPJCwC7AvGlx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1612843-3b87-4973-a638-08d8ed3d3393
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 14:17:18.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnoX/0higQJ2OfFP0cieizxmaO0ztLuP5fXJBY53z2/iQF8Dx4YnvbmmAoZZ7Tg44Lnh4Ay7fVvYJTIjmzvWPTQ6m8u1HQtTg6m780rxRMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2679
Content-Type: multipart/alternative;
 boundary="------------D2DF0C8118D2A21C23276CDC"
Content-Language: en-US

--------------D2DF0C8118D2A21C23276CDC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-19 1:13 p.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.26.4:
>
> - Changed behavior of the default SSLContext when connecting to
>    HTTPS proxy during HTTPS requests. The default SSLContext now
>    sets check_hostname=True.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-urllib3_1.26.3.bb => python3-urllib3_1.26.4.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.3.bb => python3-urllib3_1.26.4.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
> rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
> index 739cf24f5..0a31fb1e2 100644
> --- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
>
> -SRC_URI[sha256sum] = "de3eedaad74a2683334e282005cd8d7f22f4d55fa690a2a1020a416cb0a47e73"
> +SRC_URI[sha256sum] = "e7b021f7241115872f92f43c6508082facffbd1c048e3c6e2bb9c2a157e28937"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------D2DF0C8118D2A21C23276CDC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-19 1:13 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210319171304.28090-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.26.4:

- Changed behavior of the default SSLContext when connecting to
  HTTPS proxy during HTTPS requests. The default SSLContext now
  sets check_hostname=True.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210319171304.28090-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-urllib3_1.26.3.bb =&gt; python3-urllib3_1.26.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.3.bb =&gt; python3-urllib3_1.26.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
index 739cf24f5..0a31fb1e2 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/shazow/urllib3">&quot;https://github.com/shazow/urllib3&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c">&quot;file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c&quot;</a>

-SRC_URI[sha256sum] = &quot;de3eedaad74a2683334e282005cd8d7f22f4d55fa690a2a1020a416cb0a47e73&quot;
+SRC_URI[sha256sum] = &quot;e7b021f7241115872f92f43c6508082facffbd1c048e3c6e2bb9c2a157e28937&quot;

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

--------------D2DF0C8118D2A21C23276CDC--
