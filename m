Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.60])
 by mx.groups.io with SMTP id smtpd.web09.26158.1605714789375770589
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hVJat4Yn;
 spf=pass (domain: windriver.com, ip: 40.107.94.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqtSoGodnFgYFTRwky4lT81qMW6hhn59ZwZXNYWhPGEfj3ko9QsXwEX698Ar31DmESKBHzu/cVbtxogCfrkAXUEPjirkKFeNBIasAdfrLB36GCC/8R1SAFKnZXD/FiWcf5Abr4dleSvN2tb43nYU/TZH1dZA9PpSNdFZ6zge/t1P651IT8T2MJ74m7diiM+Zuu3U2colWLCX/tJiKiCevCNeqpwteYnRQ8xwdxwzp97ofKmeBgo67q++v6EOIqFbOWq824y4GU+ne3qjQfK1EcFRRBVOi9jSZrNYYjlD9YOZwp1Dl1YKPQ5RcQM8hhI8HVaJZtm0MVOHmPcaolx8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HSaRq6yM0hJJrvhEueJcq6poh28OmViR4gTm2B5Lcc=;
 b=ATDSl8bG0X3dnlcQBC6GpcPjHrRzJ0fgQRX9IPreN1bo4iHwEsGS+A4OBcSfUOGuyuXI8xUnljWqwR9cYxY98sk49GfLm9pfi3NaPb91t1j0dMGSbdhEdXs/C/HyAYoYN2fGtRHz2nh0BJY80TpPn73C7yUpYfiHy0Ey57Cuu0rAMz3Efj/HFt68U03NI8HGyKxUezPjIpw7MB0FKVRjCrbiF2U0auJPuYWC6aBnNcq9CvtnCWbGDCm0eI/22s0y/fCk72pA4VGT1j+5D/B7BKuXLd3JSLq0aFpZwvUpuw5HfU4rT3Gtd407uwWKggLRDRT+jnpQhzUp1iEa8Tmr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HSaRq6yM0hJJrvhEueJcq6poh28OmViR4gTm2B5Lcc=;
 b=hVJat4YnrUPtimRYpEe2gxD3NsYV9GyPgbDN7fMoXttqJLp8Bwowyli7Tt+3S0sR1pStnO3PLZR2yNuMhxLZWDwvT/UJesGIvM/4729o1bXlOvZErUVLyVhS0eBfr77scRu6IKgMcBRyiMH/JGlXqf2V9LMXJq6jvV4Ic+7AjRk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3974.namprd11.prod.outlook.com (2603:10b6:a03:183::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 15:53:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.029; Wed, 18 Nov 2020
 15:53:08 +0000
Subject: Re: [oe] [meta-python][PATCH] python-grpcio-tools: Add missing space for append
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201114161047.1906014-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c72627ca-fa39-5977-78a9-1eae94af8e6d@windriver.com>
Date: Wed, 18 Nov 2020 10:53:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201114161047.1906014-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 15:53:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 059b5a89-e73c-4311-2141-08d88bda0b2e
X-MS-TrafficTypeDiagnostic: BY5PR11MB3974:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB397468CBFE69603F87F7B7459FE10@BY5PR11MB3974.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7F+prPe6z5CtUP0rsW3Cm5MS29UuJAYhmmeQePzB+U9RclhYAwJJzDeq7tzq4j3UdF07jiflRWKlGdnaOzK6hHaknjdhhWPK00iGKW+ZM69vddKFphW5MyXspdYIdl1D7d9EoCxC3fcxXR9S8dkfwDcgS1AXH4QrDNf+vQB2+riANwAYkaQRcUMVY8IRWjmoKqY+kao3j4LW4zCcTaXhpFjW9AO7tIVOfe1Fee8iiN3eld2spA+vMv2b2lqbhk4V0sXtsr10gcFuWwYcOwK3J0CzPMv7Wzq4NUW8eqQabnmjh41yJevyP4aTdY1fes99JrcZh9a7IhhEC3p4NSuf970/BTRBAUVQWqSfj/ZsGKh+8U6xQmxzlnbuaXCvi1v7s42D6kAvoYrpGwAyJVvPOR9WtbUI9KRN6KKG/dsX34rCUQ7bSnCVDjwScxKP1aefgO0TUVDhoJWohBgOHgiUIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39850400004)(376002)(346002)(36756003)(66556008)(8936002)(478600001)(52116002)(33964004)(66946007)(8676002)(166002)(31696002)(186003)(86362001)(316002)(53546011)(83380400001)(16526019)(66476007)(26005)(16576012)(4001150100001)(44832011)(2906002)(6486002)(966005)(2616005)(5660300002)(31686004)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	9m6PpxBrOSUKXEleLhcEScryOPjChpTnK7vBNOmX9oHwY6xSx6vElNDQhj2sgEBCWmJyZbrgRU7togdbInmxKbJSxLTb968aONnUT7c7QzWzf+utwKPVmUGz87f5loORughWWKAht8f8tCADk+s+GEJEUMtYCEVCNAN4h5CYuoS3gmzoWOrCZCTzbEEl7QM/k8vfPdMVR6r5SUAabdpgur04Ju9ajThI2pY4LhDcrKyqQ/bwAfzM58X2X9iKERCrVMRS7NiWjZV226PIMO/pPE7fh2TWtoEjAP3YMJlnoHXwia8doaXglJQ5eZywZ2IsXx0qlLF8wyJ/jIRKxny0BVv/89xta/L8yeQyPvV8wBKa7PWUJtqRuH/Hc8PTDe5fcjzL2GeKw3pYMrmWudGtDrqcorjvBKuy5hwaBuCk2euXPdJjVCrtQ7oGYy7b+F3oFxgBucbYVRWgQbSY/7EmcfxVnJtHcNmyfqs6Hnf16cAt/MKs2UZwMkO4dmVTLKOIaiZ1EoylrW+jg0j+h9StKJwfUYAFrHoMKnQApjIyIJJbl2bobIQFODTeF35lOEXEV7T0ZryHiBKl/sVWgnexLqolr6jFFpsierB6nVlfXF5JH02Np/I/9hhF5IIdbHU4QB1CG8pAMVwIpAwfg3qPkg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059b5a89-e73c-4311-2141-08d88bda0b2e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 15:53:08.2207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TPZ3zIVYS3n2lmpUMuuw9bo8e08ZYrR91ZAWpXRFaZMIyidfTPKBq8bY52GJvv6ObhzyTKgZY3cWtmwcT+gqdR+E0c2SAt7ECUAXVrb/9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3974
Content-Type: multipart/alternative;
 boundary="------------16D23C5D011D285EB737F331"
Content-Language: en-US

--------------16D23C5D011D285EB737F331
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-14 11:10 a.m., Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python-grpcio-tools.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
> index 1a15c48de0..6675f904c1 100644
> --- a/meta-python/recipes-devtools/python/python-grpcio-tools.inc
> +++ b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Google gRPC tools"
>   HOMEPAGE = "http://www.grpc.io/"
>   SECTION = "devel/python"
>
> -DEPENDS_append = "${PYTHON_PN}-grpcio"
> +DEPENDS_append = " ${PYTHON_PN}-grpcio"
>   RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
>
>   LICENSE = "Apache-2.0"
> --
> 2.29.2
>
>
> 
>

--------------16D23C5D011D285EB737F331
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-14 11:10 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201114161047.1906014-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201114161047.1906014-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python-grpcio-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
index 1a15c48de0..6675f904c1 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools.inc
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
@@ -2,7 +2,7 @@ DESCRIPTION = &quot;Google gRPC tools&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.grpc.io/">&quot;http://www.grpc.io/&quot;</a>
 SECTION = &quot;devel/python&quot;

-DEPENDS_append = &quot;${PYTHON_PN}-grpcio&quot;
+DEPENDS_append = &quot; ${PYTHON_PN}-grpcio&quot;
 RDEPENDS_${PN} = &quot;${PYTHON_PN}-grpcio&quot;

 LICENSE = &quot;Apache-2.0&quot;
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------16D23C5D011D285EB737F331--
