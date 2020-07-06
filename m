Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.80])
 by mx.groups.io with SMTP id smtpd.web12.60464.1594049746860981236
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OvvGenuH;
 spf=pass (domain: windriver.com, ip: 40.107.75.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrIfQld892yBoveJjE9G+3hK58K7YQsU1WgywnsU6hnv6plZbrnQlNZoG93JKp7vFStgmFI8ZQIKs9N6ftqgRZ8XAmQiefu7ZeQHKPpBWgErvW9xf49AHcemXf8f4bf1igsftPJspTro1832yAxJidHbyh/jDJT5LrqFkpuamumm1W+InH5rT+05TWVyGIFBChfUtt85KINnFXrrb09ugsK9t6WlCATANazUlcI8PHumFXz12v9/efgwuDC26+90/uyXUMWo7X2qoj4eJeN6rlFekgI4+DKBJo+W6eoyGNhtrc7m22j74zNOnmLgfUiCY/mZgLrjz2ShhDSmA7VhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Td3lR2i3HSwyvQ49OdvbPVcgbkUE0cQqnWyP5IoAmc=;
 b=ELwv9abj79j2Xh52y+dJZMR6LUs6SpYG5kFIKUiBnqXxq3VZsJ65gN0fQlIUWltQingeRRM2yRPw1hUhK9qssEFs/kU9U+2BGotSZWvYO0ag66rbpRTZ7u5WDiMGi70QS+Oy5V3hjEAMRc60cIsLigM1UjFVvp/tgiQgDo4BQG9J+BwUWMVFKbPHJZW1vn1qUThSOoouxZREseqmgDxqxkwSBeZI2UUyEOUICb2L8DXgejuTKJ8xYQDFTRKZTokAi5hyH+SV79bKZ7Si3coByqINyelvpgGlfl1NACLBKxG3p9KxZpwdc6drHmMqp74cCfJS3QqlyshSjDYFGO4ffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Td3lR2i3HSwyvQ49OdvbPVcgbkUE0cQqnWyP5IoAmc=;
 b=OvvGenuHwBWhSMWNo29Q52dPuhb/3DlU0gLvDwRytrHcaK5s6fqV5IkOCcb05tjegYaW69x+smmqbw0P4l3blKFhHwL2zK9S7JBctRGMkGluvsCacNaxmauYoYDonXbQpPUR/G1dIN1+CvxjXYvo7PSCdQhHsORiIcrp+JqRsmk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2827.namprd11.prod.outlook.com (2603:10b6:5:c8::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.20; Mon, 6 Jul 2020 15:35:45 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:35:45 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-pytest: upgrade 5.4.2 -> 5.4.3
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593586888-23124-1-git-send-email-wangmy@cn.fujitsu.com>
 <1593586888-23124-4-git-send-email-wangmy@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <eb7afa52-282f-546f-5774-fc3cba77e458@windriver.com>
Date: Mon, 6 Jul 2020 11:35:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593586888-23124-4-git-send-email-wangmy@cn.fujitsu.com>
X-ClientProxiedBy: YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::30) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:35:44 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb0b2ca1-e3b2-4d3a-072b-08d821c23f5d
X-MS-TrafficTypeDiagnostic: DM6PR11MB2827:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB282767C03D125CBA8662318B9F690@DM6PR11MB2827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qThVGEn256qVSXUhUSg/tO+T6zcLR5KV7Jvfsm77w/fpJuIT1ZEKwNWVsHGnq3XnEzudZHkG3zcDRyYU1Cap5mGowZHz3IqtsbpN/GcN3pqKV/UM2HnMmY2zUeARsKlOfEghu//egQaV1yn3WktGHTy+BL7JCOdHosQ5qe5IWoapn3TcH+3UVW9ByqkPYrv+aXvBbYi6u5BnZZ3RvUGSazcF5HTOsUTCrKvcgna7oEob9kS+fdXGqLdlwk/7fnLShtdu/+Fnv+0PUfsNqHu8jdr9fHS1uHUGwzc0ZPNIb0EZb5MmB83t5E+oPrOIuRMV6agKicIpFZAX89l/cUl7lAZjqcZVGgjqIfbsLXSAkf6o3xqcRCYYSditJ1JKMNXhVJvYIwqnxfBLJ1Yk9Cewe01y2Cnv0ak21odJm39Xk6aBjmI0cnZCGqQ+ozuUH5sQ1Tg8ZInW8eG5qMj4xR14lw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(366004)(376002)(346002)(39850400004)(33964004)(8936002)(166002)(52116002)(316002)(6486002)(36756003)(86362001)(16576012)(83380400001)(31696002)(966005)(44832011)(66556008)(8676002)(66476007)(66946007)(26005)(186003)(5660300002)(2906002)(53546011)(31686004)(956004)(478600001)(2616005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lLfXueLuUq40hDThM9BP5aQaypCDuhhaeU9+U+bAc1Bxh2RXOcp5tMrESlo9LICHRtAVTcO/QMuHytw3bDqJ+XPWNthifE88CV4Sh6x8bJRiFEzji8fSMTy+BuGGpy+z2Id7Lr2yr7m2ehmveLanK3M0CkdQ3uof1YOJdrw/q0SMS0Pcz9SVPFjpL5bZJyWr+6RZ0GdAfzL+lglXKkKVHjy9qljeVLMAS1dEmjACGnM3GSfe8XLKvxi6SnqHfREp5xsXO6ENmYv/M6j96sA2CypLzSf2gepGUgBJ7ud1cj30inFaQfz6xmmCS0miMk0ufFR+mnNFPXjdQ8umThiIB8jLhTaSFIo/xmVI7m/0NlwNiy1lKb/+F0XQvFMGovy8juC2yPbPQYFoE9xgzJkVYQ6fdBUg7PLvvXKfLyu1rep2wvFEYwdAnw7PLkngc1rAnOPTDhej50yhaS08Fvv+h9y+tTeLZcBepaX7UQ8THu8=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0b2ca1-e3b2-4d3a-072b-08d821c23f5d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:35:45.2263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CG1zej/APDx/qK23hoP+GcN/cTkNvwVGHfOwKbKYBEklpAX3hbbH9wL62h5ARaVSvSKjSIxRSeHWLjlQdPmL1kuRv3R2FnslcuGQnyCu5Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2827
Content-Type: multipart/alternative;
 boundary="------------B20C210C272D14B74AB78DC0"
Content-Language: en-US

--------------B20C210C272D14B74AB78DC0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/1/20 3:01 AM, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pytest_5.4.2.bb => python3-pytest_5.4.3.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest_5.4.2.bb => python3-pytest_5.4.3.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb b/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
> index 9258c21ca..ca67223db 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
> @@ -3,7 +3,7 @@ SUMMARY = "Simple powerful testing with python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
>   
> -SRC_URI[sha256sum] = "eb2b5e935f6a019317e455b6da83dd8650ac9ffd2ee73a7b657a30873d67a698"
> +SRC_URI[sha256sum] = "7979331bfcba207414f5e1263b5a0f8f521d0f457318836a7355531ed1a4c7d8"
>   
>   SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
>   
>
> 

--------------B20C210C272D14B74AB78DC0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/1/20 3:01 AM, Wang Mingyu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1593586888-23124-4-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@cn.fujitsu.com">&lt;wangmy@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593586888-23124-4-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pytest_5.4.2.bb =&gt; python3-pytest_5.4.3.bb} | 2 &#43;-
 1 file changed, 1 insertion(&#43;), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.4.2.bb =&gt; python3-pytest_5.4.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb b/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
index 9258c21ca..ca67223db 100644
--- a/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
@@ -3,7 &#43;3,7 @@ SUMMARY = &quot;Simple powerful testing with python&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b">&quot;file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b&quot;</a>
 
-SRC_URI[sha256sum] = &quot;eb2b5e935f6a019317e455b6da83dd8650ac9ffd2ee73a7b657a30873d67a698&quot;
&#43;SRC_URI[sha256sum] = &quot;7979331bfcba207414f5e1263b5a0f8f521d0f457318836a7355531ed1a4c7d8&quot;
 
 SRC_URI_append = <a class="moz-txt-link-rfc2396E" href="file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch">&quot; file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch &quot;</a>
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B20C210C272D14B74AB78DC0--
