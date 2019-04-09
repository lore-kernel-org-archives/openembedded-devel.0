Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF856D638
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 10:47:46 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id t4so14024738ljc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 03:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VR9q6zi7nkb6AAU26f0I0dAwHaltiqB08H7yRpQNI9U=;
	b=Qx8ZvzFlNnW8RyQTpActZL91GgHNRqQJOyQRxxc/6VtT1EEcTFusXTD9ozz1T/Q/jG
	SjDHHJe8II5xVVRLsf+UW31yXPOdSYAqNbQjDiqcCRB4zw7wrUFVeLHlPJh9UHhJ0PXj
	65/uboHZTFM7hXj0TmEvQ8m/IeivnN/N1Osfnbgy5n3OQfojkjAr97nWkmUrXpV72hBs
	Vdr5gbmV3K8iqMiq1YyzX4/vtcjPYiVlJ8ESeUZ0RGqsFJBvj7uJgpnpBDD5wdk81Oyh
	1FCPDI+YWY1pL+90vskT6K2H7vaJ71CCy7fS2aYKZXel6I0mhjle3ntzsIK2i4laxf2H
	nyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VR9q6zi7nkb6AAU26f0I0dAwHaltiqB08H7yRpQNI9U=;
	b=XP++fhQk3PCTpk7qeur6WC2Av6L34QuQ3DE9DiE+jrRs4wSycOMOA2qM7k1tjdeaGp
	QHGik7+X8bYXa2KaPGEAzhA3O28RPJWu8zi0mRd2eKMrZLRtl4as/BPTrXERaQ5W+VTe
	jzSOAOf6zhAyfswhc91b3Pf08HqnHsgOY+z6kXP1wI4xtkPRVtZkniPyUt3xFYwCjvAq
	DAM0yZH+Raj7Yz78BhEVACMVeXg3AGWk2nd4b0WssCFEP2siFhcnyCPvyZJbYA8x938O
	YQS8+pptXlUorHcKkOEu2R46cm+WD3YI9BapLheZqEfRScPY2HBwgXcFh00Pj4mH30ej
	FfTA==
X-Gm-Message-State: APjAAAVbbPdSd8KvkSbM6/KmMrtcGF6Vd0GXFXfmSHzg8F8HYCLbMlFN
	K6XMzoT5nToU0lxMReU86a/prJ1Kv7U=
X-Google-Smtp-Source: APXvYqxC//4yLFJ6MoWwEbouTw76v9TNuHh4W+qiJZkp2zbIOVsRLVWKWGk4uBw6rNzNVEzfXgB0zw==
X-Received: by 2002:a2e:8507:: with SMTP id j7mr2687246lji.85.1554806867101;
	Tue, 09 Apr 2019 03:47:47 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	o27sm6498847lfi.25.2019.04.09.03.47.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 03:47:46 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Apr 2019 12:47:43 +0200
Message-Id: <20190409104743.28264-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe] ell: add recipe
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
X-List-Received-Date: Tue, 09 Apr 2019 10:47:47 -0000

ELL has originally been part of meta-openembedded, but newer versions
of some of the poky components depend on it, e.g. ofono.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-core/ell/ell_0.18.bb        | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-core/ell/ell_0.18.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 950b8e8951..62de7d21bc 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -165,6 +165,7 @@ RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-core/ell/ell_0.18.bb b/meta/recipes-core/ell/ell_0.18.bb
new file mode 100644
index 0000000000..ca27f4dcda
--- /dev/null
+++ b/meta/recipes-core/ell/ell_0.18.bb
@@ -0,0 +1,22 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "The Embedded Linux Library (ELL) provides core, \
+low-level functionality for system daemons. It typically has no \
+dependencies other than the Linux kernel, C standard library, and \
+libdl (for dynamic linking). While ELL is designed to be efficient \
+and compact enough for use on embedded Linux platforms, it is not \
+limited to resource-constrained systems."
+SECTION = "libs"
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+
+DEPENDS = "dbus"
+
+inherit autotools pkgconfig
+
+SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${PN}/${PN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "18e2be697a54811e49bbe34590a13a42"
+SRC_URI[sha256sum] = "2c4c1a129f1b697e63ba3f63927dbae1482f6329b48c14a1748d9ab8ac4ee7e3"
+
+do_configure_prepend () {
+    mkdir -p ${S}/build-aux
+}
-- 
2.17.1


