Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B552E77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 09:07:08 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.52531.1734340023955414946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 01:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout12.t-online.de (Postfix) with SMTP id A6E841860
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 10:07:01 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.147]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tN746-0Tnsen0; Mon, 16 Dec 2024 10:06:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] cbindgen: add recipe
Date: Mon, 16 Dec 2024 10:07:03 +0100
Message-ID: <20241216090705.1698-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1734340018-1AFFA9DC-356421B5/10/3626336762 SUSPECT URL
X-TOI-MSGID: 5b194ec8-91a6-464a-8d3c-128799e98b7f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 09:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114323

cbindgen creates C/C++11 headers for Rust libraries which expose a public=
 C API

It is a required dependency for the current mozjs esr release

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../cbindgen/cbindgen_0.27.0.bb               | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cbindgen/cbindgen_0.27.0.bb

diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.27.0.bb b/meta-=
oe/recipes-devtools/cbindgen/cbindgen_0.27.0.bb
new file mode 100644
index 0000000000..e395f667c2
--- /dev/null
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.27.0.bb
@@ -0,0 +1,148 @@
+SUMMARY =3D "cbindgen creates C/C++11 headers for Rust libraries which e=
xpose a public C API"
+HOMEPAGE =3D "https://github.com/mozilla/cbindgen"
+LICENSE =3D "MPL-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9741c346eef56131163e13b9db124=
1b3"
+
+SRC_URI +=3D "git://github.com/mozilla/cbindgen.git;protocol=3Dhttps;bra=
nch=3Dmaster"
+SRCREV =3D "58c6156b0d91e82abb03c26187b8d18fa4345ce0"
+S =3D "${WORKDIR}/git"
+
+inherit cargo pkgconfig
+
+SRC_URI +=3D " \
+    crate://crates.io/anstream/0.6.15 \
+    crate://crates.io/anstyle-parse/0.2.5 \
+    crate://crates.io/anstyle-query/1.1.1 \
+    crate://crates.io/anstyle-wincon/3.0.4 \
+    crate://crates.io/anstyle/1.0.8 \
+    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/bitflags/2.6.0 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/clap/4.5.15 \
+    crate://crates.io/clap_builder/4.5.15 \
+    crate://crates.io/clap_lex/0.7.2 \
+    crate://crates.io/colorchoice/1.0.2 \
+    crate://crates.io/dashmap/5.5.3 \
+    crate://crates.io/diff/0.1.13 \
+    crate://crates.io/equivalent/1.0.1 \
+    crate://crates.io/errno/0.3.9 \
+    crate://crates.io/fastrand/2.1.0 \
+    crate://crates.io/hashbrown/0.14.5 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/indexmap/2.3.0 \
+    crate://crates.io/is_terminal_polyfill/1.70.1 \
+    crate://crates.io/itoa/1.0.11 \
+    crate://crates.io/lazy_static/1.5.0 \
+    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/linux-raw-sys/0.4.14 \
+    crate://crates.io/lock_api/0.4.12 \
+    crate://crates.io/log/0.4.22 \
+    crate://crates.io/memchr/2.7.4 \
+    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/parking_lot/0.12.3 \
+    crate://crates.io/parking_lot_core/0.9.10 \
+    crate://crates.io/pretty_assertions/1.4.0 \
+    crate://crates.io/proc-macro2/1.0.86 \
+    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/redox_syscall/0.5.3 \
+    crate://crates.io/rustix/0.38.34 \
+    crate://crates.io/ryu/1.0.18 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/serde/1.0.205 \
+    crate://crates.io/serde_derive/1.0.205 \
+    crate://crates.io/serde_json/1.0.122 \
+    crate://crates.io/serde_spanned/0.6.7 \
+    crate://crates.io/serial_test/2.0.0 \
+    crate://crates.io/serial_test_derive/2.0.0 \
+    crate://crates.io/smallvec/1.13.2 \
+    crate://crates.io/strsim/0.11.1 \
+    crate://crates.io/syn/2.0.72 \
+    crate://crates.io/tempfile/3.12.0 \
+    crate://crates.io/toml/0.8.19 \
+    crate://crates.io/toml_datetime/0.6.8 \
+    crate://crates.io/toml_edit/0.22.20 \
+    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/utf8parse/0.2.2 \
+    crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/winnow/0.6.18 \
+    crate://crates.io/yansi/0.5.1 \
+"
+
+SRC_URI[anstream-0.6.15.sha256sum] =3D "64e15c1ab1f89faffbf04a634d5e1962=
e9074f2741eef6d97f3c4e322426d526"
+SRC_URI[anstyle-parse-0.2.5.sha256sum] =3D "eb47de1e80c2b463c735db5b217a=
0ddc39d612e7ac9e2e96a5aed1f57616c1cb"
+SRC_URI[anstyle-query-1.1.1.sha256sum] =3D "6d36fc52c7f6c869915e99412912=
f22093507da8d9e942ceaf66fe4b7c14422a"
+SRC_URI[anstyle-wincon-3.0.4.sha256sum] =3D "5bf74e1b6e971609db8ca7a9ce7=
9fd5768ab6ae46441c572e46cf596f59e57f8"
+SRC_URI[anstyle-1.0.8.sha256sum] =3D "1bec1de6f59aedf83baf9ff929c98f2ad6=
54b97c9510f4e70cf6f661d49fd5b1"
+SRC_URI[autocfg-1.3.0.sha256sum] =3D "0c4b4d0bd25bd0b74681c0ad21497610ce=
1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[bitflags-2.6.0.sha256sum] =3D "b048fb63fd8b5923fc5aa7b340d8e156a=
ec7ec02f0c78fa8a6ddc2613f6f71de"
+SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[clap-4.5.15.sha256sum] =3D "11d8838454fda655dafd3accb2b6e2bea645=
b9e4078abe84a22ceb947235c5cc"
+SRC_URI[clap_builder-4.5.15.sha256sum] =3D "216aec2b177652e3846684cbfe25=
c9964d18ec45234f0f5da5157b207ed1aab6"
+SRC_URI[clap_lex-0.7.2.sha256sum] =3D "1462739cb27611015575c0c11df5df760=
1141071f07518d56fcc1be504cbec97"
+SRC_URI[colorchoice-1.0.2.sha256sum] =3D "d3fd119d74b830634cea2a0f58bbd0=
d54540518a14397557951e79340abc28c0"
+SRC_URI[dashmap-5.5.3.sha256sum] =3D "978747c1d849a7d2ee5e8adc0159961c48=
fb7e5db2f06af6723b80123bb53856"
+SRC_URI[diff-0.1.13.sha256sum] =3D "56254986775e3233ffa9c4d7d3faaf6d36a2=
c09d30b20687e9f88bc8bafc16c8"
+SRC_URI[equivalent-1.0.1.sha256sum] =3D "5443807d6dff69373d433ab9ef5378a=
d8df50ca6298caf15de6e52e24aaf54d5"
+SRC_URI[errno-0.3.9.sha256sum] =3D "534c5cf6194dfab3db3242765c03bbe257cf=
92f22b38f6bc0c58d59108a820ba"
+SRC_URI[fastrand-2.1.0.sha256sum] =3D "9fc0510504f03c51ada170672ac806f1f=
105a88aa97a5281117e1ddc3368e51a"
+SRC_URI[hashbrown-0.14.5.sha256sum] =3D "e5274423e17b7c9fc20b6e7e208532f=
9b19825d82dfd615708b70edd83df41f1"
+SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440=
a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[indexmap-2.3.0.sha256sum] =3D "de3fc2e30ba82dd1b3911c8de1ffc143c=
74a914a14e99514d7637e3099df5ea0"
+SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] =3D "7943c866cc5cd64cbc25=
b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
+SRC_URI[itoa-1.0.11.sha256sum] =3D "49f1f14873335454500d59611f1cf4a4b0f7=
86f9ac11f4312a78e4cf2566695b"
+SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f3=
591312473c50c6685e1f298068316e66fe"
+SRC_URI[libc-0.2.155.sha256sum] =3D "97b3888a4aecf77e811145cadf6eef5901f=
4782c53886191b2f693f24761847c"
+SRC_URI[linux-raw-sys-0.4.14.sha256sum] =3D "78b3ae25bc7c8c38cec158d1f27=
57ee79e9b3740fbc7ccf0e59e4b08d793fa89"
+SRC_URI[lock_api-0.4.12.sha256sum] =3D "07af8b9cdd281b7915f413fa73f29ebd=
5d55d0d3f0155584dade1ff18cea1b17"
+SRC_URI[log-0.4.22.sha256sum] =3D "a7a70ba024b9dc04c27ea2f0c0548feb474ec=
5c54bba33a7f72f873a39d07b24"
+SRC_URI[memchr-2.7.4.sha256sum] =3D "78ca9ab1a0babb1e7d5695e3530886289c1=
8cf2f87ec19a575a0abdce112e3a3"
+SRC_URI[once_cell-1.19.0.sha256sum] =3D "3fdb12b2476b595f9358c5161aa467c=
2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[parking_lot-0.12.3.sha256sum] =3D "f1bf18183cf54e8d6059647fc3063=
646a1801cf30896933ec2311622cc4b9a27"
+SRC_URI[parking_lot_core-0.9.10.sha256sum] =3D "1e401f977ab385c9e4e3ab30=
627d6f26d00e2c73eef317493c4ec6d468726cf8"
+SRC_URI[pretty_assertions-1.4.0.sha256sum] =3D "af7cee1a6c8a5b9208b3cb10=
61f10c0cb689087b3d8ce85fb9d2dd7a29b6ba66"
+SRC_URI[proc-macro2-1.0.86.sha256sum] =3D "5e719e8df665df0d1c8fbfd238015=
744736151d4445ec0836b8e628aae103b77"
+SRC_URI[quote-1.0.36.sha256sum] =3D "0fa76aaf39101c457836aec0ce2316dbdc3=
ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[redox_syscall-0.5.3.sha256sum] =3D "2a908a6e00f1fdd0dfd9c0eb08ce=
85126f6d8bbda50017e74bc4a4b7d4a926a4"
+SRC_URI[rustix-0.38.34.sha256sum] =3D "70dc5ec042f7a43c4a73241207cecc987=
3a06d45debb38b329f8541d85c2730f"
+SRC_URI[ryu-1.0.18.sha256sum] =3D "f3cb5ba0dc43242ce17de99c180e96db90b23=
5b8a9fdc9543c96d2209116bd9f"
+SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59b=
ce7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[serde-1.0.205.sha256sum] =3D "e33aedb1a7135da52b7c21791455563fac=
bbcc43d0f0f66165b42c21b3dfb150"
+SRC_URI[serde_derive-1.0.205.sha256sum] =3D "692d6f5ac90220161d6774db30c=
662202721e64aed9058d2c394f451261420c1"
+SRC_URI[serde_json-1.0.122.sha256sum] =3D "784b6203951c57ff748476b126ccb=
5e8e2959a5c19e5c617ab1956be3dbc68da"
+SRC_URI[serde_spanned-0.6.7.sha256sum] =3D "eb5b1b31579f3811bf615c144393=
417496f152e12ac8b7663bf664f4a815306d"
+SRC_URI[serial_test-2.0.0.sha256sum] =3D "0e56dd856803e253c8f298af3f4d7e=
b0ae5e23a737252cd90bb4f3b435033b2d"
+SRC_URI[serial_test_derive-2.0.0.sha256sum] =3D "91d129178576168c589c9ec=
973feedf7d3126c01ac2bf08795109aa35b69fb8f"
+SRC_URI[smallvec-1.13.2.sha256sum] =3D "3c5e1a9a646d36c3599cd173a41282da=
f47c44583ad367b8e6837255952e5c67"
+SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e262856=
4b3b043a70948a3f0b778838c5fb4f"
+SRC_URI[syn-2.0.72.sha256sum] =3D "dc4b9b9bf2add8093d3f2c0204471e951b228=
5580335de42f9d2534f3ae7a8af"
+SRC_URI[tempfile-3.12.0.sha256sum] =3D "04cbcdd0c794ebb0d4cf35e88edd2f7d=
2c4c3e9a5a6dab322839b321c6a87a64"
+SRC_URI[toml-0.8.19.sha256sum] =3D "a1ed1f98e3fdc28d6d910e6737ae6ab1a93b=
f1985935a1193e68f93eeb68d24e"
+SRC_URI[toml_datetime-0.6.8.sha256sum] =3D "0dd7358ecb8fc2f8d014bf86f6f6=
38ce72ba252a2c3a2572f2a795f1d23efb41"
+SRC_URI[toml_edit-0.22.20.sha256sum] =3D "583c44c02ad26b0c3f3066fe629275=
e50627026c51ac2e595cca4c230ce1ce1d"
+SRC_URI[unicode-ident-1.0.12.sha256sum] =3D "3354b9ac3fae1ff6755cb6db536=
83adb661634f67557942dea4facebec0fee4b"
+SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7f=
aecc7fa57071cce2578660c9f1010821"
+SRC_URI[windows-sys-0.52.0.sha256sum] =3D "282be5f36a8ce781fad8c8ae18fa3=
f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-sys-0.59.0.sha256sum] =3D "1e38bc4d79ed67fd075bcc251a1c3=
9b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d=
4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec0=
44bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b53=
fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e295a=
c6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa76=
c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba28=
bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901c=
b5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc417412679=
681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d1=
270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[winnow-0.6.18.sha256sum] =3D "68a9bda4691f099d435ad181000724da8e=
5899daa10713c2d432552b9ccd3a6f"
+SRC_URI[yansi-0.5.1.sha256sum] =3D "09041cd90cf85f7f8b2df60c646f853b7f53=
5ce68f85244eb6731cf89fa498ec"
+
+BBCLASSEXTEND +=3D "native"
--=20
2.47.1


