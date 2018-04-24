Return-Path: <wguay@graphcore.ai>
X-Greylist: delayed 10767 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Apr 2018 14:43:26 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0130.outbound.protection.outlook.com [104.47.2.130])
	by mail.openembedded.org (Postfix) with ESMTP id D98A971C9B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2018 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=graphcore.onmicrosoft.com; s=selector1-graphcore-ai;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=wnu1kYdAAUpTlB4a+/YPLZDAV5CS0rTKOIf31VxKjH4=;
	b=BeCn1g4x9XVZ8iiJTU7aMYlWqZwvLHTeK88GFZmWSNngoWsADwvZKzYm4vjIo7CTN3GqhIhbnCBKVEl6lnwwORqot9jjvzN7TEZAgJKgW6fbfsRvQ1D9QphjAl9K2gW5iBmD5Nxl4n7ciUHQbEaVJlgdJJMFSJccVPkia3bqeFo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=graphcore.ai;
Received: from hansa.oslo.skala.ai (95.130.220.238) by
	VI1PR01MB1309.eurprd01.prod.exchangelabs.com (2a01:111:e400:5182::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.696.13;
	Tue, 24 Apr 2018 09:13:20 +0000
From: Wei Lin Guay <wguay@graphcore.ai>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Apr 2018 11:13:05 +0200
Message-Id: <20180424091305.44842-1-wguay@graphcore.ai>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-Originating-IP: [95.130.220.238]
X-ClientProxiedBy: AM0PR06CA0071.eurprd06.prod.outlook.com
	(2603:10a6:208:aa::48) To VI1PR01MB1309.eurprd01.prod.exchangelabs.com
	(2a01:111:e400:5182::26)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR01MB1309; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR01MB1309;
	3:KAMobCT8nAVAq0YoGl/8+bFNdXzv/60+CdvRwtZsJfoo3N3wpq7drv7np5WE7Y/1yx0SFvbN8s4FQPfXuerGiUJ+4voXU6Q0j1ghxJnuKE0cjQULQHNxRA5OgZiSEnnnRdfpYqt2BPWQYPdFYR0w6JDVdOvVvX4SIBm6CQ70W0bdNQOrStcBGCSoQfe0p47mKJfHoSjgRLnd53Kf7a6xy+Xepqbq2rj3rcnigQw1T1orOubpDT2Wt6GFz6V6/sVs;
	25:FDt/zHTOlHZ1TuLEIX+kNkfyElLyR3QpiyR7l4r90DknPtaLaJ6j1rSUehXUzklf5xRD0LALbmNJoQ+eHYoc6HJpUtc7MgBGCSXAFWcQpDq5H79yT2Dx6V/8FsutGfomOMSjaBfnv02mMccIQ3N8qmpxuzTM/67tcmsg4QctV45B/hPP+OZJ6pKTx5YOZuhkbF8VwsHG1eJ6TMNuS/RwrOErHU3fup95omnajbSXF67yS8mBOf5hm1myrcCaPIrq4lLOqcGmUSsfJoVryjntF1DaAfD4R0QKnS8YPIuAur5sovKdLqb6Ygi+tjKjh6uWlBM5LhTlPSCXr2x9mbGaVQ==;
	31:FxdrNChWstu5KlvKEShNVYDMk7PDnekrD95NHlpsdFn4pGicchuD7BkioWUfOmtaHJycLJIuLEmSHjsi5YEff292+rCF95TEfUAFSEi8IY6ZH23/r/vUEN3pc+IUBwWxpV3Pwjxo5dCo8gCpry6lpoUcMPlyx9atYXePWHqJBkmJu/Br36DZMB0NXVC9IbozLIEmwBW5Qn9HTgjtoiQuvjGKOqoQEMF5ZClGOg6J7Ik=
X-MS-TrafficTypeDiagnostic: VI1PR01MB1309:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR01MB1309;
	20:RSav712dQ/Xbk9xP6BygJ+Eyp7oKyUxBW5fbL1NtxOc/8G4+YVGcS1Sfs0oAiSX2K0Ej/5HGinwFX7SfDcuV/EpyiXA//fJJvurAvJhtAYvdB0Qr6Rg0tPiegNCrIwxFmRUDhxJeGzEpzCKMXPQm37LKSDBvqN8vG2uO5UztC1zKAvE/gpGzO8B7dBaMUmLbxjObuPGYtMYKKoz/D5iHGJuDT/TaEpNImmTeoRwCWnD9X540O8QCiBiE2yoec1Qx0ubUQYJMimN/1KVOCQXs00GjdcURSGC75BEZta0xmq7bOtOphQU5myi6GPUrdIT/dn3F1xYz039nqIkeZLUisqsePmYNC3Xx0tLUTUTP5SXIfU7tjEEiTEBPiKecUBh7WB8Tdbs9z/dt83yUATv7PiQwd3+h7oX/RLHlRmI8Zts=;
	4:Ey4x3njB0eAq0Xed6M4VRu8UOTY+1COBA0NszoaSTxL03Hr22vR8pzCrRfG0ZuyTu/PDH5FGz94cDGIREtrQlo09VJHuPE4lGUXqshLr9ZuBIrWz9OQTo7ybXPN0ksNdRnSKm6iatGbLklWupo1VYDWjJ7IZS0qB3+WFxKMlRNIdGMoDS6Z4uDy952Z7oJSIkoMRVNGIdgqepGrHH/mWhgrTSS6WYxhUa+qB1qh2ErkN3Bb1pSQ62dTixc3ureOFwN20KrfOq9AQpecevOb3EK//LYEfZQVd0Xx3soLnYM+AFOgxV12sXjbFJmKHyMPn
X-Microsoft-Antispam-PRVS: <VI1PR01MB1309067E7CF100D4C4A88330D6880@VI1PR01MB1309.eurprd01.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231232)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(6041310)(20161123564045)(20161123562045)(20161123560045)(2016111802025)(20161123558120)(6043046)(6072148)(201708071742011);
	SRVR:VI1PR01MB1309; BCL:0; PCL:0; RULEID:; SRVR:VI1PR01MB1309; 
X-Forefront-PRVS: 0652EA5565
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39380400002)(346002)(376002)(396003)(39840400004)(366004)(52116002)(86362001)(50466002)(386003)(6506007)(36756003)(1076002)(66066001)(23676004)(47776003)(2616005)(74482002)(476003)(6486002)(956004)(4326008)(16526019)(107886003)(26005)(478600001)(6666003)(5660300001)(316002)(2906002)(53936002)(6512007)(6916009)(186003)(50226002)(305945005)(2870700001)(3846002)(6116002)(7736002)(8936002)(2361001)(2351001)(81166006)(25786009)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR01MB1309;
	H:hansa.oslo.skala.ai; FPR:; SPF:None; LANG:en; MLV:sfv; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjAxTUIxMzA5OzIzOmViRXN3QkZSSVhQNE5vK0srMTIrV2lURCtE?=
	=?utf-8?B?VWNjOWtZRCtJTjNmY0ZOa28yYmZxNUVrWVk4UytoVThwZWdTOW1CZllQMndG?=
	=?utf-8?B?LzY4dURwK1EySEJIYk4yUzVoeE1PR1V1cmNrN3BqbGVlYVFEL3p5djV0R3cy?=
	=?utf-8?B?TU4xdlVzTXB0Qk5WaTVuVlNxRE1jeDlxdityVDlXUHB4cDZBK1kxVkJmRlV5?=
	=?utf-8?B?U1JPYXNaTDNLMkJlbXdxN0tKUkpaaCtQZkxoUWUweDYyeWJndTZPTWVYWmlk?=
	=?utf-8?B?OWRycEVsaUViM1k3bEt4Rk5vOVZOM1dsQytEWmNqR1RvNFZzNC9VQnI0WXRt?=
	=?utf-8?B?Vjg0TWs2eE1SUUNEdnZpdmFQQ3hraStEUXhsNE1JOWJJMksxZmFkZ29saThH?=
	=?utf-8?B?VVNrSTZKSVd4a0ZNb1lJYW4zd29QNTNLZFBvRlErazJXcm5Fa01HNGgvRzNL?=
	=?utf-8?B?SW5kT01KRzVydkkwZkJhdmFlY1hnZG5mL0taVlRnZFZNcGdxdERrNjR0S2Ur?=
	=?utf-8?B?L0lUNDhRWEIwNVlYcG5TakNOTzRnc2VjWkkrazhzTkM0QWtzTk9SZzZaY1JC?=
	=?utf-8?B?Tk9CZzZCNGJtQXZOM0JXRDVBOXpBZU1ERGtUT2F6eTljOTZKUzBCMVdnYUlR?=
	=?utf-8?B?RC9LMklvOWh3SzBESHFuc05Ub2dJZnFwMmJEd2ZmRzFYajBPdnNuQWdPNXh3?=
	=?utf-8?B?SXBIWTluelVnSmhocE5sUG8vc2gxQkdITStMRUZBajFyN2g1YzFTUVhKeG5w?=
	=?utf-8?B?bTBFZklhVjRSNHlBNDVUcTc0NzZuQzhKNk1PVjIrdWNIeGgyNmpnWDF2V0Fi?=
	=?utf-8?B?c1NSa3pnZmdCMWgzNmFsUGFkNGg2dEhwMHJsdklYM0k0Z2Z4WjJGeEdvajdP?=
	=?utf-8?B?UXlNRlV3NnIwSXRPMEZ0UXJMcWh6RmNTaUpxMmQ5dmoyTUR1NG84MUora0l4?=
	=?utf-8?B?clJJQ2l2dlRveUNibkpGZnlxcmcxY3B3Vmp6cUlZdkt0Yklha3hERi8wTjlq?=
	=?utf-8?B?aCsyZkNOdldNWDljaVlQc1dSaXdGK2dnSThNOS9QamtvdElQU25FOGN6dUdD?=
	=?utf-8?B?TzRNWnk2MzJzbjQ4SGdYUFpPZThmRTA5MDQxYnNabk9XM1ZtMFprQUxLWng3?=
	=?utf-8?B?RWdabnVkNVljSXM3S1A3T1FkUzlKY0dZRzJzWEtCcDZwNGFkK1k2TGFvSGFW?=
	=?utf-8?B?d3BvVnRiNms5bW13by9BVXdWNENKSzJpZC8ydEpqdWxRMXpMMGVyeWtXbno5?=
	=?utf-8?B?SytkQkF2VkJCdmFCRjR4R3pPQU0vQmw0TjVlQjJQc2FzUS90N0UyQy9Qdjl5?=
	=?utf-8?B?d0tYaDZmcnRxSjRFb1V4RXZJSWxjMHdxMW9sMFdQYW5qN210NWJZMEJjUWZJ?=
	=?utf-8?B?YVVGbk5JK1dMcTdZM0prQ2ViVTNPUEJ3WHh1SGJ2U2FaUlpxUEJHaktmODFB?=
	=?utf-8?Q?n9mz7c=3D?=
X-Microsoft-Antispam-Message-Info: 1hv8ja8fYbA+h/a4x9SYuYZOHxBiQfopYDtZz824ivsvEbJ5vyvpc/KE2dBVkWzbqc5BXLt4Vpxn9/WsapwixFG5XJD1o+TP7hc/fH1J76t40i63KeBL+qwSM2lmQ/riL/OXmXu2LVuU8GmkSzYFbgGlXCKxlyIBf4G2nMnIwM/NtQZbOY0dBu8Mn1Pe7ZLE
X-Microsoft-Exchange-Diagnostics: 1; VI1PR01MB1309;
	6:EeLKJO+vBOTXkkpRjDTEP0/QVNHhZairARJNwpgD8R7M27hTNYcJpfv79ZLLBInf2FISkEGOOh0WXPA9AcgbK9M3UBoN4e1npYY6tMTFF+jo4Naamg72LI9h2GMNXTW5e7iqNFD3d1JcaQIZ0a8R6RtnWx1ID8DxMIkLFiPaoHUc2Ex+EYnVLS87PuSXDpEOH91A6oys5lOlLRaIHytB4pwFKSIHeYMtX4qKRoWgW7M5L74XRJrFcLeJEwjbvcaphLzkHksgY3vvVfkxjfUgWca+e8JD6dpnRDyXxTkY/BTyswXOMClBbbiURimLP6vDSkxhEHhEhiuBCUIapzPE82KB04XbG8eS1AmUB2+/VDT9KmHF+QwCGyR/hCAS1C5suvKY1DoRl2NAeflo/TvSGq2HtRjCHLIEhoMf9yGZCHOjSqR1ILVUfhjdnAgVihnhjsdkIYp4P0Q/Aef5obG24Q==;
	5:uVSB0pN/mTJJuhQjTL9PaIbqJaErwztXixEPRdz3/s+mq0D1+zbC0qBK7KzoIPPgnIU3fsjRfxnQlCyHKu8yZw5l6APj6Wk67EkY19rS/dz6n7TrfWv2r9byiBLAU429EglI8WszidgNucsbUbWFhtt5BLlui5cC08u6wIlk8tA=;
	24:ISAQhhr6S94ehn1XEPS6+XBWuXOC854UH/ughy9ZYwAmGb+Lw0cNZO5p01Lxvcz79CbwkM+r7P+i+CO01CcsZ1/PMg7LlmDa1BhY4/E2DdM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR01MB1309;
	7:XJCDi47f04NP65py4rjg/RIAx/fqItcXxGqiUvp6DIAp+Eyy1UGS26a7dQ/CnxEqx8Q0EClU9ut5H5/3EYaRqAv6A3q01AGmS0VEc8fsFou039ipaqU1tsVAcLbmWjepzieXPAeqT/gIqrGGf3soW7a0qlJYqx8hnU3lYcytZkwiriDUR4N1sgqpDr9VBf6goHhg779kADvFtLSKU1TWPaQCeYvkZFJZAqwpUO94L72IIU/orOO6xjJKLCksDyOv
X-MS-Office365-Filtering-Correlation-Id: 5dbb6aa7-ffbd-4fb6-2cc9-08d5a9c39f8f
X-OriginatorOrg: graphcore.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2018 09:13:20.1439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbb6aa7-ffbd-4fb6-2cc9-08d5a9c39f8f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 02150d85-5b54-47ec-a80d-98af327512f0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB1309
Cc: Wei Lin Guay <wguay@graphcore.ai>
Subject: [meta-networking][PATCH] rdma-core: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2018 14:43:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RDMA core is the userspace components for the Linux Kernel's
InfiniBand/RoCE subsystem. This component contains the userspace
libraries for libibverbs (and its associated providers libraries),
librdmacm and libibumad. Besides, it also provides additional service
daemons such as ibacm and srp_daemon.

Signed-off-by: Wei Lin Guay <wguay@graphcore.ai>
Reviewed-by: Harald Høeg <hhoeg@graphcore.ai>
---
 .../recipes-support/rdma-core/rdma-core_17.bb      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core_17.bb

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_17.bb b/meta-networking/recipes-support/rdma-core/rdma-core_17.bb
new file mode 100644
index 0000000..e45262a
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_17.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Userspace support for InfiniBand/RDMA verbs"
+DESCRIPTION = "This is the userspace components for the Linux Kernel's drivers Infiniband/RDMA subsystem."
+SECTION = "libs"
+
+DEPENDS = "libnl eudev"
+RDEPENDS_${PN} = "bash perl"
+
+SRC_URI = "git://github.com/linux-rdma/rdma-core.git;protocol=http;rev=v${PV}"
+
+S = "${WORKDIR}/git"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING.BSD_MIT;md5=4cef3f976a07850eb6d2e5d1ef945e6b"
+
+
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "${libdir}/*"
+INSANE_SKIP_${PN} += "dev-so"
+
+inherit cmake
+
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
-- 
2.9.3


