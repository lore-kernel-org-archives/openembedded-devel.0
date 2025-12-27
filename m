Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1C3E8FDD0
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 06:56:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4681.1766818606588448357
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 22:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q0A1slgX;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so4502296f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 22:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766818605; x=1767423405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDQqdyuOVlpA2FQPLyMc33isxZlVcmwO5goXcExAXUs=;
        b=Q0A1slgXQ7XLIma/8wu7iJVzX0BiDl3gso4cKPY4QiMC+5lPf/nWFUQJcurP9DX2pr
         9ONW2F6yatTe0y1F+6z/bf826+HFrU7L+okEJ8oossMC0bU5qM2UjNm8C8SmsFFIT7Ie
         TJJsdkRVSQ0uTQ0ao31q8JsGHCHWmkvEvXeZ2OHSfoFrI6W7zevZvH0GQodUdbcTiAKg
         /N8+mGcO4jp0KBM/umW0XnsjFY5LkB2/zaKzRNhc9q4iBz6Sk+jHqBzo21CAz0DNdDi7
         y1gzoikGz5wmw11JbWCuiWZuTtd9xwCbvwTi1djp4/xO8WEUsj9uMcx84/IhY0tm9RHy
         BMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766818605; x=1767423405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CDQqdyuOVlpA2FQPLyMc33isxZlVcmwO5goXcExAXUs=;
        b=He7uIX9Z6tSAVbcnlMay+oxTKEsk4CUOLaVZTRgyA5CP5Eax2+WYgS5V3Wz0Hzt6+O
         Mr3Kzx1YObRqgpqHopVhOmQARUnQydJoocDbjL1B1GNlK//x2jKGJD4RUhdLS01IPcVX
         RUJPQJeQwgt/nAHZDCMkaGC7h3L7dXw/xpPz3owfmsbSLt79SRvxcA9VLi2KWbZT4HDz
         rAgYk3XCOFkHgDA7JXO2DxrTdnfGWK/6EZdJqdSLt5pv3U4qOaQTNJys1AUy3JtbdSbp
         gzieyvZEBUmyI0ea5Qbyy6pLeSA7273o7rUcBxdZGBrA4HCy11q9ddpa7nnxESOozLRx
         iUYg==
X-Gm-Message-State: AOJu0YzgGe4y06NI+jKO28axsPfmEGYR+xzpV28aF9FEtxj0Rk8z4kJe
	aL1seHKZvwf0h7QHQHCjj3RQ7ieaP4K6DeNkx828YW+gD/EOK0RuFNLXJ/yUdA==
X-Gm-Gg: AY/fxX46QdtdbGEPWMlZ9GfETjTsK65xu9ArR9mxswrJtSK3WgUSO4aNJ3xvjBGApZ7
	mk65MTmmpFbXkLfiUyRvc92YlrL5HMODmeEMWI9Wl/7joP753sPXp8oQA1Sb6KGzDW89HmVYPEM
	8IUe1jsnBp5Pjs9zabfPPPwrW98ivVW5Hnky3y6FqGHBDc2jbGN2fccALzJIKoegjx2WHG4qalR
	dQBGKaZXbkvwXM1TiupDnABN/fA3ocmdR48odpcgrid+6zr5DHbUnSbfQfGw89CkzREGhU4cuAP
	3xyOcXCfxHO1yQIuchDN0w2Uma52eafNqzCQmR1AFvoI9M+Kop87/Td+GjzCqZVUXE3jszB0ibD
	owhQHJCU6glSaTSjc3NDNIGtuq/YmiWqY0pFtNr4jCx50uUUzyyPE6iWZV0exrivZUI+J+PRSTb
	sEph4un+9w
X-Google-Smtp-Source: AGHT+IHvuY6mNjXMBVmlUihZ9d+lXXvyAnMHj2ZN17UQlwLTMbr8Hrq9iYPIfgDzeDdIcWfqmHVztg==
X-Received: by 2002:a05:6000:604:b0:430:7d4c:3dbc with SMTP id ffacd0b85a97d-4324e50b175mr32484359f8f.53.1766818604852;
        Fri, 26 Dec 2025 22:56:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm48902371f8f.31.2025.12.26.22.56.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 22:56:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/6] tigervnc: compare vendored xserver version to oe-core's xserver
Date: Sat, 27 Dec 2025 07:56:36 +0100
Message-ID: <20251227065636.3144581-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227065636.3144581-1-skandigraun@gmail.com>
References: <20251227065636.3144581-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122949

TigerVNC compiles its own xserver from a separate tarball, it doesn't
use oe-core's xserver for most of the compilation.

The vendored xserver code should be still kept in sync with oe-core
to minimize incompatibilities, feature and bug-discrepepancies (...)

However it is easy to miss when xserver is updated in oe-core, TigerVNC's
xserver gets out of sync frequently.

This change adds a small check before do_configure that compares the
vendored and oe-core's xserver version, and issues a warning if
TigerVNC recipe needs to be synced to oe-core.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index 53832939e1..dd4957fe6e 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -44,6 +44,16 @@ do_patch_xserver () {
     patch -p1 -b --suffix .vnc --directory ${XSERVER_SOURCE_DIR} <${S}/unix/xserver21.patch
 }
 
+# It is very easy to miss xserver updates in oe-core, and this recipe's xserver
+# gets out of sync due to this. Hopefully this warning will help.
+do_configure[prefuncs] += "do_verify_xserver_version"
+do_verify_xserver_version() {
+    OE_CORE_XSERVER_VERSION=$(pkg-config --modversion xorg-server)
+    if [ "$OE_CORE_XSERVER_VERSION" != "${XORG_PV}" ]; then
+        bbwarn "TigerVNC xorg-server version (${XORG_PV}) is different from oe-core's xorg-xserver version ($OE_CORE_XSERVER_VERSION)"
+    fi
+}
+
 EXTRA_OECONF = "--disable-xorg --disable-xnest --disable-xvfb \
         --disable-xwin --disable-xephyr --disable-kdrive --with-pic \
         --disable-static --disable-xinerama \

