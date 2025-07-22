Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03C1C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:34:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4486.1753155234576887776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92985992d4=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56M2lvXC3178568
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:33:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqmr99a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:33:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ug7lKv4ycN9HiI1Fm0CvOzckO+kiG2hLBeofAtryDetwDVnnlpfFf3jkg0qpbL8dTSS70WRhZ6fvND3KDzf97mundvt0weOk8S5yawLsBVi9NChUYOswC8N7QtpjtZccM6GUh7ijytRgxzhd+Vn4kkDDz4mLBIbzNZRvcAIu5wjPMrnfwldyXk+ynNLUxeGR6pWvjJNfwCxBDRFAUxJtfqYNhiv0ZFLTECg1O9lBYYvET1jACM5qXB8ftsAuLp+gYvCEf1p5uKXbpvBuX2/FqqT7w9A4L3ILo9ASXrKCy5baG00lPB4Idv+mkG9PC1NOaEM5wLFhO2xBCFmv2tVyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8MGqiNI7O7Pyl5+dL4+TB2TUEJbmFjv4UIdP7UZoo8=;
 b=anVtcB26KT2IESfDz0cjgkjtP4xf7j1zMEoT4ZgpYwDKm7sCPHJuYgxic3Bko3q3GHugMTv7H/Y2o+VOktyglk9eGr/aLxG6wHi/OgkXmqBkK0CKM/Ps040xHwxK4otmlwJFv6D75Lri8XoFzfx6Uj2PIfG3r7wp0xXcoijnooo/y7920hooe0zVlX3YRkOnIS6/llbuzQqD/lddjryskYoKWLOBYzkWd47olxytdx3mrxYqYDbaTbRa7hEJSgqQfrD65BrPHHeF2l3PzaObsVgtSfWwKGlqG/JSqmhjuxFISdJNKaSYbNMCOAgXzRife13HzCeq5peGDRA8LdQ4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 03:33:50 +0000
Received: from PH0PR11MB5593.namprd11.prod.outlook.com
 ([fe80::b1e8:19fe:3f39:1bed]) by PH0PR11MB5593.namprd11.prod.outlook.com
 ([fe80::b1e8:19fe:3f39:1bed%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 03:33:49 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][meta-oe][scarthgap][PATCH] mariadb: File conflicts for multilib
Date: Tue, 22 Jul 2025 11:33:32 +0800
Message-Id: <20250722033332.3579660-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0043.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::14) To PH0PR11MB5593.namprd11.prod.outlook.com
 (2603:10b6:510:e0::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5593:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: ff519df6-c488-4e52-19dd-08ddc8d092a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S3S/YBPqUm/LnYTj+cD8z/eKRNAq5oaD5lUqoRhn+StvHPQKIJRxWtYZQbok?=
 =?us-ascii?Q?dksuzTVKHgW98BmPwUMztWzJRmgQbuTy3Z7mqd5WDc3gDp3IR9mp33S7raep?=
 =?us-ascii?Q?V8ZwT9h/Q1aRPt8XR8hQPNAlyaGY9yhaFk9gsb5JyOigzHgBS8ex4sL/O/9i?=
 =?us-ascii?Q?AW3ZuW4G3tlc0zzAZGxoPQwXLrBbnQJJilPGslF1OWnohCGQeVG90lDIYhkZ?=
 =?us-ascii?Q?cBqvwE54fu+TH43MM3Heq79Ukmpsux07eAvuzFn7rQrV2NItn+ies8gE2PCn?=
 =?us-ascii?Q?vlcc6gnS3K7Z7kZu2VOuBKi6qVY8nHsOJ+eOqCTygUzLZj+2VkQlRi+kAteM?=
 =?us-ascii?Q?4A7FQx8YoypCNLgou50BnY8RvS//tb4rKUnbVnvITvyQoUpThNSEnBxcWK4n?=
 =?us-ascii?Q?9NTRcpl62YyU9xLURHZwZ42pDUKU1earsd14Oydd5GZv3EJbV6yIpiYShoqw?=
 =?us-ascii?Q?Al+nQCEu9lqesyCH3rT2XIqK8dzmF84NbnuzM9Be3CnYJtjgcntJymvMj5Fm?=
 =?us-ascii?Q?azk9nF+RFGNsWOAbIdA4PWFlu4EAzceKj7wptJNqoRYnEgswTVe+zcbkL3H6?=
 =?us-ascii?Q?oeFSCoK84WZQt2d0EDK1eHutOWgtE934ky7sAoBOTgzHqIIF2WAZ4yLEKASA?=
 =?us-ascii?Q?P6nopblD8sWyq3i36603iLQJeJe/NJW7ALL8ExwwiSj4GJ4CTNhBnoPvbcpE?=
 =?us-ascii?Q?0ZFdzlBdaRzobPYkUNXilytLBpGHYPwspfNPvaC8GaP/V1j70x/2WarxIrCN?=
 =?us-ascii?Q?wQJk/KKYYnAsyM/Oh2kJajsNQtrQgx9Ckp6BIvWr1EooWNT7ufLykZl7VtGR?=
 =?us-ascii?Q?oZnbR5BcGV8RLdBmGwye42D+TRjB3AmzPQVrSDsg5Vx65s9kyA0jQWFT8Gmo?=
 =?us-ascii?Q?Lo+sbdrh3zoxOt2eqfEHRVR7GjfdP+EGXaQ485TNWKgSoIXGTAxmFmnsL3n1?=
 =?us-ascii?Q?R8xfOKWABj4Eww5n67UlBdqctfTTzyuxUAHXnObn7QWnG0g/bGhdioUZMSIR?=
 =?us-ascii?Q?2h0hdvxERsERir019/8Fh7SI39UhB096ODcTgzwUSNGUpHuV4cQURbm64JQ8?=
 =?us-ascii?Q?mxuaZPPWQS9NIgSENC0sFVfRax74ev7wH0duCXXaGyjoHXpIp/lYH9ArO654?=
 =?us-ascii?Q?UY0omyArsQCDg/2/plqInPoNhCb5ZVjvt9RlMhheY8WLdoq3NUbuN3qvx86o?=
 =?us-ascii?Q?47AtdETzFioUzpbr/gNd+0xS1FaiC0ZmuGDAumVD5rPitfsGbdOoUMQVZOlK?=
 =?us-ascii?Q?/6aD3/AcEtVm4zuH/Mswg0ULbYUwZnBPbiHSQ2tNz3HY6BuiqmRkX6IGQ8H3?=
 =?us-ascii?Q?Kn/LNtoyp++baz10bDRcnkPIbyEt90sCYdcvRmI39pXfJRtpWeZXW7yBDvGH?=
 =?us-ascii?Q?YbVJE0ShhzeRk7beKU9s7zI02tQFSgkFhstmkAJHuvUI/lCZ6GNCxQvxSAUb?=
 =?us-ascii?Q?fITDLRdFFFGd7FHIKEsy2UYrc5EztoJLxQGzQE6IvEpJij9Ei3Tv4g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JPR4VcJLRaHfO7x04qEZF1o69jrflDU3BVT0k/mE/XB6CiDI7vkmsJDZQH+W?=
 =?us-ascii?Q?5XRPqz7qe7Xru4pyAb0nUqKrYPqZDm9oktcvgCG6mrYzIi3sm3Vl4kGXYI1v?=
 =?us-ascii?Q?HqZgw42GynLdcy1b0EbBYRwkEfgjMZ70E6DmI83KxyxVmi3RiOYvBIKcSxLm?=
 =?us-ascii?Q?ACM4lTAq6ENLU3sy90/WIv9hhY0rSbSIC92j8Kn5LZMDdVh5WFatRPCuwAt9?=
 =?us-ascii?Q?nLjtVXkpm9lM8oDcMejH/KEfzgm/L8YYCw1uKZTqm3a6lrj21LYdyC1IPFFH?=
 =?us-ascii?Q?ugoDgxHvL49cKElDQaozdjOjCsyK9PhKBjsdvDzMBTsFb8wB4oiDdpwyHW0E?=
 =?us-ascii?Q?TPCYTk8++zh+jF6oEn/oSaNUpmyHFEvxy/8kKnJzy1yknOaOVD5+qDY4Bbuh?=
 =?us-ascii?Q?mF5T8a+ZtR6aFW0ZauuUlDl5K+Vk4xKeBF/X8OzdU+SlNLrfKmN2kmj4VNTh?=
 =?us-ascii?Q?gGx94qMtpj3sCTx73K+zBahFQ4Z/tQWeRcA+jTAI3MmmEFJrGYw4nIk/DyIS?=
 =?us-ascii?Q?zRgKPV2vapkOJj8r1cQ0dhoAeJnZ6wxbxa2sBiuYpdXdJnqS7hyzvzRrbwPU?=
 =?us-ascii?Q?rF8ZzfJpHF0tVtfDWqZLkiVtb8hKbZdYTZdknSWAS9j/HAVIOYZO3MNq8Jc7?=
 =?us-ascii?Q?a/RJCzej8Td0VcCR/vHOGw5HC8M0f3c4pQ+Q0T2dhODj/BROMmbZv+n/XWzB?=
 =?us-ascii?Q?fq8dm5F67t+Aq3ddirrNWMAlNz6LFXM0nBd3KSerm+wNtReqqWP4AkqRHtIa?=
 =?us-ascii?Q?NFuHdj+47ML/TMP7WSYkYPr/Qf1J/LUDhh3JKVMqfiXRzVPVOp4tbKo+WsEy?=
 =?us-ascii?Q?SIZro5rIpgCAHx35Fc4HfeZ4KrDq+tFY8uo34gTYlJZzGf8dgvdBIZZmmIfM?=
 =?us-ascii?Q?0HRu7DvlC/lC6RsJFecjUDaIzuPlENuA1khPtgaIQorP4b+qEJt2Dnt06xdI?=
 =?us-ascii?Q?lDcWqPoCJAtrgEe4YJO5yqNbal95TBZ7PdVlHOz2custYyVgvo6jr2JHGc3f?=
 =?us-ascii?Q?wgPmbCsVCLBuXDMEC981t+JnqpcH5qIDhmJyo2zHKMmB85fNtqmRbIVPeWOv?=
 =?us-ascii?Q?te0Xcs8nhsflNGYZ1FBun9oJx7TIPkHl8H7lp1Kr7oPrZopP4NUVnXZfyId8?=
 =?us-ascii?Q?N1OrBtqqLy5jFovzzuJu41KQkmJn7MtthNSiJ/MneEQaYmIxdm+x6N5nIQSz?=
 =?us-ascii?Q?YQXzUKOLnZpLnuiPfca1SFxoZcnoQ/n+VmWHJzsp9tsotaxfHLhRdHZPCMc5?=
 =?us-ascii?Q?oy1g3UAwY+7D6fKHw3IvoZ1eviCLcQ9ncqDDeg/8h86R8k+AaZPcVMpQoba1?=
 =?us-ascii?Q?jf7uti5J8QEpNqfr8a6uEVSqh7UekiJGGZ21HclGuJz42BuTpxY8cwu/FyvQ?=
 =?us-ascii?Q?j14ZT4STowlTgt5j8ywxI7/0KQIugQAf+wZmAR4IBuDmmcGOls+SIF1KO1gY?=
 =?us-ascii?Q?+lfZgIQVYH3Zwr1WeASKBhqB5FD0a8DGyZUo4vecEBtQEEl5wpzO7GC28Wgb?=
 =?us-ascii?Q?J31m2N1wG8+/0P+wrczqbFADh4wFSj9ZVEWCPH3FbKyZXHoX9ylw25wa5r3u?=
 =?us-ascii?Q?1jJ+yajLYx7p/wZqGKnz429/zIkwLnFUq7Bew/HH9fbiy1sz3oR9vI+xE4GY?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff519df6-c488-4e52-19dd-08ddc8d092a0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 03:33:49.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5sHspmFG5CWZvI0AP+n8xsqVTehsa6psXPDJJi1bT7Fyp4PCA1/e+PSS8p3lrwMBlwyi6pyDIElBhdc8DfykJ6cWlI4XkzsxUVUbS2picA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-Proofpoint-ORIG-GUID: w-IM2MwRkySgjHghUPJGe_dC9t9JaluX
X-Proofpoint-GUID: w-IM2MwRkySgjHghUPJGe_dC9t9JaluX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDAyNiBTYWx0ZWRfXwft0H8PI0C23
 FiR8rvityBP3KB5G9WFShkwleZ82A6Xdi/EQ5SAyayazYpkzi1hCmmrXrJGKXOFWxYW2twTQX9c
 dDNkzkAlWnT34f86Cf2O9kkxlG9/xBH5yMt4f1aGPieRT0rrnf1LTmzg7ohLneYYSDuggsFFWt3
 WKRlFP0ZgWP0zo4LgHv2uIlTotcfEo4wgo/LwzQQQe11b4FFkSQMzq1riCw4McNG0eEdQYP4Oyn
 4kJW9+nl0eSMmANaE6Q3Qbt3UXR9PGIgNaq0wNA/kCqLvcTDfXtNemlbaUTSzO0f4rqf7oIe1U/
 lXmuXEX3zC5AjCSSvPnhhWmBpIblJH4ZOqvHUbFSnJ2PTYQDFeUv1lxZRrOO4GzjDEwsRYOsfNe
 19dz9QkE
X-Authority-Analysis: v=2.4 cv=BbrY0qt2 c=1 sm=1 tr=0 ts=687f06a1 cx=c_pps
 a=HHuYzeedka8FW0L2ZmSTYg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=mzG2rHZtnscA:10
 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Um4z8P8mbPEqFpxDQRsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118688

From: Guocai He <guocai.he.cn@windriver.com>

File conflicts between attempted installs of mariadb and lib32-mariadb

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ddd322323eba44542b6b631d455e3298c50c4535)
igned-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f52947f359..abcf0b3cda 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -33,10 +33,12 @@ S = "${WORKDIR}/mariadb-${PV}"
 
 BINCONFIG_GLOB = "mysql_config"
 
-inherit cmake gettext binconfig update-rc.d systemd multilib_script pkgconfig
+inherit cmake gettext binconfig update-rc.d systemd multilib_script multilib_header pkgconfig
 
 MULTILIB_SCRIPTS = "${PN}-server:${bindir}/mariadbd-safe \
-                    ${PN}-setupdb:${bindir}/mariadb-install-db"
+                    ${PN}-setupdb:${bindir}/mariadb-install-db \
+                    libmysqlclient-dev:${bindir}/mysql_config \
+                    "
 
 INITSCRIPT_PACKAGES = "${PN}-server ${PN}-setupdb"
 INITSCRIPT_NAME:${PN}-server = "mysqld"
@@ -159,6 +161,7 @@ mariadb_sysroot_preprocess () {
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
+    oe_multilib_header mysql/mariadb_version.h mysql/server/my_config.h mysql/server/private/config.h
 
     install -d ${D}/${sysconfdir}/init.d
     install -m 0644 ${WORKDIR}/my.cnf ${D}/${sysconfdir}/
-- 
2.34.1


