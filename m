Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3046FC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 19:28:18 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.5946.1751398090813957885
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jul 2025 12:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kkjWxcud;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: hiagofranco@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so47260891cf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 12:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751398089; x=1752002889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZqYkIBM7PmQ4edWFTqh0fN/aEY54YbS6nYlFYNz+wM=;
        b=kkjWxcudwojnUt+jFZ9nel+QhSb219+Aj6raGE9bqyfNLA4DPyrHvbwn57zBNCVRNS
         aocu92PuaYtIfqfNlAe7KWjAvyH9Cwqd3em3TdcABkDFq4r76U+WO7uigMQBg/989GaZ
         SXUQL3kFMjbJ63eB9V2DuEsqmgIbrEc23bI956CD0lv229VaTzhjWN94oJ3Cfi8B0I3b
         +Og5+D1HdDK9LLwz2rY0e0dENgKNHeKQ6GXxgM83MpDGOmx0TpGZTpKeyXvhxIE4aVoA
         KqDDcg3q6CqQz1XyvQRynsaBCk2cgneb/B5znaXhAeRWLRDEqvflR7NuJmlSQZHkDO+o
         iytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751398089; x=1752002889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZqYkIBM7PmQ4edWFTqh0fN/aEY54YbS6nYlFYNz+wM=;
        b=X/LoXosSpWTVS+fiH/PZa4ypiS2vyh6A+0By4JjlWkWn6ZQ0g3SD4lm/n2xSQbk6w0
         r7/dJYjkIK7Tptwli5FQWXMDSZ5U6Xn0Q8hxs5kcvSAH1yau1TMNa9iGiBe+W2V6hJ/T
         GThINKJd7k9RMP6N4YiWg0gEaTnPw8LrJx7zTwtY2HRl7xIX34tqi7pfHRaeC7rM/YEe
         3Er/pJMEXh7mPLh6UvXKmj4romAm9t+p4HJ7lxLq2sWxJxBLx7YKZeUz02gjDVX6Ldzb
         HzGzREYPzvcgaOzG66cYxE8OSvkw94r+PSaJdd5ZIPpbYXn6dLVTGBzCNENBmd9u3DHB
         feFA==
X-Gm-Message-State: AOJu0YwtqaVVkj1IqFumngc9a71uw76KsavpyQjoBMf4jX9VqQdAPc5+
	eEwItyBLsLa0yuDyyVO8ch8Pfzc/+9njR8vSr+GH7tqZe6n4NdxDak6XSIFEQw==
X-Gm-Gg: ASbGncuOq3Dc1DlB93T44N4MQZskoUMvbBfOjyxwIL/e2PlSV3IjhfyRFeOZLWNb0Yk
	1Ds6/tDvW9vXCVpW1JCCxuxhFgK5aRbKjU/XAKL0CJDDCVHCWw3bI2bKfyPPN0ksMEhZ8RfyFnv
	8PLE0xQ1xag5/VzgdNSKHnQiOCnZegl3H1aYr5sdVvWF/I9HvkHI+hGw03oNKDBU/w5xCKxf5uY
	L2nzab6+6CQfCQDxbZMRSAA2tfVtwuZc3MtS2HNb0S3OxeTrvahB+HwPSVLFtycTWvSc6+dcDR0
	5JVTKW21sbPHHR6prbpzdxns5m+xvqKftMxwdf3K02wwAMCs1/i4oOBBr+gRx9T1xTKiV8yMA5l
	DcTMYEN+RM9n6M20L
X-Google-Smtp-Source: AGHT+IF+CbZxdz88GaSTCcvaqBJ9l9bM0BHVgMO5sUaEJSQdgt3EwiPx+QRVsG8rGMAsorGTItMIIQ==
X-Received: by 2002:ac8:5ac2:0:b0:477:e2d:2ec7 with SMTP id d75a77b69052e-4a9769e197fmr3065741cf.33.1751398084747;
        Tue, 01 Jul 2025 12:28:04 -0700 (PDT)
Received: from hiagonb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc105a86sm80632541cf.11.2025.07.01.12.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 12:28:04 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hiago De Franco <hiago.franco@toradex.com>
Subject: [meta-oe][PATCH] gpicview: add recipe
Date: Tue,  1 Jul 2025 16:27:44 -0300
Message-Id: <20250701192744.586044-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 19:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118194

From: Hiago De Franco <hiago.franco@toradex.com>

GPicView is a simple and fast GTK+ image viewer for X which is
lightweight, desktop independent and has minimal lib dependency.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 .../gpicview/gpicview_0.3.1.bb                | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb

diff --git a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
new file mode 100644
index 000000000000..dab11a02bc1a
--- /dev/null
+++ b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Lightweight image viewer for X"
+DESCRIPTION = "GPicView is a simple, lightweight and fast GTK+ based image \
+viewer with minimal lib dependency and desktop independent."
+HOMEPAGE = "https://github.com/lxde/gpicview"
+BUGTRACKER = "https://github.com/lxde/gpicview/issues"
+SECTION = "x11"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS = "glib-2.0-native intltool-native jpeg"
+
+SRC_URI = "git://github.com/lxde/gpicview.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "ca13623c6176585db4759ce4371fbf89c56fa630"
+
+inherit autotools mime-xdg pkgconfig
+
+PACKAGECONFIG ?= "gtk3"
+PACKAGECONFIG[gtk2] = ",,gtk+"
+PACKAGECONFIG[gtk3] = "--enable-gtk3,,gtk+3"
+
+FILES:${PN} += "${datadir}/icons"
-- 
2.39.5


