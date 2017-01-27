Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0048.outbound.protection.outlook.com [104.47.2.48])
	by mail.openembedded.org (Postfix) with ESMTP id A91A077465
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2017 02:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Vn4euCyjsg3ehMNQatxEJ0Sf9gtGq3kL9XzfF20XRaU=;
	b=QpBKplANYoqbh/s5ORClK+JM1x6eZIpfqrC2QAhhX4DKNaw7UJdPQc/NNed+kQX0o4P5SgN3if1gEnSXOowxpnVCtOYbci9/MjhphLww0QaDBsABMpHtX5/pxLIomPsmyNb74r9YmPgPGqC+MO7OB8/Fd5RVK5cZ4kwL9ZGMFMc=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	VI1PR0402MB2830.eurprd04.prod.outlook.com (10.175.23.135) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.874.12; Fri, 27 Jan 2017 23:00:55 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Jan 2017 16:54:00 -0600
Message-ID: <1485557640-10259-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: DM5PR09CA0004.namprd09.prod.outlook.com (10.172.32.14) To
	VI1PR0402MB2830.eurprd04.prod.outlook.com (10.175.23.135)
X-MS-Office365-Filtering-Correlation-Id: 135cdb01-549c-400c-d0e1-08d4470859ca
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(48565401076);
	SRVR:VI1PR0402MB2830; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2830;
	3:zHDA9lMmZjp7UzhUB9YZMdfHdP6Sv4eXvedDpo8CKfaDCzfu4/CfyouD8h9cWpQlULYGK6XwEwcJ/IHMQg45qNr9BnQsAG4tzMhmtuZMgPKQjesudKzOZoPmOgTvIS6xja2BNpfVdOsEN4sUuwvw5rkoD0VLbMUp2aqjucCHyltJ5u9jerCc4AI+51SYXgm/L5hczR43oMi7v3fRXW+HYofLFHmQNm4Jp5eu7yXhdcNB9SsPw6L3OzvKbWHn/OSD65c8J/JzF59Ej/hXXJNQJxvdqEnUMX5XL6Ijjs+mnTU=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2830;
	25:PNK18LWvZ8XWjzuNNm/A1CipBt36jvgBdWxDjXznfidMVtey/cYFcHkA55MK3Ue+tLNTMnHgYb8YH2L56ng0uxN+fhDhi+YMrrk9RpRNRM20MkMdnPYCJ0wBYVTw7Ot+v9SalrrBuWf3YHMBDFa2AQAA1QBpRzDXBEie6tDRjikb9KkXsL7j3ALNth3V5i1JxNkuD+C7Zub85+uUEYt9Q2RKwNFQ5oUYSmxSDjvRDY/MoQ1uyz2beBXg/IyG4YLrfTzx0SECgjf7QwWZs6gIDdqxtGmf7VZSmBpizoCbLMZMU4JYuByi6Rf7m9/7PUAmhFGWWhOmSamtZ5vU7X2oZPTD4xdhvQkmUMVxC3lQAmODOqzHu2Yn2FIt4Bl41Oc5P0ayZATf/PjO8wN6sCBTnTyr89TrosJ2pRfnKAkiTMs3O43RctW5yDQgvc3OB0JBIYfLIPcuqLIGKDCVfagJZ+aK843Cvicq/0h8EJwuqT2BCVNV7YmAyRo+o1l8oarq5dbJGbFX3nDLr4cVp5MrZnG2juas9KstmJPCEsq3FYD4C1S0i++op+90BewzmqMKd1CGzeHBJC3uB5K1xctwaDBVeAyy7d1UDQHclZJXh53GKIAoYRCSBdO7c8RsaoyYuOryg/2QPnFq8rduJVmBjCtB6NMGjwjWa7W3JQIXJPNuVn+bixfeNNmD8RxRW5uCqOkPQ3RMupla36iReaRBVw==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2830;
	31:WyNyTWHBjoBPm9To3I2RsCfb4VkfCXApyl4vrsLKB4PQVFYVZj7ZzfX3mgf31KTZ/Nfe2hpeY8c+sGaly8J1BD3XKMkZ2HYuRm2E60pB5RHiMN+Nq+1pQy+QJFNP8ukZPO6/sdlUTwi6kA9IT7Vk3aMoSQomUFrBLRxiPgvSMafqjTl1ilqoaRgVt2yzOc0w6AkiUxMAub4WzyfhbjCp15cbdxA4tPwlseqgKzGoDvCB2pGH9FSmILe6DvmBMKH4GxHPN4pJyHV4Wfs4dVzfvg==;
	20:ayCseu9zYH2LA0vx+2g/ykhDomq2q0yzsDyAc94mPhmVKFzqSU2Ewbdv4USsTWLn/YZiwvusz+2J/VL4d0dEPounwQgQ/LTT3DAmVyIwTM5ZJidLa/lMloOwErJWGdHeALzX+raK9nyt9G0JHuSWFmUg4h+Tj0zoVKqHNxmZ8Idj8Hv6bXZ+J/pkbzA92KY3HMVouip8KuAAqJSoqG94v7swllIohusy94Dc2Mtqd0WTM3DxWZ0r6huKGDxZ+BVK74nXEGW/Yaugbm6nozF17IhwMbmSw+6YY16nxVySttRNexkWz/eE+OVgVAuLvgSgaClCz8hApdaHpgQUPOVWVjIfwzOcsXZ3aX9YqQ3zo0NZ9SnOFxYxfwuUqbeCDSJIdFHZIYfWqwdWx2cAn1pKUPP5tVjgYWGAor8K7cDjH5OKo9Q4bk4XZdip9HlegqT1yKT/tRgJ+OG5slzjpoZehDATX8cbq1HRqMoiNjMdq0ini8lJoBCnCYYTxzWgpNJ9
X-Microsoft-Antispam-PRVS: <VI1PR0402MB283058813154BF5F3FD22326E2760@VI1PR0402MB2830.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123564025)(20161123555025)(20161123562025)(20161123560025)(6072148)(6047074);
	SRVR:VI1PR0402MB2830; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0402MB2830; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2830;
	4:FG1eLo9f78/yCtP1mTaZpMKmRaf28rwaY55XaZVxji+32FQig5tyan+2zoi561DDfLG6BQSyLTio9G2+Hm1aNzGjv1q+J5N2+aess38rQbpIV2QI+vH1HHmg53hHMuGqCUezffN7fVsGtu6Rs2jHl2lS7PJ1QxTsZtADsgDjZXyDA3Ye85Ay8ykfoYKl0eHY7t0lNL6M6XScUKCvwnqg2e0hEnVKXdbAYeFMQ2XYdwSTgytQky5xafBB0IdKn3bvpYWB4hnJ+7xEwbDGeGmplCpRfsnf8BvvtnutYYRhixkWyCfT3MtnP5cEYcIfmLnF9GSPgsMNZWNlY3pUSjlZh0ay2p9LLWZoUddxd2AAstZ/BjevAr4eCXMMr0CJUuxs2v7A7o16CyAAle1v1ycW9RruSAQmYkXFYxTnbnb/MIAEeUm8lnVxP5kYta9Lqt/wlyAJcZCVc0P28JTX5dCC3k1Hej5txhc6xI+PgXARO+akYAkLkn4l+uADgU/bMF6ANJM3XyUrY+62AYtnLL+5wdXdi+4O3PkHEDI6AE17bHXLIYcS1PPW4+A2t5bNNHlQ1cGniU68Zd9OrXE5PQNeaTebm2tJ55TjmH3BDMRO3UhRIdAq7IAE7RNo6UIvEUt4c9s+l/hnx4e2ulg5g95LVA==
X-Forefront-PRVS: 0200DDA8BE
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(39850400002)(39410400002)(39860400002)(39840400002)(39450400003)(189002)(199003)(6512007)(3846002)(6116002)(105586002)(106356001)(5003940100001)(5660300001)(101416001)(25786008)(33646002)(6486002)(110136003)(50986999)(6666003)(48376002)(53936002)(305945005)(6506006)(7736002)(36756003)(50466002)(6916009)(81166006)(81156014)(8676002)(4326007)(2906002)(450100001)(47776003)(66066001)(42186005)(50226002)(38730400001)(189998001)(86362001)(92566002)(68736007)(2351001)(97736004)(32563001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2830;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0402MB2830;
	23:uPXoscoGb0xpXRYXGhcKVEqHF2ttd+GpegvdevF?=
	=?us-ascii?Q?GwGaeLzKclHTgU7B5jAqMbXHqveVHfxs+4+qpJceEdTM0/gxehDr0JVk9j5V?=
	=?us-ascii?Q?u8IqGI3gXI3q+dbA1WYi+JjvFj+uTTngYHntNvR/zcl8lWb/e/eBJR8m/Zi5?=
	=?us-ascii?Q?xwuFVXmmTOiMTkX/8YSGUZcFjD24PIysranf0uhFZrwe/8vFX113l8EJhk8Z?=
	=?us-ascii?Q?/bfkxIrem6g2ZeCKwv5gdTRUtaGQZM/1zUOK9ql0AYJh9fS6BXwiOMFfPNgX?=
	=?us-ascii?Q?kVeTAr97QdIy5VDXCpIrTzdzgpwl062r5JZH0+YaTQfn1CahzYSoj0TUjMrG?=
	=?us-ascii?Q?ivijguHfdjEADx3CDWYL8IjYadZu3atCS6ZhnszgL5L59tAF9al+PqbEQrkd?=
	=?us-ascii?Q?9OensRrwpdr8w6lTIayeJb7itUrxNNFaOilaG2GARf5arcmoEK+zDnSOi8H7?=
	=?us-ascii?Q?6tOMr1oLr8V9l0t1jO8PGiAozj1/MD/hyZCI9h2wx/vPCsqTA/QVws9XkgPC?=
	=?us-ascii?Q?ESJCs4HhQvlkcBcYQrDPfr3/I6igrmTviiCNWYMg79/Y5Qafkl9ZIE5NbJ2x?=
	=?us-ascii?Q?wFVzemniljXH4s8fxlDzjs0DHKPSPEYVOl2dLJUVXgoJDhgSj6HjaPm//tPg?=
	=?us-ascii?Q?lpcQudZqKOUKDB/ygZVbZeKM6Hce7tEESlz/0U9PZ6beh+x8NrVYaYxY4ThK?=
	=?us-ascii?Q?QfGIwj9bduemk2K5JeSUY3NI6i82EZy4KDcIH98Nz/fNmWoJriBha8i0auN5?=
	=?us-ascii?Q?wgoZIvNrGDKA6bkut/H9OdX8yJS4k3mqhNNBUzzT0cG+m8UvSMrFLlh55ckF?=
	=?us-ascii?Q?xgJii0TWzw1CTJdui+4dtu6d+IeUSmu4E6cnBYHLzh1cPOQQ3ko2jzNsnvY9?=
	=?us-ascii?Q?djHmnNKyvH+na6NS91Ws3Ir3ySilSqxhIxtdG0vJA0rwsHF+kxPRMnu58ia8?=
	=?us-ascii?Q?178HkL6iNcu/k5+mKHK/LSt45yI/oKaL40QaU9eiAfv30Zhv85vpqTmYjYrl?=
	=?us-ascii?Q?k3Cua1zBj2Tzq4WZGD4QQkaTEQMGz4NeXBKGpR1e11Kl98agp56dUyuD33jJ?=
	=?us-ascii?Q?YFYGTw0Lsx/4HNBQY4XmhnKWKLjpZ6I4g5853LoR51aoYOGVXs6QlkEb6Tob?=
	=?us-ascii?Q?sFTcsXuQ6FZ4Tb8Ea3JYnPx1u4V+2MAZ5OnXXnwGX0HSLWKDPD4RXV/ecGWq?=
	=?us-ascii?Q?6JUKERdgRmXcaHQBwYb+LAEiu7FILobc1mievDRa57lOCZ/XGZ2HeXD7Fgg?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2830;
	6:LmY1pLJFcDH4VoFpXt+7E4Y0cwdyDMv2J9Sjgmhc4BFWvH+0sSNLXE1B8bVtSvMscNGJUYX1wVHq4kfThjaao6YWdvx979x9z86yvK5VzgflS9PvKW1m/S30krFoHXDvS6IYhNsXbBIfGJenzpDSwpaAq3VnaPsZQEqZI/OCqSQJwLI4EEfu+CvR8sHC8k8tIGknGMsuPLAbMqLSxb8IdeCqPAI7CMs1IBEDkErHIKCZhWNrDpoi8NqiLiWDRnsXJIriE4l+UPqNokVhSOLTQ+Uh9rL1eZVMRVTeDaBRhUD8x/USM+SYH9bqxu0sZOSR90lcpG6+ZHlw2ydbm4CQDhRZEyHVbMRZO0m1FrVOulbifFE8Rk2lRrNvBwK+X5zRbzIbOf61u8qTyn9Nb4BUxylmujAooziAfm/4N9nb9lCHbZLFB1dkHlSotr86sPb8;
	5:f64GxxccyN888yWarUtIOHmUl80+T1B+mqOwzLuStrygB7LF/G9nPJ3Whw1wT8GQlF5/dSq3ocyonUffsB1qGu5APleJENTkXGG/Xth57wmPK/05lr+MA4f0NlaxG9/yLMkq5JXvOhy9SnuAMSV5qg==;
	24:akvD+cYBGDBwXAzmbXeBs+01lw8uubohrVIkzxJXCSiqfreMTGj55exHyPYnnuFuOsmh8bp1qYw1VhTtE0IEFptbTtrR3mza/ZTm/ha3+2w=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2830;
	7:4J8yY1TDlSULwRUPrnWWPzj4BfRp73UAa6CGlbM3bb/OkIANXsBDe/pdujc/WAR5WbCtYiBerAnyAzIYtcgCJRuTGVoeUjNaaQ5nBZrlVRNYDMa9qWOhoig5Bp7HUkhMUmzkTbqpRgMOhq3ePvyH5ER+QE190TkCPYqcZdERvh8d5vOu13XMb4nK+BIPvSIDm32NXIi4L0AhGJin1U7EmhYBkkSlQz4eibS7h+eNHyxv6Qy3Kwgsabf/+S1EmDUEXHbNMyC0PNqA1Mr6SDa1czVMxlCFgLHjxCqxo3YliZ4FhctCNlMvUB3nrmadGhj2/n+gv4SOH9eTJPjfKpxnU0YfrgMkRSjRIs8LUcMsjw0sNnrN5KIgDSGN6Hp42aTfG/ywDgVuq8nVzP5xrjgZZZAB0d8vGeZPVRVT1ETWJFMnHfpZEJgKBXUGavT9WS7Mte8jm0FS2AoL/Dvo3N8wsQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2017 23:00:55.2102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2830
Subject: [meta-qt5][PATCH v2] qt3d: Add assimp dependency
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
X-List-Received-Date: Sat, 28 Jan 2017 02:34:18 -0000
Content-Type: text/plain

Fix build error:

fatal error: assimp/Importer.hpp: No such file or directory

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 recipes-qt/qt5/qt3d_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 2276c36..7c31213 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -19,6 +19,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG_class-native ??= "tools-only"
 PACKAGECONFIG_class-nativesdk ??= "tools-only"
 PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
+PACKAGECONFIG[assimp] = ",,assimp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-- 
1.9.1


