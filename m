Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFA9C83F27
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:52:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4569.1753235541312966840
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9299de1fec=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N1TgRS1349883
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 01:52:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqu9juy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 01:52:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IurOznOjA0i0staBzWgcuKgp/mpG6vrAQhj4lwxj4S+9P8wE8/8U0bqZFcXMygHZ9k/AakmMDvgq1AmKh9yCQ+qBR8p/ywKwREQBOAaHJPzW+orE0fmQixC5RKC6nng+ebG1VTLXOh9ObjyeDwsle9ZOggY4eL9+ZgcXjTgHuI+1bnhZ01Uv8TM8s09j9dLSp2H0f4d4ciFDpdaAasjf//Mp0flX9ZTPOM7arhtvm08wbvO7nzSndk72eh0E/4dhQYdKxSmsQ0VLeUzM7lNCPh+Q200mHb8HR2SK5HwZdgRTByZ+25Dk8dYmVqcLpght2BweRxqnBFT7zmCa1qKdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSOS27of21skihcUNShyjcHrS2Nhs5NyDeEoafR94a4=;
 b=GFORm5U1QtHEN9ZIU5IEM/HV0bEuYbMxnlbITp0CtvSRU1m9WXxyPED0xAqk8DRvpQR/j4sG85YwBHxM3jOKZG9PBB4hoy/BxbdFeXi0NYyNQIeZEFGVRX41+A9V69iDO92Gj14rMdjIp4nL0ZfjctFbmdZTu39EW+UDPg4KtFTSQM0uuCAk3l/Nj8OBBwJSFarhpc9ooxR5Gig62Q1S0oJCuEvuSFWWyb7Tr1MabmRQle8hyl7kvD5BdHEBWzBbsirHdQB3MjpxBVwP7m52PEMCWpeHO90rHNUe2BrWDaU3sGVoAXfU8+vEWjbDCl1+UpUkXfYeP+zza9qM9xxy1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 01:52:17 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%4]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 01:52:17 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH] mariadb: File conflicts for multilib
Date: Wed, 23 Jul 2025 09:51:58 +0800
Message-Id: <20250723015158.2492694-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0025.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::7) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SJ0PR11MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: ea62d4c5-145f-4988-8942-08ddc98b8d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Da276WwpVjsaHNTykBikvXZ6XpiUA3xt+bSI9KQ3E5iIMpLuh4p9cC8FtQow?=
 =?us-ascii?Q?aP5TAtKrA1ZzhH4rVvFnx3tjoPXPQErmdv45/0gP0c9gUrdt/zgrAqM2MsTS?=
 =?us-ascii?Q?bovyw90Nz6EMGE99hPgXB94o98Ku9X5UPCa88TNMcAzhb3tK1GN/NPJSoonK?=
 =?us-ascii?Q?5nVF1zVyuijqy5DdO8HsJIDhQlEx5z+Qnu1v38FB3eeqiV2Og3oDsb+ZKgCY?=
 =?us-ascii?Q?AvoGAdOv3AaHnmHnWQl0CT6mKuatSjfh593LaelErJAMU9eLSwQG9FdNHdy0?=
 =?us-ascii?Q?0/MEAw6DaZ/dthn6s98T3WlEi8asAn4/HjF6lJZMLG9qVxGzi83JL/Dve0A/?=
 =?us-ascii?Q?gXepfaOSZGjdO8VFQWoTx8hr/ECWTr3MErBCnWGoCeDhT/Ard6nVNz2IG2V5?=
 =?us-ascii?Q?x5QzyYUOoDn/QouhuYqH/snM7s4/1DVMkYII0KCLxtfRYnfADjg23YJM7aT0?=
 =?us-ascii?Q?Rku6crPWwvVRs426hXssluFHNejn+6zbFg5B07d4sord+sYDejREWZ2HaN+R?=
 =?us-ascii?Q?Lxxo4ioRLAKgGW09dc5A29tgKQ8JIGzSsxBbKZfDT5MFp6njZscbre38Isbe?=
 =?us-ascii?Q?ah+lrf7GHegKiorvoQozmfjPAWb6SXe7kB45/QAIk+mn7SQhlg804q1dE636?=
 =?us-ascii?Q?u5gqKVJrNJfogX8hxGhrtkZsAX9DKgmMW16xHRHdyAqC6GutSMgqAGfXOUFl?=
 =?us-ascii?Q?/KJnPrM6Hpt4tjcrvaM/8YrlnVa67Ev9jxgsrY+edoXSmsshYf8r84VlnlKY?=
 =?us-ascii?Q?ISN0BOnBetAbAZ94XyXvC64r8x5OLzXpTPxO7S7UIU19Jk/6468BnV2Lnpd1?=
 =?us-ascii?Q?F/McFNe1ea0gj4SVCs20my9AuWFWrxHlALwDurp76Vzq6KJoGT2lRxXtfNx2?=
 =?us-ascii?Q?fa3maX7/rGnEM0/HT2647cWb7D9BoJNdxYH9MePtaT1HRTxHsyo8KuyCco5+?=
 =?us-ascii?Q?CCGBU7QFhgs9zGU+GFX+NUx+iQElKpc/3VTbvUTNYnXJJB6gw+1LZQdRfwBD?=
 =?us-ascii?Q?9dP3Ri82JF3FfSLzQVBUEHKXDmiSTs6DdoNYWbX3J7Zzp6opGunew8rn1ogh?=
 =?us-ascii?Q?lvWiasHkbyygi2pL+cDIYISaD03Hl1In5g/m4rIDGKiYZgutmCVq7hLzVTfh?=
 =?us-ascii?Q?lP0R99XFC8+a0p2Y/LG8RMBYx7QysAgrcUxyxNR3xv4nooeafGBhuP5pVPeD?=
 =?us-ascii?Q?5HHyV70SmvH71B+JOFT2XGutZ/nF9JhPpc6dpGSh0LObUQUUrGb2RjO+noYj?=
 =?us-ascii?Q?foQTTl9rc32xhmabS4jbJwvJSy3mL0QtTNA5z1bWm0k1/cvzCLEHSYC08HqV?=
 =?us-ascii?Q?mfXnf6xoS1ibMn8Q1a+0iXct0Nwpy4YNLonfHuW/H3h/ifWZHG1SIZqJCh2x?=
 =?us-ascii?Q?thmVXgseZvBiUYutk8N6EUj6f2jzFGiqO8ErF1KJajWZIYN8hiBQo7ddtlv2?=
 =?us-ascii?Q?3oNzqIXbZUhe0dFGh/Xq+rcluNODTyyuVqzkOaM8tdn7YiqvNgpEuQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bt35JdN7GJiiImsJHpnvPB1kU0F+/XYsrAbAC5w7YyvTzcUodGe9g1cT4lb8?=
 =?us-ascii?Q?wwFtmMMBR5OC6ZiW9NfPeiqGaVW71/JOqPmgHqP/Q9mTeQwbQ/joa1vpzHGP?=
 =?us-ascii?Q?IY/mtIrVd0QE1yvZiry/tf5PZ40OO+rJ+Jbla/wT3Exd0jc9yLwC6vfFY1Mm?=
 =?us-ascii?Q?skHBu1TnTGckbEVhQdwmC1vr9uVVIq0HN9/sURvOAh+WSAZJ0NIxjQxGwVdG?=
 =?us-ascii?Q?1vLTmB21oTpn5lgyjOx+plqGpGcn0LP+pcKElm8iydMBXwmqkEYyLGy4X1zi?=
 =?us-ascii?Q?4NjJiYl9JS4XkeTXwHm4oj9efp0YQz+qxEJFjISjwsXYppXRnYAcuDqzir2Q?=
 =?us-ascii?Q?58/Y4wS4qiGpsxT3oMfVIOKnyQ2PlWhDl3hmeFFBbdcyu6mck8TGdfof0Gm3?=
 =?us-ascii?Q?020yqAdcnwX4dADpnjlibl5UnN4XmLtz+GJc2urZhbTPDF7EajcfzHJg19JS?=
 =?us-ascii?Q?eTI0Rxy0zfo/P/BoaRP0KG4s3Xp0QZkXHexKCQRBhO8Z4XDgAZP8t5Hci/L7?=
 =?us-ascii?Q?5elOULPB29iXWF/bIwpcXX7Qk8Re+sAyK1ra+BEq0lV/5MhEdakAZJFVz+1Y?=
 =?us-ascii?Q?NIbUY0R/yAPVJSDq6eP1h8Nfa+jVB1V+Q6FCWbm2H2meKgce+E9xEirC7Bou?=
 =?us-ascii?Q?aCZ07bWRh2dixmkZDz+VaeXvD/ezDKya9ySfOWpkJ+boDQ+VxByTGIPd1kLj?=
 =?us-ascii?Q?IOrgk1lh1pJZIaJGYSIr8aOie4nTj/qLAaDvzCP9iSvlp/atW29wYDlekbCm?=
 =?us-ascii?Q?/ymLG7B4hlWyeXqZyhmPPQpOIS5KWhlt8zj6F+nuF9GxL/WsKSuc42uQB9RP?=
 =?us-ascii?Q?SrSrVQFE+9XeFNIIMNcsvd4DynDuomiqO+nLy1YSilXf2jAte9BevUmK6QZN?=
 =?us-ascii?Q?cLdcYSeYJSUYgN7SoXJUXstWBrJajN85YSRKgwk/g0XZes3hZZpBcjHGwoSN?=
 =?us-ascii?Q?Da+1hFdy+xorI7kKx9NlHldk+mfgrJv+srNPOp3Elv51exYeseEZyrD37HYg?=
 =?us-ascii?Q?lVdzOBqJ+kgaeMOOWmdzcTgk+kAHGGNFVKUWL5jjAiItgs9VVRCcxwLLaJAz?=
 =?us-ascii?Q?oEPsIl+cjF+u9hJkQcmpmkwebcBwFj9JOtx3NxIkJp6SWQV3cQdUV4F89poU?=
 =?us-ascii?Q?L3Gyz2aF4MW4QCIUyymPnJV12DB+4VhkkgqFtCuVHGZmveQhCeP/guZeUG7q?=
 =?us-ascii?Q?Axmw0nFb9T7EX/wMZ6NE8vsUzef8yITo2N3ac+uigA/mYMultQ+heekgFCuW?=
 =?us-ascii?Q?IPvvwlh5hFTBWqRykERW0k+Z6WNQ7AeWDiZPO7hwyMoSEoL3dbBdUTDq8nYR?=
 =?us-ascii?Q?gIbg3BIJ/az9jHkXA3EVMzgdz4VGQkSYKU0IqprDocCL3LKIrWvP2ueowEVG?=
 =?us-ascii?Q?JjXnBRL7WQHyRonKheHt3u19KBC9AG5EAbokJgtD5Wmsa2/8qKBvUMIul7yH?=
 =?us-ascii?Q?V7LHKedh4I78lEUAjOGmoaJ7EUydX8HHEf40XF5X/E6TDS9uIxCRNyYT+Pce?=
 =?us-ascii?Q?QPxOFPlciZGeuB0IBrvaU255YGI/ab07a0i51pg7p0zAHVEpzt+M3YaGfiwM?=
 =?us-ascii?Q?VK20TC+veUuCw7u64n/xQL/03/Ti/B4hCKZ15bo3sgabaxg5IO8w+j2Zgy0I?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea62d4c5-145f-4988-8942-08ddc98b8d66
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 01:52:16.9304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hh2Np4SLhdoIXS/0yphi6FnW8YQE6MgAyc/NCSj5wwLv1yTN0jqPTy6jNqUWCxsUw47EaFLThPU3TfrhcMv8H9NSe86zMrTFN15W0NaV3f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8296
X-Proofpoint-GUID: y0EJ9Ry3WTvcYC_-auV3WCYapuZPO4nk
X-Proofpoint-ORIG-GUID: y0EJ9Ry3WTvcYC_-auV3WCYapuZPO4nk
X-Authority-Analysis: v=2.4 cv=AbqxH2XG c=1 sm=1 tr=0 ts=68804054 cx=c_pps
 a=OYO+XWnI8e6v5MfLznXSIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Um4z8P8mbPEqFpxDQRsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAxNCBTYWx0ZWRfX7BNTYUMnl/49
 1FIT0DmWhKVaTYP8XAmKi6HUOnD8LTHOYD35MOX31/Sh4R3bHoumNpH1LyZgSwXsAy2I4sJ2ilX
 VZydIfHQYzzmJW7F7937ZfdkW+bwzyXzrNEhhQgUNSeDxMSv0WksZOtk7V0MHbfxZHszXfJt+s6
 A3qfbPEoOET1L1iBRFQ7gMH8/WQkmVrBpHWayI/CLOnmUpfvGHOJpt3f5/8UJkvBgRydOrEqkrg
 /TljtGYUOoXeRG/g/vbgQdYiVw11hqY0KlP3ba+A010Z3gW6lhyqldEV79xMHlrPYkH4RtPDiEn
 RdFvSUvkGZDJHMvwq/GrqHZdNfEQO6oAzFvSCYst12Va0pBfnKjda5QQ+UjC0BMV6ZuVq6YtVzO
 DQGGh3ya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 01:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118707

From: Guocai He <guocai.he.cn@windriver.com>

File conflicts between attempted installs of mariadb and lib32-mariadb

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(master rev: ddd322323eba44542b6b631d455e3298c50c4535)
Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 3980948859..fde5fefd6a 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -44,10 +44,12 @@ S = "${WORKDIR}/mariadb-${PV}"
 
 BINCONFIG_GLOB = "mysql_config"
 
-inherit cmake gettext binconfig update-rc.d useradd systemd multilib_script
+inherit cmake gettext binconfig update-rc.d useradd systemd multilib_script multilib_header
 
 MULTILIB_SCRIPTS = "${PN}-server:${bindir}/mariadbd-safe \
-                    ${PN}-setupdb:${bindir}/mariadb-install-db"
+                    ${PN}-setupdb:${bindir}/mariadb-install-db \
+                    libmysqlclient-dev:${bindir}/mysql_config \
+                    "
 
 INITSCRIPT_PACKAGES = "${PN}-server ${PN}-setupdb"
 INITSCRIPT_NAME:${PN}-server = "mysqld"
@@ -167,6 +169,7 @@ mariadb_sysroot_preprocess () {
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
+    oe_multilib_header mysql/mariadb_version.h mysql/server/my_config.h mysql/server/private/config.h
 
     install -d ${D}/${sysconfdir}/init.d
     install -m 0644 ${WORKDIR}/my.cnf ${D}/${sysconfdir}/
-- 
2.34.1


