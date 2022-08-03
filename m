Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575E9C00140
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 01:24:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3490.1659489843369308053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 18:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=D10R7XkF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=52147a0915=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2731GRUo027245
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 2 Aug 2022 18:24:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=d2DU9UC0bohVhDVp8UGnH00mwtQ3N27EJov9j0JElIM=;
 b=D10R7XkFC7LP5BlFnaU0kpsbWQQE7HY0Pz9QSoT6kFEIeIDRY548uQMXm37tO9VzPrVh
 qvACVUpIyZ+xKHpt1lOm0JadiFfj1Zgl/QC/DGaUaNeNFYo6dLTHbUZBaa31rz5MunXj
 7JAi3krdAlpIOd6mhaltFTZFMQ58wt/9dGSH/5pf8FtGvWc0YlR5J4yL5cYAk2PFggWZ
 l1aZJek8YPsr0dr3Z2Kya4r2T/hjMUAKv6+oHFBAc4JTpbq+WtAfB1+AAiDFSfoYoTYB
 Jr6o7sV3Wvw+glLdhxCgNkkHX1FuS5qLCS/HieRkUHpEA0JP6iXrSTxVNn+i2Efh3DBC Pg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hmyx4arxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 18:24:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGyURGnHX858NlXCpRPXLenbw5a6wsOIxBWCdYn2pGvtR+HZqa2NMoS7IxWf1FAIxZxRO4unquHq19EcKKvJckV6Pnwo7ooNi4+zGGT5tGVdl+VYSQEJw/j34NYFTMCMXEmPO2uueqrjS9kmxw6covhDlejON8RFIT2BgugTdOhIUqq93Zntp2tMeIOvuV0qqatSb5U6XY2rAsU3FLIgGe8cL23ORgAsgUqajSph77Rk4dcKYP89gOXUJl0C09azMZCa8Gf+TdejZkKtlHvKIZCECvGuOCVoBWdudQXCeWHzs5Rf1RkzCgxzkuTxLOtg3/PwYCK6hPRqTcJjFFjs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2DU9UC0bohVhDVp8UGnH00mwtQ3N27EJov9j0JElIM=;
 b=Qi8jdfzJF4ro074FyrxBSeGh+d/MD/to4RNShycrWDjRBHMEYQ0vVwabugj+uZGYhYDYUeSP1ulzJl6ZATVN2o3Y+QVLbHDaWccB7iC8DS0yFTQGy4VRo9EEyj0F2kFfuw1X9UcSdumBKMXCzwFgp7Fd8UANF1tuNAZd5uLPWsXUBL+7s11nQ27MHpB6bJ0+TUTETwRtGE2HtvYBNIF06MFC7cua1+paQBlzSau5wLyYhCzoXEohrvQ11Okd1L5/e7Er2OIc/8/MCPgHtFHtgGo0VccbfDJEMMFLEaHboEscDdZQJ2hr0KyM53Dze/NIFXv9IfshkvAfePdakslZ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM5PR11MB1356.namprd11.prod.outlook.com (2603:10b6:3:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Wed, 3 Aug
 2022 01:24:00 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::48ea:c4c0:360f:7c16]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::48ea:c4c0:360f:7c16%8]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 01:24:00 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V2] strongswan: upgrade 5.9.6 -> 5.9.7
Date: Wed,  3 Aug 2022 09:23:49 +0800
Message-Id: <20220803012349.1229981-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0066.apcprd02.prod.outlook.com
 (2603:1096:4:54::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adb45475-3a59-47ed-a0a5-08da74eed838
X-MS-TrafficTypeDiagnostic: DM5PR11MB1356:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AAIIlueE3jqf5kWXjKFDhGoQ62OrGD6QG+FSh3kdydjT7l1xB+QmgTWduDeKaQZmlPrwjTE5u4XmgpClNf2X2OVRycGzIfCd+v9hKZqZTHYoM3rbv/w3T4iTb3QVLd2NpxVcpGzLKAtEqSzK5WT2ZuALcVOyhTSEGRpja8xjPgEOUsbKlTYvdNEe9SPfGYI59TbJx8z3DhDxNVzRTzlwok6FKqP65f9Qd0WhbcxfMBFD6gEw5uwwIsKmh+XO3KE663Nru4Hnyjbn0g55nEaXa73cFh1QQ/oK2Yh90j7T9hXtMxyVMJwTB+m+oMTUmUFTyKeydqy67dXwiFBUcQpcDiKZjCi+K5wKGstAMkBRi5dcjNl6SCZF/94EzpNC/92ypoIQKaXKn4mUFP1U38jEas40KJA84HWw1zLdGP7wS/i2LVc8mBKqcnEGpVl9yzYdo9kfcbxMcqAoKuuO2gfy/rvLotp/jfhN7F0zo0aOOi7X0hUTeXDJC0o8/R9ue7c5p2GRwEqiW4/PiB/OLWSuomdYScn8F/z4Ae3lpQdoX+LDhAg5ILxj1lnVWuHKR3nBgW6GzQiWixk6wIsge0NecsoDzldalvy5E/Znv8kpqDvYFmhr5pP3BbPr3LJMkxJiFox7hGt1L6K9reWuyqr7jaMtYQYELaIvZpbwJkGy0CAjmWs7u1FZApk6lEDOxsKu/j5upH+833ZRrJgQrJaLV+30l7K9sLXJatwXOQOVJPbdYM7ZsgK6FAQ9DnKAmRJwLmfmi9tPKuGyckWI9N1/WMH6n0CrALSq6qEifNQVeryJHMMMppvzxwKGwdXdynUuFoK7sQhkJPaxfDJ4trykm1BiJ4JlIPMWaYRWIDKSbDe8ZcgRIF5dzRr4O9u7R/Nf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(39850400004)(346002)(136003)(83380400001)(8676002)(36756003)(8936002)(5660300002)(86362001)(2906002)(2616005)(186003)(66946007)(1076003)(316002)(6916009)(52116002)(6486002)(966005)(44832011)(38350700002)(38100700002)(66556008)(478600001)(66476007)(41300700001)(6512007)(26005)(6666004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lhHV/OH69UvvS6hqqxd/U6fzJiy6/RNbn5Y4VLQdsgQyxdMLihoKDRiOK8XX?=
 =?us-ascii?Q?G4ny1XtA0IhBbt3oT6YlrJqi/5mUh2cBYBSmQgwxmttsBEjgfkDA8en7JDAC?=
 =?us-ascii?Q?zMuXEnRwcYM2zE9mUF2nbrmn5Y/6wiOJ+SVBo49w1f0ZwP6luztngLweucEe?=
 =?us-ascii?Q?kL4ftOuyBGfFdFVrRrjkGY71qbPA/cGkSE78fkMDPGm8cKGxIViMdWpacip3?=
 =?us-ascii?Q?9bEsjkzRTzyVySXxjq4doHmsvpZZ2E/eMylDj07qwDT0SqXxA3wJSwHl9ptK?=
 =?us-ascii?Q?Qh/YVLubVwZ+Wb0nUw+ypUFYr5E9udshGQa8kvwMGDdN0W99Tk6CVrtIWcD0?=
 =?us-ascii?Q?CfKtIUeVavvde6LRvnUAp0rl38uXb5Q5xYTGsZYarydD6I9vPOSS1xrXuc+w?=
 =?us-ascii?Q?vScH1688cebiDztBrR7J+NdcN0uIPAH/X+3rXOS2qW4utiCHLBflD+0FHCFO?=
 =?us-ascii?Q?ejotPqWhLkxOg7cCk875ii3W7cUQfopIX62WLqvG9pN3Kpe1ECBbGEQg7Dks?=
 =?us-ascii?Q?qSfab0RLphHVqM159BGRA36vFmMcGuGE8ZpGfhKvDKi4VEeDrfB71IV+mzgl?=
 =?us-ascii?Q?AGNz1M/46hm5Jx7e9Q+IjpG3I8n6ivVyHv5Rx7U3s2QGR3EuH03JI0TDZvPe?=
 =?us-ascii?Q?IHDPvHn0HKxVfG9vv33roZyCrab36ADYzxnfNwWf/zZrg/mMTajVxH2hXWfn?=
 =?us-ascii?Q?EUbmE/uCnAPJRJawAKpW/u/J1+RIwCEqI9yFPKhKf4n1K7n95jCGo3/YA7q0?=
 =?us-ascii?Q?dTjVWuq2vKrG5CgBZR+Q5kQtbfQBW90+vDsC1vw3LcjD6j68t5LHNRhU2cCn?=
 =?us-ascii?Q?8O/tlqDIDUIc+nvUiwE7Hx4yYNZvFG3/GqA5ODw6j47xu6qYf0CJ6z0ZslhH?=
 =?us-ascii?Q?VSVOMoqAu9c1i77sgJSBr+xqbZqJ8nbvi7AIcI0D4kbLYD6yMcUoXvmaGQ3q?=
 =?us-ascii?Q?yRsGhxr5xAxstWC31B8kShgH5r9NL22FTBM80icxRDEJbEZid0u4MQ6bmB9R?=
 =?us-ascii?Q?Xl45J/2ddhjcufGS5Z3BkmjbYSXcvhqglmPepPu10zd/MArJS3UBfx8ZAWjW?=
 =?us-ascii?Q?JSkIm3w+25eYMPOoEDir6eKvn6nDTnCK2Hzu3D3ibhXQX9Tcjzj3zUJ4AOxp?=
 =?us-ascii?Q?CZZf39hT5+IUOFsp99kqnfC0FlIZn/Aa8FeS2V3eIVSYvepCwSD2Mc6UU9vd?=
 =?us-ascii?Q?ueZla2PaZf6OWEZtn8u9NNmLjYpR2YHPD4z+42euoJvRArO7ix4ImTnsKq5y?=
 =?us-ascii?Q?QKkxHX5A6XS2GaB4TrTpZEqI1IcldbqvSGJ53n14tl/mtUCvltXvfxNvIPL4?=
 =?us-ascii?Q?u/lnEXym1ScUzqQIc0i46GdAgIIA9GVJz9VEAPZ9JCPT4MrBN38LjSB+p9Al?=
 =?us-ascii?Q?/ZYf1VI2rTQx2EoceL56wq5xqGccQGGWWCIrhyRPWN8bMOEC5WJM8/ocuXwj?=
 =?us-ascii?Q?b396YLVJweDbeNWdMLQ77ssaafRi9+COeTiSVLKZFjrbCutnheoJIdhMFpNR?=
 =?us-ascii?Q?XNBOdgr0nu0pRxcxCU/Bua1LWOrVJnZ5oNXXnAx/97aEKRGhFnlkDTk4ZZ+Y?=
 =?us-ascii?Q?3gnXA459kwlBXEgtAbtOWni0od5VAYn3zNNXfzA1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 adb45475-3a59-47ed-a0a5-08da74eed838
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 01:24:00.6536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 imtB9qF4jKu19zJZ2zrXNA0GF7MEnOvoABol2vouPtCvmHgMJB9CHSfBF/MkSv7BOKKrtP6aTC0/CXkZobqe4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1356
X-Proofpoint-GUID: iI5ZsNXDEmBf_40J5Ds_v5rSU5Ver21c
X-Proofpoint-ORIG-GUID: iI5ZsNXDEmBf_40J5Ds_v5rSU5Ver21c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_15,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 01:24:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98102

ChangeLog:
https://github.com/strongswan/strongswan/releases/tag/5.9.7

* Drop backport patch 0001-enum-Fix-compiler-warning.patch.
* Update RDEPENDS to fix strongswan startup failures:
    plugin 'mgf1': failed to load - mgf1_plugin_create not found and no plugin file available
    plugin 'fips-prf': failed to load - fips_prf_plugin_create not found and no plugin file available
    plugin 'kdf': failed to load - kdf_plugin_create not found and no plugin file available
    plugin 'drbg': failed to load - drbg_plugin_create not found and no plugin file available

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-enum-Fix-compiler-warning.patch      | 31 -------------------
 ...trongswan_5.9.6.bb => strongswan_5.9.7.bb} |  7 +++--
 2 files changed, 5 insertions(+), 33 deletions(-)
 delete mode 100644 meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.6.bb => strongswan_5.9.7.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch b/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
deleted file mode 100644
index e730fe1cd..000000000
--- a/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d23c0ea81e630af3cfda89aeeb52146c0c84c960 Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Mon, 2 May 2022 09:31:49 +0200
-Subject: [PATCH] enum: Fix compiler warning
-
-Closes strongswan/strongswan#1025
-
-Upstream-Status: Backport
-[https://github.com/strongswan/strongswan/commit/d23c0ea81e630af3cfda89aeeb52146c0c84c960]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/libstrongswan/utils/enum.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libstrongswan/utils/enum.c b/src/libstrongswan/utils/enum.c
-index 79da450f0c..1e77489f6f 100644
---- a/src/libstrongswan/utils/enum.c
-+++ b/src/libstrongswan/utils/enum.c
-@@ -97,7 +97,7 @@ char *enum_flags_to_string(enum_name_t *e, u_int val, char *buf, size_t len)
- 		return buf;
- 	}
- 
--	if (snprintf(buf, len, e->names[0]) >= len)
-+	if (snprintf(buf, len, "%s", e->names[0]) >= len)
- 	{
- 		return NULL;
- 	}
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
index 1b82dceac..71ffb7ba4 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
@@ -9,10 +9,9 @@ DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-           file://0001-enum-Fix-compiler-warning.patch \
            "
 
-SRC_URI[sha256sum] = "91d0978ac448912759b85452d8ff0d578aafd4507aaf4f1c1719f9d0c7318ab7"
+SRC_URI[sha256sum] = "9e64a2ba62efeac81abff1d962522404ebc6ed6c0d352a23ab7c0b2c639e3fcf"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -147,9 +146,13 @@ RDEPENDS:${PN} += "\
     ${PN}-plugin-constraints \
     ${PN}-plugin-des \
     ${PN}-plugin-dnskey \
+    ${PN}-plugin-drbg \
+    ${PN}-plugin-fips-prf \
     ${PN}-plugin-hmac \
+    ${PN}-plugin-kdf \
     ${PN}-plugin-kernel-netlink \
     ${PN}-plugin-md5 \
+    ${PN}-plugin-mgf1 \
     ${PN}-plugin-nonce \
     ${PN}-plugin-pem \
     ${PN}-plugin-pgp \
-- 
2.25.1


