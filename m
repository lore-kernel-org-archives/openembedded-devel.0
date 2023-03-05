Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEA9C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 06:11:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4446.1677996680020440086
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 22:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qmHeL9aP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24288e7293=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3256BJ9c009930
	for <openembedded-devel@lists.openembedded.org>; Sun, 5 Mar 2023 06:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=rhLZ+m7Mv6QvFRcaIbYSi8Bj35ZXiu4KvoCntToGWFA=;
 b=qmHeL9aP8FAELWQEHU67WhVK0KcuB5oFdetK1595dtTXuQ8OWOkgv0RG2d1oLgb3VOCN
 ctVP+ck7lVW5Y+gR0XXZSl71hUxlqbChasRlYZ1bhlp2R72jZgkKWgSLkqjJHdXc59pX
 2lXcoFouQD9OaWH+DEDUFZ3UsILTTNagVDgsrx4dhL3+FjBEfTdNuquqXJpYYtUc2cdl
 JuDZbDu7K1FwWfEF4BT+UfxIcowIilfIHhpDexZHcWsywtYSZeQFeqbwvJ4zsyVsqc9x
 renf4xBnplK6iWcwI7VQW4vkz9HdU2Vh4NGAKpnNHViO7aW5NuP3Ug3YEHriP741xydY 4A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p3vya8y5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 06:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4FM0i5tzIZAKfnr7+oMPV+ialqjoATJ9Ni7SILuhI9Uvvs5mW0qJ2Al/MErilob7MVEb4AydjuqEyLLgUIPggqaM2nCF3XKDTHRVdwCe8/b6QOpxzOMU8jR0L34VA1DMXSGYtwb6i7Q3k3K5B3US5DHerHubNZDCggfgSO64/WBjWLGkl6zWwft75Q+J6HhO85hPopQuSLnQru1cHirh1YAMbO7NHLD7IQKTwU+vlSAO1CQvitrsMXxQedzdHtwleRBFOqd+vbef7tKT5OoccWgUfUTgrLmK9Xw8tvKwz1P5w+gpIJ2CvbX5fTJA2n2S+vNAUSZeVio3g0plxnK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhLZ+m7Mv6QvFRcaIbYSi8Bj35ZXiu4KvoCntToGWFA=;
 b=TCZUT+yPVPkXE+Y6YuFT0glsX+6gcqSc2TWtSjeGtahMhGmhr/7T68l5wyCFQSWDvW1aSyKL26xniaVKX+cTeDlj0Vss9vLol/n99N28X/RXMJ84Y9byOv45bBC2pqJuX1gUa0QaXPwNulSlekVOiNlmRuE1hpNnZqjKQo/MOL+M9Ix3EYUFtABVFA3Bab+Hrpxaoi9aDvpw33MzYIEc167dzYeiy9PNVbvrHl4/KygIcp47SMDzA5j5u4bofedxvieGicL+BcrxHFY6hSL/oJz5HLvZUyihGtBQvHqfY4Funos8cxftdJpiYYxIbky8gef05b/rmFchlogiLvGbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW4PR11MB7032.namprd11.prod.outlook.com (2603:10b6:303:227::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.25; Sun, 5 Mar
 2023 06:11:17 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6156.027; Sun, 5 Mar 2023
 06:11:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] audit: upgrade 3.0.9 -> 3.1
Date: Sun,  5 Mar 2023 14:11:06 +0800
Message-Id: <20230305061107.2351567-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0049.namprd07.prod.outlook.com
 (2603:10b6:a03:60::26) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW4PR11MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a61b64-c289-4fae-be91-08db1d406e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DrvVIYT8FsKcYoH2+aEioi5myYuP8PClJQH1GN10qIffrYpZhhHSce0WFxnV19Vfm7Gmho3MJMN4VbYKWNiml0erFzSdR94wUZSnfJHHirveSYGqufuf6GNofkHcetNfV4UZW97jz3+GPtvl45Cue1tGvLCbpOSW2wIXb5ldWWtR7LPeivMgvKPCctaEhPmiq8db072z/xzPDNStzZKj0EHbeYimpy/K93KgvH7mTyxTjeYxE8kyt2pWGhg9A9Z9KFxbt/adyOknZcALYpDrXkTbECcqobWmsB2mTaUV3KNbmxtu1yUcRZrXvl7cmqNbef3G6pAU5abM2eW7BZG+xD8y+M7qioRfDzQxenjP9Y2NHP4/3PV02kAx1HXmjCscyQLagual69EmtBdOqvXrhfwexxKmBpeMGc9huywq7K3J0zd3LUNE4xi96xs/A7Dl2teaDICiEmziq7Ps7MQonAS7xyu1XtGWJQr5FV1U9FtATM2tQimEB45LXekBwGf4A6RZaGfWdjoUivuM8JAijFtGeA97Q15sUfOEzYJWqBnHoPJpB04je6VXkLbhK0X+Nyik8F55/rLdNzHP69CQ/9JTW1lT7jXuVt+5FZhPEW3RhwvKlVxx8F7wfAD6FDDnAfLexGot0o9RfPpNxxKIyAjnA957DruorMB8x6awYRbWoN4U7u8eLEvv+jcRU/Gv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(451199018)(2906002)(86362001)(44832011)(38350700002)(38100700002)(5660300002)(8936002)(41300700001)(26005)(186003)(83380400001)(8676002)(6916009)(66556008)(66946007)(66476007)(6486002)(966005)(478600001)(316002)(36756003)(52116002)(6666004)(2616005)(6512007)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0c/77CrLcTHKve2bWfHb07g25B5Go5BgzZ/liLE4KHcRNbTMnu350aIrVu4D?=
 =?us-ascii?Q?vIgWdr3f4FK3B/hQTXUAD+ZZLZu7BvotNfjqOlzvPnJDxiThpL1Phn6rOaaq?=
 =?us-ascii?Q?9LPZTCcn9o9aXS9h1QJVkck3KZm32+fAz3/DAj7QLf77aemL7O3NTWpGl9jt?=
 =?us-ascii?Q?5dJxzPsm/HrEp2ntiZnTS4QsF5mNv1garXmwpl344pQTgS9NTbYZdG/Pxpi8?=
 =?us-ascii?Q?vlwy97xNwhOuD7Xx/fJqRMYOIEJFWgBnlhBE+Ld8PTLHGK7uXwu+AT0BNzpX?=
 =?us-ascii?Q?Pclu63Lv2jp1M6urG4RWXCB/UupALanGff1WYfNqb7lK5yJUFUaFjj0S72VO?=
 =?us-ascii?Q?EWNQPRKZ7F/k2YXkGkVRK4z1ODS16uzs9ARfQ3wHFP42tDv5FsfMIqQI1VR/?=
 =?us-ascii?Q?4d/xme6Lhweq5Hbd8cv1JDgAMW5YcCIh4ByQwifMm84vuPp/LkXt0zoqnJok?=
 =?us-ascii?Q?XcV/EKaGfHA8raeR6FGah6An89sO4G1UpDO2GOM8q19o0Zgv7UzRdDtPlf5C?=
 =?us-ascii?Q?nQoH6sWt5MbAQX50NGnOrtTVjycqWSv0NI14bNnyfena3kW9ArgqgKzqaHxw?=
 =?us-ascii?Q?fwd64LsW2qkJeiHJIm6rTexxL8NloWbCpnAR/4fRZCPeuyuqxjUlkVeV/Ql3?=
 =?us-ascii?Q?EBSYOr0eueoWscFAlRNt4V9DHxIQVp7pB8EMF28ARs8tJlVAuiv6B/C2Q19z?=
 =?us-ascii?Q?h9JtF15kkt2OYEurdo7c7A/rdDWTBGvWCZw3hgnhFgwXElgc4MM0eRQHpywm?=
 =?us-ascii?Q?DO5BbXlop7V0wA97V14FRem+XmPdUsRzsTojKO6pQZw/dTeKciaSGcvw4u+K?=
 =?us-ascii?Q?PPH6iXommZYJtGUcF8Sgii7roYHC3yKgPhqBZihFuRucqV8dW8XQKFhFaQx0?=
 =?us-ascii?Q?0W31dw4QP+44Yox41n/Rd22wL319sqL5TnP5YUo08yd3y+8ZEq8OclNYr7ad?=
 =?us-ascii?Q?rcG/S0hjecQmKEvuP1m/9EuZAuvtNBr1UyrTXDHwYA+xsuc1tsS+sdkTZhx1?=
 =?us-ascii?Q?/8hQjE8hknfu7tozEdxSHGowOFubZ2nu8ulkNbWZEB66AiaSIdYU7J+Cw953?=
 =?us-ascii?Q?WGgZIaXz2U64gUSUEmITiTrJi0Xk9AC5+IKz4dH6iiliKgDR8gKaYBozntqN?=
 =?us-ascii?Q?EyBfa7MqqG4DcyctzH86axqyQMhBN8PG9TCDF03D6XEEQNOJSsGP55DgEyG7?=
 =?us-ascii?Q?NYF2Kwrm/Rrm0KpPDzitkt0hvuoLKMyku7bmj3r9z9rRP+sW8qWomswIy53i?=
 =?us-ascii?Q?7o/Y0GC3f9fKNsWBj8c3FvFJ/7ThRvC8v/d8flMBCNSWqRB4TpfRK9umxnGP?=
 =?us-ascii?Q?dKxx+VoxyGsy1pDCjzlDu5KAPl73C9klVjBprDDHcPgBs4XvnaLysaSUjPrF?=
 =?us-ascii?Q?+7o64518QDe9BlxMkSRwxsf7b3eCNl5gZmlkSLlbauoZmDZCDnQ2vSHCJAg2?=
 =?us-ascii?Q?UYr2vrQkc56wC4soqQxiSnfBgGAxNkIJGt0E7xOq174imJvVVOzYXrdmkPQW?=
 =?us-ascii?Q?ZOYsePA+md5NDszrdCcPmkOESV6HCR0k8s2zIFttwIb/iodKkfL/7O0j+G3t?=
 =?us-ascii?Q?p5Hjc8iZP7FOtFcxY1Ycoot3lxYtFrX5EKycxbDo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a61b64-c289-4fae-be91-08db1d406e22
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2023 06:11:16.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPI1AdgpFb8QRb0B+vwo808gKCo+eDHVzOHJcUXAo9qtfi1d49XTcP7ePj5QrXaZUXFewRM0aGySXpOLOcFP4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7032
X-Proofpoint-GUID: siVgSR14MAjvkqCX2qVOe6eX4_zhPLDH
X-Proofpoint-ORIG-GUID: siVgSR14MAjvkqCX2qVOe6eX4_zhPLDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-04_14,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303050049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 06:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101380

ChangeLog:
https://github.com/linux-audit/audit-userspace/releases/tag/v3.1
Major features:
  Add new record types
  Add io_uring support
  Add support for new FANOTIFY record fields

* Remove redundant python3native as it is already inherited by
  python3targetconfig
* Fix indentation

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../audit/{audit_3.0.9.bb => audit_3.1.bb}                | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-security/audit/{audit_3.0.9.bb => audit_3.1.bb} (92%)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.9.bb b/meta-oe/recipes-security/audit/audit_3.1.bb
similarity index 92%
rename from meta-oe/recipes-security/audit/audit_3.0.9.bb
rename to meta-oe/recipes-security/audit/audit_3.1.bb
index 9621d9e33..8bd81791e 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.9.bb
+++ b/meta-oe/recipes-security/audit/audit_3.1.bb
@@ -16,9 +16,9 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "81fa28e0e8b4be83ddba03de8b816a3df510c17e"
+SRCREV = "81c813fc4ebb11bf1eca8b8bdb5b253dff31e68e"
 
-inherit autotools python3native python3targetconfig update-rc.d systemd
+inherit autotools python3targetconfig update-rc.d systemd
 
 UPDATERCPN = "auditd"
 INITSCRIPT_NAME = "auditd"
@@ -74,11 +74,11 @@ CONFFILES:auditd = "${sysconfdir}/audit/audit.rules"
 
 do_configure:prepend() {
 	sed -e 's|buf\[];|buf[0];|g'  ${STAGING_INCDIR}/linux/audit.h > ${S}/lib/audit.h
-        sed -i -e 's|#include <linux/audit.h>|#include "audit.h"|g' ${S}/lib/libaudit.h
+	sed -i -e 's|#include <linux/audit.h>|#include "audit.h"|g' ${S}/lib/libaudit.h
 }
 
 do_install:append() {
-        sed -i -e 's|#include "audit.h"|#include <linux/audit.h>|g' ${D}${includedir}/libaudit.h
+	sed -i -e 's|#include "audit.h"|#include <linux/audit.h>|g' ${D}${includedir}/libaudit.h
 
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la
-- 
2.25.1


