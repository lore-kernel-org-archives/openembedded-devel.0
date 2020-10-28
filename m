Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.53])
 by mx.groups.io with SMTP id smtpd.web08.10518.1603898487562774980
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JdTwRdXq;
 spf=pass (domain: windriver.com, ip: 40.107.77.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ex2qUg/7Qqn8XQo1Yjy9xxwRMPOLZjLyRSvhMvzCnfKVHobSRUM1zaQzPiiIdTeyfi1OIWQN4n3CvyWnBHpFm7g+q8j06CpFOKQvVwQVJZGRG36XT6E9h6cxvlv4LBCP4XU3d1NBoCPQQ5dzjNRS420cO5wivnPK+YRJV3kiy/6koMJBn1KTvCzD1eZamhQS1ncudXaQruLdnz04u/vYXm21w/hPU05d/JiamMYXyya4xY7+2NOdVqicZUYgnlH71Hpa/+GUnFd0/usK5574LKsvLfBQX02e+Zis58W9d+AHEFRsknKv7qimoUwPFEJa8K4mS3uCA6xJsAU2uBGUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OORfls+QcJxYWS/lwI9yll1T81b63JZCdth/MqBxL4=;
 b=DWjCEGECjoiLsdF14aUJVidZteUbMboJyMsddsolkVtpo1k05YBsy2hSDuf0gtj7EEWn2mF5ssaWw1omeAezCmfEVj1mXQSYqih30TTa8573FKSEk9i+oHaHtnsEU+LvcEj6Ji7OtSO2gC8KCt6lQ+az3/SPsx94Mfz6t1f6pAV2DQBsi21ZKZw9aRYrGNbj+aNQUN73o/tfWXt+mVyHmhhcWI/iyIbW+BebjhmDHmQLpdVYpady+dlynD25qIlFKZZFfYa06w3w15XZcTJ8yeHlaYswZSUw4gFXzLkiMpz/xkA1ZQPbmNMMPMPatTXRtCgZ618gXVVR4ReOZNYdfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OORfls+QcJxYWS/lwI9yll1T81b63JZCdth/MqBxL4=;
 b=JdTwRdXqnlvgxz2Qku2WXZLmfGTERea8I9hHl/NLYG3HwgMyw0H+DkFKz98bsw87AA9EFqS8d/LOd6ZTeHHBOh5CALVImx6QG+biNRlZmwX6YpseDqk0zKOUY+H0xmicFNgMbHbHJpgHrxjB//9PHptD1jcc69nCkV22R0krFCU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:21:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:21:26 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-prettytable: add python3-wcwidth to RDEPENDS
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20201023170246.7708-1-sakib.sajal@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <031f103c-1708-c2c9-a004-62bcd6939bdb@windriver.com>
Date: Wed, 28 Oct 2020 11:21:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201023170246.7708-1-sakib.sajal@windriver.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR06CA0061.namprd06.prod.outlook.com (2603:10b6:a03:14b::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 15:21:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3abb80ae-6f42-4a3a-241d-08d87b5522c5
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5008:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5008FEF27248B0360C3F8C1B9F170@SJ0PR11MB5008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x4BpZwkUPTLMt3+T+BtSZOfHlYGQqoosgJ5LZoZ2rY96XZwJ8XMg/nEImbPaAXzVmoyszPqwxR/Kbq8rQfLhVKPcfF54/ENhd9C3mZ4zbzpNFU4xwSuBSZTvs6SJJrHG2sI0cB1dZ8SDk/a3lKuA8sGWhBMkXyBUQPmm5LfO05GnIQaxG771qQH3aDk0/skuagrI2mIJ5ZEOMsmgpKqUeTaYFZ9h2koXoWt8ipNgp6wAnVrLdDnuwTS2epO89Upb0su2AcGPZIkQHPJ5jDVhgjHE1NOexgKwXYRI3zYh7OsodQHwdDm1MEdaUOdfNjsTtpXCZXC/+uLggfsTGcB5KVAGn1s2EA+/m9PvSwGw1cuiyOZrjMiIxUVXL7oIFVmMEchx9nv6cAMUylQO2wuUgjp3KWfWEOIAYQWaNWsNmRf65QW3eRZQSOY8Eiaf58lecfw5kexJFCtayANMciL3TQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(396003)(136003)(376002)(83380400001)(5660300002)(166002)(6486002)(478600001)(44832011)(33964004)(31686004)(86362001)(53546011)(52116002)(2906002)(16576012)(186003)(16526019)(8676002)(316002)(36756003)(66946007)(26005)(966005)(31696002)(66556008)(66476007)(8936002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0rvqCDujc3iA2OhVnRf1wVqSnedaMKpryWevX8M6601Xn5QuAhvfA+S7KDlsWFF92ywSjw9L9c3NGtWHH8s4TBwlNavGmKaanugp7lUubFN0SCN3WA0iaViP6kibX5Gf2vh94G+w+I0USDo3Mso//dXL2eyifbaW9TXcg3adM/LCITb6FV3g3pzF2MEI2HKZjvCrju87lO1EDJ/B9Uy2LOWPis9tdrkHQkyQjH0VTn1Tnm1zAQsf19uSSIgUf8GSPbNhvhgUbzo3qgN6iuNVKguI7FlR5cm8vTqeL2kBWWgkEboNbB0toHLSZU5lued4WgevzsGr5HlNUsG2G9CoDr7SnTS/+ptBl5gHTQV5MPKBAiv0/Z9udbC7I80Vc4Xm5L3hm6DrNAlkjWjlb7y5Bfef452SpBAyKbuZ3saQEa/fzcWK7YiH/+ppasUm3nPv/W9ovJvztqRGePhTAukcIZ9bMhkyQRHoErOnB1L7Cn5wlveQIpMBBoiAaITk410WmMBrk+Wy3WpCSZXBSWLMQIft4FjCzD4lgu6GnXxl3LxVRpsvktKtHfKq/EUUL/VeMTdidgj/z9TIRRlpGe3DST5BUpMzheMlroxxC25Lc9aIhIgS7LPRumqJ8KEg7oREFykuyNJh0vfgckK0lX3nQw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abb80ae-6f42-4a3a-241d-08d87b5522c5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:21:26.4413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LicnxdCCf2/GMO9syrcDfYLEYVVoYDCmBwAgqq3SCAujcIo7FteAhjbgonBF/6s72zboU1E3OyOm0P0F5BucEPJUggZZCGlv5czLK5d8em8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
Content-Type: multipart/alternative;
 boundary="------------BC2D12719FC2570B4159D5BC"
Content-Language: en-US

--------------BC2D12719FC2570B4159D5BC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/23/20 1:02 PM, Sakib Sajal wrote:
> Upstream prettytable uses wcwidth since v1.0.0,
> see commit 83689922af58c152993e8ef5bcf7dd1464371272.
> Hence, add python3-wcwidth to RDEPENDS .
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
> index a065b6c47..79341b9d2 100644
> --- a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
> @@ -28,6 +28,7 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   RDEPENDS_${PN} += " \
>   	${PYTHON_PN}-math \
>   	${PYTHON_PN}-html \
> +	${PYTHON_PN}-wcwidth \
>   "
>   
>   RDEPENDS_${PN}-ptest += " \
>
> 
>

--------------BC2D12719FC2570B4159D5BC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/23/20 1:02 PM, Sakib Sajal wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201023170246.7708-1-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">Upstream prettytable uses wcwidth since v1.0.0,
see commit 83689922af58c152993e8ef5bcf7dd1464371272.
Hence, add python3-wcwidth to RDEPENDS .

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201023170246.7708-1-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
index a065b6c47..79341b9d2 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
@@ -28,6 +28,7 @@ DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 RDEPENDS_${PN} += &quot; \
 	${PYTHON_PN}-math \
 	${PYTHON_PN}-html \
+	${PYTHON_PN}-wcwidth \
 &quot;
 
 RDEPENDS_${PN}-ptest += &quot; \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------BC2D12719FC2570B4159D5BC--
