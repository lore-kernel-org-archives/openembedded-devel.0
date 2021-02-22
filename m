Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.58])
 by mx.groups.io with SMTP id smtpd.web11.34274.1613999877252776144
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 05:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WnWR/KNk;
 spf=pass (domain: windriver.com, ip: 40.107.236.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEmd59LAnI9Ezeigw1qS5pzyeaz6lFiaQwAXlmnQvrUbI4NeE7bEKJSqmmD92Bg2GDVNgHzA53lYYzHRthcbkKl+P/tFd1HsegWH/M67thKShoB6/8YYnWNrTkbvajC0GrCZICSRJrsp9mdp0zooXhnKAXXoinOQQBaPgKHPBC8eixlHzQxr0wwB456qus5y/HgwqwGtVlHlkNsJn9tVfUbdLS7FASyxgEHJ4EmO1b+KMZR9xPjEgyrJ8sKrlNGnZyK2vivK5DGqVcLGOEQuimabDtOCGUhkptwj2XVA7UfmSdeW/ksgVdwJk6oXHiUvypNjVCZrGgRaLuXLC99KjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5dSxG0iX8Hqeps/eK71DFoSlVNFvXEaMKZ8klawiUs=;
 b=LEDAH4ThB32KztaeNTL2S+Z9iYMX9I63xP8Zi+/+6t8F0kZ7DaGbuih7E7IFy6O89oe8fbuZpLyAw+QSGP8M7yqLqB/i9+I2FyucBKeresPq1287I5jlyiC2quro9hCumJPgLLMGRhB/OaH8G9OKWdOJxCwzFaGz+ABaOPZ16mfBXZ+3SSJ+eF1aBSJDWVl7HDWPEh1TWkT5FTA4rkSzsn30rkaEYVkbARmJ4rxiDTdINcJY+2hNyNVpY9S18M7QcYLG7WDLFEpHYc49Uk1/cIjFWBhmz/P+QW4uvy0w1f02OFqn7Xz7SwBvKmRveEfpdeC+UcagMAxz2PjOf5ol9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5dSxG0iX8Hqeps/eK71DFoSlVNFvXEaMKZ8klawiUs=;
 b=WnWR/KNku0EPcTHvLpxFu+VhprBYDa8GjzpHIM5j98DcfVXeZ92vesq+VS9sAju1NdTONjfl4DOEiUqsktnO1oNKpjx0Yk3Duowp58m6GP50JGINQFSI7tXbUk76/w4nZs/ZRGNI+pkv0CdCd1yO8ab9Ub6ix3gWHvQI4U5+wYY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3975.namprd11.prod.outlook.com (2603:10b6:a03:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Mon, 22 Feb
 2021 13:17:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:17:54 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-xmlschema: update to 1.5.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210219215327.2367368-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <008e2a5c-cf58-6bab-386f-6a084ceeffe0@windriver.com>
Date: Mon, 22 Feb 2021 08:17:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210219215327.2367368-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0024.namprd16.prod.outlook.com
 (2603:10b6:208:134::37) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0024.namprd16.prod.outlook.com (2603:10b6:208:134::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 13:17:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbe1e8b9-8080-4467-1354-08d8d734433c
X-MS-TrafficTypeDiagnostic: BY5PR11MB3975:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB397531509D6F2ED73FFFD6F69F819@BY5PR11MB3975.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	crR518XHgjXCqLdXPBp4kHOTXkMZ6TEd7P/uRJQ5voirt68F+f4HfBf9/UleQZAEUDxkA6vpoGKLhmiZfHEQVvcV4O/k8ZtXFWiJu/EV53HqjobQjtvM1oqP+D/fKDcTt0ogiw0EWO1feY6UEcIQpIYFXPLS0Q+dJyAikZvEa4sWY/uulv0+cdOMseD66SNckH3FaL1uyRbCJ6dzKJA52FyGsG3JPu65ZVsJrKbib50/zS+XWl0yihWPnviU6w/A6I3qFUUNZChCS+Dj/YGVvKxtBrFaSNVXbTrx4WnJHd/RERkwhIjSJBfD8PwCiuFBBZmfG2u3V2NaAwmCBB0TAv7Z1zMFU+F9aCEp9b1ObZZD5TjaStEbrO4IeVt4PvlWDJSFw32j5EeQoYVU6MLok4OJyiCR/CDECDh18P4C8hPUQkRfY2U+91itZRUMWZ7Mtoq7EiXV+H9W1K9vdxFx4JM7X9MtzkGMmLAWj9W3ZauCDuXqf8rrYg9ZKaSKGyNHSNQAQv5xDvascnIWh205U9IQ+DgH8NKvlvV3oZh6zA77BaiRQZ4zW3VCjUngDNgckgi4RT/bFqjMF5/1VBmQ4qO7LdtqjvW9m0cZchSFF5vYtIjuyb6KyEgSkbfaMQBEdXul6wdgaMJqVuCWsuZ6M4LU1QsGQMI0O1AcBgk73AOFC4UFPastXnm6FHrCKVv9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(376002)(136003)(396003)(2906002)(83380400001)(478600001)(53546011)(15650500001)(16526019)(956004)(66946007)(26005)(966005)(31686004)(66476007)(66556008)(186003)(33964004)(31696002)(166002)(8676002)(44832011)(36756003)(2616005)(5660300002)(316002)(16576012)(86362001)(6486002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?T1lxdCtKdEh1NFYvanlIWXNOdzByNnNJWXhUd2RWMVNrZHhIMUxaQmYrOVJM?=
 =?utf-8?B?cUsyK1RLSW9NOWI5Qk5EUS9JTkR5cjV3OFRnNks1Z0VpRWg3dGRmQ1lTSUti?=
 =?utf-8?B?MmQ4NUhtMkVhcjV3bXczSXVUZkhVRkFHTVhrWW8wdk9xK3NXWm9iZGZsUW9a?=
 =?utf-8?B?MUhTNGgyR0M1RUFCU3BjODdwSVFpVFE2QmNaMkMrSEx4cXhrekZ6WXF6SlZh?=
 =?utf-8?B?dGFoVlNmS25hMDRYblRtSDZZZFljOWNyblZHeG5jWnZ6aDRoTFZ2VkhtL1JG?=
 =?utf-8?B?dXdpTUUveml5dCsyOFhsUzdqazVOTlUzd2pvT0IvOWs4a2UyRWczaDg2OTR6?=
 =?utf-8?B?TmVHSGl1RjAvUitrV1dlSENuRDhLU3NiNjJFZ2NScGMwNDdoWnNhdFI3V1Iy?=
 =?utf-8?B?c3ZONHZSRWhOcXBQTFJPSVRqeHBSYkNZKy9odld6bzYrWVFZeXNQWm5zNTdB?=
 =?utf-8?B?RjdKR2NzajBwMEc0eURRbG0ya2YwM0IrT21BOFAwUjJpbWcwcmZqeEZHelBh?=
 =?utf-8?B?RHJzYXQyVytQZE0raVorRGdNWVpNa2JrTE92L0VJTmozZFREMitHWDBvTy9z?=
 =?utf-8?B?MnFQcmlRR2dTMHNDNlM2ZUMyZGpzRjVFaElHazNnUWVWd254UEJtaWtLekRM?=
 =?utf-8?B?R3Z3eXlNRW9IMEdzOW5VWUlIMmpUQXBOeTQwUUwvSFU5YkJFK2xzUTdnQTJt?=
 =?utf-8?B?Qkh4blY0VlBJNDE4NnVPSFBrUkkrZWJOMDVlNVhmaTRnVGxFU09HejQ5TVBk?=
 =?utf-8?B?QmM3UHdzWnVLMjAvaDZaY1FKZko4T2NDcUlPRUoxN1huaTBGT2Z1ZlFYMElm?=
 =?utf-8?B?bEMwclBWUlBiRjdlZTl4c2NKeTRSR0xhVEtSU29FN1FvNXRpSS9hUWVaa05V?=
 =?utf-8?B?emNONnExTEQ4UitpaEhNeUpQOFFyNzdITnBwZ1YrOSthTUV3YlREYUpqVFRy?=
 =?utf-8?B?cytjQk15V0NQQXN3VUZpUzdKY2s3ZW1XdU9XZEhFek9qaVlIclNzeHRJeGxH?=
 =?utf-8?B?L2p2ekdZMk1SZmtVMU1oenUxMkJyQTJNUXFwaFNNU1FnKy84NGRQaEdQd0ha?=
 =?utf-8?B?eFRRKzJQTzkxS3ZyMDRyVUQwelh2WWNWY2gxYXl2QUdZNkcraDRmYlVEbmFw?=
 =?utf-8?B?ZzdBbVVQL3RXdWNzT3kzeXllM0xiZzRXdzFIbHlHYTJCVmxxeDdVcUJMeFNJ?=
 =?utf-8?B?VVF2QndPVWVQTHRSWDRHY0RTY2NJaFJQbkFZdllPTXU5UnZiRW9Dd3V6KzNT?=
 =?utf-8?B?Zksrcy9xS0FrWUVCVTBEODR0a1I1ZGpEemFLYlRENHJ6L1RBQ1NlTkgxc09a?=
 =?utf-8?B?bW9adnRwTUVVZ1hDbnA3enhGbXVBeEc5VWZzTHVHS0hqSUZOT1dhZXNmMEh1?=
 =?utf-8?B?RnZQMGJwY28xZS9UYkNxdjJKN2xXbjhiRjNvZW1HRmQ3dVBVSzVTRTV5WVJH?=
 =?utf-8?B?V0h4eERMNDNjTU5pcytBdXNReWtjUGNUcDhVSVRwSUZjY0txdFJaTE05YzI0?=
 =?utf-8?B?cFFsNXNpSnI5OGJLZ0hZRjNCV29CcW9TTHltYjFJYmo0V0xBeEx0R1hLcHJ6?=
 =?utf-8?B?L241aGFmc090U0NFUjM2eGxBWldTZExpdFdDcHJNc28wdWpwQWFjcjU4LzJ2?=
 =?utf-8?B?Y2tQaUlPUlBGazVRaERCNTY0di9RS1VYOUNFNHhsQ2JJNkxCTkdJOVBhT2FS?=
 =?utf-8?B?RDJWMDBjUDJLWFZPOEpHdFdRazQ3SGVCTm1xeDhIUVRraGRTMTNQbit3ZUUv?=
 =?utf-8?Q?jtPNpeZ4gICk704vMksInK1xraiGPsXhjjZUMko?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe1e8b9-8080-4467-1354-08d8d734433c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:17:54.1015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NHfPo4Pxf3TkdRfxU/89BM6x9a1qsE+MRw11jThjhDQi5h245m3xfq989mcVyN2Pqs3A42lEFDcLh9UHP01yCaiA5OGkPCJnnG+AdIJv28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3975
Content-Type: multipart/alternative;
 boundary="------------AFC2E3B500CEFAEBFD5B42B8"
Content-Language: en-US

--------------AFC2E3B500CEFAEBFD5B42B8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-19 4:53 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-xmlschema_1.4.2.bb => python3-xmlschema_1.5.1.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-xmlschema_1.4.2.bb => python3-xmlschema_1.5.1.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb
> index 055a82d4c..bdb15971b 100644
> --- a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
>
> -SRC_URI[sha256sum] = "f372005d08dfc231ce7f001c3a7a2c7f7ae138295349268bc551a9df3c700b82"
> +SRC_URI[sha256sum] = "c4c72b457865f46394bb23525b4e233d6537d9e97b8c6144a6cda2d5ef0d6688"
>
>   PYPI_PACKAGE = "xmlschema"
>   inherit pypi setuptools3
> --
> 2.25.1
>
>
> 
>

--------------AFC2E3B500CEFAEBFD5B42B8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-19 4:53 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210219215327.2367368-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210219215327.2367368-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-xmlschema_1.4.2.bb =&gt; python3-xmlschema_1.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.4.2.bb =&gt; python3-xmlschema_1.5.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb
index 055a82d4c..bdb15971b 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/sissaschool/xmlschema">&quot;https://github.com/sissaschool/xmlschema&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f">&quot;file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f&quot;</a>

-SRC_URI[sha256sum] = &quot;f372005d08dfc231ce7f001c3a7a2c7f7ae138295349268bc551a9df3c700b82&quot;
+SRC_URI[sha256sum] = &quot;c4c72b457865f46394bb23525b4e233d6537d9e97b8c6144a6cda2d5ef0d6688&quot;

 PYPI_PACKAGE = &quot;xmlschema&quot;
 inherit pypi setuptools3
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

--------------AFC2E3B500CEFAEBFD5B42B8--
