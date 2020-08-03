Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.42])
 by mx.groups.io with SMTP id smtpd.web12.6715.1596491045833473410
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nyq0tFLB;
 spf=pass (domain: windriver.com, ip: 40.107.220.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcJDO3TZ1oeUUWV40ZWzYFKMOzOwc21QQPUrQ1wDl17GSIaj2/KNHFfd9zzneajrtfw4yshu3FDt87l3kWxes0CppcXN9SO2b/X8COJoYtGno9T9fNEFjA2s8C3+NmqR/ziIwDvXY2snR+OTfZIheYfvG89pFjsv32KoZPqmoHxZ25t03MuM5Zg5ELx2xH6e63xKeQzK2XAzt26rLy3W1R0TdBYJqW30jU56KDRA3ymDenEFk7XnIF1Z4fOSafhhKpFxVFWqfERFhbP1xmw/+JduZgrL+2XneYn+UZySe4pJZQRFSY8mnSae6YLd4vD+IwiL8i3Pl76MTHtrHtczhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo35XV835H3RKKozUmsBFYPJOJxons1YwyrvioGdDeM=;
 b=fKQcYdnv8Qy6O8D/nPK9tagcEhd+aQNB3/swSYIuL4Q1k7QoSh8Gw9rTnJoHvYUsnvgBgyze/Eugjk9qgfVcRQBm8hKBQn2MaH2FVQ28lqQJJBuLrG4Na4tL9zjmbbrsmSyfF8qj5ZcMTNAeTKC8lVCRzkGWl/SNT5f5DSNSLCDTxvUxcWnvm8OK67dB5pwH3BJ3M+3ETb32tgMrCyocYEEQBrXScTwb3kHB2E4NR6oQ/l1EEqIPesDqsjZ2GVvEMiPcLrCi/egUONYBhpFz372rcNk3loDutAk4CB3+TwxJd9yOd6rO7lLbPdvEhcfidK7o9r4B2jrXZdabaG5d1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo35XV835H3RKKozUmsBFYPJOJxons1YwyrvioGdDeM=;
 b=nyq0tFLBebo+SWMBsj25c1OPHusIhJu7tTYp640/0bJG6n/x7gqriRIO03utOtmd2BXR2b5Cz7zcgVolg222gyDeHPwsRgoTegS9D2R+OjnsTa3Iv6baBaB9/kLguuGggpiY43C2tHL4Ytcy16JUZXhxV/pYSIkVwoxKvxLlMco=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2677.namprd11.prod.outlook.com (2603:10b6:a02:cd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Mon, 3 Aug
 2020 21:44:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:44:04 +0000
Subject: Re: [oe] [meta-python][PATCH 05/15] python3-pymongo: Upgrade 3.10.1 -> 3.11.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4c58fec7-bd81-4b28-28fe-e7e3ed3afc9c@windriver.com>
Date: Mon, 3 Aug 2020 17:44:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend Transport; Mon, 3 Aug 2020 21:44:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8f5655a-7457-4d2b-a0f2-08d837f657ab
X-MS-TrafficTypeDiagnostic: BYAPR11MB2677:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26770A63F9E5D4FB98AC9F249F4D0@BYAPR11MB2677.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FJmTazRPDzX8O5+l8mEoW0HKr7CfkuBSNz+eoGB8Uro03SRRkQAyeS0XwinFqfBezSL7IYnz4fA4FiLpLTwtE7vJx9V/X7kBKhipd1dqFCfhdmTrKQOPVeEV/ET77LZ0SDreIyJX80oIDCpfo8wzvcFnx7GKlpw3eJGAC5xWMWmo2/kJhVLxo7ZJanJOyTzch/0pOvbHl1qCpDQ7ZJuYd4Gkpij8CqnRPdPPL1bZCYCnZt1znZQxbLtaUDCbOazYqf4csEU8svR0cuBRWHggfrg8tWoErxxJLcI2Hu/ulOCLtCgv9mD9FDxImLgLusRwRdoEkhrkGt3+9AlPjxYg6O9acKsrAPvbMtTrLqarVpCY5Knm1nheDr3YUXabcaDOyYr94BO6gaMry7bFs+mnF3e11YWGqcCxsdX1IQaqhBGXS3tvdpvwOMtDRekB71Nz9/3m56rAp9DfR0HpAdNGrQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(396003)(136003)(39850400004)(21615005)(16576012)(316002)(44832011)(83380400001)(8936002)(2616005)(956004)(8676002)(966005)(86362001)(31686004)(16526019)(186003)(6486002)(36756003)(166002)(478600001)(31696002)(26005)(33964004)(2906002)(66476007)(66556008)(53546011)(66946007)(52116002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	3ra/PwMqecblhgqrm9PPoI5XxTY157IbMALJSknj5kPC2TdCX0guSBoYG4EIa9hxzrpciBYV3MBdHtDPTcirqhS9H2aDMqYBLgUh3R/5rvwiS9H2lqEmaIGU91FYikGalxGqLl41GHD0ggmulILthMpUwnU3Y7oPWi037ndhSyxGlR3jfdqFwFeMkPYUPPVLLzLKiXAkYfDyf9dvrng5khG7iGwMN1tl29hz6BCyf/PRdFzt9WantWU3WFDiEM8hGn1J0+6r/BVVgVrxaooL4PIE/x+HMikq+IoYTqBp/rq8MakllK0VIe0Xt7trl9n2u3USPDIYHukaYyHWQ2rGhWjH9nzRGWnNYCez504jkxD3cTTP7HSRUp6RRY0Osug98D42+emgJUmr1G4osED7Ybq8WmDs2iYq4ybMey51bh9qwv20Nnts/hTwhAcCK8blAplDoJ1l+KQXukRiBdpY+UKm+q+Bod3yddnAQieYl0Aab/83mTV0NMCZvYaqVbjqk8T5hGYjkgxfXHnEM8OCxg3iispJi9Fl9Ks23WJZYQ/wTOvDueJiS35NvSRYGnZIMMTUhnZ2R0pMSZLFmfLTAVnIKPoQs7VlVoKIeEIMcKzQtfV5ioFC3G0niYObMz9Y2duRHQGhpMGOr3la0e0WRg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f5655a-7457-4d2b-a0f2-08d837f657ab
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:44:04.7821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAuvk8LHeKfyJGQoStKhh8+l8Y7CG85/PNZRWpAIYyxIyRQK+HYvLPeQ9r6DfLhME4x2ZYOmeHuR1lRzZdOflt2pQrQCElMfzm+AHsCb0oM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2677
Content-Type: multipart/alternative;
 boundary="------------D0A0E6D3BE8A7DA038A01D4F"
Content-Language: en-US

--------------D0A0E6D3BE8A7DA038A01D4F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 3.11.0:
>
> - Added support for MongoDB 4.4.
> - Fixed a bug in change streams that could cause PyMongo to miss
>    some change documents when resuming a stream that was started
>    without a resume token and whose first batch did not contain any
>    change documents.
> - Fixed an bug where using gevent.Timeout to timeout an operation
>    could lead to a deadlock.
>
> For more details:
> https://pymongo.readthedocs.io/en/3.11.0/changelog.html
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymongo_3.10.1.bb => python3-pymongo_3.11.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymongo_3.10.1.bb => python3-pymongo_3.11.0.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb
> rename to meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
> index f69ca53cf..635de22d2 100644
> --- a/meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
> @@ -8,8 +8,8 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>   
> -SRC_URI[md5sum] = "e31b9c0190c9eaf1f792d0277b2a8ebe"
> -SRC_URI[sha256sum] = "993257f6ca3cde55332af1f62af3e04ca89ce63c08b56a387cdd46136c72f2fa"
> +SRC_URI[md5sum] = "5d166c8f9500c83314deadebb95b6fd5"
> +SRC_URI[sha256sum] = "076a7f2f7c251635cf6116ac8e45eefac77758ee5a77ab7bd2f63999e957613b"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------D0A0E6D3BE8A7DA038A01D4F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.11.0:

- Added support for MongoDB 4.4.
- Fixed a bug in change streams that could cause PyMongo to miss
  some change documents when resuming a stream that was started
  without a resume token and whose first batch did not contain any
  change documents.
- Fixed an bug where using gevent.Timeout to timeout an operation
  could lead to a deadlock.

For more details:
<a class="moz-txt-link-freetext" href="https://pymongo.readthedocs.io/en/3.11.0/changelog.html">https://pymongo.readthedocs.io/en/3.11.0/changelog.html</a>

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymongo_3.10.1.bb =&gt; python3-pymongo_3.11.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.10.1.bb =&gt; python3-pymongo_3.11.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
index f69ca53cf..635de22d2 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
@@ -8,8 +8,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/mongodb/mongo-python-driver">&quot;http://github.com/mongodb/mongo-python-driver&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327">&quot;file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327&quot;</a>
 
-SRC_URI[md5sum] = &quot;e31b9c0190c9eaf1f792d0277b2a8ebe&quot;
-SRC_URI[sha256sum] = &quot;993257f6ca3cde55332af1f62af3e04ca89ce63c08b56a387cdd46136c72f2fa&quot;
+SRC_URI[md5sum] = &quot;5d166c8f9500c83314deadebb95b6fd5&quot;
+SRC_URI[sha256sum] = &quot;076a7f2f7c251635cf6116ac8e45eefac77758ee5a77ab7bd2f63999e957613b&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D0A0E6D3BE8A7DA038A01D4F--
