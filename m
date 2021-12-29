Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57B5C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 03:46:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.46968.1640749614111784089
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 19:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oTP9+8pN;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=89979f0243=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BT3gOuH008999
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 19:46:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=UY444Mk0RT2y9wz5lUMRHjAHLhZh/2KUhVHjdTY3Z7U=;
 b=oTP9+8pN+z7EPsN9tD6JcWbr0yEwwRlX0mBNC4qLo9sjplkqwNB8JqCf34QmJQadGBkQ
 TmG0NIdaH8q4CNacz5HBDy6UqmsOQnIuLZ4170k3rkh5hgI0iojkcUREhXFb7flSq4ev
 LIA2iq/xV5jjljlqlDwpU5ODEqA8hz9+gKsF4r5on3oqwCdQA/wAYByOAji31dMjN2Sp
 v8GeCMu/EkKSE6Yw06nc68CRK5fNAHnBN5ZxPOArM09e3Lnl2obLyTPgUfjTeha+KtNl
 YXHrptyvpO20Jg0DOR7GQO/Nn7qwpIzXE7mmBIClVPVYkCRISHsL9lxU/FJLLIAIUNDd qg==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw8sve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 19:46:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KR4qC2JAciljUksX+iw2jQoN6EBrfSuEnbzUm4NEp1GHgxk14Ee3SH7v6dxqmQyC6rf/zKwN42975jKJ0CkjNpPVXUCLfV78OjUxMLoVs4dy9HK9LQjtuW3GCKwPSnV2YKzfYhPQuG2nVhrrLm2GyCPj3HL0nx+M58CFMJmOV9XWMV5hEzFUt9ubUWO6lEr94TWxpaeiTWLAb8omkVfrhtse+c6AmHnIpPHJqEMNVjn4McfsuveYj9gPcyQ7aYktwO9s/FaiDshXOJQa7I60mgqbaqzLTZanWrYvGShC3/Xj9GVcRmHv18g2KsrEeqmqm6W/t3IF69sdw7b9J1Nykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY444Mk0RT2y9wz5lUMRHjAHLhZh/2KUhVHjdTY3Z7U=;
 b=ar48zzgdSwsE7Ughp9PplzlF18SS3ZneyTYxDg64cxn6vUzafwDdoP2QsB6Guepj19rIwJpcz/9EWlrIFprM1e+wwVXYj7YaJlBe8p70B4fm8Oo4Dxh/4amwk8ms9N/w4KGnYcQorFqyDDL7QMgVRjlJJ53lOnwPP4f206tPARClDKn3Zve/weg6R8E8zL90UEoZg36ukP4htwEqPzc6ry+IxtEsfcEkrN4LSq1bj5p6zSpB5hz/XNVi4t2wJq9HPDSf465DMUo+e0+PUtgIAPFBgrJK5iSWFvLy1Gfa+Tf9lMqWHgkvYimU2fRVzfffTSHHTQ9NzWrKEyj03j3GWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW4PR11MB5935.namprd11.prod.outlook.com (2603:10b6:303:18a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 29 Dec
 2021 03:46:48 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%5]) with mapi id 15.20.4844.014; Wed, 29 Dec 2021
 03:46:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] xmlsec1: enable native build
Date: Wed, 29 Dec 2021 11:46:34 +0800
Message-Id: <20211229034634.952620-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2017fbdc-98ed-42ce-ea3c-08d9ca7dd7a6
X-MS-TrafficTypeDiagnostic: MW4PR11MB5935:EE_
X-Microsoft-Antispam-PRVS: 
	<MW4PR11MB5935259AD052B2AD79EA3F83F9449@MW4PR11MB5935.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bY1TomWfedEcX9JJ/2iihL4Yu9ELjzSSzEqAG19zAlU+8Tg9toffhEC5dNPv8a0//J+Uk0WdMDQNSWw9tzyQaifdCgYUjb3FFPX8oQ8IkKGx/f3aKGlH2esQq32wny0OIbRDyJvrLaz9ed2wcdNqqZ3QPDFOMnQ784b2I3kLdFQWLFgtsh9+wGbOwBljyPLF+5GckEBc1o2lwV2Ah767lctNReSkU8JS4Tca16bbtuVyYElSRq3F4aQmzVsiooB512nYL08qZzADl9ismuEybEw8KRB5zYVojeW43XFrMgZuToiM6AAxjzWmnFODr8aSiV9U0fAD+8mYIwa2HN47cWD9C/m9ydDVfDsaG3xyNqdb2ZoXfn9/kSDlT7TFFYWs2in8UnM8Q/H5k5neSUSDMYHNDH10Hu4djRXRwjObpU89kBeDPLbY/rmReNfkuHYcAPoK+/uHzajhscl2o8xmnUedpZswOPcuSnSZBCNgrKRJ607WKKbV5p5bWL3dcG5vQF7/XXWYY95YO/9i6AEnwUBCjC7XX7vBzv5fQD5cst0hh8FYrzhHfjdI0MjhNDUcMprYFAb00AQhQYbecfg6GXjfVnsmV6DJamcNBIp9CiX6ZyQi7xXOeM9ptgivjWwUtBEuC3tSsoDoTe7Xl6Q5WPcQf31axwYrw0i44GMK8j3UntzlVtrv5KR3Gw1yvdKExhRnfajujZSvodgyLdQOyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(508600001)(6916009)(86362001)(1076003)(4744005)(316002)(44832011)(6506007)(8676002)(8936002)(6486002)(6512007)(66476007)(26005)(66556008)(6666004)(2906002)(2616005)(36756003)(186003)(38350700002)(52116002)(5660300002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DEc2p4cMVizQUsmQ5Lz/sLlDkKEexg0UH9jkKOxFoDmBMf+b0g7wR7T/QZcj?=
 =?us-ascii?Q?ZHvyAqs66esNeN6xM8tgox1l9LOY1NaXdZwDYyzLk0dVo0PkZR7koeuLGtdl?=
 =?us-ascii?Q?t39Cy35RkQhREKHjhoybz1MLXt2BjWLIUxDigeLciCcC9twppefvFvd1yqKq?=
 =?us-ascii?Q?OByZ+hbiYvSTJ5DnYvy/suHzsUV+GLWjpg6s/oVHhmENCqJ1rT8jqIioZQxQ?=
 =?us-ascii?Q?XMUrtkflvJFvSrtPeReiqI/oeu7g4CIrGxjyGF57u1OCa38FWUoxoPh6AWjo?=
 =?us-ascii?Q?hdJU/LrvYApkAzkhFYS9Tk9U8/p2rRwW6OlFSEsacuKKgY1uqEtG4/Kc4ic6?=
 =?us-ascii?Q?vfVklYVlbT6AM4rnusg6l1L8AymLagbnszG258Bms3sHOCKFX7G6yT5Wd5jx?=
 =?us-ascii?Q?5575kWpn1W+ujjBPFWs+sLAVGR341gPofHqeLXZJapji/QDAyD3v+Qy3rm8L?=
 =?us-ascii?Q?rqZWlrrRmzTKFp8s8hQ7jA6yvSMv4sadJoCZ3yEeN4Vgcj9rfv1BDX/WSZJ2?=
 =?us-ascii?Q?5UjcptwkRqN0OTswy4vYMR9f3lhIQBs4SfV8cZuBFyWVuW6KjxlHrOm/0z4j?=
 =?us-ascii?Q?C16M9DHlOD8OFZEychIp0WxT04m3AUaQ94wDFTy0BVmJegSpT1NVouWczZLp?=
 =?us-ascii?Q?HKfTp12TEcCh2/nebj2eVgwZzaQsklKXPy2U0dhwmTTaJ/ZvTv5LuFLuImNm?=
 =?us-ascii?Q?S0pUcnK3Jo+jqZ1LAeLqxga5HVYpaeVhKC02F7PbfPPUjAWCWqipjQVCPjI0?=
 =?us-ascii?Q?l5uf6XZv1BSXs5I8d1Mg5vLSpo9zNNt6eybkVW0X9QErjAzlzR99iNc0SDo8?=
 =?us-ascii?Q?FletgYYNheHWjadGzzndbvDqMOeqyCFPDaBZNgeQyDXsfKB6qOM4Lsccatcw?=
 =?us-ascii?Q?D54/ppEC5GDeTVckPfpO+e6iZ0BTte2ixxMKrRxp+6y+mUwCDrSTuJiXgIxb?=
 =?us-ascii?Q?qQscv66po9w4dFNSV7/oqIWaI2KWGjSU/d1NnryfhG9O3n45BGAw2jLTCPC5?=
 =?us-ascii?Q?JIhrWWFixsvXprJOPRUR0e3mfvCdhVrrAA/XiAOl1sg55heAIVnfZc0VRiKj?=
 =?us-ascii?Q?ELskPY2iIs1QWIBxtZqDu9Kx+v1HA5UZlkgFh+yWkpRgBKpfedVkp61oXhc8?=
 =?us-ascii?Q?t9rLfUwNiOo3Bwv3H8tFx81oIRST3PPy7JDnVsQHddgjrsDdqdXbgzxG1Nth?=
 =?us-ascii?Q?PdiOffXRaBZbHKEhASe8Zz4LuoAdEEUqwBg2vwSr/k4wRJ5zOnXYY49eFC1l?=
 =?us-ascii?Q?a2ARqMv7oxkF6LxTtFaQ+pxuoXUpDbWgn5t8Hm55dPT1+9+1LF7jniEizGLG?=
 =?us-ascii?Q?TFxCBdwSLP7/VRjbCVHTJGMKqbEs75ZZe6dU9A1JCKG5ANh8q+voDGlQeBdg?=
 =?us-ascii?Q?pwI8LxDSY6oQ+ZimY90K9viWX2xjQRm2bAlAjWrXRHYy+vYgWOEO/ITXvwH/?=
 =?us-ascii?Q?0YFgrkzj6SJ9XrCEl9pwgg78y2YIHkv0v/ZWuzfIagPTeqBnwraGZCAT/01S?=
 =?us-ascii?Q?2h3Gm0YBMvZa+y5v6YZPYaS9Q5nc3T9bWwYQnsDhQ2eMUGdZmNkx4aB9Spf/?=
 =?us-ascii?Q?+819kyYuO7kGKC8OLcl8iYKRUyY7VbjK1IHEZb4G3S+VM9tjeXfbn1ovTPfr?=
 =?us-ascii?Q?1r9H1enkUer2QOz0kebmui8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2017fbdc-98ed-42ce-ea3c-08d9ca7dd7a6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 03:46:49.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 P+alPoAcNl63/3cpRjCk9oSwzIc7qrRYcqhlMFtPdtbfLToS15U4bt5q3G3Mfb7QOikeNRZ9peuMFznQsmZ3tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5935
X-Proofpoint-ORIG-GUID: oK1Xs6zLmJljty2-DDRLDGwsjrN_lkb0
X-Proofpoint-GUID: oK1Xs6zLmJljty2-DDRLDGwsjrN_lkb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-29_01,2021-12-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=542 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112290018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Dec 2021 03:46:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94560

It is required by openscap 1.3.5.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb
index 1ca0f79f0..0cca2fe77 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb
@@ -63,3 +63,5 @@ do_install:append() {
 do_install_ptest () {
     oe_runmake -C ${S}/examples DESTDIR=${D}${PTEST_PATH} ${PTEST_EXTRA_ARGS} install-ptest
 }
+
+BBCLASSEXTEND = "native"
-- 
2.25.1


