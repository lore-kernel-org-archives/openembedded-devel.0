Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.60])
 by mx.groups.io with SMTP id smtpd.web11.36871.1595250035319179974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 06:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OdiicHQT;
 spf=pass (domain: windriver.com, ip: 40.107.223.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGKVZp/rvIez4GccS7qkHoLKCiNSITehq4UInj/pwwsxVxR+BIiwImVLHFhZheggWppK/YU4MzyJ4VuC/1PHHOwbSLLPF6BGOOPEgeDoM22iJ8mpFQB5oGAneR1LjdiJSLBqkRrALQg2rhCFuwNuYdz21PJfyNkwy6TSEi82YINgS/Rd2zC4o6r1uIIB6O6GIMuseyWrKul8tEorlNRbBByWX6xUQSRxjivvdl3fy47FJBrZZFAz+op4moiGVRNyB5YbnphI7WgNNQRdBbAO/6qZ3TysDcnFqE9TmvuWKsraIFtzj6beWDDzg9PIatlrVDZDVUk06xIZ1jjyP7J5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzWB7ljcxRdF6OYRUMS17pFCOFMCNfPXCAFf3OC+UbE=;
 b=og/V3zLkdNjk/d1uZAuW2eDq0bUEUTlGU/OOp81tNFNSuelWIH1ZZWyxI0uSKh3gEXSEcYB8XTa7eOGY9Ipn4eXYlxXb7PV3iATPdKKSgtHkkJMfFmxavJxDTb3lfAGWPlZMIfxOWTIqmrC1wW+s4CvShrO6SeShXDY+h2PbqBDacfZchg/W+MN3fszt51z9dGs//BaeqeZUHLpyj1LllvXFIpcJs/s1B/sc/MDbvNe/mPGFO7Kf9FdyKZKDsK+HGcsVys+Rq3qVwU3mzqDAuTMdAFmhxkF/XYg2YoUfpd0Q7hmvFF8aIUfyT/hFg69H+V/utpYGKApBL6aySpMsqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzWB7ljcxRdF6OYRUMS17pFCOFMCNfPXCAFf3OC+UbE=;
 b=OdiicHQTTmWmba1bZmYSPvdQNgJyo36B+RvPIuHRXrDXP7WmyImLAjHazYuYVbU1hWs3kVSE4HlmJrA1k7St77/HKSykU5kXcd1qzpRZzWLeTxV77zT7u4SBZUR8zKOjj3kj6wcg2L//Kc8Pp2Hm3pL/3XGAG91u4FSQR2xmme0=
Authentication-Results: xevo.com; dkim=none (message not signed)
 header.d=none;xevo.com; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR1101MB2120.namprd11.prod.outlook.com (2603:10b6:910:1e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24; Mon, 20 Jul
 2020 13:00:33 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 13:00:33 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-packaging: add -native version
To: Ryan Rowe <rrowe@xevo.com>, openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com
References: <20200716231839.48850-1-rrowe@xevo.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ffd17222-7874-c425-7984-ac65fe0176c4@windriver.com>
Date: Mon, 20 Jul 2020 09:00:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200716231839.48850-1-rrowe@xevo.com>
X-ClientProxiedBy: YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::30) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Mon, 20 Jul 2020 13:00:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c027b8b5-7680-4393-ae8d-08d82cace338
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2120:
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB212082BF288097A9BFDB3B6C9F7B0@CY4PR1101MB2120.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	auZlrf0/eCN8Btz52+lkJ1jy6lUVUbkhzXaEq2CfPG938CHRIz1jepNHYQwIOfyI7wH34dZQ/5uSz40tQQG1BRo0EhD/O073Prlw17Mql0N1L5brRJJKSquBsNbfapAEB5SxnV3iFaZUSp7H8S0vJlTU19gblqbvwo+aJonpxeD2wHRtxxQWwJCoDK9xAanHjd6fU71ZJnMZUhi/MtyNX31CkUOfhYQdz0yzAQ7AUjPPhfAHt64rEiBuCQVBfr7vOaxDMcdKB6u4Cnp7FSgq6CC6HPBzrtvcWCdFWs46mcWTDuwfSB0KS4Qk9+9o99eA8xlFE+9/schLeSLmCFKXX01Wh4tKxQ5YaZY+jS+2en0A1dESh/mWWoPA4XUpAZGHV4oiHUX3BWPchvMGozgImseJMh/OT4sDvEuowd2J2QTch5F2sRIoag4uJLD0foA7M8UyrVxRFrgq2UQ06XgAow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(376002)(39850400004)(346002)(396003)(86362001)(36756003)(16576012)(316002)(5660300002)(2906002)(6486002)(66476007)(66556008)(478600001)(26005)(186003)(16526019)(8676002)(53546011)(966005)(44832011)(33964004)(8936002)(66946007)(52116002)(31696002)(956004)(83380400001)(2616005)(166002)(4326008)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	f45t71dObjfxG8+jgFqlRAZLUd1bL9qcjyuCx7918mWXnPI7p6LRrNiJMHJTNVY20E4sEXyT8iIu/UOwid/sbKuGUZk9zoKJuzYxQq2CgggZHfjMOje+S9Wnb2yPYnOtyaA70r3Z7EG0fi5RNu+sy2w9dmeUPhEj/B7lQS0Lz8RdDchErICHZ7IYek5ABr2Sk20P2sz86iYh7ofuX2XfRrKP+342eSUysQXGzp0paYAQUpSV8mNLtQlBpc0q1ujRyiqbjz0mk4FIbfvnzCTs7hezNb7Dw1PleD1QJePiVVssac1MLV5E0ADk1/MgKsGaGnxlQtF32MZ3ZGq6881UfTdKpR8fyFekQelwJcC1c8LwSd+8A00fBkfnZYTvV8S3EGd7ju5+yUuDQmb7uhoO5bapT4X7dK7dl4YlEaKpl+VQIhrSLqe3SSHy/Ha/FkYt09RJcEdy68XGcRUMutA/sjhT4e6qJHnG/8jIGK5lEpPA906zPba9PEv0/MPSq1M0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c027b8b5-7680-4393-ae8d-08d82cace338
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 13:00:33.2793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQ/5zwUyaS/HJ8L5I2UL8bA8kxBvg/KSTcsk/0yorff5Z5UzJQh1WMj5GulxGka2AshnB8eeuOIXNUbw71HE63TBxf2/QeI+Qe1rVMsah5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2120
Content-Type: multipart/alternative;
 boundary="------------0B4CB1AA1566DCFC644FDA4F"
Content-Language: en-US

--------------0B4CB1AA1566DCFC644FDA4F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/16/20 7:18 PM, Ryan Rowe wrote:
> Signed-off-by: Ryan Rowe <rrowe@xevo.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-packaging_20.4.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
> index 0f78fd016..c75707e69 100644
> --- a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
> @@ -8,5 +8,7 @@ SRC_URI[sha256sum] = "4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d55
>   
>   inherit pypi setuptools3
>   
> +BBCLASSEXTEND = "native"
> +
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
>
> 

--------------0B4CB1AA1566DCFC644FDA4F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/16/20 7:18 PM, Ryan Rowe wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200716231839.48850-1-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Ryan Rowe <a class="moz-txt-link-rfc2396E" href="mailto:rrowe@xevo.com">&lt;rrowe@xevo.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200716231839.48850-1-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-packaging_20.4.bb | 2 &#43;&#43;
 1 file changed, 2 insertions(&#43;)

diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
index 0f78fd016..c75707e69 100644
--- a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
@@ -8,5 &#43;8,7 @@ SRC_URI[sha256sum] = &quot;4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d55
 
 inherit pypi setuptools3
 
&#43;BBCLASSEXTEND = &quot;native&quot;
&#43;
 DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-six ${PYTHON_PN}-pyparsing&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0B4CB1AA1566DCFC644FDA4F--
