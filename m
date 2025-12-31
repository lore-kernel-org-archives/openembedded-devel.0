Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DFDEE6458
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 15:39:33 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87152.1767195381928888687
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Dec 2025 07:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=hq+qvbru;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=sJe9FUoC;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=6460acd53d=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220297.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BVENSrI024993
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 09:36:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=P6bsO
	YeXm3bBNawHYFNFu4PUTCpaxoCukXjn2RMZN7Y=; b=hq+qvbru//Rax5A/xSjGa
	VrgEJwwsUht7CRdhC7zSwxbbRwTKm7995afC9slNIXPOtsuJQa+oDzaHUJYFBbo1
	+F9cCR84yFi+hZkkB8yr6PAidFANWFMoahaZ+LFaD0dQ36Y8CMLrVypnV70yhOTj
	l3moXEKFaBjuPUIl9NFxP00UcpAytkBD5FAeO9Zg33dKqFXhwvGNrYCMTo0cpJcy
	Y/E6CBtPg4YhBflPbMvr5jPBSPKh8agpDEZgfnle/MMSGzW/6Uh4/jm0XYhRRNHw
	lnQ3i/xFjWQxbAN/YVhciCrrGZ1h5Opdaw5Lvf/ADS8JfMqQbZxTGLjAqxbCgcYp
	Q==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020096.outbound.protection.outlook.com [52.101.201.96])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4bc95sam19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 09:36:20 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvAKXAtZMS1pRTVetQNdKwWXpZMSR2q2npcscmZNqbM3BqHz5fnkCupD7yq6cff5pEgPleJ4x38Vo5MTzCO0T9qoW4qZqHNRWFE8L7d/4ls54zkynpPm8SEEBTRp4F1wOQhl6EYHgUHjWnNzR+pdgb2F63YaBUw3fFto/Tgt1Fe2Ejkp3/v6J3sDFPfCfU3P1cg6Jnf7/PFoxvYrpGacH9pQke9GKlKIw4SpedzVHilApAbsG8enpl248xrF45AlH0TPWGmav7/lCVZi75dJGeV2Jnm1czmqUIrPD41SOvzVjOfmGlJa9vGrGuydiWKDReUAfyyF3k4/ssNqG2Qo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6bsOYeXm3bBNawHYFNFu4PUTCpaxoCukXjn2RMZN7Y=;
 b=bUL70dyRpaSWxpdaQ0L2UR1ZBOKmqpiB1Z1gq9MHnJzqyseK0kYtlu8+nxd6aNjQIBmyca8GuVQRjai3p6RpEn9JvYkr9T03r7UfHeWlfVzvT/Mp538i8Z3Hkp/+IyywYbuWQJjMJXlPK3SZQQ/dl9H7VZrveb8SfKFzaIxt9N/7rvlJ6uhW19BNQePzAKB1umIktvCGSJOJcvNeOy9psQkDprskBhqHlQFz0jAsQSvIYfXhoTIOdS4VGak7O3w0yOThk9dGuZx90nVPgCOhC+I4T+TMY6dGE2A9xeVFd58nSV2YCtxv4MsfFGAWSGXBF6nMpNSina7/yepILCAq/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6bsOYeXm3bBNawHYFNFu4PUTCpaxoCukXjn2RMZN7Y=;
 b=sJe9FUoCUa6adUitXDkUAc9x/itvWtVJ1I5afgShyYmwBHgQz3/f6ggP5qfmcutdRX3UogZ81GzcfAx25a/EalNpOk6VAkZ70hJkbevk8iMlcIsJpIf8GV/aAAHI5hizbqcOYbbYSP/+FsYyA/y098GptHfO0kw2gp9TXPEv15Oe72LbzmYb+WcnFkkuL3MniTCQQK1ItQBezZvCJPEPsa4qWDgTt4jfIreGzIMJBhSdnpsi+1RJr7jCJbbKid7oCIUdWVdDL213WkF7p5IdySyaQG9cJY+s9saIfZlQTVx0qsRk4z3TysKo3xUECu/XiKx3fEEjMaf1TD5T3syUwg==
Received: from BYAPR06CA0003.namprd06.prod.outlook.com (2603:10b6:a03:d4::16)
 by SA1PR04MB9803.namprd04.prod.outlook.com (2603:10b6:806:4a6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 15:36:19 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::71) by BYAPR06CA0003.outlook.office365.com
 (2603:10b6:a03:d4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 15:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 15:36:18 +0000
Received: from cv1wpa-exmb6.ad.garmin.com (10.5.144.76) by cv1wpa-edge1
 (10.60.4.254) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 31 Dec
 2025 09:36:14 -0600
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 cv1wpa-exmb6.ad.garmin.com (10.5.144.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.26; Wed, 31 Dec 2025 09:36:15 -0600
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB2.ad.garmin.com (10.5.144.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 31 Dec 2025 09:36:14 -0600
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 31 Dec 2025 09:36:14 -0600
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [meta-webserver][scarthgap][PATCH 1/2] nginx: upgrade 1.25.4 -> 1.25.5
Date: Wed, 31 Dec 2025 09:36:06 -0600
Message-ID: <20251231153607.3978985-2-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231153607.3978985-1-colin.mcallister@garmin.com>
References: <20251231153607.3978985-1-colin.mcallister@garmin.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|SA1PR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: e2be7d30-8c34-4538-5fa0-08de488257b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QrNLMNJED1ldMMxAyoXL2lmd4GHUunUyb2caLlRFU3fhBW8CbAAbxyi5OJOI?=
 =?us-ascii?Q?T72HzUMEnj42mBCgxWgwuj5fH3LIGVgJk2eISlJV3C/rNPebiS4t3gnIEdw/?=
 =?us-ascii?Q?dEcbe4gKaOZpdB7tVj1gby1W3G6n4XhUmz85zkBbZC+GvuKPJP53Jr3EyC3r?=
 =?us-ascii?Q?9Fty731fXEvJlucI9Ig0lXfRAbJjPbwc6E2ITk1LnmKnV2x9ILMFaXwtT1Hp?=
 =?us-ascii?Q?qcWG8etre3Y6Ouo6uolu8SbzynqWlpahCGzaHelByJPu224iVi7BoCH+KQcn?=
 =?us-ascii?Q?EAbJ2MQb4jcd3/jAxDvk0E3R9PFCYZR/w1i8U/RsALllAS66F8XHjKmmXUg6?=
 =?us-ascii?Q?GUTgJ8DJiQ9BBNDT7CMOrqlNWm+UHz24Pd4Cfdg20vvmER3+INtNc+cIK5pw?=
 =?us-ascii?Q?3LyMUTRfEr+jhgO8ZJwwAzrth7HJ5LJ1tTcJLbw9OOFDExiB/CyhsEueDhnA?=
 =?us-ascii?Q?wy3Ks5OPA6AexMdalZmWfTwJk3rm/Ul22oRSlLPgwxpNLwLxN/Fz/UA5yxtH?=
 =?us-ascii?Q?Pk/yHpmXE+QSbecxyRo/eB60apQ53Idaks2FTBH+EXX8DXpwA6rP8IwijjnV?=
 =?us-ascii?Q?5/b9DsZLToQA5lEKoKn0M3TVcYDYyrXOxEOAeDqZn4zN2xpNCC+AijIxs+Rw?=
 =?us-ascii?Q?IL715YcCU5t1rqJbd9KJU7lcEUSKlblYhixV0UEpmMchI1aLx1JZqozu53kZ?=
 =?us-ascii?Q?7u+asYXkbuQotg+M04KwStTpd6sG5BgfSuMBv7tKNmXO98uMY/KJXmak6oUd?=
 =?us-ascii?Q?LiTuTZ18gKHvNjybVTI5OQ51Xd1wOXTKMdZ+XDyaJzfK14A7wyKgQ8yBlPtK?=
 =?us-ascii?Q?TTqSGhQvoQw5PgYOVyhnx2vdeYjLgnC0p81iNwMcyc8NdHjTN7eByL+3YRKi?=
 =?us-ascii?Q?C1FKyzrprkNxtAkp64a/6Wua8uxHWFl67YU3J+pnKconZSdpk3FPil2+G2sx?=
 =?us-ascii?Q?lgcypX3cH7J8a1yTZmE6pPDcen4LWG+/KRNKEtQH6nQOrYEnNDEwnsDrDkvQ?=
 =?us-ascii?Q?6W8idpmxAax+mViab6iAu4mYCWajDmUGj4NFJqdKzpMD+AiLyZnXwLhPNbq4?=
 =?us-ascii?Q?oxv5wAcgEQUR/ipVKi22u0JBlvuNs3pcL954rMZ2eTMlmt23wd5yqEPt1Ce2?=
 =?us-ascii?Q?E03S0lYmT98CTeIOGhgAnDROUSgRQp3pTb7EIz8uIVoV9d0fG9RQOkw+wMng?=
 =?us-ascii?Q?4JrnUg3tSCBB2WSxWiSSRhFnPJw/yt+TfXntaRcD+7cjIXihBEWzLKEOMqcN?=
 =?us-ascii?Q?tEMA1uVp/SNc4psZxSUKGKG/L/OLBAc4SPbPknTZpwp7jIgGkQ/4VgEAbcQx?=
 =?us-ascii?Q?IrYeVtMYzmRXs66QRFQVgU2vtI0GYaV5TLycOl2xxqwMziYFnLwBOk+RgG8o?=
 =?us-ascii?Q?S7Jf45KN9fFc4qxN9NPeEr+d3M7XkGr0c+Ttq45/exLTreJoFvcv2YngHebV?=
 =?us-ascii?Q?MQ/6+Z0Ic9KVHpGpsRRaeJ+uEplqKKmuiUw/wvfkQFr7F8/zCVRJvMduqhMo?=
 =?us-ascii?Q?vtNcBFQzoVW60Rsaib005rhvum7L4VgQ1LZrMPCkPUevI/m4WQrVQvFqC/sK?=
 =?us-ascii?Q?17W73+TVtnd6nGpd+dQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 15:36:18.6334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2be7d30-8c34-4538-5fa0-08de488257b9
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR04MB9803
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEzNiBTYWx0ZWRfXxwrdJI6lrwwa bQt9sa/b3kUtcxWSwWsNp1DlE+1M/+eLTowgEPpkhvcMcPXNdFk3mISPTQWnP0t+0lgxrKLPJEk l/n4mMzjzsO5l36BXcWDoaU2tQzd5tpS0OjfoVTXxNfciiSON6IDIu3eTu0q8/nRx9/EOovP0Pi
 xN7GOOO5caou1sWBlQJ7NTymgTf4wH/hmyI588ouvNLLbec7jP996w3rumoTOdlOygIEEWrRA1Q o3PUiTKEwU7ci18wfVzaLpyGKCmP6JfFaWNCIKkCHpG8PcXegIJ7xqTxE0N3zVrEO3vzuA8BNAM vmRyoKYkisBNMYrTwdkYFnK7DPJvMqIBrkO3fNeUiKySwpsE/hkkfuY9JuYXM5sVdGyZNoXbY82
 IRYPogS3vfRm6ILIbQfUIaqp1JKEmqsPP5MHgCiIbv4gpjgsV6N8PYawWu2IVPvbT6EGMggrnTI LPaZAvJyakRwEU6qE4zwvsEbshOAfrhjcJCdHE28=
X-Proofpoint-GUID: wQGfIK6j4kIzHt7vU6U7BjJ7WkxPjtdK
X-Proofpoint-ORIG-GUID: wQGfIK6j4kIzHt7vU6U7BjJ7WkxPjtdK
X-Authority-Analysis: v=2.4 cv=If+KmGqa c=1 sm=1 tr=0 ts=695542f5 cx=c_pps a=NPiivNiK8hhPJgysqx5tlQ==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wP3pNCr1ah4A:10 a=qm69fr9Wx_0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=9bLDTSi9AAAA:8
 a=NbHB2C0EAAAA:8 a=b246G4cK6kZ7vuBO_y4A:9 cc=ntf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc=notification route=outbound adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2512120000 definitions=main-2512310136
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 15:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123079

Changelog:
==========
https://nginx.org/en/CHANGES

*) Feature: virtual servers in the stream module.

*) Feature: the ngx_stream_pass_module.

*) Feature: the "deferred", "accept_filter", and "setfib" parameters of
the "listen" directive in the stream module.

*) Feature: cache line size detection for some architectures.

*) Feature: support for Homebrew on Apple Silicon.

*) Bugfix: Windows cross-compilation bugfixes and improvements.

*) Bugfix: unexpected connection closure while using 0-RTT in QUIC.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 .../recipes-httpd/nginx/{nginx_1.25.4.bb => nginx_1.25.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.4.bb => nginx_1.25.5.bb} (74%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb
similarity index 74%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb
index 5ea2f5726e..b8ab1ef59e 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
 
-SRC_URI[sha256sum] = "760729901acbaa517996e681ee6ea259032985e37c2768beef80df3a877deed9"
+SRC_URI[sha256sum] = "2fe2294f8af4144e7e842eaea884182a84ee7970e11046ba98194400902bbec0"
 
-- 
2.52.0


