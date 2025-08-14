Return-Path: <me@sephalon.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F0DCA0EE3
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 07:41:51 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web10.17559.1755157302918641562
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 00:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@sephalon.net header.s=MBO0001 header.b=H4ZL/Gpt;
 spf=none, err=permanent DNS error (domain: sephalon.net, ip: 80.241.56.171, mailfrom: me@sephalon.net)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c2ccz1xNDz9smq;
	Thu, 14 Aug 2025 09:41:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sephalon.net;
	s=MBO0001; t=1755157299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=54muqmYHEhwAiBUmfoPaOx4HoaciuebF/3H/OBRnhTw=;
	b=H4ZL/Gpt9OfXg7D9+LO2QS7Ba1eUbXEAEyvN7GMlkpVZ4bSBulhEaIpT/8O7Vc1UgNhpEf
	OqPVTlUO0S0BwS/YU3bbc7lGgpdHit7hUioHSHUfwAmAXY4Y7cEuqOtwotI95Y4Cv1r2pC
	WmdwpYbfY09cRXlsHTLJdkYK6k49qWSzTMfuTy/2pJvS4VJ0s9HvYS4U3xJ+rxyeWTXvRa
	nOQg6Gv0Ym193Q4H+W2jYEcLeTqlE5/fhkokath4u/PQ0MTsTtrsEq+DDFNZc1HrwM0jki
	GV9QK6+J/h91lmm+z/BMVlF0c06vvr8g1S0oYCj8dacZS1Yt6A1c6CRZi9JKAw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=none (outgoing_mbo_mout: domain of me@sephalon.net has no SPF policy when checking 2001:67c:2050:b231:465::2) smtp.mailfrom=me@sephalon.net
From: Stefan Wiehler <me@sephalon.net>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Stefan Wiehler <me@sephalon.net>
Subject: [meta-oe][PATCH v3 1/2] syzkaller: Upgrade to latest tip of trunk
Date: Thu, 14 Aug 2025 09:39:21 +0200
Message-ID: <20250814073921.1757918-2-me@sephalon.net>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4c2ccz1xNDz9smq
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 07:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118931

- All patches have been upstreamed
- Add Go module dependencies to allow offline builds since upstream does
  not vendor them into the repo anymore
- In accordance to upstream, disable cgo as we are unable to compile
  with it on all supported architectures; in addition, remove
  -linkshared and -buildmode=3Dpie as it requires external (cgo) linking
  (the latter only on ARM and x86). Binary size hardly matters here as
  syzkaller is unlikely to be shipped in a production environment.
- Add missing metadata and comply with style guide
- Mark musl as incompatible as it does not provide the Memory Protection
  Keys API; in addition, there seems to be no intention from upstream to
  support anything besides glibc

Signed-off-by: Stefan Wiehler <me@sephalon.net>
---
changes in v3:
- mark musl as incompatible as it does not provide the Memory Protection
  Keys API; in addition, there seems to be no intention from upstream to
  support anything besides glibc

changes in v2:
- update to latest tip of trunk, which includes an upstreamed fix for
  the Go module cache being partially non-writeable/deletable
  (https://github.com/google/syzkaller/pull/6269)
---
 .../syzkaller/syzkaller-go-mods.inc           | 76 ++++++++++++++++++
 .../syzkaller/syzkaller-licenses.inc          | 80 +++++++++++++++++++
 ...cutor-Include-missing-linux-falloc.h.patch | 37 ---------
 ...ve-including-error.h-in-test_linux.h.patch | 29 -------
 ...ets.go-allow-users-to-override-hardc.patch | 62 --------------
 .../recipes-test/syzkaller/syzkaller_git.bb   | 42 +++++-----
 6 files changed, 180 insertions(+), 146 deletions(-)
 create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller-go-mods.inc
 create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
 delete mode 100644 meta-oe/recipes-test/syzkaller/syzkaller/0001-executo=
r-Include-missing-linux-falloc.h.patch
 delete mode 100644 meta-oe/recipes-test/syzkaller/syzkaller/0001-executo=
r-Remove-including-error.h-in-test_linux.h.patch
 delete mode 100644 meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-tar=
gets-targets.go-allow-users-to-override-hardc.patch

diff --git a/meta-oe/recipes-test/syzkaller/syzkaller-go-mods.inc b/meta-=
oe/recipes-test/syzkaller/syzkaller-go-mods.inc
new file mode 100644
index 0000000000..807f2367a2
--- /dev/null
+++ b/meta-oe/recipes-test/syzkaller/syzkaller-go-mods.inc
@@ -0,0 +1,76 @@
+SRC_URI +=3D "\
+    gomod://cel.dev/expr;version=3Dv0.24.0;sha256sum=3D4456189315133136b=
72bfb40312d731c8957cce38a2807ac21d09f5158259bb7 \
+    gomod://cloud.google.com/go;version=3Dv0.121.3;sha256sum=3Debd16ecd4=
637745c842ecc337241a4d77cd9cdb1a2f422c7f9cabc477ae5da25 \
+    gomod://cloud.google.com/go/auth;version=3Dv0.16.2;sha256sum=3D38f4f=
9fb94b864bff2e7852c826ae6605a9fda6510cc6b6b3e02a047dd4243cd \
+    gomod://cloud.google.com/go/auth/oauth2adapt;version=3Dv0.2.8;sha256=
sum=3D4cd64264bafc4dd05f645452d6e1485adf92309130bd82b4c595db10cd534963 \
+    gomod://cloud.google.com/go/bigquery;version=3Dv1.69.0;sha256sum=3Df=
ea7514e6dde4d4c9bd1d334034d89c980759afa303f020c3a273f7d9f3c095d \
+    gomod://cloud.google.com/go/compute/metadata;version=3Dv0.7.0;sha256=
sum=3D89c19841bf87fe53034aed53505c527fe6674d3bf0f21c0e972374f94fb08eb4 \
+    gomod://cloud.google.com/go/iam;version=3Dv1.5.2;sha256sum=3D5ef0d3a=
00d72b44c498688551616bce430386bbfc99b5a7f76c0788a92733984 \
+    gomod://cloud.google.com/go/monitoring;version=3Dv1.24.2;sha256sum=3D=
d93cb9138747418f2e2731c2312c4dc1a75daf3c2a35be7a337901c5c7251381 \
+    gomod://cloud.google.com/go/spanner;version=3Dv1.82.0;sha256sum=3D6c=
997bbf50a2d9dee4094bf13cc0440d6ee7ec707c681ecbc58097bf99e3fb86 \
+    gomod://cloud.google.com/go/storage;version=3Dv1.55.0;sha256sum=3Db1=
4ef810eb8117e7c8a7e3478b7d48434929264d89d62640e08b05c48b3cfcc6 \
+    gomod://github.com/GoogleCloudPlatform/grpc-gcp-go/grpcgcp;version=3D=
v1.5.2;sha256sum=3Dd5c597a20d3a7057a9c3b3ada021930351247baf5e65f08996cecc=
84027446b1 \
+    gomod://github.com/GoogleCloudPlatform/opentelemetry-operations-go/d=
etectors/gcp;version=3Dv1.28.0;sha256sum=3D9fa827784e2495cd18f204e06abbd1=
09a9dbe1a3b330bf82294b8aac7285ad3b \
+    gomod://github.com/GoogleCloudPlatform/opentelemetry-operations-go/e=
xporter/metric;version=3Dv0.52.0;sha256sum=3D999dd61d8aa7b61f89b547ad271c=
4597bddd3de3c4e9801a672fe2d759ff5c3a \
+    gomod://github.com/GoogleCloudPlatform/opentelemetry-operations-go/i=
nternal/resourcemapping;version=3Dv0.52.0;sha256sum=3D2d0f67011ae88b29113=
717680c240c02ef3c3c84ab74868b11fcc831c59fcc17 \
+    gomod://github.com/VividCortex/gohistogram;version=3Dv1.0.0;sha256su=
m=3D16ebeceeb7e4066f90edbfb90282cd90d4dad0f71339199551de3fbdc7e8c545 \
+    gomod://github.com/apache/arrow/go/v15;version=3Dv15.0.2;sha256sum=3D=
87b75aac27b395f651f232b4b89c184a6ab23a65596acc46b4efacb116f98adf \
+    gomod://github.com/beorn7/perks;version=3Dv1.0.1;sha256sum=3D25bd9e2=
d94aca770e6dbc1f53725f84f6af4432f631d35dd2c46f96ef0512f1a \
+    gomod://github.com/cespare/xxhash/v2;version=3Dv2.3.0;sha256sum=3D14=
5a26cdc7c49db566017b807c4989ee7f7ddeb569423e9cb99f995fac3621d3 \
+    gomod://github.com/cncf/xds/go;version=3Dv0.0.0-20250501225837-2ac53=
2fd4443;sha256sum=3Dc7b36d6c805ab8718fa8700f69bee29c225f10258fd29315683b1=
02398c013a8 \
+    gomod://github.com/envoyproxy/go-control-plane/envoy;version=3Dv1.32=
.4;sha256sum=3D6baebcc1f441672ade0dacb4ca553a3d857f915590ca07bbe79314ddf6=
2e6fae \
+    gomod://github.com/envoyproxy/protoc-gen-validate;version=3Dv1.2.1;s=
ha256sum=3Dad9d2639aff17db6be291069c5463c46ed8ac37a0c6c1b57fae5465c5effb5=
67 \
+    gomod://github.com/felixge/httpsnoop;version=3Dv1.0.4;sha256sum=3D75=
aa471311265e9860df0e523400b4650ed0c1a33262786a421f07226792e494 \
+    gomod://github.com/go-jose/go-jose/v4;version=3Dv4.1.0;sha256sum=3D2=
7274e6a0878655e62a8c042934dfbb33c6db5992bc31b21df5df6c1cb944e58 \
+    gomod://github.com/go-logr/logr;version=3Dv1.4.3;sha256sum=3D523d7a3=
587fe73f61ef41c8bc627f7d7f38de8104d46278154b307e60770ad70 \
+    gomod://github.com/go-logr/stdr;version=3Dv1.2.2;sha256sum=3D9dd6893=
bf700198485ae699640b49bc1efbc6c73b37cb5792a0476e1fd8f7fef \
+    gomod://github.com/goccy/go-json;version=3Dv0.10.5;sha256sum=3D96e41=
7d4493705f470f7f29858a09cdbe68330f2d7e74cd024fbace4745c0615 \
+    gomod://github.com/golang/groupcache;version=3Dv0.0.0-20241129210726=
-2c02b8208cf8;sha256sum=3D163367355442a630b12b0b452892cd98e99fcfdf7e40b68=
d358be73479cc1c23 \
+    gomod://github.com/golang/protobuf;version=3Dv1.5.4;sha256sum=3D9a2f=
43d3eac8ceda506ebbeb4f229254b87235ce90346692a0e233614182190b \
+    gomod://github.com/google/flatbuffers;version=3Dv25.1.24+incompatibl=
e;sha256sum=3D925600f16ce3b62c77aff5a662435984ed37af7cc05577169564e902e0c=
31c29 \
+    gomod://github.com/google/s2a-go;version=3Dv0.1.9;sha256sum=3Dbf8f4b=
159d3fc201477822ed2514e4f05f58c764b78ffed73ec0accce5fb7f07 \
+    gomod://github.com/google/uuid;version=3Dv1.6.0;sha256sum=3Dd0f02f37=
7217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed \
+    gomod://github.com/googleapis/enterprise-certificate-proxy;version=3D=
v0.3.6;sha256sum=3D6c44108f588c97a6a08b5ed907c3cc47dce31913f219a6d02b13e4=
63d355603c \
+    gomod://github.com/googleapis/gax-go/v2;version=3Dv2.14.2;sha256sum=3D=
1cd109cf4d1a81363f956885d1f7e7086bf9805122dbcf9382ca0c54a21979d5 \
+    gomod://github.com/gorilla/handlers;version=3Dv1.5.2;sha256sum=3D7a6=
9a0605890d69e91404e46b2d2063ef3c5c4e05c844ea154ef95d3479d7b7b \
+    gomod://github.com/ianlancetaylor/demangle;version=3Dv0.0.0-20250625=
212726-86fd2c0a1a74;sha256sum=3D7ad8b2ba609745ed4b8923c0c2e8ab44acf7386eb=
0d6fd7ad7bf6da962bd0743 \
+    gomod://github.com/klauspost/compress;version=3Dv1.18.0;sha256sum=3D=
c4679e4cbc820a21758199d985be754abf5eb2a38e6f1de95cd70b2e7ef06905 \
+    gomod://github.com/klauspost/cpuid/v2;version=3Dv2.2.10;sha256sum=3D=
db89665fa22cef477dc551b72d49707c516b749c17ed154bf67eb8081ee08dff \
+    gomod://github.com/munnerz/goautoneg;version=3Dv0.0.0-20191010083416=
-a7dc8b61c822;sha256sum=3D3d7ce17916779890be02ea6b3dd6345c3c30c1df502ad9d=
8b5b9b310e636afd9 \
+    gomod://github.com/pierrec/lz4/v4;version=3Dv4.1.18;sha256sum=3Db397=
db34ff05610125e7c9de6de067a174a70ba3ba7dac81ba8ce4f22b1c0933 \
+    gomod://github.com/prometheus/client_golang;version=3Dv1.23.0;sha256=
sum=3Df104d43e35b9217845792ec8eabbde59e31a11aaba64c47408cff8bafde2aa9e \
+    gomod://github.com/prometheus/client_model;version=3Dv0.6.2;sha256su=
m=3D67017b19f220c6ab91ecfdd10a93824e2a8b09fcb6390054dbdc49df3354a9ca \
+    gomod://github.com/prometheus/common;version=3Dv0.65.0;sha256sum=3Dc=
97b1ab4d2c723923b367dbe48c283eafc0b94eb14faf8c98d81746b015242a9 \
+    gomod://github.com/prometheus/procfs;version=3Dv0.16.1;sha256sum=3De=
4b74815566cbf5aa372d23e1de32f16ac5c3c4c80bc94a31fdee60a1de6074a \
+    gomod://github.com/sergi/go-diff;version=3Dv1.4.0;sha256sum=3D63aef1=
860b251af1421ba0a014a6bb08a60833f13f948f3d88d66754bb484f53 \
+    gomod://github.com/spiffe/go-spiffe/v2;version=3Dv2.5.0;sha256sum=3D=
3b96ee2cef9a550ec779125216a03225fff44d3d702d51b6ef21e2202d2517d6 \
+    gomod://github.com/ulikunitz/xz;version=3Dv0.5.12;sha256sum=3D0cba32=
68140e7c112c329b19ce3d4c8d4768a784fe0c80112bfa7bf43ace1a4a \
+    gomod://github.com/zeebo/errs;version=3Dv1.4.0;sha256sum=3D5b7fb5cbe=
6bbd36933e8c98572f85121994e9842aefc90986f8d3a192cb69257 \
+    gomod://github.com/zeebo/xxh3;version=3Dv1.0.2;sha256sum=3D190e5ef1f=
672e9321a1580bdd31c6440fde6044ca8168d2b489cf50cdc4f58a6 \
+    gomod://go.opencensus.io;version=3Dv0.24.0;sha256sum=3D203a767d7f8e7=
c1ebe5588220ad168d1e15b14ae70a636de7ca9a4a88a7e0d0c \
+    gomod://go.opentelemetry.io/auto/sdk;version=3Dv1.1.0;sha256sum=3D00=
6d3a5a7292d11f093ce65fcd5a15d15fb7bd11d0e066503f91bd64c4bffe2c \
+    gomod://go.opentelemetry.io/contrib/detectors/gcp;version=3Dv1.36.0;=
sha256sum=3D67e381df5c7e78edda7b773ebdef6e5dad42486e87eec838329ade6919985=
119 \
+    gomod://go.opentelemetry.io/contrib/instrumentation/google.golang.or=
g/grpc/otelgrpc;version=3Dv0.61.0;sha256sum=3D9812bf570350cd1377bf458b71e=
a5d9fffe44733fc2dccbcfd1f5c564a6b27b7 \
+    gomod://go.opentelemetry.io/contrib/instrumentation/net/http/otelhtt=
p;version=3Dv0.61.0;sha256sum=3D0009120ed94c4279573eea0f01841f7c9ff51cafd=
1c9559fc09820c9f870f399 \
+    gomod://go.opentelemetry.io/otel;version=3Dv1.36.0;sha256sum=3Df3cdc=
5d41b3056ab4fa95ee1145708d12e5a5fd0106f79c3f0133a7f5f1ef799 \
+    gomod://go.opentelemetry.io/otel/metric;version=3Dv1.36.0;sha256sum=3D=
a4ff3b88cca25a317752193a65547250822cdd6acfa08d9cbb57071d1e1c4951 \
+    gomod://go.opentelemetry.io/otel/sdk;version=3Dv1.36.0;sha256sum=3Dd=
16c77fb714cca3036530fddba0baf5f1ad21a6de8dffd73130668807c61b01a \
+    gomod://go.opentelemetry.io/otel/sdk/metric;version=3Dv1.36.0;sha256=
sum=3D946a0d0d2b5ab3636a848a3041f8b7bd91e505cd563dc9907a3836076c9e214f \
+    gomod://go.opentelemetry.io/otel/trace;version=3Dv1.36.0;sha256sum=3D=
f8877234c555f5f793fed92b17e2bf6744f6c504871eb713fa1e916ba0b6c6b6 \
+    gomod://golang.org/x/crypto;version=3Dv0.40.0;sha256sum=3D6a55423d32=
7359615db923c5f17e5f10c4c7d91c39ef8d0b7f6e0876f89ff9da \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20250711185948-6ae5c78190d=
c;sha256sum=3D01d8fecd44e904b86e66c78cf6b403b27312513c0534455ee7b9c86600d=
9b7aa \
+    gomod://golang.org/x/net;version=3Dv0.42.0;sha256sum=3Dcc9f79d1c8a79=
6c756b636cee007b4ac5eba7b1f3276cd42658f4ac4a28cfbc1 \
+    gomod://golang.org/x/oauth2;version=3Dv0.30.0;sha256sum=3D1e1028d0b1=
90948f0cd44229bfa298440cb2481f601f992e12424bc6fa1f183c \
+    gomod://golang.org/x/sync;version=3Dv0.16.0;sha256sum=3Dca43984183eb=
14f7f50d33da350312fed1c42e106dceac2437bfd5084b497dcd \
+    gomod://golang.org/x/sys;version=3Dv0.34.0;sha256sum=3D27d5489227865=
ffffc3fbbbaf6100952ca2925eba19cfdff01e6e76b986b4bb4 \
+    gomod://golang.org/x/text;version=3Dv0.27.0;sha256sum=3D1230ce66d74e=
d4510f1578f25b4e53beee00926dc24c86fab7242637f8415ea8 \
+    gomod://golang.org/x/time;version=3Dv0.12.0;sha256sum=3Dcdcb04c43b11=
2919c5e0d0fa1d90769124ad56918a44e6cb0747876ed7e5015c \
+    gomod://golang.org/x/xerrors;version=3Dv0.0.0-20240903120638-7835f81=
3f4da;sha256sum=3D07ee9f680118861ee732ce0df4553b834383b87e0519fb9a0990c51=
d7abd6885 \
+    gomod://google.golang.org/api;version=3Dv0.237.0;sha256sum=3D944b383=
03416810562a220f444ec7c0c13834793a9e7e46ce0f644c3c5b478e0 \
+    gomod://google.golang.org/appengine/v2;version=3Dv2.0.6;sha256sum=3D=
9eab40689a66240d1132f31d2418a03776221ed07c3f72e22e9527ad063c9dde \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20250603155806-5=
13f23925822;sha256sum=3D631efdcf106cc5af4bb1e3298a40eedebe8a023a408b0465a=
5cb3ee486a57879 \
+    gomod://google.golang.org/genproto/googleapis/api;version=3Dv0.0.0-2=
0250603155806-513f23925822;sha256sum=3Dec9d0cf0e96082fc6eef3a8beeb4cb7495=
1294a57dac0d501b25a37e64df2594 \
+    gomod://google.golang.org/genproto/googleapis/rpc;version=3Dv0.0.0-2=
0250603155806-513f23925822;sha256sum=3D3b43fafd95300765d08eb0d0137b699c5e=
e9c105b6af93c4916e7081c97b3a75 \
+    gomod://google.golang.org/grpc;version=3Dv1.73.0;sha256sum=3D7d628ab=
d6c4c133205db6b72e374bbd2f438b12a2a5f838f34fd8d95d91f8c0b \
+    gomod://google.golang.org/protobuf;version=3Dv1.36.6;sha256sum=3D329=
4ac8ea5089b3c231351afaea4f012e8027a9beeb523bbf31dcb383cc0ab99 \
+"
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc b/meta=
-oe/recipes-test/syzkaller/syzkaller-licenses.inc
new file mode 100644
index 0000000000..2be12f2853
--- /dev/null
+++ b/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
@@ -0,0 +1,80 @@
+LICENSE +=3D "& BSD-3-Clause & MIT"
+
+LIC_FILES_CHKSUM +=3D "\
+    file://pkg/mod/cel.dev/expr@v0.24.0/LICENSE;md5=3D3b83ef96387f14655f=
c854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/auth/oauth2adapt@v0.2.8/LICENSE;m=
d5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/auth@v0.16.2/LICENSE;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/bigquery@v1.69.0/LICENSE;md5=3D3b=
83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/compute/metadata@v0.7.0/LICENSE;m=
d5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/iam@v1.5.2/LICENSE;md5=3D3b83ef96=
387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/monitoring@v1.24.2/LICENSE;md5=3D=
3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/spanner@v1.82.0/LICENSE;md5=3D3b8=
3ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/storage@v1.55.0/LICENSE;md5=3D3b8=
3ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go@v0.121.3/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/!google!cloud!platform/grpc-gcp-go/grpcgcp=
@v1.5.2/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 =
\
+    file://pkg/mod/github.com/!google!cloud!platform/opentelemetry-opera=
tions-go/detectors/gcp@v1.28.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6=
bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/!google!cloud!platform/opentelemetry-opera=
tions-go/exporter/metric@v0.52.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/!google!cloud!platform/opentelemetry-opera=
tions-go/internal/resourcemapping@v0.52.0/LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/!vivid!cortex/gohistogram@v1.0.0/LICENSE;m=
d5=3D13880cf5821e7668762c89bb8a6045d3;spdx=3DMIT \
+    file://pkg/mod/github.com/apache/arrow/go/v15@v15.0.2/LICENSE.txt;md=
5=3D9046099156f93a7f0ac340571476a58b;spdx=3DUnknown \
+    file://pkg/mod/github.com/beorn7/perks@v1.0.1/LICENSE;md5=3D0d0738f3=
7ee8dc0b5f88a32e83c60198;spdx=3DMIT \
+    file://pkg/mod/github.com/cespare/xxhash/v2@v2.3.0/LICENSE.txt;md5=3D=
802da049c92a99b4387d3f3d91b00fa9;spdx=3DMIT \
+    file://pkg/mod/github.com/cncf/xds/go@v0.0.0-20250501225837-2ac532fd=
4443/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/envoyproxy/go-control-plane/envoy@v1.32.4/=
LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/envoyproxy/protoc-gen-validate@v1.2.1/LICE=
NSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/felixge/httpsnoop@v1.0.4/LICENSE.txt;md5=3D=
684da2bf3eed8fc8860e75ad84638225;spdx=3DMIT \
+    file://pkg/mod/github.com/go-jose/go-jose/v4@v4.1.0/LICENSE;md5=3D3b=
83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/go-logr/logr@v1.4.3/LICENSE;md5=3De3fc50a8=
8d0a364313df4b21ef20c29e;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/go-logr/stdr@v1.2.2/LICENSE;md5=3D86d3f3a9=
5c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/goccy/go-json@v0.10.5/LICENSE;md5=3D33a071=
64132d795872805bfc53f6097d;spdx=3DMIT \
+    file://pkg/mod/github.com/golang/groupcache@v0.0.0-20241129210726-2c=
02b8208cf8/LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a8a5;spdx=3DApache-2=
.0 \
+    file://pkg/mod/github.com/google/flatbuffers@v25.1.24+incompatible/L=
ICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/google/s2a-go@v0.1.9/LICENSE.md;md5=3D3b83=
ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/google/uuid@v1.6.0/LICENSE;md5=3D88073b6dd=
8ec00fe09da59e0b6dfded1;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/googleapis/enterprise-certificate-proxy@v0=
.3.6/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/googleapis/gax-go/v2@v2.14.2/LICENSE;md5=3D=
0dd48ae8103725bd7b401261520cdfbb;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/ianlancetaylor/demangle@v0.0.0-20250625212=
726-86fd2c0a1a74/LICENSE;md5=3D81729dc66d48cba483290ca39318923d;spdx=3DUn=
known \
+    file://pkg/mod/github.com/klauspost/compress@v1.18.0/LICENSE;md5=3Dd=
0fd9ebda39468b51ff4539c9fbb13a8;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/munnerz/goautoneg@v0.0.0-20191010083416-a7=
dc8b61c822/LICENSE;md5=3D0c241922fc69330e2e5590de114f3bf5;spdx=3DBSD-3-Cl=
ause \
+    file://pkg/mod/github.com/pierrec/lz4/v4@v4.1.18/LICENSE;md5=3D09ece=
85f3c312a63b522bfc6ebd44943;spdx=3DUnknown \
+    file://pkg/mod/github.com/prometheus/client_golang@v1.23.0/LICENSE;m=
d5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/prometheus/client_model@v0.6.2/LICENSE;md5=
=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/prometheus/common@v0.65.0/LICENSE;md5=3D86=
d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/prometheus/procfs@v0.16.1/LICENSE;md5=3D86=
d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/sergi/go-diff@v1.4.0/APACHE-LICENSE-2.0;md=
5=3D2ee41112a44fe7014dce33e26468ba93;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/spiffe/go-spiffe/v2@v2.5.0/LICENSE;md5=3D8=
6d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/ulikunitz/xz@v0.5.12/LICENSE;md5=3D3c82255=
323cf3d48815acdbf9068b715;spdx=3DUnknown \
+    file://pkg/mod/github.com/zeebo/errs@v1.4.0/LICENSE;md5=3D84914ab36f=
c0eb48edbaa53e66e8d326;spdx=3DMIT \
+    file://pkg/mod/github.com/zeebo/xxh3@v1.0.2/LICENSE;md5=3Dacf3e468cb=
f92b877ec5cdff11749253;spdx=3DUnknown \
+    file://pkg/mod/go.opencensus.io@v0.24.0/LICENSE;md5=3D175792518e4ac0=
15ab6696d16c4f607e;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/auto/sdk@v1.1.0/LICENSE;md5=3D86d=
3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/contrib/detectors/gcp@v1.36.0/LIC=
ENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/google.go=
lang.org/grpc/otelgrpc@v0.61.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f=
4327;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/net/http/=
otelhttp@v0.61.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DAp=
ache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel/metric@v1.36.0/LICENSE;md5=3D=
86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel/sdk/metric@v1.36.0/LICENSE;m=
d5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel/sdk@v1.36.0/LICENSE;md5=3D86=
d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel/trace@v1.36.0/LICENSE;md5=3D=
86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel@v1.36.0/LICENSE;md5=3D86d3f3=
a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/golang.org/x/crypto@v0.40.0/LICENSE;md5=3D7998cb338f8=
2d15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/exp@v0.0.0-20250711185948-6ae5c78190dc/L=
ICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.42.0/LICENSE;md5=3D7998cb338f82d1=
5c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/oauth2@v0.30.0/LICENSE;md5=3D7998cb338f8=
2d15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.16.0/LICENSE;md5=3D7998cb338f82d=
15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.34.0/LICENSE;md5=3D7998cb338f82d1=
5c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.27.0/LICENSE;md5=3D7998cb338f82d=
15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/time@v0.12.0/LICENSE;md5=3D7998cb338f82d=
15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/xerrors@v0.0.0-20240903120638-7835f813f4=
da/LICENSE;md5=3De828fb91fe88d9e5d620842cf8bd81b0;spdx=3DUnknown \
+    file://pkg/mod/google.golang.org/api@v0.237.0/LICENSE;md5=3Da651bb3d=
8b1c412632e28823bb432b40;spdx=3DBSD-3-Clause \
+    file://pkg/mod/google.golang.org/genproto/googleapis/api@v0.0.0-2025=
0603155806-513f23925822/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;sp=
dx=3DApache-2.0 \
+    file://pkg/mod/google.golang.org/genproto/googleapis/rpc@v0.0.0-2025=
0603155806-513f23925822/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;sp=
dx=3DApache-2.0 \
+    file://pkg/mod/google.golang.org/genproto@v0.0.0-20250603155806-513f=
23925822/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0=
 \
+    file://pkg/mod/google.golang.org/grpc@v1.73.0/LICENSE;md5=3D3b83ef96=
387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/google.golang.org/protobuf@v1.36.6/LICENSE;md5=3D02d4=
002e9171d41a8fad93aa7faf3956;spdx=3DBSD-3-Clause \
+"
+
+LIC_FILES_CHKSUM:class-native +=3D "\
+    file://pkg/mod/github.com/golang/protobuf@v1.5.4/LICENSE;md5=3D939cc=
e1ec101726fa754e698ac871622;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/gorilla/handlers@v1.5.2/LICENSE;md5=3Dc30e=
ee78985cf2584cded5f89ba3d787;spdx=3DUnknown \
+    file://pkg/mod/google.golang.org/appengine/v2@v2.0.6/LICENSE;md5=3D3=
b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+"
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Inclu=
de-missing-linux-falloc.h.patch b/meta-oe/recipes-test/syzkaller/syzkalle=
r/0001-executor-Include-missing-linux-falloc.h.patch
deleted file mode 100644
index 23bfb9a5e2..0000000000
--- a/meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Include-miss=
ing-linux-falloc.h.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 9db789b4498d4130450e988757914c03e42b40f5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 19 Jun 2023 18:33:36 -0700
-Subject: [PATCH] executor: Include missing linux/falloc.h
-
-Its needed for FALLOC_FL_ZERO_RANGE which needs this header, it works
-with glibc because fcntl.h includes this header indirectly, however the
-failure comes to fore with musl C library where this header is not
-included indirectly by other system headers, therefore include it as
-required.
-
-Fixes
-In file included from executor/common.h:505:
-executor/common_linux.h:5604:16: error: use of undeclared identifier 'FA=
LLOC_FL_ZERO_RANGE'
-        fallocate(fd, FALLOC_FL_ZERO_RANGE, 0, SWAP_FILE_SIZE);
-                      ^
-Upstream-Status: Submitted [https://github.com/google/syzkaller/pull/397=
4]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- executor/common_linux.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/executor/common_linux.h b/executor/common_linux.h
-index d5152e058..9ae3fb159 100644
---- a/executor/common_linux.h
-+++ b/executor/common_linux.h
-@@ -5585,6 +5585,7 @@ static long syz_pkey_set(volatile long pkey, volat=
ile long val)
- #include <sys/stat.h>
- #include <sys/swap.h>
- #include <sys/types.h>
-+#include <linux/falloc.h>
-=20
- #define SWAP_FILE "./swap-file"
- #define SWAP_FILE_SIZE (128 * 1000 * 1000) // 128 MB.
---=20
-2.41.0
-
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Remov=
e-including-error.h-in-test_linux.h.patch b/meta-oe/recipes-test/syzkalle=
r/syzkaller/0001-executor-Remove-including-error.h-in-test_linux.h.patch
deleted file mode 100644
index 8bb19fb72b..0000000000
--- a/meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Remove-inclu=
ding-error.h-in-test_linux.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 648868595cf290e77aab1f271db2a57e1f791301 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 May 2024 20:37:07 -0700
-Subject: [PATCH] executor: Remove including <error.h> in test_linux.h
-
-it seems to be redundant and moreover it lets us compile on musl which
-does not provide this system header
-
-Upstream-Status: Submitted [https://github.com/google/syzkaller/pull/482=
2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- executor/test_linux.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/executor/test_linux.h b/executor/test_linux.h
-index 7cf459569..8c9493539 100644
---- a/executor/test_linux.h
-+++ b/executor/test_linux.h
-@@ -1,7 +1,6 @@
- // Copyright 2017 syzkaller project authors. All rights reserved.
- // Use of this source code is governed by Apache 2 LICENSE that can be =
found in the LICENSE file.
-=20
--#include <error.h>
- #include <stdint.h>
- #include <sys/utsname.h>
-=20
---=20
-2.45.1
-
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-ta=
rgets.go-allow-users-to-override-hardc.patch b/meta-oe/recipes-test/syzka=
ller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.=
patch
deleted file mode 100644
index 61f4351651..0000000000
--- a/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.g=
o-allow-users-to-override-hardc.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From aca1030d29f627314d13884ebc7b2c313d718df7 Mon Sep 17 00:00:00 2001
-From: Ovidiu Panait <ovidiu.panait@windriver.com>
-Date: Wed, 13 Apr 2022 17:17:54 +0300
-Subject: [PATCH] sys/targets/targets.go: allow users to override hardcod=
ed
- cross-compilers
-
-Currently, cross compiler names are hardcoded for each os/arch combo. Ho=
wever,
-toolchain tuples differ, especially when using vendor provided toolchain=
s.
-Allow users to specify the cross compiler for an os/arch combo using
-SYZ_CC_<os>_<arch> environment variables.
-
-Also, remove hardcoded "-march=3Darmv6" flag to fix compilation on arm.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- sys/targets/targets.go | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
---- a/sys/targets/targets.go
-+++ b/sys/targets/targets.go
-@@ -262,7 +262,6 @@ var List =3D map[string]map[string]*Target
- 			PtrSize:          4,
- 			PageSize:         4 << 10,
- 			LittleEndian:     true,
--			CFlags:           []string{"-D__LINUX_ARM_ARCH__=3D6", "-march=3Darm=
v6"},
- 			Triple:           "arm-linux-gnueabi",
- 			KernelArch:       "arm",
- 			KernelHeaderArch: "arm",
-@@ -700,12 +699,16 @@ func initTarget(target *Target, OS, arch
- 	for i :=3D range target.CFlags {
- 		target.replaceSourceDir(&target.CFlags[i], sourceDir)
- 	}
--	if OS =3D=3D Linux && arch =3D=3D runtime.GOARCH {
--		// Don't use cross-compiler for native compilation, there are cases w=
hen this does not work:
--		// https://github.com/google/syzkaller/pull/619
--		// https://github.com/google/syzkaller/issues/387
--		// https://github.com/google/syzkaller/commit/06db3cec94c54e1cf720cdd=
5db72761514569d56
--		target.Triple =3D ""
-+	if OS =3D=3D Linux {
-+		if cc :=3D os.Getenv("SYZ_CC_" + OS + "_" + arch); cc !=3D "" {
-+			target.CCompiler =3D cc
-+		} else if arch =3D=3D runtime.GOARCH {
-+			// Don't use cross-compiler for native compilation, there are cases =
when this does not work:
-+			// https://github.com/google/syzkaller/pull/619
-+			// https://github.com/google/syzkaller/issues/387
-+			// https://github.com/google/syzkaller/commit/06db3cec94c54e1cf720cd=
d5db72761514569d56
-+			target.Triple =3D ""
-+		}
- 	}
- 	if target.CCompiler =3D=3D "" {
- 		target.setCompiler(useClang)
-@@ -839,7 +842,7 @@ func (target *Target) lazyInit() {
- 	// On CI we want to fail loudly if cross-compilation breaks.
- 	// Also fail if SOURCEDIR_GOOS is set b/c in that case user probably a=
ssumes it will work.
- 	if (target.OS !=3D runtime.GOOS || !runningOnCI) && getSourceDir(targe=
t) =3D=3D "" {
--		if _, err :=3D exec.LookPath(target.CCompiler); err !=3D nil {
-+		if _, err :=3D exec.LookPath(strings.Fields(target.CCompiler)[0]); er=
r !=3D nil {
- 			target.BrokenCompiler =3D fmt.Sprintf("%v is missing (%v)", target.C=
Compiler, err)
- 			return
- 		}
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/re=
cipes-test/syzkaller/syzkaller_git.bb
index b2b0f7ae9e..370fe44186 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -1,36 +1,41 @@
-DESCRIPTION =3D "syzkaller is an unsupervised coverage-guided kernel fuz=
zer"
+SUMMARY =3D "Unsupervised coverage-guided kernel fuzzer"
+HOMEPAGE =3D "https://github.com/google/syzkaller"
+BUGTRACKER =3D "https://github.com/google/syzkaller/issues"
+SECTION =3D "devel"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3D5335066555b1=
4d832335aa4660d6c376"
+require ${BPN}-licenses.inc
=20
-inherit go-mod
-
-GO_IMPORT =3D "github.com/google/syzkaller"
+DEPENDS:class-native +=3D "qemu-system-native"
=20
-SRC_URI =3D "git://${GO_IMPORT};protocol=3Dhttps;destsuffix=3D${BPN}-${P=
V}/src/${GO_IMPORT};branch=3Dmaster \
-           file://0001-sys-targets-targets.go-allow-users-to-override-ha=
rdc.patch;patchdir=3Dsrc/${GO_IMPORT} \
-           file://0001-executor-Include-missing-linux-falloc.h.patch;pat=
chdir=3Dsrc/${GO_IMPORT} \
-           file://0001-executor-Remove-including-error.h-in-test_linux.h=
.patch;patchdir=3Dsrc/${GO_IMPORT} \
-           "
-SRCREV =3D "25905f5d0a2a7883bd33491997556193582c6059"
+SRC_URI =3D "git://${GO_IMPORT};protocol=3Dhttps;destsuffix=3D${GO_SRCUR=
I_DESTSUFFIX};branch=3Dmaster"
+SRCREV =3D "22ec1469fe8c0ba256de07e8f97fa7b375b522bd"
+require ${BPN}-go-mods.inc
=20
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-export GOPROXY =3D "https://proxy.golang.org,direct"
+inherit go-mod
+
+GO_IMPORT =3D "github.com/google/syzkaller"
=20
 COMPATIBLE_HOST =3D "(x86_64|i.86|arm|aarch64).*-linux"
+COMPATIBLE_HOST:libc-musl =3D "null"
=20
 B =3D "${S}/src/${GO_IMPORT}/bin"
=20
 GO_EXTRA_LDFLAGS +=3D ' -X ${GO_IMPORT}/prog.GitRevision=3D${SRCREV}'
=20
-export GOHOSTFLAGS =3D "${GO_LINKSHARED} ${GOBUILDFLAGS}"
-export GOTARGETFLAGS =3D "${GO_LINKSHARED} ${GOBUILDFLAGS}"
+export GOHOSTFLAGS =3D "${GOBUILDFLAGS}"
+export GOTARGETFLAGS =3D "${GOBUILDFLAGS}"
 export TARGETOS =3D '${GOOS}'
 export TARGETARCH =3D '${GOARCH}'
 export TARGETVMARCH =3D '${GOARCH}'
=20
-CGO_ENABLED =3D "1"
+CGO_ENABLED =3D "0"
+
+# -buildmode=3Dpie requires external (cgo) linking on ARM and x86
+GOBUILDFLAGS:remove =3D "-buildmode=3Dpie"
=20
 LDFLAGS:append:class-target =3D "${@bb.utils.contains_any("TC_CXX_RUNTIM=
E", "llvm android", " -lc++", " -lstdc++", d)}"
=20
@@ -47,6 +52,7 @@ do_compile:class-target() {
     export HOSTOS=3D"${GOOS}"
     export HOSTARCH=3D"${GOARCH}"
     export SYZ_CC_${TARGETOS}_${TARGETARCH}=3D"${CC}"
+    export SYZ_CXX_${TARGETOS}_${TARGETARCH}=3D"${CXX}"
=20
     # Unset GOOS and GOARCH so that the correct syz-sysgen binary can be
     # generated. Fixes:
@@ -54,12 +60,12 @@ do_compile:class-target() {
     unset GOOS
     unset GOARCH
=20
-    oe_runmake GO=3D"${GO}" CFLAGS=3D"${CXXFLAGS} ${LDFLAGS}" REV=3D${SR=
CREV} target
+    oe_runmake GO=3D"${GO}" REV=3D${SRCREV} target
 }
=20
 do_install:class-native() {
-    SYZ_BINS_NATIVE=3D"syz-manager syz-runtest syz-repro syz-mutate syz-=
prog2c \
-                     syz-db syz-upgrade"
+    SYZ_BINS_NATIVE=3D"syz-manager syz-repro syz-mutate syz-prog2c syz-d=
b \
+                     syz-upgrade"
=20
     install -d ${D}${bindir}
=20
@@ -70,7 +76,7 @@ do_install:class-native() {
=20
 do_install:class-target() {
     SYZ_TARGET_DIR=3D"${TARGETOS}_${TARGETARCH}"
-    SYZ_BINS_TARGET=3D"syz-fuzzer syz-execprog syz-stress syz-executor"
+    SYZ_BINS_TARGET=3D"syz-execprog syz-executor"
=20
     install -d ${D}${bindir}/${SYZ_TARGET_DIR}
=20
--=20
2.49.0


