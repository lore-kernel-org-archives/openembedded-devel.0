Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.89])
 by mx.groups.io with SMTP id smtpd.web09.1879.1610121684567651743
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bvRJ+1re;
 spf=pass (domain: windriver.com, ip: 40.107.243.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBFzOTkWN73yyM+By5ta/q80vE84MaK5QsQTmu7s36eYKtPAtEHa36m9DV3jX8aAdibSY6hTOluxuRjh8lCUtpmZ6xmPaFHHUBNUI4DZeSKnu67/X6LMFgOgpvKBYjX1SqzecMGHsCcTKvI+VDqZmI5rhuUmWJ0dkVjl2hgGsG8v3o/0FaowgkvTwLeaMZLoGtt7FVD5XWlel8gpMEQ4yxm3sMcFBoHJ0zZcoeqNEcjScSHxU/SezTiDifpsicGjbA0JFIoz00N/kbjTQ+bDBUjrk4S9/d2DBoz6RqGUQtSt3X37sb8CXcDnMffGmgmcbiMyTS5ZLC2lUVk5ZYxuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xBU74OkHvAetnT3Sa01FbFopPgwXdvOoCpMQK+3Jkw=;
 b=lE7AHcXSxdvrOo4uScrhb/Rnse3aRmFRPdP9mTU0u6Z2qcycrceUSjU3xKE/3gKG2NBKJqophXgnwGOXlPdKtEQYYKnmp+XBVIxEZlfGe7RNc3sdO5P9BpkiPAz637v5MaaqcRdTstBK5DdF9OmovuXzayi0Aj6nwZEOOSXMH5aCEawxsDOzQb6NMjfDBAJqh1vz98LEhecCqGJ05H2Sr6SInjjALlYHSUKvCKKMsC8xf7WHXLDN4vbcX+fFNgjnHU2D18L9/SyuAEnX1fdbkxkzxW3+cWNVq7wQjRD8EUPOCu0eKArqq83zYbZMIyTWrI4wh0CrJ1MNsA4zizpxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xBU74OkHvAetnT3Sa01FbFopPgwXdvOoCpMQK+3Jkw=;
 b=bvRJ+1reZzXY+dwtRVTD2d4MUNmS+mIcViSSy3gQbADWDnfRF2xMQv6/pHlrqK1kAfHvC3U6UFY3XXcPs6N+qpn5mZQvvnbQKCsgN0HRbWlHHVKMdCjYsUuoak2VaA0nY/HCGGTJ5+/3gNEq+l2tG0eW+vz3bzpuyONkP7xlrXc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:01:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:01:23 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-nocasedict: Upgrade 1.0.1 -> 1.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210104191916.7071-1-leon.anavi@konsulko.com>
 <20210104191916.7071-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f5ad572a-8bf8-df13-cdda-30dd47a1af50@windriver.com>
Date: Fri, 8 Jan 2021 11:01:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210104191916.7071-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:208:236::10) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0041.namprd05.prod.outlook.com (2603:10b6:208:236::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Fri, 8 Jan 2021 16:01:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 168d1b90-e029-4974-105f-08d8b3eea5af
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48960817CB560E42DDD7B6889FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nxVnjD5JJuxaZ1oDEwewb0c2lOvqtUfRf1AhcUWFWHKeLimJdKPjLLIcRTpsG1v0s233E7FLTA/44Mwsa3z+qZdD1Hqhl4b6Mz8hLQ3Skhrqgfx7qze8zykudfwmJy5kGW/ghowugyfmGsgB4mPMsVUdaO15bPOiBXYr8oGAjc+by7bdNsmWHY+uVRaxlR4vH9fAvmTzJFxWfdwTorwsiDnnV0gor45GMWi6zmS0ncijKKDMwUgp+UaTqxOAYr9AtdS0EiYbIg4/z+3P3xkBPcj9aduRXb3+H/EwnNi6igLZn1dL0MHc8QTnRL7YoOFgJVKqzeUks2i+XOkvtQUTk0e48O1CKahsxqHT90NsvFaG2QVRDSNph1tnbUyq4J+BBz+pwrT1WKS5hyTBSQ3L37m/2Q/VtF+3XZCymOxbsZ2+qL58WgY43pcshhtNLMnOyhLXRpU64RnpY0W25XfzQuvNaZ1LWmBB2xVEvAcSqi8QSfFnVyg5ZfUsCGQSdMcPp2ObwruJxLW1kyLezZLi6wazrsGNwhoP2ffNfTnuEvH26a/OHmAmzxfikwlfZwsX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZXpIUnpzaTJWcEZ4VGgwbDgvZ2UwazRKbHVzdEg0Qk9vemVTNVNFOW9jNXow?=
 =?utf-8?B?VzArYzZSYVM2UDhPTWVYT2x6blZLTUxubW9CZ3hTbkZtTDZLUkM1V1c0eUlt?=
 =?utf-8?B?WnFmQTFkZXNtNzVhUVVBWHp6dW96a0pYRWhlbCtjeGhRZk1Hd0hEcGxsblpT?=
 =?utf-8?B?NXRvUVVsd2pOdkRPTWdlaDZIa2R2Wjk0dy9pNkVZekZHL2ZHV1N3MW4yMndk?=
 =?utf-8?B?bFo0SUxtVFVoK0lwQVJtTTdlN2txSDFOU2dsNzNldXA1MG5XQ1U0SEZtRkx6?=
 =?utf-8?B?ajFUTmNYNDlObGd4SGx1VTNHZldETFdIYnNZbHdmTFFleHpQaDR4UjVoamVN?=
 =?utf-8?B?TW9XSFJjUTlnT2w3ZlBnb2VadHdmcTVJN05tdGM3NWFhUWROTCtLZUlzVWNo?=
 =?utf-8?B?eWZ0WUZORUpFbnduQWk0WE94UlRKY0Z6dTZrVmtPRjVBV3VEU0NlL3lvNVVo?=
 =?utf-8?B?cXZMMmhBTzlvMC9vTmV3L3pqZzBPRkFoczJnUGZmUVlJVkptY01DMWY3Zk1R?=
 =?utf-8?B?UDIxMVJDblN2dmNBMThBelgrKzNpTGhBand1TkFMV0I2MnNjZG90M0tRNUpa?=
 =?utf-8?B?emkwTXRLTWd1SkN3YWQ4aGMzd3IzR0ZFUW5jZ0hJYTFsYURYemZFZllBSm1v?=
 =?utf-8?B?bzNiZXNIdkY5ZnBnS3JHZTg4WktTdm9yWjBkZ2Nxckp4dmExL3R2R1J1TGJQ?=
 =?utf-8?B?OVluWGZvVFo2bHR1bExUUDRzSGhiNXJzUWRYejdrRFVCSXBBdG54OFFnSU9x?=
 =?utf-8?B?b1RkT1ZqTWVHRjBXTndiMXpud0FVaVMvQUdjWlVIaUVGd1V5SVhNU081dFI3?=
 =?utf-8?B?SjhSWm8rUVlqQ25LSTVyUUdHTVk5bXBUL3ZEYlVtNk5sSTFUUnQ5TnFIQW80?=
 =?utf-8?B?VGowTDc3TUtZR056NFRtVTN6bll1T1BVN2lHcjRqNFZhODJnVkwyZm9zVHF4?=
 =?utf-8?B?ZEkrUGxEOUxSVklNaDF1RGVPUURmM1Y3RlpUWFZNdFBNOTVFNzZJeVFZTUZU?=
 =?utf-8?B?R2dZVFZIS2JuRC83RzRwdUlBSXlxUEhVVXV4VHd3OUNIL1Zqb2JzTklJYzBM?=
 =?utf-8?B?emljbXNvOUF2cWhwTXhqcEJsUWZZVngxMVp4SDZmYjlaRy96eFkyMGhSVlhX?=
 =?utf-8?B?bEg0dGI1VE1HSnI0c2xja253YThRVkhQNGpjYUcxMldpSWFwTTd1QmRaaFhw?=
 =?utf-8?B?ZUpFNFpjRVBGUnlFYVNQWkQ3QXFpWG1rU0ZwS1hLQ2JaMUt4YjVFdGlEQXQ4?=
 =?utf-8?B?c2wzcmx2TmZLc3pXODJhTW8zVHg4WjhzVVhnMGFmWk1WeTd6V2kyRy81VUNQ?=
 =?utf-8?Q?ZmA3rBjPoczhw/7+V1675tWQ5Qw7Wow7+6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:01:23.5717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 168d1b90-e029-4974-105f-08d8b3eea5af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: feAGPfm9oNzH01rU/GzghOtEiKfXu003ifa3svuX9FOkkxF+ChiVy/M8WfDeCz5XPpubKzZ6PIh/7Tx9gHqJoDtI4lhoNcCy7ze+VUDBnh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------FD41C5AAC43F5BA959D701B3"
Content-Language: en-US

--------------FD41C5AAC43F5BA959D701B3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-04 2:19 p.m., Leon Anavi wrote:
> - Migrated from Travis and Appveyor to GitHub Actions. This
>    required changes in several areas including dependent packages
>    used for testing and coverage. This did not cause any changes
>    on dependent packages used for the installation of the package.
>
> License-Update: File changed but the licence remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-nocasedict_1.0.1.bb  | 9 ---------
>   .../recipes-devtools/python/python3-nocasedict_1.0.2.bb  | 8 ++++++++
>   2 files changed, 8 insertions(+), 9 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
> deleted file mode 100644
> index af5da52f68..0000000000
> --- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "A case-insensitive ordered dictionary for Python"
> -HOMEPAGE = "https://github.com/pywbem/nocasedict"
> -LICENSE = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
> -
> -SRC_URI[md5sum] = "93e7f19f73c7cd56c36cd7535b6b9ab1"
> -SRC_URI[sha256sum] = "6e5d5bd11de33f93d22545d9ed23a0b98f840f2cdac0d749d2faa4617adc7772"
> -
> -inherit pypi setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
> new file mode 100644
> index 0000000000..952286d37c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "A case-insensitive ordered dictionary for Python"
> +HOMEPAGE = "https://github.com/pywbem/nocasedict"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"
> +
> +SRC_URI[sha256sum] = "86e2dae49e34de7c31b65b486c8f9aa58b66dc2e8ee9b34c390c6c58885c85a0"
> +
> +inherit pypi setuptools3
>
> 
>

--------------FD41C5AAC43F5BA959D701B3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-04 2:19 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210104191916.7071-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Migrated from Travis and Appveyor to GitHub Actions. This
  required changes in several areas including dependent packages
  used for testing and coverage. This did not cause any changes
  on dependent packages used for the installation of the package.

License-Update: File changed but the licence remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210104191916.7071-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-nocasedict_1.0.1.bb  | 9 ---------
 .../recipes-devtools/python/python3-nocasedict_1.0.2.bb  | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
deleted file mode 100644
index af5da52f68..0000000000
--- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = &quot;A case-insensitive ordered dictionary for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pywbem/nocasedict">&quot;https://github.com/pywbem/nocasedict&quot;</a>
-LICENSE = &quot;LGPLv2.1&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742">&quot;file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742&quot;</a>
-
-SRC_URI[md5sum] = &quot;93e7f19f73c7cd56c36cd7535b6b9ab1&quot;
-SRC_URI[sha256sum] = &quot;6e5d5bd11de33f93d22545d9ed23a0b98f840f2cdac0d749d2faa4617adc7772&quot;
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
new file mode 100644
index 0000000000..952286d37c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
@@ -0,0 +1,8 @@
+SUMMARY = &quot;A case-insensitive ordered dictionary for Python&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pywbem/nocasedict">&quot;https://github.com/pywbem/nocasedict&quot;</a>
+LICENSE = &quot;LGPLv2.1&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d">&quot;file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d&quot;</a>
+
+SRC_URI[sha256sum] = &quot;86e2dae49e34de7c31b65b486c8f9aa58b66dc2e8ee9b34c390c6c58885c85a0&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------FD41C5AAC43F5BA959D701B3--
