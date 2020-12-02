Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.51])
 by mx.groups.io with SMTP id smtpd.web11.5443.1606918222960336410
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QuyYjslh;
 spf=pass (domain: windriver.com, ip: 40.107.102.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HD3FhUfxjds3UxCyIkwW/YOMGTpolPicoPR7DsbLKfXZvmFpwuKRwDovOkPIwVM5EA5vEgwyzju96/UWNHrCBc/7mNbLronM7lHX0/Hapsh7ueeclLGGOgUccXaYZdUgJi2Wjvf/9nKYMckYvyGH1Mo4u8RnG6z0J5hvlbgOKBdlqaX9ivgZryjEW4UgFhy66pTMtYppuTjYU3Cz1BXSDEMMGX79yV4e+VHjiVpcBa7d8bLeyYt1dWo2ETqkzskJR6bRg2J+sIGOg2PLNatla7GLGzfyYevxQ01uQkIHmllfkwySu/1l4vKXzJU3x94frFP+10TnpXqo7jvW9nMZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdW7leKVpciIV5zFsin6PNBMxd+LIOaT589HluF5JAk=;
 b=fptA3gCyeuRcsf51g9UlskvK44JooU4UslGn8P43b5WN5mBAT8BwXdBd/0csnvG536g5EoMr9MkF6+vKiY8KZYRg74zR5Fh3ScUe6FcA3/4H+OVt/hBPJnjJIOpNNwfeM5F93lUkeNteAEkQlKUkztaQDUAMhn2N0OpUnlTDDqI3BsG/6IfvavGIAMR3spsGvlc/wz1NlJPYk3KeOk3mt7ejCi4tSKIB3tJtx6rpp9NffXTA5zRHC9+CWE+6KjQfBRV/PuCIrIXoiMC9tKFAko6vrvFQ69kAvK4Q+5I737SfozurUro2bYSrGLMHkr9MPbwwkrtL1IHw75skkSRVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdW7leKVpciIV5zFsin6PNBMxd+LIOaT589HluF5JAk=;
 b=QuyYjslh+RiqUdNejAUrF41yLK5BuGGLl1/txJs81q7JfmqOOP2egPFt8G0he1+Zpy+/bD4jQDETg/J87GKODp9nOhiu/pJY4FKdwJVAj38A8MWw2TWq59sCdvPmQnOmYVPIQPG3emrROEeM24ks/+JEiRzoX9wlI5Y9unRL7cY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:10:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:10:21 +0000
Subject: Re: [oe] [meta-python][PATCH 08/16] python3-setuptools-scm: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <fe8128df729c4ffb236de0f6644bc2830eb9f431.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4d014907-f3d3-a65f-b209-86ebad6fb65b@windriver.com>
Date: Wed, 2 Dec 2020 09:10:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <fe8128df729c4ffb236de0f6644bc2830eb9f431.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::47) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:10:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c15afcca-f0cf-4286-9f43-08d896cc015d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48642247F0DDDDAD2E9F85C79FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z+WVQYkAzQZwzL2PEz2RkI3AelAb/Ubyk4U+0NSuPd8JYruVb0L1kVY3ErTMfrd74mz+BYXk30/cTu8jIGkKdmvVR6pwdINiGeowl0iyRUGeIPyxwQnDbkCzgcuhYSw9sQJIUbtKj5g03m28OJSHCUbZlOcFKcGJAAFfLtJc+KqwQWEcQX2U7f85e/D6aijSh+ZC9ZhRAJs5IhcD8QbmXMD1l0KNRLh9lH589ntZbT/t4WvnTS5vJO3xjCqchx5PIXvhsgCQb1vXFcbrNst9TXD97TM91Th/DF5Ni1XLGGK9iXmUuaO2gbDq71SoBGwwZEQ3we1Yw6lu7q0mSeRg27k2cOT3BnGUn5Ke4c60UZUcAbjcY82uaQ3R3hLvpHFAk6G+ilKI4poN8VLkd1UMWfAfta9RUO3zNRX7HIcEy6nizUshIE8GeVqCFZ5RFd1Z3wE4YT7vnT1PsATO+T0v8Z/m7cwmtOlWSVmlkASHN5Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?K0dzWG9ZVDNEaTJCMVVkUXowOXpmTGltRzZDSXVvREh4ZWp4NVdhM2IwQ0lF?=
 =?utf-8?B?MlJld0JNaG40bFU1RCtCS1A1SURvVmh3aHduSTdzdlJoT01yYkc3NytsSU01?=
 =?utf-8?B?RXVYUVZvMFAreTdsaS9YaUZOUE1kditGbTNvZnNmMXVXNmZXWVhFdEFjdUhM?=
 =?utf-8?B?aCtpM1dnRm5JZWt6bnV0MFdJVmFZd2Q2dTJtaTVrMHV5ZE5KQm82c1pjcU1Z?=
 =?utf-8?B?Q3FiTXF0cVNlTlpKQXJBdEJNb05TMUJURXNjMHpCTDQ5TEExSkVqTHlPNENK?=
 =?utf-8?B?SnFaaEZkbGF1Zkg3Qk5ZTUJTZ3RQY3QvOVdlRnpJMmcxSmhBT1NIOEdLck9v?=
 =?utf-8?B?bzdYTFJmb2Y4UnhQSm5qYkNUZXo2VWxzRnNnOW9iVThYcnB0U0VBU2JmNVZm?=
 =?utf-8?B?NXRlVlJjNkRPTExacWhCWW9FUDZmVE4yTHVxOVZEOFlmZzRncmRRMXdHUHNi?=
 =?utf-8?B?MElkZlNVak1kVTJuQjBxNFg5dWtUb2RFanZEbitPa2lsdmV4YWVDTFVUZEJl?=
 =?utf-8?B?eU5leDFseU8rMnBRTDhQTTFLOWxaOTJQemVrNytwRmdyWkNZNkFtVHpRdlFo?=
 =?utf-8?B?QXY3QkNkNHZGMktpUkRjRGRCWk92SFA2V0pSb2x3Nk53clFRNlRPVklBZ1NR?=
 =?utf-8?B?c1d1YzJsQjRXS3R4Rk9vcXltSmtKZDdJa2ZhOUhwVjlxMGxpNG5ialZXWita?=
 =?utf-8?B?ckFkNzJJSi9pSlZEcWpqaWpoZ1U5RDBTYWV3VDZmdC9oQmRrQllIK1ZybzFx?=
 =?utf-8?B?ZUxQdldJWXFOS2k0ay8wSi9JajFCWFRPWEVzSUUzNkEySGZNalBCWm5sT29P?=
 =?utf-8?B?cDBFczh0L1BkNWY2ZFpWdzRJNjkyTnFUVm14eVh0Mk9ndlVwdVE4blp1NGdI?=
 =?utf-8?B?V2ZRYmI1VzZUN0FpZjM4UGhqZWlDeDJJcDM4WEx4b3ZyRkNRdnZDajdueUgw?=
 =?utf-8?B?T1NSWW1Gd2xwTkVGeHRqcjJCSVVYdTN5NEtVUTFtbE5BM2ozR3pSNTBKOUpr?=
 =?utf-8?B?ZFp5eDhCUUdROVZJYzg5R0RLWUZGK1pFOEhNa1RnLzlwYmFTMktYZ2RCL21m?=
 =?utf-8?B?L0I4aW1jTUIxWFF0RkxZL045dG5PMnExNHRtY3A2RFpyOHBGUFlXOG9yWXdp?=
 =?utf-8?B?dmlQaHkzZjRCbTJqbUtVbGNSMnQzQTFFVjNPQzRBbzUwYkVMWDEvaXZZb1pU?=
 =?utf-8?B?bm9DK1dsSWRWb2UrL2YxQVFVL2x5dUR4UGJ4SnVpa0RTbVcwQVhuRzhtWWdy?=
 =?utf-8?B?NDA5YzVXUllHMkxIdTkySHBpSWhTOGk3U3N2RXpEUTBIeVNOc1k2bThxWEdj?=
 =?utf-8?Q?zjs69CWlyUw2PicBvWr5wVtw5wKpDfzVJL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15afcca-f0cf-4286-9f43-08d896cc015d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:10:21.8050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6R/5fncWor39ncqtj7cwMkNbTB6fdoeIn0k9Il/aUsR0rKnhK89/959O15vwUyDhpKYQAkOymZkRB+eo4vBTyq26mOzMALXzwxdXo9lqx2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------63A283A33BE970DEA155D9E5"
Content-Language: en-US

--------------63A283A33BE970DEA155D9E5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-setuptools-scm_4.1.2.bb    | 21 -------------------
>   1 file changed, 21 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
> deleted file mode 100644
> index 4ebbac6b65..0000000000
> --- a/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -SUMMARY = "the blessed package to manage your versions by scm tags"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
> -
> -SRC_URI[md5sum] = "e6c9fad17c90516d640868eb833d5150"
> -SRC_URI[sha256sum] = "a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8"
> -
> -PYPI_PACKAGE = "setuptools_scm"
> -inherit pypi setuptools3
> -
> -RDEPENDS_${PN} = "\
> -    ${PYTHON_PN}-debugger \
> -    ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-py \
> -    ${PYTHON_PN}-setuptools \
> -"
> -RDEPENDS_${PN}_class-native = "\
> -    ${PYTHON_PN}-setuptools-native \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.0
>
>
> 
>

--------------63A283A33BE970DEA155D9E5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:fe8128df729c4ffb236de0f6644bc2830eb9f431.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:fe8128df729c4ffb236de0f6644bc2830eb9f431.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-setuptools-scm_4.1.2.bb    | 21 -------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
deleted file mode 100644
index 4ebbac6b65..0000000000
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = &quot;the blessed package to manage your versions by scm tags&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489&quot;</a>
-
-SRC_URI[md5sum] = &quot;e6c9fad17c90516d640868eb833d5150&quot;
-SRC_URI[sha256sum] = &quot;a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8&quot;
-
-PYPI_PACKAGE = &quot;setuptools_scm&quot;
-inherit pypi setuptools3
-
-RDEPENDS_${PN} = &quot;\
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-py \
-    ${PYTHON_PN}-setuptools \
-&quot;
-RDEPENDS_${PN}_class-native = &quot;\
-    ${PYTHON_PN}-setuptools-native \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------63A283A33BE970DEA155D9E5--
