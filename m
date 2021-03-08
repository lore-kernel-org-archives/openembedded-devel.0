Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.58])
 by mx.groups.io with SMTP id smtpd.web09.36097.1615212339243508116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Z9pt8O1q;
 spf=pass (domain: windriver.com, ip: 40.107.93.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxo45Hi2eQ27y64xapT+WAjNBuW/dez4uVY0T9vE3jr8DDpxxC4+qX4B80ddpP7KpxZl6JHNmuGAaZqvQVff0y/qdArpcQ08Jf1whXqzu/p+N3j7yEdq2SSIKBPpK5Aa6zjCli6SusxwYjfYuSoWHA1aY3ZL0+vPOH+V/x3Au+a6UcOD8WWbI9tH1EdsVTdAjnWfZG2arYTy23RtbfScnMXzw/392Wfrn4aHBWyTaguQCcU7l1WaFz9qbkNoDZ3mJTPS+s4vCcBwwSIcyzcg6W4BFLzvGwuNdvwcEESRc5BbxSAsfzh1xUH+Uqz4r6pDzGjdmaqRFQ+Q4gkpICC6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsHgKpC9/5a9R2+bMIEsruo0oUpFUh6UEkkzSl3em8U=;
 b=Npzz9BBQmfPBrXExL9G/h9ZFMVzE3iGPfImkw3Sewws1q2GWd1MS3TjhhvB8LwT3ZuMfbWeog4QWRnUGJr9ec7mABjRJ71P3FcXCKSu8+pHGU8kRGr634TP5Cxc360sMtgAH1+VOm5Xwv852CpoxMDzkH1AFQo/n31TqpyES4duhvV1pdilkQ1tUGC2jClA/iUIsV/SwP+OB0tQvbqUK6CowyFti6InPKgruaX7Z6T+lTwf8g7qAZZo7cASqr8tloVv/DGnLLFZ05LyvUwsrXPwEJsMlG6umWg2zsZLaIS4ZpTb8fNRx25w0nue9Mpi29N4Wm7WVGgU34qT9yIV/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsHgKpC9/5a9R2+bMIEsruo0oUpFUh6UEkkzSl3em8U=;
 b=Z9pt8O1qa+h9al16OUceApGOQ1NkDkPZmz91SMV/oYRfeykzdpL4YXCmXVMbqyMcDEhShQE3tLoW1YljFKV8VqpsZGGeD5D8xPVRumgjvtez77xtZrVNWY9PMFn+qmSHq6nPP/H1/p3sgNp2vwUMUNVXXdTr9x0Ki2QxTM/X5DU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 8 Mar
 2021 14:05:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:05:29 +0000
Subject: Re: [oe] [meta-python][PATCH v3 4/6] packagegroup-meta-python: Add new modules (aiohue, ifaddr, pysonos)
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-devel@lists.openembedded.org
References: <20210305160256.3333334-1-andrei@gherzan.com>
 <20210305160256.3333334-4-andrei@gherzan.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e846f9de-1824-c026-0c1f-6c14aa354701@windriver.com>
Date: Mon, 8 Mar 2021 09:05:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210305160256.3333334-4-andrei@gherzan.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0734.namprd03.prod.outlook.com
 (2603:10b6:408:110::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0734.namprd03.prod.outlook.com (2603:10b6:408:110::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:05:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb11b61a-9fd9-44dd-e512-08d8e23b3af1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3352E21669B384CC268F35119F939@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QAdel4MyYjlBUJJMB9Qww3O3d2gxXfBM4D0Vka1vXWMNMW0Ptpt7xQPzr+S6Q0fQwQUxll7Xr0jLssd3NHsGVfr72PDDGetPlb2/CJIkSN/SlPSbTi43ZvPczOdROXiTcWIFgAQVLliiPHQVF0fefLIaUQu3/F/IgGWKD/FoWVmGXD8bfSuINfirf9AcFVwzBaebvZv9SKIl9Z+OeWcCNHlyl0YS4BpyLRg5hJpna1HlPnBDsjALxK4+sTi3CSeqgn5a3QK+B19BwmNGG5MYXME8H5sob0DrDcjO9H7F75Li3sjsDQBr1SzjzkeL+BWFltdWpoMwl3cekr6azcEkJwWD9hJBczW0JHzH4cJIoq+NIH9uP7gmaX3CERfUEgXhPHKCOsIA9oycSfJODaVX8GNFQnWfncyiwPNFWODCs7IpwHJLL6OwoqM3VSnImwy/b9ByejJzKizztPGMI6bSr7MKjgwkGYsgOacOUxE4C3dB1BM2SvxskpqoVtYs+x3D7K7EEnLwOS+Vf74+g/kLZZIsjaNgWuk08/vYIRSEC9AAELeVJfYUVwN30X0hAVelLfNDhCZyoDbt0EkbFbqKu36FTEuTo4QPAEHU9eUNjJDqI1FevMuGCYC8UksQUthYYhWHBJ6RJEkkfrWVt/ONU+inVPVlfzV2oniIhGU9VjO3IvneTy1FtLglUVDLt8eE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(136003)(366004)(376002)(316002)(6486002)(2616005)(53546011)(33964004)(16526019)(2906002)(166002)(36756003)(966005)(478600001)(956004)(186003)(44832011)(8936002)(83380400001)(16576012)(26005)(31686004)(66946007)(8676002)(66476007)(66556008)(31696002)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VVkvU0lLb3BoYmdOTVduVHdWNVZsNWZad3k3VkNpRzZNRnFPTm1oWnBOVk9j?=
 =?utf-8?B?ZW1sT0diNXVWS2RIY2FDbThUeTZhZWpDK1VNdm4zR3JYMGdCT2J1bE1vR21P?=
 =?utf-8?B?WmcydEtubzVUMDRPZStxUnU3RHRRTzJvck5XMjFmcGVIRzBXZFBCNzVkWWZS?=
 =?utf-8?B?TnhnV0JMUUZCQnFSeWVSaHZ6MndiTmFhSjdmaTdTRG5Tb0F3NjZqNHJScEFY?=
 =?utf-8?B?QkluYjVNRElKMlVzR1VVeE5mU1Qrb2gyOHV5Y2g3UGtsdThVc0JhWm90RGRs?=
 =?utf-8?B?a0VjbmxBY1hXdjdMMUFQNzk1d052UHA4SndBb0ZnTVhmNkpIVHNpWWE0RDRl?=
 =?utf-8?B?dW9YYTNZN1kwYnBRZVRJYzB2V2VCcEU5MXVXS2xlY2FjVGkvVGxvUXNCTUhF?=
 =?utf-8?B?a2NncDFzOWRoRHoybWwvQWZNTitoWFN3dEtvQ3Fqd3RSbDFuRVdXdURCZUtu?=
 =?utf-8?B?RDIzTHVrenNIVnkwWjA3NHRNL056UEMrajgvVUFvRVE1eDJKUmtDZWFuZDlv?=
 =?utf-8?B?czNTUlRuR2xvUmpnVWh0SkIzdlNhSW43US8xcko4NmVYVVYyMTZ4S29YTnpV?=
 =?utf-8?B?YnVmSVcyVGxDQ3BiRmhtY0FOZXZ4T0pzQ2IyZnlYYXlBMjR5eEJuVmhab0NN?=
 =?utf-8?B?L0ZoaldPdGlsQzZiWmJtY3RBbzVPemtNYUN5RVdOMU82K2x1YzRZYlEvRDFv?=
 =?utf-8?B?WlNVMkNVQThtNzJVRDVGUlR2QXkySnRuaTRBdXBqSFhFZlhJeGhvSFFiYytJ?=
 =?utf-8?B?MFFna3MxNmpCWnF2YlJ6VEtTZUFqTHFWcGt3SThtakpXUmhmVWRWUmdqcTBW?=
 =?utf-8?B?UHAvZEkzWTZ3Y3FGeHpPSDFhLzUvOXlOZ2R4dFJPWlNlRnpaZVc1ajVZUFR4?=
 =?utf-8?B?QU9vNjVRbkhrdnNoTGpuZlBreENudVFBREFxSlJMcnFzSFkxbjFRK0s5RW9t?=
 =?utf-8?B?bXpWRUZVVkJmcHRTOXI5aitvN0VReFJZWWkxcUs1cGdiWUlvemlzdDdNTDBn?=
 =?utf-8?B?Skx4RW1GWjViNk9DbllNZ0MrZUx1byt4MjVnS1RpM0p6a3pvWTNzRWw1UEpp?=
 =?utf-8?B?WUFId2xMcnhEVTNQUDlxWFdoQXk3anFhTHFWNDQxQ3NJYkpwYWdQdXBFaVhN?=
 =?utf-8?B?OU1SQ3VsdTNxbWRBQjZiMlJxWUdDcy9IWWFoZGZ6NUNHM1hPdzZMZThxa3hD?=
 =?utf-8?B?M3NZWVJxYUFNT0VMKzdTT2cxQTJTczJSUkFmMFBOMnJ5dnk3WmI0RXQyd3dx?=
 =?utf-8?B?UFpZZlMzR0k0UGVvUXg4NWE2R3paYVZCZlJwOTVVTStUd0tlOE5vL3BzRTM5?=
 =?utf-8?B?dGRUNm0rTlcrdXJqRWxwS2VrbG9VZXExZ2xZcXlCNVBGdGdwdGdrVDRMWFZm?=
 =?utf-8?B?dEgyL1Q3ZTd6QjJ0YnFnaHhxRFplQzlWblFqRUozUEpHU2Era0Rucmo4aFM3?=
 =?utf-8?B?KzFvMEdZNXVOUzF0YjhMMVdWV01EOTNla3dzSytMcXgxZ091bGdnQ05iUDFl?=
 =?utf-8?B?RmRjVzJyWFVBWGQ1R2JxY3IvengvN2ZkVmgrVGtHWXpxSDkwU05vK3ZIN1l4?=
 =?utf-8?B?YWR2Q1M0Sk9ZeS9PYytER05YNWhwSGJBRjd1Z3hZU2kwR3ZUZDZHTFNrN2g4?=
 =?utf-8?B?STVhR29MbTd5ZGFOS2hlVHFvaUpqWXN5ekpHT25LUEJwQ0t6UTgvMUpCMmJP?=
 =?utf-8?B?NitOcm8yRGZkZzJTbzlVV3lWQUtFM2NqOWlLWlY5K2QwdVpNZ3dhUWwyOFNy?=
 =?utf-8?Q?+aGpuxlFGdFr0X3auHJGIwvLhNeIWkOTE5wXeXC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb11b61a-9fd9-44dd-e512-08d8e23b3af1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:05:29.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfA0kCUbYJBYzTG6OIoSDmSBenu7pN7zV824WfBnuuHpkPbbHOHmD55aLdd5MZwEuNUAiUdktsVshj8d+YAUvuyLJzyzYjsvVv3h5sdOsp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------556F89E98519FEC243FCF832"
Content-Language: en-US

--------------556F89E98519FEC243FCF832
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-05 11:02 a.m., Andrei Gherzan wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-meta-python.bb     | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 635dee194..6323e17c6 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -21,6 +21,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-aiofiles \
>       python3-aiohttp \
>       python3-aiohttp-jinja2 \
> +    python3-aiohue \
>       python3-alembic \
>       python3-ansi2html \
>       python3-ansicolors \
> @@ -167,6 +168,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-idna \
>       python3-idna \
>       python3-idna-ssl \
> +    python3-ifaddr \
>       python3-imageio \
>       python3-incremental \
>       python3-inflection \
> @@ -320,6 +322,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-pyscaffold \
>       python3-pyserial \
>       python3-pysocks \
> +    python3-pysonos \
>       python3-pystache \
>       python3-pystemd \
>       python3-pytest-asyncio \
> --
> 2.30.1
>
>
> 
>

--------------556F89E98519FEC243FCF832
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-05 11:02 a.m., Andrei
      Gherzan wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210305160256.3333334-4-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei@gherzan.com">&lt;andrei@gherzan.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210305160256.3333334-4-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 635dee194..6323e17c6 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -21,6 +21,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-aiofiles \
     python3-aiohttp \
     python3-aiohttp-jinja2 \
+    python3-aiohue \
     python3-alembic \
     python3-ansi2html \
     python3-ansicolors \
@@ -167,6 +168,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-idna \
     python3-idna \
     python3-idna-ssl \
+    python3-ifaddr \
     python3-imageio \
     python3-incremental \
     python3-inflection \
@@ -320,6 +322,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-pyscaffold \
     python3-pyserial \
     python3-pysocks \
+    python3-pysonos \
     python3-pystache \
     python3-pystemd \
     python3-pytest-asyncio \
--
2.30.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------556F89E98519FEC243FCF832--
