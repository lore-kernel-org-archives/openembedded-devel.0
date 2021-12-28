Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B04C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.36234.1640677107489828478
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=g58jmqbq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7NhP3004638
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=WHFGhz4RLXUUahDlXLDoQMWpZWxuv57wH/Qchqc0LLc=;
 b=g58jmqbqmhFXcm4eAGBK7J8YxC3j0WE96AW4qGusJ1A3amea0/+JtVPgvkMIgtPEIizr
 4U4y4wxVcdBAmiiU+V/VUbuwqrrVrYSv6QRTkqMxYReJCmeh8zCo+P8JlWVZCXoePtOA
 qUldq924gQ40kRySUm0qaNhgKjipdvn1ZwpzIpvBW+Pb1Vs40wAeVNNF3WwD56QWgt+M
 UqvXkK/K4rTI6doiNY1M891qgDIwE6wriy/1ZpImi+KIbye1WMoq4aCCZrEWQiaX7IrB
 H96fNuLHNdLvbZzjYpmGpMa/3TlkS+/9JvgSWU87WcE3mtsBAjrr0TcwLVoqIo0nAsw9 Yg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:27 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cQxR001224
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:26 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88mw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzQCdz/twDkKbTZ5JtdnYZ1pxMlPZPtzQ8E8wRvzbx+Ez2gzk8aIDUJhARNrXIFlz0aiy0TAvmVv2N7OnhJwRk1Ls0f0mHa65M03y2UXb7yKYL8jNAS2nFs+pXXtbpwrMoUuC7OTNEAJdG/2uuE0yTpNEfxvcqXbOMYlov1YlS7dwcSntx7genudGWFw63CEhs+d3dXqznkzSPqslIyoKSRjZWdTEB/yY3i8k/UQOEGC3p3Bv85njsks78t6DAjlWxTzdF0hfOCeVqQw6FFQ3wNteD+eMFlfe+z/eMOBa4hEqi6YgSJvBKC32PCd+OgKJTYhS5JSVu+00WPT3P4n/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHFGhz4RLXUUahDlXLDoQMWpZWxuv57wH/Qchqc0LLc=;
 b=HgvX4JOExGhrw+NSnPGZOcNELWANQkFEtLsEV8Vl/wrbq/06jbzf9DEO9b+XYjHkUAuwhfMMnJhm3ytSL/c0fPCrNR54Xp+VBhgcTinp0AB49nWQHDCNxA1DZGeY2acynF78f7EPPAW2q41UBrBjsCQSlV2CQrgQ57rde9VV2TH1tU1/AelzCYauF1GoX1x4uqyaXkx6q4m/X+P+zplcVMTbbPXOMIRo7GpmGRIWejMqpFrV7IiZ6DH2PincOjrb+HMFn0Loar8JT6vB4tCHKLW9tb2JnAHF2vyoe2NKJnuyIaUCVPvOy2T7kB37L+pb99mJQdj10AWxpoYdmWvWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Tue, 28 Dec
 2021 07:38:24 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:24 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 04/19] samba: update smb.conf
Date: Tue, 28 Dec 2021 15:37:51 +0800
Message-Id: <20211228073806.868759-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ded695e1-d5e4-4280-be04-08d9c9d5076f
X-MS-TrafficTypeDiagnostic: MW3PR11MB4539:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4539EECC25519DEEB7E211E6F9439@MW3PR11MB4539.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	65F3oLuZIeOPoCZ9h27qZWlKYrjNY65pYfK+Iu840ZDHQ2hxKgsRpFFN2rcgM1u8VVYCCS/DDejvWmYXHfk6xVwgCr81E431fb7LFsL5IjvauODSmesieo/iGMO2XB6oX47zpmCW/rdKxTs5GRITZs7nHUUrh55EN3o/y2JNtG3tKpneRr3QMkK7wPPrccLUp5KibQdm0O1aHiVkSFK6OeC2wXeKwQiAXwHrSuz8bgU5X2p/iiCJNGflbPSreJsdzpEej7y4Mz4NT0f3fMkwp79YQys2Hse50+GsMyUdcdSK3I/B3Xce4XQkJyL8c1/lD5E6325EkO0ngHRPIhVQDRbre8U1VEJ6S7/Kcv8VHhisdp5l23tdz1khdtp0/LdYOrhUoDN9wVJSSK0XnQe0umxVrUtNe2qW1z2kAkQIf8WhAX5OHolRQfr5NVsR3M7f8KY5MamwSiHHsEvkcg8YOPZkDe+oHWruN+OuQxyy+WXi/YIb2D/nRWmcc/uhUJKJ5H1VPZuKqPXZYXu3BVQdiTDxMFExAMyABXu89aeAZs0Xj4MtkFPDt4KO4bSAICDq3NgGVim2C0Lttn2c+o7qvCLkGoe9GvgI2OoqPc60CKCss/+wRVMzqbP9mvhdgjQytloBaYZDI02ibsuR2+aBOO9iaKz2adMrA/fcoy7rFdYhXVYQSRe9/X3phjpRNWsRKoZnAsw7EX6pl3mHyGFMJIO3q3FtLIS1VxgThV9bNvG8dGXxlhUxUkqlFzylnfRy3ZfWRewRyseXlL1G8RujpwhIONDcN7o1CzWmia/yXRc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(15650500001)(8936002)(966005)(86362001)(36756003)(6666004)(316002)(2616005)(508600001)(5660300002)(8676002)(66574015)(6486002)(44832011)(6506007)(52116002)(66946007)(186003)(38100700002)(1076003)(26005)(38350700002)(6512007)(66476007)(66556008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lrAwHIwMWREfS4cYkmHQbbFeYF9gWBuYCLq0YMpiUBjczyFNtdmC01V7XHD3?=
 =?us-ascii?Q?07WfD6stnHSnj3hkebk9BxRiauYz5f55r0KP4YYLzzKVqfxQwIUkTTAoJbWZ?=
 =?us-ascii?Q?Qc867imaA6ocnGyf3S0dHjSos0eYiCZY9nbOrVwA+s08aCDjNjfosj8J9miZ?=
 =?us-ascii?Q?4SzJrf5Shl20JOpnIBWWdriavn0O7uPLHNWYCT/NHqaEgnJTVJgZ9CV9Okkv?=
 =?us-ascii?Q?q/aKk6mZyTJc+A+2GCB3QItgRTpIiz46UA+ZlmUWV5rtGJF29Vg2PgyrX4nz?=
 =?us-ascii?Q?D6uy9jUWA7CYesIusg+UyAyS1HtCbRKUmtX/2QBcRWLmO+KVkbhc3ZJcCen2?=
 =?us-ascii?Q?uqxsuS+hO0YjZh0ucj6Km+mTT8xJZ4+jdDBoa2c5KvrMTAWVuuW+1sSZaplt?=
 =?us-ascii?Q?7T7EaYCwleOF4TLT3hWTaXjSbd7/mD3BHUwYALtBwoQfDCbfBiFqnQbqwcAi?=
 =?us-ascii?Q?Nyw9zR/C2l+v4WwHHA8ep25/CEUKfE78hsE24/KBh0PcgEmGsA40C+AoL2pr?=
 =?us-ascii?Q?3wN2I4BfG9WT+sbbNoyBtgbFrYovT83Ziq/67l+JDHOmK2mhcP+80oYd3gCs?=
 =?us-ascii?Q?R0YBIOKFna1/aExKgdY7GCthT00ooF/vaEzdaZt2i0QB00vgx09M6cxk8Bds?=
 =?us-ascii?Q?7UTYR5tfsVVatQR05w0nrEbiJpmqgAcFbceWYXDi3T/2RqRnsBxU3JAk7udb?=
 =?us-ascii?Q?zOq+pDeQ/eKrXj9YUvs/f5KCxFIdSuwZQRCeorJg/LSncPxBwWrfyvFdYeHb?=
 =?us-ascii?Q?UCpDcBeFtl8MaPvRvfGiyK3F7CC6n8PhpyfuWeGQNltWmZhurss8U0s1ekfH?=
 =?us-ascii?Q?IjiHSQl7jOHNBNDEGwRSr6uByZx7DgtLvHanX7b1mzwLA0KUDxQeSlBb6vxj?=
 =?us-ascii?Q?saj3xz9ipgBvdEaR5GOzwxQYADlQ2RRIKV8Oy/qZzK6zzbftMToTysRbMXrc?=
 =?us-ascii?Q?Hor6RHXPlhuESdkbZCAnNOq6LSyxCQei2yl6JklyFttmOEWph6opYKD9AX2I?=
 =?us-ascii?Q?P0FIkXiEqB+MlGyUfgjZPasm8x6J5Mn/PY4TbX3aHMc9QHBNv310Uc5uDR3e?=
 =?us-ascii?Q?JK9C5MBdDsyilk87Riws4f/52rAgeP7X/8TncC6UfIwNc7pfsOi2UcwrxNAX?=
 =?us-ascii?Q?YvJGauoOL0Fdaovr5PbbvhuB27DDSI09TuGPl1K1cCOLB/YlGzbhwYBOCXvS?=
 =?us-ascii?Q?+otGml+ZWvivMxtBoKd+y0EXRkrTLG85D3qYhXabScPHKWwBshRbHot2UgLf?=
 =?us-ascii?Q?DbAkFa6Tj039BmGFhiJSpFaESTRjRMBksR5/xo3KLb/SiyYe9WiJGokpzui4?=
 =?us-ascii?Q?4L+okQMuENzFXYl8udu+HJLjxWA00lW1Z9ENInW3GmcI6WUJrO5ErPBwJ8Bq?=
 =?us-ascii?Q?2ld3XAvzYD50OtZgbfsFul1fXkVjlL57bceOBCpj7BgWdvThyEXTXhRjZr0V?=
 =?us-ascii?Q?rLAkQI+BiWatcPcftQGzFuChK8r/0bz/xghjwYCypHz35AXBlTT8yHjaBXCb?=
 =?us-ascii?Q?ri2H7fKtX3YCObMhAVwE8JunCsCpDxMmV2t4cQlVtV5nsB94HuqQWKNVpkNG?=
 =?us-ascii?Q?KoxVt11Iny/GAhVYbvch8kvLYf/EhO8FG4u5Ha6DOPescTpuHRYVqWXxAcQt?=
 =?us-ascii?Q?mhmCJlqdVOxfQ926ogzrNnw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ded695e1-d5e4-4280-be04-08d9c9d5076f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:24.1348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uxMMIa1v3/nYBP35UyUFbj10piHGHOc1OwquDt3mcsW52usRnw6gGiQ98KVQOlKK3cP/7FcwUHm09sDZU3D/5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
X-Proofpoint-ORIG-GUID: CB-vzjaLNPdv2Yl_w9qR2b6NJmcBI1xx
X-Proofpoint-GUID: qGBdleTXp5-Yj-nEwsytzWgt50BwxnuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94531

There are some options are deprecated in smb.conf.

Refer to
https://salsa.debian.org/samba-team/samba/-/blob/master/debian/smb.conf
to update it.

* Remove the deprecated "syslog only" and "syslog" global options and
  replace them with the "logging" statement.
* Remove wins support and wins server comments since WINS protocol is
  outdated.
* Improve idmap config

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/samba/samba/smb.conf | 40 +++++--------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba/smb.conf b/meta-networking/recipes-connectivity/samba/samba/smb.conf
index d6bde417f..588491ee6 100644
--- a/meta-networking/recipes-connectivity/samba/samba/smb.conf
+++ b/meta-networking/recipes-connectivity/samba/samba/smb.conf
@@ -32,17 +32,6 @@
 # Change this to the workgroup/NT-domain name your Samba server will part of
    workgroup = WORKGROUP
 
-# Windows Internet Name Serving Support Section:
-# WINS Support - Tells the NMBD component of Samba to enable its WINS Server
-#   wins support = no
-
-# WINS Server - Tells the NMBD components of Samba to be a WINS Client
-# Note: Samba can be either a WINS Server, or a WINS Client, but NOT both
-;   wins server = w.x.y.z
-
-# This will prevent nmbd to search for NetBIOS names through DNS.
-   dns proxy = no
-
 #### Networking ####
 
 # The specific set of interfaces / networks to bind to
@@ -68,14 +57,9 @@
 # Cap the size of the individual log files (in KiB).
    max log size = 1000
 
-# If you want Samba to only log through syslog then set the following
-# parameter to 'yes'.
-#   syslog only = no
-
-# We want Samba to log a minimum amount of information to syslog. Everything
-# should go to /var/log/samba/log.{smbd,nmbd} instead. If you want to log
-# through syslog you should set the following parameter to something higher.
-   syslog = 0
+# We want Samba to only log to /var/log/samba/log.{smbd,nmbd}.
+# Append syslog@1 if you want important messages to be sent to syslog too.
+   logging = file
 
 # Do something sensible when Samba crashes: mail the admin a backtrace
    panic action = /usr/share/samba/panic-action %d
@@ -94,10 +78,6 @@
 # new domain.
    server role = standalone server
 
-# If you are using encrypted passwords, Samba will need to know what
-# password database type you are using.  
-   passdb backend = tdbsam
-
    obey pam restrictions = yes
 
 # This boolean parameter controls whether Samba attempts to sync the Unix
@@ -123,8 +103,8 @@
 ########## Domains ###########
 
 #
-# The following settings only takes effect if 'server role = primary
-# classic domain controller', 'server role = backup domain controller'
+# The following settings only takes effect if 'server role = classic
+# primary domain controller', 'server role = classic backup domain controller'
 # or 'domain logons' is set 
 #
 
@@ -172,15 +152,17 @@
 
 # Some defaults for winbind (make sure you're not using the ranges
 # for something else.)
-;   idmap uid = 10000-20000
-;   idmap gid = 10000-20000
+;   idmap config * :              backend = tdb
+;   idmap config * :              range   = 3000-7999
+;   idmap config YOURDOMAINHERE : backend = tdb
+;   idmap config YOURDOMAINHERE : range   = 100000-999999
 ;   template shell = /bin/bash
 
 # Setup usershare options to enable non-root users to share folders
 # with the net usershare command.
 
-# Maximum number of usershare. 0 (default) means that usershare is disabled.
-;   usershare max shares = 100
+# Maximum number of usershare. 0 means that usershare is disabled.
+#   usershare max shares = 100
 
 # Allow users who've been granted usershare privileges to create
 # public shares, not just authenticated ones
-- 
2.25.1


