Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07C3ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 10:06:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5895.1663927584185513129
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Sep 2022 03:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=c61t7aBZ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=62657a0bd3=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28N9uG3D032719
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Sep 2022 03:06:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=IIEzrFVjTjeiuddLe0/IL2fAnlpWDLYEibl16LqM/b4=;
 b=c61t7aBZw1ktAm1m9SElZ/z1LkjXrpKHrZf8ZxI5apCCH3bAeX2loj0iOZpmYjxLB5e/
 nIFzNiVcF+YeAFoziVrczspbGog37t2JD1amn31ThKPYtoZHSHmQDWTu4nKRRfIZzMyr
 /Mxfao5cAC/QM9PLXUYgOwmujYVOfBFqzG3WEvjzNzmS4hbEVqt9mZjjY7BQwftsbZ/i
 42FwlGXHev0M79r8X1YNCIAUHABRopp9FB3O3bnUCrzUdDAiKAI3AYqWK/bpsbGUatwr
 2km2PCi7GnQ7zS+FP1SxX95c9s/3oV6fFIL4MiD5gUSk4mwbIM5sTPht9ACYkEKsBcUX 5w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jndrkmw33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Sep 2022 03:06:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1eKJPEGyv0Srd4fD3ZYb1mYN6Q8+m52xo62UE6bMvCwlbpAsoAy938m6yrwGdjwMpWV1GYJ+9pESNYgZ0xElbETPsqDb49Sqcb6WHgNxaQ9QIjJb18o/A/ep9p3uaSQLBoPEWzJNNuQeRlRqI+mfvWk2BDwoItvGIXalw6OwYxwADv8z8Vqrsej3u7tUvQwDPXJjrLJHUUI98J3Es22EQ+z4mEfXC8iKMKBMcxXxluM1D1LMFZJvxS/SVcXWYoye50G3SkEsA7bBwCs0lZvJO7LZJavyHchfUbHPZuqWZAAzeN8i0Alr869dLB671r+x8KurMnXhYdFHHPua2JxfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIEzrFVjTjeiuddLe0/IL2fAnlpWDLYEibl16LqM/b4=;
 b=bSkxovmUq8zzHAA1EQW+3ImQMFARMy2BNBTQL18PJQiB8HGMqfcIhn8EBcyGpSy/zaCePBKlg+U8y1bgS2uqNQqtIPmn7Ub6ooTqGx0iJEx75Uj3smGs0JTvnK0hBvnCgMqW68hzVr0eJPDTGajci4n5U06PwoLQMJdK+Q0ObBtFhOlKvOoNVLxj/CAOHt1WeYflU4DgAJZz/re5qoDbwVeRcSz9W3VtjgKPSMh7aipUf/7Q0nKabpZeeH1cyS8u6PuVZvJwy3lXx35ufZTlFfLNAoKed3WIDXnd/fnRefaSLzAWBNQvVExFXn9K6a6037h+Ljbmnr921GqMxxpBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 10:06:19 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::44b4:98f4:1cb3:8941]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::44b4:98f4:1cb3:8941%6]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 10:06:19 +0000
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis: build with USE_SYSTEMD=yes when systemd is
 enabled
Date: Fri, 23 Sep 2022 13:06:03 +0300
Message-Id: <20220923100603.584411-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0007.eurprd08.prod.outlook.com
 (2603:10a6:803:104::20) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|PH7PR11MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3b991e-55a3-4eec-32bd-08da9d4b42aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v95i0cu31RZ2hG1h7AQ3ydeqnkd7MZSTtFDbPuNZkyMumkQ0kBrpobvFhXdbtr/KDbLUosNUQRfymWBukn1rbiGkSMAKmrWpxVz4rigxF65PGYJQ+3oTPQ5fbUscBdORlgPaYacWjWegFiF7ph3xKMS7CyAlE3bj3aJ1ejOS7obUljcllnJkx1ZJZg8aPzASgIzq34yJLXboBf0sqOheFXb3OJOG9D6W2z0qVJWp2ymgWtxWSuwe7mWueqK9oKayoRmxu2SUfj6GTuC6poLk7gnW8647kE6C1NxPqNQW9jD702FGrP3/c3Ip2r85XX/ToGJsW8kHaU+ivnBYZK0lTDF/8ZbORPgP8BrJRMR8WwXHxt6HMLI+YFzTZSuuLjkkm9DTiLhgq74figZrW5kN+ebQ+MCc3gCCGFr1ogQG2i7gqk3WiKYEy0BK8rKCP5gvsRCUCBFDJ+xqDQNY7DxwOPeO+1Azx6bmM+ytigKPvjgmvI3GnFCT0fe6HLrToJ2gUmyPtouViwMnhlpDWYOfJ3HP0Ji0531dBs1NghtWtJz8wXEe8SKkRXKMGFOPFBccZZsQqvRyZ/0MoJqmVSCNls7os4IHigfB5r0/W6eCOmZz355zgm1bWXOwC/0Uz3Ec2flX5qkTtdCEhFfAuZx5Ki0cCmSxPNi0vj9Zqr+SMW2C2+Ib6eFZ2uTs20aOfdHROl1zWHh/pgvcrZoRlnkj8fgy+WDujHQT0TYbtZxzPdicGN6piTwJ+a2Y4pliKgtNJ+HhDH8eM7jkhL+UWR0TKg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(376002)(396003)(136003)(366004)(451199015)(83380400001)(6506007)(6666004)(26005)(478600001)(52116002)(1076003)(186003)(6512007)(2616005)(38100700002)(86362001)(38350700002)(36756003)(66946007)(41300700001)(66556008)(66476007)(6486002)(8676002)(6916009)(316002)(2906002)(8936002)(5660300002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+OYGGSwRdmoNzZqRgIsl2mg5CkuLos6YCrJ2nJ+jCJvWK6eCo7wgiunwkLA4?=
 =?us-ascii?Q?HooALoUQ6X7DhdhCMmi3EglSWPJApMsb0IMrbCipEyh5oH1cXuqYFtfCylyB?=
 =?us-ascii?Q?QYwzOO3LbL5yr6SGd/6gsO+xScbz7a8SDfeCF3Obp4h8YvIDqWfM38oC65Oi?=
 =?us-ascii?Q?9DRjiyXnrQmyeIpZRneY3q+6QOEr70zBlkgPrJlaknC5mWscQpP+VFGeim9H?=
 =?us-ascii?Q?Y9GGgdo4kpLFzAm4+3HroDIf4G5WmjCsXgIMh56Odazz5rMVfXQoqHWmo+jw?=
 =?us-ascii?Q?ourHoKr58t1VjaSxjf2CQF+eS5dKlraYXEnCiIQT2qGyw3UDHKTaZzY3GL4b?=
 =?us-ascii?Q?/25ZfYqZHZ4rbMS9cfNsAfbzVvceUpwe/KaBoa6NCSMNAy5KjFyNhoAOQhXw?=
 =?us-ascii?Q?zcPiDn/TshcMq12c30pGWqROMp1AlDUfu0tfgSx7v874xJMB54jAGN7D0dO1?=
 =?us-ascii?Q?pINqUdDeEEil/nhhWAzkz5/Ji04SS3iZF7NlH2SO6eeN1zMgyuPyETIoLZ/O?=
 =?us-ascii?Q?/aeNZpi9uv/xQ2XzF77XsgaGb9P14EDO2U4uKdeFGFY8GWV7AQWQ1BZMhuP4?=
 =?us-ascii?Q?nkg0C1JlszEumQzca2AcWtCdl6mW+d39GnoWlMXE/oue1pAtfaL8Tu1k9jAP?=
 =?us-ascii?Q?ysz/WXeOmUU77Vu5ThyH9V9mAYfb5JCysHzLr8clao+b0hqqK4kgK7aYzzhh?=
 =?us-ascii?Q?SBD6h3/xYzkquXzH128vL2zrkvehzHM15kUlpOnBE5YiryIDt4qmp/Xb/Xpr?=
 =?us-ascii?Q?DBaROYiFAkdSrqWIe9rJyfU0/gDG8YRS+wZyjSEY+I2T9xJ6/V34vTfcR5Bl?=
 =?us-ascii?Q?N2pOF2K3MaVVTh98omTeLrH5sc+N7+whVyyTVjbCY4hNrIaaykeeE4aR+x6c?=
 =?us-ascii?Q?uC9PYFdbBusbpRH8OkdVFnlT0xmTAT/qsBzuuJ0GGaB7bBNxFNkSK3p92LTI?=
 =?us-ascii?Q?O0DYiDEQ05PjiE0j0VkGNeQyCZXCvXJpo7/cMZ1Q8TqwOFWVLcq8b2dPRBO/?=
 =?us-ascii?Q?/usdGMW2LpRUpadgllMUEPFyYRE6VST1mFG76o6utxp4QTzyNEprAn9x8bLt?=
 =?us-ascii?Q?oE3sgD7gSpCfr23OfYTeSYNzO516vC5YNbJlIOFgzcl2ZgokyA8w5z5DnNL+?=
 =?us-ascii?Q?NuNw68p84P+xqweutUpRGlA1mYjfhj3vCyPU6bR3zm/ONJw5r5W8QnucqJHP?=
 =?us-ascii?Q?OljLbqGDHlITZlr6thR3nGl4HzMOBNzD30AMg9VusY6brnslkbUjGJwFY01X?=
 =?us-ascii?Q?fx/EyA10mR/e88Zk5nDlv2xsCcM0WllBqao5GPS6gO6RhE0a4BzjhZLZ6E4q?=
 =?us-ascii?Q?Xdyc9eidh6TQINGSY6dTEoDD63JyeASiwN9cpDnwgKliPzus+4zvZr0Sn8wO?=
 =?us-ascii?Q?6ZDM4I0+6EdBql7bVs1OIwsIx2o3q7ypmehn89S01wgk1vDWW4ozK2dOiU/w?=
 =?us-ascii?Q?ZHzg7LuDRMMmtYIM5Je4wFSLvzhNcAZsDw3CjpZ+eOnDTNK94t4z3AInuqsx?=
 =?us-ascii?Q?UVvn4UT/SnFBijAPnsFylHP3H+hUfogBjsaTVj1maj8WQ3TiNUvqqAlANnmR?=
 =?us-ascii?Q?Y8cOhsIVj4pg67teKGr/derMLqa+xLRmqrv2d8KDDeUFXST5slTYtqfKMU5a?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb3b991e-55a3-4eec-32bd-08da9d4b42aa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 10:06:19.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 004clmqsYVQRmF1kLWkZtzqaq+Ef66hhY20ja5xfv9JsbBNqqOt6ajZw2jNfng6N4XJGh+iXmq8NehsNaLB2x88UtgLGYo1JICbgQ8HKhvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7004
X-Proofpoint-GUID: 0qzbNfsoKVjlxj_UpA77jniOeI8PbG0a
X-Proofpoint-ORIG-GUID: 0qzbNfsoKVjlxj_UpA77jniOeI8PbG0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=913 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Sep 2022 10:06:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98942

Compile redis with full systemd support when the chosen init system is
systemd.

Enabling systemd supervision allows redis to communicate the actual server
status (i.e. "Loading dataset", "Waiting for master<->replica sync") to
systemd, instead of declaring readiness right after initializing the server
process.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-oe/recipes-extended/redis/redis-7/redis.service | 1 +
 meta-oe/recipes-extended/redis/redis_7.0.4.bb        | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/redis/redis-7/redis.service b/meta-oe/recipes-extended/redis/redis-7/redis.service
index 36d29852d..a52204cc7 100644
--- a/meta-oe/recipes-extended/redis/redis-7/redis.service
+++ b/meta-oe/recipes-extended/redis/redis-7/redis.service
@@ -9,6 +9,7 @@ ExecStart=/usr/bin/redis-server /etc/redis/redis.conf
 ExecStop=/usr/bin/redis-cli shutdown
 Restart=always
 LimitNOFILE=10032
+Type=notify
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.4.bb b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
index cde32e414..35165923c 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.4.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
@@ -35,7 +35,10 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN}  = "--system --home-dir /var/lib/redis -g redis --shell /bin/false redis"
 GROUPADD_PARAM:${PN} = "--system redis"
 
-REDIS_ON_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "USE_SYSTEMD=yes,USE_SYSTEMD=no,systemd"
+
+EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
 
 do_compile:prepend() {
     (cd deps && oe_runmake hiredis lua linenoise)
@@ -55,8 +58,9 @@ do_install() {
     install -m 0644 ${WORKDIR}/redis.service ${D}${systemd_system_unitdir}
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${systemd_system_unitdir}/redis.service
 
-    if [ "${REDIS_ON_SYSTEMD}" = true ]; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         sed -i 's!daemonize yes!# daemonize yes!' ${D}/${sysconfdir}/redis/redis.conf
+        sed -i 's!supervised no!supervised systemd!' ${D}/${sysconfdir}/redis/redis.conf
     fi
 }
 
-- 
2.37.3


