Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5B0C433F5
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 05:29:30 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.29874.1642310969587273419
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LXudSNsy;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so26238921pjf.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Yh7uzIu+xeq/5fSUru4Sgdg26JONSvU3KeyHm6FgrPs=;
        b=LXudSNsy5TdjhnmlrYlM3HJzeGJ4PKImAyKM0G7hrEZdTBEcoU8MmGtNfQM6MsRizX
         tTLdFE61iOyjaDucHFqBI6CMC/LJZkYN1Xz0ztFwRwZltItoPW/fSHybex98ZJqhMSRV
         8BvNzZTjJvGrR3l5HVs3loo15QPM6ejPKmfn1wvnYlpCg1VJNMJ19WYkLmA7rc7/cZVM
         IbeWP5AYgLfBeHnnoCVFJFdNNeAoxXBqdhLX83NcQ1sWt5tmcd1nS8Wgm3Vz9lH2/rBv
         kE2hI8U28K2jH6+/pZwu7uQeDEitLo96kzDmmpYnJAv1beiNVDJ+R3ZNDRXothQW1CBL
         aXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yh7uzIu+xeq/5fSUru4Sgdg26JONSvU3KeyHm6FgrPs=;
        b=V7r1p8LHGgvm1NjwAjVIfL23giX7+X06tXxLg+NMst9RlbqAUTy2gGJPoZkr8BE6tA
         Lr1EK/og5S7qzMUbwZxr5/g2Y9weM85iErNnjZTrnFTpWgBHG9l/o2zFjF4GhtseZULj
         HOWDs5upRTueE18/iIY4rmJjJqkiPvhcm8vSmFYz8o7WaUBFyF3rdzI6vtyyYxNNP/nZ
         7KXgEhyNLc+u7n1XRq2l/alH1NeuZtpBcujjbdI3ZGfQrn1jXz29BL67dO/yOfrxvVhb
         W+yeKlyT3yIh9VOaN8dnNpUJIWA2ioNWv0c9J3up7bVcVLtUlkPgJWwyWc66j6O+M3xv
         usMg==
X-Gm-Message-State: AOAM531Yg71y+BfXH/bznawRocijXjDeM3spq2QLdl2UArZaDCjVKPDb
	GXUTgJ18J1bYuqQHmWD8p90QmwsBAxPVvA==
X-Google-Smtp-Source: 
 ABdhPJxTB8JLOKhXLrvl2vpSGfONbfrQYUw+3RA22Ot8HiHaVR0VWrsI+p1dCVmD5ey/TsurhidpAg==
X-Received: by 2002:a17:90a:c698:: with SMTP id
 n24mr10745869pjt.188.1642310968833;
        Sat, 15 Jan 2022 21:29:28 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:bfd3:7196:2716:eb37])
        by smtp.gmail.com with ESMTPSA id
 l11sm10062146pfu.115.2022.01.15.21.29.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 21:29:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/7] pyo3.bbclass: add class for PyO3
 cross-compilation
Date: Sat, 15 Jan 2022 21:28:59 -0800
Message-Id: 
 <2847980b4d497b069460a298853cb7f59fab662e.1642309436.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1642309436.git.tim.orling@konsulko.com>
References: <cover.1642309436.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jan 2022 05:29:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94877

PyO3 provides Rust bindings for Python, including tools for creating native
Python extension modules. Running and interacting with Python code from a
Rust binary is also supported.

This class sets up the cross-compilation environment.

Export PYO3_CROSS, PYO3_CROSS_LIB_DIR, PYO3_CROSS_INCLUDE_DIR and CARGO_BUILD_TARGET
to inform tools like setuptools-rust we are cross-compiling.

Export RUSTFLAGS so cargo can find 'std' and 'core' for target

Dynamically generate PyO3 config file and export PYO3_CONFIG_FILE
absolute path. This is the trick that finally made pyo3 work.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/classes/pyo3.bbclass | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-python/classes/pyo3.bbclass

diff --git a/meta-python/classes/pyo3.bbclass b/meta-python/classes/pyo3.bbclass
new file mode 100644
index 0000000000..4bae0949e5
--- /dev/null
+++ b/meta-python/classes/pyo3.bbclass
@@ -0,0 +1,30 @@
+#
+# This class helps make sure that Python extensions built with PyO3
+# and setuptools_rust properly set up the environment for cross compilation
+#
+
+inherit cargo python3-dir siteinfo
+
+export PYO3_CROSS="1"
+export PYO3_CROSS_PYTHON_VERSION="${PYTHON_BASEVERSION}"
+export PYO3_CROSS_LIB_DIR="${STAGING_LIBDIR}"
+export CARGO_BUILD_TARGET="${HOST_SYS}"
+export RUSTFLAGS
+export PYO3_PYTHON="${PYTHON}"
+export PYO3_CONFIG_FILE="${WORKDIR}/pyo3.config"
+
+pyo3_do_configure () {
+    cat > ${WORKDIR}/pyo3.config << EOF
+implementation=CPython
+version=${PYTHON_BASEVERSION}
+shared=true
+abi3=false
+lib_name=${PYTHON_DIR}
+lib_dir=${STAGING_LIBDIR}
+pointer_width=${SITEINFO_BITS}
+build_flags=WITH_THREAD
+suppress_build_script_link_lines=false
+EOF
+}
+
+EXPORT_FUNCTIONS do_configure
-- 
2.30.2


