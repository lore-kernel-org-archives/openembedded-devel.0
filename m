Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.9838.1596502445853684368
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 17:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rH2NQleV;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id 189so3605993pfd.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2020 17:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9t0JXsEntO0kReSoHbFCHX+bFJbZBSJ3JFyh6rHCjSo=;
        b=rH2NQleVk59XVbRDiC67ozye6YlsiHn3/Njun5nzNXn9HxfaI4wu6F6idjJo5A0Y+4
         s1ZsFXu77UnZlMtxUc4A/1Keo2jMxSDjjKBkak+0pFhJg8Giv+zH6GmTAgKpYjC3rTDN
         xSm/EPzdip5EqOohAOP+6syNnC7/LJPL2jOH56VdijCH+2LOVayOx3J4KhYKifHb39D+
         ER0T4SMaA2U2nQG8acLt0V0d9WmHOUMRA6780QkEBtnss/kfxoF4VOpP66m8JtK6M3nZ
         lwlg2YcHSSTIVvRZi49z3xvcLUfS1p3VD8PmXJa7qkuWPc2+F2OlFOsuvBp6lEqzcU/K
         zyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9t0JXsEntO0kReSoHbFCHX+bFJbZBSJ3JFyh6rHCjSo=;
        b=Cil+lpe3qhEmQidQXEhWxYNd+Ld9F6/Zu4+FMl+OupuHfJyt0KQ6gVyt/2HXlWPE3N
         luP3R7+jw3YqkBvxwIo0BYgOjjVIz/c0q2dGtOHz8kB7EhyfG5jJidLSQXBCZSjuDvEA
         oxXLeboDv9s/g+YOU79Pfz3nBdxxUQ2TT6fw7cK6GbFswU2/Ivvs6WyQrVuIQgJnVwJ+
         +ATfn+FQxLOiSyDQiVySjl8Fd/m80uk75gv1M8hnBD6olg2jgW0UcErS6nFy6ni6QvoE
         Q74yhhCZpCFERFJkGZODsYSAhYZLbTdn5TcXaAeKGhW7e+MiLK48WxIjBua3Hb/A9PcK
         iJ2Q==
X-Gm-Message-State: AOAM530xjgxU3GDsZvVpQ5/9xBrZFlCH/xyJ6a5b3zcTtcP7Ifb/zS24
	AslZG4ux4Lfp1NhGpSdyA9/UhHgkMc8=
X-Google-Smtp-Source: ABdhPJyWRqCUN8xX7r+BaNceKzpB/XbI0X6ig8ZvzuY0UUkC53XFe2k/+zmUIjhYlJLCeWYJya0o8Q==
X-Received: by 2002:a63:5d0c:: with SMTP id r12mr16586464pgb.198.1596502444760;
        Mon, 03 Aug 2020 17:54:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e841])
        by smtp.gmail.com with ESMTPSA id r134sm11835596pfc.1.2020.08.03.17.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 17:54:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] libqmi: Delete --enable-more-warnings configure option
Date: Mon,  3 Aug 2020 17:53:59 -0700
Message-Id: <20200804005401.2416569-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
QA Issue: libqmi: configure was passed unrecognised options: --enable-more-warnings [unknown-configure-option]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb
index db01e7baa3..3a1b70b805 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb
@@ -20,5 +20,3 @@ SRC_URI[sha256sum] = "7f0429e0ae58792e21512d09ca2412537840ea42696762795af1284a65
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
 PACKAGECONFIG[mbim] = "--enable-mbim-qmux,--disable-mbim-qmux,libmbim"
-
-EXTRA_OECONF_append_toolchain-clang = " --enable-more-warnings=no"
-- 
2.28.0

