Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.77])
 by mx.groups.io with SMTP id smtpd.web09.19190.1606484998163982188
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 05:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gM7ZKfKm;
 spf=pass (domain: windriver.com, ip: 40.107.237.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdP7PD4BbGfuiKXgY0ZqRXFrsy/N7S1iWcLUooNVLQ6uCk2eZHKo0FK3Fx1kwwY0aDoyMNl71NvTjTFEAvo8e+cDwnBsLMmTFQ4JANfAca4glY7iTZXj6jEfFDyP1yg7eH0EOVu7MiOt50CuwaKm8hp/sQw1pvHQKblKviZtn6C2mYUIx+E6wmKCu0ZWFA7rKHFw2j8R0fx7kn1WHCGpZXZEoDj3Q2axRrvRa6etwizxqq6vdHpq+DRx2YbnSnljr8oQfgq/tCqQjgZEqs4HmDBvRRuojqu996k+o1N1M56PoBcsvLzLh3H/uUlwxiUJXpPSmHql6sKxAcQt6fKtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxiGL/dXxE1GqSIjPRjg5nJm6y1SGRisd0xh7zwqdoM=;
 b=AgyvOVKc2PuJ2VWGQFNGa8DJREeVbuNllcjd3ns/RsE5uZP3LLWhOj/0OKpT+hOL/pYUZMA07dayV1+dwC84R9x18qStNjZjBdU20DvV4XiR4y6tbiGhRGNgDnd2FXlgJXg2r5TjvFIFWS/Oubh4jDhnhY7hjwtWg0I93O9sg8ryLSR/qB4L5UMeN9l3Mzoz5i728sntK4bYSaGK+STJVrrIXC9Wf/IHzeDtx/mkyna3zAUGQw0b2RaKy3jIQ8jqd4edo9p2o6erntNG/SpHrdvGO1Nvvzec6LkP+VGS5JNK7nnnB/JUtsaqxLGEcR/INrXs6cWa01PEgKy4YuQgRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxiGL/dXxE1GqSIjPRjg5nJm6y1SGRisd0xh7zwqdoM=;
 b=gM7ZKfKmgHNsfjU2fnTeZiR6QQTd6pF2PqHLyx3zWWQzDEOKN4LDCsQF5CKQqeD8LOdBWw/xAQuejy0Sdq/99OWsc2MFKSbTc5aKN0Iejb1ayX4/b/K7cndIBl9qd6dYvTnSFp9Jz3vl6FZpAejjRpszw7AoMJLRNT6H7xgWJU8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 13:49:56 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 13:49:56 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-pyrad: Upgrade 2.3 -> 2.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201126180347.13763-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ff1b4c2f-0148-f1e7-d952-1452f5d20404@windriver.com>
Date: Fri, 27 Nov 2020 08:49:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201126180347.13763-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 13:49:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68be6611-2e5c-451a-b351-08d892db5351
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2598130A1B230EF046CFFCC49FF80@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UfI/VN3tYqLUiZLlHCt20lr4yWoNa6uFi44qPYQkDMHIoab+pbNkyL4qbtKzyv11bz8W4Z1had0dt632WFIqN0eft6B8GrgqobSyG7aNXXxNznBCTRWs+pwQ9+CUV6nEj4uYxlbCPSz2jDbJRht3qhW1o5qfPFKQXM9yEbfEWSX2Z9zazaUgmbWx24Tof2QLUfOXTPQ32UEOMa59NWu96lFNJ7zjNUgWMCss+f+J5pq1JgsJ0pXKoq5DLhbbbFZgv7uSV6FI+r1jBvzr3pz+//7+8LHeueV93spz4Gb7qnl78KRiLoY+5hbHcv0sozDO1mpnsrNfvdUMpEaRjJ5G3vRpZAjKo+sYkIbcDfZWwK82UEKNxt7SB0EpXNZWxDUxNdrBAM4IVKlD3njQtkcctC+zLx6bpQAiMiZhjlwCvY/ROZjLIjsIKhwNnTWZA3CSDrKlY3Cmj/yi1+aRAffECg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(366004)(346002)(396003)(186003)(2906002)(26005)(16526019)(52116002)(6486002)(8936002)(83380400001)(53546011)(478600001)(66946007)(33964004)(86362001)(966005)(5660300002)(2616005)(956004)(166002)(8676002)(316002)(31696002)(16576012)(4001150100001)(36756003)(66556008)(66476007)(31686004)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OVF4ZDJOdWcydi9lZ1c0dTB4M25UT0ZjUkJMYlNLUWJYRmI1T2lSNS9PaGVk?=
 =?utf-8?B?RzNWM1pvNUJsQTdNT2pSSjlXaU9uV1VEM3JTTEhNN2YvaUxPMUhjR0RkT3Fk?=
 =?utf-8?B?amRmeEU0VFpwaDRRcjBWWk5KYk1yMVpzSG0vSWxKOVYyVkJJMERmV1JnSnhq?=
 =?utf-8?B?WkF3SkdMd0NKdDZJQkxJQkZMd0RDcTc2QlovNmNRak5ZQ0dMRGhuNzhXZ0Vv?=
 =?utf-8?B?MWQ2eUJLbWN4UVIvOTM4ckZmVVk0WEtBZVcreHhVL2dNNzI2aDQ5SzdmcHNR?=
 =?utf-8?B?MHp6RVl4OHVmYW00dTlpQ3hhTDRPR0xxUndtL1N5dGRpem1KMEE4OUlCeWxz?=
 =?utf-8?B?T3NpMzFoS1pjT3FwREFtMk9WL243L3NkYjlQVnQ4OTRXSmN3VlRTMWtIZ2VD?=
 =?utf-8?B?MjgwMUtSeUVWZkg3aWl4dUNVdnJEQVFBWFc5RVd6YjhRM1B3RERFZHQ1Umx5?=
 =?utf-8?B?MnYzb0RDa3h5ejE0c1kyN3RPbjZjYy9vSFo1dUxqbGdGSStWSHRRZ0wvYjZ1?=
 =?utf-8?B?SjRsUnNTWlpDOVhNWnE0b3drcGF4R3g3RVBtMms4SStjLzZtYlh6Z0w0Vm5k?=
 =?utf-8?B?TWFEb3Fod3YzWVhxVXdZczh6NUVYQmdWU1o3SS9IQnFhNmFMZmFnSk9hTzFm?=
 =?utf-8?B?MGtiSlpIeW1aN1ZuUGhrV1RvTnBsK1VQUUxmVDVRNmdLTmVMQzFtZ0hVNE53?=
 =?utf-8?B?UFZjWENZVmJyNkNleDIzaGhHOGZLbFhtNTVPTUFNakhVb0cwNjhnWnNkN0xZ?=
 =?utf-8?B?bXVoMkFFTjVwa2tXSm1ZK0l2am1tRmdHR3ZGQ1FjeDRWOHBuRDhjbDVBR1pD?=
 =?utf-8?B?M0R5OWJGd3M2MFBDUGhaNVN0bVJYR0xMZm9vS3Z0eml1T0F4c3NBNXp5UkFr?=
 =?utf-8?B?M0NMSDU5bUtpOHphaXoxN3d3ODF3UTRyemE3NmhoU25TOEpyR2dMbjA1eEpX?=
 =?utf-8?B?dWZ0ZzVOVWdtckhib0t5WGorUmhLa3JxSTBNU0hnR3JpZGc1NkZQV0Z6b3B5?=
 =?utf-8?B?UXdjNkJNazlMRldmWDQ1OW1XdkxPNGxTYnRMUnZEUlhGalo3M2ZVSnZjMWd5?=
 =?utf-8?B?clBXSTZtQ0xIdWRGeDV4bFZQamFjMGUwd2IzMGR5VS95eHYxQ2xDQUpZd2N2?=
 =?utf-8?B?MWZWU3VaekFZVDRaaGM1MXVMbG1qYy9BYlFJb0Z2SzNycXpUYWZBTW9Jc3pw?=
 =?utf-8?B?UWZKdUNXdngzUW5tL0ZidFMxbXYyTm83dnRHbzNZN3QyVTFpdkhqdEs2U1NS?=
 =?utf-8?B?Mzd3NTNwY2g5enhNT2FUTURUaGVrb2xjenZmSHRmN3UxMHg0aFlBN3Rqb3pK?=
 =?utf-8?Q?NqqKQAz9MTctgwPn+IrwN7O4oXiKYUhFup?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68be6611-2e5c-451a-b351-08d892db5351
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 13:49:56.7900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkIww1I9la4+0Il2baoJjYNTTbFio9hKJ/WBxf1qvPV1LPuClEwiZxeewSiIdG961y/YDj1oraiUHMok6oP2iHfQ191KlnLkYv1ABHISmUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------4A4948CDB4B50FAFB3B4CED3"
Content-Language: en-US

--------------4A4948CDB4B50FAFB3B4CED3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-26 1:03 p.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.4:
>
> - Support poetry for for building this project
> - Use secrets.SysRandom instead of random.SystemRandom if possible
> - .get on Packets has an optional default parameter (to mimic
>    dict.get())
> - Fix: digestmod is not optional in python3.8 anymore
> - Fix: authenticator was refreshed before the packet was generated
> - Fix bug causing Message-Authenticator verification to fail if
>    multiple instances of an attribute do not appear sequentially in
>    the attributes list
> - Fixed VerifyReply broken when multiple instances of same
>    attribute are not adjacent on reply
> - Fixed Missing send_packet for async Client
> - Fixed python3 support for SaltCrypt (was previously broken)
>
> License-Update: Use file PKG-INFO.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pyrad_2.3.bb | 9 ---------
>   meta-python/recipes-devtools/python/python3-pyrad_2.4.bb | 9 +++++++++
>   2 files changed, 9 insertions(+), 9 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
> deleted file mode 100644
> index 3b38fb3a4b..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "RADIUS tools"
> -SECTION = "devel/python"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=debd8dc49cd9a7d58c7fffc771efed4f"
> -
> -PYPI_PACKAGE = "pyrad"
> -SRC_URI[sha256sum] = "89c4d9b2cab1746c48dc0d93898d278e34a40acedf6f511aeaa748bcd4490295"
> -
> -inherit pypi setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
> new file mode 100644
> index 0000000000..86a95a4aa4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "RADIUS tools"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
> +
> +PYPI_PACKAGE = "pyrad"
> +SRC_URI[sha256sum] = "057de4b7e89d8da57ba782c1bde45c63ebee720ae2c0b0a69beaff15c47e30d9"
> +
> +inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>

--------------4A4948CDB4B50FAFB3B4CED3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-26 1:03 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201126180347.13763-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.4:

- Support poetry for for building this project
- Use secrets.SysRandom instead of random.SystemRandom if possible
- .get on Packets has an optional default parameter (to mimic
  dict.get())
- Fix: digestmod is not optional in python3.8 anymore
- Fix: authenticator was refreshed before the packet was generated
- Fix bug causing Message-Authenticator verification to fail if
  multiple instances of an attribute do not appear sequentially in
  the attributes list
- Fixed VerifyReply broken when multiple instances of same
  attribute are not adjacent on reply
- Fixed Missing send_packet for async Client
- Fixed python3 support for SaltCrypt (was previously broken)

License-Update: Use file PKG-INFO.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201126180347.13763-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb | 9 ---------
 meta-python/recipes-devtools/python/python3-pyrad_2.4.bb | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
deleted file mode 100644
index 3b38fb3a4b..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = &quot;RADIUS tools&quot;
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=debd8dc49cd9a7d58c7fffc771efed4f">&quot;file://LICENSE.txt;md5=debd8dc49cd9a7d58c7fffc771efed4f&quot;</a>
-
-PYPI_PACKAGE = &quot;pyrad&quot;
-SRC_URI[sha256sum] = &quot;89c4d9b2cab1746c48dc0d93898d278e34a40acedf6f511aeaa748bcd4490295&quot;
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
new file mode 100644
index 0000000000..86a95a4aa4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
@@ -0,0 +1,9 @@
+SUMMARY = &quot;RADIUS tools&quot;
+SECTION = &quot;devel/python&quot;
+LICENSE = &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709">&quot;file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709&quot;</a>
+
+PYPI_PACKAGE = &quot;pyrad&quot;
+SRC_URI[sha256sum] = &quot;057de4b7e89d8da57ba782c1bde45c63ebee720ae2c0b0a69beaff15c47e30d9&quot;
+
+inherit pypi setuptools3
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

--------------4A4948CDB4B50FAFB3B4CED3--
