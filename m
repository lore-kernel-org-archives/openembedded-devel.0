Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.55])
 by mx.groups.io with SMTP id smtpd.web11.9554.1593183687349253913
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eFV3KgUx;
 spf=pass (domain: windriver.com, ip: 40.107.223.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9EWovlcO7BSObnio5HRFSg4aGtigEYiPxS2d13DA1mou97g/8mrhnXzoFqU5+fJMo3tlMytNbxrArGTuQynfGYZl99NWuXNyzOhbTwHQtjRaAlMJYedhHKnTueRQRCvJkLky7VNEt43NkI6JStXsbjny7P35VARwKRPiC0qIcfUT5w59ZVE2pFbkdJ8E2Wh7S3Pxsilly7W1olysIHTkGxr+uEOoFiYU7qVkeSFSRDevPcI8sMM9PntX6x6klkac3QtqqHR7FyrWD/T0xwJ6Ojl81E4jXl7jEz5nBZeVm9HSl9LaDm6BzhKMH/HPO5wASn02ggL4C7Gvpds5m4u0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyAXylZo7/eFGQSR9+BhfSaEWT03BMqCdKUEO/NL1Tk=;
 b=nWmdFXrymaSeDj6cv+RRGK/idFgSBwv3eMRaJZA1TbsYaOClXHTKwnXiiEwBomX6Y5UshozjZ0W0Svl1mkegqK6rsETPu+XjOFCQHa+60Vpze21Z7Zxw+bTBjBO3WcpxOUXj5YTKbIKn/Zoi2koN7d+9ue4a6+gedjqbh60F03O/FIULD6tc9bE/DVhm8Op3ImWpQq7K6Fla/kyvcpN6MdauexMYKyz+5FfxW5PY8Dh3L/eSLw48Llyra1PCP1kMiJtNO2GvZ58OibcD92ICui3HDL9Oz51wT7DfcwDbKqQ9f7g9QMYHHGwUSgcHTqHN66epQGKaQvdGfayHAfGWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyAXylZo7/eFGQSR9+BhfSaEWT03BMqCdKUEO/NL1Tk=;
 b=eFV3KgUxV5oLd41nKt0FoMBKd2JGfJ0PgwTApS16cZgwtBMtVNcFyx9M8bHaQYG8lSIoRPhTGdR3FEWsEipcot1CWgpbfDcb9yQRXY3sZNSumYcWC6JPQ/rt9vrm2uxNe1IhKwZ+V/4fzFcJtYXmVqHZKLhAM1IsCQ0u19PMoSA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Fri, 26 Jun
 2020 15:01:26 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:01:26 +0000
Subject: Re: [oe] [meta-python][PATCH 06/12] python3-pyjks: Upgrade 19.0.0 -> 20.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
 <20200625090719.16068-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f7f77d2e-a2b9-b1b7-7b7d-9c5ad9461acc@windriver.com>
Date: Fri, 26 Jun 2020 11:01:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::40) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Fri, 26 Jun 2020 15:01:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ed45f51-0de6-47f8-c9f2-08d819e1cbbf
X-MS-TrafficTypeDiagnostic: BN6PR11MB1873:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1873DAD2173E19B77D4C4D449F930@BN6PR11MB1873.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YvEdUgT5oqGa52AX62OK2VjxVx7c05B90draE/Sh2ymrPqTJcg/vaY2xMjj6Z9OeXZpBbcil2jVEAEHGa4/liIjSrOwQbmTsyLizCJXGQICzLKVoZYGDBoqQa0khUKoM6tuoRdCdTBjvFGfuAGXFJoYMPjMGsEL+M4mNNioiGnCP6xjahhirWRpWD//TK+yAyOnBX9hcMsaMCDXd1A4Ms5EATjrojoYdc3bXGzaDBmEjIpvuyEkkBZcby6uFid3D7A/1PYvehuSxhur3/le2E5gZ3hgugUZ5wCllRCbaDTTx25MlKvxBK6azwbSHe4Zk/kUvSaTCN9/7hnVe89U/NVpZqZ/UuW9kh6P7SPX51sDsbf6SModGv9E6zf+VlDCkVZ73UbNWJ8o8oL4EyaayD5RXTKOy1w9btKL2aFbX7RgeP5swtJhuuSp+lfo6z54fEGSeylbMfBWLvwvUubi1YfVj/9xtsGh/NG955fKdvIM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(136003)(346002)(396003)(39850400004)(31686004)(8676002)(478600001)(8936002)(44832011)(66946007)(6486002)(19273905006)(966005)(31696002)(5660300002)(2906002)(956004)(186003)(86362001)(66556008)(66476007)(2616005)(33964004)(166002)(316002)(53546011)(16576012)(36756003)(26005)(83380400001)(52116002)(16526019)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	poiKeu6BhKju37ihQ0EuKsk7sU+h7Byv3hlL/vGOpr4axHzSop/DAJDZnUxcAVxLLGe+eyIX3MFAeamTcmP9ad+zrXpO5lawDxMaO7xPJCEh3tepo5UwNsjmF8zEdMX06EaVWkD5vfD+21hTd0pnS3hbxYdLtgkQbnPojGIG18pigeKINlmNXuLCffiFumY5hLwBflE3xFtRitcjKt4u4lJdhs6xezOQ3TwDnLeopk4vWo10HaM1D6Eu28rw/KsWvVg29SDxH221+nC+WgeFlt4b5ctCp8nkCL1bBIuhdGVNArMxd+V+5CPkctSfdQEzXvFKBvmy72BhTT4PQ7jsDI9hMaeiRCg1KmdTJ7IGygtTQxeIxKn4tH/fPEcJQnkSmvpM0jh6V325Z+IftLjt6wp12t/iMT1oqLUEurlt7jORZM6GKVHkyYnsRvgNtM91elHA/EyAStCb9n1dgYE9HKd3U8Ed3Q56s6LB8QzwTPU=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed45f51-0de6-47f8-c9f2-08d819e1cbbf
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:01:25.4382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUeLllLAvU71ov+3X/hqIK9h/5Ngrn6C8/FpdGZyH18SxddrZ4rnVIwzLDkRP8qZ+uYiqpaTmFt2VeTjLv/sHFxwlWD8MkHxI2lCHT50g98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1873
Content-Type: multipart/alternative;
 boundary="------------216F7C364C935FB189A6EAE9"
Content-Language: en-US

--------------216F7C364C935FB189A6EAE9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Upgrade to release 20.0.0:
>
> - Mirrors keytool support for keystores with empty passphrases
> - Add Python 3.7 and 3.8 to support matrix
> - Docs and examples fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyjks_19.0.0.bb => python3-pyjks_20.0.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyjks_19.0.0.bb => python3-pyjks_20.0.0.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
> index ee2f3075c..520899b8e 100644
> --- a/meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "http://github.com/kurtbrose/pyjks"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=9694d6cc724caf7f7386be88a4a81958"
>   
> -SRC_URI[md5sum] = "b6e8f3b91be355d15e3ba99de2cccf9b"
> -SRC_URI[sha256sum] = "9ce5b40289bcdffcd6a8e7118b333ba8ba2ec4c9ebc5e324885cc8a69767011a"
> +SRC_URI[md5sum] = "1a6bce95484f1f62f8ff59755972c632"
> +SRC_URI[sha256sum] = "0378cec15fb11b2ed27ba54dad9fd987d48e6f62f49fcff138f5f7a8b312b044"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------216F7C364C935FB189A6EAE9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/20 5:07 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200625090719.16068-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.0.0:

- Mirrors keytool support for keystores with empty passphrases
- Add Python 3.7 and 3.8 to support matrix
- Docs and examples fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200625090719.16068-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyjks_19.0.0.bb =&gt; python3-pyjks_20.0.0.bb}      | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyjks_19.0.0.bb =&gt; python3-pyjks_20.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
index ee2f3075c..520899b8e 100644
--- a/meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
@@ -6,8 &#43;6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/kurtbrose/pyjks">&quot;http://github.com/kurtbrose/pyjks&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9694d6cc724caf7f7386be88a4a81958">&quot;file://LICENSE;md5=9694d6cc724caf7f7386be88a4a81958&quot;</a>
 
-SRC_URI[md5sum] = &quot;b6e8f3b91be355d15e3ba99de2cccf9b&quot;
-SRC_URI[sha256sum] = &quot;9ce5b40289bcdffcd6a8e7118b333ba8ba2ec4c9ebc5e324885cc8a69767011a&quot;
&#43;SRC_URI[md5sum] = &quot;1a6bce95484f1f62f8ff59755972c632&quot;
&#43;SRC_URI[sha256sum] = &quot;0378cec15fb11b2ed27ba54dad9fd987d48e6f62f49fcff138f5f7a8b312b044&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------216F7C364C935FB189A6EAE9--
