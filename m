Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.72])
 by mx.groups.io with SMTP id smtpd.web12.26072.1600976714131674256
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HOz3spd8;
 spf=pass (domain: windriver.com, ip: 40.107.220.72, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2KrmBlsO7VuxGxkOn4owS/SxSP8tpzlnF5NoFEkHf+mRI8IsrNwK54TsoozbtIyZgBGMSG5oqkRk/76WY+8V2c9UnvTNtF4iDJQV4U9pbmIaKRZu9aeZAsxzEM57gvJ0XXqeRnLAtlBOQPG1Gj2gJ3hGwddB0LPapCMmDaQbjs8bhabdgDUkh5WVDYErs0LmbR0YduvFzo54IaAlEF89iu0wyl3hlSrJiPHDcRGuCxWZG0ftkB4B9qJ1917cNDYWb5bOzNvTQLmJ/+7QzHCfB1JvLEawWFRwoOrEZ6tPP/8UtPMtplsTTByiFhmiRSCNg0o5gdBhCw3WkQSmnkHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NueY9zBEvF60YHSyk/KqBJEwF+TQUpWhTuVu2Aej1Kk=;
 b=GYjnWn1warKyCHXFQkqu14wBbUoPdZx0tjAF3PkKif4i6U1BaBTqQ5WshyW4/0HcixZW2rTPRvS7+c7oUzIoNL5D9Fmj8CTconOckXnTceKA4M5EWFMrYc8L3HqZuC6hq73fUi6q+wEVzvixQBLIuvZnuckM1YFNZg6ARkYJrYIt0asrTK6TWVYIWzlYcud04qYCnnaqGDAatVrmTCycmBJFGKv11gzc5+1Ml3i/1ZzN4gzlWqO009MHQzJlu7F3vZrMB9s3THFWXadlI4D8AFYZXEVch4lJh4wtgrh9o/Ky2MVc6u/tuMSdrMQHhlDKx5j9xlCbXAJI5jkr9Ftpag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NueY9zBEvF60YHSyk/KqBJEwF+TQUpWhTuVu2Aej1Kk=;
 b=HOz3spd8wJHmE8Mv80SDumBo9uTKmGFpz7TAnktKW3Y3cWq38W9+EI+EifRh+beDKoMi1Sq1vzXWWN0IBVomSpJVIuN9cEJP3C9DhCh7gdzMffz+Et/EOxdAKFq25v31rluOzkThywNAUoGyewDrL1nxs7ApMjfxkxnau0JRivE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Thu, 24 Sep
 2020 19:45:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 19:45:12 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-paho-mqtt: Upgrade 1.5.0 -> 1.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3cf248fa-3a57-8f80-e5a2-d8848a5bd0c4@windriver.com>
Date: Thu, 24 Sep 2020 15:45:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923075830.30859-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 19:45:12 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 132b3573-9842-4728-98d8-08d860c25a1c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB35590886D574286E2996FCA49F390@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2b5cGFVcbJOs5bcBOWvBKzsU9UIfiIN4mOJpMwj7ADAJ8Pyoy8VhS6FdMGpuFyziLnS3cD1X1Hr6A7lDlxoFndOieL97KRCrLYJtbQkWN0wwSjPYQT7EkaxJN232n8dAaUKSCsbIFszWoFNQ0cjsy10vmF2qbEm01d5I2NKa5OMPsloUnQka9wuJJED3QOmYF7u3v/mpmCH6L7L1E62G+9rFRfWq8lNku4Yg9AwAsmz3bpjGpfY/AeUvSiUucNTMt3EsBaEKLwDY5xKHKlTRE4QPFLLJ1JJSawOEAu7SEn2grUdI0XpgNb3ui6c3RyLAMHcRB0uGCANUEzu7BpXSpRtiQgODrMo4eAjnFJC/ef6c7IgqKvq5S9/I36M4yCdjEkyirBz1J/KDbp3cddrQzQ5FwFBlemEuA/KNXCGcZTrwUGfnC2q01YWSTjPJJnvXHKVy/7MVHhhXHpvNUi3leJ0bMcx4NvgSthsZsMT12Jg1h69+5RVPIRgsTXzc5L/h
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(66476007)(26005)(83380400001)(966005)(52116002)(53546011)(36756003)(8676002)(166002)(33964004)(44832011)(86362001)(316002)(2906002)(66556008)(8936002)(31696002)(31686004)(66946007)(956004)(6486002)(5660300002)(186003)(478600001)(16576012)(2616005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YOyHObm4E+W1zXf8i3Fvx2O0atNwefjwh7C2CrmOC1Rei8VP6sP/6T1vR9YKYsyTD0N9eiCcMYXlVbm6JAXkaaxXreYGRJYJ1qF3UdgdSORGKXd8gE1N4uwHV0b0liI+WCkpHcyWJxRtBcQPFWDyji6JR6am1FOKae2RIikI5mAqrXs/45NkxbP41GeoE1vgoP3dAA1fXnSJqhkrK0UZzN7weWLaWw5biQolQhjgho4m7/F5iV4FBKj+lzIAJZ3/VReRqUCF4muPiFyvSJO2aU32MLdyn0dAaoZFwKhOwncC0ZS8umYtSPVXib6hEa+DEbBIZcyY2uipRWJc8wwVBK4uck7TY5B1JWtgs4MvncDP+Bc+DnsvqQErFX3Fa59ENlAV0FlgGBCAEN7JRQoDnI9H+MhrqEGjipoU8BxZdSK41zozdNN/8oRwtKtzmT3tFh2RoYoti00RmpPHGS9cUe3UvgOltqTGAXoRDlYt9cxVHvPZFuFKmK7XpHM4TVmDhL/laWyIbaprZcr1XGaDI+f/pmeMh9SwAUVxB77tT0f880etT6HyuK1CahszY2CEqCZ1AGtttqwbc4h45qwfjCXfiQXhoNbl/JgNKB4RpiSlf5uWMwaVFkl3joMnezODO0d16jAy+1bjkikIp+HtiQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132b3573-9842-4728-98d8-08d860c25a1c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 19:45:12.7419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPMfZ3ugdZBPUalfigI8SwD5kpndyhSlAf7156etY5GyWXpE0brAfBFVZclvtH79JUC2r0w4zfVSA1h9BjcPcrx65ds6eipxnn1ks7JZDlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: multipart/alternative;
 boundary="------------FACF5E2B0D852AEB96CCAF51"
Content-Language: en-US

--------------FACF5E2B0D852AEB96CCAF51
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/23/20 3:58 AM, Leon Anavi wrote:
> Upgrade to release 1.5.1:
>
> - Exceptions that occur in callbacks are no longer suppressed by
>    default. They can optionally be suppressed by setting
>    `client.suppress_exceptions = True`.
> - Fix PUBREL remaining length of > 2 not being accepted for MQTT
>    v5 message flows.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-paho-mqtt_1.5.0.bb => python3-paho-mqtt_1.5.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.5.0.bb => python3-paho-mqtt_1.5.1.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
> index 8bf80e601a..d93bc884ee 100644
> --- a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
> @@ -8,8 +8,8 @@ SRCNAME = "paho-mqtt"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "45e80d9b8066a8d0ba1ecfffe271bd3d"
> -SRC_URI[sha256sum] = "e3d286198baaea195c8b3bc221941d25a3ab0e1507fc1779bdb7473806394be4"
> +SRC_URI[md5sum] = "32f93c0ed92c7439f7a715ed258fd35d"
> +SRC_URI[sha256sum] = "9feb068e822be7b3a116324e01fb6028eb1d66412bf98595ae72698965cb1cae"
>   
>   DEPENDS += "${PYTHON_PN}-pytest-runner-native"
>   
>
> 
>

--------------FACF5E2B0D852AEB96CCAF51
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/23/20 3:58 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200923075830.30859-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.5.1:

- Exceptions that occur in callbacks are no longer suppressed by
  default. They can optionally be suppressed by setting
  `client.suppress_exceptions = True`.
- Fix PUBREL remaining length of &gt; 2 not being accepted for MQTT
  v5 message flows.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200923075830.30859-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-paho-mqtt_1.5.0.bb =&gt; python3-paho-mqtt_1.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.5.0.bb =&gt; python3-paho-mqtt_1.5.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
index 8bf80e601a..d93bc884ee 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
@@ -8,8 +8,8 @@ SRCNAME = &quot;paho-mqtt&quot;
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;45e80d9b8066a8d0ba1ecfffe271bd3d&quot;
-SRC_URI[sha256sum] = &quot;e3d286198baaea195c8b3bc221941d25a3ab0e1507fc1779bdb7473806394be4&quot;
+SRC_URI[md5sum] = &quot;32f93c0ed92c7439f7a715ed258fd35d&quot;
+SRC_URI[sha256sum] = &quot;9feb068e822be7b3a116324e01fb6028eb1d66412bf98595ae72698965cb1cae&quot;
 
 DEPENDS += &quot;${PYTHON_PN}-pytest-runner-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------FACF5E2B0D852AEB96CCAF51--
