Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.65])
 by mx.groups.io with SMTP id smtpd.web12.66440.1597759587836296688
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UcIIrMUd;
 spf=pass (domain: windriver.com, ip: 40.107.223.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DC7d7M0o4SXbOQSNO2Uqplr/JSfZaPX3KCkiWfjncdtiENRYhQE0S1K1deeTESEYS8+5uS55IpwaRgvcmzzgANp1saJTPSQ6tOB3IEvp9Szf9k5MhRrTxqvruLG5ySJU5fL7VBUSr3tgqPYBZD5/jqSfMZO1BQh6Y2rPcW8JtOTT5np+Z7TTkvzfO4pEm0stujnjdVGVgNBkR6xhhrix7i0DJOItvaPFrrb031etFBSt757FZ3UqwGCTuTdt/LvkFRr8vbfiNXgjyB83jpFDkAtX87u09OMRVI4t9i+XLovQ/YlLY2MnbtHfOHXntxdIDm25NeT7CUeLQB7z8vqwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfHOhyclT9uflLrcDQqt2oOZ6+DJvuPuSpE5bvJCDQI=;
 b=oXT/e1cicQVWh2fgq36ACTEA2QZPU2DN4tkv2TIOLy2AVzt5gZneRNx74VDbi66DOyaJy3vYO55Jn9ZJaqK5y3MWHhsEVaxf0ueuLz6AUgp8bt15fotKVLtYn+mVm+3pcwYt2yZS1zGhqNecNJG4eLpjUYgmrxBoHXqVW9ejlTtsrOiMrPyPDopL7GXSGMrEtrcVVrsEHJXkSQVah2HUtLwdzM6T8sqtmqbNg4yew38lConyqRvFu4KV62My7KSdPXS32wj+wZ3IYiwESD1kir7fAIDyO7v5vfpv3iLw8CYoyynzPrWNibC9rsUVKpMjYl8LSC8POuyw8JYG3Cv+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfHOhyclT9uflLrcDQqt2oOZ6+DJvuPuSpE5bvJCDQI=;
 b=UcIIrMUdJk0GCuMeXfi98cvYtFPVthKKPfKQwZca/VHYzAh8f3h5m6YXmFSIYTz6ARJrbMZ1LDphcRGvq4ZNvMEjxw4PlgABwptJFndNxYQrZmWTMi8uNZzoBYVZCjBsINMO525mhiva+vHFZ4EICfmhlN6zhK7QzAM5VCA0CuQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 18 Aug
 2020 14:06:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:06:26 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-bcrypt: Upgrade 3.1.7 -> 3.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
 <20200817112901.28914-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8a5e9f13-b08c-db47-b282-82b3f7e3f54d@windriver.com>
Date: Tue, 18 Aug 2020 10:06:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200817112901.28914-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 18 Aug 2020 14:06:25 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8b7f13b-5d65-4c52-7e62-08d8437fe562
X-MS-TrafficTypeDiagnostic: BYAPR11MB2726:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2726CEAE65C61801DB87BDB69F5C0@BYAPR11MB2726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QfVPH4fauXKi6rFouEAO3Tm3vv+Ayz/yhEe8NLPl0+LgtCWZm7gEw3Il1hyuS8uAeGUQSLPSwoySh3wt6+Bgxa42A7ydVnB6bOHVieNZsuYOvx/dEEWoPezmfcxObVdZu9SyNkkb2SBxV10UX3NxVBxM6sNflq9y7J14M4CNkNtjy4VlK+94gzHresDTDfDQ0oS3Y6NMHkrK1mYxRz8pK5jHeV9OD8Rm3tlAhhPLxSH3qbyX6BEBGkXU7Gn7eUUDvIFQh5PCu4XuaAPw62MGU1/r7FnXSl5bY4St/UVrZAlOdAq3aPQYhyCoWJZAzPwSAIkwJg8cAXoFPcDFSAlTU+DL8pS5W2xuvDnDW6PMBr/d4BdoQh0s/OrEgUPH0ru0mF4xELlbpagY+01LzOZQFxz2RBWdUdeJqFSOx7AJ2ZxR4DfyNaom+QW/efK+/MocTrMx6Fopv/cUiHw2oc2CpA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(346002)(366004)(396003)(376002)(31686004)(2616005)(26005)(6486002)(966005)(86362001)(956004)(186003)(16526019)(166002)(83380400001)(36756003)(66946007)(66476007)(66556008)(5660300002)(31696002)(478600001)(44832011)(16576012)(52116002)(8676002)(53546011)(2906002)(316002)(8936002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Bdd9Q4fBIiIu9Z2AdPzq1DMCaTxeZhBXTHeMBlUn3Cm1BpEChq0+KNvQ2rQQEVjgViSqnkfUDBql+4Yql3eVrZCzllEUX5PD9Yt/fwFVzqcxZMMYmlvODsFyG83+74kbsLQJjeIp3l8p/r559zC0mML8UyBfxk2XQfkwYKiIYGZwOp2arJQHIgNuWLcFjEk9gXE9usPreUs7Dmw7qs4Yu/H+w5ThuUR4vPjWWXFYb2sCS3Bldv+gBf1q9LSTHJbpvytfGD80FlVklgGTD3jaSFQu8f5v7dBj3ILTgJgeicDNj8OA9MctWtZOw48DF3XNadLAIHXZ4jUhJ9ZdFdSsLDuiFSlCUJYTWIAfQdON8w/nhJUuM3XCotVG7n+ApUUhZW0uAEtXT/cXzxDsFeJ63xgVguGj3LBEE1PsQZXP9L/qhjKWv/QMa9dMxGZ3rZ+RbS82Qlwi2t/3m4KDUd8yGG58WfOgCNUG74F8qO4hgxc7LucRibFkK2wVaukxl8IrQvBmOa6K8lyNAc04Y0Q1Oqg2U1rMeLsHKYz+5CxLM7alVZsAen8sobngM1IptP/qxQOSLxIaPlqA/hXUajEkSebIbpB1jZvAYXCB2QqlY7Ew+MuIWLhmNP7taYqPt9HLxWQ2/absj5B17o9EvmkdTg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b7f13b-5d65-4c52-7e62-08d8437fe562
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:06:26.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roaV8+k1mS33KVQSeje1FfQbeddunMwV26swHe6wAvHsqFfBvEV4ZQMGJnYz+CwBNo6kFA3LaVzFZMceNZxFLXp1tW+tZR3Tf3Sjy9xU/CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
Content-Type: multipart/alternative;
 boundary="------------2864EA15887BB203590491B0"
Content-Language: en-US

--------------2864EA15887BB203590491B0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/17/20 7:28 AM, Leon Anavi wrote:
> Upgrade to release 3.2.0:
>
> - Added typehints for library functions
> - Dropped support for Python versions less than 3.6
> - Shipped abi3 Windows wheels (requires pip >= 20)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-bcrypt_3.1.7.bb => python3-bcrypt_3.2.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-bcrypt_3.1.7.bb => python3-bcrypt_3.2.0.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb b/meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
> rename to meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
> index 3b9cd52f2..360f14be1 100644
> --- a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
> @@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
>   
>   DEPENDS += "${PYTHON_PN}-cffi-native"
>   
> -SRC_URI[md5sum] = "5d6f93b575ce52470af37a8e7dce76fe"
> -SRC_URI[sha256sum] = "0b0069c752ec14172c5f78208f1863d7ad6755a6fae6fe76ec2c80d13be41e42"
> +SRC_URI[md5sum] = "fe31390dab603728f756cd3d6830c80a"
> +SRC_URI[sha256sum] = "5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------2864EA15887BB203590491B0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/17/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200817112901.28914-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.2.0:

- Added typehints for library functions
- Dropped support for Python versions less than 3.6
- Shipped abi3 Windows wheels (requires pip &gt;= 20)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200817112901.28914-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-bcrypt_3.1.7.bb =&gt; python3-bcrypt_3.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bcrypt_3.1.7.bb =&gt; python3-bcrypt_3.2.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb b/meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
rename to meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
index 3b9cd52f2..360f14be1 100644
--- a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c">&quot;file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-cffi-native&quot;
 
-SRC_URI[md5sum] = &quot;5d6f93b575ce52470af37a8e7dce76fe&quot;
-SRC_URI[sha256sum] = &quot;0b0069c752ec14172c5f78208f1863d7ad6755a6fae6fe76ec2c80d13be41e42&quot;
+SRC_URI[md5sum] = &quot;fe31390dab603728f756cd3d6830c80a&quot;
+SRC_URI[sha256sum] = &quot;5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2864EA15887BB203590491B0--
