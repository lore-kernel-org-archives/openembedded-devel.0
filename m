Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76F5C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 03:46:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.240.1740455159504973916
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 19:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4151a86dad=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P2j2T1003825
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 19:45:59 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44yeyqjpre-12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 19:45:59 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 24 Feb 2025 19:45:58 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 24 Feb 2025 19:45:58 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] thin-provisioning-tools: 1.0.13 -> 1.0.14
Date: Mon, 24 Feb 2025 19:45:57 -0800
Message-ID: <20250225034557.2148517-2-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250225034557.2148517-1-liezhi.yang@windriver.com>
References: <20250225034557.2148517-1-liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=AbBLH2XG c=1 sm=1 tr=0 ts=67bd3cf7 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=5AG1w7zTHs_C87zGIUAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: oePxzwIgsPfX4xrdJtvgk4OL-y3WGcli
X-Proofpoint-GUID: oePxzwIgsPfX4xrdJtvgk4OL-y3WGcli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_01,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 03:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115557

From: Robert Yang <liezhi.yang@windriver.com>

* License-Update: Update links in GPLv3 (http -> https)

* It need depend on pkg-config, udev and clang-native to build

* Move it to dynamic-layers since now it depends on meta-clang.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../thin-provisioning-tools-crates.inc        | 124 +++++++++++++-----
 .../thin-provisioning-tools-git-crates.inc    |   0
 .../thin-provisioning-tools_1.0.14.bb}        |  10 +-
 3 files changed, 102 insertions(+), 32 deletions(-)
 rename meta-oe/{ => dynamic-layers/clang-layer}/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc (66%)
 rename meta-oe/{ => dynamic-layers/clang-layer}/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc (100%)
 rename meta-oe/{recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.13.bb => dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.14.bb} (82%)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
similarity index 66%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
rename to meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
index c5c059dd1a..a49704fe21 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
@@ -4,28 +4,42 @@
 SRC_URI += " \
     crate://crates.io/adler/1.0.2 \
     crate://crates.io/aho-corasick/1.1.3 \
-    crate://crates.io/anstyle/1.0.7 \
+    crate://crates.io/anstream/0.6.15 \
+    crate://crates.io/anstyle/1.0.8 \
+    crate://crates.io/anstyle-parse/0.2.5 \
+    crate://crates.io/anstyle-query/1.1.1 \
+    crate://crates.io/anstyle-wincon/3.0.4 \
     crate://crates.io/anyhow/1.0.86 \
     crate://crates.io/atty/0.2.14 \
     crate://crates.io/autocfg/1.3.0 \
     crate://crates.io/base64/0.22.1 \
+    crate://crates.io/bindgen/0.69.4 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.6.0 \
     crate://crates.io/bytemuck/1.16.1 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cassowary/0.3.0 \
+    crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/clap/4.5.9 \
-    crate://crates.io/clap_builder/4.5.9 \
-    crate://crates.io/clap_lex/0.7.1 \
+    crate://crates.io/cfg_aliases/0.2.1 \
+    crate://crates.io/clang-sys/1.8.1 \
+    crate://crates.io/clap/4.5.11 \
+    crate://crates.io/clap_builder/4.5.11 \
+    crate://crates.io/clap_lex/0.7.2 \
+    crate://crates.io/colorchoice/1.0.2 \
     crate://crates.io/console/0.15.8 \
     crate://crates.io/crc32c/0.6.8 \
     crate://crates.io/crc32fast/1.4.2 \
     crate://crates.io/data-encoding/2.6.0 \
+    crate://crates.io/devicemapper/0.34.3 \
+    crate://crates.io/devicemapper-sys/0.3.0 \
     crate://crates.io/downcast/0.11.0 \
     crate://crates.io/duct/0.13.7 \
+    crate://crates.io/either/1.13.0 \
     crate://crates.io/encode_unicode/0.3.6 \
+    crate://crates.io/env_filter/0.1.2 \
     crate://crates.io/env_logger/0.8.4 \
+    crate://crates.io/env_logger/0.11.5 \
     crate://crates.io/errno/0.3.9 \
     crate://crates.io/exitcode/1.1.2 \
     crate://crates.io/fastrand/2.1.0 \
@@ -33,20 +47,28 @@ SRC_URI += " \
     crate://crates.io/flate2/1.0.30 \
     crate://crates.io/fragile/2.0.0 \
     crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/glob/0.3.1 \
     crate://crates.io/hermit-abi/0.1.19 \
     crate://crates.io/hermit-abi/0.3.9 \
+    crate://crates.io/humantime/2.1.0 \
     crate://crates.io/indicatif/0.17.8 \
     crate://crates.io/instant/0.1.13 \
     crate://crates.io/iovec/0.1.4 \
+    crate://crates.io/is_terminal_polyfill/1.70.1 \
+    crate://crates.io/itertools/0.12.1 \
     crate://crates.io/lazy_static/1.5.0 \
+    crate://crates.io/lazycell/1.3.0 \
     crate://crates.io/libc/0.2.155 \
+    crate://crates.io/libloading/0.8.5 \
+    crate://crates.io/libudev-sys/0.1.4 \
     crate://crates.io/linux-raw-sys/0.4.14 \
     crate://crates.io/log/0.4.22 \
     crate://crates.io/memchr/2.7.4 \
     crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/miniz_oxide/0.7.4 \
-    crate://crates.io/mockall/0.12.1 \
-    crate://crates.io/mockall_derive/0.12.1 \
+    crate://crates.io/mockall/0.13.0 \
+    crate://crates.io/mockall_derive/0.13.0 \
+    crate://crates.io/nix/0.29.0 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/num-derive/0.4.2 \
     crate://crates.io/num-traits/0.2.19 \
@@ -55,13 +77,14 @@ SRC_URI += " \
     crate://crates.io/numtoa/0.1.0 \
     crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/os_pipe/1.2.0 \
-    crate://crates.io/portable-atomic/1.6.0 \
-    crate://crates.io/ppv-lite86/0.2.17 \
-    crate://crates.io/predicates/3.1.0 \
-    crate://crates.io/predicates-core/1.0.6 \
-    crate://crates.io/predicates-tree/1.0.9 \
+    crate://crates.io/pkg-config/0.3.30 \
+    crate://crates.io/portable-atomic/1.7.0 \
+    crate://crates.io/ppv-lite86/0.2.19 \
+    crate://crates.io/predicates/3.1.2 \
+    crate://crates.io/predicates-core/1.0.8 \
+    crate://crates.io/predicates-tree/1.0.11 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/quick-xml/0.36.0 \
+    crate://crates.io/quick-xml/0.36.1 \
     crate://crates.io/quickcheck/1.0.3 \
     crate://crates.io/quickcheck_macros/1.0.0 \
     crate://crates.io/quote/1.0.36 \
@@ -74,25 +97,32 @@ SRC_URI += " \
     crate://crates.io/regex/1.10.5 \
     crate://crates.io/regex-automata/0.4.7 \
     crate://crates.io/regex-syntax/0.8.4 \
+    crate://crates.io/retry/2.0.0 \
     crate://crates.io/roaring/0.10.6 \
+    crate://crates.io/rustc-hash/1.1.0 \
     crate://crates.io/rustc_version/0.4.0 \
     crate://crates.io/rustix/0.38.34 \
     crate://crates.io/safemem/0.3.3 \
     crate://crates.io/semver/1.0.23 \
+    crate://crates.io/serde/1.0.204 \
+    crate://crates.io/serde_derive/1.0.204 \
     crate://crates.io/shared_child/1.0.0 \
+    crate://crates.io/shlex/1.3.0 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.70 \
+    crate://crates.io/syn/2.0.72 \
     crate://crates.io/tempfile/3.10.1 \
     crate://crates.io/termion/1.5.6 \
     crate://crates.io/termtree/0.4.1 \
-    crate://crates.io/thiserror/1.0.61 \
-    crate://crates.io/thiserror-impl/1.0.61 \
+    crate://crates.io/thiserror/1.0.63 \
+    crate://crates.io/thiserror-impl/1.0.63 \
     crate://crates.io/threadpool/1.8.1 \
     crate://crates.io/tui/0.19.0 \
+    crate://crates.io/udev/0.7.0 \
     crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unicode-segmentation/1.11.0 \
     crate://crates.io/unicode-width/0.1.13 \
+    crate://crates.io/utf8parse/0.2.2 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
@@ -107,32 +137,48 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_gnu/0.52.6 \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/zerocopy/0.7.35 \
+    crate://crates.io/zerocopy-derive/0.7.35 \
 "
 
 SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
 SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
-SRC_URI[anstyle-1.0.7.sha256sum] = "038dfcf04a5feb68e9c60b21c9625a54c2c0616e79b72b0fd87075a056ae1d1b"
+SRC_URI[anstream-0.6.15.sha256sum] = "64e15c1ab1f89faffbf04a634d5e1962e9074f2741eef6d97f3c4e322426d526"
+SRC_URI[anstyle-1.0.8.sha256sum] = "1bec1de6f59aedf83baf9ff929c98f2ad654b97c9510f4e70cf6f661d49fd5b1"
+SRC_URI[anstyle-parse-0.2.5.sha256sum] = "eb47de1e80c2b463c735db5b217a0ddc39d612e7ac9e2e96a5aed1f57616c1cb"
+SRC_URI[anstyle-query-1.1.1.sha256sum] = "6d36fc52c7f6c869915e99412912f22093507da8d9e942ceaf66fe4b7c14422a"
+SRC_URI[anstyle-wincon-3.0.4.sha256sum] = "5bf74e1b6e971609db8ca7a9ce79fd5768ab6ae46441c572e46cf596f59e57f8"
 SRC_URI[anyhow-1.0.86.sha256sum] = "b3d1d046238990b9cf5bcde22a3fb3584ee5cf65fb2765f454ed428c7a0063da"
 SRC_URI[atty-0.2.14.sha256sum] = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
 SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
+SRC_URI[bindgen-0.69.4.sha256sum] = "a00dc851838a2120612785d195287475a3ac45514741da670b735818822129a0"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
 SRC_URI[bytemuck-1.16.1.sha256sum] = "b236fc92302c97ed75b38da1f4917b5cdda4984745740f153a5d3059e48d725e"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cassowary-0.3.0.sha256sum] = "df8670b8c7b9dae1793364eafadf7239c40d669904660c5960d74cfd80b46a53"
+SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[clap-4.5.9.sha256sum] = "64acc1846d54c1fe936a78dc189c34e28d3f5afc348403f28ecf53660b9b8462"
-SRC_URI[clap_builder-4.5.9.sha256sum] = "6fb8393d67ba2e7bfaf28a23458e4e2b543cc73a99595511eb207fdb8aede942"
-SRC_URI[clap_lex-0.7.1.sha256sum] = "4b82cf0babdbd58558212896d1a4272303a57bdb245c2bf1147185fb45640e70"
+SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
+SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
+SRC_URI[clap-4.5.11.sha256sum] = "35723e6a11662c2afb578bcf0b88bf6ea8e21282a953428f240574fcc3a2b5b3"
+SRC_URI[clap_builder-4.5.11.sha256sum] = "49eb96cbfa7cfa35017b7cd548c75b14c3118c98b423041d70562665e07fb0fa"
+SRC_URI[clap_lex-0.7.2.sha256sum] = "1462739cb27611015575c0c11df5df7601141071f07518d56fcc1be504cbec97"
+SRC_URI[colorchoice-1.0.2.sha256sum] = "d3fd119d74b830634cea2a0f58bbd0d54540518a14397557951e79340abc28c0"
 SRC_URI[console-0.15.8.sha256sum] = "0e1f83fc076bd6dd27517eacdf25fef6c4dfe5f1d7448bafaaf3a26f13b5e4eb"
 SRC_URI[crc32c-0.6.8.sha256sum] = "3a47af21622d091a8f0fb295b88bc886ac74efcc613efc19f5d0b21de5c89e47"
 SRC_URI[crc32fast-1.4.2.sha256sum] = "a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3"
 SRC_URI[data-encoding-2.6.0.sha256sum] = "e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2"
+SRC_URI[devicemapper-0.34.3.sha256sum] = "59209790c5d189070a52937581950947207e740fadc87f68af14f34d0eb333df"
+SRC_URI[devicemapper-sys-0.3.0.sha256sum] = "3d6681f5413e2094480381a97b8299f548c0579f07095ee20fe58e0a28cb34b5"
 SRC_URI[downcast-0.11.0.sha256sum] = "1435fa1053d8b2fbbe9be7e97eca7f33d37b28409959813daefc1446a14247f1"
 SRC_URI[duct-0.13.7.sha256sum] = "e4ab5718d1224b63252cd0c6f74f6480f9ffeb117438a2e0f5cf6d9a4798929c"
+SRC_URI[either-1.13.0.sha256sum] = "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
 SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
+SRC_URI[env_filter-0.1.2.sha256sum] = "4f2c92ceda6ceec50f43169f9ee8424fe2db276791afde7b2cd8bc084cb376ab"
 SRC_URI[env_logger-0.8.4.sha256sum] = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3"
+SRC_URI[env_logger-0.11.5.sha256sum] = "e13fa619b91fb2381732789fc5de83b45675e882f66623b7d8cb4f643017018d"
 SRC_URI[errno-0.3.9.sha256sum] = "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
 SRC_URI[exitcode-1.1.2.sha256sum] = "de853764b47027c2e862a995c34978ffa63c1501f2e15f987ba11bd4f9bba193"
 SRC_URI[fastrand-2.1.0.sha256sum] = "9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a"
@@ -140,20 +186,28 @@ SRC_URI[fixedbitset-0.4.2.sha256sum] = "0ce7134b9999ecaf8bcd65542e436736ef32ddca
 SRC_URI[flate2-1.0.30.sha256sum] = "5f54427cfd1c7829e2a139fcefea601bf088ebca651d2bf53ebc600eac295dae"
 SRC_URI[fragile-2.0.0.sha256sum] = "6c2141d6d6c8512188a7891b4b01590a45f6dac67afb4f255c4124dbb86d4eaa"
 SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
 SRC_URI[hermit-abi-0.1.19.sha256sum] = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
 SRC_URI[hermit-abi-0.3.9.sha256sum] = "d231dfb89cfffdbc30e7fc41579ed6066ad03abda9e567ccafae602b97ec5024"
+SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
 SRC_URI[indicatif-0.17.8.sha256sum] = "763a5a8f45087d6bcea4222e7b72c291a054edf80e4ef6efd2a4979878c7bea3"
 SRC_URI[instant-0.1.13.sha256sum] = "e0242819d153cba4b4b05a5a8f2a7e9bbf97b6055b2a002b395c96b5ff3c0222"
 SRC_URI[iovec-0.1.4.sha256sum] = "b2b3ea6ff95e175473f8ffe6a7eb7c00d054240321b84c57051175fe3c1e075e"
+SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] = "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
+SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
+SRC_URI[lazycell-1.3.0.sha256sum] = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
 SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[libloading-0.8.5.sha256sum] = "4979f22fdb869068da03c9f7528f8297c6fd2606bc3a4affe42e6a823fdb8da4"
+SRC_URI[libudev-sys-0.1.4.sha256sum] = "3c8469b4a23b962c1396b9b451dda50ef5b283e8dd309d69033475fa9b334324"
 SRC_URI[linux-raw-sys-0.4.14.sha256sum] = "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
 SRC_URI[log-0.4.22.sha256sum] = "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
 SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[miniz_oxide-0.7.4.sha256sum] = "b8a240ddb74feaf34a79a7add65a741f3167852fba007066dcac1ca548d89c08"
-SRC_URI[mockall-0.12.1.sha256sum] = "43766c2b5203b10de348ffe19f7e54564b64f3d6018ff7648d1e2d6d3a0f0a48"
-SRC_URI[mockall_derive-0.12.1.sha256sum] = "af7cbce79ec385a1d4f54baa90a76401eb15d9cab93685f62e7e9f942aa00ae2"
+SRC_URI[mockall-0.13.0.sha256sum] = "d4c28b3fb6d753d28c20e826cd46ee611fda1cf3cde03a443a974043247c065a"
+SRC_URI[mockall_derive-0.13.0.sha256sum] = "341014e7f530314e9a1fdbc7400b244efea7122662c96bfa248c31da5bfb2020"
+SRC_URI[nix-0.29.0.sha256sum] = "71e2746dc3a24dd78b3cfcb7be93368c6de9963d30f43a6a73998a9cf4b17b46"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[num-derive-0.4.2.sha256sum] = "ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
@@ -162,13 +216,14 @@ SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7
 SRC_URI[numtoa-0.1.0.sha256sum] = "b8f8bdf33df195859076e54ab11ee78a1b208382d3a26ec40d142ffc1ecc49ef"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[os_pipe-1.2.0.sha256sum] = "29d73ba8daf8fac13b0501d1abeddcfe21ba7401ada61a819144b6c2a4f32209"
-SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
-SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
-SRC_URI[predicates-3.1.0.sha256sum] = "68b87bfd4605926cdfefc1c3b5f8fe560e3feca9d5552cf68c466d3d8236c7e8"
-SRC_URI[predicates-core-1.0.6.sha256sum] = "b794032607612e7abeb4db69adb4e33590fa6cf1149e95fd7cb00e634b92f174"
-SRC_URI[predicates-tree-1.0.9.sha256sum] = "368ba315fb8c5052ab692e68a0eefec6ec57b23a36959c14496f0b0df2c0cecf"
+SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
+SRC_URI[portable-atomic-1.7.0.sha256sum] = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
+SRC_URI[ppv-lite86-0.2.19.sha256sum] = "2288c0e17cc8d342c712bb43a257a80ebffce59cdb33d5000d8348f3ec02528b"
+SRC_URI[predicates-3.1.2.sha256sum] = "7e9086cc7640c29a356d1a29fd134380bee9d8f79a17410aa76e7ad295f42c97"
+SRC_URI[predicates-core-1.0.8.sha256sum] = "ae8177bee8e75d6846599c6b9ff679ed51e882816914eec639944d7c9aa11931"
+SRC_URI[predicates-tree-1.0.11.sha256sum] = "41b740d195ed3166cd147c8047ec98db0e22ec019eb8eeb76d343b795304fb13"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[quick-xml-0.36.0.sha256sum] = "4091e032efecb09d7b1f711f487b85ab925632a842627e3200fb088382cde32c"
+SRC_URI[quick-xml-0.36.1.sha256sum] = "96a05e2e8efddfa51a84ca47cec303fac86c8541b686d37cac5efc0e094417bc"
 SRC_URI[quickcheck-1.0.3.sha256sum] = "588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6"
 SRC_URI[quickcheck_macros-1.0.0.sha256sum] = "b22a693222d716a9587786f37ac3f6b4faedb5b80c23914e7303ff5a1d8016e9"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
@@ -181,25 +236,32 @@ SRC_URI[redox_termios-0.1.3.sha256sum] = "20145670ba436b55d91fc92d25e71160fbfbdd
 SRC_URI[regex-1.10.5.sha256sum] = "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
 SRC_URI[regex-automata-0.4.7.sha256sum] = "38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df"
 SRC_URI[regex-syntax-0.8.4.sha256sum] = "7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b"
+SRC_URI[retry-2.0.0.sha256sum] = "9166d72162de3575f950507683fac47e30f6f2c3836b71b7fbc61aa517c9c5f4"
 SRC_URI[roaring-0.10.6.sha256sum] = "8f4b84ba6e838ceb47b41de5194a60244fac43d9fe03b71dbe8c5a201081d6d1"
+SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
 SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
 SRC_URI[rustix-0.38.34.sha256sum] = "70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f"
 SRC_URI[safemem-0.3.3.sha256sum] = "ef703b7cb59335eae2eb93ceb664c0eb7ea6bf567079d843e09420219668e072"
 SRC_URI[semver-1.0.23.sha256sum] = "61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b"
+SRC_URI[serde-1.0.204.sha256sum] = "bc76f558e0cbb2a839d37354c575f1dc3fdc6546b5be373ba43d95f231bf7c12"
+SRC_URI[serde_derive-1.0.204.sha256sum] = "e0cd7e117be63d3c3678776753929474f3b04a43a080c744d6b0ae2a8c28e222"
 SRC_URI[shared_child-1.0.0.sha256sum] = "b0d94659ad3c2137fef23ae75b03d5241d633f8acded53d672decfa0e6e0caef"
+SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.70.sha256sum] = "2f0209b68b3613b093e0ec905354eccaedcfe83b8cb37cbdeae64026c3064c16"
+SRC_URI[syn-2.0.72.sha256sum] = "dc4b9b9bf2add8093d3f2c0204471e951b2285580335de42f9d2534f3ae7a8af"
 SRC_URI[tempfile-3.10.1.sha256sum] = "85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1"
 SRC_URI[termion-1.5.6.sha256sum] = "077185e2eac69c3f8379a4298e1e07cd36beb962290d4a51199acf0fdc10607e"
 SRC_URI[termtree-0.4.1.sha256sum] = "3369f5ac52d5eb6ab48c6b4ffdc8efbcad6b89c765749064ba298f2c68a16a76"
-SRC_URI[thiserror-1.0.61.sha256sum] = "c546c80d6be4bc6a00c0f01730c08df82eaa7a7a61f11d656526506112cc1709"
-SRC_URI[thiserror-impl-1.0.61.sha256sum] = "46c3384250002a6d5af4d114f2845d37b57521033f30d5c3f46c4d70e1197533"
+SRC_URI[thiserror-1.0.63.sha256sum] = "c0342370b38b6a11b6cc11d6a805569958d54cfa061a29969c3b5ce2ea405724"
+SRC_URI[thiserror-impl-1.0.63.sha256sum] = "a4558b58466b9ad7ca0f102865eccc95938dca1a74a856f2b57b6629050da261"
 SRC_URI[threadpool-1.8.1.sha256sum] = "d050e60b33d41c19108b32cea32164033a9013fe3b46cbd4457559bfbf77afaa"
 SRC_URI[tui-0.19.0.sha256sum] = "ccdd26cbd674007e649a272da4475fb666d3aa0ad0531da7136db6fab0e5bad1"
+SRC_URI[udev-0.7.0.sha256sum] = "4ebdbbd670373442a12fe9ef7aeb53aec4147a5a27a00bbc3ab639f08f48191a"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unicode-segmentation-1.11.0.sha256sum] = "d4c87d22b6e3f4a18d4d40ef354e97c90fcb14dd91d7dc0aa9d8a1172ebf7202"
 SRC_URI[unicode-width-0.1.13.sha256sum] = "0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d"
+SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
@@ -214,3 +276,5 @@ SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffc
 SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[zerocopy-0.7.35.sha256sum] = "1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0"
+SRC_URI[zerocopy-derive-0.7.35.sha256sum] = "fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e"
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc
similarity index 100%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc
rename to meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.13.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.14.bb
similarity index 82%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.13.bb
rename to meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.14.bb
index 1d3c797244..e5a683aa0f 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.13.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.14.bb
@@ -4,17 +4,23 @@ HOMEPAGE = "https://github.com/jthornber/thin-provisioning-tools"
 LICENSE = "GPL-3.0-only"
 SECTION = "devel"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
     git://github.com/jthornber/thin-provisioning-tools;branch=main;protocol=https \
     "
 
-SRCREV = "116c05345bed5fe727992c3458311606d5443ff6"
+# v1.0.14
+SRCREV = "6be3e0937800cb947f1be7c0150825f155cfca14"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cargo cargo-update-recipe-crates
+inherit pkgconfig
+
+DEPENDS += "udev clang-native"
+
+export LIBCLANG_PATH = "${WORKDIR}/recipe-sysroot-native${libdir}"
 
 require ${BPN}-crates.inc
 require ${BPN}-git-crates.inc
-- 
2.25.1


