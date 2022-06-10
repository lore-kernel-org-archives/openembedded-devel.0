Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329DBC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 04:43:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.23024.1654836213107337708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 21:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dLc3i3Fw;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31600aeb41=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25A4g2Ye003470
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jun 2022 04:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0jvqxIhRB/Q7Y3J8/Eyfiuj/ySs9+IDMOEZ413UVG6Y=;
 b=dLc3i3FwoLDc7HvykBU3xHkifm3IteVzJXKSqm+5G+PHI8G1OjD16ihS415PuG+BPjDH
 X2ks8j+4YLjUKXilKY6DYYRuqppqcyRn+5HqZO+hihc+hUkFdvrw9hsL5xIewID9O9Po
 GfLePwviftLeWngZeKBHogevRrXr6H9T2A9krUY83hn2tlqj0L0k2yv8FybnzyJJ0J0F
 Er2wbEvbNvS9YFRUx7oKzLhhbadPwAx/k69jJYMCIcTyWndUf6ufREuUhqoCbsJVaaQS
 gu48oeZYkcqVo2ky7j7uDmh+/0TY1khyEjQv6v0a9QSQ5IovEbLhtaFAzBWGK4/3lZdD hg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gkuvb0373-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jun 2022 04:43:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhhS7EP8Jx8t1NySVbt31MjiLcxt+gght1uLyOt57esgqNz4FV9f8Zd/1d7T55quzX0aq9vxVVwBVVC1Iv8tCguTj+rXcJMA3x4rPFjrJ7htkcQ2Dq/oYQye0mNC8k6nD0v0xW0AYSXUczo+V9CiNLsFqc3I3fFa6FXCx8MCGA66H3/+6hnU/YW35FKQQQKZTquWel/1/Oo7Y2QL2IAkutODtfSy2SkUN2Lfdr2RQWKAg0KiNer2DcD4TDRRWppKctS69TlVTdwV3+FB/awLpAPYs0sLiuDsrnvJ3W9JrOUa9i3dm3JZ27WZ1dYSCHXd3VvTbI7QWJvljXJYz+cpow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jvqxIhRB/Q7Y3J8/Eyfiuj/ySs9+IDMOEZ413UVG6Y=;
 b=e84xzZFjpPZ1IMtflDRpGQ3zjxZ+oeKvDZSp9NMz/EbBnEOgInSVZlcHfdrDT4CxVVvEHfsm3WYUyYn26QsX7q8JZMg6niEeJFfbgvWLch3aPB1v8ZA9Bmj8ahVWvCSLixL2ytNo3knNcSa5vNYT6AC9FmpI5d1J9DEqtOwY0go9pY9eF4YhEc32RHiF6XPmZXhgofVaLL2aA4Q/2kzNSP7ASA6GzzN0bQd26CO/JVzx1zrl+sT9QyMIqTMGRJZCHdsSzPAL1f+qWNjwzEILml/GdMcMVhryykcF51kNBCtbkkyxx5fgzL0X89q+kY1MHQaZUyONk/fWh2la92xx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY4PR1101MB2182.namprd11.prod.outlook.com (2603:10b6:910:1e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 10 Jun
 2022 04:43:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 04:43:29 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-webserver][PATCH] apache2: split out a new package
 apache2-utils
Date: Thu,  9 Jun 2022 21:43:19 -0700
Message-Id: <20220610044319.107303-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0138.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1d0a01e-0ee9-448c-a00e-08da4a9bc3d4
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2182:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB218267F80174E02E73006B45EDA69@CY4PR1101MB2182.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J7VDfLQZIV5RcTpMscVYDm/xn1mGXH/CmDpE4nZIKxwKLNVlmqFU31N0NPUFq7XA3O9eY9OnRvM+g2A82GHyNgLjY53/lWcczNkuXWvfu6Yo+b1En1mm0lpThufUOERajgUynYqS/IeVmibEDQqy+i3Tb6kV/7Nf7IReot99qcOU65Eb3P0jzoK3B4oJ7t9UXFaFSHXEwo9w450/2d6ZiUaaT+qUoZKZLLxnUw31GbzXcZMyYQQUixAT3QYTw6n28YRGqF2U5bpVrIGcUWxZxe1pKSgQ9uwrXoUSMA1d+qJFOs+9mWFyxaeTj6Oyom6iE3JxsijStSJjgq08eKbGhDHEisruiyuFy6F2NbAYYDzHAUPct0CFP4QS3GDewBAtpo2rCqQTyWm5B/zVruUVyCG/Z6LemMvH/WYpBB9UTNM/fVmWeut0K9+3H4fm1L84CDFyzaSgAL3ok6cvqs5eoFrhOcw98mar9zGUzj90iFQNbHgWu3MCZ8+bmNSJ3cUcF9uu5iS0GNfTXphRsPBw+HMCLdHD9GGeA4siC4Lo6kjeO/tHMfU7IsoWN80E3EJMkMJX/Lqgi0ICj/2O0DsJulOPbHMDCxzz1qk397Pf+nYn/14/lk8BcYVjO42xiKSjj7MnyWqqySbpTURsuyBJx78tIH6E0LH6VBH9oe7Mf05iTXptEOLnsFiTxFlnkKtjPNzKBNJ8ILBxd0A87w73NQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(6486002)(508600001)(6666004)(2906002)(6512007)(2616005)(1076003)(86362001)(186003)(52116002)(6916009)(26005)(6506007)(316002)(5660300002)(36756003)(38100700002)(8676002)(66946007)(66476007)(66556008)(38350700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8e+SqRvFzBV/aN0neUaoAhd7+H9ZSu104aVpouzZDgEvNgzE6egLBo/i6zJQ?=
 =?us-ascii?Q?dygYNxcqp1q4Be+uZMLSjitt2s3m4berwi2T4tr7TKKrUfByKOouDrRowRj7?=
 =?us-ascii?Q?WbEIOdp1NAW6/1nm9eZvnqtsCdpk9HJdmOBm2RUWJQHkzso8TT0A4eUCbtQ3?=
 =?us-ascii?Q?LJA6hD3IuJQT8GZ9jn8lYTZyw9SoLyyKKSyP4isnSvLgC0dVLqQ3cAt0CHIv?=
 =?us-ascii?Q?JBhcHAUQkUerciY0EUF+pkcokQVL2HA9hMhSDpND31N9gdudwvd2CIZ6Xzuc?=
 =?us-ascii?Q?ycMYyxadSUj/J4DnGYhgjI2F1Lfq7icczZPokGDIAdKBSpjaz6KEiRAKnB1u?=
 =?us-ascii?Q?fM061ooBcqwccTLc73ao/olSfXZqyh7bL27RNYuLxWFekIq/9MhB2QXBK/ln?=
 =?us-ascii?Q?4n7LvEXi68pPSlUA3ZtLiBmp/YUt5kFTDp55M+vnawT3Ju5Nkn2bgxQnrWZ7?=
 =?us-ascii?Q?dgTOuvrGECoY3DS9RTHBKGKZM55JEN7fGkCTdQ71Lox+elzVASp4kywZaeDs?=
 =?us-ascii?Q?cLjPo6ZL+hpgbYfokt6WdIHnkPPPcHN4G/XCriUY3zQiHneSGT0W+MVGmd/g?=
 =?us-ascii?Q?uGGSylLLLJImpSE3PZT7eY3wTXoDcpEaPL1lK6sDIfwr3ySURFLBL3nwkWZg?=
 =?us-ascii?Q?Pra+R1vOhP/xa2Q1fQKHLi32GSrsZ2h88pngKM3umdkHzjKDPm+YaLAP6pSU?=
 =?us-ascii?Q?Z9fnhhHC+/mLGdvcLyp9wOLQx3RVd+YqIgBObeTqvpw51hgcOOjvNKfEXHKH?=
 =?us-ascii?Q?57H3H9PpUA7u+EpLqPJoMTTs2ZrZ2bA5YskwG+CZxUZ0WTCAfymxHXYVyXzS?=
 =?us-ascii?Q?2IdZd/v2rneg1MMhXjT7filXJG2wOYFn0pYpF4MNZMs9eHhl+soGFEJKpo7B?=
 =?us-ascii?Q?kLs8Z/Ov5HmGjE37JrKy6uW0e64mj5lVOaafecKg50HbzjWvErGxKhXHxUrQ?=
 =?us-ascii?Q?0OZZfyAJ2nYDukFRmTetA6sNkTgbX4Yyhc4EaZUWnZM2x2/HIF0XPz/IqW5o?=
 =?us-ascii?Q?WysC9y+7H/sd8zIKfVvxu9F/vL5gZHA09TwkN4n9SS8BYAmIrh+g0xNmPMT5?=
 =?us-ascii?Q?t4RKGViULon0fVYHsvj9N0X5bf9OhuDO3t7zLFtvehAuF5rlVKpsCVBhgq+q?=
 =?us-ascii?Q?w625qEaGrC6tS9S5QcgkYhpuOPHesqzoOD7KilbAlOYS361Tfev+Qy4Un3+e?=
 =?us-ascii?Q?WPz1zosYHN6xUZRpFHHIXVICyTJ5FbMTakyp/VEv+jQPTbRJyB5yxiAjn8YO?=
 =?us-ascii?Q?IfF+kpiiiQZxXpsfISGdHfjtNJZhlTYYVJogsJVgOa3z9ZYwHhBUysyaBv7d?=
 =?us-ascii?Q?km/UcHsnI/IqGxa5C3fh6WuJlgudQT/4TtSfJdjdNE7ea99nkDokt2AQyDQD?=
 =?us-ascii?Q?7aCjd/46qnI/kdY9FGy0/0oiVARNBQQaZXLPzy8fLTc67GQxMbO06oPXqbgd?=
 =?us-ascii?Q?C/O40opTwa3QkgNxd1p8rwsajXQhKPBOgoq/9gVywbw5DGnvCDNu5swoYJ4H?=
 =?us-ascii?Q?JhZy+UgbGg5LDn25MyzKkhVFCCzO+jxe0jWD1vQJwbgRKbmqop9K3owFcNME?=
 =?us-ascii?Q?aHfMiSOM8/pQDfha3jukpOcH0Ps9YT9YKatjfx6Fn/vrgoUbP1Rd5PfK1p8x?=
 =?us-ascii?Q?RuugDtOeCJ8LKIEXwHybFDFmY74DJbdEAEnVzMk6xpieH5FzEKaY3vimgwD1?=
 =?us-ascii?Q?CbZW4oVVKilmn0AU057D2KqMzPoDwvX9h3Z+HrjsFFxT0kz2yFHLRG13qvhn?=
 =?us-ascii?Q?GW8/clgo3NGWyhhO++8cm/w9tYi6mCk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e1d0a01e-0ee9-448c-a00e-08da4a9bc3d4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 04:43:29.4255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vs32gNXxP9iiswOk331LhWd/WDdMHI8lOczwud2vGKxZtoaPir4/FnEQM5NoN5Q9RPp1hmh/wwZsKrgfpv1Dqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2182
X-Proofpoint-GUID: EBI18bqYlYXl3Kp9A-PZrqsNRMYCTPtC
X-Proofpoint-ORIG-GUID: EBI18bqYlYXl3Kp9A-PZrqsNRMYCTPtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_01,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=603 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206100014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jun 2022 04:43:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97470

Split out apache2-utils so this small package could be used by
other packages. For example, htpasswd could be used by docker-registry.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-httpd/apache2/apache2_2.4.53.bb      | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
index 8413f5379..3ade9807b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
@@ -176,13 +176,25 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 ALTERNATIVE:${PN}-doc = "htpasswd.1"
 ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
 
-PACKAGES = "${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
+PACKAGES = "${PN}-utils ${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
 
 CONFFILES:${PN} = "${sysconfdir}/${BPN}/httpd.conf \
                    ${sysconfdir}/${BPN}/magic \
                    ${sysconfdir}/${BPN}/mime.types \
                    ${sysconfdir}/${BPN}/extra/*"
 
+FILES:${PN}-utils = "${bindir}/ab \
+                     ${bindir}/htdbm \
+                     ${bindir}/htdigest \
+                     ${bindir}/htpasswd \
+                     ${bindir}/logresolve \
+                     ${bindir}/httxt2dbm \
+                     ${sbindir}/htcacheclean \
+                     ${sbindir}/fcgistarter \
+                     ${sbindir}/checkgid \
+                     ${sbindir}/rotatelogs \
+                    "
+
 # We override here rather than append so that .so links are
 # included in the runtime package rather than here (-dev)
 # and to get build, icons, error into the -dev package
@@ -207,7 +219,7 @@ FILES:${PN} += "${datadir}/${BPN}/ ${libdir}/cgi-bin"
 
 FILES:${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
 
-RDEPENDS:${PN} += "openssl libgcc"
+RDEPENDS:${PN} += "openssl libgcc ${PN}-utils"
 RDEPENDS:${PN}-scripts += "perl ${PN}"
 RDEPENDS:${PN}-dev = "perl"
 
-- 
2.36.0


