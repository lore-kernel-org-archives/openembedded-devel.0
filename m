Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.87])
 by mx.groups.io with SMTP id smtpd.web10.35754.1615212272324196139
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dY8EMjoG;
 spf=pass (domain: windriver.com, ip: 40.107.237.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZxoyMjt8zVY/y4wTN800fQcaB/ApyUg/NHfFSPlApuXzIVT55n2uRaVFfF7q0Hc6R4FM1xt1KfR30LoABIWRYjQjp0GBOVs2cWvdfJDdbVFgXZ4/DSqQrfKd3d+4RXBTpbAX0C/1iqNjQXJF/psQ36Ojd9gchpCMj6IKpFuPRAFjuyHXahRUTjFQE/j3VT90zHUbMzdiBJFCQaK/Xb8iDbrKMM1h/4fXqKLhgylTBcRqsfYPR5e7UDAz8EB04AYjgmri751IdGJJPugpV5SjeM59/oS/vUtK/7U5hIXd/yuWpOsi2rCJ7heB5n9PhIj+hW7QIRGkg+fmgKsJeJOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3u9A7QGfKTnsvPqO8AeZ48tEQSVXCiNIZUNkgsGUxpE=;
 b=RXt5EtCOllphDrGAMQNZxLmBotH9m5Ohy7lJw0rqrj2p9ycOFzFzXQeJH08Y5TMUUkW36+xsBjrcjyoiqXc9fSZqLDpZhsr8FA2oGdTqxy3Tkdp657edvpGQUMGoUO8rVn1cFvt9Re/EoT1ZYRPUqoDwCBgyT/wZ89tkCF4HjLCHtecFWS5rhKZEiidOES2R+vvYtLqVC/TjbfF5yZ7h7bhtnc5rENkqYAJWdXPhP/EkhGA+UgjFTTGuhhh8AmFEzhEP04FstH7KpCeMP3YaZ5IRtqJWD29qqfPKTqoByWRTmJC25+2lmZvOB3yBif2C+N67//5pBLkqowMi9eymGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3u9A7QGfKTnsvPqO8AeZ48tEQSVXCiNIZUNkgsGUxpE=;
 b=dY8EMjoGwv+ACGZ2YFgAgKTJPpBF4GarIlX8jEgFQ7QrMpswZUd9h5oQ4pXrBj+DbNSte9qptmSMdlQWdWosxccXUmyFlGAEAWF+c8I18lS0MmsCOVp87S0tkCoJQBm7YfzDGbttomv5sTfVwqkLLMzBtViXgANRZXE7k6P3rZ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:04:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:04:29 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-requests: Support idna version 3.1
To: Fabio Berton <fabio.berton@ossystems.com.br>,
 openembedded-devel@lists.openembedded.org
References: <20210304204501.3467547-1-fabio.berton@ossystems.com.br>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e814f509-862a-0440-2de0-50511e2bdf6a@windriver.com>
Date: Mon, 8 Mar 2021 09:04:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210304204501.3467547-1-fabio.berton@ossystems.com.br>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0735.namprd03.prod.outlook.com
 (2603:10b6:408:110::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0735.namprd03.prod.outlook.com (2603:10b6:408:110::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:04:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6851a57-46a2-454e-d8a2-08d8e23b16e9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB32563BFA8AD0E9D02476B45F9F939@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wQJ/LdwzlXCJx87slqMqQPjFJO7J5T/Zdzzh7/fCHKkj3yEALUx51EhXg8px7RaTWGpmcQQqwQiIlHNAQLnZXhDBsBN3WzTGWkjlrJp6PlmATQLhNxO7ZgO/4vTg4MEwZdP78weBesaAVsgCPzdOdp4tOttTNbZFupJPuHibK6VUS1MAlGAWznlZxRC/equp4HPiJeQO/qdTgGOskkd42MmKyvkdME4V3GruxT5TuF88ZcmSew8iIF/EA4kwZAWY2wBDvtN4f2N4NaZSSe0W/8bktHubJoItL9unh2YAQZ2trkA9n1TLpRZHLZUiNIlpmD/V9e7KCqSatNCXv7fPV2nxKOVbcOX5JEZIWGL4SejDaBUoGjs6StBezO/r4q3Zl9V0HUtJuR/QPtbBSfERu2IblkAcb/KMpzUjSUpIttFfI3TTr67QDKh2RnZZyOv/pfBEFHo54RxINJ96rM7jsrsY28zyPZV86jTuzsE0YPZmX66COpDjgacrYjYUX6PcSPvc3PkJkwuBK1BMQmwwG4oiPsHtSb1rQ1kzAY0t1j+JvXzlfMDgO2cW7DKnVSLPf9gYwfwuZDrU2B8iGFM5a/jvheI5Pj8OVBu1xaN/5v5VGOUzR4MEgZue9HT64NwYVBIOsSXn0NOJfoS5Hk1udvLe4FGseqIO51cxbxPNKiRKWH7gT9OfDJErf+5oRr3J
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39850400004)(83380400001)(66946007)(2906002)(66476007)(66556008)(966005)(166002)(6486002)(53546011)(16576012)(31686004)(5660300002)(316002)(16526019)(6666004)(478600001)(186003)(33964004)(36756003)(8936002)(86362001)(8676002)(44832011)(26005)(956004)(2616005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?N1hKMnEwZEZjdmRMSjArZXNjb3U0L1VMWC9YcUg0TUV0WEkweXlLbmJRWVRV?=
 =?utf-8?B?dHpBYlBiK3pmUzhRc0tRcWRGM29hamt3blNzZGg3a2luSnJadnhNc3FuZWFv?=
 =?utf-8?B?aHZDaFFuM1l3dEJTcXdzaTRIZDRheVlOaWVqVEhmaUdOUzgzK1JmUjlYTEg0?=
 =?utf-8?B?aW0zNngxWW9acFlCL1JYOGF4SGlIQityNlNaV0hkMmZIRkVvTkM3dHVmc3cx?=
 =?utf-8?B?VW0vbm5BUE1PZitBYmZ2K2FZSzdvd3orY1pHUWJWUlZxeE1mZmp1dkVneFZF?=
 =?utf-8?B?RFlxb2ZFT081OU9xMjZMYzE3cWJNWlJIcEJUeWRGQ2ZUV0QwOG5Cbk9pNW5x?=
 =?utf-8?B?amRYWDhDdlJoYWplcnJVcks4OFBDemxwN2dNVDQrMENrZFJxYXl6UWwxYzV1?=
 =?utf-8?B?dkg4NU9IUU80ZWpXTDNIRE1lRmFZZjJZREtUTFBPcHZWcWkvNGhycjN2Y0NQ?=
 =?utf-8?B?WWVtSXlKUmtoVG1HNEt2Q2d5RHNKbHZ1TEN5RWdlSXRDMG5vdjVaTXN5R2hj?=
 =?utf-8?B?QzVOWW9ZaHY5TUYzdEdhSTdMUkQyQ0x0V0ZyNnZUVXVQYlhZV0djUUNLVk85?=
 =?utf-8?B?RlpIKzBDMU5aL3BVc24xRXBGQnNlcElBaGRJVFRRZHJONjhoUkhwYnFBNEZ3?=
 =?utf-8?B?M3lSdFRQUlRhZFZ6VWp5bzNkNVZZTXdKMVFRK2pUZ3RPOVRTT1RISFhxdlFW?=
 =?utf-8?B?b3FzSGJqZHpaTnRHY2VnOWxlcVFSOTNOcDFIQ01iMlFEaHFNS3BmeEZCa3RK?=
 =?utf-8?B?dnNleGExTFYydVJzV3VOcldiUXRHOVk4c0FlU2xkQit2VE83YXNHYkh5QmVM?=
 =?utf-8?B?T3FXMGNZcG1XaTlNNDBpN2E0Y3Rqekp6b2FienlxSzFuWVJocW1IRC92VnUv?=
 =?utf-8?B?UnJtR0wzd0RiSlJreTRibm9IV3ZmeUxFYStRTElWdnpwZCs4OGJ4VDhHYkxQ?=
 =?utf-8?B?bVBQMzZ5SXdNc0pRNFpqNUpoTGFJQkpMNkJmVkxnQzEvdTZsMWVldmF3OU5C?=
 =?utf-8?B?eDJEVGJxM2JEeFJZamYzMC8rZ1E4L2dtbzZuNCt3TEI4ZnU1TXF3NFdFT3Uy?=
 =?utf-8?B?T1lRUjVsN2R1bnA5ZzBqdVIzdHZkcXlTdkJMZjc3R1NLRFk5Z0cvK1RBVHov?=
 =?utf-8?B?K25RY1VhTWFUZS9nK3Y2ZDIzZkwwb1hkM1VPR1pkZHh4Qi9yWGJicGIvSmhr?=
 =?utf-8?B?cWMrc28rcW5tdTY4M1l5Vnp1VWZjY2VxYmFTc3NXdG0wU043WHdjTGNXcmQv?=
 =?utf-8?B?QkJ0ODg5Y0xJRkRmcmw0MEs0MmZ4azhQZElaci9udmFIQmJDbW9SVDAzSHJt?=
 =?utf-8?B?WU9oWGEyQm1CbEc0THJNY3hnU3dqT3E2aktUTGZUbERhNWRlbnBudEoyRWFs?=
 =?utf-8?B?eVJpV09Tclp3YUR6ZjFGUDNSdjExUFZhaVBSQXFJeWJRK09xcWpYS0I4UmF5?=
 =?utf-8?B?cFphUmx3clhuWlBwbHNKbVE4aStmSDM2WlQzS2NDLytGMS85Rkl0L3JyeENP?=
 =?utf-8?B?eWtjMFhNdi9FL1pmRG4wL21mVDBJOHQrelhxWjNRaHNLUGxGZzlBZjdVQW9J?=
 =?utf-8?B?MDhndmJDRWIyYjdQNC9sTnczWW5COVdnSVBBYjM2N1RjcGRCZys2a1hFdFFD?=
 =?utf-8?B?YjBtWnNUdDcwNm1uQTA1NDhRN1pkUW13UlRsR0Qyb1g1aTJ2S0l1Z1NyN0Y3?=
 =?utf-8?B?dXpBYUxLZ01GcW1hUzdYMW1mUDV2aTloemRuY1drbXdoaFBCbVNHOG8wKzBJ?=
 =?utf-8?Q?h7iRPTjMzwU0RUuUXRJHDz3Zn4bfz8+MirNlzKf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6851a57-46a2-454e-d8a2-08d8e23b16e9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:04:29.2354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSO9eOrqBQaOziPX8w9AkI3zhWCRyLCD0ylWaEDHitLX2dcqFoezbaNCLHXA0hGs9o2ek9+13/YbWCLrxd4xdQLmInw4G2P7IjUt3rQbaAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
Content-Type: multipart/alternative;
 boundary="------------F93D2E95E285CA1216082681"
Content-Language: en-US

--------------F93D2E95E285CA1216082681
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-04 3:45 p.m., Fabio Berton wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Change idna required version to use python3-idna recipe that currently
> is on version 3.1.
>
> Without this change python-request doesn't work as the idna version
> doesn't match the required versions. When bump python-request recipe,
> verify if the upstream project bumped the idna version and drop this
> patch.
>
> As this recipe was tested with python3-idna_3.1 don't allow higher
> versions.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../setup.py-Support-idna-version-3.1.patch   | 40 +++++++++++++++++++
>   .../python/python3-requests_2.25.1.bb         |  2 +
>   2 files changed, 42 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch b/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch
> new file mode 100644
> index 000000000..26332249d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch
> @@ -0,0 +1,40 @@
> +From fc45beed40a86c8fc38fc430765c1c5d2c9961c2 Mon Sep 17 00:00:00 2001
> +From: Fabio Berton <fabio.berton@ossystems.com.br>
> +Date: Thu, 4 Mar 2021 09:26:48 -0300
> +Subject: [PATCH] setup.py: Support idna version 3.1
> +Organization: O.S. Systems Software LTDA.
> +
> +Change idna required version to use python3-idna recipe that currently
> +is on version 3.1.
> +
> +Without this change python-request doesn't work as the idna version
> +doesn't match the required versions. When bump python-request recipe,
> +verify if the upstream project bumped the idna version and drop this
> +patch.
> +
> +As this recipe was tested with python3-idna_3.1 don't allow higher
> +versions.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 7ba4b2a2..9d3b973e 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -43,7 +43,7 @@ packages = ['requests']
> +
> + requires = [
> +     'chardet>=3.0.2,<5',
> +-    'idna>=2.5,<3',
> ++    'idna>=2.5,<3.2',
> +     'urllib3>=1.21.1,<1.27',
> +     'certifi>=2017.4.17'
> +
> +--
> +2.30.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
> index 6af836543..cea8fd517 100644
> --- a/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
> @@ -3,6 +3,8 @@ HOMEPAGE = "http://python-requests.org"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
>
> +SRC_URI += "file://setup.py-Support-idna-version-3.1.patch"
> +
>   SRC_URI[sha256sum] = "27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804"
>
>   inherit pypi setuptools3
> --
> 2.29.2
>
>
> 
>

--------------F93D2E95E285CA1216082681
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-04 3:45 p.m., Fabio Berton
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210304204501.3467547-1-fabio.berton@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Change idna required version to use python3-idna recipe that currently
is on version 3.1.

Without this change python-request doesn't work as the idna version
doesn't match the required versions. When bump python-request recipe,
verify if the upstream project bumped the idna version and drop this
patch.

As this recipe was tested with python3-idna_3.1 don't allow higher
versions.

Signed-off-by: Fabio Berton <a class="moz-txt-link-rfc2396E" href="mailto:fabio.berton@ossystems.com.br">&lt;fabio.berton@ossystems.com.br&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210304204501.3467547-1-fabio.berton@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">
---
 .../setup.py-Support-idna-version-3.1.patch   | 40 +++++++++++++++++++
 .../python/python3-requests_2.25.1.bb         |  2 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch

diff --git a/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch b/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch
new file mode 100644
index 000000000..26332249d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch
@@ -0,0 +1,40 @@
+From fc45beed40a86c8fc38fc430765c1c5d2c9961c2 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <a class="moz-txt-link-rfc2396E" href="mailto:fabio.berton@ossystems.com.br">&lt;fabio.berton@ossystems.com.br&gt;</a>
+Date: Thu, 4 Mar 2021 09:26:48 -0300
+Subject: [PATCH] setup.py: Support idna version 3.1
+Organization: O.S. Systems Software LTDA.
+
+Change idna required version to use python3-idna recipe that currently
+is on version 3.1.
+
+Without this change python-request doesn't work as the idna version
+doesn't match the required versions. When bump python-request recipe,
+verify if the upstream project bumped the idna version and drop this
+patch.
+
+As this recipe was tested with python3-idna_3.1 don't allow higher
+versions.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Fabio Berton <a class="moz-txt-link-rfc2396E" href="mailto:fabio.berton@ossystems.com.br">&lt;fabio.berton@ossystems.com.br&gt;</a>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 7ba4b2a2..9d3b973e 100755
+--- a/setup.py
++++ b/setup.py
+@@ -43,7 +43,7 @@ packages = ['requests']
+
+ requires = [
+     'chardet&gt;=3.0.2,&lt;5',
+-    'idna&gt;=2.5,&lt;3',
++    'idna&gt;=2.5,&lt;3.2',
+     'urllib3&gt;=1.21.1,&lt;1.27',
+     'certifi&gt;=2017.4.17'
+
+--
+2.30.1
+
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
index 6af836543..cea8fd517 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
@@ -3,6 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://python-requests.org">&quot;http://python-requests.org&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658">&quot;file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658&quot;</a>

+SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://setup.py-Support-idna-version-3.1.patch">&quot;file://setup.py-Support-idna-version-3.1.patch&quot;</a>
+
 SRC_URI[sha256sum] = &quot;27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804&quot;

 inherit pypi setuptools3
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F93D2E95E285CA1216082681--
