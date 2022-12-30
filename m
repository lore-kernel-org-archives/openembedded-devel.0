Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E94C4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 01:46:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9743.1672364786369563485
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Dec 2022 17:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jPQjsKp1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03637da610=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BU1T2ag024982
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 01:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=1lNj9KxU66vNo/45j1f3xpjoGxP5CfVbV43hM0KMvhw=;
 b=jPQjsKp1wVx3lhuumcuiispifovm9nswItq6ABSiPjhb9yMxWXY4AMd1EVr7QVOVlu7I
 BBUbPkfhHDT7tYVG8d+T8XP7r7liIG3aE7lRx7AdabvHD8B6KBFXjTM1gSyJtER3rjb/
 F61yV5n4JjZUByS8daB2K2dhkMQyR8TGOl9evkMrpmi5nUdNJcYh+NRfbV9tIx0oh4Cw
 JvJsEIZuykQUQETknA3sA8MVAB/8pKEbqED40IJMdV4rZ9jBSXAWhlW9CjceXhZj/Acg
 /EJtYwwEPIPy3nIuAJj/NC6C43iwBm3i0tBE6hW8FKovWZIe2uq/xpR3aA49UpOdkacL rg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda3bep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 01:46:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTym4PJeY1xTDY81bQf0p/0cAxXI8ZROBNxQoWRjQSvPK4utk+db/u6D7ZuMnISP7rOQszD7fKM/cPZ+oa6d7CQOO6oGGSHPy48p71q3Ixqk9VDOQw3l4HT0OnvvswP0Px4KceTTSdmdoUAXDmPbKZfYHbql19UATUMbkj2GNkev6bFYkQ57RsxtRzamhBv3ztQU4j9EdQfU8xzr62BF4doxZrUclK7ZG4qQducfInCngp5AlKiAU5G7KYLf03/1F9uPIiFdKccXhNvU2kcxwUt+U8joYvBJ7cdkAQn8GblFiT7k3Smh72ZZi+8SiHEr8Oc3G40skdWCyTW+CN34VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lNj9KxU66vNo/45j1f3xpjoGxP5CfVbV43hM0KMvhw=;
 b=fmx+RBaERZxT+lX9amauILJtdfI8xyXprv8ZrRn3Jbyt7RkMQrBc+mGPQE3d5SM8SX44o9nw+tU5bpctU48kN7vCOzB99QHZKmLwpe2d3zziu3vnCb5MBp0/u+299KYP3lLyPp5Y0pCOSeUZ5byb09oH7Bt1WGdjeZqItXVZpQdK0SCqHIR8U3FRGU3g4F1LpAPM4JJizhHsWh4oUZW4AxsKQVC9x2U2jV5Puix8R2IU4Le0uLfZmdoB5jycIM9YoYa9d3JATcISbJNWnOikvJgvnCD8+v5QHy02P3KhWj00JxSnUkZ7X0E5Q3jDK5cQQ2v6R8Pa8GIMzSDbYGAIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA1PR11MB7063.namprd11.prod.outlook.com (2603:10b6:806:2b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Fri, 30 Dec
 2022 01:46:16 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f%5]) with mapi id 15.20.5944.018; Fri, 30 Dec 2022
 01:46:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] krb5: upgrade 1.17.2 -> 1.20.1
Date: Fri, 30 Dec 2022 09:46:07 +0800
Message-Id: <20221230014607.703918-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA1PR11MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: bf2189c7-cc28-4689-2333-08daea07a3ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J6c0jiAx0t40mMbdBYeQlv1Dw9ql3c/05zjjmtbjIyVinEnZoGq2jjcKhmp+GWbhSULrazH0mJ62StW9qfnvvl1DijPrlNLOd4fWyYjJihXYNv4x6BSp/VF1j1aYveFgx9BqXBrz9o+wDvxFrEB36NMFkEj5EqUmbj6/n2jo5gxzayiE4R5HFxc4aW+gRKil7f+rXC2NPiqxD714OGEOjwAAesfsmsMJGZYr8lo+krEQ3P21rgKoqEFeVcBNNebVxXt9XVbzvVNqgYL1dO9nDPoWhGhkGJyvepyxScA47B2lnUWMSc1qyWUX3Dfb4zz107h1cOrbokEuephFJ3uzH22i+wiXl2v+8YAPVDixE9b9oMYFtdjehvgeGX9ieqxlEsjM/F9aGvH62uigqhgtRk4xu190XPNivL7RZjz0fwEEf9cUlRU/c6A8X3hcq0Sa5SCldh3tCN/ZfBXtvgl2ZcGZGeH65iUNssBV/cqv5EwIG1mIJcvA05CUJB70+b8oDnFIamZ6AnYxCtO22fVDvQVPPLxEKwLW4Qk84IAudwIJBJCEl1eRWIxTcFdgzqtOqb7oCox1X69uyqmFIkPwconX0mVhGKypyz/cnkeWMaftgxfF6M3ZhFzT9aU/4HO/lCOMD4O4L4KO8bdWxDvwUvFfC/L+Z5nN0gR9rWYCeakoBB768ltVMBaG3ZD+6QzCP/FRUQeZM/nvbIs6XPEaWGkj93qYFnFKhilJMXBDOTkF4CoJ9jl5Jsuaq8Z5xa0jvB2InshFWI/NvndsVNNrxA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39840400004)(346002)(136003)(376002)(451199015)(86362001)(478600001)(36756003)(6916009)(8936002)(316002)(52116002)(6486002)(966005)(186003)(38350700002)(2906002)(44832011)(8676002)(66946007)(66556008)(30864003)(41300700001)(83380400001)(5660300002)(1076003)(38100700002)(2616005)(66476007)(26005)(6512007)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TsXaf8XyfjuIr6SCM5FEX3foFMdqjmZSo9/bVUVanvQbXEgDizP8X2oS/MfZ?=
 =?us-ascii?Q?qUuyKU5EWgCEqhaQ2lvJgCkXGAjYavXNtdxP28/osEJtnCGCO95I4gL0aXQp?=
 =?us-ascii?Q?55fnN3ow3AtfBgFymzZ6Q89W09VMwx46GOlBgtvZQdUZ6/eDZ/XQSAA651AO?=
 =?us-ascii?Q?dv4ieYwLzUt1m/5Y+eK9kWGsPUbKKlO0bHy456Q+a9wk+C0ZAu0Fr9PSeLXd?=
 =?us-ascii?Q?I4nwbMQocohIieIRJk04iAO1akysaLEsnIInw0JY56pjE/MV1D6x4aV0uZ1+?=
 =?us-ascii?Q?U0ZvrLdIYCb2g0GPS5sHYVIHZ8AvNxkZBpFcuME7GkmEAhkrKtSjqSfVu1/6?=
 =?us-ascii?Q?uPZeWsvULFMjv6gqXGOoiAUz9MRix0VlcU9d/ExnI9rNHq9jVSg6blKmV6Do?=
 =?us-ascii?Q?CRBlKhiZwHWmuQaGDvMKepsvK0yhXaI35Asxgy9Ip97KbF8pppDG5nJiCppJ?=
 =?us-ascii?Q?xuwk0V94AnpHtnEbVn7t/b6j3w82rywOsEy04KhdoRxpNDt6tTyPOH2biSS2?=
 =?us-ascii?Q?06FGou1UPX0iVKInF7c4lZ4c1ls6SC87JaF9LDxupr3MhiIvUDXcVE9zl69t?=
 =?us-ascii?Q?h17cKM8mSkNKRPvuOMx+PvEwxkZ6fJkUB9ZtSDF1If5yyR0ENG1M1THQbS/Y?=
 =?us-ascii?Q?6hVmqGayIxJxINGvWOS2I996DOD1cJdcTv6jhsaoPfOPIiuF4ZhSc6WA54w+?=
 =?us-ascii?Q?vRjZNX9f47Ec3EvOfavAj1hB7/UfLgeYaDNihpBs2hwm7usidU8vvptqKJq/?=
 =?us-ascii?Q?eMegFnXKtQ5MwYT8WogDieABM00rIDJZ36UouDwjKChLafM4E3xIysAPNScq?=
 =?us-ascii?Q?8dJIDSNhwLQc64OJFVJPB3TX+tYK32NNpkI889jGw8uyCk7MArU0yAe4WUkm?=
 =?us-ascii?Q?MU8B53XHDLClEoowJuwzsVtiv27qCZxP5K1KGG4jbjCfWYxJqsbRBlv+ELBp?=
 =?us-ascii?Q?ivDGeeRP+XCRwFMRCcuW0wqFTXt9at1Ui09sxI//rmSA6sxx1yfPW6sYgBDX?=
 =?us-ascii?Q?ZjdwXcXT/gF6pEkaHJPR7Q0GdBkE3QEW6+WTcrk+qa5ax3owG6HLCK3OqvnD?=
 =?us-ascii?Q?MHW13Zs5dzAWWpoetLoXliOVoTr+KAqMK+pwXHAFquwd/ERx2YQPmOtLaFUU?=
 =?us-ascii?Q?3mH/tz0ba4U4a7itHt48DmWbkj6HNgo3qeETQ0lVVL7CfOC5M+RqFbEMZ9ce?=
 =?us-ascii?Q?ZJj5xYhkX6mdYjLoDC/I84hKGCnoZmZg0Kbs4wrodPxeMMNIUJUoDhwZbGIh?=
 =?us-ascii?Q?uW7IbC83tOj7y+44BYo0Iwpp5od3Fp1PiSLEh9romkxKB3KNcntkCdv1g92h?=
 =?us-ascii?Q?GCPwKl6Wcifd+Z2XVW3qhil2iV4UjHg6PDgY3C8o9fpvZ2SyhnUHVB5UAHYn?=
 =?us-ascii?Q?n3hW3tEZJiGi+/GtFjwyYVSLET1bLsK3l3aXGXCXy4coeKb0kq65NDQ8IKy2?=
 =?us-ascii?Q?93IpzN5ucBReuec3pur0cokv1dj2Fvv54oOKbIveaLtyjqCW/5NQnI6wTo7Z?=
 =?us-ascii?Q?v68gs2TF9FK+nrLQBoIU8y9vcKV2VazwyMTufJXwE3g0maVvwWaUCq+fB4Qj?=
 =?us-ascii?Q?686R2RVwxx8QruPO/zUi2Ub3vBaeLQHHUAMSu+Jr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2189c7-cc28-4689-2333-08daea07a3ce
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 01:46:16.3049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HveYz1AHPgSk8S1M3gEcmYqyVvSu6ekP3pwkPKYHl9O/fx5qwtbAquHN+F0G1a0Bk9LqLTIVzfagxrIKGE7IGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7063
X-Proofpoint-ORIG-GUID: bAyKbOuI0uaH_RS9EVEZjre4SVH55EsY
X-Proofpoint-GUID: bAyKbOuI0uaH_RS9EVEZjre4SVH55EsY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-30_01,2022-12-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212300014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 01:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100305

Release Notes:
https://web.mit.edu/kerberos/krb5-1.20/krb5-1.20.1.html

License-Update: Update AES algorithm copyright [1]
                Update copyright years [2]

[1] https://github.com/krb5/krb5/commit/cb5f190056ef4d123c5fe5d4923982b830288438
[2] https://github.com/krb5/krb5/commit/f1535bf6b47e8dc03d69fcfb98e798546ff7c272

* Update PACKAGECONFIG[keyutils] and drop the local patch.
* Drop backport CVE patches.
* Inherit pkgconfig bbclass to find com_err library correctly.
* Drop --without-tcl option as it has been removed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ameter-to-disable-keyutils-detection.patch |  32 -----
 .../krb5/krb5/CVE-2021-36222.patch            | 121 ------------------
 .../krb5/krb5/CVE-2021-37750.patch            |  53 --------
 .../krb5/{krb5_1.17.2.bb => krb5_1.20.1.bb}   |  19 ++-
 4 files changed, 9 insertions(+), 216 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
 delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
 delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.17.2.bb => krb5_1.20.1.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
deleted file mode 100644
index cbd5d71fd..000000000
--- a/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a9e4057bfda190ad365b503af058b460ab8c7616 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 1 Oct 2013 22:22:57 +0200
-Subject: [PATCH] aclocal: Add parameter to disable keyutils detection
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
- aclocal.m4 | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index d6d1279..80ce604 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -1679,12 +1679,16 @@ fi
- dnl
- dnl If libkeyutils exists (on Linux) include it and use keyring ccache
- AC_DEFUN(KRB5_AC_KEYRING_CCACHE,[
-+AC_ARG_ENABLE([keyutils],
-+AC_HELP_STRING([--disable-keyutils],don't enable using keyutils for keyring ccache @<:@enabled@:>@), , enable_keyutils=yes)
-+if test "$enable_keyutils" = yes; then
-   AC_CHECK_HEADERS([keyutils.h],
-     AC_CHECK_LIB(keyutils, add_key, 
-       [dnl Pre-reqs were found
-        AC_DEFINE(USE_KEYRING_CCACHE, 1, [Define if the keyring ccache should be enabled])
-        LIBS="-lkeyutils $LIBS"
-       ]))
-+fi
- ])dnl
- dnl
- dnl If libkeyutils supports persistent keyrings, use them
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
deleted file mode 100644
index fee6e64c1..000000000
--- a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From fc98f520caefff2e5ee9a0026fdf5109944b3562 Mon Sep 17 00:00:00 2001
-From: Joseph Sutton <josephsutton@catalyst.net.nz>
-Date: Wed, 7 Jul 2021 11:47:44 +1200
-Subject: [PATCH] Fix KDC null deref on bad encrypted challenge
-
-The function ec_verify() in src/kdc/kdc_preauth_ec.c contains a check
-to avoid further processing if the armor key is NULL.  However, this
-check is bypassed by a call to k5memdup0() which overwrites retval
-with 0 if the allocation succeeds.  If the armor key is NULL, a call
-to krb5_c_fx_cf2_simple() will then dereference it, resulting in a
-crash.  Add a check before the k5memdup0() call to avoid overwriting
-retval.
-
-CVE-2021-36222:
-
-In MIT krb5 releases 1.16 and later, an unauthenticated attacker can
-cause a null dereference in the KDC by sending a request containing a
-PA-ENCRYPTED-CHALLENGE padata element without using FAST.
-
-[ghudson@mit.edu: trimmed patch; added test case; edited commit
-message]
-
-ticket: 9007 (new)
-tags: pullup
-target_version: 1.19-next
-target_version: 1.18-next
-
-CVE: CVE-2021-36222
-
-Upstream-Status: Backport
-[https://github.com/krb5/krb5/commit/fc98f520caefff2e5ee9a0026fdf5109944b3562]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/kdc/kdc_preauth_ec.c      |  3 ++-
- src/tests/Makefile.in         |  1 +
- src/tests/t_cve-2021-36222.py | 46 +++++++++++++++++++++++++++++++++++
- 3 files changed, 49 insertions(+), 1 deletion(-)
- create mode 100644 src/tests/t_cve-2021-36222.py
-
-diff --git a/src/kdc/kdc_preauth_ec.c b/src/kdc/kdc_preauth_ec.c
-index 7e636b3f9..43a9902cc 100644
---- a/src/kdc/kdc_preauth_ec.c
-+++ b/src/kdc/kdc_preauth_ec.c
-@@ -87,7 +87,8 @@ ec_verify(krb5_context context, krb5_data *req_pkt, krb5_kdc_req *request,
-     }
- 
-     /* Check for a configured FAST ec auth indicator. */
--    realmstr = k5memdup0(realm.data, realm.length, &retval);
-+    if (retval == 0)
-+        realmstr = k5memdup0(realm.data, realm.length, &retval);
-     if (realmstr != NULL)
-         retval = profile_get_string(context->profile, KRB5_CONF_REALMS,
-                                     realmstr,
-diff --git a/src/tests/Makefile.in b/src/tests/Makefile.in
-index fc6fcc0c3..1a1938306 100644
---- a/src/tests/Makefile.in
-+++ b/src/tests/Makefile.in
-@@ -166,6 +166,7 @@ check-pytests: unlockiter s4u2self
- 	$(RUNPYTEST) $(srcdir)/t_cve-2012-1015.py $(PYTESTFLAGS)
- 	$(RUNPYTEST) $(srcdir)/t_cve-2013-1416.py $(PYTESTFLAGS)
- 	$(RUNPYTEST) $(srcdir)/t_cve-2013-1417.py $(PYTESTFLAGS)
-+	$(RUNPYTEST) $(srcdir)/t_cve-2021-36222.py $(PYTESTFLAGS)
- 	$(RM) au.log
- 	$(RUNPYTEST) $(srcdir)/t_audit.py $(PYTESTFLAGS)
- 	$(RUNPYTEST) $(srcdir)/jsonwalker.py -d $(srcdir)/au_dict.json \
-diff --git a/src/tests/t_cve-2021-36222.py b/src/tests/t_cve-2021-36222.py
-new file mode 100644
-index 000000000..57e04993b
---- /dev/null
-+++ b/src/tests/t_cve-2021-36222.py
-@@ -0,0 +1,46 @@
-+import socket
-+from k5test import *
-+
-+realm = K5Realm()
-+
-+# CVE-2021-36222 KDC null dereference on encrypted challenge preauth
-+# without FAST
-+
-+s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
-+a = (hostname, realm.portbase)
-+
-+m = ('6A81A0' '30819D'          # [APPLICATION 10] SEQUENCE
-+     'A103' '0201' '05'         #  [1] pvno = 5
-+     'A203' '0201' '0A'         #  [2] msg-type = 10
-+     'A30E' '300C'              #  [3] padata = SEQUENCE OF
-+     '300A'                     #   SEQUENCE
-+     'A104' '0202' '008A'       #    [1] padata-type = PA-ENCRYPTED-CHALLENGE
-+     'A202' '0400'              #    [2] padata-value = ""
-+     'A48180' '307E'            #  [4] req-body = SEQUENCE
-+     'A007' '0305' '0000000000' #   [0] kdc-options = 0
-+     'A120' '301E'              #   [1] cname = SEQUENCE
-+     'A003' '0201' '01'         #    [0] name-type = NT-PRINCIPAL
-+     'A117' '3015'              #    [1] name-string = SEQUENCE-OF
-+     '1B06' '6B7262746774'      #     krbtgt
-+     '1B0B' '4B5242544553542E434F4D'
-+                                #     KRBTEST.COM
-+     'A20D' '1B0B' '4B5242544553542E434F4D'
-+                                #   [2] realm = KRBTEST.COM
-+     'A320' '301E'              #   [3] sname = SEQUENCE
-+     'A003' '0201' '01'         #    [0] name-type = NT-PRINCIPAL
-+     'A117' '3015'              #    [1] name-string = SEQUENCE-OF
-+     '1B06' '6B7262746774'      #     krbtgt
-+     '1B0B' '4B5242544553542E434F4D'
-+                                #     KRBTEST.COM
-+     'A511' '180F' '31393934303631303036303331375A'
-+                                #   [5] till = 19940610060317Z
-+     'A703' '0201' '00'         #   [7] nonce = 0
-+     'A808' '3006'              #   [8] etype = SEQUENCE OF
-+     '020112' '020111')         #    aes256-cts aes128-cts
-+
-+s.sendto(bytes.fromhex(m), a)
-+
-+# Make sure kinit still works.
-+realm.kinit(realm.user_princ, password('user'))
-+
-+success('CVE-2021-36222 regression test')
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch
deleted file mode 100644
index c67bca32e..000000000
--- a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From b3999be7ab59a5af4b2f1042ce0d6b03ecb17d4e Mon Sep 17 00:00:00 2001
-From: Greg Hudson <ghudson@mit.edu>
-Date: Tue, 3 Aug 2021 01:15:27 -0400
-Subject: [PATCH] Fix KDC null deref on TGS inner body null server
-
-After the KDC decodes a FAST inner body, it does not check for a null
-server.  Prior to commit 39548a5b17bbda9eeb63625a201cfd19b9de1c5b this
-would typically result in an error from krb5_unparse_name(), but with
-the addition of get_local_tgt() it results in a null dereference.  Add
-a null check.
-
-Reported by Joseph Sutton of Catalyst.
-
-CVE-2021-37750:
-
-In MIT krb5 releases 1.14 and later, an authenticated attacker can
-cause a null dereference in the KDC by sending a FAST TGS request with
-no server field.
-
-ticket: 9008 (new)
-tags: pullup
-target_version: 1.19-next
-target_version: 1.18-next
-
-CVE: CVE-2021-37750
-
-Upstream-Status: Backport
-[https://github.com/krb5/krb5/commit/d775c95af7606a51bf79547a94fa52ddd1cb7f49]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/kdc/do_tgs_req.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/kdc/do_tgs_req.c b/src/kdc/do_tgs_req.c
-index 587342a..622b48f 100644
---- a/src/kdc/do_tgs_req.c
-+++ b/src/kdc/do_tgs_req.c
-@@ -201,6 +201,11 @@ process_tgs_req(krb5_kdc_req *request, krb5_data *pkt,
-         status = "FIND_FAST";
-         goto cleanup;
-     }
-+    if (sprinc == NULL) {
-+        status = "NULL_SERVER";
-+        errcode = KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN;
-+        goto cleanup;
-+    }
- 
-     errcode = get_local_tgt(kdc_context, &sprinc->realm, header_server,
-                             &local_tgt, &local_tgt_storage);
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
index 6e0b2fdac..2221000e3 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
@@ -14,14 +14,12 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=dd4d0ad4c5e98abb58aa0d312f276791"
-DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native openssl"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=1d31018dba5a0ef195eb426a1e61f02e"
 
-inherit autotools-brokensep binconfig perlnative systemd update-rc.d
+inherit autotools-brokensep binconfig perlnative systemd update-rc.d pkgconfig
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
-           file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch \
            file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
            file://crosscompile_nm.patch \
            file://etc/init.d/krb5-kdc \
@@ -30,26 +28,26 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://etc/default/krb5-admin-server \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
-           file://CVE-2021-36222.patch;striplevel=2 \
-           file://CVE-2021-37750.patch;striplevel=2 \
 "
-SRC_URI[md5sum] = "aa4337fffa3b61f22dbd0167f708818f"
-SRC_URI[sha256sum] = "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134"
+SRC_URI[md5sum] = "73f5780e7b587ccd8b8cfc10c965a686"
+SRC_URI[sha256sum] = "704aed49b19eb5a7178b34b2873620ec299db08752d6a8574f95d41879ab8851"
 
 CVE_PRODUCT = "kerberos"
 CVE_VERSION = "5-${PV}"
 
 S = "${WORKDIR}/${BP}/src"
 
+DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native openssl"
+
 PACKAGECONFIG ??= "pkinit"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[openssl] = "--with-crypto-impl=openssl,,openssl"
-PACKAGECONFIG[keyutils] = "--enable-keyutils,--disable-keyutils,keyutils"
+PACKAGECONFIG[keyutils] = "--with-keyutils,--without-keyutils,keyutils"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[pkinit] = "--enable-pkinit, --disable-pkinit"
 
-EXTRA_OECONF += " --without-tcl --with-system-et --disable-rpath"
+EXTRA_OECONF += "--with-system-et --disable-rpath"
 CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
                   ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
                   ac_cv_file__etc_TIMEZONE=no"
@@ -85,6 +83,7 @@ do_install:append() {
 
         echo "RUN_KADMIND=true" >> ${D}/${sysconfdir}/default/krb5-admin-server
     fi
+
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d /run/krb5kdc - - - -" \
-- 
2.25.1


