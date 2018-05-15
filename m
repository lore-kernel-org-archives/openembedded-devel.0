Return-Path: <wguay@graphcore.ai>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0139.outbound.protection.outlook.com [104.47.2.139])
	by mail.openembedded.org (Postfix) with ESMTP id ED54274F6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=graphcore.onmicrosoft.com; s=selector1-graphcore-ai;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=qaWR1tNqKJDeav+nBRXlTf9XoPmMUPvk0bMxdnKah0E=;
	b=g0qUaeAbLwP8/0UxUMf2gY8Ip1c74EtIFbBTU3KWkng+wmbXZ5KMRMvUXvxySVauBJEWD7P/3CrLc0sht2fIOR6SpOugNzeigUMS32ee4J6eddsZBQvpZLwykpNXbqws2ufaBfaE5/tAluYZBTBiajChutg/J+o87zQJjOjJanE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=wguay@graphcore.ai; 
Received: from hansa.oslo.skala.ai (95.130.220.238) by
	VI1PR01MB1311.eurprd01.prod.exchangelabs.com (2a01:111:e400:5182::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.755.16;
	Tue, 15 May 2018 12:44:31 +0000
From: Wei Lin Guay <wguay@graphcore.ai>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2018 14:44:17 +0200
Message-Id: <20180515124417.788-1-wguay@graphcore.ai>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-Originating-IP: [95.130.220.238]
X-ClientProxiedBy: HE1PR05CA0147.eurprd05.prod.outlook.com
	(2603:10a6:7:28::34) To VI1PR01MB1311.eurprd01.prod.exchangelabs.com
	(2a01:111:e400:5182::28)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR01MB1311; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR01MB1311;
	3:1YDaI3P/wnIjCxKca47lEyHki+BLH/KltsqaxgDhOVGH4osg053lNVqr4K74SxNMZnL7KgX2A/7ZeJgauOyNIuJxg9kSej8gdvRAoJ4uPLaEDjUmoxwEgpzjwrY7dVywKZfgichl4TCf9kVxkXvqTa3EAaKkrDtu7QBhEt58DUpLbdlUg8W8afRR/avKwzB/qlCC2YS8SS5HMbR5VeL+XqqP7mbLZsMB7L/C9Rg8YPIAG3th7WQMdNAKa69wPGfF;
	25:YGGPZ4VqTUmclbNXUY5Mhr1HFPmTV76UO7jBN7bN1oydbwsqsHUDlHSwVUFqO3O1K5HlNFlyv8s/Bkzjp+azGSArmEbWcwLqUdVsSrhyzgyowXUYD45XaP9/nB7HMyKxShkfLVkpQM1IRf6MQwxLJD1Pp/pZKKpMujVNUcfRVCSuBKMtq1VOye2r26WvSo/o3lYjJxbSqdSQ5BnrADdELXiSO/hIaP4F1TJMt8Fm6RAqPKXf4QefQbV3fIbYQpGlaIuK1W92fJ121d+YomTbUjwUqXpJerldt7V6UhVVnT69ug/UM93CJc4aZBgUQaShnNEr185JIYyjmCNQjBdEOzm2phnCom7FONYAflNMVk4=;
	31:alM4suDGAGBZxP0nBxvWvZF9tUO0JLMN3MVvopE8ZPI8Z6+kqRwDyVbNj9YybgFqYNd0I3pBksCmusahNLm8fIDxzNGA6UVUk50sDVYmMFIjVEtBIewiOAoyPqC4w1Co4sQN++Z0UUIeKvlLM7eQwOgIVRRvzLCwX48EmoIBTt6Gtf7dBOYXcK3qGxe6myLnIpwdLPvZzLhegkgtmZV/m/3pxEyxfR8IhUuEe5zwPN4=
X-MS-TrafficTypeDiagnostic: VI1PR01MB1311:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR01MB1311;
	20:bgYbsR1s521w6Ya2tch33xYLJhyMbdqD6Yvk28OZPD1DmjKvlWjfaFTXvw8Wz8ypescVWZipEqPKn+oHJvN7qbfF65e8Szh6sQlEvtlI7cOf3100wiGjRpnJGTdw6O99L2CtWnkcsu6LShhcBVHNsN/THZAumwdKUTeeZMM8pZSJTGR5MtEMbdT3CJRkKILBbgpS+lionX0K4FFa1uxSkXtdKieBoCKSz0f3XF9ttvnRqzW6l5xaOVjNpOeXcXk+qcaMaSo2fx3nkduN+5C7sSMRbw+dnqhizqikWYcuuc7sqpA6suHfxtr8Cjc1umhihT2ys7sML8mBAQGc2rw7uVUXXZlC7zVAuupgn9AN327lkXub6Ig/sM73N4/qZe2nENGr2kG16C+CPs7Rpzdp4egextp9CFUNy3sFqempiTQ=;
	4:kMnTMhyhTJ91SSMxHuwjQmdS4xvQvyi7bdQxELfp7R5KBJUeJ79MaU2EVKgxlW1xxKdi0UTefk1wlJkh2i66zQ/6ed/y8S3vNWsPXOkVyRqfPQX1wxBI6p0e6GG+S+OtF8JnTQQtHWg/VRsPMYehmA/rFOh8bPvkpkYVc2eCV8tYmSLawImoL+KDihvcQEoZjaSs2WWMc/+yrxOA8VeTz6Lz/y+Ab6RwWOyV+PRapzoon4gf4jJtghSI3PsnJ+Bz0ZVQaHbkdS5PETD31c+MxQqT6BD+ym5OMC3wgxIe2nH66ugOxJFk9GFsNnxCdTTv
X-Microsoft-Antispam-PRVS: <VI1PR01MB13118A21F7C413887CD228CED6930@VI1PR01MB1311.eurprd01.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3231254)(944501410)(52105095)(3002001)(149027)(150027)(6041310)(20161123560045)(20161123562045)(20161123564045)(2016111802025)(20161123558120)(6043046)(6072148)(201708071742011);
	SRVR:VI1PR01MB1311; BCL:0; PCL:0; RULEID:; SRVR:VI1PR01MB1311; 
X-Forefront-PRVS: 0673F5BE31
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39840400004)(396003)(39380400002)(366004)(346002)(376002)(199004)(189003)(6512007)(5660300001)(107886003)(6306002)(3846002)(6116002)(2870700001)(106356001)(81166006)(50226002)(486006)(478600001)(52116002)(8936002)(8676002)(2361001)(81156014)(97736004)(105586002)(47776003)(25786009)(53936002)(6506007)(68736007)(66066001)(2616005)(1076002)(386003)(476003)(956004)(7736002)(4326008)(23676004)(26005)(2351001)(186003)(966005)(316002)(50466002)(2906002)(305945005)(6486002)(6916009)(16526019)(6666003)(575784001)(86362001)(36756003)(74482002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR01MB1311;
	H:hansa.oslo.skala.ai; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: graphcore.ai does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjAxTUIxMzExOzIzOmhJVCtUNzN0clBveUtaQVEzQWN1NXg3TE5z?=
	=?utf-8?B?OU1ETnU1aVRMMXV6bHBZYVRjSk10NnN1K1J0YlJPM3kvWGhuaFY4SlFhTU9U?=
	=?utf-8?B?YXBheWhPcG5GZVlHYXdSdmQ3WXUxRUIwSWdFL1FYblBHK2plb0hlQVdXS1V6?=
	=?utf-8?B?YTRkSzVmdEFLUHlReFphM3BudUF6K3RxWkNGaWR4bkJvMzhVNkx5SW04Ri9N?=
	=?utf-8?B?ekZ6eFhZMWZYbXdUSmp1enc5cXJCNCs1M21kSjVBQVVzZ3RON1NZNkNVQnRn?=
	=?utf-8?B?WFh3K2FreDIyclZYWkwrYWlFVGlVcHhZem1kMklZU1pINHo1aHBDQncyTEMy?=
	=?utf-8?B?SDRFeSt0SHJLcDIrdW1wendjanZMclAzYVUzUlRVL0dkNzRhVVpVTzI2WWNm?=
	=?utf-8?B?SFErek9UM2pzOTVEUHo0VkxldXh5ZFNxTEJkeUFJZXBjT3NyK0VCdEthMk1s?=
	=?utf-8?B?aUNXVHMvOWxyNHU3Z3FXVTJuQWpXb2doeVgveUNSMUozbllpazYrMzhsemht?=
	=?utf-8?B?bThBaEljdGxVSEtSU2dXU0dzc09CR1E1dEJ5UEszNEsyeXNnSHRNMXphcUxM?=
	=?utf-8?B?UzF1dFY0cXI0Z05WcnFZT21tVzMxeURTWW5lWWhzTmVUSVJVUjhubURFK2Fs?=
	=?utf-8?B?eWtWWktMdUJ4WXVsakhBR3RHRFFPVUNsWmt4UTl4djhLRXhaUnVVRkRubU1K?=
	=?utf-8?B?MnNiUjJGT3Y0My9mQWN2TVZ4cjBKclJuK09hK1dVRlkxMElmTXc5SFVLbmhQ?=
	=?utf-8?B?bE9xamJzeEUxNkNmOXQycm05YjlNQkFSZ0xtMVU3R3R0b0ovS2JmRzB1NTBI?=
	=?utf-8?B?MUNhZUdDbDc4VkRHNlNTMDM2aG1RazFOWlRhWTI2M2dFTUxMUkRRcmtKek5t?=
	=?utf-8?B?UG9SOGRGcW9ocDZoaEg0WjlNV1QzNFZSTDdwRGg2T2htVmlHZG1IUlhQQUEy?=
	=?utf-8?B?VFY0UjVNRmJ6RU1PVEpFUWpRNGFDdjFQQU1TS1pvdEpibXR5TkRYSk1JcXFO?=
	=?utf-8?B?SmZkNFR1TS9pVFlCMWJVUEtJcU1mcVI2bFlsM2sxMlkxUjM5WHg0QmJmc1py?=
	=?utf-8?B?dVFUdklkZ3N4Z1dOb3ljOFRZQTNNYlc2TytYM0pIQVYrVTNCNlp6OGlzSkR3?=
	=?utf-8?B?VWkwWXVwdm0zVzJwQ2FRTE9QVFBmLzg1MUdrTVBwL0tEeGhpdUt6NklUT3RS?=
	=?utf-8?B?MDRXT2pHdU5Obk1hYStzOGcvQ0xsL2V4cnRlVnRGTnJPczArZGNNaCtoV01v?=
	=?utf-8?B?WXU4d1VlZURaTHN2ckpZVzM0NTFFbmhndy9kSVRTZUs5SEhwbWlHRk51S29l?=
	=?utf-8?B?dEYzdUdvdlBwQThOQ2pXSlFuVVkrMGZsTi9WbmEyVHFrVGx3MDFmdURCVkpO?=
	=?utf-8?B?T09yR0psZDljbHNoN1Q5RHdTbzV0M0UxaGhnTmVrbGNjUTF4KzBHeWVUU0d1?=
	=?utf-8?B?M3dBYjFGQTJtbGJCeTdrN0U4WGFRNDBLZ2R4cklGTmUrR0JocktMaVRUbjUx?=
	=?utf-8?B?eVB4eVFYd2F6K1hhcG92ckhIaHAwY1ZVc3ZaaDdZWXBPUk1YdmFQalc4VS9L?=
	=?utf-8?B?S0N0c2JFWHNHWEc4RzJvMkVHVm4weldmTzZodG4yNGpaQXV0KzJhSzIvd0k4?=
	=?utf-8?B?OFhEbXlQSENsZEpUcmhFQXp1cU9WUU1NU0dzRFJTcTFiRmp1RXAwZUw0TE1n?=
	=?utf-8?Q?Gy+c2HkXQa5OqL2bNuSz8oIu5itfNjJbt1r8Z+y?=
X-Microsoft-Antispam-Message-Info: L0a4Tg3aEQ6tyZPCiS+VsJQvgS7Lw63GIA1p+kyOd9NoLNwoM1Lt4E0ufL0Cv9Z5jSW5ZQDW2ylz4g7mlMEdO0GbNPpva2jl9JYyyEHQJHKpaRHcEeBWTstfF5jNrou+RfPzS6EvoC2EbcQtfGYsJSFOqm27YpIrAAx0dLMWqGgQasgdwGMorX4Uj/IgIEVB
X-Microsoft-Exchange-Diagnostics: 1; VI1PR01MB1311;
	6:xezopPmdmalRxdqxQL8HxyJmpTzwdDJ8mPiHHAeAI36h+ZrfkO94JBJPJLWlEzSy3y3QUjTAu3dwPILDe72lN6ZpnrT48GOptP6dXA2m7IR1ZMngFDPE9tqMz86EEB0mETJyLXqQF4S+Q0LcESx6fSD5ZtKNvGMDoApaPqUKqnCtj9CaMKGK8c5RJimceMeZBOisklaLs1SGUAaosvFUEyhCYgan4FTAbknsLQaWZHJxLzNvIeqjtRZ2NRkJabwQ2r+KnIHmJzR5nwmBOclzZCTFTsEoobCTJwVZrgCC82jDy8radNV60xFG+HAMnj7RuXkiqRieKR6/THiDSGtc9nVyvuInV6aQ1gwFja7sC7L+JEGwLMR7oca1UEkgEILWR2bdCjCz5dN+phzmCNH6jhKRKkS7DMDGFyW+bmMyPPoidufOTGvpUtxjZgGbR1tsddP+dVf5R5QGQXoJBTGWVQ==;
	5:eeEU4IcZZPJbVkMNd6fuK9j1dCQb+r8AwioUVRGVv8oytGeIcso9pUlheDJmYA+cT48htrIlIrs1/CctGxZ4bx3E2Egl2tCluud9v2bWjrmHMrslFAkTnJFTV8kjON8m/oRNUnVsFahBYRxDjIuPmm0kqWDvKRCIe6Du6+7w18o=;
	24:6/oZZN2FpBmJULxHdjNnM21qsXn1979iTEhy99v3XXBzVlnWuMIsyRaULdGI4Di3XyL8JIvS7okS9izVJyE7aYsAJ6zZkQLOmCTNKgrusAU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR01MB1311;
	7:fzbDz9wxzy/fYRFNC3VF+wy5tZ37SpbosS9Zp1EiL9fGvrR7hAOz6lXZKIc46Nhe6GGD1hKChE2XzUEe3gDhvX89hs172Yeafk7YlLIEaa6/onOgHY5fvF4cVDCCDEDsoj+Ip65XrY/45cmJcGzB3l5W4Q7qKJw+B4NVucyFB6r5F2h++KN6//JvZH88gH9sDXwXN8F6s09e2aOhYXOYTURNGmEYhHDfArlsSGGnsV3ykLNtACrhDA9vTbt3Z3m0
X-MS-Office365-Filtering-Correlation-Id: 177d1837-f524-4549-5fe6-08d5ba619ae5
X-OriginatorOrg: graphcore.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2018 12:44:31.3766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 177d1837-f524-4549-5fe6-08d5ba619ae5
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 02150d85-5b54-47ec-a80d-98af327512f0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB1311
Cc: Wei Lin Guay <wguay@graphcore.ai>
Subject: [meta-networking][PATCH v2] rdma-core: add new recipe
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
X-List-Received-Date: Tue, 15 May 2018 12:44:33 -0000
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
v1->v2: include review comments from Khem Raj to remove eudev from
depends and specify the License correctly.
---
 .../recipes-support/rdma-core/rdma-core_17.bb      | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core_17.bb

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_17.bb b/meta-networking/recipes-support/rdma-core/rdma-core_17.bb
new file mode 100644
index 0000000..5d03299
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_17.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Userspace support for InfiniBand/RDMA verbs"
+DESCRIPTION = "This is the userspace components for the Linux Kernel's drivers Infiniband/RDMA subsystem."
+SECTION = "libs"
+
+DEPENDS = "libnl"
+RDEPENDS_${PN} = "bash perl"
+
+SRC_URI = "git://github.com/linux-rdma/rdma-core.git;protocol=http"
+SRCREV ="5ce12bd51ebb0a4db35dea382b1ebdc701bab224"
+S = "${WORKDIR}/git"
+
+#Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
+LICENSE = "BSD-2-Clause | GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.BSD_FB;md5=0ec18bae1a9df92c8d6ae01f94a289ae \
+		   file://COPYING.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
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


