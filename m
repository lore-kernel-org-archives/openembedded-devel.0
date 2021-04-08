Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web08.276.1617899830193767783
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qkI+H8bZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so2886490otb.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EgbAwepwY5amutJHztdBGet/8fPy7piCUGqfKpXcaQA=;
        b=qkI+H8bZz2BZrsPoDoI7Lx7YzGBB1Ml/tCb0P0J7lnlByS/zUEd3d8/W0PMRzY1T7+
         hzjQjc2nruGqxX6r8awkFE41M5S+KdTBWMUAeGWLFVKbMCKFcWIJAGC1XmlXGU0h2FBE
         CoL/GmfEJQoAjwLxdvCEs1CzHMdzBOfJ9oWO8U4KKzrSbUsIvQez3uCqa1SKKoove2gg
         u/RIfJGYKfYGCQid9dcgFYDNUWXEDR/+pUVkA0W6HTtsTT2gfJD+iB5AjVCt7yenr+/b
         57z8i285cEmuevrX7onZcfF92inWAZdpk9E4kMZJUe7FN+XHRW9rGHNwu+Hvy6gxAKSt
         XRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EgbAwepwY5amutJHztdBGet/8fPy7piCUGqfKpXcaQA=;
        b=TBYh6f7lgmIKqqrO3BNY67H05Fz9oJ+sH0LJ17l+2woR004kPIB5l0fzazllGs+pDd
         veaYs90vqcpwjZuOe7fKaCs8xj+dlFYF78AGkGCR23YQ2ekPpjG76dO0h4tLINSRIUGb
         cGDxM52jnbJzsYEUTGxTCdVZmFjItHTF9tSZwaFrOd1+LvCrw3gpFglSo2wqThsfYTye
         GxhrXwIN5akdKwIBZprZDohTmO30VdgZeNi2k+sclfWlgzIwiXkBnMffEHFT/IFZQO6k
         iV9N2DkovCKv0lyUZGDG8fLk8aqb8aziye38G6zompjxQGWFaWBNPThxBGq0nwopbdp/
         YOKg==
X-Gm-Message-State: AOAM530bpzr2/+ukZH37949v3cqNzcWQzUTH+GcNHlbovnNkiFyEA6jB
	OWU2P50nJMGqmvW1zEMtxAuFL4VBLT4=
X-Google-Smtp-Source: ABdhPJw4sDHWfiLfZuTCl/HWwL098e5aT2UiqQIZmWZ5bEOyH/GIoTscQU9tpuIh8PBjmWHILPByzw==
X-Received: by 2002:a9d:6054:: with SMTP id v20mr8426483otj.81.1617899829429;
        Thu, 08 Apr 2021 09:37:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:09 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 60/64] libcppkafka: Add initial recipe for cppkafka wrapper
Date: Thu,  8 Apr 2021 09:36:07 -0700
Message-Id: <c4b2fbb53865be5d98bb5d91189de79b9d95a004.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: "hasan.men" <hasan.men@bosphorusiss.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 285e612ac9c1ab1fc9f50728cb27b0bd0c40e89c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libcppkafka/libcppkafka_git.bb            | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb

diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
new file mode 100644
index 00000000000..6237638d3d3
--- /dev/null
+++ b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "high level C++ wrapper for rdkafka"
+DESCRIPTION = "cppkafka allows C++ applications to consume and produce messages using the Apache Kafka protocol."
+HOMEPAGE = "https://github.com/mfontanini/cppkafka"
+SECTION = "lib"
+LICENSE = "BSD-2-Clause"
+
+LIC_FILES_CHKSUM = " \
+file://LICENSE;md5=d8b4ca15d239dc1485ef495c8f1bcc72 \
+"
+
+SRC_URI = "git://github.com/mfontanini/cppkafka;protocol=https"
+SRCREV = "5e4b350806d561473138ce7a982e8f6cf2e77733"
+
+DEPENDS = "librdkafka boost chrpath-replacement-native"
+
+inherit cmake
+
+S = "${WORKDIR}/git"
+
+do_install_append(){
+    chrpath -d ${D}${libdir}/libcppkafka.so.0.3.1
+}
-- 
2.17.1

