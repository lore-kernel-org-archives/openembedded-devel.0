Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D041093184
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:02:06 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18034.1774026123911169364
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zef977Ni;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c10a2e2cd1so2403539eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774026123; x=1774630923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xglr9hEPQlXvHNYwM5gEVgr7AEhK44bncUSFoTEiTqA=;
        b=Zef977Ni9n8YX4izEqJt27EMQPr3zbmWn8NTMJ2ycq7OYnzaSsCWn7TNcH+pLj5h5u
         fLhyr16hOqTyq3rGhdPwSiaNkWziC9bKbYTayYU0T2srrBg0W0PRmJqbJA3Y433t0bPE
         51zR+i6aaT7txC59v2B9uqSTBXzL5r0MSf+tDyowd4wyOpfmdxpVWNTwy5KTrM+xoP72
         hyNqb0lXvJeZMJ7xB8XTLcAIEH+hpf2rfdrg1XCJmy4/mCwN399keY5mNIFlJFrpYtFq
         AfdPC5U/kpWT9xWVSJcG6zr4B0+QTD8TlvL0sibJntmvPjyb5KG12j6OdGaE6/lxgjkU
         Y93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026123; x=1774630923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xglr9hEPQlXvHNYwM5gEVgr7AEhK44bncUSFoTEiTqA=;
        b=I0MZDUnqzOSBrnrCnBEffks1bmbbSXX0I4HQULqI0QujvPojtU5LHc7W0m9kOW4Hze
         DvslFFh+DUKjmIr7Z8iM0scqXa7dislE2nT0D9x4Nem3PWXI/SN+EiCBIMbG+yY9dxA3
         CIDqdxW1Tv+/tX+bWz9yo6Bp3a4GTFb3u+lbbDcQp+lcZw+h5cnS9bx4S4wH0PEWB1rJ
         BDMVvy0GNHVnmmu667jgk/sD4Ec8seTXZmGKxsCLjLTcyhvyIrrgBAMcx1P1a/kr3uDx
         yL9Brv0QRy5IyJL5XuyNW4RuhKvXQoV1wZv9QJ1T/ARdVARYS7V4LFZJksFAXuKT+AQi
         /uKA==
X-Gm-Message-State: AOJu0YyUeDXjAf28+55FdE/6ixg8RJBK0UQR8NzgbkIDoAPkarn5DgnE
	VY7UgZBh+Q8u8h8ftVQ6VgWerZFv0nVip6I63cQbp/70H0pOO5qSVWJosSXiR9Vw
X-Gm-Gg: ATEYQzxUrwSowkZLaO0Sh6+L3Y+aHd+ANQtylhtAej4y3OVRNFrf5sRd+e19TaBsq7J
	JNt6lDfaou3uhilH65EZAHvrouGOXZRi8Eooh4CF1JnOkmfEXh72kGpvoGQqP7H3cn855OZJvvi
	N0lZThSUXQCtphUQiSbLJROsn2/uhHnBs2Xm1v9XzxSpE1+YY2+CveU8e6Ih8lFH8XRvTlCDwig
	SGrX2IVbxohKeqiC67kygBt5TpI4o05NyKetMblioZSATR7M3hxIHuf8gv6PKy2/DDNAKYqYaTK
	kBkhltqr+PWvSA2FFvWbntZfEWUQQ0a5a+N5Wxb486nj2UtAWaSRchy7Y9dPKrhR/AKtQrgdWe1
	B36Z7Uv7eAEgX+wLQG6F4d3WnykqZJRE4/O3omNGe4OiQE8Hg8azKFZERIV9OxTnyrmkXGkmySn
	3GSaGSbLGv7ACBZfwOC98LUJIwQ79stsaHXKV7yDuryyXst/o78MROGyqWVNwXFT4aW83jicM6M
	+7Od/GHp6r5B3p7J6tT6fx9oI7lyx6BK2l/R/2Y+Ac4u2YmcJ13was3JFpm
X-Received: by 2002:a05:7301:6093:b0:2ba:a1a5:b5b1 with SMTP id 5a478bee46e88-2c109584b61mr1888598eec.7.1774026122549;
        Fri, 20 Mar 2026 10:02:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm5148632eec.5.2026.03.20.10.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:02:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/8] libgedit-gfls: Add recipe
Date: Fri, 20 Mar 2026 10:01:51 -0700
Message-ID: <20260320170155.1413929-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 17:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125445

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/gedit/libgedit-gfls_0.3.1.bb   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb
new file mode 100644
index 0000000000..8b64661733
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Gedit Technology - File loading and saving"
+SECTION = "gnome"
+LICENSE = "LGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSES/LGPL-3.0-or-later.txt;md5=c51d3eef3be114124d11349ca0d7e117"
+
+DEPENDS = "glib-2.0 gtk+3"
+
+inherit gobject-introspection features_check gtk-doc gnomebase
+
+SRC_URI = "git://gitlab.gnome.org/World/gedit/libgedit-gfls.git;branch=main;protocol=https"
+SRCREV = "0a0c8dd29ae2f9f4a99cbaaf1628d2352953e0bc"
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+GIR_MESON_OPTION = "gobject_introspection"
+GTKDOC_MESON_OPTION = "gtk_doc"

