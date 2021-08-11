Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4377.1628664688660491590
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 23:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WyodLQWX;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3857d9322a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B6aKG1020723
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Aug 2021 23:51:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=z51emXxroOLlWDfaJSjMdWytZ1QTl73aYWXA5KgwUFY=;
 b=WyodLQWXOl7ME2UO9rJjrtNP1LAHLEY2eX3YON5m8jq7ysCV7K8okGAPFo/60ZdQqY4x
 duPBnfog3u1m8cKZT0oDjgClLEritFZtEPn/zi7c3mgZwLpwo+RYVg9mqGCM5qet/LuG
 mWh7MWZfKoYCFPDEvNHED+CaNFjUnQWaoPfXQ1ihjRsFEddfES5mRCsSPeYPlbdRS4bG
 oExUihiBMN9BHe7Y/sEdm15MUy6kvRbKFBp0IPnTCQ3f01PfsCPa1P8Dr7cPtgt19CiA
 V1f6Zn7VnvekpkAJFyA+m0M8ldFJN2UmrWkKdNt3zgJRTECIfKmhDbrNMNiqVefcPv01 tg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ac2xf86f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Aug 2021 23:51:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTTsJoxWNrvnclHmw5jrNGC9I2Y9aH3cGIQpoSb+MrrMMnVD1ectAzdvwYLtd7RWn2I0ykiZwMO/XOlN9ZZrmkvliY4xwuInRUR3Z4E4HOwTJYeC7TEqLq24IbA2hNGzBU2GTj3xm9wUAJKI+mUQ4ilFn4um1KJwwe5gCBL4X9LybTG95OeEN5JhRdHvOjcE88smEfuuRsAgOrm39vluTXqCU8LC4cCatFPaOWhIlW/qiKqPq+wFSyOBDgvXKH3KJp5k9jArmmQyVBHp9C7rXSAt6RmqkiQ5k0MCMGWEEfCdWzVHQRaq2KwLMsY7RIUXnydJSE9dWBt87O+WAOzfmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z51emXxroOLlWDfaJSjMdWytZ1QTl73aYWXA5KgwUFY=;
 b=g+x5U2lAoS2OmAV2mfoV8DInZgHk8bltmy7SjWO5KDPyjIzoLa+0Z0RnMIQROmYFvCLht3r5U34mkr260QoMZNpYkRKkDKqaj0GO6AYhGExszAca+lH1EU/YS/mrQ936AyWgEk3tgTuEP00Hrk8MG1PsPNQVKuXU/EJ34RSGu97cGH1MH0wrmMJLT1DhAsJpdRsa14fag1zUWAmsfHJx73u0wD4RLPptmRp+ckOpLlhyNH2/9WlCtVKD3Ju108PJicqhbPd4q8lPgXT84wlTkEzIP4JKvNgaOcd9u9QFaEBoU6GcLdZA5kZ1jW5Zar5Qi9Eoj6AYcIPk8UiToPAFHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.22; Wed, 11 Aug
 2021 06:51:25 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4394.021; Wed, 11 Aug 2021
 06:51:25 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 3.0.3 -> 3.0.4
Date: Wed, 11 Aug 2021 14:51:15 +0800
Message-Id: <20210811065115.79153-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:202:2e::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR06CA0013.apcprd06.prod.outlook.com (2603:1096:202:2e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend Transport; Wed, 11 Aug 2021 06:51:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a30a3539-e081-4c9d-e801-08d95c947000
X-MS-TrafficTypeDiagnostic: CO1PR11MB5058:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5058373B26AFC0AC8435D03BF9F89@CO1PR11MB5058.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6Y5Vbkp2ObOShkUP0nHNYe1juuiZVcvHl9EVYwQiRalR2AhJfJnIvK7TDHO9Yok47+0rAIbOXmSzCo8FOgjmN+5kJMO8L0VexsbIr+5Ea8yWCFbwTfWXHBx41LYJTnxxO/nZTP3uYsScjch9ZMFT803ieFeBkbOkGBd0o9FVRmdLoyPp1/QTbFXW6OngJt+DP8PghU7JEuZDowuzHyM4t0eAgGEUz8EyVLBNX3zJpZN+QIpsxXOJSZ8X6TffuOMnb/kWVDrdxZZy8gma5/VTBC2nr7E7xN4ZilADhk6GcybbEFBwIytv7vvOmD82NuL8Irq5dUa74t7CuTA5aSBR7Z7V43PgehDlv12ospwCF420xEQ+hDgMxLIBdpfGfA+Bok7IDMOaYdxCT7xUInramYdnErdmEa7/moLlruBDXgzXpZb+rY182KF40iUtCXEka032x+CxYuSGofpMNmNUz/SNGkRrlRflhiScFzdOul0BPsqouFYn7r//hKJN3fLFURc13pC0FscEXIkeHCLXAFByK9mPQdUNckBPZSrFFsS17vqqVXQmbVKcrSJ3uVwV4W5JQJRVbf4iOeBAl8P54XwdOyj/aPBgb4WMf3xZQpckNgI2gHpQSbrpP8VZhr3ZPPJWx8BvALkYPNyx67qRNoYZPH98QIM54SqNSXrQIN08QB5Ypy8ZwPWCuJcTMLYdkQ2WAe/dqG7xeYU1VkTrWEweK7ag/CI8gCbMSdiPeTPCc7D7JZuA3kgLBX0B0cf9fkHUWSZ1TpI5zR9Son/DT1F2/85gWBlkOdFtUxrshNCQ2YXG2yAW8Mcq+C6zYKXL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(136003)(366004)(5660300002)(36756003)(8936002)(316002)(66556008)(6666004)(38100700002)(478600001)(86362001)(8676002)(186003)(66476007)(38350700002)(6916009)(1076003)(83380400001)(66946007)(6486002)(26005)(2616005)(44832011)(6512007)(52116002)(6506007)(2906002)(956004)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?atTqtDbSSKjjbvy4hDRqGqJIV1OTO2HZwAbUWaiMVsDrkuhSY10lMBWGeV8h?=
 =?us-ascii?Q?QNjO58NocfCXJURv4Zq0HSrnvUcxWvig6G9AKTWPJFfiDuYt9pbYkE/ROiTn?=
 =?us-ascii?Q?wxahzKZrmeqSq2Z6ZHr5yYDgflZU/dtVqGQT51g2S4NLrJlPE0hEmPDtede4?=
 =?us-ascii?Q?RJsFz2Tb8qOnume324D250HaIiN0R39AiUiojBxVCipIQq4JlJ9Aryuqrwn/?=
 =?us-ascii?Q?sW41+DiBKKdImOYRz3+MleHV13RNQwialt0AH1UNJVKN0Q7rH43q9oanXW6z?=
 =?us-ascii?Q?OWE2YG4fm8arrjwYhswN0GFNVy6zM8nIW0u4GxbrAeiTYCBI2e+MPl2AYhW4?=
 =?us-ascii?Q?V2Ux+A7KkrUkc5ktaXAGl36TUTBc7WYPiivJIhhxZvmGr/KyOZZl28ifxrcX?=
 =?us-ascii?Q?b7EQGPoMr/PIBMzQ49JFny0ZX4J3f1U2Dxg2mAhZNQ+Dqz5uiSD3+KcmMv7E?=
 =?us-ascii?Q?yOHWlQLX0R0YUfszMII8aWwpLtQJ27RWcUiucsuUjplu21UgSRfZNWKeCtjX?=
 =?us-ascii?Q?O7lToXg0hGSEZ2TT9uaaRu5WlV+uFRWb9v84k0IlC1/HiP96damfRpIotdjl?=
 =?us-ascii?Q?xsn4hZeIK5NCIg5OIvxRN3snJ6kkZ/knsJtVNU4KO/YFoWwwWDeGaGDTlag8?=
 =?us-ascii?Q?ag8Vgb10CrpqNkKmfvNTJbD01hJS3gdtTYbN+7jiwRqYBNRy485+4xmSEOQC?=
 =?us-ascii?Q?mOebUddmhgzp3LunC/40exOagONEBlahy7cVpuA48zn6xBafapAVbCPunIvq?=
 =?us-ascii?Q?fWYgWHrPKntxk14qByHlOSiHO5QI5BpjKkiUnUb+UBZSMOmj7El4qAU1bKdt?=
 =?us-ascii?Q?L7jF4bZzV6wfcAxHg4Ea8a2YfldGs4V7QnE3f3I+i479litJQ41KW9Xyto30?=
 =?us-ascii?Q?uotTTNQ0BGOa1g/5rTXupBqVtXLlojY201BQUvXC3UV9yFZkfRCYCpKEMIqQ?=
 =?us-ascii?Q?ya7AurUgsfY4PTO4qr2fjRjqwRQK6vUdkImaZnu+JofY3k0YTKDGNuMSgOv+?=
 =?us-ascii?Q?p9quZg7pfNypscHeNtRtSS1D2x9j2f6cPqVTCoXj1PZhrXzKtSw99iCUFktD?=
 =?us-ascii?Q?0DzbTVWfCo4s1i8m6PVEd7NDDuuMoY6gc4ve3uuY/MiVjpW+JRz/45Kvaf6W?=
 =?us-ascii?Q?e22JcBzxtbNzny7yYAyuf48eTs+g+ndYBfkCeHyBHuMDJ3ucQou5MGylYITD?=
 =?us-ascii?Q?jsqUZ5IT5P+TZPw5YatRXpAEGe8ssyRbOaGXn4YMKYPG7YRAfMr9EgnOFWzm?=
 =?us-ascii?Q?wKeyiZ1ZuAwhYEqDtY1suAg3pfulRUeBObJi2Txunfl9YjbmG9kGkYXvqpCK?=
 =?us-ascii?Q?Y+IjKtPoQ+3bywViiaWcreAl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30a3539-e081-4c9d-e801-08d95c947000
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 06:51:25.5191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVdWrqbEzXzKBjXL0fge5NKkaP3S4Tc6LV1t3nlz1B6EZCYAhpr5T70USgUJhOFwtXlJ7ZzNcmedG+xRf8livw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
X-Proofpoint-ORIG-GUID: o2T9QcI2L1Pi7aeMnL9W63XxgpMHJ1MX
X-Proofpoint-GUID: o2T9QcI2L1Pi7aeMnL9W63XxgpMHJ1MX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-11_02,2021-08-10_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110044
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport a patch to fix the wrong account associations issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ches-when-user-group-added-deleted-m.patch | 132 ++++++++++++++++++
 .../audit/{audit_3.0.3.bb => audit_3.0.4.bb}  |   3 +-
 2 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-security/audit/audit/0001-flush-uid-gid-caches-when-user-group-added-deleted-m.patch
 rename meta-oe/recipes-security/audit/{audit_3.0.3.bb => audit_3.0.4.bb} (96%)

diff --git a/meta-oe/recipes-security/audit/audit/0001-flush-uid-gid-caches-when-user-group-added-deleted-m.patch b/meta-oe/recipes-security/audit/audit/0001-flush-uid-gid-caches-when-user-group-added-deleted-m.patch
new file mode 100644
index 000000000..e55093d1a
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/0001-flush-uid-gid-caches-when-user-group-added-deleted-m.patch
@@ -0,0 +1,132 @@
+From 759318f11352d01b45bbab62c7bf0a53fb781083 Mon Sep 17 00:00:00 2001
+From: Steve Grubb <sgrubb@redhat.com>
+Date: Tue, 10 Aug 2021 11:27:16 -0400
+Subject: [PATCH] flush uid/gid caches when user/group added/deleted/modified
+
+It was reported in issue #209 that in the enriched format that auditd
+is creating the wrong account associations. This is due to caching
+previous lookups. The fix is to monitor for account lifecycle changes
+and flush the LRUs if any are seen.
+
+Upstream-Status: Backport
+[https://github.com/linux-audit/audit-userspace/commit/8662f61108f8b9365f96ef49ca8ca331a7880f24]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ auparse/auparse-idata.h |  3 ++-
+ auparse/interpret.c     | 12 ++++++++++++
+ src/auditd-event.c      | 27 +++++++++++++++++++++++++--
+ 3 files changed, 39 insertions(+), 3 deletions(-)
+
+diff --git a/auparse/auparse-idata.h b/auparse/auparse-idata.h
+index 660901a..eaca86a 100644
+--- a/auparse/auparse-idata.h
++++ b/auparse/auparse-idata.h
+@@ -1,6 +1,6 @@
+ /*
+ * idata.h - Header file for ausearch-lookup.c
+-* Copyright (c) 2013,2016-17 Red Hat Inc., Durham, North Carolina.
++* Copyright (c) 2013,2016-17,2021 Red Hat Inc.
+ * All Rights Reserved.
+ *
+ * This library is free software; you can redistribute it and/or
+@@ -45,6 +45,7 @@ char *auparse_do_interpretation(int type, const idata *id,
+ void _auparse_load_interpretations(const char *buf);
+ void _auparse_free_interpretations(void);
+ const char *_auparse_lookup_interpretation(const char *name);
++void _auparse_flush_caches(void);
+ 
+ #endif
+ 
+diff --git a/auparse/interpret.c b/auparse/interpret.c
+index 046867b..eef377a 100644
+--- a/auparse/interpret.c
++++ b/auparse/interpret.c
+@@ -653,6 +653,18 @@ void aulookup_destroy_gid_list(void)
+ 	gid_cache_created = 0;
+ }
+ 
++void _auparse_flush_caches(void)
++{
++	if (uid_cache_created) {
++		destroy_lru(uid_cache);
++		uid_cache_created = 0;
++	}
++	if (gid_cache_created) {
++		destroy_lru(gid_cache);
++		gid_cache_created = 0;
++	}
++}
++
+ static const char *print_uid(const char *val, unsigned int base)
+ {
+         int uid;
+diff --git a/src/auditd-event.c b/src/auditd-event.c
+index cb29fee..3655726 100644
+--- a/src/auditd-event.c
++++ b/src/auditd-event.c
+@@ -42,6 +42,7 @@
+ #include "libaudit.h"
+ #include "private.h"
+ #include "auparse.h"
++#include "auparse-idata.h"
+ 
+ /* This is defined in auditd.c */
+ extern volatile int stop;
+@@ -56,7 +57,7 @@ static void do_space_left_action(int admin);
+ static void do_disk_full_action(void);
+ static void do_disk_error_action(const char *func, int err);
+ static void fix_disk_permissions(void);
+-static void check_excess_logs(void); 
++static void check_excess_logs(void);
+ static void rotate_logs_now(void);
+ static void rotate_logs(unsigned int num_logs, unsigned int keep_logs);
+ static void shift_logs(void);
+@@ -394,7 +395,7 @@ static const char *format_enrich(const struct audit_reply *rep)
+ 	        	snprintf(format_buf, MAX_AUDIT_MESSAGE_LENGTH,
+ 		    "type=DAEMON_ERR op=format-enriched msg=NULL res=failed");
+ 	} else {
+-		int rc;
++		int rc, rtype;
+ 		size_t mlen, len;
+ 		char *message;
+ 		// Do raw format to get event started
+@@ -427,6 +428,17 @@ static const char *format_enrich(const struct audit_reply *rep)
+ 
+ 		// Loop over all fields while possible to add field
+ 		rc = auparse_first_record(au);
++		rtype = auparse_get_type(au);
++		switch (rtype)
++		{	// Flush before adding to pickup new associations
++			case AUDIT_ADD_USER:
++			case AUDIT_ADD_GROUP:
++				_auparse_flush_caches();
++				break;
++			default:
++				break;
++		}
++
+ 		while (rc > 0 && len > MIN_SPACE_LEFT) {
+ 			// See what kind of field we have
+ 			size_t vlen;
+@@ -454,6 +466,17 @@ static const char *format_enrich(const struct audit_reply *rep)
+ 			rc = auparse_next_field(au);
+ 		}
+ 
++		switch(rtype)
++		{	// Flush after modification to remove stale entries
++			case AUDIT_USER_MGMT:
++			case AUDIT_DEL_USER:
++			case AUDIT_DEL_GROUP:
++			case AUDIT_GRP_MGMT:
++				_auparse_flush_caches();
++				break;
++			default:
++				break;
++		}
+ 		free(message);
+ 	}
+         return format_buf;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-security/audit/audit_3.0.3.bb b/meta-oe/recipes-security/audit/audit_3.0.4.bb
similarity index 96%
rename from meta-oe/recipes-security/audit/audit_3.0.3.bb
rename to meta-oe/recipes-security/audit/audit_3.0.4.bb
index c30b97162..db550492e 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.3.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.4.bb
@@ -9,13 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master \
            file://Fixed-swig-host-contamination-issue.patch \
+           file://0001-flush-uid-gid-caches-when-user-group-added-deleted-m.patch \
            file://auditd \
            file://auditd.service \
            file://audit-volatile.conf \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "17c100abcfef4cbd94a0a5be9b830c8386c3add6"
+SRCREV = "86a975cd96c3838e56be9d27262f8a36bb822634"
 
 inherit autotools python3native update-rc.d systemd
 
-- 
2.25.1

