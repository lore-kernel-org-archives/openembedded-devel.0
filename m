Return-Path: <brendank310@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 00ED178EFF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:40 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 131so5332194qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PS13uGY18HlHJ0UkLr7hMxv6ZrJIj5vC2qgx3d+wD9s=;
	b=jx9Rks3erB32M6ay99S7QstOtU0qgMBKTwqBS+JL7q2FURLvEoP1OPkhiJ2S5f0EQa
	labWL0bnlBiRFdJlDz6z+zPAX1VauNHIG8ODK1GhXIaB1RfhuvM0rqPH4k1e9aSnZa/i
	X6Ur/wUnUbPOiErr6XCTi4ogz88xit/HeAcaluY2bPU+NdVKe5Pqta2sv4Pig+Cdn8VA
	z0WRhrmJ4j+7SzRuXG8/8ConuXOi/MprH515RGC6q443Kcgdw9emR2OKPrWrPVO5JKNc
	n0ZeVyeq/SqlRGOGXxbba+dQY9iIWDbsVNmDReL4b3eji/iznbKcar0PSG07y9WyHH/P
	bm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PS13uGY18HlHJ0UkLr7hMxv6ZrJIj5vC2qgx3d+wD9s=;
	b=D866f6+8VGmDBj2bpGWPARZR+pdFetd6qmRrs0CHIleNuhsf8ifwQ70mrG06aXoZ/f
	dFH6CkR7aROfZ65XyuyCKPjkvB0K/hBa3NFP8rJW5SNMocqLJwesA8PmyXYtV/UtGs8x
	KUHPVdWmi9dh5qTge97uwAVrjlyZ7KfRkiOMCYXK4vR6XZqCu2oFGsNVCyeA6agIuvga
	JjEHkBh8yyAbC0Lq5iu7qIdHPDL9pkSyfIRQ/zd+ZUsK/i93924IJCLrJM3rpxN294vK
	nT0NII1b2+bFn6ddeqnGHasGENR4B8O0Pr8aF8fpp0qRMYu1hDM4V7JF5x/Nk+fDt1R0
	njAw==
X-Gm-Message-State: AGRZ1gKYhtnywZqLWbFSijmPQ9bcHgQEl4be0Ur/olzEE3lWI1/iGAAe
	1KoBYyIw+CDuBvCfqHUxWSwRjaHu
X-Google-Smtp-Source: AJdET5fLQMbE2HrEatIQjfjfal1UJfRbOvg9nHGDnYKPB4C8TUJ4Pbo2KYtMLbA012xKg5TqiIF2og==
X-Received: by 2002:a37:bb42:: with SMTP id
	l63-v6mr13033088qkf.214.1540831301617; 
	Mon, 29 Oct 2018 09:41:41 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:40 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:40:58 -0400
Message-Id: <249e8f90c9f911f125fbde534b24731e2a14bba6.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 01/16] sassc: add recipes for libsass-native and sassc-native.
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:41 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../recipes-gnome/gnome3/libsass-native_3.5.4.bb | 16 ++++++++++++++++
 .../recipes-gnome/gnome3/sassc-native_3.5.0.bb   | 15 +++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/libsass-native_3.5.4.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/sassc-native_3.5.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/libsass-native_3.5.4.bb b/meta-gnome/recipes-gnome/gnome3/libsass-native_3.5.4.bb
new file mode 100644
index 000000000..37a25f085
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/libsass-native_3.5.4.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "A C/C++ implementation of a Sass compiler"
+LICENSE = "MIT"
+DEPENDS = " atk glib-2.0 gettext-native "
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2f8a76980411a3f1f1480b141ce06744"
+
+SRC_URI = "https://github.com/sass/${BPN}/archive/${PV}.tar.gz \
+           "
+
+SRC_URI[md5sum] = "4af3f4ffd3e8cac1cb1c90ebc2dd41b2"
+SRC_URI[sha256sum] = "5f61cbcddaf8e6ef7a725fcfa5d05297becd7843960f245197ebb655ff868770"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+inherit autotools pkgconfig native
+
diff --git a/meta-gnome/recipes-gnome/gnome3/sassc-native_3.5.0.bb b/meta-gnome/recipes-gnome/gnome3/sassc-native_3.5.0.bb
new file mode 100644
index 000000000..5ba15e194
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/sassc-native_3.5.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "libsass command line driver."
+LICENSE = "MIT"
+DEPENDS = " libsass-native "
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2f8a76980411a3f1f1480b141ce06744"
+
+SRC_URI = "https://github.com/sass/${BPN}/archive/${PV}.tar.gz \
+           "
+SRC_URI[md5sum] = "f5c6aeb4e98c96d093f20295fc490f2c"
+SRC_URI[sha256sum] = "26f54e31924b83dd706bc77df5f8f5553a84d51365f0e3c566df8de027918042"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+inherit autotools pkgconfig distro_features_check native
+
-- 
2.17.1


