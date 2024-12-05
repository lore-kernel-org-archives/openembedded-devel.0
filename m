Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82803E7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 12:58:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10283.1733403530199285479
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 04:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=206902e622=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B57IS9s014661
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Dec 2024 12:58:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437sp7610d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 12:58:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJXNtcmA+RgpAhQFtM3aAYmFxee/DeeHC86nYesaZkrPtZMZMVFJB4EU3Gfu8g0ITmKV5DYABJre5aM2/zZXBNg9qwX7KXp0qXcmhnUjlwSSFiOtVf520fxbCN2OwmWXdIviDIUQdepfnRxinnp4Mgcux07dJs5RlaTfZ1IBxkxTdhwq65wPbTumSstwF0ANNhZ0/WZw5XNrtFhcNCQLuJ/3mOysd5/xEa4Utd3VKj3kcnPo05t/SohCJCTOOGdLSyINdAb8Nf0vIMJrhbIawMyANNk4ascVxj6nj8DUitXMrhjr0MuZwLzPzvxHc5LyF7D9t4caCXXJG4sByIKuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLXtb3Hu/v8h3qlQQa4N36yzDSAoHovFDaoIJKp5T60=;
 b=iuI450Qs9ixo2b2p3xn/sYdnIdW66s7xoGJGB7EZV36rHYYjpVgtgWQdRTsE+WmxvIb+Jd1BIrXLD3aF+Lm9ywHNuoyMSlXtNc1HH6wKMhe9eqA/VudLqK0TV2njJA6bzUoLGGx0nTHR3K4VIhyVFD/hAXcvyPVRLFxajH4JknjTcdy1MHd7KDtRE/BdvhTxgVQSF9vTC+vCOXfbdR4gQ6pNAEUwfgaPlbj6rziJjG+tMyvTWiw6ClCruVDWKi4qIXT5o/bdq7iHlidA83THP6XcGyVek3zUizXv21JZ/bHqRPNno5juVHPU2msQhuEPlF+MTPbOYRXOWObmOyqZuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BY1PR11MB8006.namprd11.prod.outlook.com (2603:10b6:a03:52d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 12:58:46 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 12:58:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pam-radius: add recipe
Date: Thu,  5 Dec 2024 20:58:31 +0800
Message-Id: <20241205125831.3715975-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0187.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BY1PR11MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a858eaf-dc6b-4dfc-3f5b-08dd152c8e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+e/oomHFCsQwuqrHYhIU39tSVpCbAoNnJ7t917Xt7aFBnWxAbgPW+6VbLoen?=
 =?us-ascii?Q?0il4WGYpK0bjhJE58fqqEQAK5vZeTAfiM/TIwwh4W2+IasgejWHDVwFyNNzW?=
 =?us-ascii?Q?IB1/1fmOIC79PpQLiDpesLPK1HcGIJ2gktaeb4gg3YatmyEEcm1MyG4xenIN?=
 =?us-ascii?Q?D72ct7TIo48HQA16xsN/IuMSJvhjw3/k6oi1Mvf+O6s/ciEVKmObttMZaxxL?=
 =?us-ascii?Q?fCr7xW7SzssBChiWnBU+0y0pMuTWBCQWtXgq8uURSCYN9MND87J5rmThkH+8?=
 =?us-ascii?Q?vh5yxyOD2ed7hjAVYeMoZ1vMOrAEccpTTZ3BubP+JoPIZsbzefzaBsezH7DL?=
 =?us-ascii?Q?KG3ih3VK8Dcod1EljPloshAk/UyjOkeU6cHDuUaWBAEHm69ukf1wBJQjuoN6?=
 =?us-ascii?Q?sb8vovbB2UKvusGVZwscInY4vv4OOZVIoYO1xA6lI9VdkDjmV2qcT11rNaYh?=
 =?us-ascii?Q?+Or6Rlu/kmWtGxSliUs929kzB7Eo9uwQD1+fSCAs9Up9LlyzqSjsYMmAADtj?=
 =?us-ascii?Q?E+njBP4oJS7WJr1HbCNzrePzCYMQBgH6p5Yiyjdq74dLj5vV5GWjKmp36xEm?=
 =?us-ascii?Q?gjXzwWYy2yWMxWsfyvr1DxQhgZ3wyaWV3/I1i/PVbRNJYReAyaF05iyrQldk?=
 =?us-ascii?Q?90uiJwo1Pf6m0NOhmEoCfS2kp7PRz+qGOJuXuwqwoSr2aHuPzGCKlHJT5iKD?=
 =?us-ascii?Q?6mEIXYbyGDCx+ehn59UTB8DIvuATXxBUh261CCWKFrSNhJmm6fdEz1z7Z1qv?=
 =?us-ascii?Q?4fmUoK65ULnszv6Uq9+xSJu6B8rvRut698b5GxZEnm6sefsI3Umllj2ka1lE?=
 =?us-ascii?Q?O/mqdtP9Jmx/juYzKraSK+i1M1tHZ9jsgu++WQe47E18g4Yvzk9/RZPIFNC0?=
 =?us-ascii?Q?jepdNHEqZUGIwKhoPXcW7D5DyKUBF/QUAEsbPprjJvfzKL9jJ8HwZt+82nWF?=
 =?us-ascii?Q?pKP7YK25s39p/c2MfvWUmOBAMwhXh72lP6bxz46O+yRwtHb5nvAh0UpIUf6n?=
 =?us-ascii?Q?PqESNZj4rzXGknL57kaZ1wegvGS9zMLeGHQP4uvb7oQ4IVEWB2O5IwLqPo6n?=
 =?us-ascii?Q?V+jDSkSmy/ZKC59bmtbAT+Baz/H3soJvWStf2ukpzdSCG1x/JCW08Vbs7Lp1?=
 =?us-ascii?Q?7b3aO2I0vo69hbmdlcLe5xEr+Wyco80enIqaHJ7pouerRL1lHWpAiXugZOmS?=
 =?us-ascii?Q?LX6aIiRY8w43j4Rx/1fr+91KVsEGjWKhI5Djb3Me/sa594nXIvKXkDhIj487?=
 =?us-ascii?Q?IA1D8NvS/I5X6B8z/e47sjDZahKxegscBRGo6Uo1MGbIIcQbc0M4T/buTmff?=
 =?us-ascii?Q?FOcr1NwPGGPACpDMzMSVXf3XwaWaL5SqnWNd+4KdP7MSz9rIhp+zErE1paJi?=
 =?us-ascii?Q?RZ42IkvfOCbkySk1F+UbJEXwVVVAS6qsen3T4Gi63gTgNqq1rQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B/TemHd7065PfznOaF5sljbiR3hbsRvtwRTnaKmcuhWbl4e/qKY3xgDDD4iM?=
 =?us-ascii?Q?Zxi6vCYuM0yIb8hJsxCHQ7oTqCbLI1tOqcrHN5S1hA5xKd1I8CMYbbAaRrcI?=
 =?us-ascii?Q?TyqTWNrkbVLHmEhM8gs8zTWUW4PBcEQVjda2Y/AsXUReUIDwQdv9CLXiJ4m6?=
 =?us-ascii?Q?rL3SZFycfUpW1dGSU6wQPENurIoDOh+l/iiuj67rWK4cSGhigMoEq2vknyXM?=
 =?us-ascii?Q?ofp3oUhZsje5MYB2SN0OAcIROefDpP9xshgm8Ci1KNV8kep7JfAYHAu85KZW?=
 =?us-ascii?Q?4xQVg0EaDEC0MlkD6PAB6X+nsnU6oadlj486bJe2BMGdoGEECHvbW0konSyX?=
 =?us-ascii?Q?1jaXzqseTHOEhiqFhbNiN/ciMuugpFO0+CzJlJLFYdJ3xwc5heJWnvnz/eOx?=
 =?us-ascii?Q?bgsIxliB+AgmyCXQDulELcsO7KFkuGL3JARo6YzJmKgFfH1OVkkewL29FbVz?=
 =?us-ascii?Q?BrnAT5/PZR7zua39xoAOmvvRxXDPf22my3DKa88hqVvtFE3j4+IQP+bjGGlE?=
 =?us-ascii?Q?5WYMwuYTJeOx4Wi24HQ9U2VXdjreMmMCFugsjvCNkzuEyWvYccbTdUx4D8+k?=
 =?us-ascii?Q?YojX6BaljPMVOP20HUAZK4HTRF1O4zNN2jaCnrxRi8bncdKX00TnvIpmWnKp?=
 =?us-ascii?Q?K9tOrw9QQ0ZfQ2KEesb6hvWzN0QV4jQ2HtKQu1L9Cgpv53O2Cg4xNcA16KI4?=
 =?us-ascii?Q?K7FTnhjH45ykt48Xd1v56co8/ggsriH0PRKZzfPMqSqcCsvFqpJziriN+aXO?=
 =?us-ascii?Q?s7zgOI4ibzADm1PP9cARhh1UgYKbM3BSWrxFuxqx1IgTmqNYPQlPtqau8QHA?=
 =?us-ascii?Q?8s+IroZcLNOVDW1by6MxNzx5jPBoUMjt0Pmh1aJPNj95/F5hixlZ4LoUCLTF?=
 =?us-ascii?Q?PXmhTlDxH04oMB/TvOcTvMQ24os0SM40f+bUvampJWe+ay5LH7Kx72Q3TRhC?=
 =?us-ascii?Q?xCxGDCoDSmfH2Em3CSaS6dFfgfunC50r0Lyb6tITw4WtF24mCGZyzXof+FLC?=
 =?us-ascii?Q?0q0w2JVSk+zWZF0vF+M627Dk4UEbyl16HWoDZ7zR9B6GLt0ap9apb8g6/Z1V?=
 =?us-ascii?Q?VwkNr/qK4dFHDnfOCyh+Lbswdpu8rh6ncbZmDMqZHzedLtCRnHIKmkQaXZSq?=
 =?us-ascii?Q?dCygUzdvoURgejSRY7UNFd84gCE3Yb7aDnR8WfiFG4JkjQEMgnoHDngbGbmk?=
 =?us-ascii?Q?xl/wr0pSkY8EXWpHAvSXX4pMgBUXmNoUk8DwZYdFugyVW9CzWmYFIG0CaclJ?=
 =?us-ascii?Q?pUcIE3X1mCMt8uLZ0Zz8B6qhd3mWpZPSZCksahLRqed/nlnbFsq+xBmmLbXl?=
 =?us-ascii?Q?HFtDHKLy/UuFnlasJhGgm7rlD40WAqlY+xR36N2x7PHaDCTMVGCloLiVWVDi?=
 =?us-ascii?Q?SQ/3Nm8RZTLkR9YSPdRxpA1dMgaSk2vLpISoc3ZlSDwYqtPzdybaOjJIL5om?=
 =?us-ascii?Q?yDHOduSxufLGXWBEpBPPgfSINj6LYRH+Zib1Qb/8YNYMf+KpS1LpdwB00hMu?=
 =?us-ascii?Q?o/AMD5kFTK5C1jaeTqRASYnH6TVZlCoHie53A+GMesZedbJX0ygLiwbeNOv0?=
 =?us-ascii?Q?w3XJ/l3tFbuvO0kY4gEjTYGeG1ZAwER52A9X97Kx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a858eaf-dc6b-4dfc-3f5b-08dd152c8e1e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 12:58:46.5429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJso+Q7Vt1c/hmAqrU1h18BnljSCQyEcwjcEX1l0YRfHdkN9y69DqwYxWUgSHBwCrOk/rhMAI7nPKAByh9N7cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8006
X-Authority-Analysis: v=2.4 cv=Qvqk3Uyd c=1 sm=1 tr=0 ts=6751a389 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=FcTRRU_JAAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=ZHT1k9LS8aEVz82yAlsA:9 a=24chkg8mTlgNITX-x-SQ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: x5aMJAu4QQswJ-55vrO_xr5qHlP73Ata
X-Proofpoint-GUID: x5aMJAu4QQswJ-55vrO_xr5qHlP73Ata
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_10,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=889 malwarescore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412050094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 12:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114205

The RADIUS authentication PAM module allows any PAM-capable machine to
become a RADIUS client for authentication and accounting requests.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-extended/pam/pam-radius_3.0.0.bb  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb

diff --git a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
new file mode 100644
index 000000000..50a540e46
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "PAM module for RADIUS authentication"
+DESCRIPTION = "This allows any PAM-capable machine to become a RADIUS client for \
+authentication and accounting requests. You will need a RADIUS server to perform \
+the actual authentication."
+HOMEPAGE = "http://freeradius.org/pam_radius_auth/"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
+
+SRC_URI = "git://github.com/FreeRADIUS/pam_radius.git;protocol=https;branch=master"
+SRCREV="b6442c3e0147f1019990520483fa3a30e4ccf059"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libpam"
+
+inherit autotools-brokensep features_check
+REQUIRED_DISTRO_FEATURES = "pam"
+
+EXTRA_OECONF = "--disable-developer"
+
+do_install() {
+    install -d ${D}${sysconfdir}
+    install -m 644 ${S}/pam_radius_auth.conf ${D}${sysconfdir}
+    install -d ${D}${base_libdir}/security
+    install -m 644 ${S}/pam_radius_auth.so ${D}${base_libdir}/security
+}
+
+FILES:${PN} += "${base_libdir}/security/*.so"
+FILES:${PN}-dbg += "${base_libdir}/security/.debug"
-- 
2.25.1


