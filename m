Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD27FCC9D9
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 08:09:04 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34757.1773127212428894080
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 00:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OKZD29jt;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: jinoabraham26@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae4e538abdso87594385ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 00:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773127211; x=1773732011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ4ytyf3hdFj6vso9XNn9DdnQIjV8zVCtabvUA47nQE=;
        b=OKZD29jtMYEw0WNcXOKWKrjeopSlyPRDiIkUrSOoKno5qg4aZHHVkYIES20nguoj2l
         3c1iP+10UPY27898IlOwpG+i/kCzCu3bduw/pY2mFvfeFn81VF/2vyLjhllIEAqKsZFq
         KShcRDTlk90BSQj3hYeJTEyfDFQjssicyIJQIBKIYIwd4g0uk3E8yetr1fieWq8PcJpE
         lE8RslmVsqi2Cdz2e4wzKcdLeP4DVXtoLcfwSnhiOOpMKikWCJSe/n2ozjSfexhrswBH
         cWxMpmT5QucebdPL2KIhQF6uj4nacCDPObvX40g6MCIKCn2fwj/YLHnlnpySeTkq5Bax
         AAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127211; x=1773732011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQ4ytyf3hdFj6vso9XNn9DdnQIjV8zVCtabvUA47nQE=;
        b=TjhFpiyE3fYpJshilNQKzT6jEDLvLsn2LqLdVKVEi35h9Hy3vhukk/941B77rL8jqs
         mS+8iNEHB1FntPdK51ulV/vivS4CnY1OfB/LvA1R/ChSFKHmhxV/SjA/gaXFhg7DKcWb
         hPaeUMdFeUya6camAPloESQyHmyQTSN4YGOJFYwqqdTXQYPoOUsavY5v65tPq98EIYOu
         ER8qYlSGeN9rma7muktHhVz4RPOELH4F5TFgX+mn20parup5yzBig56XMBMlYfx/ZACD
         qChsGm1VAX69spsMxIUGDg8AQ5DoH+4keldHkG38AkJvQ6TAiFjeZz3EyWKB2jYwIZNP
         3RfA==
X-Gm-Message-State: AOJu0YxfWdiD6KNrDjKLtz+/aCI/Wy3RNiBspBWsmi/kWB9mvbB7vSkC
	IgZCexhy2lZetztJmLZS9lcxm9UhK9erUkYzzd/LWEmpsgjk7LzByKJECGT46A==
X-Gm-Gg: ATEYQzzQnMfA9Rw0lMFfxyPJZUrL27MQ0oGx6mEDGWcaMjNGkd9FLUE4+PyYTp33+/L
	zqTEHa5/I9vkaNofgX9a17UVtibSkd8SMRjDk8B5rEgN6/3bs+KPbXRllZfYT74Ii94Xzf6ibwH
	xp3k8qnxsFwMC8lm65ej3azsxnCHgcqcciY4FvBsfU0v2ykYKAZrywnHARG4N2kRztac3pqwjbQ
	bzh6s9ghYf2Hv34F009uRX/7QYQDUyrLatMZ1Qezy7KXZ9H9u1f1JTsfmVfMVpktM/NkATUpQwP
	5ms50L0eFh9cae9Zn6P1uxCX5ZP7g6aaPAIFF4Qi+U9I1MxJRky7JNb9OoabWhPKLxLaRsINf11
	SGZ68BM6Jgma/h56ddHv/ku/SO767Aw1V2nSYIWV33Yi7Ym3+lcStzCBiwPR8d4VWAT/a3APuHu
	XTYCzSIlwbj4tkdgwvwTi8Dsr3YDVH1NG0Geoz1GfVDNgYTgM=
X-Received: by 2002:a17:902:e883:b0:2ae:3f44:6686 with SMTP id d9443c01a7336-2ae8238c834mr144180335ad.18.1773127211276;
        Tue, 10 Mar 2026 00:20:11 -0700 (PDT)
Received: from localhost.localdomain ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ad92fsm216682755ad.77.2026.03.10.00.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:20:10 -0700 (PDT)
From: jinoabraham26@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jino Abraham <jinoabraham26@gmail.com>
Subject: [meta-oe][PATCH] spdm-emu: add recipe for SPDM emulator
Date: Tue, 10 Mar 2026 07:18:48 +0000
Message-ID: <20260310071848.1450876-1-jinoabraham26@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125018

From: Jino Abraham <jinoabraham26@gmail.com>

SPDM emulator implementation based on libspdm.
It provides requester and responder tools used for
testing SPDM protocol communication.

Upstream: https://github.com/DMTF/spdm-emu

Signed-off-by: Jino Abraham <jinoabraham26@gmail.com>
---
 .../recipes-security/spdm-emu/spdm-emu_git.bb | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb

diff --git a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
new file mode 100644
index 0000000000..bc241b5594
--- /dev/null
+++ b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
@@ -0,0 +1,75 @@
+SUMMARY = "SPDM Emulator"
+DESCRIPTION = "Sample SPDM emulator implementation using libspdm \
+for testing SPDM communication."
+HOMEPAGE = "https://github.com/DMTF/spdm-emu"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ed4cfe4688e1ac2cc2e6748766571949"
+
+SRC_URI = "gitsm://github.com/DMTF/spdm-emu;protocol=https;branch=main"
+
+SRCREV = "5fca359b15e4edd4f070ca83c9da02799b6f78ae"
+inherit cmake pkgconfig systemd
+
+DEPENDS = "openssl"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "-DENABLE_SYSTEMD=ON,-DENABLE_SYSTEMD=OFF,systemd"
+
+SYSTEMD_SERVICE:${PN} = "spdm-responder-emu.service"
+
+def get_spdm_multiarch(d):
+    target_arch = d.getVar('TARGET_ARCH')
+    multiarch_options = {
+        "x86_64":  "x64",
+        "i586":    "ia32",
+        "i686":    "ia32",
+        "arm":     "arm",
+        "aarch64": "aarch64",
+        "riscv32": "riscv32",
+        "riscv64": "riscv64",
+        "ppc64le": "ppc64le",
+    }
+
+    if target_arch in multiarch_options:
+        return multiarch_options[target_arch]
+
+    bb.fatal("unsupported architecture '%s'" % target_arch)
+
+EXTRA_OECMAKE += "\
+    -DARCH=${@get_spdm_multiarch(d)} \
+    -DTOOLCHAIN=NONE \
+    -DTARGET=Release \
+    -DCRYPTO=openssl \
+    -DENABLE_BINARY_BUILD=1 \
+    -DCOMPILED_LIBCRYPTO_PATH=${libdir} \
+    -DCOMPILED_LIBSSL_PATH=${libdir} \
+"
+
+OECMAKE_TARGET_COMPILE += " copy_sample_key"
+
+do_install:append() {
+    # Install binaries to /usr/bin
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/bin/spdm_requester_emu ${D}${bindir}/
+    install -m 0755 ${B}/bin/spdm_responder_emu ${D}${bindir}/
+    install -m 0755 ${B}/bin/spdm_device_attester_sample ${D}${bindir}/
+    install -m 0755 ${B}/bin/spdm_device_validator_sample ${D}${bindir}/
+
+    # Install certificates/keys to /usr/share/spdm-emu
+    install -d ${D}${datadir}/spdm-emu
+    for f in ${B}/bin/*; do
+        case "$(basename $f)" in
+            spdm_requester_emu|spdm_responder_emu|spdm_device_attester_sample|spdm_device_validator_sample)
+                ;;
+            *)
+                if [ -d "$f" ]; then
+                    cp -r --no-preserve=ownership $f ${D}${datadir}/spdm-emu/
+                else
+                    install -m 0644 $f ${D}${datadir}/spdm-emu/
+                fi
+                ;;
+        esac
+    done
+}
+
+FILES:${PN} += "${datadir}/spdm-emu"

