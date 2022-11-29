Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576BBC433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 17:11:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.156279.1669741883495137506
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 09:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iTlJ1ihH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9332dff202=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATCuQSV012919
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 09:11:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=jsi6qyXGajOxVIfTOFjpjqjja2H+3VskivbOPLLdUb8=;
 b=iTlJ1ihHf6YTBk+iQcgOmr05OPCXIfZJgHwsqL14pEXhEqxkQLsrljQnGQ9yfI+GjhqN
 G479465c/pNOy8hHUq+wTpNEc0BD/BjbDHagBT8wm+qzQvnzeO5j+r7JYZ75T6eC9Rll
 TSWmswWq7Ru+9xM9hM5lYqIvRAHQUSEaDh+YiTNg1CvwLz5Le+7k5AKHFHG4XgvmSU20
 Lq4ru+MXs40CILBKj9jxcKSrU7fVnPCmWjeUYuHTsRV1yGT1/5xJ4X0JAdpxK/HdNG+y
 BBlEeGcSbX6iT+mN61d8s9vU7bV54XdvtDb6tQahPAGg6phGV3clPBi+OZu9ogTCMj4E NQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3k6rabjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 09:11:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIGUR95MMG9Nhg1IBha/UqrfkMS9TQglKa+Nk9rr2VsdXxWraks1cqDU2VMzXS1N7fgF3tBGyxPy3vAibCeZjA6YkmnPYQ/A53uUwI+Mix0HWkKyxMPaC7hX7jgOYbC7L1/NNUd0eToHbYM0Aqne5O9BwyN+rHkmGbd+9CmQvQJJnuiaembDpkhuQo3XB9WU4joxm+AS5cbdDckolOBVDLKQSy8YzCh6GHfdYKQKjKwkw+nO0lIWMEWdbtjKsDXrfEXnG8yqhd2UxV8kz7syxpr2k0aD1u8QYTEecOQjsEtrJB7ywNIcyQV6Z5EmMqWu20KVUyAesgCyKAtRH+17EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsi6qyXGajOxVIfTOFjpjqjja2H+3VskivbOPLLdUb8=;
 b=GO71FQ+1MvNeOiKIAQRNnWnh/w9wT62MhkZqB75i+9EKFjUXH5aqB7LyweZJkHtzM55u8jncA4C5kNala3F99vdUF0clbgVq5vb7OGJd7O3V46sFMJB1c1ZtQLEUIJB6/lseIm+cSEU4ycZuCAsr7RRfiwCFy6l24IXTf8ekisTfNLSF0o5fboN1aKfipG3CJ59y78NgDDGZYJyA5xyKo2HbD26Es3OShGhu3Zva6Cs0SY1AimyWj917nunsdNwSz1VuudCPW6SKG8cXQ8+U61H1d8/oqWCK0Tf31YRF/rclqHGW+JgwswCvzws9PwsMDvvcYsR8u6B9OwUhQnA9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 17:11:20 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 17:11:20 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [kirkstone][PATCH] redis-6: build with USE_SYSTEMD=yes when systemd is enabled
Date: Tue, 29 Nov 2022 12:10:35 -0500
Message-Id: <20221129171035.4172587-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::43) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DS0PR11MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 87183b96-a836-4979-205f-08dad22cbc43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QCz+ikAkdY1EFgdzo9CWwjMrXfTMDr8gI7sZnmLY0orR2hkSb+hrGt5osvXejjoIjPmKMT0CrmVzkYXlI3n3AKysTNBqwN4kniG7vK+4budMO+EtZB2G7Jdbskdzoi/TgbzOP6QOVTXkF5lU5dzsLblD6LyMfpfZ8nWLGuayei6KzEVYeg0AYkN7SNYCXCHz9HfqXAjTSmX/HnFkiWFU1rs48U0hHY16i/QKzE3fuhJFAQ9QNOrXwkGTOo1l+HxZM6Hb3wo5Y3Z/ZkltB1r46CyxeT/Zrgr+F43OIwJgJq+UiF7w7i8ElxpL/zaYxbKO7ff3lEx1FCGGrrSBpPh5Q3eQOfOyzP/ffBHNtiBtAwkuT8yfVh+8y7SbrcLN6qndRmbY+G13t5TKui8+Dx1Or0jVv2wKaC1ud5DyC46RSzwVor+nfHYzWECHR2BrMre+RPnmJkfftgjiIgJ4ORyNQDenpjt8ChhujNcnVQ2jHdAyOQZvBJOdMFPQ4HQizKLWMCqcYsetWiUwDzT3cf28r6a1PD8AQFqYyL4De4uZUzRu09pb46bVDNTQpiKlz51zaxO3snZIl7l6uxxY5w7gyq/fyyMYJ4hk3jrUJjHrv/a543laqy3sUAW0LILY1zBLRImnLXtf01LEUvchc4tEgRIwyjnUOVGz8WVmmWByJGE2AWgaLa1d792m7PXqW83hKNZjzr2w3NIHrKH7Ww61tg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39850400004)(136003)(451199015)(36756003)(6486002)(478600001)(4326008)(86362001)(316002)(6666004)(107886003)(8676002)(6506007)(8936002)(66556008)(66476007)(66946007)(52116002)(41300700001)(2906002)(83380400001)(26005)(6916009)(186003)(6512007)(2616005)(44832011)(38350700002)(1076003)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Oz2l82mnfL3OfQ9a1DigewN3rN9aS0gKwwAQvaRhz4KZSYtsQagASLRW+d09?=
 =?us-ascii?Q?7J0pV4c9MWQxEXA24WRIyxvq/TEUOEWI8wKea8fbk9Ch8lAFlJnsgFV92GkK?=
 =?us-ascii?Q?OcC7ROWAlxZoQxQo0UpMU7lZ1sjBf86ZxLZYivQOEUIK7kGeVS7A5RN6PgZp?=
 =?us-ascii?Q?gsy84UWNP8pEFb0lhKsurWRLZ9ItftnnLi1DWOe8Ict3yC6lLlE+GcY53ofe?=
 =?us-ascii?Q?djkNxZU7YjWekg/b0zj2mVQPhh77HYbKtt4wuHn+9G6x9iNRk9zJIjlu9Kyl?=
 =?us-ascii?Q?v+d3a4yUshMz3JxUPU0IpbuG6YgDRE3i057o0obQUlzQGjklUnT9iwVrkqGf?=
 =?us-ascii?Q?ndUK3vawZ1ytJgHgrc6/h/0nPfFM/TImFSd3PXn3OkHzFgdwRNSPBY3PDi8q?=
 =?us-ascii?Q?x2fddhrLH7TKuWjze4s0mUKPvEnm+0ukq7BfVXUzP6VwObhuR5z0p7mVrYk8?=
 =?us-ascii?Q?Ca3fvRtoYfdzzc1vfxubt1p1WcOGwkmbF6aD9FZ+A9BEDJQ5ky5PLxCL1Xpo?=
 =?us-ascii?Q?KGGLRM+GiGfhhZwT0jwVc0xtgaUJKHu67+TBTGxdxOJDDEZ7q4fsetnWwOme?=
 =?us-ascii?Q?dQif66cFvNnF3OeGX/UN/kdkapVJxlHMtiYWiuHqZ3PnE39har8UTSWh1/DF?=
 =?us-ascii?Q?0fV9bW7u4M3gGYDgg+gvz2dikgDfoRcU9v5GwWqSYLhk66J0Kf7vCCLEOjma?=
 =?us-ascii?Q?YM54gVLX2eAsSCT5dG+PqsfDzQxuFqa/MymNYa5s+D1KqhVB0hiNDj8DTMJ3?=
 =?us-ascii?Q?s+jBQNnmhUZEj9rUZqgYJF/ubT4X6RDsGiqnuRGScPcCHTlEURkPveQhuU0/?=
 =?us-ascii?Q?OG5rAf3N64l9nZusFQuO8w2PgI+ShU5xI3VRs4JKnxnZX3RqVOA1+aT74oIP?=
 =?us-ascii?Q?/N37+yiDSkiVAH2xhNp0pmBcTH2g2i8cr9Al6fPugWrR3OyDGy7jJzmBN5mu?=
 =?us-ascii?Q?CzLRDoMr3afgLyrO791yvMJ7MowY8sT2opbcpe6puML0Ns0TzGDujM0XzS2I?=
 =?us-ascii?Q?uT4u697CW57MsNmazLr4AmPsvkSjv0S5DTLzFtw6rx5qIH7ynQ3q11hiG4dQ?=
 =?us-ascii?Q?38XV2IwPm4WxSSdovI5jdayHtCjjQT0UBuijCSdkheid1djyMxqUtdPMyeLv?=
 =?us-ascii?Q?aCjY1Kn8lR6+8f8r1USj9mNEyopcqIYzEcBnhBkZ0Kh011TlpN6Qzsc/nWyF?=
 =?us-ascii?Q?2fbMqnsB2MXOBAn30TsswZzbm1DCZd9oKQClu9SBd9syJ+BQlIAcXE7ss7aF?=
 =?us-ascii?Q?6dC2Xxgqf6ZTnaARnzG0MeV2Kwsr5/Hl+PC4IpSvLrjJLvkHR8zRYd8TimVN?=
 =?us-ascii?Q?fSjAmwrcyUKSqD9OCmWqdMxLzRwjNu7Q8Wn1zc/q8iAf5CIcVQxy2yuJiTHU?=
 =?us-ascii?Q?bnzrf8bR8fjnan9CyiTxJ98SLwfPkNu1H7VSzyHLln6qeOEa18UZnqPyXiEg?=
 =?us-ascii?Q?scHroumnBB+bYFpOaPVXFGWo413zL0ni54MVKf4ShIJ0L9jDK+IfQBtWhPba?=
 =?us-ascii?Q?SpUkPL3N+2uNPsOF6X79U/yaTsLflTcWpiCTp/rAD11tWKl+32x0Dq2DOEjt?=
 =?us-ascii?Q?5eOfS3eY/E4NX4qqn1I2xSr2D0/Bg3jv69T9Qzo4hduqLmbXosh0OZTpsAkU?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87183b96-a836-4979-205f-08dad22cbc43
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 17:11:20.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pjMWcr4tCapZzWCYH4BsiXfkxBb/m6HvRYndqK7f+YqOJuBIPNRd3O5lGHDZmz68K9Xr4MooLarYfof8LqJKnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
X-Proofpoint-ORIG-GUID: vOoenFGWSFuXtVj5ayYZUqCHAhpkZI8I
X-Proofpoint-GUID: vOoenFGWSFuXtVj5ayYZUqCHAhpkZI8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_11,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=909 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 17:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99846

Compile redis with full systemd support when the chosen init system
is systemd.

Enabling systemd supervision allows redis to communicate the actual
server status (i.e. "Loading dataset", "Waiting for master<->replica
sync") to systemd, instead of declaring readiness right after
initializing the server process.

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 meta-oe/recipes-extended/redis/redis/redis.service | 1 +
 meta-oe/recipes-extended/redis/redis_6.2.7.bb      | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/redis/redis/redis.service b/meta-oe/recipes-extended/redis/redis/redis.service
index 36d29852d..a52204cc7 100644
--- a/meta-oe/recipes-extended/redis/redis/redis.service
+++ b/meta-oe/recipes-extended/redis/redis/redis.service
@@ -9,6 +9,7 @@ ExecStart=/usr/bin/redis-server /etc/redis/redis.conf
 ExecStop=/usr/bin/redis-cli shutdown
 Restart=always
 LimitNOFILE=10032
+Type=notify
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.7.bb b/meta-oe/recipes-extended/redis/redis_6.2.7.bb
index 7f922a4e0..e89ab20e4 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.7.bb
@@ -33,7 +33,10 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN}  = "--system --home-dir /var/lib/redis -g redis --shell /bin/false redis"
 GROUPADD_PARAM:${PN} = "--system redis"
 
-REDIS_ON_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "USE_SYSTEMD=yes,USE_SYSTEMD=no,systemd"
+
+EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
 
 do_compile:prepend() {
     (cd deps && oe_runmake hiredis lua linenoise)
@@ -53,8 +56,9 @@ do_install() {
     install -m 0644 ${WORKDIR}/redis.service ${D}${systemd_system_unitdir}
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${systemd_system_unitdir}/redis.service
 
-    if [ "${REDIS_ON_SYSTEMD}" = true ]; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         sed -i 's!daemonize yes!# daemonize yes!' ${D}/${sysconfdir}/redis/redis.conf
+        sed -i 's!supervised no!supervised systemd!' ${D}/${sysconfdir}/redis/redis.conf
     fi
 }
 
-- 
2.33.0


