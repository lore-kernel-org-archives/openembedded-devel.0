Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971D0C52D6F
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:52:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4179.1724291546363724956
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 18:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89645d55f0=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M1gd8M021641
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 01:52:25 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6vv2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 01:52:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4pIIsODI1OfezaIhrql97o5ZDATznfI/3isMPExcjaFlJ0xfPDkksjWBrwZ4utuZ20ZZS6GJWLLfdEbR0FLbo2achaR9uEm645tG9AZYXTpvVlak0+0dpu9C/Qlf8kmfCwjnC3kEKQYdrFCw6anr6mi466kK69+D66IqqWaeJHueklgHiIdBbOqxjzdrG786w+et15wOrm5eaAEZ/+layce6p2kShyW92o/skx+DTWYCyC6RpWTGPKpWhQTt6CUYxn/wp5yCvlO+k/Kt+ObFCmTpOUBnw0640taoPyvB7eh8PkoB7zYU95P/AJQObdlUmiZ55yMM9uYgGvEMmV4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9b1TrQ6HNtXKAPNR17IXBtYzKBI+ZLuftJkWvcg/90=;
 b=UFHEZRc+N+Ga1XOFZ05GM1fnhOf1fjdc/RJ8xG11PzUnjQ18s4kxLIq/qwMpuV2h0mVwo+pxfUAaubOVIe+YglWLbPh9Zka9fzIplA2nuNI+ZLiHHhZSsshvUPyXL9L5EDPdCxqs8KWM+N5ftafMlGufUtEmlcz4+KB05sov5cPXPl2F7zGLNqbWhR53+LJTu5bfDMpYyW79Uwik22GehT7ZNO+pcsWeVmS4G7irpTNq3ZCQPf5k9Purra5DLuR7UCS57NPu9v2NWlsW0VBSUJozRxFOM5P3RqX/d4LZ4HYmfw9/6wwoZxtrFIE0eRzUobCKT/jFDChh21VE7uzBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 01:52:21 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%4]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 01:52:21 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] mariadb: File conflicts for multilib
Date: Thu, 22 Aug 2024 09:52:00 +0800
Message-Id: <20240822015200.2788239-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) To SN6PR11MB2671.namprd11.prod.outlook.com
 (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b4f595-326e-42a6-4905-08dcc24d0ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wrWjCtd5STuqNMcTTnTM9sa/07/N94Aof5QmfwDMk68PhbBYoPdk56is0rIP?=
 =?us-ascii?Q?BcyYr1WXC1DZtAjSI5u1J02YwqrcgoI+VCRiwrPmDJwxOQ2yscLQHlJd19Gy?=
 =?us-ascii?Q?DOWzPcx83SUnrmnjChyzlqroU8XZ8gC5rY+90+frtmdo7YrDkIGg+t0mgbdx?=
 =?us-ascii?Q?aSTDv82xZV6HjOqzjeNF8+xBPJjvFuwgcfRnB6dx38EgG98qA1i3wOFgteXY?=
 =?us-ascii?Q?rYqMB74VrGDNNRHbA2rTlOMSdGhRMFh87PcOqi/kdCod0BcRH6w4Vp+exO2N?=
 =?us-ascii?Q?W1HmWcgZFfRrqbnRhwGMtEHskgj+YsGru/krmtOefNup85ftPftbsNrAAJC7?=
 =?us-ascii?Q?A7FvybrsNb4ndKJDgKSEHocassetw5PTi2fg1XfP5Lqj+IXyo4yg3AZeeBY7?=
 =?us-ascii?Q?KX1aNU5QmzVdn5d9cwmEvxXa7fNKFHm9e9yVxjh/tTviMc8dWUp5oZ9cJM/1?=
 =?us-ascii?Q?nMQ+kHxQceH5WBHPjx3XS3+cT4WWfrynTjS8KQyUW5BaWlezScx73v6W+HR3?=
 =?us-ascii?Q?G+l9JdJ0puCLXGFLY5ss6ahXD8EzOcP63G8vW181vhbrALDy4PSVviZ8+/LV?=
 =?us-ascii?Q?if0j3Rc42mzaRntK/UcE0TfO0AMbkPiLqUvAESC3i/HrPYshs+zfsdASGtb6?=
 =?us-ascii?Q?3mToiyhRLY+ODyw+2GZaI1o3uJAlzdE2a9cRpYnHx9g3sF1bn+djF0N6bj8T?=
 =?us-ascii?Q?zcARkIko0hNny+C3PS8wNcqEp3Wpiz5Q23fNkm/VdIfM1PG5WK3WTVl9PEaY?=
 =?us-ascii?Q?a20BXxtMUB7ycZ5aQnGJ4SnS0m21NuBROfoKKY3wafN8iYMFzdv4NTer5KNm?=
 =?us-ascii?Q?9XSmxb+m0RIgpw7kUsl4+StGe6fZclKAW48M1aZ7MxHHE2wO13s9udRbpee5?=
 =?us-ascii?Q?1q3m1BuGUBqZzsGySm3tA2+3OLij7DM9WkDG+r4vNEMSXmTlSh7YDxjQr8qI?=
 =?us-ascii?Q?CN/rd/KshthCK7oNW+lxipY4ZU8/zNzpFVrsZ87rf1cnnQpkh93DTR6HBtgr?=
 =?us-ascii?Q?JmsvzqkksAOyRvqGAWXYzvSiOWBaEDMxeLH0mqeEOU7BshqKY9Q+mzhwRxLM?=
 =?us-ascii?Q?5Cd8w17YF8Fh/LR0stJV2gPzvzGIwovXvAW8YLFEuJYfTgWHc5+SOM5eqzto?=
 =?us-ascii?Q?O/Ckj+1zlcJvjgdSXcfslR18KVJz7+1SGSDkpfKdaulnY/khfYCSSOXHlTUi?=
 =?us-ascii?Q?P90R42PkciuO8NOLvohWd0VFU5f8lU1tSNeswzsWEgP7w+JUohycfz417ONd?=
 =?us-ascii?Q?KXZTZLckvmAe56Tpi8h7t3syEVKwEjUc7zeso8kCMbXUcRXsEcqCQ3jcT2CP?=
 =?us-ascii?Q?277sIhfgevLhRAzeoGtbRnW3frBpDYrJtmvC7hgyWnjCkAmzJG/69mEOoxKU?=
 =?us-ascii?Q?sTtpvFw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4PzneF54G2Gc8tL2bbbPXnZmWHl1lyCm3FBQsmMN9ppor1/b0DJUK/88Yn6U?=
 =?us-ascii?Q?CftoUucgUxoT3vbjZXOdxvhDB3O6Od2N0ozI6S+yATg4AFCYl0nHNM9VUeRU?=
 =?us-ascii?Q?LoddZHwnEMzaUbBKGpJLK2oB6Gra/1irPxqFT+RUSXXk8fsrnFoNmTs1eqHJ?=
 =?us-ascii?Q?RGFND8LzZ/jMCoIo6jBH6sKp8ttNw3wUmZyIpWK37YuZI2+DnDVEWUHKkUZ/?=
 =?us-ascii?Q?ody/RqzaYDh8VAVj0NGdDQwL+/PhX7GDzZAkAgXieGxv2dhwGa+sKqTXbZ0c?=
 =?us-ascii?Q?rvds8pC586j6cK0u0X9t3I1Nzs/fjAn/Tp2IDPJ5aXRxwHaKWAqdNpw+shSG?=
 =?us-ascii?Q?+IYpVCU8Azr4ipRLYvqGOTugYroz48/fcmoCYJ3pOAg+fmvvFqgvxRaKOyMp?=
 =?us-ascii?Q?vpSoUdw6qyNFchE0M8u9n2i/w9Vms/awyDcnV3hcgW/GziBnGuP/fHUfCEYM?=
 =?us-ascii?Q?cyiAF4gsEerj5kFHVnF4A3HTZ9LZFU1Yqkw02rJ5PO5CJEq8WtVdG7vQkP9Q?=
 =?us-ascii?Q?v86vmE/j3aiNGRWDaJpV7lNwvQoFlYLOCg+s/v6Iaq+a6bLzuT8vPPS9gdTQ?=
 =?us-ascii?Q?AX0ecwKK3z3GdmJc++TOTH/D9eOwrLnc8URvXHyxT3kPTJdV/x6mlt6qlp53?=
 =?us-ascii?Q?6kFnnon8fU80nAnhcUpv1C7OOz71U+Ix54xy/J+jOtluzZAJV9xMX7VCDPOW?=
 =?us-ascii?Q?7XzzG9I+IlwVqgqbMDSVaCf6BWZm6O9fE0DLitLtLEqeUJjsE2eSOEB+JovN?=
 =?us-ascii?Q?E/0zLOxArd6sfZveu7rigT6rR3pMaQuWLBj5qw667aL/nNbtMJW1iRWhLcYw?=
 =?us-ascii?Q?WX6XGy6MRI+3N1yvON9la5Kjv0HErpO2+t53UMPaURyAp53/uhSO5m6oti7W?=
 =?us-ascii?Q?Ahbt6IkM7cns7l9CKwNrguNOKfQnUhsb2wqyzYImTWfUXfKHBjsUUI4D3re5?=
 =?us-ascii?Q?eJQixwr7uBl3SCeBzC0YHqyKr9blGWDZpnP++xV576M0ArKKED9NlnkkyCfF?=
 =?us-ascii?Q?Jx5s91eoi4TjK4/9+0y4ishFWYkQXXOIf8HaTZXbcJsPp77399jS9Ip1xp8g?=
 =?us-ascii?Q?DlWwGgeg71MDTBMUDFWH3Kq81FsM0bHxkQKybYtzIDhguG12mR3ZU0hcXjmC?=
 =?us-ascii?Q?knF46lPCiFQvG0sEqIX86jquyJv41YXAV3MNwsl/xZ5VkTE2kNx4/7L+XSBV?=
 =?us-ascii?Q?3pKRHHXk+odK+aWl7Hj10t6d600cza2v73ihE1CSkdH0zbXI0k4tr9eyY3RK?=
 =?us-ascii?Q?s6cdIMPGBf1XpWj7V1adbSWVmDV1VWdVGJYxHhjQAhxmhSxYGKm2FA/i1ali?=
 =?us-ascii?Q?1V7qyRi7Djv/vN5PvD4YhVlJPD9reXZSDUBQgfroYWgIZ9Dp0jZ94sP2cHWe?=
 =?us-ascii?Q?vRu+o/Z9k+hNuOFNbRBw9BnOFV7ymuRW4mrYtdTwAp8ljCMHK3FSB0qf8bwl?=
 =?us-ascii?Q?xc5FbOC/5fQKje9o3WQA5L/vdAPxdgUN+g5cDIHGRr5YnBUwqDwEL6cDGbzE?=
 =?us-ascii?Q?FAXmJEkWUzMXu0TrYWTBN7ZFjsK0iSBQrTmcY6haFy/hsURYiwTssuIR1aSY?=
 =?us-ascii?Q?rGeDEozA+vZvJ5JRbLYYhU+EulObVgDh6N9ZoLxszYK898sF533XUaQ2+xPE?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b4f595-326e-42a6-4905-08dcc24d0ff8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 01:52:21.7518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dICCgjTDfBRoIwBWwto4Bb6ebOaW6KxanKAwrlccM25r+X3gFzrSovIAYraDu0gfR60TMKKU3qycLHJd1e7l28jBraUsVSY9s5bSRx2AwYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
X-Proofpoint-ORIG-GUID: igrWgxgyxe6lM8cK7k7E3J1meL46F9DN
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c699d9 cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=Um4z8P8mbPEqFpxDQRsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: igrWgxgyxe6lM8cK7k7E3J1meL46F9DN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_17,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408220012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 01:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111898

From: Guocai He <guocai.he.cn@windriver.com>

File conflicts between attempted installs of mariadb and lib32-mariadb

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 51dd4e8d4..32a6022ba 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -33,10 +33,12 @@ UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
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
@@ -160,6 +162,7 @@ mariadb_sysroot_preprocess () {
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
+    oe_multilib_header mysql/mariadb_version.h mysql/server/my_config.h mysql/server/private/config.h
 
     install -d ${D}/${sysconfdir}/init.d
     install -m 0644 ${UNPACKDIR}/my.cnf ${D}/${sysconfdir}/
-- 
2.34.1


