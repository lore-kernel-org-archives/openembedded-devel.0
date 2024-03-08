Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3814AC54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 09:33:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18159.1709890419221788946
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 01:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Yj7EA6e/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3797c483d2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4287U2Vt015381
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Mar 2024 09:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=wLS1K
	qpemQufGecZ7Y1s0onfg1cC0spb/Fj7h9u5gJw=; b=Yj7EA6e/EMyj5vTCXegM5
	65fx2mrqMof9eLduOqgpQzyw/X4zGM7J14yBG5egPtlD2WfRrbd589oJxcuz0btn
	VZLSd9egpw5l3wMM3KvK6raqMabRRcbF7OU9zpb9BZjjHl/aPBBIoIKIZx2OrJ6S
	czmyexLoHvOtj40fpVSEaSnDXbIshsdOtQVZ+1UoIgAXb83bTiQ9m32JHiPvYsu8
	fpFK0LWiZgx9gqiI1C/D3iNXJt29wa9B4GwP0AfSjfOk5n5t23jN3Z0EeBnnckxJ
	N3DUDqTKclKY0M6FBm57FIsYDA60YIMBOhVphomuJj/WJE585qDOAeipYRYwV5zg
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36e6yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 09:33:37 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 01:33:23 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 01:33:23 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/1] thin-provisioning-tools: 1.0.9 -> 1.0.12
Date: Fri, 8 Mar 2024 01:33:22 -0800
Message-ID: <20240308093323.1220833-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: aUMNeRZVaiL7AVk-sViCIWuJlJ2dpCPp
X-Proofpoint-GUID: aUMNeRZVaiL7AVk-sViCIWuJlJ2dpCPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 09:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109230

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../thin-provisioning-tools-crates.inc        | 242 +++++++-----------
 ...9.bb => thin-provisioning-tools_1.0.12.bb} |   2 +-
 2 files changed, 97 insertions(+), 147 deletions(-)
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_1.0.9.bb => thin-provisioning-tools_1.0.12.bb} (95%)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
index 52a8180d2..d71aa442f 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
@@ -4,28 +4,26 @@
 SRC_URI += " \
     crate://crates.io/adler/1.0.2 \
     crate://crates.io/aho-corasick/1.1.2 \
-    crate://crates.io/anstyle/1.0.4 \
-    crate://crates.io/anyhow/1.0.75 \
+    crate://crates.io/anstyle/1.0.6 \
+    crate://crates.io/anyhow/1.0.80 \
     crate://crates.io/atty/0.2.14 \
     crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/base64/0.21.5 \
+    crate://crates.io/base64/0.21.7 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.4.1 \
-    crate://crates.io/bytemuck/1.14.0 \
+    crate://crates.io/bitflags/2.4.2 \
+    crate://crates.io/bytemuck/1.14.3 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cassowary/0.3.0 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/clap/4.4.11 \
-    crate://crates.io/clap_builder/4.4.11 \
-    crate://crates.io/clap_lex/0.6.0 \
-    crate://crates.io/console/0.15.7 \
-    crate://crates.io/crc32c/0.6.4 \
-    crate://crates.io/crc32fast/1.3.2 \
+    crate://crates.io/clap/4.5.1 \
+    crate://crates.io/clap_builder/4.5.1 \
+    crate://crates.io/clap_lex/0.7.0 \
+    crate://crates.io/console/0.15.8 \
+    crate://crates.io/crc32c/0.6.5 \
+    crate://crates.io/crc32fast/1.4.0 \
     crate://crates.io/data-encoding/2.5.0 \
-    crate://crates.io/difflib/0.4.0 \
     crate://crates.io/downcast/0.11.0 \
-    crate://crates.io/duct/0.13.6 \
-    crate://crates.io/either/1.9.0 \
+    crate://crates.io/duct/0.13.7 \
     crate://crates.io/encode_unicode/0.3.6 \
     crate://crates.io/env_logger/0.8.4 \
     crate://crates.io/errno/0.3.8 \
@@ -33,130 +31,105 @@ SRC_URI += " \
     crate://crates.io/fastrand/2.0.1 \
     crate://crates.io/fixedbitset/0.4.2 \
     crate://crates.io/flate2/1.0.28 \
-    crate://crates.io/float-cmp/0.9.0 \
     crate://crates.io/fragile/2.0.0 \
-    crate://crates.io/getrandom/0.2.11 \
+    crate://crates.io/getrandom/0.2.12 \
     crate://crates.io/hermit-abi/0.1.19 \
-    crate://crates.io/hermit-abi/0.3.3 \
-    crate://crates.io/indicatif/0.17.7 \
+    crate://crates.io/hermit-abi/0.3.6 \
+    crate://crates.io/indicatif/0.17.8 \
     crate://crates.io/instant/0.1.12 \
     crate://crates.io/iovec/0.1.4 \
-    crate://crates.io/itertools/0.10.5 \
     crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.150 \
-    crate://crates.io/linux-raw-sys/0.4.12 \
+    crate://crates.io/libc/0.2.153 \
+    crate://crates.io/linux-raw-sys/0.4.13 \
     crate://crates.io/log/0.4.20 \
-    crate://crates.io/memchr/2.6.4 \
+    crate://crates.io/memchr/2.7.1 \
     crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.7.1 \
-    crate://crates.io/mockall/0.11.4 \
-    crate://crates.io/mockall_derive/0.11.4 \
+    crate://crates.io/miniz_oxide/0.7.2 \
+    crate://crates.io/mockall/0.12.1 \
+    crate://crates.io/mockall_derive/0.12.1 \
     crate://crates.io/nom/7.1.3 \
-    crate://crates.io/normalize-line-endings/0.3.0 \
-    crate://crates.io/num-derive/0.4.1 \
-    crate://crates.io/num-traits/0.2.17 \
+    crate://crates.io/num-derive/0.4.2 \
+    crate://crates.io/num-traits/0.2.18 \
     crate://crates.io/num_cpus/1.16.0 \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/numtoa/0.1.0 \
     crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/os_pipe/1.1.4 \
+    crate://crates.io/os_pipe/1.1.5 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/ppv-lite86/0.2.17 \
-    crate://crates.io/predicates/2.1.5 \
+    crate://crates.io/predicates/3.1.0 \
     crate://crates.io/predicates-core/1.0.6 \
     crate://crates.io/predicates-tree/1.0.9 \
-    crate://crates.io/proc-macro2/1.0.70 \
-    crate://crates.io/quick-xml/0.29.0 \
+    crate://crates.io/proc-macro2/1.0.78 \
+    crate://crates.io/quick-xml/0.31.0 \
     crate://crates.io/quickcheck/1.0.3 \
     crate://crates.io/quickcheck_macros/1.0.0 \
-    crate://crates.io/quote/1.0.33 \
+    crate://crates.io/quote/1.0.35 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
-    crate://crates.io/rangemap/1.4.0 \
+    crate://crates.io/rangemap/1.5.0 \
     crate://crates.io/redox_syscall/0.2.16 \
-    crate://crates.io/redox_syscall/0.4.1 \
     crate://crates.io/redox_termios/0.1.3 \
-    crate://crates.io/regex/1.10.2 \
-    crate://crates.io/regex-automata/0.4.3 \
+    crate://crates.io/regex/1.10.3 \
+    crate://crates.io/regex-automata/0.4.5 \
     crate://crates.io/regex-syntax/0.8.2 \
-    crate://crates.io/retain_mut/0.1.7 \
-    crate://crates.io/roaring/0.10.2 \
+    crate://crates.io/roaring/0.10.3 \
     crate://crates.io/rustc_version/0.4.0 \
-    crate://crates.io/rustix/0.38.27 \
+    crate://crates.io/rustix/0.38.31 \
     crate://crates.io/safemem/0.3.3 \
-    crate://crates.io/semver/1.0.20 \
+    crate://crates.io/semver/1.0.22 \
     crate://crates.io/shared_child/1.0.0 \
-    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/strsim/0.11.0 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.39 \
-    crate://crates.io/tempfile/3.8.1 \
+    crate://crates.io/syn/2.0.50 \
+    crate://crates.io/tempfile/3.10.0 \
     crate://crates.io/termion/1.5.6 \
     crate://crates.io/termtree/0.4.1 \
-    crate://crates.io/thiserror/1.0.50 \
-    crate://crates.io/thiserror-impl/1.0.50 \
+    crate://crates.io/thiserror/1.0.57 \
+    crate://crates.io/thiserror-impl/1.0.57 \
     crate://crates.io/threadpool/1.8.1 \
     crate://crates.io/tui/0.19.0 \
     crate://crates.io/unicode-ident/1.0.12 \
-    crate://crates.io/unicode-segmentation/1.10.1 \
+    crate://crates.io/unicode-segmentation/1.11.0 \
     crate://crates.io/unicode-width/0.1.11 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows-sys/0.45.0 \
-    crate://crates.io/windows-sys/0.48.0 \
     crate://crates.io/windows-sys/0.52.0 \
-    crate://crates.io/windows-targets/0.42.2 \
-    crate://crates.io/windows-targets/0.48.5 \
-    crate://crates.io/windows-targets/0.52.0 \
-    crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
-    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.0 \
-    crate://crates.io/windows_aarch64_msvc/0.42.2 \
-    crate://crates.io/windows_aarch64_msvc/0.48.5 \
-    crate://crates.io/windows_aarch64_msvc/0.52.0 \
-    crate://crates.io/windows_i686_gnu/0.42.2 \
-    crate://crates.io/windows_i686_gnu/0.48.5 \
-    crate://crates.io/windows_i686_gnu/0.52.0 \
-    crate://crates.io/windows_i686_msvc/0.42.2 \
-    crate://crates.io/windows_i686_msvc/0.48.5 \
-    crate://crates.io/windows_i686_msvc/0.52.0 \
-    crate://crates.io/windows_x86_64_gnu/0.42.2 \
-    crate://crates.io/windows_x86_64_gnu/0.48.5 \
-    crate://crates.io/windows_x86_64_gnu/0.52.0 \
-    crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
-    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.0 \
-    crate://crates.io/windows_x86_64_msvc/0.42.2 \
-    crate://crates.io/windows_x86_64_msvc/0.48.5 \
-    crate://crates.io/windows_x86_64_msvc/0.52.0 \
+    crate://crates.io/windows-targets/0.52.3 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.3 \
+    crate://crates.io/windows_aarch64_msvc/0.52.3 \
+    crate://crates.io/windows_i686_gnu/0.52.3 \
+    crate://crates.io/windows_i686_msvc/0.52.3 \
+    crate://crates.io/windows_x86_64_gnu/0.52.3 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.3 \
+    crate://crates.io/windows_x86_64_msvc/0.52.3 \
 "
 
 SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
 SRC_URI[aho-corasick-1.1.2.sha256sum] = "b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0"
-SRC_URI[anstyle-1.0.4.sha256sum] = "7079075b41f533b8c61d2a4d073c4676e1f8b249ff94a393b0595db304e0dd87"
-SRC_URI[anyhow-1.0.75.sha256sum] = "a4668cab20f66d8d020e1fbc0ebe47217433c1b6c8f2040faf858554e394ace6"
+SRC_URI[anstyle-1.0.6.sha256sum] = "8901269c6307e8d93993578286ac0edf7f195079ffff5ebdeea6a59ffb7e36bc"
+SRC_URI[anyhow-1.0.80.sha256sum] = "5ad32ce52e4161730f7098c077cd2ed6229b5804ccf99e5366be1ab72a98b4e1"
 SRC_URI[atty-0.2.14.sha256sum] = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.21.5.sha256sum] = "35636a1494ede3b646cc98f74f8e62c773a38a659ebc777a2cf26b9b74171df9"
+SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.4.1.sha256sum] = "327762f6e5a765692301e5bb513e0d9fef63be86bbc14528052b1cd3e6f03e07"
-SRC_URI[bytemuck-1.14.0.sha256sum] = "374d28ec25809ee0e23827c2ab573d729e293f281dfe393500e7ad618baa61c6"
+SRC_URI[bitflags-2.4.2.sha256sum] = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
+SRC_URI[bytemuck-1.14.3.sha256sum] = "a2ef034f05691a48569bd920a96c81b9d91bbad1ab5ac7c4616c1f6ef36cb79f"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cassowary-0.3.0.sha256sum] = "df8670b8c7b9dae1793364eafadf7239c40d669904660c5960d74cfd80b46a53"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[clap-4.4.11.sha256sum] = "bfaff671f6b22ca62406885ece523383b9b64022e341e53e009a62ebc47a45f2"
-SRC_URI[clap_builder-4.4.11.sha256sum] = "a216b506622bb1d316cd51328dce24e07bdff4a6128a47c7e7fad11878d5adbb"
-SRC_URI[clap_lex-0.6.0.sha256sum] = "702fc72eb24e5a1e48ce58027a675bc24edd52096d5397d4aea7c6dd9eca0bd1"
-SRC_URI[console-0.15.7.sha256sum] = "c926e00cc70edefdc64d3a5ff31cc65bb97a3460097762bd23afb4d8145fccf8"
-SRC_URI[crc32c-0.6.4.sha256sum] = "d8f48d60e5b4d2c53d5c2b1d8a58c849a70ae5e5509b08a48d047e3b65714a74"
-SRC_URI[crc32fast-1.3.2.sha256sum] = "b540bd8bc810d3885c6ea91e2018302f68baba2129ab3e88f32389ee9370880d"
+SRC_URI[clap-4.5.1.sha256sum] = "c918d541ef2913577a0f9566e9ce27cb35b6df072075769e0b26cb5a554520da"
+SRC_URI[clap_builder-4.5.1.sha256sum] = "9f3e7391dad68afb0c2ede1bf619f579a3dc9c2ec67f089baa397123a2f3d1eb"
+SRC_URI[clap_lex-0.7.0.sha256sum] = "98cc8fbded0c607b7ba9dd60cd98df59af97e84d24e49c8557331cfc26d301ce"
+SRC_URI[console-0.15.8.sha256sum] = "0e1f83fc076bd6dd27517eacdf25fef6c4dfe5f1d7448bafaaf3a26f13b5e4eb"
+SRC_URI[crc32c-0.6.5.sha256sum] = "89254598aa9b9fa608de44b3ae54c810f0f06d755e24c50177f1f8f31ff50ce2"
+SRC_URI[crc32fast-1.4.0.sha256sum] = "b3855a8a784b474f333699ef2bbca9db2c4a1f6d9088a90a2d25b1eb53111eaa"
 SRC_URI[data-encoding-2.5.0.sha256sum] = "7e962a19be5cfc3f3bf6dd8f61eb50107f356ad6270fbb3ed41476571db78be5"
-SRC_URI[difflib-0.4.0.sha256sum] = "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
 SRC_URI[downcast-0.11.0.sha256sum] = "1435fa1053d8b2fbbe9be7e97eca7f33d37b28409959813daefc1446a14247f1"
-SRC_URI[duct-0.13.6.sha256sum] = "37ae3fc31835f74c2a7ceda3aeede378b0ae2e74c8f1c36559fcc9ae2a4e7d3e"
-SRC_URI[either-1.9.0.sha256sum] = "a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07"
+SRC_URI[duct-0.13.7.sha256sum] = "e4ab5718d1224b63252cd0c6f74f6480f9ffeb117438a2e0f5cf6d9a4798929c"
 SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
 SRC_URI[env_logger-0.8.4.sha256sum] = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3"
 SRC_URI[errno-0.3.8.sha256sum] = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245"
@@ -164,101 +137,78 @@ SRC_URI[exitcode-1.1.2.sha256sum] = "de853764b47027c2e862a995c34978ffa63c1501f2e
 SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
 SRC_URI[fixedbitset-0.4.2.sha256sum] = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
 SRC_URI[flate2-1.0.28.sha256sum] = "46303f565772937ffe1d394a4fac6f411c6013172fadde9dcdb1e147a086940e"
-SRC_URI[float-cmp-0.9.0.sha256sum] = "98de4bbd547a563b716d8dfa9aad1cb19bfab00f4fa09a6a4ed21dbcf44ce9c4"
 SRC_URI[fragile-2.0.0.sha256sum] = "6c2141d6d6c8512188a7891b4b01590a45f6dac67afb4f255c4124dbb86d4eaa"
-SRC_URI[getrandom-0.2.11.sha256sum] = "fe9006bed769170c11f845cf00c7c1e9092aeb3f268e007c3e760ac68008070f"
+SRC_URI[getrandom-0.2.12.sha256sum] = "190092ea657667030ac6a35e305e62fc4dd69fd98ac98631e5d3a2b1575a12b5"
 SRC_URI[hermit-abi-0.1.19.sha256sum] = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
-SRC_URI[hermit-abi-0.3.3.sha256sum] = "d77f7ec81a6d05a3abb01ab6eb7590f6083d08449fe5a1c8b1e620283546ccb7"
-SRC_URI[indicatif-0.17.7.sha256sum] = "fb28741c9db9a713d93deb3bb9515c20788cef5815265bee4980e87bde7e0f25"
+SRC_URI[hermit-abi-0.3.6.sha256sum] = "bd5256b483761cd23699d0da46cc6fd2ee3be420bbe6d020ae4a091e70b7e9fd"
+SRC_URI[indicatif-0.17.8.sha256sum] = "763a5a8f45087d6bcea4222e7b72c291a054edf80e4ef6efd2a4979878c7bea3"
 SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
 SRC_URI[iovec-0.1.4.sha256sum] = "b2b3ea6ff95e175473f8ffe6a7eb7c00d054240321b84c57051175fe3c1e075e"
-SRC_URI[itertools-0.10.5.sha256sum] = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
-SRC_URI[libc-0.2.150.sha256sum] = "89d92a4743f9a61002fae18374ed11e7973f530cb3a3255fb354818118b2203c"
-SRC_URI[linux-raw-sys-0.4.12.sha256sum] = "c4cd1a83af159aa67994778be9070f0ae1bd732942279cabb14f86f986a21456"
+SRC_URI[libc-0.2.153.sha256sum] = "9c198f91728a82281a64e1f4f9eeb25d82cb32a5de251c6bd1b5154d63a8e7bd"
+SRC_URI[linux-raw-sys-0.4.13.sha256sum] = "01cda141df6706de531b6c46c3a33ecca755538219bd484262fa09410c13539c"
 SRC_URI[log-0.4.20.sha256sum] = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
-SRC_URI[memchr-2.6.4.sha256sum] = "f665ee40bc4a3c5590afb1e9677db74a508659dfd71e126420da8274909a0167"
+SRC_URI[memchr-2.7.1.sha256sum] = "523dc4f511e55ab87b694dc30d0f820d60906ef06413f93d4d7a1385599cc149"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[miniz_oxide-0.7.1.sha256sum] = "e7810e0be55b428ada41041c41f32c9f1a42817901b4ccf45fa3d4b6561e74c7"
-SRC_URI[mockall-0.11.4.sha256sum] = "4c84490118f2ee2d74570d114f3d0493cbf02790df303d2707606c3e14e07c96"
-SRC_URI[mockall_derive-0.11.4.sha256sum] = "22ce75669015c4f47b289fd4d4f56e894e4c96003ffdf3ac51313126f94c6cbb"
+SRC_URI[miniz_oxide-0.7.2.sha256sum] = "9d811f3e15f28568be3407c8e7fdb6514c1cda3cb30683f15b6a1a1dc4ea14a7"
+SRC_URI[mockall-0.12.1.sha256sum] = "43766c2b5203b10de348ffe19f7e54564b64f3d6018ff7648d1e2d6d3a0f0a48"
+SRC_URI[mockall_derive-0.12.1.sha256sum] = "af7cbce79ec385a1d4f54baa90a76401eb15d9cab93685f62e7e9f942aa00ae2"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
-SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
-SRC_URI[num-derive-0.4.1.sha256sum] = "cfb77679af88f8b125209d354a202862602672222e7f2313fdd6dc349bad4712"
-SRC_URI[num-traits-0.2.17.sha256sum] = "39e3200413f237f41ab11ad6d161bc7239c84dcb631773ccd7de3dfe4b5c267c"
+SRC_URI[num-derive-0.4.2.sha256sum] = "ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202"
+SRC_URI[num-traits-0.2.18.sha256sum] = "da0df0e5185db44f69b44f26786fe401b6c293d1907744beaa7fa62b2e5a517a"
 SRC_URI[num_cpus-1.16.0.sha256sum] = "4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[numtoa-0.1.0.sha256sum] = "b8f8bdf33df195859076e54ab11ee78a1b208382d3a26ec40d142ffc1ecc49ef"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[os_pipe-1.1.4.sha256sum] = "0ae859aa07428ca9a929b936690f8b12dc5f11dd8c6992a18ca93919f28bc177"
+SRC_URI[os_pipe-1.1.5.sha256sum] = "57119c3b893986491ec9aa85056780d3a0f3cf4da7cc09dd3650dbd6c6738fb9"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
-SRC_URI[predicates-2.1.5.sha256sum] = "59230a63c37f3e18569bdb90e4a89cbf5bf8b06fea0b84e65ea10cc4df47addd"
+SRC_URI[predicates-3.1.0.sha256sum] = "68b87bfd4605926cdfefc1c3b5f8fe560e3feca9d5552cf68c466d3d8236c7e8"
 SRC_URI[predicates-core-1.0.6.sha256sum] = "b794032607612e7abeb4db69adb4e33590fa6cf1149e95fd7cb00e634b92f174"
 SRC_URI[predicates-tree-1.0.9.sha256sum] = "368ba315fb8c5052ab692e68a0eefec6ec57b23a36959c14496f0b0df2c0cecf"
-SRC_URI[proc-macro2-1.0.70.sha256sum] = "39278fbbf5fb4f646ce651690877f89d1c5811a3d4acb27700c1cb3cdb78fd3b"
-SRC_URI[quick-xml-0.29.0.sha256sum] = "81b9228215d82c7b61490fec1de287136b5de6f5700f6e58ea9ad61a7964ca51"
+SRC_URI[proc-macro2-1.0.78.sha256sum] = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
+SRC_URI[quick-xml-0.31.0.sha256sum] = "1004a344b30a54e2ee58d66a71b32d2db2feb0a31f9a2d302bf0536f15de2a33"
 SRC_URI[quickcheck-1.0.3.sha256sum] = "588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6"
 SRC_URI[quickcheck_macros-1.0.0.sha256sum] = "b22a693222d716a9587786f37ac3f6b4faedb5b80c23914e7303ff5a1d8016e9"
-SRC_URI[quote-1.0.33.sha256sum] = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae"
+SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
-SRC_URI[rangemap-1.4.0.sha256sum] = "977b1e897f9d764566891689e642653e5ed90c6895106acd005eb4c1d0203991"
+SRC_URI[rangemap-1.5.0.sha256sum] = "795915a3930a5d6bafd9053d37602fea3e61be2e5d4d788983a8ba9654c1c6f2"
 SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
-SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
 SRC_URI[redox_termios-0.1.3.sha256sum] = "20145670ba436b55d91fc92d25e71160fbfbdd57831631c8d7d36377a476f1cb"
-SRC_URI[regex-1.10.2.sha256sum] = "380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343"
-SRC_URI[regex-automata-0.4.3.sha256sum] = "5f804c7828047e88b2d32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f"
+SRC_URI[regex-1.10.3.sha256sum] = "b62dbe01f0b06f9d8dc7d49e05a0785f153b00b2c227856282f671e0318c9b15"
+SRC_URI[regex-automata-0.4.5.sha256sum] = "5bb987efffd3c6d0d8f5f89510bb458559eab11e4f869acb20bf845e016259cd"
 SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
-SRC_URI[retain_mut-0.1.7.sha256sum] = "8c31b5c4033f8fdde8700e4657be2c497e7288f01515be52168c631e2e4d4086"
-SRC_URI[roaring-0.10.2.sha256sum] = "6106b5cf8587f5834158895e9715a3c6c9716c8aefab57f1f7680917191c7873"
+SRC_URI[roaring-0.10.3.sha256sum] = "a1c77081a55300e016cb86f2864415b7518741879db925b8d488a0ee0d2da6bf"
 SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
-SRC_URI[rustix-0.38.27.sha256sum] = "bfeae074e687625746172d639330f1de242a178bf3189b51e35a7a21573513ac"
+SRC_URI[rustix-0.38.31.sha256sum] = "6ea3e1a662af26cd7a3ba09c0297a31af215563ecf42817c98df621387f4e949"
 SRC_URI[safemem-0.3.3.sha256sum] = "ef703b7cb59335eae2eb93ceb664c0eb7ea6bf567079d843e09420219668e072"
-SRC_URI[semver-1.0.20.sha256sum] = "836fa6a3e1e547f9a2c4040802ec865b5d85f4014efe00555d7090a3dcaa1090"
+SRC_URI[semver-1.0.22.sha256sum] = "92d43fe69e652f3df9bdc2b85b2854a0825b86e4fb76bc44d945137d053639ca"
 SRC_URI[shared_child-1.0.0.sha256sum] = "b0d94659ad3c2137fef23ae75b03d5241d633f8acded53d672decfa0e6e0caef"
-SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
+SRC_URI[strsim-0.11.0.sha256sum] = "5ee073c9e4cd00e28217186dbe12796d692868f432bf2e97ee73bed0c56dfa01"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.39.sha256sum] = "23e78b90f2fcf45d3e842032ce32e3f2d1545ba6636271dcbf24fa306d87be7a"
-SRC_URI[tempfile-3.8.1.sha256sum] = "7ef1adac450ad7f4b3c28589471ade84f25f731a7a0fe30d71dfa9f60fd808e5"
+SRC_URI[syn-2.0.50.sha256sum] = "74f1bdc9872430ce9b75da68329d1c1746faf50ffac5f19e02b71e37ff881ffb"
+SRC_URI[tempfile-3.10.0.sha256sum] = "a365e8cd18e44762ef95d87f284f4b5cd04107fec2ff3052bd6a3e6069669e67"
 SRC_URI[termion-1.5.6.sha256sum] = "077185e2eac69c3f8379a4298e1e07cd36beb962290d4a51199acf0fdc10607e"
 SRC_URI[termtree-0.4.1.sha256sum] = "3369f5ac52d5eb6ab48c6b4ffdc8efbcad6b89c765749064ba298f2c68a16a76"
-SRC_URI[thiserror-1.0.50.sha256sum] = "f9a7210f5c9a7156bb50aa36aed4c95afb51df0df00713949448cf9e97d382d2"
-SRC_URI[thiserror-impl-1.0.50.sha256sum] = "266b2e40bc00e5a6c09c3584011e08b06f123c00362c92b975ba9843aaaa14b8"
+SRC_URI[thiserror-1.0.57.sha256sum] = "1e45bcbe8ed29775f228095caf2cd67af7a4ccf756ebff23a306bf3e8b47b24b"
+SRC_URI[thiserror-impl-1.0.57.sha256sum] = "a953cb265bef375dae3de6663da4d3804eee9682ea80d8e2542529b73c531c81"
 SRC_URI[threadpool-1.8.1.sha256sum] = "d050e60b33d41c19108b32cea32164033a9013fe3b46cbd4457559bfbf77afaa"
 SRC_URI[tui-0.19.0.sha256sum] = "ccdd26cbd674007e649a272da4475fb666d3aa0ad0531da7136db6fab0e5bad1"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
-SRC_URI[unicode-segmentation-1.10.1.sha256sum] = "1dd624098567895118886609431a7c3b8f516e41d30e0643f03d94592a147e36"
+SRC_URI[unicode-segmentation-1.11.0.sha256sum] = "d4c87d22b6e3f4a18d4d40ef354e97c90fcb14dd91d7dc0aa9d8a1172ebf7202"
 SRC_URI[unicode-width-0.1.11.sha256sum] = "e51733f11c9c4f72aa0c160008246859e340b00807569a0da0e7a1079b27ba85"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
-SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
-SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
-SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
-SRC_URI[windows-targets-0.52.0.sha256sum] = "8a18201040b24831fbb9e4eb208f8892e1f50a37feb53cc7ff887feb8f50e7cd"
-SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
-SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-SRC_URI[windows_aarch64_gnullvm-0.52.0.sha256sum] = "cb7764e35d4db8a7921e09562a0304bf2f93e0a51bfccee0bd0bb0b666b015ea"
-SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
-SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-SRC_URI[windows_aarch64_msvc-0.52.0.sha256sum] = "bbaa0368d4f1d2aaefc55b6fcfee13f41544ddf36801e793edbbfd7d7df075ef"
-SRC_URI[windows_i686_gnu-0.42.2.sha256sum] = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
-SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
-SRC_URI[windows_i686_gnu-0.52.0.sha256sum] = "a28637cb1fa3560a16915793afb20081aba2c92ee8af57b4d5f28e4b3e7df313"
-SRC_URI[windows_i686_msvc-0.42.2.sha256sum] = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
-SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
-SRC_URI[windows_i686_msvc-0.52.0.sha256sum] = "ffe5e8e31046ce6230cc7215707b816e339ff4d4d67c65dffa206fd0f7aa7b9a"
-SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
-SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-SRC_URI[windows_x86_64_gnu-0.52.0.sha256sum] = "3d6fa32db2bc4a2f5abeacf2b69f7992cd09dca97498da74a151a3132c26befd"
-SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
-SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-SRC_URI[windows_x86_64_gnullvm-0.52.0.sha256sum] = "1a657e1e9d3f514745a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e"
-SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
-SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
-SRC_URI[windows_x86_64_msvc-0.52.0.sha256sum] = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
+SRC_URI[windows-targets-0.52.3.sha256sum] = "d380ba1dc7187569a8a9e91ed34b8ccfc33123bbacb8c0aed2d1ad7f3ef2dc5f"
+SRC_URI[windows_aarch64_gnullvm-0.52.3.sha256sum] = "68e5dcfb9413f53afd9c8f86e56a7b4d86d9a2fa26090ea2dc9e40fba56c6ec6"
+SRC_URI[windows_aarch64_msvc-0.52.3.sha256sum] = "8dab469ebbc45798319e69eebf92308e541ce46760b49b18c6b3fe5e8965b30f"
+SRC_URI[windows_i686_gnu-0.52.3.sha256sum] = "2a4e9b6a7cac734a8b4138a4e1044eac3404d8326b6c0f939276560687a033fb"
+SRC_URI[windows_i686_msvc-0.52.3.sha256sum] = "28b0ec9c422ca95ff34a78755cfa6ad4a51371da2a5ace67500cf7ca5f232c58"
+SRC_URI[windows_x86_64_gnu-0.52.3.sha256sum] = "704131571ba93e89d7cd43482277d6632589b18ecf4468f591fbae0a8b101614"
+SRC_URI[windows_x86_64_gnullvm-0.52.3.sha256sum] = "42079295511643151e98d61c38c0acc444e52dd42ab456f7ccfd5152e8ecf21c"
+SRC_URI[windows_x86_64_msvc-0.52.3.sha256sum] = "0770833d60a970638e989b3fa9fd2bb1aaadcf88963d1659fd7d9990196ed2d6"
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.9.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb
similarity index 95%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.9.bb
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb
index b79fdb1a0..11b586618 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.9.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     git://github.com/jthornber/thin-provisioning-tools;branch=main;protocol=https \
     "
 
-SRCREV = "1d60839b0a920df6476712b80f933854fb32e160"
+SRCREV = "b2d57dad4c3378544d7b36f3fc61e60989c5c092"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cargo cargo-update-recipe-crates
-- 
2.42.0


