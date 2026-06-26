Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DE3C43327
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 16:23:48 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38966.1782491020277397444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 09:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OKwZ+NfT;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Jg0VDeu7;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65QFhogu2047015;
	Fri, 26 Jun 2026 11:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=F4vgP4iRdhrQZ
	MsHcIJEqt4iwXkTjKZgtx4aPUKg3m0=; b=OKwZ+NfTr954ZPfAE+vE5vmmhpylU
	6wGaa1RrQhrfH1iWNb6B6Pi2xtA8NBwbGWt1/NP2D02S1HYrZdW8w10T6tbc8RGJ
	kOY/hm//dW6INDS6GhMczW6i9tpHltOFMCfpH/tlEnlHiPG3nZjNknlfODX0Dsqa
	1sHJllpip/n0AoGAQodauGxHa7y//ebBjnCuIL1AxmUH1cvnnnQQRMyXS+Ys75ZQ
	cK/4OTDeQNYnIcTm8NeA3v0Ezyl7dCbO/JYTrakfToil1csitBWLWMSfO0LtUOrm
	9tjy9UtqwueRaDcWFRXv2YsS3sZRLtKuTj57g4Fk5ddZHFKewJ9U3v0JQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f1rc51q0n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 11:23:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQzOZKjZaJpid+yRooMosnfW004CyFu4PCcbozdXeLpUJlTcHy5s87k+r54HAt3JR/lhqYJCWIFwVegUD0sQz6jdn5Z/xSQfBpaIeJpKPzDRXCBKVac+SGpYrkhSabJjNCx+qhKkwxNoIb29vqKzq1A/Wclmr7M2Csnc7HWR84PfVdDBy+AXay8e36tjrmy03qaGLDRRS4E0tXmdP46N5dapFcii1lDBMKkRpvInkcLMOUJpGljenUJj3emQw+gadFUTlLTAkGgtlGvtPMXzwvoiE9zJbh2w+hFLoDo+083IaO89lA3EjenxnUcmuAPXkGA4XrgaQK1IstGOOnButg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4vgP4iRdhrQZMsHcIJEqt4iwXkTjKZgtx4aPUKg3m0=;
 b=cP0oKzRNhywRLvf4ha0ky4HA80qrEzu8zj9oimXzSTMhQBLDfAk09leK4424sMwtbxcWJLtdiTVFyLhxDBiFyMlOMPCMn/dVtkUNJtrkUfisBx0RJxy9Vg928uIMsYtq5sF0iz22u0X5rcR/dN1FeWQCsb041fKqZVuKcWeWmdA75AnQPTh84d6+P689Xku5yVeyPFTCbnr08ht/WyWSy/5YhU2giHX2mKFvlYMZDfGtfdhqVA27nA8Uxqhpd9UVteHBQPmBphSzfh5PXPOPOMcDUQrUjyfaGIubIC9T1kR0H+sRJ6IDu3TuNbsbRH6Mqxru8056Be4Sq8DT3UtTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4vgP4iRdhrQZMsHcIJEqt4iwXkTjKZgtx4aPUKg3m0=;
 b=Jg0VDeu7plamOttojFQpcmesQYQNtt84QHQqTmft9wjcJfRPC8QsOABinb/yPH1yj40voalaE2ZBwEPI0P1MJvG/+6B7i9pDB1VKwxHdyuWitglm79jYFI+1eiRIJuAitpr9GaIien5Pih52wUr+fwB6Y6Z2B5jri+53EA3AA4Y=
Received: from PH0PR07CA0027.namprd07.prod.outlook.com (2603:10b6:510:5::32)
 by CH3PR10MB7905.namprd10.prod.outlook.com (2603:10b6:610:1be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 16:23:33 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::62) by PH0PR07CA0027.outlook.office365.com
 (2603:10b6:510:5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Fri,
 26 Jun 2026 16:23:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 16:23:33 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 26 Jun
 2026 11:23:27 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 26 Jun
 2026 11:23:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 26 Jun 2026 11:23:27 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65QGNRmP1979658;
	Fri, 26 Jun 2026 11:23:27 -0500
From: <a-christidis@ti.com>
To: <khem.raj@oss.qualcomm.com>
CC: <reatmon@ti.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-to][master][PATCH 0/2] opencl-cts: update to 2026.06.18 and enforce -Werror
Date: Fri, 26 Jun 2026 11:23:25 -0500
Message-ID: <20260626162327.1416326-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|CH3PR10MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 5876f725-042f-4a39-399b-08ded39f4453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	AJTLsPdJAZzEbQyuiPV058T+NLOJbTgJrTV/ClthTAWbIQkkDvB2dNEZ9bRClGkay1IHI4GrN5uZWCgd3SKVxAyVSCmFGcXJWqbLvnpx1l4s/kTSMGiWDAZBNhjg2BzVVK/aeyfUFJ1JODWQ50a/A5jsTiROAS+yrKmDTQ/jHSaYucA40P54zUfgZ3kJ7MZ11GvHtqUX+Q1yBkYnfwMQiVIgYJgwTlHteTiQI2TenRrgkwGSCnYDkxNuyxMqV5pS8tjEV49mjlveQdRXl4tKUvc7vZAw6r8xfnQIf/c0WhvX40ZKTjAy/ItVYLY+FC1HKkW5BmrQkt8cuHkDvyoUgcPuFluzr6YwfrR8ccmu8jZ1iwlpFmJ8RNW6/D7ThlXtruclpbRi39wl72XkxGKGLOUPvL62XqTyajuL5ZcK1b1hzrju6YCSQ6c8HmwgTqKb68JAWJIXNKUewkZhKbpeygzPg9J36VRlyF2O+BgUfbuBbIJnLGNW6DQna/9laDAlViS833BOQNBHMgEG/Tx75TIkkHakudHOpOPtFq6Cm+kPGjm04Pj5X3J1wzJTS36V1cCRoM7+Ralbn71E5WtyfCcLdq0kOnoo/XJTpwOlQ04K5zBkLpp1S2kmW4eTa5bdNWFU0mWXvPiHjnoRVER3fnjlcilHNb/QBiSVpCDBp6jc7bVZX3oQjR5b0vEr04yHIREzDUUELOHzB1nN/oZMxQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wYc+TR9G8A5yRbkFNjbczh97yYf2pEVVpHnuMDhBeVZnj9pPltgdc58yKusEjinKDKIJ7c/vP5QY5X0/eXQboVCD089FCvdpRkHzrcN/zAN5hjpxDdxe0cocdHTD64kRrcnM+I8tRGk0eTvW8mPngd242kwLhNPl5CnuVrYHdGO1jjG+nIUVj17g94GssUSqSw5VdxMxImleYqbTG97g5jP26bNs0vB8XcFxulbx+xmtCBRgE2+j9hWlh7dDY+NcZUfgyuogPyedJ3puovEZXS+9431NZCb3rvmtGHL64P8TJrampJgzTlFVhnL0p6eqz/dBJjkUyNYBtSpXU2ulVxzHeAk6+AyolwZKoY6YzBbQWzZoF69mgQVNHhV7Rs+LUCosgi8G3R3fP8UsGn4C0k0fJ9CaOSy5cnE1VO9Cp3011JbdIeZS82DpWpsqvURl
X-Exchange-RoutingPolicyChecked: 
	Yq6RIYO7b8B3zVjGaQSw4ZQ4wyXBHO/BxtnHrAJmhpf18Di0c5NNYzbIYfGw1+zsUCnCnLCaOR+3rjU3eyDljwPFfHGqnZJBkuzRsBQTtklK8icOE0PxymlU+sa2j6BbcP7y3WUlM7uQ+KVTP/6612SBScBMJp1T7Aqg0ecd4D+wrO+kfpFXbWVIUUmaC9LT40VZOI8uOuItWgJT1Br6goTZHXEm2A8j5GSxRxxYy3Q2xxXT9yrZwC1drRQsgIRCTsfy2uMhSwf4PFDguVhNLp1I96gpGAc/V3ingg6paE0NA6LPCG/pV0YQhzAy4hQh7bhtx9Qenxv6GcTkoYeZcA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:23:33.2085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5876f725-042f-4a39-399b-08ded39f4453
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7905
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6a3ea78b cx=c_pps
 a=jJEkL6Umpl9hNhu6gfQ4Mg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=KuHDSteq_PTHlu79v2UA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEzNiBTYWx0ZWRfX7G1rWRZ/6eKL
 a8diceSou/sBPIswLwr7b4zf1g/9KOPYQZosrz3Wxch7l6G+Ivlnytc0vmK6vS50PW4nTkOx8+o
 sSMog3ch341jpAxBcnY7SXTRxW2jVt8=
X-Proofpoint-ORIG-GUID: kfzKLhLwBYmB1kqBJPr3HUFV7Uvgsbio
X-Proofpoint-GUID: kfzKLhLwBYmB1kqBJPr3HUFV7Uvgsbio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEzNiBTYWx0ZWRfX8LPGnL6llrEF
 a+9UUpQtisrXJ7BOLzaVj+c9QhgEyx4+WDlRP9aHecYxOJ1YiEJvZ64/yNy+j6jx/PD8arJhqUt
 NbS50X3vyjRsx2VaqGwp00lhE7nOtJBUnM+kxQQWCvAZRbr1m0ACxqoycF9wu/l3GQfGO2bFCwg
 DrBcDNIOzCmTZVWK4pqN5EuOIltTabCFfoNBQyg7QNfx2wSP+427M0FX8OJvKfCBG8N62jVDTw7
 33C3v0VRtS7k98d9UUPQyA8JLH+QYL9wBDbOMg+VGnh8yahkXS7Swxn1WjI8D3/E8+l+7sqUKvt
 rEOlyjCpFuejX/azpwDCStGVTwRbc9lDZJGt2M4EpGg8fQHLJE3FBZQQ86P2o8JMD8dEp+4AU5u
 oCIEB3CFPGqewN2E5838VfPg5GcA2Ada0wploB/EV+lxa9CSOzM7h9KuybPJ8vv1acOkZ+RjmVE
 sY9A3xyqW1bQ9BDN5Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260136
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 16:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127806

From: Antonios Christidis <a-christidis@ti.com>

Dear all, 

Update opencl-cts to the 2026.06.18 upstream release and remove
warning-suppression workarounds from the recipe.

Patch 1 bumps the version from 2026.05.05 to 2026.06.18 by updating
SRCREV and renaming the recipe file.

Patch 2 removes '--compile-no-warning-as-error' from EXTRA_OECMAKE and
drops 'SECURITY_STRINGFORMAT:remove = "-Werror=format-security"'. The 
recipe now carries five patches (submitted upstream via
PR #2727 and #2728).

Kind Regards,
Antonios

Antonios Christidis (2):
  opencl-cts: Update version 2026.05.05 -> 2026.06.18
  opencl-cts: enforce -Werror flags and fix upstream build warnings

 ...pe-mismatches-across-function-templa.patch | 209 ++++++++++++++++++
 ...st_unary_fn-Remove-unused-variable-j.patch |  40 ++++
 ...rintf-Fix-out-of-bounds-pattern-arra.patch |  32 +++
 ...002-commonfns-Remove-Wno-format-flag.patch |  30 +++
 ...3-c11_atomics-Remove-Wno-format-flag.patch |  29 +++
 ...2026.05.05.bb => opencl-cts_2026.06.18.bb} |  13 +-
 6 files changed, 348 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts/0001-commonfns-fix-type-mismatches-across-function-templa.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts/0001-test_unary_fn-Remove-unused-variable-j.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts/0002-command_buffer_printf-Fix-out-of-bounds-pattern-arra.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts/0002-commonfns-Remove-Wno-format-flag.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts/0003-c11_atomics-Remove-Wno-format-flag.patch
 rename meta-oe/recipes-core/opencl/{opencl-cts_2026.05.05.bb => opencl-cts_2026.06.18.bb} (71%)

-- 
2.34.1


