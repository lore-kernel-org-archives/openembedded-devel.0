Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.44])
 by mx.groups.io with SMTP id smtpd.web08.11775.1605217327224783483
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 13:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PZm3jbcl;
 spf=pass (domain: windriver.com, ip: 40.107.76.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvPOyce761M1g+Du28CBj3qtqTDnv6Mv2YjNc1kSMc27jhLDOnhzt1T5ieBEB/0i+YY6jA49wLWot0lYtFvNPZp91ghRiJUTNRiEEiZjn00ziFuPUpfxs0CS2+DHoxDFHVuOI78tfLWVLLoaIbo2F2BfBnJdcMqk8jnltnbECsEAq0VipIoX85NPRYauOpevvDZFGOoYBIjW72TM+q3SoG3//ag8HDISqFFrE7QXpCn4tgzYjPgGmNtrERTkZwnKMW9jpaT9w/WRQsURs/bPEjjZ4I2jH/B/fdSAQRukUj1pkWaH72wJPVyaDNVvE2aR+64Twe4qDK4CeNZMAPJseg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJIVkxV6AioW1lYstvLanEDWTOhwsYkGbyplhwKfopI=;
 b=XORW3aSSxzfOyEUZD6SEnsNXUcNs1Mj3+xyX8Q6kD/ZT6cjIa1q6iqZmKCTZTOzxQZoJjCbg6lRXvomOBy+d1n73kzjHtRDCSW/viBoYrlHMW+KjvgH5M4n8qpz8ODeUVGEHz3BpspQobVU+Jf/K99PrdRrdoIlrhvZIRFblXsEBGTRNPro7zVknSHMK/uUWRxFAqw77opHMqgiTU6y7sE6h32aNhKyukba9ZeJJ8mDLxUQ/Yv/N5xk7yTgB7j2vTPlsvauNsLpb/ZmnM/nfA6uPwu4xScQVz+DsDhOjhGU41DZxHhqawzXTlm8QAXbmYqbWnGj1wCqDvqieX8FVvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJIVkxV6AioW1lYstvLanEDWTOhwsYkGbyplhwKfopI=;
 b=PZm3jbcllc8tn4hq2skg5LeNV5mHNhdgX53/QbqASClc1ILf5XehGmlXgJ+zhIlmX7zE3IbvrVHOeGtdnHMxLvWL9MDKu62q/hYPhD9I7nRLP92uEWqHn2cO6lt4Dhlx4jW5SFd9ftKHer5Hfouf39X4ZbduYZe07k+CFJ426AA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3910.namprd11.prod.outlook.com (2603:10b6:a03:185::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Thu, 12 Nov
 2020 21:42:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 21:42:05 +0000
Subject: Re: [meta-python][PATCH v4] Add python3-cvxopt
To: Gregory Anders <greg@gpanders.com>,
 openembedded-devel@lists.openembedded.org
References: <20201112210645.26343-1-greg@gpanders.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <da1ec791-8c13-909a-644a-065a918405e6@windriver.com>
Date: Thu, 12 Nov 2020 16:42:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201112210645.26343-1-greg@gpanders.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::41) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 21:42:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 446f6d26-684d-44f7-5203-08d88753cbac
X-MS-TrafficTypeDiagnostic: BY5PR11MB3910:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3910A03F42492F911C5FA5649FE70@BY5PR11MB3910.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YCJ5FtUNOj+BcBCfLSVFNzULTsEB6aCo+Ut9yzflxmdQHMd9uor43IaYW32F1L16l0uuNc2WPZJcELuzHR35xofbBAp6soWoK8Q6NAgz/pSvgKDzMFusi8HD874FmJJuIRJ3aEhwXBK2gdsrMjKcRp5LvZ8Z/YHHWRs7WkTmpKIS7VxgrxR5Eh1XUfJiVHGt6SErf360fQhQJ3MsQ/xFWDKMj5qhFaf7DPsVtZWfoWFiVAxgc5IMMNE1hf7DS1O0UH6IIf99hQIhlup3SYjwSfM//PWafOxWQkF4OiUkD37m3qMmwFY22Rp9xP3xFwEa26LhVNEpTw3a+eaIffsK7cREpdrkl98vOfzgi/yFdGXbJKIWMHSJeBcbrWNKLNoy5LB+PBxI6IyeApbDfPiIzgI4T47+KIGKDyvbdtiKSO4dVPITzeo0/FDP8Tvbx8dDIoWlOyRIzAb84MiKXRQOGw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(366004)(2616005)(5660300002)(66556008)(956004)(478600001)(16576012)(8676002)(26005)(2906002)(53546011)(16526019)(31696002)(6486002)(52116002)(8936002)(186003)(66476007)(66946007)(31686004)(86362001)(316002)(36756003)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	F+GPF+TxPauHFaBjsWtQAOBmG6ONOoMVkn+b8wHnNMPRRTuyJOADDhoBBBuQU9N9ZXrKYwgVFpB81siu3scRiAwynkY5tBwELtWARY6JtXGUqzHlXSp2a4854zoHRDxowISbR6L4n47eLEuatlQ32EVNkfs/Zipi5/uA16dZma/RIB7mRjkt8pZMQ2gmIQ3EVMlnQ3PxhLnNOxeTtjR6soIASg/78Z90Hg9LqEORnKMMSt4wsNIqzUOsMTyJWBXmtPbAiqKesSxZfWZLypcBMAZhxbSj8J15NkiCTHw9dGC4/vP7V4it2d2Fh3uHnUS0CwvBI5W6aXJSRUeYg7pYCN8HEnLPmdTf8SQxRz7jbSdW0aJKDAktarcTgcFW2VEEEO74TGKjDRCiCEAzo7Pc+17AoM80vH1ClvLmz/iFC750aTF+JIgso4EI72AHja65l/CQN5Mf6uv/sElKZD0Eq6XW1HjG+4VB0Gudv6bdP1sIVQkpW5AhExhzzVnyM8re+yv6kEZiNqhlMwV9fX0SmkH1lFn5ybrfHifhyF0wrruMqPOewZp9OhpLM7M9FthaYHQpe1Idh0K7X72IradVrNEL7TBJuGyw4m0TLouIob0W1xyf6nse08rc8pmvCfV5b1mEGJHELBpdLAzyR2kxQA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 446f6d26-684d-44f7-5203-08d88753cbac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 21:42:05.1233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ED7cDGy1Y5f+HAWkOu9t6Xl6Y5dTqEppBFVtQwuycZZuF0mbTFw9dZNssmQ9Ey/Pmy7waXzBTOjG2VecY+TMui1MrhcklElSpZsSYtHe8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3910
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/12/20 4:06 PM, Gregory Anders wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Gregory Anders <greg@gpanders.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb |  1 +
>   .../python/python3-cvxopt_1.2.5.bb            | 19 +++++++++++++++++++
>   2 files changed, 20 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index b8265fcc5..142687f30 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -428,6 +428,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-transitions \
>       python3-dill \
>       python3-cerberus \
> +    python3-cvxopt \
>   "
>
>   RDEPENDS_packagegroup-meta-python3-extended = "\
> diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> new file mode 100644
> index 000000000..b440d62bd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Convex optimization package"
> +HOMEPAGE = "http://cvxopt.org"
> +LICENSE = "GPL-3.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21"
> +
> +SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https"
> +
> +SRCREV = "5b59d87007bf6fdea464e14875543b35255b84b2"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} += "lapack suitesparse"
> +DEPENDS += "lapack suitesparse"
> +
> +inherit setuptools3
> +
> +export CVXOPT_BLAS_LIB_DIR = "${STAGING_LIBDIR}"
> +export CVXOPT_SUITESPARSE_LIB_DIR = "${STAGING_LIBDIR}"
> +export CVXOPT_SUITESPARSE_INC_DIR = "${STAGING_INCDIR}"
> --
> 2.29.2
>
