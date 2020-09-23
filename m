Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.65])
 by mx.groups.io with SMTP id smtpd.web12.13121.1600866664197667988
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 06:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mMsQV+ls;
 spf=pass (domain: windriver.com, ip: 40.107.237.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRzWqTOFEw2atIX/bxK9I9PyXw5bJePAACGodKUJhAZdES8IYvhZf0YQTbz9R1qQGVzzomivi75km4iVuparhNZRyH5AOJteZnYFOstu6QO2Y6ddJXapK0/cFrDmio3Kj0Lf2He8tV29NgwsFhtGAURd7BT4Y07Gpnt6eIq/o1x3TXMK8yyktD18gmNKA4n9yxbk1yruT3tsTRxAvqsBpZUJmBckZj0IeKrmMrOwvH2h92z5/usUN0UkJe18L270e+wHxYdr2CZ5HPjhZTmdhh9rt59GnhXb6yCQLoVJOgRJhsYDe5Z8W3lp+EDeEnETR0wmdJGeeUHXjxyCSKnkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOgBbnmop4ojkmdqMcJ13y123hnvZ+y/4hLtKmjFrMk=;
 b=Api18uMYS225N1G2n2gJrVjAlIUdvxBY9xomS4CdDXv3PGKbR5nu/jqQS2BOaCcnpmvpTMpwOfogF056UCLua3wwJVVo8JiGagJA1u4HPUd6zUGF0R5brNhoJYAce5Rm6cNRzUfW89M5kbX2nCeo5U7XPixYsbSpMBMcuds1g+6InE28QYmq5n7fTbyCgto99H10SV4T8KyBbvAyjpopdS4Cy5GC3Alhj3bRhvkRD1g6jr7e9Rqnx9ZmRzWJwlOpV1fVPGk0oS3IUs+kyEe+XbLaLRRnr1b/1p7V/ncHBOQrxnF2YFy0jkBm35sKMh3+9p4FfVCIKZsYFg3JWIoGLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOgBbnmop4ojkmdqMcJ13y123hnvZ+y/4hLtKmjFrMk=;
 b=mMsQV+lsm3cPBh2IjwNYw4aD5kHkl9yNko0/xfa8WOVOGNhpx870XT6M0OGAaosNhouqMwFRPMCtT9JrDkV4I7vL0+4GCNQAHoh1se6mSHqFDJEH5QyR5O99vEJq/jUVYqB+ErkNTTP/Qd0QQpr/p/KbyYdwyhCp9OvNupX2d/o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 23 Sep
 2020 13:11:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Wed, 23 Sep 2020
 13:11:02 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-luma-core: Upgrade 1.16.1 -> 1.16.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200921134405.676-1-leon.anavi@konsulko.com>
 <20200921134405.676-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <915aa19b-6c90-6331-1fc6-bdec7b63f986@windriver.com>
Date: Wed, 23 Sep 2020 09:10:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200921134405.676-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend Transport; Wed, 23 Sep 2020 13:11:01 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68de1588-670e-4143-a153-08d85fc21f02
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB295264676124159DD6D5F21B9F380@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d9Uw/mBqfzIFjD+oTd3251JBCrDKivdo6UNuvaASJGXySL1cYZUeUyZeLRW8JD7wMiR0ak+5xkxEW1ZVFhdBnnKEp4lAo24dMfHFU5F6q0KQr3K3XR2arwUNgmHxZzUKOpG3ja8F/EP8FR9PYH6Jw3i+TvQDh8OwbqxHdtyGGszGCzn7IxkZTFIa4pdfytLA6PIJn5nSTkpgXoHFag28TMCKdw/vYaMrlDro0fK3btipIytATB4585OaWrv6xlHS3/ot59x8GKYuNKrkhubdC1D6WOd6QH7hX+AuxqEHNzE6IsRx6W1OA44VpfacDk1k/NeZrPVYrmHhGe2IrJoa54ZXOZ0kq/zgMUtQ0tWGCcP3rcmApac/nZZ3UJPsYshiXD5v0QFJEApXD6YstSUC8D+c+LomLmvbs+hoTMpeOgXb3rt+25yy6Mk4MbkfVUrO3E0Ni4Wk+J63+b5rKOuIQQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(52116002)(2906002)(33964004)(26005)(53546011)(66556008)(2616005)(16576012)(66946007)(16526019)(44832011)(66476007)(478600001)(186003)(5660300002)(316002)(36756003)(956004)(31686004)(83380400001)(6486002)(966005)(86362001)(8936002)(31696002)(166002)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	It4NetMu1NRk5UA4w4KPe0O0RP/WRrmgW3wMrFrAVCtEQ/eaEeVab8Edu+Df7+nt7KbESvUixLPhTZ7StSQU8ZLoRkIPem9X6CKQqKvvz1pVQbURBa8CeWLUq8E/6Vw8xKM4vrLtuFRKqezv3ZzKdZ+DM9epesMTkmWWofkuErZqUNab/aT2vSI5Ky4/R2up11Tx7bDmvR6jajlBCrIgtDJnTdzu9x1b2FwChLZB7DECsjc8d3zLvhuP4baZl8MfpTMFa+OOWYmik8B5yT8jzR5+j54t8Brdefb+//+s5hiJO02ccO2PbpIUl7C/7BkKGywE/ViFJk7kjDcHxU995ed7wUj9hQU1VRlQzXsVwyWcKUcv0My6ISOiz7N8Eurj1UhSsBUbBO99t9GMnFgflTKVD/v4O21lNWd7uykku1D8KJaexNkkgiFinwRHskWl4wepRgBtADTbpdzllxB+hDQFggyauBhQF+vLgzo3JSEzOndW19ijs2vTk53bSVQAJYx09ZXrIVKhJ/FyVrJLvMkOO33yVpyLhEyXA0RdB2iElxPVRxUv/l6Oxoa1po4bWayVEqsbQ/8jUTll+iRw84bdzUi72ZcgLnq1kn6cNWr+zCoFxZI6rtFP5foIsppVbrcoCFFFP0o/2Tx1BLiPLg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68de1588-670e-4143-a153-08d85fc21f02
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 13:11:02.3124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/7ppX/k+IsUDcqUD5A3lB66bGbpSV7iBkKah3UmxFHwWL9aKdD7/y+DR3bxE7eNa5wUOxik4gDNDCP0OA8AfVhAaWIccIBHxG5O686q52E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------07A276DF62FDE4E99D26F1EC"
Content-Language: en-US

--------------07A276DF62FDE4E99D26F1EC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/21/20 9:44 AM, Leon Anavi wrote:
> Upgrade to release 1.16.2:
> - Added new parallel interface module
> - Renamed parallel class to bitbang_6800; moved to parallel module
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-luma-core_1.16.1.bb => python3-luma-core_1.16.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_1.16.1.bb => python3-luma-core_1.16.2.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
> index 3428dbe9f8..e8a61ad062 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "de7bda49c4146ba242923a88c587cd7a"
> -SRC_URI[sha256sum] = "2181a60906fea3104dcfa3923f9654928502cd7541ff9b4d76c6ae29c6a9d9fc"
> +SRC_URI[md5sum] = "8889ee9eb95c3441ee65b4b5f4a022eb"
> +SRC_URI[sha256sum] = "518fe4e3286a4e2a75788713a58de403e6bba6d4c909fa5ce0fe14aceb05b85e"
>   
>   CLEANBROKEN = "1"
>   
>
> 
>

--------------07A276DF62FDE4E99D26F1EC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/21/20 9:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200921134405.676-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.16.2:
- Added new parallel interface module
- Renamed parallel class to bitbang_6800; moved to parallel module

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200921134405.676-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-luma-core_1.16.1.bb =&gt; python3-luma-core_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.16.1.bb =&gt; python3-luma-core_1.16.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
index 3428dbe9f8..e8a61ad062 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7">&quot;file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;de7bda49c4146ba242923a88c587cd7a&quot;
-SRC_URI[sha256sum] = &quot;2181a60906fea3104dcfa3923f9654928502cd7541ff9b4d76c6ae29c6a9d9fc&quot;
+SRC_URI[md5sum] = &quot;8889ee9eb95c3441ee65b4b5f4a022eb&quot;
+SRC_URI[sha256sum] = &quot;518fe4e3286a4e2a75788713a58de403e6bba6d4c909fa5ce0fe14aceb05b85e&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------07A276DF62FDE4E99D26F1EC--
