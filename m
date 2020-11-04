Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.45])
 by mx.groups.io with SMTP id smtpd.web09.13878.1604501211132231813
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IRUtTm/b;
 spf=pass (domain: windriver.com, ip: 40.107.243.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JG21nLBYh/Cenp+XcQi2X1p4F7WmTJC48XiUrY/xExcBSlpyxHxMdbp5BPKd1n0Jc4XpNsZvcwAOaeheG7S1uV1O7/ix6Zq6/ju4z9ntmTPy7fazbab+7RptyNvBhwYaLCj8z6T+UkJFG0NvK68Oe3/oUML0P2Q4D3IRn43uSMWf0yKrv28sZsFX7zSYSgtbotKpiETGapjiwQsDd29mdOO5yXUEuxfagIJTk8S7Qzq0uL6S1StULTw3zlURpiE59ccyFPvYjVTfHg3/ok/Gya/OAOTLfj/SN+3q009HRsc2WxU67ixDEp4eLkOPhU9ZtZFfAXVXh02LZ7NWacp4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uw8XsTjvJcqrtk6nVaLhR0TkGe9VBJ6C3j5nTjuRHss=;
 b=BfttvBiy7NCpaDbXWyel23mtFTky0G1AlPXHyY7I2ElRYu93sShlSGzM+exfXPfB59PUnwT03VDC1sLFPz6D/SW0euNszWzMjrxGuz9AZXtMZ+C7FwYGLD+hNi+Ezhc3W5gR77ugDwzNUoXqi/fN9d4K28TaayzdSt+vl2Huoqvib3H1RBfJP71YxpLmHBUYnkuB5OS0fKWDdJd5nvRA08P0WVmqB4bQPmpDTLmZJ7R2F8hOEdw/p7VZqAJgXLcfJs9AuQ4X3rdxdF8WS96Tsdp0M6cS787hMdw0zzUNiBb+X7bv7lWfodZDVUolTJOL76xLGplW6rN6tDlVuSekKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uw8XsTjvJcqrtk6nVaLhR0TkGe9VBJ6C3j5nTjuRHss=;
 b=IRUtTm/bnYJczIXGo4lxZm9X9LQhJlyhJRzfQRVTXvDw7Wlc7Yf+G16J4RaYIMJD+wt+YjXI/1WtQz4geWEerTKEh5BQx9aKlqLBISZZc2C+8tkxWfj96z/Xd2D+BFV4lAxISCBOvp1I215CFivmguu0z95FY6rnF9pAkiGgt/M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:46:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:46:50 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-kiwisolver: Upgrade 1.2.0 -> 1.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201028174622.7515-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2a2ed5fd-743b-6f46-d4b4-d052b3d29b4b@windriver.com>
Date: Wed, 4 Nov 2020 09:46:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201028174622.7515-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: SJ0PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by SJ0PR03CA0139.namprd03.prod.outlook.com (2603:10b6:a03:33c::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Wed, 4 Nov 2020 14:46:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2eee3bb7-9ac7-4172-9a38-08d880d07653
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50858D12D4A29A7DB1A853E49FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t1d9i53nojPdba9lXGlgplzYSy4jvgQ04nBiQKhXja2D2DCqDoB+qTKnF/ZWU3tKAJNVOnoC++EJJyWQz/B/VhY7s2GuJVg7HxD3pkObwG+55+xokaoSOQ+J/aFcAD/KqF/9nJSqeUgOJTS2Vdjk3ys4rDec+bU5k4QNdDE/nnM+xxNMDHxma60obKsW4+izZd1Iw9CkbbnTwPwbCxnpSa3u2kd9gl9bBOwjCTP9Ut5TmWZAC60kIweHgLIfrk54tpDQM7zdcKChI6GqvNxL3jctXngF+Qvz1pr59vMHMPXJ94o5AdjYDaT9j5jEvUdsp0BkTfN739pg+ekhy6w++9PVUtxY7PIHSXBc0Pz/TwiC5HLoJ26msLCcEldfJpQSMdzPS4a5LlAMT417TNsW5fEdIHlO9m0g03IrRIJuvTUI2DlVwDmokfSgJfRPuvRu7I8C9tADKMSg8YKmn2lloQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	HXwzO+/diJ8snqubeExkbCNB4Shu7JY65j+x2U/o1VvDa7sW/eVtoRB2QEw5Qbycv/Laa+YguauA9XueCAmWdSqyu50y6J94UO3YPwjmu6GyijtgIb27alR/tEXtzlr/E/XoUshRIfAxFR3FZPGtQZ979Hptp8ANZGIGf/tNsZT3nGzCRjiVI9xeT1FQ3O5yUxi+l/TeqOosHcNf9pB9flrD0BCjet4rJt4OYR/lavCW1mOgnTxk0L3+szLQ0Z3G54hrfglixLqkbw5xKMcQKaZ6NEKkVId6N4TH92xDsu0R9ORHJQW8qW+bjE3/2OlW46CR1BEqdplIdWhzFYbmpsh57g4bntNmRKzBs6tfmEvAIevnZ8POnwRV35PIdn+xlusKMtAvpiZWKdIcwQgPolEift2zFMy/rbALb7DIFjXyNTB066H21skIrVTDYhgOk1bB/yohun1gOZPPAIuCw7yy81ggmZk6nIWJm0saEK123qnqhBerz/2+QQzK0BhTF8+p7Db1pkEMcxC8FmY+n5/eNqXlNp1NIL3EIBipiIXtNiVv8QiliQb7rvtTCo/uvTNR5fh+ZMXXsIXyJPPyGRLYpF/IUvNU6IAlbEaCJkt8zUK21UcNuGt4X+KKehNOjH6uHmje2SIAM3f9dPr/Aw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eee3bb7-9ac7-4172-9a38-08d880d07653
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:46:50.2087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDVZcbEnO/WHAD/6YMlNY8WcV/UyQOINKMadltibBMWDqoaBBXzxs554cRx2Els+jPSLVhyrQ+wOwwDnjbtOCZipMpLhjV7uhs0AJ1JHeuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------F814396ADFFCA46BE27B7845"
Content-Language: en-US

--------------F814396ADFFCA46BE27B7845
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/28/20 1:46 PM, Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.3.0:
>
> - add c++ benchmarks and run them on CIs
> - modernize the c++ code by using more c++11 features
> - introduce move semantic in some c++ constructors to improve
>    performances
> - add support for Python 3.9
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-kiwisolver_1.2.0.bb => python3-kiwisolver_1.3.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.2.0.bb => python3-kiwisolver_1.3.0.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
> index 94db61142b..f499f04530 100644
> --- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4"
>
> -SRC_URI[md5sum] = "9f53fabb361c04d76c5afc688652c814"
> -SRC_URI[sha256sum] = "247800260cd38160c362d211dcaf4ed0f7816afb5efe56544748b21d6ad6d17f"
> +SRC_URI[md5sum] = "9d1b3e2dd2bbe1a81ffedcc73cab07e0"
> +SRC_URI[sha256sum] = "14f81644e1f3bf01fbc8b9c990a7889e9bb4400c4d0ff9155aa0bdd19cce24a9"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------F814396ADFFCA46BE27B7845
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/28/20 1:46 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201028174622.7515-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.3.0:

- add c++ benchmarks and run them on CIs
- modernize the c++ code by using more c++11 features
- introduce move semantic in some c++ constructors to improve
  performances
- add support for Python 3.9

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201028174622.7515-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-kiwisolver_1.2.0.bb =&gt; python3-kiwisolver_1.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.2.0.bb =&gt; python3-kiwisolver_1.3.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
index 94db61142b..f499f04530 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/nucleic/kiwi">&quot;https://github.com/nucleic/kiwi&quot;</a>
 LICENSE = &quot;BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4">&quot;file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4&quot;</a>

-SRC_URI[md5sum] = &quot;9f53fabb361c04d76c5afc688652c814&quot;
-SRC_URI[sha256sum] = &quot;247800260cd38160c362d211dcaf4ed0f7816afb5efe56544748b21d6ad6d17f&quot;
+SRC_URI[md5sum] = &quot;9d1b3e2dd2bbe1a81ffedcc73cab07e0&quot;
+SRC_URI[sha256sum] = &quot;14f81644e1f3bf01fbc8b9c990a7889e9bb4400c4d0ff9155aa0bdd19cce24a9&quot;

 inherit pypi setuptools3

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

--------------F814396ADFFCA46BE27B7845--
