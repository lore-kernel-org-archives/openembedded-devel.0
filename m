Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8AACD6E52
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 18:29:29 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.143])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12276.1780252161822196079
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2026 11:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=DiOPmdwz;
 spf=pass (domain: navimatix.de, ip: 52.101.83.143, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBzzQRUex/dwysoEgz391aOrB5AW2q4EXnVsrEGPIYbijrkeB05+8ty7FFY/pWcMh5rv77YplsfEyN7L/IbxREF73VXIK9+tFuvOy5ubsAr+0Ewmcu177yVgtASv73PZGCiIcgwq8wobNE3uipHc8PaEjLNrFOcej+MV6kqgD81VmB0tudFcLvF6ne/NXEKEj9UHKj47T9FZDFmLbXX0eEPJgkDgZKO4xKVb5nit5JwOJqCNp5MoiL43FDTNd4MneY53Q2yf8ky9b5m7w+OZzyPEvkCWWd9Y0zrdxcFEr8GCptag/x0ubj4TgqVySwlUe7UclSc8vf1WTG6Uz9hUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0q6EtXkeipt4fxphywwH2pYrP7Q0sLFd4xZTCwBxLo=;
 b=RHeh4D1xsCgi1f23EKComhwUjLhHPqjeKw3goty/BU0o7x4HJsh5s81jjlDI65NYUNtyibHv+pmiFFaMuUdJCAobodky7ZpzaeSwo7enu8gBPUcFh0PZntUxjBzpWoulCIR8j6ffdidO4NaTak3I/UTa2eot7PNKLhsQm+RSztqpEAPHfnCQI3H06x29F6FOwynRVd3/lIrO6e1mjaaB3wvJOXHJUa91/YKhguDrnudeQ41nrZKNs/lYok3/8ftCtK7Dv+VbmFo9iUEBX3DkoVPanDlwMGF3dQCTKcyLK7XmD5DrOmiQ6nMvYuPLDA9ziTBPv6nkj8PKvtp6ySdwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0q6EtXkeipt4fxphywwH2pYrP7Q0sLFd4xZTCwBxLo=;
 b=DiOPmdwz/tYXifySh0cY3ptjA4Y8u/MgpA/yq/36+AgvUeqsHHeNEIRhEigvxh6YGWCe14S8pxD+2Ne9JfxUTKfcMCp1Oam0z5ty2mHbE9WdQDvF0snWKnNP6qcIiFk7WYSbz1PilZp19g2xjgGpf+aiwSHoym4OzbLwTDYhxtw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GV2PR01MB11612.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2a5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 18:29:12 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0071.014; Sun, 31 May 2026 18:29:12 +0000
Date: Sun, 31 May 2026 20:29:11 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] ssh-audit: Add 3.3.0 of ssh configuration auditing tool
Message-ID: <2d4617d478dd063ac66e2299c5f1da3eaed598c9.1780252150.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GV2PR01MB11612:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a86e4ef-bf61-4575-0d40-08debf42832b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	0oIOe5v3U6NPakRIu3vcXwb/cYiAcjbOXNc3vLRB6ZHlaLb7mMtjLPqbGBj1r9xjxJFrOXDBUn13Q7Or2SpFuQeubHas70gPELZwbe992SopYxa5TdsBh1cpAdwNsEK++uR8AMutXEeW6FbrFK8ZVexjuZB859Mpj1KOo+er+/3XQIWYKc6OuvwcJz26Ge2hjPXmi54NSgi0qAMwds6tcoTzXdDrp9BF70QwAJbAMq3wcNKfqVrDq+D248zJWQLgMaaKIU5DgNqlgcWizd8eRXjkfOq8Dwjhp9qNAebQrBbOdxt4hjsb7/OeX1MHFTpJPg0KF/Htz1N+uRYfdPjGORQ1ycgJQoMCdujTyenVBfmQw9U9m7qz6ctfEXk0A5G9JPmSWT3+pIDxwcSzsf1qyA8hp34/PJtuhVavVrXtJ+rpIO94/yARkIT8z+lvlslvVI2TF4yatg5sgnBmMHMzgwLnY9bLY0Lr9LH6euN7N2cupfcxAFyaf220Q9AK1+7ov39NDMmUyqzqkfOW6To3xX16S0a3ask7RGh4Nch6rZIyJ1hUWpZqfkes5wkq9WG2cqQvBOKiZp9dXaDlp84E9LQm7xM4vPpnRcvRY5SK4PL56yDPDLxwzFdXBoXkFGy1vIQFWTYt4cMljKK5F7nK36NTqc14GAejEkbe3867/UxILluf17EXvZB542/RhRU6NsAgmHL54bhxK4vESzRNZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wzn08Yc5L1M1a1veGjKyNVEmsl3Pi6T1f9BxV4ziYHLDXnoPtI0t7ev8B00c?=
 =?us-ascii?Q?Qv77WfM51JvRAMdoLWw6lYyDY6ZKqPmxceqGuGNzPTNYbvIhjV91T6YtNf0X?=
 =?us-ascii?Q?Osf56iXHbTkNmfGLdiuJJlsV/ti+4kS3WEMDRufxV9eRURSEYEgtIEgpT7c6?=
 =?us-ascii?Q?9WM9k79plhmZngFGYQD5ufGD7OyrEDFhr/6mK+GhzMr0PDwYC148IMQs1Izf?=
 =?us-ascii?Q?9zbWB8h5H4thaURoXF2V1XiIj5foB++n6cvf7wm0nNOIRWUUpnMVWQFEauvf?=
 =?us-ascii?Q?aRIZORkMsx0mMIl5Jzm40ZRMblat9wpZK5cp1sNxzjqZXHTjnAeiuE6SnSr9?=
 =?us-ascii?Q?gmAi1SkomZTMsS7TqajztnG9zPRZnl0FGKfXRFPkrIHnh+Kjk1cRzRCGXRac?=
 =?us-ascii?Q?DlHxDhwMCjk8kr6maj4zwYizfG+mttEl0AdY3OTqde9ILtgyAwW5LVR4vT2Y?=
 =?us-ascii?Q?h3RvAbkYAgjG4q3W9QEgwWApGO/OPWc+ku7m9HJEk9Goul0kWv4g4yvDAPb+?=
 =?us-ascii?Q?Ty6vUSvpxFkePNgx6mEexJcv3CflOqzXYaMrwmeCfvtiGN0X8buVdxDU/rkP?=
 =?us-ascii?Q?vH4LdSbqbgja3pjPerEq5e71HPCNYUyDQ0iB1Fss7EKTVNvdIGY1DGmHI4N7?=
 =?us-ascii?Q?9HlGbWxpELvO3X02CJ5OPu1TnCPh3JR2JPPvYR4csyphv8JthwoDUQzSE7QJ?=
 =?us-ascii?Q?zgaDQD+Wo867n9Yd8ucrPB1H5dCjYQp5Gq4pVqURqViGb6xagYbXZDrD3xRm?=
 =?us-ascii?Q?Ef+/WC5lnKPcQLfVFLO6SklWOxnGouki7WE1cp53FjYx+0tr47ei6ZV0c3ot?=
 =?us-ascii?Q?QMr+SNZ0wjn5MbcKbHRESyjSrZ5nUv3J9RMU+FmNi6OPQ9+gnu9iH8TgpgQT?=
 =?us-ascii?Q?sp/HAit15scLXl9fOQ7ywG6INetPPo5AT/tx9Ut1SNTdUgDvP9Ayn674W9rq?=
 =?us-ascii?Q?FdJDGv3SWD/9EqKOMjtoGJV52A1IIx0wY6C3F4xDGQik3YC6iwsrUODERAFb?=
 =?us-ascii?Q?Arayb5E+qvlE8QHJ4I1wc4WPoWsZstfw6DGV9tWOuNF8sb/eCsgzGbUIUlyz?=
 =?us-ascii?Q?KfeDisB9sNoE6CoL4TG/opEoiwEuT7tnDeFftyDztGstqF38K+I6nAC6sEBa?=
 =?us-ascii?Q?b/AAGhkTNYw1RYWcDk9wZgFM2ywqtI+Gwt8vossQikDZPzTlvek8hGu+moX6?=
 =?us-ascii?Q?2CdNrNlSp0qXaQWaUdPcxzDHOzcEblsOfBnty1ucMdzEk6yUu2OZ2SUw+7QS?=
 =?us-ascii?Q?dx6w/Toam9+rOP3DzRxDHM/cuXNZWZ6i0yuf7SQ0Kfu4N6z5sIUq4+hlV52l?=
 =?us-ascii?Q?cYLNhpcHy3rkSudSaMJxCXnGGgcxDSOPLhfWhQRJRca8PPhvTZNVycgzh9Jj?=
 =?us-ascii?Q?Z9DquWTbZRCL8zI3fyMCMcbnqfSHOcQkrSfjtCZCW52KLjHhNQEwBmG9w70p?=
 =?us-ascii?Q?a2WKK5Pap9wK7+nYSHgVOhkOpVDG0Xo9HlfsRZe/VSv9wqjtKdi+C6Fja6FP?=
 =?us-ascii?Q?YcDxEjyKyFJQ9jsar5nfgk56Cwv/Y3Xx88VaMerHZQzkCjHJ1PFI5sJbozE6?=
 =?us-ascii?Q?ahnGdmSZHavpRaY5UUV1nQ+QT3ZivYWYFzlrQcHR2H00R3i9GHBjsR9xGFRk?=
 =?us-ascii?Q?FbKq+HSiOhTIVR+586CRoUi9qSFp4n+QpLbz1MULAmTK79Jy1n7SqZl45yHI?=
 =?us-ascii?Q?aG3+P+mO0HpTS5HUb4PkS3w/SxRYXnytAlXNJWZ7O9HXUXggxQS/9owCUK1l?=
 =?us-ascii?Q?Yi6vLfo0O5VCxwkEj3ZMvIeco2bxtVo=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a86e4ef-bf61-4575-0d40-08debf42832b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 18:29:12.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJjbx3LPvMZIOnEoezNWRXfmuDmPClBrrnoHg5BeX3nbnfKHLIoChbQlOoLGUiXpmx7HPk4lA6ZGntFbHJuPnC6BPvUkxCAsomCOupyIBSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR01MB11612
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2026 18:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127305

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-security/ssh-audit/ssh-audit_3.3.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-security/ssh-audit/ssh-audit_3.3.0.bb

diff --git a/meta-oe/recipes-security/ssh-audit/ssh-audit_3.3.0.bb b/meta-o=
e/recipes-security/ssh-audit/ssh-audit_3.3.0.bb
new file mode 100644
index 0000000000..634b7e0823
--- /dev/null
+++ b/meta-oe/recipes-security/ssh-audit/ssh-audit_3.3.0.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "An SSH server and client configuration auditing tool"
+HOMEPAGE =3D "https://github.com/jtesta/ssh-audit"
+BUGTRACKER =3D "https://github.com/jtesta/ssh-audit/issues"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8745b0cfd015df0e3199253390de893=
5"
+
+SRC_URI[sha256sum] =3D "b76e36ac9844f45d64986c9f293a4b46766a10412dc29fb43b=
d52d0f6661a5b0"
+
+PYPI_PACKAGE =3D "ssh_audit"
+
+inherit pypi python_setuptools_build_meta
--=20
2.53.0


