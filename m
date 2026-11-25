Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37929.1795594070372762094
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0g66VZvS;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so10923962eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594070; x=1796198870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JWoer/PlOxrXrtE+uW+RP/mljaUtzoNWAW88crQl9M=;
        b=0g66VZvSRKE1XGzeUE07i2zaV1pp9LT99I/MRx9op/KZ0dS/5HpSLKobPLT3UxzUjY
         W+n6VIvz6NPyaej1AIg5mvpevwcb84aD8y/qsRL6tcPX2VqoAtK810PXz/0tJTIPknz8
         LRSPjLr91c+BPGbrBBNDjVS8XNN8hsUg5YNeigSS89YG+Z9HcNTojIuUf60LSmytjfFY
         8o6GHtnyfQ4YVmX4hCSD0QhJcUtGXuzDv91t9TjVtV6aP90qZPtK7srhGaVydpra1O2k
         jG9xB1Qt8tmepJvFC7xQM3ZH0paSkExPeYOq8c6zYHj34AmJLxTe7dhXLsYz7y/NiKlk
         mZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594070; x=1796198870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5JWoer/PlOxrXrtE+uW+RP/mljaUtzoNWAW88crQl9M=;
        b=lnq/8Ibgca8hFIsAW6EMSGvVk48h/2sVrBQqQoeXFFZTNmL4DQKS2Qa67AlJvla66Y
         BfJVyvJKUZuiMqXvKmqjr8yb0bMZh6qmjh/cQbFiEu0pGqvmZC0VygUefzW9821kKl18
         yefz5BVHTV/ZSPnorPzUnmIDWegNDKm+amgp8BgWaAUdru6xcDvniQEKD7ln6eOrWX1H
         wNZBIf/zj/k00eM0adI+H69LesronxPk0MPCnvPTBix3dB0OBeGoQbxoBzBHRZXcn80f
         R2xgjD3ndQl7MBXCr1I3rBkOyIA1QiUVcVjvGL4afvBwtf7qnKWsirO+QzDrC2j91qwz
         TBig==
X-Gm-Message-State: APuU4Z/L2ftGZY3g85tHwu3ptMxQ4uKcQQQgCJ7Ehb1mF1ZuCsmi1Mzk
	gnjs5gBc6x8xFWjF4n6rYVKr7vq2+b5PLObv7Zl3RiR2A3J2+DLTvNUXWKxYv28x
X-Gm-Gg: AZFdTZc3tq59R288UotIYRS0qlgyGSsoKH6A/Ked1B/I+TA1TO1bI/YStPDq3B1mJhi
	4FqgwZmsDkXsyQ1VWmrpilzn2qe2h0Zi4vF8lyP2Q43jwtD79a7uDWBJ4Fv8mFOj8aOQlDNtqrE
	ncZONsVji9FufkBo0nLMFVWwJIj5aWcrUTo9WT9YJ1I0TgVBbjQ3Kd08HuLNRS53rDMM2veUzpx
	87cfohwv2M6jevFADcvLUHRBBSJrXNxNnBueKba25eFbDxL3xcZfNl98UXz8oVlosUV+zEMAmRD
	9HxGuHkJ8fe9lCwZyJqqJ64wvaSjcGz6jylzVt9Kxv48kO4361OTGTS4KOLzuyOsyU3QuWhYb4z
	I7UncedLJkrZ0VV4ljr4gp4VWRZfbzqPT/zc+Dnc+aGj4OHuhR9SazP6uJN7rGv3EuZbi5aOHl7
	TrXyY+ef5e87wyceqMeytkJYRsBQ5tk/D4v6mzjkcaS/MuWNhCJGTeYEggwIAsmdzEleYfxZ6Xk
	XlQ3uUpwrFsodZyUUcxq0GeObABkdRE0Y0NN1ZPxRu/aNBiCFITJGSYg9PXEcvFON5mOHogTU6Y
	xJWz0opjbVlel94/pTW8/ES3VLjv61Kg0KGnHiriDY/nwS6PwCyMRXkZ7XmJmgFyHbREz2HMViG
	KdJNaubUap1gl2Z3vW9lnXLg+quhqcd38pEUpUsbQdzxLm0guMu+Yz45G8G8JBnOLeuKWY9JiXo
	6UTnlre1C2HOu0MsgNjDfXJFb0VCB4x2pVGEGMhwr29P2Xm4SfBHWtrf90ULbmD/cnxNROydsPR
	4AYl6SEngG+3pFI3fiMc/GVBX4aTuphhnEF1S6+CHQqrbgi97tASNuz+9uB5mNnK+SldBR1C3tj
	8z5j
X-Received: by 2002:a05:693c:8209:b0:383:e7af:c28d with SMTP id 5a478bee46e88-3856f14d5b2mr17842890eec.9.1795594069654;
        Wed, 25 Nov 2026 00:07:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/55] snapper: upgrade 0.13.1 -> 0.13.2
Date: Wed, 25 Nov 2026 00:06:20 -0800
Message-ID: <20261125080732.2419614-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133007
Content-Type: text/plain; charset="utf-8"

- Add snapper-sync script and service to synchronize the highest
  snapshot number, and allow disabling all-time unique snapshot numbers
- snbk: new meta-parse command validates info.xml checksums using
  libcrypto, so OpenSSL is now a build dependency; libsnapper soversion
  bumped to 8.2.0
- Improve error handling when snapperd is disconnected from D-Bus or the
  client uid cannot be detected; service files now depend on dbus
- Fix LVM device name parsing with escaped hyphens, CRLF handling in
  config files and a memory leak on error paths
- Hardening: validate STOMP content-length before reading frames,
  validate unsigned JSON config values in the zypp plugin, handle NULL
  D-Bus connections in pam_snapper

Add openssl to DEPENDS for the libcrypto check, and point CAT_BIN at the
target cat, which the new snbk tool would otherwise take from the build
host. Add an upstream check that skips the yast-snapper tags in the same
repository.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../snapper/{snapper_0.13.1.bb => snapper_0.13.2.bb}   | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/snapper/{snapper_0.13.1.bb => snapper_0.13.2.bb} (86%)

diff --git a/meta-oe/recipes-support/snapper/snapper_0.13.1.bb b/meta-oe/recipes-support/snapper/snapper_0.13.2.bb
similarity index 86%
rename from meta-oe/recipes-support/snapper/snapper_0.13.1.bb
rename to meta-oe/recipes-support/snapper/snapper_0.13.2.bb
index aa8547b33d..920a4fb274 100644
--- a/meta-oe/recipes-support/snapper/snapper_0.13.1.bb
+++ b/meta-oe/recipes-support/snapper/snapper_0.13.2.bb
@@ -3,13 +3,16 @@ HOMEPAGE = "https://github.com/openSUSE/snapper"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "acl boost btrfs-tools dbus e2fsprogs json-c libxml2 lvm2 ncurses zlib"
+DEPENDS = "acl boost btrfs-tools dbus e2fsprogs json-c libxml2 lvm2 ncurses openssl zlib"
 
 # Build separation is slightly broken
 inherit autotools-brokensep pkgconfig gettext manpages
 
-SRC_URI = "git://github.com/openSUSE/snapper.git;protocol=https;branch=master"
-SRCREV = "8cfc33817b91dbf7194d7fd043dc378026d01db5"
+SRC_URI = "git://github.com/openSUSE/snapper.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "43475845a712bc2327cec2ed641063df406705de"
+
+# The repository also carries yast-snapper tags
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 EXTRA_OECONF += "--disable-zypp"
 
@@ -24,6 +27,7 @@ export RM_BIN = "${bindir}/rm"
 export RMDIR_BIN = "${bindir}/rmdir"
 export MKDIR_BIN = "${bindir}/mkdir"
 export TOUCH_BIN = "${bindir}/touch"
+export CAT_BIN = "${bindir}/cat"
 export CP_BIN = "${bindir}/cp"
 export REALPATH_BIN = "${bindir}/realpath"
 export SHA256SUM_BIN = "${bindir}/sha256sum"
