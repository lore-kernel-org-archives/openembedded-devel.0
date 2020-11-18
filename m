Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.85])
 by mx.groups.io with SMTP id smtpd.web08.26241.1605714803194427037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fnPFp9hx;
 spf=pass (domain: windriver.com, ip: 40.107.94.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErR7Rfg24zMr7OTSAPTOuSUH9T+tLbGicZyABXpWJxxdRce4R/1bFP+xoMOKp8FY99ap793Zat59q6QVAlPNbuuenfRZ3vORW1EIOzd1vS4YWYGepxDhnCcAILEpgyMGd/Or6apVOyDJKSuaS6dSga5E7JF7qucV3PssfMaLJGR/ToTKAGhYl9rvRd96aiZ6uS1OYVR5zdAqx0T6eHNhu1rttSWAKMYFAegyLZb5Z50pw3HaLL2YsM4Twqjsf+fudqWBiyWS98+5b4U3OW8WChbTfpb7iygWNwpeGarDiIs2GUCQdFQirpKFzqiK1rhC4Ach4xlYQ6cmSpDygtehEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzSrNP3+Y+4AYginc9MTzUugaPyfY6Pa/4YAg44H07Y=;
 b=hW84GccQnPdpMt9XaLq35HmMxh/iq4mhMysJT+Wli/zwjki71LmVn44B26c3yrB802Ke4btt7vVUKzz8kcJXMLvFYh0Wf2qPu4MxPE6yWkTNcwmdfklPYw3qKrxzhuj96B/bNrO0MnQQVf5N0yO8ptBIR/EC4GySCK2sVg90/pXj20+S+yqOgZMfrKSKkIpvoQ+uJkh7PkKPcv/wk3FiGw2Raw8AiDMguafOyHcOcBmQ6uTAKfNQJ+GZbr88mBlHVcqhmWb5DpgfGT6EqrCftL9oKu4DbW7qdTgRVsv8H2nvdaeVi51b1l7r6zb5P6JVAaydJmlSisFuuMgxFz+ajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzSrNP3+Y+4AYginc9MTzUugaPyfY6Pa/4YAg44H07Y=;
 b=fnPFp9hxRDlhi76u8A2ch4M2aSaqyR6OdCfCUrVlteK5rzJXUlEGZEv1reGl2ABy/rupjqZPq6vcDcsw33SdRaDn/s5LKx1JkyPwt6OuQ4sw9RnQYjYAZ2W/H9dAsqdduLU+SAkBVPeOAL3QTKsyu/ijP0I2HxftYl7eFu40p14=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3974.namprd11.prod.outlook.com (2603:10b6:a03:183::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 15:53:22 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.029; Wed, 18 Nov 2020
 15:53:22 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-pykwalify: Do not unset _PYTHON_SYSCONFIGDATA_NAME
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201114160019.1885976-1-raj.khem@gmail.com>
 <20201114160019.1885976-3-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <788adf51-e903-74b9-c6db-90443eccb57e@windriver.com>
Date: Wed, 18 Nov 2020 10:53:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201114160019.1885976-3-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 15:53:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69490326-ec4a-4033-3262-08d88bda135b
X-MS-TrafficTypeDiagnostic: BY5PR11MB3974:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB39745FF92E47C48532924CE09FE10@BY5PR11MB3974.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ElflN/ctXuBLVf/6mwEnSNzagivt6ZZFxTF/ksCQU49dXlw3wg59feKN5b/z0K39JLZcU1fz2rPvr2UgqUM7zjt9hgUmKc1YzU8hiVLUWRVmODqjXV8n2sSrxvvjDx2QBFkh8WUyRTqEkzoA3o+u2D/D6Bg26p0QuBCMAfMcP82EZ4xuNGbjHRqTzAOkdHZBO2xrzVgY/7BYSnSedtPOOwKgWfAHVoM375+c3KtA0uBp8XN8H8RvXveYZpHLbybjVfms1K9vPYhMgcPw/IVIOcVXbVUA1ndpxjTLT4ljBDzhV1B5VKPSqF++6essPlXNd0DnS1Qc8EoW9j1i6ZJEH5c+R8Nob/sLN8WHxsQnmPmBQWRTFJNY6dbG8DfWcmBpY9qn5TvNGYftcQauW8RPR4NZmh4G8xrXgWzHeZdPExI/Fxw48M5AoGGqawMYuNGQEWXjjxokdA0KaO+/Z/07Rw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39850400004)(376002)(346002)(36756003)(66556008)(8936002)(478600001)(52116002)(33964004)(66946007)(8676002)(166002)(31696002)(186003)(86362001)(316002)(53546011)(83380400001)(16526019)(66476007)(26005)(16576012)(4001150100001)(44832011)(2906002)(6486002)(966005)(2616005)(5660300002)(31686004)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zQM/lG1WwrmoII+zHR8Ckg9JMBByQbopCK7+lVb7pi00J47lQXz6ePC+TW2sWaJl9L6pUoZPK8SEcy0p4c3FYRC8Efg1jCbAWt2NLvJ8yyOmHjIem0j7LUuT+LI2+9CpXqTtzHaY9ECkfzdAcimeEr/7lHf7RrohwYBlZ1f8p4gnJ69A6DIrkajL+ObuTGg0vKTOtxcynpAuFHyQwBpYEHMo/7jZ7Vuk0t52lLAzgUsNgC3OHWBzqnUgT8d1q8w7wdGIfL2fic+aCoWCmo1FQxCOzMFd+tbzUnqXIzJkQqS18aBoSX4EfT/bMHBoU+XLWaVCMEAFy6wDlGQ3tiA/y23TvRzhwmLe04Ck+1ksmU7G6W+OmHbaqxZxKpi2cdZ/SM2TJhkWNVmHKtEpcEG1xSkHSBej+BbbrmZOnj635dL3UNkYD+IJzfFeYR4iXtwP+dfgcq8uNkU8NWXIVjxICj8+3B/sT4lFVP4nOu7t9Ziyq8uerjV/zJudNhXsS/MsT+yROJDQgL5EL85usqHGqeHLbYdElzc/MdJcNujB93nBl3ktvJmqQuj2T05AILxE1TL2FMogHvJcM1gtQ5EqY8u004fbgl1l4BENq9TPM+vQh6MXpr2K5+RqVw7X2ingWMaEqrbXj+49CVbPYE8aaQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69490326-ec4a-4033-3262-08d88bda135b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 15:53:21.8869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mez2V/WFwEpcZynbQWlCGMlkz7t9xt4rKrqtRgLT9AVSszhes7lu+DmPmFmVRiV4BH/RdPF97aTVVM+CcBVSlVrb2B3YWrts/2WLVKFEo6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3974
Content-Type: multipart/alternative;
 boundary="------------B496C0154047CB84F63E62B6"
Content-Language: en-US

--------------B496C0154047CB84F63E62B6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-14 11:00 a.m., Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> its been shoved out of setuptools3 in oe-core now
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> index 2df30aeab8..2e1bff4f26 100644
> --- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> @@ -10,8 +10,8 @@ SRC_URI[sha256sum] = "7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015de
>   SRC_URI += "file://0001-rule.py-fix-missing-comma.patch"
>
>   PYPI_PACKAGE = "pykwalify"
> +
>   inherit setuptools3 pypi
> -unset _PYTHON_SYSCONFIGDATA_NAME
>
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-docopt \
> --
> 2.29.2
>
>
> 
>

--------------B496C0154047CB84F63E62B6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-14 11:00 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201114160019.1885976-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

its been shoved out of setuptools3 in oe-core now

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201114160019.1885976-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
index 2df30aeab8..2e1bff4f26 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
@@ -10,8 +10,8 @@ SRC_URI[sha256sum] = &quot;7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015de
 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-rule.py-fix-missing-comma.patch">&quot;file://0001-rule.py-fix-missing-comma.patch&quot;</a>

 PYPI_PACKAGE = &quot;pykwalify&quot;
+
 inherit setuptools3 pypi
-unset _PYTHON_SYSCONFIGDATA_NAME

 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-docopt \
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

--------------B496C0154047CB84F63E62B6--
