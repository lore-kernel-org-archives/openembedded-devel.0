Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62574C433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 05:29:34 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.29799.1642310973291164387
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gmdjhKSN;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id n8so3704762plc.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dvWQ5q4Gl48mVJmnX1RDorVpew9CDa5zBEkEcSXEbNE=;
        b=gmdjhKSN+ELoEpoCH5BD4JdDXlW9uOpdqL3TOadbPgFIk+Zho20Q/ISupib2ZmVHme
         An6NvB0zWB+W3x2CAObuDui1IAqBwdQ56igieYBL0mV7WLtQtWpkoh8S4GP0rn9G9O/V
         x4RJFUs3/sS01/eahwFxRg6zwXN/g6lP5NgWho2EaKWPaJh26l1oDMT6fKbfuYkMrjh/
         JXr1T0/L8HKQo5Iy2q13bOmE8hobso1xdoYh7Po5E5UbLIpS/sUIeQpJalvdWtFPalz7
         q59QBT8DrgX10UfcNYVPcilPKY+AnyK4A3V8D7M5LdO3Q25S4o6jyqD+o7zSyVBfZbJB
         8dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dvWQ5q4Gl48mVJmnX1RDorVpew9CDa5zBEkEcSXEbNE=;
        b=elDqBjPclcfMwG7saM3/xH1mnFZ4Tmt+pVZXPdow1TO1xmhyelNxNx+b7NarNfQE7x
         GdZ/AYZyYI9ylz5DOpLJ20Ob4+E93kXd79zE7fRKYWUPnQrqKd3BSrWLdwDof+JDvaBb
         vUAQbJlHudtKP/RvP27gTp+2rghLFDTeC3b/4e9dQXauPZ7qaL9F9RA0g0MEOJdsxKFG
         AamNHzBEBfbUYoZgy9gWdWjaYxFD7E5OLzoEOyOj83pe3mxldc401nmzwd4tUzVfil8N
         3EQoXiNIQpHzp5d5xU19CnQPQFo7Vgr5iKziJn35/r7fzyO4j8+p6ADqyVwgdnqAflzb
         nsXQ==
X-Gm-Message-State: AOAM533Qdc4fhU6K7rtWUjmZH4ZRQxIzcHKV2qyJZpr6POX21fmb19JK
	X0+BEYyOcSPfWylxfXCj3B2WBXc85YkDwQ==
X-Google-Smtp-Source: 
 ABdhPJxCuutw0W9zd7rYJL4+0ZuJmcVlti6XnfQ6G/1siyOYWiclCEFuB3WN1w3NO6Q/KT0gYivWCw==
X-Received: by 2002:a17:902:ac97:b0:14a:97b8:570a with SMTP id
 h23-20020a170902ac9700b0014a97b8570amr7533450plr.132.1642310972536;
        Sat, 15 Jan 2022 21:29:32 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:bfd3:7196:2716:eb37])
        by smtp.gmail.com with ESMTPSA id
 l11sm10062146pfu.115.2022.01.15.21.29.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 21:29:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/7] python3-pyruvate: add recipe for v1.1.2
Date: Sat, 15 Jan 2022 21:29:01 -0800
Message-Id: 
 <1953cd6d6bf8617fb08b1244b0a8836732370523.1642309436.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1642309436.git.tim.orling@konsulko.com>
References: <cover.1642309436.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jan 2022 05:29:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94879

Pyruvate is a reasonably fast, multithreaded, non-blocking WSGI server
implemented in Rust.

This recipe uses the new setuptools3_rust and pyo3 classes.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pyruvate_1.1.2.bb          | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
new file mode 100644
index 0000000000..835cf9a93d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
@@ -0,0 +1,119 @@
+SUMMARY = "WSGI server implemented in Rust."
+DESCRIPTION = "Pyruvate is a reasonably fast, multithreaded, non-blocking \
+WSGI server implemented in Rust."
+HOMEPAGE = "https://gitlab.com/tschorr/pyruvate"
+BUGTRACKER = "https://gitlab.com/tschorr/pyruvate/-/issues"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=051b48e640a6e2d795eac75542d9417c \
+                    file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI[sha256sum] = "10befedd97e73fc18b902d02aa3b24e8978aa162242c1b664849c886c0675899"
+
+S = "${WORKDIR}/pyruvate-${PV}"
+
+inherit pypi setuptools3_rust
+
+SRC_URI += " \
+    crate://crates.io/aho-corasick/0.7.18 \
+    crate://crates.io/atty/0.2.14 \
+    crate://crates.io/autocfg/1.0.1 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/block-buffer/0.9.0 \
+    crate://crates.io/cc/1.0.72 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.19 \
+    crate://crates.io/cpufeatures/0.2.1 \
+    crate://crates.io/cpython/0.7.0 \
+    crate://crates.io/crossbeam-channel/0.5.2 \
+    crate://crates.io/crossbeam-deque/0.8.1 \
+    crate://crates.io/crossbeam-epoch/0.9.6 \
+    crate://crates.io/crossbeam-queue/0.3.3 \
+    crate://crates.io/crossbeam-utils/0.8.6 \
+    crate://crates.io/crossbeam/0.8.1 \
+    crate://crates.io/crypto-mac/0.11.1 \
+    crate://crates.io/ctrlc/3.2.1 \
+    crate://crates.io/digest/0.9.0 \
+    crate://crates.io/encoding-index-japanese/1.20141219.5 \
+    crate://crates.io/encoding-index-korean/1.20141219.5 \
+    crate://crates.io/encoding-index-simpchinese/1.20141219.5 \
+    crate://crates.io/encoding-index-singlebyte/1.20141219.5 \
+    crate://crates.io/encoding-index-tradchinese/1.20141219.5 \
+    crate://crates.io/encoding/0.2.33 \
+    crate://crates.io/encoding_index_tests/0.1.4 \
+    crate://crates.io/env_logger/0.9.0 \
+    crate://crates.io/errno-dragonfly/0.1.2 \
+    crate://crates.io/errno/0.2.8 \
+    crate://crates.io/fastrand/1.6.0 \
+    crate://crates.io/generic-array/0.14.5 \
+    crate://crates.io/getrandom/0.2.3 \
+    crate://crates.io/hermit-abi/0.1.19 \
+    crate://crates.io/hmac/0.11.0 \
+    crate://crates.io/httparse/1.5.1 \
+    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/libc/0.2.112 \
+    crate://crates.io/libsystemd/0.4.1 \
+    crate://crates.io/log/0.4.14 \
+    crate://crates.io/memchr/2.4.1 \
+    crate://crates.io/memoffset/0.6.5 \
+    crate://crates.io/mio/0.8.0 \
+    crate://crates.io/miow/0.3.7 \
+    crate://crates.io/nix/0.23.1 \
+    crate://crates.io/ntapi/0.3.6 \
+    crate://crates.io/num-integer/0.1.44 \
+    crate://crates.io/num-traits/0.2.14 \
+    crate://crates.io/num_cpus/1.13.1 \
+    crate://crates.io/once_cell/1.9.0 \
+    crate://crates.io/opaque-debug/0.3.0 \
+    crate://crates.io/paste/1.0.6 \
+    crate://crates.io/ppv-lite86/0.2.16 \
+    crate://crates.io/proc-macro2/1.0.36 \
+    crate://crates.io/python3-sys/0.7.0 \
+    crate://crates.io/quote/1.0.14 \
+    crate://crates.io/rand/0.8.4 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.3 \
+    crate://crates.io/rand_hc/0.3.1 \
+    crate://crates.io/redox_syscall/0.2.10 \
+    crate://crates.io/regex-syntax/0.6.25 \
+    crate://crates.io/regex/1.5.4 \
+    crate://crates.io/remove_dir_all/0.5.3 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/serde/1.0.133 \
+    crate://crates.io/serde_derive/1.0.133 \
+    crate://crates.io/sha2/0.9.9 \
+    crate://crates.io/simplelog/0.11.1 \
+    crate://crates.io/spmc/0.3.0 \
+    crate://crates.io/subtle/2.4.1 \
+    crate://crates.io/syn/1.0.85 \
+    crate://crates.io/tempfile/3.3.0 \
+    crate://crates.io/termcolor/1.1.2 \
+    crate://crates.io/thiserror-impl/1.0.30 \
+    crate://crates.io/thiserror/1.0.30 \
+    crate://crates.io/threadpool/1.8.1 \
+    crate://crates.io/time/0.1.44 \
+    crate://crates.io/typenum/1.15.0 \
+    crate://crates.io/unicode-xid/0.2.2 \
+    crate://crates.io/urlencoding/2.1.0 \
+    crate://crates.io/uuid/0.8.2 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi/0.3.9 \
+"
+
+# The following configs & dependencies are from setuptools extras_require.
+# These dependencies are optional, hence can be controlled via PACKAGECONFIG.
+# The upstream names may not correspond exactly to bitbake package names.
+#
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?= "test"
+PACKAGECONFIG[test] = ",,,python3-pytest python3-requests"
+
+# WARNING: the following rdepends are determined through basic analysis of the
+# python sources, and might not be 100% accurate.
+RDEPENDS:${PN} += "python3-core"
-- 
2.30.2


