Received: from cetc.com.cn (cetc.com.cn [220.181.39.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5359.1793686951216712888
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cetc.com.cn, ip: 220.181.39.39, mailfrom: chenqi_hycx@cetc.com.cn)
Received: from mail.cetc.com.cn (unknown [123.125.172.206])
	by mtasvr (Coremail) with SMTP id _____wCnG9wzfelq+OEBAA--.9536S3;
	Tue, 03 Nov 2026 14:20:36 +0800 (CST)
Received: from chenqi-Redmi.. (unknown [123.125.172.206])
	by front01 (Coremail) with SMTP id C6CowAB3umrifOlqFjwrAA--.42651S2;
	Tue, 03 Nov 2026 14:19:14 +0800 (CST)
From: chenqi_hycx@cetc.com.cn
To: openembedded-devel@lists.openembedded.org
Cc: chen_q07@163.com
Subject: [meta-oe][PATCH] iperf3: fix do_configure failure for native variant
Date: Tue,  3 Nov 2026 14:22:15 +0800
Message-ID: <20261103062216.1796845-1-chenqi_hycx@cetc.com.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C6CowAB3umrifOlqFjwrAA--.42651S2
X-CM-SenderInfo: xfkh015lbk5un06fv33fof0zgofq/1tbiAQYACmrok1ITKwABs3
X-CM-DELIVERINFO: =?B?IgZ0PKc9tbm9bwt5VqgwP2Pu2dSP9LtrOQxHOAXUJl/eWtrOBydmTZkAAV6p44o2Ir
	PoOChY5TDxb8V/J8ZyqMAlpTJc4PPPCxTwfkBjArNdB5d8ZmEJtdeMwV/NiTNh8/bckdCn
	m0aKuiFGahnkW5BjWVUXS63m5fBP4I+yjHcEcxE4zvdrmTJxbFT/3/UMpie81g==
X-Coremail-Antispam: 1Uk129KBj93XoW7KrykKw4ruF4DWrWxtw1DArc_yoW8Gr45pa
	yxury8GFy8tF17K39Iya4UGr1YgrWUA3W3XrsYyay5ZF13trs0qF4Iy3WFgFn0q3yaqr4f
	J3Z8J34rXa1UA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3gc02F40EFcxC0VAKzVAqx4xG6I80ewCY02Avz4vE14v_GFUv73VFW2AG
	mfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYz7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2
	IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l
	84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2
	z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
	GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JM4kE6xkIj40Ew7xC0wCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1Y6r17MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
	yTuYvjxUcIJmUUUUU
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 06:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131757
Content-Type: text/plain; charset="utf-8"

From: Chen Qi <chenqi_hycx@cetc.com.cn>

For native recipes, the prefix variable is not '/usr', resulting
in iperf3-native searching for wrong location for ssl.h.

Fix to use the correct location to find ssl.h.

With this fix, iperf3, iperf3-native, nativesdk-iperf3 all succeed
to build.

Signed-off-by: Chen Qi <chenqi_hycx@cetc.com.cn>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_3.22.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.22.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.22.bb
index 31da6f52b9..e6d60f611b 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.22.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.22.bb
@@ -26,7 +26,10 @@ inherit autotools
 PACKAGECONFIG ?= "openssl"
 
 PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sctp_h=no,lksctp-tools"
-PACKAGECONFIG[openssl] = "--with-openssl=${RECIPE_SYSROOT}${prefix},--without-openssl,openssl"
+PACKAGECONFIG[openssl] = "--with-openssl=${OPENSSL_ROOT},--without-openssl,openssl"
+
+OPENSSL_ROOT = "${RECIPE_SYSROOT}${prefix}"
+OPENSSL_ROOT:class-native = "${RECIPE_SYSROOT_NATIVE}${prefix_native}"
 
 CFLAGS += "-D_GNU_SOURCE"
 
-- 
2.43.0

