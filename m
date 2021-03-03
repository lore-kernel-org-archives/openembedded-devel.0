Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.526.1614793290775776835
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 09:41:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=diw6mDFa;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id l18so4789512pji.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 09:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zyUvfoK1KZzwT/MBAZb6TMjnKFpCxnyNGQ3eDyWdlP4=;
        b=diw6mDFaWD8nIHoQdZwoaScZR7hV2dCYUahlOay5XNG7EJS8rkvg9YkSm/znFgTW1k
         cNYXC9uMpacUapYi5s1mlRKRznnCr7UILerLZ6DyDxsXyx6g9suCZY1lCSGn3XO03Skj
         fv69UYhArZoTW1BSrAl2htwhvTZgKMVhNRil07yzq6DMEm8WCEnM86WsPSPaSh37WdTk
         zndi4iByD6lcDyARX8Z3IoFQMftA33RuBqpep0D0qvFKfWwZtEGDAzlOFkCuGcdf8R3Y
         rDLVOMdDZj5ESj3YWuPDBmDaaF1lp+7IIOiPfKCoJbb4hBHTxnMkjD6J22W2ESa61uzs
         nCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zyUvfoK1KZzwT/MBAZb6TMjnKFpCxnyNGQ3eDyWdlP4=;
        b=XDLjYxTeIz12YWR6C5FAojPGTRtFQVUHctQcpsoGW2QyU2xjILUHqOShIWNtyVvnHr
         GhT6u/fs9f/U15vVg2DCpTqC8d6AFcTTlNw5bhXHtWBfoepb5XL/8H47XapLt9/IZDUh
         evIhBY3+gvKA8rmI2ZBptbYdEtqa9+qRqwRqwDbXvOkNty00KQaDZxSwhqSscjwgNqtj
         Knw4x31RwkJmYMrvac+ZWXcDEPblgxWSVZY7Xst/SrOX3Cy0Lc+F1mebU1cz1st2mcVs
         9l2qzQih6dmPeXiBRDe4fJKznQwuNWoOYQ32VWKBxfLKpcZDLFO4fc61RvYvDu6IwS3m
         s3tQ==
X-Gm-Message-State: AOAM530Mu9Mfyh/+Yrf7f5c1brgWE4tQgL/Jy7hmhCJ0tdyLR0UNFfGk
	klxAsVoJMdWjh1uRirfmpg7fBZXjdA7+gA==
X-Google-Smtp-Source: ABdhPJx8KJCqEZlmKWO//PK6xxXK/83qlX7DyTpodAiXuKyOjTUwv+/hqVnpaytuL8Y1iHSXiK8XDw==
X-Received: by 2002:a17:90a:c389:: with SMTP id h9mr244190pjt.226.1614793290010;
        Wed, 03 Mar 2021 09:41:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id 184sm26878587pfc.176.2021.03.03.09.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 09:41:29 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH v2] v4l-utils: Package systemd fragment for systemd-udevd.service.d
Date: Wed,  3 Mar 2021 09:41:26 -0800
Message-Id: <20210303174126.2760744-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
v2: Package it in ir-keytable
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
index 7d96646220..3e92d49b4f 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
@@ -37,7 +37,8 @@ RPROVIDES_${PN}-dbg += "libv4l-dbg"
 
 FILES_media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
 
-FILES_ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
+FILES_ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules \
+                     ${systemd_system_unitdir}/systemd-udevd.service.d/50-rc_keymap.conf"
 RDEPENDS_ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
 
 FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
-- 
2.30.1

