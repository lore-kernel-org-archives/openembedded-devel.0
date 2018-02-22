Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 80C3C786F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 04:29:50 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id x18so2265376pln.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 20:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JxO2N20v331bJC9RrBj1oWOFN9OlncqaiSM0VNb6YAM=;
	b=Rgcy4NR3QRIBsew0Nt5+JcpFj1OticjSKe45D4L6d3fswq47IZFrC6RZfsazuv+4Te
	fXp0fGPD9hkhrTFoAF09kbIcwgtkwpe+XDAUYEu0Be3ofgv5L7Aq8lcsSdwn4r8pKOyG
	5KgRuw7yhUpxrTJgyKR/Es/BTcHq4egrqRtR+fpoecQbLasF2/jdgiA5STfzCi2weqNW
	ha5aXK+IYWdcTfVScORkwtSteW6tgu9TfI91tf+mRAcoBO6MFftqoVxNDqMz2/ibcrYW
	TlDonkjckagWLjDlSV6Z9DU0bVq+kN7TU9NuTFZ4z7ubzfNkK+T906r56SYYsEVU4QFd
	5bSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JxO2N20v331bJC9RrBj1oWOFN9OlncqaiSM0VNb6YAM=;
	b=h/HIK36alcAW2NVLCHwHGBY/F8U9vORkvDGlhseNQSuG4TzByp9tXyFqvmyNs2FBhR
	xIdSpX4w9Pc9b7HgaVjpSOcdKe/MmGSoJc1IK2j65M/EE0kpEkOKTwJeULdvPH+I8bIt
	b0B+fqjxrwAUm8M50l8tn+vG7ikeFInk2dNOjDmyc9+kcdVh/MR8CiSbEE9r/UPttwuY
	77U30y/Pg9e/dOIlIEG5H1n0/+qstKNeix+M34E84B/PUvdOe4Pfr1e/Jpu4fBIwNYbF
	56X0UMKttp7aSvUUhxwFJmMTiAoOZkAJ4DjnnUFkAMh6ki6yihfCqpXgUFTzZqxsyiX1
	Y06g==
X-Gm-Message-State: APf1xPBg480KCu/woUP1IZ+QLvv5WHR4q4PO/GVnR/xqNwh/QTgYMTdU
	/mpAc2Ee8nn3leetMYclhuDE5g==
X-Google-Smtp-Source: AH8x224WP6MiFoQubZPMaUmStcC7CWo9fEds5KUMabbyED0YUAFu/aTXDhMDf63ndFdJDAACDeBOEA==
X-Received: by 2002:a17:902:7f0b:: with SMTP id
	d11-v6mr5485565plm.350.1519273791569; 
	Wed, 21 Feb 2018 20:29:51 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::436d])
	by smtp.gmail.com with ESMTPSA id
	q14sm57548265pgt.53.2018.02.21.20.29.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 20:29:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Feb 2018 20:29:40 -0800
Message-Id: <20180222042940.3770-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180222042940.3770-1-raj.khem@gmail.com>
References: <20180222042940.3770-1-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qtbase: Add packageconfigs for renameat2 and getentropy use
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2018 04:29:50 -0000

These features depend on underlying syscall support in kernel
and if older kernels are in use, then we can have a knob to
turn them off.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index e495b8c..843648f 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -71,7 +71,7 @@ PACKAGECONFIG_DISTRO ?= ""
 PACKAGECONFIG_RELEASE ?= "release"
 # This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
 # PACKAGECONFIG_OPENSSL ?= "openssl"
-PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests"
+PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests renameat2 getentropy"
 
 PACKAGECONFIG ?= " \
     ${PACKAGECONFIG_RELEASE} \
@@ -146,6 +146,10 @@ PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
 PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
 PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
 PACKAGECONFIG[journald] = "-journald,-no-journald,systemd"
+# needs kernel 3.16+
+PACKAGECONFIG[renameat2] = "-feature-renameat2,-no-feature-renameat2,"
+# needs kernel 3.17+
+PACKAGECONFIG[getentropy] = "-feature-getentropy,-no-feature-getentropy,"
 
 QT_CONFIG_FLAGS_GOLD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-use-gold-linker', '-no-use-gold-linker', d)}"
 QT_CONFIG_FLAGS += " \
-- 
2.16.2


