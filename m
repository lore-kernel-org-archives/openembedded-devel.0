Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.58])
 by mx.groups.io with SMTP id smtpd.web09.24352.1611839362289723481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CpwkW4g9;
 spf=pass (domain: windriver.com, ip: 40.107.223.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cujFfl5+cpUbe9aqvJrQBwxRQdJEl4+/51zjZdpcEZBJw8JHuiSq0vBVfA00dyB7s0RuU6SQPFKE1cd/rgb/o9hznivbjY5l+mRoVXlSD0kekS+iT8LOTbuRj/gVV5qa88Q5gKVOpjx4sTv7/TOAn7opA7QuDJEQdY81L9zeQNobxjNAsywB3p+xHKwTtN/fMlaTUwmv4M1OoTQD0KAaU/Yr09VStno1HtMW7fvLDzgaLeRcO79Eg+68avoTsHoQpG6hgYVa97T4+2YigWYN0ca+ppJhAGy5XwlOF0LyBMIA5V4GzkGpnkiExvB/qKdMw/H/kAMQp1wzHCYJ3xmoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBY/amJwb3X81AglP1F1zA5x/oPq8zpIY2ZUal91UbQ=;
 b=Q3BuQ1Ah6OjN3FwRy5MMAnxNCo7YfTGG8mK07nMz7VxyIbtxoON44/1FLib79uS9dj+BHMc36iDDeksRj1bSfa1Q9vfeb16Uk1+X5Z0VfuEo9f3oOW3jP6mYHNn4/grXHCCjYun8TXXnUytYhtCEYZtHZ3UkLmGunxsNDvCbc5LWLbAdzBhfUmqHXTxZronczwOMgPA5iqJpopebf6o2Zxs1nL9LNkU9rCY4k8e1PVzaaTiPJdbADQ/Q4gWH6o1Bo9BlWJ9t24pop102qlbfd4cO8vcZhi8KQO6kMC5AtWJY8o5ZfTEMcmQsZd6wikhQvJP+Nah62W0gO48rEp3C7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBY/amJwb3X81AglP1F1zA5x/oPq8zpIY2ZUal91UbQ=;
 b=CpwkW4g94zDOJfThUEb0bslhBx1VYBo6T3d2jrniTwN67wZzwnOKLpWRYzzKJc2wLsyntTjgCnhpAQ7oE9DcsBOo5DSfjRQiFsUOvCeynDSuSsUE+JIgJoT/Ber+UKkV3WwH6kd7F8MuJnIvKVkIx7Ksv6q3BPB8NanlHNMRPMI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:09:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:09:21 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-portion: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210127155538.12229-1-leon.anavi@konsulko.com>
 <20210127155538.12229-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6553ab50-ad58-f14d-895c-25cf0c925dc1@windriver.com>
Date: Thu, 28 Jan 2021 08:09:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210127155538.12229-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0092.namprd13.prod.outlook.com (2603:10b6:208:2b9::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Thu, 28 Jan 2021 13:09:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a18cb71-ab45-49fd-225d-08d8c38ded3c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB295101C98223B331C15EB8709FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kmFpGBOyIHFUnSwubRnFKAHBroxrOzDTh1J7nNPRxnXh2qrlFJnCQ7+csy4AE+RAJ8q8e3b/QpX1YSzjeZVRP29wedEmgfWsk/9ezYRd3fNIy3qwZDknHYTOjz5Mnf/DO9BlJRdOi2PE+hZ9qVnviWM1ojDWLbDL3vYXC6oFV+4xpP50E3vptiaofQLOSBjCTnaAMSzW5d5NW4OBbBHFVEhE9meuuRe4OjRTb1Wd0yg1qPjbEjaCTXtSdDnJS6DKaPHtiDjIP+QsDEvo/2Mb/QPQjeKTsqCX/liXYDxRqYoG9Kcm5iqg8z077pplojSLSteyqVXq++c2RsDpApiHc38vGENb0mvLZRJLDE9MDeIcmSPdgTVsvljLLF8xg2/1HA2l1wQYB1FfgUlKSAAtxKM8QMI0shgJTi46SGpKepamqkuvGcAWmLY6zvcxHr+BPaKZ2xAMNTeu3kZwMTeSlcZQdJ6bm61kNB6RigeRIXFjRgsWflTSO61Uf+rxfkh8JqKIPSI+8ZpbN6JqNL/Ykgbg4oDNC0mWRsA4XUWJz9ieOzj8kyn1cLKnl1jWaPNwasGhtDhTrj7NIRpz/6UeCjoYrwOnQbfuGzsOECu+A/zc80Mu999gRd8PxzU1vMbiPVYzxh00upz/xPYTBbXgYyUPWE7eS5cpEoVRxeAU24yq5pAoCSCvexB0NZVrJ9AC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cU5JU2QvNjdKbFRDZ05aenYvVkRkN0lYdk1RSTlyVWJoR2N6ZUtMYXlDd0lP?=
 =?utf-8?B?WVdVaVl2bVNod1FRNnAwYnNLM3NMWmJmbWFTMTNvQlNMSFVOeTQySW5xTUgv?=
 =?utf-8?B?Z1VzcEx1ZmFvVTNrMWRCSEV6RGIrRjUyMVEyYTZZdGs1OHQyN0g1QndIQWdJ?=
 =?utf-8?B?UVRDOWd2Qm9zb1VHN0dFN1M3Sm92NHFpTm9qaWhZWllmeEFybnBJRXhUSkdD?=
 =?utf-8?B?OSsxNlRjQ1h0Y0MwZTg4WVYvazFaeElTazkrVjNMaHAxQlpqSlhhTFcvaXVS?=
 =?utf-8?B?MjhYeDI1VHdEczY4dVZ2bVpaNDZqd3huMmhrTjZhWXRPUmpMZjRXQVVEalNE?=
 =?utf-8?B?WFhDWjVibVUxV1pzdDRwVHBOTzU5Z3BmbUlSV2ViRzdqQS9QNHZuNWxsclNZ?=
 =?utf-8?B?WGpXMFBUZzYyQmJ5Skh2WldOcllQRGV0TDJBY0N6RW5zK3NSUlVUWGUrSXpw?=
 =?utf-8?B?MmhwNXpLQUlsbFpLN3hkY21FK2k3Z0xsT0NWYzRsOHpsZ3QvVjNybFNwYXZH?=
 =?utf-8?B?aGNMR0U1N0g2NmNCaDh2elpNeGtsS1NleXgyVDVLUW1lbmZyYVFQazZzWmov?=
 =?utf-8?B?bE90OUNLYnhwYkFVRzJtRjFBSTdZa1kwbllKc21UZFNqc20vemlkZDFiZGxZ?=
 =?utf-8?B?YjRkaTFoL3MxRlhIWUJYSkxXWHhTd1VZby93bjRoMzVUNWROYXg4Q3ROOCtQ?=
 =?utf-8?B?L3F4ekY5Ky83eC9FcFc4RjdHeHhGczlXNWZaSDZjNTdoRllYd0NlUHhINFB5?=
 =?utf-8?B?UEVwN1NId3JSbUk3a2hlR2JwR28yY2NOb2VrQkk4SnhkcnZqb0xLdEt5MFp3?=
 =?utf-8?B?SmJPK2dEc24zbkljeTZObFZEN0szVGZNQVVRbktLZ1E2MjFMdkFBNDhqMFpW?=
 =?utf-8?B?QkNRcDExeHNUOUxtUCtRNW9RYmxjZ2VhTDRpZEZhc1VFalpRRzZnZzYxUzFE?=
 =?utf-8?B?eEk2L0pDbjNFTVBCR2c4akZ5MVRUWHUySExtcVVGcDJnWlZCRUgwTUFGZVQr?=
 =?utf-8?B?V2NibHEzUWhsdjF4WnVhS3lIcTZ0akg0cTA2UlRJTHZyTzlWbzNnazVJZlR4?=
 =?utf-8?B?c0dVZ2JlMDNDNE1CWlg3bVMvamFtQ0lzaFREaW1ZWjRGcjVpbWpGdWtPYUlj?=
 =?utf-8?B?OXdOWGkwQUhTRVRHd1FyTWZNaTFNakdCUWx4UUdhaFhEN1BySGNPWENZNk51?=
 =?utf-8?B?OEhNTWI4U0h5U2JqaEFlbXc2TmNSMEU0UFlnUnoycmdOSDBsM1d6VVRlbTNW?=
 =?utf-8?B?NjlibVptYnhCRUV6b0lvTjJIcFpHSExBeS96V09XK0x2L2lzdmFraW16WXR2?=
 =?utf-8?B?dWVYM3dndGo5VHpzVkp2MFhhWTJhamp3b1BUU0ZnOGVVKzZNa0t1eU5VbDVq?=
 =?utf-8?B?RTJ4N2lSaGVhRTBTUkxGZ3V0eXBFYkFZRUg0YmdYUU9XNEFob2pLNmJ1UnJF?=
 =?utf-8?Q?CrVBGeOo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a18cb71-ab45-49fd-225d-08d8c38ded3c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:09:21.2110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isXG44SPPGSGY7Zh36gFnimJ1Eqyr1enlkXEeeKhMFSqJ0S7xJxuK4UVqjs8rQpsgS2ZbykhS4Q7Nwg9CFx4UlmqOn7jclG7X1LQ655db8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------242BC2776A07B49E94529EE0"
Content-Language: en-US

--------------242BC2776A07B49E94529EE0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-27 10:55 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Portion is a Python library providing data structure and
> operations for intervals. It replaces python-intervals.
> Release 2.1.4 brings:
>
> - Much faster get, copy and | operations for IntervalDict.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-portion_2.1.4.bb | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb b/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
> new file mode 100644
> index 000000000..d08d3e725
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Python data structure and operations for intervals"
> +HOMEPAGE = "https://github.com/AlexandreDecan/portion"
> +SECTION = "devel/python"
> +
> +LICENSE = "LGPLv3"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "58b2792e6e9837a2d55a97d459b940c90fb08b5fba774f524e9359727c80e7b4"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.17.1
>
>
> 
>

--------------242BC2776A07B49E94529EE0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-27 10:55 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210127155538.12229-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Portion is a Python library providing data structure and
operations for intervals. It replaces python-intervals.
Release 2.1.4 brings:

- Much faster get, copy and | operations for IntervalDict.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210127155538.12229-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-portion_2.1.4.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-portion_2.1.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb b/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
new file mode 100644
index 000000000..d08d3e725
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = &quot;Python data structure and operations for intervals&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/AlexandreDecan/portion">&quot;https://github.com/AlexandreDecan/portion&quot;</a>
+SECTION = &quot;devel/python&quot;
+
+LICENSE = &quot;LGPLv3&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab">&quot;file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab&quot;</a>
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = &quot;58b2792e6e9837a2d55a97d459b940c90fb08b5fba774f524e9359727c80e7b4&quot;
+
+BBCLASSEXTEND = &quot;native&quot;
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

--------------242BC2776A07B49E94529EE0--
