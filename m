Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.68])
 by mx.groups.io with SMTP id smtpd.web10.27704.1611149779753111910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EnABSJ8w;
 spf=pass (domain: windriver.com, ip: 40.107.92.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRidkKcWHKw8e0RuAzDszKeX2dbhTi9eBgyexXEVq22SlPs0/E3k6LZ64/Kmd4wcMSysdQe+lsZFZXAX4jPgnQ9zxIIBunOLmv5bb8+2dQPANHidtaZelSVDwa2lnLDNhbXnYpb+aaGOoKixNeEzhW5VPEn+tnqFE3cJaPJo3uXim7GQJULI3pXUA3T3p71OBJdzBh+pDJPN86TbeCQeNuTnhh5yxm7nkQGhr8LjFCXkNexTotP9DbrJ2+mbGwNqZbTRPYfxE4XqDi1one7yBist8kIub7zA2IJ8Pj8E45zksmRpXO6pBVZfbyuyU97jFPyMwwClELu03s7TiGnngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A+nT4B/q4siKYAtwAGckacOTBGXVfd2eD29D01sJj0=;
 b=CPRaq0+Vt5Jx06/cfon04PrI0CtqIc2KbfF15yWgRq0so8AgYlVVBVJhMM6KEe2UML97DS7QW91y6PjYBhg0vij13v7/XcSCnQKZcqb0Wi3Xn6G5Lhr1IXc9lXsgF7YrjVhN6jXh2/xwuy53zmmZZ79hmdQGxoTlKHuz8zMq9Hiv2V/sZqWAOYouGYbXg+8hr++o7/0wTbH6oQZZcbt0bZLQgrCuCPtwNU9BbNxPtYfST+yclWZybud9uOJiFF/cB3dI5QT7evLmgUONWjomFvOcOpFvoKY+xL9diujlCcevl2M5rCsdgl/VsZjmzc7p0KU6sxI/+K3vZkv3+ssaaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A+nT4B/q4siKYAtwAGckacOTBGXVfd2eD29D01sJj0=;
 b=EnABSJ8w1qkkhzBWt00d4A4MZWFEgh5nEqs2LGilhzukHfQ+LNqG/LUFqg2J8NN3K+NUVuSZU/dildN5WbyFy3mDUOHg1puwiRiS7jiQIDuse90EK1e6HTk7kAYlUa6OwO5mZOB4AW3tvoS/LRyHXlHSSeDyoTy4VKg3cJanBdw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3558.namprd11.prod.outlook.com (2603:10b6:a03:b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 13:36:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:36:16 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-pymysql: Upgrade 0.10.1 -> 1.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
 <20210119173746.24694-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <25d0e8ad-1ebb-2e71-958f-f5483dd3f87e@windriver.com>
Date: Wed, 20 Jan 2021 08:36:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210119173746.24694-8-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN3PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:400:4::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN3PR03CA0100.namprd03.prod.outlook.com (2603:10b6:400:4::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 13:36:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c85ac11-8370-4cf4-4a5a-08d8bd485ca1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3558:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3558E401EB00D3EC0FECDBD89FA20@BYAPR11MB3558.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bmhEbTpN7S1FgniosH46bEYDUb6PW+2FZrrvyi1OAMn6z9qt1zu6/R45VoUSsp0Uanx1ZuDFIqcfjXo0zNIaJ0lkBOvDEDgIQIpHcKLBOqx2Hj5lddt6uH9OFZgaUwkCLURT73S9AYoRsXqS1OX5p9DYc23hDMtqq8RcxK6R7LhYm4QIPqBwMcqTt97iwCSFWzCdeTjcgRlHcLQ2d01wDTwNkaMw3FTT/ptytzHDd78z4s44LVlqFWA1OSNjS/aUKFLSJsZvsVK6n3XJoqq9vghNxdpuOq2V0YClcpwhhEWgqd4rT2XSJg5wh805IGrmBUCMdJyo9Ydndc3Msh+ixAsZ5cMsCUMUllV+zw5ZFX/uVINxU3xl+i6zD/bAr/dKOALE9qDDpHgJ3QCHWRdPnAsJwjSehCwibgsdn9K/CZmxic7Bv8yXJ2QOXbfCpSns24hCU/43/HsTeYx8iObZ0XLktM7GDj75MGsi8ND6tazVz35HaOL7s7M8kY9UFUTt38OQHFld9x5F4/5/Zdd4IPhn6aEjS4mRwADngMgKgtg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(66946007)(31696002)(36756003)(2616005)(44832011)(66476007)(86362001)(6486002)(478600001)(83380400001)(31686004)(966005)(26005)(8936002)(186003)(5660300002)(66556008)(16576012)(16526019)(166002)(33964004)(2906002)(52116002)(53546011)(8676002)(956004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dDZaaEY0bFFzVkZlWlBuSXZyUm5wS2dINjkzZnFQU1NVQ2JiN25vbHluOTd5?=
 =?utf-8?B?YWdGendVUHFhMlNVQjN4M2hvTlBMaFZIYTJoYlRCWFMra0ZFWnFNdkxJN0ht?=
 =?utf-8?B?Y281TlM0REg2dHREKzVBWWRKUFZ1bUhOYjJQUzdtK0FkTlUwQXpBTVNhTGxw?=
 =?utf-8?B?VjJ5MUcwMlAwQ2crb3JLaEJIOHV5OXQrcitsdGtzdFRXT2l2RzdIdzU4WDZJ?=
 =?utf-8?B?UWpzbTNDSHQzancvWjVGRVlSK2s2OExlUFpsdURhSE52RHFTTTBZN2hQK3Nt?=
 =?utf-8?B?NUJ1N2htY3NQSnM4NGgxMlZSelJlb2Y0alNSTDZ6eWRiVy9oNzk5NXQxSElL?=
 =?utf-8?B?dWdrWXhMYzJQQml2dk8razJmRWlTekVEWUcvU3QzV0MyMHZEWEZpWVlnWjVJ?=
 =?utf-8?B?bnBIaDZ0dG9jS3hFaTdXWkFYMk5oN1VpaGxtaDM3SEpHY0RSK2lRSm1iWHA3?=
 =?utf-8?B?SlhKT3p0cVRlT0hCVVdXTHkyemhqelRwT21WT1FPcHRZZXREVDB4c2tjbmZV?=
 =?utf-8?B?bjNsQjNxZHVVZFl0QXVKaGNxcnJPSDFGdCtkTmlYS0Q3VmlIOUR0VitqUVBo?=
 =?utf-8?B?TVhkSlNCc25hMHV6ZXpMRjRRMERqNFcvTDF0b2ZjZFlYMnNTMitLQXkrQ1BN?=
 =?utf-8?B?TFhDNEMvbTFUVitNMy9XdzMwSWg3QWEwamN6dlI2WE5BM29lRkNiaVJCbThR?=
 =?utf-8?B?NVNSUk1WR29PWjdZdmwvRjNJV1c5MWMvaEZjWTl5QUVmVlJaK09yTjBvcU5x?=
 =?utf-8?B?NWtBY1RWYkJQcDA1VVJpVmpuTU1QM0l5NldibGJVenlnQ2ptdGRxVi90cGY2?=
 =?utf-8?B?N29EL0xpem5IOXk2dFFmQW5VU3p1SUZ1cDVZS0E1bXlTZXpMc2E3N3NZcmJB?=
 =?utf-8?B?dXpVTVJCNCtOV2pYZUNJRk9nN3FyWEJrem14bXlNWWxNaVpaYktWT2Y5anor?=
 =?utf-8?B?NU4va0tidHdmQUtpaC9hWHpwT1ZTenlvcVFMN3c5eU45MzdiNHJVM1UyV0Yr?=
 =?utf-8?B?U0xkMUFnNXpnUEVFeWJJTWpjSytmZ1dCQnF0YlJzK2VYVGZXcVk3QzNpM1Rj?=
 =?utf-8?B?cXE1M2lMSU1HdjM5dlJ5VEVFcENqTmtkeWtJUDBMRkxDS1RkZWRtN1Vad1Jn?=
 =?utf-8?B?V2RYQWdyTHA0WWNzbmJPKzVJY1Q3TFpkZ2MzQUZoaFRXSHp2OWxIbDNFeUhs?=
 =?utf-8?B?a2NPNmZCeVlTKzI3QnJWczNqYS9XdnZ2R1RiWVJPWnpjc2JROGUxdEZReW55?=
 =?utf-8?B?NDFNNVpic1dVeC9tSXNpNWpTd3VaYTd2amkvZjlGMkRsdU5ZdFdBS3d5U1Za?=
 =?utf-8?Q?cL9Me9FONnRa1JV7+LlxcqKbBPRXX1Trgo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c85ac11-8370-4cf4-4a5a-08d8bd485ca1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:36:16.4113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aebdvdq0ruDZJp45yml6Ed/8uegTMiDI+skO1795723ddnqES+Kb6zSW6MIVm5MYrkvG/lXeAaLqZhDh7PMqntRiT2jSM28wiG4koPNjEAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3558
Content-Type: multipart/alternative;
 boundary="------------26685BA0E54755D26AFF4E54"
Content-Language: en-US

--------------26685BA0E54755D26AFF4E54
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 12:37 p.m., Leon Anavi wrote:
> - Fix user, password, host, database are still positional
>    arguments. All arguments of connect() are now keyword-only.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymysql_0.10.1.bb => python3-pymysql_1.0.2.bb}    | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymysql_0.10.1.bb => python3-pymysql_1.0.2.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
> rename to meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
> index 15ace44ac..36e2921ae 100644
> --- a/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
> @@ -8,8 +8,7 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
>   
> -SRC_URI[md5sum] = "4a1fe973afbbdd78928650118ce8ff68"
> -SRC_URI[sha256sum] = "263040d2779a3b84930f7ac9da5132be0fefcd6f453a885756656103f8ee1fdd"
> +SRC_URI[sha256sum] = "816927a350f38d56072aeca5dfb10221fe1dc653745853d30a216637f5d7ad36"
>   
>   PYPI_PACKAGE = "PyMySQL"
>   inherit pypi setuptools3
>
> 
>

--------------26685BA0E54755D26AFF4E54
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-19 12:37 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210119173746.24694-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix user, password, host, database are still positional
  arguments. All arguments of connect() are now keyword-only.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210119173746.24694-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymysql_0.10.1.bb =&gt; python3-pymysql_1.0.2.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_0.10.1.bb =&gt; python3-pymysql_1.0.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
index 15ace44ac..36e2921ae 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
@@ -8,8 +8,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pymysql.readthedocs.io">&quot;https://pymysql.readthedocs.io&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc">&quot;file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc&quot;</a>
 
-SRC_URI[md5sum] = &quot;4a1fe973afbbdd78928650118ce8ff68&quot;
-SRC_URI[sha256sum] = &quot;263040d2779a3b84930f7ac9da5132be0fefcd6f453a885756656103f8ee1fdd&quot;
+SRC_URI[sha256sum] = &quot;816927a350f38d56072aeca5dfb10221fe1dc653745853d30a216637f5d7ad36&quot;
 
 PYPI_PACKAGE = &quot;PyMySQL&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------26685BA0E54755D26AFF4E54--
