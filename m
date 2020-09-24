Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.86])
 by mx.groups.io with SMTP id smtpd.web10.26212.1600976672349741815
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e36IWOG2;
 spf=pass (domain: windriver.com, ip: 40.107.220.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr+Bm2q8P/bRwI8+35wrxjZPBdK1WEZCL22HVZJAafUm/+lTEtqWN3tMQmulgP3WuzNW0l0Ay0L3gjs7jN3v72+3HrQ17cM1+MVKnzmQjYK8ui/VZamCcrMD9OPFBonomTDrYx4EZZkro8sGf04Ri5FoAs8KE/oBEzEV1fAkVrCsanPl8gC/2p23zXVpu1qZxnU6+bukDCo5jVTN0r7sqabNUZREjRFgqXeYK5KtDJnarOypXYdqAn0Qiizf3g1qhPmrqlpgGgBIVW/RYyB/SJ3goyyFocuHTskAfRJpTjnGwwdMUpIWVmo0NIHZtrwJ6DGcIRovqViQRCDabYXcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lja70Oj2evG/XeX8U76NNGV09fuwvn4NyLHZxdf834=;
 b=M7UjkWeemsPHJzAs9TdaXNOwngELiefeH58hX3NTtNy2Ubh4tDC5BIoPUeYoe7MwHED8g80px96LSB1nvwZJGWcZwo1ssrCOLLCTcUokvhAyi75U7RB8m2orLuvQyyJoeRGpXIBHkfCU+l/XXH1XYUqIgMlKgWx4KaGYjOGn1vo1qkE931B0lNiJr1FpNlAuV3uhjLJRF6lIO1ZTz89DCXP7Pw4HbwEFhXusvgDLwuWJNUHOQiT+AXlg06WS1aOByPr5KOuNMk3mkCEUa9lFFi5VtPEF0L/kY7Tqxur9mc7NOt3jgslClC5QZbUkLN2+LGhtMTUPzcOrs21axpaS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lja70Oj2evG/XeX8U76NNGV09fuwvn4NyLHZxdf834=;
 b=e36IWOG2Wm0U7ALWJHvl7oPnrZ60p3yj97t3QTpiMvMedcNBSGZ3aCSJQucbtnYF8MMhR12PHq2zQ0s26H07hfJtWHeuNckyJI3NnPSzBHcizJQ+bCyKwjnAgHMkkF5poOupISS40LZHvDoPznlCC/oCaRYDK/7TWMtdkjGGN5E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Thu, 24 Sep
 2020 19:44:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 19:44:31 +0000
Subject: Re: [meta-python][PATCH] python3-pykwalify: fix missing comma
To: Hongxu Jia <hongxu.jia@windriver.com>, raj.khem@gmail.com
CC: openembedded-devel@lists.openembedded.org
References: <20200923082551.36737-1-hongxu.jia@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9b61fa44-3179-187b-2a30-0f51565d9a49@windriver.com>
Date: Thu, 24 Sep 2020 15:44:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923082551.36737-1-hongxu.jia@windriver.com>
X-ClientProxiedBy: YT1PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::30)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 19:44:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 286043db-40de-4f25-0b6b-08d860c2415c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3559ACA486D821E92E8CE45A9F390@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rl/KTviiLox3LANlhNSU/Xl3uZuO9q2WkD1FinmfSif9r8uA508JJBcTy/z5CgNpeYJa4FBt7hurOXIY5aUpChhEAADjszeG+Z+13hMh5KljjhXcMPdJ0kPFJaLiX/Gx2q0XWvT2n6+WC/4nuZ9r+jkfLHBR4ZIOwkSZ7cseFkYzIAm9WlA/bR4jRLRQ6CEdcUVemjoM6q13HbXERyHea1B6mYH9i16h5dMNQV+dobhOda6CpOf5es8WpCbT+ETEJVlRlkOcee3gJ5cuIgPczrc+5DggfA/5iZj5AtXW6mLfqIT1nP+F1RTOaTQcibV36yN1DDruyilWujDSsWCY3HWIY5o7ZXV0+MEJGW6NiHuiRgs9ImoCkoIF2q49iQFzj1jx/jKO+JE7nxjHAVwz+PfSdijOR6k4lT0sTxZxOk/HKuUklT5qy/j6S1AL28YvCJeGJ0iMaZFfIO9vhb+CIUjJzoT31kITSiiP3GI01jEEW6iJ+2TSnJLlLgrRAwgl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(66476007)(26005)(83380400001)(66574015)(52116002)(53546011)(36756003)(8676002)(44832011)(86362001)(316002)(2906002)(66556008)(8936002)(4326008)(31696002)(31686004)(66946007)(956004)(6486002)(5660300002)(186003)(478600001)(16576012)(2616005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	r+1fjsGS6I15sLCHFvS+/qVfjqyIWC2jlG/+FzDL/xnPIZ4JXKP3Hw9oGw9Ux5WUw/CEmUC2IA4rQVBcHiQsXeCmPK2TA0wIq2m4M8nVVGxOvhuijRiDWNbW9tIK/y66Pda3a32XJSsdUSEgC/cwJsv6KibnpunVtiOQv6vH/qLSm0B2E5u6eH5DoREyUfHE/z/ac/qY/rzz1Q+zW45R0Crxi8ll/D6C5zwg56FPcbtvd9B8klCUuIaCvBtQMKG5KpYoPco9qBjI7pfKEIrvdMyKAttOEFdCNBqeKN8lFY4cybqmp/gm6fUpMn9FT7ASwBwDcx+nkb5yKRVUuf3W6NZLHNh0AvZ0XjDLjQh+rxmFoouNgq5trJWFvf3QCxFqtIaJV8mGg6wr5SRwLIxSwJwjWNYSiOUn+IgzkDqcpyBDGCQI4ecHG0DrK7ouVx6D+tk5dvnEkBAA3AoZNUdmNJZl8v+rvV5nX8C9aO0cMiFVnQzvnfWiKmD1yq+uv4G/49Q8qBITM3wuPRAylliXdly0PKm3NpJyqeQJ2CaA9AggnW6lbf5ismNtFParwbrw2v8DGIw61O9DXG4oWuNB3cqDgfM5xGbOb9co8UnYNcrPNLAUd/U3USu/ejC4Yw2gdQZ2yzTeQAyBKRk+AcclPg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286043db-40de-4f25-0b6b-08d860c2415c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 19:44:31.2556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Nm6JfMiamWczgZpPbgD3JNhQg5hP3W9BxU/h5IlWiXz4mWeFcdCOjMky+u6/bUBXsv57BL+2kkK0Mi3XzgXiMoP4gNTVKVIVplNLPdbG3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 9/23/20 4:25 AM, Hongxu Jia wrote:
> ...
> |/usr/lib/python3.8/site-packages/pykwalify/rule.py:343: SyntaxWarning:
> 'tuple' object is not callable; perhaps you missed a comma?
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-rule.py-fix-missing-comma.patch      | 34 +++++++++++++++++++
>   .../python/python3-pykwalify_1.7.0.bb         |  2 ++
>   2 files changed, 36 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pykwalif=
y/0001-rule.py-fix-missing-comma.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-pykwalify/0001-r=
ule.py-fix-missing-comma.patch b/meta-python/recipes-devtools/python/python=
3-pykwalify/0001-rule.py-fix-missing-comma.patch
> new file mode 100644
> index 000000000..689355eea
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-=
fix-missing-comma.patch
> @@ -0,0 +1,34 @@
> +From f96b76efb810d7d559254d0ec58de628e09f525a Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Mart=3DC3=3DAD=3D20Bol=3DC3=3DADvar?=3D <marti.f.boliv=
ar@gmail.com>
> +Date: Mon, 13 Jan 2020 08:42:05 -0800
> +Subject: [PATCH] rule.py: fix missing comma
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +A line in the defined_keywords list is missing a comma. Add it.
> +
> +Signed-off-by: Mart=C3=AD Bol=C3=ADvar <marti.f.bolivar@gmail.com>
> +
> +Upstream-Status: Backport [https://github.com/Grokzen/pykwalify.git]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + pykwalify/rule.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pykwalify/rule.py b/pykwalify/rule.py
> +index 7ac2c9e..f044b69 100644
> +--- a/pykwalify/rule.py
> ++++ b/pykwalify/rule.py
> +@@ -340,7 +340,7 @@ class Rule(object):
> +             ('matching', 'matching'),
> +             ('matching_rule', 'matching_rule'),
> +             ('name', 'name'),
> +-            ('nullable', 'nullable')
> ++            ('nullable', 'nullable'),
> +             ('parent', 'parent'),
> +             ('pattern', 'pattern'),
> +             ('pattern_regexp', 'pattern_regexp'),
> +--
> +2.18.2
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.=
bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> index 7a30f1f67..2df30aeab 100644
> --- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da72ea5159364a2=
cd7f45c6dcbee37872"
>   SRC_URI[md5sum] =3D "58357f1d0f77de976e73dbd3660af75b"
>   SRC_URI[sha256sum] =3D "7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198=
b402e8015defcceb2"
>  =20
> +SRC_URI +=3D "file://0001-rule.py-fix-missing-comma.patch"
> +
>   PYPI_PACKAGE =3D "pykwalify"
>   inherit setuptools3 pypi
>   unset _PYTHON_SYSCONFIGDATA_NAME
