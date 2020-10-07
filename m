Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.83])
 by mx.groups.io with SMTP id smtpd.web12.1546.1602078461857245344
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bqYiau0e;
 spf=pass (domain: windriver.com, ip: 40.107.237.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAbeEgwtV96fyE4AkZ44iormfp3HWMafF4+kE61htwuDgmPktMxM8ixIr291JxNnNmViRm7yBSQvPls5qvWIBVahYdJMptYriBRwfIX6wfLdtaM88CVJkNjVBr8tb9lsMxf9Ag98IGnDBtxSgqAMhFSOTL1sdQhuUeQwOiJwUMNIDH+01IeXYR6JET7Ivctp+v547bQvNKFqCPNsXtupXJ+hrmeBMd40K8hOiH4UDmBopMtkOtwC4wi+aDdiZ4XezpZ0lQxIJ/JjdsnffwWIh1yminqI5MHVm/0iXmY7T1hV51kDIFS0Nk9zWX772sXz992TZDrbzwsIdvD9CVjCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKORM3Smp5FMfPoBw/dQIo1MI9jNOisDG8hmRhkF73c=;
 b=AvqedF0DlSGstlReONJmyR3WFMDPqkNBkxb0rrGNDeET1FJ3Nl2bfIT+n2J2JOBmM1n4BnIZxJFEF6ymwFSG6O/3chgb0K0QakrPNYsKIaihToOMwwrXY6or5uED2zmF7CK5zdINuJ50VB/cgArqyR2Anjm4iwitnqQcrxWsaCJKVdJCcBwippmj8tOPuxiIj4XZzibbCzI2h5w0XVOKbQ15+sq7Jg8olOHcc3F2MsfBhkcrz7G3BK7r1XT+7L9iDOZTb5epkxwyEY2gVKK4KYNSdlQvwAiccyytrYgSacs4rzDDVCwLNHLu+ZIcqkLXRh7CFJdX8TNI88GcylMLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKORM3Smp5FMfPoBw/dQIo1MI9jNOisDG8hmRhkF73c=;
 b=bqYiau0egVBHyVj3/Bs+k91/Ozx99iGN6NUECnoYS0qWu9ndjSwo5yXr4PXB99JlNmrN6NYJIyllf5brEUQMoTc/QVsmDBxNQ5pr6Fp+0r8ALl7WEFlIUuAmos1GoLMI+6ECjVUoLESu6TnuufjG45nC+WiwRS1IjYe5t9GaSwU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2920.namprd11.prod.outlook.com (2603:10b6:a03:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Wed, 7 Oct
 2020 13:47:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 13:47:40 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-nocasedict: Upgrade 1.0.0 -> 1.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201005115507.11563-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <62a0be82-9c2f-b1db-860c-0b00d0ed588c@windriver.com>
Date: Wed, 7 Oct 2020 09:47:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201005115507.11563-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Wed, 7 Oct 2020 13:47:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 010dae1d-67f0-4557-14ee-08d86ac78eed
X-MS-TrafficTypeDiagnostic: BYAPR11MB2920:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB292043E669592B3CB47814669F0A0@BYAPR11MB2920.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fY8/jpmakc8QT1qNgl5PgDQwchHxgL7DIbS6T0mTCD0rfNVGdHCaaCPqkrMeFQ6TT6gRbQBdgSl3pogZSRMGf8pa21YlHsZskyJfwlz0HN23G7+dbYhOT9Tmu+Ucy3Ua/TQQPF7jLtUjnlk/lqn9PhFKey8GK76orltn5W9Os9YeEzU5mcKRZ65cqjyR1ev+TATRoG1SC/F/oIEAPcF52RxBhHy3ITji1I8VLo35Ml+snALRKbWwxmFs7xdRXL0wrarCT9XBy0MQUrLhGAp7KE1If2fxo47Lix2s1ZFTF8lDxzvYVQ1FsEzpRro/34JYXaMoE5wdZ+yzV3hz8W2ap13AjLhAyLhBb1+zAYAAdvBjC80BMyKSF4IzvAMrqDO4aESutknq0BOjYlknNPzTT1Kc1qucia/e3qK0D3+9R11Z1ruTYWzfCp30ZfRSsUZkv3rS6aImzFoUq1ZKn1vkZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(2616005)(26005)(956004)(53546011)(966005)(16526019)(36756003)(186003)(8676002)(16576012)(478600001)(316002)(86362001)(66946007)(31696002)(66476007)(2906002)(5660300002)(8936002)(83080400001)(166002)(83380400001)(44832011)(52116002)(6486002)(33964004)(31686004)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NWRrX3DVmKdqR4oDLqtOi2mc0XDklCl3Hklebry01DFUNdeHxrQhLzz/sYV19b/9eLeFbTOGG17DRu25YTQzi/eK3D3sWbo6h8SGKErz/CE2z1DfB2l5AGHktmNFml+cvUDycZZJ8mr+KB1rqZl6yIx/i4P7i6vs+OH5LY/d/1gY3HDy9C1my2HSxlJVuUsM8D7DO/32V1ELWUxnDK93dzaJHoaFa0Bs8ruZX/ChEFDPdlqbja4OEt9qJ1bEW3oQkUQoLy/QK1sDIAc6CmfwRjcLDoUzF2alDc3nhkh8iSv2GeYEcQ3ddtWXkgievkzV50z59z2um3M5kkC6DHP48jzFxidHEBJvMllRzJ7d+ZGpJwPx+UrfSdz957U/WQSwrCDD9+bcwceygNbubM2IrQtBMg+TvFSXW9cFYMvJFqKDuBx8Bn/cEXrbEnhDgYaKN/fj7o9JWH4gxq6LAIO2mK9VbMx5wFVoIICgFhieTLS/ft2CK/o7GX3CnbGoIdQoaoR4XFw7k8SSpRmd+za2qZB8BUkrHICr6R9Dm0Z4dHeWgmTKPkf8xxseFUms7j57mPzCBtS1msNl1UaUTPwp7KUttzoxOJ2uPMBwM6SjNeVrr05Cgq2xIN4XGOXLrfcL1nrvrTI99N0a1vvLIGmSJw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010dae1d-67f0-4557-14ee-08d86ac78eed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:47:40.4781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bfWEBm6A7YUyE8WWDd94S9zxwdDBtBMrpxsS6r+IEWbPJYO0PFa5W/sr0HKMe1qv+PIVnQwW9yh9NjfufgB/BZxcbEWI3PkjBflSYqbuGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2920
Content-Type: multipart/alternative;
 boundary="------------B0DC3C2C57DDEEA8AC21AB80"
Content-Language: en-US

--------------B0DC3C2C57DDEEA8AC21AB80
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/5/20 7:55 AM, Leon Anavi wrote:
> - Test: Fixed issue with virtualenv raising AttributeError during
>    installtest on Python 3.4.
> - Fixed UserWarning about unpreserved order of input items.
> - Added checking for no expected warning. Adjusted a testcase to
>    accomodate the new check.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-nocasedict_1.0.0.bb => python3-nocasedict_1.0.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-nocasedict_1.0.0.bb => python3-nocasedict_1.0.1.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
> index dae1ebf30d..af5da52f68 100644
> --- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
>   
> -SRC_URI[md5sum] = "14b405bf7ffe9d0f784aa9c3c39e277b"
> -SRC_URI[sha256sum] = "22840b434e40f20da6d2ccf0821baba54589e2476499b65420b6e4c2e669aa04"
> +SRC_URI[md5sum] = "93e7f19f73c7cd56c36cd7535b6b9ab1"
> +SRC_URI[sha256sum] = "6e5d5bd11de33f93d22545d9ed23a0b98f840f2cdac0d749d2faa4617adc7772"
>   
>   inherit pypi setuptools3
>
> 
>

--------------B0DC3C2C57DDEEA8AC21AB80
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/5/20 7:55 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201005115507.11563-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Test: Fixed issue with virtualenv raising AttributeError during
  installtest on Python 3.4.
- Fixed UserWarning about unpreserved order of input items.
- Added checking for no expected warning. Adjusted a testcase to
  accomodate the new check.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201005115507.11563-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-nocasedict_1.0.0.bb =&gt; python3-nocasedict_1.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_1.0.0.bb =&gt; python3-nocasedict_1.0.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
index dae1ebf30d..af5da52f68 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pywbem/nocasedict">&quot;https://github.com/pywbem/nocasedict&quot;</a>
 LICENSE = &quot;LGPLv2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742">&quot;file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742&quot;</a>
 
-SRC_URI[md5sum] = &quot;14b405bf7ffe9d0f784aa9c3c39e277b&quot;
-SRC_URI[sha256sum] = &quot;22840b434e40f20da6d2ccf0821baba54589e2476499b65420b6e4c2e669aa04&quot;
+SRC_URI[md5sum] = &quot;93e7f19f73c7cd56c36cd7535b6b9ab1&quot;
+SRC_URI[sha256sum] = &quot;6e5d5bd11de33f93d22545d9ed23a0b98f840f2cdac0d749d2faa4617adc7772&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B0DC3C2C57DDEEA8AC21AB80--
