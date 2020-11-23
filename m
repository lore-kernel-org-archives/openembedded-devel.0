Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.47])
 by mx.groups.io with SMTP id smtpd.web09.42331.1606165028173223264
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ijfJhNsR;
 spf=pass (domain: windriver.com, ip: 40.107.244.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3p3RjwJGltxVCErMVCRUeXvPTFeDM73teiXvKummKOteEwh8qFkgQsYsfxV7C6rLDXrTKXNkYCS0d35mqXnfc2pZQwUqnc8r5qusjSYjqgzHdrG/+GQ2XnBb320QjHY3U8D7rSSpsN3Y70Z6NcpzpZvSMSgAFE9JRtNeYspEJROfBePq74Pcdf496YKcilNDt2wx+rzbA6ovv7+ACsoM9w9sNIagiRE9GsdbxWj9LDKDAvO4WILEVl3sXjb9QBBXG1VQW7ki2mBm4GNNfVxflX4R1ygdeHxAAigwtZMD5KoS/WNv304BvJefB2Ccurcw8Yf6CpS2jOaunuVxXa1Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czDwFvQoWHtuvCO2+49w9uE0prfyWgvuj8v5vpao2cY=;
 b=ifmVvlz1LeyxhEHK7cJhlrFEhmx1wKKZUGOxkP65eTTPfOqQTNXfUQ5I1kD2ETfgyw+xo+kfhtl6zJIHHNpnAvwux+V6scffOqbZPc6vDZI7mx5Q++baxRzekuF6nDmweMQuPYDyDDZ/CxqqIS8ozbSIKde1vLtuUbz+jK3re+Q0/Xhr2KF6KkNEmbdpL+yf0BF8481JjA7riu9A2AXPglnbDvulHJKupp5bVXt6liLglnMs9WhVb0/G1l35vddEh0rhylBUWEmIMVX/vTSRc5D/BntenBAQwdMoTUdA5HpmGwhjQU4ImF9bDsz9jarTkFCTvqsdrP7urx8zzBdDPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czDwFvQoWHtuvCO2+49w9uE0prfyWgvuj8v5vpao2cY=;
 b=ijfJhNsRVkHdKEl4Vt9+LSQ63aVAV8zzvL3iP69Wr909+jOKq3RkZbwkFmYD652IYgvYUK6CUq0kaqrfngWQ7WKr14cI7/tvWA5G+V9cOw5zB9wjY31+m5jtMPyHqIW+iGiEJ1fT0nIk7JoQNMl8AHnnOnQ5wd5g0xdRVguUgLU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:57:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:57:04 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-croniter: Upgrade 0.3.35 -> 0.3.36
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201118140220.29364-1-leon.anavi@konsulko.com>
 <20201118140220.29364-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c6d0cfd3-c442-8dda-2408-4e54f36a89d1@windriver.com>
Date: Mon, 23 Nov 2020 15:57:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201118140220.29364-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:57:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d67c20e-d91a-486d-1184-08d88ff254c6
X-MS-TrafficTypeDiagnostic: BYAPR11MB2600:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26000A1DE92E78D891C4A1CA9FFC0@BYAPR11MB2600.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s6GRpEGFCSO7CV5bNKhd3R0+an+kIz4yU8s2Md1N7yuolkQfpx1YVhGq2PZcxGwsdkN/vWKdhl576l8AkjyJu+37jcTP4phqzZDSVvj2sQATLXmI11ERphaCBxpNDzaWl96fT6RX8U9z7wWF75Cu3P2MSglJvSP73cSv0M3BdHuWyN8ouenQFGqFN9gv96PAijt7FCevZFGIX1OPuFxWlhi3fColdoxprRPg3WlzeZcfL7W/3skA4KLX0rQWO/ADjC0O6SsvOEZDtyqWf/5+wsYH4PsHD2NOQL37CTkrKz32KL2WBVjpIThLeZFZA9mzaaU4rs9HRlLk8LUPUCOe2EVMB4kZiB3vb0Hu7U8xRKCm4cqWj6QpDkPkZBpcMsx/372FVz8IMgk0vnlOOelAWhQT8UWyy3P/VeRApEpQkvCxCEM9tMuHU2jEzIiLV652TcGGW/g4ilSj3EoudWb1lw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39850400004)(2616005)(53546011)(956004)(16576012)(83380400001)(33964004)(52116002)(8676002)(44832011)(8936002)(16526019)(66476007)(66556008)(66946007)(166002)(316002)(186003)(26005)(478600001)(966005)(36756003)(86362001)(31696002)(4001150100001)(5660300002)(6486002)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lLjLYh5jjuYT/eKNDLQU+eKF+nNS5Dhg7qDnbxQQEZuYpwzvR6AQOatzzJ96ZoaAmrywdOZd/8SQo00/OGZARCEUnFmxWZyXsK/2D5982P2xbso6UBFoVcMwuS1Qbo7PzOUjyMuEN8jckN+DL9KpAUsPChUNNHXTx56oVmGTemnfmmtN7MqgU3+z3GgIxpRmOR6vUKwOIPsofzbwKevypdic1qDCe1hZ9JW1kQgHbBaqjkUaCSkqUBraQY3EAWoRWC5aRwzJQdgSVPVcMq4B0pPE7FydLP0jpx3zitslJ9CWHbX1bHybtLjHZv9u10DzVs40uim0X+QGGwCMTKSfFiS8Zk1JtZ4YSSKzkw17rXvTKzrzWnmpnRCaYc/WZwWZYKrmdExF09eeK7SFYtECl18Bce4McxA6uNjyo4ApJDemfFGwdCh6CMDoT1daEqUyrUmslgpDRn7L9LwWypcBXZBVI4zvY3AEvG1JWCGrvXf7WyuC8zuqVjKNJj8G829AhMKXGqilQwethyTPWzr/Xd7fr9KcwMqcXx/uQY5vfcPk6Ne6runUufqnx6J/8TN4PzJ17GML/tG1OImaze4ye46WwAnD0WfIE2kewMAusJKVw5plKZX3xF4RoAKhrfTNH0GdNB1aLSaJNoFUirprapjWBfenNDVxU5gNoC+JrNGeiA19/LexBFsTVFi9ruHCXH+gsveb7mIKTbJtMyutBe46j6ko5GqKu7mQT/55KI76C6E4FNMbVrHei+6venBwOC2lsz8XKVsuIdttHm9QQ9GdfIVjf58BoS0ccgd7tfdJjFss4EdSJmWlLb8bU0f/Y3JMDFsJpkqhoEu9/SQjvqlvXB5paLGm/bQIDcvPTGyRLSGA35vJUEazhsXsb/X/+A38C8r4APTcI79Ctsz/hQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d67c20e-d91a-486d-1184-08d88ff254c6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:57:04.2787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsIjYm0lG4YjnZMDBwWoLZvNX4/XtMWqMH7h0UW6w7WIUxRVQ17llKXsNQt3L4BOIwhJhvrYXZTriGFIk7WVVV8jWGCBgvj0JW7h8Yo5/m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
Content-Type: multipart/alternative;
 boundary="------------DAE01275D6826BDF0164EBAD"
Content-Language: en-US

--------------DAE01275D6826BDF0164EBAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-18 9:02 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.3.36:
>
> - Updated docs section regarding max_years_between_matches to
>    be more shorter and hopefully more relevant
> - Don't install tests
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-croniter_0.3.35.bb => python3-croniter_0.3.36.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-croniter_0.3.35.bb => python3-croniter_0.3.36.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
> rename to meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
> index 388885c158..b2571491b6 100644
> --- a/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
> +++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
>
>   PYPI_PACKAGE = "croniter"
> -SRC_URI[md5sum] = "8bb1443b90123f96ad64d7fae26df342"
> -SRC_URI[sha256sum] = "b9075573d9d18fdc4c67ad6741c4bfa4b446b1b1d7f03279757244c8a75abedf"
> +SRC_URI[md5sum] = "1be5dd43ca26a66b5f981e41c74fd346"
> +SRC_URI[sha256sum] = "9d3098e50f7edc7480470455d42f09c501fa1bb7e2fc113526ec6e90b068f32c"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------DAE01275D6826BDF0164EBAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-18 9:02 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201118140220.29364-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.3.36:

- Updated docs section regarding max_years_between_matches to
  be more shorter and hopefully more relevant
- Don't install tests

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201118140220.29364-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-croniter_0.3.35.bb =&gt; python3-croniter_0.3.36.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_0.3.35.bb =&gt; python3-croniter_0.3.36.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
rename to meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
index 388885c158..b2571491b6 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2">&quot;file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2&quot;</a>

 PYPI_PACKAGE = &quot;croniter&quot;
-SRC_URI[md5sum] = &quot;8bb1443b90123f96ad64d7fae26df342&quot;
-SRC_URI[sha256sum] = &quot;b9075573d9d18fdc4c67ad6741c4bfa4b446b1b1d7f03279757244c8a75abedf&quot;
+SRC_URI[md5sum] = &quot;1be5dd43ca26a66b5f981e41c74fd346&quot;
+SRC_URI[sha256sum] = &quot;9d3098e50f7edc7480470455d42f09c501fa1bb7e2fc113526ec6e90b068f32c&quot;

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

--------------DAE01275D6826BDF0164EBAD--
