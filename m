Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.70])
 by mx.groups.io with SMTP id smtpd.web10.7255.1613480208677065632
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 04:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=apOOig1/;
 spf=pass (domain: windriver.com, ip: 40.107.223.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0VMMI1/Z2Ow/wNRXwjbLGkGZjAwEtMBAGdA7XuMMKlfgCcN6R2Hpw8cZpWgI9rUYmO5tb1u+WE8eVWR6zZe/TI2q2kSUvj74vUzDKUiJC7SQw7zY3nLjVPSCgMGEJkOoUaR/RaSmiNtugnrqDkklm4XZyp+DvMgke0WuLGlmkeJA4Pc99YHtZ6T9BVu40EUN2QwJQdy2jnzWE9E+DpIFOl7nijINTef13VW68giImultLry1v+uQqtMVVn05fhCIwY+QbOPqEZ7UcjuklXBAKs0JpReHEm75R6BCmJ+N+nzKSaROFKtr3vWJXAX+8jbNHevZ5hLFeuHJI/DUXVnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOEF/tFeGlJvagTcJGtaHuBPayRMLuWkM3aotNsF0yM=;
 b=G+5iTCYmV0/1ejArD+cxiusbOXkwR9K0i29rn2Io0+/D9BHBEjbrWzUR5D5fiidH2bF4cup8EFegsiiy3uEJAnRtAhPnIapoFZhcXkIHf8DtRfaLUkohLZ2kyoikcG5uvmCPyA0BvzKaO0FH+20LsUJ2Vx9RyZsOXY8bdq9xCkN17c5vMzH4ofB6CE96hBTTCblwTDNDJyBkOFTjkXpS4Qit8ISEiFV/kyeYxfJepFatIFFUFP8JIoCLb+rJhfZTaeoy+2kkOTR4kFqP33JAkUYILOCW07n0Uv9bFUP5XTFp0XmysJgC5nmtl3khBJ2QUZSmJ2WTydfGkPOjawDWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOEF/tFeGlJvagTcJGtaHuBPayRMLuWkM3aotNsF0yM=;
 b=apOOig1/yBa5UVgkkxCZN+FV0HbM6guH8VKp6ZbNqxCKJTYa6zJ2n5GRBnWJqjlcuoXPL1tfazz/hjzuvXallPGrBR4I46mhNTIiOrP1V3xPMAPdSS4RP+OTlsisVSlg6AEP9mdiL5tcM7z4PRLcJ9JF+f2TVbGPr2MMTWfAIps=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3061.namprd11.prod.outlook.com (2603:10b6:a03:83::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 12:56:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:56:47 +0000
Subject: Re: [oe] [meta-python[PATCH] python3-protobuf: update to 3.14.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210211000517.1922669-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5e9116bb-2417-33f0-3276-1d604e2d1eda@windriver.com>
Date: Tue, 16 Feb 2021 07:56:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210211000517.1922669-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:91::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:91::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11 via Frontend Transport; Tue, 16 Feb 2021 12:56:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63ab4620-12fc-4371-3860-08d8d27a51c9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3061:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3061DB9DD6DE65EF59BF39039F879@BYAPR11MB3061.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yoosKSdDscjgxWbqM8aB5ohQ766C1Vst9PqIyFagcy39WF5nv5VBbr4tfRfhpq7CjrPAbImrweoesC92aKwQurrB50Di076oPVMwpVQLX6jcw4zSuqzdbvv9lUicHNgr6zW7vM04BYm/8y2D3mwU0JSr69S2g3h3xpSf4D5xbGPhURKUCNJYOcuT5+BC9twfeyl0hDtlivduv2uPPlZqSMS6ChZp/NsIHgbzL6Go8nrOtoQ4Rmmn+vxqC+wHkni1RM0XmK5mZgjPJ+zeaFVC67jTsu0NNGVsfEaV5AVICxXUZZYFb8+7tyuAA4iPZo/IqUKOvqDRccAljTGz51ndw0d1cw2/EeynDC0PeplPU7/APS8SFxcdGIY2p8ZLpROJV3qFX2/qtyrFLAwjn9nseC1muuut1fsZi8yRyW9R3nmwACry2D1V7vNwGvEbsiC9Cdy29lOPJL/m1HPT5qZCvsryXQDpZo2Kc1/43orPb6QSeA2bHwj61UvIxe46fDVQkslOyr21l6W5/XPATAKT2Q1zptNI9OFoQ3I7YT7tk1wxm9JoOYTfQ7i3PlqviWUEh1SaP9f2KV1An1tLE5DRbxlG2dzoqR1nauAYiURbiHvVfuyR7AOkoGNYOssXnV1338ScJr1/z57ZJfu/YA9O8CBZH4u5q0g6vbr9HEKOtPyoNcT2eqTjb+grU5MhH0GM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39850400004)(2616005)(956004)(8676002)(8936002)(166002)(86362001)(44832011)(478600001)(33964004)(16526019)(53546011)(316002)(966005)(26005)(186003)(83380400001)(16576012)(31696002)(36756003)(52116002)(31686004)(2906002)(66946007)(66476007)(6486002)(66556008)(5660300002)(15650500001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MXBVa1JGMllIUDRIM0hxZ3lTN3k0RXZxL0R3Rm5JMkRTcnU5ZkdVb2xBNHhW?=
 =?utf-8?B?bVdrMG9EZTRuMUphalZCMmJMTWxDM2VhSTZLeEdiZWsraE00bUtXK2V4bzV5?=
 =?utf-8?B?bWRXS1BjRUNIWEdNeitMelhac3FRVlk5Y0tVVlN3OHcyR01pUGY0QVF6bkUv?=
 =?utf-8?B?RXJ3UUh6QnQzUG5ad3NFNFFmNFl5N2ZJT1NKR1JTVlY1NWVZcW9IWjJFbVlr?=
 =?utf-8?B?OUg0TERadUMvVHZGRFVYU1d5QXRyRTJjTk9xdDNNU3hWL0lyb2tKS2piMjNL?=
 =?utf-8?B?RmIyNkVQcEN5WU8wY0c3MnYvR2w0QXZUVVdKcURYaUw2a1FMZURUMXNlL0RD?=
 =?utf-8?B?TjJ5QnVCeFJsYUZGYVgyQlV2ZVRFWEtwOGN6ajZ0ZXp5ckxCckg0eUU2cnpY?=
 =?utf-8?B?TXc4NjVnNDV5L3g2RmlBb2szNldEQVlYYVh3QmFuZXdEVkxFeDB1NC9tZ1Fs?=
 =?utf-8?B?cXNFT0l3b2RJeW8xblBlTXJrVGZrWFFrY2ZURHNDTW1pQmRleTl2dzVtOURG?=
 =?utf-8?B?RUxTRHVTdXFCa2w2ZkNrR3dueDhrakdBQXJyMHNiTUpJYW9JUlVXUXh4NTVO?=
 =?utf-8?B?U1pxaldzcTU5YmR2Vm9hdVVRQ0VhYmF6ZjBDaHVFbUZ3ZXdpOG05VURET2dQ?=
 =?utf-8?B?cHQyZ2RZVmEwQ2YwRUZ3ZUVDYkU2YkZlMm5BZXp6V2tRZWNnaFJjQ1Y0MTd1?=
 =?utf-8?B?b2Q0K2tYSTRySjJwSGQ0Zi9xTkdQQUozNDhhVi83U2UrUjlDbHJmbk1iTzFG?=
 =?utf-8?B?ekJ5MjQvL2NzMERtMGtpempOaEx1ZFhNVjhHRkVRMUUrY1JuemFhak9rZEZN?=
 =?utf-8?B?NEs2Q2MwTkU0M1lFTjhIK1NFSFRETXVSV1RSZk1WZjdiaitUNmdFdjNGZUJz?=
 =?utf-8?B?ZTY5cEJ0NUZuWnRTbGFuVHBiaEQvb01Ua0U3dG5rRW5YNFBXcGJtbWR2Lzg0?=
 =?utf-8?B?Ylg3cTh2OWd4UVdUNlI4YkY3N1Z4VEpLNzZoTWVlaVBubWlzQkVjL1JtZWJs?=
 =?utf-8?B?TDhlSWJPUnZwZFl3Vm42YlU2VnJ0eGxYV3BONFZWN3h2NC9kRVA1LzR3all2?=
 =?utf-8?B?WEJ1TXlhTlRNQk5BSGdFekJmQWVrbWlRKzFSNFJ5MGdqZFprWmhEeEJzK2Z2?=
 =?utf-8?B?MndmQU9QWFM4OGRVYUdhdDkrY1V0d2FXRERXWUpsSUlhdDVVZGVLQUdONkhv?=
 =?utf-8?B?b2czRXhZSjVMWjh4WCtZN1pkNVMvRWdlUVF4ckFOSGFQSU5UcU9Fc0dyT1Bx?=
 =?utf-8?B?Z0NvZUdkUDlhaEF4UUtUYTZvSUg0Uko4ZUgwemw3VURLbXgxMTN5RDg4dHVV?=
 =?utf-8?B?bkszbVBUcFNSUjNadlBIRnJRWDJqWFFjUVlVYnVIbS9EVDZzRTJGZTBmaytk?=
 =?utf-8?B?RFZoVElxS0xlK3lyYXo1TkFZUS9LOXhFeDBLeGhmTXA1U2FvS1ZHTXU5Ykc1?=
 =?utf-8?B?Ull3a3RRODNEZlIya1dPSkRMN0h4b2cvRFBrS2Vpa2RwRXI3QS9Eb0hXZ0ZK?=
 =?utf-8?B?Y0ZBUzZqVzB4M1JLMm1Rc05tQTVHOFBISWxPV2VaZGJaaDNBT2diWENtcFU5?=
 =?utf-8?B?S2hqc1lCYXRBMDVFTUFNY0pZMFB0cTBKZ3MrZGs1OFBsdUtxR2JLbndxUE9Q?=
 =?utf-8?B?OGN4RUI5RDh3c1UzNU82UW9pV255bitwa2hCT0JuMTBRVmN5azNKbEhodFJI?=
 =?utf-8?B?TTM4Z1IxVWhCQkxWeElIYVdCR0hTK0xKbDRkdVdyMHdhRm94YmxKSGxGUDQy?=
 =?utf-8?Q?85RpiZ8y8cy+TBIbjHr910xYQ066aeupMTg/vPD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ab4620-12fc-4371-3860-08d8d27a51c9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 12:56:47.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdZmLcaZioBMPa6i8QeRqYeVfDRPy4Zr7t0eGkIJnyxAYDjGmpDyXoZtYSyr9tSuBbdpMd/L56khIgMhw6ByVEC76Nnp4IExDNOcBMs/05g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3061
Content-Type: multipart/alternative;
 boundary="------------DE676F862C85E341031C99F9"
Content-Language: en-US

--------------DE676F862C85E341031C99F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-10 7:05 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-protobuf_3.12.2.bb => python3-protobuf_3.14.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-protobuf_3.12.2.bb => python3-protobuf_3.14.0.bb} (87%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
> similarity index 87%
> rename from meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
> rename to meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
> index 03d0b0c60..3cf850d1f 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
> @@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
>
>   inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "b4336acee38ebe915b6e72fe8c5bce7b"
> -SRC_URI[sha256sum] = "49ef8ab4c27812a89a76fa894fe7a08f42f2147078392c0dee51d4a444ef6df5"
> +SRC_URI[sha256sum] = "1d63eb389347293d8915fb47bee0951c7b5dab522a4a60118b9a18f33e21f8ce"
>
>   # http://errors.yoctoproject.org/Errors/Details/184715/
>   # Can't find required file: ../src/google/protobuf/descriptor.proto
> --
> 2.25.1
>
>
> 
>

--------------DE676F862C85E341031C99F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-10 7:05 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210211000517.1922669-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210211000517.1922669-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-protobuf_3.12.2.bb =&gt; python3-protobuf_3.14.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.12.2.bb =&gt; python3-protobuf_3.14.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
index 03d0b0c60..3cf850d1f 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8inheritpypisetuptools3-SRC_URI[md5sum]=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8

 inherit pypi setuptools3

-SRC_URI[md5sum] = &quot;</a>b4336acee38ebe915b6e72fe8c5bce7b&quot;
-SRC_URI[sha256sum] = &quot;49ef8ab4c27812a89a76fa894fe7a08f42f2147078392c0dee51d4a444ef6df5&quot;
+SRC_URI[sha256sum] = &quot;1d63eb389347293d8915fb47bee0951c7b5dab522a4a60118b9a18f33e21f8ce&quot;

 # <a class="moz-txt-link-freetext" href="http://errors.yoctoproject.org/Errors/Details/184715/">http://errors.yoctoproject.org/Errors/Details/184715/</a>
 # Can't find required file: ../src/google/protobuf/descriptor.proto
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------DE676F862C85E341031C99F9--
