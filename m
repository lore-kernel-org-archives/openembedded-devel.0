Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7054FCC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 13:24:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13539.1791984249908432020
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 06:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ulql5I3R;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so28978405e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791984248; x=1792589048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkv1xlAc5w7kxj01EQSrE0NoP730zW/5fHHKc9YZsTM=;
        b=Ulql5I3RaLZkS0PmNl/XVILMDvUb28OPRrDLShqT0BglMEj19diliajd2P6+dUWERi
         IPMcp/TLZUg5GbZd5EBrWejy8UEbZ+fcTIotHZ+VjlEyn62PgIIBYbIp69zhvjzlpHUM
         mQ6/SPDPc0Vq03VFieN6hYdiyZ2Jwkcl87kps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984248; x=1792589048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkv1xlAc5w7kxj01EQSrE0NoP730zW/5fHHKc9YZsTM=;
        b=KlGoNAjlFxftafNvwLiTpoKO3dOspAzevt6rtLun+2G7QlHvm7lnkT/NPAG5BGkiAU
         JUT09LUXBbdlUKJACdv0FRDexVjB42feMIIUFWTIOcrzwVHsP+WcH2qyO/tiVQWelAZC
         /j8EGNoVoL1y9PVhgUTAdbKyJfAcxqmdRAwxKXpQi8G/5nzvu8WxXLUJ3KeYzQgjct6W
         E+dgduABvOepLzTcyrigR3eRjG3i8M1B6G4KRJiYWQhQ55TNsaMlCr6HbtRBKIbO9Xxx
         rH02xH8tcbgWdtqlETgp8OrwQYp3OlnJ/DPnstLyVEkehsa8ndqDu30lQxGUtfAF/WqG
         sACg==
X-Gm-Message-State: AFq9FYINNRxVsBX0SME7OTpzmqUivskt8gDGfFj4ENLCiYsVrEtauC9Q
	yRlH9Kf/Lmuprr+EFku8hdTdsy1Q58DXMK07SqEnkwlOAoSZYYRga8QZ7v4WopnYc4iK77FQpui
	htbyh
X-Gm-Gg: AYBFou2ScMUpRoQd28Y71z1aSdQ0Gvv2BQAvjvAcdPTfETg4COfjMqA5mEPgyn+ECnp
	TLq3XU9mphVswydba9hd+SWYLVh+5F6/CJmoLy5kfsYe8CgIz9F1baz+tlXRdLSB3yuAEnTpl5q
	2IQ5xZBPcc3DTzw++ahIgt7za1Gz2ekYYh2JR9KdCW7Ld2PS+2W4JqRmpcnrWxEawyZ7yotvKWY
	eqPvPjk+j489A1wsrn2vkVU3krXbK8u5fTAZmQOJGhrjKFO2XIzR+rhrSHMkCvLOQFn0oWrhVyT
	2heIp/C6zhxpbFM3T7kVGtnNZ4TMW3QLlxFom8vLlilWG/WYvB+Z0ySP5uNCPd4VgJwcg5cDDzc
	7yOhT38tqHMqMwME0+XYuPwuLY3S2JSLYxdI8hrCA3jIFrXbJQaEG1kmaPT+Fe00sl15FUNp9CN
	DElqpY2SQRaBzRAiJE3/CBY69/8oEUFpccNlOW3kr33vChJ54FhzJZQWxRHj8FufG/jkhryIqTC
	Yju+GfCZGnpBw52OvMfx61T2UjERV4yf/S7bxpg8d5QIRmU0nu8AVaYnva/clAWEePs4hFO/Iu2
	2FC34gcurOupGwU1KFDYCJ8s
X-Received: by 2002:a05:600d:8499:20b0:4a1:9687:bbd9 with SMTP id 5b1f17b1804b1-4a19687be3dmr188396285e9.35.1791984246056;
        Wed, 14 Oct 2026 06:24:06 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2e9791csm47844135e9.1.2026.10.14.06.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:24:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH] tailscale: Upgrade 1.102.4 -> 1.104.1
Date: Wed, 14 Oct 2026 16:24:02 +0300
Message-ID: <20261014132402.2782803-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 13:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130898

Upgrade to release 1.104.1:

- WireGuard packet buffering uses less memory while waiting for
  peer handshakes.
- WireGuard packet queue depth scales with CPU core count, reducing
  peak memory usage under heavy traffic.
- Client-side netmap caching improves start up speed and
  connectivity when the Tailscale control plane is unreachable.
- WireGuard allocates a single packet buffer for batched I/O,
  improving throughput and reducing memory usage.
- An issue that could prevent traffic over IPv6 link-local
  addresses from flowing through direct and Tailscale Peer Relay
  connections is resolved.
- An issue preventing Linux desktop detection from working on
  Wayland environments is resolved.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../tailscale/tailscale-go-mods.inc           | 111 ++++++++--------
 .../tailscale/tailscale-licenses.inc          | 119 +++++++++---------
 ...lscale_1.102.4.bb => tailscale_1.104.1.bb} |   2 +-
 3 files changed, 115 insertions(+), 117 deletions(-)
 rename meta-networking/recipes-connectivity/tailscale/{tailscale_1.102.4.bb => tailscale_1.104.1.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc b/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
index 8ff260b8f3..9d4171dea8 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
@@ -6,95 +6,94 @@
 
 SRC_URI += "\
     gomod://filippo.io/edwards25519;version=v1.2.0;sha256sum=98f2d3ca9b88daa031b0fb2fb521b7ea386af1fed61b6f445a20bef7fa381c17 \
-    gomod://fyne.io/systray;version=v1.11.1-0.20250812065214-4856ac3adc3c;sha256sum=7782bef2e30904a5e34477f713a4c598b1ddf3b3a70deead056549ad22248311 \
+    gomod://fyne.io/systray;version=v1.12.2;sha256sum=514f90db1b78bb0d786ee10ed39f7aab27491b7218ceb56d11feb30efd8bcb25 \
     gomod://github.com/Kodeworks/golang-image-ico;version=v0.0.0-20141118225523-73f0f4cfade9;sha256sum=1d677069e35c4a3e4f290e68c6e2391f6237aee9ce3f39448ed09a2ddab274b0 \
     gomod://github.com/anmitsu/go-shlex;version=v0.0.0-20200514113438-38f4b401e2be;sha256sum=2a5cf7c9a2709f649fd508cbacb2be96e4fba4d534a28a122ee4d7574af40b5e \
     gomod://github.com/atotto/clipboard;version=v0.1.4;sha256sum=d67b2c36c662751309fd2ec351df3651584bea840bd27be9a90702c3a238b43f \
-    gomod://github.com/aws/aws-sdk-go-v2;version=v1.42.1;sha256sum=c3e31605929531eedf5273151c0beb410b58f389d38c3357c62908a674827f9d \
-    gomod://github.com/aws/aws-sdk-go-v2/config;version=v1.32.17;sha256sum=a72a31ed8fce33b473dd0b684be8d709e64f6ef17981492541dd910403307004 \
-    gomod://github.com/aws/aws-sdk-go-v2/credentials;version=v1.19.16;sha256sum=f4efe61167ef97d6c3cb5c9de373daa36aeae2a9be1668d8ffffc3d878e89a7f \
-    gomod://github.com/aws/aws-sdk-go-v2/feature/ec2/imds;version=v1.18.23;sha256sum=090b0395757b407c89e80296beeecc24264b0ff7fe3337249eca3a3f056688fe \
-    gomod://github.com/aws/aws-sdk-go-v2/internal/configsources;version=v1.4.30;sha256sum=e91f072c53b8258204d771b9ac674a292333c3e0b232ea1d7200177c8934ebd6 \
-    gomod://github.com/aws/aws-sdk-go-v2/internal/endpoints/v2;version=v2.7.30;sha256sum=638789184c9b7ae2238d68951bb3188d225b50e93bbbe92168498192030e7b60 \
-    gomod://github.com/aws/aws-sdk-go-v2/internal/v4a;version=v1.4.24;sha256sum=c7e35c4145c5d71ed4dbc45b599dee9304e9cfceb76970d65225fb4fe9771872 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding;version=v1.13.13;sha256sum=96c2fd96a30e0ebb9388fc5ce08ae115031ca9599e982e4cd441717e95966982 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/internal/presigned-url;version=v1.13.30;sha256sum=893e5235ddc783537abd8d55d6c9b40b50b75c2fcda8be2b30e1d37cf19e7c70 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/signin;version=v1.0.11;sha256sum=6faac46de482e397f6d0c401078046b8d84bd11213f3a76e1536f058acd12056 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/ssm;version=v1.45.0;sha256sum=b488ee2053e3d245ac292df62fb399ef0e3dd6df191944bfc5434f65489fd88f \
-    gomod://github.com/aws/aws-sdk-go-v2/service/sso;version=v1.30.17;sha256sum=09feabc247e03dec70f9fb8c2d1c49901d6dc6b2a064e5c4a79cf4dcdd403a1a \
-    gomod://github.com/aws/aws-sdk-go-v2/service/ssooidc;version=v1.35.21;sha256sum=404f734866931f34bbdf3dd5b66a8807a500a7bb1073ea0bb8ff7063cd724d90 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/sts;version=v1.42.1;sha256sum=b3c95e049548d1116a0ccf034c0a0354cd30ef280223541e2cd8dd90c2e2cb11 \
-    gomod://github.com/aws/smithy-go;version=v1.27.3;sha256sum=0db2c11f209d7a24589378abb0ebc73cad0d6102a4589e3095bc6fa4a368b52a \
+    gomod://github.com/aws/aws-sdk-go-v2;version=v1.46.0;sha256sum=196e0d53090e2d5375901e58c151b2d0aca52cdd43becc2f6224aa932476f58b \
+    gomod://github.com/aws/aws-sdk-go-v2/config;version=v1.33.3;sha256sum=04619364e5daa23a62f99e730c3b8394560f73b13e284186f5b918e42a81530e \
+    gomod://github.com/aws/aws-sdk-go-v2/credentials;version=v1.20.3;sha256sum=dea9584904cd82c4233afaf8611b77bfd2c01289b219661dc7c80edae819e88f \
+    gomod://github.com/aws/aws-sdk-go-v2/feature/ec2/imds;version=v1.19.2;sha256sum=ff69b34a4828475a7d18e2ec2feae38487e38bafbf8b498ea894697c00ab69ef \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/configsources;version=v1.5.2;sha256sum=89f5d39c363f1f53dac74f562c9fd727512a0aafbf22bef900baa2de535a016c \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/endpoints/v2;version=v2.8.2;sha256sum=01b9206a7b2fab51f1dd3707ebd08ead033203acabf749804cf399370f970448 \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/v4a;version=v1.5.2;sha256sum=e6070c132039d6d40520d42c20f5d1261c054b99d386f375556ca431cb56c25e \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding;version=v1.13.19;sha256sum=cd55f71c785b8d9b08ae8eeb8d9803e38a4c6f4905c1cf9ff54a30f1cd5c858d \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/presigned-url;version=v1.14.2;sha256sum=d00c6aa55dbbb594a073cca3c8d8f442fdb0bf18d010786e37e8b41f46b91bb9 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/signin;version=v1.9.0;sha256sum=28df729f62d69fd95dd5b8b75c044ecbbe5bdd4cc05c44c887628359d0748748 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/ssm;version=v1.77.0;sha256sum=be419a89e90168db9ecf43041262f3b1c7f71cf1ad7b3b4dadf21f9adbeb9cb2 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/sso;version=v1.37.0;sha256sum=fa0cec332e1e1e56d49d79c6349dacc50f087efa5a816c1a2c8066cc50cb809e \
+    gomod://github.com/aws/aws-sdk-go-v2/service/ssooidc;version=v1.42.0;sha256sum=ed99480cab05672533bce9fa7a6a012b8f8aeff1fccb81aa3ed15b5bb24ef2cf \
+    gomod://github.com/aws/aws-sdk-go-v2/service/sts;version=v1.49.0;sha256sum=3ab1da2bcf592d255af4ed1e0414c7fea2158791f2cb48e1725d02c24054afbc \
+    gomod://github.com/aws/smithy-go;version=v1.28.1;sha256sum=88b0cddd5c35c76652b846b3a8ad2cbe52db0738af592e791976f1ac590750de \
     gomod://github.com/bradfitz/monogok;version=v0.0.0-20260630033929-b1eef977b41f;sha256sum=9b4a0f3eaf060d99c7409ddc8289b804119d5e75cb365ee21714f766581ac83f \
-    gomod://github.com/coder/websocket;version=v1.8.14;sha256sum=b729277821461eb21a816c16e29a02029dd6abbb1a43b526c1e0a6b794942de0 \
-    gomod://github.com/coreos/go-iptables;version=v0.7.1-0.20240112124308-65c67c9f46e6;sha256sum=6d0ae6344f1d355f72e6aaba583ce73822861511337ca92cc1c4727fc8ba66dd \
-    gomod://github.com/creachadair/msync;version=v0.8.1;sha256sum=f4cd6b7d1cc968c65106f7affa5f836379339ba21677a6b2204f3837f4c47723 \
+    gomod://github.com/coder/websocket;version=v1.8.15;sha256sum=4f1d890bc5131f335737bbb6241e3958758c8774b3e6d1c905f713f604af6209 \
+    gomod://github.com/coreos/go-iptables;version=v0.8.0;sha256sum=48d679f4287e901385f1707d83e8e766089feee5ec36d0810b23d3b7ddeec4d1 \
+    gomod://github.com/creachadair/msync;version=v0.10.1;sha256sum=c76cc2c7d9a4b3e1c4add97584291961e438d8ae4d238cb09ffd59fd6664f16f \
     gomod://github.com/creack/pty;version=v1.1.24;sha256sum=754e25253e76a5583b80d57d3add3afe68fc4d9f2a490968a9d1eda8c8fd8815 \
     gomod://github.com/digitalocean/go-smbios;version=v0.0.0-20180907143718-390a4f403a8e;sha256sum=2bc498a09aa55b3417bebacce448b2d2ab757981e59b6b016d08cf97e4a7bdde \
-    gomod://github.com/diskfs/go-diskfs;version=v1.9.3;sha256sum=e564a1454b9607167a7d496946e4a3b06eb60bbe09ec31a22d29e668e0e0e68f \
+    gomod://github.com/diskfs/go-diskfs;version=v1.9.4;sha256sum=4f8acbe8da9b3fb057bcaff97ea2e2906a4c5e588d5c112420be6ced0b106934 \
     gomod://github.com/djherbis/times;version=v1.6.0;sha256sum=21d69060967bc03ea3c39ff8c0b1a95511e96eccd3749a2daef1a02af1bc0a85 \
     gomod://github.com/fogleman/gg;version=v1.3.0;sha256sum=792f7a3ea9eea31b7947dabaf9d5a307389245069078e4bf435d76cb0505439c \
-    gomod://github.com/fxamacker/cbor/v2;version=v2.9.0;sha256sum=5b0ec6424bd522aeeeab30cbdcad6f40bf976a9a2ddf125ab27b97826140d97a \
-    gomod://github.com/gaissmai/bart;version=v0.26.1;sha256sum=7cead7fb3f4be36f3864efaf1344d72ca7ba03ab5a557338c80ca6d4bda59cca \
-    gomod://github.com/go-json-experiment/json;version=v0.0.0-20260214004413-d219187c3433;sha256sum=4cd402f765c9dca0c492942b0c98da26a922905372e0bbb0364fcad3bcba0965 \
+    gomod://github.com/fxamacker/cbor/v2;version=v2.9.3;sha256sum=5018305ed869d01bf4be9c581c53d3658854755c7bf9a775800bef41c0e4de45 \
+    gomod://github.com/gaissmai/bart;version=v0.29.0;sha256sum=af908402860b3b01a8c2d13a679630e308de12eca50070c61f0fd5d5b2037069 \
+    gomod://github.com/go-json-experiment/json;version=v0.0.0-20260820222146-c27c302e5fc3;sha256sum=7cde0df93446eb825784b1af82c0af1fe0306008abf343342b9857df4250698e \
     gomod://github.com/godbus/dbus/v5;version=v5.2.2;sha256sum=5c6f37c725a481fb0f1e7866ae273429525d8cc6a6cace87da28e53370f5596a \
     gomod://github.com/golang/freetype;version=v0.0.0-20170609003504-e2365dfdc4a0;sha256sum=cdcb9e6a14933dcbf167b44dcd5083fc6a2e52c4fae8fb79747c691efeb7d84e \
     gomod://github.com/golang/groupcache;version=v0.0.0-20241129210726-2c02b8208cf8;sha256sum=163367355442a630b12b0b452892cd98e99fcfdf7e40b68d358be73479cc1c23 \
     gomod://github.com/google/btree;version=v1.1.3;sha256sum=11b736bc8252b52fecdf346d3707ccf3a2b6d458ba21b4f843616fc12eeb30b2 \
-    gomod://github.com/google/go-tpm;version=v0.9.4;sha256sum=a8a5e504fbd78284a50e6ab625f6248cfbb89421fafdfee71d66abc6e1dfc192 \
-    gomod://github.com/google/nftables;version=v0.2.1-0.20240414091927-5e242ec57806;sha256sum=ceb96b39a6f9004d8c217a6ae61b91a69c250bc30fbf3a04cd87cbbfddea73c8 \
+    gomod://github.com/google/go-tpm;version=v0.9.8;sha256sum=3b26b46c32cfc9adfc6859da0ce1aef87170fd26f1e87d1d4c4c3cfc2a7cab49 \
+    gomod://github.com/google/nftables;version=v0.3.0;sha256sum=70c243170b087a106d2635674d012d12eafa93c3972a1c96f61460693faf418f \
     gomod://github.com/google/uuid;version=v1.6.0;sha256sum=d0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed \
     gomod://github.com/hdevalence/ed25519consensus;version=v0.2.0;sha256sum=111cafade3ba9c7c3adf66b6a424386e30829c46c60b80dabe288e1837d30e33 \
     gomod://github.com/huin/goupnp;version=v1.3.0;sha256sum=df663b90b9b3bf16e1cfa810a6c3dd904993e8c1155dbf65566ce0361f163dce \
     gomod://github.com/illarion/gonotify/v3;version=v3.0.2;sha256sum=fef3e17f676c8ce98b60f0e2180fc4e3331e6e1604eaf96ab8791e073f96a7af \
-    gomod://github.com/insomniacslk/dhcp;version=v0.0.0-20240129002554-15c9b8791914;sha256sum=539bdec94134fed4383e1ed8d1260b9239b9cac5508718915fb354d19ec69ff2 \
-    gomod://github.com/jellydator/ttlcache/v3;version=v3.1.0;sha256sum=278dfc9b4882eaeb9b56e925b574028f3e9cc4436645b93f56ccb69de134a898 \
-    gomod://github.com/jmespath/go-jmespath;version=v0.4.0;sha256sum=d1f77b6790d7c4321a74260f3675683d3ac06b0a614b5f83e870beae0a8b2867 \
-    gomod://github.com/jsimonetti/rtnetlink;version=v1.4.1;sha256sum=b27130e80a69c0fab7e071bc90dd30288628ae7e1003dff727e5d49f3d99087d \
+    gomod://github.com/insomniacslk/dhcp;version=v0.0.0-20260901064844-234b97448fae;sha256sum=cc63d107eb34d02164738b6cc9276f2b13baeca0fa879533aec67615ef0cc9e5 \
+    gomod://github.com/jellydator/ttlcache/v3;version=v3.4.1;sha256sum=486223b9991aa002512e87b68f2db74fad86aff9002bf2ee04b19f19446ce31b \
+    gomod://github.com/jsimonetti/rtnetlink;version=v1.4.2;sha256sum=08662e20c1a178734d79053305748f108c49f07fb8eae1a60b034165d21bd709 \
     gomod://github.com/kballard/go-shellquote;version=v0.0.0-20180428030007-95032a82bc51;sha256sum=ae4cb7b097dc4eb0c248dff00ed3bbf0f36984c4162ad1d615266084e58bd6cc \
-    gomod://github.com/klauspost/compress;version=v1.19.1;sha256sum=a77e019f60dff8bdf00ad137985c808957cc657381daa4281824843bc6b46910 \
+    gomod://github.com/klauspost/compress;version=v1.20.0;sha256sum=a04654d049a3caf33bcb60ee45efd8ccecabb93eb8be88045ed0003b0ecb5773 \
     gomod://github.com/kortschak/wol;version=v0.0.0-20200729010619-da482cc4850a;sha256sum=09c15500a0ef54af0796f37282dd5377d2b866e4c36c87dcb6b2894cf3114dc5 \
     gomod://github.com/kr/fs;version=v0.1.0;sha256sum=d376bd98e81aea34585fc3b04bab76363e9e87cde69383964e57e9779f2af81e \
     gomod://github.com/mattn/go-colorable;version=v0.1.15;sha256sum=221144f51cc5eeda0a72bd7b5832181b94240c1d760bde0b3428895e63e63339 \
-    gomod://github.com/mattn/go-isatty;version=v0.0.23;sha256sum=670cdaa44183b9b7aac0078b1a4cba34a74a0a85e2b92d2434a6b2ccf3387fa6 \
-    gomod://github.com/mdlayher/genetlink;version=v1.3.2;sha256sum=0924e7da370fdb2e7bea20fdde519ae37377db35500cd0aaf09769eddb314e19 \
-    gomod://github.com/mdlayher/netlink;version=v1.7.3-0.20250113171957-fbb4dce95f42;sha256sum=b427c8c746e87c2f8033678fb87cdcf5cefb21ce16f35930eff91683661395f0 \
+    gomod://github.com/mattn/go-isatty;version=v0.0.24;sha256sum=4fcffec0bae0ad4af7bf96e2497a817d85de64af19ffe31d82bda362148234b8 \
+    gomod://github.com/mdlayher/genetlink;version=v1.4.0;sha256sum=c32799091f6a4d58aa24458acd398997087f3c9cc0cfe47f5f24705a1d4122ff \
+    gomod://github.com/mdlayher/netlink;version=v1.11.2;sha256sum=2fbb8a5962c22dfdeaecd18bc2a1215e863bfcfa2ba1a28a3703ce0ae014ba4a \
     gomod://github.com/mdlayher/sdnotify;version=v1.0.0;sha256sum=26f4efbcba73eaec323973c8ae335bad430e5d6947097976cfbe7c9547f68c90 \
-    gomod://github.com/mdlayher/socket;version=v0.5.0;sha256sum=931626341956178fe6015b128fdda22283480d05dc964675307eb61ed39c29fe \
+    gomod://github.com/mdlayher/socket;version=v0.7.0;sha256sum=1b84bcd3073dc5b9d3d44c4330e62b7e1879c647d2a85f94ae0ab41be667ebc7 \
     gomod://github.com/mitchellh/go-ps;version=v1.0.0;sha256sum=f2f0400b1d5e136419daed275c27a930b0f5447ac12bb8acd3ddbe39547b2834 \
     gomod://github.com/peterbourgon/ff/v3;version=v3.4.0;sha256sum=b49537268ce67eb755d773fdd2a3e1c9c6dec0731993a4f742080416eb9b12a6 \
     gomod://github.com/pierrec/lz4/v4;version=v4.1.26;sha256sum=cf67f99d8d4ed84775a51de3167b70907e5436dd2f501f37deffac46c0a51ae1 \
-    gomod://github.com/pires/go-proxyproto;version=v0.8.1;sha256sum=a979a2f26160bfcb6f3829dd546d5f53c8b1879e7ad84466e359cf3f6237aa4c \
-    gomod://github.com/pkg/sftp;version=v1.13.6;sha256sum=0cdf6bd0edef9db8137ce398c9bbe514713e42cf2d4d415b5025f4a3c33f249d \
-    gomod://github.com/safchain/ethtool;version=v0.3.0;sha256sum=bfa1a3fe314a3f2ac4c4385a6c4694708e4881bfd86c34668eca92656e398590 \
+    gomod://github.com/pires/go-proxyproto;version=v0.15.0;sha256sum=2237420b2bf86755a4ef462d7b9eff2d66f87756dc8d247bb7a47e0c8702094a \
+    gomod://github.com/pkg/sftp;version=v1.13.11;sha256sum=f22fb06ecb083adb09981b0a4554fa370f2cb5accc4837cdd038312008a384b5 \
+    gomod://github.com/safchain/ethtool;version=v0.7.0;sha256sum=7a285eefd304a1b429db0c40e3a33308811e2e0a640b747703537ab94b34b0da \
     gomod://github.com/skip2/go-qrcode;version=v0.0.0-20200617195104-da1b6568686e;sha256sum=3fc1c4d11c79001d1cc2df0de87493b324b9af141cc59ae8c212612dd2c90e90 \
     gomod://github.com/tailscale/gliderssh;version=v0.3.4-0.20260716005906-1a0f895faf28;sha256sum=7f1a31c7982476845ba2fddc693ce8755ddf573be83f95e4136ecde59fdb6de8 \
-    gomod://github.com/tailscale/hujson;version=v0.0.0-20260302212456-ecc657c15afd;sha256sum=9f9c320dd90c86880b26107b931d6c056e99642d4c4e50fafcdf7de8ea0989e6 \
+    gomod://github.com/tailscale/hujson;version=v0.0.0-20260727124030-b80ff77dac4f;sha256sum=844d7b9f2ab7cd7a7c9b0b0bbf933feae2ef43a5fb9507884fe08cef059dee3d \
     gomod://github.com/tailscale/netlink;version=v1.1.1-0.20240822203006-4d49adab4de7;sha256sum=a5195ef600f8d9a0fb8501eea85e4fe0321a74bd57dec88f07b8569d0ee4f55e \
     gomod://github.com/tailscale/peercred;version=v0.0.0-20250107143737-35a0c7bd7edc;sha256sum=87d0f4f3b1d59ea45c9a87b775b615bebd721a5870dafedc63cc860ec4aac281 \
-    gomod://github.com/tailscale/web-client-prebuilt;version=v0.0.0-20250124233751-d4cd19a26976;sha256sum=1d02f0804bb41e0743b7d889b8e2dbd8466a89793f03997f4c1fd10f9e8974c3 \
-    gomod://github.com/tailscale/wireguard-go;version=v0.0.0-20260715223240-2e01ba5b00f0;sha256sum=cbd2f6f9b0f809c5f0f73032f25a69839f4d12c4f451819c952de92c53e1ed02 \
+    gomod://github.com/tailscale/web-client-prebuilt;version=v0.0.0-20260917222731-e0ed2d0d0fea;sha256sum=766636fd08bfa785d34d10956dda8a9717188e5e43fe2bef9d54abce7c559438 \
+    gomod://github.com/tailscale/wireguard-go;version=v0.0.0-20260928213032-417aef361226;sha256sum=605f0926477b953bb6a0ee13d7baad9a3b3eab5bb17ae26bfff245df80fe19b6 \
     gomod://github.com/tailscale/xnet;version=v0.0.0-20240729143630-8497ac4dab2e;sha256sum=438abf28ce5fb03adf529c2cb57a451f9b243c4a2a181d9d06cdb61bb10960e7 \
-    gomod://github.com/toqueteos/webbrowser;version=v1.2.0;sha256sum=1227d3ebeab16d8232a304a10b087984a96ad30f7439b6687bab2f5747d308cf \
-    gomod://github.com/u-root/u-root;version=v0.14.0;sha256sum=a65c0a06236b10a0cea50e603fef0ced0c7e343a66ef957a45ebcd51f304d286 \
+    gomod://github.com/toqueteos/webbrowser;version=v1.2.1;sha256sum=b14b0082ec423852240b83a55e45d560da1ea945cd04bbf00481afd2f4647966 \
+    gomod://github.com/u-root/u-root;version=v0.16.0;sha256sum=3c84d85161f9950da2cb1023d1044de58ae8e4cebfb832eba2c1e56ec29963d8 \
     gomod://github.com/u-root/uio;version=v0.0.0-20240224005618-d2acac8f3701;sha256sum=f6e8f912e968744999d508c3df54f0308aaf337052a8d0bd3edd72583adfd9cd \
     gomod://github.com/vishvananda/netns;version=v0.0.5;sha256sum=07804b88c922c2a6780efe392ffef9d126eac584384eb3eb17bcadd34cfa9422 \
     gomod://github.com/x448/float16;version=v0.8.4;sha256sum=73b24a41037ea999ab66851e3798a0973dbb1f214925915b01f0820f7b2f1500 \
     gomod://go.yaml.in/yaml/v2;version=v2.4.4;sha256sum=1b98a6a498cf255c5f2982d32c74633bc7969770957e98103ac1e14345aa4576 \
     gomod://go4.org/mem;version=v0.0.0-20240501181205-ae6ca9944745;sha256sum=9b5037a57122457fdc5c2c0a31e3996b44cf9dfcdee5c53ed72adfd88d077795 \
-    gomod://go4.org/netipx;version=v0.0.0-20231129151722-fdeea329fbba;sha256sum=e15f57de368c92b826010181906f26112ba3a0d7fde7d94c8a8c60c525dc4044 \
-    gomod://golang.org/x/crypto;version=v0.54.0;sha256sum=ecf4030c1c6b55b897826b95f01d7416cf2785b4675b0f9ac218ddf754a03abb \
-    gomod://golang.org/x/exp;version=v0.0.0-20260410095643-746e56fc9e2f;sha256sum=de285d08489fcd4d420a8561501e75b5124db0a48121dfc26e811959f518db4e \
-    gomod://golang.org/x/image;version=v0.41.0;sha256sum=dfa6f0db97442ba5f22a385e8f226334f79373cd59d2e3b91f8cdaa1d122d2be \
-    gomod://golang.org/x/net;version=v0.56.0;sha256sum=bbc975b3ec9cd86892cfc515badc125657e135c00162d0da5de33f6d07930464 \
-    gomod://golang.org/x/oauth2;version=v0.36.0;sha256sum=15bf65ff103e5dafc809d78cd037a1d1e88ccb8451824e851156002a13304504 \
-    gomod://golang.org/x/sync;version=v0.22.0;sha256sum=4bc67d258ce7867cfc1a43765c43d98b4c49b90c46dd0b86f896a5a4909fade0 \
-    gomod://golang.org/x/sys;version=v0.47.0;sha256sum=cdac013ddced0262926ec29ffcda645da39670e61c7e5b761e572b6b1809bb1b \
-    gomod://golang.org/x/term;version=v0.45.0;sha256sum=b3a3af689728b43012ae1b21482571a35c033c545e98e021606bd4fcf1f79108 \
-    gomod://golang.org/x/text;version=v0.40.0;sha256sum=07757384728d0f52dd85c1f3f163405e6396b2b0fb7eb7d6b610f2a711d69ee3 \
-    gomod://golang.org/x/time;version=v0.15.0;sha256sum=8cfb20e915fa5d6c3fd264304233f8d71a3385e48a37819239c532ad9da27f84 \
-    gomod://gvisor.dev/gvisor;version=v0.0.0-20260224225140-573d5e7127a8;sha256sum=2335e73d1effb8e5601be32b322e5d39bf1efc1eef2d296a8e054bd37a72b47f \
-    gomod://k8s.io/client-go;version=v0.34.0;sha256sum=3ede34d9df9dcb02779a631ca9c653f92db3714ee887c6fdd86a66bc4889d2c0 \
+    gomod://go4.org/netipx;version=v0.0.0-20260823151212-3075585bcbeb;sha256sum=6d0c289f57693a2a5b7a64b4a7f79f0954ce8f7d451528fe602ea594fbcdffff \
+    gomod://golang.org/x/crypto;version=v0.57.0;sha256sum=856c916b92f1fc5b53983c04f6249f632f56c47ebc003bbcdfc503500dfb58b8 \
+    gomod://golang.org/x/exp;version=v0.0.0-20260908205506-85c1c2202aba;sha256sum=47318373d2349a65c11daee4239024de4170ced40d9c23add5523c78b5a13c07 \
+    gomod://golang.org/x/image;version=v0.46.0;sha256sum=10459a17c3533cc9ca4d1ac7a86674bf0c0514b7bac721531b3c1178cfcda82e \
+    gomod://golang.org/x/net;version=v0.59.0;sha256sum=1dc3bf31fcebe80d393288ac8fe5cac7f0e82e9b3a2630021dcdf5ffbfa3f601 \
+    gomod://golang.org/x/oauth2;version=v0.37.0;sha256sum=82b0472ff31d57867bfb95e28c2906acd54764949a215b6a01bda40f4ae4c3bd \
+    gomod://golang.org/x/sync;version=v0.23.0;sha256sum=c19a11baba5c1a093cb4fd2f6d0d8d79673c97a82cb0fe2d693c9b6ad84f0f82 \
+    gomod://golang.org/x/sys;version=v0.48.0;sha256sum=3a47e06431ba1e24d5b2aca3a7ce31fd13faff34df3e5d8e63f105ff9d0c1786 \
+    gomod://golang.org/x/term;version=v0.46.0;sha256sum=9147fdd982f1aed1392183d5b48055f4f74c85d496604766c7f0b1d3bbd61c7c \
+    gomod://golang.org/x/text;version=v0.42.0;sha256sum=a7b64e003056b6470303f408202098d8f3714a115f23091b8cac85edeb265476 \
+    gomod://golang.org/x/time;version=v0.16.0;sha256sum=ac27777be8088859ba3b1bea3648064dc95ff8bac3023b1b059d1ab126dc729e \
+    gomod://gvisor.dev/gvisor;version=v0.0.0-20260915211658-a6f909f08a72;sha256sum=d527abbf3e55053348550a7f0df46cd57e99b43f39355bb84aee208ed360094f \
+    gomod://k8s.io/client-go;version=v0.37.0;sha256sum=e48557de0d71c7fe7365be5f325d033945df0bc55969a30be83a5f7e131835c4 \
     gomod://sigs.k8s.io/yaml;version=v1.6.0;sha256sum=cf88648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e11e5052 \
-    gomod://software.sslmate.com/src/go-pkcs12;version=v0.4.0;sha256sum=55019a391e5302a51ba62e98909e006224b81207866da90beaf582ec0dee036f \
+    gomod://software.sslmate.com/src/go-pkcs12;version=v0.7.3;sha256sum=93040afe04fce5b2da396bfbf5505cc6f463365f8c9301c0446021b11aa8ef86 \
 "
diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc b/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
index 573fc422b4..074229f7dd 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
@@ -8,99 +8,98 @@ LICENSE += "AND Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND ISC AND MIT"
 
 LIC_FILES_CHKSUM += "\
     file://pkg/mod/filippo.io/edwards25519@v1.2.0/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
-    file://pkg/mod/fyne.io/systray@v1.11.1-0.20250812065214-4856ac3adc3c/LICENSE;md5=a2be13cb34e811436f5388f0a19cc0b0;spdx=Apache-2.0 \
+    file://pkg/mod/fyne.io/systray@v1.12.2/LICENSE;md5=a2be13cb34e811436f5388f0a19cc0b0;spdx=Apache-2.0 \
     file://pkg/mod/github.com/!kodeworks/golang-image-ico@v0.0.0-20141118225523-73f0f4cfade9/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/anmitsu/go-shlex@v0.0.0-20200514113438-38f4b401e2be/LICENSE;md5=45a47c50f5b33ff9ab3347c7db1bfb6a;spdx=MIT \
     file://pkg/mod/github.com/atotto/clipboard@v0.1.4/LICENSE;md5=489200b65f13bcbcb890a96b99a58a6f;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/config@v1.32.17/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/credentials@v1.19.16/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/feature/ec2/imds@v1.18.23/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/configsources@v1.4.30/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2@v2.7.30/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/v4a@v1.4.24/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding@v1.13.13/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/presigned-url@v1.13.30/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/signin@v1.0.11/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssm@v1.45.0/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sso@v1.30.17/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssooidc@v1.35.21/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sts@v1.42.1/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.42.1/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.42.1/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/aws/smithy-go@v1.27.3/LICENSE;md5=34400b68072d710fecd0a2940a0d1658;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/smithy-go@v1.27.3/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/config@v1.33.3/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/credentials@v1.20.3/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/feature/ec2/imds@v1.19.2/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/configsources@v1.5.2/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2@v2.8.2/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/v4a@v1.5.2/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding@v1.13.19/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/presigned-url@v1.14.2/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/signin@v1.9.0/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssm@v1.77.0/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sso@v1.37.0/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssooidc@v1.42.0/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sts@v1.49.0/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.46.0/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.46.0/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/aws/smithy-go@v1.28.1/LICENSE;md5=34400b68072d710fecd0a2940a0d1658;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/smithy-go@v1.28.1/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/bradfitz/monogok@v0.0.0-20260630033929-b1eef977b41f/LICENSE;md5=32c87c5071c476dfcb4de7a5890010f3;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/coder/websocket@v1.8.14/LICENSE.txt;md5=6be4dff96499e563e8b776f92bf18876;spdx=ISC \
-    file://pkg/mod/github.com/coreos/go-iptables@v0.7.1-0.20240112124308-65c67c9f46e6/LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/creachadair/msync@v0.8.1/LICENSE;md5=b8be277519c5ee121454d43de171668a;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/coder/websocket@v1.8.15/LICENSE.txt;md5=6be4dff96499e563e8b776f92bf18876;spdx=ISC \
+    file://pkg/mod/github.com/coreos/go-iptables@v0.8.0/LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/creachadair/msync@v0.10.1/LICENSE;md5=b8be277519c5ee121454d43de171668a;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/creack/pty@v1.1.24/LICENSE;md5=93958070863d769117fa33b129020050;spdx=MIT \
     file://pkg/mod/github.com/digitalocean/go-smbios@v0.0.0-20180907143718-390a4f403a8e/LICENSE.md;md5=c1653934903ab2785c09c2bdd7344526;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/diskfs/go-diskfs@v1.9.3/LICENSE;md5=a346cc99f8bdb4f2cb18021ef39dedba;spdx=MIT \
+    file://pkg/mod/github.com/diskfs/go-diskfs@v1.9.4/LICENSE;md5=a346cc99f8bdb4f2cb18021ef39dedba;spdx=MIT \
     file://pkg/mod/github.com/djherbis/times@v1.6.0/LICENSE;md5=3cafd141825e7a44b1c6a047b2320012;spdx=MIT \
     file://pkg/mod/github.com/fogleman/gg@v1.3.0/LICENSE.md;md5=1630f0e1bac38694fdc4dcb6a9218f4a;spdx=MIT \
-    file://pkg/mod/github.com/fxamacker/cbor/v2@v2.9.0/LICENSE;md5=827f5a2fa861382d35a3943adf9ebb86;spdx=MIT \
-    file://pkg/mod/github.com/gaissmai/bart@v0.26.1/LICENSE;md5=05779e437ec35570aca43cc66a95e056;spdx=MIT \
-    file://pkg/mod/github.com/go-json-experiment/json@v0.0.0-20260214004413-d219187c3433/LICENSE;md5=9d210c7471ce08e3db5261f33bf8fce6;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/fxamacker/cbor/v2@v2.9.3/LICENSE;md5=827f5a2fa861382d35a3943adf9ebb86;spdx=MIT \
+    file://pkg/mod/github.com/gaissmai/bart@v0.29.0/LICENSE;md5=3ac7cf185eda122b4c06d16ee9577a98;spdx=MIT \
+    file://pkg/mod/github.com/go-json-experiment/json@v0.0.0-20260820222146-c27c302e5fc3/LICENSE;md5=9d210c7471ce08e3db5261f33bf8fce6;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/godbus/dbus/v5@v5.2.2/LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/golang/freetype@v0.0.0-20170609003504-e2365dfdc4a0/LICENSE;md5=8e050e4860234723098ceeefa49edd05;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/golang/groupcache@v0.0.0-20241129210726-2c02b8208cf8/LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5;spdx=Apache-2.0 \
     file://pkg/mod/github.com/google/btree@v1.1.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/google/go-tpm@v0.9.4/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/google/nftables@v0.2.1-0.20240414091927-5e242ec57806/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/google/go-tpm@v0.9.8/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/google/nftables@v0.3.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/github.com/google/uuid@v1.6.0/LICENSE;md5=88073b6dd8ec00fe09da59e0b6dfded1;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/hdevalence/ed25519consensus@v0.2.0/LICENSE;md5=4041895a1f717acb5be52e24edb19917;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/huin/goupnp@v1.3.0/LICENSE;md5=3d7eee8afacfccb446c1ac30289c965d;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/illarion/gonotify/v3@v3.0.2/LICENSE;md5=6b631a3123c7c679195702a8a35c9f21;spdx=MIT \
-    file://pkg/mod/github.com/insomniacslk/dhcp@v0.0.0-20240129002554-15c9b8791914/LICENSE;md5=ceaf33b8b657b2d342dbd3bb59578d8a;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/jellydator/ttlcache/v3@v3.1.0/LICENSE;md5=4cea77626c625d583c98a85a8658f9d2;spdx=MIT \
-    file://pkg/mod/github.com/jmespath/go-jmespath@v0.4.0/LICENSE;md5=9abfa8353fce3f2cb28364e1e9016852;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/jsimonetti/rtnetlink@v1.4.1/LICENSE.md;md5=75a8090d4c02945ad9d61c7cce77ed48;spdx=MIT \
+    file://pkg/mod/github.com/insomniacslk/dhcp@v0.0.0-20260901064844-234b97448fae/LICENSE;md5=ceaf33b8b657b2d342dbd3bb59578d8a;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/jellydator/ttlcache/v3@v3.4.1/LICENSE;md5=4cea77626c625d583c98a85a8658f9d2;spdx=MIT \
+    file://pkg/mod/github.com/jsimonetti/rtnetlink@v1.4.2/LICENSE.md;md5=75a8090d4c02945ad9d61c7cce77ed48;spdx=MIT \
     file://pkg/mod/github.com/kballard/go-shellquote@v0.0.0-20180428030007-95032a82bc51/LICENSE;md5=9d95d1ad917c814c23909addb8692eeb;spdx=MIT \
-    file://pkg/mod/github.com/klauspost/compress@v1.19.1/LICENSE;md5=d0fd9ebda39468b51ff4539c9fbb13a8;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/klauspost/compress@v1.19.1/internal/snapref/LICENSE;md5=b8b79c7d4cda128290b98c6a21f9aac6;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/klauspost/compress@v1.19.1/zstd/internal/xxhash/LICENSE.txt;md5=802da049c92a99b4387d3f3d91b00fa9;spdx=MIT \
+    file://pkg/mod/github.com/klauspost/compress@v1.20.0/LICENSE;md5=d0fd9ebda39468b51ff4539c9fbb13a8;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.20.0/internal/snapref/LICENSE;md5=b8b79c7d4cda128290b98c6a21f9aac6;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.20.0/zstd/internal/xxhash/LICENSE.txt;md5=802da049c92a99b4387d3f3d91b00fa9;spdx=MIT \
     file://pkg/mod/github.com/kortschak/wol@v0.0.0-20200729010619-da482cc4850a/LICENSE;md5=5a0acdb344844a21e2df8bc2e1fe5f2d;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/kr/fs@v0.1.0/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/mattn/go-colorable@v0.1.15/LICENSE;md5=24ce168f90aec2456a73de1839037245;spdx=MIT \
-    file://pkg/mod/github.com/mattn/go-isatty@v0.0.23/LICENSE;md5=f509beadd5a11227c27b5d2ad6c9f2c6;spdx=MIT \
-    file://pkg/mod/github.com/mdlayher/genetlink@v1.3.2/LICENSE.md;md5=e08504321a9b3e86ee07433c231b33f1;spdx=MIT \
-    file://pkg/mod/github.com/mdlayher/netlink@v1.7.3-0.20250113171957-fbb4dce95f42/LICENSE.md;md5=e08504321a9b3e86ee07433c231b33f1;spdx=MIT \
+    file://pkg/mod/github.com/mattn/go-isatty@v0.0.24/LICENSE;md5=f509beadd5a11227c27b5d2ad6c9f2c6;spdx=MIT \
+    file://pkg/mod/github.com/mdlayher/genetlink@v1.4.0/LICENSE.md;md5=e08504321a9b3e86ee07433c231b33f1;spdx=MIT \
+    file://pkg/mod/github.com/mdlayher/netlink@v1.11.2/LICENSE.md;md5=3eafc6f005c67bf814be77debbfc8951;spdx=MIT \
     file://pkg/mod/github.com/mdlayher/sdnotify@v1.0.0/LICENSE.md;md5=a57b2e272a0c75c413c784bb877cda50;spdx=MIT \
-    file://pkg/mod/github.com/mdlayher/socket@v0.5.0/LICENSE.md;md5=bdcb2fcb7aea8a34d189ef572a59ff88;spdx=MIT \
+    file://pkg/mod/github.com/mdlayher/socket@v0.7.0/LICENSE.md;md5=bdcb2fcb7aea8a34d189ef572a59ff88;spdx=MIT \
     file://pkg/mod/github.com/mitchellh/go-ps@v1.0.0/LICENSE.md;md5=56da355a12d4821cda57b8f23ec34bc4;spdx=MIT \
     file://pkg/mod/github.com/peterbourgon/ff/v3@v3.4.0/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
     file://pkg/mod/github.com/pierrec/lz4/v4@v4.1.26/LICENSE;md5=09ece85f3c312a63b522bfc6ebd44943;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/pires/go-proxyproto@v0.8.1/LICENSE;md5=ebfe2201eab4c067477cc534908ac12f;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/pkg/sftp@v1.13.6/LICENSE;md5=452fc5cc5a9127a0e828d73423d45035;spdx=BSD-2-Clause \
-    file://pkg/mod/github.com/safchain/ethtool@v0.3.0/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/pires/go-proxyproto@v0.15.0/LICENSE;md5=ebfe2201eab4c067477cc534908ac12f;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/pkg/sftp@v1.13.11/LICENSE;md5=452fc5cc5a9127a0e828d73423d45035;spdx=BSD-2-Clause \
+    file://pkg/mod/github.com/safchain/ethtool@v0.7.0/LICENSE;md5=8e1a430c9c6b9fa0c191191e83efa169;spdx=Apache-2.0 \
     file://pkg/mod/github.com/skip2/go-qrcode@v0.0.0-20200617195104-da1b6568686e/LICENSE;md5=515c25e1450ede2834397875c18439d4;spdx=MIT \
     file://pkg/mod/github.com/tailscale/gliderssh@v0.3.4-0.20260716005906-1a0f895faf28/LICENSE;md5=ac631f842784b8ec269293a49121236b;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/tailscale/hujson@v0.0.0-20260302212456-ecc657c15afd/LICENSE;md5=073f7ac93b9172ac4e1d258584fc0271;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/tailscale/hujson@v0.0.0-20260727124030-b80ff77dac4f/LICENSE;md5=073f7ac93b9172ac4e1d258584fc0271;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/tailscale/netlink@v1.1.1-0.20240822203006-4d49adab4de7/LICENSE;md5=2ade771c7d7211af507864e8dd520529;spdx=Apache-2.0 \
     file://pkg/mod/github.com/tailscale/peercred@v0.0.0-20250107143737-35a0c7bd7edc/LICENSE;md5=94eaeed21686fd9816f57f86b9914071;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/tailscale/web-client-prebuilt@v0.0.0-20250124233751-d4cd19a26976/LICENSE;md5=a672713a9eb730050e491c92edf7984d;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/tailscale/wireguard-go@v0.0.0-20260715223240-2e01ba5b00f0/LICENSE;md5=995598bc9de2b4c987c2cb87fc24f341;spdx=MIT \
+    file://pkg/mod/github.com/tailscale/web-client-prebuilt@v0.0.0-20260917222731-e0ed2d0d0fea/LICENSE;md5=a672713a9eb730050e491c92edf7984d;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/tailscale/wireguard-go@v0.0.0-20260928213032-417aef361226/LICENSE;md5=995598bc9de2b4c987c2cb87fc24f341;spdx=MIT \
     file://pkg/mod/github.com/tailscale/xnet@v0.0.0-20240729143630-8497ac4dab2e/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/toqueteos/webbrowser@v1.2.0/LICENSE.md;md5=6072d29ffa4b14338ff8fd68f17f6851;spdx=MIT \
-    file://pkg/mod/github.com/u-root/u-root@v0.14.0/LICENSE;md5=bf431bf303eaf01f17bef6624d9f2208;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/toqueteos/webbrowser@v1.2.1/LICENSE.md;md5=7b9e45681a3ffc9b3d92b1bc3951385d;spdx=MIT \
+    file://pkg/mod/github.com/u-root/u-root@v0.16.0/LICENSE;md5=bf431bf303eaf01f17bef6624d9f2208;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/u-root/uio@v0.0.0-20240224005618-d2acac8f3701/LICENSE;md5=52bf39fc1e426b6459f5c9a142e5bfbd;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/vishvananda/netns@v0.0.5/LICENSE;md5=2ade771c7d7211af507864e8dd520529;spdx=Apache-2.0 \
     file://pkg/mod/github.com/x448/float16@v0.8.4/LICENSE;md5=de8f8e025d57fe7ee0b67f30d571323b;spdx=MIT \
     file://pkg/mod/go.yaml.in/yaml/v2@v2.4.4/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
     file://pkg/mod/go4.org/mem@v0.0.0-20240501181205-ae6ca9944745/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc;spdx=Apache-2.0 \
-    file://pkg/mod/go4.org/netipx@v0.0.0-20231129151722-fdeea329fbba/LICENSE;md5=628df198dc9e033b86b8eedff039ff86;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/crypto@v0.54.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/exp@v0.0.0-20260410095643-746e56fc9e2f/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/image@v0.41.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/net@v0.56.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/oauth2@v0.36.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sync@v0.22.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sys@v0.47.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/term@v0.45.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/text@v0.40.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/time@v0.15.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/gvisor.dev/gvisor@v0.0.0-20260224225140-573d5e7127a8/LICENSE;md5=e566fe37b81dd469e93876dc021ca01c;spdx=Apache-2.0 \
-    file://pkg/mod/k8s.io/client-go@v0.34.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/go4.org/netipx@v0.0.0-20260823151212-3075585bcbeb/LICENSE;md5=628df198dc9e033b86b8eedff039ff86;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/crypto@v0.57.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/exp@v0.0.0-20260908205506-85c1c2202aba/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/image@v0.46.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.59.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/oauth2@v0.37.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.23.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.48.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/term@v0.46.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.42.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/time@v0.16.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/gvisor.dev/gvisor@v0.0.0-20260915211658-a6f909f08a72/LICENSE;md5=e566fe37b81dd469e93876dc021ca01c;spdx=Apache-2.0 \
+    file://pkg/mod/k8s.io/client-go@v0.37.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/sigs.k8s.io/yaml@v1.6.0/LICENSE;md5=b5d30dd5bc47d1b56b678ac06dead1c7;spdx=BSD-3-Clause \
-    file://pkg/mod/software.sslmate.com/src/go-pkcs12@v0.4.0/LICENSE;md5=259f3802525423b1a33efb1b85f64e18;spdx=BSD-3-Clause \
+    file://pkg/mod/software.sslmate.com/src/go-pkcs12@v0.7.3/LICENSE;md5=259f3802525423b1a33efb1b85f64e18;spdx=BSD-3-Clause \
 "
diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.4.bb b/meta-networking/recipes-connectivity/tailscale/tailscale_1.104.1.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/tailscale/tailscale_1.102.4.bb
rename to meta-networking/recipes-connectivity/tailscale/tailscale_1.104.1.bb
index 13cb519985..220aff5788 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.4.bb
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale_1.104.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/tailscale/tailscale.git;protocol=https;branch=releas
            file://default \
            file://tailscaled.init \
            "
-SRCREV = "bbcd7d1fc2054b9189ebc1531acf74bd880ca0c8"
+SRCREV = "9a522a9786c97eb7910c01ccb7bd66557b04c910"
 SRCREV_SHORT = "${@d.getVar('SRCREV')[:8]}"
 require ${BPN}-go-mods.inc
 
-- 
2.47.3


