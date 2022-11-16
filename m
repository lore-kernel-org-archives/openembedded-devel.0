Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA8CC433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 21:28:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1387.1668634123361080066
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Nov 2022 13:28:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aQXDNiEC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83194643dc=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AGCwWh6004501
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 13:28:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=qWgIWLIjqXCVbwy0qVP3BvP1Ta+nzerDs2QKxIdY1k0=;
 b=aQXDNiECBVJe4xJicXjC0UgSs7zItk7lCnSmgYIjPjyNJFC67mRUAfaDdaiWPmPufvpD
 vRUYrFfTVvHk7+zNjMK2h9x+75nnolspN9pFP18hGTF554xWIa3/quTtgkM3lr7m7aeL
 7n+UBQDZ8UCRHDfXpu2zvCrbPJM8/Q0zDj4BUVmnD08qntP2aoG3Ls2YvL+PgI3KeJky
 yRvnFjm6Qj51B6wX8OxPRc6/KMNJTs/gc8ibiaJaPBzAjXXUpXEucQIbbx9bKs1S4U1o
 005WaRluGCsHsQ2TFguoi+yh5xJGjEox4KvHfIJ4X1cCS6XLOOr8tppnUlwbduG9AEJj Aw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ktbvrbken-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 13:28:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diNkRaJ565oYBWVw0yQYAtK1OVOgFA0S0NYEtQ2abOm9h0qj7SAgx8t5bzQkFx5LQmU+klMKNhgUCMEPgqkz9hPqiLz7rBTVj/RAHAn43kNJQOqx6aXlVZoiPkCC5dLCp0jBxotCH5vPWKO8Rvba3KnQ42ZIAQjxu6fC1eAbnah/YnlcYJD8+rSGdLYnmaxFMhFkxR3bexYkdeiWPrUd67VZyejNzK0e2Z8/K/I6PMy/rBncI/OfoFvE7bKqps4NjsaskrvPNV/pOxltxbxFabjwph1FVkgmW0s5wuktWowdhqRPadby8qAWuyNPulcYcwPb5iqvvhggUQdTMRTbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWgIWLIjqXCVbwy0qVP3BvP1Ta+nzerDs2QKxIdY1k0=;
 b=jDkWIq6MlaA2RAqzZT/slkFuvgCzgt35a6mxErujPvhy/lr3z7EtZTRTdQrVbWVUm7fbr8pdGgHezl3GPYHunqoyFQKtjxXwt24Er8/IxUT6PoPPI4IE5anUGp61m6bVusXgw2xOg16gGcM9jTNHY45nSENqii9vEjoZWwaWE/rfvRv72CvEzAsXSvX0dYkKxOwnxDo0uU+YknUsW4+j+Xa96SkIz454CrR+GhRxF6Gz66qucfmM0WmyZs0MAvnSR6r0rHuGXokYrlZxo/HvkkaordUWbqD0pZTj+4gbqfmQ6Wss8k1uPGke9ZDRYAH8gMVC7juikhvyZseMsRrGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 21:28:39 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3f89:e405:8373:8c98]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3f89:e405:8373:8c98%9]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 21:28:39 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [kirkstone][PATCH] redis: build with USE_SYSTEMD=yes when systemd is enabled
Date: Wed, 16 Nov 2022 16:28:24 -0500
Message-Id: <20221116212824.25421-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::42) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|SJ0PR11MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: e056a798-bf66-4720-6a5a-08dac81986c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z3ZycJB0duieJ82zXMD7z9zyj1muxlF+nF9VsCtlwWrRxVmDxD1Tws5QLA/HOehdzk4wUjHC8mcuek0p57PLEqOJaIA4s9tMouG/hT54UqrtiKSRVaykyINKf8uo93zQRRDhWNUUKr75b87h5O/SUWurkk2GmZYekBlPbmvMvMLBRgolJH9zNZ+2U650afS3rMpbLrgOZ1+mAgnkVN5Nnql+1BLkBgZHyeL78y0bmyxblBeBlj61myF09CYAGCovktpo0/9sPWrIpb1d/FU5M1a9MxMH0t66cRh718cLrEwMqLpFpS6KrNXTrul9TQA66kXqnTV4s4EI7/9nJ/WIjqqud5zMO9Q91QNkUItBXgNcAkELflAX41n5xCMu4IQyUJsVhJ8ewY8KmQ0IXmHVfPdT9rgyCYiZ4jJKleGndYkecap+ugYxpDfWOOvfBD/FSmdPO03JWB8CqBfhZdDjRU/YrgFs2m0XINlD36nB43f2ilaH7rv47Pug5WLUntJwzFbtH5TpUXidimlWMXFKyJP3FgUDhrI7dbViNagISyPp87im0yLB0zfCbx9T3zpy3v4HcXor9L/hPu9uf05Bp22M0OB4rmSp51dbU1pPQ/4ug4NVD1JN9cJEsjgwxfT4Dpf9JJi6oGyFUYwwvffKgklrwWmc+BLUDXny581k5ArjPHVwxM815GcKXSpsm0yhrXQdLSLuWW2y2+2BdPrPeGhg6bChCEqDOLGtjbUQnP+f9D/VaDv8IvJT4v4Y2WpsKHVWYmpnCtihxkutSUAEWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(136003)(39850400004)(451199015)(8936002)(5660300002)(2906002)(41300700001)(44832011)(316002)(66946007)(36756003)(6666004)(107886003)(6916009)(66476007)(66556008)(478600001)(6486002)(8676002)(4326008)(52116002)(6506007)(1076003)(6512007)(86362001)(26005)(186003)(83380400001)(2616005)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HeLtmZ9b4Wa0jyZ10yBDJI9nO0OBhaHC2eBIV63KWVVwwNJZNUGedCZWPR3a?=
 =?us-ascii?Q?e78CSywAJnehwbAaZlf+Ws5B0ThUPeGOp02ubyKjYKBgTk5sv5oJF73qikME?=
 =?us-ascii?Q?Gerui9AL7Edm2xL2hI/mEZvbtU3mWeBuvTWE2WW2GRHuKVvAhZR6jjkvsqtn?=
 =?us-ascii?Q?u6TIulcx1sf9nBwTmdToQ0Q5Zze6pYPa66YAhvYS77P6Xyk2vyruFC/yjXAf?=
 =?us-ascii?Q?ZzdaO0AE8KZ9K7HwPqSYKRXg1OwsU6+tJ4j4T2pzSr7k/pdVaCWWDbqjl/Cd?=
 =?us-ascii?Q?iQeYJsFrBMdgdOApXDOINWIMIeqJOvsCqaa9kYog0EJcDF6CbfVOsiEU+eS3?=
 =?us-ascii?Q?9Xd4YaD1qsnQcAuJNzNTwgIujJfiKfrpXMqSTiz7oD8X1QGtkDjxZ1uVvamK?=
 =?us-ascii?Q?wslGEzY02GeRNlTGhfW/tnj8+7OJoY/gEBkLpe46SmUFTMarUur4EJ3Q0MHc?=
 =?us-ascii?Q?nr5J8gk1sEQ2FF97vLJ3/MV5tFu1+OV3QtBFdTBfKQb0fsNa6p318nFwlqnE?=
 =?us-ascii?Q?PGag4LoBDj9KJueKXu5wBpvBiwetl8GgFDyDA2+jTFf4KaAd8V5W6xcR3cpT?=
 =?us-ascii?Q?VTWeCnPViGITcttKCOCcdOvMQCR/53kMHw07q0VwKUynBrg8XcaUXimpxJmu?=
 =?us-ascii?Q?ssIpG3HIpCKZjcl3rN9BjSjb316E2YBbA5D0IbWLuJyOEdFhBKzHG7+bQlFV?=
 =?us-ascii?Q?xSPeQmWhFYXr3l650fj4iDGJ37bLDh7RYlesbVtH4eqxMYWyohqaIJatUE9i?=
 =?us-ascii?Q?lNSqACuj+dGRCcB6eCiJXfeOEqy9wTNmovjLOC+UJDqjLM6+Rq2uXXrQlrYL?=
 =?us-ascii?Q?MPyTEcRC0eWzwieJ+YWtZl2JIShrrH3IUZlXikfEs89043gj8KlyMSH0wVmX?=
 =?us-ascii?Q?gNvqEByECbYZ3sVUffn4/bjLoq0ELZL2MnVrWXxMuJ+J+T5Ho2UI3jz+rxsh?=
 =?us-ascii?Q?IraCZUpO0J0ypqc0k7TZXLn5dh4ChOAVnp8SoROlRo8BFz/6/V8/W04JQlLv?=
 =?us-ascii?Q?Z71rWM5t1p/Z1ZM8UWGYTJ0nOwz76jO2MaLD7AoBQKjuUcKlB1CyObLa0Dkq?=
 =?us-ascii?Q?c7vVIoqXIQ16fLtTAFawvtn3JC86EZbIYz96q9BLlC08P7IkgWUfnpyfrP3T?=
 =?us-ascii?Q?7RS4V4MZPVZ5pEHD+gMoYOA0RPn8mQ3RKRBTiIBYAk7tkIOahl55vcgTRwLa?=
 =?us-ascii?Q?jRsB1eQvhJt0iM144LjRSlw4+L9KaQjOizpzcM9fLed0AmvWE1BVhxGpfv6o?=
 =?us-ascii?Q?TkDKFH17rafhKdALfOxGp9TcjXegaAxcHcQ/MGM+VVhfWtSZ4aabYCfLfLdH?=
 =?us-ascii?Q?s03d2EEDeidPQTizkwR/P7gPDo1sa9sRFEm9I+WnV9K81STf0SEBTLyP3pFN?=
 =?us-ascii?Q?egzV8LWrASC5eVmRew4KE1rh6yLZZh9ca6WD+yK2GZXKAyWXGldXtbf59rXx?=
 =?us-ascii?Q?fd7EJT7TfaAqB8X5DtSTLxrUDgPTQzHtj+8EXsoiDMsovltMlagNKF2uoxLu?=
 =?us-ascii?Q?WrGQGau5lcwcuYmDdJF82OqrPmwlSEWxBT/DSwpwkQjoGW8ncorrGOeSrk1+?=
 =?us-ascii?Q?rayK6xrmX2+PVI2IjsAinGKxWZOjQnWixaHInrIxZuqwKqGCr8kOM4MPd92g?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e056a798-bf66-4720-6a5a-08dac81986c5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 21:28:39.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kV3bQMuC3LEWgBAQxqB+u03f5owWcMlgSL6Pa4UWe1mqAYrmZ1WOMXWEOPpwsOipG2ymuTYkSd6eHt/ZN7z4/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
X-Proofpoint-ORIG-GUID: YLlwUt_bmDm65kgbKZhyZSyjr0dMkacE
X-Proofpoint-GUID: YLlwUt_bmDm65kgbKZhyZSyjr0dMkacE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 clxscore=1011 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=892
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211160146
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 21:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99597

Compile redis with full systemd support when the chosen init system is
systemd.

Enabling systemd supervision allows redis to communicate the actual
server status (i.e. "Loading dataset", "Waiting for master<->replica
sync") to systemd, instead of declaring readiness right after
initializing the server process.

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
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
index 993ff34b1..6eb657376 100644
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
2.33.0


