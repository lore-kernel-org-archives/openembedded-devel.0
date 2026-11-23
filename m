Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48043.1795411875075403301
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cPBhefnU;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38644aedba1so4171530eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411874; x=1796016674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zvy9Nasbo/i0Bugk+fICP6/Y92gSTYCuJw3XRlB2yYs=;
        b=cPBhefnU+li4sSgbVqj6ZNO3dsaCu4A79WDsaA1cQwB7qEc4h8vQvTzvDJe/ratXOV
         Iwx2d410auACXecuD5cU4/aKnmprvz71EfFPqJ8MzdSGl6hbc7XX1w0BW3xwA25nIUsd
         b1WEQUzhAOdT0MXScS6iz2sZhUYvv0UoJyGHKWAOqiiXvC3Sf9RgU6kx/Qlw/4T/tEJU
         YAnS/HJaR/X4aJj5NQ7i0g2FDvSm0WF0kHxDwwxoWj5Zh0SEbUCwk1s9NFFzlHj66LVZ
         gI05s9ewfKYKgR7pStUYApu99HPhVd41+OXHQK3MzY/V+JWI8pr3hPCmikz+Cs2V16lx
         3exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411874; x=1796016674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zvy9Nasbo/i0Bugk+fICP6/Y92gSTYCuJw3XRlB2yYs=;
        b=W63to+vimRhfFoH4U+in9cvccjCP47uNE2ogWgf30ZZsDXgjJJCDBAWI7wrjIH2EmF
         QUqGtDh8T34N4CGYiJxNMHLjTaGL0+jake5MVJcw8MdWqVzY61dV/Jh362GN99x3iM6j
         aH8H+kINuQeQbzoNiaOTXQlnDtZsdVqdc5qFyKTFt8jTYSOYac2U2NjArkLpHUmifc+Y
         cFo7oBn20ekMnB+C23bB5gEq7tadW7A02qQm9JkEwOM2by2JmmHiWY9OltOVGa2TpXYJ
         eZEYsUa3K93r5oDki6zGONc2/t4Bw9akELobUuN1ZnBOXIYT7Y0OZtuPyRMfgTq9d/YO
         uz+Q==
X-Gm-Message-State: APuU4Z82GNzEY+EdGc6on/ScX/bQtCmN7LfMNaCveo/0MAihGxlyG6Nq
	nb58MwRH6T5wfR83BXidDtJWcdRECFu654b8IZXvAFQYs9qO6+G2INha0xxt7/ig+iE=
X-Gm-Gg: AZFdTZf6oR7ybw2RjY69aZD1zNzgaVlAUJ1ryVYM14KNZZPMPtUo+KZwHPNALhoAJip
	JOrA7o+RAFzFsWoRusdtKDKEWC0nvAhXLawCuYFi9cpqWUXXaG0h89wOHPxNx+0ZnNCN2UJ3DuR
	/bbl3k95wMdm6v/jJrm57gRou7zGA4X6PRve7M+j9O9bK4FzsDfIpYCOd/YguEaYUx2euTufdtc
	lwdy+GgTxhUxarVpcmFS9SYFz06Ktawor54n7jgG4/0ELWsURpVAiLTk1+lYcYvPphlduGNycZk
	IqltOw0QVahYeFTICv7yHAl0QJLSALvmD7jaq3ocQC+2bqWLN03OCCXQWsEeRx91iuofAFcgSeI
	TbFj76DSwZ0+LsBVfF7t1ge4oCYILwMQfu/k08vowOgifnykzn/iNwo091GdGMNLjRcgguCgp2G
	VTqyg/VOl0fCPwV8UDq7XWcSgieX5EYe4DbWEuwbF0d0v1COjahdnBhMtqQuI54DgSWkLEYVAqV
	tu0pS8qwq0TK9DxrUCQhE+gz5CcqdgcFv/eeNrK9eHFAh6PTVkk7tMNV7t3GhromB3q/vt8SV1m
	isOYP8LDolMtH2vKwHsQhysc0OadBrRaCPY24V5pK+ajoHVwJ0B5g4M+3GKUYUmRa7w2L93N8c0
	e6ldy9vkdtUsS8qVqHAt21Rrj+mpAtudsvSUhhWqTjNOMODaV2egsxH4XNJmCJNOhsRpBU0rdYH
	N5eeFAFd88h9u0w5vTabavUjEofKQDYVgmwNOIOYO3ltIPL+HL4uzCf+gh0J44wbBldoUKdZ6R7
	IIzfkZ7dRRlrccIuRvKxYXmobJzPr15Zf136OfJ3WO88T0fhY+ouSMycpfJnY7IKlIw6fRdyqua
	kUUk
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr11644856eec.19.1795411874351;
        Sun, 22 Nov 2026 21:31:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 36/42] udisks2: upgrade 2.11.2 -> 2.12.0
Date: Sun, 22 Nov 2026 21:29:20 -0800
Message-ID: <20261123052953.3658549-64-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132851
Content-Type: text/plain; charset="utf-8"

- Setting up loop devices now always requires polkit authorization
- Encrypted.Unlock() gains a 'discard' option and honours crypttab
  read-only/discard; Filesystem.Mount() 'as-user' always checks the
  real caller
- New udisksctl drive-set-standby command; NVMe capacity derived from
  namespaces when TNVMCAP is missing; NVMe subsystem tracking
- Missing polkit checks added for RestoreEncryptedHeader() and
  HeaderBackup(); many TOCTOU, leak and NULL-dereference fixes

2.12.0 is tagged on master, there is no 2.12.x branch. The COPYING
change is only the copyright year.

License-Update: copyright year updated in COPYING
AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../udisks/{udisks2_2.11.2.bb => udisks2_2.12.0.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/udisks/{udisks2_2.11.2.bb => udisks2_2.12.0.bb} (87%)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.11.2.bb b/meta-oe/recipes-support/udisks/udisks2_2.12.0.bb
similarity index 87%
rename from meta-oe/recipes-support/udisks/udisks2_2.11.2.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.12.0.bb
index 5cf6431154..ddeff141c1 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.11.2.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.12.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
 LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1c2da9358c6aacac4e4fbf1cb106cc1d"
 
 DEPENDS = " \
     glib-2.0-native \
@@ -18,10 +18,10 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 RDEPENDS:${PN} = "acl"
 
 SRC_URI = " \
-    git://github.com/storaged-project/udisks.git;branch=2.11.x-branch;protocol=https \
+    git://github.com/storaged-project/udisks.git;branch=master;protocol=https \
     file://0001-Makefile.am-Dont-include-buildpath.patch \
 "
-SRCREV = "caffebe56d8208365cf0d62e0d05d31260d91156"
+SRCREV = "a0c93953d483f259164fb284d03691f11fe28009"
 
 CVE_PRODUCT = "udisks"
 
