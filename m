Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.60])
 by mx.groups.io with SMTP id smtpd.web11.27507.1611149628831355869
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Aq2RrMAh;
 spf=pass (domain: windriver.com, ip: 40.107.93.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IV5VJHOA2GONimEGN5RVhlDIEmSBRuB5VZnQY3liuLZ+ODwVyZox+QoKOWLDIXA9pRbfynF+FmqtpXE2QNqKrByvX0dTZ6H8PND5YdhHV7WxVMam7xP5jCjwUOB/GQ/dTJ3ZyzcnFxD+GsLG5O/1e957usYg3qEWu8BrSjwjKydyyaFPO47PsegaZIF8wecrdoZfms5SoKR0ChPNrBY84T5n4Im8wDY3J2Oo/mhPD2Kg1R/V9F4xkHqEKRJrMnhY0e2rBUOSwxVTnEzpf9Vi86tBmXk536LAr5N6E1ABUgNzSLHykIb9ffVIdrmrzsBHYJAMlyAaSoXiTSTucDHqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kbnpmg32RT20UcbfmXeJ5z/wWuS23jH+IW/1Q1gPZdw=;
 b=KKd9WrjJIcpycgQsOPP2WxSb4cxmdAKg6s/P1Yh75mGzswUsJI6w1Vvhb+Cp/GzQsSWg9ShyI3fMY0MtB7zWJgqdRtdobPn3+FFtWdnr/7QfpdeoZjQQEGK2qdQQut7NtBLH7ufbLYk6cFlNXwcL9y5PS4AwM9qZ1nKpgYUSnysPlG3o4EwKDsq+3E+GrZAqwCSEuTP+kBScjjt/FJtmD6TZKjlvKQqZ+262Y/g8URol9u+ckuvP8V1XhQXaEMscMbEZOD67moHwMBlW1Q4O0PjrDwyvamrGU16+MR+0gY78yt1HK3g7xtyj03BawRgyXkjl6hshGHV22VfLzKQ4OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kbnpmg32RT20UcbfmXeJ5z/wWuS23jH+IW/1Q1gPZdw=;
 b=Aq2RrMAh+YoZDNe9IId3fW1jF/4CHbwHiq9TPN4WGjlkjM4MqjYOcLHtbne3NiS0osPeBhtIYUWm5zgm/1tcSwAA0IZPEhbrapGciDJRGWufZ/hHGD3QiZ964zQfq3uDmaew9HNeKUW7A4+8ZxQkE0j3uQ+Agn42Ij4iV2HHR0k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3190.namprd11.prod.outlook.com (2603:10b6:a03:7b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 13:33:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:33:47 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-snappy: upgrade 0.5.4 -> 0.6.0
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1611069895-4653-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <64dc2843-67bb-9a6a-67ec-6795659376c2@windriver.com>
Date: Wed, 20 Jan 2021 08:33:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1611069895-4653-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:610:4e::36) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR02CA0026.namprd02.prod.outlook.com (2603:10b6:610:4e::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 13:33:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2958269-a8e7-4af7-47c4-08d8bd480408
X-MS-TrafficTypeDiagnostic: BYAPR11MB3190:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3190F80847D70793C7B75BDC9FA20@BYAPR11MB3190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G1ICKJtDXoJtVu/WrHSet0dvhJTJ2xFokEcD3cXkfeAEe7/H3J3G+yYCS6AV+rczFBd/w2xKyjRTi5Lt4g+c2lBVg0Ndg4GraokR8p+9mLDkhlFbZoYQzbq3BPkFWd9vXhl/GRixTg5PU1q4wLfG1DxtIdcNtXx+axrrPScH9JyI3FZh7Cr6AxkInvDsxUoaIDzuPBuuvw1FgrDcUOW5rqVajJPt7JD0/mijR84R29gp67arVYYC8R069mEokuKCReDRFq2vDwTTjBYadNvJgKyMar6YnilIAT8pe05aHO0vDxjVh6hG2AfzoUtLxJ62rIg0NjGjJ9ghz78PoOVY7RLnNv4bsN80c/uGsIu87gsm18/4USPD8+E87ZU98f0kiCqz7T3Oav29x+W1nplMIy6i8QdFv07aYlFXDt9Z7pk9T1zIqNk3f1o+g64Q4b9ukdtASSdWJp+6lGGnUfsUs4F29KIi7MI8Uw7HloKY0QweTRdxIdXjNnR1nrC3ZAaLjmVl8L2GnC2B3xcDXHcQPrB+37zv+A2x+sBVmSC13/M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39850400004)(83380400001)(6486002)(26005)(31686004)(166002)(16526019)(52116002)(44832011)(478600001)(186003)(316002)(31696002)(16576012)(2616005)(66946007)(2906002)(33964004)(36756003)(53546011)(8676002)(966005)(5660300002)(66556008)(86362001)(8936002)(66476007)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MlpaMzBpOFJwMWp5WmhDRlg0Mko5ZERWeU9XYkliNFlVbnNTbzY2VG04NHRZ?=
 =?utf-8?B?K0xYZUVYbE1yb1o1NEtrVUU4ZnhMdEtyay83WGNibWZOK0ZjdU5DQVBYQytv?=
 =?utf-8?B?eitHbXIrakZEZ2ZLazc0c1NtdmFZSktSVzB4VE4zVFNVRnJlUkhyK1dZYmR0?=
 =?utf-8?B?dUNsaFNqeHBqT0NpZk0zWjcxdUV6NTFWcWo2aWZYVTFNU3d2a2lhWHorU0ht?=
 =?utf-8?B?Wk1pYTF2d0xkT2haRFFCdmlQdk9vMnI3Ull5cWo1UTJqZXRpcmZHVVVRZXc2?=
 =?utf-8?B?bURjanBXZmFVOUh2ZzJXdkY2WXNLanJETlI4dHJIRGNIWFdadjFTdWtXcjE2?=
 =?utf-8?B?QmVqM2pWQnpIRkV4OTdGN2pyYjVnSnJhN3IzaVN3d1N5VzduZ2NhM2QyOGRn?=
 =?utf-8?B?aHVSL0JoazhEaHpOeDVXYVljWHphQStONi95UWtEMG13TVdLZytNb1V2QVZM?=
 =?utf-8?B?NkUzbmhRZVo1Yjl0Nm90bUZ5ZWJPMFNEaDlpQ1owOUdNWVpqRUQyRTNjdXhK?=
 =?utf-8?B?cWJmYUlkVUJaREFvNzh6MHJlN0VrWDQ2WUJ2dXpscHpzMlRheStrVDNINi9s?=
 =?utf-8?B?Vm9FSndaaGxwZWJOYkJsWlMrdXB2em94Yk5oWEU5Zk1oZGFqaU4veFd3UGd4?=
 =?utf-8?B?bTNsSmg2WEZ0US9rUzlTL3JBb0JVOXBYazdDRnVoY25jejJsTW8ra2J3Wkpx?=
 =?utf-8?B?MTNhMzUvTzFVN09mNmVFSlNOZldOdldTTnVUdUhvcWRzWm1NTHE3c3dhdTM4?=
 =?utf-8?B?eDYycm1RWHFSTVFianhUQ2VRc2xodGF2WHJ2K1k4MTRFdUVHSXNYVytqV3ZG?=
 =?utf-8?B?VzZqREVtMG5CWk1uVDJ4MkI3V1Z4Z0xRMzNoeGVkTGhPeFk4ZTJMRkk5Y2s1?=
 =?utf-8?B?L3Urc0lTbmRpUHB2ZS9BUnkxbXZRL2hMb2dDVUZVSjVkNGJ1TUdnQm9BY0JL?=
 =?utf-8?B?QnJDMXRkaE8xMi9vNjZEWng1ajdTUzRwMmJtVm9TZVViYTJpOXNjN1JUOWI4?=
 =?utf-8?B?UVZOY0sxUGNVUGlNMmZKS3FlSEhxbzlDUk45YU9kbURYSGpJYUZkNHVRL2ZU?=
 =?utf-8?B?Q2RQMUQ2bGM3WkV4V3ZUbzB3RUtPRlNnUVBvNExaTDJjRFZLTjB0SHB3dks5?=
 =?utf-8?B?NVhZNXdJYWlrVFY3VlRMajZXNkxqOTk3UWVVSCtiWDRoNmRJMUpPRm1lWGxn?=
 =?utf-8?B?RUNLVGI2L2x2Y2k4QUFhbVN1M0JtRXRXdDNjT3Z2R1dlMURkdGZVOEk2RTZq?=
 =?utf-8?B?Z1pwSExPWHJ4VndvN0NhRTB2OVBpeGcvYWFlSmlGc25LcXdxWGF1TW5PeE4r?=
 =?utf-8?Q?oFx1D3cq8UWaqQp6JxOAMsX1hbVe07XNxH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2958269-a8e7-4af7-47c4-08d8bd480408
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:33:47.7370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g34MgdQ9f3LHOjhFQQEekOuL9OXjiBsTo6BBGgBdliU1A8Ui+B3HOG7UniL7S1HwfajSnzt/0w/D4JwDHv+IodSscjChw7DUqvcqNBWtpxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3190
Content-Type: multipart/alternative;
 boundary="------------5102F85FD0E15935AE148DCC"
Content-Language: en-US

--------------5102F85FD0E15935AE148DCC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 10:24 a.m., zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-snappy_0.5.4.bb => python3-snappy_0.6.0.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-snappy_0.5.4.bb => python3-snappy_0.6.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb b/meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb
> rename to meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb
> index 1836473b8b..64787feecc 100644
> --- a/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb
> @@ -4,7 +4,7 @@ DEPENDS += "snappy"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b3090152f53ee19f6a7b64b1a36384fb"
>   
> -SRC_URI[sha256sum] = "d9c26532cfa510f45e8d135cde140e8a5603d3fb254cfec273ebc0ecf9f668e2"
> +SRC_URI[sha256sum] = "168a98d3f597b633cfeeae7fe1c78a8dfd81f018b866cf7ce9e4c56086af891a"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------5102F85FD0E15935AE148DCC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-19 10:24 a.m., zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1611069895-4653-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1611069895-4653-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-snappy_0.5.4.bb =&gt; python3-snappy_0.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snappy_0.5.4.bb =&gt; python3-snappy_0.6.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb b/meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb
rename to meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb
index 1836473b8b..64787feecc 100644
--- a/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb
@@ -4,7 +4,7 @@ DEPENDS += &quot;snappy&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b3090152f53ee19f6a7b64b1a36384fb">&quot;file://LICENSE;md5=b3090152f53ee19f6a7b64b1a36384fb&quot;</a>
 
-SRC_URI[sha256sum] = &quot;d9c26532cfa510f45e8d135cde140e8a5603d3fb254cfec273ebc0ecf9f668e2&quot;
+SRC_URI[sha256sum] = &quot;168a98d3f597b633cfeeae7fe1c78a8dfd81f018b866cf7ce9e4c56086af891a&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5102F85FD0E15935AE148DCC--
