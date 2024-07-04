Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503B9C38150
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 14:13:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11043.1720102435952761283
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jul 2024 07:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7915550ee8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464CANSd011075
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Jul 2024 14:13:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jrsgjgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 14:13:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVyhnZD6CFwhuoR0TCkxn3pMQ55/Z9yV8nz1D/hwuhya1/zGlKq9KnY2mKo4aY24Hq7ss4lKaKlepZr+crOgVicEKCNrT2Mb18fJwXP0+aaHZAj7LTEkdLx3Y5ydiNQYu0G9CfryMoOFs/kHH+69OYfQfRgGw2E1RbRYLnBVNlyt2dfiqS/itvIlLwl61b0vTMSTCImD8u5QG+Fv6Uzi0zOog/jFqLFqG07xh5fhlX6vg4Xw7U0Jxg5VpAZiUj5lGbfvN7I2A95CmWqwRfDpbECFzGOlwEqE3VzHme+S4RRKqV0o5qp6zHd8+jVUSLstqcikjAzaK0EZfKgj8o74aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQNEn2sx5NmB1DzkfvJevrG4vSozyk19tHwpH19Je7E=;
 b=LSdnJRIeraTRMA8Di4P6/IiV+uF63yvpbr54IlNTRQblgZPyCVC1YGyraVOhNvdyP4z1rkKQ1xMbaKzP5iZin/u+9gE49GhxkZIdgih+92VtZSMuAHsOZcFgODcZU+iQmHQQ7i2K4ezRPI6ZTkZKnwuWdTqT3vf8QHc4/NnJg8TESIVH96DT5IA1UfEVsZXGrtuA7/wtik7DrgN2G6xWCCkzZEB+1HjNeaMJ5IXf0yC4Ykr8DFhn0N9WpB1umzvPFdvSuQLkY7UjElImSyEKsX8BYfN675u3L89IzWk3xtF5c4aJGDynpv1fDaufB4/bNRPQKUR4wa4vuzNCG+B0+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH0PR11MB5220.namprd11.prod.outlook.com (2603:10b6:610:e3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.26; Thu, 4 Jul 2024 14:13:53 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 14:13:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] wtmpdb: specify correct pamlibdir
Date: Thu,  4 Jul 2024 22:13:40 +0800
Message-Id: <20240704141340.659529-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704141340.659529-1-yi.zhao@windriver.com>
References: <20240704141340.659529-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0194.apcprd04.prod.outlook.com
 (2603:1096:4:14::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH0PR11MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: 84603f83-c9f5-4b3e-d482-08dc9c33888c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gAQqSRIRVNM9+m8B01/hjg7kmR2Qi6ghyHbYfhmGk97lgxdDUQmZYB9pcN0g?=
 =?us-ascii?Q?SmkcjEfvi2kmlw2I+fjG3tIM2lYrZmcmM75lqezTsIpzDJNQZEp+lUPG9gOC?=
 =?us-ascii?Q?E/f5dzpSQl7cOWH5Ay+FTnEpKqfoTcnuEZwnERU4TRRi2csvrqFWb2bwfRaT?=
 =?us-ascii?Q?xZc39nkNk2gkqqYGveFRRGNzmrp+xRIcQMZXaJoRIlw4bRCAvaqQp91Qb23O?=
 =?us-ascii?Q?Rv10KrfYtkGj6G0ialg4iwgF2VrI25YxkMCW/MVTQsmBGYi9odzWHcx2hHcb?=
 =?us-ascii?Q?qIgnupQRfx+c3c4S1gJO+YRboCH795tj37siVPoWltj8eblsib1R2yA6Mbiz?=
 =?us-ascii?Q?zgB1aQ9jELZ2E5KgXUxGZho5r5ReNxMOGrHQ8g3Vf7AL+BgRF82SqkG/j2rK?=
 =?us-ascii?Q?79jSuDvxtG7Kq0U1Cbp0nzJ2eGzruGAwy6TQ+6W6UOOO3bN4JIh5TzqkH8Pu?=
 =?us-ascii?Q?0KlRpWaysFGrAA71BQfW4Z1lHY1s7ArfDp25iQsJKmEhGgU2b+97Hl/0Ev1L?=
 =?us-ascii?Q?AVHB4XzAbyjwlTHCK0giqyPR+HebJtwBgJF6CkMWW13dSkQYzhjwzlzhcXbY?=
 =?us-ascii?Q?TmymUlQJQuYcRFgNZGOjw99JBEDYsiFxQP+/dkxoJm5r4WP3oneL3xAi8ctT?=
 =?us-ascii?Q?yZo6RLsROSqMEy8pe3OaAqTWBXYpXym4jIwFidi2aPHxL5vMgWAfMSD538Eo?=
 =?us-ascii?Q?RMgUHT4CYs5U4QDrO+r+JKDZr7dR+NROiiSH81rxTL2KqP9rfrWabpD2ce0a?=
 =?us-ascii?Q?VOibWdEVPoOGgLwWMeAAMq7n3y1OlnJRSYnQS2inDjImP5fXV3Vz6VB4buv5?=
 =?us-ascii?Q?u3n4wujJbLOes3GZX0pJj6xIf49WVhTnCkDwmuz3nbAWoCO2IeFUjcJ6b8GN?=
 =?us-ascii?Q?RESVNg6jQjvXbvBFDYf/RnLcQFxVhzXdeWiWUdqG7GTPAtuTvoQY1/cBX4ND?=
 =?us-ascii?Q?bL9BljUgU1J9anD8RFOhaqchGGZZWihGVWAjuzehdefPrHM0g22mhvNsjQAw?=
 =?us-ascii?Q?wAyL7/2tSTRtpcJVYvScZ8Ft5ACrtmA8DIO7KSBiVKS64bqvkhABXi/JbKbe?=
 =?us-ascii?Q?Dn9a6jYEPqP7oSbtRlGF0Z/O68AS246rzteF+x3Ae5gHQ+M7JTAQbHTApqZM?=
 =?us-ascii?Q?NwhYnNcQKMPjFcKSqHRDJ2HX4OPpLSSp45Sv3a4EQQlYJwwdQWu45UczIDDz?=
 =?us-ascii?Q?kkerXRaPdIUUl/+2vta/rCx5458gNwGES5AofAllmaXYNwnfO7eDO5NqQM9p?=
 =?us-ascii?Q?Sg7JjEoj9gP5/wnxupLp90viJIXvi9bos4p6dDnEpnhKDpAiUkI5qck4nJOR?=
 =?us-ascii?Q?um4udVTv9/XxPX4ESH72nKZmEEHen0XKYX/bUjTtc4D2tYkMasMkI3Rp8Pta?=
 =?us-ascii?Q?Lhg7eoN92MdPS4BsZElY8CDm2KCNUm3bjyAuSFMJQMATJHipiA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EryCQhR19hbEmCL2kvywpT2uXwmYenvZasbM9DVRkxx7BtgJLLRo51qHpkRY?=
 =?us-ascii?Q?qfXbtu09pf3W0od70Vl75chCu45qNeW6SUuGuCgE0RyYShRxRSpI0ZD7KK49?=
 =?us-ascii?Q?mzeZm0MODjOSj+IenG9FKqkCiDuYvkQPO1ONUPRpIntRrUDQGaAgHwPYgR5L?=
 =?us-ascii?Q?ze+1R6Kh9sHLWkPfZRAq8rQ9NpKci3i4gdhjfqZyIo76lcS+XW0A465GwAEd?=
 =?us-ascii?Q?BjhLCJHTWbjatxvAeAYZg3gzL/qSyW5uJfJgvsgy9kJle2PkOaIkvBH+qYGV?=
 =?us-ascii?Q?rQ3chSMTocgwAx72pQV+4rwb4UwruUaZEXdFWjc1hBp1VUi0bYAgwgtZYnLm?=
 =?us-ascii?Q?N/r3yjNtWPg5mGMQ/erFTapoOb61jI8o96ujJi6Gepo8ieNXnXwAle4m6RGY?=
 =?us-ascii?Q?ZXYZOoYcXjVDMObir5UNJFrBAUgaBIRygOIJ9fZShs6aqsgkkyz/gZKyay1r?=
 =?us-ascii?Q?gHahdAu9Sq4I44vlN+Yt8tCSVa2qRPa8RKHey7PmMUt90m0qLPWuuEESTu2e?=
 =?us-ascii?Q?1OphR0fxhuPNBQm8PI4w7cHr42hkr6SeZShQIuKbfvawUm+bSQN1hFZTewPp?=
 =?us-ascii?Q?yc/TH9bs7MI9EYkhGIM1PSEi8hb1ONgZKJ4948ExR944Vyr5xl0c5MbnJRSB?=
 =?us-ascii?Q?oyBKBtP3Q1o9pO2WZVOaNBR/F9PhzzuzDkPFys6mNfwg64TMMfNBur/aXvYf?=
 =?us-ascii?Q?BDo64c3+26GxBvOS1AIQTQJPJOjdLQGJu7sMih/up92eorpULxKRaEewWXtZ?=
 =?us-ascii?Q?wovmOvhzJv75mkjY3WMVNTphYAYAXGB3MJTxgrfABH1vqjITpfOQaqNTxBn2?=
 =?us-ascii?Q?leXdcAhLbAF4KSdmBSPODPRjukEBmwWc2xnG2o/eyAcKFygzsGnHxC/L0185?=
 =?us-ascii?Q?vFV605HMuNfi8M+Jj+gqrQ1xYe8YDC0WJNLgBsPuB4SIJCGwvnQ5EI6aXx5V?=
 =?us-ascii?Q?xGIdI3qZAgyyKEbMwrICY5GNd2SxtIROO9GbodszXaecz6Cgzs5gHc3jD+Kg?=
 =?us-ascii?Q?yULXAJ8CW9RtAO40sl8+KVfVn3qFVebFnDX7mxUaxnWwhlT8vUQUBCQCZZEy?=
 =?us-ascii?Q?XkVFp532ee6nqjisG1YOdJYjQli1hYy/oMAsvMtMv2ymzGj6TKActRDuFikr?=
 =?us-ascii?Q?xOXdaLrSMovAvqqVYFNIdXs0WPV4KjL9B3bBncB+MypHIDIMVPCCebOZhyou?=
 =?us-ascii?Q?GnVzB6sFJT3U6FfnxUulFa4FMsKpi1InbUIgvVZFqn+b6WRVRAD8aO++JwMs?=
 =?us-ascii?Q?93srxbxMAY6tgI7oMlW0NpbETQiO26gfXhqquoiGebzo2/3ELWG1m/zV0wLM?=
 =?us-ascii?Q?mY46iKoBAL/iJajHn80K+br0PSra1u2hqert4N5WucN3RiS/xFmHvIR5Qz1+?=
 =?us-ascii?Q?4z/CSFQuFlTWfXJ8tk1al2jD0E5ZTGQ1S7bkDmcNgnn3WEn6+czyqxiHXDl1?=
 =?us-ascii?Q?Bf0tFdTAaFQeKxqx3kvUtgkhQ1Ao1mFMZpXYlh12ABuTZgNM8gi/LRqPv2Fv?=
 =?us-ascii?Q?hq8HVOyHPCf2ZP7fJaooZIHzs5Nmg1q30KGdvHm6mjEE0ddBtKQCuPC4+Iet?=
 =?us-ascii?Q?s1WK7MzdOt54bhp2Kol0YyFusCUb1xKwoFyAbm/y?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84603f83-c9f5-4b3e-d482-08dc9c33888c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 14:13:53.0890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZKGwcQVUm7CGawrFVfqI/vAhbuQYwfK2g1f/cazLnue+X/C7ko7VnU/W/wM1Cp5YBMDHt3zD7k/0aQNa8nJ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5220
X-Proofpoint-GUID: kIpv27gMe2gu-_TadLh3mHRFEyxI5efX
X-Proofpoint-ORIG-GUID: kIpv27gMe2gu-_TadLh3mHRFEyxI5efX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_10,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=688 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2407040102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 14:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111254

Install pam_wtmpdb.so to pam plugin directoy.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
index 785ae50e9..7fb31f208 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
@@ -19,7 +19,7 @@ REQUIRED_DISTRO_FEATURES = "pam"
 
 SYSTEMD_SERVICE:${PN} = "wtmpdb-update-boot.service wtmpdb-rotate.service"
 
-EXTRA_OEMESON = " -Dpamlibdir=${libdir}"
+EXTRA_OEMESON = " -Dpamlibdir=${base_libdir}/security"
 
 do_install:append () {
       if [ -d ${D}${prefix}/lib/systemd -a ${D}${prefix}/lib != `dirname ${D}${systemd_unitdir}` ]; then
-- 
2.25.1


