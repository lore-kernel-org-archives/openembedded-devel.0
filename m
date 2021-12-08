Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D378C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 03:17:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7381.1638933428804073194
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 19:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QdtrbS+V;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7976a6fcf6=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B833KcC018886
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 7 Dec 2021 19:17:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=qlQYsVDYF1xW+mfVtWqR9C8mSmICTbsl50KQhTTPkm4=;
 b=QdtrbS+VI0BWHWTTJeyyf/bdwbOhO0kizyy5TpjSxK84vUl/tvhZR0qGHXFtG1lgrnf7
 zgatYdhhkvSxmsQdaxo1hgEhZ4NLkzkzIzpE2eN0nARQVOnBuhQF4gbrqxrcSHfGa6pN
 N7c0yo8EIpew/g4eDN6HKO6nxxkp99l3GvVNdIe5uIKu3FnTHLOKfxsR0e1wrHfR4Gge
 /CzCIofTmkMIJYnQuYXY7UDFXONKYYDW+qNygPjLS72KdvrjqOxt817qik8P50ZJfEK/
 UC46qrdrNxRi/Q8siN3q1u8mKbrKyTNrPMfX/gTj9bUFE8MVg2o63I+7D1RoxhpkvXM/ hA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cthkcr3hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 19:17:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fa20fs/06Z/iLLNhYWni+KrSpsl320Es5DXrnipwrwZ+u1av8hXMOepIO4nrXa+HVlQXDSyzRbl4qvtfjmlPq1UC0K4voB8vtCijybxcZoywwPGn08QnitDC53rIDv58yZE4IX0cBZtE3Hz/8T3SLbi+IH+s9mbKMY43A3QRbogu4Yf9gLxQf1It9BXxUFX/r+s3avTHcGD4qXW4waHTIEeNye6c/SebuPPPVciZZiBVfBs9ZhFjQ6vi9Lnkmc1Rtdnk497FKkfhDMDKBDcI4DGZ2btb5q9wLQmQF2ft7zZqiPJCo3eLckm6p1pHMBVYE5evw4xmh2rxOufBc5bdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlQYsVDYF1xW+mfVtWqR9C8mSmICTbsl50KQhTTPkm4=;
 b=CJnhH8VRmHB7DTLVZf/tf2ao4RbND5IT3PSgWseoPK9k8Q5YtZqigpyH97Dg+hbjd37Cvg3KQBfhtpAizdP9HmoY7h6F6GAmZb9K5QRNAdJfooKQI+5Op772HOVACY3SGtDXwxOeQTCuFUGVIqRC1oVPFKGYkbmNgL56foKbK0WzBO0cdeOnfZGfv1TkBHEW93VirGJAs+wB0Pabfp/pKFWQ8kM9oHef8TCCGNQqkx07eNHYrRPZJz205NEdxwi/e9m12KWqVOctvs4VjS9TSOR+x623ofKD+VxrgX4yOM9vpQr2QL6USxlfmuoBcfSboPm/pgvavIuijII62UuOTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:91::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 03:17:06 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 03:17:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] openldap: upgrade 2.5.8 -> 2.5.9
Date: Wed,  8 Dec 2021 11:16:54 +0800
Message-Id: <20211208031654.20796-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::34) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK0PR01CA0070.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::34) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 03:17:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c05f465-1c99-48bc-1c62-08d9b9f9366f
X-MS-TrafficTypeDiagnostic: CO1PR11MB4769:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4769F859B9C68849E673999DF96F9@CO1PR11MB4769.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F9he8LV5sFraRsLoE9TQQNhZhHmKfzV6iFCsExLEqIwd6oI6GqjjaMpomzzrv+UNn+CfORRL9GtoBCoK0XT/7mAG7sD9CZ8VwTfmFFApazvkOHrutgAOj1o4jiWHQG6nKIo20hl2gDVC7mmne4sk2tqQ7apOzCsuU610NRVe3xswM/XuhZ99up7q4fF2NjzLBFoR5E7GrMqMfRklYaQhpKqEVWZFEwnoQbFDRRLyE/qdnagrs/GhGvbu+jfvwEyA/AZrU7LN79Gvi+hooDp3Aj4oQdQIb3bEqjbLbEglOKE6xwMgN+biWZSRqwfbalOdk4RnnzC6xa55SvXNHjhcYiDuPVm0zET9Njqi1Nc9hHmPyBQ9WzY0cKdOw6Et/rNfgpzGWqqnDZy8cTklLc+zO6AE+u9SjXg11bEHIF1yejEnqprDwZVVHcr7n45pFlK8kg7aYLWP2Dj7nrxazh/XnFcaaRjgm2Aw0qPUo4MkbbZ7gS4mscTv2QXmfyxZ0DS/fdOKstekvaVL9T+XcrBrD+vWj9ZydmEfyFpyUqvCbirCmN4wtBEt9kgZTXRDPIB7JwldQmIgy8o+3Bxp1KaOQPwGO+vxgM2+1V75h9FIdOBS2o67G1TBUC6QHsTRVMU/48OW9BnRpcjOr43QImKQAz9uL+CMbq0ifUM5DeX020jKBD3IjeC00XqJRhSo0qLfynx9Hhe2KxIRSqnUR8WPC/zBSkxTa1VUMGjP9sEMkKiIq55b/2Hv/uLK18i8OUHLCwqgIiMCaGxx3nmB+XWK+8Ic1y2dKknJeoFkkxBMvsw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(5660300002)(2616005)(966005)(66476007)(186003)(66556008)(66946007)(6486002)(36756003)(6512007)(26005)(956004)(86362001)(2906002)(6916009)(8936002)(6666004)(316002)(38100700002)(38350700002)(1076003)(8676002)(44832011)(508600001)(52116002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vFxoXdOKVaxoQ5GZh3DqI2N8D9R6DR9PNMgcBRqhxjiuZtgedunYinP5MiTq?=
 =?us-ascii?Q?fW5rQ45hZ5vVFjH0p+WmqS02IHCwi4BEav8aub9hiXYQat+q/bb/ZUFiYWKw?=
 =?us-ascii?Q?a/3nrnm5sHuVxBoi1/nik5N+wjTV1eyzmj/RZ1WwlL+bOFPziuiycdcDL8es?=
 =?us-ascii?Q?Zavdb6tvHW9mThbJTmlx23IPogXLc1jUfo8ImwUFq5qFnRXb1MeaQ7696Mu8?=
 =?us-ascii?Q?YuBOAR2Ywl2lKH7CptWteO4Zuii3Au8YzM9l5R747UbkcQKpD9pbf45a97/Y?=
 =?us-ascii?Q?wbQRYF8MylGBJke9j8jZC5yOyKtSAz4OXRDjTfJfxIVJRUss6EAhe7R0fdCC?=
 =?us-ascii?Q?B1FxtZtiHh7oUYNei+cb9fsahp41E14EuY0rKKKZo2TW30FlTUZX7Fl82jG4?=
 =?us-ascii?Q?N+f/R17MB1e9aLMotT5nfDhxYmafVOAkcB44xseKF3umXhqU8lvYrYaYfFs+?=
 =?us-ascii?Q?1PaHMIuyM3Za8HlXkcbuPHXRsHY9C2gJqa6Ynd8Zn05092SvHKPzaeLQIPY8?=
 =?us-ascii?Q?gY2NK3ylZF4l1/cqwFxwhR8fyQ1sj2FlDTzrgIJTQxtGcLXVWVbzat2Sm4Pb?=
 =?us-ascii?Q?HXLOPU2xyptnwrOQrUgEsPAngtB/tXx/7AQJpa5r8aVKEe7vm+gTWj7fjzBy?=
 =?us-ascii?Q?uoVlDEVN4DWjoTHIGMHNor/M5sRGG0yTM+Ob2krKbcedeFdep6Wv1oNQI+k1?=
 =?us-ascii?Q?Ps7tgMF9gzZCO4RsLfEwRmqwqzMF5Oyekx+4dcz2BLsk5y2PgC2KUg6qmOuQ?=
 =?us-ascii?Q?zKYsx5xN/UjbB2Tow5loaGcwWy4SiA7BoWx72IoyBRWejgANtf5UixHcm2fG?=
 =?us-ascii?Q?KCGOa67y0LLf9Q7LqtlXrh7quVlU4IwiI7SABc1tr1cCsHETadTCHGfK2m/I?=
 =?us-ascii?Q?4IbmdnoVJyMzun0Yx31FTg6u2l0aEFvKMkPGtyChSUqgpAiEjlhngFY7nytH?=
 =?us-ascii?Q?fprpCv4ZtpY2mI//t8RfntCmQsl/Hw2KEHBsMgSg2wMQv7pqKxhYGUbMT1mY?=
 =?us-ascii?Q?96xNEmBxHzjMkSbq3dsrCQ0sqlipFTe5tXuO87ZhayYpAOWkP35Xk/UETHLw?=
 =?us-ascii?Q?vkEYgvhPO2F6yGBO9JaCy41+PzWwhN+NwTN8isB/59lMWZ6BPl2u+ha9l16r?=
 =?us-ascii?Q?SUQ197lsYi427xKWXrzFI/m0HopufqqX5ngVUCkvqm7C4HlJezWv6APFWk5f?=
 =?us-ascii?Q?Du+fCcBIzwMGeAoODukWUN1A3Avt41ynSF403F6xpdBqSFZPMNOFKZOdv4Fm?=
 =?us-ascii?Q?SDLN/s0Qk/nY6+ZNL4KH+kQ2lOzcMWSHR04r98OdAjfVO8PzGgHZ7Pjwd9N3?=
 =?us-ascii?Q?MzR/Z+ETSA0FA6/GsxjjGqUQFSwOpc7w7Cwai4YDDfSZ8zpeSQ1oqaGr5noP?=
 =?us-ascii?Q?R+/UysBKAaJmOiPxKO2sFXXLhpHA7kX66Atqi0KRJT8gvUVgHCoiPvfxHt2N?=
 =?us-ascii?Q?AVl83r1nQxyNZp9qfgBkoW26t9xQgYfYA0jrBCMblV5Zl8M+gobIpI/8OlbE?=
 =?us-ascii?Q?67xxCq5gW1BnegF9E1ZIyT8W7fIfxtVEEGdffQr5r13MNcUAa6u/+ymstT0F?=
 =?us-ascii?Q?1DeX+1Gxc/sSHFnYQ0k/lDCnCF+DL+F9iTo6n+Gr7J/6RAFSrpwgs7kP5qRt?=
 =?us-ascii?Q?PeFauhUoSISYd55DYn2BPPU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8c05f465-1c99-48bc-1c62-08d9b9f9366f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 03:17:06.2555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2wScYjOeepgMA+sNYim1raRaxVun44AfnISvp7ULFhNPA5mI9OD1MJb5/ABSQksh6ZqG9VYbpvuUPfYKY97MbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4769
X-Proofpoint-GUID: ZckyEHYiCQhkKGcyfH_57JFrZbO_EkAw
X-Proofpoint-ORIG-GUID: ZckyEHYiCQhkKGcyfH_57JFrZbO_EkAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_01,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 mlxlogscore=930 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112080022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Dec 2021 03:17:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94245

OpenLDAP 2.5.9 Release (2021/10/25)
  Fixed slapo-accesslog to initialize minCSN on import of 2.4 databases (ITS#9720)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/openldap/openldap/install-strip.patch   | 2 +-
 .../openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch   | 2 +-
 meta-oe/recipes-support/openldap/openldap/use-urandom.patch | 2 +-
 .../openldap/{openldap_2.5.8.bb => openldap_2.5.9.bb}       | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.5.8.bb => openldap_2.5.9.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap/install-strip.patch b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
index b757aabb0..fb7ad8f59 100644
--- a/meta-oe/recipes-support/openldap/openldap/install-strip.patch
+++ b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
@@ -2,7 +2,7 @@
 # programs and libraries (LTINSTALL) work in a cross build
 # environment.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [embedded specific]
 
 --- a/build/top.mk
 +++ b/build/top.mk
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
index f551861a3..8cfd0033c 100644
--- a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
@@ -1,6 +1,6 @@
 From http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-nds/openldap/files/
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 --- a/configure.ac
 +++ b/configure.ac
diff --git a/meta-oe/recipes-support/openldap/openldap/use-urandom.patch b/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
index 6783b5175..0b7e3a28a 100644
--- a/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
+++ b/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
@@ -4,7 +4,7 @@ When we are cross-compiling, we want to assume
 that /dev/urandom exists.  We could change the source
 code to look for it, but this is the easy way out.
 
-Upstream-Status: pending
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
 
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.8.bb b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.5.8.bb
rename to meta-oe/recipes-support/openldap/openldap_2.5.9.bb
index 17e6f72dc..d95d6912e 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.8.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-ldif-filter-fix-parallel-build-failure.patch \
 "
 
-SRC_URI[md5sum] = "86e3ffce4adfc57cbb76ac0ff48b2614"
-SRC_URI[sha256sum] = "366ea1c3b24202de4481978b632128c0cfe4148d4ae13cabf93a1f38c56472dc"
+SRC_URI[md5sum] = "237fc2d881c27f8dd5d9f396e2865c11"
+SRC_URI[sha256sum] = "c08e12f4ca5803d5d9f9948c70ad3491282cda3c17ec8b655dcbcb2364e6fb9e"
 
 DEPENDS = "util-linux groff-native"
 
@@ -179,7 +179,7 @@ do_install:append() {
     # Installing slapd under ${sbin} is more FHS and LSB compliance
     mv ${D}${libexecdir}/slapd ${D}/${sbindir}/slapd
     rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
-    SLAPTOOLS="slapadd slapcat slapdn slapindex slappasswd slaptest slapauth slapacl slapschema"
+    SLAPTOOLS="slapadd slapcat slapdn slapindex slappasswd slaptest slapauth slapacl slapschema slapmodify"
     cd ${D}/${sbindir}/
     rm -f ${SLAPTOOLS}
     for i in ${SLAPTOOLS}; do ln -sf slapd $i; done
-- 
2.25.1


