Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35735.1629181304073773913
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Aug 2021 23:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=N31/hoKf;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3863d9f4d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17H69UHQ026316
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Aug 2021 06:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=n3CO//9pjOjwHE1MhYLh3/fuXqTkR1OdQCgUJDAgDbs=;
 b=N31/hoKfaZneZ8fFD8ri/XRDKksxH75yx0oO+HQMMffyRdjZtneRFHWUnVWo0ArS1yMy
 GO0G1eFbtIK6qZCMp8TTkfnw/4mg5crD0opTPky4yBSQzmmiplapALCUJZzZC8wIXX7j
 jJKvV8Uek6BggRvJKpnmEmdV++zenxk0jUvu8S/vtCERGf1o9E+ugFsBZxwEz/G7TBQi
 HE6zG0fjOQxPSfOdsQ9o3gfu0bqt7aUkvKfBQEAXYDqcV9122MOWffN1FdU8xILoZtb2
 NSK/Uww2ZU1PYv24QGd5vpuN5WUpY9Yn8GMrrpNzi25P2fHGvtRZirnoJthczH21NVCT LA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afwpu8anw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Aug 2021 06:21:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KER/k7Kmwlk1dHmSc6yVIldsIANpysdsF4uyNHBeXjyWh+hdXiCnxGTXFJkfdxYRgMpR5ZxX5J5PSoOxAKlp3Be3uILfTKzNKvukfcB0aeBZi3qcsSODWAt3rbzWs4LDGeKWCfN76u4u2bhYXGdcrMg1BEq9eXFURYxExO8a4Y0g7+O1umX2S5S+sxCmqNnVtiX1NKRw81ifK4THq/N3nvhNyZzhtYvv9J/2mRwOjyMOGFzgGKpBdKTe7NRm8uBFsNvWHa/icDxcnOUsxr8dLuk4T50V8X/eV0LaoT3dpMENCXL3HSc20sw6XbaMuZA9d3sDin4Wm1RuV0lFWNRong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3CO//9pjOjwHE1MhYLh3/fuXqTkR1OdQCgUJDAgDbs=;
 b=UjZ0khfQQy9Xb+UqE2m06ykGQAeivEzPLvffDd6rhBx3qBoqCC46y8dMCcCZusJJ8Bcc+IdexgrrkO33JiWjXPYu8AsJdXmsgJQ33faLygFbJINZA83912PJ75draFYR5g8rguef6qKt/fw8XnEccAjnP1CaeGQ5quNMjI3N+RBIQp0LxL3VM2PodnrBGVygZwB2yCa3oSW9vyfuuCJcUFfAeA0y9nlCaCsX5WwkL6aRN7beDlapfUkvj2ox0QEkYplYxOkpRCCUIEEU64KiRwkTSVRkHc8KnuAtf4j68g0cI5tPK8bp9GmkRQPeqHVX3K0ak3d+wve4q8DsLe3S3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2239.namprd11.prod.outlook.com (2603:10b6:301:5b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 17 Aug
 2021 06:21:41 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 06:21:41 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 3.0.4 -> 3.0.5
Date: Tue, 17 Aug 2021 14:21:30 +0800
Message-Id: <20210817062130.39164-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK0PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:203:b0::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK0PR03CA0119.apcprd03.prod.outlook.com (2603:1096:203:b0::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Tue, 17 Aug 2021 06:21:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8cbba3e-19b3-452d-f2ba-08d9614746eb
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2239:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2239A07F9CABA7E73D21CA53F9FE9@MWHPR1101MB2239.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6N7kGqxUTnxZiUVAzmwrqvNvpOmqWP0fg60KnRzDd5oBXrkxMiwcLxQQpo2uIync8PL4aXpDLXXHPJ8ZqDTOj8hwI479HiqAJjJwEQmvSpRBEke/7ZzI8o+vz8yw9XuQ/jpdg9yZWVWd+34v++6lxTMNIlq58COgXwuW1Rtvcsy0tSpIdgKlFh9y8RWqZiZR2vGfb8+PtjEQb79i2T2g34Q5H9hisSufg0WPZQM2MWeuROyDADlX1V6DvALYhhCgmKw2EOlwhTtscqjdTsw98rayxH+OUE2StEqXXTDWkdtilu5jAVS2ZTFtG0k+bR6fFQysKmsvBndgM352WQc6rnubp05gyCsRaHS08YV9C/jhSh5rETBMoYcp8x2y/Emvzx8TfoiYp/L4dr3m5gk2MngKWEKca0lqJxbnOvATtYpYfZdSvVXmVXqohiqphpjc22kGyGPEN+jj0efFf64tHuKWVoGocY+IWD1wiXTz9R3+Oq4zkhRl2mb0lI+6XVloAMNr2vUAoxrKb2N7Mw7SkwZ5FZRFqGP5JVKCUTNH5ihinDiCfJG2E6WN3mrkrT5lLm+P30KboGPhEedmPumepuUUpJInnynbv4vDZHVcWGkANM5VFisE1gocYQojIjm2mX3a85ggaIuJLkL4Q2P/22U0Lcv6XIoaSoCYDJI9IUeizPQkWnoSVxzWe9ImimNJPT2wUCr49Ir1NqZJTabdgo5XhCKj8fhTFooz1dhcPeuqsPBLjRAdD21UogywgexN2jHH4RxHpgyAi/RVqw20Zr7wGt9iZ69RkBDBqfiUMWValsSVKTGYPm+K3jjocNGt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(478600001)(2616005)(8936002)(52116002)(1076003)(956004)(8676002)(38100700002)(6666004)(38350700002)(44832011)(6486002)(83380400001)(26005)(6916009)(5660300002)(6506007)(186003)(316002)(36756003)(2906002)(6512007)(66556008)(66946007)(86362001)(66476007)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GtvQYFSuoI+hiBIc9o4HlYC1QKcLZ7PAn1NTUaciGu5AbShoaE70Ehxet4So?=
 =?us-ascii?Q?Q3XRWUwur6Tdjw/1pUu0u/P/CoC8FAwN/pKDeDXC3oKEUN7phJs8a198D0F6?=
 =?us-ascii?Q?HOXr3xHflQD+YaLMItpOWdeSX7iFoYj+S3OvetajTh5Dbz6ZyeLpQ4RaitE5?=
 =?us-ascii?Q?9PDx+eFzs97B+QTnbastaUc+gtEc8djxmWwubhGrWNzOieilDIfQup4bX/tY?=
 =?us-ascii?Q?iuvUuC6ov4fwKiL+PIDsAj99U8Ca2qjEHw7sImnb5u1r89zFG0Wa483lChO0?=
 =?us-ascii?Q?lL1li670yX3DXzECrPh7KkQxadgV+4ihkPIgJJEacaivKZSUzxfzsDWCIXln?=
 =?us-ascii?Q?M+wBJXj2FqQL2afViKLRFWeUgPs9L47DeusheTwIISloubOWgeEm6xLVrBDG?=
 =?us-ascii?Q?OzSz7o4Pk/JdyKaQCRzgnrEC3B26yiZ2c02kd6K2WwwwhaG7vfJD9EkMkapg?=
 =?us-ascii?Q?XruskwOBr7Ypgr5Qf+csfuNpovbCwM6r5PMamE4/t0bkOtTC2cfbwtAP5CP3?=
 =?us-ascii?Q?+p/ZWHkrdUZmYyfdKG3C/wpPhfu+5OmBC33ay1SCyl6ctNGO8+WZ1Gi5W01B?=
 =?us-ascii?Q?BIQPOeGI09KqSqZEiFFeqchgtmDn/dtvXqKm0RuvswxT6x3jwM/OOfk98pBG?=
 =?us-ascii?Q?Qm6KpeYmag+U2XDQ1B2+eFSo/q5W24CrBOxNzjjtOO2Vb8+oTNoEV3ggztkV?=
 =?us-ascii?Q?SKrE8WI4hYAO+tXBfqGm1iIQp74GhZ1BDcKWiimo8sB5hZJfUo523rGiQ9dz?=
 =?us-ascii?Q?5De5LoM2jnzxAYOWIMACvP1Sg8q6jbly7OJ9yCdZgE5NrAuwj5a+EUOkmRqL?=
 =?us-ascii?Q?HrhAjsW3SLHlDw+26i3qX0qzZXWcbYNcVve7FYXqO6XfuovNSNCxHon+jUPs?=
 =?us-ascii?Q?yFDNCn99H/55J4v/PGXgI5GO12MWJmfZtjzxltnsize3rFlViCTnmzAZ/ABQ?=
 =?us-ascii?Q?zFfrfv2qNangTLafFM8W1dmf1Dfyz9y6+U1R2uqJlnBwiMu7TIUi0FxjJbZ4?=
 =?us-ascii?Q?dXZMMARlgWa7tCYZz3cSP2gGiUzmFXxEoxwVonrGngONZQrnY8YQm34ofXyT?=
 =?us-ascii?Q?z0SJxaeldKyYyXRZJTHakJlay/leC2D4dQOhvtSv2Lt9LK66Exr88ye+kjDo?=
 =?us-ascii?Q?mlXyN16LpuokOa0vO0S0X2qHqjklRIj65odcoNuHAkAlRUQXvTTD7WqN4yHf?=
 =?us-ascii?Q?a7HL9Ded2SyHRArksAaNRurEsLrnA7OrOdMGjGFYCj56lfjSutRcYQzB6UEo?=
 =?us-ascii?Q?Zldn4Pj9XrP4GMkC+ocjii4IvpIsWQ1teG9u9aj41Ye42iGU1T0e6M/kR4AA?=
 =?us-ascii?Q?z8zGv6XTmgxdn/QMfGyMjB5Q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cbba3e-19b3-452d-f2ba-08d9614746eb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 06:21:41.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5mHmTRAEG9vRerYNMQalH7pTEDBMyiM+CV4Y9UNmenxCForcfCWw2/Kvs3FMHhIKjh989SXn7Y88OsgETgKug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2239
X-Proofpoint-ORIG-GUID: sZ7U22A5Lzx4_WlhAQ5Kci_jbbEv3ocD
X-Proofpoint-GUID: sZ7U22A5Lzx4_WlhAQ5Kci_jbbEv3ocD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-17_02,2021-08-16_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108170040
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Drop backported patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ches-when-user-group-added-deleted-m.patch | 132 ------------------
 .../audit/{audit_3.0.4.bb => audit_3.0.5.bb}  |   3 +-
 2 files changed, 1 insertion(+), 134 deletions(-)
 delete mode 100644 meta-oe/recipes-security/audit/audit/0001-flush-uid-gid-caches-when-user-group-added-deleted-m.patch
 rename meta-oe/recipes-security/audit/{audit_3.0.4.bb => audit_3.0.5.bb} (96%)

diff --git a/meta-oe/recipes-security/audit/audit/0001-flush-uid-gid-caches-when-user-group-added-deleted-m.patch b/meta-oe/recipes-security/audit/audit/0001-flush-uid-gid-caches-when-user-group-added-deleted-m.patch
deleted file mode 100644
index e55093d1a..000000000
--- a/meta-oe/recipes-security/audit/audit/0001-flush-uid-gid-caches-when-user-group-added-deleted-m.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 759318f11352d01b45bbab62c7bf0a53fb781083 Mon Sep 17 00:00:00 2001
-From: Steve Grubb <sgrubb@redhat.com>
-Date: Tue, 10 Aug 2021 11:27:16 -0400
-Subject: [PATCH] flush uid/gid caches when user/group added/deleted/modified
-
-It was reported in issue #209 that in the enriched format that auditd
-is creating the wrong account associations. This is due to caching
-previous lookups. The fix is to monitor for account lifecycle changes
-and flush the LRUs if any are seen.
-
-Upstream-Status: Backport
-[https://github.com/linux-audit/audit-userspace/commit/8662f61108f8b9365f96ef49ca8ca331a7880f24]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- auparse/auparse-idata.h |  3 ++-
- auparse/interpret.c     | 12 ++++++++++++
- src/auditd-event.c      | 27 +++++++++++++++++++++++++--
- 3 files changed, 39 insertions(+), 3 deletions(-)
-
-diff --git a/auparse/auparse-idata.h b/auparse/auparse-idata.h
-index 660901a..eaca86a 100644
---- a/auparse/auparse-idata.h
-+++ b/auparse/auparse-idata.h
-@@ -1,6 +1,6 @@
- /*
- * idata.h - Header file for ausearch-lookup.c
--* Copyright (c) 2013,2016-17 Red Hat Inc., Durham, North Carolina.
-+* Copyright (c) 2013,2016-17,2021 Red Hat Inc.
- * All Rights Reserved.
- *
- * This library is free software; you can redistribute it and/or
-@@ -45,6 +45,7 @@ char *auparse_do_interpretation(int type, const idata *id,
- void _auparse_load_interpretations(const char *buf);
- void _auparse_free_interpretations(void);
- const char *_auparse_lookup_interpretation(const char *name);
-+void _auparse_flush_caches(void);
- 
- #endif
- 
-diff --git a/auparse/interpret.c b/auparse/interpret.c
-index 046867b..eef377a 100644
---- a/auparse/interpret.c
-+++ b/auparse/interpret.c
-@@ -653,6 +653,18 @@ void aulookup_destroy_gid_list(void)
- 	gid_cache_created = 0;
- }
- 
-+void _auparse_flush_caches(void)
-+{
-+	if (uid_cache_created) {
-+		destroy_lru(uid_cache);
-+		uid_cache_created = 0;
-+	}
-+	if (gid_cache_created) {
-+		destroy_lru(gid_cache);
-+		gid_cache_created = 0;
-+	}
-+}
-+
- static const char *print_uid(const char *val, unsigned int base)
- {
-         int uid;
-diff --git a/src/auditd-event.c b/src/auditd-event.c
-index cb29fee..3655726 100644
---- a/src/auditd-event.c
-+++ b/src/auditd-event.c
-@@ -42,6 +42,7 @@
- #include "libaudit.h"
- #include "private.h"
- #include "auparse.h"
-+#include "auparse-idata.h"
- 
- /* This is defined in auditd.c */
- extern volatile int stop;
-@@ -56,7 +57,7 @@ static void do_space_left_action(int admin);
- static void do_disk_full_action(void);
- static void do_disk_error_action(const char *func, int err);
- static void fix_disk_permissions(void);
--static void check_excess_logs(void); 
-+static void check_excess_logs(void);
- static void rotate_logs_now(void);
- static void rotate_logs(unsigned int num_logs, unsigned int keep_logs);
- static void shift_logs(void);
-@@ -394,7 +395,7 @@ static const char *format_enrich(const struct audit_reply *rep)
- 	        	snprintf(format_buf, MAX_AUDIT_MESSAGE_LENGTH,
- 		    "type=DAEMON_ERR op=format-enriched msg=NULL res=failed");
- 	} else {
--		int rc;
-+		int rc, rtype;
- 		size_t mlen, len;
- 		char *message;
- 		// Do raw format to get event started
-@@ -427,6 +428,17 @@ static const char *format_enrich(const struct audit_reply *rep)
- 
- 		// Loop over all fields while possible to add field
- 		rc = auparse_first_record(au);
-+		rtype = auparse_get_type(au);
-+		switch (rtype)
-+		{	// Flush before adding to pickup new associations
-+			case AUDIT_ADD_USER:
-+			case AUDIT_ADD_GROUP:
-+				_auparse_flush_caches();
-+				break;
-+			default:
-+				break;
-+		}
-+
- 		while (rc > 0 && len > MIN_SPACE_LEFT) {
- 			// See what kind of field we have
- 			size_t vlen;
-@@ -454,6 +466,17 @@ static const char *format_enrich(const struct audit_reply *rep)
- 			rc = auparse_next_field(au);
- 		}
- 
-+		switch(rtype)
-+		{	// Flush after modification to remove stale entries
-+			case AUDIT_USER_MGMT:
-+			case AUDIT_DEL_USER:
-+			case AUDIT_DEL_GROUP:
-+			case AUDIT_GRP_MGMT:
-+				_auparse_flush_caches();
-+				break;
-+			default:
-+				break;
-+		}
- 		free(message);
- 	}
-         return format_buf;
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-security/audit/audit_3.0.4.bb b/meta-oe/recipes-security/audit/audit_3.0.5.bb
similarity index 96%
rename from meta-oe/recipes-security/audit/audit_3.0.4.bb
rename to meta-oe/recipes-security/audit/audit_3.0.5.bb
index db550492e..173c2cab1 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.4.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.5.bb
@@ -9,14 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master \
            file://Fixed-swig-host-contamination-issue.patch \
-           file://0001-flush-uid-gid-caches-when-user-group-added-deleted-m.patch \
            file://auditd \
            file://auditd.service \
            file://audit-volatile.conf \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "86a975cd96c3838e56be9d27262f8a36bb822634"
+SRCREV = "c382a4925a7d0d1b332a2f4e689c71d71b0005a5"
 
 inherit autotools python3native update-rc.d systemd
 
-- 
2.25.1

