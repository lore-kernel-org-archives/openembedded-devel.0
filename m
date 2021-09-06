Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.19006.1630909985958260947
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 23:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qYn1cMVR;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48832b766a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1866UDHw003686
	for <openembedded-devel@lists.openembedded.org>; Sun, 5 Sep 2021 23:33:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=/qu1cclopHkYdcofgAfY6PXycEfVWLiHVvdK2YCPZAs=;
 b=qYn1cMVR/3+Dt8UOPQk0i8suuBQzqGiy4FNSPPCWw9DlkNDqesaA6nIQ9YcsUPedlzHi
 11PkMnxIAz9YJLZizS2MTMd2CAtFaaQV8OOHNcYViUfJfISODyGtX6OqM5g171BTHRHL
 FzuzJ6dCOTYTpbp+hchxOHNutHv09NIVmoLPV3ZDOnmIvSUSogNRy+mwq8EDgqYSMxRW
 oET3HxLPqUqleCkGJzFFSXDk7c3WnOTAOPemgkw8jflbNDQf96LDX0Lh0WJkfBnDX/1p
 QAgrJO9/4wnQiYJBbE3oKK49WFZmzxYZlA02EdJMRvQoQQEJHOtw5ixF/wL1BkvBsOp2 +A== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aw2hqg91t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 05 Sep 2021 23:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nu6y/AOxIEY5cXp9RgKClT3mEVh3whxcpUIfiB0JLYGluibC39Agtah/K++TN+FmTN56iVhxZE+pDs57O135UiOROCRkX3xw6Bh7BcijU1LFBsJ/Oht3bYi61+08D6803wOXwLhYlL++oPgXWPCfAuvozNpwt4rbvBNT/72HKaGI2zXnwC16K1UnK8W3SS37cYj2MO8j7kd9XSG5rQRKkYZsh4MrxFKw/msm49nGz6LmLdC4v25iz3PT0kLUCGdyaZmhiT97PBJP6GXCkqru/3jqP4c9lKFJV3X1tD707QJD6FrljLr4FJZzEJBqKAt2PvKfRCnAUQASd6IYx+lecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/qu1cclopHkYdcofgAfY6PXycEfVWLiHVvdK2YCPZAs=;
 b=MFfvGEMCcaM5Y22IDP3Rb/AsBMzlqFgFaXphWRAaT+jDjgfCdd2IZKzXvQLWnFXdwa5dS8tlB57uL1dfHa3nnSys8X30FKI+MUjt1pizyHY6J4Y0MIoA7AfvbMIrlmw5Ugt/8o4f++29G2t6hfzIPMJDQ9nkFaPGbi6YX04yqdSzzePtBHBkw4Z4/e1/Ol/iNsPCsZkL4dUDfISlSKnZjj7Ih6WkWz6Vd//1DuYkkc5AxhlkX3StC8zatZuSzabxO6aSU6izdP2jlmzrmkK5KQGLWmD2FnIOjJRy9aHnZBz8l5gip4rVy+q89bUJRCh9NEV+oKX3oH709YR0+UPQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2319.namprd11.prod.outlook.com (2603:10b6:301:52::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 06:33:03 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5dd9:8ef5:89d7:8b3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5dd9:8ef5:89d7:8b3%3]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 06:33:03 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] krb5: fix CVE-2021-36222
Date: Mon,  6 Sep 2021 14:32:53 +0800
Message-Id: <20210906063253.166861-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BYAPR07CA0106.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::47) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BYAPR07CA0106.namprd07.prod.outlook.com (2603:10b6:a03:12b::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25 via Frontend Transport; Mon, 6 Sep 2021 06:33:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bad8c74-1cfd-47c5-340a-08d971002dd1
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2319:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB23198EA472BBB875262628C6F9D29@MWHPR1101MB2319.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zBak60cTE2ZSf3qKloFSzSUblZ3wztfnMWfJfjl174eJ3PaWsgs6FHcsh9j5nUiAIr6imZVI8s+6ojCROD/4d/6J42J7DBnracF5BFElkEYy3Wq8nwsg98JS+2AscOadbUQ4O5ALwXH2zQyLDW+uL9fUwXWf1vSuAaUPqnaGHlcRB8S/AoWBPlmNseSD47UcGIMunfZit33clyPOM0T05DvEsmAJDZaiAotIKWMHWOgIN1qskoJcV56aK7d+JeI4Ay1ezII0d8rLVdZ4DqevFVRtAVnV0sdQQDaf+T2dpdqyvKxOxBha7BDZ/aZqBA7HyQjx89JVm771tyz30THgIVlcXOhztxpiKFw5OYO8l967Qw/g1ubPlMUANXt7KnYePGo1L05+O7IdkBa/vfFvrwWIXhJHripJePQVIpsiykEWuCry12TAKdFZjIU6RUFKxtSiqUu5+Xe3BgTtHEmRx5twWiQJkbT/j8ezJHCeo89cF29Zpv4g78Jor+5id+kKi4OmnUYILIQIgvafTkFnNvrIL+VTYhEJ+8P7Sx3k1yrOuV9jThpDYJhWDhIOPeOgLs6K1IvRfN6+t19SFj2/O+Y41eEk3xpdkyj5kpnXdNiTjf5tB6m8grUSrHV//G5MgE++rJUJBt2w2SWDIgiOY4QiO2dEJPnSQIs9tO7C0hQK2OGxqPQm5irDc7EraRgxzHh2IXK1OTDv5eQ9LBm2s28cEtMILVIT+ISc5Csy7j25UUYFPYv0YPCixNPEJ7eS9E1YM+vJnZhV/wks4THuqpyv4rbHlnLGRvFOBAb5CWiDJZ8cngWaC8mxhPewHqDaj4VpcdDlzVgNbdKVVdlw/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39840400004)(396003)(136003)(376002)(6666004)(956004)(66556008)(8676002)(86362001)(52116002)(1076003)(5660300002)(316002)(8936002)(6916009)(83380400001)(186003)(2616005)(66946007)(478600001)(6486002)(2906002)(36756003)(966005)(6506007)(66476007)(26005)(6512007)(38350700002)(38100700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PBhAYZtdgsCbhXZ5v8xLmfoayvD67Ps1hS42uqcVmu7kf+K8NCbZjB2pYMOf?=
 =?us-ascii?Q?/7pWhKrzEIC87KM5/7f9bIbXfQbNKnFZ5Ga36gSy3CFTcL59aimND0Af5eEP?=
 =?us-ascii?Q?gDM+ToxQUpeMofHr7s0gerchLOpK6QqMvR/Aa5QaUvHK0S5Fn+Jpuvd0aP0x?=
 =?us-ascii?Q?W6gF0C4NmYmPg76xaH3iUDePRAl4mo1jOw+Px8QYjtCgDFYeDE4iI4b6dsuf?=
 =?us-ascii?Q?qYbKJEpJ3J5BwetFbh7xnesH903Zb7dwI3ybVFwum0myKMn5R4cBUHs2efIu?=
 =?us-ascii?Q?a52UzEi1+YwqEvP3IdTUmN+kGz/sYwyyS6zvXzAi8/tuanVajd+oN/BClJqw?=
 =?us-ascii?Q?OnY/GYv8w9rmueO2rkY+6z5iz1GfMB5TJrXUNIKYz5aXAyofqq55OxGKHan1?=
 =?us-ascii?Q?w7apnli7gUFmfT//C3f00hrHiCct12f2sO+4Vz9BheJDHVh5i+kahy2fkag3?=
 =?us-ascii?Q?dpbu8bg9tqDHq7MAgY7IfPkCk3Of+r5R2of0S0zkpD6xQId5MzHz8UvNBVgl?=
 =?us-ascii?Q?t6UwkHI13Ywn2uV7v/OEJw71qnlaWMyzhk3FAySEi3Ho/BuQKDOkVXfa0vQ/?=
 =?us-ascii?Q?Hqi/7WlJbPuUDLa0jWygbt9DiIYwK6LDuq1g9uV9g2ELDDWfsoUSaAfTPj7N?=
 =?us-ascii?Q?ebfrnujLg5Ze/Ni0mJ/8m+Rzk869Wca9MjlDQJJOIo7E6jdiP1TOxvmvqipz?=
 =?us-ascii?Q?OSJZ5cmkcML7UbbyjRW1I2+rS/Gx+HmGDwQ6EJ3xP4+9Q+1gJOSvxnDfhmNC?=
 =?us-ascii?Q?ES/fjj1BDdezC8HK8ECy9f/k4UrKpnTLh0jWi1gTbNWwdp4t9W0+PmlZF75U?=
 =?us-ascii?Q?N9q1Ab9dQhIrWlucE6puqcBlWf9HKpsHqu8iCRcrLuWCGHXn7/TCFkJXELIK?=
 =?us-ascii?Q?xcjXvXkk3z8+iapHbF9Rv+U7NdyeufbR2YV/gg2A7ApS6lzuk+5z2sPwRHNw?=
 =?us-ascii?Q?fXg009rQ1YPG+zPiq7k/4c9GYTE+1s00iVnlTsSnUXZNUvj2snL0JpoKzWGc?=
 =?us-ascii?Q?ThL9N5boZFjH7zF7JxJXhlZjGH9moc8Fz3wmS5Q5hwTqxI5JlBCqtlyWMKGS?=
 =?us-ascii?Q?e2AOePZlbN8hvmYJdtAAaa8VjEBI02kWPXDoOK94+12OqXoIFgyAwJQY3TnU?=
 =?us-ascii?Q?DdaKGQKD6YDrUspEm1Y11PqU83lbwzb2GC7LkIB1/USDs7lrK+r+fnW1q/6M?=
 =?us-ascii?Q?uFXDtAWGsqSy7Ldz5etc/3kQPXEc5+DvEZNgT0RcHVrIdBH7ymJSuriKoiBZ?=
 =?us-ascii?Q?xSZGkAtAZViNyvvC/S6AXq2tdZjXffee/JQ4lUAOINdP44OEef8ItdUE8O8e?=
 =?us-ascii?Q?WPcVt2RGt+KaMRtZ27LiuFZ1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bad8c74-1cfd-47c5-340a-08d971002dd1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 06:33:03.4629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYM19xBp5fI5fjeDBlmT/du5y8mj7MTqPT0x6THd9nZQPpCodXg4CE4f+E77QjWIeBu5HGPWnN3YVGILbORN9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2319
X-Proofpoint-GUID: S1vRc88ZPIqincWw82mV_2ANg5tx7fB3
X-Proofpoint-ORIG-GUID: S1vRc88ZPIqincWw82mV_2ANg5tx7fB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-06_02,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060040
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

CVE-2021-36222:
ec_verify in kdc/kdc_preauth_ec.c in the Key Distribution Center (KDC)
in MIT Kerberos 5 (aka krb5) before 1.18.4 and 1.19.x before 1.19.2
allows remote attackers to cause a NULL pointer dereference and daemon
crash. This occurs because a return value is not properly managed in a
certain situation.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-36222

Patches from:
https://github.com/krb5/krb5/commit/fc98f520caefff2e5ee9a0026fdf5109944b3562

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../krb5/krb5/CVE-2021-36222.patch            | 121 ++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.17.2.bb  |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
new file mode 100644
index 000000000..fee6e64c1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
@@ -0,0 +1,121 @@
+From fc98f520caefff2e5ee9a0026fdf5109944b3562 Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Wed, 7 Jul 2021 11:47:44 +1200
+Subject: [PATCH] Fix KDC null deref on bad encrypted challenge
+
+The function ec_verify() in src/kdc/kdc_preauth_ec.c contains a check
+to avoid further processing if the armor key is NULL.  However, this
+check is bypassed by a call to k5memdup0() which overwrites retval
+with 0 if the allocation succeeds.  If the armor key is NULL, a call
+to krb5_c_fx_cf2_simple() will then dereference it, resulting in a
+crash.  Add a check before the k5memdup0() call to avoid overwriting
+retval.
+
+CVE-2021-36222:
+
+In MIT krb5 releases 1.16 and later, an unauthenticated attacker can
+cause a null dereference in the KDC by sending a request containing a
+PA-ENCRYPTED-CHALLENGE padata element without using FAST.
+
+[ghudson@mit.edu: trimmed patch; added test case; edited commit
+message]
+
+ticket: 9007 (new)
+tags: pullup
+target_version: 1.19-next
+target_version: 1.18-next
+
+CVE: CVE-2021-36222
+
+Upstream-Status: Backport
+[https://github.com/krb5/krb5/commit/fc98f520caefff2e5ee9a0026fdf5109944b3562]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/kdc/kdc_preauth_ec.c      |  3 ++-
+ src/tests/Makefile.in         |  1 +
+ src/tests/t_cve-2021-36222.py | 46 +++++++++++++++++++++++++++++++++++
+ 3 files changed, 49 insertions(+), 1 deletion(-)
+ create mode 100644 src/tests/t_cve-2021-36222.py
+
+diff --git a/src/kdc/kdc_preauth_ec.c b/src/kdc/kdc_preauth_ec.c
+index 7e636b3f9..43a9902cc 100644
+--- a/src/kdc/kdc_preauth_ec.c
++++ b/src/kdc/kdc_preauth_ec.c
+@@ -87,7 +87,8 @@ ec_verify(krb5_context context, krb5_data *req_pkt, krb5_kdc_req *request,
+     }
+ 
+     /* Check for a configured FAST ec auth indicator. */
+-    realmstr = k5memdup0(realm.data, realm.length, &retval);
++    if (retval == 0)
++        realmstr = k5memdup0(realm.data, realm.length, &retval);
+     if (realmstr != NULL)
+         retval = profile_get_string(context->profile, KRB5_CONF_REALMS,
+                                     realmstr,
+diff --git a/src/tests/Makefile.in b/src/tests/Makefile.in
+index fc6fcc0c3..1a1938306 100644
+--- a/src/tests/Makefile.in
++++ b/src/tests/Makefile.in
+@@ -166,6 +166,7 @@ check-pytests: unlockiter s4u2self
+ 	$(RUNPYTEST) $(srcdir)/t_cve-2012-1015.py $(PYTESTFLAGS)
+ 	$(RUNPYTEST) $(srcdir)/t_cve-2013-1416.py $(PYTESTFLAGS)
+ 	$(RUNPYTEST) $(srcdir)/t_cve-2013-1417.py $(PYTESTFLAGS)
++	$(RUNPYTEST) $(srcdir)/t_cve-2021-36222.py $(PYTESTFLAGS)
+ 	$(RM) au.log
+ 	$(RUNPYTEST) $(srcdir)/t_audit.py $(PYTESTFLAGS)
+ 	$(RUNPYTEST) $(srcdir)/jsonwalker.py -d $(srcdir)/au_dict.json \
+diff --git a/src/tests/t_cve-2021-36222.py b/src/tests/t_cve-2021-36222.py
+new file mode 100644
+index 000000000..57e04993b
+--- /dev/null
++++ b/src/tests/t_cve-2021-36222.py
+@@ -0,0 +1,46 @@
++import socket
++from k5test import *
++
++realm = K5Realm()
++
++# CVE-2021-36222 KDC null dereference on encrypted challenge preauth
++# without FAST
++
++s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
++a = (hostname, realm.portbase)
++
++m = ('6A81A0' '30819D'          # [APPLICATION 10] SEQUENCE
++     'A103' '0201' '05'         #  [1] pvno = 5
++     'A203' '0201' '0A'         #  [2] msg-type = 10
++     'A30E' '300C'              #  [3] padata = SEQUENCE OF
++     '300A'                     #   SEQUENCE
++     'A104' '0202' '008A'       #    [1] padata-type = PA-ENCRYPTED-CHALLENGE
++     'A202' '0400'              #    [2] padata-value = ""
++     'A48180' '307E'            #  [4] req-body = SEQUENCE
++     'A007' '0305' '0000000000' #   [0] kdc-options = 0
++     'A120' '301E'              #   [1] cname = SEQUENCE
++     'A003' '0201' '01'         #    [0] name-type = NT-PRINCIPAL
++     'A117' '3015'              #    [1] name-string = SEQUENCE-OF
++     '1B06' '6B7262746774'      #     krbtgt
++     '1B0B' '4B5242544553542E434F4D'
++                                #     KRBTEST.COM
++     'A20D' '1B0B' '4B5242544553542E434F4D'
++                                #   [2] realm = KRBTEST.COM
++     'A320' '301E'              #   [3] sname = SEQUENCE
++     'A003' '0201' '01'         #    [0] name-type = NT-PRINCIPAL
++     'A117' '3015'              #    [1] name-string = SEQUENCE-OF
++     '1B06' '6B7262746774'      #     krbtgt
++     '1B0B' '4B5242544553542E434F4D'
++                                #     KRBTEST.COM
++     'A511' '180F' '31393934303631303036303331375A'
++                                #   [5] till = 19940610060317Z
++     'A703' '0201' '00'         #   [7] nonce = 0
++     'A808' '3006'              #   [8] etype = SEQUENCE OF
++     '020112' '020111')         #    aes256-cts aes128-cts
++
++s.sendto(bytes.fromhex(m), a)
++
++# Make sure kinit still works.
++realm.kinit(realm.user_princ, password('user'))
++
++success('CVE-2021-36222 regression test')
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
index 6c4b4575e..197c1e096 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://etc/default/krb5-admin-server \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
+           file://CVE-2021-36222.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "aa4337fffa3b61f22dbd0167f708818f"
 SRC_URI[sha256sum] = "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134"
-- 
2.25.1

