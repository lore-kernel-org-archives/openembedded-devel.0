Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.41])
 by mx.groups.io with SMTP id smtpd.web12.42083.1606165014047772286
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fI9FKIu+;
 spf=pass (domain: windriver.com, ip: 40.107.237.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iF33dH2UzqfnX8+3EbrfgtzBVPuanf00ZO8y32fElmd4631+e3OOFt226T72w2FLwspRPvEopcC2VKtVFKe3x2+6U1Xw7+f3KOK7NwzJy5i2xg6EZJQUEpaloYovsB4/wWPeYDgKwGrhBf2iZdQFadbkMz0dwcDQTzMx2ltyzrJileESTNP6ceQZMeIIZ27L/hUJYh2d8+yKEb6lJIhoE8IxUcUfol8T5MlqyfoDx++WLLdOOKJRE5lN9BzfWv/GvldoCAXGvO6YWlQHH3UAiTSZEUfJAf7MXxA5RIXIaDNA/bxaxk3NVPsdadJTQUdtK+uXA+oh8WOR6E/VwyeeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wSNxf9J1XKwDakR4o5mwPZrclIHI22PuCO5XdRvM40=;
 b=DVnM7tNCXNHYuk96t8NGpUnsBg2Eq0wYfL5UMK3FFvo/pMuXssILuuAIWiBNttRTZEvD277+Ln+sTz415XYegtOvPXV2CTKkNRw04/enRRuPDMnrm2UdWxVYoQLVyhJmynOVGB0ZaMxz31V5q/cZtLHDQGTOH2PL5kTmIzXRXx9oKmyhFCb0Kjyz62SCKcg6COzmk+Kuq+Mj72OzuwcLSWXM5+PSRn+uqZ92+Bm2x+GWmk6IVLLmRJf00ZzuqI/zxAXjDUAF4Dt2EDPIMVSSyvDC//inttFZHVxnlh4lOU3YlEnk5BujWASFge7aGoAj9fRN6cUDnhJWkkiPqN04yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wSNxf9J1XKwDakR4o5mwPZrclIHI22PuCO5XdRvM40=;
 b=fI9FKIu+YiJ+M84DVBdLAvop8nPAgHuhDmXHLjQJB0H/7AAfsI2lBSvMFb34xOOkAIPcX9RcPu44kH8PH1qVnGzc6i4IyWMPU4sBRs/owuFafPWJeB77y9BcdV/Xe0/DyuqB9WQqy4FPq4gb/SaIH9yBtP7zXEGLARmEkh1jwiE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2678.namprd11.prod.outlook.com (2603:10b6:a02:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Mon, 23 Nov
 2020 20:56:52 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:56:52 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-diskcache: Upgrade 5.0.3 -> 5.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201118140220.29364-1-leon.anavi@konsulko.com>
 <20201118140220.29364-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c1ff33cf-6bd9-7f50-6bd0-feacabc53257@windriver.com>
Date: Mon, 23 Nov 2020 15:56:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201118140220.29364-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:56:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4083ab5c-1e56-4c5b-2e7a-08d88ff24df3
X-MS-TrafficTypeDiagnostic: BYAPR11MB2678:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2678B5B9E453F5754EFCC8D49FFC0@BYAPR11MB2678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JNi0DmjJD/VniS4qcvpOpTKJelzo3Pu/XiKAvtQtmkTwH3djiLyivbjFEOy0pxMNKulSzd/FeLHFvYDwMSlEpZ5wYSzTGaBQDdE47CcuNzHG69MAAB7CbEjPq4mS5PzTb0Px8CJtR5wPktpT42zDXQCjG7GJTs+64pjV20+I0o5toMfpfAdedzWT/Jydo09JkzpirAPj12BHr8EZP+mGmItubLpCKk8j/91HjVE5dKOye5PR65K4KPF5EunGjwfZUEX7LVSJSjOCkmo4MOlQ5QwPWCjtcFuxPiUEWGwyAh65SRb/i+y2zm4qKnqMyjvNDxccJBtt85V/VVCMZLCY6upT6ffPTmDa5M/zQlNUz3qfCthqYK01GVdwJ+3DsoQUpXukBlmDo+V6vdi0V+LRHvNM4PYWnlHroQVfgv4dHL/2ouq21ywlbaoL7s2TNCULazEkRYWDhtqDHoFOA4TDhA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(2906002)(8676002)(16576012)(8936002)(83380400001)(186003)(86362001)(36756003)(26005)(66946007)(166002)(53546011)(16526019)(316002)(31696002)(6486002)(478600001)(33964004)(31686004)(66556008)(66476007)(44832011)(956004)(2616005)(966005)(5660300002)(4001150100001)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/4OFfSEJB/BM+Ijmzmsrx/lKKafz6JBwACJMlZE2ISowjPuWeC1myTP0s0uAMHhy4siLbK+JkxfDkg22Ix1nNHzKW7uWRjTFKKelN34HFdW4gC3bVvCNRIbX+vbwAynn3+2NqG5srVt80lrVeY+2XjW5ZqsnLVKbiWDI3PsPcvRUu/bR3aWfMqxqYVf/w7efV5cPxzfrrtESQcFWKGSr27AJtid3j/SwvHI7ag/bLhGcZ2B81WjHSPH9x84u1johCVG+0E7JzMxc3Qi85u/uO1DAq46UIFivyuqKUziKTsI0WA89eCHdVVT8vgUuN4wMfY5O2CeUdR0GfK39XWzz+sJhWv8LPOFXxOMOOFI2aUyPu6q9nUl6paBg5dE7uU+I8ST7oMuiHKe3XJ3rc44PzJlpKSRn2r7o/+5mCkDojWZBDIDaDmIRViDS5ep/6dMjQ/HIE8g1GYq+NUKzHhnDPMOLWocu2QRh4AGRRuBnZYSYGmBWtnrbO55wOSb4L9yNA/D60X3GDNymqBv9TJ3p+q8EF9aTctlypqSHfjRfqIUk1XlybcvVPpe6JPPRmwkcA5JCvz1e2gdbpWDzEdf9A71DmVSWVqg3AjUQCMQuKvXZgUVxsmKwN4O0IaRDdNl04mU29afvYwRhGS7fzEqHmjcgmvNnHysT6nzXmDy5bSa6HKdCP2rYUrRUmFpXRVFRmeV5T9HPgDJBnxV86zHt9mxsLWeROsVjMDeJSRKQeWcf9ZM7lwYY6qJH1wox8QLRU6gKUawmfSJLkQEN/2JkGrRzWAcKQozrI7hJc3sc1kj5Lgl9PN9Quh3M0H+PGFrLcIcfST8MbApWymGg+BsrpkYHJOUHOOSo0pwpVFlaI38bMJIatopM4OkKCR0U7tUVBG4VnicYhRwVDxVc4PnaCQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4083ab5c-1e56-4c5b-2e7a-08d88ff24df3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:56:52.7844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTLIIdY6txGcYChR7gaFHiNKtirusYutQDsxkuS4vREXVDq9zNfMMCAc78NmGDhls/mi28uCJx+3UcK1igZxchujfO/X4dA22Dv7eztEDQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2678
Content-Type: multipart/alternative;
 boundary="------------21D6A115EAF47B62CCC93C9C"
Content-Language: en-US

--------------21D6A115EAF47B62CCC93C9C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-18 9:02 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 5.1.0:
>
> - Support transactions in FanoutCache (probably a bad idea)
> - Prevent cache shard attribute access when unsafe
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-diskcache_5.0.3.bb => python3-diskcache_5.1.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-diskcache_5.0.3.bb => python3-diskcache_5.1.0.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
> rename to meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
> index 7e89fa68a5..9aaf714034 100644
> --- a/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68"
>
> -SRC_URI[md5sum] = "86fb97b0ff87cc5f1b31654ee0d341a1"
> -SRC_URI[sha256sum] = "5f4bc2018d653a1d7bbdcdecce45ea12061bf8d3b5f0323b7a5402054a285c52"
> +SRC_URI[md5sum] = "9ce87661369752c9ead63243b07eaf19"
> +SRC_URI[sha256sum] = "bc7928df986dbc8a8d6e34c33b0da89d668cfa65e7fcc91298a6959a35076993"
>
>   PYPI_PACKAGE = "diskcache"
>
> --
> 2.17.1
>
>
> 
>

--------------21D6A115EAF47B62CCC93C9C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-18 9:02 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201118140220.29364-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 5.1.0:

- Support transactions in FanoutCache (probably a bad idea)
- Prevent cache shard attribute access when unsafe

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201118140220.29364-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-diskcache_5.0.3.bb =&gt; python3-diskcache_5.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.0.3.bb =&gt; python3-diskcache_5.1.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
index 7e89fa68a5..9aaf714034 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.grantjenks.com/docs/diskcache/">&quot;http://www.grantjenks.com/docs/diskcache/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68">&quot;file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68&quot;</a>

-SRC_URI[md5sum] = &quot;86fb97b0ff87cc5f1b31654ee0d341a1&quot;
-SRC_URI[sha256sum] = &quot;5f4bc2018d653a1d7bbdcdecce45ea12061bf8d3b5f0323b7a5402054a285c52&quot;
+SRC_URI[md5sum] = &quot;9ce87661369752c9ead63243b07eaf19&quot;
+SRC_URI[sha256sum] = &quot;bc7928df986dbc8a8d6e34c33b0da89d668cfa65e7fcc91298a6959a35076993&quot;

 PYPI_PACKAGE = &quot;diskcache&quot;

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

--------------21D6A115EAF47B62CCC93C9C--
