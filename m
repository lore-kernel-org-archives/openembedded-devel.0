Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD634E65D18
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 18:59:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.53514.1732388340871306822
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 10:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aNvb4Mc4;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so28247595e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 10:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732388339; x=1732993139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9M7sO5E+9RyE7xP9lbjAFJYpFza7Z0YKFmjOaA4VhA=;
        b=aNvb4Mc4kQmhXU1Kii0bXGzmJwX/XqYWSLPTvhFAOoJyklP6L1QJUIvP0YoyipsBvG
         TkiVb/IGKLwjybgYWASo2yCzirx770DXZ3YG9gzdZONkL8mIDolbbv3nH3S+As5Le+iY
         iZz1Uup4SL6+EcDmy+H91ZvSsiIMDCaESPRhpaxvBUNne3bGw2uCgQLF6tv4GHRnFnMc
         rZchfj9gI+kGZ61AwZO8QTLTod9RJ2+MKfb2GxVxrmpZwIpns0ESVCK4oeYNMzDIb+F2
         4E78qXHk5Ndrbg87OyN5kEgw2lnfauprBixpj5KQCDPzZ2wb31viIyNUu8F38EZMI0E9
         w50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732388339; x=1732993139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9M7sO5E+9RyE7xP9lbjAFJYpFza7Z0YKFmjOaA4VhA=;
        b=c6U9RpiFiSfrDkllUk7nnmZTlOgbueF2DMkSD6L8HBwWWP/QoKrgqaaNBDRyOd6SNH
         yk7eG3EQqZmhH7hX5RI0nUo2DH1unw+9A6HQ5q2Zk1HmqoBVTwqdFYT79Znwkar9mHoV
         rFVWwV9Xvx5X1GAaWu+xhJfKIxLwKDlb4dNLm4CMLk4PkM/Ow+fmPuIGZt3zdkajZcDK
         1o0u51MjeWOvTyhST06f4Tj6Rx6+gEGxvFFOx8SKwmwLNxl9diroL8GwLRe08sjndtLn
         6rdfhufa2y7zlB/k3ra5Y9KsgVsKT5e4eaAFqIBrc86/HUYHGeESZG+SyRODrDL6KzgV
         6hQA==
X-Gm-Message-State: AOJu0YxljBrxuBUajr0lRNp+fWIP/bAhbLLlT9kgzV26eAKVYJXQ8Hl+
	Uo2THiP1sQv02MS5tYw+NBRrnsDAocYYkC2AjxnCyH9HA4tO9zngIoC+3g==
X-Gm-Gg: ASbGncsnAKKUcgDMHWsm1OBUQQ5inMPydiRAyK5mGY6wpfPbqoTYn3PL3GA87KkDSes
	C4IlVMiLV3HpgVTeiKtCKT80+BbmXpIG8Z7peAPwvG0BC4wabZaUKU9ufgMuBRrqq/hUdHIelFB
	B9Yddv2CIu3BL5U4yduFOBGBdqkJQ/dJFCe+aF79tAFb8WVoYG0zICZcov7Lez6IHr8WaAc7yJj
	Va1q8sJ3K01tXsmRflQzApNNLiklbh/JAUZp8vqWvME9lBkfR6dl3GqSHf2GAXlayVm0gsf2D8q
	uNO83AM=
X-Google-Smtp-Source: AGHT+IGPrmXPVA6jmdcQHqeNnpXeEUpm4xspKPtIANoC+R0Q59ih26ijYP+GjQhx9iZChIA99WgPYg==
X-Received: by 2002:a05:6000:144c:b0:382:4f4e:1cd4 with SMTP id ffacd0b85a97d-38260bcf97dmr5893018f8f.42.1732388338894;
        Sat, 23 Nov 2024 10:58:58 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde97ed4sm68778975e9.39.2024.11.23.10.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 10:58:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] nodejs: backport a patch to fix build with icu-76
Date: Sat, 23 Nov 2024 19:58:54 +0100
Message-ID: <20241123185854.2332152-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114018

* icu was upgraded in oe-core in:
  https://git.openembedded.org/openembedded-core/commit/?id=ef2bd18dd1db7e5f01db76889933bfdbb5415aaf
  nodejs is now failing to link:

TOPDIR/BUILD/hosttools/ld: nodejs/22.11.0/node-v22.11.0/out/Release/obj.host/gen-regexp-special-case/deps/v8/src/regexp/gen-regexp-special-case.o: in function `v8::internal::PrintSet(std::basic_ofstream<char, std::char_traits<char> >&, char const*, icu_76::UnicodeSet const&)':
gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7610UnicodeSetE+0x8b): undefined reference to `icu_76::UnicodeSet::getRangeStart(int) const'
TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7610UnicodeSetE+0xb6): undefined reference to `icu_76::UnicodeSet::getRangeEnd(int) const'
TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7610UnicodeSetE+0xdf): undefined reference to `icu_76::UnicodeSet::getRangeCount() const'
TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7610UnicodeSetE+0xed): undefined reference to `icu_76::UnicodeSet::getRangeStart(int) const'
TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7610UnicodeSetE+0xfa): undefined reference to `icu_76::UnicodeSet::getRangeEnd(int) const'
TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7610UnicodeSetE+0x121): undefined reference to `icu_76::UnicodeSet::getRangeStart(int) const'
TOPDIR/BUILD/hosttools/ld: nodejs/22.11.0/node-v22.11.0/out/Release/obj.host/gen-regexp-special-case/deps/v8/src/regexp/gen-regexp-special-case.o: in function `v8::internal::PrintSpecial(std::basic_ofstream<char, std::char_traits<char> >&)':
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x43): undefined reference to `icu_76::UnicodeSet::UnicodeSet()'
TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x59): undefined reference to `icu_76::UnicodeSet::UnicodeSet()'
...

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../nodejs/nodejs/fix-build-with-icu-76.patch | 29 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_22.11.0.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch
new file mode 100644
index 0000000000..e8501bcdbe
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch
@@ -0,0 +1,29 @@
+From 54299ac3a3d4e4520b8604dce43c2584092ccde2 Mon Sep 17 00:00:00 2001
+From: Michael Cho <michael@michaelcho.dev>
+Date: Sun, 27 Oct 2024 10:08:07 -0400
+Subject: [PATCH] build: fix building with system icu 76
+
+ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no longer
+add `icu-uc` when linking to shared libraries. This results in undefined
+symbols/references when trying to build with system ICU 76.
+
+[^1]: unicode-org/icu@199bc82
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/81517faceac86497b3c8717837f491aa29a5e0f9]
+---
+ configure.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.py b/configure.py
+index a5f47af1748903..a4e210261e2e76 100755
+--- a/configure.py
++++ b/configure.py
+@@ -1879,7 +1879,7 @@ def icu_download(path):
+   elif with_intl == 'system-icu':
+     # ICU from pkg-config.
+     o['variables']['v8_enable_i18n_support'] = 1
+-    pkgicu = pkg_config('icu-i18n')
++    pkgicu = pkg_config(['icu-i18n', 'icu-uc'])
+     if not pkgicu[0]:
+       error('''Could not load pkg-config data for "icu-i18n".
+        See above errors or the README.md.''')
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
index 49a5f350d9..8cbf539789 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-deps-disable-io_uring-support-in-libuv.patch \
            file://0001-positional-args.patch \
            file://0001-custom-env.patch \
+           file://fix-build-with-icu-76.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \
-- 
2.47.0


