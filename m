Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.45])
 by mx.groups.io with SMTP id smtpd.web10.8392.1612533822964148057
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=m6LU0y8A;
 spf=pass (domain: windriver.com, ip: 40.107.75.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogtE/ekNgn1L30508g5Syw6kZQryv+hPymShNwOyPpgVR5PHxsEw+iOwVrf8yvrD+TT/M7ULtkXPconS6gSq1v5oZtcSUjVhc6jh81YR3Vg6F1iQSwXHWQEi1nB2ShluMhYgEPdy+bDEdGY0yhjLHBWoLbn+F+EO1+5qa23wTA32cXc1R/h5i5VN3oDtjh/nsavwvk6Y8VFHJxw+8Xw+zWBYlGGvyZSkAFTP9dvjywzeX6xDEJ56v9SuzElSWpPgwKkLcUYF6uS3oAjjhvAgHeRNlCMbGosunAvqCHpJlAz8Q48SdaYalTNg60IwC920gZwizGCgAwx9DtLCtoWkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1VmGuIiZQtgTqAO9hXn3e5UIfGu5YFXqtIEimtxDIc=;
 b=Woet0tajJznY/f7gMRyq/JiMW5PjjlI+lu69IO9S30J1pqe1h3VLsTIk3ft81WzGHqEcuOHpBXJZDuJgxN2/1VgXbnNwjrrKqjMTbKa9Ad+59aB140d2Y+65fU7ZK33SvYXSBiTEvlqEMqKTv4pK7QEVSpbZHOK27j61wV6zIgw/WZjWRR/nb6LTkO/vmpOaMmNRo9g15VvmJ47oRRz52u8uPVvXSOlHeS0AEkBu0ExdVSWcvhXvud1nYcG9Negd3nlLymL29mif0kmKe1xMcr2qZC0xyj+DlTMpD/32cYY3EH7eOI7B5Z9DCc33Cer9pHcTK4HcK/XlC6156f0lGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1VmGuIiZQtgTqAO9hXn3e5UIfGu5YFXqtIEimtxDIc=;
 b=m6LU0y8AQFz2baF8dXecQfnXA2O+MkEB46NLJhlectiZ27nzOjEwBXlO7HdEwHABZG5B2CYMUo4i7HOgPN3aIHw2ZBpnO+cYI0MPq4JQUjcGT9tddMH0b+4RH2BWnIlw/XqzUQ1D+u6EkSeWpWTQMXnKCzaY31ZGYf14uLtVeFw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (10.255.163.77) by
 SJ0PR11MB4830.namprd11.prod.outlook.com (20.182.113.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17; Fri, 5 Feb 2021 14:03:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:03:41 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-tqdm: Upgrade 4.51.0 -> 4.56.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
 <20210203153822.25077-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4c04b35b-8214-4b36-c58d-0ab37aa9dedc@windriver.com>
Date: Fri, 5 Feb 2021 09:03:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203153822.25077-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0553.namprd03.prod.outlook.com
 (2603:10b6:408:138::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0553.namprd03.prod.outlook.com (2603:10b6:408:138::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 14:03:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bd68560-ef6d-4860-9061-08d8c9ded7ed
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4830:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48300F3B85EAA14FD0BED2319FB29@SJ0PR11MB4830.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KBOeaMk2RdNnzqzSN90YOuUzgtun7CvTYJbZV02KkkOK8gXqQ4iovDiOKq0zbCrNKC9sk2bn0CFidQWVFJzZkt5ba00IEhQlD9klJxqoZYqzHjjcHzcdgbCeWJ8HpYdoTn6afYOMKeoYiuj47lhAUFjRYojuAcX16U9nYYyxyHGBxfHmRD0TQlGffcYyvWhigzKjTo1so4q9SmNGce6rsXU+kNWonPPVauiFwCLBg/01qPEQmjwm2KUkuwE3nLkMXVZsVxMOexNgaG1yi23vGe62PbsNEfilHXvDY7jggBHSQiTodx/jcFgiU/aCRtEOFDNfv+Q/k+D2fFL1VkoJNWXOyk9H055HYapzCAGEbAkpqcTOlPLfFmyfvCL1QX5jVXOioD+B+A37cLXh9+IRcZM4FFKJpQKmQxz1UTpYN3VgHlemTVmDDD0E0ltF7xbBdTgff29y0DZVIvb5AvXfzFTHJfYyFkjW1gwPc3wm2ob3edjTysESUJlhU1mcNp4jIJlD2WRchau+Nioso/MdL1L3+qxgL8Y/GzSSpNGolU43SgWzmOWxroMg4nEA3kMgAD8I/EO3AyTS3DP7B8FknDq7mc7ClqxXVqS686jZ+ylZtKOd06PFnsx8URLjYcqUofDf6CtwQSL7mJcSQujIjYv3ZESzCcaEpZWudus6R51lowK2G7/uKKRQCrBNwdVB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(86362001)(6486002)(83380400001)(44832011)(8676002)(16576012)(316002)(36756003)(66946007)(53546011)(5660300002)(8936002)(478600001)(31696002)(2906002)(66476007)(166002)(66556008)(26005)(31686004)(186003)(52116002)(2616005)(33964004)(16526019)(966005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?US9XYi82TjdTK0lPTisvVm5DdCtYSGkxOUFWaVZtbFZCeDVSMnc1em9vL1o1?=
 =?utf-8?B?RXRUR25PUHhuZitRbFpjNVduOENRejd2eCs5dXhzUHhwYXlxbDlkZXZycTFo?=
 =?utf-8?B?WERFaGJhWUt0YkhxcXVwcUE4NjVkWE9BcVpWSlRGSkFuWWVUZyt1d1owZnVP?=
 =?utf-8?B?VERQQm9taFo0bnhwWEZhY1FaWVh2TDRuWVJaSDN3M3NKT2cxQ0xWazFIckxM?=
 =?utf-8?B?STR0OVJORTljWFVLcXJTbTg0QUxBYVRyWmNrNzRHRlFxMzZ6Z2VmOThwQXAw?=
 =?utf-8?B?ODVRU2Z4Z01jakNMMzI5bU5WclB1enVVZVRzemVtdC82eVhqL0V2TlFPM0ps?=
 =?utf-8?B?M0Vtc2Q3Z0JuWlZKcnV2NnZhZ3hvL0Y0cUdxSVdyUFk4ZGplVFU1R1dBdW8x?=
 =?utf-8?B?cnViYzlpZmZBRVVsZEVnVjBEa3YxZzd4Z0J1eml2ODhaOWlWTWtYSVFMaUpC?=
 =?utf-8?B?MTJGWkRuWWF2TTZyQ2Fia3lEUVppTlNLWXdlYXZDOUxQdkErVVgxREVpcVZK?=
 =?utf-8?B?SlFYd0lXZEc2ajdFRUZpcy9CdHdGYjd2ZHJsditXdG1VaG54VmNMSG01WmhR?=
 =?utf-8?B?TStEMlFuOWxKUTd1dTlIeHpkNmtDQiszZkN5U0FtMWRpS0hQd0t0TThEbWhX?=
 =?utf-8?B?aGZXRlFQUlR2dHR1Z1BlN2daY1ZtZUtBKzJWcCswQUwvbnN5WmNBb3diT29r?=
 =?utf-8?B?b3lDLzBOa09qeXpHTWJpd254L2dvMWVsU1QvemVXa2dOYUVYdXY2cVYyd0d2?=
 =?utf-8?B?S0ZmdFNFYnhLM2taeDY5UVhET1A0TDgzRm0yZ21XckROTW9sajh5Z0VpYmd0?=
 =?utf-8?B?STI5UHZSWTlSNVVjOEJWTUVXT2xpajBTUVBSQ2RTYWcvK09DUnhxUGdLaHFa?=
 =?utf-8?B?QkQ2UUErTEJuVUo2aGVEbjVDMm1SZlgraFlBTFgvMXA5MUhxRTdjaDA1K3lB?=
 =?utf-8?B?UVoxTTRUYVRxeHNxZkNlSnN0QytBU25aNEswR2FXODBEUlpOLzlhMnlwMXdW?=
 =?utf-8?B?Ynl6c1FJNm83cVgwb3VzdVpCcHlQWTE4L1BlVEM2cDdvNVZ2S2MwTUFoU2tT?=
 =?utf-8?B?SW5INjBvVFVlWkdxbjZ1UjNqWUtTbFBSZnRtUmpteUR0MCtpczhTN0ZvMXE5?=
 =?utf-8?B?T0FxQ0RkakpTQjhCQ0tlSmtwWElRTkFJMlI3MVZOZ25CZUsrRWMxMitVTk10?=
 =?utf-8?B?ZmVya2MvT3I1MzhzRkt4bEJ5TkVDbHhRNm85Uyt0VXp0M0Y2SGxSc2FZN2pI?=
 =?utf-8?B?U3Rtam5MalVtNUwwR3k5RGZQV2tkbGs4aWJ3YWQ4bTZ6cDBEd2I0eU9oMVcw?=
 =?utf-8?B?T0NYeHVIUDBqQnhXanhrSnUwbVhvaU51MmlLZW9pYXVGa3JSZTN3MXo4c3k0?=
 =?utf-8?B?Tk8yZGIzWnpJTExtUUpsMGU4MUExUi9ZK1oyV1JkNTkrdWRkSHlSTFpEci9n?=
 =?utf-8?B?aEdncjBSbS9SZGJPczBSbW0zMUJsakk5YXlua1cwMDVqa2xpSHF0OGVLd1ll?=
 =?utf-8?B?KzdvOHpvcW9UOVZ4Y3paM082ZHNZcWRxcWpPN3ZtU3BVRHJYUmlFSVMrZDUy?=
 =?utf-8?B?WWNlakxhUWdCYWNFQ2ZjelpOVlNpTWNrQUptVUZFKzFkVkR5U0NSNWFPbmhH?=
 =?utf-8?B?YTcwNTUzRnlwc1FXSmZKKzJ2L1dJNllEZFFXZzRrMURWV2lTL3dZd21Ib1hn?=
 =?utf-8?B?REVUNmZGNXdOMTJCQWowTU5jbUZmbGdiVUFna3QvT2FGaFJ3YU53VU1LT1VL?=
 =?utf-8?Q?/aFj4WMb2yJMuffnpdDnG5QC6vTd3uZU1b0uskc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd68560-ef6d-4860-9061-08d8c9ded7ed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:03:41.7027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvU2qQip8KsnW0iuVTN+7hAj8+DzkMnIY+ZKIcvazMe0Muy7AzcmwI//2xV+L2M2ch+OLpZEOfcaaEZeaQRQFiVIBcgr7w8Oq2PyjjqdiM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
Content-Type: multipart/alternative;
 boundary="------------BE2CAB937C822C6F2C597D84"
Content-Language: en-US

--------------BE2CAB937C822C6F2C597D84
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-03 10:38 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 4.56.0:
>
> - add tqdm.tk
> - add tqdm.rich
> - minor formatting improvements for tqdm.gui
> - fix display() inheritance/override
> - add tests
> - add documentation
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-tqdm_4.51.0.bb => python3-tqdm_4.56.0.bb}       | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tqdm_4.51.0.bb => python3-tqdm_4.56.0.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
> rename to meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
> index e4510ad44..d4baf6f22 100644
> --- a/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
> @@ -5,9 +5,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT & MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
>
> -SRC_URI[md5sum] = "b188c2dc7802c19b262971e566c265ce"
> -SRC_URI[sha256sum] = "ef54779f1c09f346b2b5a8e5c61f96fbcb639929e640e59f8cf810794f406432"
> +SRC_URI[sha256sum] = "fe3d08dd00a526850568d542ff9de9bbc2a09a791da3c334f3213d8d0bbbca65"
>
>   inherit pypi setuptools3
>
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +
>   BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>

--------------BE2CAB937C822C6F2C597D84
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-03 10:38 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210203153822.25077-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 4.56.0:

- add tqdm.tk
- add tqdm.rich
- minor formatting improvements for tqdm.gui
- fix display() inheritance/override
- add tests
- add documentation

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210203153822.25077-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-tqdm_4.51.0.bb =&gt; python3-tqdm_4.56.0.bb}       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.51.0.bb =&gt; python3-tqdm_4.56.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
index e4510ad44..d4baf6f22 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
@@ -5,9 +5,10 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT &amp; MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25">&quot;file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25&quot;</a>

-SRC_URI[md5sum] = &quot;b188c2dc7802c19b262971e566c265ce&quot;
-SRC_URI[sha256sum] = &quot;ef54779f1c09f346b2b5a8e5c61f96fbcb639929e640e59f8cf810794f406432&quot;
+SRC_URI[sha256sum] = &quot;fe3d08dd00a526850568d542ff9de9bbc2a09a791da3c334f3213d8d0bbbca65&quot;

 inherit pypi setuptools3

+DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
+
 BBCLASSEXTEND = &quot;native nativesdk&quot;
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

--------------BE2CAB937C822C6F2C597D84--
