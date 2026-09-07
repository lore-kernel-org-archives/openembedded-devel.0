Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84039C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:21:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31652.1788776512040469617
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QhmHIgo5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3710b275f7=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879c2RX3808269
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Sep 2026 03:21:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=elDrYFM6iStmE+h9BlfFX4ip/VUQ4pU8EgAabkttMSk=; b=
	QhmHIgo5ik1VuRkYLRtj9fmyEC8Mnq3EwK+tccpNeEx9zdzKqmLR9XpZ/OCAjwi8
	DOxqxmIz77DKxmYQmKfxIcLOCho/K4dopXI3mlEGMBQAnidr0u4ehpWgQo9tVGY/
	78R3lZ1DymokI9GKJegKeXyYHapX9CwNZc3pipsfTqShqMhtIMxKy6jZ/A65p0V3
	6qs8TTZvdmYTkuvP60guPW34ttQ+sXH0aVVmO7XOtgb7eI+5FqBWiYQZEkDOvxmf
	2t0jP9YIRQKKTKmXNSdpbbFua76c+NhaFkiKtpjeL0xTBdGmdfmWdqq5kgGkesQm
	dZtZrPwOow9LtqHbb8SF6g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021101.outbound.protection.outlook.com [52.101.62.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ggec0t378-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hj2YxtjlrV9VRDJ2LfPJFQ+9XIyh1hW+4jQI/JcO6Yfnmgeiz1/saZcqkpx9KZFl5idnbSSwZ1mVFZbWcd+/3BaLEPePeWO/TLKnwUo6pFx3wVgiKzsHSgiecbewxZNWFO6/KKMGpCnk0XmaR9a47J77vkqkNzORD4b04nS7RRmA9Xz6NsbVef/t6ZzzhA8GFW883Zxirf5Vp4X7zP+62psd3aIpgIhyzCewbYqYGI2AiPiub5Y2P/zYlH+1/GYcz8t7uI+FU+SH/x87f+70lHxAP/WGN8w73YnXHKjYzHjw7MdFEyz++63Vy1lrTNEIFXMs25od+1uoYSpS6/I0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elDrYFM6iStmE+h9BlfFX4ip/VUQ4pU8EgAabkttMSk=;
 b=hhVg7yhoM5fUXvbKK/wKoN7n86tjSNAi6mlpAYxPH4ZQyjXvsWiXc69dS2VB/HFdn78r3j4XmeKX2v0TRJH0OTChcdbq2YdaBV+2smzg+i9EYV1A12qmzeuFO0YBogEc1SijC7OkqCP6qwAprfv+E1ZItMFFqD/tBtqpsDkghxbKErph9jjQ20wXcEajOmsxDpOmJGf0CGEqE0407mLbZkqwJ57qr60j4L9+6pK1o4VqkNm/uQg561DtxFKBGZIYuptLuJMRwJdzZcacroA7KCA9dkpBAxJW7clhQSKO4Fh9B+t2zg603FncGcJtL4QhmQlcKUfxKRfCJt0KeYxVQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW6PR11MB8410.namprd11.prod.outlook.com (2603:10b6:303:249::17)
 by DS0PR11MB8738.namprd11.prod.outlook.com (2603:10b6:8:192::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Mon, 7 Sep
 2026 10:21:48 +0000
Received: from MW6PR11MB8410.namprd11.prod.outlook.com
 ([fe80::cb25:91f6:670d:3578]) by MW6PR11MB8410.namprd11.prod.outlook.com
 ([fe80::cb25:91f6:670d:3578%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 10:21:46 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [meta-oe][wrynose][PATCH 4/4] thrift: fix CVE-2026-55970
Date: Mon,  7 Sep 2026 15:51:07 +0530
Message-Id: <20260907102107.4007371-5-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260907102107.4007371-1-Abhishek.Bachiphale@windriver.com>
References: <20260907102107.4007371-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::7) To SJ2PR11MB8402.namprd11.prod.outlook.com
 (2603:10b6:a03:545::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR11MB8410:EE_|DS0PR11MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebec552-4b69-46c5-0158-08df0cc9d216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|10067099003|56012099006|11063799006|6133799003|12006099003|3023799007|18002099003|22082099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	SI8zfCxMPrmnceUp5wAJuk0cEI/SW4nrge9nOE4Yda6yygIikrf8RHNAJbtneOmoafLwrCIHijj1LcIP01/wLUVasB9jZucfFX6X5xxvspmb/V7CW94dxF74E6RUrgehgn8ivdccoPraqE0Ihk9ogAFdoxMVTZzIysWtB57LQE9VUez9fhFFZfKeLbeFhzBrg7lXKVqk5TrL1eaRuDYmw1g8ALDfA5XXq8MzO7MAVB7QXzobZmOckDRmWJGhDdh0wFf5f88ZMb1p8XXTHxqKfeIzPX4pNWzeWzus1yYUhK/YvovaqQDiEsBtJMuCsvwvGX3B/KYJegkTKcID0KiaNoKZw7bTErZBIF13UhEJx5qsrRTKLtyEiBZZSeyjJPs8OeZF8/njwsbskIlzLFzZlRZ4Rip29teKtZIs3EGWDNBDNZfkkWJ1ZpDYrBv6vcWckROnzzqDFRs7JVdOn7CkCLym5PnA6NlifOnx/ipb6Q1V4Wy2dfQtgL33nLeNZqqhiDE0irisu8tDBASKVzZ86uwXGNc34RdSFHRGYtmMg3y6lNHMZMMx0aqmhvZWgLDCIp+J4hYTvqRpvX4PJEW+0eEH5oh9Cnq/zLIp7T96Lrd9O3wBEymlpXsCjb4XibRlpZrXhEqrczVUwvsoIBlxaD0tyOx1u2m0ov3nfO56BwbJLFb2KyscSwYOv4AqPlUo/bhp6ok7Opj9FZ94xroTC2h5OYQUUDVsMUQvhKlo2lw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR11MB8410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(10067099003)(56012099006)(11063799006)(6133799003)(12006099003)(3023799007)(18002099003)(22082099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Na3wZSFUjOb5+cfTe0Q6KXoWUzk+MJP9HNJlEM1dHTekFPyoZMCyJzoFDauH?=
 =?us-ascii?Q?MdheGlreXdAxkrsWzK8Rupkmn5wgtiRLgcciXi6zH37PyBCSE482/k09LaMU?=
 =?us-ascii?Q?tccAPfF/QCbui4YsmEdyqbr03AdA/TcNjfj0EDpSru6LBWcrdSrYwae7f/17?=
 =?us-ascii?Q?QnvRbFWjEiNUSlShKedhNnfOaJldV60MzhPA33Tfbw0fT9J+5lKR1XpFZycM?=
 =?us-ascii?Q?HHJfr9u1ohoB5rXQ7yDv2H0uVZwOUMsznHOfTkF04Szix6AyYcAHYZErMbr0?=
 =?us-ascii?Q?oE1bGoCHrlaiC7GIHHuulCHK3mzuhyb2MumtqMM0Ip19jyJAipmLO1/HKXNV?=
 =?us-ascii?Q?QXg60CjacCMPH5beSFbwcD3Ck8nzVGgzyYXqnTRT3tiv3lJEUDSMozw3tbRB?=
 =?us-ascii?Q?rsl0qtbuTSJsLN1pBsGFsa+TQZc+Ek91fX+/v2Rm474IzA0h0owALbyzlL9A?=
 =?us-ascii?Q?FlZ2ejlqYKiRx5cjCAilIMuViYYNZ9tuUShiuYEvo300EpI3uUmJXt1yr6fh?=
 =?us-ascii?Q?7bNtTsyYS+QDxbtAkvAZRbe5uOIDns2DAyvcqXoHicDEow2sJNE2ntfu10Nm?=
 =?us-ascii?Q?n3/Bsv58vu5OxzjaKiZdTASXmY2XDtu8KJqYd/ZRIQstD0Mqx1bEfaSRZ2JO?=
 =?us-ascii?Q?6X9pie38Oz1QaqLnRvFJiwUEmj3/9w0ZzGH6z/hOfGLCLc96dfBRDYS9X68M?=
 =?us-ascii?Q?12k5UUQw8pRvPJxkSQClTReL5wkolzKM3VLDL2RgP3tM4/VXw/5OjwFfdEk5?=
 =?us-ascii?Q?z7nKmESjL/4EmPvgOB71VzVLdGcyzHpz9f7uVxmC5PAcHfzjmKIByp5nG7xU?=
 =?us-ascii?Q?oEmYOcOFribeH2dZX0ouzggPMP9zHTEogDb5kSOA3xcYq73PAzCocJ8XI3NJ?=
 =?us-ascii?Q?zj/xOjjnNN8TRMu9D0waPcdfsbx9edASHoTR/p4DBuSo292OIaMMUDsHv8mk?=
 =?us-ascii?Q?xpv4MHTcYcKuRj6DbIHKJdDKbjZ1T80zjrX8efK3yJCBTIIMOjp9QVhHQ5Md?=
 =?us-ascii?Q?TW3AqWwFq/xQTY1PggFSK7ML7MFsSmbxdLcO5zJexF3CM5JJju9soHfxeGbu?=
 =?us-ascii?Q?GwhJNF4Ck8qFpQWReaVBXqcIt//cNcVMd6qAh/F7uNZZ+jZPwRtW71g8h+yJ?=
 =?us-ascii?Q?K/Truultp3KiyCCjxHSwDaZ9yZcfc6NI2pWnDTAJq2UCSkUzn8loyZoU+hU8?=
 =?us-ascii?Q?78YKmpNep+XY6HYYxDbdwJ1hP1vBMjvnKw0YvD8Y9byOMIQbpitydqTC0TFS?=
 =?us-ascii?Q?KaoSwXGcYQYlLJ+qPnAqzRrpXsjLTCaWIgC4xSRPRYcY5an+lcYD/nBU65rB?=
 =?us-ascii?Q?NNWvt8xJwIFHMdr3ulVtI82fqKp2dT9auVmqK+LTyl8NS8RL2M59ac4Z/YH1?=
 =?us-ascii?Q?y0aIjyz4Jrpk6jheAZzys5ai863Xb4Kvu6U6DqHUGUKDGsZ6IlVpYP9asNKN?=
 =?us-ascii?Q?5Tb8Ocs7/31kOi8eVCIchshqY+5J9kbo33uuk3nlI3VYqPpDAhwpeWDdBYhY?=
 =?us-ascii?Q?whyLK2v2NKkQpW2Y9LYLzpsX9G9Jfi/uAZA8wQ4HrsR/WtHNhAo9C16nZWND?=
 =?us-ascii?Q?EPQOZCKLQmKjrcRgt0gpPTR5UQZa+EHYx5yoBb9/oOrELW5CWhvbBBdKuPtH?=
 =?us-ascii?Q?e1TZbt2IqaCtqGUCJdOVwC+86pfFwliAx1FR4qnZi+7AigicCqjo3spsf/ut?=
 =?us-ascii?Q?LPyYuBmJ3RTvTjVLGvOR950gt93hG3DieatTSGyW/vuvgVinz+GwGUvgJsDE?=
 =?us-ascii?Q?+E3s8gYdK6XPlBfCrCNpxexQjH/MO5H5SaGy720Z+jbWLvWVnAXg?=
X-Exchange-RoutingPolicyChecked: 
	l1nR2oEZWzVqDXj20RYg9Qp2eMBmRXKAZ1AlI3QUkgmhS1o0ZwOjKQwr5ILrtu9WFA1nPbbRLXJYoksoXSrjyleugyYtOs2LqIR9+oZDbLDdAE2L982CVa5B579MDUHh7T2dKDjuNrm4Z6Cov7AtQSeds4/WEfiSrADkiLqII5xC4w/aS2D4as3cH+DabzUeoM3DjfAIwE68pnhV6yoVMv8c02A6s2wLvw0h9+IbGfzotI8ddIs7A/EPfCXWKc46hNIA0StNXp8uWbGDomuA5Urg0Cwb4ZkOGNY3q5IXnY6J51ML6AgldphrMmgtAHyzeiQMibofVUPo5gelOCRl0w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebec552-4b69-46c5-0158-08df0cc9d216
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8402.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:21:46.7678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFCbLhZkxFsubXPNd2qfwiPYQplkQtSEnZ4BkbUQwJS4Anl43sM3h3t2WQvxNrKl7U4+wy0sbRiS6qum8bCoIsvWAUjUbnnjA4neiPHV43nbTaJ3PkEzzL+p/Z7EASb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8738
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a9e903f cx=c_pps
 a=vgafN4kwWYQEHO2M6PbBOA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=ZnZeTpKgzcdOojaFLR4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: otUOubbpm2svsUGigJtUMKls0O3oVKPg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfX9bhUzzinuw32
 EzFb3DGyOlnNPHcsBWUbK3NaklVZiQ8vBa9kYx3BEPsAALPGb/rcUZychxTFvKNm78mA+eAXFqJ
 aw90kFMhz00ZP4sbCAxint1f9cifUPSmJALMPrw5m71q5F7vr/oO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfX5KkrAhvtmkVy
 vtd/umiVOGL5G8STr0h0wf73D2eX4zm7U+RdKVXl6xIgOHmBWHJve3Asqj6KsawVUxSg1tMJiLj
 gw7WTYdYF5pCiB+LQuU+PNsneDxUj3CZGqaQGygzU9JZG4rxS1gxguulgVi/TVt+NVAExvS9MVH
 LsMQbFIoYOt60wiqU1UhX25GC5eyWXx3FhzzkFVRZDJBSxGux/pm+JS68Q/dhv3qHPThGllQRPd
 1b/qw0c/XwCJG6DWTzB8ob3qXDGq045wuR+iC3UPxVHuZktWApqOVeaWV9oIr0hL52DPSAlklD/
 GSYWbeRHnotpTE/Ux5IOM/IWeOSE/2EpunHlWlBTKK/tAXFBbppopayVcXJ5PIftDXk/Y+dghXZ
 nn34x7ZZdWAhclD0hbj5vaemHHbOcDNVgZkkUYC/4HJX3ZrsI6SFRCsA+4SeNgfqB+6vCGfQpR6
 +mtZePA6GC/rjctkZ6g==
X-Proofpoint-GUID: otUOubbpm2svsUGigJtUMKls0O3oVKPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129812

Buffer Over-read vulnerability in Apache Thrift C++ bindings. This
issue affects Apache Thrift: before 0.24.0.

Backport patch to fix CVE-2026-55970.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-55970]

Upstream Patch:
[https://github.com/apache/thrift/commit/4da36faeef0b7db4b1dea560b01eb15957335934]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../thrift/thrift/CVE-2026-55970.patch        | 64 +++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55970.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55970.patch b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55970.patch
new file mode 100644
index 0000000000..a58d109600
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55970.patch
@@ -0,0 +1,64 @@
+From 4da36faeef0b7db4b1dea560b01eb15957335934 Mon Sep 17 00:00:00 2001
+From: dxbjavid <dxbjavid@gmail.com>
+Date: Sat, 13 Jun 2026 17:39:53 +0530
+Subject: [PATCH] fix off-by-ten header bounds check in readHeaderFormat
+
+Dropped the upstream ThrifttReadCheckTests.cpp #include hunk as
+<thrift/transport/THeaderTransport.h> is already present in the 0.22.0
+sources; context adjusted to apply on 0.22.0.
+
+CVE: CVE-2026-55970
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/4da36faeef0b7db4b1dea560b01eb15957335934]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ .../src/thrift/transport/THeaderTransport.cpp |  5 +++-
+ lib/cpp/test/ThrifttReadCheckTests.cpp        | 23 +++++++++++++++++++
+ 2 files changed, 27 insertions(+), 1 deletion(-)
+
+diff --git a/lib/cpp/src/thrift/transport/THeaderTransport.cpp b/lib/cpp/src/thrift/transport/THeaderTransport.cpp
+index 70510d95c45..cdf29cf3d53 100644
+--- a/lib/cpp/src/thrift/transport/THeaderTransport.cpp
++++ b/lib/cpp/src/thrift/transport/THeaderTransport.cpp
+@@ -210,7 +210,10 @@ void THeaderTransport::readHeaderFormat(uint16_t headerSize, uint32_t sz) {
+   }
+   headerSize *= 4;
+   const uint8_t* const headerBoundary = ptr + headerSize;
+-  if (headerSize > sz) {
++  // ptr already skips the 10-byte common header, so the header section has to
++  // fit in the remaining sz - 10 bytes; comparing against sz alone let the
++  // boundary sit up to 10 bytes past the receive buffer.
++  if (headerSize > sz - 10) {
+     throw TTransportException(TTransportException::CORRUPTED_DATA,
+                               "Header size is larger than frame");
+   }
+diff --git a/lib/cpp/test/ThrifttReadCheckTests.cpp b/lib/cpp/test/ThrifttReadCheckTests.cpp
+index d62f66330ad..7abcff8bd32 100644
+--- a/lib/cpp/test/ThrifttReadCheckTests.cpp
++++ b/lib/cpp/test/ThrifttReadCheckTests.cpp
+@@ -393,4 +393,26 @@ BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_read_check_exception) {
+   BOOST_CHECK(out == payload);
+ }
+ 
++BOOST_AUTO_TEST_CASE(test_theadertransport_header_size_exceeds_frame) {
++  using apache::thrift::transport::THeaderTransport;
++  // Header-format frame whose declared header size (3 * 4 = 12) leaves fewer
++  // than the 10 common-header bytes inside the 14-byte frame. The trailing
++  // varint bytes are all continuation bytes, so the reader used to run off the
++  // end of the receive buffer.
++  uint8_t frame[] = {
++      0x00, 0x00, 0x00, 0x0E, // frame length = 14
++      0x0F, 0xFF, 0x00, 0x00, // header magic
++      0x00, 0x00, 0x00, 0x00, // seqId
++      0x00, 0x03,             // header size field (3 -> 12 bytes)
++      0x02,                   // protocol id varint
++      0x00,                   // num transforms = 0
++      0x80, 0x80              // info-header varint, all continuation
++  };
++  std::shared_ptr<TMemoryBuffer> buffer(new TMemoryBuffer(frame, sizeof(frame)));
++  std::shared_ptr<THeaderTransport> trans(new THeaderTransport(buffer));
++
++  uint8_t out[1];
++  BOOST_CHECK_THROW(trans->read(out, sizeof(out)), TTransportException);
++}
++
+ BOOST_AUTO_TEST_SUITE_END()
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
index b68dacc806..b1178a55c1 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://CVE-2026-48586-01.patch \
            file://CVE-2026-48586-02.patch \
            file://CVE-2026-48145.patch \
+           file://CVE-2026-55970.patch \
            "
 SRC_URI[sha256sum] = "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5"
 
-- 
2.40.0


