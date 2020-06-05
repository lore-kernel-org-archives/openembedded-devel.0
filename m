Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.53])
 by mx.groups.io with SMTP id smtpd.web12.1029.1591380938374578831
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 11:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mJuUqFFJ;
 spf=pass (domain: windriver.com, ip: 40.107.75.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5UXY6JUgwhx5hcoAv1op3pll6imS6GGwSTO09/xd/H16grqkBTQ0huxL8OKor199gFIJX/PujutuY+J0Q8+03Teunx0pIGrunMGgm6HPLGeCMkUEBtC96VT0NFZQt2mkijYUWA2ZW6ntcvN50tuX7fG2hXcszEy6r+g+Vg/wD9ADWM1n/a/wJLoTK5e/dJ6834KAY6ICdly9r0oUv+hjQpXRzCAgl1aw85Dmjdh74g2mp0PoG4pmRbCnnUfPRYxDOs0j9tJQE7QJjA1JsnDnXFYrypdTk1GhLljKUSisFZYkEHOZsyEywOIt7YTZpZMLkIgGCocD8HyqdMhlTByLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9KXRoXZ1K8O5m4k6s3VxQ9pfqd0K1C+b5OkC2Mw1RE=;
 b=LHF2ieTRwoizqiMUqGWCmnDSFRW/O2omS7427mwjl11o0EHUpDU2QgzGosAfqkK3S2iR0tC8NOptSu1qG0UQIltpxNgxsctKawJzu8mAuxn/H4sHJzrSpnyaE6XUn+KA37lj8uheiZUEBr8McUMNKz/sXyZCjbOMNdAdwzdMoCb9S9dDN1K8kQgBbh75VS2ylgmzPxF2rk47CSL4vO2iAgD8G3GObXRQ65ZQ+8A8BZpOOXZIRD5cnSLV6q+QZqASm6ew69Eeq40rpG6PCRVNgPJX9OC7PSsOVyt2xmPOMYfKK/CKGbkCQQnZvatRhvNolxQE7wqdbF3SLgADeLsV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9KXRoXZ1K8O5m4k6s3VxQ9pfqd0K1C+b5OkC2Mw1RE=;
 b=mJuUqFFJfK1em+hsJPYDpvvXsmF4YtA82xv8+a0de9n6Unf3uski+n5lTNzdsi4YkAHG5YNW1wBIxSBMjSJe/q1nmcimS1yZA4Gtb4gf4o1Qsfz64O7OdRclzhug2DAbw2D03SRvjoDgs3pnXMc/wc5JJoPMfMmnYVBlLuVmVNQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1236.namprd11.prod.outlook.com (2603:10b6:404:48::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 18:15:37 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 18:15:37 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-webcolors: add the missing rdepends
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200605033209.2999925-1-mingli.yu@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4b2b1acd-8b66-28cd-9544-cefd62e5ce9c@windriver.com>
Date: Fri, 5 Jun 2020 14:15:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200605033209.2999925-1-mingli.yu@windriver.com>
X-ClientProxiedBy: YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::34) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 18:15:36 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe836537-4fba-46f0-d589-08d8097c7219
X-MS-TrafficTypeDiagnostic: BN6PR11MB1236:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1236B984FC4BAE1A76AEE1029F860@BN6PR11MB1236.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gIjgHdvbA4j3bry6WfRijEDT8ZdUDCprFhkHRyHMwbD8Hk1NVrWx+u83gm917li0DpTAILyqU7/WU1oVBZEJm92K+5m/YyOWLXsv1ckOZshED3opKmdk6MJpmOhylIL7dFgSTfqIQ43VP4GHu0OpeAntgXr55lUSPu3Q7p/IeBLuN5kX9R+2b0x3M60y9x1r3NphFteLEJbksPczIvsBlwZy+lJ37bQD8zSPC8ZMGvkQ2ErAsnk5xxpVQFCPMhgH4wdqPNnozFL4cHfA3Siid3fNWXmFb23/UGnMr2s/Y0IcH6gknxqw98dAJqp3YFo9A9Z38QmnxaN38Xk9wiALEvsANi9XPbz93t+y1frt3v2voRTk14lWdGMCCNWJdG9/MUC/fltXbiLFgnR++wldpuYpDgWqGc2T+0A7chZqf6Jx0AS1DQbztA27c28qvWXnvDmwM6I+qUITC3mY5kVi+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(136003)(346002)(366004)(52116002)(166002)(33964004)(53546011)(26005)(186003)(16526019)(6486002)(8676002)(83380400001)(31686004)(16576012)(316002)(8936002)(44832011)(956004)(86362001)(2616005)(31696002)(2906002)(966005)(478600001)(36756003)(66946007)(66476007)(5660300002)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YLAeZiJc3vez6j71yXS/zITVFOVFpEaqWk38OSswPi50TBORRJHUTpaGnSX9cag2cuA/XYkgwUY0bJErOcETto2y2LYZXVpfFI7ZKcB/TUqXru0+GmSMOha4nxE3SHo+u6FseRC2rXiQQsm4QIlA/24HRhhbcg78LOx20hOIkLFrTpSYBRiZtNEeffDn//dn7m7O6V8zillRKa0ftksJCvljrp66uoiFXWQwANHU9faomoPdZ1eYg/Siadh2o1A5Y/F/s6RUvU+qtjVKfSAlACF/PsfuATezPMqV1rPEE3TW/84uU3/xDftIm9glqXv+Orx/uPjCoCuEr3WLMuhQXwO8cjOWfdVmWps0hD3tYcUQPBObyoVYQoXbpByY7AwLVW4jbQa3KGCtGqDOYjTv3OQgwMZZs9AR6yZiSSeZKWJlHcJ+UOBwV/CeXvtfXk7L4cfH8iIO7vFWbXysh1yYtHiFCmJ1rbijumV37+xEqz212Aj/XN+sm8M9l65LXlqU
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe836537-4fba-46f0-d589-08d8097c7219
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 18:15:36.9584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s39mm5uw91yUG3oR2zhMBCAVZ+3CiXo7dZm/rcjdTrZf1VfWHlwJlmZM3954j+wC+94ZFOdWGzTlNZKuvyWsGMhFi7jNjG2nxuiHh88WoWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1236
Content-Type: multipart/alternative;
 boundary="------------7F2BF146E7D7C6A58CFA1755"
Content-Language: en-US

--------------7F2BF146E7D7C6A58CFA1755
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/20 11:32 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Add the missing rdepends to fix below error:
>   # python3
>   [snip]
>   >>> import webcolors
>   [snip]
>   ModuleNotFoundError: No module named 'typing'
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
> index e567e0ba2..b950d6f63 100644
> --- a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
> @@ -9,6 +9,7 @@ inherit pypi setuptools3 ptest
>   
>   RDEPENDS_${PN}_class-target = "\
>       ${PYTHON_PN}-stringold \
> +    ${PYTHON_PN}-typing \
>   "
>   
>   SRC_URI += " \
>
> 

--------------7F2BF146E7D7C6A58CFA1755
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/4/20 11:32 PM, Yu, Mingli wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200605033209.2999925-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200605033209.2999925-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Add the missing rdepends to fix below error:
 # python3
 [snip]
 &gt;&gt;&gt; import webcolors
 [snip]
 ModuleNotFoundError: No module named 'typing'

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
---
 meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb | 1 &#43;
 1 file changed, 1 insertion(&#43;)

diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
index e567e0ba2..b950d6f63 100644
--- a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
@@ -9,6 &#43;9,7 @@ inherit pypi setuptools3 ptest
 
 RDEPENDS_${PN}_class-target = &quot;\
     ${PYTHON_PN}-stringold \
&#43;    ${PYTHON_PN}-typing \
 &quot;
 
 SRC_URI &#43;= &quot; \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7F2BF146E7D7C6A58CFA1755--
