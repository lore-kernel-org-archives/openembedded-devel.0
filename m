Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.48])
 by mx.groups.io with SMTP id smtpd.web12.73.1615992748405911705
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 07:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XFiSdWTP;
 spf=pass (domain: windriver.com, ip: 40.107.243.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPmqtmg+6fkcSM8FCJ9Y6QmhCRKDtha2DeuiGCs1VlL7ryYJYoenCDKQJTM3alJKC4gaXzFGS+BsOt2qPnwcEmMpczOAhpnBWWGFhw9MILSSfECCTY9V4Wcwrk2+z7Ti0H0hpmX28s+fXHcIg0dzHyOn7aL3RNJ++f08Dn1Be0aUxaX79xhCuXVr7fQiDKWztnDZucA+logwaFveAG4On7IyUiGaNCk5MOFeM8l7U0fMpluGmwIufn746G4D76FzzLIj+eFoC4KQDn2QRSEPJP/zMnmqVR11fS4P4aD77oBDaj1jSHB0PUHtid1Yaq4ydRsXYKOocFGJ7CxgqhYbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DynJCAu7jzGmsWPHfyYq/vg+KvOsowxln9NmIxRiQpY=;
 b=kRYPID0xOgLXJKZl3nU6Zp0B/k0JNthegFI1U7oWYLMXIky4+ATXdBSCHw1kXWjZtCM1tsqAGpyy6pKUkcDdXWIby3kfu+0qqwcoeYVvM1DeAFA+twnAtBAUHi84nB6f5ctJfS+aC7CuwyByROXIcTG0R4+5udHhuymh1M4G1Kj/VEIHxp5UVxGHFKMoJ9raEAXf0sP5WYEaCQEMvlMgpte5fRIqxj+fZCQkX5lxKrhQP6a0xS5U6aijkTwOvQQEkYF64V7tV/cpoJYSSWhWLX5tVQBhAkVriAaXIRWs+rzHhOzd21yWDUun+tdZ3LGGLeUSInf+HgPi5E6GA2Qv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DynJCAu7jzGmsWPHfyYq/vg+KvOsowxln9NmIxRiQpY=;
 b=XFiSdWTP6pghXy24UAlbM3liCRVkb7MPpuLIPdp4ppPol0r8XTQoqtU+fcgrlyWw1yc/r578jGDAygMLgRHPurrR3mT28aQLijLPGPty6QnhCJXV0Z5s/03yz3SymmcYdSf0A/I+VktsDczVL46Cxl1iolZC53DAHjXHls/dyBA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2840.namprd11.prod.outlook.com (2603:10b6:a02:c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:52:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:52:26 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-jsonpatch: Upgrade 1.31 -> 1.32
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
 <20210315084727.26812-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <607976a2-9012-7468-8a31-325ce0f7a8f0@windriver.com>
Date: Wed, 17 Mar 2021 10:52:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210315084727.26812-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:404:11::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR13CA0066.namprd13.prod.outlook.com (2603:10b6:404:11::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend Transport; Wed, 17 Mar 2021 14:52:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cb19f99-7603-4922-8e17-08d8e95447e3
X-MS-TrafficTypeDiagnostic: BYAPR11MB2840:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2840312E624DDFB9DCD51BCE9F6A9@BYAPR11MB2840.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z7T/vbrCjonwT89Q2ZrVLyB561rvbinbIAMtex5x8wsBWmM+tS+s1gJuGIBQlqopIJ5226eYKsxYX+g/axyBAYH/m44gVMry0yGPILi7RO2cVoVvKRPiz9gtlJwd5s6LuyRu9nuTT5lk8cuN4m6OVLbXGrV/DUizA4jFv/Qg23LUVDc5XMMDq/vrGYMSeaAdi+szafG/+r/TKXqydghI4zP/YnbjXwN+sMCHxBqlj6dL1JMsHsajNm26OvnFsagpP6DjWZSAjpr3f11s0kTt6Il8l2ePxbEG19NYyfGVkXWAsiYtW1DZSGrA8UFJk6qBUD7mcA5kNqSboxmQQP6zE9NRflQKNdQcGfs4fe1WvA/nr8vRFRgLWJruZzYnklmIqhuNP66seAyIVWTymNQEnPkgWXVoHaanLc6w6NTxKpxG3qFo/3F6vKszSRGTQ+k4ZzpYQl6IPGy1X0KNfuIQVgTzI/1gPuruA5jb5beXd1xXEC04NOsXzLIgvyw5gdVU3LHyyeYn5k26Hht0Nh6eOlYI5nXfRh4u2O/WT0CJFM6xDzORnH9kdflbXsb2w6Hppg69qVv0J/vYrSGhjiAGSA4Dy6nXxAEOfDwpwJmsIpVSvP1c21knT5h4a/cMZeRRoPLrWi402b4qLSo5Cq0UbT/kOrmyILYdYyXAfwiZTk5kItOw6cGnYLYc/tPlE7aZKF55bmEDi3cy4Jfn5uhgvZbZfOPyQYaA7gCdTZALWl4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(366004)(16576012)(36756003)(956004)(53546011)(186003)(83380400001)(33964004)(5660300002)(8676002)(31686004)(66946007)(2616005)(478600001)(2906002)(66476007)(44832011)(8936002)(316002)(166002)(26005)(6486002)(16526019)(66556008)(86362001)(31696002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bXlJVlJBZm9CRFJlaUthS1lEem42TWhJRHZnTGNzemVCTHNsbjUxUFFFTXV2?=
 =?utf-8?B?MXZDL2I2K21mZTBSTDlRN3MrdFhTWG1iMEhEOTdCcVRXekF0UmVsUGxyU1B5?=
 =?utf-8?B?NDJtUTlTSmJYdzZObGN2UXNiL3ZtQ0xxQ29BeWRvV211U29WcW1rOTRJTEhv?=
 =?utf-8?B?ZGs0Y25TUXVlcHViN0NIMGVmTnQ2MmdpOVNzcmJlNUR6UGkrdDVBMDdkVDky?=
 =?utf-8?B?OThjeW9SZTlRaVZ2ZzJaakxzd1Znai8wZkwxSEJQQW1KZm1PN04vOUdtN0Yr?=
 =?utf-8?B?RmU5S0RrdnhzdXhudEhjanpBenQ2L0lNU3JHRFJsRldSOEdtczRIV1BvVnpS?=
 =?utf-8?B?dmIwbTBNSUhZUjVsb3l0TXNHdm9aSk5Da05YRURtZE1UT21kbzZCYy8vZ3lO?=
 =?utf-8?B?VUZNTnY5UEJCZmFUVnEvd3NVN2RwOE0ySk95aExBc2VQbjVHUEVJQnZHUHJ5?=
 =?utf-8?B?Mmx5NzJvVGZ4NDlwS0dQSWlscVNSZVpyRmhEOGNjV3o3aStrd2Q1dVZSYVhI?=
 =?utf-8?B?TG80M1dXRE52eHA2VGdZOG5LL3JXSGI1cDNIckdRTTBNZzBIdTFtaU1EN0VY?=
 =?utf-8?B?M0pEVlF4ZGk5UkhkQk5EU1dKNVlMQ2JsTnQxT3A2ajFWZStndnhRUjZ5WVg5?=
 =?utf-8?B?QUhQNDR0Z2R2OG0wUmNxMm54Y2tJbzQ3enMyTXNJRlRqMVl2NHpOSUpPaFBG?=
 =?utf-8?B?MWZDQ1Y4MDluYVJEUEFOMS9DdDA3ajhRaFdFcnIxOGJjTVZNejJwSldDWnRs?=
 =?utf-8?B?TWhzamMzdE9iUG54dHNTb1dGazNYZVRuU05pSW1rY29yT1g4VEkvVk8yVUp3?=
 =?utf-8?B?b25RODlmWUR6RlFkNG03cGJ3U0JFN2VPVStMMHBidlp4VjRvWmEzRjNxOWJL?=
 =?utf-8?B?aDM4c1NaUDJXSnQvQndqNDdBbi84N0dvaHJnTUd4cFd5L3J5c1RCbFBBMGgy?=
 =?utf-8?B?S2lGM29qVmZyRXhYK2Fxb3dkY3pPNUhvZyt0cDhmY3MwLzIybmw2dlJlc3Bq?=
 =?utf-8?B?OFFFUmpQNGZTckxWOHFJRHVlazdET2t4ZEMrNzBEbENnVm1QTXhWOGc0ZzFW?=
 =?utf-8?B?TWU5VEVmZEdXRUlKZ2dyejhUVmJ5Vm54L0d5TTA5SlUxbVVwTy9UV2lpUDla?=
 =?utf-8?B?YmI0SGJpanh4cmFXeEt2bVQxd1JzRjV2Y0cyTlFyTnJFUURER0dpcHovSyta?=
 =?utf-8?B?ZmJjUkFSODljcjc1eElqVkIvU0hGSU9kdG1wZ0hweURweWlXZFY5QlJid2Ja?=
 =?utf-8?B?UVpSZlRPOTZYTUkvL0xlOG95UjFodkovYzhFazF1SUVmNjZ3SG5NVVE1LzJG?=
 =?utf-8?B?ZjNaUW00RWNWKzJSOGk3YnZSZFYya3Vaa2dVSkQwQmZzbmdBMWNwT1FPWWtS?=
 =?utf-8?B?dUJ3QW8zcnI0NDdWSHhLMGlkYVVJYWJlMDZSazBQOXVvaUhUblFEZkl5VHFI?=
 =?utf-8?B?czA0RENaU2JObjRvUjA3Yi8zcWU5RzAyeTc2eS80Lzk2T0xvZkZ6Zms1UFU4?=
 =?utf-8?B?RGs1ZzBaRXpXaHRjbU4yMU1iMW9FRVlFY3gzWjU0LzRMVVNNRG9kK09mZmta?=
 =?utf-8?B?ZmRRbHExcVJMSTlGT1RPRXJQWWFmbFdEQmpsb3pCVlZqLzdVK3JlUE44Ujhs?=
 =?utf-8?B?V0RpT3AzZHRFNlZJcmtBekNHa1FBUXZDUko0Y1VSM0kxZXJ6enloci80MGNE?=
 =?utf-8?B?YUdZVzdOUERZem9nZTVPODllT0R3LzQyU3cwcXplZjQ1ZTJicDhnTlArdVdO?=
 =?utf-8?Q?zFnQQqP7e+uEEfREcHgUbSr0Krn1WUWvFvpX9SU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb19f99-7603-4922-8e17-08d8e95447e3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:52:26.6864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QzP9h6SkI3OBjRycZlrQTkMsZnWXyNqZZez/ClTwxisZogZVL1XO92yxVu5sgFHh5bjEsW/5tn+jjFsupjgoEWmRvNpVTn85KEYF6K64bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2840
Content-Type: multipart/alternative;
 boundary="------------58C769FA632887FC5F44D17C"
Content-Language: en-US

--------------58C769FA632887FC5F44D17C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-15 4:47 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.32:
>
> - take_index causing 'move' of incorrect values due to bad
>    True==1 comparison
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-jsonpatch_1.31.bb => python3-jsonpatch_1.32.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.31.bb => python3-jsonpatch_1.32.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
> rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb
> index aa3dc8360..0c8624036 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
>
>   inherit pypi setuptools3
>
> -SRC_URI[sha256sum] = "ae6f3686fc71b53a278a9fdeb91afdc0e523e2f8f8a82cb2f04af90413a8eacb"
> +SRC_URI[sha256sum] = "b6ddfe6c3db30d81a96aaeceb6baf916094ffa23d7dd5fa2c13e13f8b6e600c2"
>
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-json \
> --
> 2.17.1
>
>
> 
>

--------------58C769FA632887FC5F44D17C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-15 4:47 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210315084727.26812-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.32:

- take_index causing 'move' of incorrect values due to bad
  True==1 comparison

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210315084727.26812-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-jsonpatch_1.31.bb =&gt; python3-jsonpatch_1.32.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.31.bb =&gt; python3-jsonpatch_1.32.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb
index aa3dc8360..0c8624036 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3">&quot;file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3&quot;</a>

 inherit pypi setuptools3

-SRC_URI[sha256sum] = &quot;ae6f3686fc71b53a278a9fdeb91afdc0e523e2f8f8a82cb2f04af90413a8eacb&quot;
+SRC_URI[sha256sum] = &quot;b6ddfe6c3db30d81a96aaeceb6baf916094ffa23d7dd5fa2c13e13f8b6e600c2&quot;

 RDEPENDS_${PN} += &quot; \
     ${PYTHON_PN}-json \
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

--------------58C769FA632887FC5F44D17C--
