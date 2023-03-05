Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6986DC61DA4
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 06:11:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4447.1677996680686157343
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 22:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HkhMxvwv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24288e7293=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3256BJ9d009930
	for <openembedded-devel@lists.openembedded.org>; Sun, 5 Mar 2023 06:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=XIff35ocP+yz2kgDsaNpOolWnxDYqXUGClTQBD4W1GA=;
 b=HkhMxvwvW4JTSvmQjuABAGIlthuOi6fO7Ynb0c49G8aL3wt8C/n0yuZIhpwB/D6mH1NS
 cuI7R/2YccOuzMPLBIuXq0CarmKAB/T15m4OisA/+KE5n2Hj/uwzJSzLq2eTcrQtptxf
 yIJtwfqEkk48fq0vZWPLWTsSYW0nPn7hsFCcbD282OWxh3LHtH3z4ajhVQkzPyGMsk2h
 jE2QlWSf32i0d2xMgKtZd6XurDQGSUzd40i0tUFNrxSqD7GZeY8R5JnjYp9cjEQ+4gNS
 bnxRUPtZp1ZyQQCdOS5iLJtVx1nbo5aTTd+uWaOjlWLkLLWcLyW0PJrLmRrkd2sSSvJE vQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p3vya8y5t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 06:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3ntQE6TpARPgNCm3c+sWJj/KdPsa/W8MQHCTtcc3sKFQaTuTEl8Z9ZzNcCdy2U8TAtyRgzAbKa2xp3S26Oqf2AvxfSNEfbydyfvaXHWiVQyxsuhuAIq1v5M00y0qef/xu+Rav9WFC0Qm7k6WfjeUwkDtiLgBNMorWfE4tyFKKEk081deirlqNTJ6svcTH6Qh7tZ1RyvcREfSwDtX3j7kCisr5EVjypVvjag/0NFh6AkZ+cDfx20c48POJ0eopHe3jk9zXhovMYa15rF3cTnDQrDa8NDlVAEtlwf4gkc/YI27/vaMW//0u7VQrnOIK9C0cL0g7P4uO04KjaCUubLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIff35ocP+yz2kgDsaNpOolWnxDYqXUGClTQBD4W1GA=;
 b=XCLMJhFOVa83R5bbKbslkIfViEUZMA3NsHLSBB5Zdpll7IcqqMljRjmld/AVlFnaGkKL8HcPaIb2xf6nBXbbrPVa3skrB35b9yl9q95dfn0D16AX4eq9+LfF//466L2kcSp6G8OPamUpYwZlQ3JP2JI4kPdCM8zFsa5i//yf1DSIV1V8ihtvR6BIsYFWCGrhtP57RPHWHWPmRyL16lQr3G8gSfgFJ0/CY7E6ybht3eussYbGwdIgVCk8hd7ADRE2GkiSK7W5jEkin/F3NyHOpRcg5JFSfD2X96Ndn7MaIoxxy0lJMcS7J+cHR2kXQJ2wAambrVKXE7cXlPcXEKXttQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW4PR11MB7032.namprd11.prod.outlook.com (2603:10b6:303:227::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.25; Sun, 5 Mar
 2023 06:11:18 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6156.027; Sun, 5 Mar 2023
 06:11:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] audit: drop version 2.8.5
Date: Sun,  5 Mar 2023 14:11:07 +0800
Message-Id: <20230305061107.2351567-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230305061107.2351567-1-yi.zhao@windriver.com>
References: <20230305061107.2351567-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0049.namprd07.prod.outlook.com
 (2603:10b6:a03:60::26) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW4PR11MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d0fbe81-78f1-49a2-7e08-08db1d406eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PqOptRPaI1SSesRc0JkI4i9sbS+ciN2M8QvWPqn8krd0vbaCkEKwwwPH9+JDCfobWQWyy2K+9ABHpbKPkmkzjkLo3BvD+RsoEWdl+QcEIoG/sS6IZOKXouUlFCeUDvIuHzzUWMK3PLriXVy9AonFDbYAjRvc9hrFlzgmRj3zRFxoCXrknRUelyQ7T1HPz4eTpen+f1ThnrDk8OJYgrL0u3HZMJvB26PxD+wR9x9dwgKMa8eqZ/keotiPaKlPzkF3iiOVebDxBN+ItB1WyWVCxSEPTKanrEFJtiSYfNeVM8gOZCnta9kj9t/iMklvSKGs6uFoJcU0irxo3xxrpOrBsedJFehB3AOZuclLMAwM/lfDFtM3YRLNAYx4HVMR1y+kKlt3n9Eh6oPqm33splOJiZeE4WrRUK6O6ZA0gp2v19oHNEFKn88A/41e/GufF3ryz/5D7x8KjaSYhxJCgjTnU8VHedqqeGgQ9/MIHMwP0ReZ/OgQ/ZGhr3qaL6AazCqGiU4YRhhcAKWztrm4f/ISzGIbV0smQ+0XHkjx+CJwFzjpqYG6YR6Ios5U5f76qzdsNxL6Y91YZeKK6It08OV0tfQhHfMNofo8oVO6ea+uctUpBJ5w5n/sRF9voRIs08opzH4Su3sXYMD3ihcFmylMIaeEWOdjfLv6uJgvU6dGMIUfY1feHSuGotFJKdHhVYwdYbaNcgvK2WHTiGY/wV46W0WXsOgkkbmAj0XRMB93VFrn2pjeM0WFY8+SdqoX9WF9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(451199018)(2906002)(4001150100001)(86362001)(44832011)(38350700002)(38100700002)(5660300002)(8936002)(30864003)(41300700001)(26005)(186003)(83380400001)(8676002)(6916009)(66556008)(66946007)(66476007)(6486002)(478600001)(316002)(36756003)(52116002)(6666004)(2616005)(6512007)(6506007)(1076003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Kyh5hvI2Nke5/NgpEhROMR0TsoxIJ8xM5R8UxUKk8Xs9mNS93QxHncZ/N1D?=
 =?us-ascii?Q?40/6F0+DfRCB6pTJt0PiTSzHbHudfcdXRxIEkO5cT99hc3RXTiF9qf06fAla?=
 =?us-ascii?Q?WcRBPHx7joC/z9F0fasii9lHcc82DlIwb0RvuQfVHgPar+QxNgihATaCQf7U?=
 =?us-ascii?Q?z86Xqqvqckf9UtdLO7o1wL4AV92ytMIiWPROKFSdv/OZIXmuR2Z4TCuMmE0G?=
 =?us-ascii?Q?GL8bhV0UcfWvoLL+r2NQPDJixRmkoIHBsiIik2Ti3vWHtU4CRJ5bfoDk9v4Y?=
 =?us-ascii?Q?h8YXlHVMkwZXWtyFCc23PYFcceVJhle2oCs7R5xv3bSN1ZFJ8cHOrWh8fSkD?=
 =?us-ascii?Q?+fDuQTQY9zfai759Nw50na22bkpDVEYLsnjjebdMQzDM4D61U7OKEWhtoCvn?=
 =?us-ascii?Q?C5+J+n2TqhJ4C+jG4Jua8/rbTOJF7C94h6JdnvSiSxkUGOX0LxTfNRyk19HE?=
 =?us-ascii?Q?umx+GWxdEjxMHXO5LsEYrWN2UA/6vIuzwiuI2qsHH/RHkZ2VBIMGLupBGaNp?=
 =?us-ascii?Q?AteVtPtPHTBLPdEerHRHX1yFRY6dbMbt9hhVsZt4zh0fuB2GWwvLqATv1og7?=
 =?us-ascii?Q?untcsmoI5r2zxGHKos2PlV3gZMtjuSMiEsZNg+N+UDtDbF1XdplTKoiuxLXj?=
 =?us-ascii?Q?Ru1DPjkT2ZwsAhuJHVySo65IhOnq99LxSL7uMgYmQIbUIU0IfXst0nPFkbkg?=
 =?us-ascii?Q?SpnLLjd5Hccgg2a3LOYJXXKiVgeS2cDrlV2QjuZfugh83zGNcyYXwSfL8Pom?=
 =?us-ascii?Q?Z9pcXfNEHzMuablsvf1c0SFTa4aAC5Ax91Ua2NTsamPtsxuMa3OfvNLnJ2nD?=
 =?us-ascii?Q?dgH0NDDQ7T1h7tigiZyKTNuB4GwCx7VT740oYel2y0lra9Jb3MabV1370anv?=
 =?us-ascii?Q?z+hOmizAwqS0t25Som+msFhVWS+wa3jEeE812XtyCz2ieWS8JwjOoZKiQyNj?=
 =?us-ascii?Q?28pQmbjvgTvxQMQrHF81IpPByehTV28zvZwGjb/joZ4B8C302jplWzz1+X7y?=
 =?us-ascii?Q?bGy0R6et5S7yJcJwYLfYn1dhSGIoMofnEZzU5Tz0P9L5YStwv+o3RSWcf1dm?=
 =?us-ascii?Q?rUpcrYSLWhGy8uRKYl5hC4ScFpl8JclK5npmfvQjryVrCppBAzrbqlXKIRg3?=
 =?us-ascii?Q?auAODuB+F8z3ZvFBtkAEJxEBah5JjQliISV/1No0c4eYvm3ugo8nTzahhRdU?=
 =?us-ascii?Q?CPdlG0b+HyqDOmOpqtnBTxE4EJ2jgiSPMwHRN2Ks2T1tkgBuWCugyHuoPR1D?=
 =?us-ascii?Q?qEgsROx6eyf4r4zVdBl/ySVIuUts4EUt23paT3YiV2Af2qnQI5T9b3sL4LMR?=
 =?us-ascii?Q?7C84QRiHK46smv/q8AXPlw+hYJ/61P48tYQa0cXEu+roHvop+YCaoS6pdXCs?=
 =?us-ascii?Q?zSPPHBD2righxa/c62l65ca7rxC5td1h0u/LKzjq3yDUAPOD5JSX2yX+Y4h4?=
 =?us-ascii?Q?h6z62jWqo0r/vtAkwFfGqhPyWMQTkg1N/zfF+IFYJkzUiS55e/sjPL3S4jl1?=
 =?us-ascii?Q?uMTn8RJLE5NxPWBMgLz1FbPMnpyCQVjrCjzzF5Hqq77A4reGOVN0b7UK+P3a?=
 =?us-ascii?Q?hv/Z3UEq0FnVo3WUE6kjnDRWtNiruYiP5LvLtrn6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0fbe81-78f1-49a2-7e08-08db1d406eda
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2023 06:11:18.1419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLnkGBLsemCw8DmeawI+7Jt5sUxlWwR5MWxUqeD9dn+B6Lh6K4KuC24Yis1hv9hrp4pmBxndFFiBxwIaLB31hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7032
X-Proofpoint-GUID: epGYhqAiRItrAwFy29eOtctRNNCAsCk0
X-Proofpoint-ORIG-GUID: epGYhqAiRItrAwFy29eOtctRNNCAsCk0
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101381

Removed version 2.8.5, as the 2.8 series is no longer maintained since
2020.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...tue-functions-for-strndupa-rawmemchr.patch | 133 ------------------
 ...retation-dependent-on-the-ipx-header.patch |  65 ---------
 ...-Fixed-swig-host-contamination-issue.patch |  62 --------
 ...ns-need-to-be-external-when-building.patch |  30 ----
 meta-oe/recipes-security/audit/audit_2.8.5.bb | 115 ---------------
 5 files changed, 405 deletions(-)
 delete mode 100644 meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
 delete mode 100644 meta-oe/recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch
 delete mode 100644 meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
 delete mode 100644 meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
 delete mode 100644 meta-oe/recipes-security/audit/audit_2.8.5.bb

diff --git a/meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch b/meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
deleted file mode 100644
index ed1c0e2b5..000000000
--- a/meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From d5a4b800a696b8b8d2c0f0bad098b1a8ff94333f Mon Sep 17 00:00:00 2001
-From: Steve Grubb <sgrubb@redhat.com>
-Date: Tue, 26 Feb 2019 18:33:33 -0500
-Subject: [PATCH] Add substitue functions for strndupa & rawmemchr
-
-Upstream-Status: Backport
-[https://github.com/linux-audit/audit-userspace/commit/d579a08bb1cde71f939c13ac6b2261052ae9f77e]
----
- auparse/auparse.c   | 12 +++++++++++-
- auparse/interpret.c |  9 ++++++++-
- configure.ac        | 14 +++++++++++++-
- src/ausearch-lol.c  | 12 +++++++++++-
- 4 files changed, 43 insertions(+), 4 deletions(-)
-
-diff --git a/auparse/auparse.c b/auparse/auparse.c
-index 650db02..2e1c737 100644
---- a/auparse/auparse.c
-+++ b/auparse/auparse.c
-@@ -1,5 +1,5 @@
- /* auparse.c --
-- * Copyright 2006-08,2012-17 Red Hat Inc., Durham, North Carolina.
-+ * Copyright 2006-08,2012-19 Red Hat Inc., Durham, North Carolina.
-  * All Rights Reserved.
-  *
-  * This library is free software; you can redistribute it and/or
-@@ -1118,6 +1118,16 @@ static int str2event(char *s, au_event_t *e)
- 	return 0;
- }
- 
-+#ifndef HAVE_STRNDUPA
-+static inline char *strndupa(const char *old, size_t n)
-+{
-+	size_t len = strnlen(old, n);
-+	char *tmp = alloca(len + 1);
-+	tmp[len] = 0;
-+	return memcpy(tmp, old, len);
-+}
-+#endif
-+
- /* Returns 0 on success and 1 on error */
- static int extract_timestamp(const char *b, au_event_t *e)
- {
-diff --git a/auparse/interpret.c b/auparse/interpret.c
-index 51c4a5e..67b7b77 100644
---- a/auparse/interpret.c
-+++ b/auparse/interpret.c
-@@ -853,6 +853,13 @@ err_out:
- 		return print_escaped(id->val);
- }
- 
-+// rawmemchr is faster. Let's use it if we have it.
-+#ifdef HAVE_RAWMEMCHR
-+#define STRCHR rawmemchr
-+#else
-+#define STRCHR strchr
-+#endif
-+
- static const char *print_proctitle(const char *val)
- {
- 	char *out = (char *)print_escaped(val);
-@@ -863,7 +870,7 @@ static const char *print_proctitle(const char *val)
- 		// Proctitle has arguments separated by NUL bytes
- 		// We need to write over the NUL bytes with a space
- 		// so that we can see the arguments
--		while ((ptr  = rawmemchr(ptr, '\0'))) {
-+		while ((ptr  = STRCHR(ptr, '\0'))) {
- 			if (ptr >= end)
- 				break;
- 			*ptr = ' ';
-diff --git a/configure.ac b/configure.ac
-index 6e345f1..6f3007e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,7 +1,7 @@
- dnl
- define([AC_INIT_NOTICE],
- [### Generated automatically using autoconf version] AC_ACVERSION [
--### Copyright 2005-18 Steve Grubb <sgrubb@redhat.com>
-+### Copyright 2005-19 Steve Grubb <sgrubb@redhat.com>
- ###
- ### Permission is hereby granted, free of charge, to any person obtaining a
- ### copy of this software and associated documentation files (the "Software"),
-@@ -72,6 +72,18 @@ dnl; posix_fallocate is used in audisp-remote
- AC_CHECK_FUNCS([posix_fallocate])
- dnl; signalfd is needed for libev
- AC_CHECK_FUNC([signalfd], [], [ AC_MSG_ERROR([The signalfd system call is necessary for auditd]) ])
-+dnl; check if rawmemchr is available
-+AC_CHECK_FUNCS([rawmemchr])
-+dnl; check if strndupa is available
-+AC_LINK_IFELSE(
-+  [AC_LANG_SOURCE(
-+    [[
-+      #define _GNU_SOURCE
-+      #include <string.h>
-+      int main() { (void) strndupa("test", 10); return 0; }]])],
-+ [AC_DEFINE(HAVE_STRNDUPA, 1, [Let us know if we have it or not])],
-+ []
-+)
- 
- ALLWARNS=""
- ALLDEBUG="-g"
-diff --git a/src/ausearch-lol.c b/src/ausearch-lol.c
-index 5d17a72..758c33e 100644
---- a/src/ausearch-lol.c
-+++ b/src/ausearch-lol.c
-@@ -1,6 +1,6 @@
- /*
- * ausearch-lol.c - linked list of linked lists library
--* Copyright (c) 2008,2010,2014,2016 Red Hat Inc., Durham, North Carolina.
-+* Copyright (c) 2008,2010,2014,2016,2019 Red Hat Inc., Durham, North Carolina.
- * All Rights Reserved. 
- *
- * This software may be freely redistributed and/or modified under the
-@@ -152,6 +152,16 @@ static int compare_event_time(event *e1, event *e2)
- 	return 0;
- }
- 
-+#ifndef HAVE_STRNDUPA
-+static inline char *strndupa(const char *old, size_t n)
-+{
-+	size_t len = strnlen(old, n);
-+	char *tmp = alloca(len + 1);
-+	tmp[len] = 0;
-+	return memcpy(tmp, old, len);
-+}
-+#endif
-+
- /*
-  * This function will look at the line and pick out pieces of it.
-  */
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch b/meta-oe/recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch
deleted file mode 100644
index 054f50ab2..000000000
--- a/meta-oe/recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 6b09724c69d91668418ddb3af00da6db6755208c Mon Sep 17 00:00:00 2001
-From: Steve Grubb <sgrubb@redhat.com>
-Date: Thu, 2 Sep 2021 15:01:12 -0400
-Subject: [PATCH] Make IPX packet interpretation dependent on the ipx header
- file existing
-
-Upstream-Status: Backport [https://github.com/linux-audit/audit-userspace/commit/6b09724c69d91668418ddb3af00da6db6755208c.patch]
-Comment: Remove one hunk from changelog file and refresh rest hunks as per codebase of audit_2.8.5
-Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
----
- auparse/interpret.c | 8 ++++++--
- configure.ac        | 6 ++++++
- 2 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/auparse/interpret.c b/auparse/interpret.c
-index 63829aa0e..6c316456d 100644
---- a/auparse/interpret.c	2022-10-14 11:22:20.833880000 +0200
-+++ b/auparse/interpret.c	2022-10-14 11:35:13.196455950 +0200
-@@ -44,8 +44,10 @@
- #include <linux/ax25.h>
- #include <linux/atm.h>
- #include <linux/x25.h>
--#include <linux/if.h>   // FIXME: remove when ipx.h is fixed
--#include <linux/ipx.h>
-+#ifdef HAVE_IPX_HEADERS
-+  #include <linux/if.h>   // FIXME: remove when ipx.h is fixed
-+  #include <linux/ipx.h>
-+#endif
- #include <linux/capability.h>
- #include <sys/personality.h>
- #include <sys/prctl.h>
-@@ -1158,6 +1160,7 @@
- 					      x->sax25_call.ax25_call[6]);
-                         }
-                         break;
-+#ifdef HAVE_IPX_HEADERS
-                 case AF_IPX:
-                         {
-                                 const struct sockaddr_ipx *ip =
-@@ -1167,6 +1170,7 @@
- 					str, ip->sipx_port, ip->sipx_network);
-                         }
-                         break;
-+#endif
-                 case AF_ATMPVC:
-                         {
-                                 const struct sockaddr_atmpvc* at =
-diff --git a/configure.ac b/configure.ac
-index 8f541e4c0..005eb0b5b 100644
---- a/configure.ac	2022-10-14 11:22:20.833880000 +0200
-+++ b/configure.ac	2022-10-14 11:36:32.391044084 +0200
-@@ -414,6 +414,12 @@
- 	AC_DEFINE_UNQUOTED(HAVE_LIBWRAP, [], Define if tcp_wrappers support is enabled )
- fi
- 
-+# linux/ipx.h - deprecated in 2018
-+AC_CHECK_HEADER(linux/ipx.h, ipx_headers=yes, ipx_headers=no)
-+if test $ipx_headers = yes ; then
-+	AC_DEFINE(HAVE_IPX_HEADERS,1,[IPX packet interpretation])
-+fi
-+
- # See if we want to support lower capabilities for plugins
- LIBCAP_NG_PATH
- 
-
diff --git a/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
deleted file mode 100644
index 39a090c83..000000000
--- a/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 3467abce1f3cfc96f9bdace7c09d95218cbcaeb1 Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Sun, 19 Jul 2015 02:42:58 +0900
-Subject: [PATCH] audit: Fixed swig host contamination issue
-
-The audit build uses swig to generate a python wrapper.
-Unfortunately, the swig info file references host include
-directories.  Some of these were previously noticed and
-eliminated, but the one fixed here was not.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Anders Hedlund <anders.hedlund@windriver.com>
-Signed-off-by: Joe Slater <jslater@windriver.com>
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
-Comment: Refresh hunk from auditswig.i to fix build with linux 5.17+
-Reference-Commit: ee3c680c3 audit: Upgrade to 3.0.8 and fix build with linux 5.17+
-Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
-Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
----
- bindings/swig/python3/Makefile.am | 3 ++-
- bindings/swig/src/auditswig.i     | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Makefile.am
-index 9938418..fa46aac 100644
---- a/bindings/swig/python3/Makefile.am
-+++ b/bindings/swig/python3/Makefile.am
-@@ -22,6 +22,7 @@
- CONFIG_CLEAN_FILES = *.loT *.rej *.orig
- AM_CFLAGS = -fPIC -DPIC -fno-strict-aliasing $(PYTHON3_CFLAGS)
- AM_CPPFLAGS = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
-+STDINC ?= /usr/include
- LIBS = $(top_builddir)/lib/libaudit.la
- SWIG_FLAGS = -python -py3 -modern
- SWIG_INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
-@@ -37,7 +38,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/libaudit.h ${top_builddir}/lib/libaudi
- _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la
- nodist__audit_la_SOURCES  = audit_wrap.c
- audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i 
--	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/auditswig.i 
-+	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} -I$(STDINC) ${srcdir}/../src/auditswig.i
- 
- CLEANFILES = audit.py* audit_wrap.c *~
- 
-diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
-index 7ebb373..424fb68 100644
---- a/bindings/swig/src/auditswig.i
-+++ b/bindings/swig/src/auditswig.i
-@@ -39,7 +39,7 @@
- #define __attribute(X) /*nothing*/
- typedef unsigned __u32;
- typedef unsigned uid_t;
--%include "/usr/include/linux/audit.h"
-+%include "../lib/audit.h"
- #define __extension__ /*nothing*/
- #include <stdint.h>
- %include "../lib/libaudit.h"
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch b/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
deleted file mode 100644
index f209e560b..000000000
--- a/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2938f46d318df4a09565db837b60bafd0300f858 Mon Sep 17 00:00:00 2001
-From: Steve Grubb <sgrubb@redhat.com>
-Date: Fri, 10 Jan 2020 21:13:50 -0500
-Subject: [PATCH] Header definitions need to be external when building with
- -fno-common (which is default in GCC 10) - Tony Jones
-
-Upstream-Status: Backport
-[https://github.com/linux-audit/audit-userspace/commit/017e6c6ab95df55f34e339d2139def83e5dada1f]
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- src/ausearch-common.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/ausearch-common.h b/src/ausearch-common.h
-index 6669203..3040547 100644
---- a/src/ausearch-common.h
-+++ b/src/ausearch-common.h
-@@ -50,7 +50,7 @@ extern pid_t event_pid;
- extern int event_exact_match;
- extern uid_t event_uid, event_euid, event_loginuid;
- extern const char *event_tuid, *event_teuid, *event_tauid;
--slist *event_node_list;
-+extern slist *event_node_list;
- extern const char *event_comm;
- extern const char *event_filename;
- extern const char *event_hostname;
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-security/audit/audit_2.8.5.bb b/meta-oe/recipes-security/audit/audit_2.8.5.bb
deleted file mode 100644
index f846b27f9..000000000
--- a/meta-oe/recipes-security/audit/audit_2.8.5.bb
+++ /dev/null
@@ -1,115 +0,0 @@
-SUMMARY = "User space tools for kernel auditing"
-DESCRIPTION = "The audit package contains the user space utilities for \
-storing and searching the audit records generated by the audit subsystem \
-in the Linux kernel."
-HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
-SECTION = "base"
-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=2.8_maintenance;protocol=https \
-           file://0001-Add-substitue-functions-for-strndupa-rawmemchr.patch \
-           file://0002-Fixed-swig-host-contamination-issue.patch \
-           file://0003-Header-definitions-need-to-be-external-when-building.patch \
-           file://auditd \
-           file://auditd.service \
-           file://audit-volatile.conf \
-           file://0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch \
-"
-
-S = "${WORKDIR}/git"
-SRCREV = "5fae55c1ad15b3cefe6890eba7311af163e9133c"
-
-inherit autotools python3native update-rc.d systemd
-
-UPDATERCPN = "auditd"
-INITSCRIPT_NAME = "auditd"
-INITSCRIPT_PARAMS = "defaults"
-
-SYSTEMD_PACKAGES = "auditd"
-SYSTEMD_SERVICE:auditd = "auditd.service"
-
-DEPENDS = "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native"
-
-EXTRA_OECONF = "--without-prelude \
-        --with-libwrap \
-        --enable-gssapi-krb5=no \
-        --with-libcap-ng=yes \
-        --with-python3=yes \
-        --libdir=${base_libdir} \
-        --sbindir=${base_sbindir} \
-        --without-python \
-        --without-golang \
-        --disable-zos-remote \
-        --with-arm=yes \
-        --with-aarch64=yes \
-        "
-
-EXTRA_OEMAKE = "PYLIBVER='python${PYTHON_BASEVERSION}' \
-	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
-	pyexecdir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
-	STDINC='${STAGING_INCDIR}' \
-	pkgconfigdir=${libdir}/pkgconfig \
-	"
-
-SUMMARY:audispd-plugins = "Plugins for the audit event dispatcher"
-DESCRIPTION:audispd-plugins = "The audispd-plugins package provides plugins for the real-time \
-interface to the audit system, audispd. These plugins can do things \
-like relay events to remote machines or analyze events for suspicious \
-behavior."
-
-PACKAGES =+ "audispd-plugins"
-PACKAGES += "auditd ${PN}-python"
-
-FILES:${PN} = "${sysconfdir}/libaudit.conf ${base_libdir}/libaudit.so.1* ${base_libdir}/libauparse.so.*"
-FILES:auditd = "${bindir}/* ${base_sbindir}/* ${sysconfdir}/*"
-FILES:audispd-plugins = "${sysconfdir}/audisp/audisp-remote.conf \
-	${sysconfdir}/audisp/plugins.d/au-remote.conf \
-	${base_sbindir}/audisp-remote ${localstatedir}/spool/audit \
-	"
-FILES:${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
-FILES:${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
-
-CONFFILES:auditd = "${sysconfdir}/audit/audit.rules"
-RDEPENDS:auditd = "bash"
-
-do_configure:prepend() {
-        sed -e 's|buf\[];|buf[0];|g'  ${STAGING_INCDIR}/linux/audit.h > ${S}/lib/audit.h
-        sed -i -e 's|#include <linux/audit.h>|#include "audit.h"|g' ${S}/lib/libaudit.h
-}
-
-do_install:append() {
-	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
-	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la
-
-	# reuse auditd config
-	[ ! -e ${D}/etc/default ] && mkdir ${D}/etc/default
-	mv ${D}/etc/sysconfig/auditd ${D}/etc/default
-	rmdir ${D}/etc/sysconfig/
-
-	# replace init.d
-	install -D -m 0755 ${WORKDIR}/auditd ${D}/etc/init.d/auditd
-	rm -rf ${D}/etc/rc.d
-
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		# install systemd unit files
-		install -d ${D}${systemd_unitdir}/system
-		install -m 0644 ${WORKDIR}/auditd.service ${D}${systemd_unitdir}/system
-
-		install -d ${D}${sysconfdir}/tmpfiles.d/
-		install -m 0644 ${WORKDIR}/audit-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
-	fi
-
-	# audit-2.5 doesn't install any rules by default, so we do that here
-	mkdir -p ${D}/etc/audit ${D}/etc/audit/rules.d
-	cp ${S}/rules/10-base-config.rules ${D}/etc/audit/rules.d/audit.rules
-
-	chmod 750 ${D}/etc/audit ${D}/etc/audit/rules.d
-	chmod 640 ${D}/etc/audit/auditd.conf ${D}/etc/audit/rules.d/audit.rules
-
-	# Based on the audit.spec "Copy default rules into place on new installation"
-	cp ${D}/etc/audit/rules.d/audit.rules ${D}/etc/audit/audit.rules
-
-	# Create /var/spool/audit directory for audisp-remote
-	install -m 0700 -d ${D}${localstatedir}/spool/audit
-}
-- 
2.25.1


