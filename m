Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48509.1795411822408674338
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uMnfg2os;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so3977480c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411822; x=1796016622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Fq97Qzf+10Q6icsPcHZ7Rx0tDHYK6mqpYkZ2g/7VaU=;
        b=uMnfg2os4TuzDJbug1diL7zxtt7vaF/oAtixGNIL+QOIgSun6Z7+UNZOu0HPVp9VYL
         O5ZtHaKp3PCOo1Vd/rUsbbG7RX9lO/RBJAiUACNfXuP+JRN/PgRu20tN2nJUeawtdz2m
         awklfP4u98ZdLnqmcgEsw6v36GryK99cdw2Hud/Q0hZpowuHcPPaLALarzSdkX7ZJvzr
         dLB48GXaAmZXx86A5g7ko8az0lMUaMeITcCb5eNw4PVOV07BkZ1zLz573k6JcA4vW/xm
         WUu9fSz090bB+hbQq82f9qaXGYZ7Xbkwoaax4BhInsl5VVeQ+w+YTt8bCynpeOCTOwys
         wzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411822; x=1796016622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Fq97Qzf+10Q6icsPcHZ7Rx0tDHYK6mqpYkZ2g/7VaU=;
        b=evwCltcF4+xaDsmN5lprJfE1J+u7gEL3oKsZqilrBVaisyXNPSc2+ZRAgOWAhRQdLJ
         aURdkEKPb3dfiYWA4jrewiAatgODiueka3h16JYY6ooTBQqG1IpRfUsZPnCf9J2KjkXs
         n68hfW4XgpT+UpOlKFdsjvI1xTsFozUncgt9aXRc7MmflA4CmoF42a5UKg/LUaOG9FQq
         Fl//V2ShBSLvS9ZOefcLB04SiDXqiz+ZSfs7+ugqpaEXND5vWWao+Wn7JXsfrzwSVSW0
         LLbx6Qwlv+TBIu1PaeMadGFKCBO3Mnmdbx1cfJ1dZmfKVRE8Hc9oZx0VZf1GSwRQKsWA
         H/jg==
X-Gm-Message-State: APuU4Z+ZXFivD8o43xbzGZUMVh5UWeGT0I6Tu+NnYlnTbIq46qkhndlu
	fmQepEHcg+Bqe/EtTC+1YsEY6yefdT+VAhh81f/TILguVBTDolmVNIc2GN3mE7h5fis=
X-Gm-Gg: AZFdTZf1ylLdvBjCvQqNPKGjvY025AgLn0dMZUXNdGPIE6vd+aW9UANhmzoGynvY6gL
	5IiBgPlZRv5+ONPrAvUEsNKX6qdWQXGRgX1F0kCmhlgLZSk8miXIY3Gdb0QbYvtNVqCEbH2+QYb
	W6Sf+N+d2k7z0juSITxblg/3RuDQIaTEvVWpsORFy7v7BEfWfFv+F6q4ozrxixLZW9bfL76DN47
	OG6FvL84E0euT6WqwKcoP/JtQJ8+VVSJtxKzVmZK/kjPxLO4sqoeW3J+lDqpmIQwOh9xM+YR10E
	426/ds3RC6rchhZtBw+aD5294Sc3GMy+07ZSz5CcFovfN4mL2a6PKhKwxnUHQsAJWOZoXatJcMw
	YNh14BrFcav0TRq/s/sy4W/ft+cFXHueS8PrZ8AfqGxaPlz3zcNNVHw5yveBdbqCVjGeWkzGTkM
	owGVKo95QsuklI6Y8btWYmqFBqGVWVPNDOlL63xQdQZVOQ0IrNMvGZ/Me/6epFr0PgPT2hFvVqo
	YJZ4r0bTRRd38qIwr1ReWHz7OVG+9Y74BaIDcF9vl24GpkOg0QntS7VqNMCUYKS8c4JYTO8aRLv
	a2O4HaSWkrThAUuKk3DajTbs+gOohU4h6njEOwahtecexbK4Aaksx6qUPtM5S90+sBfrv5YcsSP
	oq4ALyp2MAix6kDUmFWLIhbvEvwQTsKhLpEfROBfrTe33sDwqnsiutR8wRMAGBwK5tNHW2nxaWk
	mbKrSO4DNtdyOyMEB2eXdEDVcXnLhos9JFwZC1g3MJrTApAoERSU4+EFkgypkiafZXTKRyZ0mfC
	/LWgsdu427LWNpz0nh9RQ1FE4Ul8E05rJk4aTq241HYs8OFXrwMTTz2Umo+aLnnAcRmpgjXH0vX
	iuYo
X-Received: by 2002:a05:701b:450f:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b56f87ae7cmr3463797c88.16.1795411821548;
        Sun, 22 Nov 2026 21:30:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 2/9] cloudflared: upgrade 2026.10.7 -> 2026.11.1
Date: Sun, 22 Nov 2026 21:28:36 -0800
Message-ID: <20261123052953.3658549-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132807
Content-Type: text/plain; charset="utf-8"

- Don't bypass Access with matrix parameters (VULN-170057)
- Bump OpenTelemetry to 1.47.0 (VULN-187395)
- Quick tunnels can fall back to HTTP/2
- Reconnect on account region changes
- Built with Go 1.27.4

Regenerate cloudflared-go-mods.inc and cloudflared-licenses.inc with
bitbake -c update_modules.

License-Update: Go module license files regenerated for the updated dependencies (otel 1.47.0 and the new otel/log, protobuf 1.36.12); no license changes
AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cloudflared/cloudflared-go-mods.inc             | 13 +++++++------
 .../cloudflared/cloudflared-licenses.inc            | 13 +++++++------
 ...flared_2026.10.7.bb => cloudflared_2026.11.1.bb} |  2 +-
 3 files changed, 15 insertions(+), 13 deletions(-)
 rename meta-networking/recipes-connectivity/cloudflared/{cloudflared_2026.10.7.bb => cloudflared_2026.11.1.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/cloudflared/cloudflared-go-mods.inc b/meta-networking/recipes-connectivity/cloudflared/cloudflared-go-mods.inc
index 303e88a40d..af5fd7a0c3 100644
--- a/meta-networking/recipes-connectivity/cloudflared/cloudflared-go-mods.inc
+++ b/meta-networking/recipes-connectivity/cloudflared/cloudflared-go-mods.inc
@@ -49,11 +49,12 @@ SRC_URI += "\
     gomod://github.com/tklauser/numcpus;version=v0.11.0;sha256sum=7a7527e1f68059a77189ae875c294e5c310925fbb8ba5a6c794edd2b7e687267 \
     gomod://go.opentelemetry.io/auto/sdk;version=v1.2.1;sha256sum=a08a16fc0a7041cdb875f47a260a56000632212c85f65a302a043c76380c8335 \
     gomod://go.opentelemetry.io/contrib/propagators;version=v0.22.0;sha256sum=6fd7c359308ba4f6b81698cabdbe701b2c8d786de53387ce8ed7b69eed647e04 \
-    gomod://go.opentelemetry.io/otel;version=v1.45.0;sha256sum=65b5fc93c93f4eaef740b4bba81fd2543f248d5df85cf4d1ddf9ab459b30f7a2 \
-    gomod://go.opentelemetry.io/otel/exporters/otlp/otlptrace;version=v1.45.0;sha256sum=17e5b206e5ea76d8a1e4e8ef340d888894a0776fc1d66848530346347e0b47c3 \
-    gomod://go.opentelemetry.io/otel/metric;version=v1.45.0;sha256sum=8f30ef0039306bf3a4421b8c08e3fc8922d13503dce53b3438e860b3628faecd \
-    gomod://go.opentelemetry.io/otel/sdk;version=v1.45.0;sha256sum=ad0e63fa1cfc01dffec2a90a8f2d2c1bc0f55d0462940176dc41b7ada0d03258 \
-    gomod://go.opentelemetry.io/otel/trace;version=v1.45.0;sha256sum=32d7d64ea5991378184b03a9ed7b7822b17691a239508a6905fdd73819cb6c6f \
+    gomod://go.opentelemetry.io/otel;version=v1.47.0;sha256sum=275ce19c11b3f26830a4b3d884e6a59f3e4ef51e519ef3fc3bcbcc5e71f9b37d \
+    gomod://go.opentelemetry.io/otel/exporters/otlp/otlptrace;version=v1.47.0;sha256sum=a6a41ac372755156c3ba546b861f887052b9ea781d9fc6233e4db5d52a47d1bd \
+    gomod://go.opentelemetry.io/otel/log;version=v1.47.0;sha256sum=6f99ff1e779241c778d62872f651ea7bafce80246b5cfac321aa133f196ad811 \
+    gomod://go.opentelemetry.io/otel/metric;version=v1.47.0;sha256sum=cfa35ad1f540114d39a381cf8773ba7d2aab47f0fa42040d409e86dee9ab27f6 \
+    gomod://go.opentelemetry.io/otel/sdk;version=v1.47.0;sha256sum=c01b323e4173c1700ee0352533bdc26816d1e4fa33fb15a0c24b35f9978c4918 \
+    gomod://go.opentelemetry.io/otel/trace;version=v1.47.0;sha256sum=dfffa6cb848954b5d3413007b6553ad3e508a9fc992a81ab4bd9026c236229be \
     gomod://go.opentelemetry.io/proto/otlp;version=v1.11.0;sha256sum=790b98d472e7095511fa7feddd04e1d85bd844226e03ba482bd4105ef2217e09 \
     gomod://go.uber.org/automaxprocs;version=v1.6.0;sha256sum=964c6f548f7ee6df9fa3a9080d722c7950060bda0cb84ff9e2ae065f078813c4 \
     gomod://golang.org/x/crypto;version=v0.58.0;sha256sum=b0a45594cda20ddb4264d84aeff9b588b8570bf6a2833c51a0b821734a298d95 \
@@ -66,7 +67,7 @@ SRC_URI += "\
     gomod://google.golang.org/genproto/googleapis/api;version=v0.0.0-20260720211330-0afa2a65878a;sha256sum=df4e8023b2b9efa58561b12e3177f4fb6789e2a271a9e03baf6f6501c7961694 \
     gomod://google.golang.org/genproto/googleapis/rpc;version=v0.0.0-20260720211330-0afa2a65878a;sha256sum=03a9f622788b07abc4873b3b57bdd9a3e2c8ca248587a2196578dda0bf74ddd5 \
     gomod://google.golang.org/grpc;version=v1.83.2;sha256sum=84292905a694e17862d15abc123a6f7f7efa9e1e3a77e80120982ff95b2605ea \
-    gomod://google.golang.org/protobuf;version=v1.36.11;sha256sum=14983d36c56a814ed91b6d652f2b8f895baba1b84eb43b28a0b132c8637cd274 \
+    gomod://google.golang.org/protobuf;version=v1.36.12;sha256sum=68f8a3174aff42950fd9bd02c11b45c6986eb8060508d124d1c3dd6bf86b9be6 \
     gomod://gopkg.in/natefinch/lumberjack.v2;version=v2.0.0;sha256sum=8c268e36660d6ce36af808d74b9be80207c05463679703e93d857e954c637aaa \
     gomod://gopkg.in/yaml.v2;version=v2.4.0;sha256sum=ede49e27c4cca6cdd2ec719aed8ea4d363710cceb3d411e7a786fbdec0d391fd \
     gomod://gopkg.in/yaml.v3;version=v3.0.1;sha256sum=aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015 \
diff --git a/meta-networking/recipes-connectivity/cloudflared/cloudflared-licenses.inc b/meta-networking/recipes-connectivity/cloudflared/cloudflared-licenses.inc
index 247f4e3fde..ad28fddc21 100644
--- a/meta-networking/recipes-connectivity/cloudflared/cloudflared-licenses.inc
+++ b/meta-networking/recipes-connectivity/cloudflared/cloudflared-licenses.inc
@@ -53,11 +53,12 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/tklauser/numcpus@v0.11.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/go.opentelemetry.io/auto/sdk@v1.2.1/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
     file://pkg/mod/go.opentelemetry.io/contrib/propagators@v0.22.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/go.opentelemetry.io/otel/exporters/otlp/otlptrace@v1.45.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
-    file://pkg/mod/go.opentelemetry.io/otel/metric@v1.45.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
-    file://pkg/mod/go.opentelemetry.io/otel/sdk@v1.45.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
-    file://pkg/mod/go.opentelemetry.io/otel/trace@v1.45.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
-    file://pkg/mod/go.opentelemetry.io/otel@v1.45.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
+    file://pkg/mod/go.opentelemetry.io/otel/exporters/otlp/otlptrace@v1.47.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
+    file://pkg/mod/go.opentelemetry.io/otel/log@v1.47.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
+    file://pkg/mod/go.opentelemetry.io/otel/metric@v1.47.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
+    file://pkg/mod/go.opentelemetry.io/otel/sdk@v1.47.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
+    file://pkg/mod/go.opentelemetry.io/otel/trace@v1.47.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
+    file://pkg/mod/go.opentelemetry.io/otel@v1.47.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
     file://pkg/mod/go.opentelemetry.io/proto/otlp@v1.11.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
     file://pkg/mod/go.uber.org/automaxprocs@v1.6.0/LICENSE;md5=513f1cf32c6e4e3236a335fa13bb1c89;spdx=MIT \
     file://pkg/mod/golang.org/x/crypto@v0.58.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
@@ -70,7 +71,7 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/google.golang.org/genproto/googleapis/api@v0.0.0-20260720211330-0afa2a65878a/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/google.golang.org/genproto/googleapis/rpc@v0.0.0-20260720211330-0afa2a65878a/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/google.golang.org/grpc@v1.83.2/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/google.golang.org/protobuf@v1.36.11/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956;spdx=BSD-3-Clause \
+    file://pkg/mod/google.golang.org/protobuf@v1.36.12/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956;spdx=BSD-3-Clause \
     file://pkg/mod/gopkg.in/natefinch/lumberjack.v2@v2.0.0/LICENSE;md5=574cdb55b81249478f5af5f789e9e29f;spdx=MIT \
     file://pkg/mod/gopkg.in/yaml.v2@v2.4.0/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
     file://pkg/mod/gopkg.in/yaml.v3@v3.0.1/LICENSE;md5=3c91c17266710e16afdbb2b6d15c761c;spdx=Apache-2.0 \
diff --git a/meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.10.7.bb b/meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.11.1.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.10.7.bb
rename to meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.11.1.bb
index 703bfc81cd..b3e2f14f23 100644
--- a/meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.10.7.bb
+++ b/meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.11.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/cloudflare/cloudflared.git;protocol=https;branch=mas
            file://cloudflared.service \
            file://default \
            "
-SRCREV = "872b241f94871665c1c157adefcf90c11f0ead96"
+SRCREV = "518d7f7969b764df628bb4b1088f0f154901dc4e"
 require ${BPN}-go-mods.inc
 
 GO_IMPORT = "github.com/cloudflare/cloudflared"
