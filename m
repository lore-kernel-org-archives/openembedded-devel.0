Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.45])
 by mx.groups.io with SMTP id smtpd.web12.12411.1595943157997334641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 06:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cNsrFj/k;
 spf=pass (domain: windriver.com, ip: 40.107.244.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIFAPj6xPr7kuZTzsq/2qmUTvGmBtjw8tekdT17VY+X5sq/SJ3wfLPJoHx+8lvMwYG6ZwtKQgCFLQx0vZIEeSS754N/m0cxD24sDFEHKZ3CnfIInYle9oRxCFcgcneFsKVgzBoWKJi7kmNsPuQwZSVtyZcPnX6wPW0N11L5bdiye1OOSiz+40npgsK/JLGd0+1T65MuwSHcyrqYa24FM88U5U3DsKBrMWlK2bwFav2nMjdMtn3qxBchYrpCqfwlXxVPIYKtGLZyxiRQDojjggWTS4HVmEmYhr8tjPYnkurHrihCRZjbAODrL0C6Yegnh3wNELDZ6VX7H2oZIVEStEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fMTTDwnxjm91TQjRD/FnHX2ACI0Hc+3Ew8lwWROhlg=;
 b=OxoL7JcDXmOyMRIliX2xVVesj2UAek/a+PJ91KEFpXlPLEvGN3E9Vd7zsOjB3NiSf6YHgkcO9zV25IBCC0SMZPcEXOzRLCG9FGzqupDJnrH8kyJZJQjkV61iWe1kc1yk1Mes+TQCnOGiQOFUlsgnO/VcdCLYXH7ApKoARod7s7fRU8OUetigN89VF8HlBCYesfFxn8yAl59q9RyJlJoewum7FpM2/534Lzd7k3N1bYmq0MZCICyD0WCcnfEMXBe8oqVB3u1wk44P9vLeJSYrFxFbPn8vn7quNloeq8wKCybDqPfuWf2w/gZko6UfS2XS+2axVjFkr02dMxYyONxuSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fMTTDwnxjm91TQjRD/FnHX2ACI0Hc+3Ew8lwWROhlg=;
 b=cNsrFj/kA5od8XfHFjsMZuwqOSiA0WKkCm02ZeVfiTDp0tu0QajlRYkGgMY5Z8gBa5qlFlufyVTih5/nwwikZrBxq0d3I1MwriI7QOSL/HxFf+zIlzxVMOUCozoGJxSvFzNnex6uiyhhm1QQr2i/4uULNwiWI/hg9EiFkDkvmjI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.28; Tue, 28 Jul
 2020 13:32:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 13:32:36 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-aenum: Upgrade 2.2.3 -> 2.2.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
 <20200724103515.21420-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <66ad5e20-8ea7-1c6e-bd96-89a90b4210ed@windriver.com>
Date: Tue, 28 Jul 2020 09:32:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200724103515.21420-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend Transport; Tue, 28 Jul 2020 13:32:35 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ebbbd92-8502-451d-49b0-08d832fab0bc
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103050A6BE9EAD84F3BDCEA9F730@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Syy1EJDvK/UczFM8EKUI7jAF4oDvyG5Pzs7laT9p0C8d9n9Qc/S+0+OE9GH09D86TnLGFT9s/F+T+xuw3AoAf7RYyetG957qFurEfe1p8HqtPTVW9nmc2hDJRu/BZKkykEqaTFnzbuHSnwpc6Ay2fCUEj3Rzw/k95wuGMQYQ+JuJLAQRoo6EzLdR2+pBHgD0G5K8gKz1xmQk9C+2piwkuZrP/k7OnfoBSXh1OK6fryphsGRfUwXBvY30H461FZryrKsgltfLwMCTMl8PzpiWqyazBfT7ik5KT1vad61IrETNi6OW4juIACk2WVn1iPzwelaIp/lM+nQYKnshhHPVdYUkoLVnM4pjIIuT6+AhZeu9py/0FH206SmVYQl1+jzf0dqPzDOPdt+GINlnZV6LLnGy+ktazsGLQKkkBlXtAbButopQhx9GRReV6YuGPfN2RJMi3JlPm6KFavuqTxGkag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(376002)(39850400004)(396003)(346002)(8936002)(478600001)(966005)(52116002)(36756003)(2906002)(33964004)(8676002)(2616005)(16576012)(44832011)(83380400001)(316002)(86362001)(31686004)(53546011)(166002)(6486002)(16526019)(186003)(66946007)(5660300002)(66476007)(66556008)(31696002)(956004)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	EZrgCb802gxBATiTGDgEjXp/HNLPPRlsldCjYmwSl32oaTjEzNS9nFLVc6CUXP2wwZKzqW7G8z0rmah5rpQ2Jy+GfVOMnvCj1oAbYlrtCKDoJJkHGuC8lDS/T6NBrG7I9FrlkjmoWYgCYUJ6dZ9aLiiMs4yh+eQcM15e/C7LqVPkXMIlquEFI0/pvnwSQQTfWHhxAszGVOzOf3zaLebMssv7NT9vyFxqIZUkQRCsmvbijQ6aMfsT6k3Zg56xKAdbBva7kr9TPCh4NxlCRG6z/7fZc26j+tZIzUvbFODGvoWn4l1HEP2JmyFCJwVxg0hIyYjIXAvXOb2IQlkZhULNEIGEJ1eGXmRFnJJO6WDe+nm9Tp/F+LqoPc3AvE4BQBkSJZGQoaxQTE4aGSZ1lndZVX25PaTocROl+Pg5P1zgZWZPJJRaXPkhUg79mJAzH4nFhQi6FBdFBxxFHvwi1aQLhzAJ3SawRYbJQThiv6miYsU=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebbbd92-8502-451d-49b0-08d832fab0bc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 13:32:36.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIVUul4671gZflTFOpI0K0cS9HttEBB0BYZvJVjUwKX9Rld45KHU7/vqDqU8IgiQxYl22wp+i6wV6LFL0kiv5DcCmfhpcb9KEoHWepjyR1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------DE299AE63BDF053ECCD637F7"
Content-Language: en-US

--------------DE299AE63BDF053ECCD637F7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/24/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 2.2.4:
>
> - add support to Constant to retrieve members by value
> - add pickle/deepcopy support to Constant
> - add support for Constant to use other Constant values
> - AutoNumber and auto() now work together
> - Enum members are now added to the class as enum_property, which
>    supports unshadowing of parent class attributes when called on
>    an Enum member
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-aenum_2.2.3.bb => python3-aenum_2.2.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-aenum_2.2.3.bb => python3-aenum_2.2.4.bb} (63%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aenum_2.2.3.bb b/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python3-aenum_2.2.3.bb
> rename to meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
> index 16d2a881f..da77a5c75 100644
> --- a/meta-python/recipes-devtools/python/python3-aenum_2.2.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
>   
> -SRC_URI[md5sum] = "026786dbb37c15c2c8dc91fbf5828e97"
> -SRC_URI[sha256sum] = "a4334cabf47c167d44ab5a6198837b80deec5d5bad1b5cf70c966c3a330260e8"
> +SRC_URI[md5sum] = "8983562361efe5be865617341dadbb9b"
> +SRC_URI[sha256sum] = "81828d1fbe20b6b188d75b21a0fa936d7d929d839ef843ef385d9c2a97082864"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------DE299AE63BDF053ECCD637F7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/24/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200724103515.21420-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.2.4:

- add support to Constant to retrieve members by value
- add pickle/deepcopy support to Constant
- add support for Constant to use other Constant values
- AutoNumber and auto() now work together
- Enum members are now added to the class as enum_property, which
  supports unshadowing of parent class attributes when called on
  an Enum member

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200724103515.21420-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-aenum_2.2.3.bb =&gt; python3-aenum_2.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_2.2.3.bb =&gt; python3-aenum_2.2.4.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_2.2.3.bb b/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-aenum_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
index 16d2a881f..da77a5c75 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/aenum/">&quot;https://pypi.org/project/aenum/&quot;</a>
 LICENSE = &quot;BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9">&quot;file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9&quot;</a>
 
-SRC_URI[md5sum] = &quot;026786dbb37c15c2c8dc91fbf5828e97&quot;
-SRC_URI[sha256sum] = &quot;a4334cabf47c167d44ab5a6198837b80deec5d5bad1b5cf70c966c3a330260e8&quot;
+SRC_URI[md5sum] = &quot;8983562361efe5be865617341dadbb9b&quot;
+SRC_URI[sha256sum] = &quot;81828d1fbe20b6b188d75b21a0fa936d7d929d839ef843ef385d9c2a97082864&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DE299AE63BDF053ECCD637F7--
