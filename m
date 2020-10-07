Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.54])
 by mx.groups.io with SMTP id smtpd.web11.1498.1602078487718948642
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O+NO7XE9;
 spf=pass (domain: windriver.com, ip: 40.107.93.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=falEqRIyCfbQVoFo9V05dwdGHrlUnxmCw3wwKr/qtTkSadAgCqjC02+dHbX14bibk+EVrhHtqDwct0oGk1YZiDBgJMamM5Rd1oqm2MrTA0tvLCdiCcUo31RNEdZ+TafDga906qEwa0yNlpWYMpBb+rH2Ouqg9yiwKmKFbZ4RdpIhSld9254OogOinzJgRJq0HFaQr3d+Pj74UQEk1kN1nG7Cyroc8Qoipp7BatgHy54ruSCwZM/ACXwS8vovHZEf4wzyCkCquZgbNgJ2Z5xMZg5E/ERaRXaQPgGB2cdE4RPDW7T/WDgjQzh1Zl7E0nRgmciC42ubb2sl5No8K9uSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7++HiG3rw8dUIC7ryhm3IxPjAR3XbC7+zr+GtWwQD4=;
 b=QCg42dhz58N4wjFHIj48xxxgFPHrqlBbotb92SbCyO2FWQ/HLfWUtcIfNUWOdQ0uLY6sy+iL8Mz983kSEPHa9PZW2D7jS/e4BGz0L5GLtI0WxYNqXKrZYcNOthTTe/DF3tLp/tagejJtKnCuTPuH8lxdDQvJKGKtv3hWq9KVk/Z4ncbQMcW5df2iejIw9UVsz1462cvmfsQBiLw22reZxb9+lN++pfL0Cp+cWzY2kL67zQGypS4MFP0OdzNbdjzjaXCZHdRjcQMJx9iak82y5jsoqF8c7hhPupGYhSsKqZrbxMKQRxWoQhyrxaD1PFHLYW6m42DojpP3SLprK8SHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7++HiG3rw8dUIC7ryhm3IxPjAR3XbC7+zr+GtWwQD4=;
 b=O+NO7XE9yIT35F7f5XQEQDRdJCyqqDxA8HyMuOP6KP32BxA5n4A0WPAWFLExEx5+GnyE23MO3MvlGIUOnMcelJniBGpYy/vhja93JBjM2/XgkWBtN/hper+PpIhhZLM880yZlwYCVpajLvS5c8rhg7u0A/GhT/SsG11PTc8R48s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2920.namprd11.prod.outlook.com (2603:10b6:a03:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Wed, 7 Oct
 2020 13:48:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 13:48:06 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] beautifulsoup4: Upgrade 4.9.2 -> 4.9.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201005115507.11563-1-leon.anavi@konsulko.com>
 <20201005115507.11563-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c7f2259c-ed48-3c8e-3c6a-1c7361537924@windriver.com>
Date: Wed, 7 Oct 2020 09:48:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201005115507.11563-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Wed, 7 Oct 2020 13:48:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cde7ff23-977e-47a5-d37f-08d86ac79e26
X-MS-TrafficTypeDiagnostic: BYAPR11MB2920:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB292059486D71C3D805141D6B9F0A0@BYAPR11MB2920.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aw3quPW6njnzAhkcTQBR1ztN78oFlxkXw91BFzUb34472RFLejZGGf168tzcmScrtbWYkURDat/3w+OmNvkrQXlplquVo254TPEdAcMAF0dccK/zHL7XsosRUBxUpOksOH+iyVMqVpz/wRbShlHTLIcUZn/XfKCxjVdJ4sIYkdKc3IAI5NhAcSMEOfOn+Wq4Z5SnatEs6FYIrVE1grpVZ7T61bqLXrmjp371LxFNMwVFGm1e0n5gNYQM/IoGrZnnBNuLzVbuA9wLfemsllStUIodQwRBHGkCFCCumgF5ONLtqsXnhjaZakoIrzFvz40jsuOrHi4t+lrl8HTub2hydEnTTBn+tv24hMl4/UocdKQKudywTZfRUVNP1VvN3bHeWQce4coXwCRiCpzw4MqHK++MXmSZfzoGGc5epl1iE/A0SXTNEwJ5f6aMpD55RgfpA/a7LMOi1swvuxprsrW6jw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(2616005)(26005)(956004)(53546011)(966005)(16526019)(36756003)(186003)(8676002)(16576012)(478600001)(316002)(86362001)(66946007)(31696002)(66476007)(2906002)(5660300002)(8936002)(83080400001)(166002)(83380400001)(44832011)(52116002)(6486002)(33964004)(31686004)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VD6njE1a2vLf6+z59jc6dRDrBq1TL7xewFm9vAp5sA7Ayl65ho6KxL2Mh8Zu4avFAomffJdjgjZFDFHhrg3z0u3zfGZvyNvpZ0BFOWD888LcDgAYRl1CQYZKrTggdZZFG/trquQL4WEjGepybK6CfUuY0gIzGYgP39C4HRzHnjXn03SHKgzamXSeE+cUJXlECGgzdhAAWnSPHa+8HxFuYmCchAVvFabevfQrLXroOxurj2Y6vlw1GqxmOuA2HzO4F2bN0n3BcKMBymBu+wVxCO4Dd2m6ZgGodUpNLR6BDcP77TO3HIcXhn0UpG1UXjxHjjnKyMRpnxZPJt85m+4F1AIhxi8r05ZNkGxos9qwaaJAZOduaGoqiYiVy0NWl3xeMXYR3XSdyNoSBWGv96hmmakSTSq7QGnc3jB32AB8ud2qVPgnkMYi2y8TCnrc61iL9jiPYNnGtp9jGPZEwGGQx9dXtZF/3sCSZmHq/Btgr8gM83cHT3u+XbzSbL8PGpt8dbp/oPqRxgCZKDz4alrkgBAbKbRlwYVOHZtVZErWtRUk7yBn3PB3QsKCpuPalEJkWStY52h3ABryOl9UZbIVEQOVNVcq+9dKiaACriKenQwn4uL0fyann4K5/C9ZX3MqXXAYUeYYeN3MD3q7VnNl8Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde7ff23-977e-47a5-d37f-08d86ac79e26
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:48:06.3332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pj3mdzegm5ArmsXgmlEIjeDdZV3ZSIIRAq3QVEO2Wq+m2G1HZl+8/pTUnklzBTmBb943GHK9+YWCIppzQJcS5R5anPfbu+YW5DII0G18Wv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2920
Content-Type: multipart/alternative;
 boundary="------------9DAA70FAEBA687821204112D"
Content-Language: en-US

--------------9DAA70FAEBA687821204112D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/5/20 7:55 AM, Leon Anavi wrote:
> - Implemented a significant performance optimization to the
>    process of searching the parse tree.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...eautifulsoup4_4.9.2.bb => python3-beautifulsoup4_4.9.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.9.2.bb => python3-beautifulsoup4_4.9.3.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
> rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb
> index fb5fb1a6b8..5e03ad5e9e 100644
> --- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
>   
> -SRC_URI[md5sum] = "5672f9b9bdfb0c6ab3ef074396bf59aa"
> -SRC_URI[sha256sum] = "1edf5e39f3a5bc6e38b235b369128416c7239b34f692acccececb040233032a1"
> +SRC_URI[md5sum] = "57fd468ae3eb055f6871106e8f7813e2"
> +SRC_URI[sha256sum] = "84729e322ad1d5b4d25f805bfa05b902dd96450f43842c4e99067d5e1369eb25"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------9DAA70FAEBA687821204112D
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
    <blockquote type="cite" cite="mid:20201005115507.11563-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Implemented a significant performance optimization to the
  process of searching the parse tree.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201005115507.11563-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...eautifulsoup4_4.9.2.bb =&gt; python3-beautifulsoup4_4.9.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.9.2.bb =&gt; python3-beautifulsoup4_4.9.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb
index fb5fb1a6b8..5e03ad5e9e 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.crummy.com/software/BeautifulSoup/bs4">&quot; https://www.crummy.com/software/BeautifulSoup/bs4&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1">&quot;file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1&quot;</a>
 
-SRC_URI[md5sum] = &quot;5672f9b9bdfb0c6ab3ef074396bf59aa&quot;
-SRC_URI[sha256sum] = &quot;1edf5e39f3a5bc6e38b235b369128416c7239b34f692acccececb040233032a1&quot;
+SRC_URI[md5sum] = &quot;57fd468ae3eb055f6871106e8f7813e2&quot;
+SRC_URI[sha256sum] = &quot;84729e322ad1d5b4d25f805bfa05b902dd96450f43842c4e99067d5e1369eb25&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------9DAA70FAEBA687821204112D--
