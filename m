Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AE3C4332F
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 02:45:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7546.1637808309928916294
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rCFEM8Q2;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6963faa46c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AP2iirk012422
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=lkR/DM+i3LwXXCNozBgxOLWxUHgZwFEhs+JGuC0j5VE=;
 b=rCFEM8Q2+8gwCu8v04s1Md+Lw/wTRaSJgOEqLWXOJ4C4nOxWqaC9v0WE4LB67Ev5KyWl
 Zm68vrHZThSmgv5DQQ9gXpF3kygp24W0vihby8gHhG1LvfoEbrUPdLh7MX6Z8Edju0EH
 iVqVh+A9GUBRapvbnIZgC45utuvD7OH/4OMPtjddiJKhekP/WMsWpRmsdew20oiuxren
 X+G/U5k/Bq+fCltT4MaA97DHgKns8ruqi1XG2pZMf541uUvpHgFGj6IRE957eozhjp4N
 C1/8tw2Za94rBzgLx54iQS5fVdRvPX/fQvMK6oOhyZ+uwSAQO7JEklGG+Zyg/S9JZ/gH ew==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chbbv1094-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uo8h345Ye/QlFMDSRdtQSl8CiXBswZXTn5vgl3y/azOB7AkKUGUcMS2nLeH9XHStz3CmF9JUKGMaE1VHAh1mutcYLsxAkiTnyWf8w/u5SWtauTVKn0uheXzlfDZ6B3DMpVC3Vo41SGohtl9AJGTR1dsbPkYYiMW3mhLNsrMhWx6PtZg+lfu4BAiLL6mtnqnsTmp2q3wQeFVrJgM3WU5/4iejS6M7RSdP9wia5HADgQ4wjfS4cLT4cq4gM0oqZX0PjYc2pFF9QiDD8JR51H6ELww6+tvnfIW23nHIksq72U0VFbiismcjsmPgRxIE4ZhLmIKaM9SbfoKi2qbv+p/umg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkR/DM+i3LwXXCNozBgxOLWxUHgZwFEhs+JGuC0j5VE=;
 b=kNMOVv+92M5ZFkAo9srbMWaDIJMjFtT4oK/3B5pCghVRr+CDrstVUDb8hJHZmrbcc/E+RzXyW1Vuelludb8ABeC0nSGsjYfqNJbqJPIWywkXvRjSRD+ZMy/ZaV3v6Ka8DJSdfTEz2l36l4DqbgbMa+yQAqo3Mxse8b+jn9yeOiMCg7ar5ofzl8ggylb5gkBucTVy3YTFY1TjCubAD7tJgEucd1Jya9iCeZAn68qUoHX78Z6v0+9TnVOK5n9UjX5IRudGeB15R1Une6Ik8rsqLmIWRzIDjDezX5c9ZcefhdmgfL2vx2kebuKv86fUYYmsFWfWxcP15dhRtMPN8iYz+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2189.namprd11.prod.outlook.com (2603:10b6:301:51::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 25 Nov
 2021 02:45:05 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Thu, 25 Nov 2021
 02:45:05 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 5/7] samba: fix pyext_PATTERN for cross
 compilation
Date: Thu, 25 Nov 2021 10:44:48 +0800
Message-Id: <20211125024450.143364-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125024450.143364-1-yi.zhao@windriver.com>
References: <20211125024450.143364-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR04CA0062.apcprd04.prod.outlook.com (2603:1096:202:14::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 02:45:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62204f69-796c-4069-b8da-08d9afbd95e5
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2189:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB218984497C67ABCEA81CF723F9629@MWHPR1101MB2189.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jPS1YldQnnAprlOnbgmjQK8C9ElunSutTYZoJk6YsBAYW3R7a8KOpF2NgadFIh8O/nLQIFCdZzrcdIc94cSgw+MJHPDxrYsVM6JkG7/TBIdNkutegsaKyYjWzPzP8akrKWOMbPpc9OQ0JmfOKIJiV+3YMfuuW+c/AU3GMaX9KjvnQhFSMibp4jImUQj18yZI7088YRYQIDYCpYtCUuyqxgK1oXqitrG3lldhNMZZzd4ZEX/wZWtATWoXbZ9kFvuEthzVUYoBBe7sUTcJiOnDE4dYERJeDYNaKRx/5KVGN/baoN7i7LY+s6Jo/gow+uAIA5SXvmXsavFqrmIY0HsyShZKsmX9rB0YZXpH3kCjjD/Rfa0mdlv5JVu3cnfn0nVPa8zxXkbZEOHqIamGLJOw0J6BKR6fvuvvAEmdM0UYds9UQ7njzXMmZL3d9NonYJG66eIHKtaB71RLh+AA7aTEDUjJYVMiz8NzQtuheAZBgAPBmbMscHAuZ6Q3xSIVI1r4mH0z36a2iKFuUyrIUmI/6pHQK0foOEQvklwKR/JrBiBdA8JIWokUqN2FjguvIW9+iPwbnGRuLlI0C19mb5teMWvHiz0Eczt4LdukKSOpLqSI65HT2WSGnCS13DSPNqm129XJyjalsi30TjhsoxKycR0Dd09Y5bpMcoE4FLAQqHXE+8wI4SbjjHubWxZkoleO+Qs+sr4dxjP3sHjBZCUwcw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(316002)(38350700002)(66476007)(8936002)(66556008)(38100700002)(52116002)(2616005)(1076003)(6506007)(186003)(66946007)(44832011)(508600001)(6916009)(2906002)(6486002)(36756003)(8676002)(5660300002)(26005)(83380400001)(6512007)(6666004)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pqrlc16/p22725gt5YalJSapJ80GlTqSBRVDz443g2vS00BdZvX0dvx29R57?=
 =?us-ascii?Q?hppRtYdtNPZMdqVnxq2yUCEqRN8Iw7QYWAcLsIgCd5oLW+BxUq/0sQhJPxT5?=
 =?us-ascii?Q?NZt3kGIkQ4nuyVwwlBZ79+C4GeATsITqVYnJvcEXHWwsNjimKI6T6PB+gtTG?=
 =?us-ascii?Q?7pN8wUGf1c3gC/wCBqtwQfwlEMjhpr8Vl77TMAsKcsvCGI6IM6OfCknSL7Iv?=
 =?us-ascii?Q?a4I/9wIcAyirooBqvkOqyQD35wvgTNWnRKwltLt9yAxUE3niVw5uEBWi8A2Z?=
 =?us-ascii?Q?13+/qF+QAGeVu7gGbrqeM+5FhTVHo6dbJEG8yyN8nWgvlLbdib3TqOscs2c9?=
 =?us-ascii?Q?p4eXCxHev9i3gH2273gvFZeub9Dh0Um81DwgBq8+F4BMlbN8xw47pChgK7P9?=
 =?us-ascii?Q?upx3cAI2sDwO8fTQDrJxRago7VvqrtOh4ZjQKb31dEw9RRmQAvwo166eUJIt?=
 =?us-ascii?Q?PDDhl5XHkhdG0HIFfidMPs6XTzX0fN+t7lJy6hTXx9yjEMglSq23W8zPJiVI?=
 =?us-ascii?Q?0r7Wd3qRYdC+2wUUt8uin89cL3fYAS5PvAozz1E38+2UOWaAZjxpMvy3SHaC?=
 =?us-ascii?Q?trBdIMiRudvFMFVzC5hqCgCZSVsvk3ZjBzw4asn8yi1a0jyFBCyCcWdVjAKE?=
 =?us-ascii?Q?1RRGJaFOshwZxFE33NOflVFSE1sRGmD2B+WSI/+cEbEpRnxij61Y8z7ZnU2g?=
 =?us-ascii?Q?lrvSRQmZq3ZluTxDnTkPR18/hA+LE3TAAvISu27ix4+su9SMwdMdpyQ85eVj?=
 =?us-ascii?Q?poZ2n0tFWhaWEFk433pewhpaGnb3yLJuPRo7plaHwMoDZsp31M7yK6yXxr8m?=
 =?us-ascii?Q?86lDU7Y1yWK8rSeKr+ZNx7OWktn/gdK0X06KPOT6mZlv6MuLnA1hdclS2gED?=
 =?us-ascii?Q?gOuIulkr8/bqnErY8HWgK7oKQpmnBe87wPqdNsgnUHQN8PGsRhZrFhJ3qIbU?=
 =?us-ascii?Q?jJY3Fy+kZISb0t91qQvuR8D0qDEm+BTi95cHEW6vhslEqQnbk6lHcBAFCnxW?=
 =?us-ascii?Q?QkZdWyU0VkhD99TZIkEUy17gn/9HFd39kA2uj6WxLhUNxGkaB88SIhsttz+7?=
 =?us-ascii?Q?m7NqbaEwz4fNFggaz6j0lyUZdOIVCF2XKflBmBBOeGy7iUgVUhFtCy/U1+I/?=
 =?us-ascii?Q?aG9PGaEnuil0DnQePHCaV3qjha5cQhSvMmAqoz+UuqV6TPi86AnCH/3U/w1j?=
 =?us-ascii?Q?zxYmv18qb9EWtFeR7Hx4ZKIjGjnt40+mod3AmeZUSZ9IG/OfA4jy01pdy6Xx?=
 =?us-ascii?Q?a3a9Pq2uO+QiHrcveHoW2LlJrbfCtS2uEn0eFeJZUk7Qk1wBd7kb+2JRZCki?=
 =?us-ascii?Q?Lew/0NNM0BUf3GIu3oHJuF2eBlt/eDUfdRoAQ2jmHvBdV7VAo9w+Vmle2TaP?=
 =?us-ascii?Q?hAsN7lHxxq4F3qWG6mMTNsJnwLm2bEr7u1LGo6YulE8YmAMCRzJBPidOJjt/?=
 =?us-ascii?Q?QaAQyyrc5dX2ZRXEi9YKsYHc6rCvecUU/gwKJubO35VED+eNxB9gGtXMLm+T?=
 =?us-ascii?Q?BAFn0OHRTiQZB1lQgao8tVqKcQlY1OWuxEvKo46gF/FfVJXt+c0XPLthnV31?=
 =?us-ascii?Q?iCjmkZxRnS2wsnqFA2L5s66feGmaVEpN6DknwuTOusCrdHhuKu28U2zsJsVh?=
 =?us-ascii?Q?ERIsdGyo2mr8Olo1v2/bhAI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 62204f69-796c-4069-b8da-08d9afbd95e5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 02:45:05.3512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NwoiOacARQGBAuhNF2glk9ZfsovANCuFj1GnZE8oeKnh27aLZSwgoU/uJkbBbJ8TS9WOELBgRF+wqAF883p1lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2189
X-Proofpoint-GUID: G2KsUse80bw1OV51B6A01fOeTRvdhpIJ
X-Proofpoint-ORIG-GUID: G2KsUse80bw1OV51B6A01fOeTRvdhpIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Nov 2021 02:45:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94120

The pyext_PATTERN will add native arch as suffix when cross compiling.
For example, on qemuarm64, it is expanded to:
pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
which will result in the incorrect library name.

root@qemuarm64:~# find /usr/lib -name \*cpython\*
/usr/lib/pkgconfig/samba-policy.cpython-310-x86_64-linux-gnu.pc
/usr/lib/libsamba-policy.cpython-310-x86-64-linux-gnu.so
/usr/lib/samba/libsamba-python.cpython-310-x86-64-linux-gnu-samba4.so
/usr/lib/samba/libsamba-net.cpython-310-x86-64-linux-gnu-samba4.so
/usr/lib/libsamba-policy.cpython-310-x86-64-linux-gnu.so.0
/usr/lib/libsamba-policy.cpython-310-x86-64-linux-gnu.so.0.0.1
/usr/lib/python3.10/site-packages/samba/dsdb_dns.cpython-310-x86_64-linux-gnu.so
/usr/lib/python3.10/site-packages/samba/dsdb.cpython-310-x86_64-linux-gnu.so
/usr/lib/python3.10/site-packages/samba/xattr_tdb.cpython-310-x86_64-linux-gnu.so
/usr/lib/python3.10/site-packages/samba/_ldb.cpython-310-x86_64-linux-gnu.so
/usr/lib/python3.10/site-packages/samba/gensec.cpython-310-x86_64-linux-gnu.so
[snip]

Set pyext_PATTERN to '%s.so' to remove the suffix.
After the patch:
root@qemuarm64:~# find /usr/lib/
/usr/lib/pkgconfig/samba-policy.pc
/usr/lib/libsamba-policy.so
/usr/lib/samba/libsamba-python-samba4.so
/usr/lib/samba/libsamba-net-samba4.so
/usr/lib/libsamba-policy.so.0
/usr/lib/libsamba-policy.so.0.0.1
/usr/lib/python3.10/site-packages/samba/dsdb_dns.so
/usr/lib/python3.10/site-packages/samba/dsdb.so
/usr/lib/python3.10/site-packages/samba/xattr_tdb.so
/usr/lib/python3.10/site-packages/samba/_ldb.so
/usr/lib/python3.10/site-packages/samba/gensec.so
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-pyext_PATTERN-for-cross-compilation.patch | 63 +++++++++++++++++++
 .../samba/samba_4.14.10.bb                    |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-Fix-pyext_PATTERN-for-cross-compilation.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-connectivity/samba/samba/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
new file mode 100644
index 000000000..d497dd32c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -0,0 +1,63 @@
+From a0547cacaddcb2fbef1fb9991c5ad522226e6817 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 24 Nov 2021 13:33:35 +0800
+Subject: [PATCH] Fix pyext_PATTERN for cross compilation
+
+The pyext_PATTERN will add native arch as suffix when cross compiling.
+For example, on qemuarm64, it is expanded to:
+pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
+which will result in the incorrect library name.
+
+root@qemuarm64:~# find /usr/lib -name \*cpython\*
+/usr/lib/pkgconfig/samba-policy.cpython-310-x86_64-linux-gnu.pc
+/usr/lib/libsamba-policy.cpython-310-x86-64-linux-gnu.so
+/usr/lib/samba/libsamba-python.cpython-310-x86-64-linux-gnu-samba4.so
+/usr/lib/samba/libsamba-net.cpython-310-x86-64-linux-gnu-samba4.so
+/usr/lib/libsamba-policy.cpython-310-x86-64-linux-gnu.so.0
+/usr/lib/libsamba-policy.cpython-310-x86-64-linux-gnu.so.0.0.1
+/usr/lib/python3.10/site-packages/samba/dsdb_dns.cpython-310-x86_64-linux-gnu.so
+/usr/lib/python3.10/site-packages/samba/dsdb.cpython-310-x86_64-linux-gnu.so
+/usr/lib/python3.10/site-packages/samba/xattr_tdb.cpython-310-x86_64-linux-gnu.so
+/usr/lib/python3.10/site-packages/samba/_ldb.cpython-310-x86_64-linux-gnu.so
+/usr/lib/python3.10/site-packages/samba/gensec.cpython-310-x86_64-linux-gnu.so
+[snip]
+
+Set pyext_PATTERN to '%s.so' to remove the suffix.
+After the patch:
+root@qemuarm64:~# find /usr/lib/
+/usr/lib/pkgconfig/samba-policy.pc
+/usr/lib/libsamba-policy.so
+/usr/lib/samba/libsamba-python-samba4.so
+/usr/lib/samba/libsamba-net-samba4.so
+/usr/lib/libsamba-policy.so.0
+/usr/lib/libsamba-policy.so.0.0.1
+/usr/lib/python3.10/site-packages/samba/dsdb_dns.so
+/usr/lib/python3.10/site-packages/samba/dsdb.so
+/usr/lib/python3.10/site-packages/samba/xattr_tdb.so
+/usr/lib/python3.10/site-packages/samba/_ldb.so
+/usr/lib/python3.10/site-packages/samba/gensec.so
+[snip]
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ third_party/waf/waflib/Tools/python.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
+index b1c8dd0..24faa31 100644
+--- a/third_party/waf/waflib/Tools/python.py
++++ b/third_party/waf/waflib/Tools/python.py
+@@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
+ 	x = 'MACOSX_DEPLOYMENT_TARGET'
+ 	if dct[x]:
+ 		env[x] = conf.environ[x] = dct[x]
+-	env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
++	env.pyext_PATTERN = '%s.so'
+ 
+ 
+ 	# Try to get pythonX.Y-config
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
index c1c393738..af0795458 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0007-wscript_configure_system_gnutls-disable-check-gnutls.patch \
            file://0008-source3-wscript-disable-check-fcntl-F_OWNER_EX.patch \
            file://0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch \
+           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.25.1


