Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF85780A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 12:42:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r136so9184851wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ljf0/m8P80Zu5ZwtyRXxfiBUseUXALW9/em2wVix4oM=;
	b=bSFn4J4riaE7cB0iGHelzBkDTj5nH2ljF66RiQSSUw+Ktx0UQttH5cevf5V4QQB8mD
	epnZ+GOvOMADPLkD3PTWQU7+YU3haOyKa4qtsnU4INB8foxK2oua/3q4+bRjLch69wfl
	g1FSRnaBBdFILtUDq/Nbd6YcSiRurZyHhBxzK7FyWpvt0P88mNnVYU/jQRhShynWmpn5
	XS+cjLvxp546XYO0wXWKUEs8Eth+vDbH9MUESKOtB/90/DALlFjakq+jrlNuK+kXU+tG
	ezafaeqpGpZizB2Bb6ZPIllCvHGb0uKpDBOoKJ3fEt+GvPrDgkBEGJoEUQNuUM3vAqwN
	6eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ljf0/m8P80Zu5ZwtyRXxfiBUseUXALW9/em2wVix4oM=;
	b=RtkZ8x17cK+GuoaIZLSUQiY4DLzzW5YnsCPRyeb6K8jzwc4rRdvGfQRu8Odoi9CJ3D
	hJOlQ+XFaeu2AEy1Z1BXys0/DlqTs0Gh97R0QHzTbBZZ6a3E80B98rJYg5HQL81bKClF
	74cNH+hkDQw6FrXPKIX+83YMiSdk4ZKLz+BZsGq1iy7la7QfwGDog4oZ9J3sh7JOQtrK
	1HA1KPzuKjrzp/4EmiGTvx+6RwXZsEeIKL04QLijb6hfF/8o8qTsX6ib/pWJ+GIV/Thq
	s9QgfWUCZA0Q9a7yWN1VBCfgfc+kCBJE57Bm8rXmhq6LF4LkIVtlAMH74J+VLZhB/pnh
	Cnhg==
X-Gm-Message-State: AHPjjUi6Oj5Bj4SXGLmjMTBxR0zlmGSp1vt2ieRLGvjJGN7yfa5ME2xk
	qw0YMc/BGNLT7tif0qGR9yISYg==
X-Google-Smtp-Source: AOwi7QATZOUAghPybIdrbsQmiQ5VAfa+I2Iq93NQnrt1bYF1vk7wxcK6rgLrVDONwTRHpN64us1dNg==
X-Received: by 10.80.186.172 with SMTP id x41mr17634747ede.68.1506429728062;
	Tue, 26 Sep 2017 05:42:08 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	k27sm5499840eda.79.2017.09.26.05.42.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Sep 2017 05:42:07 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Sep 2017 14:41:53 +0200
Message-Id: <1506429713-12772-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-browser] [PATCH] meta: drop ${COREBASE}/LICENSE references
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
X-List-Received-Date: Tue, 26 Sep 2017 12:42:07 -0000

From: Ming Liu <liu.ming50@gmail.com>

The top level LICENSE file is not actually a license, it refers
other licenses that are used by Bitbake and Meta-data. Relying
on this file could cause problems for recipes when this file
changes, which it is about to.

Change-Id: Ie2ab9a79f3d9f451ed0424c7289de94de14707bf
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-mozilla/firefox-addon/firefox-addon.inc | 2 +-
 recipes-mozilla/firefox-l10n/firefox-l10n.inc   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-mozilla/firefox-addon/firefox-addon.inc b/recipes-mozilla/firefox-addon/firefox-addon.inc
index 45f079e..fd18adb 100644
--- a/recipes-mozilla/firefox-addon/firefox-addon.inc
+++ b/recipes-mozilla/firefox-addon/firefox-addon.inc
@@ -8,7 +8,7 @@ DEPENDS = "mozilla-devscripts-native"
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 
 # Ugly hack for now; we need to check license per recipe later
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 S = "${WORKDIR}"
 
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n.inc b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
index 7b252a2..ec38ce6 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n.inc
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
@@ -8,7 +8,7 @@ DEPENDS = "mozilla-devscripts-native"
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 
 # Ugly hack for now; we need to check license per recipe later
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 LANGUAGE = "${@get_language_name('${PN}')}"
 PR = "r3"
-- 
2.7.4


