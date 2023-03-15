Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB8CC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 16:17:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.470.1678897049203630127
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 09:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NvnLuzOo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24388d334a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FAvgVL015100
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 16:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=wCQBNk+AgWN8SfZ95oKJ+Mi7frQTLDgvRziHpcJB+mg=;
 b=NvnLuzOogVHDhAENY7qrzRd8OKWjJTc3sR1bXGazCbZjSPX6YVs22AORHVzctQJFRK3H
 OIe1pWy7MAUXCl2dWpdXXotC/ia6HRHeMZnn1qQeQej4xTL+O6E5NR4uWcxsxzp9kA15
 AlFkNsqUxN3hLUN1LjJc75mGOf1ZastLRqwM8a4xxR2Kcot3hXTP86EnLStgCK7mSqSU
 bQJXmtYapU2XnSY/TUAgwDbrnUQhkxN/eAcZ0kdLZJV3Gf8clvTW34m2k/tuUj8hT/wu
 cPI/AM9mNjjB+4YgAYTmAfu8eYlGbfxYH3WLnmFgNuo+IDBp7IXqkjNbLOgrOXsHLsxV RQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2anrs29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 16:17:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PviAs2S2rWyt57veUm+7AewqB6oSITUYeUvKmY8of95fDizMysldxsyfIkDmz1+wEs4WAO74qM5I8HS0Am0/IBDjaSOYAan9mJXDcsBlO71Ggo6P284u2mVDe/Od9rTPESQb28eUixJMlsbLneEOWCyTilDpB/JvRB0uZG0aVGyM1KjlEDaXDMWKTJO8CcxLkIWyfsMEgqFoD7PsiIk0ZD34qCn2VPOmIG8WDzARXxReAp2NoqGzbtiH0wWtHFVSEDabwKvaESnGuqrIR5mr+yNG8DIj/8RUuyLszXh/5rN6qpcis1wiNtqtfXK4yA4MQPP7LS9EFHy9pjB8w9xwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCQBNk+AgWN8SfZ95oKJ+Mi7frQTLDgvRziHpcJB+mg=;
 b=fU9W+/hRIEw01GFFtCIwMPVZ/8Y4IOk4xgB9KvlnjN4dbsIJIHVEMKvt2/e+2njjRepBjNgo6zrmX5iDiq4LjhulwBsnPySnYChFqCU5SyMEFAMrKMyY65rQrbH/L+g0o/kizE3eGxNVuwsgkqrplNPQiO03dAVI1er1b53v9wppDlePhMZ0Is0r1yu8GKVg0q2fJBVa0eXIrDzT9c5DDksiPU1kTsdUOqsO3q1FVt+KQsVBVRSRs3PJjZSSxhtiEA+KTjXtMx2QdAvB6xiRl5xjbN6HX8dWUX/WRcc1doKkZgNGu0mpDNdSNIhnfC9JjCA6bDB/3FlayyxWGGLYeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 SJ1PR11MB6202.namprd11.prod.outlook.com (2603:10b6:a03:45b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.26; Wed, 15 Mar 2023 16:17:12 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7%5]) with mapi id 15.20.6178.024; Wed, 15 Mar 2023
 16:17:12 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] libuser: upgrade v0.63 -> v0.64
Date: Wed, 15 Mar 2023 12:16:54 -0400
Message-Id: <20230315161654.1343064-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: QB1P288CA0023.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::36) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|SJ1PR11MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 003983a6-8142-4576-b9e7-08db2570bbc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x1AdDyHscVmy4RHn5kkEcHVI1DlHCT/Fd7OzGCtpV6uvqFLNq2x1dr61zh+ItvxRZuahkhwUpX1gdUkOYqnlD9ofStmyiDQlZy3qtO4XdaKwqY3xNK6uc3/Z6kNiuBxBshRZgeSTLizyVFAvvOYJ95WiE5GaZ5MPSveCKpC6XdWWEw83pLzEIISZbeOH+7+fb12092OD0EEtOJKa/CCh2OTfdvgf3yU/t0JTwNIbc58AfCL5r2F76CCGh5/fcujc5NW8FvYQxYuAbdmpBagZ0Aq3L7j5fNOX+gJjtQernV4n1XpEVDRMppTQFzXw5K53qSAOinX0FV2DgBIRwtV1CiqekYKR1hvAtfXt+ZVPpt/jjsaYPquvFOqeAnb3vROMIIzfQuU6hJ5CKI4fk1O7WTFyvK1G5mtY7olWFWgUrifE4It5Ize/yTMJX5hk/vqhvQAt5iwoWBxErYfAzmOUPbTDt2ZahG/FtpNeqYqwKbpszY1tnKZC+yEOq3ipbaMCfsC/pCSGY1CtuCWj8nGgbx4onPyDqKrQexC9yjfXftUYu1H0F5t/mEEESUWYkm57FSej84AkmQ/FTLMzXz3s0KHTPwsVli/b2edP8G3iK2rlVdkqRWGzbpv8+Q9O/a92rY/nJl427YQ7AECorMlHW0Fvt1sD45mgn5hlF0xvFHDLWEaT5Tro50IjaXjh+ztn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(39850400004)(366004)(451199018)(36756003)(478600001)(1076003)(316002)(8936002)(6486002)(5660300002)(52116002)(2906002)(6916009)(44832011)(8676002)(66476007)(66946007)(66556008)(41300700001)(38350700002)(86362001)(38100700002)(186003)(26005)(2616005)(6506007)(6512007)(83380400001)(6666004)(66899018);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iM+PnWnCi2WrBpm3AxNqUlFsdMIvnE8cvhk1uJiFlEoxWTCpADV2MEnph8Y2?=
 =?us-ascii?Q?/zY+TjBlemdovZTdu3ZETtrXzjszprd6ht1Amknyl4E4HO2HNqCtvFBA+Qkr?=
 =?us-ascii?Q?EUgy2u3mF8XD+tLo5FMqNkJunPtPNdc2s6OEVObhjbeifVrvYiGnfk7bX7qg?=
 =?us-ascii?Q?VEsugcO+qIRBk2CGLo9xBIGQZ78YmSXk3MsyuiaQimdUo54VB8hsn0WwoFj5?=
 =?us-ascii?Q?eJRGdRaTlGab+dCl8yY8MgMFs/izyh/Iu3ePq1/1mqtOpfIhiUFwFIxLznEE?=
 =?us-ascii?Q?ov2zxdIWl2uVI6DNcZxbfJiJC33Wqwkx3XQEUNOk2H0t2hix8Vke7977HrFO?=
 =?us-ascii?Q?VwaTEml39bYkcMO2diIC6pFcT9WAHHXo3E/4CLP49u9kt8XYKqwgPrgwsqmE?=
 =?us-ascii?Q?OuFBecPaDKnUWbNyCsVPGkUdRZBpiLPU63dFmcDPIfzDneLqLQWQTmQnOv6j?=
 =?us-ascii?Q?xq/mF4JLezm2u6utw8Y1IJYvXf+ganh4G8Y6RfbNnfjpGVMokcn1l9/7i3cO?=
 =?us-ascii?Q?LQKhogOV1PBQlowut6oJymW5VVQk4OUuObYL8/iqD/Uag33LVv2cnQOf1k0U?=
 =?us-ascii?Q?QtpSY0tMQmIjsqKnFQcaSKXrlzHW7b6s2kkLTgoMsnbzx+Vb0LjJyGCdmzet?=
 =?us-ascii?Q?W3lud8Ray6hodIUWTN+9vXRhw0kEyQKi2po2ugGP3CEJt892eOsX8WiMD7sF?=
 =?us-ascii?Q?eqJZqq9CmVTGEWi047MoUCVhXDVfTNASviAVgcNIWPHpQpLPjNXyYe4DDmHr?=
 =?us-ascii?Q?MYL47nbrX7alEFrHda6+ajQHGYkDcmZgXEqYzgk38ueuiDUTWceaTgjBaaBd?=
 =?us-ascii?Q?+UokAMUWva7V9qUGEpKhHCqplHIiCKc1XzNndnMs36IcIth6YUWGZIXFdXQ9?=
 =?us-ascii?Q?pA1y/zAa4AWlUgHOGe3PfZHuVbUAaqQuLHeUqlKHUQ2yrxqs2Nfs+ExaHA+y?=
 =?us-ascii?Q?Dd1tQ/boj6rYDHVRLs4GOam+dkuyMXVWy6aBSJJlQcoHArAC9l+5xg7DoJGc?=
 =?us-ascii?Q?Uv5ggHHKI/1V2d6QY0a4bFx/cwieBuNKaTbEqIys0fVazYgQxcKDA49AIZQR?=
 =?us-ascii?Q?10OJmMXdnI5YwINHqlrOehxpbSd7XgiO8LqZlN99IqeSl0wZs8XXDW9+ul39?=
 =?us-ascii?Q?LW4AcRxE9uv7JDIVsAidLf4tCICiPPDlkX2fOtZ0JbgtJpyU5//Y1Lkd9UgG?=
 =?us-ascii?Q?P3cW22tCu6Z5iBhfo7nHOF1piKLERfUIgteblpJLLfbcxlGfJIe91lApLGiH?=
 =?us-ascii?Q?7FyBIvhpPxfgTZ8Qpts3gzmPU9Tga2g7g7Lk61DtRdv8ktv5iI+N2ZY5C33B?=
 =?us-ascii?Q?DwyO1o10hcZjlAFl7dXLpS5QqQaORxgcKvIi7CUKCc14GbAR8Pr5Q+/2h3Hc?=
 =?us-ascii?Q?0JoGPIYykjkTuAEOxXcUDGFdtHSnWcOkAbGOk+qhMKA5Srf1Rqv49Q4Fxlrt?=
 =?us-ascii?Q?j7l5b/VveEvVxnkGvm7uocT+o2FPiQuK9U7XOohTlW797+yXTtL+026aw8K4?=
 =?us-ascii?Q?CoM4hoWc0B6qIHBG7GiU0d6h/MO6O81WCgQw9E2OxNA+/hdqaxVc/SVyE0pX?=
 =?us-ascii?Q?Vq1g0hXy24e/DSm4RElmNeINPwmorfYrL56dDySWgiGOcNi6nXpRmtT1ukqO?=
 =?us-ascii?Q?wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003983a6-8142-4576-b9e7-08db2570bbc2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 16:17:12.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIZQFGQVUdVAQcn/m7Qjf2zxTvPnTKXvTzIUZ+58I7xbQzvm2H2Vt7ez6qOWdlIbB4p/ReH/5yre/Qz7fijQjgUd1KyWAUcuRwfxuDZotwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6202
X-Proofpoint-GUID: bRVA30dvsr9Idk4ciWFUyY8EbBQogUaQ
X-Proofpoint-ORIG-GUID: bRVA30dvsr9Idk4ciWFUyY8EbBQogUaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_08,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=584
 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 16:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101564

Removed patch which is contained in new version:
  0003-python-Compilation-warnings-update.patch

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...3-python-Compilation-warnings-update.patch | 84 -------------------
 .../{libuser_0.63.bb => libuser_0.64.bb}      |  5 +-
 2 files changed, 2 insertions(+), 87 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/libuser/libuser/0003-python-Compilation-warnings-update.patch
 rename meta-gnome/recipes-support/libuser/{libuser_0.63.bb => libuser_0.64.bb} (90%)

diff --git a/meta-gnome/recipes-support/libuser/libuser/0003-python-Compilation-warnings-update.patch b/meta-gnome/recipes-support/libuser/libuser/0003-python-Compilation-warnings-update.patch
deleted file mode 100644
index 45d695215..000000000
--- a/meta-gnome/recipes-support/libuser/libuser/0003-python-Compilation-warnings-update.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From acd7b051993d501f4b5e3a593e0f18d1336ba2de Mon Sep 17 00:00:00 2001
-From: Tomas Halman <thalman@redhat.com>
-Date: Wed, 21 Jul 2021 15:36:59 +0200
-Subject: [PATCH] python: Compilation warnings update
-
-The compilation produces few warnings about discard const qualifier
-and pointer to int conversion. This patch fixes the const qualifiers
-and replaces the tp_print inicialization in PyTypeObject with 0 instead
-of NULL
-
-Upstream-Status: Backport [https://pagure.io/libuser/c/3cb7ea54e7b50da6ea313a0e7c7187c8aa5e6ee9?branch=master]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- python/admin.c | 2 +-
- python/ent.c   | 8 ++++----
- python/misc.c  | 2 +-
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/python/admin.c b/python/admin.c
-index 83595af..e92fca4 100644
---- a/python/admin.c
-+++ b/python/admin.c
-@@ -1512,7 +1512,7 @@ PyTypeObject AdminType = {
- 	sizeof(struct libuser_admin), /* tp_basicsize */
- 	0,			/* tp_itemsize */
- 	libuser_admin_destroy,	/* tp_dealloc */
--	NULL,			/* tp_print */
-+	0,	            /* tp_print */
- 	NULL,			/* tp_getattr */
- 	NULL,			/* tp_setattr */
- 	NULL,			/* tp_compare */
-diff --git a/python/ent.c b/python/ent.c
-index ee712d2..fc3d654 100644
---- a/python/ent.c
-+++ b/python/ent.c
-@@ -255,7 +255,7 @@ libuser_convert_to_value(PyObject *item, GValue *value)
- static int
- libuser_entity_setattro(PyObject *self, PyObject *attr_name, PyObject *value)
- {
--	char *name;
-+	const char *name;
- 	struct libuser_entity *me;
- 	PyObject *list;
- 	struct lu_ent *copy;
-@@ -616,7 +616,7 @@ static PyObject *
- libuser_entity_get_item(PyObject *self, PyObject *item)
- {
- 	struct libuser_entity *me;
--	char *attr;
-+	const char *attr;
- 
- 	DEBUG_ENTRY;
- 	me = (struct libuser_entity *)self;
-@@ -664,7 +664,7 @@ static int
- libuser_entity_set_item(PyObject *self, PyObject *item, PyObject *args)
- {
- 	struct libuser_entity *me;
--	char *attr = NULL;
-+	const char *attr = NULL;
- 	Py_ssize_t i, size;
- 	int ret;
- 	GValue value;
-@@ -800,7 +800,7 @@ PyTypeObject EntityType = {
- 	sizeof(struct libuser_entity), /* tp_basicsize */
- 	0,			/* tp_itemsize */
- 	libuser_entity_destroy, /* tp_dealloc */
--	NULL,			/* tp_print */
-+	0,              /* tp_print */
- 	NULL,			/* tp_getattr */
- 	NULL,			/* tp_setattr */
- 	NULL,			/* tp_compare */
-diff --git a/python/misc.c b/python/misc.c
-index c4ce819..810a846 100644
---- a/python/misc.c
-+++ b/python/misc.c
-@@ -488,7 +488,7 @@ PyTypeObject PromptType = {
- 	sizeof(struct libuser_prompt), /* tp_basicsize */
- 	0,			/* tp_itemsize */
- 	libuser_prompt_destroy,	/* tp_dealloc */
--	NULL,			/* tp_print */
-+	0,              /* tp_print */
- 	NULL,			/* tp_getattr */
- 	NULL,			/* tp_setattr */
- 	NULL,			/* tp_compare */
diff --git a/meta-gnome/recipes-support/libuser/libuser_0.63.bb b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
similarity index 90%
rename from meta-gnome/recipes-support/libuser/libuser_0.63.bb
rename to meta-gnome/recipes-support/libuser/libuser_0.64.bb
index e191e115a..d86a577b1 100644
--- a/meta-gnome/recipes-support/libuser/libuser_0.63.bb
+++ b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
@@ -11,13 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 
 SECTION = "base"
 
-SRC_URI = "https://releases.pagure.org/libuser/libuser-${PV}.tar.xz \
+SRC_URI = "https://releases.pagure.org/libuser/libuser-${PV}.tar.gz \
            file://0001-docs-Disable-building.patch \
            file://0002-remove-unused-execinfo.h.patch \
-           file://0003-python-Compilation-warnings-update.patch \
            "
 
-SRC_URI[sha256sum] = "8dc377255452a68e82c4837ba22c3ee4ae3658971bf0f2ef67ed0b77fc497f91"
+SRC_URI[sha256sum] = "ea6094c72cb9e60a42fb53509dc98d124a340f1c9222783b503208adc16a0a8f"
 
 DEPENDS = "bison-native popt libpam glib-2.0 python3"
 
-- 
2.39.2


