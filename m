Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646981075294
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:56:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7567.1773914163604954372
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ix3UnCj3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753824cbf9=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5JhCp2348891
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=zhZwbtwuGNpeQtyQbSaHEA3pv0IhhLUyAEvS137U8uc=; b=ix3UnCj3LX5g
	aV1BajU1umh4xzu573ZraFS/oRABmxdrETa4RFhT4a4qq33OVqlgebWb7tjLHv9F
	QvyOdpjaLn+f7yJ9KBMuVCzc1cSjNRylGHxM6LnxtSFOBuq33xMbYvofI+cANe+/
	srEa+N20I2xukSKnOKafvtR2q/F1sc6AJdZcd7DmiSALeoKW/iKyxB845lv7hHpW
	nlNPlfsPrjvrxbpo5CeyevqP+xW4TQy6BlvoSsXoZ0rCclNWYymXdgO+K53LIpV4
	KN0Wsg7SxzZq4Hvwq16F8y22A/zQcDAnwmETulFgCtKXaev75bVlmuIxxiy7WW+n
	SYze14QZJw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y163vx-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itFjwkUHZONBY4m6M6VEgti4mODXFKIc46Izp7zemZ3wX4iPxPbe9qjWOT+yPGneNOOEiCf/yjJcZ65SuxHuxdOfRm1/aoNSQIGmobc2dyrLCpQ/D/tGDRl0rWlytMTMCxOCRQK+G55yo8lliZ+MG6FrKzlnMAyBt1xIpGWANreUF4KVKT7zAkptB5QspSrJEWbOs4KEnpnoXjAf+KsejsmxZayJlEqpdTxKsSJvoEMZvKDfvqXDv37fP2h4ynQ1+2R/ULVXiR6Mp3PRucgHhQr1DmRPx+dhPBqwoVobnEqOcuzoaIpkq6P0EgMDDVeUwM1Erzs/PHI3GwQF3Lz0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhZwbtwuGNpeQtyQbSaHEA3pv0IhhLUyAEvS137U8uc=;
 b=erxYZLyz3gCBbwCn3rfdvTkpQ73yXkf1wudWNknkqjNom77LdB/EMF6iXl8CyCY4WnHqMuHYRlDvL4WzJEpzdt0C6JpocEaGDiuDiZqbEOF5VdEUTIx0T/CWRpDgnuRdvl9KD5t6ZeDa6pDRHOX3cSZw2GWq8lkzK8Uvxn0A0TLm2M7D8zB/SSLla9KwgMZ5/u6ORbYvFijTOrwjk33tWnUo5z53RZJabbmD082wN/oJOLLSMQXfjHueiR5IRI3Abm79qNoddiibd2KDFiQuB41s1CtsEH/q6ejJCVt5PxHAFjkEIqNv5n+jKay4Op5rL7uLdGWVfvUVSicaOcthJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 09:56:00 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 09:56:00 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 2/9] xfce4-taskmanager: upgrade 1.5.8 -> 1.6.0
Date: Thu, 19 Mar 2026 17:55:40 +0800
Message-ID: <20260319095547.3614749-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
References: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: 8293e06c-fcc8-4f18-7e1e-08de859db95c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	8YY4mL2Ujvogf8kzcQA8Q+dNwbtJJjW/sLQtEkSBz9f0H1oubP6+fHCG150fL1h4AvLeMRvJJftdwP8c0lbsbMJZasEjxIaWufHC7pJUB10hMSyQS/xAObZtRFdpYGeeUEKWrjhPij7H/t1m1d+OI7If7tMMCkRPmmJR289YRvxy2dbQ+KzEEo0aUSd1ghvlVuChZLrl94mX0FnaQdlg0TD9Euet5FgesOGZmfG3fC84iFqFFbC5ExB2GRf26KUKgw9iyNvEXoTGhFZ6R3j/IQaTfv68ZNKEvuVki97AS97vpZbLqZsf4IVZWTMDRswWIVdTYeUIVKFM6C4AMug8RDmO+SvA0d0vY8Z9lKWKo951Y4uGFP0ThHHaWBylyzZ68VNtoazQctAtAJ9lje2TUvJQUvBjKNjNhVHtCx2RajQH1AoUKv0M0eFJL7uRjCI0/hCfzx/52Q8yYU1XgTsWMrQMG4ze92GLHZ3IHNKD8IoZt9/Shiyos5jbVvlVPInio8Xbmt/yRawTQXVeoujCN51/zzSoC4Jb8NK7dbOBlRpmM7QzqJ6078gs6Hc2G5inUinDdxSYJn8CB9L2x9PtdrTVeMPKW0nv5U3qlvC0ExC079pou187CHoOxAfUpM/ZkRRXUGp6TVAeYOkGGeu6sjFgOe/2ohvtGIc06B+S4VP6ESsOqRsTIasrgtixt7MCAl0aHGBLyQVG6FQpHljuzZeLRuFFnxVfle/+KfDUztDXJn1lYt14hRmQCCI1m92F8jYJsjE5tRVAmY/7ggp/KtsypkOU5Y+DCoJiheLXfys=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5BjE3Ce7sSZrV2IYBePy+3AF4FdRCUyXd3521EgETBCzHZsmK5VZ92qdE/Oj?=
 =?us-ascii?Q?UHv+pcd+Mo5ghoEENMV0Sv7tZj8HjQiUniIGVbDAHDwPmXFHf/yFDFkk5IS3?=
 =?us-ascii?Q?weSa1nO+U5G17X2085iGcBMnQRZ8bLKtM/zUoQK/yMDD/fu154oQqwRN+0JJ?=
 =?us-ascii?Q?ueJ8XVpfTsG5MYQkYAoG4h9a/IZkTBPMFaE995J7h8WkMybg/uTLecVA2FhP?=
 =?us-ascii?Q?YwBOgxwwsQDxkvvIWpZq7QDzXS+qAiWagn8LhRo6RCCM697XyF9X0eI68q/m?=
 =?us-ascii?Q?tB4bmLyQdOIk+GMJiZo58ZoA6EdfxNdwLdoykNdX3jXx3Tvevgk1dVmZ4cM8?=
 =?us-ascii?Q?FWZ6KXR+LkMRq5UwFwVFX35qnUDxHt/1pWVTrpYP9jgzRYavrtBJTRAiBjST?=
 =?us-ascii?Q?jvpG0opZMsw8MxQWuoh7+bPcWkMqP5i7E27qyHBRZV2IUHrrcFop9aABIOjI?=
 =?us-ascii?Q?tzZk1a6NaShfiI5DmzcWVUDyAvy27TgHbiURisLq7d7QtKHjrw15psvoUqur?=
 =?us-ascii?Q?yIO7QJiB+AKV9EiOg4OnkqKy8bmZj0OF5MGB0M6ubK4OI7Nyk1I4rRmugaP+?=
 =?us-ascii?Q?zKap/3eDCmyZfotUIlE4jebSqeWr+QdjJyXFb37rHssirLgUd1ee4JI7xNXS?=
 =?us-ascii?Q?oZoCuoYeaaeEJhqIHgljE0MbxJyFn2UTeAtyOdTAq2caWTul7PIrqwGz4dDa?=
 =?us-ascii?Q?Z6rAX8JNE2NDAw3wYIN7wHIE90+yPBEQAYUaUwJExuXNv8YOM5962chmx4a1?=
 =?us-ascii?Q?0TdnYeTv7LpET4tWafaCipMNkzlSb6VU2njWzmsoRaloAb9g1CiC4xPz6oxP?=
 =?us-ascii?Q?wGUFWEseUaXPpr2Pqasa52pDgn6lvcFi14T8iJLjYuKnAcRsq492HuiVavzW?=
 =?us-ascii?Q?3Q5GODn9qmIEo1iv537YhgppflIaaTFFRH5VshT/FJsqMMVMFIFmfCbdQNJc?=
 =?us-ascii?Q?t77gr9gP7GLLbpyKPXjSWdNOf6eb8CRMSaNCmxP8N8M+qF3mjDPkMTeB1/7f?=
 =?us-ascii?Q?iVu+5qc/o4Oh8zfS8C4BcxwMNfHckzDz8YGDb0pavW/7QujYLcTGqrHDwL9A?=
 =?us-ascii?Q?IxZuvrEh/Rlxt6dtKb6I5rF7ESDoxueDvAX9mpwuzLp3ddahtKd98djE/xW2?=
 =?us-ascii?Q?Ph0nImlUtp5oug5+ZxD538j5AhfztSJL9g5mDn/PEt0xkbO+38wkk+ul+9R+?=
 =?us-ascii?Q?SzdLCqFYK/3FnHzujQqpkAiTqGSZJon2qSy+q0C37txAC3eCAjY5aj+5ZeH6?=
 =?us-ascii?Q?H7QjbVg7qk8PeFuARyPccRh7PjTJVFgdRCS+nrGUBIDj/y22UGlEfPz+ixL8?=
 =?us-ascii?Q?Yg3X09RzoIFRhk2JXrkJPOwJhtJRxijlzt5ChRsq6/61yzeh0MfILwFqXSJx?=
 =?us-ascii?Q?oD7Y6pGgLG1OSn9N1H3aIog8GyIZuOFaSoY6aM0LwMCeFDmYZ64uy8Y5Ajqt?=
 =?us-ascii?Q?X2t9VqiEk8EXAdKQZWI+5UlQk7o3QhuhU4tM0WODVKDQCxa/4IFBFnIRQjZ0?=
 =?us-ascii?Q?0DEWsI+JGpedE265H9aJ9Zi8AsQ0NpUaRD7b9G4/6TYZ59ml7iAz3DeqGy3x?=
 =?us-ascii?Q?kmxa27qu9MsAur2/nuz6pf5UTJz9QUHcs4xt4fTYwkvRbbJlT11VMN6kff2M?=
 =?us-ascii?Q?6uzDQwgh6fbgj8cQX5IViMrQ4bQFxtuYeZq2CQHr+6/t0uBzGlhM6AlnnEwd?=
 =?us-ascii?Q?qYzLKx+e/MHVUadFGuZ44RmFSd1++Y3b6ET802T7+dxFepW4iGqOCBQJh1gz?=
 =?us-ascii?Q?ST76iGvjQctZIbsaGFnEqmluVmWgnAo=3D?=
X-Exchange-RoutingPolicyChecked: 
	dF1kFPbSt1n14qCdSnIDN0RL1iaqGTb0tSEHZuLvp5hV7aSMzDJZb32QPZjU3h81JDqxoxwArQpZ8Bh/MZjvEBboE8RpJne1zmo6MsYiAJxKaBEfyYRulQjOPtgGKpmJvD/VFt9KASzSGodLcWulMspyOVuunK731L5brltdm4dTp/7NBsGAkFi2uIXWv+Z/ayE7mL0uDrFCVjWNjYjzkTmB5b2GaqfOuC1uMAXdGVF8GglbM2zYFuNn06knKRwJt83jfVTKa1dqmUYzWGKy7BKu5pmDA+Xfcsdqf22Jq8U3BxQrU3grmNwQ0z1+lGl+k0WCpULpcUH9ol/5qsU8lw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8293e06c-fcc8-4f18-7e1e-08de859db95c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:56:00.1924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiY9oKjENJ16sy5wB/KNqwV8zEForEe80gk57/imO3YinPmPx7bq3QOEECWC/mUvfaY6VMlDiC53FOvsNcVN4E8khhAMTB9t5raOPg/n4Xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69bbc833 cx=c_pps
 a=56WOIFdoL1k8+DRIoLPNvg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=WUn3wNZvFIBS8Zv0IEgA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3OSBTYWx0ZWRfX6233M94q1b4o
 W3MiOhdFFRkMZL6Ij68zzqs9+0L+sjjqWDaNQP9FY0hK/XDLVzXTgSNUj454uwROghZ8WLxgW15
 lBBEDitlMod+g2m8fyoPReLn46mcNPTTcg0UK524sL05TcEIyuwHw9Dt7v/IxytvCn8w92a66LX
 xOQKlmwiVzDkNXt8j3ba75w4bT4ebA7G1YMzNQbQMKp/ZdSK2Elx1F3KqqhJnEOF3rBTr9vngRG
 +3Aor53jC7TBRAidNCd7G1peGH58+Vld3E514xKJqdUPHSe91rsC5FXVatKeChYtliTC5v6fGIf
 A+zM4Ns5MgBefmQnGeBeOaUtUP+FXvnSePgZYX2QOnPNkuhDYXgXcZEkiIXU/vbO2EaBImC52+Q
 xj86rPNIQ9/jo25izzNHwf8M2w8Ljl2gt/R4MNQAZYx3x2W+1S6rWpxPeiMvvqSLG9XllDPHHov
 EeGQalb3ruhb9MRUeeg==
X-Proofpoint-GUID: 5v-FndfofN-M7BRkKmqTFk8yOLNnf8qy
X-Proofpoint-ORIG-GUID: 5v-FndfofN-M7BRkKmqTFk8yOLNnf8qy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125383

From: Zhang Peng <peng.zhang1.cn@windriver.com>

1.6.0
======
Meson has been added as a build system in this release, and the
associated archive has been generated by 'meson dist'. Although
autotools has been retained for the time being and can still be used
via 'autogen.sh', meson is now the preferred build system, and
autotools will be removed in a future release.

- Update README after switchover to meson
- process-window: Fix wrong use of g_signal_emit_by_name()
- Fix process window being destroyed when status icon is visible
- Remove manual registration of resources
- Unify gresource files
- Add support to Meson
- build: Add missing dep flags
- Translation Updates:
  Catalan, Croatian, Hungarian, Occitan (post 1500), Polish, Russian

https://gitlab.xfce.org/apps/xfce4-taskmanager/-/tags/xfce4-taskmanager-1.6.0

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...ce4-taskmanager_1.5.8.bb => xfce4-taskmanager_1.6.0.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.5.8.bb => xfce4-taskmanager_1.6.0.bb} (52%)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.8.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.6.0.bb
similarity index 52%
rename from meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.8.bb
rename to meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.6.0.bb
index 6490e087fb..e367326db9 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.8.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.6.0.bb
@@ -3,8 +3,11 @@ HOMEPAGE = "https://docs.xfce.org/apps/xfce4-taskmanager/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
 inherit xfce-app
 
-DEPENDS += "gtk+3 cairo libwnck libxfce4ui libxmu xfce4-dev-tools-native"
+DEPENDS += "gtk+3 cairo libwnck libxfce4ui libxmu"
 
-SRC_URI[sha256sum] = "14b9d68b8feb88a642a9885b8549efe7fc9e6c155f638003f2a4a58d9eb2baab"
+SRC_URI[sha256sum] = "29bdc7840ab8b9025f6c0e456a83a31090d1c9fd9e26b359baa4a4010cfb0b90"
-- 
2.50.0


