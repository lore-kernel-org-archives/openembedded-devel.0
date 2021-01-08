Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.58])
 by mx.groups.io with SMTP id smtpd.web08.2019.1610122054595497730
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cKVRug1z;
 spf=pass (domain: windriver.com, ip: 40.107.76.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWzvC+vr/Gy61zsXunGA7OJHmqBYoq60aJhiBoUByuvRmVpVGucF9VRvoEY/jYatmHSp4pcIpAuVThXVXClpgL1sZBkB4QQsOasL6FltNpMCn5xrP81QfAhce2WsNkevcysC4r479mattdXx2d9CZR3OvCn91MSNscUIyKKnLwldmDBxOIrLkVoaoKoyH94CYU6ETjShNDoHLgHrDHCkLyne303RMMyQCrOD0kpzpo/o+crbHgKYdl2+7V/DrsbdbuqQ9i3T0feQbatm8WVoc7wXdLksv8eAr4iVRcnL+hwN26DAvTiFURuE5wPZAoyuYCiVswNChVGoNMvNgE/uGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytDXwh4XgopAB2BhCo+HyJaHVv7wa0wPfsMlATJhl5M=;
 b=JPHgW6K0piXXjRKsNqf/1TtXoeHl67XdERiTE0mWNpDkh60mZhvxJVwJn9KvdY+wsYBLPUjAP5mj1Lk8Y9EO1x81o/XD1YuHnOp4II0MqCljGQTX2QE5RguXI27CCNmSmKEWWzZRz6+bfFlZPFRe55xhBXu5HbOZwhyCvJrltP0YtffW0RvdCila6mnZX+F39eNGjlSQbaV2kCI2o+gugyWq/P9gpDmeh6zWV2kVAtd2ZMEy7sLY8yXaJJIx//Kf+swxsKYwODGw/y3zr3h1rTsOhPN9yhbb/N5stjr0gNVh04hsymLKQ1H3GnCkUWaG5QoNR9ZH3sKLjf4a20vQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytDXwh4XgopAB2BhCo+HyJaHVv7wa0wPfsMlATJhl5M=;
 b=cKVRug1zuadG955bvG1pMCnz5xo0B1ABG4v9ugMZ8RtxulAuPBef7u+dkmIHcacMvJUIoralkialnDeZKs331yZHxsRwK32iHdacXRkB+wSHW2hMnHyJprt8cNgxlM/GsBjFC7USJdEcHg4wJltVtXpPhdQfLTDHbKDY4bCGu4w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4150.namprd11.prod.outlook.com (2603:10b6:a03:190::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:07:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:07:32 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-smbus2: Upgrade 0.3.0 -> 0.4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
 <20210106220702.10483-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f91ae217-72b7-6d78-ccd8-8c6807404564@windriver.com>
Date: Fri, 8 Jan 2021 11:07:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210106220702.10483-7-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR01CA0064.prod.exchangelabs.com (2603:10b6:208:23f::33)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR01CA0064.prod.exchangelabs.com (2603:10b6:208:23f::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:07:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5bf455b-7fce-42f9-c0b4-08d8b3ef8152
X-MS-TrafficTypeDiagnostic: BY5PR11MB4150:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4150958347108AF26253585E9FAE0@BY5PR11MB4150.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rjohErKC/OBVd275X8aQm46Ce989G23A0OeHhJSiSGNi1YJnlkH0kjDLzbYEQGBBoz3UOhSjN0PIuR3vH7j6N0iC8ld5X0lt/Md3iZxf4Zj6fPas6NVAq2Cpp/8u4ojOh8mNJt/vCQeNItvTFK2kJN8RN6GJKBMh66agVWGuj0Toe8uReXUw57o0FehgkD+yDs5jxQlETpgEdEJGi3E2WmKoeksOO7egU/HX4glOEhPFHjrGl/8TzZh863RPDKGNM7Kz27zyYrCvq9d4tSAWtT2pGbid4y/gelN30Lel2FTsn1khKZ2eC2qiGS8ZJg/rmV5iDJh70HFXh/zDF57VsJMQcypvVvAPp/EFs8dxPmy87XfQJUgL5hhxcW8fDZxNZwJpmD7Giue7aWmUQH8v4s5VTpSfO+VOm9yMltWlulzUVivOQkHCTZrMJcp5Md4BT71o75H6GXlO/5MPzvwjYt3WmwtSJD7vTW8UO5Larwdkc2kc6+vP16b4HajMiNkkJquq4LV9fHc36ti0MrnHbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39850400004)(136003)(956004)(2616005)(66946007)(16526019)(66556008)(31686004)(44832011)(53546011)(66476007)(33964004)(31696002)(186003)(36756003)(83380400001)(52116002)(8676002)(6486002)(478600001)(16576012)(166002)(2906002)(5660300002)(86362001)(26005)(8936002)(966005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ODFhWWt6QzRRMUVzd2VpdHEyRXFsUGdrSDV1eDFERGo5aE1tK1dzOTRiZzhO?=
 =?utf-8?B?L2RyZ1J4ZTM5SEVrTGNreWppYURXTHROSlEyNFNlaU9mQ3BVTFlMa095a3VT?=
 =?utf-8?B?bkRBVUlxS3J0TWluLzZGRmdCYXB6Mk90QWdTb3JDYU5QcVZ3eTQrZWdhR1JI?=
 =?utf-8?B?Y2NkN1BDTUpkcFhBRFBGUVZNUFo5OG1CNkNXb1h2bHFDVEY4NmZNaU9qQXBq?=
 =?utf-8?B?cTNaRzM1SDRKVExCNXg0S3FJL3U5TXVJbUlBbWgxL3IxSlg5NUFkUU9YQ0ZR?=
 =?utf-8?B?dEQ0VmVxUW4ybWtlT3orYk5WeFRwUlV4S3BDZGJ3Y1F6S3VQMXJiZ2pPN1ha?=
 =?utf-8?B?MDNDMmZvb3hkY24zUGRzSzZxRjJ6NEo0K1pDNncvbFlNVkZ1OUMrVlY1Z3Jy?=
 =?utf-8?B?eVp5aVgwQVh2Ym8wcXhYNmEzK0MxOThrVy8wSmJDeVBKa2ptek9MK0dMZG5k?=
 =?utf-8?B?bSt4cVVxbzEzTmlJY0FyQVpKNHY0V3cyYW9HK1UwWEdGSDg2RS9POGJ1K1Fq?=
 =?utf-8?B?WWZBME1rVEN6elJzdjJsQ0UrSlMzRzIwYVhSVERHemNtclc5cTdIL0lydDdV?=
 =?utf-8?B?bzBaRVhCYXcrd244d3VPbEk0YlJCeWtmR3VDQ0lya3dYM2VyTUlXLzRWSTU5?=
 =?utf-8?B?QzhvSXNaaDBMaWhUb1RJSjk2V3I3MCt0NUVlQTJvbEhXSW1nUEt1dHFkWHRk?=
 =?utf-8?B?SEUvcnVZRktnNlhJOFI2TndaSmg1VTVVQWM1TTZESnhrQWdZQjdoWGJ6cGti?=
 =?utf-8?B?NUVjaUt0SXlQMUpzS3I3VWNXR3RXV2UyNkJPd1p5MG9UWGt2V1hVVU9CbkpL?=
 =?utf-8?B?d0FvbWV1SXRqb0J1c3RsSnYzaVppR1hxczV3dklXS282WFFpckg2c1BBbUV3?=
 =?utf-8?B?RitJMGlZREU5c0pYVDJsL25zWUJVTVVIZVB6R0JBbFNxMnZvRHVOMlZmalQ0?=
 =?utf-8?B?YjdRa1RpM09tdWEzNG9xNC9KeUtwODBxZHBEWDB6aUNMRGYyYk44RllnUUxC?=
 =?utf-8?B?TFdrek5nbEhuQlp6ZE9Fdzk0cWw5VG83bW1iNUtOU0F0dnRISUxLaDAxK0NL?=
 =?utf-8?B?VnkvK2pnaDh6dG9TWE45dWg4QTVnckNtU2hBeUI4UzlHeUxJL2t4OFI5Vllv?=
 =?utf-8?B?c25tYzZwMzI2ZzF1MmZuRHhHcERFMU1ETWhPR2Y4ZWo5S3lFQlJmV010Tnlw?=
 =?utf-8?B?MG80MlF3TGhYK0U2dXBBVWVPLzR4MWhqY3BkOXhYZFNnZDdhTmNwTUgxSGdS?=
 =?utf-8?B?M2M1SExJQ1k4cHE3Ly9TRmlxVkhJSDdFSnRWOWlqeWNsZU45TFVsSVpDQmZ2?=
 =?utf-8?Q?VV+Lq57Kgbhus5E5wAbx6zVhAvyRGSEG9k?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:07:31.9875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e5bf455b-7fce-42f9-c0b4-08d8b3ef8152
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJNzuIS+JHESjM2gTYF5WCsQxyJxhh3THhtEqvDFr1M+EMHY3TxLOv9sjr/lFaIgZHGqE+SQcF98OF39lRBdOY7cSn3O4ZLqnEh5ofWTzK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4150
Content-Type: multipart/alternative;
 boundary="------------12BE6D33332835C7F1865C91"
Content-Language: en-US

--------------12BE6D33332835C7F1865C91
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-06 5:06 p.m., Leon Anavi wrote:
> - Support for SMBus PEC (Packet Error Checking).
> - Support for Python 3 type hinting and mypy static type analysis.
>    Type stubs added to the project.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-smbus2_0.3.0.bb => python3-smbus2_0.4.0.bb}       | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-smbus2_0.3.0.bb => python3-smbus2_0.4.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
> index 7a61927206..1f6f61137e 100644
> --- a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "d5ed5acc889b4770a84cc932853ed20a"
> -SRC_URI[sha256sum] = "210e66eebe4d0b1fe836b3ec2751841942e1c4918c0b429b20a0e20a222228b4"
> +SRC_URI[sha256sum] = "1b5c690715e1efab39e41038147dfba75afc72a10f76b3f0310d783e9f8a83a6"
>   
>   CLEANBROKEN = "1"
>   
>
> 
>

--------------12BE6D33332835C7F1865C91
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-06 5:06 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210106220702.10483-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Support for SMBus PEC (Packet Error Checking).
- Support for Python 3 type hinting and mypy static type analysis.
  Type stubs added to the project.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210106220702.10483-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-smbus2_0.3.0.bb =&gt; python3-smbus2_0.4.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-smbus2_0.3.0.bb =&gt; python3-smbus2_0.4.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
index 7a61927206..1f6f61137e 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecdainheritpypisetuptools3-SRC_URI[md5sum]=">&quot;file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;</a>d5ed5acc889b4770a84cc932853ed20a&quot;
-SRC_URI[sha256sum] = &quot;210e66eebe4d0b1fe836b3ec2751841942e1c4918c0b429b20a0e20a222228b4&quot;
+SRC_URI[sha256sum] = &quot;1b5c690715e1efab39e41038147dfba75afc72a10f76b3f0310d783e9f8a83a6&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------12BE6D33332835C7F1865C91--
