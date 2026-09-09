Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C35DC79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 18:50:49 +0000 (UTC)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20339.1788979843931197383
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 11:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YpN0N/E6;
 spf=pass (domain: gmail.com, ip: 74.125.230.76, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a3156692c6so5089061fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 11:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788979842; x=1789584642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVXOq2XJWwN8gtTqmqMwPZK+HSgkWXFnfmg7IbyaXrQ=;
        b=YpN0N/E6NHsLpcVzuuJT4x9owpb2Wgag94H3hbgYlY/otn0vjdUE9On2oFUGeHYb6N
         CXf8WqEga/+ujZTPZvF9y5J24K7YSQtB4J+JwbahYNVK2kMZDFE7Yblt0faGmvjH3AxA
         IsTMm6IX+qerd44GvmluRzJ21Sk7YsQ9qfvG3AgjVClCJWvg7r2eJ4JCNibAAj7pDVZv
         rQcQWXobSfszN5C/B8v0BewePAP3HGDGN4nLqlRHrqMgFkE+/bV/7tLXC7LhuJZuCjPM
         xkS8GTBOWiMstDiNvv+Me/FXC7wk5hN4AnBKZDDy4lnt2GbmI3bT8MObZMQok7D2tTxT
         CnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979842; x=1789584642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVXOq2XJWwN8gtTqmqMwPZK+HSgkWXFnfmg7IbyaXrQ=;
        b=lZ52ICwWpBonjqvwFWgyE/1H7XYTZ2kgGYbv3KzM5YU4yrWafDXP9NAh5S5iRHju0s
         RJF4EAD3zzCqrSkGTA34aiSaX37FAO/xhK1JaklEBnCTi1DoUnbo5KeNEpBxPo/bq9/d
         7p6e9AjGw+GA2n9aEvagqKNrT6LuOjVZ+jfsCsu1ljCCJlD9xNQO/9LYFXtWpj6lXI61
         CNAn0SSJEwb/Zkh6lmf2NQQOVTxgH8lFg8+rvXJD8LWzjrCQsWZPZG9C+7usn4WKkpFQ
         TcYotYiML7b/SQ4bLJFQZD1xC2VyeFYVvEuSObFROFXriuhWu+MhURlATY07uHBxK4i9
         oaTw==
X-Gm-Message-State: AFuF++koMp7Pw+uhhWpYnsB2pyNzpqoX0dfmxGmXxd0uP9G/rXNBYfH6
	wKS4FNWxvQsRBwJpdLYgBa6djxc0tIK8QG0+XCXVedZ/Qa0Xh8nml1XkT1omkQ==
X-Gm-Gg: AYBFou38cZke5O04flhFlPV+8+zLKIKt6IjdPMHQWfjS0pKzK9hrXYSjAQzaBsIMDPY
	lubyNKYJUXPy26OBofHBsmkNo2PFT2H4/n2I90C6aMPvNBnFKRZ6PbZN6ygOJeMEj8zSVmprQ30
	it22xH1g82XaCeoMHbAgwTx0mCoK7EMVS0s/y84SAguLKP07WubyJjdo4UE8/43okC356heUYDW
	XnAAAbeVnIdn6llDjwiiulbU7TdvxBev40EIkrcqaup1VLZrc9o42WOEWx4tTq2BPfIS6y44Sr9
	MgQ8xVvQzEF8HdXb81P65wjjW1fau23/fUcJxBm9lp6AvW2fwcBJQ0RF/sMRHohAsa+kQIYubt5
	GG4jtElSwbnf32xmOdctifzvT/jqYaXIEMwI4lJD2hV2fSP6cB0w9eRpkvve/zR54VM1k5fEm8k
	dmXlliajxk/lKrMOn3zP2nQWTsSKO8TaGx5v/b7yE7wT8qhAZehzmmNS8YvtokA37qg5+v63e1x
	M7NnCMtO511PhgaUtFgiQ4Qlq45w56IErAFCWGSvdMxeFOTpVs5+uk/DEC6inltXIwl/TeY/PS5
X-Received: by 2002:a2e:be95:0:b0:39c:7d57:a3ae with SMTP id 38308e7fff4ca-3a58cf5006emr3751481fa.0.1788979841120;
        Wed, 09 Sep 2026 11:50:41 -0700 (PDT)
Received: from localhost.localdomain ([176.88.90.107])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a370549917sm47818961fa.11.2026.09.09.11.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:50:40 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] tailscale: upgrade 1.98.3 -> 1.102.3
Date: Wed,  9 Sep 2026 21:50:35 +0300
Message-ID: <20260909185035.109983-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 18:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129894

do_compile fails with:

  alias.go:618:21: undefined: json.SkipFunc
  alias.go:957:14: undefined: json.DiscardUnknownMembers

Go 1.27 turns the jsonv2 experiment on by default, so the json module
pinned by 1.98.3 builds its alias file against encoding/json/v2 and
aliases symbols that are gone. 1.102.3 pins a newer module.

- Regenerate go module dependencies and license checksums
- Manually verify and complete Unknown license entries

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../tailscale/tailscale-go-mods.inc           | 76 +++++++++--------
 .../tailscale/tailscale-licenses.inc          | 84 ++++++++++---------
 ...ilscale_1.98.3.bb => tailscale_1.102.3.bb} |  2 +-
 3 files changed, 85 insertions(+), 77 deletions(-)
 rename meta-networking/recipes-connectivity/tailscale/{tailscale_1.98.3.bb => tailscale_1.102.3.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc b/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
index 7e2e91bb56..8ff260b8f3 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
@@ -10,85 +10,89 @@ SRC_URI += "\
     gomod://github.com/Kodeworks/golang-image-ico;version=v0.0.0-20141118225523-73f0f4cfade9;sha256sum=1d677069e35c4a3e4f290e68c6e2391f6237aee9ce3f39448ed09a2ddab274b0 \
     gomod://github.com/anmitsu/go-shlex;version=v0.0.0-20200514113438-38f4b401e2be;sha256sum=2a5cf7c9a2709f649fd508cbacb2be96e4fba4d534a28a122ee4d7574af40b5e \
     gomod://github.com/atotto/clipboard;version=v0.1.4;sha256sum=d67b2c36c662751309fd2ec351df3651584bea840bd27be9a90702c3a238b43f \
-    gomod://github.com/aws/aws-sdk-go-v2;version=v1.41.0;sha256sum=869834493118f72f9349f5493959bcd8fc951fa236eecd0095c16322f5b2f53c \
-    gomod://github.com/aws/aws-sdk-go-v2/config;version=v1.29.5;sha256sum=ce165d37c7b1dfee2047137f1176c197dc397a5553ef6fc0dba799b21908475b \
-    gomod://github.com/aws/aws-sdk-go-v2/credentials;version=v1.17.58;sha256sum=238cc4a98dde7bc3e94dc0f0005c4d988a244daaa9fe4fda706a781ec62bf7e2 \
-    gomod://github.com/aws/aws-sdk-go-v2/feature/ec2/imds;version=v1.16.27;sha256sum=408958244a10036461c3a3b27fcdaf20efa3af19168bd527b6617319a754309c \
-    gomod://github.com/aws/aws-sdk-go-v2/internal/configsources;version=v1.4.16;sha256sum=5bd82543507e01fab6a9344a995a431682f4061770b25005f9116f43ae539ac4 \
-    gomod://github.com/aws/aws-sdk-go-v2/internal/endpoints/v2;version=v2.7.16;sha256sum=0a4cc94f6843c9c50a1839783123b4664a07d5a67d8a49157304f8550c0c2e39 \
-    gomod://github.com/aws/aws-sdk-go-v2/internal/ini;version=v1.8.2;sha256sum=53d1a9a401283711118c91e6e9fdb8193ce6430ca4bbe6b5454bcaaa51e81de0 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding;version=v1.13.4;sha256sum=e9b9e131812d339f4ac2b20bb504caf1cde680e048e15688bd8126ecd300e5e2 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/internal/presigned-url;version=v1.13.16;sha256sum=1ba321f470ad6ce8673c303386f15136b8fa2f86b23e6a181dbf5c74cb84ef7b \
-    gomod://github.com/aws/aws-sdk-go-v2/service/ssm;version=v1.44.7;sha256sum=e09b97aa37ffd7c003a8a2e7574668e92eabd267d2a78d22fb440bcd93a61e46 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/sso;version=v1.24.14;sha256sum=9196a430068584c9d1e621aff0a45b32adaf190b4363dddda8b341901e188f51 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/ssooidc;version=v1.28.13;sha256sum=acaeca3476410d64512a4d9feefd6c8d16effa76718f72db4ba7b786c7fcc398 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/sts;version=v1.41.5;sha256sum=de6f3748c40c13e10b790a7c02023aa559b153c251856e3b3940ee47cc0bc007 \
-    gomod://github.com/aws/smithy-go;version=v1.24.0;sha256sum=655a1e00489bcf29a94cf26878c2f0b3b74c8bfb5d3c566baa3b94e088fbf417 \
-    gomod://github.com/coder/websocket;version=v1.8.12;sha256sum=ad8d323970c04679f4566ee7db98946508c37cdd21a46a875d5257d631a9e990 \
+    gomod://github.com/aws/aws-sdk-go-v2;version=v1.42.1;sha256sum=c3e31605929531eedf5273151c0beb410b58f389d38c3357c62908a674827f9d \
+    gomod://github.com/aws/aws-sdk-go-v2/config;version=v1.32.17;sha256sum=a72a31ed8fce33b473dd0b684be8d709e64f6ef17981492541dd910403307004 \
+    gomod://github.com/aws/aws-sdk-go-v2/credentials;version=v1.19.16;sha256sum=f4efe61167ef97d6c3cb5c9de373daa36aeae2a9be1668d8ffffc3d878e89a7f \
+    gomod://github.com/aws/aws-sdk-go-v2/feature/ec2/imds;version=v1.18.23;sha256sum=090b0395757b407c89e80296beeecc24264b0ff7fe3337249eca3a3f056688fe \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/configsources;version=v1.4.30;sha256sum=e91f072c53b8258204d771b9ac674a292333c3e0b232ea1d7200177c8934ebd6 \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/endpoints/v2;version=v2.7.30;sha256sum=638789184c9b7ae2238d68951bb3188d225b50e93bbbe92168498192030e7b60 \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/v4a;version=v1.4.24;sha256sum=c7e35c4145c5d71ed4dbc45b599dee9304e9cfceb76970d65225fb4fe9771872 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding;version=v1.13.13;sha256sum=96c2fd96a30e0ebb9388fc5ce08ae115031ca9599e982e4cd441717e95966982 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/presigned-url;version=v1.13.30;sha256sum=893e5235ddc783537abd8d55d6c9b40b50b75c2fcda8be2b30e1d37cf19e7c70 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/signin;version=v1.0.11;sha256sum=6faac46de482e397f6d0c401078046b8d84bd11213f3a76e1536f058acd12056 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/ssm;version=v1.45.0;sha256sum=b488ee2053e3d245ac292df62fb399ef0e3dd6df191944bfc5434f65489fd88f \
+    gomod://github.com/aws/aws-sdk-go-v2/service/sso;version=v1.30.17;sha256sum=09feabc247e03dec70f9fb8c2d1c49901d6dc6b2a064e5c4a79cf4dcdd403a1a \
+    gomod://github.com/aws/aws-sdk-go-v2/service/ssooidc;version=v1.35.21;sha256sum=404f734866931f34bbdf3dd5b66a8807a500a7bb1073ea0bb8ff7063cd724d90 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/sts;version=v1.42.1;sha256sum=b3c95e049548d1116a0ccf034c0a0354cd30ef280223541e2cd8dd90c2e2cb11 \
+    gomod://github.com/aws/smithy-go;version=v1.27.3;sha256sum=0db2c11f209d7a24589378abb0ebc73cad0d6102a4589e3095bc6fa4a368b52a \
+    gomod://github.com/bradfitz/monogok;version=v0.0.0-20260630033929-b1eef977b41f;sha256sum=9b4a0f3eaf060d99c7409ddc8289b804119d5e75cb365ee21714f766581ac83f \
+    gomod://github.com/coder/websocket;version=v1.8.14;sha256sum=b729277821461eb21a816c16e29a02029dd6abbb1a43b526c1e0a6b794942de0 \
     gomod://github.com/coreos/go-iptables;version=v0.7.1-0.20240112124308-65c67c9f46e6;sha256sum=6d0ae6344f1d355f72e6aaba583ce73822861511337ca92cc1c4727fc8ba66dd \
-    gomod://github.com/creachadair/msync;version=v0.7.1;sha256sum=ee8dd1d2cc8a1e555fcfaecc7407425216ee87cd4414093d9a3d8d50fc622e5d \
+    gomod://github.com/creachadair/msync;version=v0.8.1;sha256sum=f4cd6b7d1cc968c65106f7affa5f836379339ba21677a6b2204f3837f4c47723 \
     gomod://github.com/creack/pty;version=v1.1.24;sha256sum=754e25253e76a5583b80d57d3add3afe68fc4d9f2a490968a9d1eda8c8fd8815 \
     gomod://github.com/digitalocean/go-smbios;version=v0.0.0-20180907143718-390a4f403a8e;sha256sum=2bc498a09aa55b3417bebacce448b2d2ab757981e59b6b016d08cf97e4a7bdde \
+    gomod://github.com/diskfs/go-diskfs;version=v1.9.3;sha256sum=e564a1454b9607167a7d496946e4a3b06eb60bbe09ec31a22d29e668e0e0e68f \
     gomod://github.com/djherbis/times;version=v1.6.0;sha256sum=21d69060967bc03ea3c39ff8c0b1a95511e96eccd3749a2daef1a02af1bc0a85 \
     gomod://github.com/fogleman/gg;version=v1.3.0;sha256sum=792f7a3ea9eea31b7947dabaf9d5a307389245069078e4bf435d76cb0505439c \
     gomod://github.com/fxamacker/cbor/v2;version=v2.9.0;sha256sum=5b0ec6424bd522aeeeab30cbdcad6f40bf976a9a2ddf125ab27b97826140d97a \
     gomod://github.com/gaissmai/bart;version=v0.26.1;sha256sum=7cead7fb3f4be36f3864efaf1344d72ca7ba03ab5a557338c80ca6d4bda59cca \
-    gomod://github.com/go-json-experiment/json;version=v0.0.0-20250813024750-ebf49471dced;sha256sum=e20ad9cf462e43db906cd2dc237061d6a5b575d10bd4ece52f1857b15a107006 \
-    gomod://github.com/godbus/dbus/v5;version=v5.1.1-0.20230522191255-76236955d466;sha256sum=262f43ec87570238a0e770e7fa656dda70fe6050a7edf5addc30287cb64b21a6 \
+    gomod://github.com/go-json-experiment/json;version=v0.0.0-20260214004413-d219187c3433;sha256sum=4cd402f765c9dca0c492942b0c98da26a922905372e0bbb0364fcad3bcba0965 \
+    gomod://github.com/godbus/dbus/v5;version=v5.2.2;sha256sum=5c6f37c725a481fb0f1e7866ae273429525d8cc6a6cace87da28e53370f5596a \
     gomod://github.com/golang/freetype;version=v0.0.0-20170609003504-e2365dfdc4a0;sha256sum=cdcb9e6a14933dcbf167b44dcd5083fc6a2e52c4fae8fb79747c691efeb7d84e \
     gomod://github.com/golang/groupcache;version=v0.0.0-20241129210726-2c02b8208cf8;sha256sum=163367355442a630b12b0b452892cd98e99fcfdf7e40b68d358be73479cc1c23 \
     gomod://github.com/google/btree;version=v1.1.3;sha256sum=11b736bc8252b52fecdf346d3707ccf3a2b6d458ba21b4f843616fc12eeb30b2 \
     gomod://github.com/google/go-tpm;version=v0.9.4;sha256sum=a8a5e504fbd78284a50e6ab625f6248cfbb89421fafdfee71d66abc6e1dfc192 \
     gomod://github.com/google/nftables;version=v0.2.1-0.20240414091927-5e242ec57806;sha256sum=ceb96b39a6f9004d8c217a6ae61b91a69c250bc30fbf3a04cd87cbbfddea73c8 \
+    gomod://github.com/google/uuid;version=v1.6.0;sha256sum=d0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed \
     gomod://github.com/hdevalence/ed25519consensus;version=v0.2.0;sha256sum=111cafade3ba9c7c3adf66b6a424386e30829c46c60b80dabe288e1837d30e33 \
     gomod://github.com/huin/goupnp;version=v1.3.0;sha256sum=df663b90b9b3bf16e1cfa810a6c3dd904993e8c1155dbf65566ce0361f163dce \
     gomod://github.com/illarion/gonotify/v3;version=v3.0.2;sha256sum=fef3e17f676c8ce98b60f0e2180fc4e3331e6e1604eaf96ab8791e073f96a7af \
-    gomod://github.com/insomniacslk/dhcp;version=v0.0.0-20231206064809-8c70d406f6d2;sha256sum=be28971fb642a9c4cf9f16e07332310af05c291584b6440b32849ca058dd345d \
+    gomod://github.com/insomniacslk/dhcp;version=v0.0.0-20240129002554-15c9b8791914;sha256sum=539bdec94134fed4383e1ed8d1260b9239b9cac5508718915fb354d19ec69ff2 \
     gomod://github.com/jellydator/ttlcache/v3;version=v3.1.0;sha256sum=278dfc9b4882eaeb9b56e925b574028f3e9cc4436645b93f56ccb69de134a898 \
     gomod://github.com/jmespath/go-jmespath;version=v0.4.0;sha256sum=d1f77b6790d7c4321a74260f3675683d3ac06b0a614b5f83e870beae0a8b2867 \
-    gomod://github.com/jsimonetti/rtnetlink;version=v1.4.0;sha256sum=81625291f4d0a08718dfd2170873d1adfd8fc2248657584f520c4de6de9e2e4d \
+    gomod://github.com/jsimonetti/rtnetlink;version=v1.4.1;sha256sum=b27130e80a69c0fab7e071bc90dd30288628ae7e1003dff727e5d49f3d99087d \
     gomod://github.com/kballard/go-shellquote;version=v0.0.0-20180428030007-95032a82bc51;sha256sum=ae4cb7b097dc4eb0c248dff00ed3bbf0f36984c4162ad1d615266084e58bd6cc \
-    gomod://github.com/klauspost/compress;version=v1.18.5;sha256sum=e1fdde95d97978146243f1e793ce18a09b107d6cd6032347fcb5b9115181497d \
+    gomod://github.com/klauspost/compress;version=v1.19.1;sha256sum=a77e019f60dff8bdf00ad137985c808957cc657381daa4281824843bc6b46910 \
     gomod://github.com/kortschak/wol;version=v0.0.0-20200729010619-da482cc4850a;sha256sum=09c15500a0ef54af0796f37282dd5377d2b866e4c36c87dcb6b2894cf3114dc5 \
     gomod://github.com/kr/fs;version=v0.1.0;sha256sum=d376bd98e81aea34585fc3b04bab76363e9e87cde69383964e57e9779f2af81e \
-    gomod://github.com/mattn/go-colorable;version=v0.1.13;sha256sum=08be322dcc584a9fcfde5caf0cf878b4e11cd98f252e32bc704e92c5a4ba9d15 \
-    gomod://github.com/mattn/go-isatty;version=v0.0.20;sha256sum=f2d5f89ca451577e17464b9bb596dc0d0ecececb5eaa63622c41b57cd0b7b8cc \
+    gomod://github.com/mattn/go-colorable;version=v0.1.15;sha256sum=221144f51cc5eeda0a72bd7b5832181b94240c1d760bde0b3428895e63e63339 \
+    gomod://github.com/mattn/go-isatty;version=v0.0.23;sha256sum=670cdaa44183b9b7aac0078b1a4cba34a74a0a85e2b92d2434a6b2ccf3387fa6 \
     gomod://github.com/mdlayher/genetlink;version=v1.3.2;sha256sum=0924e7da370fdb2e7bea20fdde519ae37377db35500cd0aaf09769eddb314e19 \
     gomod://github.com/mdlayher/netlink;version=v1.7.3-0.20250113171957-fbb4dce95f42;sha256sum=b427c8c746e87c2f8033678fb87cdcf5cefb21ce16f35930eff91683661395f0 \
     gomod://github.com/mdlayher/sdnotify;version=v1.0.0;sha256sum=26f4efbcba73eaec323973c8ae335bad430e5d6947097976cfbe7c9547f68c90 \
     gomod://github.com/mdlayher/socket;version=v0.5.0;sha256sum=931626341956178fe6015b128fdda22283480d05dc964675307eb61ed39c29fe \
     gomod://github.com/mitchellh/go-ps;version=v1.0.0;sha256sum=f2f0400b1d5e136419daed275c27a930b0f5447ac12bb8acd3ddbe39547b2834 \
     gomod://github.com/peterbourgon/ff/v3;version=v3.4.0;sha256sum=b49537268ce67eb755d773fdd2a3e1c9c6dec0731993a4f742080416eb9b12a6 \
-    gomod://github.com/pierrec/lz4/v4;version=v4.1.25;sha256sum=f8a08e363b7ac3835d6785281e7b26bee4928dade20b2750286397180e5c7a75 \
+    gomod://github.com/pierrec/lz4/v4;version=v4.1.26;sha256sum=cf67f99d8d4ed84775a51de3167b70907e5436dd2f501f37deffac46c0a51ae1 \
     gomod://github.com/pires/go-proxyproto;version=v0.8.1;sha256sum=a979a2f26160bfcb6f3829dd546d5f53c8b1879e7ad84466e359cf3f6237aa4c \
     gomod://github.com/pkg/sftp;version=v1.13.6;sha256sum=0cdf6bd0edef9db8137ce398c9bbe514713e42cf2d4d415b5025f4a3c33f249d \
     gomod://github.com/safchain/ethtool;version=v0.3.0;sha256sum=bfa1a3fe314a3f2ac4c4385a6c4694708e4881bfd86c34668eca92656e398590 \
     gomod://github.com/skip2/go-qrcode;version=v0.0.0-20200617195104-da1b6568686e;sha256sum=3fc1c4d11c79001d1cc2df0de87493b324b9af141cc59ae8c212612dd2c90e90 \
-    gomod://github.com/tailscale/gliderssh;version=v0.3.4-0.20260330083525-c1389c70ff89;sha256sum=b80328e5c37bd7f6f8a3c304d8938ade18e12b035b753cd50db265147814befd \
+    gomod://github.com/tailscale/gliderssh;version=v0.3.4-0.20260716005906-1a0f895faf28;sha256sum=7f1a31c7982476845ba2fddc693ce8755ddf573be83f95e4136ecde59fdb6de8 \
     gomod://github.com/tailscale/hujson;version=v0.0.0-20260302212456-ecc657c15afd;sha256sum=9f9c320dd90c86880b26107b931d6c056e99642d4c4e50fafcdf7de8ea0989e6 \
     gomod://github.com/tailscale/netlink;version=v1.1.1-0.20240822203006-4d49adab4de7;sha256sum=a5195ef600f8d9a0fb8501eea85e4fe0321a74bd57dec88f07b8569d0ee4f55e \
     gomod://github.com/tailscale/peercred;version=v0.0.0-20250107143737-35a0c7bd7edc;sha256sum=87d0f4f3b1d59ea45c9a87b775b615bebd721a5870dafedc63cc860ec4aac281 \
     gomod://github.com/tailscale/web-client-prebuilt;version=v0.0.0-20250124233751-d4cd19a26976;sha256sum=1d02f0804bb41e0743b7d889b8e2dbd8466a89793f03997f4c1fd10f9e8974c3 \
-    gomod://github.com/tailscale/wireguard-go;version=v0.0.0-20260427181203-e3ac4a0afb4e;sha256sum=2b648406d9e57b06178836db6b2e3e9a7c5e25fefe256978a11d91d34a4a5581 \
+    gomod://github.com/tailscale/wireguard-go;version=v0.0.0-20260715223240-2e01ba5b00f0;sha256sum=cbd2f6f9b0f809c5f0f73032f25a69839f4d12c4f451819c952de92c53e1ed02 \
     gomod://github.com/tailscale/xnet;version=v0.0.0-20240729143630-8497ac4dab2e;sha256sum=438abf28ce5fb03adf529c2cb57a451f9b243c4a2a181d9d06cdb61bb10960e7 \
     gomod://github.com/toqueteos/webbrowser;version=v1.2.0;sha256sum=1227d3ebeab16d8232a304a10b087984a96ad30f7439b6687bab2f5747d308cf \
     gomod://github.com/u-root/u-root;version=v0.14.0;sha256sum=a65c0a06236b10a0cea50e603fef0ced0c7e343a66ef957a45ebcd51f304d286 \
     gomod://github.com/u-root/uio;version=v0.0.0-20240224005618-d2acac8f3701;sha256sum=f6e8f912e968744999d508c3df54f0308aaf337052a8d0bd3edd72583adfd9cd \
     gomod://github.com/vishvananda/netns;version=v0.0.5;sha256sum=07804b88c922c2a6780efe392ffef9d126eac584384eb3eb17bcadd34cfa9422 \
     gomod://github.com/x448/float16;version=v0.8.4;sha256sum=73b24a41037ea999ab66851e3798a0973dbb1f214925915b01f0820f7b2f1500 \
-    gomod://go.yaml.in/yaml/v2;version=v2.4.2;sha256sum=ed63e181cbb5a991c104639b0e6d48d45fd951f22b47d4c5d1a36156d8ed06ee \
+    gomod://go.yaml.in/yaml/v2;version=v2.4.4;sha256sum=1b98a6a498cf255c5f2982d32c74633bc7969770957e98103ac1e14345aa4576 \
     gomod://go4.org/mem;version=v0.0.0-20240501181205-ae6ca9944745;sha256sum=9b5037a57122457fdc5c2c0a31e3996b44cf9dfcdee5c53ed72adfd88d077795 \
     gomod://go4.org/netipx;version=v0.0.0-20231129151722-fdeea329fbba;sha256sum=e15f57de368c92b826010181906f26112ba3a0d7fde7d94c8a8c60c525dc4044 \
-    gomod://golang.org/x/crypto;version=v0.50.0;sha256sum=aaf9503dd088d2727e08f213d23424ebc75a52ee609f084ec4c726f3590c0ea5 \
-    gomod://golang.org/x/exp;version=v0.0.0-20250620022241-b7579e27df2b;sha256sum=fdaae8f1b98727b49d10228492b2dee1b8c68d12f640a4f17f0fb175581bf547 \
-    gomod://golang.org/x/image;version=v0.27.0;sha256sum=db4846c8edb8cdcb556d205840361f62382df9bd5946b756e700c5fb43d90332 \
-    gomod://golang.org/x/net;version=v0.53.0;sha256sum=3808b07d64ba58f58ca91737f0a165439f72b03a512ea901bad2aa1e168092d5 \
+    gomod://golang.org/x/crypto;version=v0.54.0;sha256sum=ecf4030c1c6b55b897826b95f01d7416cf2785b4675b0f9ac218ddf754a03abb \
+    gomod://golang.org/x/exp;version=v0.0.0-20260410095643-746e56fc9e2f;sha256sum=de285d08489fcd4d420a8561501e75b5124db0a48121dfc26e811959f518db4e \
+    gomod://golang.org/x/image;version=v0.41.0;sha256sum=dfa6f0db97442ba5f22a385e8f226334f79373cd59d2e3b91f8cdaa1d122d2be \
+    gomod://golang.org/x/net;version=v0.56.0;sha256sum=bbc975b3ec9cd86892cfc515badc125657e135c00162d0da5de33f6d07930464 \
     gomod://golang.org/x/oauth2;version=v0.36.0;sha256sum=15bf65ff103e5dafc809d78cd037a1d1e88ccb8451824e851156002a13304504 \
-    gomod://golang.org/x/sync;version=v0.20.0;sha256sum=7179d4d68800f6fdcadb9d4bbf11cbb5df9b40360c89305c203fe20723cbd375 \
-    gomod://golang.org/x/sys;version=v0.43.0;sha256sum=cb8b073934cf7e579c9f80c4d12619d5f96fcf97af6f07fdc649e7acec0aaddf \
-    gomod://golang.org/x/term;version=v0.42.0;sha256sum=c69cf2bf68d1d73e15a31c1c9a687316edef5c4ef9b6bb35aaedc08c6204f3c2 \
-    gomod://golang.org/x/text;version=v0.36.0;sha256sum=15c60227cf084605a0256b8eacd9cfaf411109fe80c9e68b14a9367a5e42b23c \
-    gomod://golang.org/x/time;version=v0.12.0;sha256sum=cdcb04c43b112919c5e0d0fa1d90769124ad56918a44e6cb0747876ed7e5015c \
+    gomod://golang.org/x/sync;version=v0.22.0;sha256sum=4bc67d258ce7867cfc1a43765c43d98b4c49b90c46dd0b86f896a5a4909fade0 \
+    gomod://golang.org/x/sys;version=v0.47.0;sha256sum=cdac013ddced0262926ec29ffcda645da39670e61c7e5b761e572b6b1809bb1b \
+    gomod://golang.org/x/term;version=v0.45.0;sha256sum=b3a3af689728b43012ae1b21482571a35c033c545e98e021606bd4fcf1f79108 \
+    gomod://golang.org/x/text;version=v0.40.0;sha256sum=07757384728d0f52dd85c1f3f163405e6396b2b0fb7eb7d6b610f2a711d69ee3 \
+    gomod://golang.org/x/time;version=v0.15.0;sha256sum=8cfb20e915fa5d6c3fd264304233f8d71a3385e48a37819239c532ad9da27f84 \
     gomod://gvisor.dev/gvisor;version=v0.0.0-20260224225140-573d5e7127a8;sha256sum=2335e73d1effb8e5601be32b322e5d39bf1efc1eef2d296a8e054bd37a72b47f \
     gomod://k8s.io/client-go;version=v0.34.0;sha256sum=3ede34d9df9dcb02779a631ca9c653f92db3714ee887c6fdd86a66bc4889d2c0 \
     gomod://sigs.k8s.io/yaml;version=v1.6.0;sha256sum=cf88648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e11e5052 \
diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc b/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
index 91859870de..573fc422b4 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
@@ -12,89 +12,93 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/!kodeworks/golang-image-ico@v0.0.0-20141118225523-73f0f4cfade9/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/anmitsu/go-shlex@v0.0.0-20200514113438-38f4b401e2be/LICENSE;md5=45a47c50f5b33ff9ab3347c7db1bfb6a;spdx=MIT \
     file://pkg/mod/github.com/atotto/clipboard@v0.1.4/LICENSE;md5=489200b65f13bcbcb890a96b99a58a6f;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/config@v1.29.5/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/credentials@v1.17.58/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/feature/ec2/imds@v1.16.27/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/configsources@v1.4.16/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2@v2.7.16/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/ini@v1.8.2/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding@v1.13.4/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/presigned-url@v1.13.16/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssm@v1.44.7/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sso@v1.24.14/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssooidc@v1.28.13/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sts@v1.41.5/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.41.0/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.41.0/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/aws/smithy-go@v1.24.0/LICENSE;md5=34400b68072d710fecd0a2940a0d1658;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/smithy-go@v1.24.0/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/coder/websocket@v1.8.12/LICENSE.txt;md5=bc0b6f68116166556efe7184edfda3e9;spdx=ISC \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/config@v1.32.17/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/credentials@v1.19.16/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/feature/ec2/imds@v1.18.23/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/configsources@v1.4.30/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2@v2.7.30/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/v4a@v1.4.24/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding@v1.13.13/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/presigned-url@v1.13.30/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/signin@v1.0.11/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssm@v1.45.0/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sso@v1.30.17/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssooidc@v1.35.21/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sts@v1.42.1/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.42.1/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.42.1/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/aws/smithy-go@v1.27.3/LICENSE;md5=34400b68072d710fecd0a2940a0d1658;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/smithy-go@v1.27.3/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/bradfitz/monogok@v0.0.0-20260630033929-b1eef977b41f/LICENSE;md5=32c87c5071c476dfcb4de7a5890010f3;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/coder/websocket@v1.8.14/LICENSE.txt;md5=6be4dff96499e563e8b776f92bf18876;spdx=ISC \
     file://pkg/mod/github.com/coreos/go-iptables@v0.7.1-0.20240112124308-65c67c9f46e6/LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/creachadair/msync@v0.7.1/LICENSE;md5=b8be277519c5ee121454d43de171668a;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/creachadair/msync@v0.8.1/LICENSE;md5=b8be277519c5ee121454d43de171668a;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/creack/pty@v1.1.24/LICENSE;md5=93958070863d769117fa33b129020050;spdx=MIT \
     file://pkg/mod/github.com/digitalocean/go-smbios@v0.0.0-20180907143718-390a4f403a8e/LICENSE.md;md5=c1653934903ab2785c09c2bdd7344526;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/diskfs/go-diskfs@v1.9.3/LICENSE;md5=a346cc99f8bdb4f2cb18021ef39dedba;spdx=MIT \
     file://pkg/mod/github.com/djherbis/times@v1.6.0/LICENSE;md5=3cafd141825e7a44b1c6a047b2320012;spdx=MIT \
     file://pkg/mod/github.com/fogleman/gg@v1.3.0/LICENSE.md;md5=1630f0e1bac38694fdc4dcb6a9218f4a;spdx=MIT \
     file://pkg/mod/github.com/fxamacker/cbor/v2@v2.9.0/LICENSE;md5=827f5a2fa861382d35a3943adf9ebb86;spdx=MIT \
     file://pkg/mod/github.com/gaissmai/bart@v0.26.1/LICENSE;md5=05779e437ec35570aca43cc66a95e056;spdx=MIT \
-    file://pkg/mod/github.com/go-json-experiment/json@v0.0.0-20250813024750-ebf49471dced/LICENSE;md5=9d210c7471ce08e3db5261f33bf8fce6;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/godbus/dbus/v5@v5.1.1-0.20230522191255-76236955d466/LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed;spdx=BSD-2-Clause \
+    file://pkg/mod/github.com/go-json-experiment/json@v0.0.0-20260214004413-d219187c3433/LICENSE;md5=9d210c7471ce08e3db5261f33bf8fce6;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/godbus/dbus/v5@v5.2.2/LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/golang/freetype@v0.0.0-20170609003504-e2365dfdc4a0/LICENSE;md5=8e050e4860234723098ceeefa49edd05;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/golang/groupcache@v0.0.0-20241129210726-2c02b8208cf8/LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5;spdx=Apache-2.0 \
     file://pkg/mod/github.com/google/btree@v1.1.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/github.com/google/go-tpm@v0.9.4/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/github.com/google/nftables@v0.2.1-0.20240414091927-5e242ec57806/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/google/uuid@v1.6.0/LICENSE;md5=88073b6dd8ec00fe09da59e0b6dfded1;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/hdevalence/ed25519consensus@v0.2.0/LICENSE;md5=4041895a1f717acb5be52e24edb19917;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/huin/goupnp@v1.3.0/LICENSE;md5=3d7eee8afacfccb446c1ac30289c965d;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/illarion/gonotify/v3@v3.0.2/LICENSE;md5=6b631a3123c7c679195702a8a35c9f21;spdx=MIT \
-    file://pkg/mod/github.com/insomniacslk/dhcp@v0.0.0-20231206064809-8c70d406f6d2/LICENSE;md5=ceaf33b8b657b2d342dbd3bb59578d8a;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/insomniacslk/dhcp@v0.0.0-20240129002554-15c9b8791914/LICENSE;md5=ceaf33b8b657b2d342dbd3bb59578d8a;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/jellydator/ttlcache/v3@v3.1.0/LICENSE;md5=4cea77626c625d583c98a85a8658f9d2;spdx=MIT \
     file://pkg/mod/github.com/jmespath/go-jmespath@v0.4.0/LICENSE;md5=9abfa8353fce3f2cb28364e1e9016852;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/jsimonetti/rtnetlink@v1.4.0/LICENSE.md;md5=75a8090d4c02945ad9d61c7cce77ed48;spdx=MIT \
+    file://pkg/mod/github.com/jsimonetti/rtnetlink@v1.4.1/LICENSE.md;md5=75a8090d4c02945ad9d61c7cce77ed48;spdx=MIT \
     file://pkg/mod/github.com/kballard/go-shellquote@v0.0.0-20180428030007-95032a82bc51/LICENSE;md5=9d95d1ad917c814c23909addb8692eeb;spdx=MIT \
-    file://pkg/mod/github.com/klauspost/compress@v1.18.5/LICENSE;md5=d0fd9ebda39468b51ff4539c9fbb13a8;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/klauspost/compress@v1.18.5/internal/snapref/LICENSE;md5=b8b79c7d4cda128290b98c6a21f9aac6;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/klauspost/compress@v1.18.5/zstd/internal/xxhash/LICENSE.txt;md5=802da049c92a99b4387d3f3d91b00fa9;spdx=MIT \
+    file://pkg/mod/github.com/klauspost/compress@v1.19.1/LICENSE;md5=d0fd9ebda39468b51ff4539c9fbb13a8;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.19.1/internal/snapref/LICENSE;md5=b8b79c7d4cda128290b98c6a21f9aac6;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.19.1/zstd/internal/xxhash/LICENSE.txt;md5=802da049c92a99b4387d3f3d91b00fa9;spdx=MIT \
     file://pkg/mod/github.com/kortschak/wol@v0.0.0-20200729010619-da482cc4850a/LICENSE;md5=5a0acdb344844a21e2df8bc2e1fe5f2d;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/kr/fs@v0.1.0/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/mattn/go-colorable@v0.1.13/LICENSE;md5=24ce168f90aec2456a73de1839037245;spdx=MIT \
-    file://pkg/mod/github.com/mattn/go-isatty@v0.0.20/LICENSE;md5=f509beadd5a11227c27b5d2ad6c9f2c6;spdx=MIT \
+    file://pkg/mod/github.com/mattn/go-colorable@v0.1.15/LICENSE;md5=24ce168f90aec2456a73de1839037245;spdx=MIT \
+    file://pkg/mod/github.com/mattn/go-isatty@v0.0.23/LICENSE;md5=f509beadd5a11227c27b5d2ad6c9f2c6;spdx=MIT \
     file://pkg/mod/github.com/mdlayher/genetlink@v1.3.2/LICENSE.md;md5=e08504321a9b3e86ee07433c231b33f1;spdx=MIT \
     file://pkg/mod/github.com/mdlayher/netlink@v1.7.3-0.20250113171957-fbb4dce95f42/LICENSE.md;md5=e08504321a9b3e86ee07433c231b33f1;spdx=MIT \
     file://pkg/mod/github.com/mdlayher/sdnotify@v1.0.0/LICENSE.md;md5=a57b2e272a0c75c413c784bb877cda50;spdx=MIT \
     file://pkg/mod/github.com/mdlayher/socket@v0.5.0/LICENSE.md;md5=bdcb2fcb7aea8a34d189ef572a59ff88;spdx=MIT \
     file://pkg/mod/github.com/mitchellh/go-ps@v1.0.0/LICENSE.md;md5=56da355a12d4821cda57b8f23ec34bc4;spdx=MIT \
     file://pkg/mod/github.com/peterbourgon/ff/v3@v3.4.0/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/pierrec/lz4/v4@v4.1.25/LICENSE;md5=09ece85f3c312a63b522bfc6ebd44943;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/pierrec/lz4/v4@v4.1.26/LICENSE;md5=09ece85f3c312a63b522bfc6ebd44943;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/pires/go-proxyproto@v0.8.1/LICENSE;md5=ebfe2201eab4c067477cc534908ac12f;spdx=Apache-2.0 \
     file://pkg/mod/github.com/pkg/sftp@v1.13.6/LICENSE;md5=452fc5cc5a9127a0e828d73423d45035;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/safchain/ethtool@v0.3.0/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc;spdx=Apache-2.0 \
     file://pkg/mod/github.com/skip2/go-qrcode@v0.0.0-20200617195104-da1b6568686e/LICENSE;md5=515c25e1450ede2834397875c18439d4;spdx=MIT \
-    file://pkg/mod/github.com/tailscale/gliderssh@v0.3.4-0.20260330083525-c1389c70ff89/LICENSE;md5=ac631f842784b8ec269293a49121236b;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/tailscale/gliderssh@v0.3.4-0.20260716005906-1a0f895faf28/LICENSE;md5=ac631f842784b8ec269293a49121236b;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/tailscale/hujson@v0.0.0-20260302212456-ecc657c15afd/LICENSE;md5=073f7ac93b9172ac4e1d258584fc0271;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/tailscale/netlink@v1.1.1-0.20240822203006-4d49adab4de7/LICENSE;md5=2ade771c7d7211af507864e8dd520529;spdx=Apache-2.0 \
     file://pkg/mod/github.com/tailscale/peercred@v0.0.0-20250107143737-35a0c7bd7edc/LICENSE;md5=94eaeed21686fd9816f57f86b9914071;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/tailscale/web-client-prebuilt@v0.0.0-20250124233751-d4cd19a26976/LICENSE;md5=a672713a9eb730050e491c92edf7984d;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/tailscale/wireguard-go@v0.0.0-20260427181203-e3ac4a0afb4e/LICENSE;md5=995598bc9de2b4c987c2cb87fc24f341;spdx=MIT \
+    file://pkg/mod/github.com/tailscale/wireguard-go@v0.0.0-20260715223240-2e01ba5b00f0/LICENSE;md5=995598bc9de2b4c987c2cb87fc24f341;spdx=MIT \
     file://pkg/mod/github.com/tailscale/xnet@v0.0.0-20240729143630-8497ac4dab2e/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/toqueteos/webbrowser@v1.2.0/LICENSE.md;md5=6072d29ffa4b14338ff8fd68f17f6851;spdx=MIT \
     file://pkg/mod/github.com/u-root/u-root@v0.14.0/LICENSE;md5=bf431bf303eaf01f17bef6624d9f2208;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/u-root/uio@v0.0.0-20240224005618-d2acac8f3701/LICENSE;md5=52bf39fc1e426b6459f5c9a142e5bfbd;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/vishvananda/netns@v0.0.5/LICENSE;md5=2ade771c7d7211af507864e8dd520529;spdx=Apache-2.0 \
     file://pkg/mod/github.com/x448/float16@v0.8.4/LICENSE;md5=de8f8e025d57fe7ee0b67f30d571323b;spdx=MIT \
-    file://pkg/mod/go.yaml.in/yaml/v2@v2.4.2/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
+    file://pkg/mod/go.yaml.in/yaml/v2@v2.4.4/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
     file://pkg/mod/go4.org/mem@v0.0.0-20240501181205-ae6ca9944745/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc;spdx=Apache-2.0 \
     file://pkg/mod/go4.org/netipx@v0.0.0-20231129151722-fdeea329fbba/LICENSE;md5=628df198dc9e033b86b8eedff039ff86;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/crypto@v0.50.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/exp@v0.0.0-20250620022241-b7579e27df2b/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/image@v0.27.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/net@v0.53.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/crypto@v0.54.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/exp@v0.0.0-20260410095643-746e56fc9e2f/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/image@v0.41.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.56.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/golang.org/x/oauth2@v0.36.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sync@v0.20.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sys@v0.43.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/term@v0.42.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/text@v0.36.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/time@v0.12.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.22.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.47.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/term@v0.45.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.40.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/time@v0.15.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/gvisor.dev/gvisor@v0.0.0-20260224225140-573d5e7127a8/LICENSE;md5=e566fe37b81dd469e93876dc021ca01c;spdx=Apache-2.0 \
     file://pkg/mod/k8s.io/client-go@v0.34.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/sigs.k8s.io/yaml@v1.6.0/LICENSE;md5=b5d30dd5bc47d1b56b678ac06dead1c7;spdx=BSD-3-Clause \
diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale_1.98.3.bb b/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/tailscale/tailscale_1.98.3.bb
rename to meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
index a352c5cf58..a8b47a8ed2 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale_1.98.3.bb
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/tailscale/tailscale.git;protocol=https;branch=releas
            file://default \
            file://tailscaled.init \
            "
-SRCREV = "8f2c8d6a14419e95fb9d02d6bf6113893daef5c3"
+SRCREV = "53a0d659afa51835dd7a9283873cca44261454f8"
 SRCREV_SHORT = "${@d.getVar('SRCREV')[:8]}"
 require ${BPN}-go-mods.inc
 
-- 
2.43.0


