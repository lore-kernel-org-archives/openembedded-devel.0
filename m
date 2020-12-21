Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.46])
 by mx.groups.io with SMTP id smtpd.web08.2908.1608571041621598611
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 09:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lOvAZlPy;
 spf=pass (domain: windriver.com, ip: 40.107.68.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxvhzVOzjERiqnWf1EylgxS9DXna3B2wweBNAeAG7mKfEBsSopgpFelZ0vU+ziQlrGqvuJ5U1kbe3sQDx9cftKfpZIAnb3RXSs6DG5O7sanR+STQgZw73ItoGD/oR9Ah1zPsbAv19WHW3iBpgX5YN17eqeeIUdtkmVZdAcdECJ2ZvulEn1gSFzKwDXEz1Oy3Q9t+rC7tK3Fe3OF4bAMa+EhYgApaGyKf4hwq8blUT0Dry7Szeat+0xgcBhBzrPCxcSGnrwJKOou2vfXhGf0tFMmvz39O6WApefEY0o11RyZNE19kL11S4ani5ifwvYxTbDHRZob6ykZuZQ7nW9SYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jkf+adbouvgt73JOXV9mdJN7YT2ppAB8t+oNmDRz1DQ=;
 b=Ugvd///hQf11W1N3KdgxYLT5jo1HsbbI3gEL9Yw9iQ6A0CUCv7GnkOQzFXCNCLdM+NGBDXPfaQTIRiiH+tKzorC1jRN6QtftxZ6KU7thauUSz2mjUrDOrth4L6h9dOQHzMLc77li7B94tgvKBpzMCzFcnQuEoulXKXOiLru2ZjBdrH76GPfNyFfX1X3uMwl9ytbihDLE2h93TMzWWt1Re5RftiJfNfcdE+IeCshs1EFW0q/IZBgfEQJAiSo6byCIQjMjCOZjKykFwou2SGOne6tXYAupR45rO2z3D1Wchz85qFPTbrQzy42E+guJe5uYecAve3JcjqlY1C+NsgYF3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jkf+adbouvgt73JOXV9mdJN7YT2ppAB8t+oNmDRz1DQ=;
 b=lOvAZlPyjxWG2j8Uo3fpTRFhztCkilL+/uXJ0I1IDCu6CD9WgiiYHmYsYosFEpPIRfUPjrmvCmKylHjgzx5hSL3heqpMWsMQny0/sl+f31VrzOdnaPg1pzbtFJIvKUwlUxv303qfPxuPZIaHsA2h2saYvWAvtEY2SoYIlNOyAhY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2917.namprd11.prod.outlook.com (2603:10b6:a03:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 17:17:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3654.033; Mon, 21 Dec 2020
 17:17:19 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-stevedore: Upgrade 3.2.2 -> 3.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201218214748.14563-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5bfd8a76-cac3-b4d4-4e4e-865fed00d623@windriver.com>
Date: Mon, 21 Dec 2020 12:17:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201218214748.14563-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:208:134::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:208:134::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 17:17:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c327acef-dc5a-46bf-403b-08d8a5d4460e
X-MS-TrafficTypeDiagnostic: BYAPR11MB2917:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29174FED51D26F39417C287A9FC00@BYAPR11MB2917.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P2NjQtmiQcML87wuRWgw9f35ZQbx5cgv0ffz1j3382sazG8rakkrPj+SjzWGNYVr0i7q8022mUumE64H1K8HSUROTCD8ZJ7f7gEeZGc+RoGMQaf+vgLPxOs9ehkMU+OE3K3qAUn+D90po2F5cfMw23xPUCxMn6M87f0d884SVAyHCJFr/+72t5Vj13p6HH39dW8/fl73LE4NW0SyQgEl89B9NsfB5CYgHZBUKeX+RnEBvFeJldjK0gwDh24zZcp2DPAM1EyMxh7/nWQxdmlE3Y42wPFQPmRdOch/TZtEf+NNblfbqS0dHx63FBwQxlBVnukEETr5L9h6avaq5lX0DjEzFX5GbdgKrF3GGtJ70Z+If9w1aiScQOfs9+nNsPzRfXTP1Tr69ItK0Jlhm6EoecJ0k3k1aRk8TEyFhXQTGpzVNIAuDumxJ3TZFsWcm2j0vzbq5FNu2PEtf6kVM70zHE+9z3TsF7LX6zLArYWXhWFhRdzzjC0ZW6bhan0TWen2L0XLGMwOVU+BZXULbUIAvApjxtbdxtJvmjPaJD3J5iNdT3bB1bev31qE31ar3N47
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(16576012)(478600001)(52116002)(31686004)(966005)(16526019)(316002)(36756003)(4001150100001)(2616005)(66476007)(66946007)(83380400001)(66556008)(8936002)(6486002)(44832011)(166002)(26005)(53546011)(8676002)(2906002)(86362001)(956004)(31696002)(33964004)(186003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?K0M4UGJLTTBURTQ4Q01RcTNuWTJ2cU5ibUhiRVc1T1JwM3FtZ0pTYThBdmJ1?=
 =?utf-8?B?MkhKcDdIZElOY3czV04rWGJtOFdCVDcwUWxLMC9SRjdNWWRwVEo4aTlTNlZn?=
 =?utf-8?B?TGNnY3Q0RzJFY1d4MUt4cHJBemczZ3BGQUxxT25wTENPUms2R3hBYUwzZHQ2?=
 =?utf-8?B?SHVVWXFTSkdvL3BzZVNuVWdEZiszS3JuYytJTGpaWFVjYTJwWWl1UHcvUHlF?=
 =?utf-8?B?QlczZTRqMWczcVc5amdPZWxwb015bm54eUhjTmhQOGd4V0NCQTFIQ3hpOGZi?=
 =?utf-8?B?SlNxcUN3bnZEUWxyR3QwNlhtYmRLUFBoSDNVSmQ4dEg4QWoxQkNOeFVSaTlR?=
 =?utf-8?B?Y0NRcDBWUXkxTm51dUlTVkZNcjdFZGtXelNlWXJMZVhsSi8zdStZdGUxNzV4?=
 =?utf-8?B?czRiSlNaekJ2NGRkdFdPYmV2Q3pGYXZDRE1yZDZHeTl6UzIrTUxnNkVERGsz?=
 =?utf-8?B?VkRUaHJ4Vk9UU2t6M3RreEJkcGtCYUlIOFFYREkrVmRkUDBCL25jYUZUblIw?=
 =?utf-8?B?MHlFOW83Qi9XaFZyM09oUzZXdjZXaUdBbC9TMkEwNVdTdkphdVZ6cmRUWEJB?=
 =?utf-8?B?N25TZ2ljV09rR3VjZll4aWQyUjNtOXBBbVd3NERhQ3VMbTNiYW9OVGZXZ09x?=
 =?utf-8?B?VVkwWGNRVEhWeDAzMHYzNXFUYVVJYlNPaUNQekcvbGl4Y1ozcCs2bkM0U3hy?=
 =?utf-8?B?WGR3ZlVWbktOSnZ6UzBZR1pKUFhDZmVnUEhpcDcwa2lJUm0xMnNDSzAyMFVX?=
 =?utf-8?B?dEl2UmRDcmUzcFdINXFaaVpCSkJJMUY4ZFltRVBSTktoMmpGQStMRmlhOHg3?=
 =?utf-8?B?WXBxeTBSUW9xeUlOSUl2bytCSW0ydlFDei8zeGtwbk9iSnB0UDFGWEgyQ05y?=
 =?utf-8?B?SVo0WWJVa3NNZ21ITUxib2MxeFZtZGlvRmYrSElVYzVHNjdPeGNSTE12NmlU?=
 =?utf-8?B?ZXA1T2RmeTkzM0kybFVWVk1rOThxdGM1UEJWZjd0RWo5YTVxdDhvSWZvU21a?=
 =?utf-8?B?dWpzWTRIaVdMdzdaTFpNenJxcEpQcmVvb3Z4S2JLbkgwZXZla2xHRlNwZTBh?=
 =?utf-8?B?bUZ2UnVEWW1DNU0vVUhhb3ZuVUF4eG5OcUg3RzllSEQvOFlubzU0c3VycFFl?=
 =?utf-8?B?eU1INXFHcFB4S0ZQZlBBZmNNNW9kTE4xTE1GcXdxNUNuZ2xiWXFSVTlJcHd6?=
 =?utf-8?B?S2F6d2Q5WnlGK2g2bXpILzFQWHdPWDJKcllMMkVieWFNYTByR2NTR253MCtU?=
 =?utf-8?B?dFl3WlArWWRZUXgzV1U3RGIzN3JQZ1RLR2VJMk9JNnNYUlBqVFRQZGRVOVNh?=
 =?utf-8?Q?WuyFLXDUqS8QeekIRz0HUUYXZtEomePbd/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 17:17:19.8904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: c327acef-dc5a-46bf-403b-08d8a5d4460e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kS1DdTYBKHMeND7RoEfW+EwaO9itg7Wjkw17DhAkT/CpQEn5Udl6XHLnoZ/ygnSWj5tNGJ0tdaUO9a3NFEZf7Je9sEkpCycLGaSJ5TNazio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2917
Content-Type: multipart/alternative;
 boundary="------------477552D895D582D7A32A34CD"
Content-Language: en-US

--------------477552D895D582D7A32A34CD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-18 4:47 p.m., Leon Anavi wrote:
> - Use py3 as the default runtime for tox
> - Adding pre-commit
> - Fix cache dir flooding when running from /tmp
> - Add Python3 wallaby unit tests
> - Update master for stable/victoria
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-stevedore_3.2.2.bb => python3-stevedore_3.3.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-stevedore_3.2.2.bb => python3-stevedore_3.3.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb
> index 18eae35322..5103717182 100644
> --- a/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI[md5sum] = "c78357a02888490ef27a0d898eb97172"
> -SRC_URI[sha256sum] = "f845868b3a3a77a2489d226568abe7328b5c2d4f6a011cc759dfa99144a521f0"
> +SRC_URI[sha256sum] = "3a5bbd0652bf552748871eaa73a4a8dc2899786bc497a2aa1fcb4dcdb0debeee"
>   
>   DEPENDS += "${PYTHON_PN}-pbr-native"
>   
>
> 
>

--------------477552D895D582D7A32A34CD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-18 4:47 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201218214748.14563-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Use py3 as the default runtime for tox
- Adding pre-commit
- Fix cache dir flooding when running from /tmp
- Add Python3 wallaby unit tests
- Update master for stable/victoria

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201218214748.14563-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-stevedore_3.2.2.bb =&gt; python3-stevedore_3.3.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_3.2.2.bb =&gt; python3-stevedore_3.3.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb
index 18eae35322..5103717182 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://docs.openstack.org/stevedore/latest/">&quot;https://docs.openstack.org/stevedore/latest/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
-SRC_URI[md5sum] = &quot;c78357a02888490ef27a0d898eb97172&quot;
-SRC_URI[sha256sum] = &quot;f845868b3a3a77a2489d226568abe7328b5c2d4f6a011cc759dfa99144a521f0&quot;
+SRC_URI[sha256sum] = &quot;3a5bbd0652bf552748871eaa73a4a8dc2899786bc497a2aa1fcb4dcdb0debeee&quot;
 
 DEPENDS += &quot;${PYTHON_PN}-pbr-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------477552D895D582D7A32A34CD--
