Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14733C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 05:38:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.7467.1645421926910781943
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eju1Ay4F;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id x11so11989271pll.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u2czTqEOiDgogCUV8ak+QhK/dIoTUXGmSn5osy3KK3g=;
        b=eju1Ay4FNxpbmDoDxaI6PiAt7y6wybrClEfdKLyciKYrWxFNKNaeI/ZLjT+4LXCBBc
         1hrkDWbLPB0hgFCIeSX23UsMdgEPRpGdXkuxcNlqqXzbYfVYcz97rICxyoVXEZUcKcer
         S8XiAarCT6TXjTZcTwEIGm8ZM3fyHoOAWTdIYaxKSZDGOwia/wWH/BL/DCi+k+zW92ru
         S1wUvRudIw1Qh9VH4RggQBVud1JIi9OebePJc0PrM0JJp8Cks5gQhkaAMTH7IZDriNYT
         tR61AjadbkMtSd6pxhZDlY3o+kg4geVN+Xs0OzkdS14ZeBogfsygGgt+Ze7cmSEKHIQt
         mLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u2czTqEOiDgogCUV8ak+QhK/dIoTUXGmSn5osy3KK3g=;
        b=sf8+eCXkkVzM1ztW1gyU3XMuS+Je8T0N/CuxEX2mJGZE6hKeOFGiy94jRpGkDHRT34
         HhPwO6PaWBgd7W1pfRJw4upezmeGhjJSXWtZoAeNYw1eZPLofGJlV0k53Pq9RschnFiB
         PO0w1VwX9mjMeTUrd6Nsep8QS5LNXsomP4EsIGSrP1khOvdbYPcNAk6/0e+owGR0cGUT
         zjbfagS0rnOF/1rQvgMuINxidW26RUvbEYEoDN0MiyS1RG0+2r9MGcE39rU/kz/9AE3Q
         E0tsOuBSNKZEd/s9GuUzBsfhl758eaukdSu7tf0eNvS3lOGuMBF3xnGl3E2WSmUHruX8
         hcNg==
X-Gm-Message-State: AOAM532q7la57YcM1eCLbYrLqCUf2CtRJlh+K7iYfU972W4B+krAhuB0
	zav4vLq+UCWLj+Q5VW1HZ4+vHlbuiH0jEg==
X-Google-Smtp-Source: 
 ABdhPJzjq2E0kXNE8F3jELxzJo8x14JhiecCkTpaJ8ZniHbK2ip0yb4mXTCD6Csg5RsvLIL+pxm+Qw==
X-Received: by 2002:a17:902:b090:b0:14f:b7cc:9a49 with SMTP id
 p16-20020a170902b09000b0014fb7cc9a49mr3728087plr.38.1645421926264;
        Sun, 20 Feb 2022 21:38:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 h7sm10527444pfi.128.2022.02.20.21.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 21:38:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 4/6] atkmm: Add new recipe for 2.36+
Date: Sun, 20 Feb 2022 21:38:39 -0800
Message-Id: <20220221053841.98265-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221053841.98265-1-raj.khem@gmail.com>
References: <20220221053841.98265-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 05:38:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95402

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/atk/atkmm-2.36_2.36.1.bb    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb

diff --git a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb
new file mode 100644
index 0000000000..40487520fb
--- /dev/null
+++ b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "C++ bindings for the atk"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "atk glibmm-2.68"
+
+GNOMEBASEBUILDCLASS = "meson"
+GNOMEBN = "atkmm"
+
+inherit gnomebase features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.sha256sum] = "e11324bfed1b6e330a02db25cecc145dca03fb0dff47f0710c85e317687da458"
+
+S = "${WORKDIR}/${GNOMEBN}-${PV}"
+
+EXTRA_OEMESON = "-Dbuild-documentation=false"
+
+FILES:${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
2.35.1


