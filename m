Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.582.1603381253399368986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hgg10xSS;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: paulohefagundes@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id k21so2086286ioa.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2020 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ct7vrWoVBwV9mAcMFx2iFggFU96kXzhw+XntvnS6O5k=;
        b=Hgg10xSSAU5RuOmiERzdzWk03IN6YenchApQ2viukPq42GYrphA/ylFTeytYu7yM3e
         IjXKZ4TNgqX3LzXArbmrGlSqtF//NA3SjOlYHFyqx31p0tYJT49X9BaRjAdpjq91XDJo
         pupfsUHvV8/BAKimr+c8LTLmlRbWabn3VmvaV1lgm4QUbxYoWJBpoZ49G1D3Fzv9i//l
         7RDl1CmisTQ70n+Q+FBW5vXit8OhTPOJoBauF2gUDnYEoqX0wxs9ExH4lEy5IfTBdH2j
         ONB3Xu/6l1/A4OEAgHe/RjmEjpCuPvCWbVqYGtx/J4HOcg0vwmit9QMGQWqa5Lkbh6kl
         Fggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ct7vrWoVBwV9mAcMFx2iFggFU96kXzhw+XntvnS6O5k=;
        b=cisvT5XivuZEGnTRShrs4Sg5g9EctUYhDUdH8PDfGBFWFmN3/h/8m7AKjPCnVu1DGi
         Euuy0QHXFjqFnHH3d1tDZp6GJt/OjkjhmpXUwxydixWD2DdVTf4lozJBuAa0gsUv5K3n
         aujTtD84qfn/luAtZYxyEnBB+bY2XTLmIA4hqLnN56ZYmXwXG0Il4q04gJP8A1s/USic
         tVKBRSOeJfFjlV4OFCqpOfutfvT7jEMJCf01MUXjIYbmPN3/fQ3KWTxDscvOmviCZB6X
         15H3fNqjkMVVObgzumEZMJr9bspsnyeijBEakIo9/6CCUlUiwZCYLJ4hXnB/xQ3gKvI9
         ZYjQ==
X-Gm-Message-State: AOAM532paunmDoLO+GBs69P0Yfqo08Of97wsbzWrGex0DSE8UZjiQhsU
	yBIRcnTbB8RhhlRLo/BF12qjW1LqMJI=
X-Google-Smtp-Source: ABdhPJxp9CtJYzcwxffi1YQC6tV9mNrPr9m6LOaKYY8MNDBr586f96IW/elebmjODPZpNA2scJrWew==
X-Received: by 2002:a5d:8908:: with SMTP id b8mr2208347ion.96.1603381252643;
        Thu, 22 Oct 2020 08:40:52 -0700 (PDT)
Return-Path: <paulohefagundes@gmail.com>
Received: from localhost.localdomain (c-174-52-8-24.hsd1.ut.comcast.net. [174.52.8.24])
        by smtp.gmail.com with ESMTPSA id e17sm1323495ile.60.2020.10.22.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:40:52 -0700 (PDT)
From: "Fagundes, Paulo" <paulohefagundes@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paulo Fagundes <paulohefagundes@gmail.com>
Subject: [meta-networking][PATCH v3] vnstat: add recipe
Date: Thu, 22 Oct 2020 09:40:43 -0600
Message-Id: <20201022154043.107533-1-paulohefagundes@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vnStat is a console-based network traffic monitor for Linux and BSD
that keeps a log of network traffic for the selected interface(s).

Signed-off-by: Paulo Fagundes <paulohefagundes@gmail.com>
---
 .../packagegroup-meta-networking.bb           |  1 +
 .../recipes-support/vnstat/vnstat_2.6.bb      | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-support/vnstat/vnstat_2.6.bb

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 0e668f7dd3..a9dc6a13ef 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -250,6 +250,7 @@ RDEPENDS_packagegroup-meta-networking-support = "\
     tinyproxy \
     uftp \
     unbound \
+    vnstat \
     wpan-tools \
     ettercap \
 "
diff --git a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
new file mode 100644
index 0000000000..7521e9542d
--- /dev/null
+++ b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "vnStat is a console-based network traffic monitor for Linux and BSD that keeps a log of network traffic for the selected interface(s)."
+HOMEPAGE = "https://humdi.net/vnstat/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+SECTION = "net"
+DEPENDS = "gd sqlite3"
+
+SRC_URI = "https://github.com/vergoh/vnstat/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "fe2928a81243cc8a532a357f97221736"
+SRC_URI[sha256sum] = "89276e0a7281943edb554b874078278ad947dc312938a2451e03eb80679f7ff7"
+
+inherit autotools pkgconfig systemd
+
+EXTRA_OECONF = "--disable-extra-paths"
+
+do_install_append() {
+    install -Dm644 ${S}/examples/systemd/vnstat.service "${D}${systemd_system_unitdir}/vnstat.service"
+}
+
+SYSTEMD_SERVICE_${PN} = "vnstat.service"
-- 
2.29.0

