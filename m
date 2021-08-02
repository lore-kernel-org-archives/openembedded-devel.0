Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2407.1627947264683904329
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 16:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=f7kuKjuy;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38484066d0=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 172NS5Hj022015
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 16:34:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=DyJRScrF4POE2xvcyiyImArjZmwb2SMNf3hXttEybIc=;
 b=f7kuKjuyLRiCyfKcjTcM7H94pIdPRFGRhQRUUQoGCqanNd/ECrdC1WDk6jRDGssYyIy4
 rv4l9KGYrhqlYZE9aJ2U2WIKr2UZqeh+IJZNvCV3ZFryIjd9Xn9u1tlBwqQHH/xEiNTo
 39JYojVqtCpz13VUHuodistywFIGUg8/Cu++eUDNcmqHnlz9CjQBb+qIP68/Z1+oajql
 hAyb4VBYZQ714CFisx0OZ2ROFDCvUkA0tuS4U+MXPoODxxHkAt6jeLpZA7dHBI6Xm7T0
 6LzQ8T067MMgjwFlcv0lc0lMS96uqKkPPLxXg1F9lluBJu5ifur/4s2iDsS5+pJiphi+ EA== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a636hrs7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Aug 2021 16:34:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yf/wk1ZR7KS2PaaSEGZaMMvTL0uLfXFM5fALY36aiEBCDuK87icmk8CW3KPVp23pD7EVo9wLd/qtDL11aAVZEBBEYD6kZ+dntlOUpezku1DQPtDgG+JA02G4tNjju5OO+DD6zlZD6dUe73TwUSoS3nASCLUn3C1aA8QPU/6ZOn/ml52dAEIxGxYs4RVfBfX/5vsQC85zcTPCJCHRV75tIdHhRngL+JvErucnfokAh7eoIJ3i3GZX9HuBNcrj6YRTRLxQgqc6PB+dsv5cmU2j3E0RHpPYRWjbxANinEAkxqlEYOY2yxCkkM50YRmgd3nSq8K7u8m9Ui+uvKzK9elYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyJRScrF4POE2xvcyiyImArjZmwb2SMNf3hXttEybIc=;
 b=K+7yJ0bHse/OW6Bluhy9F6ac2aURvknpy94VRrr1d1G2bk+YroC8jj6q87ze9TxyTrmEuiE5eTEnV7+UzGVSzoKzcD+CaNQeJHTZBZjgeJHyktQmdFnXADGKsyIH1o0N1Ozm5S3tm2k16tT9sTv6U3F7coNiLYmRu/AmgccvBSIf+sOJ9JfVUn43QpZi7Mbu8eGKxmW9pV5YbHPBODaaHdUnZxGjfoieJFgXL3XNIJK1ijldSn/+AOVrmMy4RivfX/NWRGuXMKzKDc0DTROUPe8bZVP7LHDSFNwOGr4+pFGidorI9t3tu8wmPmh4TA/yl+v9di6UZ4eueuWfJfN/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.24; Mon, 2 Aug
 2021 23:34:19 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04%7]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 23:34:19 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [meta-gnome][PATCH 1/1] gtksourceview4: work around dependency deficiency
Date: Mon,  2 Aug 2021 16:34:06 -0700
Message-Id: <20210802233406.2263-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BYAPR08CA0032.namprd08.prod.outlook.com
 (2603:10b6:a03:100::45) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR08CA0032.namprd08.prod.outlook.com (2603:10b6:a03:100::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 23:34:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35aadeef-99b2-46da-eb48-08d9560e0cbe
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4500EF14CA65F55BC79AAAC188EF9@BY5PR11MB4500.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EXYsvXtUW7N6pjjuBk+bFJXKFxbQq7lAkpG4r0UirMx8XMsQVc+0lHnlrFn/COypdcQ9Bt0Lbu7Q6gq8WVsLiQ45A6yyjnbO7jpEK1A+kBMs5pLvM4LhNv3LPA5utIBEgM7Fy+N6wvFsat4wH50biltuRnIZ09EBOlfShGon7sAkKRspVTmC6a3e74bu43aMLkp9c3kStZPM0vvtWyL8w4L//9kXuCL9f2cnOFmMPN/tll4dQcDknM0OQxwtbOCURBsCw+f1rzAHiTdxkRFa9tDKRVglfdHvtKKUgQ3Zn7vCgPJHVdbHlpnB0U3CbVUvjRhziscrfQSQgTmMqat2S/jLi6yIesnllkSWA/BORRlKeQIp4arxTICR+t8H9Pve45YUX6eMkCesY5Tp4IbR4Wmtqd5hXmqmdqFjt7DrUDGgO+MqjW4ySkQKkRfjfKwCC6RaIYKT6qjF/LkFjJSeQ+2bp++r2UZbdhwLZXIYglbME/zmvtPHBLIfD3azGhxxQtsKQGY9I5uRyXJ31TbEqBdWZQA1iMQjNZrHX0aA6us5TsNaLrO48lR2xvFK2fVxwQNu/oTEli2DNU+kwkn9Is7vqZIWQrHyT/NyKgt9FEc3qaGrwcyzgEedy8540tdshTOH5kJ1HZOQ1Wn6c1TLDfFRTrXkkVxUEFxrkBAUqSGqXtwOUnsoncLP6D2lVQwEmDE+EQ8didOZnQDe6g31pavPIOmGmwJABelSpfoVSot1QAkZyMy6/XQ/BiANsvH9wFFrtODCWvDLCpDnvDDVw+XkTUNlk5xZZAEqwJ0TGjw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(376002)(346002)(396003)(6916009)(107886003)(4326008)(1076003)(6666004)(956004)(8936002)(6506007)(2906002)(6486002)(26005)(38100700002)(38350700002)(52116002)(478600001)(5660300002)(8676002)(186003)(86362001)(83380400001)(36756003)(66556008)(66476007)(66946007)(6512007)(316002)(2616005)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Oa56+ZdDoFxSOsFxnVlNepWRQngj74RNut1H9Aq1RzRV581+Is70uHi+ZJ/Y?=
 =?us-ascii?Q?Cxs6P07hv8544e/YGVAtSfKK5bZi4lMHaTfxp7JA9wTgGEBlvsTQAEyM9z5Q?=
 =?us-ascii?Q?EhpWONLheLEDN4ZRCU1tKJ7nEeVAfiU1mQOJmx73Vmu04XgLp9IqQ1VQ6IIi?=
 =?us-ascii?Q?wC26gzSSWU8zRl3WhjjKqMr0H4FrTDPgSCVQaC9s9Eeqd3DsxGqLbfQ/3hSZ?=
 =?us-ascii?Q?3cG25kK/yuzKmJ9yK/0zyEIzVmgpAfXNqc9MQsd+vYkHs+AUHJNXzJn3AbR5?=
 =?us-ascii?Q?X4rSBHjz8Ew4q3wtNMOqPfEhdHQyDpdBw2slw+Plg1FBwHv/pozP6V5UKB3D?=
 =?us-ascii?Q?cQRDj0kXhoXP++BvIAYmeKYh+UX1ACxNngj2mkNccROiaH2v1wJt7fDoYsIU?=
 =?us-ascii?Q?cAIX1Q97RfOANDr5ThMJUoACnpdpu4ioTD2c1escb9A8PZcdO2P+t94zzJZ2?=
 =?us-ascii?Q?AWxaEZivYLDIRZAsMPtcVLZXJ4thGQ0gNY2j2OnVY6SQRK0ajZA6E23oeaJ2?=
 =?us-ascii?Q?oV/SGfM8NSvvANTtO6zKM5AvAUhHicO8lwYFxLzxMbF5O3QkjZA9qgS85hBL?=
 =?us-ascii?Q?q9h6E2foe/LRJVwKIPdIeydLxFJe08egRF5ppyOznC1WhTcMWzXsweao8Wis?=
 =?us-ascii?Q?D20QcrvZ1Ub+FcrNkGVZf50hsS/Tz24ieIivLZPnmIzBHq/PY7RkVgGUtkUk?=
 =?us-ascii?Q?/qgmMBA9XifvsxHIgfyo6FKwMIdKiAZUKqOzt96UWY15YzAOwpqbfj5/USrn?=
 =?us-ascii?Q?DKl/2y1nlAJIyundO8A/B/bSTvn4Lj9xEoJ2fJuCJQRizJpx7KtdkfGg6+Xv?=
 =?us-ascii?Q?0NatdW/RlR/t1Kff9Ab1KHdjZ8rQF8BqFZq65e5CpwQ9KXDvk3cBTrk3Nw37?=
 =?us-ascii?Q?JNnmjfOugI51gAWBOf90dsiR8478WSf1l15ZaWSFHsnFTDVmfYwRytk4ImGz?=
 =?us-ascii?Q?Y5dbWROwPQU4Ktb1fi8maCgg/OEkiHq8Rr/Ri4KF5qHR28swBXA5uWoCba6H?=
 =?us-ascii?Q?cbk+ToTRhMx9lrptVKzE+rg3Ld4xdK7LBNSaWo0zfGKsFhLHLF+C1ynPMwzV?=
 =?us-ascii?Q?bwibhRwYoUG5pAJkLWuGL0cSaRj7DK/ZypZhI82nlghbs07E71+U4oeqnbId?=
 =?us-ascii?Q?jLeLKNI3nPyTJgl7648iY+A1juJKCcroMGnWfwjO97WVa7nSYLC1/u0kk5YD?=
 =?us-ascii?Q?augTTLtgVxNbXm8lkTvUNvL5ZvzRKbKrEK1YzPm7b8ygouRn/bXMOO6SB4Lc?=
 =?us-ascii?Q?L5nVsrg6yGBV/gAMwoSE+8j2HyfZuIgXjnrGalRMWt38jQYX6DYNPO7Wp2cC?=
 =?us-ascii?Q?tRMNVvXpJMqIW48Z1WQ6GY14?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35aadeef-99b2-46da-eb48-08d9560e0cbe
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 23:34:19.5134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bpDMEgrEifQHTtWq2F4YUSJqCXrwDY6i+TL8YXHpZdCQjYIxjasatTsZggpoKXNEpZH/eHvGvPmSRJgIAdcfvfeqjp4an3lb+6sVVrE5Ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4500
X-Proofpoint-GUID: -QWxxH8pfmxwNvDIjnv7oJMkWCvy_ByA
X-Proofpoint-ORIG-GUID: -QWxxH8pfmxwNvDIjnv7oJMkWCvy_ByA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-02_07,2021-08-02_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020149
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Compile in two stages.  First, generate gtksourceview-gresources.h,
then compile everything else.  Adding the dependency is not trivial
so we wait for upstream and add a benign workaround.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../gtksourceview/gtksourceview4_4.8.1.bb        | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.1.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.1.bb
index f7d040d73..0be12bcdb 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.1.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.1.bb
@@ -16,10 +16,24 @@ inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspecti
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "https://download.gnome.org/sources/gtksourceview/4.8/${PNAME}-${PV}.tar.xz"
+SRC_URI = "https://download.gnome.org/sources/gtksourceview/4.8/${PNAME}-${PV}.tar.xz \
+          "
+          
 SRC_URI[sha256sum] = "d163d71b5fcafbc5b1eec6dd841edbdbcddd3a7511cd5fdcffd86b8bbfe69ac1"
 
 GIR_MESON_OPTION = 'gir'
 GTKDOC_MESON_OPTION = "gtk_doc"
 
+# Override the definition in meson.bbclass.  The dependencies in mason.build are incomplete
+# and the recipe will not build with "-j 1".  This fix is benign but should be reviewed when
+# updating versions.
+#
+meson_do_compile() {
+    bbnote "========== generating gtksourceview-gresources.h ========"
+    bbnote "PARALLEL_MAKE is ${PARALLEL_MAKE}"
+    ninja ${PARALLEL_MAKE} gtksourceview/gtksourceview-gresources.h
+    bbnote "========== compiling target all ========"
+    ninja ${PARALLEL_MAKE}
+}
+
 FILES_${PN} += "${datadir}/gtksourceview-4"
-- 
2.25.1

