Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33698CAC5B9
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.9702.1758801824834097260
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f3gH2P4q;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b07d4d24d09so171402466b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801823; x=1759406623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EaaXghJfE4lhaDZAampZTG0krZTveVudTBlCGk0aKg=;
        b=f3gH2P4qO2aHgDNi0pUjwEdHf1AvJeY6/wtpsHLQv2OxdswBLWRLQ5mcPxVdgtjFas
         6+5BBc0UK57zF9N809EeeV/SclUJJNzsDAfKGW9gadnwj0D0aj42vFVGjZ4XRYf9ZT3Q
         v7nA0LFQBSo+9KEmQ8vO6I4iZdHMmt09/YESsflqHXgVbc+OYqLuecNqndttRV/G7gDi
         a5RYoPxX70or8Uzstui9IU0ch9KD5zwh44g9xMIeJlKKmSkGprhaP3KahnLXNCAieVsa
         wgeJD4TlcHkdkJaXYlTJcskvkDHs/RJXSxcQL1ZaQAYQe4OoHgp2e4vSXo5NrmLqI9qG
         ORfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801823; x=1759406623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EaaXghJfE4lhaDZAampZTG0krZTveVudTBlCGk0aKg=;
        b=WD2QvhEQqMfX5/GZe25L99SDQjU4EmhIzaTZDVodvAkvotSzZWJiJ+xpOxfBVFJxYn
         nXZUt+eSEBmFkYcFCSP3MQ81YPIwLYmiFKRBgWbCYgpjB8kd/lAOIpwwPOYjDO0N90dg
         WMzscjLiI75ZJMnYOicg43ozH/A6VnQVJ+S/R9eTxhwYdiYr77+t5Ro3s1AsNnsrdl8N
         lQwQRe6XX4YwW7s/JJIku10cU3fcWaCpC28u+RBOO1g2YIm3kq6DYaoVw1fiQY8v17gW
         Wbn0jcQyVL/XMwOhzQFpenuPYI6IFB5yehSCy8409dSspc6trt7HogcTAf+HCBv+6ITi
         4jcg==
X-Gm-Message-State: AOJu0YyIjXlC1iB8N75Blas0gBlMiMJ60EDGqWs2bHLeFeuT7cjinf48
	aFSLBWc/K7tcz6g0c+l6eA//HPZqAFI7Ot/++7Zocx+/ri8XCtKhzQRe5yKtFAJa
X-Gm-Gg: ASbGncsD85Gfyl7Dzwl0wCYeQiZbarq+xjsHjxdm+qZz5B6dj85IQcHerJ0t+BPTQF4
	vp0CQu0l6ttao4QBQj3gv9MKkGbzLTWZothUr7Svwysv9AMofYzOr7XhYNUrOq/leBXQlMZGjJT
	qLCyQAYhFYfio+BFmS/HAQ2rb6pCRTbgDUKLbuWeAo7pkTUolYDFvIxI9oVXbbMOAF6SV7tsdWc
	Euik1OikiGrLdVnghXSjnWcmRuI3/jwpbym77FZa9uanSfI1h8iecdY9hO9p5TvMox6SJCZuZeU
	RIPiLKFZBvcSlfxFSTy5PVBEdDV1yjmo36Wuu53OPFG6oqmFDnMEi6qbTFjU1vv9V02lLuJ+VS2
	MJXtRNTCjF9tCWrN3GcuM
X-Google-Smtp-Source: AGHT+IHV2ITGlUIDHUetixxVtuZR2pb/u5Ogy1XB82YLxbRcKZyQtcWmwehXOEQJM6bWXBxmTNk6FA==
X-Received: by 2002:a17:907:971b:b0:b32:2b60:f12 with SMTP id a640c23a62f3a-b34ba651591mr401892066b.27.1758801822948;
        Thu, 25 Sep 2025 05:03:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 03/21] ibus: Point python interpreter to target location
Date: Thu, 25 Sep 2025 14:03:15 +0200
Message-ID: <20250925120334.1670367-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119863

From: Khem Raj <raj.khem@gmail.com>

it encoded PYTHON variable during build which otherwise points to python
on build host which is not correct for cross compiled packages.

Add missing dependency on python3-core which is needed for ibus-setup
script to run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fe0e3d77eb1a992c487038e64b734b2b8b395647)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-support/ibus/ibus.bb  | 2 +-
 meta-gnome/recipes-support/ibus/ibus.inc | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes-support/ibus/ibus.bb
index 7156081499..141341e341 100644
--- a/meta-gnome/recipes-support/ibus/ibus.bb
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -38,4 +38,4 @@ FILES:${PN} += " \
 FILES:${PN}-dev += " \
     ${datadir}/gettext \
 "
-
+RDEPENDS:${PN} += "python3-core"
diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index bb662f2ec9..9579404b3e 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -31,6 +31,9 @@ EXTRA_OECONF = " \
     --disable-emoji-dict \
     --disable-python2 \
 "
+EXTRA_OECONF:append:class-target = "\
+    --with-python=${bindir}/python3 \
+"
 
 do_configure:prepend() {
     touch ${S}/ChangeLog

