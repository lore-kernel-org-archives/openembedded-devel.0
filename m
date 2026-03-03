Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD8EEB3657
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 02:29:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9547.1772504937114709971
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 18:28:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=meFICcnP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7522b53711=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6232F2pm1265627
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Mar 2026 02:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=a592nGmKf2CmE+2WhToy
	dsH7ZKnrnxVdL1ecQ/nERVU=; b=meFICcnP2d0m+PdXyp/lX8XsMxLPFNmuMTOO
	qqLqZkrG8BlI4AdHCctlHJh6f0aT4VzdQEybGEQx2t0kOx2dFZ1gBn0OwTbZkYH2
	zRUAl1HFA+reV/vvK2NZYYSDE//mGP2DHr3PAwWJUpFQCHvE+CqeX7kiCqSaarOw
	bW8LFo/Yntc/Hazep0L3ybj1o0+OOz/IUAo2HZGcWbH+hlGleS0I+T2grwB4+arJ
	8BgXcYLoKfzwCrNlsVegxRL44Gt+LXrLdyZpUPODW9BqSYRfyBZ5iThy+efcQIeV
	6A2sB8WiMWZTMOOt4u+nn06MP7CM7NHBamFCXDkEex/VisWPVQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013063.outbound.protection.outlook.com [40.93.201.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4k3wn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 02:28:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqzodC8DUGWdhnQjijg0R8f303uvWdzOWCLZylBXDFfSHKJnY6s9cdziVJnNh8z6Z/9fZdl1vnTGd2ztFtS5T8j9+m2CxleksFNpTPkSPZGIeZzEOIRns1krgc0Y38MQiAbX8D+pdX5nsspP37sVQ6nzr8B5/ciuCue8XLNvDSGY/hMi5JD5fpffpsP06+q3IBSGfWvOYqMZXB5Tqd/7PVIAC968wUBsS5vUhQDzgu00zPAJr67Q/fUywCKYH/2V8LIU7nNPcIb37w8/RE+jPJcixNs6TRtMUp8AKW4dodg7+PcfuoR0FGBUJimyAZkPMBq2AXaWPEZ8N8hdehU5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a592nGmKf2CmE+2WhToydsH7ZKnrnxVdL1ecQ/nERVU=;
 b=fneodV2QSA1NKIAy6pH/7AwlhXiJSdyBisFv3fpU8HaWmxyC7rp/5jCNAkrGN+H8IU4WY7sj0JeNdynD4wEbLV9+gpkCJfxyiyeSbVgT+NeU4Di1lf3mBH/WqTMhvNqYJo5ko0FhRz3NAYT/6D6Bl3cQvcjRjKfi3G+1uCCBN5tLc2qWVmKulmbRKHbruv5o22bH8x+RWhDsGq9PfBu22iSD9FhVyo74EG61mq51jCePGhptuvxXbYDv1WXdmfoTMVzInbezpzbXDawZ7NGYolFOTcakuvgRG7hx0ecjSxeDh6lWSrqBD4QVg+5qinpVIF4FovnQAhRVniI/T8IXLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 02:28:52 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 02:28:52 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH V2] librelp: update PACKAGECONFIG setting related to valgrind
Date: Mon,  2 Mar 2026 18:28:42 -0800
Message-ID: <20260303022842.1734041-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::21) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 813e9575-590e-49b0-abcb-08de78cc9bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	iVd8jIyeW3P7Q4LMXaxXN39hLznYcE8+v6k+/AU0BcHg/KzteV4W8U3r9Wj0LDTiuq040SfhJ3O6Dl443pynkNcH4txQcTqlkpqUBmPuJvS/QO7J++fXmVSRXLeygiLS2omiGts8Lelz/Id5eYXkGGzyIAiqexAVrw2JWB3ugH2vHFuIlP1gxV+ux6PdvLmLCwTNGOIYFZU6WoQUzyvdfkCrxCXgJVmYCygKIMJFfmOt1pmRDF4NxZfTC2uifF6hyzcJuQvYYBTOnzGUpUfJPHViAlyonvWJigGI5+kYldyoVDC/Fhwzp5tSqCocikDbgVGC2v3QlwDqt0A+I8bAnfFhYVp8EFrIdx6w25q3pG7VAqmtRhYjIwKsL2MmbDjN2djMiJrus2wJHbw7gFefhZcJJ+TRQLv5nQWLaSzDFf/GzfXSIbJeM1PFmCCfmcHfi/bpRd9f3u78c2NQ52mXyYqNyAsOXxWpz8bgzdEBZACHNrTz9fk7zOz9QkDwU2kCw1Kf9cl6k7Dd5TPrweuUl35USR4btqCrqSHCbZoQqB1FYujah8uWYCYKpYNy/uWOdbtZltPxEjhmkUhQef25/aNNTL41Jv9AnQf/rcL35wJNPNm2A4tGuLAEVaYIx7h+VxGxIa/6cSNPTdiMBueEE0YTjKeTgVWgAJOCbYexHHWIuT803iOvzlOVwit+zDoziKisvJayD+YwxV+2BsfJjsAnQONOPxZ9tfmbaWTQEd4nTJ38G3p+deb4ZQgGfKpN910BGLWG8vShLkdqJ0kDmaLjkg2IqjKBZl2HH9ceWbw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cgrw5OaN9jQWKMeTjN9fOlI92kpM+Rjfs/1vjMj1P7TSnwLaxGgTLBQl94uU?=
 =?us-ascii?Q?uDpFHEX4LrhSoLOkjiuaBuvYYKe+6fJ+jUE179pDhfsJfQ8YGAZg7Xix7Ebf?=
 =?us-ascii?Q?uBL4Pnfhy2oGo5XZcEVBn4OymvCCJYQEoUoAvhZtRBNUxumXh24LImgTJgHQ?=
 =?us-ascii?Q?7kMYVFJIM6l/dX48a8FvIxLXjJ2NpWFY3P+xEeD/hxi7pTFVzKvDzqujWE9k?=
 =?us-ascii?Q?V2fjbcDxXPOAArR4UR7OmpQcJ6mU6zzUNrZsdggumn1dkfzq+B6KVlu0s2G3?=
 =?us-ascii?Q?h2L7jUyJB+YaUNL93JawVJ6s2ZB0FjKTRdCvPyPayxfHv+vQAFDiMVoZ7BRO?=
 =?us-ascii?Q?E5+QKPpk76wb2vGtQo6tgbqaobYTP2TIWE2aibFtIoLExq3doXaxNOmrwi4z?=
 =?us-ascii?Q?LZLLnH2VAjuy8aKlFluuXO7aGEMhdjQHD8Eu9fCkAzLMgsmxTOqTVDBWoGhF?=
 =?us-ascii?Q?8Bhm+X/w4uhf/qRLkhIHD4b1mdl+hVYUk7xfp1CS4Z76nJ5PTjk+tMbSE7tT?=
 =?us-ascii?Q?1AB+unBKZEJKdVsNsXwreLK37C/PV5aRpC2FlEcWp4pOndF107ioSL6k7UYz?=
 =?us-ascii?Q?Q+39cpo/vDiMxL1mBudS4yw+IWr6zboEp+HqqzzUari6SD9Hwif8Fbolfn4f?=
 =?us-ascii?Q?xq23FJj3TVZ2fu9QYo7xYN0DECbHblEW+eloa01hQQcZDkeF3Z6gOmeiJbJx?=
 =?us-ascii?Q?jvBVBCN/YUHnhb5MX6cG0cubfmKQ9fwGM1xmqSowEH6d1orGaLr3oXHjbBFh?=
 =?us-ascii?Q?K2Dd5zsPs05NpgFhJd6ehWpk3bLU8WutAe4moi3kQ+GMatEJqxtwBLCaVuZ2?=
 =?us-ascii?Q?IeGROnJWEEa4v3fS+ojPu3wLz68nJGohJru/pCLQYmtLxmpSDfo0V91kUe4L?=
 =?us-ascii?Q?suQUwI2XyZYTnjr3T1Jg6odTEdUW/nBwg1p/QM7DCVW9wusdr+kJozkFysf8?=
 =?us-ascii?Q?+cGXl1w3b85aDi+MsrXm18fvMRgCWOt7VwDLAnTXCPlaRlIIYp8WyvTGayJA?=
 =?us-ascii?Q?8pnLioPJ7wy/19Hjf+F+9v/sfNaoQ9VIe42dBqmDJ41OmRTpkbMEfDwz906g?=
 =?us-ascii?Q?aHh501rrcCGw8dyIWr9b5NUFjZriYvvcacOxKT3ZGkbmTjUdGosZv0j5k4EC?=
 =?us-ascii?Q?HG/5RSKlElq6LYA53L6YkKtl6LbAtGTdyUb36nEYmdfq2qsfH0K+tc3p0fLM?=
 =?us-ascii?Q?TL8kIcLO6aI2OtmxLXYF63i7UVcMXwaMAV9R5ytJ9Z2ZRbhNe1qZdjWsPGgM?=
 =?us-ascii?Q?vxtN3ulDuSDYGiHHmtO2Udd74KWJxQXtKHrDbxbZNO7Bq+OzYHoKaPv6BjXT?=
 =?us-ascii?Q?8XlF8AoAUS6dPDwP6zGpK7q+wJ4lu3dxeqZU5ZOvzie/NK9a7qUyNPHVgGsh?=
 =?us-ascii?Q?kkzCO0RAT2s0Sg264RTLV6eYddFm6msw7sNEZlnG0J1fv1RjkoiJNGJ1XkaU?=
 =?us-ascii?Q?r2E+NP/IFEbkfZ2JG1a5bT+QA+gFIjdq2MHIIavhDuxJRZj8qaOog5dBIbhN?=
 =?us-ascii?Q?0RmlvZYYss1VhvoO6d+gUZ4/7c9QZkdfwbMnFsh7nppVPyn4jo6o63ObiMV1?=
 =?us-ascii?Q?WIr0avymaiwfe3k9ZMu0Qn8yishPlRF49bcToe/rSXk+HQkDtQnUBEHltTWY?=
 =?us-ascii?Q?ytY9kQ4HNIoRq6I2fx50u5WqJZS9aejnktbTsh3KBdo6BYPlFN077yKfLIOO?=
 =?us-ascii?Q?oEFK2+svi++3gaQfL5brC784esA0jkPwP4fZo37WObxeB6hNFXhcN3/c8hgf?=
 =?us-ascii?Q?H/3T1eGmlQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813e9575-590e-49b0-abcb-08de78cc9bf2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 02:28:52.4444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/rYyATAIgyR6/LL78Bcl3N808mfNUWCJS5lXyD2m0k14SMszadTpETatlSYI8gdl4Gs3nrJKMID2nDSp1BR1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a64767 cx=c_pps
 a=5B7wOmkMoK/13lwMvlsh9w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=06zrz42mlFf1_MCMxTQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: TlTHRNpJjJ6SH17TV9K3Wvx4kS6uK9ay
X-Proofpoint-ORIG-GUID: TlTHRNpJjJ6SH17TV9K3Wvx4kS6uK9ay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAxMiBTYWx0ZWRfXzHTzB8voPxxX
 qx1y0Dt9w4xho0k2XBv5/Du3yPF/IbiQRee2dwPZf802TtjRUzGGX29Ownpy3EJQy3baf+UaG2J
 bh2Z6YEMVE17pwghTArqLfpuV4zRvTMxlRu3sd8SeWKOmLQBay7rFZHTlnSwOkcHXW7eWUsBows
 tAEKlh0n57TOEm6xsCWlHCdcoj/iWOJjaNnQWJd0HG7aHH7o34JT+Xlglajgk6ZG67N1zoeP2bj
 TBB1u4jfx0CIq6FMw5U8+3nMBNFhXWoi41nabU4ui++UbjEToAZhDp2iv264XBHpXJ+3qB9vEaR
 Dmi7vj16z5k1DCSTDNULIj04MMnPMNFNyfLXBr8BSDhgjIzLrRc3umdtwEwKaUvjZWQCr0pR1ad
 H1cNPh1iMOC7eIEkRUuXd/9b9ztDYfBqvB/ul+mS5cIJWUZo1Wh4gwSmMFSzaRNmL+HzGvBTS6H
 YXvNVl1dFLmd/q8Vx6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 02:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124822

From: Chen Qi <Qi.Chen@windriver.com>

The riscv64 is now in COMPATIBLE_HOST of valgrind.
The armv4/armv5/armv6 are not in COMPATIBLE_HOST of valgrind.
Update the settings accordingly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
index 6bad112e5a..260e4171a7 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
@@ -17,9 +17,12 @@ CVE_PRODUCT = "rsyslog:librelp"
 inherit autotools pkgconfig ptest
 
 PACKAGECONFIG ?= "tls-openssl valgrind"
-# Valgrind is not available for RISCV yet
-PACKAGECONFIG:remove:riscv64 = "valgrind"
+# Valgrind is not available for RISCV32 yet
 PACKAGECONFIG:remove:riscv32 = "valgrind"
+# armv4/armv5/armv6 is not in COMPATIBLE_HOST of valgrind
+PACKAGECONFIG:remove:armv4 = "valgrind"
+PACKAGECONFIG:remove:armv5 = "valgrind"
+PACKAGECONFIG:remove:armv6 = "valgrind"
 
 PACKAGECONFIG[tls] = "--enable-tls,--disable-tls,gnutls nettle"
 PACKAGECONFIG[tls-openssl] = "--enable-tls-openssl,--disable-tls-openssl,openssl"
-- 
2.49.0


