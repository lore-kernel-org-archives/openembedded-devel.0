Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.1.1630617561647237920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Sep 2021 14:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IO8W4KlU;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48793745fc=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 182LCgKR019111
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Sep 2021 21:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=tHuC9hJEkoZeJl7P2/nUXZqqduU6jl69EnUfBdv38cU=;
 b=IO8W4KlUL/xsrju1w3S7CaMNIHi1ebVZCn2PmnvxfvOwXfSTRM1Oi1+6RdMVkyiHWzuh
 dST1SIxHZ6scXkjdvjD+qdK3KNmJkuADEp5Mt9Sx6F+icNTREvmvzentO13lsPj417g/
 mfbq0ny2ZSqGshIrB3hDKatQmCWIf55b89CTqNZiFD7womdiyvYKYyoV6dDsabeZGRpp
 tANwIA8yTa/uJ3+xhiOEVAWu4O4lqIjca7tsnbs78rwH+ipL+Fz5Bjk9MdNL63jtg01z
 kFhWozdU004v2iKILegKjE0S4t3YgLnkqNpYRRZ/BIxlb4AVaRD/5dVXe6All4NxazEM +A== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 3atdx1s30g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Sep 2021 21:19:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ9GThMp6nvVjSytjZZUfJ6EEPFafISnF9ZTHdCUBjwOmg8ogKItuqOHYNYKqpjnh4iKu/FIHR1+TlGOPCqCI7emnWIBEjjm0j/4Dk86zyVzA8aK4PiFWw8pTih3n4TjDGvXipOWE+U1DzmI1KvKSm760mV67GSzxZwME0Y0f31R2Qw4YNwZTu5/aEE2gaYzBTdpM2xjfEcP50UprFOrW1zw/CQkZmFPXGbUexUVFSmFAZfQ+psq1S45PWQHtl6tbJORb1o3Z5qzDG6qPUpK+VJYwpvZwrhjfgsl7oY+2cRxTPfgg/3XRLEfwAnQiGyH4nVNIwBz/1qcqK2+5QfgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tHuC9hJEkoZeJl7P2/nUXZqqduU6jl69EnUfBdv38cU=;
 b=l3r8Hzb5FlT3D12QAMBD98k9W0kevAEGGTBchOQNMnJrGZ/wrErtwJow0LKta1wDaRq/VeXXLL8ABMei2esOzo85H/DLtZYPVRs1YkbizNy9wROeha0FlpBFFpzLRetqsZ1B+KEX/xU38RMkc7SQGGUxm0G53CXOQ35C6EFGaYHtHFWPg3AiRHVfbDlHV2UAEl+pnvQn+mzT1e9xfQMHd01T4DKXTF6sKTs29S4yKqt87oL5DMgBViNHsSRQ6HMvDzSGNPFCL1uwOGCHmVTqjPPs+kDjthq3g0EsvS1ZnFVRIf2yjd6BkxRzZJ+BWYSJBc1YNsUQBnb0EtT2f7yqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 21:19:17 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::8136:f22:7050:c089]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::8136:f22:7050:c089%3]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 21:19:17 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [meta-web][hardknott][PATCH 1/1] nginx: fix CVE-2021-3618
Date: Thu,  2 Sep 2021 14:19:01 -0700
Message-Id: <20210902211901.172705-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BY3PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:254::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.4 via Frontend Transport; Thu, 2 Sep 2021 21:19:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89fc1b9b-f459-4907-9e0f-08d96e575280
X-MS-TrafficTypeDiagnostic: BY5PR11MB3992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB39926D8FC0566D510AEDFDD488CE9@BY5PR11MB3992.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QNGQLy9PdqQJ/Pn+DCm2vvQKdpjuwt0SkzsoqTj5bX34QKrODl47aQtyrc7jZ0D1sZCKn6xdl+1BSR/yT0sLoz4SEduOKnvXrjXLUIPWrUC1ItGtBStsJSr3RCIvwAnkyPFN295CjoG9kEF3m52TxGB8lahG7XI01pAGe4qI7W0mVy88qnuLg9qgmBQvbZodb7v4rstenAw1tOqTZfb2Uiqg6NQSMpBRNdvfauCrSxrmRxj6nC/8CNzLRBXEVA/PNk1uSWlbkAFS7SU6v96LSGi4IYOsthu+7Rx1FfOqBgSj9pg8E0fys36z48DHD4mu1zBHw0mTxAvGQQDa2+EiBqE8SzF3Vo6AYVSDTh2x+jKqhTkxgI4lCF0S2eknfNGK0cL1BUZ9HGnxzHfwmYnV6hWO/nx7FECKozNP5F+9Jw9i+tWk7fguRiTsrQHMRArABLT4DgMMwF2EOu5NYLM7TxRRdu3YiBaHGsnaHdjRHH92bwuYLCaNFbhaI7a7uWBdrksvNiLUaa2vkuJrGYvrEvHeQU8zpUd4VSbxgqLv6eCptrTrI0AzsOfZ137dw5DbVbpyiQvPZsF8YBwoDDcM3frMFXoQzroFdSj6S5rNdkVVgDj3a7lTnkWwoVYRdNIq1ZGtQjGZVqITDzd3hSnh6u92HfjgoHHXNWX3Ys3ELA6R9aSIUMJs1mwmTUMvq0uzGejHBNB+Y2jeWfLgEJ1EuBWr4Dc+M5OnUsgV9er74JW2fc7CM9qmIXE2+IIS/vzknufh4YyovHVioBf6zFkfs9Cby5BhPzcArjxkVKvIZeg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(376002)(346002)(136003)(26005)(186003)(2616005)(44832011)(4326008)(956004)(83380400001)(107886003)(6486002)(966005)(1076003)(38100700002)(8936002)(5660300002)(66556008)(66476007)(38350700002)(316002)(66946007)(8676002)(36756003)(52116002)(6916009)(6506007)(86362001)(478600001)(2906002)(6666004)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zx0x4ku6dsG6HymWnjbmM7pKdeOlPwDgO/gpttwaC2fqNYBmW9x9C5x/nEXg?=
 =?us-ascii?Q?ZhlyekIRfmXUM5/nOubkycUdyOTM+Xa4x6NmC4DMmtatQ2PvSj3O+K+FHdbS?=
 =?us-ascii?Q?KRl4/Fs2VCBltSe+VjWHcISZ7/NSlWLK5048BDfUlobnp3jO0yK205pth7gU?=
 =?us-ascii?Q?/nMWCyOu1TUo5PWMmtma+EHkofY1EASQUrTVbbbTqWEM9CD9aeVTRfH/7zlO?=
 =?us-ascii?Q?tAJkwYD2GVKEjX0EyPPWGxDGq9Hv0nPc0m5rLSZIYkSncj26U0XqUMuQLZaH?=
 =?us-ascii?Q?78NM7mdNOnjvjt/+lGJ2I0oN1SxDwrya//ceyfyBj6b8I15QsFdYz1oPyKFV?=
 =?us-ascii?Q?z99CbwarAMH0z4TIyJuQeShUqJUkZTvUX85TXnfUXcq8tc/V+t5pXCmZLXQL?=
 =?us-ascii?Q?QVfzssWdU0FIEcFgRWxu/8Z7S0x8qrVgRfLFbpcRlbFN1YdPw42IA0tI9+Rw?=
 =?us-ascii?Q?QLxq765IsX3gNHVBdFZSCeV/4zWNmZ4gMakC3FaZNr2LYWEOdVUtUE/T/t2D?=
 =?us-ascii?Q?2XgqUnKkdAwIM/elvJ43/IrWDrikNNPcWzK4/YuN5L22caFwkHgKmHYDNQNc?=
 =?us-ascii?Q?48L+QLnZnyXWNIpzURFWzHhxXSzVZQc/24O9syuHUzj1fQEub91s3ITc85Io?=
 =?us-ascii?Q?FhDPQWQWvuah65r0WbOUUxkMeLv3NasDZdIZ7Z+4qJTGHwiDiRgxZ2X8eP2r?=
 =?us-ascii?Q?zwjnw+YiEFLhUZ7yoWDPKDh2PQQrt2/ekHB74upILDNFLcCTKMHLIeOQ+OzD?=
 =?us-ascii?Q?mw873MGaaGRXPUTZI/ah1qGFPchUgqe1trNmaszqMT02K8L8t81ZJ2AxuQ2M?=
 =?us-ascii?Q?zlMWnFHHzIMPiifbQbJf2x56D3RvYxuUXo8pXHxFVCx8O73PkWqKnav1PRny?=
 =?us-ascii?Q?ekwsknKJmg6pJHm5Sr55uQ2HJzU9Q0bJXeljCDCmJkL78eM5ioLWzOCe0yEL?=
 =?us-ascii?Q?6GGUky1kSw8Ggo0kZk81UECO63aHsfULkMKgobx/V70jQKkhsh+DINPWqz9B?=
 =?us-ascii?Q?j2wb8IuRNn7+cAcinP4oKhnQqZjMnS50vPYxBoI2uI03N5Cjw9Uq+g6mbK75?=
 =?us-ascii?Q?vIeu5XG9QPSQAhUNgH2vcXOSSdCi2jSb/OdAaeHvMfPcwiVtKLMbYeO/JDsk?=
 =?us-ascii?Q?X9UZ6DI1ospm/gv0y0kGp1ju21P99rY0pE2V6N5URjhVeGrippv4hIZdScos?=
 =?us-ascii?Q?t1uSDK9mp9cazcEBodLLkGVKcGaD7xtJZLXpam79VNqBUbxq4N6rmCzCun7w?=
 =?us-ascii?Q?bE2eTmPmOmKs6bkh+HxyO41bdu1GgHvptWNEKb0AsWkUJ4b1kOPL2D6zHNvt?=
 =?us-ascii?Q?beTgby4qm6/EQh5ki5n44Zq+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89fc1b9b-f459-4907-9e0f-08d96e575280
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 21:19:17.6775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cR5mKR5Zjx4YryRxjK1KZxKdAC7vrbvc2eKge9lEwPP5QKQeacOeQjp7sZwxRRgDlTa8GBtLH8VTIAr7EcAnDbL3o9wmWLpRW0g9ecgGP9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3992
X-Proofpoint-GUID: KGTrTFT7wpVudJ6rn3tcsdCDiK461vBs
X-Proofpoint-ORIG-GUID: KGTrTFT7wpVudJ6rn3tcsdCDiK461vBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_04,2021-09-02_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1011 mlxlogscore=722 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109020122
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Apply patch made to version 1.20.1 to version 1.18.0.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../nginx/files/CVE-2021-3618.patch           | 107 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.18.0.bb       |   2 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch
new file mode 100644
index 000000000..be42a1ed5
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch
@@ -0,0 +1,107 @@
+From 6dafcdebde58577f4fcb190be46a0eb910cf1b96 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Wed, 19 May 2021 03:13:31 +0300
+Subject: [PATCH 1/1] Mail: max_errors directive.
+
+Similarly to smtpd_hard_error_limit in Postfix and smtp_max_unknown_commands
+in Exim, specifies the number of errors after which the connection is closed.
+--- end of original header ---
+
+CVE: CVE-2021-3618
+
+Upstream-Status: Backport
+                 https://github.com/nginx/nginx.git
+                 commit 173f16f736c10eae46cd15dd861b04b82d91a37a
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ src/mail/ngx_mail.h             |  3 +++
+ src/mail/ngx_mail_core_module.c | 10 ++++++++++
+ src/mail/ngx_mail_handler.c     | 15 ++++++++++++++-
+ 3 files changed, 27 insertions(+), 1 deletion(-)
+
+diff --git a/src/mail/ngx_mail.h b/src/mail/ngx_mail.h
+index b865a3b9..76cae37a 100644
+--- a/src/mail/ngx_mail.h
++++ b/src/mail/ngx_mail.h
+@@ -115,6 +115,8 @@ typedef struct {
+     ngx_msec_t              timeout;
+     ngx_msec_t              resolver_timeout;
+ 
++    ngx_uint_t              max_errors;
++
+     ngx_str_t               server_name;
+ 
+     u_char                 *file_name;
+@@ -231,6 +233,7 @@ typedef struct {
+     ngx_uint_t              command;
+     ngx_array_t             args;
+ 
++    ngx_uint_t              errors;
+     ngx_uint_t              login_attempt;
+ 
+     /* used to parse POP3/IMAP/SMTP command */
+diff --git a/src/mail/ngx_mail_core_module.c b/src/mail/ngx_mail_core_module.c
+index 40831242..115671ca 100644
+--- a/src/mail/ngx_mail_core_module.c
++++ b/src/mail/ngx_mail_core_module.c
+@@ -85,6 +85,13 @@ static ngx_command_t  ngx_mail_core_commands[] = {
+       offsetof(ngx_mail_core_srv_conf_t, resolver_timeout),
+       NULL },
+ 
++    { ngx_string("max_errors"),
++      NGX_MAIL_MAIN_CONF|NGX_MAIL_SRV_CONF|NGX_CONF_TAKE1,
++      ngx_conf_set_num_slot,
++      NGX_MAIL_SRV_CONF_OFFSET,
++      offsetof(ngx_mail_core_srv_conf_t, max_errors),
++      NULL },
++
+       ngx_null_command
+ };
+ 
+@@ -163,6 +170,8 @@ ngx_mail_core_create_srv_conf(ngx_conf_t *cf)
+     cscf->timeout = NGX_CONF_UNSET_MSEC;
+     cscf->resolver_timeout = NGX_CONF_UNSET_MSEC;
+ 
++    cscf->max_errors = NGX_CONF_UNSET_UINT;
++
+     cscf->resolver = NGX_CONF_UNSET_PTR;
+ 
+     cscf->file_name = cf->conf_file->file.name.data;
+@@ -182,6 +191,7 @@ ngx_mail_core_merge_srv_conf(ngx_conf_t *cf, void *parent, void *child)
+     ngx_conf_merge_msec_value(conf->resolver_timeout, prev->resolver_timeout,
+                               30000);
+ 
++    ngx_conf_merge_uint_value(conf->max_errors, prev->max_errors, 5);
+ 
+     ngx_conf_merge_str_value(conf->server_name, prev->server_name, "");
+ 
+diff --git a/src/mail/ngx_mail_handler.c b/src/mail/ngx_mail_handler.c
+index 0aaa0e78..71b81512 100644
+--- a/src/mail/ngx_mail_handler.c
++++ b/src/mail/ngx_mail_handler.c
+@@ -871,7 +871,20 @@ ngx_mail_read_command(ngx_mail_session_t *s, ngx_connection_t *c)
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
+-    if (rc == NGX_IMAP_NEXT || rc == NGX_MAIL_PARSE_INVALID_COMMAND) {
++    if (rc == NGX_MAIL_PARSE_INVALID_COMMAND) {
++
++        s->errors++;
++
++        if (s->errors >= cscf->max_errors) {
++            ngx_log_error(NGX_LOG_INFO, c->log, 0,
++                          "client sent too many invalid commands");
++            s->quit = 1;
++        }
++
++        return rc;
++    }
++
++    if (rc == NGX_IMAP_NEXT) {
+         return rc;
+     }
+ 
+-- 
+2.25.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
index ac303e47d..c20ca6f40 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
@@ -1,5 +1,7 @@
 require nginx.inc
 
+SRC_URI += "file://CVE-2021-3618.patch"
+
 LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
 
 SRC_URI[md5sum] = "b2d33d24d89b8b1f87ff5d251aa27eb8"
-- 
2.31.1

