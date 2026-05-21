Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600C4CD5BAF
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 17:00:49 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41573.1779382839906992369
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 10:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Eoh4yDSH;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3042a388168so859508eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779382839; x=1779987639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U40qVHMHUklHzXZplcCm+Up4RUwT7H83L36LncUhBsU=;
        b=Eoh4yDSHcjWCAYndYHqIA/6ZeqGdfDH1tjGMZ/2TFTTdJ0oDz2pNOZscubQg2mQIfJ
         A0RF9WHVED3WQJPuQreOPr+/3GMXGml3f8hv+QX3YbMogRHZkNkKF5ghY7r0iECiROR+
         ufzSyuhrZR4h8NFE1jllEQ2lvf3F2r5XB567Cn8MWZjlAz7tBmyxhSAYT7wjS+BIQn89
         SUt70PxOO+s/9NX7zr6yJzYL1vESoK8Yzqf7cqVcWvP/fz5GBk7467RaTNXVcWD6Xcsa
         5fXcM7B9/hLKL9DIJcQnLwLp4fAJbbOYX5sZFUT/MF9zqO/i3h7vpLMSWjvniTD6bn8J
         iADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779382839; x=1779987639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U40qVHMHUklHzXZplcCm+Up4RUwT7H83L36LncUhBsU=;
        b=dIFodI+HT5OhxQP2JTU6vrLnCMgcb33RG90U2GPk/9pa9zCwf4FqUAFzzFXudm0el8
         ebbtYNcBTHeTFuj7N1F21m0U5Wp4TT72bUlzPLLtx4gsDUM3ogc9mg1syWaKzZwTSi77
         0g0ToWW9iKcPujwlv49lbIyme83rC4eLQupVHMggcWrXxHAdcLUOpss8TrbQ1hGPZcK+
         jZSOPtwESbNNDiX1CgtauovOZRRW0k+gOINe0Ab5c9PYF7dLWO6eTH75UneHCvbgafaO
         lfOBiKQUencSMkbGSSAJ9m9rCTSC7/ZFhRv244An+6rbSOQP00aqtyAFbV53A/yY5MkJ
         9jLw==
X-Gm-Message-State: AOJu0YznZGm7DC9vq9zMa7+UnPL8LqBuEBla+JKzH33dP12rEWbFfkJz
	bdE17bQAIHFlQJpTaEqdqv8wsbut5WwfAngkhslbVaGz0MKSOvOfXKGTmvBwN+vHhN8=
X-Gm-Gg: Acq92OGqmtJTo6pvenzhEDJE3ItzUj03wZsPK4zIrhFcpfjgL468ULZJdb3Yk1J/Msf
	6dsLsQt3EzAGYkbmFxU0AjKMdHuz9rQV4DHlkiSSpfVmk71LfBhGVK8fN4oCQTvqvYRKDKlbaAr
	wk6/F1CrVqSl/L8YQnPDYmdwo05IJGVAR9bJc9rWsDN7tYr5fYgbS53RMWrtCuoqMsdTNDkEQnb
	HMgxMH3UsmfTZUkvOABdzJmW049XlvQXaPoqJbxbRcwIOUKNOfryh4gli8nDtRB7O582nIBRfum
	WSrLw6/Rc1neyizgvkzYhEjRR2sjQTcYeYKNLnmMhUvPxLMPKfpRpNtRxD1i+hc4fCcBfFQoaP2
	Wdd2Bcc0k/bIRtpT+n/GMs8z5LStHDiHz7RngM2HOAf/ZkT320JuixfdR+g6uQWp/KgQISKztb6
	ivYitebumJkSJw+C1LlMrNV2y+4vP6II86RnnD6GtXRtCpQNtaBnXNtcGTXiqbXiPfLFA9fY9a6
	7bUoFMxuG9qAoBH7KsqylZOghBituDC5dUvTig+og9o9XsKXgFvBBApV1zoKUuV7jTFdYtL60v1
	iKYZadIWCYyDduEFKsR3KyBHXj+bhNIdxGJKPKZp
X-Received: by 2002:a05:693c:2287:b0:2da:13c6:f27b with SMTP id 5a478bee46e88-30430522a38mr1856683eec.5.1779382839000;
        Thu, 21 May 2026 10:00:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304435c2ea0sm901297eec.31.2026.05.21.10.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:00:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-orjson: Upgrade to 3.11.9
Date: Thu, 21 May 2026 10:00:35 -0700
Message-ID: <20260521170035.3245102-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 17:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127137

Depends on rust 1.95 and fix building with rust 1.95

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-orjson-crates.inc          | 34 +++++++++----------
 ...son_3.11.8.bb => python3-orjson_3.11.9.bb} |  2 +-
 2 files changed, 17 insertions(+), 19 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-orjson_3.11.8.bb => python3-orjson_3.11.9.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-orjson-crates.inc b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
index 3feff8d77d..c262bfdd44 100644
--- a/meta-python/recipes-devtools/python/python3-orjson-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
@@ -2,27 +2,27 @@

 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/associative-cache/3.0.0 \
+    crate://crates.io/associative-cache/3.0.1 \
     crate://crates.io/bytecount/0.6.9 \
     crate://crates.io/bytes/1.11.1 \
-    crate://crates.io/cc/1.2.58 \
+    crate://crates.io/cc/1.2.61 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/gimli/0.32.3 \
     crate://crates.io/itoa/1.0.18 \
     crate://crates.io/itoap/1.0.1 \
-    crate://crates.io/jiff/0.2.23 \
-    crate://crates.io/jiff-static/0.2.23 \
-    crate://crates.io/libc/0.2.183 \
+    crate://crates.io/jiff/0.2.24 \
+    crate://crates.io/jiff-static/0.2.24 \
+    crate://crates.io/libc/0.2.186 \
     crate://crates.io/memchr/2.8.0 \
     crate://crates.io/no-panic/0.1.36 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/portable-atomic/1.13.1 \
-    crate://crates.io/portable-atomic-util/0.2.6 \
+    crate://crates.io/portable-atomic-util/0.2.7 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3-build-config/0.28.2 \
-    crate://crates.io/pyo3-ffi/0.28.2 \
+    crate://crates.io/pyo3-build-config/0.28.3 \
+    crate://crates.io/pyo3-ffi/0.28.3 \
     crate://crates.io/quote/1.0.45 \
     crate://crates.io/serde/1.0.228 \
     crate://crates.io/serde_core/1.0.228 \
@@ -34,32 +34,31 @@ SRC_URI += " \
     crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unwinding/0.2.8 \
-    crate://crates.io/version_check/0.9.5 \
     crate://crates.io/xxhash-rust/0.8.15 \
     crate://crates.io/zmij/1.0.21 \
 "

-SRC_URI[associative-cache-3.0.0.sha256sum] = "6104bd6fd778b62f638add0dd848dca9887cf016a343d15a21d27fb8a3965b98"
+SRC_URI[associative-cache-3.0.1.sha256sum] = "138b4febdc7d0135523c55358c97361fd45089bc65fe859ef21a58d0892deb00"
 SRC_URI[bytecount-0.6.9.sha256sum] = "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f2cc0365e"
 SRC_URI[bytes-1.11.1.sha256sum] = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
-SRC_URI[cc-1.2.58.sha256sum] = "e1e928d4b69e3077709075a938a05ffbedfa53a84c8f766efbf8220bb1ff60e1"
+SRC_URI[cc-1.2.61.sha256sum] = "d16d90359e986641506914ba71350897565610e87ce0ad9e6f28569db3dd5c6d"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[gimli-0.32.3.sha256sum] = "e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7"
 SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
 SRC_URI[itoap-1.0.1.sha256sum] = "9028f49264629065d057f340a86acb84867925865f73bbf8d47b4d149a7e88b8"
-SRC_URI[jiff-0.2.23.sha256sum] = "1a3546dc96b6d42c5f24902af9e2538e82e39ad350b0c766eb3fbf2d8f3d8359"
-SRC_URI[jiff-static-0.2.23.sha256sum] = "2a8c8b344124222efd714b73bb41f8b5120b27a7cc1c75593a6ff768d9d05aa4"
-SRC_URI[libc-0.2.183.sha256sum] = "b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d"
+SRC_URI[jiff-0.2.24.sha256sum] = "f00b5dbd620d61dfdcb6007c9c1f6054ebd75319f163d886a9055cec1155073d"
+SRC_URI[jiff-static-0.2.24.sha256sum] = "e000de030ff8022ea1da3f466fbb0f3a809f5e51ed31f6dd931c35181ad8e6d7"
+SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
 SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
 SRC_URI[no-panic-0.1.36.sha256sum] = "f967505aabc8af5752d098c34146544a43684817cdba8f9725b292530cabbf53"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
-SRC_URI[portable-atomic-util-0.2.6.sha256sum] = "091397be61a01d4be58e7841595bd4bfedb15f1cd54977d79b8271e94ed799a3"
+SRC_URI[portable-atomic-util-0.2.7.sha256sum] = "c2a106d1259c23fac8e543272398ae0e3c0b8d33c88ed73d0cc71b0f1d902618"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-build-config-0.28.2.sha256sum] = "8bf94ee265674bf76c09fa430b0e99c26e319c945d96ca0d5a8215f31bf81cf7"
-SRC_URI[pyo3-ffi-0.28.2.sha256sum] = "491aa5fc66d8059dd44a75f4580a2962c1862a1c2945359db36f6c2818b748dc"
+SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
+SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
 SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
@@ -71,6 +70,5 @@ SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c5852
 SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unwinding-0.2.8.sha256sum] = "60612c845ef41699f39dc8c5391f252942c0a88b7d15da672eff0d14101bbd6d"
-SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[xxhash-rust-0.8.15.sha256sum] = "fdd20c5420375476fbd4394763288da7eb0cc0b8c11deed431a91562af7335d3"
 SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.11.8.bb b/meta-python/recipes-devtools/python/python3-orjson_3.11.9.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-orjson_3.11.8.bb
rename to meta-python/recipes-devtools/python/python3-orjson_3.11.9.bb
index 22a0205af3..2e9392fab9 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.11.8.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"

-SRCREV = "5cbb3d0398a2f42de51210270286fecd798c5d78"
+SRCREV = "705515d77b28429d0b7c30c3d781abe52e8a1e5a"
 PYPI_SRC_URI = "git://github.com/ijl/orjson;protocol=https;branch=master;tag=${PV};destsuffix=orjson-${PV}"

 CVE_PRODUCT = "orjson"

