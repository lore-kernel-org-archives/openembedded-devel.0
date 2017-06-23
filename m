Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0075.outbound.protection.outlook.com [104.47.33.75])
	by mail.openembedded.org (Postfix) with ESMTP id 58BE578249
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pIveYjJ+shwGSiL55VxGUA93b4YYS474Gvq4vTpUhV0=;
	b=rp+Y7A+gMEHL5e60lBZsYT36zU4sjXZGGtJQj+gMJdb0C39EVEjU0lM9qffnDvaHK7S3CtRdoYfqEpl6F6eA90LYALVbAwMmWJEFfH4t9JbmZvUCazoAy/Q0lSGU+2Bp/J0VXZ5+l9+pLtYWuaf35o7Z21YrvK99+STPg8JsXDc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:01 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:34 -0700
Message-Id: <c243ef1b3753a354b49debb6792e0aa7e1a6d6b9.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab439f14-2590-417f-88a1-08d4ba8a0aad
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:zns8wAod4rV0q3PNcLTZ4b8kPKbiNbP4qB6lnUOn9gmjMNqBSuTWvUeZk2Wn0Pa4gCZkqm3Ta8Y0C80DDloYucYt6v6yDravVzY69Z/NpfhlnEWQiMY7T5MWXOlSlQ2VBg2QI3uoInaGrr9UCk0dBM6MFVxzvYuoXEhoEZUF2lSxM2TnKIAOn9ErVtVzO0Gy7awbWxkoJzft7Thm9bd4JfLxeB6L8SzR3Hw2yPaxlkaV29mD/ZNygeWJF5wpX/MJ0QsV4iiIG177iv/XDFvJNm5nwEkUcq10uksj7JAc82Ek5rxanvZFqwENCeErDTKfyEJyEJJzzYzwMuERKn//sLlZ1MPyr05XbOVUsnRBGQtvja4gF6zPeP5JxP0v99FTcrCblJs8cScrXpY36cUCTAnXqIHjUG2ogEAu3B6hEF+IelZQvh3KKcTr6re9iTdztuZXeyLDFfkooeqmEnsRg9DyCm3XSmRTMsT5OGrmbkXCnX7mnbHdK/N4pOfuvorlEHIRAmv/HJfGf5vrzfkqw+DFC3aDoWCy8VxSIHO2h1lU0wVRt50W1SzDnV4nXbIzxP7/2T1+OnQRKfVhq9abkAd8iioeXBFzrIXrOpdi1Gh8ybS3Xiu/jQ1lGBfq5ZFuQ+ihM37drVW2N9Wb03caApqji5DN86uY485LSvZHwJ6qchw8xCUeUVCEW0eJI1IaSWz5vF5vpRD+PDmd/OJ8ai0VXNkHuJkXwOH/DEaZq90=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:8mrXRlDzuzqrVHaClFJ6EqQ8EJq6ndBa+P3DRN0vgAi/FZesEw4DS0Ty9ns49KjF6UpgNsp6Q3owNNCF1kWfTub6JyRYheDOQ5+DfLWTBX6n41jicxYroYtuQT/4Yrw03k+jkKkvNp0N/16VJ65mHdWXH3p8CZh5HAcvwpnKhj5cfMDNA/b2PdmIOuoGxIUE5qurZK/MhMEHByyNH6+MzFx5OXMvNrKkjvxZFDh7acS2pAoUTVNeOWDwK1sMWwgnguIauGPqxPVyIbFtBW/f4xUCvJhwWJcLotLZpf0huWE3wGh+cVA3cQOCqqMVEmfhP8LXtpif78io1vRuPVave9CpqTixcAkHK8jM+bIxVLRJpM4lY+DxL4TqpgWHjX3ab93Q126BdeRPDSnGwNfysdwWb+0kOxYruVJhMiADTbQj8Eg4ypv2xPrty105IilPYR8FiGuuX9zk8w11o1riqukZ60kNX7WdRYLfVGs6ZUaZ78TKEEMbJqXrp2IPCkcwxlnxzWWGeJB/ZLF0p2mt3x6qWawRMqKrOKhqApnTot2L8m3SkltLH//o3T2f0IpT3fcV0V9e/aD/GkYN2okNa/FoOIS8z6i6NklBtmKxfrEmeWZ9/ZkQbtZvMZLhCjSpaeOc5VTqxOZ8CmmSnvF16SkkersREFblFJI4FLyod4NxsP+FlbQ2a07PjaOOuapJyz9hB/ZADhGuyhBvATxYMy9eUOlwXpHUhEhLPLMQ7xTtxSUvD4PvvBxZq6eIaU9kymJ9+Ac0i8oCRP1ncmhqZKU5n3plMphFK1PThLVX24+GBOU0MJVwm5rmAbLnKbzPh75xCYQrLE6dFoL5Q9PZwKX6XX/pFUP5kQTSuG1TonvY+TyCczNWFHLU4sFSzJnpznba91YZXb3+lhjXoDvkMQ041/OXSXme51otQuA5Vlo=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:n8FSk8NulEoSo2jhleXKeC/NbXT/lMBE4lkqy8QqBUUoRTGf7IYBraP8sA35P8H6WDqwKFU3jR5d2EgiQGplfKw4INyhXmRvNIPsF+p6KBfkqj/nIUQwKX8b+ktqAil+SY7eiElQ2LNnGmWWhuDHH1leWuz2xSljzUuVDCVLnELkzgCsJCzAfRSPi0gUJFV98TZPKBuBBbzs/jRXfNbN9m9R2kGgziccXHvTw0l7+Y+0T6Yh6vPkofDx5CnzD5rad3ZelThbJEm6V11GeCZsBzrZYII4rjAkUoZ7dBUTyuPZtaXmcojnMaGfze2dZi9e018vaOellrZU9hPRNVYUpv5af4VC6njSRdMTaSniGoEEXZm7UrbamJlPUqlZDTDQC8sf4LClvf+rpR51x3OUMJ1vZNaC9J+WZkcBs02Ew4GI+r6fWiGQ2TFHf/HbBQxcugE7pFCXlvMtiQORyqKo7Ym7gaH3cFaBNwdmsUEM5n61y3dZa+f92TgSKRs6OiHa5OLDc7/XHtQJTVoNZ0G2cZtIp9Q9YyCgMoVINGFHiFb4zr8eXhUdl9qXHZsHeK+bT8txMAWLR+4HJBizB/NIoq4wA8smI25BXWNWq3gqF6lgQu85cPsYKY9qfEQnKmYprD2aEG2iHWXI+bfKIc+3ZaNsjypejDuF635/D1NtsjU=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:aS4F0y/Z9Zbfi4fEb2A0bDgGH3f7EK7h0vunletK4LwGzg9kQ6dHx4uAEYA4MVGMgWQcV+lHyJEwY8DPTfXxdJ5R8n1g97q68vqZS8VgndfCmKPmlau1nOGoEe5o2j+0Kv8xG+gMRqQGVMxrNdXSD5OIT+KwO4B/5UKDk1Hwq3LVnaz4u2OD/Eg7mTrhHywjdU/K5i08cuIiCwBdnKGvsY5UQ+7v2aI80pThqM2rYNljB9+kiMbhqfMH1asVw/eGrqsuZE+SYP70tv062nCpceJt9BQmYogccpX6EVVaXUNdzl22OWlPS9rKGP9ytPw1OczLs1q1OG0SM4gTbokjiw==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29358FB584A993827EC00195ABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:tpw2yhhIzkF/7/SzWKeOnPeBABL2q6l4Db+iO8iV?=
	=?us-ascii?Q?czY1qCqcRA0338VAQqzzc3qC0OEEwMF0Jh/hB1Z/Ves+fIXM8LqSbC1ZAyQs?=
	=?us-ascii?Q?v4wd1nnX6/8WF5GH8g5kYkNgKea5xmedIM+j2V1wXMaV6lewpBFPdf48usgY?=
	=?us-ascii?Q?OFqeWqt2p8ttYFUgIo7VW53Wz00ujp/xDpPOijz+AtX21eyqxEclhLNOxM9h?=
	=?us-ascii?Q?eMWCsPS+cE/ASoPz3MJ4yWYWEiVXgp6H9DRc4ReWoqC31siJbhqymSl6wuFz?=
	=?us-ascii?Q?aC4nrA/B+cctyVeO++Xh43if+b1HToVDru2MMsOx68KSqL8hZnpCEvcxb1jS?=
	=?us-ascii?Q?MWTf7k75ECUKzzqL7hu627xPNOzC+zXaxTQ6iNkipT11DS3c8uZ/RW/NMOG9?=
	=?us-ascii?Q?Npv5qKZEU4KPqWvBY2Wq3Qi9TkVK/t4y9sohcIZqqYjNGJVl+e33Z/MiOqsu?=
	=?us-ascii?Q?IKZceFUl3EDBxh1bNRQDyZKqV1SeLmqhtziu4eUY4T+0vweBtuljgsywx9wJ?=
	=?us-ascii?Q?7V1JjaH1OGvI8ym20AAzuSF3SQ473GDyj8YXSll5hhfLekVhMaWumQ5JkM5w?=
	=?us-ascii?Q?xeyhT+eVev9itRGd/dNmsOS49fHsxALcadKuI9DTch3HIDp9szGU/9fxsyvP?=
	=?us-ascii?Q?utkrT8XB4Ub9ob5tGvqvw7c6BwcSU+BD3KhQD9/C0GsQSTvQvk1uyPxsYiyk?=
	=?us-ascii?Q?6bdbsHljiqFXJWRFvaqUXCkFHbakN0g5Bx9FJdjbsU90c1xWdNQMnyGMkCr6?=
	=?us-ascii?Q?DBm+GoxPIWUE0WhWWSJFQgBI/U3Teoq/OJyb8vf8WbZyjSj9/rNZERB5I8rB?=
	=?us-ascii?Q?QpfDrxrHpZ/gypRMTgc+jzpM0QBzxWWubb4e+Ax+Lzc9QQb5+suwn+b9lbD+?=
	=?us-ascii?Q?cOo2qvesKvsvfMrG+Idf9EfCRLbCAI0DoanIfFH318l3fcf9jEXBP+IzNAAC?=
	=?us-ascii?Q?z5pGfF76qUDSuPIyu5WOVL5Z9VvYOJ8N6aVqOdMNROZHfq1d2p0lJ/1EkVPI?=
	=?us-ascii?Q?arhkAy2lQNEZT57obwJlts4F3z+e98nnWEmSirICIoA+FDqfquAFZIicvtgP?=
	=?us-ascii?Q?x7NEjqXNv0FtigBRJ0oNJd45rieZwfedhl+m2hpbVWJ8/WyBJV4k5Gl5Yu8L?=
	=?us-ascii?Q?gkgkf6Swmb1auYEQTEmnWGGiWeZqB333?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:mPU7qNdNnWcbQE/TZMpDtEJscITS0KVnEIBQ3Ht?=
	=?us-ascii?Q?hpUlQnE+w/+Lh4AQwbn6qVXXTTw4W9YEImm9kkrPdHug+XeiKYrFm7hcjdIl?=
	=?us-ascii?Q?M+kPZzvKUX7/wcJ+iOcHk9pnPlucAiLcisexxnAslPDiRZkCHmLsNcdscswI?=
	=?us-ascii?Q?esfboEeANGnzaGI2W/Lr58yRlcNnt8P5LAuxgXgyY9z0Yo0g8Mz3hYEFSyL/?=
	=?us-ascii?Q?xymQht08a9/p2SWxVEvrtLFPxQvOsmHIcVLGm1Ow8A9fatyYLQrvcJzOE7YG?=
	=?us-ascii?Q?XSGdGvhDz+1odE1HnScmYmdUfEzSv5wniH/JNtMEAxxZ3GA1z8ACylxV4loJ?=
	=?us-ascii?Q?PypUx68cfeAqqYAGEZT+sdx1hEiIozbsPZ/0+Sc72NTsQmeuQZB5jDpG2Vo5?=
	=?us-ascii?Q?+y0AgGwH2Iezedac2CKlXHfRWb3Wux/SdTQnxEK5J3QbOuLn1DfOvLKDZank?=
	=?us-ascii?Q?hJLkItBRiQH3DyBj/cGlkQNcrFRh4DUBMJVzWstsA8KEBZhGm/Fb82UB/MMx?=
	=?us-ascii?Q?PlqgCAycIzpc5h178UcUy/5/OcNHf1E8ZxYnwtMHZlEgfb4GtWCcwBy7mbkf?=
	=?us-ascii?Q?G2CZp3gMiCyFYBPyyJ9P/hM3Kq6tbZDOTq8yjZSXlrBNh+v7aT7o3dQVlvUB?=
	=?us-ascii?Q?0Fjsb+C1MIFd8bIRXbxV6/WZbq5hqp7D0xkC6cGiFcr4mx4CcyC14lktuvBj?=
	=?us-ascii?Q?sKpw6O++BgltvLaL17CE+vTwqcmPGXr7R3YKueq7WUxkjFsCp9t0xLxoI+ae?=
	=?us-ascii?Q?viZHAF0K92MT+QYYAob++hwB+QvSJCiLq7AJGJgNprPydLnhU1vX2uKA54qH?=
	=?us-ascii?Q?ggyvhLq0jIuY59DaYsB3pUf3TGTRh6GocofXZwhZfESOC4l5qD2teXCWwewh?=
	=?us-ascii?Q?WGAXChZD5UtbAVqWdPWqrMP3CSMsyRYrMdDOlQfSOuUEdq+sRy79cKDBHrFv?=
	=?us-ascii?Q?/TARST5N8scwj9rNKKVZIimvutCYQJ4/x8WuxDiJkcQw7PVYi0oP+oX2PwPT?=
	=?us-ascii?Q?nRqT/ryLDzcBdxkaqT5DN8K2Dda9X5hwQHpqYA0XOzNSIuxpdppngFhoUFRd?=
	=?us-ascii?Q?PsizNfpfDI42lpSzPNbkylCAxiJHnYLs99dXa1Pce/CMUXtnmhA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:PpntdWqSyWgRTBvKde+Ke+dCnyZh+NbynR3Om2ds?=
	=?us-ascii?Q?7NO07gN3EWj4mKMvwenmEDxfAEeQ2ZnCcjcl/NUayk6vt8Ps4eEtYJ7LGpxR?=
	=?us-ascii?Q?S2BU/9SpuRKsHimOi2MAMf1QrzqFzN+BwAawNdUyPMCT4CJVGpcXbrMLkAH9?=
	=?us-ascii?Q?0RG5repUD+WCWEfJr7r2qJRCKX5A7D5ST3jInfj9S1dUu2ZL4m54jdb4zbGU?=
	=?us-ascii?Q?YCxicl9KKJfYe0yRPjqRl+vnfPnJ/BbqAmgwXbgESP+7drrjskoGHlg79D8e?=
	=?us-ascii?Q?nCduECPyUldovOTlYzLK2aPlamDzFmJQF/GbaQ0c4qrTsd5hRlv2ZAQjAJWP?=
	=?us-ascii?Q?Cry+2me2jh6QhvOwBtuvRGZzhM0k7cdBeyzg9D430yqqI7JJk3Z73V48y/6a?=
	=?us-ascii?Q?kf7VUFLJ+ZcCntxh+i/7MIPyZWnZoHacXofyveTDSiTwmXS47Vg8dVeqBT1B?=
	=?us-ascii?Q?lSogERLwn8ZgyoFAZOV4/iirnLGqoB1l8qIa1CmjkxU5eeH8UClhKhIdnT2m?=
	=?us-ascii?Q?mmLep0eFcMvJLKBvXCR/FADbpckRccRP16SaHS+URsQrFQqJYDaoBD4eMERO?=
	=?us-ascii?Q?R3v+qR/c4YDRU2ZcFe0UphnwwEPYsbp+waA3mxRRQjRl3atmJeScCyG0ueMo?=
	=?us-ascii?Q?Iz4+bBqjduRrrmsV9dWpZCqJCL7kkWMsjXwsdDR5WnmccYIVNU0I9yEzmQoo?=
	=?us-ascii?Q?/y6aDHink+lvv5cDTSr1mvIFwWQYG3NelrIuLWTUy3Bk7UmgpGdRO7Xt5712?=
	=?us-ascii?Q?PNFKn1MI5NnXQzOxGE+E2tw4MNSIfcAoQYqaUuCbCiMZWthbQbl/l0PMErBz?=
	=?us-ascii?Q?zPc11cSrBGnoMnoxwgnCX61MRuquX3pdujLKK5Uoq4/Yrb4qqpjFwK93Vg0O?=
	=?us-ascii?Q?z2KaOpSPPe+1jf+z8Qvni3s+a9pEwNwW0fjCAgPXeHB0teV/sMTu9/MciEsc?=
	=?us-ascii?Q?zOhXtC+vLkizvPStdeuprGV9IFfzMKjohUbbXm3YDIzOpCRHViSRtbikWXmc?=
	=?us-ascii?Q?fB0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:pLDwFoD1CdHxCQ4tDHi72cwPhHGV03Jeb/5dxxDNn0kcYYe+ex65z6e3xlw8PPAassZlUGdSWx1Rx6V0LQhd+EwoP58yRjwkDwi+f/oh5mbtdYrN3BJbn6LQSmnP9g+4u3H5RMEQA94B5YjaT6HOtMj4MRUoAeq8BFs0hivcByv0RGh+Bn1CbdynJiAIXF2BHfYrsCZrBBRWigDxzCn+OkFo2orr+0jP7gEWU1qR0hKT5cp6LD/3PA+7C9aHMc1ml5oJI/IuIHxqY3MLd5RNi6ADRADoTy3+EVSm7tcGVPQKx6uJiWM5McaMw1smYQ0otPT13s8fpgO2Oxjs/RNEpLictN8te9xPM3OFZfKYA6PORQbkdyFNVnbMoRrH2O2I7aKte3StRD2EjDlpJVAXu5qVXTtgrJmTv/1fdelTosqReG/VH3E9eqnDYa1rplKzopUYLaoNJ2kYDBFts63fS9rGlq6TM5RuhNrNg7NjeoA0+mI/IqFZG50IhBg6oVWq;
	24:wh/aSUeE5d0L6NCvYjrEOexEohRwaEcxkokhQyDqzXm1x1WjB/6jV8ja+Bhwow/G65WUS1iuwFowLYXKRIy0Frl6kXhEeHk06V6SaMqn58s=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:YQVfScB0wpT6ddt5CB1+IGR1HF6wnkVogeXcFu79931M8q4j1xNvmdu0/NPWUa2NWUES4r/o5M2KdFUSdY+wrD3wzrMwZ9oe7dXLc5fsTKC+oiBTn0cnskx4TyKBsLSgXT6oWq6Ua6qec/VeJS4eSf6DbRLYuuo+PtQBxyMLNmucmQ9Z9jewzLf4UatUveVHwBoAhGWgei9JxEuACtgxnZ4TRshD3e1GKFqA5mbecrO5MhuSFd4ZoWp8khfiHvBR8+zuOypFC0kLDZ2gNBz7zvqSm2kNKsL3vE9hlMhNJYY9a9CSK7snSO7XhtaMOjVy7j5xFSeNQPJNqIsnBFJzQe0d857AqMOT2Jf1PCuCe8PTJHk71o+VnWC2ou7RtBRiR7uYNN1H+Xqmr2vAOC2HcAKDVcIUbxiyY05iX2J2YsUVX8bmZvdGhQUHVzTq17duEEctFq5z9gpQaDuSIQHFXO939w7h9gqpkwkvRBvuOB+uUC8F6ltzpkYm5ou772siRghYNp8mr9i8BMjMtb+d07MBDEc+vaFVAXrgGQ3ccxTd/in5D4PshoXv+d4esotmkSI4tiSuPKCSKc1TSVW6FDk7qGhz0d6E1EjHazUeFkB4/QpvDc/KI3AKq/Cb19YSLcIAQGehBqqoItsddYgHnEh+GwixxghcC88tjbB76q9IyQuF/1NEDMwcnEHIHyQwBGp2f7XUAZqtRTvqerklOHl/U4Swc4Vm59pyDKgW4oKokyDb3Q6N4jaHMbwWyr6gI+bymHWX/OSjxzLq3hgHi4qaOynmUq1hz3aMLfMeygM=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:01.1669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 03/17] open-vm-tools: add missing glib-2.0-native dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Jun 2017 23:23:10 -0000
Content-Type: text/plain

glib-2.0-native is needed to find glib-genmarshal.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
index a68d48574..683f34eee 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
@@ -26,7 +26,7 @@ SRCREV = "538ea037a1549b6fd4e57529f7448a3fd2aa47af"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
-DEPENDS = "virtual/kernel glib-2.0 util-linux libdnet procps libmspack"
+DEPENDS = "virtual/kernel glib-2.0 glib-2.0-native util-linux libdnet procps libmspack"
 RDEPENDS_${PN} = "util-linux libdnet kernel-module-vmhgfs"
 
 inherit module-base kernel-module-split autotools pkgconfig systemd
-- 
2.11.0


