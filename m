Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E853C4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 18:49:52 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7382.1784746187220862575
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 11:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mmLqctwm;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cab973140bso159647085ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 11:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784746186; x=1785350986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzVxm9PNDYiv1UcbmsqTgadpWc4u4HvjZpACsyleRFI=;
        b=mmLqctwmmwrA0iIOHIznuY6piDFlYqunzusNkwrLGdGzvn1fpz5b5esOOPPSt3zYhm
         mNZo52DSa75lHC/JFkaYItGwjQQXwU4OnvUsqXidlbz4YhXffUntmeKVYEw/mfncqBMJ
         E3RWasHjSOyBgIB0ZavHHMVxtE3OePwqmefMz3jOba85OEQFAbmXn7/tCq2zO2962Veg
         IvCJXHr+qw6ewXQ9bXU7oqwAlFPXGV2r2075IZl/Eo4KhM6XdYTWLSm2IunHHucGUnYp
         kMSLppoSBxn93V7pbqy8ugp+hfCVdhEi/fXQvWyWBNseMZEtc/8rNH696rUKiWCJm0tw
         K9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784746186; x=1785350986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzVxm9PNDYiv1UcbmsqTgadpWc4u4HvjZpACsyleRFI=;
        b=lNwkz8Zh0+gDhMiCVQpSU/rR7/vUNOFDAwFobrrRF7IwOvr7DGfyP6F9B0IpLN3wzy
         eyXvpJDyfPdVpRZDpxIORZLHGWBOZWt7XWoNAqwo1xb1mt8MuGV8wGJZ+DwHQrLITRZX
         mp+jBBDv25NqeTAuWrrxaD11DY2OYbX2YN/eKtE1r40TWVrNRa98DHmhc6jV/RhSYmnL
         MZL6zztUIr4yF0wMzLp3SOcF7dI1T/ALU24Ob5FahfeVFjTEY8Dqywb49FPiRYlLAWBh
         iIPNs/j2U3IlfF0VfbEk6mDItPXVWEQNPY4Lot3zKBt4qps5M4Oaet0Z8NeZ/7DEifN1
         /qLQ==
X-Gm-Message-State: AOJu0Yx5nSH/waw3KCWUoDwrL0Ys6b7KXxnQaOm9HZQ0/e6Tsx6PvDkm
	sZ6vNiliagLqkEWc6vK91Xvs0HGIQzpCgUnUf76wAkOgPu2Z4hK4rv/WI9fErA==
X-Gm-Gg: AR+sD11WEZkGtUVAEkRGWP6k0e3VLzrGOSFKWJ0U/pJ8IEUgqOZ71sHTh+OYJL0QrzN
	/y1KSYNCKgJlnn/eTtsG1s0uiWImzV6bPfmZf7ad3VP4McnKOoTp9yiJC3/V3+6R+9doFVYmvEU
	9vQ9ODsRFIlvFmgyx3nHriQq/W01TzOoTfOPJgvyK2HIJ8CfB3lGFgq0G58nt3Z4rO+A1q9rb5U
	tH/dgRVEOIC0NKJt8oj9xM4xXX4EAJtwUTcefYP28bbofiKqdL0laoQ5FZ/K9por2UHuKHDvaF6
	9BQ2LIHVBQgy7D3cSE33iwNOt9WuFCTyDMwFm/+OUZUH5BrpMI50xpXYMVBF+R/w5y0J2xRXDrg
	62Dq2s9htFUmMMCMhoXGZ/QAY2QFiyXkWQtDV4GPrNR3WgwkmvqL31sEE4vzzT2vFP3zJIRRSOf
	1bEGu1mR50Pn31zlWLhCageaeBF73HwiCHpqmEajnymSMiA3cJVUZ9UH+b4QJClff8US7Ib2Kqx
	mh/qBghAOhXjU+lA7STMrXc6k5U+XQMsZ3Mcdx8zNPpO3kmsBg9V9rt1TXLPfJBmSsjgblcQUbH
	ka4CBn/t9wriUsICGHk=
X-Received: by 2002:a17:903:41c3:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2cfa6c5de50mr1064765ad.25.1784746186525;
        Wed, 22 Jul 2026 11:49:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm11115841eec.26.2026.07.22.11.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 11:49:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/5] librice: fix rice-proto.h lookup by not sysroot-rewriting internal .pc
Date: Wed, 22 Jul 2026 11:49:37 -0700
Message-ID: <20260722184939.495321-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722184939.495321-1-khem.raj@oss.qualcomm.com>
References: <20260722184939.495321-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 18:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128410

do_compile panicked in rice-c/build.rs:

  thread 'main' panicked at rice-c/build.rs:101:
  Could not find rice-proto.h header

rice-c/build.rs builds the internal rice-proto C library in-tree via
"cargo cinstall --prefix <OUT_DIR>/rice-proto-cbuild" and then locates
it through system-deps + pkg-config. The generated rice-proto.pc carries
an absolute prefix pointing into the in-build OUT_DIR. pkgconfig.bbclass
exports PKG_CONFIG_SYSROOT_DIR=${STAGING_DIR_HOST}, and pkgconf prepends
that sysroot onto the already-absolute prefix, yielding a doubled,
non-existent include path (recipe-sysroot/<abs-build-path>/include/rice).
The header search then fails. The internal lib is never staged in the
sysroot, so sysroot rewriting must not be applied to its .pc.

Clear PKG_CONFIG_SYSROOT_DIR so the internal prefix is used verbatim.
openssl-sys is the only other pkg-config consumer in the crate graph and
would break without the sysroot, so point it at the target openssl
directly via OPENSSL_LIB_DIR/OPENSSL_INCLUDE_DIR (openssl-sys returns
those and skips its pkg-config probe when both are set). Verified a clean
build: rice-proto.h is found and librice-proto/librice-io plus the header
are packaged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/librice/librice_0.4.3.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-oe/recipes-support/librice/librice_0.4.3.bb b/meta-oe/recipes-support/librice/librice_0.4.3.bb
index b479bc73f4..926244d780 100644
--- a/meta-oe/recipes-support/librice/librice_0.4.3.bb
+++ b/meta-oe/recipes-support/librice/librice_0.4.3.bb
@@ -15,3 +15,19 @@ require ${PN}-crates.inc
 CARGO_BUILD_FLAGS += " --workspace"

 export LIBCLANG_PATH = "${STAGING_LIBDIR_NATIVE}/libclang.so"
+
+# rice-c/build.rs builds the internal rice-proto C library in-tree (via
+# "cargo cinstall") and then locates it through system-deps + pkg-config.
+# The generated rice-proto.pc carries an absolute prefix pointing at the
+# in-build OUT_DIR (.../rice-c-<hash>/out/rice-proto-cbuild). pkgconf prepends
+# PKG_CONFIG_SYSROOT_DIR (=recipe-sysroot) to that already-absolute prefix,
+# producing a doubled, non-existent include path and making build.rs panic
+# with "Could not find rice-proto.h header". The internal lib is not staged in
+# the sysroot, so no sysroot rewriting must be applied to its .pc file.
+# Clear PKG_CONFIG_SYSROOT_DIR for the build so the internal prefix is used
+# verbatim. openssl-sys is the only other pkg-config consumer here, so feed it
+# the sysroot openssl explicitly (this bypasses its pkg-config probe entirely,
+# see openssl-sys find_normal.rs) to keep it pointed at the target sysroot.
+export PKG_CONFIG_SYSROOT_DIR = ""
+export OPENSSL_LIB_DIR = "${STAGING_LIBDIR}"
+export OPENSSL_INCLUDE_DIR = "${STAGING_INCDIR}"

