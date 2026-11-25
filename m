Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37942.1795594106174615293
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gDtlOUF6;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3869f03af6aso4706698eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594105; x=1796198905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GR51Uhjy1EPAN30+lN8P9iTIF/XqUjcZ/Vv0lucFXCk=;
        b=gDtlOUF6a2KQksXkjhSomeeYFJSUz3QYCQULGxE/KKyDgPaKWkjD6Vzjant9oA1CmD
         G6hvr+MW3/isDTDSBCf/ojnRe1v6Pw9Aqn+ilqIBN6EU7mCKGBwOIrjYRqvVcFkaeylh
         cWNG8E92uZBzch4F5gXBCwV5GBDZbiRsW7RqBZdRU7gXebogGeXpTnTNaRNRAeJ0dWsV
         rMKgP3u4EEcnsGpQyT/tmCDoLLPH4JIoU8S4rjc68rgXk9/8zecuk4Ewf9fnkXdi5sBE
         m++mpUPHmbklSDKu6oL2lsfOxuB5NlwFEj4fnpwLF8SBwicb3Uh6CCQtLm6U+H3Lt8FR
         GKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594105; x=1796198905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GR51Uhjy1EPAN30+lN8P9iTIF/XqUjcZ/Vv0lucFXCk=;
        b=GSKgkvBQcWdzY2NABQK2INQGiZ1NWG/FaYZLD45+MoSyYpYgzIsjT1dZ6I5YojRlvc
         mEEbE549LYL8y5yW6NYycEo88aBP8GzZqexq4qrCoBQ9LQcTwUDh/D/FF5kfm9iEzjM5
         bry8pwvcbmnOgIvUGU/kURokf0WV7tMZKRpqw+sH5d3z7KhXxMxh/SEoskmb2Orisqxz
         q7Rk3EKakJtSuhkCdqLMqD5qKDGYBIMjMkSD0oV3o4HZi81hxJUmetFaeQjnpC1S65Qz
         HoNHi3ZvtI1V8BrUXdxHoKzsGfCBnpYB5dT/ne6ncowpd/sfTfhIcpK1r4SL/t6W9qbf
         jgpA==
X-Gm-Message-State: APuU4Z/jDyeIL5Gxnpr6yNTlwTrqzsbzJOXPNX0U2OcxoVqyaWFu08nr
	xNQY+maZQU0u2618GAGZMNRErGBlB9afgEEi7+iCpfCyhZRy+9zD1AhlBaPR9jJ9
X-Gm-Gg: AZFdTZdXcyP8iRX9l9iDJqlB4kTUsaC+p/dNpgv4u/ehSnG/BXQtdoNbT0/ZQXpNhfo
	JusOK57P+hv/dfeZmsSgZkdElQlVRMuALDCRdsX9XVtHyCn47810g4tzFNfH7RiRtDThKnyztSM
	H+U1zdqRJCNFfjIbm9sLcbCSd8sfq9EQg7a9/ueBfEmZ+IZLbgf0pF5ifHvZsc0pSVvih988BtN
	jeudTS4NovumMS0F3TWqC3RRimBE3yFQ//XjXF95uG00oW//DvTpzGOMtGXNEycQEV0IBWmxQND
	mnTgO4S7mVN32cPU7bTz+ABL2DSCGNypsRIUbCy6pzJ/hyc1xw+xUWJIXEIMLNoRGKcHk2FZVr3
	KY5ZXLlokiVJQWl9FRLx1v4FhB64dQ1N5yFz4riZoWmh02NZ4AyGm3uymU3jdqhnBdbDgUi6Cue
	LdyW5QJWfBcj8agb0DYm3mz9i+W5OMybrH01z+61AlCunDydvsahe0hGzUx598lxc3jovkF+OFe
	l46YHRcguZxLPkncWPtHO1udt6vHZWVdTGqF+kth1XmsCsV6Gtq3sidrYZhDiNn7AUXwoFmodFo
	SCOna2+g2tyAcos1HvZq+JInBTv0lLDfeBDwGbI12cGGEwZl/Qw3CEMafu8ueYgNTMAM5InJ9kR
	gYoA5v3go9JLPsury14SFF9/0dDbmditRdC9QMhxaZMMDkTQBBw+Ayt1c2mNJpmjQXZiVbRvhew
	CrwIQp8j7koOjrVN+A0sZYd6nEhEgWayqfohSBs4IANXuizOUmzOiP1OTfUl6GhuJu+6a2cihMr
	uaWxywGpZn80xF3g4/IfZkVcNqfTe208g0wCe96OAeHe2PUuUKtrDjHslMIK0fd3tYNapBPf/gG
	BeAY
X-Received: by 2002:a05:7301:6782:b0:385:2ea8:aac7 with SMTP id 5a478bee46e88-3852ea8d7d4mr24508067eec.23.1795594105466;
        Wed, 25 Nov 2026 00:08:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 34/55] lua-std-normalize: Add recipe
Date: Wed, 25 Nov 2026 00:06:50 -0800
Message-ID: <20261125080732.2419614-40-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133037
Content-Type: text/plain; charset="utf-8"

std.normalize provides deterministic versions of core Lua functions
across Lua 5.1-5.5 and LuaJIT; 5.1 adds a bit32 library for every
host. luaposix 39 requires std.normalize >= 5.1 at runtime.

It is pure Lua, so install the modules directly and fill in the
version template that luke would otherwise expand.

Add UPSTREAM_CHECK_GITTAGREGEX matching release tags only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../lua-std-normalize_5.1.bb                  | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lua-std-normalize/lua-std-normalize_5.1.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 9158b9acf1..90446efaa0 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -270,6 +270,7 @@ RDEPENDS:packagegroup-meta-oe-devtools = "\
     libxerces-c \
     lshw \
     ltrace \
+    lua-std-normalize \
     luajit \
     luaposix \
     mcpp \
diff --git a/meta-oe/recipes-devtools/lua-std-normalize/lua-std-normalize_5.1.bb b/meta-oe/recipes-devtools/lua-std-normalize/lua-std-normalize_5.1.bb
new file mode 100644
index 0000000000..b764685f3b
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua-std-normalize/lua-std-normalize_5.1.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Normalized Lua functions"
+DESCRIPTION = "std.normalize injects deterministic versions of core Lua \
+functions that do not behave identically across Lua implementations into a \
+module's lexical environment."
+HOMEPAGE = "https://github.com/lua-stdlib/normalize"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=06275ffb1a4a2c92e56a9bd5e3e38b4c"
+
+SRC_URI = "git://github.com/lua-stdlib/normalize.git;protocol=https;branch=release-v${PV};tag=v${PV}"
+SRCREV = "f3e8d7639d62cebe18829f6e1284f9e4faeb78a6"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)*)$"
+
+LUA_VERSION = "5.5"
+
+inherit allarch
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install() {
+    install -d ${D}${datadir}/lua/${LUA_VERSION}/std/normalize
+    install -m 0644 ${S}/lib/std/normalize/init.lua ${S}/lib/std/normalize/_core.lua \
+        ${D}${datadir}/lua/${LUA_VERSION}/std/normalize/
+    sed -e 's|@version@|${PV}|' ${S}/lib/std/normalize/version.lua.in \
+        > ${D}${datadir}/lua/${LUA_VERSION}/std/normalize/version.lua
+}
+
+FILES:${PN} = "${datadir}/lua/${LUA_VERSION}"
+
+RDEPENDS:${PN} = "lua"
