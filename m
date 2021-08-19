Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.75425.1629408338323888761
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 14:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EXqmTWee;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3865d9b6b4=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17JL8jN5029367
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 14:25:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=g2Jsbav4aARTNVHWvQ1Xik6u8wMS1mjU2EE5+UlF8VU=;
 b=EXqmTWeel6/cVu9n/564vDsM1CEjPsGHeWum47obOhPLwXhDnc29zJcrosT8jLLThwG3
 pLl8iEDTwlvPt79S8haFFM5lRmCW9Y1L+QxtISebs9KwlGg/WBafN+EoDxAahGdq3jWa
 G5yR5jcNyxNMNGDUlN9eIdocgDEiBmROJzHtbZOhioKJPyl0BUb8i5w5bOCspESY2wkj
 Er4y8mFCl5OlmSJTCVCGzGiZMyy678MHleo+R+ok2cUBhxoxk4ybJ6khxstGmhkmjzPs
 mCNrSwLJoBwIMf0zfUMwhg4b2djFuag9XeCAw0xQI56/b0goX/BHwas5s67V3cvQ+fpj xw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ahtm8g784-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 14:25:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1Kf6qfROGoSouZJY0063FXk+vIUpCXCma3OsfQ9DkfdVQi02+jX/IKWTGTc37Y76CdkwMVbQjZIWBakt/93MDDkJhZEMY1vgkTetwhsiULI3+7yNabaYCgFyN7GVlQ7cX4aTNuiUvU1x5pGFIFl/RRAMy7a/GuJkjs2OYl46ccud8OwequLoj+aCfnMSuVoFdoaTmvHqW4fVjqYZnuPApLCECSsE9E5OPHM6mIZz0PkCr5z+RNcCKyI/ZSKDpr02MIUykoNoNBIAgPXTctj+9RfqNBoL8+3boGoQXpFf7YlzFky6aCOPDxwx3BPOwhGhzZplBcpEbMuLS+hkuHE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2Jsbav4aARTNVHWvQ1Xik6u8wMS1mjU2EE5+UlF8VU=;
 b=HYtIQz8lGtppxSb4wYwJtaXzQIxygImQ7LJNhDgWFQRk1+3cJIKjYuYzIOrFro3hKxGyw9TWVFH8Bx72ul4WmQ5dbe+7HYXZOQT4a7h/Tn1/7KjVBeta7H08eOwVxgMysRYeuJxPCxfKDoi7qGmC72qwlYcKBCW4lErHWORUReYCX5AMR9bfeJ6eyIxaIXk8wGXKOFvczAjMVZTAQ3+L5iWxfhRiGdRjBjQl6DHlKr+BJWHuJleJ64Y6l07seFk7ftmUZDiNa/XfIY5ShxNTZj2JubS0hDwKmSFZgFHah4tPn1EtZoU9R/tq8nPzi8xTcXl6hRCSQ2KRONncLA+L5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3654.namprd11.prod.outlook.com (2603:10b6:a03:b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 21:25:34 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 21:25:34 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [meta-webserver][PATCH 1/1] nginx: fix CVE-2021-3618
Date: Thu, 19 Aug 2021 14:25:18 -0700
Message-Id: <20210819212518.117285-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: PH0PR07CA0099.namprd07.prod.outlook.com
 (2603:10b6:510:4::14) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by PH0PR07CA0099.namprd07.prod.outlook.com (2603:10b6:510:4::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 21:25:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c3f38c1-63c8-494b-3340-08d96357e11b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3654294368CA5E71E843B02388C09@BYAPR11MB3654.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c6ILmV33t7zkxZHaI0pqzB7bqVtOAomtongdWyzudRE3+ZyRoA64fnA2SUZnvNmNxiIL3tBp9WjTboqe9jCrePcuip6Std+ObaVyb74pb8S4oa31WxTzqGK3H5W14yvEK15bWeA9a8pKxOEqag3tJx3WLIX5cErV6SzlBKWYlN0RtWwPh/PMbKOyFs/dIhWrkc1pdMlNYX7I1Nt83hA7hChp3hhWZYdLAgqfmDNQC/NdWIXIApoLIZjgtvFaXcG5vIh//QL/zJ/KGDaPxyj4aEznHsoB5AqBuT2zFA8odoFsAKMLfmzn2445AQNgSwk9lXQoXAlAsI7nXP3P8wwZx0/35O1ikkGd0eCFsujFWaDKchUEDc2CN2gO3MzcosaLVR9joWr8yh0qcD5UZW8rep40AB/h1RuKRuq7oqeBrX6hKGhCaWNxoXqiCZbLggXeLjK3jikU3vMpXrTiTCfZL3IgL49GrWwBm+EomyjDujYXbCKryBcJQ7yeeSJU0OJeQ5hQbsjjmeqIQjnKKzrhjaX17ZyEi7Pe3mcfLc3kjSw++81q0TBibfqpYbDMBVlKrQsl4e3ih8WyvxRVmk5ixxRxQ6weeqsHiD4FUNNHkZzmEeLTPY+G2iorbHIWq0Hxoa2qe3dIGkFHStiP2Od9waHtDRuT/hJj/EOFjX9CWlh5U80pFii8OdXm7DJy2ypx9uok0fD3/3k2CDDFOADzllsxOKNpI+e5tj/Bw+kbQjD6rSXxwrdEy29/2i6gutxCK349R/B2exwjl546JBbOArHBUwj0vDQIBD8M0dK+ePsgjV+p3sxJOfIMZOGg+Xx9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(8936002)(66946007)(6666004)(1076003)(6916009)(66556008)(66476007)(52116002)(6506007)(36756003)(5660300002)(316002)(26005)(186003)(966005)(107886003)(956004)(4326008)(2616005)(478600001)(38100700002)(44832011)(6512007)(83380400001)(8676002)(6486002)(2906002)(38350700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nZpU8PZWadbEeNiYaJCua/zz2ZgrpRV5r9635sPC0PwM10JbY5g/sOFwCdab?=
 =?us-ascii?Q?uzUsu3WsGVidKtI2eopP8ROQaAX3UDSiqZ1DYUpwt106D8uvEJikZwMNNHUg?=
 =?us-ascii?Q?9mf4/OUiPJsB/u5teIu1bGs15AXm41ctPDzqWaQYAGqXAn2SRUmJLZAHsMJt?=
 =?us-ascii?Q?w+OYrSQivlN9QHVloUpoC9W46CL4oFYUaox/GdWawu4Kan5dnLOSxzxXW853?=
 =?us-ascii?Q?zvlqQhGOcBsokQoGj8pKpK63rMYX/eAgL3FHeBSt3iyWcbH9LvPqh6FnNTp9?=
 =?us-ascii?Q?Z3O3X69qj2exQ8FSIqV+3nQj8003m3kCp56MHT5WVSf87jqTQsvHWG5A/Mgw?=
 =?us-ascii?Q?0RLxWvmguI3KPXq0J61P4fCRrzBQLlMJVTvLi5OmUOSXwy+wowHFuXhfzepX?=
 =?us-ascii?Q?zLafPdpV5r1ezo9sKu7Ict4XON9E+jnJXo0vBDeIB7ktLtYl76HFg3JH46ob?=
 =?us-ascii?Q?KlvbgDQUD8k+kJQcKz3CrjEZ5A1vhC1tq/5dIj2VLCdcd9+zzyouHXoziQb6?=
 =?us-ascii?Q?48SoYQxfhaSGSnoHQ2cNmHeZ+JnaHKrmnlA/nLVgXz7LDHYGZOHBNc43cbgx?=
 =?us-ascii?Q?V+TSUAsIZ+y9x1LxphdfMpc5GDF5VfYeZc8tp7RTaEYbOtnie+4oXSiYqHqD?=
 =?us-ascii?Q?uFMk1BUH1KKYZ8Veec6fgIwzbNnGk1RGmJNMur+3jT3GFtUijRK3EZZERcnH?=
 =?us-ascii?Q?H9v5qd6wF2gzS4taxJzRDd2diA1VhzV4zKj4QOP6isIBpsqzD0BI6cn+RtC9?=
 =?us-ascii?Q?KB82ZAlC7NnfIrq1GazvXRDNL5qy3G4NXB6GqWj9Ll+kEXEv5AkRSakQJDZL?=
 =?us-ascii?Q?QQgoQBaD5gQGQg+9RB0wqCpXuKfnSMC6x/6zCPcoSn7I0YAid2ANryR9VIAG?=
 =?us-ascii?Q?WyDd3Dydnr+NsaHf+DZNukXbxuAXu6qKRTIH8GSNFS3JrpdIKNh1Na9VfIVx?=
 =?us-ascii?Q?4Y1//YhStu7p3yGPwsZ5RCGcz7pAlvmexyuyGbRaps20URbjA2OJKlbqhi3p?=
 =?us-ascii?Q?8LdhAhpvsfxLnD43VayOcsowoumm0mzL77fPMGH2ZV6X1RZ2lEt9n5jkQT0T?=
 =?us-ascii?Q?VNX70J03RHhEXUrGReC+WKiHI58ChkytsCRm8laeMkTQUBG7mHfOTUOgvLto?=
 =?us-ascii?Q?7zXUovEwjJ08BCkELjImNLr+w+DNupFcDaBbM6LOeX+kTi7M/M6jcuKvXHqX?=
 =?us-ascii?Q?GNECCHVu/2awO5G8XlDyCYwu3Jrzf4ypfRM5Z4BQI6QUaSbnr06ZF/WZpjHi?=
 =?us-ascii?Q?EB3CrxKHr7uZEZNEzyvilx/4VC6ZYdeEzg28lhkmu+jeLTJS3ivwA1cur055?=
 =?us-ascii?Q?w5+GQ9f2HHBF5oUMd5gqeNgA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3f38c1-63c8-494b-3340-08d96357e11b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 21:25:34.1455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFyMfX8U+Rt0Q70ikWRN8pgiTJiw4vbFuTJ+56GCSTdjII/Yv5XWitHbuQk5UnwYnNtdX00ALiGzcauUi/QdLzmBhZL6afSAZ2YDnrsW6ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3654
X-Proofpoint-ORIG-GUID: TgRx3gXMkPltp_t1bVQ8G2QvGCiiNiB_
X-Proofpoint-GUID: TgRx3gXMkPltp_t1bVQ8G2QvGCiiNiB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-19_09,2021-08-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 mlxlogscore=752 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108190123
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport with no change a patch from version 1.21.0.  This patch
was not cherry-picked by nginx to version 1.20.1.

Information about this CVE comes from
https://ubuntu.com/security/CVE-2021-3618.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../nginx/files/CVE-2021-3618.patch           | 107 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.20.1.bb       |   2 +
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
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
index 7f159a2a3..d686c627f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
@@ -1,5 +1,7 @@
 require nginx.inc
 
+SRC_URI += "file://CVE-2021-3618.patch"
+
 LIC_FILES_CHKSUM = "file://LICENSE;md5=206629dc7c7b3e87acb31162363ae505"
 
 SRC_URI[md5sum] = "8ca6edd5076bdfad30a69c9c9b41cc68"
-- 
2.25.1

