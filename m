Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.7573.1623244493488005004
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 06:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cgjjHFwZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso3184579wmc.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QP3jWPVMXneWp1+tNdb5EI/nRiCeUS0wY7YcmqIFdok=;
        b=cgjjHFwZjkyAePUsQm+uvPuRxJ1xpU1bfTfuyyeuj1XVzWjVQGSI4i7bRD8ywlpn2l
         sa4AXhwoT6sYagNsa3g8zD8m+KjbeYmyQ3fIaqQCELoYKRTRA7QI1850Swd7d7P2dzY5
         KjtnoFhHxhEhisZSLcpqtM59QFK9JsnAhwpQj9nzAh+KtwLRFZhsO1T2VejS+a6A9agC
         GWRx5YUhsmc2+dp2jwX2Vy+OX28WG5OaAeBsUlc1N8P9KnA0Kbynj53QsOTVdQWbU2C/
         KoEFNYNj9fwi9p3JKEkiJe5xce1TIoSbB5+ZV+MWRqrlusyFpNGStyjavfuqbQeV1Mj2
         OELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QP3jWPVMXneWp1+tNdb5EI/nRiCeUS0wY7YcmqIFdok=;
        b=QqkGP9opDT6Zu1m/ioESOLftx+SZvZbaDMROy/vShFord/hAvscJuR7aO/irEDRj6V
         WZRcJxo0tEBkx9Tvs33MdcFxWJUK8AYa+53BoVpgSARRmKA8m9MjlE3ZwhhTexzZhqZs
         /LILDC8ggAaBO7FwV4mLpoA5CgJ8Wtl7CLHy22YYuAG42F7+cNGwncdP7IHjTxfzh7wu
         yA5uO6CUKb/vOM/NE7OO9Df9w6g0hfYopZjK0Jvr/NIOTgv93xLsIfDaJCOcG9ZdymCO
         dG3Coqb9aHezTC8Jx35X9K+vp0VckvqOmNkE703+vxu8fiPKZnRduqn/p1wevjQhpOiY
         +c5w==
X-Gm-Message-State: AOAM5311alYDn+wj4Z0atDop1HyfzXFd2gB96VBDgUlaznr8Gb2CGuLf
	pQXxSMZcFW+BmyeTT69UdYdcNU5YkLwoE7p+
X-Google-Smtp-Source: ABdhPJw5mm04AuAMR9QyJdBG8p17KLBF43eOC+4kIutD4cm64116xCdIT9CRl24fHLHbyaJdXiCuLA==
X-Received: by 2002:a1c:282:: with SMTP id 124mr10013712wmc.82.1623244491723;
        Wed, 09 Jun 2021 06:14:51 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id v8sm26161511wrc.29.2021.06.09.06.14.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 06:14:51 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] dbus-broker: enforce required versions of libselinux and libaudit
Date: Wed,  9 Jun 2021 14:14:46 +0100
Message-Id: <20210609131446.783106-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210609131446.783106-1-luca.boccassi@gmail.com>
References: <20210609131446.783106-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

v29 requires libselinux >= 3.2 and libaudit >= 3.0, set them as such
in DEPENDS

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_29.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_29.bb b/meta-oe/recipes-core/dbus/dbus-broker_29.bb
index c59809f53..8fcdb8c66 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_29.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_29.bb
@@ -14,8 +14,8 @@ UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
 inherit meson pkgconfig systemd features_check
 
 DEPENDS = "expat systemd"
-DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
-DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit', '', d)}"
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux (>= 3.2)', '', d)}"
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit (>= 3.0)', '', d)}"
 
 RDEPENDS_${PN} += "dbus-common"
 
-- 
2.29.2

